local MOD_ID, self, card_ui_options = ...

local card_type, hide_desc = self.ability.set or "None", nil
local loc_vars = {}
local main_start, main_end = nil,nil
local no_badge = nil

-- Set 'Undiscovered' card_type
if not self.bypass_lock
    and self.config.center.unlocked ~= false
    and (
        self.ability.set == 'Joker'
        or self.ability.set == 'Edition'
        or self.ability.consumeable
        or self.ability.set == 'Voucher'
        or self.ability.set == 'Booster'
    )
    and not self.config.center.discovered
    and (
        (
            self.area ~= G.jokers
            and self.area ~= G.consumeables
            and self.area
        )
        or not self.area
    ) then card_type = 'Undiscovered'
end

-- Set 'Locked' card_type
if self.config.center.unlocked == false
    and not self.bypass_lock 
    then
    card_type = "Locked"
    if self.area
        and self.area == G.shop_demo
        then loc_vars = {}; no_badge = true
    end
elseif
    card_type == 'Undiscovered'
    and not self.bypass_discovery_ui
    then
    hide_desc = true
elseif self.debuff then
    loc_vars = {
        debuffed = true,
        playing_card = not not self.base.colour,
        value = self.base.value,
        suit = self.base.suit,
        colour = self.base.colour
    }
elseif card_type == 'Default' or card_type == 'Enhanced' then
    loc_vars = {
        playing_card = not not self.base.colour,
        value = self.base.value,
        suit = self.base.suit,
        colour = self.base.colour,
        nominal_chips = self.base.nominal > 0 and self.base.nominal or nil,
        bonus_chips = (self.ability.bonus + (self.ability.perma_bonus or 0)) > 0 and (self.ability.bonus + (self.ability.perma_bonus or 0)) or nil,
        bonus_mult = (self.ability.bonus + (self.ability.perma_mult_bonus or 0)) > 0 and (self.ability.bonus + (self.ability.perma_mult_bonus or 0)) or nil,
    }
elseif self.ability.set == 'Joker' then
    if (self.ability.name == ("j_" .. MOD_ID .. '_ability_' .. 'mis_scaled')) then
        local r_mults = {}
        for i = self.ability.extra.min * 10, self.ability.extra.max * 10 do
            r_mults[#r_mults+1] = tostring(i / 10)
        end
        local loc_mult = ' '..(localize('k_mult'))..' '
        main_start = {
            {
                n = G.UIT.T,
                config = {
                    text = '  X',
                    colour = G.C.MULT,
                    scale = 0.32
                }
            },
            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = r_mults,
                        colours = {G.C.RED},
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.5,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            },
            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = {
                            {
                                string = 'rand()',
                                colour = G.C.JOKER_GREY
                            },
                            {
                                string = "#@"
                                    .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11)
                                    .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1,1) or 'D'),
                                colour = G.C.RED
                            },
                            loc_mult,
                            loc_mult,
                            loc_mult,
                            loc_mult,
                            loc_mult,
                            loc_mult,
                            loc_mult,
                            loc_mult,
                            loc_mult,
                            loc_mult,
                            loc_mult,
                            loc_mult,
                            loc_mult
                        },
                        colours = {
                            G.C.UI.TEXT_DARK
                        },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            }
        }
    else
        for i = 1, #card_ui_options do
            if self.ability.name == ("j_" .. MOD_ID .. '_ability_' .. card_ui_options[i].name) then
                for j = 1, #card_ui_options[i].config do
                    table.insert(loc_vars, self.ability.extra[card_ui_options[i].config[j]])
                end
            end
        end
    end
end

local badges = {}
if (card_type ~= 'Locked' and card_type ~= 'Undiscovered' and card_type ~= 'Default') or self.debuff then
    badges.card_type = card_type
end

if self.ability.set == 'Joker' and self.bypass_discovery_ui then
    badges.force_rarity = true
end

if self.edition then
    if self.edition.type == 'negative' and self.ability.consumeable then
        badges[#badges + 1] = 'negative_consumable'
    else
        badges[#badges + 1] = (self.edition.type == 'holo' and 'holographic' or self.edition.type)
    end
end

if self.seal then badges[#badges + 1] = string.lower(self.seal) .. '_seal' end
if self.ability.eternal then badges[#badges + 1] = 'eternal' end
if self.ability.perishable then
    loc_vars = loc_vars or {}; loc_vars.perish_tally=self.ability.perish_tally
    badges[#badges + 1] = 'perishable'
end
if self.ability.rental then badges[#badges + 1] = 'rental' end
if self.pinned then badges[#badges + 1] = 'pinned_left' end

if self.sticker then
    loc_vars = loc_vars or {}; loc_vars.sticker = self.sticker
end

for i = 1, #card_ui_options do
    if self.ability.name == ("j_" .. MOD_ID .. '_ability_' .. card_ui_options[i].name) then
        return {
            _c = self.config.center,
            full_UI_table = nil,
            specific_vars = loc_vars,
            card_type = card_type,
            badges = badges,
            hide_desc = hide_desc,
            main_start = main_start,
            main_end = main_end
        }
    end
end

return nil