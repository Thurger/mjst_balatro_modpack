local MOD_ID = "mjst_mod"

local CARD_NAME = "proudjoker"

local localization = {
    name = "Proud Joker",
    text = {
        "{C:attention}King{}, {C:attention}Queen{} and {C:attention}Jack{}",
        "are mingled"
    }
}

local joker = {
    name = MOD_ID .. "_ability_" .. CARD_NAME,
    slug = MOD_ID .. "_" .. CARD_NAME,
    config = {},
    spritePos = {
        x = 0,
        y = 0
    },
    loc_txt = localization,
    rarity = 3,
    cost = 8,
    unlocked = false,
    discovered = false,
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
SMODS.Jokers.j_mjst_mod_proudjoker.calculate = calculate