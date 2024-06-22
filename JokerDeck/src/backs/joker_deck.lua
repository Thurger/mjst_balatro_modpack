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
        consumables = {
        },
        jokers_price = {mult = 0.5},
        buffon_packs_price = {mult = 0.5},
        starting_jokers = {
            {key = "Scary Face"}
        }
    }
}

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

local function is_scoring(card, scoring_hand)
    if scoring_hand then
        for i, v in ipairs(scoring_hand) do
            if v == card then
                return i
            end
        end
    end
    return -1
end

local function is_played(card, full_hand)
    if full_hand then
        for i, v in ipairs(full_hand) do
            if v == card then
                return i
            end
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

    if ability.conditions.card_is_suit and type(ability.conditions.card_is_suit) == "string" and not card:is_suit(ability.conditions.card_is_suit) then
        return false
    end

    if ability.conditions.is_value and type(ability.conditions.is_value) == "table" and not card:is_value(ability.conditions.is_value) then
        return false
    end

    if ability.conditions.is_face and not card:is_face() then
        return false
    end

    if ability.conditions.probability and type(ability.conditions.probability) == "number" and pseudorandom('probability') >= G.GAME.probabilities.normal / ability.conditions.probability then
        return false
    end

    return true
end

local function play_ability(card, context, ability, ret, other_card)
    if not ability or type(ability) ~= "table" then return ret end

    if ability.perkeo and type(ability.perkeo) == "number" then
        if G.consumeables.cards[1] then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    local new_card = copy_card(pseudorandom_element(G.consumeables.cards, pseudoseed('perkeo')), nil)
                    new_card:set_edition({negative = true}, true)
                    new_card:add_to_deck()
                    G.consumeables:emplace(new_card)
                    return true
                end)
            }))
        end
    end

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

    if ability.add_hand_size then
        G.mjst_config = G.mjst_config or {}
        G.mjst_config.save_hand_size_eor = G.mjst_config.save_hand_size_eor or 0
        if type(ability.add_hand_size) == "number" then
            G.hand:change_size(ability.add_hand_size)
            G.mjst_config.save_hand_size_eor = G.mjst_config.save_hand_size_eor - ability.add_hand_size
        end
        if type(ability.add_hand_size) == "string" and card.ability.joker_ability_vars and card.ability.joker_ability_vars[ability.add_hand_size] and type(card.ability.joker_ability_vars[ability.add_hand_size]) == "number" then
            G.hand:change_size(card.ability.joker_ability_vars[ability.add_hand_size])
            G.mjst_config.save_hand_size_eor = G.mjst_config.save_hand_size_eor - card.ability.joker_ability_vars[ability.add_hand_size]
        end
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
        ret.mult = ret.mult or 0
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

    if ability.ease_var and type(ability.ease_var) == "table" then
        for k, v in pairs(ability.ease_var) do
            if card.ability.joker_ability_vars and card.ability.joker_ability_vars[k] and type(card.ability.joker_ability_vars[k]) == "number" and type(v) == "number" then
                card.ability.joker_ability_vars[k] = card.ability.joker_ability_vars[k] + v
            end
        end
    end

    if ability.dna then
        for _, other in ipairs(G.play.cards) do
            if other ~= card then
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local _card = copy_card(other, nil, nil, G.playing_card)
                _card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, _card)
                G.hand:emplace(_card)
                _card.states.visible = nil
                G.E_MANAGER:add_event(Event({
                    func = function()
                        _card:start_materialize()
                        return true
                    end
                }))
            end
        end
    end

    if ability.destroy then
        card:start_dissolve(nil, true)
    end

    if ability.create_p_card and type(ability.create_p_card) == "table" then
        for _, v in ipairs(ability.create_p_card) do
            if type(v) == "table" then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local front = {}
                        local new_card = {}
                        if type(v.value) == "string" and v.value == "random" then
                        front = pseudorandom_element(G.P_CARDS, pseudoseed('random_card'))
                        elseif type(v.value) == "string" and G.P_CARDS[v.value] then
                            front = G.P_CARDS[v.value]
                        else
                            front = pseudorandom_element(G.P_CARDS, pseudoseed('default_random'))
                        end
                        if v.enhancement and type(v.enhancement) == "string" and G.P_CENTERS[v.enhancement] then
                            new_card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, front, G.P_CENTERS[v.enhancement], {playing_card = G.playing_card})
                        else
                            new_card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, front, G.P_CENTERS.c_base, {playing_card = G.playing_card})
                        end
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        new_card:start_materialize({G.C.SECONDARY_SET.Enhanced})
                        G.play:emplace(new_card)
                        table.insert(G.playing_cards, new_card)
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        draw_card(G.play,G.deck, 90,'up', nil)
                        return true
                    end
                }))
            end
        end
    end

    if ability.create_tarot_card and type(ability.create_tarot_card) == "table" then
        for _, v in ipairs(ability.create_tarot_card) do
            if type(v) == "table" and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        if v.value and type(v.value) == "string" and v.value == "random" then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local new_card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'car')
                                    new_card:add_to_deck()
                                    G.consumeables:emplace(new_card)
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                            return true
                        else
                        end
                        return true
                    end)
                }))
            end
        end
    end

    if ability.riff_raff and type(ability.riff_raff) == "table" then
        local amount = ability.riff_raff.amount or 2
        local list = {}
        for k, v in pairs(G.mjst_config.joker_deck.jokers) do
            if v.ability.rarity ~= nil and ability.riff_raff.rarity ~= nil and ability.riff_raff.rarity == v.ability.rarity then
                table.insert(list, k)
            end
        end
        for i = 1, amount do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local front = {}
                    local new_card = {}
                    if #list > 0 then
                        local rd = pseudorandom_element(list, pseudoseed('random_card'))
                        if not rd then return true end
                        front = G.P_CARDS["J_" .. rd]
                        if not front then return true end
                        new_card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, front, G.P_CENTERS.c_base, {playing_card = G.playing_card})
                        if G.mjst_config.joker_deck.jokers[rd] and G.mjst_config.joker_deck.jokers[rd].ability then
                            for k, a in pairs(G.mjst_config.joker_deck.jokers[rd].ability) do
                                local tmp = deepcopy(a)
                                new_card.ability[k] = tmp
                            end
                        else
                            new_card.ability = new_card.ability or {}
                            new_card.ability.all_ranks = true
                            new_card.ability.all_suits = true
                            new_card.ability.no_debuff = true
                        end
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        new_card:start_materialize({G.C.SECONDARY_SET.Default})
                        G.play:emplace(new_card)
                        table.insert(G.playing_cards, new_card)
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        draw_card(G.play,G.deck, 90,'up', nil)
                    end
                    return true
                end
            }))
        end
    end

    if ability.ret and type(ability.ret) == "table" then
        for k, v in pairs(ability.ret) do
            ret[k] = ret[k] or 0
            if type(ret[k]) == "number" and type(v) == "number" then
                ret[k] = ret[k] + v
            elseif type(ret[k]) == "number" and type(v) == "string" and card.ability.joker_ability_vars and card.ability.joker_ability_vars[v] and type(card.ability.joker_ability_vars[v]) == "number" then
                ret[k] = ret[k] + card.ability.joker_ability_vars[v]
            else
                ret[k] = v
            end
        end
    end

    return ret
end

local function play_other_ability(card, context, ret)
    ret = ret or {}

    if G.play.cards then
        for idx, other_card in ipairs(G.play.cards) do
            if not other_card.debuff and other_card.ability and other_card.ability.joker_ability then
                for _, ability in ipairs(other_card.ability.joker_ability) do
                    if ability.other then
                        if not ability.conditions or check_conditions(card, context, ability, ret) then
                            if ability.enhance_card and type(ability.enhance_card) == "string" and G.P_CENTERS[ability.enhance_card] then
                                card:set_ability(G.P_CENTERS[ability.enhance_card], nil, true)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        card:juice_up()
                                        return true
                                    end
                                }))
                            end

                            if ability.ret and type(ability.ret == "table") then
                                for k, v in pairs(ability.ret) do
                                    ret[k] = ret[k] or 0
                                    if type(ret[k]) == "number" and type(v) == "number" then
                                        ret[k] = ret[k] + v
                                    elseif type(ret[k]) == "number" and type(v) == "string" and card.ability.joker_ability_vars and card.ability.joker_ability_vars[v] and type(card.ability.joker_ability_vars[v]) == "number" then
                                        ret[k] = ret[k] + card.ability.joker_ability_vars[v]
                                    else
                                        ret[k] = v
                                    end
                                end
                            end

                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    other_card:juice_up(0.3)
                                    return true
                                end
                            }))
                        end
                    end
                end
            end
        end
    end

    if G.hand.cards then
        for idx, other_card in ipairs(G.hand.cards) do
            if not other_card.debuff and other_card.ability and other_card.ability.joker_ability then
                for _, ability in ipairs(other_card.ability.joker_ability) do
                    if ability.other then
                        if not ability.conditions or check_conditions(card, context, ability, ret) then
                            if ability.enhance_card and type(ability.enhance_card) == "string" and G.P_CENTERS[ability.enhance_card] then
                                card:set_ability(G.P_CENTERS[ability.enhance_card], nil, true)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        card:juice_up()
                                        return true
                                    end
                                }))
                            end

                            if ability.ret and type(ability.ret == "table") then
                                for k, v in pairs(ability.ret) do
                                    ret[k] = ret[k] or 0
                                    if type(ret[k]) == "number" and type(v) == "number" then
                                        ret[k] = ret[k] + v
                                    elseif type(ret[k]) == "number" and type(v) == "string" and card.ability.joker_ability_vars and card.ability.joker_ability_vars[v] and type(card.ability.joker_ability_vars[v]) == "number" then
                                        ret[k] = ret[k] + card.ability.joker_ability_vars[v]
                                    else
                                        ret[k] = v
                                    end
                                end
                            end

                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    other_card:juice_up(0.3)
                                    return true
                                end
                            }))
                        end
                    end
                end
            end
        end
    end

    return ret
end

local eval_card_ref = eval_card
function eval_card(card, context)
    local ret = eval_card_ref(card, context)
    ret = ret or {}
    ret["x_mult"] = 1
    ret["h_x_mult"] = 1

    if card.ability and card.ability.joker_ability then
        for _, ability in ipairs(card.ability.joker_ability) do
            if check_conditions(card, context, ability, ret) then
                if not context.repetition then
                    if context.before then
                        if context.full_hand and is_played(card, context.full_hand) ~= -1 then
                            if context.scoring_hand and is_scoring(card, context.scoring_hand) ~= -1 then
                                if ability.scored then
                                    ret = play_ability(card, context, ability, ret, nil)
                                end
                            end
                            if ability.played then
                                ret = play_ability(card, context, ability, ret, nil)
                            end
                        else
                            if ability.held then
                                ret = play_ability(card, context, ability, ret, nil)
                            end
                        end
                    else
                        if context.full_hand and is_played(card, context.full_hand) ~= -1 then
                            if context.scoring_hand and is_scoring(card, context.scoring_hand) ~= -1 then
                                if ability.scored then
                                    ret = play_ability(card, context, ability, ret, nil)
                                end
                            end
                            if ability.played then
                                ret = play_ability(card, context, ability, ret, nil)
                            end
                        else
                            if ability.held then
                                ret = play_ability(card, context, ability, ret, nil)
                            end
                        end
                    end
                else
                end
            end
        end
    end

    if not context.repetition then
        if context.full_hand and is_played(card, context.full_hand) ~= -1 then
            if is_scoring(card, context.scoring_hand) ~= -1 then
                ret = play_other_ability(card, context, ret)
            end
        else
        end
    end

    if context.end_of_round and G.mjst_config and G.mjst_config.save_hand_size_eor then
        G.hand:change_size(G.mjst_config.save_hand_size_eor)
        G.mjst_config.save_hand_size_eor = 0
    end

    if ret and ret["x_mult"] and ret["x_mult"] == 1 then
        ret["x_mult"] = nil
    end
    if ret and ret["h_x_mult"] and ret["h_x_mult"] == 1 then
        ret["h_x_mult"] = nil
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
                        if G.mjst_config.joker_deck.jokers[context.card.config.center.name] then
                            front = G.P_CARDS["J_" .. context.card.config.center.name]
                        end
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, front, G.P_CENTERS.c_base, {playing_card = G.playing_card})
                        card.ability = card.ability or {}
                        if G.mjst_config.joker_deck.jokers[context.card.config.center.name] and G.mjst_config.joker_deck.jokers[context.card.config.center.name].ability then
                            for k, v in pairs(G.mjst_config.joker_deck.jokers[context.card.config.center.name].ability) do
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

    return result
end

local evaluate_play_ref = G.FUNCS.evaluate_play
function G.FUNCS:evaluate_play(e)
    local text, disp_text, poker_hands, scoring_hand, non_loc_disp_text = G.FUNCS.get_poker_hand_info(G.play.cards)
    local mult = mod_mult(G.GAME.hands[text].mult)
    local hand_chips = mod_chips(G.GAME.hands[text].chips)

    G.GAME.hands[text].played = G.GAME.hands[text].played + 1
    G.GAME.hands[text].played_this_round = G.GAME.hands[text].played_this_round + 1
    G.GAME.last_hand_played = text
    set_hand_usage(text)
    G.GAME.hands[text].visible = true

    --Add all the pure bonus cards to the scoring hand
    local pures = {}
    for i=1, #G.play.cards do
        if next(find_joker('Splash')) then
            scoring_hand[i] = G.play.cards[i]
        else
            if G.play.cards[i].ability.effect == 'Stone Card' then
                local inside = false
                for j=1, #scoring_hand do
                    if scoring_hand[j] == G.play.cards[i] then
                        inside = true
                    end
                end
                if not inside then table.insert(pures, G.play.cards[i]) end
            end
        end
    end
    for i=1, #pures do
        table.insert(scoring_hand, pures[i])
    end
    local percent = 0.3
    local percent_delta = 0.08

    if not G.GAME.blind:debuff_hand(G.play.cards, poker_hands, text) and G.GAME.selected_back and G.GAME.selected_back.name == "Joker Deck" then
        delay(0.4)

        for i = 1, #scoring_hand do
            if scoring_hand[i] and scoring_hand[i].ability and scoring_hand[i].ability.joker_ability and scoring_hand[i].ability.joker_ability.before then
                local effects = eval_card(scoring_hand[i], {cardarea = G.play, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, before = true})
                if effects.level_up then
                    percent = percent + percent_delta
                    if effects.level_up then
                        level_up_hand(scoring_hand[i], text, nil, effects.level_up)
                    end
                end
            end
        end

    --     mult = mod_mult(G.GAME.hands[text].mult)
    --     hand_chips = mod_chips(G.GAME.hands[text].chips)
    --     local modded = false
    --     mult, hand_chips, modded = G.GAME.blind:modify_hand(G.play.cards, poker_hands, text, mult, hand_chips)
    --     mult, hand_chips = mod_mult(mult), mod_chips(hand_chips)
    --     if modded then update_hand_text({sound = 'chips2', modded = modded}, {chips = hand_chips, mult = mult}) end

    --     if scoring_hand then
    --         for _, card in ipairs(scoring_hand) do
    --             if G.hand.cards then
    --                 for __, other_card in ipairs(G.play.cards) do
    --                     local effects = eval_card(card, {cardarea = G.play, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, hand = true, hand_card = other_card})
    --                     for ii = 1, #effects do
    --                         --If chips added, do chip add event and add the chips to the total
    --                         if effects[ii].chips then
    --                             if effects[ii].card then juice_card(effects[ii].card) end
    --                             hand_chips = mod_chips(hand_chips + effects[ii].chips)
    --                             update_hand_text({delay = 0}, {chips = hand_chips})
    --                         end

    --                         --If mult added, do mult add event and add the mult to the total
    --                         if effects[ii].mult then
    --                             if effects[ii].card then juice_card(effects[ii].card) end
    --                             mult = mod_mult(mult + effects[ii].mult)
    --                             update_hand_text({delay = 0}, {mult = mult})
    --                         end

    --                         --If play dollars added, add dollars to total
    --                         if effects[ii].p_dollars then
    --                             if effects[ii].card then juice_card(effects[ii].card) end
    --                             ease_dollars(effects[ii].p_dollars)
    --                         end

    --                         --If dollars added, add dollars to total
    --                         if effects[ii].dollars then
    --                             if effects[ii].card then juice_card(effects[ii].card) end
    --                             ease_dollars(effects[ii].dollars)
    --                         end

    --                         --Any extra effects
    --                         if effects[ii].extra then
    --                             if effects[ii].card then juice_card(effects[ii].card) end
    --                             local extras = {mult = false, hand_chips = false}
    --                             if effects[ii].extra.mult_mod then mult =mod_mult( mult + effects[ii].extra.mult_mod);extras.mult = true end
    --                             if effects[ii].extra.chip_mod then hand_chips = mod_chips(hand_chips + effects[ii].extra.chip_mod);extras.hand_chips = true end
    --                             if effects[ii].extra.swap then
    --                                 local old_mult = mult
    --                                 mult = mod_mult(hand_chips)
    --                                 hand_chips = mod_chips(old_mult)
    --                                 extras.hand_chips = true; extras.mult = true
    --                             end
    --                             if effects[ii].extra.func then effects[ii].extra.func() end
    --                             update_hand_text({delay = 0}, {chips = extras.hand_chips and hand_chips, mult = extras.mult and mult})
    --                         end

    --                         --If x_mult added, do mult add event and mult the mult to the total
    --                         if effects[ii].x_mult then
    --                             if effects[ii].card then juice_card(effects[ii].card) end
    --                             mult = mod_mult(mult*effects[ii].x_mult)
    --                             update_hand_text({delay = 0}, {mult = mult})
    --                         end

    --                         --calculate the card edition effects
    --                         if effects[ii].edition then
    --                             hand_chips = mod_chips(hand_chips + (effects[ii].edition.chip_mod or 0))
    --                             mult = mult + (effects[ii].edition.mult_mod or 0)
    --                             mult = mod_mult(mult*(effects[ii].edition.x_mult_mod or 1))
    --                             update_hand_text({delay = 0}, {
    --                                 chips = effects[ii].edition.chip_mod and hand_chips or nil,
    --                                 mult = (effects[ii].edition.mult_mod or effects[ii].edition.x_mult_mod) and mult or nil,
    --                             })
    --                         end
    --                     end
    --                 end
    --                 for __, other_card in ipairs(G.hand.cards) do
    --                     local effects = eval_card(card, {cardarea = G.play, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, hand = true, hand_card = other_card})
    --                     for ii = 1, #effects do
    --                         --If chips added, do chip add event and add the chips to the total
    --                         if effects[ii].chips then
    --                             if effects[ii].card then juice_card(effects[ii].card) end
    --                             hand_chips = mod_chips(hand_chips + effects[ii].chips)
    --                             update_hand_text({delay = 0}, {chips = hand_chips})
    --                         end

    --                         --If mult added, do mult add event and add the mult to the total
    --                         if effects[ii].mult then
    --                             if effects[ii].card then juice_card(effects[ii].card) end
    --                             mult = mod_mult(mult + effects[ii].mult)
    --                             update_hand_text({delay = 0}, {mult = mult})
    --                         end

    --                         --If play dollars added, add dollars to total
    --                         if effects[ii].p_dollars then
    --                             if effects[ii].card then juice_card(effects[ii].card) end
    --                             ease_dollars(effects[ii].p_dollars)
    --                         end

    --                         --If dollars added, add dollars to total
    --                         if effects[ii].dollars then
    --                             if effects[ii].card then juice_card(effects[ii].card) end
    --                             ease_dollars(effects[ii].dollars)
    --                         end

    --                         --Any extra effects
    --                         if effects[ii].extra then
    --                             if effects[ii].card then juice_card(effects[ii].card) end
    --                             local extras = {mult = false, hand_chips = false}
    --                             if effects[ii].extra.mult_mod then mult =mod_mult( mult + effects[ii].extra.mult_mod);extras.mult = true end
    --                             if effects[ii].extra.chip_mod then hand_chips = mod_chips(hand_chips + effects[ii].extra.chip_mod);extras.hand_chips = true end
    --                             if effects[ii].extra.swap then
    --                                 local old_mult = mult
    --                                 mult = mod_mult(hand_chips)
    --                                 hand_chips = mod_chips(old_mult)
    --                                 extras.hand_chips = true; extras.mult = true
    --                             end
    --                             if effects[ii].extra.func then effects[ii].extra.func() end
    --                             update_hand_text({delay = 0}, {chips = extras.hand_chips and hand_chips, mult = extras.mult and mult})
    --                         end

    --                         --If x_mult added, do mult add event and mult the mult to the total
    --                         if effects[ii].x_mult then
    --                             if effects[ii].card then juice_card(effects[ii].card) end
    --                             mult = mod_mult(mult*effects[ii].x_mult)
    --                             update_hand_text({delay = 0}, {mult = mult})
    --                         end

    --                         --calculate the card edition effects
    --                         if effects[ii].edition then
    --                             hand_chips = mod_chips(hand_chips + (effects[ii].edition.chip_mod or 0))
    --                             mult = mult + (effects[ii].edition.mult_mod or 0)
    --                             mult = mod_mult(mult*(effects[ii].edition.x_mult_mod or 1))
    --                             update_hand_text({delay = 0}, {
    --                                 chips = effects[ii].edition.chip_mod and hand_chips or nil,
    --                                 mult = (effects[ii].edition.mult_mod or effects[ii].edition.x_mult_mod) and mult or nil,
    --                             })
    --                         end
    --                     end
    --                 end
    --             end
    --         end
    --     end
    -- end
    end

    evaluate_play_ref(self, e)
end