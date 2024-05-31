local get_X_same_ref = get_X_same
function get_X_same(num, hand)
    local vals = {{},{},{},{},{},{},{},{},{},{},{},{},{},{}}
    -- local ret = get_X_same_ref(num, hand)
    local ret = {}

    for i = #hand, 1, -1 do
        local curr = {}
        table.insert(curr, hand[i])
        for j = 1, #hand do
            if (hand[i]:get_id() == hand[j]:get_id() or (hand[j].ability and hand[j].ability.all_ranks)) and i ~= j then
                table.insert(curr, hand[j])
            end
        end

        if #curr == num then
            vals[curr[1]:get_id()] = curr
        end
    end

    for i = #vals, 1, -1 do
        if next(vals[i] or {}) then table.insert(ret, vals[i] or {}) end
    end

    return ret
end

local card_is_face_ref = Card.is_face
function Card:is_face(from_boss)
    return card_is_face_ref(self, from_boss) or (self.ability and self.ability.all_ranks) or false
end

local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    return card_is_suit_ref(self, suit, bypass_debuff, flush_calc) or (self.ability and self.ability.all_suits) or false
end