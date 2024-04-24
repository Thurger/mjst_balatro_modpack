function Register(joker, sprite)
    local minId = table_length(G.P_CENTER_POOLS['Joker']) + 1
    local id = 0
    local i = 0

    if joker.order then
        id = joker.order
    else
        i = i + 1
        id = i + minId
    end
    local joker_obj = {
        discovered = joker.discovered,
        name = joker.name,
        set = "Joker",
        unlocked = joker.unlocked,
        order = id,
        key = joker.slug,
        pos = joker.pos,
        config = joker.config,
        rarity = joker.rarity,
        blueprint_compat = joker.blueprint_compat,
        eternal_compat = joker.eternal_compat,
        effect = joker.effect,
        cost = joker.cost,
        cost_mult = 1.0,
        atlas = joker.atlas or nil,
        mod_name = joker.mod_name,
        badge_colour = joker.badge_colour,
        soul_pos = joker.soul_pos,
        labels = joker.labels,
        -- * currently unsupported
        no_pool_flag = joker.no_pool_flag,
        yes_pool_flag = joker.yes_pool_flag,
        unlock_condition = joker.unlock_condition,
        enhancement_gate = joker.enhancement_gate,
        start_alerted = joker.start_alerted
    }
    for _i, sprite in ipairs(SMODS.Sprites) do
        if sprite.name == joker_obj.key then
            joker_obj.atlas = sprite.name
        end
    end

    -- Now we replace the others
    G.P_CENTERS[joker.slug] = joker_obj
    if not joker.taken_ownership then
        table.insert(G.P_CENTER_POOLS['Joker'], joker_obj)
        table.insert(G.P_JOKER_RARITY_POOLS[joker_obj.rarity], joker_obj)
    else
        for kk, v in ipairs(G.P_CENTER_POOLS['Joker']) do
            if v.key == joker.slug then G.P_CENTER_POOLS['Joker'][kk] = joker_obj end
        end
        if joker_obj.rarity == joker.rarity_original then
            for kk, v in ipairs(G.P_JOKER_RARITY_POOLS[joker_obj.rarity]) do
                if v.key == joker.slug then G.P_JOKER_RARITY_POOLS[kk] = joker_obj end
            end
        else
            table.insert(G.P_JOKER_RARITY_POOLS[joker_obj.rarity], joker_obj)
            local j
            for kk, v in ipairs(G.P_JOKER_RARITY_POOLS[joker.rarity_original]) do
                if v.key == joker.slug then j = kk end
            end
            table.remove(G.P_JOKER_RARITY_POOLS[joker.rarity_original], j)
        end
    end
    -- Setup Localize text
    G.localization.descriptions["Joker"][joker.slug] = joker.loc_txt

    sendInfoMessage("Registered Joker " .. joker.name .. " with the slug " .. joker.slug .. " at ID " .. id .. ".")

    SMODS.Sprite:new(
        sprite.name,
        sprite.top_lpath,
        sprite.path,
        sprite.px,
        sprite.py,
        sprite.type
    ):register()

    SMODS.MJSTAPI.Jokers[joker.slug] = {joker = joker, sprite = sprite}
end

return Register