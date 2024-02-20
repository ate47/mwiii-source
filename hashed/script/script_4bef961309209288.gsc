// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\callback_group.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\engine\trace.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\supers\super_stoppingpower.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_189b67b2735b981d;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\supers.gsc;

#namespace super_suppression_rounds;

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x326
// Size: 0x2f
function function_d0930f871341093c() {
    level.onweapondropcreated callback_subscribe(&function_7da2a2f573cf8d9, level);
    level.onweapondroppickedup callback_subscribe(&function_afc54fc21dfdc776, level);
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35c
// Size: 0x163
function function_55aae48e013652fa() {
    var_f4e6d9afe1e11685 = self.lastnormalweaponobj;
    var_8de014639f689574 = nullweapon();
    if (namespace_68e641469fde3fa7::ismeleeonly(var_f4e6d9afe1e11685) || namespace_68e641469fde3fa7::issuperweapon(var_f4e6d9afe1e11685) || namespace_e0ee43ef2dddadaa::iskillstreakweapon(var_f4e6d9afe1e11685) || namespace_68e641469fde3fa7::isgamemodeweapon(var_f4e6d9afe1e11685) || namespace_68e641469fde3fa7::issinglehitweapon(var_f4e6d9afe1e11685.basename) || namespace_e0ee43ef2dddadaa::isminigunweapon(var_f4e6d9afe1e11685) || !function_a364b6e4dc3cc30a(var_f4e6d9afe1e11685) || var_f4e6d9afe1e11685.basename == "iw8_lm_dblmg_mp" || var_f4e6d9afe1e11685.basename == "iw9_me_fists_mp") {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ namespace_3c37cb17ade254d::getsharedfunc("hud", "showErrorMessage") ]]("MP/SUPPORT_BOX_INCOMPAT");
        }
        return 0;
    }
    result = namespace_15e7fb65c4c78514::stoppingpower_cancelreload();
    if (!istrue(result)) {
        return 0;
    }
    function_ed3c1a651b014773(var_f4e6d9afe1e11685);
    /#
        setdevdvarifuninitialized(@"hash_cf7e828b80157a7e", 0);
        setdevdvarifuninitialized(@"hash_e99f272dcc64b03c", "<unknown string>");
        setdevdvarifuninitialized(@"hash_c3573be192cb700f", 0.7);
    #/
    namespace_aad14af462a74d08::function_d997435895422ecc("super_suppression_rounds", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "equipment_deployed");
    return 1;
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c7
// Size: 0x3
function function_b2d2056ee8b00689() {
    
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d1
// Size: 0x37
function function_a364b6e4dc3cc30a(objweapon) {
    if (!self isalternatemode(objweapon)) {
        return 1;
    }
    underbarrel = objweapon.underbarrel;
    return namespace_3bbb5a98b932c46f::isattachmentselectfire(objweapon, underbarrel);
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x510
// Size: 0x288
function function_ed3c1a651b014773(var_f4e6d9afe1e11685) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (self isalternatemode(var_f4e6d9afe1e11685)) {
        var_8de014639f689574 = var_f4e6d9afe1e11685;
        var_f4e6d9afe1e11685 = var_f4e6d9afe1e11685 getnoaltweapon();
    } else {
        var_8de014639f689574 = var_f4e6d9afe1e11685 getaltweapon();
    }
    var_12a372e8caa042bb = [];
    stockammo = 0;
    var_c88113bfedd68cf0 = 0;
    if (!isnullweapon(var_8de014639f689574)) {
        var_12a372e8caa042bb[var_12a372e8caa042bb.size] = var_8de014639f689574;
    }
    var_12a372e8caa042bb[var_12a372e8caa042bb.size] = var_f4e6d9afe1e11685;
    foreach (weaponobj in var_12a372e8caa042bb) {
        isakimbo = 0;
        if (weaponobj.isdualwield) {
            isakimbo = 1;
        }
        if (issameweapon(weaponobj, var_f4e6d9afe1e11685, 0)) {
            clipammo = namespace_3bbb5a98b932c46f::getammooverride(weaponobj);
            var_fb3893b4cbddc190 = clipammo * 2;
            if (isakimbo) {
                var_fb3893b4cbddc190 = var_fb3893b4cbddc190 * 2;
            }
            function_588eaa2556c4172c(self, weaponobj, var_fb3893b4cbddc190);
            if (1) {
                if (isakimbo) {
                    clipammo = self getweaponammoclip(weaponobj, "left") + self getweaponammoclip(weaponobj, "right");
                    stockammo = self getweaponammostock(weaponobj);
                    oldammo = clipammo + stockammo;
                    newammo = int(min(weaponmaxammo(weaponobj), oldammo + var_fb3893b4cbddc190));
                    self setweaponammostock(weaponobj, newammo);
                    self setweaponammoclip(weaponobj, 0, "left");
                    self setweaponammoclip(weaponobj, 0, "right");
                } else {
                    clipammo = self getweaponammoclip(weaponobj);
                    stockammo = self getweaponammostock(weaponobj);
                    oldammo = clipammo + stockammo;
                    maxammo = weaponmaxammo(weaponobj);
                    totalammo = oldammo + var_fb3893b4cbddc190;
                    var_c88113bfedd68cf0 = int(totalammo - maxammo);
                    var_5b3f7d686c59ab97 = int(min(maxammo, totalammo));
                    if (weaponobj.basename == "iw8_lm_dblmg_mp") {
                        self setweaponammoclip(weaponobj, clipammo + var_fb3893b4cbddc190);
                    } else {
                        self setweaponammoclip(weaponobj, 0);
                        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
                            var_e074b618e47255fe = var_5b3f7d686c59ab97 - stockammo;
                            namespace_3bcd40a3005712ec::br_give_weapon_ammo(weaponobj, var_e074b618e47255fe);
                        } else {
                            self setweaponammostock(weaponobj, var_5b3f7d686c59ab97);
                        }
                    }
                }
            }
        }
    }
    thread function_3c8a31ca9d26e8a3(var_f4e6d9afe1e11685, stockammo, var_c88113bfedd68cf0);
    return 1;
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a0
// Size: 0xa2
function function_3c8a31ca9d26e8a3(weaponobj, stockammo, var_c88113bfedd68cf0) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    while (1) {
        if (self getcurrentprimaryweapon() != weaponobj) {
            break;
        }
        currentammo = self getweaponammoclip(weaponobj);
        if (currentammo > 0) {
            thread namespace_44abc05161e2e2cb::showsplash("suppression_rounds_activated", undefined, self);
            if (var_c88113bfedd68cf0 > 0) {
                self setweaponammostock(weaponobj, stockammo + var_c88113bfedd68cf0);
            }
            break;
        }
        waitframe();
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("supers", "superUseFinished")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("supers", "superUseFinished") ]]();
    }
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x849
// Size: 0x76
function function_588eaa2556c4172c(player, objweapon, var_45acd1d2458698a) {
    var_2468893fc27de6f6 = spawnstruct();
    var_2468893fc27de6f6.player = player;
    var_2468893fc27de6f6.objweapon = objweapon;
    var_2468893fc27de6f6.rounds = var_45acd1d2458698a;
    var_2468893fc27de6f6.var_6d8006af92216f09 = 0;
    var_2468893fc27de6f6.kills = 0;
    function_404622faff469ef4(player, var_2468893fc27de6f6);
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c6
// Size: 0x64
function function_2ab57ffd17e456dc() {
    var_23cc182d2553796a = self.var_96a36c88eb0e59b;
    foreach (perk in var_23cc182d2553796a) {
        giveperk(perk);
    }
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x931
// Size: 0x6e
function function_d086a58c4a276ab7() {
    var_23cc182d2553796a = self.var_96a36c88eb0e59b;
    foreach (perk in var_23cc182d2553796a) {
        if (_hasperk(perk)) {
            removeperk(perk);
        }
    }
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a6
// Size: 0x81
function function_78a297c602bcf14b() {
    var_23cc182d2553796a = self.var_96a36c88eb0e59b;
    if (!isdefined(var_23cc182d2553796a)) {
        return 0;
    }
    var_c81d87c234523f81 = 1;
    foreach (perk in var_23cc182d2553796a) {
        if (!_hasperk(perk)) {
            var_c81d87c234523f81 = 0;
            break;
        }
    }
    return var_c81d87c234523f81;
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2f
// Size: 0xf7
function function_404622faff469ef4(player, var_2468893fc27de6f6) {
    if (!isdefined(player.var_2468893fc27de6f6)) {
        player.var_2468893fc27de6f6 = [];
    }
    if (!isdefined(player.var_96a36c88eb0e59b)) {
        player.var_96a36c88eb0e59b = [0:"specialty_bulletsuppress", 1:"specialty_bulletpenetration", 2:"specialty_armorpiercingks", 3:"specialty_fastreload"];
    }
    id = getcompleteweaponnamenoalt(var_2468893fc27de6f6.objweapon);
    var_42d837d1bf3797d3 = player.var_2468893fc27de6f6[id];
    if (isdefined(var_42d837d1bf3797d3)) {
        var_42d837d1bf3797d3 thread suppressionRounds_removeAPR();
    }
    player.var_2468893fc27de6f6[id] = var_2468893fc27de6f6;
    var_2468893fc27de6f6 thread function_ff064ef6be86cafd();
    var_2468893fc27de6f6 thread function_b62388feecc84e15();
    var_2468893fc27de6f6 thread function_3228d2697dab3222();
    var_2468893fc27de6f6 thread function_6831e37d3d71c426();
    var_2468893fc27de6f6 thread function_f12640f75796066();
    player thread function_1a941c69ee952e0d();
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2d
// Size: 0x2c
function function_1da49fb6441f8ab2() {
    var_2468893fc27de6f6 = function_8343403d68c45f63(self getcurrentweapon());
    return isdefined(var_2468893fc27de6f6) && istrue(var_2468893fc27de6f6.var_6d8006af92216f09);
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb61
// Size: 0x49
function function_7da2a2f573cf8d9(var_614411b9142bd852, droppingplayer, weaponobj) {
    if (!isdefined(var_614411b9142bd852) || !isdefined(droppingplayer)) {
        return;
    }
    var_2468893fc27de6f6 = droppingplayer function_8343403d68c45f63(weaponobj);
    var_614411b9142bd852.var_2468893fc27de6f6 = var_2468893fc27de6f6;
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb1
// Size: 0x72
function function_afc54fc21dfdc776(var_614411b9142bd852, var_480f8576be141bb4, weaponobj) {
    if (!isdefined(var_614411b9142bd852.var_2468893fc27de6f6)) {
        return;
    }
    var_2468893fc27de6f6 = var_614411b9142bd852.var_2468893fc27de6f6;
    var_2468893fc27de6f6.player = var_480f8576be141bb4;
    var_2468893fc27de6f6.var_6d8006af92216f09 = 0;
    var_2468893fc27de6f6.kills = 0;
    function_404622faff469ef4(var_480f8576be141bb4, var_2468893fc27de6f6);
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2a
// Size: 0x3f
function function_8343403d68c45f63(objweapon) {
    if (!isdefined(objweapon)) {
        return undefined;
    }
    if (!isdefined(self.var_2468893fc27de6f6)) {
        return undefined;
    }
    id = getcompleteweaponnamenoalt(objweapon);
    return self.var_2468893fc27de6f6[id];
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc71
// Size: 0xb5
function function_6831e37d3d71c426() {
    self endon("suppressionRounds_removeAPR");
    self.player endon("disconnect");
    while (self.player hasweapon(self.objweapon)) {
        if (function_8e06333f166199e3(self.player getcurrentweapon())) {
            if (!self.var_6d8006af92216f09) {
                self.player function_2ab57ffd17e456dc();
                self.var_6d8006af92216f09 = 1;
            }
        } else if (self.var_6d8006af92216f09) {
            self.player function_d086a58c4a276ab7();
            self.var_6d8006af92216f09 = 0;
        }
        self.player waittill("weapon_change");
    }
    thread suppressionRounds_removeAPR();
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2d
// Size: 0x98
function function_f12640f75796066() {
    self endon("suppressionRounds_removeAPR");
    self.player endon("disconnect");
    while (self.player hasweapon(self.objweapon)) {
        objweapon = self.player waittill("weapon_fired");
        if (function_8e06333f166199e3(objweapon)) {
            self.rounds--;
            if (self.rounds <= 0) {
                break;
            }
        }
    }
    self.player thread function_15338821a605345d(self.objweapon);
    thread suppressionRounds_removeAPR();
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcc
// Size: 0x5e
function function_15338821a605345d(objweapon) {
    self endon("disconnect");
    if (!isdefined(self)) {
        return;
    }
    rootname = getweaponrootname(objweapon);
    if (rootname != "iw9_dm_crossbow") {
        return;
    }
    self.lastcrossbowhadstoppingpower = 1;
    waittill_any_timeout_no_endon_death_2(2, "weapon_fired", "weapon_change");
    self.lastcrossbowhadstoppingpower = undefined;
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe31
// Size: 0x3b
function suppressionRounds_removeAPR() {
    self notify("suppressionRounds_removeAPR");
    if (isdefined(self.player)) {
        if (self.var_6d8006af92216f09) {
            self.player function_d086a58c4a276ab7();
        }
        function_14ff80858876e74();
    }
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe73
// Size: 0x1f
function function_860d63c693c454f5() {
    self notify("suppressionRounds_removeAPR");
    if (isdefined(self.player)) {
        function_14ff80858876e74();
    }
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe99
// Size: 0x152
function function_14ff80858876e74() {
    if (isdefined(self.player.var_2468893fc27de6f6)) {
        id = getcompleteweaponnamenoalt(self.objweapon);
        var_2468893fc27de6f6 = self.player.var_2468893fc27de6f6[id];
        if (isdefined(var_2468893fc27de6f6) && var_2468893fc27de6f6 == self) {
            self.player.var_2468893fc27de6f6[id] = undefined;
        }
        if (isdefined(self.player.super) && isdefined(self.player.super.var_db8424389dcbbe9b)) {
            self.player namespace_aad14af462a74d08::function_d997435895422ecc("super_suppression_rounds", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"end"), self.player.super.var_db8424389dcbbe9b);
            self.player.super.var_db8424389dcbbe9b = undefined;
        }
        namespace_bd0162aedd8c8594::logevent_fieldupgradeexpired(self.player, level.superglobals.staticsuperdata["super_suppression_rounds"].id, self.kills, 0);
    }
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff2
// Size: 0x64
function function_8f9a9c04e9e4b5af(weaponobj) {
    if (isdefined(weaponobj)) {
        id = getcompleteweaponnamenoalt(weaponobj);
        var_2468893fc27de6f6 = self.var_2468893fc27de6f6[id];
        if (isdefined(var_2468893fc27de6f6)) {
            namespace_3c5a4254f2b957ea::incpersstat("suppressionRoundsKills", 1);
            namespace_85d036cb78063c4a::combatrecordsuperkill("super_suppression_rounds");
            var_2468893fc27de6f6.kills++;
        }
    }
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105d
// Size: 0x6c
function function_8e06333f166199e3(objweapon) {
    var_c1711fe638727118 = self.player getammotype(self.objweapon);
    var_49a4190715712f10 = self.player getammotype(objweapon);
    var_9438d6b1d63250f7 = var_c1711fe638727118 == var_49a4190715712f10;
    return issameweapon(objweapon, self.objweapon, 1) && var_9438d6b1d63250f7;
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d1
// Size: 0x31
function function_ff064ef6be86cafd() {
    self.player endon("disconnect");
    self endon("suppressionRounds_removeAPR");
    self.player waittill("death");
    thread suppressionRounds_removeAPR();
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1109
// Size: 0x29
function function_b62388feecc84e15() {
    self.player endon("disconnect");
    self endon("suppressionRounds_removeAPR");
    level waittill("game_ended");
    thread suppressionRounds_removeAPR();
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1139
// Size: 0x31
function function_3228d2697dab3222() {
    self.player endon("disconnect");
    self endon("suppressionRounds_removeAPR");
    self.player waittill("all_perks_cleared");
    thread function_860d63c693c454f5();
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1171
// Size: 0x5b
function function_8f57fb80f166c568() {
    self.player endon("death_or_disconnect");
    self.player namespace_82dcd1d5ae30ff7::giveperk("specialty_fastreload");
    self.player waittill_any_3("weapon_fired", "weapon_change", "suppressionRounds_removeAPR");
    self.player namespace_82dcd1d5ae30ff7::removeperk("specialty_fastreload");
}

// Namespace super_suppression_rounds/namespace_ed60dc1153ae1c06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d3
// Size: 0x2e
function function_1a941c69ee952e0d() {
    self endon("death_or_disconnect");
    val::set("suppressionRounds", "sprint", 0);
    wait(0.4);
    val::function_c9d0b43701bdba00("suppressionRounds");
}
