local locale = GetLocale()

if locale == "ptBR" then
    -- Load Portuguese
    LibStub("AceLocale-3.0"):GetLocale("Nostalgia", "ptBR")
else
    -- Default to English
    LibStub("AceLocale-3.0"):GetLocale("Nostalgia", "enUS")
end
