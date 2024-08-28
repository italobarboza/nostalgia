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
                personalAchievement = {
                    type = "toggle",
                    name = L["Take Screenshot on Personal Achievements"],
                    desc = L["Enable or disable taking screenshots when you earn a personal achievement."],
                    get = function(info)
                        return Nostalgia.db.profile.personalAchievement
                    end,
                    set = function(info, value)
                        Nostalgia.db.profile.personalAchievement = value
                    end,
                    width = "full",
                    order = 1
                },
                guildAchievement = {
                    type = "toggle",
                    name = L["Take Screenshot on Guild Achievements"],
                    desc = L["Enable or disable taking screenshots when your guild earns an achievement."],
                    get = function(info)
                        return Nostalgia.db.profile.guildAchievement
                    end,
                    set = function(info, value)
                        Nostalgia.db.profile.guildAchievement = value
                    end,
                    width = "full",
                    order = 2
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
                    order = 5,
                    width = "full"
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
