local get_X_same_ref = get_X_same
function get_X_same(num, hand)
    local values = {}
    local max_id = 14
    if SMODS and SMODS.Card and SMODS.Card.MAX_ID then
        max_id = SMODS.Card.MAX_ID
    end
    for i = 1, max_id do
        values[i] = {}
    end
    -- local old_ret = get_X_same_ref(num, hand) or {}
    local ret = {}

    for i = #hand, 1, -1 do
        local ranks = hand[i]:get_ranks(nil)
        for _, rank in ipairs(ranks) do
            table.insert(values[rank], hand[i])
        end
    end

    for i, value in ipairs(values) do
        if #value == num then
            table.insert(ret, value)
        end
    end
    return ret
end

function get_best_hand(hands)
    if #hands["Flush Five"] > 0 then hands.top = hands["Flush Five"]
    elseif #hands["Flush House"] > 0 then hands.top = hands["Flush House"]
    elseif #hands["Five of a Kind"] > 0 then hands.top = hands["Five of a Kind"]
    elseif #hands["Straight Flush"] > 0 then hands.top = hands["Straight Flush"]
    elseif #hands["Four of a Kind"] > 0 then hands.top = hands["Four of a Kind"]
    elseif #hands["Full House"] > 0 then hands.top = hands["Full House"]
    elseif #hands["Flush"] > 0 then hands.top = hands["Flush"]
    elseif #hands["Straight"] > 0 then hands.top = hands["Straight"]
    elseif #hands["Three of a Kind"] > 0 then hands.top = hands["Three of a Kind"]
    elseif #hands["Two Pair"] > 0 then hands.top = hands["Two Pair"]
    elseif #hands["Pair"] > 0 then hands.top = hands["Pair"]
    elseif #hands["High Card"] > 0 then hands.top = hands["High Card"] end
    return hands
end

function is_valid_full_house(hand)
    if #hand < 5 then return false end

    return true
end

local evaluate_poker_hand_ref = evaluate_poker_hand
function evaluate_poker_hand(hand)
    local ret = evaluate_poker_hand_ref(hand)

    if #ret["Flush House"] > 0 and not is_valid_full_house(hand) then
        ret["Flush House"] = {}
    end
    if #ret["Full House"] > 0 and not is_valid_full_house(hand) then
        ret["Full House"] = {}
    end

    ret = get_best_hand(ret)
    return ret
end

function get_straight(hand)
    local ret = {}
    local four_fingers = next(SMODS.find_card('j_four_fingers'))
    local can_skip = next(SMODS.find_card('j_shortcut'))
    if #hand < (5 - (four_fingers and 1 or 0)) then return ret end
    local t = {}
    local RANKS = {}
    for i = #hand, 1, -1 do
        RANKS[i] = hand[i]:get_ranks()
    end

    return ret
end