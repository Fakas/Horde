local entmeta = FindMetaTable("Entity")

function entmeta:Horde_AddWeaken(duration)
    timer.Remove("Horde_RemoveWeaken" .. self:GetCreationID())
    timer.Create("Horde_RemoveWeaken" .. self:GetCreationID(), duration, 1, function ()
        self:Horde_RemoveWeaken()
    end)

    self.Horde_Weaken = 1
end

function entmeta:Horde_RemoveWeaken()
    if not self:IsValid() then return end
    self.Horde_Weaken = 0
end

function entmeta:Horde_GetWeaken()
    return self.Horde_Weaken or 0
end

hook.Add("EntityTakeDamage", "Horde_WeakenDamageTaken", function(target, dmg)
    if target:Horde_GetWeaken() == 0 then return end
    local attacker = dmg:GetAttacker()
    if attacker:IsPlayer() and target:IsNPC() then
        dmg:ScaleDamage(1 + 0.10 * (1 + attacker:Horde_GetApplyDebuffMore()))
    elseif attacker:IsNPC() and attacker:Horde_GetWeaken() == 1 then
        dmg:ScaleDamage(1 - 0.10 * (1 + attacker:Horde_GetApplyDebuffMore()))
    end
end)

hook.Add("Horde_ResetStatus", "Horde_WeakenReset", function(ply)
    ply.Horde_Weaken = 0
end)