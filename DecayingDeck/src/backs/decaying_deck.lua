local NAME = "Decaying Deck"

SMODS.Back {
    key = "Back" .. "_" .. SMODS.current_mod.id .. "_" .. NAME,
    name = NAME,
    loc_txt = {
        name = "Decaying Deck",
        text = {
            "After beating the Boss Blind",
            "destroy all cards of",
            "the highest rank in your",
            "full deck"
        }
    },
    atlas = SMODS.current_mod.id .. "_backs",
    pos = {x = 0, y = 0},
    discovered = true,
    unlocked = true,
    config = {
        mjst_decaying = true
    }
}

local back_trigger_ref = Back.trigger_effect
function Back:trigger_effect(args)
    local ret = back_trigger_ref(self, args)

    if self.name == NAME and args.context == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss then
        local highest_rank = 0
        for k, v in pairs(G.playing_cards) do
            if v and v.base and v.base.id and v.base.id > highest_rank then
                highest_rank = v.base.id
            end
        end
        for i = #G.playing_cards, 1, -1 do
            if G.playing_cards[i] and G.playing_cards[i].base and G.playing_cards[i].base.id and G.playing_cards[i].base.id == highest_rank then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        G.play:emplace(G.playing_cards[i], nil, false)
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.2,
                            func = function()
                                G.playing_cards[i]:start_dissolve()
                                G.deck.config.card_limit = G.deck.config.card_limit - 1
                                return true
                            end
                        }))
                        return true
                    end
                }))
            end
        end
        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
    end

    return ret
end