local MOD_ID = "mjst_mod"

local CARD_NAME = "devourer"

local localization = {
    name = "Devourer",
    text = {
        "{C:green}#1# in #2#{} to destroy",
        "{C:attention}scoring{} cards",
        "Gains {X:mult,C:white}X#3#{} Mult",
        "when triggered",
        "{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)"
    }
}

local joker = {
    name = MOD_ID .. "_ability_" .. CARD_NAME,
    slug = MOD_ID .. "_" .. CARD_NAME,
    config = {
        extra = {
            odd_base = 5,
            odds = 1,
            Xmult = 1,
            x_Xmult = 0.25
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
end

NFS.load(SMODS.findModByID(MOD_ID).path .. "src/utils/" .. "registerJoker.lua")(joker, sprite)
SMODS.Jokers.j_mjst_mod_devourer.calculate = calculate