local MOD_ID = ...

local ENHANCEMENT_NAME = "raced"

local localization = {
    name = "Raced",
    text = {
        "{X:mult,C:white}X#1#{} Mult per finished Ante",
        "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
    }
}

local enhancement = {
    key = "m_" .. MOD_ID .. "_" .. ENHANCEMENT_NAME,
    atlas = "m_" .. MOD_ID .. "_" .. ENHANCEMENT_NAME,
    name = MOD_ID .. "_" .. ENHANCEMENT_NAME,
    max = 500,
    loc_txt = localization,
    set = "Enhanced",
    pos = {x = 0, y = 0},
    effect = MOD_ID .. "_effect_" .. ENHANCEMENT_NAME,
    label = "Raced",
    config = {
        extra = {
            x_mult = 0.1
        },
    }
}

NFS.load(SMODS.findModByID(MOD_ID).path .. "api/enhancements/register.lua")(MOD_ID, enhancement)