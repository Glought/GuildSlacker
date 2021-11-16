-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- *********************** * * * * * ToDo * * * * * **********************
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************

-- *  Make slash commands work - replaced with option gui in "interface/addons Guild Slacker"
-- *  Make logout - Not startet yet
-- *  Take a picture when a boss is killed - Not startet yet
-- *  Get someone to check spelling - Not startet yet
-- *  Make total played - Not startet yet
-- *  Make emote reply - Not startet yet

-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- ********************* * * * * * ToDo end * * * * * ********************
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************

GS = LibStub("AceAddon-3.0"):NewAddon("GuildSlacker", "AceEvent-3.0", "AceConsole-3.0", "AceTimer-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("GuildSlacker")
local AceDBOptions = LibStub("AceDBOptions-3.0")
local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0", true)
local AceGui = LibStub("AceGUI-3.0")

local isClassic = (WOW_PROJECT_ID == WOW_PROJECT_CLASSIC)

local LG = LibStub("LibGuild-1.0")

local Current_DB_Version = 1.0

local currentExpansionCatagoryIDs = {15422, 15428, 15429, 15430, 15436, 15438, 15439, 15440, 15441, 15442}

StaticPopupDialogs["RELOAD_REQUIRED"] = {
    text = "A reload is required do you want to reload now?",
    button1 = "Yes",
    button2 = "No",
    OnAccept = function()
        ReloadUI()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3
}

-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- ******* * * * * * Here is the option for GuildSlacker * * * * * *******
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************

GSoptions = {
    name = L["GS_options_name"],
    handler = GS,
    type = "group",
    args = {
        GSmainheader = {
            order = 1,
            name = L["GS_options_mainheader_name"],
            width = "double",
            type = "group",
            args = {
                GratzDelay = {
                    name = L["GS_GratsDelay_name"],
                    desc = L["GS_GratsDelay_desc"],
                    order = 2,
                    width = "double",
                    type = "range",
                    min = 3,
                    max = 120,
                    get = function()
                        return GS.db.global.GS_Delay
                    end,
                    set = function(self, value)
                        GS.db.global.GS_Delay = value
                    end
                },
                GratzWait = {
                    name = L["GS_GratzWait_name"],
                    desc = L["GS_GratzWait_desc"],
                    order = 3,
                    width = "double",
                    type = "range",
                    min = 5,
                    max = 120,
                    get = function()
                        return GS.db.global.GS_Break
                    end,
                    set = function(self, value)
                        GS.db.global.GS_Break = value
                    end
                },
                DingDelay = {
                    name = L["GS_DingDelay_name"],
                    desc = L["GS_DingDelay_desc"],
                    order = 4,
                    width = "double",
                    type = "range",
                    min = 3,
                    max = 120,
                    get = function()
                        return GS.db.global.GS_DingDelay
                    end,
                    set = function(self, value)
                        GS.db.global.GS_DingDelay = value
                    end
                },
                GratzInGuild = {
                    name = L["GS_GratzInGuild_name"],
                    desc = L["GS_GratzInGuild_desc"],
                    order = 5,
                    width = "double",
                    type = "toggle",
                    get = function()
                        return GS.db.global.GS_GratzInGuild
                    end,
                    set = function(self, value)
                        GS.db.global.GS_GratzInGuild = value
                    end
                },
                GratzInGroup = {
                    name = L["GS_GratzInGroup_name"],
                    desc = L["GS_GratzInGroup_Desc"],
                    order = 6,
                    width = "double",
                    type = "toggle",
                    get = function()
                        return GS.db.global.GS_GratzInGroup
                    end,
                    set = function(self, value)
                        GS.db.global.GS_GratzInGroup = value
                    end
                },
                WelcomeOnNew = {
                    name = L["GS_WelcomeOnNew_name"],
                    desc = L["GS_WelcomeOnNew_desc"],
                    order = 7,
                    width = "double",
                    type = "toggle",
                    get = function()
                        return GS.db.global.GS_WelcomeOnNew
                    end,
                    set = function(self, value)
                        GS.db.global.GS_WelcomeOnNew = value
                    end
                },
                RaidWarningOnNewInGuild = {
                    name = L["GS_RaidWarningOnNewInGuild_name"],
                    desc = L["GS_RaidWarningOnNewInGuild_desc"],
                    order = 8,
                    width = "double",
                    type = "toggle",
                    get = function()
                        return GS.db.global.GS_RaidWarningOnNewInGuild
                    end,
                    set = function(self, value)
                        GS.db.global.GS_RaidWarningOnNewInGuild = value
                    end
                },
                DingOnLevel = {
                    name = L["GS_DingOnLevel_name"],
                    desc = L["GS_DingOnLevel_desc"],
                    order = 9,
                    width = "double",
                    type = "toggle",
                    get = function()
                        return GS.db.global.GS_DingOnLevel
                    end,
                    set = function(self, value)
                        GS.db.global.GS_DingOnLevel = value
                    end
                },
                PicOnLevel = {
                    name = L["GS_PicOnLevel_name"],
                    desc = L["GS_PicOnLevel_desc"],
                    order = 10,
                    width = "double",
                    type = "toggle",
                    get = function()
                        return GS.db.global.GS_PicOnLevel
                    end,
                    set = function(self, value)
                        GS.db.global.GS_PicOnLevel = value
                    end
                },
                PicOnAchievement = {
                    name = L["GS_PicOnAchievement_name"],
                    desc = L["GS_PicOnAchievement_desc"],
                    order = 11,
                    width = "full",
                    type = "toggle",
                    get = function()
                        return GS.db.global.GS_PicOnAchievement
                    end,
                    set = function(self, value)
                        GS.db.global.GS_PicOnAchievement = value
                    end
                },
                DoTheWhisper = {
                    name = L["GS_DoTheWhisper_name"],
                    desc = L["GS_DoTheWhisper_name"],
                    order = 12,
                    width = "full",
                    type = "toggle",
                    get = function()
                        return GS.db.global.GS_DoTheWhisper
                    end,
                    set = function(self, value)
                        GS.db.global.GS_DoTheWhisper = value
                    end
                },
                GreetGuildMembers = {
                    name = L["GS_GreetGuildMembers_name"],
                    desc = L["GS_GreetGuildMembers_desc"],
                    order = 13,
                    width = "full",
                    type = "toggle",
                    get = function()
                        return GS.db.global.GS_GreetGuildMembers
                    end,
                    set = function(self, value)
                        GS.db.global.GS_GreetGuildMembers = value
                    end
                },
                LimitGratsToCurrentExpansion = {
                    name = L["GS_LimitGratsToCurrentExpansion_name"],
                    desc = L["GS_LimitGratsToCurrentExpansion_desc"],
                    order = 14,
                    width = "full",
                    type = "toggle",
                    hidden = function()
                        if (isClassic) then
                            return true
                        else
                            return false
                        end
                    end,
                    get = function()
                        return GS.db.global.GS_LimitGratsToCurrentExpansion
                    end,
                    set = function(self, value)
                        GS.db.global.GS_LimitGratsToCurrentExpansion = value
                    end
                }
            }
        },
        GSGratzMessages = {
            order = 14,
            name = L["GS_GSGratzMessages_name"],
            width = "double",
            type = "group",
            args = {
                AddMessageButton = {
                    name = L["GS_Add_name"],
                    desc = L["GS_Add_desc"],
                    order = 0,
                    width = 1,
                    type = "execute",
                    func = function()
                        GS.db.global.GS_GratzMessage_Count = GS.db.global.GS_GratzMessage_Count + 1
                        GS:AddMessage("Gratz", GS.db.global.GS_GratzMessage_Count)
                    end
                },
                RemoveMessageButton = {
                    name = L["GS_Remove_name"],
                    desc = L["GS_Remove_desc"],
                    order = 0.1,
                    width = 1,
                    type = "execute",
                    func = function()
                        GS:RemoveMessage("Gratz", GS.db.global.GS_GratzMessage_Count)

                        GS.db.global.GS_GratzMessage_Count = GS.db.global.GS_GratzMessage_Count - 1
                        GS:AddMessage("Gratz", GS.db.global.GS_GratzMessage_Count) --refresh table
                        if (GS.db.global.GS_GratzMessage_Count == -1) then
                            GS.db.global.GS_GratzMessage_Count = 0
                        end
                    end
                },
                ["*"] = {
                    name = "dummy",
                    desc = "dummy",
                    order = 1,
                    width = "double",
                    guiHidden = true,
                    type = "input",
                    get = function()
                        --return GS.db.global.GS_GRATZ[15]
                    end,
                    set = function(self, value)
                        --GS.db.global.GS_GRATZ[15] = value
                    end
                }
            }
        },
        GSWelcomeMessages = {
            order = 15,
            name = L["GS_GSWelcomeMessages_name"],
            width = "double",
            type = "group",
            args = {
                AddMessageButton = {
                    name = L["GS_Add_name"],
                    desc = L["GS_Add_desc"],
                    order = 0,
                    width = 1,
                    type = "execute",
                    func = function()
                        GS.db.global.GS_WelcomeMessage_Count = GS.db.global.GS_WelcomeMessage_Count + 1
                        GS:AddMessage("Welcome", GS.db.global.GS_WelcomeMessage_Count)
                    end
                },
                RemoveMessageButton = {
                    name = L["GS_Remove_name"],
                    desc = L["GS_Remove_desc"],
                    order = 0.1,
                    width = 1,
                    type = "execute",
                    func = function()
                        GS:RemoveMessage("Welcome", GS.db.global.GS_WelcomeMessage_Count)

                        GS.db.global.GS_WelcomeMessage_Count = GS.db.global.GS_WelcomeMessage_Count - 1
                        GS:AddMessage("Welcome", GS.db.global.GS_WelcomeMessage_Count) --Refresh table
                        if (GS.db.global.GS_WelcomeMessage_Count == -1) then
                            GS.db.global.GS_WelcomeMessage_Count = 0
                        end
                    end
                },
                ["*"] = {
                    name = "dummy",
                    desc = "dummy",
                    order = 1,
                    width = "double",
                    guiHidden = true,
                    type = "input",
                    get = function()
                        --return GS.db.global.GS_WELCOME[1]
                    end,
                    set = function(self, value)
                        --  GS.db.global.GS_WELCOME[1] = value
                    end
                }
            }
        },
        GSGreetMessages = {
            order = 16,
            name = L["GS_GreetMessages_name"],
            width = "double",
            type = "group",
            args = {
                AddMessageButton = {
                    name = L["GS_Add_name"],
                    desc = L["GS_Add_desc"],
                    order = 0,
                    width = 1,
                    type = "execute",
                    func = function()
                        GS.db.global.GS_GreetMessage_Count = GS.db.global.GS_GreetMessage_Count + 1
                        GS:AddMessage("Greet", GS.db.global.GS_GreetMessage_Count)
                    end
                },
                RemoveMessageButton = {
                    name = L["GS_Remove_name"],
                    desc = L["GS_Remove_desc"],
                    order = 0.1,
                    width = 1,
                    type = "execute",
                    func = function()
                        GS:RemoveMessage("Greet", GS.db.global.GS_GreetMessage_Count)

                        GS.db.global.GS_GreetMessage_Count = GS.db.global.GS_GreetMessage_Count - 1
                        GS:AddMessage("Greet", GS.db.global.GS_GreetMessage_Count) --Refresh table
                        if (GS.db.global.GS_GreetMessage_Count == -1) then
                            GS.db.global.GS_GreetMessage_Count = 0
                        end
                    end
                },
                ["*"] = {
                    name = "dummy",
                    desc = "dummy",
                    order = 1,
                    width = "double",
                    guiHidden = true,
                    type = "input",
                    get = function()
                        --return GS.db.global.GS_GRATZ[15]
                    end,
                    set = function(self, value)
                        --GS.db.global.GS_GRATZ[15] = value
                    end
                }
            }
        },
        GSDingMessages = {
            order = 17,
            name = L["GS_GSDingMessages_name"],
            width = "double",
            type = "group",
            args = {
                DingMessage1 = {
                    name = L["GS_DingMessage1_name"],
                    desc = L["GS_DingMessage1_desc"],
                    order = 1,
                    width = "double",
                    type = "input",
                    get = function()
                        return GS.db.global.GS_DINGS["10"]
                    end,
                    set = function(self, value)
                        GS.db.global.GS_DINGS["10"] = value
                    end
                },
                DingMessage2 = {
                    name = L["GS_DingMessage2_name"],
                    desc = L["GS_DingMessage2_desc"],
                    order = 2,
                    width = "double",
                    type = "input",
                    get = function()
                        return GS.db.global.GS_DINGS["20"]
                    end,
                    set = function(self, value)
                        GS.db.global.GS_DINGS["20"] = value
                    end
                },
                DingMessage3 = {
                    name = L["GS_DingMessage3_name"],
                    desc = L["GS_DingMessage3_desc"],
                    order = 3,
                    width = "double",
                    type = "input",
                    get = function()
                        return GS.db.global.GS_DINGS["30"]
                    end,
                    set = function(self, value)
                        GS.db.global.GS_DINGS["30"] = value
                    end
                },
                DingMessage4 = {
                    name = L["GS_DingMessage4_name"],
                    desc = L["GS_DingMessage4_desc"],
                    order = 4,
                    width = "double",
                    type = "input",
                    get = function()
                        return GS.db.global.GS_DINGS["40"]
                    end,
                    set = function(self, value)
                        GS.db.global.GS_DINGS["40"] = value
                    end
                },
                DingMessage5 = {
                    name = L["GS_DingMessage5_name"],
                    desc = L["GS_DingMessage5_desc"],
                    order = 5,
                    width = "double",
                    type = "input",
                    get = function()
                        return GS.db.global.GS_DINGS["50"]
                    end,
                    set = function(self, value)
                        GS.db.global.GS_DINGS["50"] = value
                    end
                },
                DingMessage6 = {
                    name = L["GS_DingMessage6_name"],
                    desc = L["GS_DingMessage6_desc"],
                    order = 6,
                    width = "double",
                    type = "input",
                    get = function()
                        return GS.db.global.GS_DINGS["60"]
                    end,
                    set = function(self, value)
                        GS.db.global.GS_DINGS["60"] = value
                    end
                }
            }
        }
    }
}

local defaults = {
    global = {
        GS_DB_Version = Current_DB_Version,
        GS_Delay = 4,
        GS_Break = 5,
        GS_GratzInGuild = true,
        GS_GratzInGroup = true,
        GS_WelcomeOnNew = true,
        GS_RaidWarningOnNewInGuild = true,
        GS_DingOnLevel = true,
        GS_DingDelay = 4,
        GS_PicOnLevel = true,
        GS_PicOnAchievement = true,
        GS_DoTheWhisper = false,
        GS_GreetGuildMembers = false,
        GS_GreetGuildMembersSayName = false,
        GS_LimitGratsToCurrentExpansion = false,
        GS_Version = GetAddOnMetadata("GuildSlacker", "Version"),
        GS_GratzMessage_Count = 5,
        GS_WelcomeMessage_Count = 10,
        GS_GreetMessage_Count = 3,
        --Grats
        GS_GRATZ = {
            "Gz",
            "Congratz",
            "Congratulation",
            "Gratz",
            "Gratz",
            ["*"] = "Gratz"
        },
        GS_GRATZ_WITH_NAME = {
            [5] = true,
            ["*"] = false
        },
        --Welcome
        GS_WELCOME = {
            "Welcome to the guild m8",
            "Welcome mate",
            "Welcome",
            "Welcome to the guild...",
            "Welcome m8... ;o)",
            "Welcome ", -- Have the name in the end of the welcome
            "Hey ", -- Have the name in the end of the welcome
            "Hey and welcome ", -- Have the name in the end of the welcome
            "About time you joined us ", -- Have the name in the end of the welcome
            "Welcome to the guild " -- Have the name in the end of the welcome
        },
        GS_WELCOME_WITH_NAME = {
            [6] = true,
            [7] = true,
            [8] = true,
            [9] = true,
            [10] = true,
            ["*"] = false
        },
        --Ding
        GS_DINGS = {
            ["10"] = "DING! ",
            ["20"] = "Ding! ",
            ["30"] = "Ding! ",
            ["40"] = "Ding! ",
            ["50"] = "Ding! ",
            ["60"] = "Ding! ",
            ["*"] = "Ding!  "
        },
        GS_GREETS = {
            [1] = "Hi",
            [2] = "Hello",
            ["*"] = "Hi"
        },
        GS_GREETS_WITH_NAME = {
            [3] = true,
            ["*"] = false
        }
    }
}

-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- ******************** * * * * * Option end * * * * * *******************
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************

function GS:OnInitialize()
    GS.db = LibStub("AceDB-3.0"):New("GuildSlackerDB", defaults, true)
    AceConfig:RegisterOptionsTable("GS", GSoptions, {"gssettings", "gsset"})
    AceConfig:RegisterOptionsTable("GS Customize Grats sayings", GSoptions.args.GSGratzMessages)
    AceConfig:RegisterOptionsTable("GS Customize Welcome sayings", GSoptions.args.GSWelcomeMessages)
    AceConfig:RegisterOptionsTable("GS Customize Greet sayings", GSoptions.args.GSGreetMessages)
    AceConfig:RegisterOptionsTable("GS Customize Ding sayings", GSoptions.args.GSDingMessages)
    AceConfigDialog:AddToBlizOptions("GS", "Guild Slacker")

    GS:AddMessage("Gratz", GS.db.global.GS_GratzMessage_Count) -- Fills the Gratz Message Table.
    GS:AddMessage("Welcome", GS.db.global.GS_WelcomeMessage_Count) -- Fills the Welcome Message Table.
    GS:AddMessage("Greet", GS.db.global.GS_GreetMessage_Count) --Fills the Greet Message Table.
end

function GS:OnEnable()
    print(L["GS_LOAD1"] .. GS.db.global.GS_Version .. L["GS_LOAD2"])

    GS:RegisterEvent("CHAT_MSG_ACHIEVEMENT", "OnAchievementStart") -- Fires when a nearby character earns an achievement.
    GS:RegisterEvent("CHAT_MSG_GUILD_ACHIEVEMENT", "OnGuildAchievementStart")
    --Fires when a member of the player's guild earns an achievement.
    GS:RegisterEvent("CHAT_MSG_SYSTEM", "OnChatSystem") -- Fires when a system message is received.
    GS:RegisterEvent("PLAYER_LEVEL_UP", "OnPlayerLevelUp") -- Fires when the player gain a level
    GS:RegisterEvent("CHAT_MSG_WHISPER", "OnWhisper") -- Fires when someone whisper to you.
    GS:RegisterEvent("CHAT_MSG_BN_WHISPER", "OnBNWhisper") -- Fires when someone with BattleNet ID whisper to you.
    GS:ScheduleRepeatingTimer("OnUpdate", 0.01)
end

function GS:OnDisable()
    GS:unregisterEvent("CHAT_MSG_ACHIEVEMENT")
    GS:unregisterEvent("CHAT_MSG_GUILD_ACHIEVEMENT")
    GS:unregisterEvent("CHAT_MSG_SYSTEM")
    GS:unregisterEvent("PLAYER_LEVEL_UP")
    GS:unregisterEvent("CHAT_MSG_WHISPER")
    GS:unregisterEvent("CHAT_MSG_BN_WHISPER")
end

function GS:OnAchievementStart(event, arg1, arg2)
    if (GS.db.global.GS_LimitGratsToCurrentExpansion) then
        var1 = {strsplit(":", arg1, 2)}
        var2 = {strsplit(":Player", var1[2])}
        achievementID = var2[1]

        for i, line in ipairs(currentExpansionCatagoryIDs) do
            if line == GetAchievementCategory(achievementID) then
                GS:OnAchievement(event, arg1, arg2)
            end
        end
    else
        GS:OnAchievement(event, arg1, arg2)
    end
end

function GS:OnGuildAchievementStart(event, arg1, arg2)
    if (GS.db.global.GS_LimitGratsToCurrentExpansion) then
        var1 = {strsplit(":", arg1, 2)}
        var2 = {strsplit(":Player", var1[2])}
        achievementID = var2[1]

        for i, line in ipairs(currentExpansionCatagoryIDs) do
            if line == GetAchievementCategory(achievementID) then
                GS:OnGuildAchievement(event, arg1, arg2)
            end
        end
    else
        GS:OnGuildAchievement(event, arg1, arg2)
    end
end

function GS:OnAchievement(event, arg1, arg2)
    if (LG:HasMember(arg2)) and (GS_PlayerNameFull ~= arg2) then
        GS:OnGuildAchievement(event, arg1, arg2)
    else
        local pname, _ = strsplit("-", arg2)
        GS_AchievementBy = pname
        -- Make sure thats not our self
        if (GS_PlayerName ~= GS_AchievementBy) then
            -- Are we in a raid or a party ?
            if (GetNumGroupMembers() > 0) or (GetNumSubgroupMembers() > 0) then
                -- Is the player in our raid or party ?
                if (UnitInRaid(GS_AchievementBy) ~= nil) or (UnitInParty(GS_AchievementBy) ~= nil) then
                    GS_WhatEvent = "PartyAndRaid"
                    GS_TimeDelay = GetTime()
                    GS_RandomDelay = math.random(1, 5)
                    GS_Loop = "Go"
                end
            end
        else
            -- It is our self so we don't say anything just do other stuf
            if (GS_PlayerName == GS_AchievementBy) then
                -- Are we allowed to take a picture ?
                if (GS.db.global.GS_PicOnAchievement) then
                    GS_PicDelay = GetTime()
                    GS_TakePic = "Go"
                end
            end
        end
    end
end

function GS:OnGuildAchievement(event, arg1, arg2)
    local pname, _ = strsplit("-", arg2)
    GS_AchievementBy = pname
    -- Make sure that it's not our self
    if (GS_PlayerName ~= GS_AchievementBy) then
        GS_WhatEvent = "Achievement"
        GS_TimeDelay = GetTime()
        GS_RandomDelay = math.random(1, 2)
        --5
        GS_Loop = "Go"
    end
end

function GS:OnChatSystem(event, arg1)
    if (string.find(arg1, " " .. L["GS_has_joined_the_guild"])) then
        -- Get the name of the one there is joining the guild
        var = {strsplit(" ", arg1)}
        var2 = {strsplit("-", var[1])}
        -- Check that it's not our self
        if (GS_PlayerName ~= var2[1]) then
            GS_WhatEvent = "JoinGuild"
            GS_TimeDelay = GetTime()
            GS_RandomDelay = math.random(1, 2)
            --5
            GS_NameJoinGuild = var2[1]
            GS_Loop = "Go"
        end
    elseif (string.find(arg1, " " .. L["GS_had_come_online"])) then
        var = {strsplit(":", arg1)}
        var2 = {strsplit("|", var[2])}
        if (GS_playerName ~= var2[1]) then
            GS_WhatEvent = "GreetMembers"
            GS_TimeDelay = GetTime()
            GS_RandomDelay = math.random(1, 2)
            GS_NameComeOnline = var2[1]
            GS_Loop = "Go"
        end
    end
end

function GS:OnPlayerLevelUp(event, arg1)
    GS_TimeDingDelay = GetTime()
    GS_NewLevel = arg1
    GS_GetDingDelay = "go"
end

function GS:OnWhisper(event, arg1, arg2)
    GS_TimeDelay = GetTime()
    GS:DoWhisper(arg1, arg2)
end

function GS:OnBNWhisper(event, arg1, arg2)
    GS_TimeDelay = GetTime()
    GS:DoWhisper(arg1, arg2)
end

-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- ********************* * * * * * OnUpdate * * * * * ********************
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************

-- Run on every update and here we do all the checks
function GS:OnUpdate()
    -- Just a double check
    if
        (GS_PlayerName == nil) or (GS_LastMessage == nil) or (GS_TimeDelay == nil) or (GS_OldDate == nil) or
            (GS_RandomDelay == nil) or
            (GS_TakePic == nil) or
            (GS_PicDelay == nil) or
            (GS_TimeDingDelay == nil) or
            (GS_GetDingDelay == nil)
     then
        --Fix for 5.4 name changes
        local pname, _ = strsplit("-", UnitName("player"))
        GS_PlayerName = pname
        GS_PlayerNameFull = UnitName("player") .. "-" .. GetRealmName()
        GS_LastMessage = GetTime()
        GS_TimeDelay = GetTime()
        if isClassic then
            GS_OldDate = date("%m/%d/%y %H:%M:%S")
        else
            GS_OldDate = C_DateAndTime.GetCurrentCalendarTime()
        end
        GS_RandomDelay = 1
        GS_TakePic = "Off"
        GS_PicDelay = GetTime()
        GS_TimeDingDelay = GetTime()
        GS_WhatEvent = "Nothing"
        GS_Loop = "Stop"
        GS_GetDingDelay = "Stop"
    end
    -- Take a picture if we are allowed
    if (GS_TakePic == "Go") then
        if isClassic then
            -- Wait 1.2 sec before we take picture
            if ((GetTime() - GS_PicDelay) > 1.2) then
                local screenshotDate = string.format(L["GS_SCREENSHOT2"] .. ": " .. date("%m/%d/%y %H:%M:%S"))
                print("|cffFFFF00" .. screenshotDate .. "|r")
                Screenshot()
                GS_TakePic = "Off"
                print("|cffFFFF00" .. L["GS_SCREENSHOT"] .. "|r")
            end
        else
            local currentDate = C_DateAndTime.GetCurrentCalendarTime()
            -- Wait 1.2 sec before we take picture
            if ((GetTime() - GS_PicDelay) > 1.2) then
                local weekday, month, day, year =
                    currentDate.weekday,
                    currentDate.month,
                    currentDate.monthDay,
                    currentDate.year
                local hour, minute = GetGameTime()
                local screenshotDate =
                    string.format(L["GS_SCREENSHOT2"] .. ": %i-%i-%i : %ih:%im", month, day, year, hour, minute)
                print("|cffFFFF00" .. screenshotDate .. "|r")
                Screenshot()
                GS_TakePic = "Off"
                print("|cffFFFF00" .. L["GS_SCREENSHOT"] .. "|r")
            end
        end
    end
    -- Ding delay
    if (GS_GetDingDelay:lower() == "go") then
        if ((GetTime() - GS_TimeDingDelay) > GS.db.global.GS_DingDelay) then
            GS_GetDingDelay = "Stop"
            GS:Level(GS_NewLevel)
        end
    end
    -- Are we allowed to do this loop ?
    if (GS_Loop == "Go") then
        -- Check that the player is the player
        if (UnitName("player") == nil) then
            return
        end
        -- Check date so that we don't get errors after midnight
        if isClassic then
            if GS_OldDate == nil then
                GS_OldDate = date("%m/%d/%y %H:%M:%S")
                GS_LastMessage = (GetTime() - 10)
            elseif GS_OldDate ~= date("%m/%d/%y %H:%M:%S") then
                GS_OldDate = date("%m/%d/%y %H:%M:%S")
                GS_LastMessage = (GetTime() - 10)
            end
        else
            if GS_OldDate == nil then
                GS_OldDate = C_DateAndTime.GetCurrentCalendarTime()
                GS_LastMessage = (GetTime() - 10)
            elseif GS_OldDate ~= C_DateAndTime.GetCurrentCalendarTime() then
                GS_OldDate = C_DateAndTime.GetCurrentCalendarTime()
                GS_LastMessage = (GetTime() - 10)
            end
        end

        -- Don't do anything if we are AFK
        if (not UnitIsAFK("player")) then
            -- Player is AFK
            -- Make sure that we don't spam the chat
            if ((GetTime() - GS_LastMessage) > GS.db.global.GS_Break) then
                -- It is to fast to say anything now
                -- Make sure that there is a small delay before we say anything in chat
                if ((GetTime() - GS_TimeDelay) > (GS.db.global.GS_Delay + GS_RandomDelay)) then
                    -- All was ok, now we just have to send to the right function
                    if GS_WhatEvent == "Achievement" then
                        GS:DoAchievement()
                    elseif GS_WhatEvent == "PartyAndRaid" then
                        GS:DoPartyAndRaid()
                    elseif GS_WhatEvent == "JoinGuild" then
                        GS:DoJoinGuild()
                    elseif GS_WhatEvent == "GreetMembers" then
                        GS:DoGreetMember()
                    else
                        print(L["GS_ERROR1"])
                        print(L["GS_ERROR2"])
                        print(L["GS_ERROR3"] .. GS.db.global.GS_Version)
                        print(L["GS_ERROR4"] .. "000001")
                    end
                    -- Stop the loop
                    GS_Loop = "Stop"
                end
            else
                -- Stop the loop
                GS_Loop = "Stop"
            end
        else
            -- Stop the loop
            GS_Loop = "Stop"
        end
    end
end

-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- *************** * * * * * Do guild achievement * * * * * **************
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************

function GS:DoAchievement()
    if (GS.db.global.GS_GratzInGuild) then
        GS_Random = math.random(1, GS.db.global.GS_GratzMessage_Count)
        if (GS.db.global.GS_GRATZ_WITH_NAME[GS_Random] == true) then
            SendChatMessage(GS.db.global.GS_GRATZ[GS_Random] .. " " .. GS_AchievementBy, "GUILD")
        elseif (GS.db.global.GS_GRATZ_WITH_NAME[GS_Random] == nil) then
            SendChatMessage(GS.db.global.GS_GRATZ[GS_Random], "GUILD")
        end
    -- print (L["GS_ERROR1"]);
    -- print (L["GS_ERROR2"]);
    -- print (L["GS_ERROR3"] .. GS.db.global.GS_Version);
    -- print (L["GS_ERROR4"] .. "000002");
    end
    GS_LastMessage = GetTime()
    GS_Random = nil
    GS_AchievementBy = nil
end

-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- ************ * * * * * Do raid / party achievement * * * * * **********
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************

function GS:DoPartyAndRaid()
    if (GS.db.global.GS_GratzInGroup) then
        -- Are we in raid or party ?
        if (GetNumGroupMembers() > 0) then
            GS_GratzWhere = "RAID"
        elseif (GetNumSubgroupMembers() > 0) then
            GS_GratzWhere = "PARTY"
        else
            print(L["GS_ERROR1"])
            print(L["GS_ERROR2"])
            print(L["GS_ERROR3"] .. GS.db.global.GS_Version)
            print(L["GS_ERROR4"] .. "000003")
        end
        -- Make a random number and do the gratz
        GS_Random = math.random(1, GS.db.global.GS_GratzMessage_Count)
       if (GS.db.global.GS_GRATZ_WITH_NAME[GS_Random] == true) then
            SendChatMessage(GS.db.global.GS_GRATZ[GS_Random] .. " " .. GS_AchievementBy, GS_GratzWhere)
       elseif (GS.db.global.GS_GRATZ_WITH_NAME[GS_Random] == nil) then
            SendChatMessage(GS.db.global.GS_GRATZ[GS_Random], GS_GratzWhere)
        end
    -- print (L["GS_ERROR1"]);
    -- print (L["GS_ERROR2"]);
    -- print (L["GS_ERROR3"] .. GS.db.global.GS_Version);
    -- print (L["GS_ERROR4"].. "000004");
    end
    -- Reset so we don't get errors next time
    GS_LastMessage = GetTime()
    GS_Random = nil
    GS_AchievementBy = nil

end

-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- ******************* * * * * * Do join guild * * * * * *****************
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************

function GS:DoJoinGuild()
    if (GS.db.global.GS_WelcomeOnNew) then
        GS_Random = math.random(1, GS.db.global.GS_WelcomeMessage_Count)
        if GS_PlayerName ~= GS_NameJoinGuild then
            if (GS.db.global.GS_WELCOME_WITH_NAME[GS_Random] == true) then
                SendChatMessage(GS.db.global.GS_WELCOME[GS_Random] .. " " .. GS_NameJoinGuild, "GUILD")
            elseif (GS.db.global.GS_WELCOME_WITH_NAME[GS_Random] == nil) then
                SendChatMessage(GS.db.global.GS_WELCOME[GS_Random], "GUILD")
            else
                print(L["GS_ERROR1"])
                print(L["GS_ERROR2"])
                print(L["GS_ERROR3"] .. GS.db.global.GS_Version)
                print(L["GS_ERROR4"] .. "000005")
            end
            GS_LastMessage = GetTime()
            GS_Random = nil
            GS_NameJoinGuild = nil
        end

        if (GS.db.global.GS_RaidWarningOnNewInGuild) then
            RaidNotice_AddMessage(RaidBossEmoteFrame, L["GS_RaidWarningGuildJoined"], ChatTypeInfo["RAID_WARNING"])
        end
    end
end

function GS:DoGreetMember()
    if (GS.db.global.GS_GreetGuildMembers) then
        GS_Random = math.random(1, GS.db.global.GS_GreetMessage_Count)
        if GS_PlayerName ~= GS_NameComeOnline then
            if (GS.db.global.GS_GREETS_WITH_NAME[GS_Random] == true) then
                SendChatMessage(GS.db.global.GS_GREETS[GS_Random] .. " " .. GS_NameComeOnline, "GUILD")      
            elseif (GS.db.global.GS_GREETS_WITH_NAME[GS_Random] == nil) then
                SendChatMessage(GS.db.global.GS_GREETS[GS_Random], "GUILD")    
            else
                print(L["GS_ERROR1"])
                print(L["GS_ERROR2"])
                print(L["GS_ERROR3"] .. GS.db.global.GS_Version)
                print(L["GS_ERROR4"] .. "000006")
            end
            GS_LastMessage = GetTime()
            GS_Random = nil
            GS_NameComeOnline = nil
        end
    end
end

-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- ********************* * * * * * Level Up * * * * * ********************
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************

function GS:Level(GS_NewLevel)
    -- Do we say ding in guild chat ?
    if (GS.db.global.GS_DingOnLevel) then
        -- Wait with the ding so we don't sound like a robot
        SendChatMessage(GS.db.global.GS_DINGS[GS_NewLevel] .. GS_NewLevel, "GUILD")

        -- Do we take a Picture when we ding ?
        if (GS.db.global.GS_PicOnLevel) then
            -- Make a note in chat so we on Picture can see what level we gain
            -- print ("You are now level " ..GS_NewLevel.. ", Good job...");
            -- print ("The "..date.." you gained level "..GS_NewLevel);
            GS_TakePic = "Go"
        end
    end
    -- Reset level so we dont use it next time
    GS_NewLevel = nil
end

-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- ******************** * * * * * Do whisper * * * * * *******************
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************

function GS:DoWhisper(arg1, arg2)
    -- Are we allowed to do a whisper ?
    if (GS.db.global.GS_DoTheWhisper) then
        RaidNotice_AddMessage(
            RaidBossEmoteFrame,
            L["GS_RaidMessage_WhisperFrom"] .. " [" .. arg2 .. "]",
            ChatTypeInfo["RAID_WARNING"]
        )
        RaidNotice_AddMessage(RaidBossEmoteFrame, arg1, ChatTypeInfo["RAID_WARNING"])
    end
end

function GS:AddMessage(GS_Type, GS_Count)
    if (GS_Type == "Gratz") then
        local _GratzOptionTable =
            setmetatable(
            {},
            {
                __newindex = function(table, key, value)
                    GSoptions.args.GSGratzMessages.args[key] = value
                end
            }
        )

        for i = 1, GS_Count do
            _GratzOptionTable["GratzMessage" .. i] = {
                name = L["Gratz Message "] .. i,
                desc = L["Gratz Message "] ..
                    i .. L[" of "] .. GS.db.global.GS_GratzMessage_Count .. L[" chosen randomly."],
                order = i,
                width = 1.4,
                guiHidden = false,
                type = "input",
                get = function()
                    return GS.db.global.GS_GRATZ[i]
                end,
                set = function(self, value)
                    GS.db.global.GS_GRATZ[i] = value
                end
            }
            _GratzOptionTable["GratzMessageWithNameToggle" .. i] = {
                name = L["GS_WithName_name"],
                desc = L["GS_WithName_desc"],
                order = i,
                width = 0.7,
                guiHidden = false,
                type = "toggle",
                get = function()
                    return GS.db.global.GS_GRATZ_WITH_NAME[i]
                end,
                set = function(self, value)
                    GS.db.global.GS_GRATZ_WITH_NAME[i] = value
                end
            }
        end
    elseif (GS_Type == "Welcome") then
        local _WelcomeOptionTable =
            setmetatable(
            {},
            {
                __newindex = function(table, key, value)
                    GSoptions.args.GSWelcomeMessages.args[key] = value
                end
            }
        )

        for i = 1, GS_Count do
            _WelcomeOptionTable["WelcomeMessage" .. i] = {
                name = L["Welcome Message "] .. i,
                desc = L["Welcome Message "] ..
                    i .. L[" of "] .. GS.db.global.GS_WelcomeMessage_Count .. L[" chosen randomly."],
                order = i,
                width = 1.4,
                guiHidden = false,
                type = "input",
                get = function()
                    return GS.db.global.GS_WELCOME[i]
                end,
                set = function(self, value)
                    GS.db.global.GS_WELCOME[i] = value
                end
            }
            _WelcomeOptionTable["WelcomeMessageWithNameToggle" .. i] = {
                -- With name toggle
                name = L["GS_WithName_name"],
                desc = L["GS_WithName_desc"],
                order = i,
                width = 0.7,
                guiHidden = false,
                type = "toggle",
                get = function()
                    return GS.db.global.GS_WELCOME_WITH_NAME[i]
                end,
                set = function(self, value)
                    GS.db.global.GS_WELCOME_WITH_NAME[i] = value
                end
            }
        end
    elseif (GS_Type == "Greet") then
        local _GreetOptionTable =
            setmetatable(
            {},
            {
                __newindex = function(table, key, value)
                    GSoptions.args.GSGreetMessages.args[key] = value
                end
            }
        )

        for i = 1, GS_Count do
            _GreetOptionTable["GreetMessage" .. i] = {
                name = L["Greet Message "] .. i,
                desc = L["Greet Message "] ..
                    i .. L[" of "] .. GS.db.global.GS_GreetMessage_Count .. L[" chosen randomly."],
                order = i,
                width = 1.4,
                guiHidden = false,
                type = "input",
                get = function()
                    return GS.db.global.GS_GREETS[i]
                end,
                set = function(self, value)
                    GS.db.global.GS_GREETS[i] = value
                end
            }
            _GreetOptionTable["GreetMessageWithNameToggle" .. i] = {
                -- With name toggle
                name = L["GS_WithName_name"],
                desc = L["GS_WithName_desc"],
                order = i,
                width = 0.7,
                guiHidden = false,
                type = "toggle",
                get = function()
                    return GS.db.global.GS_GREETS_WITH_NAME[i]
                end,
                set = function(self, value)
                    GS.db.global.GS_GREETS_WITH_NAME[i] = value
                end
            }
        end
    else
    end
end

function GS:RemoveMessage(GS_Type, GS_Count)
    if (GS_Type == "Gratz") then
        local _GratzOptionTable =
            setmetatable(
            {},
            {
                __newindex = function(table, key, value)
                    GSoptions.args.GSGratzMessages.args[key] = value
                end
            }
        )
        _GratzOptionTable["GratzMessage" .. GS_Count] = nil
        _GratzOptionTable["GratzMessageWithNameToggle" .. GS_Count] = nil
    elseif (GS_Type == "Welcome") then
        local _WelcomeOptionTable =
            setmetatable(
            {},
            {
                __newindex = function(table, key, value)
                    GSoptions.args.GSWelcomeMessages.args[key] = value
                end
            }
        )
        _WelcomeOptionTable["WelcomeMessage" .. GS_Count] = nil
        _WelcomeOptionTable["WelcomeMessageWithNameToggle" .. GS_Count] = nil
    elseif (GS_Type == "Greet") then
        local _GreetOptionTable =
            setmetatable(
            {},
            {
                __newindex = function(table, key, value)
                    GSoptions.args.GSGreetMessages.args[key] = value
                end
            }
        )
        _GreetOptionTable["GreetMessage" .. GS_Count] = nil
        _GreetOptionTable["GreetMessageWithNameToggle" .. GS_Count] = nil
    else
    end
end
