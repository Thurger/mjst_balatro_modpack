local MOD_ID = "mjst_mod"

local cards = {
    {s='S', r='A'},
    {s='D', r='2'},
    {s='C', r='2'},
    {s='H', r='3'},
    {s='S', r='3'},
    {s='D', r='3'},
    {s='C', r='4'},
    {s='H', r='4'},
    {s='S', r='4'},
    {s='D', r='4'},
    {s='C', r='5'},
    {s='H', r='5'},
    {s='S', r='5'},
    {s='D', r='5'},
    {s='C', r='5'},
    {s='H', r='6'},
    {s='S', r='6'},
    {s='D', r='6'},
    {s='C', r='6'},
    {s='H', r='6'},
    {s='S', r='6'},
    {s='D', r='7'},
    {s='C', r='7'},
    {s='H', r='7'},
    {s='S', r='7'},
    {s='D', r='7'},
    {s='C', r='7'},
    {s='H', r='7'},
    {s='S', r='8'},
    {s='D', r='8'},
    {s='C', r='8'},
    {s='H', r='8'},
    {s='S', r='8'},
    {s='D', r='8'},
    {s='C', r='8'},
    {s='H', r='8'}
}

local config = {
    name = "Math",
    id = "c_" .. MOD_ID .. "_" .. "math" ,
    rules = {
        custom = {
        },
        modifiers = {
        }
    },
    jokers = {
        {id = 'j_mjst_mod_prime', eternal = true},
        {id = 'j_fibonacci', eternal = true}
    },
    consumeables = {
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

NFS.load(SMODS.findModByID(MOD_ID).path .. "src/utils/" .. "registerChallenge.lua")(config)
G.localization.misc.challenge_names.c_mjst_mod_math = "Math"