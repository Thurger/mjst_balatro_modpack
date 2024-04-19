-- --- STEAMODDED HEADER
-- --- MOD_NAME: Jokers+
-- --- MOD_ID: mjst_mod_jokersplus
-- --- MOD_AUTHOR: [MJST]
-- --- MOD_DESCRIPTION: Jokers+ Mod

-- ----------------------------------------------
-- ------------MOD CODE -------------------------

-- local MOD_ID = "mjst_mod_jokersplus"

-- ----#### REFS ####----
-- local ref_BackApplyToRun = Back.apply_to_run
-- function Back.apply_to_run(arg_56_0)
--     ref_BackApplyToRun(arg_56_0)
--     NFS.load(SMODS.findModByID(MOD_ID).path .. "src/refs/" .. "after_BackApplyToRun.lua")(arg_56_0)
-- end

-- -- local ref_generate_card_ui = generate_card_ui
-- -- function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
-- --     local first_pass = nil
-- --     if not full_UI_table then 
-- --         first_pass = true
-- --         full_UI_table = {
-- --             main = {},
-- --             info = {},
-- --             type = {},
-- --             name = nil,
-- --             badges = badges or {}
-- --         }
-- --     end

-- --     local desc_nodes = (not full_UI_table.name and full_UI_table.main) or full_UI_table.info

-- --     if _c.set == 'Default' and specific_vars then
-- --         if specific_vars.bonus_mult then
-- --             localize{type = 'other', key = 'card_extra_mult', nodes = desc_nodes, vars = {specific_vars.bonus_mult}}
-- --         end
-- --     end

-- --     ref_generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
-- -- end

-- local ref_generate_UIBox_ability_table = Card.generate_UIBox_ability_table
-- function Card:generate_UIBox_ability_table()
--     local card_ui_options = NFS.load(SMODS.findModByID(MOD_ID).path .. "src/ui/" .. "getCardUIOptions.lua")()

--     for i = 1, #card_ui_options do
--         if self.ability.name == (MOD_ID .. '_ability_' .. card_ui_options[i].name) then
--             local card_ui = NFS.load(SMODS.findModByID(MOD_ID).path .. "api/refs/" .. "generate_UIBox_ability_table.lua")(MOD_ID, self, card_ui_options)
--             if card_ui ~= nil then
--                 return generate_card_ui(card_ui._c, card_ui.full_UI_table, card_ui.specific_vars, card_ui.card_type, card_ui.badges, card_ui.hide_desc, card_ui.main_start, card_ui.main_end)
--             end
--             return nil
--         end
--     end
--     return ref_generate_UIBox_ability_table(self)
-- end

-- local ref_set_ability = Card.set_ability
-- function Card:set_ability(center, initial, delay_sprites)
--     ref_set_ability(self, center, initial, delay_sprites)
--     self.ability.perma_mult_bonus = self.ability and self.ability.perma_mult_bonus or 0
-- end

-- ----#### INITIALISATION ####----
-- function SMODS.INIT.mjst_mod_jokersplus()
--     ----#### INIT LOCALIZATION ####----
--     init_localization()

--     ----#### JOKERS ####----
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "spring.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "summer.lua")()
--     NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "autumn.lua")(MOD_ID)
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "winter.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "lilac.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "roses.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "sunflowers.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "tulips.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "enterthetribe.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "prime.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "proudjoker.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "texts.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "umbrella.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "ai.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "magnifyingglass.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "thecow.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "gcu.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "patch.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/jokers/" .. "devourer.lua")()

--     ----#### DECKS ####----
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/decks/" .. "everestsouvenirdeck.lua")()

--     ----#### CHALLENGES ####----
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/challenges/" .. "experiment.lua")()
--     -- NFS.load(SMODS.findModByID(MOD_ID).path .. "src/challenges/" .. "math.lua")()

--     SMODS.LOAD_LOC()
--     SMODS.SAVE_UNLOCKS()
-- end
-- ----------------------------------------------
-- ------------MOD CODE END----------------------