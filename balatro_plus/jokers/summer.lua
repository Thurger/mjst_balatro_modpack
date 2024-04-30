local MOD_ID = "mjst_mod"

local CARD_NAME = "summer"

local localization = {
    name = "Summer",
    text = {
        "Gains {C:mult}+#1#{} Mult",
        "at the end of the round",
        "for each {C:blue}Common{} {C:attention}Joker{}",
        "{C:mult}-#2#{} for each other rarity",
        "{C:inactive}(Currently{} {C:mult}+#3#{} {C:inactive}Mult){}"
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
    if context.end_of_round then
        if self.ability.set == 'Joker' and self.ability.name == (MOD_ID .. "_ability_" .. CARD_NAME) and not context.blueprint and not context.individual and not context.repetition then
            local current_mult = self.ability.extra.x_mult or 0
            for _, v in pairs(G.jokers.cards) do
                if v.ability.set == 'Joker' and v.config.center.rarity ~= 1 then
                    current_mult = current_mult - 1
                elseif v.ability.set == 'Joker' and v.config.center.rarity == 1 then
                    current_mult = current_mult + 1
                end
            end
            if current_mult <= 0 then
                current_mult = 0
            end
            self.ability.extra.x_mult = current_mult
        end
    end
end

NFS.load(SMODS.findModByID(MOD_ID).path .. "src/utils/" .. "registerJoker.lua")(joker, sprite)
SMODS.Jokers.j_mjst_mod_summer.calculate = calculate