-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- *********************** * * * * * ToDo * * * * * **********************
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************

-- *  Fix the none gratz right after midnight - Working on it
-- *  Make sure that the addon don't respond when the event is from our self - OK
-- *  Make slash commands work - replaced with option gui in "interface/addons Guild Slacker"
-- *  Make logout - Not startet yet
-- *  Make random message to achievement gratz and guild join welcome - OK
-- *  Take a picture when a boss is killed - Not startet yet
-- *  Get someone to check spelling - Not startet yet
-- *  Make total played - Not startet yet
-- *  Make emote reply - Not startet yet

-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- ********************* * * * * * ToDo end * * * * * ********************
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************

GS = LibStub("AceAddon-3.0"):NewAddon("GuildSlacker","AceEvent-3.0","AceConsole-3.0","AceTimer-3.0")
local AceDBOptions = LibStub("AceDBOptions-3.0")
local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog= LibStub("AceConfigDialog-3.0", true)
local AceGui = LibStub("AceGUI-3.0")
--local _date = C_Calendar.GetDate();

-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- ******* * * * * * Here is the option for GuildSlacker * * * * * *******
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************

GSoptions = {
  name = "Guild Slacker",
  handler = GS,
  type = 'group',
  args = {
    GSmainheader ={
      order = 1,
      name = "Main Settings",
      width = "double",
      type = "header",
    },
    GratzDelay = {
      name = 'Gratz Delay',
      desc = 'How long we have to wait from the achievement to we do the gratz. (Default = 4).',
      order = 2,
      width = "double",
      type = 'range',
      min =  3,
      max =  120,
      get = function()
        return GS.db.global.GS_Delay
      end,
      set =  function(self,value)
       GS.db.global.GS_Delay = value
      end,
    },
    GratzWait = {
      name = 'Wait between gratz',
      desc = 'How long we have to wait from one gratz to the next gratz so we dont spam. (Default = 5)',
      order = 3,
      width = "double",
      type = 'range',
      min =  5,
      max =  120,
      get =function()
        return GS.db.global.GS_Break
      end,
      set =  function(self,value)
        GS.db.global.GS_Break = value
      end,
    },
    DingDelay = {
      name = 'Ding Delay',
      desc = 'How long do we wait before we say "Ding" in guild chat ? (Default = 4).',
      order = 4,
      width = "double",
      type = 'range',
      min =  3,
      max =  120,
      get =function()
        return GS.db.global.GS_DingDelay
      end,
      set = function(self,value)
        GS.db.global.GS_DingDelay = value
      end,
    },
    GratzInGuild = {
      name = 'Gratz in guild chat.',
      desc = 'Do a gratz in guild on achievement (Default = enabled)',
      order = 5,
      width = "double",
      type = 'toggle',
      get = function()
        return GS.db.global.GS_GratzInGuild
      end,
      set = function(self,value)
        GS.db.global.GS_GratzInGuild = value
      end,
    },
    GratzInGroup = {
      name = 'Gratz in group chat.',
      desc = 'Do a gratz in party and raid on achievement.(Default = enabled)',
      order = 6,
      width = "double",
      type = 'toggle',
      get = function()
        return GS.db.global.GS_GratzInGroup
      end,
      set = function(self,value)
         GS.db.global.GS_GratzInGroup = value
      end,
    },
    WelcomeOnNew = {
      name = 'Welcome on New.',
      desc = 'Do a welcome when a new member join the guild.(Default = enabled)',
      order = 7,
      width = "double",
      type = 'toggle',
      get = function()
        return GS.db.global.GS_WelcomeOnNew
      end,
      set = function(self,value)
        GS.db.global.GS_WelcomeOnNew = value
      end,
    },
    RaidWarningOnNewInGuild = {
      name = 'Raid Warning on new in guild.',
      desc = 'Make a raid warning to your self when a new member join the guild.(Default = enabled)',
      order = 8,
      width = "double",
      type = 'toggle',
      get = function()
        return GS.db.global.GS_RaidWarningOnNewInGuild
      end,
      set = function(self,value)
        GS.db.global.GS_RaidWarningOnNewInGuild = value
      end,
    },
    DingOnLevel = {
      name = 'Do a ding on level in guild chat.',
      desc = 'Do a Ding in guild chat when level. (Default = enabled)',
      order = 9,
      width = "double",
      type = 'toggle',
      get = function()
        return GS.db.global.GS_DingOnLevel
      end,
      set = function(self,value)
        GS.db.global.GS_DingOnLevel = value
      end,
    },
    PicOnLevel =
    {
      name = "Take Picture on Level up",
      desc =  "Take a picture when level gain.(Default = enabled)",
      order = 10,
      width = "double",
      type = "toggle",
      get = function()
        return GS.db.global.GS_PicOnLevel
      end,
      set = function(self,value)
        GS.db.global.GS_PicOnLevel = value
      end,
    },
    PicOnAchievement =
    {
      name = "Take Picture on Achievement",
      desc =  "Take a picture when level gain. (Default = enabled)",
      order = 11,
      width = "full",
      type = "toggle",
      get = function()
        return GS.db.global.GS_PicOnAchievement
      end,
      set = function(self,value)
        GS.db.global.GS_PicOnAchievement = value
      end,
    },
    DoTheWhisper =
     {
      name = "Do Whispers as raid warnings",
      desc =  "Do all whispers as raid warnings.(Default = disabled)",
      order = 12,
      width = "full",
      type = "toggle",
      get = function()
        return GS.db.global.GS_DoTheWhisper
      end,
      set = function(self,value)
        GS.db.global.GS_DoTheWhisper = value
      end,
    },
	GreetGuildMembers =
     {
      name = "Greet Guild Members when they login.",
      desc =  "Greets guild members when they login(Default = disabled)",
      order = 13,
      width = "full",
      type = "toggle",
      get = function()
        return GS.db.global.GS_GreetGuildMembers
      end,
      set = function(self,value)
        GS.db.global.GS_GreetGuildMembers = value
      end,
    },
  }
}

local defaults = {
  global = {
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
    GS_Version = GetAddOnMetadata("GuildSlacker","Version"),
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
 AceConfigDialog:AddToBlizOptions("GS", "Guild Slacker")
end

function GS:OnEnable()
 print(GS_LOAD1 .. GS.db.global.GS_Version .. GS_LOAD2);
GS:RegisterEvent("CHAT_MSG_ACHIEVEMENT","OnAchievement")-- Fires when a nearby character earns an achievement.
GS:RegisterEvent("CHAT_MSG_GUILD_ACHIEVEMENT","OnGuildAchievement")--Fires when a member of the player's guild earns an achievement.
GS:RegisterEvent("CHAT_MSG_SYSTEM","OnChatSystem") -- Fires when a system message is received.
GS:RegisterEvent("PLAYER_LEVEL_UP","OnPlayerLevelUp") -- Fires when the player gain a level
--GS:RegisterEvent("CHAT_MSG_TEXT_EMOTE"," ") -- Fires when the player receives a standard emote (e.g. `/dance`, `/flirt`) message.
--GS:RegisterEvent("PLAYER_LOGOUT"," ")-- Fires immediately before the player is logged out of the game.
GS:RegisterEvent("CHAT_MSG_WHISPER","OnWhisper") -- Fires when someone whisper to you.
GS:RegisterEvent("CHAT_MSG_BN_WHISPER","OnBNWhisper") -- Fires when someone with BattleNet ID whisper to you.
GS:ScheduleRepeatingTimer("OnUpdate" ,0.01)
end

function GS:OnDisable()
GS:unregisterEvent("CHAT_MSG_ACHIEVEMENT")
GS:unregisterEvent("CHAT_MSG_GUILD_ACHIEVEMENT")
GS:unregisterEvent("CHAT_MSG_SYSTEM")
GS:unregisterEvent("PLAYER_LEVEL_UP")
--GS:unregisterEvent("CHAT_MSG_TEXT_EMOTE")
--GS:unregisterEvent("PLAYER_LOGOUT")
GS:unregisterEvent("CHAT_MSG_WHISPER")
GS:unregisterEvent("CHAT_MSG_BN_WHISPER")
end

function GS:OnAchievement(event,arg1,arg2)
 local pname, _ = strsplit("-", arg2);
 local GS_AchievementBy = pname;
        -- Make sure thats not our self
        if (GS_PlayerName ~= GS_AchievementBy) then
            -- Are we in a raid or a party ?
            if (GetNumGroupMembers() > 0) or (GetNumSubgroupMembers() > 0) then
                -- Is the player in our raid or party ?
                if (UnitInRaid(GS_AchievementBy) ~= nil) or (UnitInParty(GS_AchievementBy) ~= nil) then
                    GS_WhatEvent = "PartyAndRaid";
                    GS_TimeDelay = GetTime();
                    GS_RandomDelay = math.random(1, 5)
                    GS_Loop = "Go";
                end
            end
        else
            -- It is our self so we don't say anything just do other stuf
            if (GS_PlayerName == GS_AchievementBy) then
                -- Are we allowed to take a picture ?
                if (GS.db.global.GS_PicOnAchievement) then
                    GS_PicDelay = GetTime();
                    GS_TakePic = "Go";
                end
            end
        end
end

function GS:OnGuildAchievement(event,arg1,arg2)
	local pname, _ = strsplit("-", arg2);
    local GS_GuildAchievementBy = pname;
        -- Make sure that it's not our self
        if (GS_PlayerName ~= GS_GuildAchievementBy) then
            GS_WhatEvent = "Achievement";
            GS_TimeDelay = GetTime();
            GS_RandomDelay = math.random(1, 2)--5
            GS_Loop = "Go";
        end
end

function GS:OnChatSystem(event,arg1)
  if(string.find(arg1,"has joined the guild.")) then
            -- Get the name of the one there is joining the guild
            var = {strsplit(" ", arg1)}
            var2 = {strsplit("-",var[1])}
            -- Check that it's not our self
            if (GS_PlayerName ~= var2[1]) then
                GS_WhatEvent = "JoinGuild";
                GS_TimeDelay = GetTime();
                GS_RandomDelay = math.random(1, 2)--5
                GS_NameJoinGuild = var2[1];
                GS_Loop = "Go";
            end
        end
end

function GS:OnPlayerLevelUp(event,arg1)
        GS_TimeDingDelay = GetTime();
        GS_NewLevel = arg1;
        GS_GetDingDelay = "go";
end

function GS:OnWhisper(event,arg1,arg2)
        GS_TimeDelay = GetTime();
        GS:DoWhisper(arg1, arg2);
end

function GS:OnBNWhisper(event,arg1,arg2)
        GS_TimeDelay = GetTime();
        GS:DoWhisper(arg1, arg2);
end


-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- ******************* * * * * * SlashCommands * * * * * *****************
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************


-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- ********************* * * * * * OnUpdate * * * * * ********************
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************

-- Run on every update and here we do all the checks
function GS:OnUpdate()
    -- Just a double check
    if (GS_PlayerName == nil) or (GS_LastMessage == nil) or (GS_TimeDelay == nil) or (GS_OldDate == nil) or (GS_RandomDelay == nil) or (GS_TakePic == nil) or (GS_PicDelay == nil) or (GS_TimeDingDelay == nil) or (GS_GetDingDelay == nil) then
		--Fix for 5.4 name changes
		local pname, _ = strsplit("-", UnitName("player"));
        GS_PlayerName = pname;
        GS_LastMessage = GetTime();
        GS_TimeDelay = GetTime();
        GS_OldDate = date("%m-%d-%Y");
        GS_RandomDelay = 1;
        GS_TakePic = "Off";
        GS_PicDelay = GetTime();
        GS_TimeDingDelay = GetTime();
        GS_WhatEvent = "Nothing";
        GS_Loop = "Stop";
        GS_GetDingDelay = "Stop";
    end
    -- Take a picture if we are allowed
    if (GS_TakePic == "Go") then
        -- Wait 1.2 sec before we take picture
        if ((GetTime() - GS_PicDelay) > 1.2) then
		
        --local weekday, month, day, year = _date.weekday, _date.month, _date.monthDay, _date.year;
        local hour,minute = GetGameTime();
        local screenshotDate =  string.format("Screenshot taken: "..date("%m-%d-%Y").." : %ih:%im",hour,minute);
        print ("|cffFFFF00"..screenshotDate.."|r");
            Screenshot();
            GS_TakePic = "Off";
            print ("|cffFFFF00"..GS_SCREENSHOT.."|r");
        end
    end
    -- Ding delay
    if (GS_GetDingDelay:lower() == "go") then
        if ((GetTime() - GS_TimeDingDelay) > GS.db.global.GS_DingDelay) then
            GS_GetDingDelay = "Stop"
            GS:Level(GS_NewLevel);
        end
    end
    -- Are we allowed to do this loop ?
    if (GS_Loop == "Go") then
        -- Check that the player is the player
        if (UnitName("player") == nil) then
            return;
        end
        -- Check date so that we don't get errors after midnight
        if GS_OldDate == nil then
            GS_OldDate = date("%m-%d-%Y");
            GS_LastMessage = (GetTime() - 10);
        elseif GS_OldDate ~= date("%m-%d-%Y") then
            GS_OldDate = date("%m-%d-%Y");
            GS_LastMessage = (GetTime() - 10);
        end
        -- Don't do anything if we are AFK
        if (not UnitIsAFK("player")) then
            -- Make sure that we don't spam the chat
            if ((GetTime() - GS_LastMessage) > GS.db.global.GS_Break) then
                -- Make sure that there is a small delay before we say anything in chat
                if ((GetTime() - GS_TimeDelay) > (GS.db.global.GS_Delay + GS_RandomDelay)) then
                    -- All was ok, now we just have to send to the right function
                    if GS_WhatEvent == "Achievement" then
                        GS:DoAchievement()
                    elseif GS_WhatEvent == "PartyAndRaid" then
                        GS:DoPartyAndRaid()
                    elseif GS_WhatEvent == "JoinGuild" then
                        GS:DoJoinGuild()
                    else
                        print (GS_ERROR1);
                        print (GS_ERROR2);
                        print (GS_ERROR3 .. GS.db.global.GS_Version);
                        print (GS_ERROR4.. "000001");
                    end
                    -- Stop the loop
                    GS_Loop = "Stop";
                end
            -- It is to fast to say anything now
            else
                -- Stop the loop
                GS_Loop = "Stop";
            end
        -- Player is AFK
        else
            -- Stop the loop
            GS_Loop = "Stop";
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
        GS_Random = math.random(1, 15)
        if (GS_Random == 1) then
            SendChatMessage(GS_GRATZ1, "GUILD");
        elseif (GS_Random == 2) then
            SendChatMessage(GS_GRATZ2, "GUILD");
        elseif (GS_Random == 3) then
            SendChatMessage(GS_GRATZ3, "GUILD");
        elseif (GS_Random == 4) then
            SendChatMessage(GS_GRATZ4, "GUILD");
        elseif (GS_Random == 5) then
            SendChatMessage(GS_GRATZ5, "GUILD");
        elseif (GS_Random == 6) then
            SendChatMessage(GS_GRATZ6, "GUILD");
        elseif (GS_Random == 7) then
            SendChatMessage(GS_GRATZ7, "GUILD");
        elseif (GS_Random == 8) then
            SendChatMessage(GS_GRATZ8, "GUILD");
        elseif (GS_Random == 9) then
            SendChatMessage(GS_GRATZ9, "GUILD");
        elseif (GS_Random == 10) then
            SendChatMessage(GS_GRATZ10, "GUILD");
        elseif (GS_Random == 11) then
            SendChatMessage(GS_GRATZ11, "GUILD");
        elseif (GS_Random == 12) then
            SendChatMessage(GS_GRATZ12, "GUILD");
        elseif (GS_Random == 13) then
            SendChatMessage(GS_GRATZ13, "GUILD");
        elseif (GS_Random == 14) then
            SendChatMessage(GS_GRATZ14, "GUILD");
        elseif (GS_Random == 15) then
            SendChatMessage(GS_GRATZ15, "GUILD");
        else
            print (GS_ERROR1);
            print (GS_ERROR2);
            print (GS_ERROR3 .. GS.db.global.GS_Version);
            print (GS_ERROR4.. "000002");
        end
        GS_LastMessage = GetTime();
        GS_Random = nil
    end
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
            print (GS_ERROR1);
            print (GS_ERROR2);
            print (GS_ERROR3 .. GS.db.global.GS_Version);
            print (GS_ERROR4.. "000003");
        end
        -- Make a random number and do the gratz
        GS_Random = math.random(1, 15)
        if (GS_Random == 1) then
            SendChatMessage(GS_GRATZ1, GS_GratzWhere);
        elseif (GS_Random == 2) then
            SendChatMessage(GS_GRATZ2, GS_GratzWhere);
        elseif (GS_Random == 3) then
            SendChatMessage(GS_GRATZ3, GS_GratzWhere);
        elseif (GS_Random == 4) then
            SendChatMessage(GS_GRATZ4, GS_GratzWhere);
        elseif (GS_Random == 5) then
            SendChatMessage(GS_GRATZ5, GS_GratzWhere);
        elseif (GS_Random == 6) then
            SendChatMessage(GS_GRATZ6, GS_GratzWhere);
        elseif (GS_Random == 7) then
            SendChatMessage(GS_GRATZ7, GS_GratzWhere);
        elseif (GS_Random == 8) then
            SendChatMessage(GS_GRATZ8, GS_GratzWhere);
        elseif (GS_Random == 9) then
            SendChatMessage(GS_GRATZ9, GS_GratzWhere);
        elseif (GS_Random == 10) then
            SendChatMessage(GS_GRATZ10, GS_GratzWhere);
        elseif (GS_Random == 11) then
            SendChatMessage(GS_GRATZ11, GS_GratzWhere);
        elseif (GS_Random == 12) then
            SendChatMessage(GS_GRATZ12, GS_GratzWhere);
        elseif (GS_Random == 13) then
            SendChatMessage(GS_GRATZ13, GS_GratzWhere);
        elseif (GS_Random == 14) then
            SendChatMessage(GS_GRATZ14, GS_GratzWhere);
        elseif (GS_Random == 15) then
            SendChatMessage(GS_GRATZ15, GS_GratzWhere);
        else
            print (GS_ERROR1);
            print (GS_ERROR2);
            print (GS_ERROR3 .. GS.db.global.GS_Version);
            print (GS_ERROR4.. "000004");
        end
        -- Reset so we don't get errors next time
        GS_LastMessage = GetTime();
        GS_Random = nil
    end
end

-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************
-- ******************* * * * * * Do join guild * * * * * *****************
-- ************************* * * * * * * * * * * *************************
-- ************************* * * * * * * * * * * *************************

function GS:DoJoinGuild()
    if (GS.db.global.GS_WelcomeOnNew) then
        GS_Random = math.random(1, 10)
       if  GS_PlayerName ~= GS_NameJoinGuild then
        if (GS_Random == 1) then
            SendChatMessage(GS_WELCOME1, "GUILD");
        elseif (GS_Random == 2) then
            SendChatMessage(GS_WELCOME2, "GUILD");
        elseif (GS_Random == 3) then
            SendChatMessage(GS_WELCOME3, "GUILD");
        elseif (GS_Random == 4) then
            SendChatMessage(GS_WELCOME4, "GUILD");
        elseif (GS_Random == 5) then
            SendChatMessage(GS_WELCOME5, "GUILD");
        elseif (GS_Random == 6) then
            SendChatMessage(GS_WELCOME6 .. GS_NameJoinGuild, "GUILD");
        elseif (GS_Random == 7) then
            SendChatMessage(GS_WELCOME7 .. GS_NameJoinGuild, "GUILD");
        elseif (GS_Random == 8) then
            SendChatMessage(GS_WELCOME8 .. GS_NameJoinGuild, "GUILD");
        elseif (GS_Random == 9) then
            SendChatMessage(GS_WELCOME9 .. GS_NameJoinGuild, "GUILD");
        elseif (GS_Random == 10) then
            SendChatMessage(GS_WELCOME10 .. GS_NameJoinGuild, "GUILD");
        else
            print (GS_ERROR1);
            print (GS_ERROR2);
            print (GS_ERROR3 .. GS.db.global.GS_Version);
            print (GS_ERROR4.. "000005");
        end
        GS_LastMessage = GetTime();
        GS_Random = nil
        GS_NameJoinGuild = nil
    end

    if (GS.db.global.GS_RaidWarningOnNewInGuild) then
        RaidNotice_AddMessage(RaidBossEmoteFrame, "A new member have joind the guild.", ChatTypeInfo["RAID_WARNING"])
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
	    if (GS_NewLevel == 10) then
            SendChatMessage(GS_DING10 .. GS_NewLevel, "GUILD");
        elseif (GS_NewLevel == 20) then
            SendChatMessage(GS_DING20 .. GS_NewLevel, "GUILD");
        elseif (GS_NewLevel == 30) then
            SendChatMessage(GS_DING30 .. GS_NewLevel, "GUILD");
        elseif (GS_NewLevel == 40) then
            SendChatMessage(GS_DING40 .. GS_NewLevel, "GUILD");
        elseif (GS_NewLevel == 50) then
            SendChatMessage(GS_DING50 .. GS_NewLevel, "GUILD");
        elseif (GS_NewLevel == 60) then
            SendChatMessage(GS_DING60 .. GS_NewLevel, "GUILD");
        elseif (GS_NewLevel == 70) then
            SendChatMessage(GS_DING70 .. GS_NewLevel, "GUILD");
        elseif (GS_NewLevel == 80) then
            SendChatMessage(GS_DING80 .. GS_NewLevel, "GUILD");
        elseif (GS_NewLevel == 85) then
            SendChatMessage(GS_DING85 .. GS_NewLevel, "GUILD");
        elseif (GS_NewLevel == 90) then
            SendChatMessage(GS_DING90 .. GS_NewLevel, "GUILD");
        elseif (GS_NewLevel == 95) then
            SendChatMessage(GS_DING95 .. GS_NewLevel, "GUILD");
        elseif (GS_NewLevel == 100) then
            SendChatMessage(GS_DING100 .. GS_NewLevel, "GUILD");
        else
            SendChatMessage(GS_DING_OTHER .. GS_NewLevel, "GUILD");
        end
        -- Do we take a Picture when we ding ?
        if (GS.db.global.GS_PicOnLevel) then
            -- Make a note in chat so we on Picture can see what level we gain
            -- print ("You are now level " ..GS_NewLevel.. ", Good job...");
            -- print ("The "..date.." you gained level "..GS_NewLevel);
            GS_TakePic = "Go";
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
        RaidNotice_AddMessage(RaidBossEmoteFrame, "[Whisper from:] ["..arg2.."]", ChatTypeInfo["RAID_WARNING"])
        RaidNotice_AddMessage(RaidBossEmoteFrame, arg1, ChatTypeInfo["RAID_WARNING"])
    end
end
