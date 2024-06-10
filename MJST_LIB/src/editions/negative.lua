local NAME = "negative"

local process_loc_text_ref = SMODS.current_mod.process_loc_text or function() end
function SMODS.current_mod.process_loc_text()
    process_loc_text_ref()

    SMODS.process_loc_text(G.localization.descriptions.Other, SMODS.current_mod.id .. "_" .. NAME, {
        text = {
            "{C:attention}+#1#{} hand size"
        }
    })
end