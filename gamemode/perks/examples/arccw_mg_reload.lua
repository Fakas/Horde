PERK.PrintName = "Nimble Box"
PERK.Description = "ArcCW weapons with >= {threshold} magazine capacity reload {percent} faster."

 = {
    ["threshold"] = {type = "i", default = 60, min = 0},
    ["percent"] = {type = "f", default = 0.25, min = 0, percent = true},
}

PERK.Hooks = {}

local recalc = function(ply, perk)
    if perk == "arccw_mg_reload" then
        for _, wpn in pairs(ply:GetWeapons()) do
            if wpn.ArcCW then
                wpn:RecalcAllBuffs()
            end
        end
    end
end
PERK.Hooks.Horde_OnSetPerk = recalc
PERK.Hooks.Horde_OnUnsetPerk = recalc

-- You can modify ArcCW weapon stats with specially named hooks.
-- Specifically: O_Hook_STAT for overrides, M_Hook_STAT for multipliers and A_Hook_STAT for addition.
-- Edit the value in data.current
PERK.Hooks.M_Hook_Mult_ReloadTime = function(wpn, data)
    local ply = wpn:GetOwner()
    if IsValid(ply) and ply:IsPlayer() and ply:Horde_GetPerk("arccw_mg_reload")
            and (wpn.RegularClipSize or wpn.Primary.ClipSize) >= ply:Horde_GetPerkParam("arccw_mg_reload", "threshold") then
        data.mult = (data.mult or 1) - ply:Horde_GetPerkParam("arccw_mg_reload", "percent")
    end
end