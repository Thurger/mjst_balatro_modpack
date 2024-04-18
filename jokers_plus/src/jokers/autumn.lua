local MOD_ID = ...

local CARD_NAME = "autumn"

local localization = {
    name = "Autumn",
    text = {
        "{X:mult,C:white}X#1#{} if all other",
        "jokers are {C:blue}Common{}"
    }
}

local joker = {
    name = MOD_ID .. "_ability_" .. CARD_NAME,
    slug = MOD_ID .. "_" .. CARD_NAME,
    config = {
        extra = {
            Xmult = 2
        }
    },
    spritePos = {
        x = 0,
        y = 0
    },
    loc_txt = localization,
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    effect = nil,
    atlas = nil,
    soul_pos = nil,
    mod_name = SMODS._MOD_NAME,
    badge_colour = SMODS._BADGE_COLOUR
}

local sprite = {
    name = "j_" .. joker.slug,
    top_lpath = SMODS.findModByID(MOD_ID).path,
    path = "j_" .. joker.slug  .. ".png",
    px = 71,
    py = 95,
    type = "asset_atli"
}

local function calculate(self, context)
    if context.cardarea == G.jokers then
        if self.ability.set == "Joker" and self.ability.name == (MOD_ID .. "_ability_" .. CARD_NAME) and not context.blueprint and not context.before and not context.after then
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

NFS.load(SMODS.findModByID(MOD_ID).path .. "api/utils/" .. "registerJoker.lua")(joker, sprite)
SMODS.Jokers['j_' .. MOD_ID .. '_' .. CARD_NAME].calculate = calculate