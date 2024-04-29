local MOD_ID = "mjst_mod"

local CARD_NAME = "patch"

local localization = {
    name = "Joker Patch",
    text = {
        "After {C:attention}#1#{} rounds",
        "sell this card to",
        "{C:attention}Create{} a random Joker",
        "{C:inactive}(Currently {C:attention}#2#{C:inactive}/#1#)"
    }
}

local joker = {
    name = MOD_ID .. "_ability_" .. CARD_NAME,
    slug = MOD_ID .. "_" .. CARD_NAME,
    config = {
        extra = {
            rounds = 0,
            trigger = 3
        }
    },
    spritePos = {
        x = 0,
        y = 0
    },
    loc_txt = localization,
    rarity = 2,
    cost = 0,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
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

    --UPDATE ROUNDS
    if context.end_of_round then
        if self.ability.name == (MOD_ID .. "_ability_" .. CARD_NAME) and not context.blueprint and not context.individual and not context.repetition then
            self.ability.extra.rounds = self.ability.extra.rounds or 0
            self.ability.extra.rounds = self.ability.extra.rounds + 1
            if self.ability.extra.rounds == self.ability.extra.trigger then 
                local eval = function(card) return not card.REMOVED end
                juice_card_until(self, eval, true)
            end
            return {
                message = (self.ability.extra.rounds < self.ability.extra.trigger) and (self.ability.extra.rounds..'/'..self.ability.extra.trigger) or localize('k_active_ex'),
                colour = G.C.FILTER
            }
        end
    end

    --SELLING
    if context.selling_self then
        if self.ability.name == (MOD_ID .. "_ability_" .. CARD_NAME) and self.ability.extra.rounds >= self.ability.extra.trigger and not context.blueprint then
            --CHECK IF JOKER IS NEGATIVE FOR CARD LIMIT
            if #G.jokers.cards <= G.jokers.config.card_limit and not (self.edition and self.edition.negative) then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    local card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil, nil)
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    return true end }))
                delay(0.6)
            --CHECK IF ENOUGH SPACE TO CREATE THE JOKER
            elseif #G.jokers.cards < G.jokers.config.card_limit then
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    local card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil, nil)
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    return true end }))
                delay(0.6)
            else
                card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_no_room_ex')})
            end
        end
    end
end

NFS.load(SMODS.findModByID(MOD_ID).path .. "src/utils/" .. "registerJoker.lua")(joker, sprite)
SMODS.Jokers.j_mjst_mod_patch.calculate = calculate