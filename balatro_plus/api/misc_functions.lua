local evaluate_poker_hand_ref = evaluate_poker_hand
function evaluate_poker_hand(hand)
    local result = evaluate_poker_hand_ref(hand)
    return result
end

local get_X_same_ref = get_X_same
function get_X_same(num, hand)
    local result = {}
    -- local result = get_X_same_ref(num, hand)
    local values = {{},{},{},{},{},{},{},{},{},{},{},{},{},{}}
    for i = #hand, 1, -1 do
        local curr = {}
        table.insert(curr, hand[i])
        for j = 1, #hand do
            if hand[i]:compare_id(hand[j]:get_ids()) and i ~= j then
                table.insert(curr, hand[j])
            end
        end
        if #curr == num then
            values[curr[1]:get_id()] = curr
        end
    end
    for i = #values, 1, -1 do
        if next(values[i]) then table.insert(result, values[i]) end
    end
    return result
end

local get_straight_ref = get_straight
function get_straight(num, hand)
    local result = get_straight_ref(num, hand)
    return result
end

local get_flush_ref = get_flush
function get_flush(num, hand)
    local result = get_flush_ref(num, hand)
    return result
end