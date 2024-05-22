local NAME = "Joker Deck"

SMODS.Back {
    key = "back_" .. SMODS.current_mod.id .. "_joker_deck",
    name = NAME,
    loc_txt = {
        name = "Joker Deck",
        text = {
            "Bought {C:attention}Jokers{}",
            "go in the deck",
            "{C:attention}Jokers{} and {C:attention}Buffon packs{}",
            "are {C:mult}50%{} cheaper"
        }
    },
    atlas = SMODS.current_mod.id .. "_decks",
    pos = {x = 0, y = 0},
    discovered = true,
    unlocked = true,
    config = {
        jokers_price = {mult = 0.5},
        buffon_packs_price = {mult = 0.5},
        starting_jokers = {
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"},
            {key = "Chaos the Clown"}
        }
    }
}

local function is_scoring(card, scoring_hand)
    for i, v in ipairs(scoring_hand) do
        if v == card then
            return i
        end
    end
    return -1
end

local function is_played(card, full_hand)
    for i, v in ipairs(full_hand) do
        if v == card then
            return i
        end
    end
    return -1
end

local function check_conditions(card, context, ability, ret)
    if not ability or not ability.conditions then return true end

    if ability.conditions.contain_hand and context and context.poker_hands and context.poker_hands[ability.conditions.contain_hand] and #context.poker_hands[ability.conditions.contain_hand] == 0 then
        return false
    end

    if ability.conditions.hand_size and context and context.scoring_hand and ability.conditions.hand_size ~= #context.full_hand then
        return false
    end

    return true
end

local function play_ability(card, context, ability, ret)
    if not ability or type(ability) ~= "table" then return ret end

    if ability.create_tag and type(ability.create_tag) == "table" then
        for _, tag in ipairs(ability.create_tag) do
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag(tag))
                    play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
        end
    end

    if ability.add_discard and type(ability.add_discard) == "number" then
        ease_discard(ability.add_discard)
    end

    if ability.add_hand_size and type(ability.add_hand_size) == "number" then
        G.hand:change_size(ability.add_hand_size)
        SMODS.current_mod.custom.joker_deck.save_hand_size_eor = SMODS.current_mod.custom.joker_deck.save_hand_size_eor or 0
        SMODS.current_mod.custom.joker_deck.save_hand_size_eor = SMODS.current_mod.custom.joker_deck.save_hand_size_eor - ability.add_hand_size
    end

    if ability.stone_joker and type(ability.stone_joker) == "number" then
        ret = ret or {}
        ret.chips = ret.chips or 0
        local nb = 0
        for k, v in pairs(G.playing_cards) do
            if v.config.center == G.P_CENTERS.m_stone then nb = nb + 1 end
        end
        ret.chips = ret.chips + (ability.stone_joker * nb)
    end

    if ability.ret and type(ability.ret == "table") then
        for k, v in pairs(ability.ret) do
            ret[k] = ret[k] or nil
            if ret[k] == nil then
                ret[k] = v
            elseif type(ret[k]) == "number" and type(v) == "number" then
                ret[k] = ret[k] + v
            else
                ret[k] = v
            end
        end
    end

    return ret
end

local eval_card_ref = eval_card
function eval_card(card, context)
    local ret = eval_card_ref(card, context)

    if card.ability and card.ability.joker_ability then
        for _, ability in ipairs(card.ability.joker_ability) do
            if check_conditions(card, context, ability, ret) then
                if not context.repetition then
                    if context.full_hand and is_played(card, context.full_hand) ~= -1 then
                        if context.scoring_hand and is_scoring(card, context.scoring_hand) ~= -1 then
                            if ability.scored then
                                ret = play_ability(card, context, ability, ret)
                            end
                        end
                        if ability.played then
                            ret = play_ability(card, context, ability, ret)
                        end
                    else
                        if ability.held then
                            ret = play_ability(card, context, ability, ret)
                        end
                    end
                else
                end
            end
        end
    end

    -- if context.end_of_round and not context.repetition then
    --     if SMODS and SMODS.current_mod and SMODS.current_mod.custom and SMODS.current_mod.custom.joker_deck and SMODS.current_mod.custom.joker_deck.save_hand_size_eor and SMODS.current_mod.custom.joker_deck.save_hand_size_eor ~= 0 then
    --     end
    -- end
    
    if context.end_of_round and SMODS.current_mod.custom.joker_deck.save_hand_size_eor then
        G.hand:change_size(SMODS.current_mod.custom.joker_deck.save_hand_size_eor)
        SMODS.current_mod.custom.joker_deck.save_hand_size_eor = 0
    end

    return ret
end

local card_calculate_joker_ref = Card.calculate_joker
function Card:calculate_joker(context)
    local result = card_calculate_joker_ref(self, context)

    if context.buying_card then
        if G and G.GAME and G.GAME.selected_back and G.GAME.selected_back.name == "Joker Deck" and self == context.card and self.ability.set == "Joker" and not context.repetition and not context.blueprint_card and not self.getting_sliced and not context.blueprint then
            if not SMODS.current_mod.custom then SMODS.current_mod.custom = {} end
            if not SMODS.current_mod.custom.joker_deck_prevent_double_trigger then SMODS.current_mod.custom.joker_deck_prevent_double_trigger = true
            else SMODS.current_mod.custom.joker_deck_prevent_double_trigger = false end
            self:remove()
            if SMODS.current_mod.custom.joker_deck_prevent_double_trigger then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        local front = G.P_CARDS["J_" .. "Joker"]
                        if SMODS.current_mod.custom.joker_deck.jokers[context.card.config.center.name] then
                            front = G.P_CARDS["J_" .. context.card.config.center.name]
                        end
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, front, G.P_CENTERS.c_base, {playing_card = G.playing_card})
                        card.ability = card.ability or {}
                        if SMODS.current_mod.custom.joker_deck.jokers[context.card.config.center.name] and SMODS.current_mod.custom.joker_deck.jokers[context.card.config.center.name].ability then
                            for k, v in pairs(SMODS.current_mod.custom.joker_deck.jokers[context.card.config.center.name].ability) do
                                card.ability[k] = v
                            end
                        else
                            card.ability.all_ranks = true
                            card.ability.all_suits = true
                            card.ability.no_debuff = true
                        end
                        card.edition = context.card.edition
                        card:start_materialize({G.C.SECONDARY_SET.Default})
                        G.play:emplace(card)
                        table.insert(G.playing_cards, card)
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up', nil)
                playing_card_joker_effects({self})
            end
        end
    end

    -- if context.end_of_round and not context.repetition then
    --     if SMODS and SMODS.current_mod and SMODS.current_mod.custom and SMODS.current_mod.custom.joker_deck and SMODS.current_mod.custom.joker_deck.save_hand_size_eor and SMODS.current_mod.custom.joker_deck.save_hand_size_eor ~= 0 then
    --         G.hand:change_size(SMODS.current_mod.custom.joker_deck.save_hand_size_eor)
    --         SMODS.current_mod.custom.joker_deck.save_hand_size_eor = 0
    --     end
    -- end

    return result
end
