--- STEAMODDED HEADER
--- MOD_NAME: DecayingDeck
--- MOD_ID: mjst_mod_decaying_deck
--- MOD_AUTHOR: [MJST]
--- MOD_DESCRIPTION: Decaying Deck
--- BADGE_COLOUR: 327860
--- PREFIX: mjst_mod_decaying_deck
--- DEPENDENCIES: [mjst_lib>=1.0.0]
--- VERSION: 1.0.2
--- DISPLAY_NAME: Decaying Deck
--- PRIORITY: 0

----------------------------------------------
------------MOD CODE -------------------------

sendInfoMessage("[DecayingDeck]: LOADING...")

NFS.load(SMODS.current_mod.path .. "src/atlases.lua")()
NFS.load(SMODS.current_mod.path .. "src/backs/decaying_deck.lua")()

sendInfoMessage("[DecayingDeck]: LOADED!")

----------------------------------------------
------------MOD CODE END----------------------