local MOD_ID = ...

local CARD_NAME = "player"

local joker = {
    name = MOD_ID .. "_ability_" .. CARD_NAME,
    slug = MOD_ID .. "_" .. CARD_NAME,
    config = {
        extra = {
            chips = 1,
            x_chips = 0
        }
    },
    spritePos = {
        x = 0,
        y = 0
    },
    loc_txt = G.localization.descriptions.Joker["j_" .. MOD_ID .. "_" .. CARD_NAME],
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
end

NFS.load(SMODS.findModByID(MOD_ID).path .. "api/jokers/registerJoker.lua")(joker, sprite)
SMODS.Jokers['j_' .. MOD_ID .. '_' .. CARD_NAME].calculate = calculate