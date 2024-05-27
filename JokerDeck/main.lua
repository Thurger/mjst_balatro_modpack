--- STEAMODDED HEADER
--- MOD_NAME: JokerDeck
--- MOD_ID: mjst_mod_joker_deck
--- MOD_AUTHOR: [MJST]
--- MOD_DESCRIPTION: Joker Deck
--- BADGE_COLOUR: D4443C

----------------------------------------------
------------MOD CODE -------------------------

local supported_languages = {}
supported_languages["en-us"] = true
supported_languages["fr"] = true

init_localization()
NFS.load(SMODS.current_mod.path .. 'src/localization.lua')('en-us')
if supported_languages[G.SETTINGS.language] then
    NFS.load(SMODS.current_mod.path .. 'src/localization.lua')(G.SETTINGS.language)
end

NFS.load(SMODS.current_mod.path .. "src/atlases.lua")()
NFS.load(SMODS.current_mod.path .. "src/ui.lua")()
NFS.load(SMODS.current_mod.path .. "src/hands.lua")()
NFS.load(SMODS.current_mod.path .. "src/suits/joker_suit.lua")()
NFS.load(SMODS.current_mod.path .. "src/ranks/jokers_loop.lua")()
NFS.load(SMODS.current_mod.path .. "src/backs/joker_deck.lua")()

local function FindJoker(cards)
    for index, value in ipairs(cards) do
        if value and value.base and value.base.nominal and value.base.nominal == 0 then
            return index
        end
    end
    return -1
end

local function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end

local back_apply_to_run_ref = Back.apply_to_run
function Back:apply_to_run()
    back_apply_to_run_ref(self)

    if self.effect.config.jokers_price then
    end

    if self.effect.config.buffon_packs_price then
    end

    if not self.effect.config.full_joker_suit then
        G.E_MANAGER:add_event(Event({
            func = function()
                while FindJoker(G.playing_cards) ~= -1 do
                    for k, v in pairs(G.playing_cards) do
                        if v and v.base and v.base.nominal and v.base.suit then
                            if v.base.nominal == 0 then
                                if G.playing_cards[k] then
                                    G.playing_cards[k]:remove()
                                    G.deck.config.card_limit = G.deck.config.card_limit - 1
                                end
                            end
                        end
                    end
                end
            return true
            end
        }))
    end
    if self.effect.config.starting_jokers then
        for i, v in ipairs(self.effect.config.starting_jokers) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    local front = G.P_CARDS["J_" .. "Joker"]
                    if SMODS.current_mod.custom.joker_deck.jokers[v.key] then
                        front = G.P_CARDS["J_" .. v.key]
                    end
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local card = nil
                    card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, front, G.P_CENTERS.c_base, {playing_card = G.playing_card})
                    card.ability = card.ability or {}
                    if SMODS.current_mod.custom.joker_deck.jokers[v.key] and SMODS.current_mod.custom.joker_deck.jokers[v.key].ability then
                        for k, a in pairs(SMODS.current_mod.custom.joker_deck.jokers[v.key].ability) do
                            local tmp = deepcopy(a)
                            card.ability[k] = tmp
                        end
                    else
                        card.ability.all_ranks = true
                        card.ability.all_suits = true
                        card.ability.no_debuff = true
                    end
                    card:start_materialize({G.C.SECONDARY_SET.Default})
                    G.play:emplace(card)
                    table.insert(G.playing_cards, card)
                    draw_card(G.play, G.deck, 90, 'up', nil)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    return true
                end
            }))
        end
    end
end

local card_set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    -- local old_ability = self.ability or nil
    -- if old_ability then
    --     sendInfoMessage(dump(old_ability))
    -- end

    card_set_ability_ref(self, center, initial, delay_sprites)

    -- if old_ability then
    --     for k, v in pairs(old_ability) do
    --         self.ability[k] = v
    --     end
    -- end
end

SMODS.Suits.Diamonds.populate = function(self)
    for _, other in pairs(SMODS.Ranks) do
        if not other.disabled and not other.shorthand == 'Jkr' then
            self:update_p_card(other)
        end
    end
    self.disabled = nil
end

SMODS.Suits.Clubs.populate = function(self)
    for _, other in pairs(SMODS.Ranks) do
        if not other.disabled and not other.shorthand == 'Jkr' then
            self:update_p_card(other)
        end
    end
    self.disabled = nil
end

SMODS.Suits.Hearts.populate = function(self)
    for _, other in pairs(SMODS.Ranks) do
        if not other.disabled and not other.shorthand == 'Jkr' then
            self:update_p_card(other)
        end
    end
    self.disabled = nil
end

SMODS.Suits.Spades.populate = function(self)
    for _, other in pairs(SMODS.Ranks) do
        if not other.disabled and not other.shorthand == 'Jkr' then
            self:update_p_card(other)
        end
    end
    self.disabled = nil
end


----------------------------------------------
------------MOD CODE END----------------------