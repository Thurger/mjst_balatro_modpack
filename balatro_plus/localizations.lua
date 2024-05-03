local MOD_ID, chosen_language = ...

local localization = NFS.load(SMODS.findModByID(MOD_ID).path .. 'localization/' .. chosen_language .. '.lua')()

if type(localization) == "table" then
    for grps, _ in pairs(localization) do
        if grps ~= nil and _ ~= nil then
            for grp, __ in pairs(localization[grps]) do
                if grp ~= nil and __ ~= nil then
                    for item, data in pairs(localization[grps][grp]) do
                        if G.localization[grps] == nil then
                            G.localization[grps] = {}
                        end
                        if G.localization[grps][grp] == nil then
                            G.localization[grps][grp] = {}
                        end
                        if G.localization[grps][grp][item] == nil then
                            G.localization[grps][grp][item] = {}
                        end
                        G.localization[grps][grp][item] = data
                        -- if G.localization[grps][grp][item].center == nil then
                        --     G.localization[grps][grp][item].center = {}
                        -- end
                        -- if G.localization[grps][grp][item].center.text_parsed == nil then
                        --     G.localization[grps][grp][item].center.text_parsed = {}
                        -- end
                        -- if G.localization[grps][grp][item].center.name_parsed == nil then
                        --     G.localization[grps][grp][item].center.name_parsed = {}
                        -- end
                        -- if G.localization[grps][grp][item].center.unlock_parsed == nil then
                        --     G.localization[grps][grp][item].center.unlock_parsed = {}
                        -- end
                        -- for idx, line in ipairs(center.text) do
                        --     G.localization[grps][grp][item].center.text_parsed[#G.localization[grps][grp][item].center.text_parsed + 1] = loc_parse_string(line)
                        -- end
                        -- for idx, line in ipairs(center.name) do
                        --     G.localization[grps][grp][item].center.name_parsed[#G.localization[grps][grp][item].center.name_parsed + 1] = loc_parse_string(line)
                        -- end
                        -- for idx, line in ipairs(center.unlock) do
                        --     G.localization[grps][grp][item].center.unlock_parsed[#G.localization[grps][grp][item].center.unlock_parsed + 1] = loc_parse_string(line)
                        -- end
                    end
                end
            end
        end
    end
end

for g_k, group in pairs(G.localization) do
    if g_k == 'descriptions' then
        for _, set in pairs(group) do
            for _, center in pairs(set) do
                center.text_parsed = {}
                for _, line in ipairs(center.text) do
                    center.text_parsed[#center.text_parsed + 1] = loc_parse_string(line)
                end
                center.name_parsed = {}
                for _, line in ipairs(type(center.name) == 'table' and center.name or { center.name }) do
                    center.name_parsed[#center.name_parsed + 1] = loc_parse_string(line)
                end
                if center.unlock then
                    center.unlock_parsed = {}
                    for _, line in ipairs(center.unlock) do
                        center.unlock_parsed[#center.unlock_parsed + 1] = loc_parse_string(line)
                    end
                end
            end
        end
    end
end