local MOD_ID = ...

local CARD_NAME = "mis_scaled"

local localization = {
    name = "mISsCALED",
    text = {
        ""
    }
}

local joker = {
    name = MOD_ID .. "_ability_" .. CARD_NAME,
    slug = MOD_ID .. "_" .. CARD_NAME,
    config = {
        extra = {
            max = 2.5,
            min = 1
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
    if self.ability.set == 'Joker' and not self.debuff then
        if context.cardarea == G.jokers and not context.blueprint and not context.before and not context.after then
            local temp_xMult = pseudorandom('pis_scaled', self.ability.extra.min * 10, self.ability.extra.max * 10) / 10
            return {
                message = localize{type='variable',key='a_xmult',vars={temp_xMult}},
                Xmult_mod = temp_xMult,
                card = self
            }
        end
    end
end

NFS.load(SMODS.findModByID(MOD_ID).path .. 'api/jokers/registerJoker.lua')(joker, sprite)
SMODS.Jokers['j_' .. MOD_ID .. '_' .. CARD_NAME].calculate = calculate