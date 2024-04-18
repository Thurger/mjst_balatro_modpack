local MOD_ID = "mjst_mod"

local arg_56_0 = ...

if arg_56_0.effect.config.config_mjst_mod_upgradeplayedcard then
    G.E_MANAGER:add_event(Event({
        func = function()
            -- Loop over all cards
            for i = #G.playing_cards, 1, -1 do
                -- Remove non prime cards
                if not NFS.load(SMODS.findModByID(MOD_ID).path .. "src/utils/" .. "isPrime.lua")(G.playing_cards[i]:get_id()) then
                    G.playing_cards[i]:start_dissolve(nil, true)
                end
            end

            -- Return
            G.GAME.starting_deck_size = 20
            return true
        end
    }))
end

if arg_56_0.effect.config.config_mjst_mod_downgradediscardedcard then
    G.E_MANAGER:add_event(Event({
        func = function()
            -- Loop over all cards
            for i = #G.playing_cards, 1, -1 do
                -- Remove odd cards
                if not NFS.load(SMODS.findModByID(MOD_ID).path .. "src/utils/" .. "isEven.lua")(G.playing_cards[i]:get_id()) then
                    G.playing_cards[i]:start_dissolve(nil, true)
                end
            end

            -- Return
            G.GAME.starting_deck_size = 20
            return true
        end
    }))
end