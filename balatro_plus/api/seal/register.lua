local MOD_ID, seal, sprite = ...

SMODS.Sprite:new(
    sprite.name,
    sprite.top_lpath,
    sprite.path,
    sprite.px,
    sprite.py,
    sprite.type
):register()
SMODS.injectSprites()
G.shared_seals[seal.name] = Sprite(0, 0, G.CARD_W, G.CARD_H, G.ASSET_ATLAS[seal.name], {x = 0, y = 0})
seal.order = #G.P_CENTER_POOLS.Seal + 1
G.P_SEALS[seal.name] = seal
table.insert(G.P_CENTER_POOLS.Seal, seal)
