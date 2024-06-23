--- STEAMODDED HEADER
--- MOD_NAME: OfficialDeck
--- MOD_ID: mjst_mod_official_deck
--- MOD_AUTHOR: [MJST]
--- MOD_DESCRIPTION: Official Deck
--- BADGE_COLOUR: 555555
--- PREFIX: mjst_mod_official_deck
--- DEPENDENCIES: [mjst_lib>=1.0.0]
--- VERSION: 0.0.4
--- DISPLAY_NAME: Official Deck
--- PRIORITY: 0

----------------------------------------------
------------MOD CODE -------------------------

sendInfoMessage("[OfficialDeck]: LOADING...")

NFS.load(SMODS.current_mod.path .. "src/atlases.lua")()
NFS.load(SMODS.current_mod.path .. "src/backs/official_deck.lua")()

sendInfoMessage("[OfficialDeck]: LOADED!")

----------------------------------------------
------------MOD CODE END----------------------