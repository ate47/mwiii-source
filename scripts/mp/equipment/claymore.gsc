// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\perk.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\vehicles\vehicle_mines.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_736dec95a49487a6;
#using script_5f903436642211af;
#using scripts\mp\equipment_interact.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_7ef95bba57dc4b82;
#using scripts\mp\equipment\claymore.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\points.gsc;

#namespace claymore;

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d5
// Size: 0x52
function claymore_init() {
    level._effect["claymore_explode"] = loadfx("vfx/iw9/core/equipment/vfx_equip_claymore_trigger.vfx");
    if (istrue(game["isLaunchChunk"])) {
        return;
    }
    minetriggerdata = namespace_739a1beacdad3457::vehicle_mines_getleveldataformine("equip_claymore", 1);
    minetriggerdata.triggercallback = &claymore_triggerfromvehicle;
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52e
// Size: 0x2c5
function claymore_use(grenade) {
    self endon("death_or_disconnect");
    grenade endon("death");
    if (_hasperk("specialty_rugged_eqp")) {
        grenade.hasruggedeqp = 1;
    }
    grenade.exploding = 1;
    thread namespace_3bbb5a98b932c46f::monitordisownedgrenade(self, grenade);
    if (isdefined(namespace_f8065cafc523dba5::getvehicle())) {
        namespace_44abc05161e2e2cb::showerrormessage(grenade.bundle.var_512d802771a9bd3f);
        thread namespace_1a507865f681850e::incrementequipmentammo("equip_claymore", 1);
        waitframe();
        grenade delete();
    }
    var_f99216cee573ea7e = spawnstruct();
    var_f99216cee573ea7e.throwspeedforward = 100;
    var_f99216cee573ea7e.throwspeedup = -50;
    var_f99216cee573ea7e.castdivisions = 3;
    var_f99216cee573ea7e.castmaxtime = 0.5;
    var_f99216cee573ea7e.castdetail = 1;
    var_f99216cee573ea7e.plantmaxtime = 0.5;
    var_f99216cee573ea7e.plantmaxroll = 15;
    var_f99216cee573ea7e.plantmindistbeloweye = 12;
    var_f99216cee573ea7e.plantmaxdistbelowownerfeet = 20;
    var_f99216cee573ea7e.plantmindisteyetofeet = 45;
    var_f99216cee573ea7e.plantnormalcos = 0.342;
    var_f99216cee573ea7e.plantoffsetz = 3;
    if (namespace_9db09f982acd35b4::player_standing_on_train()) {
        var_f99216cee573ea7e.plantoffsetz = var_f99216cee573ea7e.plantoffsetz + 2;
        var_f99216cee573ea7e.contents = namespace_9db09f982acd35b4::function_d699841d5e241043();
    } else {
        var_f99216cee573ea7e.contents = physics_createcontents([0:"physicscontents_missileclip", 1:"physicscontents_item", 2:"physicscontents_vehicle", 3:"physicscontents_glass"]);
    }
    var_129fa79cde973b37 = namespace_ff64cf6a607bc089::plant(grenade, var_f99216cee573ea7e);
    if (!istrue(var_129fa79cde973b37)) {
        namespace_44abc05161e2e2cb::showerrormessage(grenade.bundle.var_512d802771a9bd3f);
        thread namespace_1a507865f681850e::incrementequipmentammo("equip_claymore", 1);
        grenade delete();
    } else {
        if (isdefined(level.var_ca4e08767cbdae12)) {
            var_425925a45729deae = grenade [[ level.var_ca4e08767cbdae12 ]]();
            if (!var_425925a45729deae) {
                namespace_44abc05161e2e2cb::showerrormessage(grenade.bundle.var_512d802771a9bd3f);
                namespace_1a507865f681850e::incrementequipmentslotammo("primary");
                grenade delete();
                return;
            }
        }
        var_bf8e5f003146af44 = grenade getlinkedparent();
        if (isdefined(var_bf8e5f003146af44)) {
            grenade explosivehandlemovers(var_bf8e5f003146af44);
        }
        grenade.exploding = 0;
        grenade thread claymore_plant();
        if (namespace_3c37cb17ade254d::issharedfuncdefined("entity", "trackEntityLimit")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("entity", "trackEntityLimit") ]](grenade, self);
            grenade thread function_a05a0b89582e22a3();
        }
    }
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fa
// Size: 0x241
function claymore_plant() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    owner = self.owner;
    team = self.owner.team;
    namespace_2a9588dfac284b77::registerspawn(1, &sweepclaymore);
    namespace_6d9917c3dc05dbe9::registersentient("Lethal_Static", owner, 1);
    thread makeexplosiveusabletag("tag_use", 1);
    owner onequipmentplanted(self, "equip_claymore", &claymore_delete);
    thread monitordisownedequipment(owner, self);
    self missilethermal();
    self missileoutline();
    self setentityowner(owner);
    self setotherent(owner);
    self setnodeploy(1);
    self.headiconid = namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 5, undefined, undefined, undefined, 0.1, 1);
    thread namespace_3bbb5a98b932c46f::outlineequipmentforowner(self);
    thread minedamagemonitor();
    thread claymore_explodeonnotify();
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        self [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_ac5843028846c67);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        self [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_b3a55145aba7855e);
    }
    namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&claymore_empapplied);
    namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_4373872960a2d51a);
    function_49197cd063a740ea(&claymore_destroy);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread namespace_272931699e2fe8e9::function_5c07037726ae5001(self);
        }
    }
    claymore_updatedangerzone();
    self setscriptablepartstate("plant", "active", 0);
    owner setscriptablepartstate("equipClaymoreFXView", "plant", 0);
    thread claymore_forceclampangles();
    wait(self.bundle.var_fc5fafaec60831f9);
    self setscriptablepartstate("arm", "active", 0);
    thread claymore_watchfortrigger();
    thread namespace_43a68cf8c122ab9::remoteinteractsetup(&claymore_trigger, 1, 1);
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa42
// Size: 0x6f
function claymore_updatedangerzone() {
    if (istrue(level.dangerzoneskipequipment)) {
        return;
    }
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
    }
    self.dangerzone = namespace_b2d5aa2baf2b5701::addspawndangerzone(self.origin, namespace_b2d5aa2baf2b5701::getdefaultminedangerzoneradiussize(), 72, self.owner.team, undefined, self.owner, 0, self, 1);
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab8
// Size: 0x73
function claymore_forceclampangles() {
    self endon("mine_selfdestruct");
    self endon("death");
    endtime = gettime() + 2000;
    while (endtime > gettime()) {
        var_3ee87d07f44102be = (0, self.angles[1], 0);
        var_c3471647fbd93c0a = 15;
        self.angles = anglelerpquat(var_3ee87d07f44102be, self.angles, var_c3471647fbd93c0a);
        waitframe();
    }
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb32
// Size: 0x356
function claymore_watchfortrigger() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    contents = physics_createcontents([0:"physicscontents_missileclip", 1:"physicscontents_item", 2:"physicscontents_vehicle", 3:"physicscontents_glass", 4:"physicscontents_water"]);
    while (1) {
        var_f9b008542cd70a05 = self waittill("trigger_grenade");
        /#
            assert(isdefined(var_f9b008542cd70a05));
        #/
        if (istrue(self.stunned)) {
            continue;
        }
        foreach (ent in var_f9b008542cd70a05) {
            if (isdefined(ent.classname)) {
                if (ent.classname == "script_vehicle") {
                    if (ent namespace_739a1beacdad3457::vehicle_mines_isfriendlytomine(self)) {
                        continue;
                    }
                    if (!namespace_739a1beacdad3457::vehicle_mines_shouldvehicletriggermine(ent, self)) {
                        continue;
                    }
                    namespace_739a1beacdad3457::vehicle_mines_minetrigger(ent, self);
                    break;
                }
                if (isagent(ent) || isplayer(ent)) {
                    if (!isreallyalive(ent)) {
                        continue;
                    }
                    forward = anglestoforward(self.angles);
                    up = anglestoup(self.angles);
                    var_2cc97e113610ca14 = self.origin + up * 0;
                    if (isent(self)) {
                        ignorelist = namespace_ff64cf6a607bc089::get_mine_ignore_list();
                    } else {
                        ignorelist = [];
                    }
                    var_ad283a45677a1ea3 = ent gettagorigin("j_mainroot");
                    var_44060504f23c16af = [0:var_ad283a45677a1ea3];
                    var_340d59422336e85a = var_2cc97e113610ca14 - var_ad283a45677a1ea3;
                    var_a00164b06f60f5e6 = ent.origin;
                    if (vectordot(var_340d59422336e85a, (0, 0, 1)) >= 0) {
                        if (!isdefined(ent gettagorigin("j_spineupper", 1))) {
                            goto LOC_0000026d;
                        }
                        var_a00164b06f60f5e6 = ent gettagorigin("j_spineupper", 1);
                    }
                    var_44060504f23c16af[var_44060504f23c16af.size] = var_a00164b06f60f5e6;
                    handled = 0;
                    foreach (var_a00164b06f60f5e6 in var_44060504f23c16af) {
                        var_340d59422336e85a = var_a00164b06f60f5e6 - self.origin;
                        var_cc00b910bd1d69c8 = vectordot(var_340d59422336e85a, forward);
                        var_69211973f7d7bbd6 = vectordot(var_340d59422336e85a, up);
                        if (abs(var_69211973f7d7bbd6) > 32) {
                            continue;
                        }
                        var_a3d051ef761efd24 = vectornormalize(var_340d59422336e85a);
                        var_74876e67651c79a6 = vectordot(var_a3d051ef761efd24, forward);
                        if (var_74876e67651c79a6 < 0.86602) {
                            continue;
                        }
                        var_e021c2744cc7ed68 = physics_raycast(var_2cc97e113610ca14, var_a00164b06f60f5e6, contents, ignorelist, 0, "physicsquery_closest", 1);
                        if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
                            continue;
                        }
                        handled = 1;
                        thread claymore_trigger(ent);
                    LOC_00000325:
                    }
                    if (handled) {
                        break;
                    }
                }
            }
        }
    }
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8f
// Size: 0xd3
function claymore_trigger(ent, attacker) {
    self endon("mine_destroyed");
    self endon("death");
    self.owner endon("disconnect");
    if (isdefined(attacker)) {
        attacker endon("disconnect");
    } else {
        attacker = self.owner;
    }
    self notify("mine_triggered");
    printgameaction("claymore triggered", self.owner);
    if (isent(self)) {
        makeexplosiveunusuabletag();
    }
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("trigger", "active", 0);
    graceperiod = function_53c4c53197386572(self.bundle.var_394b8c5b5618917f, 0);
    explosivetrigger(ent, graceperiod);
    thread claymore_explode(attacker);
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf69
// Size: 0x87
function claymore_triggerfromvehicle(vehicle, mine) {
    mine endon("mine_destroyed");
    mine endon("death");
    mine.owner endon("disconnect");
    mine notify("mine_triggered");
    mine makeexplosiveunusuabletag();
    mine setscriptablepartstate("arm", "neutral", 0);
    mine setscriptablepartstate("trigger", "active", 0);
    wait(mine.bundle.var_da8863dc7605cb83);
    mine thread claymore_explodefromvehicletrigger(vehicle);
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff7
// Size: 0x8a
function claymore_explodefromvehicletrigger(vehicle) {
    vehicle dodamage(self.bundle.var_1686cbcbae48a0fe, self.origin, self.owner, self, "MOD_EXPLOSIVE", makeweapon("claymore_mp"));
    ignoredamageid = vehicle namespace_a12dc1d0c8a64946::non_player_add_ignore_damage_signature(self.owner, makeweapon("claymore_mp"), self, "MOD_EXPLOSIVE");
    thread claymore_explode();
    waitframe();
    if (isdefined(vehicle)) {
        vehicle namespace_a12dc1d0c8a64946::non_player_remove_ignore_damage_signature(ignoredamageid);
    }
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1088
// Size: 0x28b
function claymore_explode(attacker) {
    self setscriptablepartstate("plant", "neutral", 0);
    self setscriptablepartstate("trigger", "neutral", 0);
    self setscriptablepartstate("explode", "active", 0);
    if (self getscriptablehaspart("health")) {
        self setscriptablepartstate("health", "ignore_damage", 0);
    }
    if (isent(self)) {
        level.mines[self getentitynumber()] = undefined;
        self setcandamage(0);
        namespace_2a9588dfac284b77::deregisterspawn();
        makeexplosiveunusuabletag();
    }
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    self.exploding = 1;
    owner = self.owner;
    if (isdefined(self.owner)) {
        owner removeequip(self);
    }
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    forward = anglestoup(self.angles);
    right = -1 * anglestoright(self.angles);
    up = anglestoforward(self.angles);
    playfx(getfx("claymore_explode"), self.origin, forward, up);
    if (isent(self)) {
        var_25144f9160d59fd = self;
    } else if (isent(owner)) {
        var_25144f9160d59fd = owner;
        if (!isdefined(owner.var_2e8bbe611a66d602)) {
            owner.var_2e8bbe611a66d602 = [];
        }
        if (!isdefined(owner.var_2e8bbe611a66d602["claymore_mp"])) {
            owner.var_2e8bbe611a66d602["claymore_mp"] = [];
        }
        owner.var_2e8bbe611a66d602["claymore_mp"][owner.var_2e8bbe611a66d602["claymore_mp"].size] = self.index;
    }
    if (isdefined(var_25144f9160d59fd)) {
        if (!isdefined(self.bundle.var_81e0f871add9f577)) {
            goto LOC_00000228;
        }
        var_25144f9160d59fd radiusdamage(self.origin, self.bundle.var_2870c709e5604e6f, 100, 100, self.owner, "MOD_EXPLOSIVE", self.bundle.var_81e0f871add9f577, "claymore_radial_mp");
    }
    earthquake(0.45, 0.7, self.origin, 800);
    if (isent(self)) {
        self detonate(attacker);
    }
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131a
// Size: 0x77
function claymore_explodeonnotify() {
    self endon("death");
    level endon("game_ended");
    owner = self.owner;
    attacker = self waittill("detonateExplosive");
    self.detonatingplayer = attacker;
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("trigger", "active", 0);
    self notify("mine_triggered");
    thread claymore_explode(attacker);
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1398
// Size: 0xa
function sweepclaymore() {
    claymore_destroy();
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a9
// Size: 0x37
function claymore_destroy(var_29e6836de56da9dc) {
    if (!isdefined(var_29e6836de56da9dc)) {
        var_29e6836de56da9dc = 0;
    }
    thread claymore_delete(var_29e6836de56da9dc + 0.2);
    wait(var_29e6836de56da9dc);
    self setscriptablepartstate("destroy", "active", 0);
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e7
// Size: 0x99
function claymore_empapplied(data) {
    attacker = data.attacker;
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker)) || getdvarint(@"hash_58254c61de76bffe", 0)) {
        attacker notify("destroyed_equipment");
        attacker namespace_58a74e7d54b56e8d::givescoreforequipment(self);
    }
    damagefeedback = "";
    if (istrue(self.hasruggedeqp)) {
        damagefeedback = "hitequip";
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback(damagefeedback);
    }
    thread function_8ebab9db1b5be748(attacker);
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1487
// Size: 0x89
function function_ac5843028846c67(data) {
    attacker = data.attacker;
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker namespace_58a74e7d54b56e8d::givescoreforequipment(self, undefined, 1);
    }
    damagefeedback = "";
    if (istrue(self.hasruggedeqp)) {
        damagefeedback = "hitequip";
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback(damagefeedback);
    }
    thread function_6d0e1341e170c6(attacker);
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1517
// Size: 0x85
function function_4373872960a2d51a(data) {
    attacker = data.attacker;
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker namespace_58a74e7d54b56e8d::givescoreforequipment(self);
    }
    damagefeedback = "";
    if (istrue(self.hasruggedeqp)) {
        damagefeedback = "hitequip";
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback(damagefeedback);
    }
    claymore_explode(attacker);
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a3
// Size: 0x44
function function_8ebab9db1b5be748(attacker) {
    self endon("death");
    self setscriptablepartstate("empd", "active", 0);
    claymore_stunned(attacker, 6);
    self setscriptablepartstate("empd", "neutral", 0);
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ee
// Size: 0x2d
function function_6d0e1341e170c6(attacker) {
    self endon("death");
    self setscriptablepartstate("empd", "active", 0);
    function_3120a2693959efa1(attacker);
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1622
// Size: 0x12e
function claymore_delete(var_cbf7be4f62a0ddb2) {
    if (!isdefined(var_cbf7be4f62a0ddb2)) {
        var_cbf7be4f62a0ddb2 = 0;
    }
    self setscriptablepartstate("hack_usable", "off");
    self notify("death");
    namespace_2a9588dfac284b77::deregisterspawn();
    if (isent(self)) {
        level.mines[self getentitynumber()] = undefined;
        self setcandamage(0);
        makeexplosiveunusuabletag();
    } else if (isdefined(level.var_8106ad57bb892525) && isdefined(level.var_8106ad57bb892525[self.index])) {
        level.var_8106ad57bb892525[self.index] = undefined;
    }
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    self.headiconid = undefined;
    self.exploding = 1;
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
        self.dangerzone = undefined;
    }
    owner = self.owner;
    if (isdefined(self.owner)) {
        owner removeequip(self);
    }
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait(var_cbf7be4f62a0ddb2);
    }
    if (isent(self)) {
        self delete();
    } else {
        self freescriptable();
    }
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1757
// Size: 0x49b
function claymore_modifieddamage(victim, objweapon, inflictor, meansofdeath, damage) {
    if (!isdefined(inflictor)) {
        return damage;
    }
    if (isnullweapon(objweapon)) {
        return damage;
    }
    var_8bf83d28be4c2d4f = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo("equip_claymore");
    bundle = var_8bf83d28be4c2d4f.bundle;
    if (isdefined(inflictor.owner)) {
        attacker = inflictor.owner;
        var_bba0d532c0444c9f = inflictor.origin;
        var_81af81c5d73867c1 = inflictor.angles;
    } else if (isdefined(inflictor.team) && isagent(inflictor) && objweapon.basename == (isdefined(bundle.var_81e0f871add9f577) ? "claymore_radial_mp" : bundle.var_81e0f871add9f577)) {
        attacker = inflictor;
        if (isdefined(attacker.var_2e8bbe611a66d602) && isdefined(attacker.var_2e8bbe611a66d602["claymore_mp"])) {
            foreach (var_d9c01695c8a5bf7d in attacker.var_2e8bbe611a66d602["claymore_mp"]) {
                explosive = level.var_8106ad57bb892525[var_d9c01695c8a5bf7d];
                var_bba0d532c0444c9f = explosive.origin;
                var_81af81c5d73867c1 = explosive.angles;
                attacker.var_2e8bbe611a66d602["claymore_mp"] = array_remove(attacker.var_2e8bbe611a66d602["claymore_mp"], var_d9c01695c8a5bf7d);
                break;
            }
        } else {
            /#
                assertmsg("Tried to explode an entless explosive without a valid scriptable ID");
            #/
        }
    }
    if (objweapon.basename == "claymore_mp") {
        if (isdefined(self.claymoreshitby)) {
            foreach (claymore in self.claymoreshitby) {
                if (isdefined(claymore) && claymore == inflictor) {
                    return 0;
                }
            }
        }
    } else {
        if (!isdefined(bundle.var_81e0f871add9f577)) {
            goto LOC_000002f1;
        }
        if ("claymore_radial_mp" == bundle.var_81e0f871add9f577) {
            if (!istrue(namespace_f8065cafc523dba5::playersareenemies(victim, attacker))) {
                return 0;
            }
            thread namespace_8c5b266f689b1e0b::claymore_blockdamageuntilframeend(inflictor);
        } else {
            return damage;
        }
    }
    if (isdefined(level.gametype) && namespace_36f464722d326bbe::isBRStyleGameType()) {
        return damage;
    }
    if (!isexplosivedamagemod(meansofdeath)) {
        return damage;
    }
    var_340d59422336e85a = victim.origin - var_bba0d532c0444c9f;
    dist = vectordot(var_340d59422336e85a, anglestoup(var_81af81c5d73867c1));
    if (dist > 65) {
        return 0;
    }
    var_340d59422336e85a = var_bba0d532c0444c9f - victim geteye();
    dist = vectordot(var_340d59422336e85a, anglestoup(var_81af81c5d73867c1));
    if (dist > 65) {
        return 0;
    }
    forward = anglestoforward(var_81af81c5d73867c1);
    forward = (forward[0], forward[1], 0);
    var_452088725d788a39 = victim.origin - var_bba0d532c0444c9f;
    var_452088725d788a39 = (var_452088725d788a39[0], var_452088725d788a39[1], 0);
    dot = vectordot(forward, var_452088725d788a39);
    if (dot < 0) {
        return 0;
    }
    dist = distance2d(var_bba0d532c0444c9f, victim.origin);
    ratio = 1 - clamp((dist - bundle.var_97202c494b76611a) / (bundle.var_974316494b9c7870 - bundle.var_97202c494b76611a), 0, 1);
    damage = bundle.var_f184982f38f0d4e + (bundle.var_974316494b9c7870 - bundle.var_97202c494b76611a) * ratio;
    if (isdefined(inflictor.detonatingplayer)) {
        var_68c7b0cd4c501af6 = isdefined(inflictor.owner) && inflictor.detonatingplayer == inflictor.owner;
        var_a38dc5334101941b = inflictor.detonatingplayer == victim;
        if (!var_68c7b0cd4c501af6 && var_a38dc5334101941b) {
            damage = min(damage, 80);
        }
    }
    return damage;
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bfa
// Size: 0x5a
function claymore_blockdamageuntilframeend(inflictor) {
    self endon("disconnect");
    self notify("claymore_blockDamageUntilFrameEnd");
    self endon("claymore_blockDamageUntilFrameEnd");
    if (!isdefined(self.claymoreshitby)) {
        self.claymoreshitby = [];
    }
    self.claymoreshitby[self.claymoreshitby.size] = inflictor;
    waittillframeend();
    self.claymoreshitby = undefined;
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5b
// Size: 0x80
function claymore_onownerchanged(var_c0f9139ffd72e62d) {
    self setscriptablepartstate("hacked", "active", 0);
    claymore_updatedangerzone();
    sentientpool = self.sentientpool;
    namespace_6d9917c3dc05dbe9::unregistersentient(self.sentientpool, self.sentientpoolindex);
    namespace_6d9917c3dc05dbe9::registersentient(sentientpool, self.owner, 1);
    thread monitordisownedequipment(self.owner, self);
    thread outlineequipmentforowner(self);
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ce2
// Size: 0xa7
function claymore_stunned(attacker, duration) {
    self endon("death");
    if (!isdefined(duration)) {
        duration = self.bundle.var_7b2c9f1133796232;
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback("hitequip");
    }
    self notify("claymore_stunned");
    self endon("claymore_stunned");
    attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_812fd700eeef3c6e");
    self setscriptablepartstate("arm", "neutral", 0);
    self.stunned = 1;
    wait(duration);
    self.stunned = 0;
    self setscriptablepartstate("arm", "active", 0);
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d90
// Size: 0x67
function function_3120a2693959efa1(attacker) {
    self endon("death");
    if (isplayer(attacker)) {
        attacker updatedamagefeedback("hitequip");
    }
    self notify("claymore_stunned");
    self endon("claymore_stunned");
    attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_812fd700eeef3c6e");
    self setscriptablepartstate("arm", "neutral", 0);
    self.stunned = 1;
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dfe
// Size: 0x28
function function_b3a55145aba7855e(data) {
    self.stunned = 0;
    self setscriptablepartstate("arm", "active", 0);
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e2d
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e4a
// Size: 0x2b
function function_773e48f8d031510e() {
    self endon("mine_destroyed");
    self endon("death");
    level waittill_any_2("game_ended", "bro_shot_start");
    thread claymore_destroy();
}

// Namespace claymore/namespace_8c5b266f689b1e0b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7c
// Size: 0x20
function function_a05a0b89582e22a3() {
    self endon("mine_destroyed");
    self endon("death");
    self waittill("entity_limit_destroy");
    claymore_destroy();
}
