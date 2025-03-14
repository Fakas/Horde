PERK.PrintName = "Medic Base"
PERK.Description = "The Medic class is a durable support class that focuses on healing and buffing teammates.\nComplexity: MEDIUM\n\nRegenerate 2% health per second."

PERK.Hooks = {}
PERK.Hooks.Horde_OnSetPerk = function(ply, perk)
    if SERVER and perk == "medic_base" then
        ply:Horde_SetHealthRegenEnabled(true)
    end
end

PERK.Hooks.Horde_OnUnsetPerk = function(ply, perk)
    if SERVER and perk == "medic_base" then
        ply:Horde_SetHealthRegenEnabled(nil)
    end
end