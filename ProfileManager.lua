HMProfileManager = {}

HMDefaultProfiles = {}

HMUserProfiles = {}

local _G = getfenv(0)
setmetatable(HMProfileManager, {__index = getfenv(1)})
setfenv(1, HMProfileManager)

local util = getglobal("HMUtil")

DefaultProfileOrder = {
    "Default", "Default (Short Bar)", "Small", "Very Small", "Very Small (Horizontal)", "Long", "Long (Small)", 
    "Long (Integrated)", "Legacy"
}
DefaultProfileOrder = util.ToSet(DefaultProfileOrder, true)

function GetProfile(name)
    return HMDefaultProfiles[name]
end

function CreateProfile(name, baseName)
    HMDefaultProfiles[name] = HMUIProfile:New(GetProfile(baseName or "Default"))
    return HMDefaultProfiles[name]
end

function InitializeDefaultProfiles()
    HMUIProfile.SetDefaults()

    -- Master base profile
    HMDefaultProfiles["Base"] = HMUIProfile:New()

    do
        local profile = CreateProfile("Long", "Base")
        profile.RaidMarkIcon.AlignmentH = "CENTER"
        profile.RaidMarkIcon.PaddingV = 0
        profile.RaidMarkIcon.OffsetY = 5
        profile.RaidMarkIcon.Width = 14
        profile.RaidMarkIcon.Height = 14

        profile.RoleIcon.AlignmentH = "LEFT"
        profile.RoleIcon.PaddingV = 0
        profile.RoleIcon.OffsetY = 5
        profile.RoleIcon.OffsetX = -5
    end



    do
        local profile = CreateProfile("Long (Small)", "Base")

        profile.Width = 120
        profile.HealthBarHeight = 16
        profile.PowerBarHeight = 8
        profile.PaddingBottom = 16
        profile.AuraTracker.Height = 16
        profile.NameText.FontSize = 10
        profile.NameText.MaxWidth = 80
        local healthTexts = profile.HealthTexts
        healthTexts.Normal.FontSize = 10
        healthTexts.WithMissing.FontSize = 8
        healthTexts.Missing.FontSize = 9
        profile.PowerText.FontSize = 8

        profile.RaidMarkIcon.Width = 12
        profile.RaidMarkIcon.Height = 12
        profile.RaidMarkIcon.AlignmentH = "CENTER"
        profile.RaidMarkIcon.PaddingV = 0
        profile.RaidMarkIcon.OffsetY = 5

        profile.RoleIcon.Width = 12
        profile.RoleIcon.Height = 12
        profile.RoleIcon.AlignmentH = "LEFT"
        profile.RoleIcon.PaddingV = 0
        profile.RoleIcon.OffsetY = 5
        profile.RoleIcon.OffsetX = -4
    end

    do
        local profile = CreateProfile("Long (Integrated)", "Base")

        profile.HealthBarHeight = 35
        profile.PaddingBottom = 0
        profile.AuraTracker.Height = 17
        profile.AuraTracker.Width = 105
        profile.AuraTracker.Anchor = "Health Bar"
        profile.AuraTracker.AlignmentH = "LEFT"
        profile.TrackedAurasAlignment = "BOTTOM"

        profile.NameText.AlignmentV = "TOP"
        local healthTexts = profile.HealthTexts
        healthTexts.Normal.AlignmentV = "TOP"
        healthTexts.WithMissing = util.CloneTable(healthTexts.Normal, true)
        healthTexts.Missing.PaddingV = 4

        profile.RaidMarkIcon.AlignmentH = "CENTER"
        profile.RaidMarkIcon.PaddingV = 0
        profile.RaidMarkIcon.OffsetY = 5
        profile.RaidMarkIcon.Width = 14
        profile.RaidMarkIcon.Height = 14

        profile.RoleIcon.AlignmentH = "LEFT"
        profile.RoleIcon.PaddingV = 0
        profile.RoleIcon.OffsetY = 6
        profile.RoleIcon.OffsetX = -5
    end

    do
        local profile = CreateProfile("Small", "Base")

        profile.Width = 67
        profile.HealthBarHeight = 36
        profile.NameText.FontSize = 11
        profile.NameText.AlignmentH = "CENTER"
        profile.NameText.AlignmentV = "TOP"
        profile.NameText.PaddingV = 1
        profile.NameText.MaxWidth = 47
        profile.PowerBarHeight = 6
        profile.PaddingBottom = 0
        profile.AuraTracker.Height = 12
        profile.AuraTracker.Anchor = "Health Bar"
        profile.AuraTracker.AlignmentH = "LEFT"
        profile.TrackedAurasAlignment = "BOTTOM"
        profile.TrackedAurasSpacing = 1

        local healthTexts = profile.HealthTexts
        healthTexts.Normal.FontSize = 9
        healthTexts.Normal.AlignmentH = "CENTER"
        healthTexts.Normal.AlignmentV = "CENTER"
        healthTexts.Normal.OffsetY = 2
        healthTexts.WithMissing.FontSize = 9
        healthTexts.WithMissing.AlignmentH = "LEFT"
        healthTexts.WithMissing.AlignmentV = "CENTER"
        healthTexts.WithMissing.OffsetY = 2
        healthTexts.Missing.FontSize = 9
        healthTexts.Missing.AlignmentH = "RIGHT"
        healthTexts.Missing.AlignmentV = "CENTER"
        healthTexts.Missing.OffsetY = 2

        profile.IncomingHealDisplay = "Overheal"
        profile.IncomingHealText.AlignmentH = "RIGHT"
        profile.IncomingHealText.AlignmentV = "CENTER"
        profile.IncomingHealText.OffsetY = -6
        profile.IncomingHealText.PaddingH = 2
        profile.IncomingHealText.FontSize = 7

        profile.RangeText.AlignmentV = "CENTER"
        profile.RangeText.OffsetY = -6
        profile.RangeText.FontSize = 8
        profile.LineOfSightIcon.Width = 20
        profile.LineOfSightIcon.Height = 20
        profile.LineOfSightIcon.Anchor = "Health Bar"
        profile.LineOfSightIcon.Opacity = 70
        profile.RoleIcon.Width = 12
        profile.RoleIcon.Height = 12
        profile.RaidMarkIcon.Width = 12
        profile.RaidMarkIcon.Height = 12
        profile.RaidMarkIcon.PaddingV = 0
        profile.HealthDisplay = "Health"
        profile.MissingHealthDisplay = "-Health"
        profile.PowerDisplay = "Hidden"
        profile.PowerText.FontSize = 8
    end

    do
        local profile = CreateProfile("Very Small", "Base")

        profile.Width = 50
        profile.HealthBarHeight = 29
        profile.NameText.FontSize = 9
        profile.NameText.AlignmentH = "LEFT"
        profile.NameText.AlignmentV = "TOP"
        profile.NameText.PaddingV = 1
        profile.NameText.OffsetX = 6
        profile.NameText.MaxWidth = 34
        profile.NameText.Color = "Class"
        profile.PowerBarHeight = 5
        profile.PaddingBottom = 0
        profile.AuraTracker.Height = 11
        profile.AuraTracker.Anchor = "Health Bar"
        profile.AuraTracker.AlignmentH = "LEFT"
        profile.TrackedAurasAlignment = "BOTTOM"
        profile.TrackedAurasSpacing = 1

        local healthTexts = profile.HealthTexts
        healthTexts.Normal.FontSize = 8
        healthTexts.Normal.AlignmentH = "CENTER"
        healthTexts.Normal.AlignmentV = "CENTER"
        healthTexts.Normal.OffsetY = 1

        profile.IncomingHealDisplay = "Hidden"
        profile.IncomingHealText.AlignmentH = "RIGHT"
        profile.IncomingHealText.AlignmentV = "CENTER"
        profile.IncomingHealText.OffsetY = -6
        profile.IncomingHealText.PaddingH = 2
        profile.IncomingHealText.FontSize = 7

        profile.RangeText.AlignmentV = "CENTER"
        profile.RangeText.OffsetY = -6
        profile.RangeText.FontSize = 7
        profile.LineOfSightIcon.Width = 16
        profile.LineOfSightIcon.Height = 16
        profile.LineOfSightIcon.Anchor = "Health Bar"
        profile.LineOfSightIcon.Opacity = 70
        profile.RoleIcon.Width = 10
        profile.RoleIcon.Height = 10
        profile.RaidMarkIcon.AlignmentH = "CENTER"
        profile.RaidMarkIcon.PaddingV = 0
        profile.RaidMarkIcon.OffsetY = 4
        profile.RaidMarkIcon.Width = 10
        profile.RaidMarkIcon.Height = 10
        profile.HealthDisplay = "Health"
        profile.MissingHealthDisplay = "Hidden"
        profile.PowerDisplay = "Hidden"
        profile.PowerText.FontSize = 8
        profile.Orientation = "Vertical"
    end

    do
        local profile = CreateProfile("Very Small (Horizontal)", "Very Small")
        profile.Orientation = "Horizontal"
    end

    do
        local profile = CreateProfile("Default", "Base")

        profile.Width = 100
        profile.HealthBarHeight = 36
        profile.PowerBarHeight = 9
        profile.NameText.FontSize = 11
        profile.NameText.AlignmentH = "CENTER"
        profile.NameText.AlignmentV = "TOP"
        profile.NameText.PaddingV = 1
        profile.NameText.MaxWidth = 80
        profile.PaddingBottom = 0
        profile.AuraTracker.Height = 14
        profile.AuraTracker.Anchor = "Health Bar"
        profile.AuraTracker.AlignmentH = "LEFT"
        profile.TrackedAurasAlignment = "BOTTOM"
        profile.TrackedAurasSpacing = 1

        local healthTexts = profile.HealthTexts
        healthTexts.Normal.FontSize = 11
        healthTexts.Normal.AlignmentH = "CENTER"
        healthTexts.Normal.AlignmentV = "CENTER"
        healthTexts.Normal.OffsetY = 2
        healthTexts.WithMissing.FontSize = 11
        healthTexts.WithMissing.AlignmentH = "CENTER"
        healthTexts.WithMissing.AlignmentV = "CENTER"
        healthTexts.WithMissing.OffsetY = 2
        healthTexts.WithMissing.PaddingH = 8
        healthTexts.Missing.FontSize = 11
        healthTexts.Missing.AlignmentH = "RIGHT"
        healthTexts.Missing.AlignmentV = "CENTER"
        healthTexts.Missing.OffsetY = 2
        healthTexts.Missing.PaddingH = 2
        
        profile.IncomingHealDisplay = "Overheal"
        profile.IncomingHealText.AlignmentH = "LEFT"
        profile.IncomingHealText.AlignmentV = "CENTER"
        profile.IncomingHealText.OffsetY = 2
        profile.IncomingHealText.PaddingH = 2

        profile.RangeText.AlignmentV = "CENTER"
        profile.RangeText.OffsetY = -7
        profile.RangeText.FontSize = 9
        profile.LineOfSightIcon.Width = 20
        profile.LineOfSightIcon.Height = 20
        profile.LineOfSightIcon.Anchor = "Health Bar"
        profile.LineOfSightIcon.Opacity = 80
        profile.HealthDisplay = "Health"
        profile.MissingHealthDisplay = "-Health"
        profile.PowerText.FontSize = 8
        profile.PowerText.AlignmentH = "CENTER"
    end

    do
        local profile = CreateProfile("Default (Short Bar)", "Base")

        profile.Width = 100
        profile.HealthBarHeight = 24
        profile.PowerBarHeight = 9
        profile.NameText.FontSize = 11
        profile.NameText.AlignmentH = "CENTER"
        profile.NameText.AlignmentV = "TOP"
        profile.NameText.PaddingV = 0
        profile.NameText.MaxWidth = 80
        profile.NameText.Anchor = "Container"
        profile.PaddingTop = 12
        profile.PaddingBottom = 0
        profile.AuraTracker.Height = 13
        profile.AuraTracker.Anchor = "Health Bar"
        profile.AuraTracker.AlignmentH = "LEFT"
        profile.TrackedAurasAlignment = "BOTTOM"
        profile.TrackedAurasSpacing = 1

        local healthTexts = profile.HealthTexts
        healthTexts.Normal.FontSize = 11
        healthTexts.Normal.AlignmentH = "CENTER"
        healthTexts.Normal.AlignmentV = "TOP"
        healthTexts.Normal.OffsetY = 0
        healthTexts.Normal.PaddingV = 0
        healthTexts.WithMissing.FontSize = 11
        healthTexts.WithMissing.AlignmentH = "CENTER"
        healthTexts.WithMissing.AlignmentV = "TOP"
        healthTexts.WithMissing.OffsetY = 0
        healthTexts.WithMissing.PaddingH = 8
        healthTexts.Missing.FontSize = 11
        healthTexts.Missing.AlignmentH = "RIGHT"
        healthTexts.Missing.AlignmentV = "TOP"
        healthTexts.Missing.OffsetY = 0
        healthTexts.Missing.PaddingH = 2
        
        profile.IncomingHealDisplay = "Overheal"
        profile.IncomingHealText.AlignmentH = "LEFT"
        profile.IncomingHealText.AlignmentV = "TOP"
        profile.IncomingHealText.OffsetY = 0
        profile.IncomingHealText.PaddingH = 2
        profile.IncomingHealText.PaddingV = 2

        profile.RangeText.AlignmentV = "CENTER"
        profile.RangeText.OffsetY = -4
        profile.RangeText.FontSize = 9
        profile.LineOfSightIcon.Width = 20
        profile.LineOfSightIcon.Height = 20
        profile.LineOfSightIcon.Anchor = "Health Bar"
        profile.LineOfSightIcon.Opacity = 80
        profile.HealthDisplay = "Health"
        profile.MissingHealthDisplay = "-Health"
        profile.PowerText.FontSize = 8
        profile.PowerText.AlignmentH = "CENTER"
    end

    -- Legacy profile - Meant to look as close as possible to HealersMate 1.3.0
    do
        local profile = CreateProfile("Legacy", "Base")

        profile.Width = 200

        profile.PaddingTop = 20

        profile.MissingHealthInline = true
        profile.HealthBarHeight = 25
        profile.HealthBarStyle = "Blizzard"
        profile.PowerBarHeight = 5
        profile.PowerBarStyle = "Blizzard"

        profile.NameText.AlignmentH = "LEFT"
        profile.NameText.AlignmentV = "TOP"
        profile.NameText.Anchor = "Container"
        profile.NameText.MaxWidth = 200
        local healthTexts = profile.HealthTexts
        healthTexts.Normal.AlignmentH = "CENTER"
        profile.HealthDisplay = "Health/Max Health"
        profile.PowerDisplay = "Hidden"

        profile.IncomingHealDisplay = "Overheal"
        profile.IncomingHealText.AlignmentH = "LEFT"
        profile.IncomingHealText.AlignmentV = "CENTER"

        profile.RoleIcon.AlignmentH = "RIGHT"
        profile.RoleIcon.Width = 16
        profile.RoleIcon.Height = 16

        profile.RaidMarkIcon.AlignmentH = "RIGHT"
        profile.RaidMarkIcon.OffsetX = -18
        profile.RaidMarkIcon.Width = 16
        profile.RaidMarkIcon.Height = 16

        profile.BorderStyle = "Hidden"
    end
end