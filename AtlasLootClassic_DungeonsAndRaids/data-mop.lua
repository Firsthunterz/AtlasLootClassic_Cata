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
local data = AtlasLoot.ItemDB:Add(addonname, 5, AtlasLoot.MOP_VERSION_NUM)

local AL = AtlasLoot.Locales
local ALIL = AtlasLoot.IngameLocales
local RAIDFINDER_DIFF = data:AddDifficulty("Raid Finder", nil, nil, nil, true)
local NORMAL_DIFF = data:AddDifficulty("NORMAL", nil, nil, nil, true)
local HEROIC_DIFF = data:AddDifficulty("HEROIC", nil, nil, nil, true)
local VENDOR_DIFF = data:AddDifficulty(AL["Vendor"], "vendor", 0)

local NORMAL_ITTYPE = data:AddItemTableType("Item", "Item")
local SET_ITTYPE = data:AddItemTableType("Set", "Item")
local AC_ITTYPE = data:AddItemTableType("Achievement", "Item")

local DUNGEON_CONTENT = data:AddContentType(AL["Dungeons"], ATLASLOOT_DUNGEON_COLOR)
local RAID_CONTENT = data:AddContentType(AL["Raids"], ATLASLOOT_RAID40_COLOR)

-- extra
local CLASS_NAME = AtlasLoot:GetColoredClassNames()

-- name formats
local NAME_COLOR, NAME_COLOR_BOSS = "|cffC0C0C0", "|cffC0C0C0"
local NAME_CAVERNS_OF_TIME = NAME_COLOR..AL["CoT"]..":|r %s" -- Caverns of Time

-- colors
--local BLUE = "|cff6666ff%s|r"
--local GREY = "|cff999999%s|r"
--local GREEN = "|cff66cc33%s|r"
local RED = "|cffcc6666%s|r"
local PURPLE = "|cff9900ff%s|r"
local WHITE = "|cffffffff%s|r"

-- format
local BONUS_LOOT_SPLIT = "%s - %s"


data["Temple of the Jade Serpent"] = {
    MapID = 5956,
    InstanceID = 960,
    ContentType = DUNGEON_CONTENT,
    LevelRange = {85, 85, 90},
    items = {
        { -- Wise Mari
        name = AL["Wise Mari"],
        DisplayIDs = {{41125}},
        [NORMAL_DIFF] = {
            { 1, 80862 },	-- Treads of Corrupted Water
},
},
},
}
