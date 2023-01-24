
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer

RunService.Stepped:Connect(function()
    for _, CoPlayer in pairs(Players:GetChildren()) do
        if CoPlayer ~= Player and CoPlayer.Character then
            for _, Part in pairs(CoPlayer.Character:GetChildren()) do
                if Part.Name == "HumanoidRootPart" then
                    Part.CanCollide = false
                end
            end
        end
    end
    
    for _, Accessory in pairs(workspace:GetChildren()) do
        if Accessory:IsA("Accessory") and Accessory:FindFirstChildWhichIsA("Part") then
            Accessory:FindFirstChildWhichIsA("Part"):Destroy()
        end
    end
end)
---

mouse = game.Players.LocalPlayer:GetMouse()
animationdebounce = false
gotanim = false
animations = {
["Around Town"] = 3303391864;
["Top Rock"] = 3361276673;
Fashionable = 3333331310;
Robot = 3338025566;
Twirl = 3334968680;
Jacks = 3338066331;
T = 3338010159;
Shy = 3337978742;
Monkey = 3333499508;
["Borock's Rage"] = 3236842542;
["Ud'zal's Summoning"] = 3303161675;
["Hype Dance"] = 3695333486;
Swoosh = 3361481910;
Sneaky = 3334424322;
["Side to Side"] = 3333136415;
Greatest = 3338042785;
Louder = 3338083565;
["Hero Landing"] = 5104344710;
Curtsy = 4555816777;
Idol = 4101966434;
Cower = 4940563117;
["Fancy Feet"] = 3333432454;
["Flowing Breeze"] = 7465946930;
["Boxing Punch"] = 7202863182;
["Power Blast"] = 4841403964;
Bodybuilder = 3333387824;
["Hips Poppin"] = 6797888062;
Panini = 5915713518;
HOLIDAY = 5937558680;
["Rodeo Dance"] = 5918728267;
Cobra = 7942890105;
["Dancin Shoes"] = 7404878500;
["Quiet Waves"]= 7465981288;
Floss = 5917459365;
["Show Dem Wrists"] = 7198989668;
["Old Town Road"] = 5937560570;
["Wake Up Call"] = 7199000883;
Shuffle = 4349242221;
["Lasso Turn"] = 7942896991;
Dizzy = 3361426436;
Tree = 4049551434;
Zombie = 4210116953;
AOK = 7942885103;
Sleep = 4686925579;
["Country Line Dance"] = 5915712534;
["Fake Cha Cha"] = 6862001787;
["Hero Landing"] = 5104344710;
["On The Outside"] = 7422779536;
["Break Dance"] = 5915648917;
["Cha Cha"] = 3695322025;
["Up and Down"] = 7422797678;
["Heart Skip"] = 11309255148;
["Cat Man"] = 11435175895;
["Piano Jump"] = 11453082181;
["Sidekicks"] = 10370362157;
["High hands"] = 10714361543;
["It aint my fault"] = 10714374267;
["Cartwheel"] = 10370351535;
["Elevate"] = 11394033602;
["Victory"] = 10714171628;
["Super charge"] = 10478338114;
["Dorky dance"] = 10714069471;
["Saturday dance"] = 10714382522;
REFLEX = 10714010337;
BLOOM = 10714007154;
HYDRO = 10147823318;
GEM = 10714008655;
}

function PlayAnim(id)
    animationdebounce = true
    local Anim = Instance.new("Animation")
    Anim.AnimationId = "rbxassetid://"..id
    local salute = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
    salute.Name = "FRICK"
    salute:Play(0)
    salute:AdjustSpeed(1)
    salute.Stopped:Connect(function()
        animationdebounce = false
    end)
end
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    gotanim = false
    lower = string.lower(msg)
    if lower == "/e t" then
        PlayAnim(animations["T"])
        gotanim = true
    end
    for i,v in pairs(animations) do
        if lower == string.sub(string.lower("/e "..tostring(i)), 1, #lower) and gotanim == false then
            gotanim = true
            PlayAnim(v)
        end
    end
    if gotanim == false and animationdebounce == false then
        if lower == "/e summon" or lower == "/e sum" then
            PlayAnim(animations["Ud'zal's Summoning"])
            gotanim = true
        end
        if lower == "/e rage" or lower == "/e rag" then
            PlayAnim(animations["Borock's Rage"])
            gotanim = true
        end
    end
end)

function animsbuttonfunction()
    print("------------------")
    for i,v in pairs(animations) do 
        print(tostring(i))
    end
    print("------------------")
end

animsbindable = Instance.new("BindableFunction")
animsbindable.OnInvoke = animsbuttonfunction

game.StarterGui:SetCore("SendNotification", {
    Title = "Done injecting!";
    Text = "CMD Anymations Script by toru!";
    Icon = "rbxassetid://847562022";
    Duration = 5;
})

game.StarterGui:SetCore("SendNotification", {
    Title = "How to use:";
    Text = "Say /e EMOTENAME to use that emote! (Shortened names work!)";
    Icon = "rbxassetid://2541869220";
    Duration = 8;
    Callback = animsbindable;
    Button1 = "Print emote names";
})