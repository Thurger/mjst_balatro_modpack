local MOD_ID = ...

if not MOD_ID or not SMODS then return 84 end

NFS.load(SMODS.findModByID(MOD_ID).path .. 'jokers/' .. 'autumn.lua')(MOD_ID)
NFS.load(SMODS.findModByID(MOD_ID).path .. 'jokers/' .. 'prime.lua')(MOD_ID)
NFS.load(SMODS.findModByID(MOD_ID).path .. 'jokers/' .. 'patch.lua')(MOD_ID)