-- Card.__index = Card
-- Card.labels = {}
-- SMODS.Joker.labels = {}
-- G.P_CENTERS.c_base.labels = {}

-- function Card:add_label(label)
--     if (self.labels == nil or type(self.labels) ~= "table") then self.labels = {} end
--     table.insert(self.labels, label)
-- end

-- local card_save_ref = Card.save
-- function Card:save()
--     local cardTable = card_save_ref(self)
--     cardTable.labels = {}
--     return cardTable
-- end

-- function Card:get_labels()
--     return self.labels
-- end

-- local card_load_ref = Card.load
-- function Card:load(cardTable, other_card)
--     card_load_ref(self, cardTable, other_card)
--     self.labels = cardTable.labels
-- end

-- local smods_joker_new_ref = SMODS.Joker.new
-- function SMODS.Joker:new(name, slug, config, spritePos, loc_txt, rarity, cost, unlocked, discovered, blueprint_compat, eternal_compat, effect, atlas, soul_pos, labels)
--     local o = {}
--     setmetatable(o, self)
--     self.__index = self

--     o.loc_txt = loc_txt
--     o.name = name
--     o.slug = "j_" .. slug
--     o.config = config or {}
--     o.pos = spritePos or {
--         x = 0,
--         y = 0
--     }
--     o.soul_pos = soul_pos
--     o.rarity = rarity or 1
--     o.cost = cost
--     o.unlocked = (unlocked == nil) and true or unlocked
--     o.discovered = (discovered == nil) and true or discovered
--     o.blueprint_compat = blueprint_compat or false
--     o.eternal_compat = (eternal_compat == nil) and true or eternal_compat
--     o.effect = effect or ''
--     o.atlas = atlas or nil
--     o.mod_name = SMODS._MOD_NAME
--     o.badge_colour = SMODS._BADGE_COLOUR
--     o.labels = labels
--     return o
-- end

-- local card_set_ability_ref = Card.set_ability
-- function Card:set_ability(center, initial, delay_sprites)
--     card_set_ability_ref(self, center, initial, delay_sprites)
--     self.ability.labels = center.config.labels
-- end