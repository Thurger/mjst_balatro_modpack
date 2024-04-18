local MOD_ID = "mjst_mod"

local CARD_NAME = "enterthetribe"

local localization = {
    name = "Enter the Tribe",
    text = {
        "{C:green}1 in #1#{} to transform",
        "played cards to Spade"
    }
}

local joker = {
    name = MOD_ID .. "_ability_" .. CARD_NAME,
    slug = MOD_ID .. "_" .. CARD_NAME,
    config = {
        extra = {
            odds = 4
        }
    },
    spritePos = {
        x = 0,
        y = 0
    },
    loc_txt = localization,
    rarity = 2,
    cost = 7,
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
    if context.individual and context.cardarea == G.play then
        if pseudorandom('j_mjst_mod_enterthetribe') < G.GAME.probabilities.normal / self.ability.extra.odds then
            context.other_card:change_suit('Spades')
            return {
                extra = {message = "Spades!", colour = G.C.BLACK},
                colour = G.C.MULT,
                card = self
            }
        end
    end
end

NFS.load(SMODS.findModByID(MOD_ID).path .. "src/utils/" .. "registerJoker.lua")(joker, sprite)
SMODS.Jokers.j_mjst_mod_enterthetribe.calculate = calculate