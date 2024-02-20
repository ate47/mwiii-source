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
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\perks\perk_equipmentping.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\utility\points.gsc;

#namespace namespace_fe938103f6354aa9;

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x257
// Size: 0x1b8
function function_3f0911714ab49503(grenade) {
    self endon("disconnect");
    grenade endon("death");
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672")) {
        grenade [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672") ]](grenade);
    }
    grenade.bundle = namespace_1a507865f681850e::function_2113b6f7cb462692(grenade.weapon_name);
    printgameaction("IED thrown", grenade.owner);
    grenade namespace_2a9588dfac284b77::registerspawn(1, &function_5481370bf1e83031);
    if (_hasperk("specialty_rugged_eqp")) {
        grenade.hasruggedeqp = 1;
    }
    grenade thread minedamagemonitor();
    grenade thread function_ebd3dd21ad253364();
    grenade thread function_43018577e4dd0c6e();
    grenade thread namespace_43a68cf8c122ab9::remoteinteractsetup(&function_3f005f45aece84a, 1, 1);
    thread namespace_3bbb5a98b932c46f::monitordisownedgrenade(self, grenade);
    grenade waittill("missile_stuck");
    grenade.stucktime = gettime();
    grenade thread function_58606993710db8de();
    grenade setotherent(self);
    grenade setnodeploy(1);
    onequipmentplanted(grenade, "equip_ied", &function_1ccee9c8e442c35d);
    thread monitordisownedequipment(self, grenade);
    grenade namespace_6d9917c3dc05dbe9::registersentient("Lethal_Static", grenade.owner, 1);
    grenade function_641996b5e113c5c6(grenade, &function_4260b88126e41b5d);
    grenade thread namespace_90b872e9b61df82b::runequipmentping();
    grenade setscriptablepartstate("effects", "plant", 0);
    thread namespace_3bbb5a98b932c46f::outlineequipmentforowner(grenade);
    grenade missilethermal();
    grenade missileoutline();
    grenade.headiconid = grenade namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 0, undefined, undefined, undefined, 0.1, 1);
    grenade function_1a0e37df908265ce();
}

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x416
// Size: 0x9c
function function_1a0e37df908265ce() {
    if (istrue(level.dangerzoneskipequipment)) {
        return;
    }
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
    }
    var_d8695b9748c307be = (self.origin[0], self.origin[1], self.origin[2] - 50);
    self.dangerzone = namespace_b2d5aa2baf2b5701::addspawndangerzone(var_d8695b9748c307be, namespace_b2d5aa2baf2b5701::getdefaultminedangerzoneradiussize(), 100, self.owner.team, undefined, self.owner, 0, self, 1);
}

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b9
// Size: 0xaa
function function_58606993710db8de() {
    self endon("death");
    while (1) {
        ents = self waittill("trigger_grenade");
        /#
            assert(isdefined(ents));
        #/
        if (!function_87eebc132ad2bbb0()) {
            continue;
        }
        foreach (ent in ents) {
            if (isagent(ent) || isplayer(ent)) {
                if (!isreallyalive(ent)) {
                    continue;
                }
                thread function_3f005f45aece84a();
                return;
            }
        }
    }
}

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56a
// Size: 0x1a
function function_43018577e4dd0c6e() {
    self endon("death");
    self waittill("mine_destroyed");
    thread function_47f438ad33722fec();
}

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58b
// Size: 0x82
function function_3f005f45aece84a(attacker) {
    self endon("death");
    self.owner endon("disconnect");
    if (isdefined(attacker)) {
        attacker endon("disconnect");
    } else {
        attacker = self.owner;
    }
    self setscriptablepartstate("effects", "trigger", 0);
    detonationdelay = function_53c4c53197386572(self.bundle.var_5afe95fb2040309e, 0.5);
    wait(detonationdelay);
    thread function_c41a5d2e32fee997(attacker);
}

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x614
// Size: 0x1e1
function function_c41a5d2e32fee997(attacker) {
    printgameaction("IED triggered", self.owner);
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
    thread function_1ccee9c8e442c35d(var_cbf7be4f62a0ddb2);
    self setentityowner(attacker);
    self clearscriptabledamageowner();
    self setscriptablepartstate("effects", statename, 0);
}

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fc
// Size: 0xb
function function_5481370bf1e83031() {
    thread function_1ccee9c8e442c35d();
}

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80e
// Size: 0x3a
function function_47f438ad33722fec(attacker) {
    thread function_1ccee9c8e442c35d(5);
    self setscriptablepartstate("effects", "destroy", 0);
    self setscriptablepartstate("hacked", "neutral", 0);
}

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84f
// Size: 0x105
function function_1ccee9c8e442c35d(var_cbf7be4f62a0ddb2) {
    self notify("death");
    level.mines[self getentitynumber()] = undefined;
    self setscriptablepartstate("hack_usable", "off");
    self setcandamage(0);
    namespace_2a9588dfac284b77::deregisterspawn();
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    self.headiconid = undefined;
    self.exploding = 1;
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
        self.dangerzone = undefined;
    }
    owner = self.owner;
    if (isdefined(owner)) {
        owner removeequip(self);
    }
    thread function_921422f5877505e8();
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d")) {
        self [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d") ]](self);
    }
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait(var_cbf7be4f62a0ddb2);
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95b
// Size: 0x40
function function_921422f5877505e8() {
    self endon("death");
    wait(0.5);
    parent = self getlinkedparent();
    if (isdefined(parent)) {
        parent waittill("death");
        self setscriptablepartstate("effects", "neutral", 0);
    }
}

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a2
// Size: 0xa5
function function_4260b88126e41b5d(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    self notify("enemy_destroyed_equipment", attacker);
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
    thread function_47f438ad33722fec(attacker);
}

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa4e
// Size: 0x85
function function_7f534465d312ec86(data) {
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
    function_c41a5d2e32fee997(attacker);
}

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xada
// Size: 0x64
function function_3a37c0c72490b13a(attacker) {
    self endon("death");
    attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_c45cd96bcaaf28d9");
    self.isdisabled = 1;
    self setscriptablepartstate("emp", "on", 0);
    wait(6);
    self setscriptablepartstate("emp", "off", 0);
    self.isdisabled = 0;
}

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb45
// Size: 0x24
function function_ebd3dd21ad253364() {
    self endon("death");
    level waittill_any_2("game_ended", "bro_shot_start");
    thread function_47f438ad33722fec();
}

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb70
// Size: 0x6c
function function_87eebc132ad2bbb0() {
    if (istrue(self.isdisabled) || istrue(self.isjammed)) {
        return 0;
    }
    activationdelay = function_53c4c53197386572(self.bundle.var_c4af2266a63d3bc5, 0.5);
    return isdefined(self.stucktime) && (gettime() - self.stucktime) / 1000 > activationdelay;
}

// Namespace namespace_fe938103f6354aa9/namespace_80fd9fce6a4434f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbe4
// Size: 0x22
function function_f85453705ce0972a(var_c0f9139ffd72e62d) {
    if (istrue(self.exploding)) {
        return;
    }
    thread function_47f438ad33722fec();
}
