--- STEAMODDED HEADER
--- MOD_NAME: ArtistDeck
--- MOD_ID: mjst_mod_artist_deck
--- MOD_AUTHOR: [MJST]
--- MOD_DESCRIPTION: Artist Deck
--- BADGE_COLOUR: FFBD2B
--- PREFIX: mjst_mod_artist_deck
--- DEPENDENCIES: [mjst_lib>=1.0.0]
--- VERSION: 0.0.2
--- DISPLAY_NAME: Artist Deck
--- PRIORITY: 0

----------------------------------------------
------------MOD CODE -------------------------

sendInfoMessage("[ArtistDeck]: LOADING...")

NFS.load(SMODS.current_mod.path .. "src/atlases.lua")()
NFS.load(SMODS.current_mod.path .. "src/backs/artist_deck.lua")()

sendInfoMessage("[ArtistDeck]: LOADED!")

----------------------------------------------
------------MOD CODE END----------------------