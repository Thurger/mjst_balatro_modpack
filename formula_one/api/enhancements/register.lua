local MOD_ID, enhancement = ...

SMODS.Sprite:new(
    enhancement.atlas,
    SMODS.findModByID(MOD_ID).path,
    enhancement.atlas .. ".png",
    71,
    95,
    "asset_atli"
):register()

enhancement.order = #G.P_CENTER_POOLS['Enhanced'] + 1
G.P_CENTERS[enhancement.key] = enhancement
table.insert(G.P_CENTER_POOLS['Enhanced'], enhancement)