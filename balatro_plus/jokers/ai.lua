local MOD_ID = "mjst_mod"

local CARD_NAME = "ai"

local localization = {
    name = "AI",
    text = {
        "",
    }
}

local joker = {
    name = MOD_ID .. "_ability_" .. CARD_NAME,
    slug = MOD_ID .. "_" .. CARD_NAME,
    config = {
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
SMODS.Jokers.j_mjst_mod_ai.calculate = calculate