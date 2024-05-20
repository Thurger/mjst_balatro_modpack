local NAME = "Joker Deck"

SMODS.Back {
    key = "back_" .. SMODS.current_mod.id .. "_joker_deck",
    name = NAME,
    loc_txt = {
        name = "Joker Deck",
        text = {
            "Bought {C:attention}Jokers{}",
            "go in the deck",
            "{C:attention}Jokers{} and {C:attention}Buffon packs{}",
            "are {C:mult}50%{} cheaper"
        }
    },
    atlas = SMODS.current_mod.id .. "_decks",
    pos = {x = 0, y = 0},
    discovered = true,
    unlocked = true,
    config = {
        jokers_price = {mult = 0.5},
        buffon_packs_price = {mult = 0.5}
    }
}

local function dump(o, max_depth, depth)
    if not depth then depth = 0 end
    if not max_depth then max_depth = 3 end
    if type(o) == 'table' then
        local s = '{\n'
        if depth < max_depth then
            for k, v in pairs(o) do
                for _ = 0, depth do
                    s = s .. '\t'
                end
                if type(k) ~= 'number' and type(k) ~= "function" then
                    k = '"'.. tostring(k) ..'"'
                end
                if (type(v) == "function") then
                    s = s .. '['..k..']: ' .. "function" .. ',\n'
                end
                -- if (type(v) == "table") then
                    s = s .. '['..k..']: ' .. dump(v, max_depth, depth + 1) .. ',\n'
                -- end
            end
        end
        for _ = 0, depth do
            s = s .. '\t'
        end
        return s .. '}'
    else
        return tostring(o)
    end
end

local card_calculate_joker_ref = Card.calculate_joker
function Card:calculate_joker(context)
    local result = card_calculate_joker_ref(self, context)

    if context.buying_card then
        if G and G.GAME and G.GAME.selected_back and G.GAME.selected_back.name == "Joker Deck" and self == context.card and self.ability.set == "Joker" and not context.repetition and not context.blueprint_card and not self.getting_sliced and not context.blueprint then
            if not SMODS.current_mod.custom then SMODS.current_mod.custom = {} end
            if not SMODS.current_mod.custom.joker_deck_prevent_double_trigger then SMODS.current_mod.custom.joker_deck_prevent_double_trigger = true
            else SMODS.current_mod.custom.joker_deck_prevent_double_trigger = false end
            self:remove()
            if SMODS.current_mod.custom.joker_deck_prevent_double_trigger then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function() 
                        local front = G.P_CARDS["J_" .. "Joker"]
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, front, G.P_CENTERS.c_base, {playing_card = G.playing_card})
                        card.ability = card.ability or {}
                        card.ability.mult = card.ability.mult or 4
                        card:start_materialize({G.C.SECONDARY_SET.Default})
                        G.play:emplace(card)
                        table.insert(G.playing_cards, card)
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = context.card.config.center.name, colour = G.C.MULT})
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up', nil)
                playing_card_joker_effects({self})
            end
        end
    end

    return result
end

local back_trigger_effect_ref = Back.trigger_effect
function Back:trigger_effect(args)
    local result = back_trigger_effect_ref(self, args)

    if result then
        return result
    end

    if self.name == NAME and args then
    end
end