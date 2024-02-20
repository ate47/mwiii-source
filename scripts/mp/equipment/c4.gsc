// mwiii decomp prototype
#using script_16ea1b94f0f381b3;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\print.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\equipment.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\equipment_interact.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using script_736dec95a49487a6;
#using script_5f903436642211af;
#using scripts\mp\perks\perk_equipmentping.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\ai.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\utility\points.gsc;

#namespace c4;

// Namespace c4/namespace_7381a1f17171d16c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x394
// Size: 0x4f
function c4_set(equipmentref, slot, variantid) {
    bundle = level.equipment.table[equipmentref].bundle;
    thread c4_watchforaltdetonation(bundle);
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ea
// Size: 0x32d
function c4_used(grenade) {
    self endon("disconnect");
    grenade endon("death");
    printgameaction("c4 spawn", grenade.owner);
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672")) {
        grenade [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672") ]](grenade);
    }
    grenade.bundle = namespace_1a507865f681850e::function_2113b6f7cb462692(grenade.weapon_name);
    grenade.throwtime = gettime();
    grenade namespace_2a9588dfac284b77::registerspawn(1, &sweepc4);
    c4_addtoarray(grenade.owner, grenade);
    thread c4_watchfordetonation(grenade.bundle);
    thread c4_watchforaltdetonation(grenade.bundle);
    if (_hasperk("specialty_rugged_eqp")) {
        grenade.hasruggedeqp = 1;
    }
    grenade thread minedamagemonitor();
    grenade thread c4_explodeonnotify();
    grenade thread c4_destroyongameend();
    grenade thread namespace_43a68cf8c122ab9::remoteinteractsetup(&c4_detonate, 1, 0);
    thread namespace_3bbb5a98b932c46f::monitordisownedgrenade(self, grenade);
    grenade waittill("missile_stuck");
    if (isdefined(level.var_ca4e08767cbdae12)) {
        var_425925a45729deae = grenade [[ level.var_ca4e08767cbdae12 ]]();
        if (!var_425925a45729deae) {
            namespace_44abc05161e2e2cb::showerrormessage("EQUIPMENT/PLANT_FAILED");
            namespace_1a507865f681850e::incrementequipmentslotammo("primary");
            grenade delete();
            return;
        }
    }
    grenade setotherent(self);
    grenade setnodeploy(1);
    onequipmentplanted(grenade, "equip_c4", &c4_delete);
    thread monitordisownedequipment(self, grenade);
    grenade thread makeexplosiveusabletag("tag_use", 1);
    grenade namespace_6d9917c3dc05dbe9::registersentient("Lethal_Static", grenade.owner, 1);
    grenade.owner setclientomnvar("ui_mgl_c4_state", 1);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&c4_empapplied);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_f8ffbf95c0890c91);
    }
    grenade function_641996b5e113c5c6(grenade, &c4_empapplied);
    grenade namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_3f54618ac84aa89f);
    grenade function_49197cd063a740ea(&c4_destroy);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread namespace_272931699e2fe8e9::function_5c07037726ae5001(grenade);
        }
    }
    grenade thread namespace_90b872e9b61df82b::runequipmentping();
    grenade setscriptablepartstate("effects", "plant", 0);
    thread namespace_3bbb5a98b932c46f::outlineequipmentforowner(grenade);
    grenade missilethermal();
    grenade missileoutline();
    grenade.headiconid = grenade namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 0, undefined, undefined, undefined, 0.1, 1);
    grenade c4_updatedangerzone();
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71e
// Size: 0x9c
function c4_updatedangerzone() {
    if (istrue(level.dangerzoneskipequipment)) {
        return;
    }
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
    }
    var_d8695b9748c307be = (self.origin[0], self.origin[1], self.origin[2] - 50);
    self.dangerzone = namespace_b2d5aa2baf2b5701::addspawndangerzone(var_d8695b9748c307be, namespace_b2d5aa2baf2b5701::getdefaultminedangerzoneradiussize(), 100, self.owner.team, undefined, self.owner, 0, self, 1);
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c1
// Size: 0x99
function c4_detonate(attacker) {
    self endon("death");
    self.owner endon("disconnect");
    if (isdefined(attacker)) {
        attacker endon("disconnect");
    } else {
        attacker = self.owner;
    }
    if (istrue(self.bundle.var_1a27e2391b89641e)) {
        self setscriptablepartstate("effects", "warningTrigger", 0);
    }
    var_34239d65afa3c19c = function_53c4c53197386572(self.bundle.var_5c5f92ec3e8158f9, 0.1);
    wait(var_34239d65afa3c19c);
    thread c4_explode(attacker);
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x861
// Size: 0x206
function c4_explode(attacker) {
    printgameaction("c4 triggered", self.owner);
    level notify("explosion_extinguish", self.origin);
    var_cbf7be4f62a0ddb2 = undefined;
    statename = undefined;
    caststart = self.origin;
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 0, 1, 1, 0, 0, 0);
    var_89e70a63b116955b = vectordot((0, 0, 1), anglestoup(self.angles));
    if (abs(var_89e70a63b116955b) <= 0.81915) {
        castend = caststart - anglestoup(self.angles) * 5;
        var_e021c2744cc7ed68 = physics_raycast(caststart, castend, contents, self, 0, "physicsquery_closest", 1);
        if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
            var_cbf7be4f62a0ddb2 = 5;
            statename = "explode";
        }
    } else if (var_89e70a63b116955b <= -0.96592) {
        castend = caststart - anglestoup(self.angles) * 5;
        var_e021c2744cc7ed68 = physics_raycast(caststart, castend, contents, self, 0, "physicsquery_closest", 1);
        if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
            var_cbf7be4f62a0ddb2 = 5;
            statename = "explode";
        }
    }
    if (!isdefined(var_cbf7be4f62a0ddb2)) {
        castend = caststart - (0, 0, 1) * 20;
        var_e021c2744cc7ed68 = physics_raycast(caststart, castend, contents, self, 0, "physicsquery_closest", 1);
        if (!isdefined(var_e021c2744cc7ed68) || var_e021c2744cc7ed68.size <= 0) {
            var_cbf7be4f62a0ddb2 = 5;
            statename = "explodeAir";
        }
    }
    if (!isdefined(var_cbf7be4f62a0ddb2)) {
        var_cbf7be4f62a0ddb2 = 5;
        statename = "explode";
    }
    if (getdvarint(@"hash_39c3947a2e4f5f9e", 0)) {
        thread namespace_6205bc7c5e394598::function_f8903387ea945165(self.origin, 2);
    }
    self setentityowner(attacker);
    self clearscriptabledamageowner();
    self setscriptablepartstate("effects", statename, 0);
    thread c4_delete(var_cbf7be4f62a0ddb2);
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6e
// Size: 0xb
function sweepc4() {
    thread c4_delete();
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa80
// Size: 0x3a
function c4_destroy(attacker) {
    thread c4_delete(5);
    self setscriptablepartstate("effects", "destroy", 0);
    self setscriptablepartstate("hacked", "neutral", 0);
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac1
// Size: 0x15f
function c4_delete(var_cbf7be4f62a0ddb2) {
    if (!isdefined(self) || isdefined(self) && istrue(self.isdestroyed)) {
        return;
    }
    self.isdestroyed = 1;
    self.exploding = 1;
    self notify("death");
    level.mines[self getentitynumber()] = undefined;
    self setscriptablepartstate("hack_usable", "off");
    self setcandamage(0);
    makeexplosiveunusuabletag();
    namespace_2a9588dfac284b77::deregisterspawn();
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    self.headiconid = undefined;
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
        self.dangerzone = undefined;
    }
    owner = self.owner;
    if (isdefined(owner)) {
        c4_removefromarray(owner, self, self getentitynumber());
        owner setclientomnvar("ui_mgl_c4_state", 0);
        owner removeequip(self);
        owner notify("c4_update", 0);
    }
    thread c4_resetscriptableonunlink();
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d")) {
        self [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d") ]](self);
    }
    function_83cebe0ae5318a7f(self);
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait(var_cbf7be4f62a0ddb2);
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc27
// Size: 0x4b
function c4_resetscriptableonunlink() {
    self endon("death");
    wait(0.5);
    if (!isdefined(self)) {
        return;
    }
    parent = self getlinkedparent();
    if (isdefined(parent)) {
        parent waittill("death");
        if (isdefined(self)) {
            self setscriptablepartstate("effects", "neutral", 0);
        }
    }
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc79
// Size: 0x52
function c4_explodeonnotify() {
    self endon("death");
    level endon("game_ended");
    owner = self.owner;
    attacker = self waittill("detonateExplosive");
    if (isdefined(attacker)) {
        thread c4_explode(attacker);
    } else {
        thread c4_explode(owner);
    }
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd2
// Size: 0xc3
function c4_empapplied(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    self notify("enemy_destroyed_equipment", attacker);
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
    if (isdefined(data.var_a6868aec402b3e73)) {
        thread function_156475610be70ced(attacker);
    } else {
        thread c4_destroy(attacker);
    }
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9c
// Size: 0x85
function function_3f54618ac84aa89f(data) {
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
    c4_explode(attacker);
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe28
// Size: 0x7b
function function_156475610be70ced(attacker) {
    self endon("death");
    attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_c45cd96bcaaf28d9");
    self.isdisabled = 1;
    self setscriptablepartstate("emp", "on", 0);
    if (!istrue(self.owner.var_65219c911f198c95)) {
        wait(6);
        self setscriptablepartstate("emp", "off", 0);
        self.isdisabled = 0;
    }
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeaa
// Size: 0x28
function function_f8ffbf95c0890c91(data) {
    self setscriptablepartstate("emp", "off", 0);
    self.isdisabled = 0;
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed9
// Size: 0x24
function c4_destroyongameend() {
    self endon("death");
    level waittill_any_2("game_ended", "bro_shot_start");
    thread c4_destroy();
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf04
// Size: 0x3c
function c4_validdetonationstate() {
    if (!isreallyalive(self)) {
        return 0;
    }
    if (isusingremote()) {
        return 0;
    }
    if (!isdefined(self.c4s) || self.c4s.size <= 0) {
        return 0;
    }
    return 1;
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf48
// Size: 0x39
function c4_candetonate() {
    if (istrue(self.isdisabled) || istrue(self.isjammed)) {
        return 0;
    }
    return (gettime() - self.throwtime) / 1000 > 0.3;
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf89
// Size: 0x148
function c4_watchfordetonation(bundle) {
    self endon("death_or_disconnect");
    var_8077ba6843ecc331 = 0;
    if (issharedfuncdefined("game", "isCommonItemEnabled")) {
        var_8077ba6843ecc331 = [[ getsharedfunc("game", "isCommonItemEnabled") ]]();
    }
    if (!var_8077ba6843ecc331) {
        self endon("equipment_taken_" + "equip_c4");
    }
    level endon("game_ended");
    self notify("watchForDetonation");
    self endon("watchForDetonation");
    weaponname = function_53c4c53197386572(bundle.var_5e26ccbdf0d2766b, "c4_mp");
    var_6969d6c5a2117c33 = function_53c4c53197386572(bundle.var_58fe77f04882df7a, "c4_empty_mp");
    while (1) {
        self waittill("detonate");
        var_49e6ef3edadd524e = function_f581838ce4328f7a(self getheldoffhand());
        if (self getheldoffhand().basename == weaponname || self getheldoffhand().basename == var_6969d6c5a2117c33 || self getheldoffhand().basename == "none" && isdefined(self.isusingcamera) && self.isusingcamera || var_49e6ef3edadd524e == "c4") {
            thread c4_detonateall();
        }
    }
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d8
// Size: 0x14d
function c4_watchforaltdetonation(bundle) {
    self endon("death_or_disconnect");
    var_8077ba6843ecc331 = 0;
    if (issharedfuncdefined("game", "isCommonItemEnabled")) {
        var_8077ba6843ecc331 = [[ getsharedfunc("game", "isCommonItemEnabled") ]]();
    }
    if (isdefined(level.var_930403be3592d644)) {
        var_8077ba6843ecc331 = [[ level.var_930403be3592d644 ]]();
    }
    if (!var_8077ba6843ecc331) {
        self endon("equipment_taken_" + "equip_c4");
    }
    level endon("game_ended");
    if (!getdvarint(@"hash_78d40bc744ba9f00", 0)) {
        return;
    }
    self notify("watchForAltDetonation");
    self endon("watchForAltDetonation");
    while (self usebuttonpressed()) {
        waitframe();
    }
    starttime = gettime();
    buttontime = 0;
    updaterate = level.framedurationseconds;
    while (1) {
        if (self usebuttonpressed()) {
            buttontime = 0;
            while (self usebuttonpressed()) {
                buttontime = buttontime + updaterate;
                wait(updaterate);
            }
            if (buttontime >= 0.5) {
                continue;
            }
            buttontime = 0;
            while (!self usebuttonpressed() && buttontime < 0.25) {
                buttontime = buttontime + updaterate;
                wait(updaterate);
            }
            if (buttontime >= 0.25) {
                continue;
            }
            if (c4_validdetonationstate()) {
                thread c4_animdetonate(bundle);
            }
        }
        waitframe();
    }
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x122c
// Size: 0x4f
function c4_animdetonate(bundle) {
    var_6969d6c5a2117c33 = function_53c4c53197386572(bundle.var_58fe77f04882df7a, "c4_empty_mp");
    objweapon = makeweapon(var_6969d6c5a2117c33);
    self giveandfireoffhand(objweapon);
    thread c4_animdetonatecleanup(bundle);
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1282
// Size: 0x69
function c4_animdetonatecleanup(bundle) {
    self endon("death_or_disconnect");
    self notify("c4_animDetonateCleanup()");
    self endon("c4_animDetonateCleanup()");
    var_6969d6c5a2117c33 = function_53c4c53197386572(bundle.var_58fe77f04882df7a, "c4_empty_mp");
    objweapon = makeweapon(var_6969d6c5a2117c33);
    wait(1);
    if (self hasweapon(objweapon)) {
        self takeweapon(objweapon);
    }
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f2
// Size: 0x70
function c4_detonateall() {
    if (isdefined(self.c4s)) {
        foreach (c4 in self.c4s) {
            if (c4 c4_candetonate()) {
                c4 thread c4_detonate();
            }
        }
    }
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1369
// Size: 0x71
function c4_onownerchanged(var_c0f9139ffd72e62d) {
    if (istrue(self.exploding)) {
        return;
    }
    c4_removefromarray(var_c0f9139ffd72e62d, self, self getentitynumber());
    sentientpool = self.sentientpool;
    namespace_6d9917c3dc05dbe9::unregistersentient(self.sentientpool, self.sentientpoolindex);
    namespace_6d9917c3dc05dbe9::registersentient(sentientpool, self.owner, 1);
    thread c4_destroy();
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e1
// Size: 0x23
function c4_resetaltdetonpickup(bundle) {
    if (namespace_1a507865f681850e::hasequipment("equip_c4")) {
        thread c4_watchforaltdetonation(bundle);
    }
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140b
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1428
// Size: 0x64
function c4_addtoarray(owner, grenade) {
    if (!isdefined(owner.c4s)) {
        owner.c4s = [];
    }
    entnum = grenade getentitynumber();
    owner.c4s[entnum] = grenade;
    owner function_bcc86382f02470e6(1);
    thread c4_removefromarrayondeath(owner, grenade, entnum);
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1493
// Size: 0xa8
function c4_removefromarray(owner, grenade, entnum) {
    if (isdefined(grenade)) {
        grenade notify("c4_removeFromArray");
    }
    if (isdefined(owner) && isdefined(owner.c4s)) {
        owner.c4s[entnum] = undefined;
        foreach (c4 in owner.c4s) {
            if (isdefined(c4)) {
                return;
            }
        }
        owner function_bcc86382f02470e6(0);
    }
}

// Namespace c4/namespace_7381a1f17171d16c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1542
// Size: 0x3d
function c4_removefromarrayondeath(owner, grenade, entnum) {
    grenade endon("c4_removeFromArray");
    owner endon("disconnect");
    grenade waittill("death");
    thread c4_removefromarray(owner, grenade, entnum);
}

