local name, button_label, colour, nb_item_per_page, nb_row, nb_item_per_row_table, items, items_size = ...

local items = items or G.P_CENTER_POOLS[name]
if items == nil then return end

local create_UIBox_your_collectionref = create_UIBox_your_collection
function create_UIBox_your_collection()
    local your_collection = create_UIBox_your_collectionref()
    table.insert(your_collection.nodes[1].nodes[1].nodes[1].nodes[1].nodes[4].nodes[2].nodes, UIBox_button({
        button = 'your_collection_' .. name,
        label = { button_label },
        count = G.DISCOVER_TALLIES[name],
        minw = 4,
        id = 'your_collection_' .. name,
        colour = colour or G.C.SECONDARY_SET[name]
    }))
    return your_collection
end

G.FUNCS["your_collection_" .. name .. "_page"] = function(args)
    if not args or not args.cycle_config then return end

    -- EMPTY your_collection
    for j = 1, #G.your_collection do
        for i = #G.your_collection[j].cards, 1, -1 do
            local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
            c:remove()
            c = nil
        end
    end

    -- FILL your_collection
    for j = 1, #G.your_collection do
        for i = 1, nb_item_per_row_table[j] do
            local center = G.P_CENTER_POOLS[name][(j-1) * 3 + i + (2*(args.cycle_config.current_option - 1))]
            if not center then break end
            local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, center)
            card:start_materialize(nil, i>1 or j>1)
            G.your_collection[j]:emplace(card)
        end
    end
    INIT_COLLECTION_CARD_ALERTS()
end

_G["create_UIBox_your_collection_" .. name] = function()
    local deck_tables = {}
    G.your_collection = {}

    for j = 1, 2 do
        G.your_collection[j] = CardArea(
            G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
            (3.25)*G.CARD_W,
            1*G.CARD_H, 
            {card_limit = 1, type = 'title', highlight_limit = 0, collection = true})
        table.insert(deck_tables, 
        {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes={
            {n=G.UIT.O, config={object = G.your_collection[j]}}
        }}
        )
    end
    _G[name .. "_options"] = {}
    for i = 1, math.ceil(#G.P_CENTER_POOLS[name]/6) do
        table.insert(_G[name .. "_options"], localize('k_page')..' '..tostring(i)..'/'..tostring(math.ceil(#G.P_CENTER_POOLS[name] / 6)))
    end
    for j = 1, #G.your_collection do
        for i = 1, 6 do
            local center = G.P_CENTER_POOLS[name][(j-1) * 3 + i]
            if type(center) == "table" then
                local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, nil, center)
                card:start_materialize(nil, i>1 or j>1)
                G.your_collection[j]:emplace(card)
            end
        end
    end
    INIT_COLLECTION_CARD_ALERTS()
    local t = create_UIBox_generic_options({ back_func = 'your_collection', contents = {
        {n=G.UIT.R, config={align = "cm", minw = 2.5, padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables},
            {n=G.UIT.R, config={align = "cm"}, nodes={
            create_option_cycle({options = _G[name .. "_options"], w = 3.5, cycle_shoulders = true, opt_callback = 'your_collection_' .. name .. '_page', focus_args = {snap_to = true, nav = 'wide'},current_option = 1, colour = G.C.RED, no_pips = true})
            }}
        }})
    return t
end

G.FUNCS["your_collection_" .. name] = function(e)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu{
        definition = _G["create_UIBox_your_collection_" .. name](),
    }
end
