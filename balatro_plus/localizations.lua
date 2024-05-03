local MOD_ID, chosen_language = ...

local localization = NFS.load(SMODS.findModByID(MOD_ID).path .. 'localization/' .. chosen_language .. '.lua')()

local file = io.open("test.txt", "w")
if file ~= nil then
    file:write("debug:\n")

    if type(localization) ~= "table" then
        for grps, _ in pairs(localization) do
            file:write("GRPS: " .. grps .. " | " .. _ .. '\n')
            if grps ~= nil and _ ~= nil then
                for grp, __ in pairs(grps) do
                    file:write("GRP: " .. grp .. " | " .. __ .. '\n')
                    if grp ~= nil and __ ~= nil then
                        for item, data in pairs(grp) do
                            file:write("ITEM: " .. item)
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
                        end
                    end
                end
            end
        end
    end
    file:close()
end