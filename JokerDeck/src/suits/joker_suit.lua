SMODS.Suit {
    key = "suit_" .. SMODS.current_mod.id .. "_jokers",
    card_key =  "J",
    pos = {},
    ui_pos = {x = 0, y = 0},
    hc_atlas = SMODS.current_mod.id .. "joker_suit",
    lc_atlas = SMODS.current_mod.id .. "joker_suit",
    hc_ui_atlas = SMODS.current_mod.id .. "ui",
    lc_ui_atlas = SMODS.current_mod.id .. "ui",
    hc_colour = "FE5F55",
    lc_colour = "FE5F55",
    loc_txt = {
        name = "Joker",
        text = {
            ""
        },
        plural = "Jokers",
        singular = "Joker"
    },
    update_p_card = function(self, other, remove)
        if other.card_key and other.pos and other.pos.x and other.pos.y and other.card_key == 'Joker' then
            G.P_CARDS[self.card_key .. '_' .. other.card_key] = not remove and {
                name = other.key .. ' of ' .. self.key,
                value = other.key,
                suit = self.key,
                pos = { x = other.pos.x, y = other.suit_map[self.key] or self.pos.y or other.pos.y },
                lc_atlas = other.suit_map[self.key] and other.lc_atlas or self.lc_atlas,
                hc_atlas = other.suit_map[self.key] and other.hc_atlas or self.hc_atlas,
            }
        end
    end,
    populate = function(self)
        for _, other in pairs(SMODS.Ranks) do
            if not other.disabled then
                self:update_p_card(other)
            end
        end
        self.disabled = nil
    end,
    inject = function(self)
    end
}
