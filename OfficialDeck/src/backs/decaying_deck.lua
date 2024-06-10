local NAME = "Decaying Deck"

SMODS.Back {
    key = "Back" .. "_" .. SMODS.current_mod.id .. "_" .. NAME,
    name = NAME,
    loc_txt = {
        name = "Official Deck",
        text = {
            "All {C:attention}cards{} may",
            "have up to {C:attention}3{} {C:tarot}seals{}.",
            "{C:tarot}Seals{} can be purchased",
            "in the {C:gold}shop{}"
        }
    },
    atlas = SMODS.current_mod.id .. "_backs",
    pos = {x = 0, y = 0},
    discovered = true,
    unlocked = true,
    config = {
    }
}