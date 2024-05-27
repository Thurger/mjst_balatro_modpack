local ref_generate_card_ui = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
    local info_queue = {}

    -- sendInfoMessage(NFS.load(SMODS.current_mod.path .. "debug/dump.lua")(specific_vars))
    if (_c.set == 'Default' or _c.set == 'Enhanced') and specific_vars and specific_vars.mult and specific_vars.mult > 0 then
        if not full_UI_table then
            full_UI_table = {
                main = {},
                info = {},
                type = {},
                name = nil,
                badges = badges or {}
            }
        end

        local desc_nodes = (not full_UI_table.name and full_UI_table.main) or full_UI_table.info
        local result = ref_generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
        if specific_vars.mult ~= nil then
            localize{type = 'other', key = 'card_extra_chips', nodes = desc_nodes, vars = {specific_vars.mult}}
        end

        if not (_c.set == 'Edition') and badges then
            for k, v in ipairs(badges) do
                if v == 'foil' then info_queue[#info_queue+1] = G.P_CENTERS['e_foil'] end
                if v == 'holographic' then info_queue[#info_queue+1] = G.P_CENTERS['e_holo'] end
                if v == 'polychrome' then info_queue[#info_queue+1] = G.P_CENTERS['e_polychrome'] end
                if v == 'negative' then info_queue[#info_queue+1] = G.P_CENTERS['e_negative'] end
                if v == 'negative_consumable' then info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}} end
                if v == 'gold_seal' then info_queue[#info_queue+1] = {key = 'gold_seal', set = 'Other'} end
                if v == 'blue_seal' then info_queue[#info_queue+1] = {key = 'blue_seal', set = 'Other'} end
                if v == 'red_seal' then info_queue[#info_queue+1] = {key = 'red_seal', set = 'Other'} end
                if v == 'purple_seal' then info_queue[#info_queue+1] = {key = 'purple_seal', set = 'Other'} end
                if v == 'eternal' then info_queue[#info_queue+1] = {key = 'eternal', set = 'Other'} end
                if v == 'perishable' then info_queue[#info_queue+1] = {key = 'perishable', set = 'Other', vars = {G.GAME.perishable_rounds or 1, specific_vars.perish_tally or G.GAME.perishable_rounds}} end
                if v == 'rental' then info_queue[#info_queue+1] = {key = 'rental', set = 'Other', vars = {G.GAME.rental_rate or 1}} end
                if v == 'pinned_left' then info_queue[#info_queue+1] = {key = 'pinned_left', set = 'Other'} end
            end
        end

        for _, v in ipairs(info_queue) do
            generate_card_ui(v, full_UI_table)
        end

        return result
    end

    local result = ref_generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
    return result
end

local ref_generate_UIBox_ability_table = Card.generate_UIBox_ability_table
function Card:generate_UIBox_ability_table()
    local card_type, hide_desc = self.ability.set or "None", nil
    local main_start, main_end = nil, nil
    local loc_vars = nil
    local badges = {}

    ---- Handle Badges and Stickers ----
    if (card_type ~= 'Locked' and card_type ~= 'Undiscovered' and card_type ~= 'Default') or self.debuff then
        badges.card_type = card_type
    end
    if self.ability.set == 'Joker' and self.bypass_discovery_ui and (not no_badge) then
        badges.force_rarity = true
    end
    if self.edition then
        if self.edition.type == 'negative' and self.ability.consumeable then
            badges[#badges + 1] = 'negative_consumable'
        else
            badges[#badges + 1] = (self.edition.type == 'holo' and 'holographic' or self.edition.type)
        end
    end
    if self.seal then badges[#badges + 1] = string.lower(self.seal)..'_seal' end
    if self.ability.eternal then badges[#badges + 1] = 'eternal' end
    if self.ability.perishable then
        loc_vars = loc_vars or {}; loc_vars.perish_tally=self.ability.perish_tally
        badges[#badges + 1] = 'perishable'
    end
    if self.ability.rental then badges[#badges + 1] = 'rental' end
    if self.pinned then badges[#badges + 1] = 'pinned_left' end

    if self.sticker then loc_vars = loc_vars or {}; loc_vars.sticker=self.sticker end
    ---- END Handle Badges and Stickers ----

    if not self.bypass_lock and self.config.center.unlocked ~= false and
    (self.ability.set == 'Joker' or self.ability.set == 'Edition' or self.ability.consumeable or self.ability.set == 'Voucher' or self.ability.set == 'Booster') and
    not self.config.center.discovered and
    ((self.area ~= G.jokers and self.area ~= G.consumeables and self.area) or not self.area) then
        card_type = 'Undiscovered'
    end
    if self.config.center.unlocked == false and not self.bypass_lock then --For everyting that is locked
        card_type = "Locked"
        if self.area and self.area == G.shop_demo then loc_vars = {}; no_badge = true end
    elseif card_type == 'Undiscovered' and not self.bypass_discovery_ui then -- Any Joker or tarot/planet/voucher that is not yet discovered
        hide_desc = true
    elseif self.debuff then
        loc_vars = { debuffed = true, playing_card = not not self.base.colour, value = self.base.value, suit = self.base.suit, colour = self.base.colour }
    elseif card_type == 'Default' or card_type == 'Enhanced' then
        loc_vars = {
            playing_card = not not self.base.colour,
            value = self.base.value,
            suit = self.base.suit,
            colour = self.base.colour,
            nominal_chips = self.base.nominal > 0 and self.base.nominal or nil,
            bonus_chips = (self.ability.bonus + (self.ability.perma_bonus or 0)) > 0 and (self.ability.bonus + (self.ability.perma_bonus or 0)) or nil,
            mult = self.ability.mult > 0 and self.ability.mult or nil,
            ability = self.ability or nil
        }
        if self.ability.rarity ~= nil then
            -- badges[#badges+1] = create_badge(({localize('k_common'), localize('k_uncommon'), localize('k_rare'), localize('k_legendary')})[self.ability.rarity + 1], G.C.RARITY[self.ability.rarity + 1], nil, 1.2)
            -- badges[#badges+1] = create_badge("TEST", G.C.BLUE, nil, 4)
        end
        return generate_card_ui(self.config.center, nil, loc_vars, card_type, badges, hide_desc, main_start, main_end)
    end
    return ref_generate_UIBox_ability_table(self)
end

local g_uidef_card_h_popup_ref = G.UIDEF.card_h_popup
function G.UIDEF.card_h_popup(card)
    local t = g_uidef_card_h_popup_ref(card)

    -- if not card.config.center or -- no center
    -- (card.config.center.unlocked == false and not card.bypass_lock) or -- locked card
    -- card.debuff or -- debuffed card
    -- (not card.config.center.discovered and ((card.area ~= G.jokers and card.area ~= G.consumeables and card.area) or not card.area)) -- undiscovered card
    -- then return t end

    -- sendInfoMessage(NFS.load(SMODS.current_mod.path .. "debug/dump.lua")(t.nodes[1].nodes[1].nodes[1].nodes[3]))
    -- t.nodes[1].nodes[1].nodes[1].nodes[3] = t.nodes[1].nodes[1].nodes[1].nodes[3] or {}
    -- if card and card.ability and card.ability.rarity then
        -- t.nodes[1].nodes[1].nodes[1].nodes[3][#t.nodes[1].nodes[1].nodes[1].nodes[3] + 1] = create_badge("TEST", G.C.BLUE, nil, 4)
    -- end
    -- local key = card.config.center.key
    -- local center_obj = G.P_CENTERS[key]
    -- if center_obj then
    --     if not G.SETTINGS.no_mod_tracking then
    --         local mod_name = SMODS.current_mod.name
    --         local len = string.len(mod_name)
    --         -- t.nodes[1].nodes[1].nodes[1].nodes[3][#t.nodes[1].nodes[1].nodes[1].nodes[3] + 1] = create_badge(mod_name, center_obj.badge_colour or G.C.UI.BACKGROUND_INACTIVE, nil,
    --         --     len <= 6 and 0.9 or 0.9 - 0.02 * (len - 6))
    --     end
    -- end
    -- t.nodes[1].nodes[1].nodes[1].nodes[3][#t.nodes[1].nodes[1].nodes[1].nodes[3] + 1] = create_badge("TEST", G.C.BLUE, nil, 4)
    return t
end