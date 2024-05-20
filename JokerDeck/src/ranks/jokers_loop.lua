-- for x = 0, 9 do
--     for y = 0, 14 do
--         SMODS.Rank {
--             key = "rank_" .. SMODS.current_mod.id .. "_jokers_" .. x .. "_" .. y,
--             pos = {x = x, y = y},
--             loc_txt =  "Joker " .. x .. " " .. y,
--             nominal = 0,
--             hc_atlas = SMODS.current_mod.id .. "joker_suit",
--             lc_atlas = SMODS.current_mod.id .. "joker_suit",
--             shorthand = "Jkr",
--             card_key = 'JKR' .. x .. y,
--             populate = function(self)
--                 for _, other in pairs(SMODS.Suits) do
--                     if not other.disabled then
--                         other:update_p_card(self)
--                     end
--                 end
--                 self.disabled = nil
--             end
--         }
--     end
-- end

SMODS.Center {
    key = "c_" .. SMODS.current_mod.id .. "_base_" .. "joker",
    name = "Base Card Joker",
    set = "Default",
    label = "Base Card Joker",
    effect = "Playing Card Joker",
    cost_mult = 1.0,
    config = {mult = 4},
    pos = {x = 1, y = 0},
    max = 500
}

SMODS.Rank {
    key = "rank_" .. SMODS.current_mod.id .. "_Joker",
    name = "Rank Joker",
    pos = {x = 0, y = 0},
    loc_txt =  "Joker",
    nominal = 0,
    hc_atlas = SMODS.current_mod.id .. "joker_suit",
    lc_atlas = SMODS.current_mod.id .. "joker_suit",
    shorthand = "Jkr",
    ability = {
        mult = 4
    },
    card_key = 'Joker',
    populate = function(self)
        for _, other in pairs(SMODS.Suits) do
            if not other.disabled then
                other:update_p_card(self)
            end
        end
        self.disabled = nil
    end
}