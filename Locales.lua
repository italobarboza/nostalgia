local locale = GetLocale()

if locale == "ptBR" then
    -- Load Portuguese
    LibStub("AceLocale-3.0"):GetLocale("Nostalgia", "ptBR")
elseif locale == "zhTW" then
    LibStub("AceLocale-3.0"):GetLocale("Nostalgia", "zhTW")
elseif locale == "zhCN" then
    LibStub("AceLocale-3.0"):GetLocale("Nostalgia", "zhCN")
else
    -- Default to English
    LibStub("AceLocale-3.0"):GetLocale("Nostalgia", "enUS")
end
