local MOD_ID = "mjst_mod"

local localization = {
    name = "Everest Souvenir Deck",
    text = {
        "{C:attention}Played Cards{} permanently",
        "gain {C:chips}+1{} Chips",
        "{C:attention}Discarded Cards{} permanently",
        "lose {C:chips}-1{} Chips",
    }
}

local deck = {
    loc_txt = localization,
    name = "EverestSouvenirDeck",
    slug = MOD_ID .. "_" .. "everestsouvenirdeck",
    config = {
        config_mjst_mod_upgradeplayedcard = true,
        config_mjst_mod_downgradediscardedcard = true,
    },
    spritePos = {
        x = 0,
        y = 0
    },
    unlocked = true,
    discovered = true
}

local sprite = {
    name = "b_" .. deck.slug,
    top_lpath = SMODS.findModByID(MOD_ID).path,
    path = "b_" .. deck.slug  .. ".png",
    px = 71,
    py = 95,
    type = "asset_atli"
}

NFS.load(SMODS.findModByID(MOD_ID).path .. "src/utils/" .. "registerDeck.lua")(deck, sprite)
