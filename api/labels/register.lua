function Register(MOD_ID, name)
    if SMODS.MJSTAPI.Labels[MOD_ID] == nil or type(SMODS.MJSTAPI.Labels[MOD_ID]) ~= "table" then SMODS.MJSTAPI.Labels[MOD_ID] = {} end
    SMODS.MJSTAPI.Labels[MOD_ID][name] = MOD_ID .. "_" .. name
end

return Register