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
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"},
            {key = "Cloud 9"}
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

    if ability.conditions.hand_size and type(ability.conditions.hand_size) == "number" and context and context.scoring_hand and ability.conditions.hand_size ~= #context.full_hand then
        return false
    end

    if ability.conditions.remaining_hand and type(ability.conditions.remaining_hand) == "number" and G.GAME.current_round.hands_left ~= ability.conditions.remaining_hand then
        return false
    end

    if ability.conditions.remaining_discard and type(ability.conditions.remaining_discard) == "number" and G.GAME.current_round.discards_left ~= ability.conditions.remaining_discard then
        return false
    end

    if ability.conditions.enhanced_card and type(ability.conditions.enhanced_card) == "number" then
        local nb = 0
        for k, v in pairs(G.playing_cards) do
            if v.config.center ~= G.P_CENTERS.c_base then nb = nb + 1 end
        end
        if nb < ability.conditions.enhanced_card then return false end
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

    if ability.remove_all_discard then
        ease_discard(-G.GAME.current_round.discards_left)
    end

    if ability.add_hand and type(ability.add_hand) == "number" then
        ease_hands_played(ability.add_hand)
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

    if ability.banner and type(ability.banner) == "number" then
        ret = ret or {}
        ret.chips = ret.chips or 0
        ret.chips = ret.chips + (ability.banner * G.GAME.current_round.discards_left)
    end

    if ability.steel_joker and type(ability.steel_joker) == "number" then
        ret = ret or {}
        ret.x_mult = ret.x_mult or 1
        local nb = 0
        for k, v in pairs(G.playing_cards) do
            if v.config.center == G.P_CENTERS.m_steel then nb = nb + 1 end
        end
        ret.x_mult = ret.x_mult + (ability.steel_joker * nb)
        if ret.x_mult <= 1 then ret.x_mult = nil end
    end

    if ability.abstract_joker and type(ability.abstract_joker) == "number" then
        ret = ret or {}
        ret.x_mult = ret.x_mult or 1
        local nb = 0
        for k, v in pairs(G.playing_cards) do
            if v.config.card.suit == "suit_mjst_mod_joker_deck_jokers" then nb = nb + 1 end
        end
        ret.mult = ret.mult + (ability.abstract_joker * nb)
    end

    if ability.fortune_teller and type(ability.fortune_teller) == "number" then
        ret = ret or {}
        ret.mult = ret.mult or 0
        if G and G.GAME and G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot then
            ret.mult = ret.mult + (G.GAME.consumeable_usage_total.tarot * ability.fortune_teller)
        end
    end

    if ability.throwback and type(ability.throwback) == "number" then
        ret = ret or {}
        ret.x_mult = ret.x_mult or 1
        ret.x_mult = ret.x_mult + (G.GAME.skips * ability.throwback)
        if ret.x_mult <= 1 then ret.x_mult = nil end
    end

    if ability.satellite and type(ability.satellite) == "number" then
        ret = ret or {}
        ret.dollars = ret.dollars or 0
        local planets_used = 0
        for k, v in pairs(G.GAME.consumeable_usage) do
            if v.set == 'Planet' then planets_used = planets_used + 1 end
        end
        ret.dollars = ret.dollars + (ability.satellite * planets_used)
        if ret.dollars == 0 then ret.dollars = nil end
    end

    if ability.bootstraps and type(ability.bootstraps) == "table" and ability.bootstraps.mult and type(ability.bootstraps.mult) == "number" and ability.bootstraps.dollars and type(ability.bootstraps.dollars) == "number" then
        ret = ret or {}
        ret.mult = ret.mult or 0
        ret.mult = ret.mult + (ability.bootstraps.mult * math.floor((G.GAME.dollars + (G.GAME.dollar_buffer or 0)) / ability.bootstraps.dollars))
    end

    if ability.bull and type(ability.bull) == "table" and ability.bull.chips and type(ability.bull.chips) == "number" and ability.bull.dollars and type(ability.bull.dollars) == "number" then
        ret = ret or {}
        ret.chips = ret.chips or 0
        ret.chips = ret.chips + (ability.bull.chips * math.floor((G.GAME.dollars + (G.GAME.dollar_buffer or 0)) / ability.bull.dollars))
    end

    if ability.blue_joker and type(ability.blue_joker) == "number" then
        ret = ret or {}
        ret.chips = ret.chips or 0
        ret.chips = ret.chips + (ability.blue_joker * #G.deck.cards)
    end

    if ability.cloud_9 and type(ability.cloud_9) == "table" and ability.cloud_9.id and type(ability.cloud_9.id) == "number" and ability.cloud_9.dollars and type(ability.cloud_9.dollars) == "number" then
        ret = ret or {}
        ret.dollars = ret.dollars or 0
        local nb = 0
        for k, v in pairs(G.playing_cards) do
            if v:get_id() == ability.cloud_9.id then nb = nb + 1 end
        end
        ret.dollars = ret.dollars + (ability.cloud_9.dollars * nb)
        if ret.dollars == 0 then ret.dollars = nil end
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

local function play_other_ability(card, context, ability, ret)
    if not ability or type(ability) ~= "table" then return ret end

    if ability.retrigger_scoring_face_card and type(ability.retrigger_scoring_face_card) == "number" then
        if card:is_face() and is_scoring(card, context.scoring_hand) then
            ret = ret or {}
            ret.repetitions = ret.repetitions or 0
            ret.repetitions = ret.repetitions + ability.retrigger_scoring_face_card + 1
            ret.message = ret.message or localize("k_again_ex")
            ret.card = card
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

    if context.scoring_hand and not context.repetition then
        for _, v in ipairs(context.scoring_hand) do
            if v.ability and v.ability.joker_ability then
                for __, a in ipairs(v.ability.joker_ability) do
                    ret = play_other_ability(card, context, a, ret)
                end
            end
        end
    end

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
