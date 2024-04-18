local MOD_ID, category_name, name, cost, config = ...

_G[MOD_ID] = {}
_G[MOD_ID][category_name] = {}
_G[MOD_ID][name] = {
    name = "",
    slug = "",
    cost = cost or 3,
    config = config or {},
    pos = {},
    loc_txt = {},
    discovered = false,
    consumeable = true
}

-- Create Metatable
local mt = {}
mt.__index = mt

function mt:new(name, slug, config, pos, loc_txt, cost, discovered)
    o = {}
    setmetatable(o, self)
    self.__index = self

    o.loc_txt = loc_txt
    o.name = name
    o.slug = slug
    o.config = config or {}
    o.pos = pos or {
        x = 0,
        y = 0
    }
    o.cost = cost
    o.discovered = discovered or true
    o.consumeable = true
    return o
end

function mt:register()
    _G[MOD_ID][category_name][self.slug] = self
    local minId = table_length(G.P_CENTER_POOLS[MOD_ID]) + 1--TODO
    local id = 0
    local i = 0
    i = i + 1

    id = i + minId

    local obj = {
        discovered = self.discovered,
        consumeable = true,
        name = self.name,
        set = MOD_ID .. "_botanics",
        order = id,
        key = self.slug,
        pos = self.pos,
        cost = self.cost,
        config = self.config
    }

    for _i, sprite in ipairs(SMODS.Sprites) do
        sendDebugMessage(sprite.name)
        sendDebugMessage(obj.key)
        if sprite.name == obj.key then
            obj.atlas = sprite.name
        end
    end

    G.P_CENTERS[self.slug] = obj
        table.insert(G.P_CENTER_POOLS[MOD_ID], obj)

    G.localization.descriptions[MOD_ID][self.slug] = self.loc_txt

    for g_k, group in pairs(G.localization) do
          if g_k == 'descriptions' then
              for _, set in pairs(group) do
                  for _, center in pairs(set) do
                      center.text_parsed = {}
                      for _, line in ipairs(center.text) do
                          center.text_parsed[#center.text_parsed + 1] = loc_parse_string(line)
                      end
                      center.name_parsed = {}
                      for _, line in ipairs(type(center.name) == 'table' and center.name or {center.name}) do
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

      sendDebugMessage("[" .. MOD_ID .. "]:" .. "The " .. name .. " named " .. self.name .. " with the slug " .. self.slug ..
                           " have been registered at the id " .. id .. ".")
  end


-- Create the Newtable and assign the Metatable to it
local nt = {}
setmetatable(nt, mt)

-- Assign the Metatable to dynamic variable so _G[MOD_ID][category_name]:new() and '':register() are possible
_G[MOD_ID][name] = nt