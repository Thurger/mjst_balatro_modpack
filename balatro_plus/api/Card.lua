local card_is_face_ref = Card.is_face
function Card:is_face(from_boss)
    local result = card_is_face_ref(self, from_boss)

    if self.debuff and not from_boss then return end
    if not result and self.seal then
        if self.seal == 's_mjst_mod_balatro_plus_ranked_king'
        or self.seal == 's_mjst_mod_balatro_plus_ranked_queen'
        or self.seal == 's_mjst_mod_balatro_plus_ranked_jack' then
            return true
        end
    end

    return result
end

function Card:compare_id(id_table)
    local seal_nb = nil
    if self.seal then
        if self.seal == 's_mjst_mod_balatro_plus_ranked_2' then seal_nb = 2
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_3' then seal_nb = 3
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_4' then seal_nb = 4
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_5' then seal_nb = 5
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_6' then seal_nb = 6
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_7' then seal_nb = 7
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_8' then seal_nb = 8
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_9' then seal_nb = 9
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_10' then seal_nb = 10
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_jack' then seal_nb = 11
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_queen' then seal_nb = 12
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_king' then seal_nb = 13
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_ace' then seal_nb = 14
        end
    end
    if type(id_table) == "number" then
        return self.get_id(self) == id_table or seal_nb == id_table
    elseif type(id_table) == "table" then
        for idx, value in ipairs(id_table) do
            if self.get_id(self) == value or seal_nb == value then return true end
        end
    end
    return false
end

local card_calculate_joker_ref = Card.calculate_joker
function Card:calculate_joker(context)
    local result = card_calculate_joker_ref(self, context)

    if not result then
        if self.ability.set == 'Joker' and not self.debuff then
            if context.individual then
                if context.cardarea == G.play then
                    if self.ability.name == 'Fibonacci'
                    and (
                        context.other_card:get_id() ~= 2
                        and context.other_card:get_id() ~= 3
                        and context.other_card:get_id() ~= 5
                        and context.other_card:get_id() ~= 8
                        and context.other_card:get_id() ~= 14
                    ) then
                        if context.other_card:compare_id({2, 3, 5, 8, 14}) then
                            return {
                                mult = self.ability.extra,
                                card = self
                            }
                        end
                    end
                    if self.ability.name == 'Odd Todd'
                    and (
                        (context.other_card:get_id() > 10
                        or context.other_card:get_id()%2 == 0)
                        and context.other_card:get_id() ~= 14
                    ) then
                        if context.other_card:compare_id({14, 3, 5, 7, 9}) then
                            return {
                                chips = self.ability.extra,
                                card = self
                            }
                        end
                    end
                    if self.ability.name == 'Even Steven'
                    and (
                        context.other_card:get_id() > 10
                        or context.other_card:get_id()%2 == 1
                    ) then
                        if context.other_card:compare_id({2, 4, 6, 8, 10}) then
                            return {
                                mult = self.ability.extra,
                                card = self
                            }
                        end
                    end
                end
            end
            if context.repetition then
                if context.cardarea == G.play then
                    if self.ability.name == 'Hack' and (
                    context.other_card:get_id() ~= 2 and
                    context.other_card:get_id() ~= 3 and
                    context.other_card:get_id() ~= 4 and
                    context.other_card:get_id() ~= 5) then
                        if context.other_card:compare_id({2, 3, 4, 5}) then
                            return {
                                message = localize('k_again_ex'),
                                repetitions = self.ability.extra,
                                card = self
                            }
                        end
                    end
                end
            end
        end
    end

    return result
end

function Card:get_ids()
    local ids = {}
    local seal_nb = nil

    if self.seal then
        if self.seal == 's_mjst_mod_balatro_plus_ranked_2' then seal_nb = 2
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_3' then seal_nb = 3
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_4' then seal_nb = 4
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_5' then seal_nb = 5
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_6' then seal_nb = 6
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_7' then seal_nb = 7
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_8' then seal_nb = 8
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_9' then seal_nb = 9
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_10' then seal_nb = 10
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_jack' then seal_nb = 11
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_queen' then seal_nb = 12
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_king' then seal_nb = 13
        elseif self.seal == 's_mjst_mod_balatro_plus_ranked_ace' then seal_nb = 14
        end
    end

    if self.get_id(self) then table.insert(ids, self.get_id(self)) end
    if seal_nb then table.insert(ids, seal_nb) end

    return ids
end