-- --- STEAMODDED HEADER
-- --- MOD_NAME: Balatro+
-- --- MOD_ID: mjst_mod_balatro_plus
-- --- MOD_AUTHOR: [MJST]
-- --- MOD_DESCRIPTION: Balatro+
-- --- BADGE_COLOUR: D4443C

-- ----------------------------------------------
-- ------------MOD CODE -------------------------

-- local MOD_ID = "mjst_mod_balatro_plus"

-- local ref_card_set_ability = Card.set_ability
-- function Card:set_ability(center, initial, delay_sprites)
--     if center then
--         local old_ability = self.ability
--         ref_card_set_ability(self, center, initial, delay_sprites)
--         if old_ability and old_ability.mjst_mod_balatro_plus_perma_mult then
--             self.ability.mjst_mod_balatro_plus_perma_mult = old_ability.mjst_mod_balatro_plus_perma_mult
--         end
--     end
-- end

-- local ref_generate_card_ui = generate_card_ui
-- function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
--     local info_queue = {}

--     if (_c.set == 'Default' or _c.set == 'Enhanced') and specific_vars and specific_vars.mjst_mod_balatro_plus_perma_mult then
--         if not full_UI_table then
--             full_UI_table = {
--                 main = {},
--                 info = {},
--                 type = {},
--                 name = nil,
--                 badges = badges or {}
--             }
--         end

--         local desc_nodes = (not full_UI_table.name and full_UI_table.main) or full_UI_table.info
--         local result = ref_generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
--         if specific_vars.mjst_mod_balatro_plus_perma_mult ~= nil then
--             localize{type = 'other', key = 'mjst_mod_balatro_plus_perma_mult', nodes = desc_nodes, vars = {specific_vars.mjst_mod_balatro_plus_perma_mult}}
--         end

--         if not (_c.set == 'Edition') and badges then
--             for k, v in ipairs(badges) do
--                 if v == 'foil' then info_queue[#info_queue+1] = G.P_CENTERS['e_foil'] end
--                 if v == 'holographic' then info_queue[#info_queue+1] = G.P_CENTERS['e_holo'] end
--                 if v == 'polychrome' then info_queue[#info_queue+1] = G.P_CENTERS['e_polychrome'] end
--                 if v == 'negative' then info_queue[#info_queue+1] = G.P_CENTERS['e_negative'] end
--                 if v == 'negative_consumable' then info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}} end
--                 if v == 'gold_seal' then info_queue[#info_queue+1] = {key = 'gold_seal', set = 'Other'} end
--                 if v == 'blue_seal' then info_queue[#info_queue+1] = {key = 'blue_seal', set = 'Other'} end
--                 if v == 'red_seal' then info_queue[#info_queue+1] = {key = 'red_seal', set = 'Other'} end
--                 if v == 'purple_seal' then info_queue[#info_queue+1] = {key = 'purple_seal', set = 'Other'} end
--                 if v == 'eternal' then info_queue[#info_queue+1] = {key = 'eternal', set = 'Other'} end
--                 if v == 'perishable' then info_queue[#info_queue+1] = {key = 'perishable', set = 'Other', vars = {G.GAME.perishable_rounds or 1, specific_vars.perish_tally or G.GAME.perishable_rounds}} end
--                 if v == 'rental' then info_queue[#info_queue+1] = {key = 'rental', set = 'Other', vars = {G.GAME.rental_rate or 1}} end
--                 if v == 'pinned_left' then info_queue[#info_queue+1] = {key = 'pinned_left', set = 'Other'} end
--                 if v == 's_mjst_mod_balatro_plus_ranked_2' then info_queue[#info_queue+1] = {key = 's_mjst_mod_balatro_plus_ranked_2', set = 'Other'} end
--             end
--         end
--         for _, v in ipairs(info_queue) do
--             generate_card_ui(v, full_UI_table)
--         end

--         return result
--     end

--     if not (_c.set == 'Edition') and badges then
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
--             if v == 'perishable' then info_queue[#info_queue+1] = {key = 'perishable', set = 'Other', vars = {G.GAME.perishable_rounds or 1, specific_vars.perish_tally or G.GAME.perishable_rounds}} end
--             if v == 'rental' then info_queue[#info_queue+1] = {key = 'rental', set = 'Other', vars = {G.GAME.rental_rate or 1}} end
--             if v == 'pinned_left' then info_queue[#info_queue+1] = {key = 'pinned_left', set = 'Other'} end
--             if v == 's_mjst_mod_balatro_plus_ranked_2' then info_queue[#info_queue+1] = {key = 's_mjst_mod_balatro_plus_ranked_2', set = 'Other'} end
--         end
--     end
--     for _, v in ipairs(info_queue) do
--         generate_card_ui(v, full_UI_table)
--     end
--     return ref_generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
-- end

-- local get_chip_mult_ref = Card.get_chip_mult
-- function Card:get_chip_mult()
--     if self.ability.mjst_mod_balatro_plus_perma_mult and not self.debuff then
--         return get_chip_mult_ref(self) + self.ability.mjst_mod_balatro_plus_perma_mult
--     end
--     return get_chip_mult_ref(self)
-- end

-- local calculate_seal_ref = Card.calculate_seal
-- function Card:calculate_seal(context)
--     local result = calculate_seal_ref(self, context)

--     if context.discard then
--         if self.seal == 's_' .. MOD_ID .. '_' .. 'ranked_2' then
--             G.E_MANAGER:add_event(Event({
--                 trigger = 'after',
--                 delay = 0.0,
--                 func = (function()
--                     if not G.GAME.round_resets.temp_handsize then
--                         G.GAME.round_resets.temp_handsize = 0
--                     end

--                     G.E_MANAGER:add_event(Event({
--                         func = function()
--                             G.hand.config.real_card_limit = (G.hand.config.real_card_limit or G.hand.config.card_limit) +
--                                 1
--                             G.hand.config.card_limit = math.max(0, G.hand.config.real_card_limit)
--                             check_for_unlock({ type = 'min_hand_size' })
--                             return true
--                         end
--                     }))
--                     G.GAME.round_resets.temp_handsize = G.GAME.round_resets.temp_handsize + 1
--                     return true
--                 end)
--             }))
--         end
--     end

--     return result
-- end

-- local ref_generate_UIBox_ability_table = Card.generate_UIBox_ability_table
-- function Card:generate_UIBox_ability_table()
--     local card_ui_options = NFS.load(SMODS.current_mod.path .. "api/" .. "getCardUIOptions.lua")()
--     local card_type, hide_desc = self.ability.set or "None", nil
--     local main_start, main_end = nil, nil
--     local loc_vars = nil
--     local badges = {}

--     ---- Handle Badges and Stickers ----
--     if (card_type ~= 'Locked' and card_type ~= 'Undiscovered' and card_type ~= 'Default') or self.debuff then
--         badges.card_type = card_type
--     end
--     if self.ability.set == 'Joker' and self.bypass_discovery_ui and (not no_badge) then
--         badges.force_rarity = true
--     end
--     if self.edition then
--         if self.edition.type == 'negative' and self.ability.consumeable then
--             badges[#badges + 1] = 'negative_consumable'
--         else
--             badges[#badges + 1] = (self.edition.type == 'holo' and 'holographic' or self.edition.type)
--         end
--     end
--     if self.seal then badges[#badges + 1] = string.lower(self.seal)..'_seal' end
--     if self.ability.eternal then badges[#badges + 1] = 'eternal' end
--     if self.ability.perishable then
--         loc_vars = loc_vars or {}; loc_vars.perish_tally=self.ability.perish_tally
--         badges[#badges + 1] = 'perishable'
--     end
--     if self.ability.rental then badges[#badges + 1] = 'rental' end
--     if self.pinned then badges[#badges + 1] = 'pinned_left' end

--     if self.sticker then loc_vars = loc_vars or {}; loc_vars.sticker=self.sticker end
--     ---- END Handle Badges and Stickers ----

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
--         loc_vars = {
--             playing_card = not not self.base.colour,
--             value = self.base.value,
--             suit = self.base.suit,
--             colour = self.base.colour,
--             nominal_chips = self.base.nominal > 0 and self.base.nominal or nil,
--             bonus_chips = (self.ability.bonus + (self.ability.perma_bonus or 0)) > 0 and (self.ability.bonus + (self.ability.perma_bonus or 0)) or nil,
--             mjst_mod_balatro_plus_perma_mult = self.ability.mjst_mod_balatro_plus_perma_mult or nil
--         }
--         return generate_card_ui(self.config.center, nil, loc_vars, card_type, badges, hide_desc, main_start, main_end)
--     end
--     for i = 1, #card_ui_options do
--         if self.ability.name == ("j_" .. MOD_ID .. '_ability_' .. card_ui_options[i].name) then
--             local card_ui = NFS.load(SMODS.current_mod.path .. "api/refs/" .. "generate_UIBox_ability_table.lua")(MOD_ID, self, card_ui_options)
--             if card_ui ~= nil then
--                 return generate_card_ui(card_ui._c, card_ui.full_UI_table, card_ui.specific_vars, card_ui.card_type, card_ui.badges, card_ui.hide_desc, card_ui.main_start, card_ui.main_end)
--             end
--             return nil
--         end
--     end
--     return ref_generate_UIBox_ability_table(self)
-- end

-- local get_badge_colour_ref = get_badge_colour
-- function get_badge_colour(key)
--     local result = get_badge_colour_ref(key)

--     if key == 's_' .. MOD_ID .. "_" .. 'ranked_2' then
--         return "CD2423"
--     end

--     return result
-- end

-- local supported_languages = {}
-- supported_languages["en-us"] = true
-- supported_languages["fr"] = true

-- local game_set_language_ref = Game.set_language
-- function Game:set_language()
--     local result = game_set_language_ref(self)

--     NFS.load(SMODS.current_mod.path .. 'localizations.lua')(MOD_ID, 'en-us')
--     if supported_languages[G.SETTINGS.language] then
--         NFS.load(SMODS.current_mod.path .. 'localizations.lua')(MOD_ID, G.SETTINGS.language)
--     end
--     init_localization()

--     return result
-- end

-- init_localization()
-- NFS.load(SMODS.current_mod.path .. 'localizations.lua')(MOD_ID, 'en-us')

-- NFS.load(SMODS.current_mod.path .. 'api/misc_functions.lua')()
-- NFS.load(SMODS.current_mod.path .. 'api/Card.lua')()

-- if supported_languages[G.SETTINGS.language] then
--     NFS.load(SMODS.current_mod.path .. 'localizations.lua')(MOD_ID, G.SETTINGS.language)
-- end

-- NFS.load(SMODS.current_mod.path .. 'jokers.lua')()

-- -- NFS.load(SMODS.current_mod.path .. 'ranks/joker.lua')()

-- -- NFS.load(SMODS.current_mod.path .. 'seals/ranked_2.lua')(MOD_ID)
-- ----#### CHALLENGES ####----
-- NFS.load(SMODS.current_mod.path .. "challenges/" .. "experiment.lua")(MOD_ID)
-- -- NFS.load(SMODS.current_mod.path .. "challenges/" .. "prime.lua")(MOD_ID)
-- -- NFS.load(SMODS.current_mod.path .. "challenges/" .. "math.lua")(MOD_ID)

-- -- SMODS.Seal:new(test, test, test, test, test, test, test, test)

-- ----------------------------------------------
-- ------------MOD CODE END----------------------