local data, max_depth = ...

local function dump(data, max_depth, depth)
    if not depth then depth = 0 end
    if not max_depth then max_depth = 3 end
    if type(data) == 'table' then
        local s = '{\n'
        if depth < max_depth then
            for k, v in pairs(data) do
                for _ = 0, depth do
                    s = s .. '\t'
                end
                if type(k) ~= 'number' and type(k) ~= "function" then
                    k = '"'.. tostring(k) ..'"'
                end
                if (type(v) == "function") then
                    s = s .. '['..k..']: ' .. "function" .. ',\n'
                end
                s = s .. '['..k..']: ' .. dump(v, max_depth, depth + 1) .. ',\n'
            end
        end
        for _ = 0, depth do
            s = s .. '\t'
        end
        return s .. '}'
    else
        return tostring(data)
    end
end

return dump(data, max_depth)