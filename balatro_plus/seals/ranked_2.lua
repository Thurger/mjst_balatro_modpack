local MOD_ID = ...

local SEAL_NAME = "ranked_2"


local seal = {
    name = 's_' .. MOD_ID .. "_" .. SEAL_NAME,
    key = 's_' .. MOD_ID .. "_" .. SEAL_NAME,
    order = 1,
    label = "Ranked 2",
    full_name = 's_' .. MOD_ID .. "_" .. SEAL_NAME,
    pos = {x = 0, y = 0},
    -- loc_txt = localization,
    loc_txt = G.localization.descriptions.Other.s_mjst_mod_balatro_plus_ranked_2,
    atlas = nil,
    discovered = true,
    color = "CD2423"
}

local sprite = {
    name = seal.name,
    top_lpath = SMODS.findModByID(MOD_ID).path,
    path = seal.name  .. ".png",
    px = 71,
    py = 95,
    type = "asset_atli"
}

local function calculate(self, context)
    if context.discard then
        if self.seal == 's_' .. MOD_ID .. '_' .. SEAL_NAME then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.0,
                func = (function()
                    if not G.GAME.round_resets.temp_handsize then
                        G.GAME.round_resets.temp_handsize = 0
                    end

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand.config.real_card_limit = (G.hand.config.real_card_limit or G.hand.config.card_limit) +
                                1
                            G.hand.config.card_limit = math.max(0, G.hand.config.real_card_limit)
                            check_for_unlock({ type = 'min_hand_size' })
                            return true
                        end
                    }))
                    G.GAME.round_resets.temp_handsize = G.GAME.round_resets.temp_handsize + 1
                    return true
                end)
            }))
        end
    end
end

NFS.load(SMODS.findModByID(MOD_ID).path .. 'api/seal/register.lua')(MOD_ID, seal, sprite)

-- SMODS.Seal:new(
--     seal.name,
--     seal.label,
--     seal.full_name,
--     seal.pos,
--     seal.loc_txt,
--     seal.atlas,
--     seal.discovered,
--     seal.color
-- ):register()

-- SMODS.Sprite:new(
--     sprite.name,
--     sprite.top_lpath,
--     sprite.path,
--     sprite.px,
--     sprite.py,
--     sprite.type
-- ):register()

return calculate
