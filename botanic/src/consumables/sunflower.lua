local MOD_ID, type = ...

local CARD_NAME = "sunflower"

local loc_txt = {
    name = "Sunflower",
    text = {
        "UPGRADE CONDITION",
        "Stay in your hand",
        "at the end of the round"
    }
}

local consumable = {
    name = MOD_ID .. "_" .. CARD_NAME,
    slug = MOD_ID .. "_" .. CARD_NAME,
    config = {},
    pos = { x = 0, y = 0 },
    loc_txt = loc_txt,
    cost = 3,
    discovered = false,
    consumeable = true
}

local sprite = {
    name = "c_" .. consumable.slug,
    top_lpath = SMODS.findModByID(MOD_ID).path,
    path = "c_" .. consumable.slug .. ".png",
    px = 71,
    py = 95,
    type = "asset_atli"
}

NFS.load(SMODS.findModByID(MOD_ID).path .. "api/utils/" .. "registerConsumable.lua")(MOD_ID, type, consumable, sprite)
