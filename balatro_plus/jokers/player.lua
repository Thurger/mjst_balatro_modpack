local MOD_ID = ...

local CARD_NAME = "player"

local joker = {
    name = MOD_ID .. "_ability_" .. CARD_NAME,
    slug = MOD_ID .. "_" .. CARD_NAME,
    config = {
        extra = {
            chips = 1,
            x_chips = 0,
            last_hand = 0
        }
    },
    spritePos = {
        x = 0,
        y = 0
    },
    loc_txt = G.localization.descriptions.Joker["j_" .. MOD_ID .. "_" .. CARD_NAME],
    rarity = 3,
    cost = 9,
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
    top_lpath = SMODS.current_mod.path,
    path = "j_" .. joker.slug  .. ".png",
    px = 71,
    py = 95,
    type = "asset_atli"
}

local card_area_change_size_ref = CardArea.change_size
function CardArea:change_size(delta)
    if delta ~= 0 then 
        local tmp_real_card_limit = (self.config.real_card_limit or self.config.card_limit) + delta
        if delta > 0 and tmp_real_card_limit > 1 and self == G.hand and self.cards[1] and (G.STATE == G.STATES.DRAW_TO_HAND or G.STATE == G.STATES.SELECTING_HAND) then
            local card_count = math.abs(delta)
            for i = 1, card_count do
                if self.ability.name == MOD_ID .. "_ability_" .. CARD_NAME then
                    self.ability.x_chips = self.ability.x_chips + self.ability.chips
                end
            end
        end
    end

    return card_area_change_size_ref(self, delta)
end

local function calculate(self, context)
    if self.ability.set == 'Joker' and not self.debuff then
        if context.cardarea == G.jokers and not context.before and not context.after then
            if self.ability.extra.x_chips > 0 then
                return {
                    message = localize{type='variable',key='a_chips',vars={self.ability.extra.x_chips}},
                    chip_mod = self.ability.extra.x_chips,
                    card = self
                }
            end
        end
    end

    if self.ability.set == 'Joker' and not self.debuff and not context.blueprint then
        if context.discard then
            self.ability.extra.x_chips = self.ability.extra.x_chips + self.ability.extra.chips
        end
    end

    if self.ability.set == 'Joker' and not self.debuff and not context.blueprint then
        if context.first_hand_drawn then
            self.ability.extra.x_chips = self.ability.extra.x_chips + G.hand.config.card_limit
        end
    end

    if self.ability.set == 'Joker' and not self.debuff and not context.blueprint then
        if context.after then
            self.ability.extra.x_chips = self.ability.extra.x_chips + (G.hand.config.card_limit - #G.hand.cards)
            self.ability.extra.last_hand = G.hand.config.card_limit - #G.hand.cards
        end
    end

    if self.ability.set == 'Joker' and not self.debuff and not context.blueprint then
        if context.end_of_round then
            self.ability.extra.x_chips = self.ability.extra.x_chips - self.ability.extra.last_hand
            if self.ability.extra.x_chips < 0 then
                self.ability.extra.x_chips = 0
            end
            self.ability.extra.last_hand = 0
        end
    end
end

NFS.load(SMODS.current_mod.path .. "api/jokers/registerJoker.lua")(joker, sprite)
SMODS.Jokers['j_' .. MOD_ID .. '_' .. CARD_NAME].calculate = calculate