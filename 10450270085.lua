local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Big Booty Men",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Oiling up...",
   LoadingSubtitle = "by BigDickExploit",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "HomeworkBBM"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local players = game:GetService("Players")
local char = players.LocalPlayer.Character
local maxDistance = 2000

-------------------------------------------------------
function killaura()
	while getgenv().killaura == true do
		for i,v in pairs(workspace.Objects.Mobs:GetChildren()) do
			if v:WaitForChild("Humanoid") then
				local target = v:WaitForChild("Humanoid")
				
				local ohNumber1 = 2
				local ohTable2 = {target}
				local ohNumber3 = 16

				game:GetService("ReplicatedStorage").Remotes.Server.Combat.M1:FireServer(ohNumber1, ohTable2, ohNumber3)
				game:GetService("ReplicatedStorage").Remotes.Server.Combat.M1:FireServer(ohNumber1, ohTable2)				
			end
		end
		wait(.05)
	end
end

function killauratp()
while getgenv().killauratp == true do
	function getNearest(plr)
		local target 
		local targetDistance = math.huge
		local playerPosition = char:WaitForChild("HumanoidRootPart").Position

		for _, targets in pairs(workspace.Objects.Mobs:GetChildren()) do
			local targetHumanoid = targets.Humanoid
			local targetHumanoidRootPart = targets.HumanoidRootPart
			local targetPosition = targets.HumanoidRootPart.Position
			if targets:IsA("Model") and targetHumanoid and targetHumanoidRootPart and targetHumanoid.Health > 0 then
				local magnitude = (targetPosition - playerPosition).Magnitude
				if magnitude < maxDistance and magnitude < targetDistance then
					target = targets
					targetDistance = magnitude
				end
			end
		end
		
		if not target then targetDistance = nil end
		return target
	end

	function tpToNearest(toTp)
		print(toTp)
		if toTp == nil then return
		else
		char.HumanoidRootPart.CFrame = toTp.HumanoidRootPart.CFrame
		end
	end
	tpToNearest(getNearest())
	wait()
	end
end

function spamBlackflash()
	while getgenv().spamBF == true do
		game:GetService("ReplicatedStorage").Remotes.Server.Combat.ApplyBlackFlashToNextHitbox:FireServer()
		wait()
		local ohNumber1 = 2
		game:GetService("ReplicatedStorage").Remotes.Server.Combat.M2:FireServer(ohNumber1)
	end
end

function instantHeal()
	while getgenv().instantHeal == true do		
		local healTime = 0
		game:GetService("ReplicatedStorage").Remotes.Server.Combat.ReverseHeal:InvokeServer(healTime)
		wait()
	end
end



-------------------------------------------------------
local MainTab = Window:CreateTab("Main", "rewind") -- Title, Ima
-------------------------------------------------------
local MainSection = MainTab:CreateSection("Main")
local KillAuraToggle = MainTab:CreateToggle({
   Name = "KillAura",
   CurrentValue = false,
   Flag = "KillAura", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		getgenv().killaura = Value
		killaura()
   end,
})
local TpAuraToggle = MainTab:CreateToggle({
   Name = "Tp to nearest mobs",
   CurrentValue = false,
   Flag = "TpAuraAura", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		getgenv().killauratp = Value
		killauratp()
   end,
})
local BlackFlashToggle = MainTab:CreateToggle({
   Name = "Spam Blackflashes",
   CurrentValue = false,
   Flag = "spamBlackflash", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		getgenv().spamBF = Value
		spamBlackflash()
   end,
})
local TpRangeSlider = MainTab:CreateSlider({
   Name = "Tp Range",
   Range = {100, 10000},
   Increment = 100,
   Suffix = "Studs",
   CurrentValue = 2000,
   Flag = " Tp Range", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		
   end,
})
local instantHealToggle = MainTab:CreateToggle({
   Name = "InstantHeal",
   CurrentValue = false,
   Flag = "instantHeal", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
		getgenv().instantHeal = Value
		instantHeal()
   end,
})
local healSoundSlider = MainTab:CreateSlider({
   Name = "Heal Volume",
   Range = {0.1, 1},
   Increment = .1,
   Suffix = "Volume",
   CurrentValue = 1,
   Flag = " healSoundSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
	local healSound = game.Players.LocalPlayer.Character.HumanoidRootPart.HealBurst
	local healSound2 = game.Players.LocalPlayer.Character.HumanoidRootPart.HealSound
	healSound.Volume = Value
	healSound2.Volume = Value
   end,
})

local CollectSection = MainTab:CreateSection("Collect")
local CollectTab = MainTab:CreateButton({
   Name = "Collect all spawned drops",
   Callback = function()
		for i,v in pairs(workspace.Objects.Drops:GetDescendants()) do
			if v:IsA("ProximityPrompt") then
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.PrimaryPart.CFrame
			wait(.2)
			fireproximityprompt(v)
			end
		end
   end,
})
local CollectTab = MainTab:CreateButton({
   Name = "test",
   Callback = function()
		if iswindowactive() then
			keypress(0x57)  -- Press 'W' key
			wait(1)
			keyrelease(0x57)  -- Release 'W' key

			mousemoverel(0, 100)  -- Move mouse 100 pixels down
			mouse1click()  -- Perform a left-click
		end
   end,
})


-------------------------------------------------------
local OtherTab = Window:CreateTab("Others", 4483362458) -- Title, Image
-------------------------------------------------------
local DebugSection = OtherTab:CreateSection("Debug")
local IYTab = OtherTab:CreateButton({
   Name = "IY",
   Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})
local HydroxideTab = OtherTab:CreateButton({
   Name = "Hydroxide",
   Callback = function()
		local owner = "Upbolt"
		local branch = "revision"

		local function webImport(file)
			return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
		end

		webImport("init")
		webImport("ui/main")
   end,
})
