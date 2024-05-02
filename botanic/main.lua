-- --- STEAMODDED HEADER
-- --- MOD_NAME: Botanic
-- --- MOD_ID: mjst_mod_botanic
-- --- MOD_AUTHOR: [MJST]
-- --- MOD_DESCRIPTION: Botanic Consomeables

-- ----------------------------------------------
-- ------------MOD CODE -------------------------

-- local MOD_ID = 'mjst_mod_botanic'

-- local SET_NAME = MOD_ID .. "_botanics"

-- G.C.SECONDARY_SET[MOD_ID] = HEX("3f7769")
-- G.P_CENTER_POOLS[MOD_ID] = {}
-- G.localization.descriptions[MOD_ID] = {}
-- G.localization.misc.dictionary["k_" .. MOD_ID] = "Botanic"

-- local set_discover_talliesref = set_discover_tallies
-- function set_discover_tallies()
--   set_discover_talliesref()
--   G.DISCOVER_TALLIES.mjst_mod_botanic = {tally = 0, of = 0}

--     for _, v in pairs(G.P_CENTERS) do
--         if not v.omit then
--             if v.set and v.consumeable and v.set == SET_NAME then
--                 G.DISCOVER_TALLIES[MOD_ID].of = G.DISCOVER_TALLIES[MOD_ID].of+1
--                 if v.discovered then
--                     G.DISCOVER_TALLIES[MOD_ID].tally = G.DISCOVER_TALLIES[MOD_ID].tally+1
--                 end
--             end
--         end
--     end
-- end

-- function create_mjst_mod_botanic() 
--     local card = create_card(MOD_ID, G.pack_cards, nil, nil, true, true, nil, 'alc')
--     return card
-- end

-- local get_type_colourref = get_type_colour
-- function get_type_colour(_c, card)
--     local fromRef = get_type_colourref(_c, card)

--     if _c.set == SET_NAME then
--         return G.C.SECONDARY_SET[MOD_ID]
--     end
--     return fromRef
-- end

-- local generate_card_uiref = generate_card_ui
-- function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
--   if _c.set == SET_NAME or (_c.set == 'Booster' and _c.name:find(MOD_ID)) or _c.name == 'Shock Humor' then
--     local first_pass = nil
--     if not full_UI_table then 
--         first_pass = true
--         full_UI_table = {
--             main = {},
--             info = {},
--             type = {},
--             name = nil,
--             badges = badges or {}
--         }
--     end

--     local desc_nodes = (not full_UI_table.name and full_UI_table.main) or full_UI_table.info
--     local name_override = nil
--     local info_queue = {}

--     if full_UI_table.name then
--         full_UI_table.info[#full_UI_table.info+1] = {}
--         desc_nodes = full_UI_table.info[#full_UI_table.info]
--     end

--     if not full_UI_table.name then
--         if specific_vars and specific_vars.no_name then
--             full_UI_table.name = true
--         elseif card_type == 'Locked' then
--             full_UI_table.name = localize{type = 'name', set = 'Other', key = 'locked', nodes = {}}
--         elseif card_type == 'Undiscovered' then 
--             full_UI_table.name = localize{type = 'name', set = 'Other', key = 'undiscovered_'..(string.lower(_c.set)), name_nodes = {}}
--         elseif specific_vars and (card_type == 'Default' or card_type == 'Enhanced') then
--             if (_c.name == 'Stone Card') then full_UI_table.name = true end
--             if (specific_vars.playing_card and (_c.name ~= 'Stone Card')) then
--                 full_UI_table.name = {}
--                 localize{type = 'other', key = 'playing_card', set = 'Other', nodes = full_UI_table.name, vars = {localize(specific_vars.value, 'ranks'), localize(specific_vars.suit, 'suits_plural'), colours = {specific_vars.colour}}}
--                 full_UI_table.name = full_UI_table.name[1]
--             end
--         elseif card_type == 'Booster' then
            
--         else
--             full_UI_table.name = localize{type = 'name', set = _c.set, key = _c.key, nodes = full_UI_table.name}
--         end
--         full_UI_table.card_type = card_type or _c.set
--     end 

--     local loc_vars = {}
--     if main_start then 
--         desc_nodes[#desc_nodes+1] = main_start 
--     end


--     if _c.set == SET_NAME then
--       localize{type = 'descriptions', key = _c.key, set = _c.set, nodes = desc_nodes, vars = loc_vars}
--     elseif hide_desc then
--       localize{type = 'other', key = 'undiscovered_'..(string.lower(_c.set)), set = _c.set, nodes = desc_nodes}
--     elseif _c.set == 'Booster' and _c.name:find("Alchemy") then 
--       name_override = desc_override
--       if not full_UI_table.name then full_UI_table.name = localize{type = 'name', set = 'Other', key = name_override, nodes = full_UI_table.name} end
--       localize{type = 'other', key = desc_override, nodes = desc_nodes, vars = loc_vars}
--     elseif _c.set == 'Joker' then
--       localize{type = 'descriptions', key = _c.key, set = _c.set, nodes = desc_nodes, vars = specific_vars or {}}
--     end

--     if main_end then 
--         desc_nodes[#desc_nodes+1] = main_end 
--     end

--    --Fill all remaining info if this is the main desc
--     if not ((specific_vars and not specific_vars.sticker) and (card_type == 'Default' or card_type == 'Enhanced')) then
--         if desc_nodes == full_UI_table.main and not full_UI_table.name then
--             localize{type = 'name', key = _c.key, set = _c.set, nodes = full_UI_table.name} 
--             if not full_UI_table.name then full_UI_table.name = {} end
--         elseif desc_nodes ~= full_UI_table.main then 
--             desc_nodes.name = localize{type = 'name_text', key = name_override or _c.key, set = name_override and 'Other' or _c.set} 
--         end
--     end

--     if first_pass and not (_c.set == 'Edition') and badges then
--         for k, v in ipairs(badges) do
--             if v == 'foil' then info_queue[#info_queue+1] = G.P_CENTERS['e_foil'] end
--             if v == 'holographic' then info_queue[#info_queue+1] = G.P_CENTERS['e_holo'] end
--             if v == 'polychrome' then info_queue[#info_queue+1] = G.P_CENTERS['e_polychrome'] end
--             if v == 'negative' then info_queue[#info_queue+1] = G.P_CENTERS['e_negative'] end
--             if v == 'negative_consumable' then info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}} end
--             if v == 'gold_seal' then info_queue[#info_queue+1] = {key = 'gold_seal', set = 'Other'} end
--             if v == 'blue_seal' then info_queue[#info_queue+1] = {key = 'blue_seal', set = 'Other'} end
--             if v == 'red_seal' then info_queue[#info_queue+1] = {key = 'red_seal', set = 'Other'} end
--             if v == 'purple_seal' then info_queue[#info_queue+1] = {key = 'purple_seal', set = 'Other'} end
--             if v == 'eternal' then info_queue[#info_queue+1] = {key = 'eternal', set = 'Other'} end
--             if v == 'pinned_left' then info_queue[#info_queue+1] = {key = 'pinned_left', set = 'Other'} end
--         end
--     end

--     for _, v in ipairs(info_queue) do
--         generate_card_ui(v, full_UI_table)
--     end

--     return full_UI_table
--   end
  
--   return generate_card_uiref(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
-- end

-- local generate_UIBox_ability_tableref = Card.generate_UIBox_ability_table
-- function Card:generate_UIBox_ability_table()
--   if self.ability.set == SET_NAME then
--     local card_type, hide_desc = self.ability.set or "None", nil
--     local loc_vars = nil
--     local main_start, main_end = nil, nil
--     local no_badge = nil
--     local is_custom = false

--     if not self.bypass_lock and self.config.center.unlocked ~= false and
--     (self.ability.set == 'Joker' or self.ability.set == 'Edition' or self.ability.consumeable or self.ability.set == 'Voucher' or self.ability.set == 'Booster') and
--     not self.config.center.discovered and 
--     ((self.area ~= G.jokers and self.area ~= G.consumeables and self.area) or not self.area) then
--         card_type = 'Undiscovered'
--     end    
--     if self.config.center.unlocked == false and not self.bypass_lock then --For everyting that is locked
--         card_type = "Locked"
--         if self.area and self.area == G.shop_demo then loc_vars = {}; no_badge = true end
--     elseif card_type == 'Undiscovered' and not self.bypass_discovery_ui then -- Any Joker or tarot/planet/voucher that is not yet discovered
--         hide_desc = true
--     elseif self.debuff then
--         loc_vars = { debuffed = true, playing_card = not not self.base.colour, value = self.base.value, suit = self.base.suit, colour = self.base.colour }
--     elseif card_type == 'Default' or card_type == 'Enhanced' then
--         loc_vars = { playing_card = not not self.base.colour, value = self.base.value, suit = self.base.suit, colour = self.base.colour,
--                     nominal_chips = self.base.nominal > 0 and self.base.nominal or nil,
--                     bonus_chips = (self.ability.bonus + (self.ability.perma_bonus or 0)) > 0 and (self.ability.bonus + (self.ability.perma_bonus or 0)) or nil,
--                 }
--     end

--     if is_custom then
--       local badges = {}
--       if (card_type ~= 'Locked' and card_type ~= 'Undiscovered' and card_type ~= 'Default') or self.debuff then
--           badges.card_type = card_type
--       end
--       if self.ability.set == 'Joker' and self.bypass_discovery_ui and (not no_badge) then
--           badges.force_rarity = true
--       end
--       if self.edition then
--           if self.edition.type == 'negative' and self.ability.consumeable then
--               badges[#badges + 1] = 'negative_consumable'
--           else
--               badges[#badges + 1] = (self.edition.type == 'holo' and 'holographic' or self.edition.type)
--           end
--       end
--       if self.seal then badges[#badges + 1] = string.lower(self.seal)..'_seal' end
--       if self.ability.eternal then badges[#badges + 1] = 'eternal' end
--       if self.pinned then badges[#badges + 1] = 'pinned_left' end

--       if self.sticker then loc_vars = loc_vars or {}; loc_vars.sticker=self.sticker end

--       return generate_card_ui(self.config.center, nil, loc_vars, card_type, badges, hide_desc, main_start, main_end)
--     end
--   end

--   return generate_UIBox_ability_tableref(self)
-- end

-- local set_spritesref = Card.set_sprites
-- function Card:set_sprites(_center, _front)
--     if _center and _center.set == SET_NAME then
--       if _center.set then
--         if self.children.center then
--           self.children.center.atlas = G.ASSET_ATLAS[_center.atlas]
--           self.children.center:set_sprite_pos(_center.pos)
--         else
--           if not self.params.bypass_discovery_center and not _center.discovered then 
--             self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["c_" .. MOD_ID .. "_undiscovered"], {x=0,y=0})
--           else
--             self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[_center.atlas], _center.pos)
--           end
--             self.children.center.states.hover = self.states.hover
--             self.children.center.states.click = self.states.click
--             self.children.center.states.drag = self.states.drag
--             self.children.center.states.collide.can = false
--             self.children.center:set_role({major = self, role_type = 'Glued', draw_major = self})
--         end
--       end

--       if not self.children.back then
--           self.children.back = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["centers"], self.params.bypass_back or (self.playing_card and G.GAME[self.back].pos or G.P_CENTERS['b_red'].pos))
--           self.children.back.states.hover = self.states.hover
--           self.children.back.states.click = self.states.click
--           self.children.back.states.drag = self.states.drag
--           self.children.back.states.collide.can = false
--           self.children.back:set_role({major = self, role_type = 'Glued', draw_major = self})
--       end
--     else
--       set_spritesref(self, _center, _front);
--     end
-- end

-- local draw_ref = Card.draw
-- function Card:draw(layer)
--     draw_ref(self, layer)

--     if (layer == 'card' or layer == 'both') then
--         if self.sprite_facing == 'front' then
--             if self.ability.set == SET_NAME then
--                 -- self.children.center:draw_shader('polychrome', nil, self.ARGS.send_to_shader)
--             end
--         end
--     end
-- end

-- function SMODS.INIT.mjst_mod_botanic()
--     ----#### INIT LOCALIZATION ####----
--     init_localization()

--     local consumableCategory = "Botanics"
--     local consumableName = "Botanic"

--     NFS.load(SMODS.findModByID(MOD_ID).path .. "api/utils/" .. "createConsumableType.lua")(MOD_ID, consumableCategory, consumableName, nil, nil)
--     -- SMODS.Sprite:new("c_" .. MOD_ID .. "_undiscovered", SMODS.findModByID(MOD_ID).path, "c_" .. MOD_ID .. "_undiscovered.png", 71, 95, "asset_atli"):register();

--     ----#### CONSUMABLES ####----
--     NFS.load(SMODS.findModByID(MOD_ID).path .. "src/consumables/" .. "sunflower.lua")(MOD_ID, consumableName)

--     ----#### CHALLENGES ####----
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/challenges/" .. "experiment.lua")(MOD_ID)

--     NFS.load(SMODS.findModByID(MOD_ID).path .. "api/utils/" .. "createYourCollection.lua")(MOD_ID, "Botanic Cards", nil, 2, 2, {1, 1}, nil, nil)

--     SMODS.LOAD_LOC()
--     SMODS.SAVE_UNLOCKS()
-- end

-- ----------------------------------------------
-- ------------MOD CODE END----------------------