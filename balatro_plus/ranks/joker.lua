local NAME = 'joker'

SMODS.Rank{
    key = SMODS.current_mod.id .. '_' .. NAME,
    pos = {
        x = 0,
        y = 0
    },
    loc_txt = G.localization.descriptions.Other["j_" .. SMODS.current_mod.id .. "_" .. NAME] or {name = 'ERROR', text = {"{C:Mult}[ERROR]","Localization does not exist"}},
    nominal = 0
}