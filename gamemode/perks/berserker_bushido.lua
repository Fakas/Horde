PERK.PrintName = "Bushido"
PERK.Description = "25% increased Slashing damage.\n25% increased movement speed."
PERK.Icon = "materials/perks/bushido.png"

PERK.Hooks = {}
PERK.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    if not ply:Horde_GetPerk("berserker_bushido") then return end
    if dmginfo:GetDamageType() == DMG_SLASH then
        bonus.increase = bonus.increase + 0.25
    end
end

PERK.Hooks.Horde_PlayerMoveBonus = function(ply, mv)
    if not ply:Horde_GetPerk("berserker_bushido") then return end
    ply:SetWalkSpeed(ply:GetWalkSpeed() * 1.25)
    ply:SetRunSpeed(ply:GetRunSpeed() * 1.25)
end