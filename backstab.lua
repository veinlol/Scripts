Library=loadstring(game:HttpGet("https://pastebin.com/raw/bfSMHFwJ"))()

Client = {
    Modules = {
        ClientEnvoirment,
        ClientMain,
    },
    Toggles = {
        BHop = false,
        Infammo = false,
        Automtatic = false,
        FireRate = false,
        NoRecoil = false,
        NoSpread = false,
        WallBang = false,
        InstantRespawn = false,
        AntiAim = false,
        AutoAmmo = false,
        AutoHealth = false,
        Trac = false,
        Sight = false,
        FOV = false,
        Golden = true,
        Visiblecheck = false,
        SilentAim = false,

    },
    Values = {
        JumpPower = 50,
        LookMeth = 'Look Up',                                                                                                                                                                                                                                                 
        Test = '',
        FOV = 150,
        ChatMsg = 'Bolts Ware v8 On Top',
        AimPart = 'Head'

        
    }
}

Config = {
    Infammo = false,
    Automtatic = false,
    FireRate = false,
    NoRecoil = false,
    NoSpread = false
}

local ArsoniaTable={
    Player={
        Combat={
            Main={
            Enabled=false,
            Killall=false,
            KillallMethod="Spoofed",
            Deathkill=false,
            DeathkillMethod="Spoofed",
            Killaura=false,
            KillauraMethod="Spoofed",
            Headstompaura=false,
            HeadstompauraVal=0,
            HeadstompauraType="Basic",
            ProjectileAura=false,
            ProjectileAuraMethod="Baseball Launcher",
            ProjectileAuraHead=0,
            ProjectileAuraAir=0,
            Knifeaura=false,
            KnifeauraCrit="None",
            KnifeauraFakeaim=false,
            KnifeauraAir=0,
            KnifeauraValue="Basic",
            Bombwalk=false,
            BombwalkBomb="Bomb",
            BombwalkTime=0,
        },
        Gunmods={
            Enabled=false,
            Firerate=0.02,
            Removerecoil=false,
            Firemode="Current",
            Instantreload=false,
            Forcebackstab=false,
            Removeonfire=false,
            RemoveonfireKnife=false,
            Removesway=false,
            Removebob=false,
            Clipsize=0,
            Kniferange=0,
            Instantequip=false,
            Removespread=false,
            Storedammo=0,
            Keepfov=false,
            Removescope=false,
            Autospool=false,
            Infcharge=false,
            Goldenmelee=false,
            Baseballgun=false,
            BaseballgunSpeed=0,
            BaseballgunValue="",
            Lasergun=false,
            LasergunCol=Color3.new(),
            LasergunValue="",
            ExplosiveBullets=false,
        },
    },
    Misc={
        Main={
            Enabled=false,
            Fastrespawn=false,
            Devicespoofer="PC",
            Pingspoofer="Current",
            Curse="None",
            Autodeploy=false,
            Doublechat=false,
            Removemapborders=false,
            Cloudspam=false,
            Antiteamleader=false,
            Antimonkey=false,
            Autopickupball=false,
            Autopickupbanana=false,
        },
        Trolling={
            Enabled=false,
            Bulletannoy=false,
            Flingall=false,
            Flingaura=false,
            Voiceannoy=false,
            Deleteball=false,
            Playersurf=false,
            WallTrap=false,
            WallTrapName="",
            WallTrapType="Forward",
        },
    },
    Variables={
        Croucher=false,
        Levels=(function()local a={Name=game.Players.LocalPlayer.Name}local Level,StartXp,EndXp,StartBar,EndBar=require(game.ReplicatedStorage.Xp).GetScore(game.Players.LocalPlayer.CareerStatsCache.Score.Value)a.Level=Level a.StartXp=StartXp a.EndXp=EndXp a.StartBar=StartBar a.EndBar=EndBar return a end)(),
        Levels_OLD=(function()local a={Name=game.Players.LocalPlayer.Name}local Level,StartXp,EndXp,StartBar,EndBar=require(game.ReplicatedStorage.Xp).GetScore(game.Players.LocalPlayer.CareerStatsCache.Score.Value)a.Level=Level a.StartXp=StartXp a.EndXp=EndXp a.StartBar=StartBar a.EndBar=EndBar return a end)(),
        --Hitparter = debug.getconstant(require(game:GetService("ReplicatedStorage").Modules.ClientFunctions).CreateProjectile,105),
        WallTargets={},
        Voices=(function()local a={}for _,v in pairs(game:GetService("ReplicatedFirst").Voices:GetDescendants())do if v:FindFirstChild("Looped")and v:FindFirstChild("Volume")and v:FindFirstChild("PlaybackSpeed")then table.insert(a,v)end end return a end)(),
        Curses={"None","Self-Knockback","Infinite Ammo","Fast Hands","Speedy","No Jumps","Slowed","Double Tap","Enraged","Slowed Tap","Hidden","Mystery"},
        BaseBalls=(function()local baseballs={}for _,v in pairs(game.ReplicatedStorage.Weapons:GetChildren())do if v:FindFirstChild("Projectile")then if v.Projectile:FindFirstChild("Baseball")then table.insert(baseballs,v.Name)end end end return baseballs end)(),
        BaseBallNames={["Baseball Launcher"]="Baseball",Superball="Superball",Slingshot="Rock",Ornament="Ornament",Ultraball="Yogaball",["Water Balloon"]="Water Balloon",PIZZA="Pizza Slice",Spellbook="Fireball",Snowball="Snowball",Presents="Present",["Ice Stars"]="Ninja Star",["Paintball Gun"]="Paintball",Dispenser="Pez",["TP Launcher"]="Toliet Paper",["Flaming Pumpkin"]="Molotov",["Trash Can"]="Trash Can",["Cone Launcher"]="Ice Cream Cone",},
        BaseBallNamesProper=(function()local baseballs={}for _,v in pairs(game.ReplicatedStorage.Weapons:GetChildren())do if v:FindFirstChild("Projectile")then if v.Projectile:FindFirstChild("Baseball")then table.insert(baseballs,v.Name)end end end local baseballnames={["Baseball Launcher"]="Baseball",Superball="Superball",Slingshot="Rock",Ornament="Ornament",Ultraball="Yogaball",["Water Balloon"]="Water Balloon",PIZZA="Pizza Slice",Spellbook="Fireball",Snowball="Snowball",Presents="Present",["Ice Stars"]="Ninja Star",["Paintball Gun"]="Paintball",Dispenser="Pez",["TP Launcher"]="Toliet Paper",["Flaming Pumpkin"]="Molotov",["Trash Can"]="Trash Can",["Cone Launcher"]="Ice Cream Cone",}local getfullbaseballnames={}for _,v in pairs(baseballs)do if baseballnames[v]then table.insert(getfullbaseballnames,baseballnames[v])else table.insert(getfullbaseballnames,v)end end local getfullbaseballnameswith={}for _,v in pairs(baseballs)do if baseballnames[v]then getfullbaseballnameswith[baseballnames[v]]=v else getfullbaseballnameswith[v]=v end end return getfullbaseballnameswith end)(),
        BaseBallNamesVisual=(function()local baseballs={}for _,v in pairs(game.ReplicatedStorage.Weapons:GetChildren())do if v:FindFirstChild("Projectile")then if v.Projectile:FindFirstChild("Baseball")then table.insert(baseballs,v.Name)end end end local baseballnames={["Baseball Launcher"]="Baseball",Superball="Superball",Slingshot="Rock",Ornament="Ornament",Ultraball="Yogaball",["Water Balloon"]="Water Balloon",PIZZA="Pizza Slice",Spellbook="Fireball",Snowball="Snowball",Presents="Present",["Ice Stars"]="Ninja Star",["Paintball Gun"]="Paintball",Dispenser="Pez",["TP Launcher"]="Toliet Paper",["Flaming Pumpkin"]="Molotov",["Trash Can"]="Trash Can",["Cone Launcher"]="Ice Cream Cone",}local getfullbaseballnames={}for _,v in pairs(baseballs)do if baseballnames[v]then table.insert(getfullbaseballnames,baseballnames[v])else table.insert(getfullbaseballnames,v)end end return getfullbaseballnames end)(),
        Lasers=(function()local a={}for _,v in pairs(game.ReplicatedStorage.Weapons:GetChildren())do if v:FindFirstChild("Laser")then table.insert(a,v.Name)end end return a end)(),
        Crouching=false,
        IsKnife=false,
        IsAlive=false,
        Offset_GUN=Vector3.new(),
        Killmethods={Spoofed=game.ReplicatedStorage.Weapons["Admin Launcher"],Demote=game.ReplicatedStorage.Weapons.Knife,Goldify=game.ReplicatedStorage.Weapons["Golden Gun"],["Goldify + Demote"]=game.ReplicatedStorage.Weapons["Golden Knife"],["Freeze + Demote"]=game.ReplicatedStorage.Weapons["Ice Dagger"],Equipped=game.ReplicatedStorage.Weapons.AWP,},
        Flames={Orange="Flamethrower",Green="Acid Spitter"},
        Yaw=0,
        CrouchYaw=0,
        CrouchPitch=0,
        TorsoYaw=0,
        Pitch=0,
        IsFall=false,
        Torso=0,
        Fly=false,
        CrouchOffset=0,
        Materials={"SmoothPlastic","Neon","Glass","ForceField"},
        Weapons=(function()local a={}for _,v in pairs(game.ReplicatedStorage.Weapons:GetChildren())do table.insert(a,v.Name)end return a end)(),
        MaxDamage=(function()local a=0 local b="AWP"for _,v in pairs(game.ReplicatedStorage.Weapons:GetChildren())do if v:FindFirstChild("DMG")then if v.DMG.Value>a then a=v.DMG.Value b=v end end end return b end)(),
        Animations={NoAnimation=(function()local a=Instance.new("Animation")a.AnimationId="rbxassetid://0"return a end)(),},
        Allprojectiles=(function()local a={}for _,v in pairs(game.ReplicatedStorage.Weapons:GetChildren())do if v:FindFirstChild("Projectile")then table.insert(a,v.Name)end end return a end)(),
        KeysPressed={},
        Functions={
            OldApplyVelocity=require(game.Players.LocalPlayer.PlayerGui.GUI.Client.Functions.General).applyvelocity,
            IsHackula=function()if game.Workspace:FindFirstChild("Map")then if game.Workspace.Map:FindFirstChild("Hackula")then if game.Workspace.Map.Hackula:FindFirstChild("Head")then return true end end end return false end,
            GetEnemys=function()local IsHackula=function()if game.Workspace:FindFirstChild("Map")then if game.Workspace.Map:FindFirstChild("Hackula")then if game.Workspace.Map.Hackula:FindFirstChild("Head")then return true end end end return false end local a={}if not IsHackula()then if not game.ReplicatedStorage.wkspc.Status.RoundOver.Value and not game.ReplicatedStorage.wkspc.Status.Preparation.Value and game.Players.LocalPlayer.Status.Team.Value~="Spectator"then for _,v in pairs(game.Players:GetChildren())do if(v.Team~=game.Players.LocalPlayer.Team or game.ReplicatedStorage.wkspc.FFA.Value)and v~=game.Players.LocalPlayer then if v.Character and not v.Character:FindFirstChild("ShuckyHAX")and v.Character:FindFirstChild("Spawned")then table.insert(a,v)end end end end else table.insert(a,{Character=game.Workspace.Map.Hackula})end return a end,
            GetIgnore=function()local Ignore={game.Players.LocalPlayer.Character,game.Workspace.Ray_Ignore,game.Workspace.CurrentCamera}if game.Workspace:FindFirstChild("Map")then if game.Workspace.Map:FindFirstChild("Ignore")then table.insert(Ignore,game.Workspace.Map.Ignore)end if game.Workspace.Map:FindFirstChild("Clips")then table.insert(Ignore,game.Workspace.Map.Clips)end end if game.Workspace:FindFirstChild("Character_FAKE")then table.insert(Ignore,game.Workspace.Character_FAKE)end for _,v in pairs(game.Players:GetChildren())do if v.Team==game.Players.LocalPlayer.Team and not game:GetService("ReplicatedStorage").wkspc.FFA.Value then if v.Character then table.insert(Ignore,v.Character)end end end return Ignore end,
            GetPlayers=function()local a={}for _,v in pairs(game.Players:GetChildren())do if v~=game.Players.LocalPlayer then if v.Character and not v.Character:FindFirstChild("ShuckyHAX")and v.Character:FindFirstChild("Spawned")then table.insert(a,v)end end end return a end,
            GetTrueIgnore=function()local Ignore={game.Players.LocalPlayer.Character,game.Workspace.Ray_Ignore,game.Workspace.CurrentCamera}if game.Workspace:FindFirstChild("Map")then if game.Workspace.Map:FindFirstChild("Ignore")then table.insert(Ignore,game.Workspace.Map.Ignore)end if game.Workspace.Map:FindFirstChild("Clips")then table.insert(Ignore,game.Workspace.Map.Clips)end end return Ignore end,
            GetPos1FromRay=function(Ray)local a=string.gsub(string.split(tostring(Ray),"},")[1],"{","")local b=string.split(a,", ")return Vector3.new(b[1],b[2],b[3])end,
            GetPos2FromRay=function(Ray)local a=string.gsub(string.split(tostring(Ray),"}, {")[2],"}","")a=string.split(a,", ")return Vector3.new(a[1],a[2],a[3])end,
            CreateProjectile=require(game.ReplicatedStorage.Modules.ClientFunctions).CreateProjectile,
            DoFlame=getsenv(game.Players.LocalPlayer.PlayerGui.GUI.Client).flamemoment.doflame,
            ColCol=function(a,b)return Color3.new(math.clamp(a.R+b.R,0,1),math.clamp(a.G+b.G,0,1),math.clamp(a.B+b.B,0,1))end,
            _=(function()if setfpscap then setfpscap(999)end for _,v in pairs(game.ReplicatedStorage.Viewmodels:GetChildren())do if v:FindFirstChild("HumanoidRootPart")then v.HumanoidRootPart.Transparency=1 end end 
                debug.setconstant(require(game.Players.LocalPlayer.PlayerGui.GUI.Client.Functions.Weapons).firebullet,321,"ArsoniaFireRate")
                debug.setconstant(require(game.Players.LocalPlayer.PlayerGui.GUI.Client.Functions.Weapons).reloadwep,123,"ArsoniaEReloadTime")
                debug.setconstant(require(game.Players.LocalPlayer.PlayerGui.GUI.Client.Functions.Weapons).countammo,61,"ArsoniaStoredAmmo")
               --XONAE IS A NIGGER
                debug.setconstant(getsenv(game.Players.LocalPlayer.PlayerGui.GUI.Client).updtprimary,9,"ArsoniaStoredAmmo")for _,v in pairs(game.ReplicatedStorage.Weapons:GetChildren())do if v:FindFirstChild("FireRate")then local a=v.FireRate:Clone()a.Parent=v a.Name="ArsoniaFireRate"end if v:FindFirstChild("ReloadTime")then local a=v.ReloadTime:Clone()a.Parent=v a.Name="ArsoniaReloadTime"end if v:FindFirstChild("EReloadTime")then local a=v.EReloadTime:Clone()a.Parent=v a.Name="ArsoniaEReloadTime"end if v:FindFirstChild("EquipTime")then local a=v.EquipTime:Clone()a.Parent=v a.Name="ArsoniaEquipTime"end if v:FindFirstChild("StoredAmmo")then local a=v.StoredAmmo:Clone()a.Parent=v a.Name="ArsoniaStoredAmmo"end if v:FindFirstChild("Range")and v:FindFirstChild("Melee")and v:FindFirstChild("Backstab")then local a=v.Range:Clone()a.Parent=v a.Name="ArsoniaRange"end end end)(),
            Unpacktable=(function()local a={["\a"]="\\a",["\b"]="\\b",["\f"]="\\f",["\n"]="\\n",["\r"]="\\r",["\t"]="\\t",["\v"]="\\v",["\0"]="\\0"}local b={["and"]=true,["break"]=true,["do"]=true,["else"]=true,["elseif"]=true,["end"]=true,["false"]=true,["for"]=true,["function"]=true,["if"]=true,["in"]=true,["local"]=true,["nil"]=true,["not"]=true,["or"]=true,["repeat"]=true,["return"]=true,["then"]=true,["true"]=true,["until"]=true,["while"]=true,["continue"]=true}local c={[DockWidgetPluginGuiInfo.new]="DockWidgetPluginGuiInfo.new",[warn]="warn",[CFrame.fromMatrix]="CFrame.fromMatrix",[CFrame.fromAxisAngle]="CFrame.fromAxisAngle",[CFrame.fromOrientation]="CFrame.fromOrientation",[CFrame.fromEulerAnglesXYZ]="CFrame.fromEulerAnglesXYZ",[CFrame.Angles]="CFrame.Angles",[CFrame.fromEulerAnglesYXZ]="CFrame.fromEulerAnglesYXZ",[CFrame.new]="CFrame.new",[gcinfo]="gcinfo",[os.clock]="os.clock",[os.difftime]="os.difftime",[os.time]="os.time",[os.date]="os.date",[tick]="tick",[bit32.band]="bit32.band",[bit32.extract]="bit32.extract",[bit32.bor]="bit32.bor",[bit32.bnot]="bit32.bnot",[bit32.arshift]="bit32.arshift",[bit32.rshift]="bit32.rshift",[bit32.rrotate]="bit32.rrotate",[bit32.replace]="bit32.replace",[bit32.lshift]="bit32.lshift",[bit32.lrotate]="bit32.lrotate",[bit32.btest]="bit32.btest",[bit32.bxor]="bit32.bxor",[pairs]="pairs",[NumberSequence.new]="NumberSequence.new",[assert]="assert",[tonumber]="tonumber",[Color3.fromHSV]="Color3.fromHSV",[Color3.toHSV]="Color3.toHSV",[Color3.fromRGB]="Color3.fromRGB",[Color3.new]="Color3.new",[Delay]="Delay",[Stats]="Stats",[UserSettings]="UserSettings",[coroutine.resume]="coroutine.resume",[coroutine.yield]="coroutine.yield",[coroutine.running]="coroutine.running",[coroutine.status]="coroutine.status",[coroutine.wrap]="coroutine.wrap",[coroutine.create]="coroutine.create",[coroutine.isyieldable]="coroutine.isyieldable",[NumberRange.new]="NumberRange.new",[PhysicalProperties.new]="PhysicalProperties.new",[PluginManager]="PluginManager",[Ray.new]="Ray.new",[NumberSequenceKeypoint.new]="NumberSequenceKeypoint.new",[Version]="Version",[Vector2.new]="Vector2.new",[Instance.new]="Instance.new",[delay]="delay",[spawn]="spawn",[unpack]="unpack",[string.split]="string.split",[string.match]="string.match",[string.gmatch]="string.gmatch",[string.upper]="string.upper",[string.gsub]="string.gsub",[string.format]="string.format",[string.lower]="string.lower",[string.sub]="string.sub",[string.pack]="string.pack",[string.rep]="string.rep",[string.char]="string.char",[string.packsize]="string.packsize",[string.reverse]="string.reverse",[string.byte]="string.byte",[string.unpack]="string.unpack",[string.len]="string.len",[string.find]="string.find",[CellId.new]="CellId.new",[ypcall]="ypcall",[version]="version",[print]="print",[stats]="stats",[printidentity]="printidentity",[settings]="settings",[UDim2.fromOffset]="UDim2.fromOffset",[UDim2.fromScale]="UDim2.fromScale",[UDim2.new]="UDim2.new",[table.pack]="table.pack",[table.move]="table.move",[table.insert]="table.insert",[table.getn]="table.getn",[table.foreachi]="table.foreachi",[table.maxn]="table.maxn",[table.foreach]="table.foreach",[table.concat]="table.concat",[table.unpack]="table.unpack",[table.find]="table.find",[table.create]="table.create",[table.sort]="table.sort",[table.remove]="table.remove",[TweenInfo.new]="TweenInfo.new",[loadstring]="loadstring",[require]="require",[Vector3.FromNormalId]="Vector3.FromNormalId",[Vector3.FromAxis]="Vector3.FromAxis",[Vector3.fromAxis]="Vector3.fromAxis",[Vector3.fromNormalId]="Vector3.fromNormalId",[Vector3.new]="Vector3.new",[Vector3int16.new]="Vector3int16.new",[setmetatable]="setmetatable",[next]="next",[Wait]="Wait",[wait]="wait",[ipairs]="ipairs",[elapsedTime]="elapsedTime",[time]="time",[rawequal]="rawequal",[Vector2int16.new]="Vector2int16.new",[collectgarbage]="collectgarbage",[newproxy]="newproxy",[Spawn]="Spawn",[PluginDrag.new]="PluginDrag.new",[Region3.new]="Region3.new",[utf8.offset]="utf8.offset",[utf8.codepoint]="utf8.codepoint",[utf8.nfdnormalize]="utf8.nfdnormalize",[utf8.char]="utf8.char",[utf8.codes]="utf8.codes",[utf8.len]="utf8.len",[utf8.graphemes]="utf8.graphemes",[utf8.nfcnormalize]="utf8.nfcnormalize",[xpcall]="xpcall",[tostring]="tostring",[rawset]="rawset",[PathWaypoint.new]="PathWaypoint.new",[DateTime.fromUnixTimestamp]="DateTime.fromUnixTimestamp",[DateTime.now]="DateTime.now",[DateTime.fromIsoDate]="DateTime.fromIsoDate",[DateTime.fromUnixTimestampMillis]="DateTime.fromUnixTimestampMillis",[DateTime.fromLocalTime]="DateTime.fromLocalTime",[DateTime.fromUniversalTime]="DateTime.fromUniversalTime",[Random.new]="Random.new",[typeof]="typeof",[RaycastParams.new]="RaycastParams.new",[math.log]="math.log",[math.ldexp]="math.ldexp",[math.rad]="math.rad",[math.cosh]="math.cosh",[math.random]="math.random",[math.frexp]="math.frexp",[math.tanh]="math.tanh",[math.floor]="math.floor",[math.max]="math.max",[math.sqrt]="math.sqrt",[math.modf]="math.modf",[math.pow]="math.pow",[math.atan]="math.atan",[math.tan]="math.tan",[math.cos]="math.cos",[math.sign]="math.sign",[math.clamp]="math.clamp",[math.log10]="math.log10",[math.noise]="math.noise",[math.acos]="math.acos",[math.abs]="math.abs",[math.sinh]="math.sinh",[math.asin]="math.asin",[math.min]="math.min",[math.deg]="math.deg",[math.fmod]="math.fmod",[math.randomseed]="math.randomseed",[math.atan2]="math.atan2",[math.ceil]="math.ceil",[math.sin]="math.sin",[math.exp]="math.exp",[getfenv]="getfenv",[pcall]="pcall",[ColorSequenceKeypoint.new]="ColorSequenceKeypoint.new",[ColorSequence.new]="ColorSequence.new",[type]="type",[Region3int16.new]="Region3int16.new",[ElapsedTime]="ElapsedTime",[select]="select",[getmetatable]="getmetatable",[rawget]="rawget",[Faces.new]="Faces.new",[Rect.new]="Rect.new",[BrickColor.Blue]="BrickColor.Blue",[BrickColor.White]="BrickColor.White",[BrickColor.Yellow]="BrickColor.Yellow",[BrickColor.Red]="BrickColor.Red",[BrickColor.Gray]="BrickColor.Gray",[BrickColor.palette]="BrickColor.palette",[BrickColor.New]="BrickColor.New",[BrickColor.Black]="BrickColor.Black",[BrickColor.Green]="BrickColor.Green",[BrickColor.Random]="BrickColor.Random",[BrickColor.DarkGray]="BrickColor.DarkGray",[BrickColor.random]="BrickColor.random",[BrickColor.new]="BrickColor.new",[setfenv]="setfenv",[UDim.new]="UDim.new",[Axes.new]="Axes.new",[error]="error",[debug.traceback]="debug.traceback",[debug.profileend]="debug.profileend",[debug.profilebegin]="debug.profilebegin"}function GetHierarchy(d)local e={}local f=1;local g=d;while g do g=g.Parent;f=f+1 end;g=d;local h=0;while g do h=h+1;local i=string.gsub(g.Name,"[%c%z]",a)i=g==game and"game"or i;if b[i]or not string.match(i,"^[_%a][_%w]*$")then i='["'..i..'"]'elseif h~=f-1 then i="."..i end;e[f-h]=i;g=g.Parent end;return table.concat(e)end;local function j(k,l)if l=="string"then return string.format('"%s"',string.gsub(k,"[%c%z]",a))elseif l=="Instance"then return GetHierarchy(k)elseif type(k)~=l then return l..".new("..tostring(k)..")"elseif l=="function"then return c[k]or"'[Unknown "..(pcall(setfenv,k,getfenv(k))and"Lua"or"C").." "..tostring(k).."]'"elseif l=="userdata"then return"newproxy("..tostring(not not getmetatable(k))..")"elseif l=="thread"then return"'"..tostring(k)..", status: "..coroutine.status(k).."'"else return tostring(k)end end;local function m(n,o,p,q)o=o or{}local r=o[n]if r then return(r[1]==p[1]-1 and"'[Cyclic Parent "or"'[Cyclic ")..tostring(n)..", path: "..r[2].."]'"end;q=q or"ROOT"p=p or{0,q}local s=p[1]+1;p[1]=s;p[2]=q;o[n]=p;local t=string.rep("    ",s)local u=string.rep("    ",s-1)local v="{"local w="\n"..t;local x=true;local y=1;local z=true;for A,k in next,n do z=false;if y~=A then x=false else y=y+1 end;local B,C=typeof(A),typeof(k)local D=false;if B=="string"then A=string.gsub(A,"[%c%z]",a)if b[A]or not string.match(A,"^[_%a][_%w]*$")then D=true;A=string.format('["%s"]',A)end else D=true;A="["..(B=="table"and string.gsub(m(A,o,{s,q}),"^%s*(.-)%s*$","%1")or j(A,B)).."]"end;k=C=="table"and m(k,o,{s,q},q..(D and""or".")..A)or j(k,C)v=v..w..(x and k or A.." = "..k)..","end;return z and v.."}"or string.sub(v,1,-2).."\n"..u.."}"end;return m end)(),
            DoFEFlame=function(a,b)getsenv(game.Players.LocalPlayer.PlayerGui.GUI.Client).flamemoment.doflame(game.Players.LocalPlayer,a,Vector3.new(),b,0,Vector3.new())game:GetService("ReplicatedStorage").Events.Flames:FireServer(a,Vector3.new(),b,0,Vector3.new())end,
            Shakecam=getsenv(game.Players.LocalPlayer.PlayerGui.GUI.Client.Functions.Weapons).ShakeCam,
            Getammo=require(game.Players.LocalPlayer.PlayerGui.GUI.Client.Functions.Weapons).getammo,
            CalculateSpread=require(game:GetService("ReplicatedStorage").Modules.Spread).calcspread,
            SummonBaseBall=function(a,b)a=(function()local baseballs={}for _,v in pairs(game.ReplicatedStorage.Weapons:GetChildren())do if v:FindFirstChild("Projectile")then if v.Projectile:FindFirstChild("Baseball")then table.insert(baseballs,v.Name)end end end local baseballnames={["Baseball Launcher"]="Baseball",Superball="Superball",Slingshot="Rock",Ornament="Ornament",Ultraball="Yogaball",["Water Balloon"]="Water Balloon",PIZZA="Pizza Slice",Spellbook="Fireball",Snowball="Snowball",Presents="Present",["Ice Stars"]="Ninja Star",["Paintball Gun"]="Paintball",Dispenser="Pez",["TP Launcher"]="Toliet Paper",["Flaming Pumpkin"]="Molotov",["Trash Can"]="Trash Can",["Cone Launcher"]="Ice Cream Cone",}local getfullbaseballnames={}for _,v in pairs(baseballs)do if baseballnames[v]then table.insert(getfullbaseballnames,baseballnames[v])else table.insert(getfullbaseballnames,v)end end local getfullbaseballnameswith={}for _,v in pairs(baseballs)do if baseballnames[v]then getfullbaseballnameswith[baseballnames[v]]=v else getfullbaseballnameswith[v]=v end end return getfullbaseballnameswith end)()[a]or a require(game.ReplicatedStorage.Modules.ClientFunctions).CreateProjectile(game.Players.LocalPlayer.Name,"Baseball",b,game.Workspace.CurrentCamera.CFrame.Position+game.Workspace.CurrentCamera.CFrame.LookVector*500,CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,1.5+game.Players.LocalPlayer.Character.Humanoid.CameraOffset.Y,0)),45,0,0,0,a,game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,1.5+game.Players.LocalPlayer.Character.Humanoid.CameraOffset.Y,0),false,{},1)game:GetService("ReplicatedStorage").Events.ReplicateProjectile:FireServer({"Baseball",b,game.Workspace.CurrentCamera.CFrame.Position+game.Workspace.CurrentCamera.CFrame.LookVector*500,CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,1.5+game.Players.LocalPlayer.Character.Humanoid.CameraOffset.Y,0)),45,0,0,0,a,game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,1.5+game.Players.LocalPlayer.Character.Humanoid.CameraOffset.Y,0),false,{},1})end,
            SummonLaser=function(a,b)require(game:GetService("ReplicatedStorage").Modules.ClientFunctions).createtrail(game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,1.4+game.Players.LocalPlayer.Character.Humanoid.CameraOffset.Y,0),game.Workspace.CurrentCamera.CFrame.LookVector,{},a,b,game.Players.LocalPlayer.Character.HumanoidRootPart,game.Players.LocalPlayer.Name)game.ReplicatedStorage.Events.Trail:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,1.5+game.Players.LocalPlayer.Character.Humanoid.CameraOffset.Y,0),game.Workspace.CurrentCamera.CFrame.LookVector,{},a,b,game.Players.LocalPlayer.Character.HumanoidRootPart)end,
            IsRoundOver=function()if game.ReplicatedStorage.wkspc.Status.RoundOver.Value or game.ReplicatedStorage.wkspc.Status.Preparation.Value then return true end return false end,
        },
        TargetableParts={HeadHB={},Torso={},LeftArm={},RightArm={},LeftLeg={},RightLeg={},Backtrack_HeadHB={},Backtrack_Torso={},Backtrack_LeftArm={},Backtrack_RightArm={},Backtrack_LeftLeg={},Backtrack_RightLeg={}},
        TargetsWithoutFull={HeadHB={{"HeadHB"},"HeadHB"},LeftHand={{"LeftHand","LeftLowerArm","LeftUpperArm"},"LeftArm"},RightHand={{"RightHand","RightLowerArm","RightUpperArm"},"RightArm"},LeftFoot={{"LeftFoot","LeftLowerLeg","LeftUpperLeg"},"LeftLeg"},RightFoot={{"RightFoot","RightLowerLeg","RightUpperLeg"},"RightLeg"},UpperTorso={{"UpperTorso","LowerTorso"},"Torso"},},
        R6TR15={HeadHB={"HeadHB"},LeftArm={"LeftHand","LeftLowerArm","LeftUpperArm"},RightArm={"RightHand","RightLowerArm","RightUpperArm"},LeftLeg={"LeftFoot","LeftLowerLeg","LeftUpperLeg"},RightLeg={"RightFoot","RightLowerLeg","RightUpperLeg"},Torso={"UpperTorso","LowerTorso"},All={"HeadHB","LeftHand","LeftLowerArm","LeftUpperArm","RightHand","RightLowerArm","RightUpperArm","UpperTorso","LowerTorso","RightFoot","RightLowerLeg","RightUpperLeg","LeftFoot","LeftLowerLeg","LeftUpperLeg"},},
        TargetNames={"HeadHB","Torso","LeftArm","RightArm","LeftLeg","RightLeg"},
        HumParts={"HeadHB","LeftHand","LeftLowerArm","LeftUpperArm","RightHand","RightLowerArm","RightUpperArm","UpperTorso","LowerTorso","RightFoot","RightLowerLeg","RightUpperLeg","LeftFoot","LeftLowerLeg","LeftUpperLeg"},
        Backtracks={},
        WallProPos=Vector3.new(),
        CamAngles=0,
        TrapPosOld=Vector3.new(),
    },
}

CombatTabGunmodsSection:Toggle("Force Backstab",function(x)
    ArsoniaTable.Combat.Gunmods.Forcebackstab=x
    if ArsoniaTable.Combat.Gunmods.Enabled then
        getsenv(game.Players.LocalPlayer.PlayerGui.GUI.Client).givetools()
        require(game.Players.LocalPlayer.PlayerGui.GUI.Client.Functions.Weapons).usethatgun()
    end
end)
    elseif tostring(method)=="LoadAnimation"then
        if tostring(a)=="Guy"then
            if ArsoniaTable.Combat.Gunmods.Enabled then
                if ArsoniaTable.Combat.Gunmods.Forcebackstab then
                    if tostring(b)=="fire"or tostring(b)=="fire2"or tostring(b)=="fire3"then
                        if b.Parent then
                            pcall(function()
                                b=b.Parent.fire4
                            end)
                        end
                    end
                end
--Index
mt.__index=newcclosure(function(a,b)
    if tostring(a)=="HumanoidRootPart"and tostring(b)=="CFrame"then
        if ArsoniaTable.Combat.Gunmods.Enabled then
            if ArsoniaTable.Combat.Gunmods.Forcebackstab then
                if a~=game.Players.LocalPlayer.Character.HumanoidRootPart then
                    return CFrame.new(a.Position,game.Players.LocalPlayer.Character.HumanoidRootPart.Position)*CFrame.Angles(0,math.rad(180),0)
                end
            end
        end
    end
    return oldIndex(a,b)
end)
