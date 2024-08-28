-- Nostalgia.lua
local addonName, addonTable = ...

-- Initialize AceAddon
local Nostalgia = LibStub("AceAddon-3.0"):NewAddon("Nostalgia", "AceConsole-3.0", "AceEvent-3.0")

-- Default settings
local defaults = {
    profile = {
        personalAchievement = true,
        guildAchievement = true,
        bossKill = true,
        pvpEvent = true,
        levelUp = true
    }
}

-- Function to display a message in the chat
local function ShowScreenshotMessage(message)
    DEFAULT_CHAT_FRAME:AddMessage(message, 1.0, 1.0, 0.0)
end

-- Function to take a screenshot and show a message with event origin
local function TakeScreenshotAndShowMessage(eventType)
    Screenshot() -- Capture the screenshot
    ShowScreenshotMessage("Screenshot taken: " .. eventType)
end

-- Function to check if the player is in a battleground or arena
local function IsInPvPInstance()
    local inInstance, instanceType = IsInInstance()
    return inInstance and (instanceType == "pvp" or instanceType == "arena")
end

-- Register events and handlers
function Nostalgia:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("NostalgiaDB", defaults, true)

    -- Slash command
    self:RegisterChatCommand(
        "nostalgia",
        function()
            TakeScreenshotAndShowMessage(L["Manual command"])
        end
    )

    -- Event listeners
    self:RegisterEvent(
        "ACHIEVEMENT_EARNED",
        function(_, achievementID)
            local isGuildAchievement = select(12, GetAchievementInfo(achievementID))
            if isGuildAchievement then
                if Nostalgia.db.profile.guildAchievement then
                    TakeScreenshotAndShowMessage(L["Guild Achievement earned"])
                end
            else
                if Nostalgia.db.profile.personalAchievement then
                    TakeScreenshotAndShowMessage(L["Personal Achievement earned"])
                end
            end
        end
    )

    self:RegisterEvent(
        "PLAYER_LEVEL_UP",
        function()
            if self.db.profile.levelUp then
                TakeScreenshotAndShowMessage(L["Level up"])
            end
        end
    )

    -- Event listener for boss kills using ENCOUNTER_END
    self:RegisterEvent(
        "ENCOUNTER_END",
        function(_, encounterID, encounterName, difficultyID, raidSize, endStatus)
            if self.db.profile.bossKill and endStatus == 1 then
                TakeScreenshotAndShowMessage(L["Boss killed: "] .. encounterName)
            end
        end
    )

    -- Combat log event for PvP
    self:RegisterEvent(
        "COMBAT_LOG_EVENT_UNFILTERED",
        function()
            local _, subEvent, _, _, _, _, _, destGUID, destName = CombatLogGetCurrentEventInfo()
            local eventType = nil

            -- PvP event detection (e.g., Battleground or Arena victory)
            if subEvent == "PARTY_KILL" then
                if IsInPvPInstance() and self.db.profile.pvpEvent then
                    eventType = L["PvP event victory"]
                end
            end

            -- If any event was detected, take a screenshot
            if eventType then
                TakeScreenshotAndShowMessage(eventType)
            end
        end
    )
end
