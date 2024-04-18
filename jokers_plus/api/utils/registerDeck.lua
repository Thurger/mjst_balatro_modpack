local deck, sprite = ...

local function RegisterDeck(deck, sprite)
    SMODS.Deck:new(
        deck.name,
        deck.slug,
        deck.config,
        deck.spritePos,
        deck.loc_txt,
        deck.unlocked,
        deck.discovered
    ):register()
    SMODS.Sprite:new(
        sprite.name,
        sprite.top_lpath,
        sprite.path,
        sprite.px,
        sprite.py,
        sprite.type
    ):register()
end

RegisterDeck(deck, sprite)