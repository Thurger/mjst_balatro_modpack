local NAME = "Artist Deck"

SMODS.Back {
    key = "Back" .. "_" .. SMODS.current_mod.id .. "_" .. NAME,
    name = NAME,
    loc_txt = {
        name = "Artist's Deck",
        text = {
            "{C:mult}Flush{} are made with {C:planet}numbers{}",
            "{C:planet}Hands{} are made with {C:mult}colors{}"
        }
    },
    atlas = SMODS.current_mod.id .. "_backs",
    pos = {x = 0, y = 0},
    discovered = true,
    unlocked = true,
    config = {
    }
}