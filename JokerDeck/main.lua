--- STEAMODDED HEADER
--- MOD_NAME: JokerDeck
--- MOD_ID: mjst_mod_joker_deck
--- MOD_AUTHOR: [MJST]
--- MOD_DESCRIPTION: Joker Deck
--- BADGE_COLOUR: D4443C
--- PREFIX: mjst_mod_joker_deck
--- DEPENDENCIES: [mjst_lib>=1.0.0]
--- VERSION: 0.0.1
--- DISPLAY_NAME: Joker Deck
--- PRIORITY: 0

----------------------------------------------
------------MOD CODE -------------------------

sendInfoMessage("[JokerDeck]: LOADING...")

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

-- local ref_card_set_ability = Card.set_ability
-- function Card:set_ability(center, initial, delay_sprites)
--     if center then
--         local old_ability = self.ability
--         ref_card_set_ability(self, center, initial, delay_sprites)
--         if old_ability and old_ability.mjst_mod_balatro_plus_perma_mult then
--             self.ability.mjst_mod_balatro_plus_perma_mult = old_ability.mjst_mod_balatro_plus_perma_mult
--         end
--     end
-- end

local card_set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    if center then
        local old_ability = self.ability
        card_set_ability_ref(self, center, initial, delay_sprites)
        if old_ability and old_ability.all_ranks then self.ability.all_ranks = old_ability.all_ranks end
        if old_ability and old_ability.all_suits then self.ability.all_suits = old_ability.all_suits end
        if old_ability and old_ability.no_debuff then self.ability.no_debuff = old_ability.no_debuff end
        if old_ability and old_ability.rarity then self.ability.rarity = old_ability.rarity end
        if old_ability and old_ability.joker_ability then self.ability.joker_ability = old_ability.joker_ability end
        if old_ability and old_ability.joker_ability_vars then self.ability.joker_ability_vars = old_ability.joker_ability_vars end
        if old_ability and old_ability.loc_vars then self.ability.loc_vars = old_ability.loc_vars end
        if old_ability and old_ability.loc_text_key then self.ability.loc_text_key = old_ability.loc_text_key end
    end
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

NFS.load(SMODS.current_mod.path .. 'src/localization.lua')()

sendInfoMessage("[JokerDeck]: LOADED!")

----------------------------------------------
------------MOD CODE END----------------------