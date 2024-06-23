function Card:is_value(values)
    if self.ability and self.ability.all_ranks then
        return true
    end

    for _, v in ipairs(values) do
        if v == self.get_id(self) then
            return true
        end
    end
end

function Card:get_ranks(values)
    local ret = values or {}

    if self.ability and self.ability.all_ranks then
        if SMODS and SMODS.Card and SMODS.Card.MAX_ID then
            for i = SMODS.Card.MAX_ID, 1, -1 do
                table.insert(ret, i)
            end
        else
            for i = 14, 1, -1 do
                table.insert(ret, i)
            end
        end
    else
        table.insert(ret, self:get_id())
    end

    return ret
end

local card_set_debuff_ref = Card.set_debuff
function  Card:set_debuff(should_debuff)
    if self.ability and self.ability.no_debuff then return end
    return card_set_debuff_ref(self, should_debuff)
end

local card_is_face_ref = Card.is_face
function Card:is_face(from_boss)
    return card_is_face_ref(self, from_boss) or (self.ability and self.ability.all_ranks) or false
end

local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    return card_is_suit_ref(self, suit, bypass_debuff, flush_calc) or (self.ability and self.ability.all_suits) or false
end