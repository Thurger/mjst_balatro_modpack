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
        if self.seal == 's_mjst_mod_balatro_plus_ranked_2' then seal_nb = 2 end
        if self.seal == 's_mjst_mod_balatro_plus_ranked_3' then seal_nb = 3 end
        if self.seal == 's_mjst_mod_balatro_plus_ranked_4' then seal_nb = 4 end
        if self.seal == 's_mjst_mod_balatro_plus_ranked_5' then seal_nb = 5 end
        if self.seal == 's_mjst_mod_balatro_plus_ranked_6' then seal_nb = 6 end
        if self.seal == 's_mjst_mod_balatro_plus_ranked_7' then seal_nb = 7 end
        if self.seal == 's_mjst_mod_balatro_plus_ranked_8' then seal_nb = 8 end
        if self.seal == 's_mjst_mod_balatro_plus_ranked_9' then seal_nb = 9 end
        if self.seal == 's_mjst_mod_balatro_plus_ranked_10' then seal_nb = 10 end
        if self.seal == 's_mjst_mod_balatro_plus_ranked_jack' then seal_nb = 11 end
        if self.seal == 's_mjst_mod_balatro_plus_ranked_queen' then seal_nb = 12 end
        if self.seal == 's_mjst_mod_balatro_plus_ranked_king' then seal_nb = 13 end
        if self.seal == 's_mjst_mod_balatro_plus_ranked_ace' then seal_nb = 14 end
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