#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_7ab5b649fa408138;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_44b8991c2b01716a;
#using scripts\mp\equipment\support_box.gsc;

#namespace namespace_25c6225632fa6610;

// Namespace namespace_25c6225632fa6610 / namespace_f5e13928bdbda502
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x284
// Size: 0x6c
function autoexec main() {
    level.var_82dfe148ced1f477 = &function_82dfe148ced1f477;
    gametype = getdvar(@"ui_gametype", "");
    if (isdefined(level.gametype) && scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        function_8639626f9311efca();
        return;
    }
    if (gametype == "zxp" || gametype == "limbo") {
        function_8639626f9311efca();
    }
}

// Namespace namespace_25c6225632fa6610 / namespace_f5e13928bdbda502
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f8
// Size: 0xc4
function function_8639626f9311efca() {
    level.var_9f16330e32bd0097 = spawnstruct();
    level.var_9f16330e32bd0097.enabled = getdvarint(@"hash_3824753bd626a50f", 1);
    if (istrue(level.var_9f16330e32bd0097.enabled)) {
        level.var_9f16330e32bd0097.var_1eab5015307288d = getdvarint(@"hash_33c62e743e2c62e2", 1);
        level.var_9f16330e32bd0097.var_98865b0b990c9629 = getdvarfloat(@"hash_deb0777788997fa5", 0.15);
        thread function_2f61e64b72dcb65f();
    }
    level._effect["vfx/iw9_br/haunted_box/vfx_haunted_box_dest.vfx"] = loadfx("vfx/iw9_br/haunted_box/vfx_haunted_box_dest.vfx");
    namespace_e688cd9db0404268::function_f1aed36ab4598ea("eqp_haunted_box");
}

// Namespace namespace_25c6225632fa6610 / namespace_f5e13928bdbda502
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c4
// Size: 0x21a
function function_2f61e64b72dcb65f() {
    level endon("game_ended");
    level waittill("prematch_done");
    level.var_9f16330e32bd0097.lootstructs = [];
    level.var_9f16330e32bd0097.var_a679c918818fa808 = strtok(getdvar(@"hash_ead17e29b7d3e5d2", "brloot_plunder_cash_rare_1 brloot_super_stimpistol brloot_killstreak_uav brloot_plate_carrier_tempered brloot_plate_carrier_3_medic"), " ");
    level.var_9f16330e32bd0097.var_11975321cc51ccc = strtok(getdvar(@"hash_b38913c76fca302f", "25 25 15 15 15"), " ");
    assertex(level.var_9f16330e32bd0097.var_a679c918818fa808.size == level.var_9f16330e32bd0097.var_11975321cc51ccc.size, "<dev string:x1c>");
    for (i = 0; i < level.var_9f16330e32bd0097.var_a679c918818fa808.size; i++) {
        lootstruct = spawnstruct();
        lootstruct.scriptablename = level.var_9f16330e32bd0097.var_a679c918818fa808[i];
        lootstruct.var_b9a439caf48188ef = float(level.var_9f16330e32bd0097.var_11975321cc51ccc[i]);
        lootstruct.count = 1;
        if (scripts\mp\gametypes\br_pickups::isplunder(lootstruct.scriptablename) || lootstruct.scriptablename == "brloot_super_stimpistol") {
            lootstruct.count = level.br_pickups.counts[lootstruct.scriptablename];
        }
        if (lootstruct.scriptablename == "iw9_lm_dblmg_mp") {
            lootstruct.objweapon = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845(lootstruct.scriptablename);
            lootstruct.count = weaponclipsize(lootstruct.objweapon);
        }
        level.var_9f16330e32bd0097.lootstructs[level.var_9f16330e32bd0097.lootstructs.size] = lootstruct;
    }
}

// Namespace namespace_25c6225632fa6610 / namespace_f5e13928bdbda502
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5e6
// Size: 0x2c
function function_82dfe148ced1f477(player) {
    if (istrue(level.var_9f16330e32bd0097.enabled)) {
        function_53905c7899018074(player);
    }
    return true;
}

// Namespace namespace_25c6225632fa6610 / namespace_f5e13928bdbda502
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x61b
// Size: 0x2d
function function_53905c7899018074(useplayer) {
    if (function_bdd4c7db07903046(useplayer)) {
        scripts\cp_mp\challenges::function_8359cadd253f9604(useplayer, "jumpscare_box", 1, 0);
        function_1dcd3d5457634b51(useplayer);
    }
}

// Namespace namespace_25c6225632fa6610 / namespace_f5e13928bdbda502
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x650
// Size: 0x49
function function_bdd4c7db07903046(useplayer) {
    if (!istrue(level.var_9f16330e32bd0097.var_1eab5015307288d)) {
        return false;
    }
    if (randomfloat(1) < level.var_9f16330e32bd0097.var_98865b0b990c9629) {
        return false;
    }
    return true;
}

// Namespace namespace_25c6225632fa6610 / namespace_f5e13928bdbda502
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a2
// Size: 0x37
function function_1dcd3d5457634b51(useplayer) {
    var_450a9d7b25d754d8 = namespace_2db04a57a1b9bf62::function_b67f0b02f25b1af(useplayer, 1, 0);
    if (istrue(var_450a9d7b25d754d8)) {
        thread function_1865381550bb926c();
        thread function_9adf7587abc3af97(useplayer);
    }
}

// Namespace namespace_25c6225632fa6610 / namespace_f5e13928bdbda502
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e1
// Size: 0x68
function function_1865381550bb926c() {
    self endon("death");
    while (isdefined(self) && istrue(self.onuseanimplaying)) {
        waitframe();
    }
    self setscriptablepartstate("anims", "openJumpscare", 0);
    self.onuseanimplaying = 1;
    wait getanimlength(scriptables%wm_hbox_ground_idle_open_use);
    self setscriptablepartstate("anims", "openIdle", 0);
    self.onuseanimplaying = undefined;
}

// Namespace namespace_25c6225632fa6610 / namespace_f5e13928bdbda502
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x751
// Size: 0xca
function function_9adf7587abc3af97(player) {
    level endon("game_ended");
    self endon("death");
    var_47230a50f9e752fb = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    var_6d6f8d51a1b7b6cd = (0, 35, 0);
    weightedsum = function_f4c93829f6081d50(level.var_9f16330e32bd0097.lootstructs);
    var_3163d28d241d4273 = randomfloat(weightedsum);
    var_52f30f2d679b8016 = function_71bf565567b813e1(level.var_9f16330e32bd0097.lootstructs, var_3163d28d241d4273);
    wait 1.35;
    scripts\mp\equipment\support_box::function_225b99924f316bc1(var_47230a50f9e752fb, player, var_52f30f2d679b8016.scriptablename, var_52f30f2d679b8016.count, var_52f30f2d679b8016.objweapon, var_6d6f8d51a1b7b6cd);
}

// Namespace namespace_25c6225632fa6610 / namespace_f5e13928bdbda502
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x823
// Size: 0x6e
function function_f4c93829f6081d50(lootstructs) {
    weightedsum = 0;
    foreach (lootstruct in lootstructs) {
        weightedsum += lootstruct.var_b9a439caf48188ef;
    }
    return weightedsum;
}

// Namespace namespace_25c6225632fa6610 / namespace_f5e13928bdbda502
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x89a
// Size: 0x7e
function function_71bf565567b813e1(lootstructs, var_3163d28d241d4273) {
    weightedsum = 0;
    foreach (lootstruct in lootstructs) {
        weightedsum += lootstruct.var_b9a439caf48188ef;
        if (var_3163d28d241d4273 <= weightedsum) {
            return lootstruct;
        }
    }
    return undefined;
}
