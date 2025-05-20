-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)
local select = _G.select
local string = _G.string
local format = string.format

-- WoW

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local addonname = ...
local AtlasLoot = _G.AtlasLoot
if AtlasLoot:GameVersion_LT(AtlasLoot.MOP_VERSION_NUM) then return end

--##START-DATA##
local SOURCE_DATA = {
    ["AtlasLootIDs"] = {
        "Temple of the Jade Serpent",
    },
    ["ItemData"] = {
        [80862] = {1,1,1},
        },
}

--##END-DATA##
AtlasLoot.Addons:GetAddon("Sources"):SetData(SOURCE_DATA)
