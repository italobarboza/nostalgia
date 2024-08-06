-- NostalgiaOptions.lua
local addonName, addonTable = ...

local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("Nostalgia")

-- Get reference to the main addon
local Nostalgia = LibStub("AceAddon-3.0"):GetAddon("Nostalgia")

-- Define options
local options = {
    type = "group",
    name = "Nostalgia",
    args = {
        generalSettings = {
            type = "group",
            name = L["General Settings"],
            order = 1,
            args = {
                achievement = {
                    type = "toggle",
                    name = L["Take Screenshot on Achievement"],
                    desc = L["Enable or disable taking screenshots when you earn an achievement."],
                    get = function()
                        return Nostalgia.db.profile.achievement
                    end,
                    set = function(_, value)
                        Nostalgia.db.profile.achievement = value
                    end,
                    order = 1,
                    width = "full"
                },
                bossKill = {
                    type = "toggle",
                    name = L["Take Screenshot on Boss Kill"],
                    desc = L["Enable or disable taking screenshots when you kill a boss."],
                    get = function()
                        return Nostalgia.db.profile.bossKill
                    end,
                    set = function(_, value)
                        Nostalgia.db.profile.bossKill = value
                    end,
                    order = 2,
                    width = "full"
                },
                rareNPC = {
                    type = "toggle",
                    name = L["Take Screenshot on Rare NPC Kill"],
                    desc = L["Enable or disable taking screenshots when you kill a rare NPC."],
                    get = function()
                        return Nostalgia.db.profile.rareNPC
                    end,
                    set = function(_, value)
                        Nostalgia.db.profile.rareNPC = value
                    end,
                    order = 3,
                    width = "full"
                },
                pvpEvent = {
                    type = "toggle",
                    name = L["Take Screenshot on PvP Event"],
                    desc = L["Enable or disable taking screenshots during PvP events."],
                    get = function()
                        return Nostalgia.db.profile.pvpEvent
                    end,
                    set = function(_, value)
                        Nostalgia.db.profile.pvpEvent = value
                    end,
                    order = 4,
                    width = "full"
                },
                levelUp = {
                    type = "toggle",
                    name = L["Take Screenshot on Level Up"],
                    desc = L["Enable or disable taking screenshots when you level up."],
                    get = function()
                        return Nostalgia.db.profile.levelUp
                    end,
                    set = function(_, value)
                        Nostalgia.db.profile.levelUp = value
                    end,
                    order = 6,
                    width = "full"
                },
                tradeComplete = {
                    type = "toggle",
                    name = L["Take Screenshot on Trade Complete"],
                    desc = L["Enable or disable taking screenshots when a trade is completed."],
                    get = function()
                        return Nostalgia.db.profile.tradeComplete
                    end,
                    set = function(_, value)
                        Nostalgia.db.profile.tradeComplete = value
                    end,
                    order = 7,
                    width = "full"
                }
            }
        },
        about = {
            type = "group",
            name = L["About"],
            order = 2,
            args = {
                website = {
                    type = "description",
                    name = "Website: |cff5c6887http://doe.com|r",
                    fontSize = "medium",
                    order = 1
                },
                email = {
                    type = "description",
                    name = "Email: |cff5c6887john@doe.com|r",
                    fontSize = "medium",
                    order = 2
                },
                acknowledgements = {
                    type = "description",
                    name = "Acknowledgements: |cff5c6887" .. "Name1, Name2, Name3|r",
                    fontSize = "medium",
                    order = 3
                }
            }
        }
    }
}

-- Register options once
AceConfig:RegisterOptionsTable("Nostalgia", options)
AceConfigDialog:AddToBlizOptions("Nostalgia", "Nostalgia")

-- Load the options into the Blizzard Options panel
local function SetupOptions()
    -- Optionally, you can set additional settings or initialization here
end

SetupOptions()
