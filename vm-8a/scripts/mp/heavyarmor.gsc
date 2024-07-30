#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\damage.gsc;

#namespace heavyarmor;

// Namespace heavyarmor / scripts\mp\heavyarmor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x107
// Size: 0x9d
function addheavyarmor(value) {
    struct = self.heavyarmor;
    if (!isdefined(self.struct)) {
        struct = spawnstruct(self.heavyarmor);
        struct.player = self;
        struct.hp = 0;
        self.heavyarmor = struct;
        struct.hp += value;
        self notify("heavyArmor_added");
        return;
    }
    struct.hp += value;
}

// Namespace heavyarmor / scripts\mp\heavyarmor
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac
// Size: 0xa2
function subtractheavyarmor(value) {
    assert(isdefined(self.heavyarmor) && self.heavyarmor.hp > 0);
    struct = self.heavyarmor;
    if (istrue(struct.immunityframe)) {
        return;
    }
    if (struct.hp > 0) {
        struct.hp = max(0, struct.hp - value);
        if (struct.hp <= 0) {
            thread heavyarmor_break();
        }
    }
}

// Namespace heavyarmor / scripts\mp\heavyarmor
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x256
// Size: 0x27
function removeheavyarmor() {
    assert(isdefined(self.heavyarmor));
    self notify("heavyArmor_removed");
    self.heavyarmor = undefined;
}

// Namespace heavyarmor / scripts\mp\heavyarmor
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x285
// Size: 0x1dd
function heavyarmormodifydamage(victim, attacker, damage, damageadd, smeansofdeath, sweapon, impactpoint, impactdir, shitloc, inflictor, query) {
    if (damage <= 0 && damageadd <= 0) {
        return [0, damage, damageadd];
    }
    if (smeansofdeath == "MOD_SUICIDE") {
        return [0, damage, damageadd];
    }
    if (isdefined(attacker) && (attacker.classname == "trigger_hurt" || attacker.classname == "worldspawn")) {
        return [0, damage, damageadd];
    }
    if (!victim hasheavyarmor()) {
        return [0, damage, damageadd];
    }
    if (isbombsiteweapon(sweapon)) {
        return [0, damage, damageadd];
    }
    if (victim hasheavyarmorinvulnerability()) {
        return [1, 1, 0];
    }
    var_b87fe815189396e6 = victim getheavyarmor();
    modifier = heavyarmor_getdamagemodifier(victim, attacker, damage, damageadd, smeansofdeath, sweapon, impactpoint, impactdir, shitloc, inflictor, query);
    modifieddamage = damage * modifier;
    var_b85ff186894ba31e = damageadd * modifier;
    modifieddamageblocked = modifieddamage + var_b85ff186894ba31e;
    if (!query) {
        victim subtractheavyarmor(modifieddamageblocked);
    }
    if (victim hasheavyarmorinvulnerability()) {
        return [var_b87fe815189396e6, 1, 0];
    }
    return [damage + damageadd, 1, 0];
}

// Namespace heavyarmor / scripts\mp\heavyarmor
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46b
// Size: 0x20
function getheavyarmor() {
    if (!hasheavyarmor()) {
        return 0;
    }
    return self.heavyarmor.hp;
}

// Namespace heavyarmor / scripts\mp\heavyarmor
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x494
// Size: 0x3d
function hasheavyarmor() {
    return isdefined(self.heavyarmor) && (self.heavyarmor.hp > 0 || istrue(self.heavyarmor.invulnerabilityframe));
}

// Namespace heavyarmor / scripts\mp\heavyarmor
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4da
// Size: 0x24
function hasheavyarmorinvulnerability() {
    return isdefined(self.heavyarmor) && istrue(self.heavyarmor.invulnerabilityframe);
}

// Namespace heavyarmor / scripts\mp\heavyarmor
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x507
// Size: 0x40
function heavyarmor_break() {
    self endon("disconnect");
    self endon("heavyArmor_removed");
    if (!isanymlgmatch()) {
        self.heavyarmor.invulnerabilityframe = 1;
    }
    self notify("heavyArmor_broken");
    waittillframeend();
    thread removeheavyarmor();
}

// Namespace heavyarmor / scripts\mp\heavyarmor
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54f
// Size: 0x11a
function heavyarmor_getdamagemodifier(victim, attacker, damage, damageadd, smeansofdeath, sweapon, impactpoint, impactdir, shitloc, inflictor, query) {
    modifiers = [];
    if (issuperweapon(sweapon)) {
        modifiers[modifiers.size] = 1.33;
    }
    if (isexplosivedamagemod(smeansofdeath)) {
        modifiers[modifiers.size] = 1.5;
    }
    if (smeansofdeath == "MOD_MELEE") {
        modifiers[modifiers.size] = 1.5;
    }
    if (isheadshot(shitloc, smeansofdeath, attacker)) {
        modifiers[modifiers.size] = 1.5;
    }
    bestmodifier = 1;
    foreach (modifier in modifiers) {
        if (modifier > bestmodifier) {
            modifier = bestmodifier;
        }
    }
    return bestmodifier;
}

