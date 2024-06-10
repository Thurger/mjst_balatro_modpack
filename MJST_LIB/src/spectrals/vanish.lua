local NAME = "vanish"

-- local process_loc_text_ref = SMODS.current_mod.process_loc_text or function() end
-- function SMODS.current_mod.process_loc_text()
--     process_loc_text_ref()

--     SMODS.process_loc_text(G.localization.descriptions.Spectral, SMODS.current_mod.id .. "_" .. NAME, {
--         name = "Vanish",
--         text = {
--             "Add {C:dark_edition}Negative{} effect to",
--             "{C:attention}1{} selected card in hand",
--             "{C:green}#1# in #2#{} chance to",
--             "destroy selected card"
--         }
--     })
-- end

SMODS.Consumable {
    key = SMODS.current_mod.id .. "_" .. NAME,
    set = "Spectral",
    discovered = true,
    atlas = SMODS.current_mod.id .. "_" .. "spectrals",
    pos = {x = 0, y = 0},
    can_use = function()
        if G.hand and (#G.hand.highlighted == 1) and G.hand.highlighted[1] and (not G.hand.highlighted[1].edition) then return true end
        return false
    end,
    use = function ()
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            local edition = {}
            edition.negative = true
            local aura_card = G.hand.highlighted[1]
            aura_card:set_edition(edition, true)
        return true end }))
    end,
    loc_vars = function()
        return {
            [1] = 1,
            [2] = 6
        }
    end,
    loc_txt = {
        name = "Vanish",
        text = {
            "Add {C:dark_edition}Negative{} effect to",
            "{C:attention}1{} selected card in hand",
            "{C:green}1 in 6{} chance to",
            "destroy selected card"
        }
    },
}