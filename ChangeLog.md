### V3.8.3
* Update TOC to Patch 11.0.0
* Fixed issue with Deprecated API
* Updated "Limit Grats to current expansion" achievements category ids to The War Within.

### V3.8.2
* Update TOC to Patch 10.2.0
* Resolve error triggered by toggling 'With Name' option in Grats, Welcome, and Greets Messages
  Previously, an issue arose when enabling and then disabling the 'With Name' during a session would result in a nil check error if that message was randomly selected. This was due to the value switching to 'false' (code was looking for nil not false), causing the error. This fix addresses this issue."

### V3.8.1
* Updated TOC to Patch 10.0.5
* Updated "Limit Grats to current expansion" achievements category ids to Dragonflight.


### V3.8.0
* Updated TOC to Patch 9.1.5
* Customizing Gratz,Welcome,and Greet Messages are now dynamic you can now add or remove how many you want.
* The add button will add 1 to the bottom of the list.
* The Remove button will remove 1 from the bottom up of the list.
* Added "With name?" checkbox that will add the person's character name to the end of the message.

* Changed the layout a little bit Moved the "Customize Ding aka leveled Messages" to below "Customize Greets Messages".

* Removed "Say Guild Member's at the end of greet" from "Main Settings" since you can now enable it individually in the Customize Greet,Welcome,and Gratz menu.

* Default amount for each is:
* Greets:5
* Welcome:10 (6 to 10 have "With Name" enabled by default)
* Greet:3

* Fixed issue with gratz only triggering once.

### V3.7.1
* Made "Limit Grats to current expansion" setting hidden in classic since well the shadowlands hasn't been breached and Sylvanas stands in her throne room
in the Undercity :) aka no point for the setting in classic.


### V3.7.0
* updated TOC to Patch 9.0.5
* Added the ability to limit Grats to the current expansion achievements.
* When the Setting "Limit Grats to current expansion" is enabled only achievements from the current expansion will trigger a gratz message
* All other achievements (bfa,legion,basic lvl achievements,1000 quest,etc) will not trigger a gratz message.


### V3.6.1
* Changed how I'm uploading the addon its now Github with bigwigs packer for Packing and uploading to Curseforge
  Ace3 libs will be the latest version.
* "Greet Guild Members when they login." Works now.  
  When a Guild Member login it will greet them with a random Greet Message
  There are right now just 2 Diffrent Greets "Hi" and "Hello". I am working on a way for users to add more in the Options menu in a future version.
* "Say Guild member's name at the end of Greet?" Will add the Guild Member's name at the end of the greet if enabled Default is off.
  Greet Messages are customizable in the Guild Slacker Options menu
  
* Changed How Ding Messages worked 
  Removed Ding Messages 7 (other) 
  Levels 10,20,30,40,50,60 are still customizeable

### V3.6.0
* Changed how Achievements from group party members in the same guild is handled.
* If your in a group with an fellow Guild member and he/she gets an Achievement the Grats message is sent to guild chat         instead of part/raid
* WoW Classic Support WIP!!!!!

### V3.5.2
* Fixed Screenshot Date 
* Updated TOC to Patch 9.0.2

### V3.5.1
* Added Russion Translation by Harrisan (Корвусы-СД)
* Fixed issue with "Guild Welcome" not working 

### V3.5.0
* Added Locale Support  
  Right now only English is Supported if you want to help translate it into your native language Check out the  
  "Localization" tab on the GuildSlacker Curseforge Page or Click Here https://www.curseforge.com/wow/addons/guild-slacker/localization

### V3.4.1
* Fixed some deprecated Api I missed.

### V3.4
* Updated TOC to Patch 9.0.1.
* Updated to the latest stable Libs.
* Disabled all Lvl dings past lvl 60,When future expansions raise the max level it will be simple for me to enabled it again.
* Fixed issues related to deprecated API.
* Fixed Issues related to the Options Menu. 

### V3.3
* Updated TOC to Patch 8.2.
* Fix Spelling issue.
* Update to the latest stable Libs.
* Added the ability to customize the messages in the option menu.
* Added levels 110 and 120 ding messages.

### V3.2
* Updated TOC to Patch 8.0
* Fixed the issue where the incorrect date is displayed in chat when screenshot is taken.
* Update to the latest stable Libs

### V3.1
* Added date and time when screenshot is taken.

### V3.0
Hello my name is Glought with permission from Submann I have taken over the project.
I will be maintaining and improving the project.
All versions 3.0 and up is what I have worked on.

* I have converted Guild Slacker to the ace3 framework.
* I have added a options menu in "Interface/addon" called "Guild Slacker"
* Now your able to change Guild slacker settings ingame.
* Fixed a issue where you will welcome yourself when you join a guild.