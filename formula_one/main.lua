--- STEAMODDED HEADER
--- MOD_NAME: Formula 1
--- MOD_ID: mjst_mod_formula_one
--- MOD_AUTHOR: [MJST]
--- MOD_DESCRIPTION: Formula 1
--- BADGE_COLOUR: EF1711

----------------------------------------------
------------MOD CODE -------------------------

local MOD_ID = "mjst_mod_formula_one"

function create_UIBox_your_collection_enhancements(exit)
    local deck_tables = {}

    G.your_collection = {}
    for j = 1, 2 do
        G.your_collection[j] = CardArea(
            G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
            4.25*G.CARD_W,
            1.03*G.CARD_H, 
            {card_limit = 8, type = 'title', highlight_limit = 0})
        table.insert(deck_tables, 
        {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes={
            {n=G.UIT.O, config={object = G.your_collection[j]}}
        }}
        )
    end

    for i = 1, 8 do
        for j = 1, #G.your_collection do
            local center = G.P_CENTER_POOLS["Enhanced"][i+(j-1)*8]
            if center then
                local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, center)
                G.your_collection[j]:emplace(card)
            end
        end
    end

    local t = create_UIBox_generic_options({ infotip = localize('ml_edition_seal_enhancement_explanation'), back_func = exit or 'your_collection', snap_back = true, contents = {
            {n=G.UIT.R, config={align = "cm", minw = 2.5, padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables},
        }})
    return t
end

local ref_card_set_ability = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    local old_ability = self.ability
    ref_card_set_ability(self, center, initial, delay_sprites)
    if old_ability and old_ability.mjst_mod_formula_one_perma_x_mult then
        self.ability.mjst_mod_formula_one_perma_x_mult = old_ability.mjst_mod_formula_one_perma_x_mult
    end
end

local ref_generate_card_ui = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
    local customCard = false
    if _c.effect == (MOD_ID .. '_effect_' .. "raced") or _c.name == (MOD_ID .. '_' .. "raced") then
        customCard = true
    end
    if not customCard then return ref_generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end) end
    -- if (_c.set == 'Default' or _c.set == 'Enhanced') and specific_vars and specific_vars.mjst_mod_formula_one_perma_x_mult then
    --     if not full_UI_table then
    --         full_UI_table = {
    --             main = {},
    --             info = {},
    --             type = {},
    --             name = nil,
    --             badges = badges or {}
    --         }
    --     end

    --     local desc_nodes = (not full_UI_table.name and full_UI_table.main) or full_UI_table.info
    --     local result = ref_generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
    --     if specific_vars.mjst_mod_formula_one_perma_x_mult ~= nil then
    --         localize{type = 'other', key = 'mjst_mod_formula_one_perma_x_mult', nodes = desc_nodes, vars = {specific_vars.mjst_mod_formula_one_perma_x_mult}}
    --     end

    --     local info_queue = {}
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
    --         end
    --     end
    --     for _, v in ipairs(info_queue) do
    --         generate_card_ui(v, full_UI_table)
    --     end

    --     return result
    -- end

    local first_pass = nil
    if not full_UI_table then 
        first_pass = true
        full_UI_table = {
            main = {},
            info = {},
            type = {},
            name = nil,
            badges = badges or {}
        }
    end

    local desc_nodes = (not full_UI_table.name and full_UI_table.main) or full_UI_table.info
    local name_override = nil
    local info_queue = {}

    if full_UI_table.name then
        full_UI_table.info[#full_UI_table.info+1] = {}
        desc_nodes = full_UI_table.info[#full_UI_table.info]
    end

    if not full_UI_table.name then
        if specific_vars and specific_vars.no_name then
            full_UI_table.name = true
        elseif card_type == 'Locked' then
            full_UI_table.name = localize{type = 'name', set = 'Other', key = 'locked', nodes = {}}
        elseif card_type == 'Undiscovered' then 
            full_UI_table.name = localize{type = 'name', set = 'Other', key = 'undiscovered_'..(string.lower(_c.set)), name_nodes = {}}
        elseif specific_vars and (card_type == 'Default' or card_type == 'Enhanced') then
            if (_c.name == 'Stone Card') then full_UI_table.name = true end
            if (specific_vars.playing_card and (_c.name ~= 'Stone Card')) then
                full_UI_table.name = {}
                localize{type = 'other', key = 'playing_card', set = 'Other', nodes = full_UI_table.name, vars = {localize(specific_vars.value, 'ranks'), localize(specific_vars.suit, 'suits_plural'), colours = {specific_vars.colour}}}
                full_UI_table.name = full_UI_table.name[1]
            end
        elseif card_type == 'Booster' then
        else
            full_UI_table.name = localize{type = 'name', set = _c.set, key = _c.key, nodes = full_UI_table.name}
        end
        full_UI_table.card_type = card_type or _c.set
    end

    local loc_vars = {}
    if main_start then 
        desc_nodes[#desc_nodes+1] = main_start
    end

    if _c.set == 'Other' then
        localize{type = 'other', key = _c.key, nodes = desc_nodes, vars = specific_vars}
    elseif card_type == 'Locked' then
    elseif hide_desc then
        localize{type = 'other', key = 'undiscovered_'..(string.lower(_c.set)), set = _c.set, nodes = desc_nodes}
    elseif specific_vars and specific_vars.debuffed then
        localize{type = 'other', key = 'debuffed_'..(specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes}
    elseif _c.set == 'Joker' then
    elseif _c.set == 'Tag' then
    elseif _c.set == 'Voucher' then
    elseif _c.set == 'Edition' then
        loc_vars = {_c.config.extra}
        localize{type = 'descriptions', key = _c.key, set = _c.set, nodes = desc_nodes, vars = loc_vars}
    elseif _c.set == 'Default' and specific_vars then 
        if specific_vars.nominal_chips then 
            localize{type = 'other', key = 'card_chips', nodes = desc_nodes, vars = {specific_vars.nominal_chips}}
        end
        if specific_vars.bonus_chips then
            localize{type = 'other', key = 'card_extra_chips', nodes = desc_nodes, vars = {specific_vars.bonus_chips}}
        end
        if specific_vars.mjst_mod_formula_one_perma_x_mult then
            localize{type = 'other', key = 'mjst_mod_formula_one_perma_x_mult', nodes = desc_nodes, vars = {specific_vars.mjst_mod_formula_one_perma_x_mult}}
        end
    elseif _c.set == 'Enhanced' then 
        if specific_vars and (_c.name ~= 'Stone Card') and specific_vars.nominal_chips then
            localize{type = 'other', key = 'card_chips', nodes = desc_nodes, vars = {specific_vars.nominal_chips}}
        end
        if _c.effect == (MOD_ID .. '_effect_' .. 'raced') and specific_vars.raced_x_mult and specific_vars.raced_value then
            loc_vars = {specific_vars.raced_x_mult, specific_vars.raced_value}
            localize{type = 'descriptions', key = _c.key, set = _c.set, nodes = desc_nodes, vars = loc_vars}
        end
        if (_c.name ~= 'Stone Card') and ((specific_vars and specific_vars.bonus_chips) or _c.config.bonus) then
            localize{type = 'other', key = 'card_extra_chips', nodes = desc_nodes, vars = {((specific_vars and specific_vars.bonus_chips) or _c.config.bonus)}}
        end
    elseif _c.set == 'Booster' then
    elseif _c.set == 'Spectral' then
    elseif _c.set == 'Planet' then
    elseif _c.set == 'Tarot' then
    end

    if main_end then
        desc_nodes[#desc_nodes+1] = main_end
    end

   --Fill all remaining info if this is the main desc
    if not ((specific_vars and not specific_vars.sticker) and (card_type == 'Default' or card_type == 'Enhanced')) then
        if desc_nodes == full_UI_table.main and not full_UI_table.name then
            localize{type = 'name', key = _c.key, set = _c.set, nodes = full_UI_table.name}
            if not full_UI_table.name then full_UI_table.name = {} end
        elseif desc_nodes ~= full_UI_table.main then 
            desc_nodes.name = localize{type = 'name_text', key = name_override or _c.key, set = name_override and 'Other' or _c.set}
        end
    end

    if first_pass and not (_c.set == 'Edition') and badges then
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
            if v == 'pinned_left' then info_queue[#info_queue+1] = {key = 'pinned_left', set = 'Other'} end
        end
    end

    for _, v in ipairs(info_queue) do
        generate_card_ui(v, full_UI_table)
    end

    return full_UI_table
end

local get_chip_x_mult_ref = Card.get_chip_x_mult
function Card:get_chip_x_mult()
    if self.ability.name == MOD_ID .. "_" .. "raced" and not self.debuff then
        local finished_ante = 0
        for _, v in pairs(G.GAME.bosses_used) do
            if v == 1 then finished_ante = finished_ante + 1 end
        end
        if (finished_ante >= 1) then
            finished_ante = finished_ante - 1
        end
        if not self.ability.mjst_mod_formula_one_perma_x_mult then self.ability.mjst_mod_formula_one_perma_x_mult = 0 end
        return 1 + get_chip_x_mult_ref(self) + self.ability.mjst_mod_formula_one_perma_x_mult + (self.ability.extra.x_mult * finished_ante)
    end
    if self.ability.mjst_mod_formula_one_perma_x_mult and not self.debuff then
        return 1 + get_chip_x_mult_ref(self) + self.ability.mjst_mod_formula_one_perma_x_mult
    end
    return get_chip_x_mult_ref(self)
end

local ref_generate_UIBox_ability_table = Card.generate_UIBox_ability_table
function Card:generate_UIBox_ability_table()
    local card_ui_options = NFS.load(SMODS.findModByID(MOD_ID).path .. "api/" .. "getCardUIOptions.lua")()
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

    if self.ability.effect == MOD_ID .. "_effect_" .. "raced" then
        local finished_ante = 0
        for _, v in pairs(G.GAME.bosses_used) do
            if v == 1 then finished_ante = finished_ante + 1 end
        end
        if (finished_ante >= 1) then
            finished_ante = finished_ante - 1
        end
        loc_vars = {raced_x_mult = self.ability.extra.x_mult, raced_value = 1 + (self.ability.extra.x_mult * finished_ante)}
    end
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
            mjst_mod_formula_one_perma_x_mult = self.ability.mjst_mod_formula_one_perma_x_mult or nil,
            raced_x_mult = loc_vars and loc_vars.raced_x_mult or nil,
            raced_value = loc_vars and loc_vars.raced_value or nil,
        }
        return generate_card_ui(self.config.center, nil, loc_vars, card_type, badges, hide_desc, main_start, main_end)
    end
    for i = 1, #card_ui_options do
        if self.ability.name == (MOD_ID .. '_ability_' .. card_ui_options[i].name) then
            local card_ui = NFS.load(SMODS.findModByID(MOD_ID).path .. "api/refs/" .. "generate_UIBox_ability_table.lua")(MOD_ID, self, card_ui_options)
            if card_ui ~= nil then
                return generate_card_ui(card_ui._c, card_ui.full_UI_table, card_ui.specific_vars, card_ui.card_type, card_ui.badges, card_ui.hide_desc, card_ui.main_start, card_ui.main_end)
            end
            return nil
        end
    end
    return ref_generate_UIBox_ability_table(self)
end

local ENHANCEMENT_NAME = "raced"
local tmp_loc = {
    name = "Raced Card",
    label = "Raced",
    text = {
        "{X:mult,C:white}X#1#{} Mult per finished Ante",
        "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
    }
}
local enhancement = {
    key = "m_" .. MOD_ID .. "_" .. ENHANCEMENT_NAME,
    atlas = "m_" .. MOD_ID .. "_" .. ENHANCEMENT_NAME,
    name = MOD_ID .. "_" .. ENHANCEMENT_NAME,
    max = 500,
    set = "Enhanced",
    pos = {x = 0, y = 0},
    effect = MOD_ID .. "_effect_" .. ENHANCEMENT_NAME,
    label = "Raced",
    config = {
        extra = {
            x_mult = 0.1
        },
    }
}

enhancement.order = #G.P_CENTER_POOLS['Enhanced'] + 1
G.P_CENTERS[enhancement.key] = enhancement
table.insert(G.P_CENTER_POOLS['Enhanced'], enhancement)

local Backapply_to_runRef = Back.apply_to_run
function Back.apply_to_run(arg_56_0)
    Backapply_to_runRef(arg_56_0)

    if arg_56_0.effect.config.polyglass then
        G.E_MANAGER:add_event(Event({
            func = function()
                for iter_57_0 = #G.playing_cards, 1, -1 do
                    sendDebugMessage(G.playing_cards[iter_57_0].base.id)

                    G.playing_cards[iter_57_0]:set_ability(G.P_CENTERS.m_mjst_mod_formula_one_raced)
                end

                return true
            end
        }))
    end
end

local loc_def = {
    ["name"]="Absolute Deck",
    ["text"]={
        [1]="Start with a Deck",
        [2]="full of",
        [3]="{C:attention,T:e_polychrome}Poly{}{C:red,T:m_glass}glass{} cards"
    },
}

local absolute = SMODS.Deck:new("Absolute Deck", "absolute", {polyglass = true}, {x = 0, y = 3}, loc_def)
absolute:register()

function SMODS.INIT.mjst_mod_formula_one()
    init_localization()
    G.localization.descriptions['Enhanced']["m_" .. MOD_ID .. "_" .. "raced"] = tmp_loc
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

    SMODS.Sprite:new(
        enhancement.atlas,
        SMODS.findModByID(MOD_ID).path,
        enhancement.atlas .. ".png",
        71,
        95,
        "asset_atli"
    ):register()
end

----------------------------------------------
------------MOD CODE END----------------------