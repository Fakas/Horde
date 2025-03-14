PERK.PrintName = "In A Hurry"
PERK.Description = "Run {speed}HU/s faster."

local speed = 40

-- OnSetPerk is *not* called per spawn, but speed is reset when spawning
-- We set a variable to make sure we don't accidently give or take more speed than needed
PERK.Hooks = {}
PERK.Hooks.Horde_OnSetPerk = function(ply, perk)
    if perk == "speed_bonus_run" and not ply.Horde_Run_Bonus then
        ply:SetRunSpeed(ply:GetRunSpeed() + speed)
        ply.Horde_Run_Bonus = true
    end
end
PERK.Hooks.Horde_OnUnsetPerk = function(ply, perk)
    if perk == "speed_bonus_run" and ply.Horde_Run_Bonus then
        ply:SetRunSpeed(ply:GetRunSpeed() - speed)
        ply.Horde_Run_Bonus = false
    end
end
PERK.Hooks.PlayerSpawn = function(ply)
    if ply:Horde_GetPerk("speed_bonus_run") then
        ply:SetRunSpeed(ply:GetRunSpeed() + speed)
        ply.Horde_Run_Bonus = true
    end
end