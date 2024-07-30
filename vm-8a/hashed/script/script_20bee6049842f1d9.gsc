#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_compass.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using script_686729055b66c6e4;
#using scripts\mp\vehicles\damage.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_4bb70b1c5860caaa;
#using script_3e01f6b89a26a5d9;

#namespace namespace_7c315ec0762657c0;

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x6bd
// Size: 0x13
function autoexec main() {
    function_c0b3ddc9a6bdcc46("veh9_motorcycle_blood_burner", &function_675a0998973dd245);
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6d8
// Size: 0xb9
function private function_675a0998973dd245() {
    function_8497e7e46b5e397("veh9_motorcycle_blood_burner");
    level callback::add("onVehicleSpawned", &motorcycle_blood_burner_spawn);
    registersharedfunc("veh9_motorcycle_blood_burner", "exitStart", &function_e0964d069df8d7e9);
    level callback::add("onEnterVehicle", &function_cc9bdf08b7b35ecf);
    level callback::add("onExitVehicle", &function_1e4734b2e10489eb);
    scripts\mp\vehicles\damage::set_pre_mod_damage_callback("veh9_motorcycle_blood_burner", &function_f03d62631af3a63a);
    var_cf116812a48d824 = getdvarint(@"hash_28b89acc80b6ee14", 0) != 0;
    if (var_cf116812a48d824 && !isdefined(level._effect["absorb_blood"])) {
        level._effect["absorb_blood"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_blood_burner_absorb_blood.vfx");
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x799
// Size: 0x99
function private function_f03d62631af3a63a(data) {
    inflictor = data.inflictor;
    if (isdefined(inflictor) && isent(inflictor)) {
        if (inflictor getentitynumber() == worldentnumber()) {
            return false;
        }
        if (inflictor isvehicle()) {
            return false;
        }
        if (isplayer(inflictor)) {
            return false;
        }
    }
    mod = data.meansofdeath;
    if (!isdefined(mod)) {
        return false;
    }
    if (mod == "MOD_CRUSH" || mod == "MOD_IMPACT") {
        return false;
    }
    if (isexplosivedamagemod(mod)) {
        return false;
    }
    return true;
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x83b
// Size: 0x21
function private function_82d2ea92f4eecf27(vehicle, victim) {
    println("<dev string:x1c>");
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x864
// Size: 0xa1
function private function_c9012886e786a2bf(vehicle, victim, var_4efc849888654907) {
    if (isdefined(vehicle.abilityinprogress) && vehicle.abilityinprogress) {
        function_b2468eef57806590(vehicle, "pulseKill");
    } else {
        function_b2468eef57806590(vehicle, "kill");
    }
    meansofdeath = var_4efc849888654907.smeansofdeath;
    crushed = vehicle.speedstate > 1 && isdefined(meansofdeath) && meansofdeath == "MOD_CRUSH";
    vehicle thread function_1c09d370de7e7a2c(victim, crushed);
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90d
// Size: 0xa3
function motorcycle_blood_burner_spawn(params) {
    vehicle = params.vehicle;
    vehicle utility::function_3677f2be30fdd581("visiblity", "hide");
    vehicle utility::function_3677f2be30fdd581("stability", "stable");
    vehicle utility::function_3677f2be30fdd581("spawn", "spawn");
    function_3532b518609a7495(vehicle);
    if (function_89dc39dc11f3988c("veh9_motorcycle_blood_burner")) {
        var_37c4caff52a1f90b = function_29b4292c92443328("veh9_motorcycle_blood_burner").spawn;
        if (isdefined(var_37c4caff52a1f90b)) {
            var_37c4caff52a1f90b.respawndelay = 99999999;
        }
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9b8
// Size: 0x1de
function private function_3532b518609a7495(vehicle) {
    if (!isdefined(vehicle.veh_scriptbundlesettings) || !isdefined(vehicle.veh_scriptbundlesettings.wondervehicle) || !isdefined(vehicle.veh_scriptbundlesettings.wondervehicle.variant_type == "Types_BloodBurner") || !isdefined(vehicle.veh_scriptbundlesettings.wondervehicle.variant_object)) {
        return;
    }
    vehicle.var_74633b25289a1962 = &function_c9012886e786a2bf;
    vehicle.var_9197e7e9de6d8ab = &function_82d2ea92f4eecf27;
    vehicle.enemieskilled = 0;
    vehicle.speedstate = 0;
    vehicle.killstate = 0;
    vehicle.healthstate = 0;
    vehicle.audiorequest = "";
    vehicle.vfxrequest = "ready";
    vehicle.abilityready = 0;
    vehicle.var_25efc4fc66b6ad4b = 0;
    vehicle.var_dd292d172a1fdc77 = -1;
    vehicle.killcharge = 0;
    vehicle.abilityinprogress = 0;
    vehicle.respawninprogress = 0;
    vehicle.safepos = vehicle.origin;
    vehicle.var_85ccbd4bc4b4b792 = 1;
    vehicle.lastvfx = "waiting";
    vehicle thread function_2a9a27964f2e0c7c();
    vehicle thread function_345387d0b0884323();
    vehicle thread function_adde11fc056bc133();
    vehicle thread function_9e4ec0fff7182025();
    vehicle thread function_c08b43459ca08775();
    vehicle thread function_89202dd0bea9f5f1();
    vehicle thread function_2d97df035fa8ef95();
    vehicle thread function_579ff6d5535906c1();
    vehicle thread function_bc10472533a80cd7();
    /#
        vehicle thread function_9c8292aa6b98c7cc();
    #/
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb9e
// Size: 0x1b8
function private function_2a9a27964f2e0c7c() {
    vehicle = self;
    vehicle endon("death");
    vehicle.var_2997d51823099ca3 = 1;
    var_fd0a84f1a43e0416 = 0;
    if (!vehicle hascomponent("p2p")) {
        targetposition = vehicle.origin + anglestoforward(vehicle.angles) * 100;
        if (scripts\engine\trace::ray_trace_passed(vehicle.origin + (0, 0, 2.5), targetposition, vehicle)) {
            vehicle addcomponent("p2p");
            vehicle function_77320e794d35465a("p2p", "brakeAtGoal", 1);
            vehicle function_77320e794d35465a("p2p", "checkStuck", 0);
            vehicle function_77320e794d35465a("p2p", "goalPoint", targetposition);
            vehicle function_77320e794d35465a("p2p", "manualSpeed", scripts\engine\utility::mph_to_ips(vehicle vehicle_gettopspeedforward() / 4));
            vehicle function_77320e794d35465a("p2p", "goalThreshold", 10);
        } else {
            var_fd0a84f1a43e0416 = 1;
        }
    }
    while (vehicle.var_2997d51823099ca3) {
        waitframe();
        if (var_fd0a84f1a43e0416) {
            vehicle.var_2997d51823099ca3 = 0;
            /#
                if (getdvarint(@"hash_ebe62eb0a1c58a6b", 0) == 1) {
                    function_e77e6b2700a0390(vehicle);
                }
            #/
            vehicle utility::function_3677f2be30fdd581("spawn", "clearSpawn");
            function_5dc09d7396eb208a(vehicle, "all_idle");
            continue;
        }
        vehicle_owner = vehicle getvehicleowner();
        if (distance2dsquared(vehicle.origin, targetposition) <= 40 || isdefined(vehicle_owner)) {
            vehicle removecomponent("p2p");
            var_fd0a84f1a43e0416 = 1;
            function_b2468eef57806590(vehicle, "spawn");
        }
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5e
// Size: 0xb0
function function_cc9bdf08b7b35ecf(params) {
    if (!isdefined(params.vehicle) || !isdefined(params.vehicle.vehiclename) || params.vehicle.vehiclename != "veh9_motorcycle_blood_burner") {
        return;
    }
    vehicle = params.vehicle;
    function_b2468eef57806590(vehicle, "enterVeh");
    vehicle.abilityinprogress = 0;
    vehicle thread function_2d8fa80eacc4b2d8();
    /#
        vehicle thread function_9c8292aa6b98c7cc();
    #/
    function_6b427a608f6758de(vehicle, -1);
    function_8ab10c44e6441691(vehicle, -1);
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe16
// Size: 0x62
function function_e0964d069df8d7e9(vehicle, seatid, var_7558f98f3236963d, player, data, specialexit) {
    if (isdefined(function_b81e710fd636efab(vehicle.origin))) {
        data.allowairexit = 1;
    }
    scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_exitstartcallback(vehicle, seatid, var_7558f98f3236963d, player, data, specialexit);
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe80
// Size: 0xd7
function function_1e4734b2e10489eb(params) {
    if (!isdefined(params.vehicle) || !isdefined(params.vehicle.vehiclename) || params.vehicle.vehiclename != "veh9_motorcycle_blood_burner") {
        return;
    }
    vehicle = params.vehicle;
    function_b2468eef57806590(vehicle, "exitVeh");
    function_5dc09d7396eb208a(vehicle, "all_idle");
    function_a1b40f7579c4dbd5(vehicle, 0);
    function_6b427a608f6758de(vehicle, 0);
    if (vehicle.abilityinprogress) {
        vehicle.owner function_e2e3a634dd64e317(4);
        vehicle.owner function_e2e3a634dd64e317(1);
    }
    vehicle notify("left_wonder_vehicle");
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf5f
// Size: 0xd5
function private function_579ff6d5535906c1() {
    vehicle = self;
    vehicle endon("death");
    level endon("game_ended");
    if (!vehicle getscriptablehaspart("stability")) {
        return;
    }
    while (true) {
        body0, body1, flag0, flag1, position, normal, impulse, ent = vehicle waittill("collision");
        if (vehicle hascomponent("p2p")) {
            continue;
        }
        occupants = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getalloccupants(vehicle);
        if (occupants.size == 0) {
            vehicle utility::function_3677f2be30fdd581("stability", "unstable");
        }
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x103c
// Size: 0xbe
function private function_2d97df035fa8ef95() {
    vehicle = self;
    vehicle endon("death");
    level endon("game_ended");
    var_a40d638891661ea1 = getdvarint(@"hash_49a7fd44e7215bef", 100);
    duration = 0;
    while (true) {
        angle = scripts\engine\math::anglebetweenvectorsunit((0, 0, 1), anglestoup(vehicle.angles));
        upsidedown = angle >= var_a40d638891661ea1;
        if (upsidedown) {
            duration += 0.1;
            if (duration > getdvarfloat(@"hash_78bc3e9c5cd1c1d5", 0.6)) {
                scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_ejectalloccupants(vehicle);
                wait 1;
            }
        } else {
            duration = 0;
        }
        waitframe();
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1102
// Size: 0x20
function private function_2e23c0bf442cc6c6(vehicle, state) {
    vehicle.healthstate = state;
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x112a
// Size: 0xfb
function private function_adde11fc056bc133() {
    vehicle = self;
    vehicle endon("death");
    while (true) {
        waitframe();
        startinghealth = vehicle function_85f94d8242a7b797();
        if (isdefined(vehicle.owner)) {
            switch (vehicle.healthstate) {
            case 0: 
                if (vehicle.health <= startinghealth / 4) {
                    function_2e23c0bf442cc6c6(vehicle, 1);
                    function_b2468eef57806590(vehicle, "lowhealth");
                }
                break;
            case 1: 
                if (vehicle.health > startinghealth / 4) {
                    function_2e23c0bf442cc6c6(vehicle, 0);
                } else if (vehicle.health <= 0) {
                    function_b2468eef57806590(vehicle, "destroy");
                    function_5dc09d7396eb208a(vehicle, "despawn");
                    function_2e23c0bf442cc6c6(vehicle, 2);
                }
                break;
            default: 
                break;
            }
        }
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x122d
// Size: 0x103
function private function_89202dd0bea9f5f1() {
    vehicle = self;
    vehicle endon("death");
    if (getdvarint(@"hash_5346a98ebcabab0", 0) == 1) {
        vehiclebundle = vehicle.veh_scriptbundlesettings.wondervehicle.variant_object;
        cooldown = 100;
        var_e115dceec169c102 = vehicle function_85f94d8242a7b797() / vehiclebundle.var_336b1964f177b4e6;
        while (vehicle.health > 0) {
            if (vehicle.var_dd292d172a1fdc77 + cooldown < gettime() && isdefined(vehicle.owner)) {
                vehicle.health = int(vehicle.health - var_e115dceec169c102);
            }
            if (vehicle.health <= 0) {
                function_2e23c0bf442cc6c6(vehicle, 2);
                wait 0.25;
                vehicle vehicle_explode();
            }
            wait 0.1;
        }
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1338
// Size: 0x121
function private function_ab466a5ff3547083() {
    vehicle = self;
    if (getdvarint(@"hash_5346a98ebcabab0", 0) == 1) {
        cooldown = 100;
        currenttimestamp = gettime();
        vehiclebundle = vehicle.veh_scriptbundlesettings.wondervehicle.variant_object;
        if (vehicle.var_dd292d172a1fdc77 + cooldown < currenttimestamp) {
            vehicle.killcharge += vehicle.var_25efc4fc66b6ad4b;
        } else {
            vehicle.killcharge = 0;
        }
        vehicle.health = int(vehicle.health + vehicle function_85f94d8242a7b797() / vehiclebundle.var_7b3162e9efc77313);
        clamp(vehicle.health, 0, vehicle function_85f94d8242a7b797());
        vehicle.var_dd292d172a1fdc77 = gettime();
    }
    if (!vehicle.abilityinprogress) {
        vehicle.enemieskilled++;
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1461
// Size: 0xbe
function private function_f3dc0f920c9d71c4() {
    self endon("wonder_weapon_used");
    self endon("left_wonder_vehicle");
    vehicle = self;
    while (self.abilityready) {
        vehplayers = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getalloccupants(vehicle);
        foreach (occupant in vehplayers) {
            occupant notifyonplayercommand("repeatUseActivate", "+attack");
            occupant waittill("repeatUseActivate");
            if (scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_occupantisvehicledriver(occupant)) {
                self notify("wonder_weapon_used");
            }
            occupant notifyonplayercommandremove("repeatUseActivate", "+attack");
        }
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1527
// Size: 0x21b
function private function_2d8fa80eacc4b2d8() {
    vehicle = self;
    vehicle endon("death");
    vehicle endon("left_wonder_vehicle");
    if (!isdefined(vehicle.var_839182dec10d050c)) {
        vehicle.var_839182dec10d050c = 0;
    }
    while (true) {
        if (isdefined(vehicle.owner)) {
            if (isdefined(vehicle.veh_scriptbundlesettings.wondervehicle.variant_object.var_49ae1fe72251c016)) {
                if (vehicle.var_839182dec10d050c != vehicle.enemieskilled) {
                    progress = vehicle.enemieskilled / vehicle.veh_scriptbundlesettings.wondervehicle.variant_object.var_49ae1fe72251c016;
                    vehicle.owner function_3179e1dbb66e6e4d(progress);
                }
                vehicle.var_839182dec10d050c = vehicle.enemieskilled;
                var_1b63da6f3020c19c = vehicle.enemieskilled >= vehicle.veh_scriptbundlesettings.wondervehicle.variant_object.var_49ae1fe72251c016;
                if (var_1b63da6f3020c19c && !vehicle.abilityready) {
                    function_a1b40f7579c4dbd5(vehicle, 1);
                    if (istrue(vehicle.owner getclientomnvar("ui_vehicle_ability_notification"))) {
                        self setclientomnvar("ui_vehicle_ability_notification", 1);
                    }
                    occupants = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getalloccupants(vehicle);
                    foreach (occupant in occupants) {
                        if (isdefined(occupant)) {
                            vehicle playsoundtoplayer("veh_jup_motorcycle_aether_charged", occupant, vehicle);
                        }
                    }
                    vehicle thread function_9d4a88926a9dba87();
                }
            }
        }
        if (vehicle.killcharge > 0) {
            vehicle.killcharge--;
        }
        waitframe();
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x174a
// Size: 0x7d
function private function_a1b40f7579c4dbd5(vehicle, state) {
    if (state != vehicle.abilityready) {
        vehicle.abilityready = state;
        if (isdefined(vehicle.owner)) {
            if (!istrue(vehicle.abilityinprogress)) {
                if (state) {
                    vehicle.owner function_e2e3a634dd64e317(2);
                    return;
                }
                vehicle.owner function_e2e3a634dd64e317(1);
            }
        }
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17cf
// Size: 0x183
function private function_9d4a88926a9dba87() {
    vehicle = self;
    vehicle endon("death");
    vehicle endon("left_wonder_vehicle");
    vehiclebundle = vehicle.veh_scriptbundlesettings.wondervehicle.variant_object;
    vehicle thread function_f3dc0f920c9d71c4();
    vehicle waittill("wonder_weapon_used");
    function_a1b40f7579c4dbd5(vehicle, 0);
    vehicle.enemieskilled = 0;
    vehicle.abilityinprogress = 1;
    waveinterval = vehiclebundle.var_67ef4a311cfaa39f / max(vehiclebundle.var_48a5318dcd55b195 - 1, 1);
    vehicle.owner function_e2e3a634dd64e317(3);
    vehicle.owner setclientomnvar("ui_vehicle_ability_notification", 0);
    vehicle thread function_f6d80db3ce624a90(vehiclebundle.var_67ef4a311cfaa39f);
    function_b2468eef57806590(vehicle, "powerUp");
    for (i = 0; i < vehiclebundle.var_48a5318dcd55b195; i++) {
        function_e77e6b2700a0390(vehicle);
        wait waveinterval;
    }
    if (vehiclebundle.var_48a5318dcd55b195 > 1) {
        function_e77e6b2700a0390(vehicle);
    }
    vehicle.abilityinprogress = 0;
    function_6b427a608f6758de(vehicle, 0);
    vehicle.owner function_e2e3a634dd64e317(4);
    vehicle.owner function_e2e3a634dd64e317(1);
    function_b2468eef57806590(vehicle, "pulseOver");
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x195a
// Size: 0xd6
function private function_b4b82c7f431d1600(zombie, vehiclebundle) {
    if (!isdefined(zombie) || !isdefined(zombie.aicategory)) {
        return 0;
    }
    switch (zombie.aicategory) {
    case #"hash_84fcf5e68d7230b2": 
        zombie.var_f33496b914378bbd = 1;
        return zombie.health;
    case #"hash_8c089e813083e510": 
        return (vehiclebundle.var_ae404bc6758d21e6 * 0.2);
    case #"hash_7b0e2f2ed84f34": 
        return (vehiclebundle.var_ae404bc6758d21e6 * 0.15);
    case #"hash_7e8a002ed096276c": 
        return (vehiclebundle.var_ae404bc6758d21e6 * 0.1);
    default: 
        return vehiclebundle.var_ae404bc6758d21e6;
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a38
// Size: 0x127
function private function_304ec2350fdfbab2(victim, shock_duration, damage) {
    if (isdefined(victim)) {
        switch (victim.aicategory) {
        case #"hash_84fcf5e68d7230b2": 
            victim zombie_stun::function_2e4d3c67e63f83ac(shock_duration);
            victim setscriptablepartstate("shockStickVfx", "vfx_start", 0);
            victim dodamage(damage, victim.origin, victim, victim, "MOD_UNKNOWN", undefined, "none", undefined);
            wait shock_duration;
            if (isalive(victim)) {
                victim setscriptablepartstate("shockStickVfx", "off", 0);
            }
            break;
        case #"hash_7b0e2f2ed84f34":
        case #"hash_7e8a002ed096276c":
        case #"hash_8c089e813083e510":
        default: 
            victim zombie_stun::function_2e4d3c67e63f83ac(shock_duration);
            victim setscriptablepartstate("shockStickVfx", "vfx_start", 0);
            victim dodamage(damage, victim.origin, victim, victim, "MOD_UNKNOWN", undefined, "none", undefined);
            wait shock_duration;
            if (isalive(victim)) {
                victim setscriptablepartstate("shockStickVfx", "off", 0);
            }
            break;
        }
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b67
// Size: 0x155
function private function_e77e6b2700a0390(vehicle) {
    vehiclebundle = vehicle.veh_scriptbundlesettings.wondervehicle.variant_object;
    function_5dc09d7396eb208a(vehicle, "pulse_on");
    zombies = getaiarrayinradius(vehicle.origin, vehiclebundle.var_8ee73071870ac9a4);
    overridedamager = 0;
    /#
        if (getdvarint(@"hash_8cb672e1e994b7af", 0) == 1) {
            function_341dcbdb25d383ae(vehicle, vehiclebundle);
            overridedamager = 1;
        }
        if (getdvarint(@"hash_e05343dbc9b26f6f", 0) == 1) {
            function_ba5fc0f00bed11c(vehicle, vehiclebundle.var_8ee73071870ac9a4, vehiclebundle.var_ae404bc6758d21e6);
            overridedamager = 1;
        }
        if (getdvarint(@"hash_dd258e86814cc5da", 0) == 1) {
            function_69cc09449c1afb17(vehiclebundle, zombies);
            overridedamager = 1;
        }
        if (getdvarint(@"hash_2c5e84b8cca01214", 0) == 1) {
            function_649c271466bbd9a3(vehicle, vehiclebundle, zombies);
            overridedamager = 1;
        }
        if (getdvarint(@"hash_b7d6ceb39606ba6f", 0) == 1) {
            function_d5bef45e978e6b93(vehicle, vehiclebundle, zombies);
        }
    #/
    if (!overridedamager) {
        function_d804aa8991298461(vehicle, vehiclebundle, zombies);
    }
    wait 0.1;
    function_5dc09d7396eb208a(vehicle, "pulse_off");
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1cc4
// Size: 0x4b
function private function_d5bef45e978e6b93(vehicle, vehiclebundle, zombies) {
    println("<dev string:x2d>");
    if (!isdefined(vehicle.owner)) {
        return;
    }
    vehicle.owner namespace_f375801da2a1ee3a::function_f1a745e0820f56c8();
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1d17
// Size: 0x3f
function private function_ba5fc0f00bed11c(vehicle, expradius, expdamage) {
    radiusdamage(vehicle.origin, expradius, expdamage, expdamage, vehicle.owner, "MOD_EXPLOSIVE");
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1d5e
// Size: 0x74
function private function_69cc09449c1afb17(vehiclebundle, zombies) {
    foreach (zombie in zombies) {
        thread function_304ec2350fdfbab2(zombie, 3.5, vehiclebundle.var_ae404bc6758d21e6 / 2);
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1dda
// Size: 0x228
function private function_d804aa8991298461(vehicle, vehiclebundle, zombies) {
    var_4104c80d5cdac079 = 0;
    var_f874d39fd082e82c = 0;
    fxmade = 0;
    var_79ab1fa1ccc8a591 = undefined;
    foreach (zombie in zombies) {
        thread function_304ec2350fdfbab2(zombie, 3.5, 1);
    }
    foreach (zombie in zombies) {
        var_4104c80d5cdac079++;
        if (isalive(zombie)) {
            println("<dev string:x44>" + var_4104c80d5cdac079);
            nearbyzombies = getaiarrayinradius(zombie.origin, vehiclebundle.var_8ee73071870ac9a4 / 4);
            foreach (nearbyzombie in nearbyzombies) {
                if (zombie == nearbyzombie || !isalive(nearbyzombie)) {
                    println("<dev string:x55>" + var_f874d39fd082e82c);
                    continue;
                }
                var_f874d39fd082e82c++;
                println("<dev string:x69>" + var_f874d39fd082e82c);
                var_d303e0201624e4d0 = function_b4b82c7f431d1600(nearbyzombie, vehiclebundle);
                radiusdamage(nearbyzombie.origin, 0.5, var_d303e0201624e4d0, var_d303e0201624e4d0, vehicle.owner);
                wait 0.1;
            }
            println("<dev string:x7d>");
            finalimpulse = function_b4b82c7f431d1600(zombie, vehiclebundle);
            radiusdamage(zombie.origin, 0.25, finalimpulse, finalimpulse, vehicle.owner);
        }
        waitframe();
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x200a
// Size: 0xba
function private function_341dcbdb25d383ae(vehicle, vehiclebundle) {
    self endon("disconnect");
    ent_flag_init("tesla_storm_active");
    ent_flag_set("tesla_storm_active");
    waveduration = vehiclebundle.var_67ef4a311cfaa39f;
    thread namespace_771aa7cc1ddd631::function_aa9d24b8ec786896(waveduration);
    namespace_771aa7cc1ddd631::function_f38c399e832aae26(self);
    while (waveduration > 0) {
        var_8817869a853f24fe = vehiclebundle.var_8ee73071870ac9a4;
        namespace_771aa7cc1ddd631::function_307d7e90b63d7031(var_8817869a853f24fe, vehiclebundle.var_8ee73071870ac9a4);
        waveduration -= level.framedurationseconds;
        waitframe();
    }
    if (isdefined(self)) {
        namespace_771aa7cc1ddd631::function_9165b55668d825eb(self);
        thread namespace_771aa7cc1ddd631::function_db47c95690861424();
        ent_flag_clear("tesla_storm_active");
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x20cc
// Size: 0xa2
function private function_649c271466bbd9a3(vehicle, vehiclebundle, zombies) {
    foreach (zombie in zombies) {
        zombie.do_immediate_ragdoll = 1;
        physicsexplosionsphere(zombie.origin + (randomintrange(-10, 11), randomintrange(-10, 11), randomintrange(-10, 11)), 30, 15, 150);
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2176
// Size: 0x47
function private function_c08b43459ca08775() {
    vehicle = self;
    vehicle endon("death");
    vehicle.var_235b3090b3176164 = vehicle vehicle_gettopspeedforward();
    while (true) {
        vehicle.var_8f0c671e1b017f57 = vehicle vehicle_getspeed();
        wait 0.1;
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21c5
// Size: 0x30
function private function_8ab10c44e6441691(vehicle, state) {
    println("<dev string:x99>" + state);
    vehicle.speedstate = state;
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21fd
// Size: 0x133
function private function_f1626b1cf7756fe7(vehicle) {
    if (!isdefined(vehicle.var_235b3090b3176164) && !isdefined(vehicle.var_8f0c671e1b017f57)) {
        return;
    }
    if (vehicle.var_8f0c671e1b017f57 <= vehicle.var_235b3090b3176164 * 0.2) {
        if (vehicle.speedstate != 0) {
            function_5dc09d7396eb208a(vehicle, "speed_idle");
            function_8ab10c44e6441691(vehicle, 0);
        }
        return;
    }
    if (vehicle.var_8f0c671e1b017f57 <= vehicle.var_235b3090b3176164 * 0.5) {
        if (vehicle.speedstate != 1) {
            function_5dc09d7396eb208a(vehicle, "speed_low");
            function_8ab10c44e6441691(vehicle, 1);
        }
        return;
    }
    if (vehicle.var_8f0c671e1b017f57 <= vehicle.var_235b3090b3176164 * 0.75) {
        if (vehicle.speedstate != 2) {
            function_5dc09d7396eb208a(vehicle, "speed_med");
            function_8ab10c44e6441691(vehicle, 2);
        }
        return;
    }
    if (vehicle.speedstate != 3) {
        function_5dc09d7396eb208a(vehicle, "speed_high");
        function_8ab10c44e6441691(vehicle, 3);
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2338
// Size: 0x44
function private function_6b427a608f6758de(vehicle, state) {
    if (vehicle.killstate != state) {
        println("<dev string:xae>" + state);
        vehicle.killstate = state;
        return true;
    }
    return false;
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2385
// Size: 0x120
function private function_6c0d63ede9f2517d(vehicle) {
    var_e056fe5169e4cfb5 = vehicle.veh_scriptbundlesettings.wondervehicle.variant_object.var_49ae1fe72251c016;
    killratio = var_e056fe5169e4cfb5 == 0 ? 0 : vehicle.enemieskilled / var_e056fe5169e4cfb5;
    if (killratio == 1 || vehicle.abilityready) {
        if (function_6b427a608f6758de(vehicle, 4)) {
            function_5dc09d7396eb208a(vehicle, "charge_full");
        }
        return;
    }
    if (killratio >= 0.75) {
        if (function_6b427a608f6758de(vehicle, 3)) {
            function_5dc09d7396eb208a(vehicle, "charge_high");
        }
        return;
    }
    if (killratio >= 0.5) {
        if (function_6b427a608f6758de(vehicle, 2)) {
            function_5dc09d7396eb208a(vehicle, "charge_med");
        }
        return;
    }
    if (killratio >= 0.25) {
        if (function_6b427a608f6758de(vehicle, 1)) {
            function_5dc09d7396eb208a(vehicle, "charge_low");
        }
        return;
    }
    if (function_6b427a608f6758de(vehicle, 0)) {
        function_5dc09d7396eb208a(vehicle, "charge_idle");
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x24ad
// Size: 0x95
function private function_ad28dbb2ec46a0d6() {
    vehicle = self;
    while (true) {
        if (isdefined(vehicle.owner)) {
            if (vehicle.safepos != vehicle.origin && !isdefined(function_b81e710fd636efab(vehicle.origin)) && vehicle vehicle_isonground()) {
                vehicle.safepos = vehicle.origin;
                println("<dev string:xc4>" + vehicle.safepos);
            }
        }
        wait 0.75;
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x254a
// Size: 0x7f
function private function_bc10472533a80cd7() {
    vehicle = self;
    vehicle endon("death");
    vehicle childthread function_ad28dbb2ec46a0d6();
    vehicle childthread handle_underwater();
    while (true) {
        waitframe();
        occupants = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getalloccupants(vehicle, 0);
        if (!isdefined(occupants) || occupants.size == 0) {
            function_9ca5e483debe8a9a();
            if (!vehicle.var_2997d51823099ca3) {
                vehicle vehicle_setvelocity(anglestoforward(vehicle.angles) * 0);
            }
        }
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25d1
// Size: 0x8b
function private handle_underwater() {
    vehicle = self;
    duration = 0;
    while (true) {
        if (isdefined(function_b81e710fd636efab(vehicle.origin))) {
            depth = self function_100d3bf35fca6a7f();
            if (depth > getdvarfloat(@"hash_935e7fee96d0746d", 5)) {
                duration++;
                if (duration > getdvarint(@"hash_bce32058b651db6c", 5)) {
                    scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_ejectalloccupants(vehicle);
                }
            } else {
                duration = 0;
            }
        }
        wait 0.5;
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2664
// Size: 0x29a
function private function_9ca5e483debe8a9a() {
    vehicle = self;
    if (isdefined(function_b81e710fd636efab(vehicle.origin))) {
        wait 0.75;
        println("<dev string:xe4>");
        vehicle.respawninprogress = 1;
        function_5dc09d7396eb208a(vehicle, "water_despawn");
        vehicle utility::function_3677f2be30fdd581("single", "vehicle_unusable");
        vehicle function_65aa053c077c003a(1);
        wait 0.5;
        println("<dev string:xf6>" + vehicle.origin);
        if (isnavmeshloaded()) {
            midpoint = (vehicle.origin + vehicle.safepos) * 0.5;
            respawnpoints = getrandomnavpoints(getclosestpointonnavmesh(midpoint, undefined, undefined, undefined, 1, 1), 400, 64);
            var_13dfee66a9e44e98 = undefined;
            foreach (loc in respawnpoints) {
                if (abs(loc[2] - vehicle.origin[2]) > 300) {
                    println("<dev string:x10c>");
                    continue;
                }
                if (distance2dsquared(vehicle.origin, loc) <= 75) {
                    println("<dev string:x132>");
                    continue;
                }
                if (isdefined(function_b81e710fd636efab(loc))) {
                    println("<dev string:x159>");
                    continue;
                }
                println("<dev string:x17e>");
                var_13dfee66a9e44e98 = drop_to_ground(loc);
                break;
            }
            if (isdefined(var_13dfee66a9e44e98)) {
                vehicle.origin = var_13dfee66a9e44e98;
            } else if (isdefined(vehicle.safepos)) {
                println("<dev string:x197>");
                vehicle.origin = vehicle.safepos;
            }
        } else {
            println("<dev string:x1b8>");
            vehicle.origin = vehicle.safepos;
        }
        println("<dev string:x1d0>" + vehicle.origin);
        wait 0.5;
        vehicle function_65aa053c077c003a(0);
        vehicle utility::function_3677f2be30fdd581("single", "vehicle_use");
        vehicle.respawninprogress = 0;
        function_5dc09d7396eb208a(vehicle, "water_respawn");
        return;
    }
    println("<dev string:x1e7>");
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2906
// Size: 0x30
function private function_5dc09d7396eb208a(vehicle, state) {
    println("<dev string:x1fa>" + state);
    vehicle.vfxrequest = state;
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x293e
// Size: 0x25
function private function_a0f23b67e0f93732(request) {
    return isdefined(request) && request == "ready" && !self.respawninprogress;
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x296c
// Size: 0x3b8
function private function_345387d0b0884323() {
    vehicle = self;
    vehicle endon("death");
    while (true) {
        waitframe();
        if (function_a0f23b67e0f93732(vehicle.vfxrequest)) {
            function_f1626b1cf7756fe7(vehicle);
        }
        if (function_a0f23b67e0f93732(vehicle.vfxrequest)) {
            function_6c0d63ede9f2517d(vehicle);
        }
        if (!function_a0f23b67e0f93732(vehicle.vfxrequest)) {
            vehicle.lastvfx = vehicle.vfxrequest;
        }
        switch (vehicle.vfxrequest) {
        case #"hash_bec0ece15df7da12": 
            vehicle utility::function_3677f2be30fdd581("speedAetherFlames", "off");
            break;
        case #"hash_aa68272961722807": 
            vehicle utility::function_3677f2be30fdd581("chargeAetherFlames", "off");
            break;
        case #"hash_8341412f148011b0": 
            vehicle utility::function_3677f2be30fdd581("aetherPulse", "off");
            break;
        case #"hash_eb21a680c2fb1c06": 
            vehicle utility::function_3677f2be30fdd581("speedAetherFlames", "off");
            vehicle utility::function_3677f2be30fdd581("chargeAetherFlames", "off");
            break;
        case #"hash_8e6dd98e1f812357": 
            vehicle utility::function_3677f2be30fdd581("speedAetherFlames", "idleFlames");
            vehicle utility::function_3677f2be30fdd581("chargeAetherFlames", "idleFlames");
            break;
        case #"hash_188b27d629a1729b": 
            vehicle utility::function_3677f2be30fdd581("speedAetherFlames", "idleFlames");
            break;
        case #"hash_b84994e15ad39ab9": 
            vehicle utility::function_3677f2be30fdd581("speedAetherFlames", "lowFlames");
            break;
        case #"hash_b0ce4ee156e3dbc1": 
            vehicle utility::function_3677f2be30fdd581("speedAetherFlames", "medFlames");
            break;
        case #"hash_8d78b1dc39bee7f5": 
            vehicle utility::function_3677f2be30fdd581("speedAetherFlames", "highFlames");
            break;
        case #"hash_a6435219404def7c": 
            vehicle utility::function_3677f2be30fdd581("chargeAetherFlames", "idleFlames");
            break;
        case #"hash_b4696f29675ed610": 
            vehicle utility::function_3677f2be30fdd581("chargeAetherFlames", "lowFlames");
            break;
        case #"hash_badcc5296a7f40ac": 
            vehicle utility::function_3677f2be30fdd581("chargeAetherFlames", "medFlames");
            break;
        case #"hash_2e2fb8132db5f7f2": 
            vehicle utility::function_3677f2be30fdd581("chargeAetherFlames", "highFlames");
            break;
        case #"hash_fbdd2529a8b3563": 
            vehicle utility::function_3677f2be30fdd581("chargeAetherFlames", "fullFlames");
            break;
        case #"hash_faeec005d57d828e": 
            if (vehicle utility::function_35c178c80fa19cbd("aetherPulse", "on")) {
                vehicle utility::function_3677f2be30fdd581("aetherPulse", "off");
                waitframe();
            }
            vehicle utility::function_3677f2be30fdd581("aetherPulse", "on");
            break;
        case #"hash_819aac6f5ae2fb78": 
            vehicle utility::function_3677f2be30fdd581("spawn", "spawn");
            break;
        case #"hash_5393f9d1201e0aa9": 
            vehicle utility::function_3677f2be30fdd581("spawn", "despawn");
            break;
        case #"hash_d1fcfd04cc8d6fe1": 
            vehicle utility::function_3677f2be30fdd581("speedAetherFlames", "off");
            vehicle utility::function_3677f2be30fdd581("chargeAetherFlames", "off");
            vehicle utility::function_3677f2be30fdd581("spawn", "despawn");
            vehicle utility::function_3677f2be30fdd581("stability", "stable");
            break;
        case #"hash_770a027782f85117": 
            vehicle utility::function_3677f2be30fdd581("spawn", "respawn");
            break;
        default: 
            break;
        }
        if (!function_a0f23b67e0f93732(vehicle.vfxrequest)) {
            function_5dc09d7396eb208a(vehicle, "ready");
        }
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d2c
// Size: 0x41c
function private function_1c09d370de7e7a2c(victim, crushed) {
    vehicle = self;
    fxent = spawn("script_model", victim gettagorigin("j_mainroot"));
    fxent.angles = victim.angles;
    fxent setmodel("iw9_player_death_fx");
    if (crushed) {
        fxent setscriptablepartstate("effects", "gib", 0);
        occupants = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getalloccupants(vehicle);
        foreach (occupant in occupants) {
            if (isdefined(occupant)) {
                vehicle playsoundtoplayer("veh_jup_motorcycle_zmb_hit", occupant, vehicle);
            }
        }
    }
    var_cf116812a48d824 = getdvarint(@"hash_28b89acc80b6ee14", 0) != 0;
    if (!var_cf116812a48d824) {
        function_ab466a5ff3547083();
        wait 3;
        fxent delete();
        return;
    }
    waitframe();
    if (!isdefined(fxent)) {
        println("<dev string:x209>");
        return;
    }
    if (isdefined(level._effect["absorb_blood"])) {
        println("<dev string:x21c>");
        playfxontag(level._effect["absorb_blood"], fxent, "tag_origin");
    }
    target_pos = vehicle gettagorigin("tag_headlight");
    if (!isdefined(target_pos)) {
        return;
    }
    target_dir = vectornormalize(target_pos - fxent.origin);
    plane_vec = perpendicularvector(target_dir);
    rotation = randomint(360);
    var_1f248a08906bc222 = 0.8;
    var_2ddeb2d86aae2800 = 1.8;
    max_speed = 18;
    /#
        var_1f248a08906bc222 = getdvarfloat(@"hash_732e60be84ebafe9", 0.8);
        var_2ddeb2d86aae2800 = getdvarfloat(@"hash_6a65baecb2af5ee1", 1.8);
        max_speed = getdvarfloat(@"hash_3155078381c8b922", 18);
    #/
    distance_2d = distance2d(target_pos, fxent.origin);
    start_speed = randomfloat(var_1f248a08906bc222) * distance_2d / 20;
    start_dir = rotatepointaroundvector(plane_vec, target_dir, rotation);
    var_a73bcd4930abb271 = 0;
    var_44f5e09c65bc0cd2 = start_speed;
    var_494de50dae6df05a = var_2ddeb2d86aae2800;
    var_bf616cf6df99c76d = var_44f5e09c65bc0cd2 > 0.0001 ? 2 * var_44f5e09c65bc0cd2 / sqrt(2 * distance_2d / var_494de50dae6df05a) : 0;
    var_31fe41dda7a280d7 = 8;
    success = 0;
    while (!success) {
        move_vec = target_dir * var_a73bcd4930abb271 + start_dir * var_44f5e09c65bc0cd2;
        if (length(move_vec) < distance_2d) {
            fxent moveto(fxent.origin + move_vec, 0.05);
        } else {
            success = 1;
            break;
        }
        waitframe();
        if (!isdefined(vehicle)) {
            break;
        }
        target_pos = vehicle gettagorigin("tag_headlight");
        if (!isdefined(target_pos)) {
            break;
        }
        distance_2d = distance2d(target_pos, fxent.origin);
        var_31fe41dda7a280d7 = lerp(8, 16, vehicle.var_8f0c671e1b017f57 / vehicle.var_235b3090b3176164);
        if (distance_2d <= var_31fe41dda7a280d7) {
            success = 1;
            break;
        }
        target_dir = vectornormalize(target_pos - fxent.origin);
        var_239aff9b47d17e5d = max_speed + vehicle.var_8f0c671e1b017f57;
        var_44f5e09c65bc0cd2 = var_44f5e09c65bc0cd2 > 0 ? var_44f5e09c65bc0cd2 - var_bf616cf6df99c76d : 0;
        var_a73bcd4930abb271 = var_a73bcd4930abb271 < var_239aff9b47d17e5d ? var_a73bcd4930abb271 + var_494de50dae6df05a : var_239aff9b47d17e5d;
    }
    if (success) {
        fxent.origin = target_pos;
        function_ab466a5ff3547083();
        waitframe();
    }
    fxent delete();
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3150
// Size: 0x30
function private function_b2468eef57806590(vehicle, audio) {
    println("<dev string:x235>" + audio);
    vehicle.audiorequest = audio;
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3188
// Size: 0x29b
function private function_9e4ec0fff7182025() {
    vehicle = self;
    vehicle endon("death");
    var_52523c03b3c72fd9 = [];
    var_6c1d7ac26d041462 = 10;
    regularseed = randomint(var_6c1d7ac26d041462);
    var_c488d3848dac94e7 = 10;
    pulseseed = randomint(var_c488d3848dac94e7);
    for (currenttime = gettime() / 1000; true; currenttime = gettime() / 1000) {
        waitframe();
        switch (vehicle.audiorequest) {
        case #"hash_819aac6f5ae2fb78": 
            function_65541b903e3af2c4(vehicle, "dx_ob_abld_bldh_chvr_bldspawn");
            break;
        case #"hash_795e2a880c59bd13": 
            function_65541b903e3af2c4(vehicle, "dx_ob_abld_bldh_chvr_bldlowhealth");
            break;
        case #"hash_f3528a54cc31517b": 
            function_65541b903e3af2c4(vehicle, "dx_ob_abld_bldh_chvr_bldpowerup");
            break;
        case #"hash_28fed6936c766d84": 
            function_65541b903e3af2c4(vehicle, "dx_ob_abld_bldh_chvr_bldpowerdown");
            break;
        case #"hash_145971eb70575f25": 
            function_65541b903e3af2c4(vehicle, "dx_ob_abld_bldh_chvr_blddie");
            break;
        case #"hash_b4b02c54e220dcac": 
            if (!isdefined(var_52523c03b3c72fd9["enter"]) || currenttime > var_52523c03b3c72fd9["enter"] + 60) {
                var_52523c03b3c72fd9["enter"] = currenttime;
                function_65541b903e3af2c4(vehicle, "dx_ob_abld_bldh_chvr_bldmount");
            }
            break;
        case #"hash_74f3fd71217f2c4": 
            if (!isdefined(var_52523c03b3c72fd9["exit"]) || currenttime > var_52523c03b3c72fd9["exit"] + 60) {
                var_52523c03b3c72fd9["exit"] = currenttime;
                function_65541b903e3af2c4(vehicle, "dx_ob_abld_bldh_chvr_blddismount");
            }
            break;
        case #"hash_611825599f1b56f9": 
            if (!isdefined(var_52523c03b3c72fd9["kill"]) || currenttime > var_52523c03b3c72fd9["kill"] + 20) {
                if (regularseed == randomint(var_6c1d7ac26d041462) || var_6c1d7ac26d041462 == 1) {
                    var_52523c03b3c72fd9["kill"] = currenttime;
                    function_65541b903e3af2c4(vehicle, "dx_ob_abld_bldh_chvr_bldregularkill");
                    var_6c1d7ac26d041462 = 10;
                    regularseed = randomint(var_6c1d7ac26d041462);
                } else {
                    var_6c1d7ac26d041462--;
                    regularseed = randomint(var_6c1d7ac26d041462);
                }
            }
            break;
        case #"hash_1346a1a9a0041362": 
            if (!isdefined(var_52523c03b3c72fd9["pulsekill"]) || currenttime > var_52523c03b3c72fd9["pulsekill"] + 10) {
                if (regularseed == randomint(var_c488d3848dac94e7) || var_c488d3848dac94e7 == 1) {
                    var_52523c03b3c72fd9["pulsekill"] = currenttime;
                    function_65541b903e3af2c4(vehicle, "dx_ob_abld_bldh_chvr_bldabilitykill");
                    var_c488d3848dac94e7 = 10;
                    pulseseed = randomint(var_c488d3848dac94e7);
                } else {
                    var_c488d3848dac94e7--;
                    pulseseed = randomint(var_c488d3848dac94e7);
                }
            }
            break;
        default: 
            break;
        }
    }
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x342b
// Size: 0x44
function private function_65541b903e3af2c4(vehicle, var_fbc7b9b8af0387d9) {
    println("<dev string:x245>" + var_fbc7b9b8af0387d9);
    vehicle utility::function_3677f2be30fdd581("playVO", var_fbc7b9b8af0387d9);
    function_b2468eef57806590(vehicle, "clear");
    wait 1.5;
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3477
// Size: 0xb2
function private perpendicularvector(src) {
    srcsq = src * src;
    pos = 0;
    if (srcsq[1] < srcsq[0]) {
        pos = 1;
    }
    if (srcsq[2] < srcsq[pos]) {
        pos = 2;
    }
    d = src[pos] * -1;
    dst = src * d;
    if (pos == 0) {
        dst += (1, 0, 0);
    }
    if (pos == 1) {
        dst += (0, 1, 0);
    }
    if (pos == 2) {
        dst += (0, 0, 1);
    }
    dst = vectornormalize(dst);
    return dst;
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3532
// Size: 0x21
function function_f8a572109aed9075(vehicle) {
    occupants = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getalloccupants(vehicle);
    return isdefined(occupants[0]);
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x355c
// Size: 0x21
function function_c563a44e50fa0b5c(vehicle) {
    occupants = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getalloccupants(vehicle);
    return occupants.size > 0;
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3586
// Size: 0x80
function function_bbc0921bf4618fe2(vehicle) {
    vehplayers = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getalloccupants(vehicle);
    foreach (occupant in vehplayers) {
        if (scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_occupantisvehicledriver(occupant)) {
            occupant setcamerathirdperson(1);
            continue;
        }
        occupant setcamerathirdperson(0);
    }
}

/#

    // Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x360e
    // Size: 0x163
    function private function_9c8292aa6b98c7cc() {
        vehicle = self;
        vehicle endon("<dev string:x253>");
        vehicle endon("<dev string:x259>");
        while (true) {
            waitframe();
            if (isdefined(vehicle.owner)) {
                if (getdvarint(@"hash_4e48fed1a83a010f", 0) == 1) {
                    if (!vehicle.abilityready) {
                        println("<dev string:x26d>");
                        function_a1b40f7579c4dbd5(vehicle, 1);
                        vehicle thread function_9d4a88926a9dba87();
                    }
                }
                if (getdvarint(@"hash_1601592e811a91ed", 0) == 1) {
                    if (vehicle.enemieskilled < vehicle.veh_scriptbundlesettings.wondervehicle.variant_object.var_49ae1fe72251c016) {
                        function_ab466a5ff3547083();
                        wait 0.25;
                    }
                }
                if (getdvarint(@"hash_762710f95982f0ae", 0) == 1) {
                    iprintln("<dev string:x27e>" + vehicle.lastvfx);
                    iprintln("<dev string:x28c>" + vehicle.speedstate);
                    iprintln("<dev string:x295>" + vehicle.killstate);
                    iprintln("<dev string:x29d>" + vehicle.health);
                    iprintln("<dev string:x2a7>" + vehicle.enemieskilled);
                    wait 0.1;
                }
            }
        }
    }

#/

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3779
// Size: 0x18
function private function_e2e3a634dd64e317(state) {
    self setclientomnvar("ui_vehicle_ability_state", state);
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3799
// Size: 0x18
function private function_3179e1dbb66e6e4d(progress) {
    self setclientomnvar("ui_vehicle_ability_progress", progress);
}

// Namespace namespace_7c315ec0762657c0 / namespace_aa1c4c94ef382c5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x37b9
// Size: 0x61
function private function_f6d80db3ce624a90(duration) {
    self endon("left_wonder_vehicle");
    progress = 1;
    updatetimeinterval = 0.1;
    progressdelta = updatetimeinterval / duration;
    while (progress >= 0) {
        progress -= progressdelta;
        self.owner function_3179e1dbb66e6e4d(progress);
        wait updatetimeinterval;
    }
}
