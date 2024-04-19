function Register(joker, sprite)
    table.insert(SMODS.MJSTAPI.Jokers, {joker = joker, sprite = sprite})
    SMODS.Joker:new(
        joker.name,
        joker.slug,
        joker.config,
        joker.spritePos,
        joker.loc_txt,
        joker.rarity,
        joker.cost,
        joker.unlocked,
        joker.discovered,
        joker.blueprint_compat,
        joker.eternal_compat,
        joker.effect
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

return Register