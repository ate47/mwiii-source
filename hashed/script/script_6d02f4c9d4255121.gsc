#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\utility\player.gsc;
#using script_df46ddb8a7df820;
#using script_206df27c2294a200;
#using script_3994d3c7df7fdf02;
#using script_1b65613b28eb18;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\mp\animation_suite.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\equipment.gsc;

#namespace mp_jup_highrise_xmas;

// Namespace mp_jup_highrise_xmas / namespace_fba1fa0ebe0b2b41
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b7
// Size: 0xe3
function main() {
    namespace_f4a1da82e54db100::main();
    namespace_2d492b7275c64bb4::main();
    namespace_6c72844d5d87e484::main();
    namespace_7b00c432bbb2e92::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_highrise_xmas");
    setdvar(@"r_umbraMinObjectContribution", 8);
    setdvar(@"r_umbraAccurateOcclusionThreshold", 1280);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    thread scripts\mp\animation_suite::animationsuite();
    thread function_4f48f01701f9e22b();
    if (getdvarint(@"hash_6277d2ae469fb2d6", 1)) {
        thread setupsnowballs();
    }
}

// Namespace mp_jup_highrise_xmas / namespace_fba1fa0ebe0b2b41
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a2
// Size: 0x20
function function_4f48f01701f9e22b() {
    if (scripts\cp_mp\utility\game_utility::getgametype() != "arena") {
        return;
    }
    function_a1f774c728610421();
    function_359d426bc2dca387();
}

// Namespace mp_jup_highrise_xmas / namespace_fba1fa0ebe0b2b41
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ca
// Size: 0x5f
function function_a1f774c728610421() {
    if (scripts\cp_mp\utility\game_utility::getgametype() == "arena" && !getdvarint(@"hash_2167cbfc86b6839", 0)) {
        outofbounds = getentarray("OutOfBoundsGunfight", "targetname");
        if (outofbounds.size > 0) {
            level.outofboundstriggers = array_combine(outofbounds, level.outofboundstriggers);
        }
    }
}

// Namespace mp_jup_highrise_xmas / namespace_fba1fa0ebe0b2b41
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x531
// Size: 0x152
function function_359d426bc2dca387() {
    var_1cf8be03fb3c42de = scripts\mp\spawnlogic::getspawnpointarray("mp_arena_spawn_allies_start");
    var_68c73806e24ff493 = scripts\mp\spawnlogic::getspawnpointarray("mp_arena_spawn_axis_start");
    spawnpointents = scripts\engine\utility::array_combine(var_1cf8be03fb3c42de, var_68c73806e24ff493);
    foreach (spawn_point in spawnpointents) {
        spawn_origin = getoriginidentifierstring(spawn_point);
        if (!getdvarint(@"hash_2167cbfc86b6839")) {
            if (isdefined(spawn_point.target) && spawn_point.target != "gunfight_only_spawn") {
                spawn_point.script_noteworthy = "";
                level.modifiedspawnpoints[spawn_origin][spawn_point.classname]["remove"] = 1;
            }
            continue;
        }
        if (isdefined(spawn_point.target) && spawn_point.target == "gunfight_only_spawn") {
            spawn_point.script_noteworthy = "";
            level.modifiedspawnpoints[spawn_origin][spawn_point.classname]["remove"] = 1;
        }
    }
}

// Namespace mp_jup_highrise_xmas / namespace_fba1fa0ebe0b2b41
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68b
// Size: 0xbe
function setupsnowballs() {
    level.snowfx["vanish"] = loadfx("vfx/core/impacts/small_snowhit");
    locs = getstructarray("snowball", "targetname");
    if (!isdefined(locs)) {
        return;
    }
    foreach (loc in locs) {
        if (loc.script_label == "snowball") {
            function_976a45c1d451c212(loc, 0);
            continue;
        }
        if (loc.script_label == "snowball_once_only") {
            function_976a45c1d451c212(loc, 1);
        }
    }
}

// Namespace mp_jup_highrise_xmas / namespace_fba1fa0ebe0b2b41
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x751
// Size: 0x1c8
function function_976a45c1d451c212(loc, var_9de09b025631ceec) {
    snowtype = "snowball";
    weapontier = "equip_snowball";
    equipmentinfo = spawnstruct();
    equipmentinfo.pickupstring = %MP_INGAME_ONLY/SNOWBALL_PICKUP;
    equipmentinfo.icon = "hud_icon_equipment_snowball";
    equipmentinfo.worldmodel = "weapon_wm_snowball";
    equipmentinfo.equiptype = "primary";
    equipment = spawn("script_model", loc.origin);
    equipment setmodel(equipmentinfo.worldmodel);
    userange = 64;
    var_4afe4f5482b5a827 = 64;
    var_36e496cdbc979837 = equipment getequipmenthinticon(weapontier);
    equipment.equipment = weapontier;
    equipment.equiptype = equipmentinfo.equiptype;
    equipment.angles = loc.angles;
    equipment makeusable();
    equipment sethinttag("tag_origin");
    equipment setcursorhint("HINT_BUTTON");
    equipment sethinticon(equipmentinfo.icon);
    equipment setuseholdduration("duration_short");
    equipment setusehideprogressbar(1);
    equipment sethintstring(equipmentinfo.pickupstring);
    equipment setusepriority(0);
    equipment sethintdisplayrange(var_4afe4f5482b5a827);
    equipment sethintdisplayfov(120);
    equipment setuserange(userange);
    equipment setusefov(210);
    equipment sethintonobstruction("show");
    equipment thread watchsnowballpickup(loc, var_9de09b025631ceec);
    equipment.targetname = "dropped_equipment";
}

// Namespace mp_jup_highrise_xmas / namespace_fba1fa0ebe0b2b41
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x921
// Size: 0x31
function private getequipmenthinticon(weapon) {
    table = "mp/arenaGGWeapons.csv";
    icon = tablelookup(table, 0, weapon, 3);
    return icon;
}

// Namespace mp_jup_highrise_xmas / namespace_fba1fa0ebe0b2b41
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x95b
// Size: 0x1b3
function watchsnowballpickup(loc, var_9de09b025631ceec) {
    self endon("death");
    player, droppeditem = self waittill("trigger");
    hasmaxammo = 0;
    var_f23035e6f6b69f91 = checkissameequip(player);
    equipammo = player scripts\mp\equipment::getequipmentammo(self.equipment);
    var_8b9ab3abae98d973 = 9;
    var_b64209459da65860 = checkcurrentequiptypeammocount(player);
    var_d9f8a2bc44267f00 = 1;
    if (var_f23035e6f6b69f91) {
        if (equipammo == var_8b9ab3abae98d973) {
            hasmaxammo = 1;
        }
    }
    if (var_f23035e6f6b69f91 && !hasmaxammo) {
        player scripts\mp\equipment::incrementequipmentammo(self.equipment, var_d9f8a2bc44267f00);
    } else if (var_b64209459da65860 && !var_f23035e6f6b69f91 && !isplayer(loc)) {
        player dropoldequipinplace(player scripts\mp\equipment::getcurrentequipment(self.equiptype));
    }
    if (!var_f23035e6f6b69f91) {
        player scripts\mp\equipment::giveequipment(self.equipment, self.equiptype);
        if (self.equipment == "equip_snowball" && !hasmaxammo) {
            player scripts\mp\equipment::incrementequipmentammo(self.equipment, var_d9f8a2bc44267f00);
        }
    }
    if (var_f23035e6f6b69f91 && hasmaxammo) {
        player iprintlnbold(%MP_INGAME_ONLY/EQUIPMENT_MAXED);
        thread watchsnowballpickup(loc, var_9de09b025631ceec);
        return;
    }
    player playlocalsound("weap_snowball_pickup");
    playfx(level.snowfx["vanish"], self.origin);
    if (var_9de09b025631ceec == 1) {
        self makeunusable();
        self delete();
        return;
    }
    thread watchsnowballpickup(loc, var_9de09b025631ceec);
}

// Namespace mp_jup_highrise_xmas / namespace_fba1fa0ebe0b2b41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb16
// Size: 0x3d
function checkissameequip(player) {
    equipref = player scripts\mp\equipment::getcurrentequipment(self.equiptype);
    if (isdefined(equipref)) {
        return (self.equipment == equipref);
    }
    return 0;
}

// Namespace mp_jup_highrise_xmas / namespace_fba1fa0ebe0b2b41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb5b
// Size: 0x15
function dropoldequipinplace(equipment) {
    function_976a45c1d451c212(self, 1);
}

// Namespace mp_jup_highrise_xmas / namespace_fba1fa0ebe0b2b41
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb78
// Size: 0x3a
function checkcurrentequiptypeammocount(player) {
    equipref = player scripts\mp\equipment::getcurrentequipment(self.equiptype);
    if (isdefined(equipref)) {
        return player scripts\mp\equipment::getequipmentammo(equipref);
    }
    return 0;
}

