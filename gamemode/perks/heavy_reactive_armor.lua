PERK.PrintName = "Reactive Armor"
PERK.Description = "While you have at least 5 armor:\n  Immune to Poison, Fire and Blast damage."
PERK.Icon = "materials/perks/reactive_armor.png"

PERK.Hooks = {}
PERK.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmg, bonus)
    if not ply:Horde_GetPerk("heavy_reactive_armor") then return end
    if ply:Armor() >= 5 and (dmg:GetDamageType() == DMG_NERVEGAS or dmg:GetDamageType() == DMG_ACID or dmg:GetDamageType() == DMG_POISON or dmg:GetDamageType() == DMG_FIRE or dmg:GetDamageType() == DMG_BURN or dmg:GetDamageType() == DMG_BLAST) then
        bonus.resistance = bonus.resistance + 1.0
    end
end
