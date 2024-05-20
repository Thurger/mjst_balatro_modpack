--- STEAMODDED HEADER
--- MOD_NAME: JokerDeck
--- MOD_ID: mjst_mod_joker_deck
--- MOD_AUTHOR: [MJST]
--- MOD_DESCRIPTION: Joker Deck
--- BADGE_COLOUR: D4443C

----------------------------------------------
------------MOD CODE -------------------------

NFS.load(SMODS.current_mod.path .. "src/atlases.lua")()
NFS.load(SMODS.current_mod.path .. "src/ui.lua")()
NFS.load(SMODS.current_mod.path .. "src/suits/joker_suit.lua")()
NFS.load(SMODS.current_mod.path .. "src/ranks/jokers_loop.lua")()
NFS.load(SMODS.current_mod.path .. "src/backs/joker_deck.lua")()

local function FindSuitJokers(cards, suit)
    for index, value in ipairs(cards) do
        if value and value.base and value.base.suit and value.base.suit == suit and value.base.nominal and value.base.nominal == 0 then
            return index
        end
    end
    return -1
end

local function FindOtherJokers(cards, joker)
    for index, value in ipairs(cards) do
        if value and value.base and value.base.suit and value.base.key ~= joker and value.base.nominal and value.base.nominal == 0 then
            return index
        end
    end
    return -1
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
                while FindSuitJokers(G.playing_cards, "Diamonds") ~= -1 and FindSuitJokers(G.playing_cards, "Clubs") ~= -1 and FindSuitJokers(G.playing_cards, "Spades") ~= -1 and FindSuitJokers(G.playing_cards, "Hearts") ~= -1 do
                    for k, v in pairs(G.playing_cards) do
                        if v and v.base and v.base.nominal and v.base.suit then
                            if (v.base.suit == "Diamonds" or v.base.suit == "Spades" or v.base.suit == "Clubs" or v.base.suit == "Hearts") and v.base.nominal == 0 then
                                if G.playing_cards[k] then
                                    G.playing_cards[k]:remove()
                                end
                            end
                        end
                    end
                end
            return true
            end
        }))
    end

    G.E_MANAGER:add_event(Event({
        func = function()
            while FindOtherJokers(G.playing_cards, self.effect.config.test_joker_rank) ~= -1 do
                for k, v in pairs(G.playing_cards) do
                    if v and v.base and v.base.nominal and v.base.suit then
                        if v.base.nominal == 0 and v.key ~= self.effect.config.test_joker_rank then
                            if G.playing_cards[k] then
                                G.playing_cards[k]:remove()
                            end
                        end
                    end
                end
            end
        return true
        end
    }))
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

----------------------------------------------
------------MOD CODE END----------------------