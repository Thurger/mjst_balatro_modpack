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