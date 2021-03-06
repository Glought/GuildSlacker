--EN
-- Not AutoGenerated
local debug = false --@debug@ debug = true --@end-debug@ 
local L = LibStub("AceLocale-3.0"):NewLocale("GuildSlacker", "enUS", true,debug) 

L["GS_options_name"] = "Guild Slacker"

L["GS_LOAD1"] = "GuildSlacker v. "
L["GS_LOAD2"] = " is loaded."
L["GS_SCREENSHOT"] = ">>> Screenshot taken. <<<"
L["GS_SCREENSHOT2"] = "Screenshot taken "
L["GS_ERROR1"] = "There is a error in Guild Slacker."
L["GS_ERROR2"] = "Please report the version and the error number to the author"
L["GS_ERROR3"] = "Version: "
L["GS_ERROR4"] = "Error number: "

--Important make sure it exactly what it says when someone joins the guild.
L["GS_has_joined_the_guild"] = "has joined the guild."
L["GS_had_come_online"] = "has come online."

--Main Settings-----------------------------------------------------------------------------
L["GS_options_mainheader_name"] = "Main Settings"

L["GS_GratsDelay_name"] = "Gratz Delay"
L["GS_GratsDelay_desc"] = "How long we have to wait from the achievement to we do the gratz. (Default = 4)."

L["GS_GratzWait_name"] = "Wait between gratz"
L["GS_GratzWait_desc"] = "How long we have to wait from one gratz to the next gratz so we dont spam. (Default = 5)"

L["GS_DingDelay_name"] = "Ding Delay"
L["GS_DingDelay_desc"] = "How long do we wait before we say 'Ding' in guild chat ? (Default = 4)."

L["GS_GratzInGuild_name"] = "Gratz in guild chat."
L["GS_GratzInGuild_desc"] = "Do a gratz in guild on achievement (Default = enabled)"

L["GS_GratzInGroup_name"] = "Gratz in group chat."
L["GS_GratzInGroup_Desc"] = "Do a gratz in party and raid on achievement.(Default = enabled)"

L["GS_WelcomeOnNew_name"] = "Welcome on New."
L["GS_WelcomeOnNew_desc"] = "Do a welcome when a new member join the guild.(Default = enabled)"

L["GS_RaidWarningOnNewInGuild_name"] = "Raid Warning on new in guild."
L["GS_RaidWarningOnNewInGuild_desc"] = "Make a raid warning to your self when a new member join the guild.(Default = enabled)"

L["GS_DingOnLevel_name"] = "Do a ding on level in guild chat."
L["GS_DingOnLevel_desc"] = "Do a Ding in guild chat when level. (Default = enabled)"

L["GS_PicOnLevel_name"] = "Take Picture on Level up"
L["GS_PicOnLevel_desc"] = "Take a picture when level gain.(Default = enabled)"

L["GS_PicOnAchievement_name"] = "Take Picture on Achievement"
L["GS_PicOnAchievement_desc"] = "Take a picture when level gain. (Default = enabled)"

L["GS_DoTheWhisper_name"] = "Do Whispers as raid warnings"
L["GS_DoTheWhisper_desc"] = "Do all whispers as raid warnings.(Default = disabled)"

L["GS_GreetGuildMembers_name"] = "Greet Guild Members when they login."
L["GS_GreetGuildMembers_desc"] = "Greets guild members when they login(Default = disabled)"

L["GS_SayGuildMembersNameAtEndOfGreet_name"] = "Say Guild member's name at the end of Greet?"
L["GS_SayGuildMembersNameAtEndOfGreet_desc"] = "If enabled it will add the Guild Member's name at the end of greet aka 'Hi Name' (Default = disabled)"

L["GS_LimitGratsToCurrentExpansion_name"] = "Limit Grats to current expansion"
L["GS_LimitGratsToCurrentExpansion_desc"] = "When enabled GuildSlacker will only send grats for achievements from the current expansion (Default = disabled)"

--Customize Gratz Messages----------------------------------------------------------------
L["GS_GSGratzMessages_name"] = "Customize Grats messages"

L["GS_GratzMessage1_name"] = "Gratz Message 1"
L["GS_GratzMessage1_desc"] = "Grats Message 1 of 15 choosen randomly."

L["GS_GratzMessage2_name"] = "Gratz Message 2"
L["GS_GratzMessage2_desc"] = "Grats Message 2 of 15 choosen randomly."

L["GS_GratzMessage3_name"] = "Gratz Message 3"
L["GS_GratzMessage3_desc"] = "Grats Message 3 of 15 choosen randomly."

L["GS_GratzMessage4_name"] = "Gratz Message 4"
L["GS_GratzMessage4_desc"] = "Grats Message 4 of 15 choosen randomly."

L["GS_GratzMessage5_name"] = "Gratz Message 5"
L["GS_GratzMessage5_desc"] = "Grats Message 5 of 15 choosen randomly."

L["GS_GratzMessage6_name"] = "Gratz Message 6"
L["GS_GratzMessage6_desc"] = "Grats Message 6 of 15 choosen randomly."

L["GS_GratzMessage7_name"] = "Gratz Message 7"
L["GS_GratzMessage7_desc"] = "Grats Message 7 of 15 choosen randomly."

L["GS_GratzMessage8_name"] = "Gratz Message 8"
L["GS_GratzMessage8_desc"] = "Grats Message 8 of 15 choosen randomly."

L["GS_GratzMessage9_name"] = "Gratz Message 9"
L["GS_GratzMessage9_desc"] = "Grats Message 9 of 15 choosen randomly."

L["GS_GratzMessage10_name"] = "Gratz Message 10"
L["GS_GratzMessage10_desc"] = "Grats Message 10 of 15 choosen randomly."

L["GS_GratzMessage11_name"] = "Gratz Message 11"
L["GS_GratzMessage11_desc"] = "Grats Message 11 of 15 choosen randomly."

L["GS_GratzMessage12_name"] = "Gratz Message 12"
L["GS_GratzMessage12_desc"] = "Grats Message 12 of 15 choosen randomly."

L["GS_GratzMessage13_name"] = "Gratz Message 13"
L["GS_GratzMessage13_desc"] = "Grats Message 13 of 15 choosen randomly."

L["GS_GratzMessage14_name"] = "Gratz Message 14"
L["GS_GratzMessage14_desc"] = "Grats Message 14 of 15 choosen randomly."

L["GS_GratzMessage15_name"] = "Gratz Message 15"
L["GS_GratzMessage15_desc"] = "Grats Message 15 of 15 choosen randomly."

--Customize Welcome Messages----------------------------------------------------
L["GS_GSWelcomeMessages_name"] = "Customize Welcome messages."

L["GS_WelcomeMessage1_name"] = "Welcome Message 1"
L["GS_WelcomeMessage1_desc"] = "Welcome Message 1 of 10 choosen randomly."

L["GS_WelcomeMessage2_name"] = "Welcome Message 2"
L["GS_WelcomeMessage2_desc"] = "Welcome Message 2 of 10 choosen randomly."

L["GS_WelcomeMessage3_name"] = "Welcome Message 3"
L["GS_WelcomeMessage3_desc"] = "Welcome Message 3 of 10 choosen randomly."

L["GS_WelcomeMessage4_name"] = "Welcome Message 4"
L["GS_WelcomeMessage4_desc"] = "Welcome Message 4 of 10 choosen randomly."

L["GS_WelcomeMessage5_name"] = "Welcome Message 5"
L["GS_WelcomeMessage5_desc"] = "Welcome Message 5 of 10 choosen randomly."

L["GS_WelcomeMessage6_name"] = "Welcome Message 6 (Joined players name added to the end)"
L["GS_WelcomeMessage6_desc"] = "Welcome Message 6 of 10 choosen randomly."

L["GS_WelcomeMessage7_name"] = "Welcome Message 7 (Joined players name added to the end)"
L["GS_WelcomeMessage7_desc"] = "Welcome Message 7 of 10 choosen randomly."

L["GS_WelcomeMessage8_name"] = "Welcome Message 8 (Joined players name added to the end)"
L["GS_WelcomeMessage8_desc"] = "Welcome Message 8 of 10 choosen randomly."

L["GS_WelcomeMessage9_name"] = "Welcome Message 9 (Joined players name added to the end)"
L["GS_WelcomeMessage9_desc"] = "Welcome Message 9 of 10 choosen randomly."

L["GS_WelcomeMessage10_name"] = "Welcome Message 10 (Joined players name added to the end)"
L["GS_WelcomeMessage10_desc"] = "Welcome Message 10 of 10 choosen randomly."

--Customize Ding aka Leveled Messages-----------------------------------------------
L["GS_GSDingMessages_name"] = "Customize Ding aka leveled messages."

L["GS_DingMessage1_name"] = "Ding Message 1 (10)"
L["GS_DingMessage1_desc"] = "Welcome Message 1 of 7 used when player reached lvl 10."

L["GS_DingMessage2_name"] = "Ding Message 2 (20)"
L["GS_DingMessage2_desc"] = "Welcome Message 2 of 7 used when player reached lvl 20."

L["GS_DingMessage3_name"] = "Ding Message 3 (30)"
L["GS_DingMessage3_desc"] = "Welcome Message 3 of 7 used when player reached lvl 30."

L["GS_DingMessage4_name"] = "Ding Message 4 (40)"
L["GS_DingMessage4_desc"] = "Welcome Message 4 of 7 used when player reached lvl 40."

L["GS_DingMessage5_name"] = "Ding Message 5 (50)"
L["GS_DingMessage5_desc"] = "Welcome Message 5 of 7 used when player reached lvl 50."

L["GS_DingMessage6_name"] = "Ding Message 6 (60)"
L["GS_DingMessage6_desc"] = "Welcome Message 6 of 7 used when player reached lvl 60."

--For Future Use------------------------------------------------------------------------
-- L["GS_DingMessage7_name"] = "Ding Message 7 ()"
-- L["GS_DingMessage7_desc"] = "Welcome Message 7 of 8 used when player reached lvl 10."

-- L["GS_DingMessage8_name"] = "Ding Message 8 ()"
-- L["GS_DingMessage8_desc"] = "Welcome Message 8 of 9 used when player reached lvl 10."

-- L["GS_DingMessage9_name"] = "Ding Message 9 ()"
-- L["GS_DingMessage9_desc"] = "Welcome Message 9 of 10 used when player reached lvl 10."

-- L["GS_DingMessage10_name"] = "Ding Message 10 ()"
-- L["GS_DingMessage10_desc"] = "Welcome Message 10 of 11 used when player reached lvl 10."

-- L["GS_DingMessage11_name"] = "Ding Message 11 ()"
-- L["GS_DingMessage11_desc"] = "Welcome Message 11 of 12 used when player reached lvl 10."

-- L["GS_DingMessage12_name"] = "Ding Message 12 ()"
-- L["GS_DingMessage12_desc"] = "Welcome Message 12 of 13 used when player reached lvl 10."

-- L["GS_DingMessage13_name"] = "Ding Message 13 ()"
-- L["GS_DingMessage13_desc"] = "Welcome Message 13 of 14 used when player reached lvl 10."

-- L["GS_DingMessage14_name"] = "Ding Message 14 ()"
-- L["GS_DingMessage14_desc"] = "Welcome Message 14 of 15 used when player reached lvl 10."

-- L["GS_DingMessage15_name"] = "Ding Message 7 (other)"
-- L["GS_DingMessage15_desc"] = "Welcome Message 7 of 7 used when player reached levels inbetween the others above 11,43,etc.'"
---------------------------------------------------------------------------------------------------------------------

L["GS_RaidWarningGuildJoined"] = "A new member have joind the guild."
L["GS_RaidMessage_WhisperFrom"] = "[Whisper from:]"

L["GS_GreetMessages_name"] = "Customize Greet Messages"
L["GS_GreetMessages1_name"] = "Greet Message 1"
L["GS_GreetMessages1_desc"] = "Greet Message 1 of 2"
L["GS_GreetMessages2_name"] = "Greet Message 2"
L["GS_GreetMessages2_desc"] = "Greet Message 2 of 2"
