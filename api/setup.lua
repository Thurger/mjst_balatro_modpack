MOD_ID = ...
API_NAME = "MJSTAPI"

_G[API_NAME] = {}

----#### Jokers API ####----
_G[API_NAME].Jokers = {}
_G[API_NAME].Joker = {}
_G[API_NAME].Joker.Register = NFS.load(SMODS.findModByID(MOD_ID).path .. "api/joker/register.lua")()

SMODS[API_NAME] = _G[API_NAME]
return _G[API_NAME]