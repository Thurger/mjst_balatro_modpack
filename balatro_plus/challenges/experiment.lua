local MOD_ID = ...

local CHALLENGE_NAME = "experiment"

local cards = {
    {s='D', r='2', m='m_mjst_mod_formula_one_raced'},
    {s='D', r='3'},
    {s='D', r='4'},
    {s='D', r='5'},
    {s='D', r='6'},
    {s='D', r='7'},
    {s='D', r='8'},
    {s='D', r='9'},
    {s='D', r='T'},
    {s='D', r='J'},
    {s='D', r='Q'},
    {s='D', r='K'},
    {s='D', r='A', g=('s_' .. MOD_ID .. '_' .. 'ranked_2')},
    {s='C', r='2'},
    {s='C', r='3'},
    {s='C', r='4'},
    {s='C', r='5'},
    {s='C', r='6'},
    {s='C', r='7'},
    {s='C', r='8'},
    {s='C', r='9'},
    {s='C', r='T'},
    {s='C', r='J'},
    {s='C', r='Q'},
    {s='C', r='K'},
    {s='C', r='A', g='Blue'},
    {s='H', r='2'},
    {s='H', r='3'},
    {s='H', r='4'},
    {s='H', r='5'},
    {s='H', r='6'},
    {s='H', r='7'},
    {s='H', r='8'},
    {s='H', r='9'},
    {s='H', r='T'},
    {s='H', r='J'},
    {s='H', r='Q'},
    {s='H', r='K'},
    {s='H', r='A', g='Blue'},
    {s='S', r='2'},
    {s='S', r='3'},
    {s='S', r='4'},
    {s='S', r='5'},
    {s='S', r='6'},
    {s='S', r='7'},
    {s='S', r='8'},
    {s='S', r='9'},
    {s='S', r='T'},
    {s='S', r='J'},
    {s='S', r='Q'},
    {s='S', r='K'},
    {s='S', r='A', g='Blue'}
}

local config = {
    name = MOD_ID .. '_' .. CHALLENGE_NAME,
    id = "c_" .. MOD_ID .. "_" .. CHALLENGE_NAME,
    rules = {
        custom = {
        },
        modifiers = {
        }
    },
    jokers = {
        {id = 'j_mjst_mod_balatro_plus_patch', eternal = false, edition = 'negative'},
        {id = 'j_mjst_mod_balatro_plus_mis_scaled'}
    },
    consumeables = {
        {id = 'c_hex'}
    },
    vouchers = {
    },
    deck = {
        type = 'Challenge Deck',
        cards = cards
    },
    restrictions = {
        banned_cards = {
        },
        banned_tags = {
        },
        banned_other = {
        }
    }
}

NFS.load(SMODS.findModByID(MOD_ID).path .. "api/challenges/" .. "registerChallenge.lua")(config)
G.localization.misc.challenge_names['c_' .. MOD_ID .. '_' .. CHALLENGE_NAME] = "Experiment"