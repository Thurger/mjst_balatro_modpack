local CARD_NAME = "autumn"

local function calculate(self, context)
    if context.cardarea == G.jokers then
        if self.ability.set == "Joker" and self.ability.name == (SMODS.current_mod.id .. "_ability_" .. CARD_NAME) and not context.blueprint and not context.before and not context.after then
            local trigger = true
            for _, v in ipairs(G.jokers.cards) do
                if v.ability.set == 'Joker' and v.config.center.rarity ~= 1 then
                    trigger = false
                end
            end
            if trigger then
                return {
                    message = localize{type='variable',key='a_xmult',vars={self.ability.extra.Xmult}},
                    Xmult_mod = self.ability.extra.Xmult,
                    card = self
                }
            end
        end
    end
end

SMODS.Joker({
    name = "j_" .. SMODS.current_mod.id .. "_ability_" .. CARD_NAME,
    key = SMODS.current_mod.id .. "_" .. CARD_NAME,
    config = {
        extra = {
            Xmult = 2
        }
    },
    spritePos = {
        x = 0,
        y = 0
    },
    pos = {
        x = 0,
        y = 0
    },
    loc_txt = G.localization.descriptions.Joker["j_" .. SMODS.current_mod.id .. "_" .. CARD_NAME],
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    effect = nil,
    atlas = "ASSET_ATLAS",
    soul_pos = nil,
    mod_name = SMODS._MOD_NAME,
    badge_colour = SMODS._BADGE_COLOUR,
    calculate = calculate
}):register()

SMODS.Sprite({
    key = "j_" .. SMODS.current_mod.id .. "_" .. CARD_NAME,
    path = "j_" .. SMODS.current_mod.id .. "_" .. CARD_NAME  .. ".png",
    px = 71,
    py = 95,
    type = 'asset_atli',
    atlas = "ASSET_ATLAS"
}):register()