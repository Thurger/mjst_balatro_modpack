local MOD_ID = ...

local CARD_NAME = "proud_joker"

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
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
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

NFS.load(SMODS.current_mod.path .. "api/jokers/registerJoker.lua")(joker, sprite)