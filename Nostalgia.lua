-- Nostalgia.lua
local addonName, addonTable = ...

-- Initialize AceAddon
local Nostalgia = LibStub("AceAddon-3.0"):NewAddon("Nostalgia", "AceConsole-3.0", "AceEvent-3.0")

-- Default settings
local defaults = {
    profile = {
        achievement = true,
        bossKill = true,
        rareNPC = true,
        pvpEvent = true,
        levelUp = true,
        tradeComplete = true
    }
}

-- Function to display a message in the chat
local function ShowScreenshotMessage(message)
    DEFAULT_CHAT_FRAME:AddMessage(message, 1.0, 1.0, 0.0)
end

-- Function to take a screenshot and show a message
local function TakeScreenshotAndShowMessage()
    Screenshot() -- Capture the screenshot
    ShowScreenshotMessage("Screenshot Taken!")
end

-- Register events and handlers
function Nostalgia:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("NostalgiaDB", defaults, true)

    -- Slash command
    self:RegisterChatCommand(
        "nostalgia",
        function()
            TakeScreenshotAndShowMessage()
        end
    )

    -- Event listeners
    self:RegisterEvent(
        "ACHIEVEMENT_EARNED",
        function()
            if self.db.profile.achievement then
                TakeScreenshotAndShowMessage()
            end
        end
    )
    self:RegisterEvent(
        "PLAYER_LEVEL_UP",
        function()
            if self.db.profile.levelUp then
                TakeScreenshotAndShowMessage()
            end
        end
    )
    self:RegisterEvent(
        "TRADE_SHOW",
        function()
            if self.db.profile.tradeComplete then
                TakeScreenshotAndShowMessage()
            end
        end
    )

    -- Combat log event for boss kills, rare NPCs, and PvP
    self:RegisterEvent(
        "COMBAT_LOG_EVENT_UNFILTERED",
        function()
            local _, subEvent, _, _, _, _, _, destGUID = CombatLogGetCurrentEventInfo()
            if subEvent == "UNIT_DIED" and IsEncounterInProgress() and self.db.profile.bossKill then
                TakeScreenshotAndShowMessage()
            elseif subEvent == "RARE_KILL" and self.db.profile.rareNPC then
                TakeScreenshotAndShowMessage()
            elseif subEvent == "PARTY_KILL" and self.db.profile.pvpEvent then
                TakeScreenshotAndShowMessage()
            end
        end
    )
end

-- Include the options module
Nostalgia:RegisterEvent(
    "PLAYER_LOGIN",
    function()
        if not Nostalgia.optionsLoaded then
            -- Load options from NostalgiaOptions.lua
            Nostalgia:LoadOptions()
            Nostalgia.optionsLoaded = true
        end
    end
)

function Nostalgia:LoadOptions()
    -- This function will not call SetupOptions
end
