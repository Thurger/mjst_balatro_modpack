MOD_ID = ...
API_NAME = "MJSTAPI"

_G[API_NAME] = {}

----#### Jokers API ####----
_G[API_NAME].Jokers = {}
_G[API_NAME].Joker = {}
_G[API_NAME].Joker.Register = NFS.load(SMODS.findModByID(MOD_ID).path .. "api/joker/register.lua")()

----#### Tags API ####----
_G[API_NAME].Tags = {}
_G[API_NAME].Tag = {}

----#### Seals API ####----
_G[API_NAME].Seals = {}
_G[API_NAME].Seal = {}

----#### Blinds API ####----
_G[API_NAME].Blinds = {}
_G[API_NAME].Blind = {}

----#### Vouchers API ####----
_G[API_NAME].Vouchers = {}
_G[API_NAME].Voucher = {}

----#### Tarots API ####----
_G[API_NAME].Tarots = {}
_G[API_NAME].Tarot = {}

----#### Planets API ####----
_G[API_NAME].Planets = {}
_G[API_NAME].Planet = {}

----#### Spectrals API ####----
_G[API_NAME].Spectrals = {}
_G[API_NAME].Spectral = {}

----#### Consumables API ####----
_G[API_NAME].Consumables = {}
_G[API_NAME].Consumable = {}

----#### UIs API ####----
_G[API_NAME].UIs = {}
_G[API_NAME].UI = {}

----#### Editions API ####----
_G[API_NAME].Editions = {}
_G[API_NAME].Edition = {}

----#### Enhancements API ####----
_G[API_NAME].Enhancements = {}
_G[API_NAME].Enhancement = {}

----#### Labels API ####----
_G[API_NAME].Labels = {}
_G[API_NAME].Label = {}
_G[API_NAME].Label.Register = NFS.load(SMODS.findModByID(MOD_ID).path .. "api/labels/register.lua")()

----#### Suits API ####----
_G[API_NAME].Suits = {}
_G[API_NAME].Suit = {}

SMODS[API_NAME] = _G[API_NAME]
return _G[API_NAME]