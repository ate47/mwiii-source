#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_2669878cf5a1b6bc;
#using script_34e2c429f1463c06;
#using scripts\cp_mp\vehicles\vehicle.gsc;

#namespace namespace_4d6911a5d970ff49;

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d3
// Size: 0xb
function initcrossbowusage(weapon) {
    
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e6
// Size: 0x4f
function crossbowusageloop(weapon) {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self endon("end_launcher");
    ammotype = getcrossbowammotype(weapon);
    var_74231e1029ef65b5 = getcrossbowimpactfunc(ammotype);
    thread crossbowimpactwatcher(weapon, ammotype, var_74231e1029ef65b5);
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33d
// Size: 0x15
function cleanupafterweaponswitch() {
    self waittill("end_launcher");
    wait 6;
    self notify("endImpactWatcher");
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35a
// Size: 0xe1
function crossbowimpactwatcher(watcherweapon, ammotype, var_74231e1029ef65b5) {
    self notify("endImpactWatcher");
    self endon("disconnect");
    self endon("endImpactWatcher");
    childthread cleanupafterweaponswitch();
    while (true) {
        var_9d7ca6252f103a3b, hitent, hitentpart, surfacenormal, surfacetype, weapon, bulletdir, impactpos, hitloc = self waittill("bullet_first_impact");
        if (watcherweapon != weapon) {
            continue;
        }
        bolt = spawncrossbowbolt(impactpos, bulletdir, ammotype, weapon);
        handleimpact(bolt, hitent, hitentpart, impactpos, surfacenormal, surfacetype, weapon, bulletdir, impactpos, var_74231e1029ef65b5);
    }
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x443
// Size: 0xb7
function handleimpact(bolt, hitent, hitentpart, hitloc, surfacenormal, surfacetype, weapon, bulletdir, impactpos, var_74231e1029ef65b5) {
    if (shouldreflect(surfacetype, bolt, hitent, hitentpart)) {
        reflectbolt(bolt, surfacenormal, bulletdir, impactpos);
    } else if (shoulddeleteimmediately(hitent)) {
        bolt deletebolt(1);
        return;
    } else if (shouldlink(hitent)) {
        linktoent(bolt, hitent, hitentpart);
    }
    if (isdefined(var_74231e1029ef65b5)) {
        self [[ var_74231e1029ef65b5 ]](bolt, hitent, hitentpart, hitloc, surfacetype);
    }
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x502
// Size: 0x62
function function_8c51cd45d4f7245d(bolt, hitent, hitentpart, hitloc, surfacetype) {
    camera = function_ec71c6a3676c9ee6(bolt, hitent, hitloc);
    if (isdefined(camera)) {
        bolt thread boltdeleteonnote(camera, "death");
        bolt thread boltdeleteonnote(camera, "explode");
    }
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56c
// Size: 0x7
function function_79a632d01cf0c669() {
    return "iw9_dm_recondartcrossbow_mp";
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57c
// Size: 0xac
function spawncrossbowbolt(impactpos, bulletdir, ammotype, weapon) {
    model = getboltmodel(ammotype);
    bolt = spawn("script_model", impactpos);
    bolt setmodel(model);
    bolt.angles = vectortoangles(bulletdir);
    bolt setdeleteable();
    bolt.owner = self;
    bolt.ammotype = ammotype;
    bolt.weapon = weapon;
    bolt.iscrossbowbolt = 1;
    bolt thread function_edf6a939d6f2d3af();
    return bolt;
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x631
// Size: 0xc
function setdeleteable() {
    self.deleteable = 0;
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x645
// Size: 0x10
function getcrossbowammotype(weapon) {
    return "bolt_recon";
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65e
// Size: 0x10
function getcrossbowimpactfunc(ammotype) {
    return &function_8c51cd45d4f7245d;
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x677
// Size: 0x10
function getboltmodel(ammotype) {
    return "weapon_wm_sn_crossbow_bolt_static";
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x690
// Size: 0x29
function validateboltent() {
    if (isdefined(self) && istrue(self.iscrossbowbolt)) {
        return 1;
    }
    assertmsg("Ent expects to be a crossbow bolt, but no longer is.");
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c1
// Size: 0x12f
function shouldreflect(surfacetype, bolt, hitent, hitentpart) {
    if (!isdefined(hitent) && isdefined(hitentpart)) {
        return 1;
    }
    if (!isdefined(surfacetype)) {
        return 0;
    }
    switch (surfacetype) {
    case #"hash_886109ae17c9aa73":
    case #"hash_8c9d4c67dcde81f2": 
        return 1;
    }
    if (bolt.ammotype == "bolt_explo") {
        return 0;
    }
    if (issameteamplayer(hitent)) {
        return 1;
    }
    if (issameteamagent(hitent)) {
        return 1;
    }
    switch (surfacetype) {
    case #"hash_321a9678047d0a4e":
    case #"hash_67e845c97d1f9eda":
    case #"hash_f9100fc94321f813": 
        return 1;
    case #"hash_fb5a4fd62140d3d":
    case #"hash_519950fd846289c6":
    case #"hash_7fe735e403d9fe08":
    case #"hash_b72d9dbb666bc59c":
    case #"hash_d70d4c17673f4162":
    case #"hash_f4d3c7f04f8ef31d": 
        if (bolt.ammotype == "bolt_fire") {
            return 0;
        } else {
            return 1;
        }
    default: 
        return 0;
    }
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f8
// Size: 0x74
function reflectbolt(bolt, surfacenormal, bulletdir, impactpos) {
    vec = math::vector_reflect(bulletdir, surfacenormal);
    dot = abs(vectordot(bulletdir, surfacenormal));
    reflect_velocity = math::factor_value(2300, 1000, dot);
    vec *= reflect_velocity;
    bolt physicslaunchserver(impactpos, vec);
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x874
// Size: 0x28
function issameteamplayer(hitent) {
    if (!isplayer(hitent)) {
        return 0;
    }
    if (scripts\cp_mp\utility\player_utility::isenemy(hitent)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a4
// Size: 0x42
function issameteamagent(hitent) {
    if (!isagent(hitent)) {
        return false;
    }
    if (isdefined(hitent.agentteam) && self.team == hitent.agentteam) {
        return true;
    }
    return false;
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ef
// Size: 0x3b
function deletebolt(var_c4a5a9d9ae155452) {
    if (!validateboltent()) {
        assertmsg("deleteBolt should should only be called on a bolt!");
    }
    if (var_c4a5a9d9ae155452) {
        /#
            iprintlnbold("<dev string:x1c>");
        #/
    }
    self delete();
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x932
// Size: 0x3f
function shoulddeleteimmediately(hitent) {
    if (!isdefined(hitent)) {
        return false;
    }
    if (isagent(hitent) && hitent is_suicidebomber() && !isalive(hitent) && !isdefined(hitent getcorpseentity())) {
        return true;
    }
    return false;
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97a
// Size: 0x20
function is_suicidebomber() {
    return istrue(isdefined(self.unittype) && self.unittype == "suicidebomber");
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a3
// Size: 0x5a
function removestuckenemyondeathordisconnect(hitent) {
    self endon("entitydeleted");
    hitent waittill_any_3("entitydeleted", "death", "disconnect");
    if (!validateboltent()) {
        return;
    }
    self.stuckenemyentity = undefined;
    if (isdefined(hitent) && isdefined(hitent.nocorpse)) {
        deletebolt(0);
    }
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa05
// Size: 0x30
function boltdeleteonnote(hitent, note) {
    self endon("entitydeleted");
    hitent waittill(note);
    if (!validateboltent()) {
        return;
    }
    deletebolt(0);
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3d
// Size: 0xa
function function_edf6a939d6f2d3af() {
    self waittill("entitydeleted");
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4f
// Size: 0xda
function linktoent(bolt, hitent, hitentpart) {
    if ((isplayer(hitent) || isagent(hitent)) && !isalive(hitent)) {
        corpse = hitent getcorpseentity();
        if (isdefined(corpse)) {
            hitent = corpse;
        }
    }
    if (isplayer(hitent)) {
        bolt hidefromplayer(hitent);
    }
    if (isdefined(hitentpart)) {
        bolt linkto(hitent, hitentpart);
    } else {
        bolt linkto(hitent);
    }
    if (cansticktoent(hitent)) {
        bolt.stuckenemyentity = hitent;
        bolt thread removestuckenemyondeathordisconnect(hitent);
    }
    bolt notsolid();
    bolt thread boltunlinkonnote(hitent);
    bolt thread boltdeleteonnote(hitent, "vehicle_deleted");
    bolt thread boltdeleteonnote(hitent, "detonated");
    bolt thread boltdeleteonnote(hitent, "beginC130");
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb31
// Size: 0x14
function shouldlink(hitent) {
    if (!isdefined(hitent)) {
        return false;
    }
    return true;
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4e
// Size: 0x35
function boltunlinkonnote(hitent) {
    self endon("entitydeleted");
    hitent waittill_any_2("entitydeleted", "disconnect");
    if (!validateboltent()) {
        return;
    }
    boltunlink();
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8b
// Size: 0x69
function boltunlink(launchvec) {
    if (!isdefined(launchvec)) {
        launchvec = (0, 0, 100);
    }
    if (self islinked()) {
        self unlink();
    }
    if (!isdefined(self.model) || self.model == "tag_origin") {
        return;
    }
    self solid();
    self physicslaunchserver(self.origin, launchvec);
}

// Namespace namespace_4d6911a5d970ff49 / namespace_d31450b702db9707
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfc
// Size: 0xf0
function cansticktoent(hitent) {
    canstick = 0;
    if (isplayer(hitent) || isagent(hitent)) {
        canstick = 1;
    }
    if (hitent scripts\cp_mp\vehicles\vehicle::isvehicle()) {
        canstick = 1;
    }
    if (isdefined(hitent.classname)) {
        if (hitent.classname == "misc_turret") {
            canstick = 1;
        }
        if (hitent.classname == "script_model") {
            if (isdefined(hitent.streakinfo) && (hitent.streakinfo.streakname == "uav" || hitent.streakinfo.streakname == "gunship")) {
                canstick = 1;
            }
        }
    }
    if (isdefined(hitent.equipmentref)) {
        if (hitent.equipmentref == "equip_tac_cover") {
            canstick = 1;
        }
    }
    return canstick;
}

