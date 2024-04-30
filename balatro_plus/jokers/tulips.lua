local MOD_ID = "mjst_mod"

local CARD_NAME = "tulips"

local localization = {
    name = "Tulips",
    text = {
        "{C:mult}+#1#{} Mult for each",
        "scoring {C:diamonds}Diamond{} card",
        "{C:mult}-#2#{} Mult for each",
        "scoring {C:attention}non-Diamond{} card",
        "{C:inactive}(Currently {}{C:mult}+#3#{} {C:inactive}Mult){}"
    }
}

local joker = {
    name = MOD_ID .. "_ability_" .. CARD_NAME,
    slug = MOD_ID .. "_" .. CARD_NAME,
    config = {
        extra = {
            mult = 1,
            punish = 1,
            x_mult = 0
        }
    },
    spritePos = {
        x = 0,
        y = 0
    },
    loc_txt = localization,
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
    top_lpath = SMODS.findModByID(MOD_ID).path,
    path = "j_" .. joker.slug  .. ".png",
    px = 71,
    py = 95,
    type = "asset_atli"
}

local function calculate(self, context)
    -- TRIGGER MULT
    if context.cardarea == G.jokers and not self.debuff then
        if self.ability.name == (MOD_ID .. "_ability_" .. CARD_NAME) and self.ability.extra.x_mult > 0 and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_mult',vars={self.ability.extra.x_mult}},
                mult_mod = self.ability.extra.x_mult
            }
        end
    end

    --UPGRADE / DOWNGRADE JOKER
    if context.individual and context.cardarea == G.play then
        if self.ability.name == (MOD_ID .. "_ability_" .. CARD_NAME) and not context.blueprint then
            local current_mult = self.ability.extra.x_mult or 0
            if context.other_card:is_suit("Diamonds") then
                current_mult = current_mult + 1
            elseif not context.other_card:is_suit("Diamonds") then
                current_mult = current_mult - 1
            end
            if current_mult <= 0 then
                current_mult = 0
            end
            self.ability.extra.x_mult = current_mult
            return {
                extra = {focus = self, message = localize('k_upgrade_ex')},
                card = self,
                colour = G.C.MULT
            }
        end
    end
end

NFS.load(SMODS.findModByID(MOD_ID).path .. "src/utils/" .. "registerJoker.lua")(joker, sprite)
SMODS.Jokers.j_mjst_mod_tulips.calculate = calculate