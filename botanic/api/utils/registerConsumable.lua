local MOD_ID, type, consumable, sprite = ...

local function RegisterJoker(consumable, sprite)
    _G[MOD_ID][type]:new(
        consumable.name,
        consumable.slug,
        consumable.config,
        consumable.pos,
        consumable.loc_txt,
        consumable.cost,
        consumable.discovered
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

RegisterJoker(consumable, sprite)
