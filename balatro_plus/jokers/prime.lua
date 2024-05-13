local MOD_ID = ...

local CARD_NAME = "prime"

local joker = {
    name = MOD_ID .. "_ability_" .. CARD_NAME,
    slug = MOD_ID .. "_" .. CARD_NAME,
    config = {
        extra = {
            mult = 1
        }
    },
    spritePos = {
        x = 0,
        y = 0
    },
    loc_txt = G.localization.descriptions.Joker["j_" .. MOD_ID .. "_" .. CARD_NAME],
    rarity = 2,
    cost = 7,
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
    top_lpath = SMODS.current_mod.path,
    path = "j_" .. joker.slug  .. ".png",
    px = 71,
    py = 95,
    type = "asset_atli"
}

local function calculate(self, context)
    if context.individual and context.cardarea == G.play then
        if context.other_card:compare_id({2, 3, 5, 7}) then
            context.other_card.ability.mjst_mod_balatro_plus_perma_mult = context.other_card.ability.mjst_mod_balatro_plus_perma_mult or 0
            context.other_card.ability.mjst_mod_balatro_plus_perma_mult = context.other_card.ability.mjst_mod_balatro_plus_perma_mult + self.ability.extra.mult
            return {
                extra = {message = localize('k_upgrade_ex'), colour = G.C.MULT},
                colour = G.C.MULT,
                card = self
            }
        end
    end
end

NFS.load(SMODS.current_mod.path .. "api/jokers/registerJoker.lua")(joker, sprite)
SMODS.Jokers['j_' .. MOD_ID .. '_' .. CARD_NAME].calculate = calculate