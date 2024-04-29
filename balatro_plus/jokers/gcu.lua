local MOD_ID = "mjst_mod"

local CARD_NAME = "gcu"

local localization = {
    name = "GCU",
    text = {
        "{C:chips}+#1#{} Chips per character",
        "in {C:attention}Consumable{} name",
        "{C:inactive}(Currently{} {C:chips}+#2#{} {C:inactive}Chips){}"
    }
}

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
    --TRIGGER
    if context.cardarea == G.jokers and not self.debuff then
        if self.ability.name == (MOD_ID .. "_ability_" .. CARD_NAME) and self.ability.extra.x_chips > 0 and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_chips',vars={self.ability.extra.x_chips}},
                chip_mod = self.ability.extra.x_chips,
                colour = G.C.CHIPS
            }
        end
    end

    --UPGRADE
    if context.using_consumeable and self.ability.name == (MOD_ID .. "_ability_" .. CARD_NAME) and not context.blueprint then
        self.ability.extra.x_chips = self.ability.extra.x_chips or 0
        self.ability.extra.x_chips = self.ability.extra.x_chips + (#context.consumeable.ability.name * self.ability.extra.chips)
        return {
            extra = {focus = self, message = localize('k_upgrade_ex'), colour = G.C.CHIPS},
            card = self,
            colour = G.C.CHIPS
        }
    end
end

NFS.load(SMODS.findModByID(MOD_ID).path .. "src/utils/" .. "registerJoker.lua")(joker, sprite)
SMODS.Jokers.j_mjst_mod_gcu.calculate = calculate