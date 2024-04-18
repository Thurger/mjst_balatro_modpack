local MOD_ID = "mjst_mod"

local CARD_NAME = "prime"

local localization = {
    name = "Prime",
    text = {
        "Every played {C:attention}2{}, {C:attention}3{}, {C:attention}5{} or {C:attention}7{}",
        "permanently gains",
        "{C:mult}+#1#{} Mult when scored"
    }
}

local joker = {
    name = MOD_ID .. "_ability_" .. CARD_NAME,
    slug = MOD_ID .. "_" .. "prime",
    config = {
        extra = {
            mult = 1
        }
    },
    spritePos = {
        x = 0,
        y = 0
    },
    loc_txt = localization,
    rarity = 2,
    cost = 8,
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
    if context.individual and context.cardarea == G.play then
        if context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 then
            context.other_card.ability.mult = context.other_card.ability.mult or 0
            context.other_card.ability.mult = context.other_card.ability.mult + self.ability.extra.mult
            return {
                extra = {message = localize('k_upgrade_ex'), colour = G.C.MULT},
                colour = G.C.MULT,
                card = self
            }
        end
    end
end

NFS.load(SMODS.findModByID(MOD_ID).path .. "src/utils/" .. "registerJoker.lua")(joker, sprite)
SMODS.Jokers.j_mjst_mod_prime.calculate = calculate