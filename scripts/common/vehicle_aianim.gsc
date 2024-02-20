// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\vehicle\vehicle_common.gsc;
#using scripts\common\notetrack.gsc;
#using scripts\common\vehicle_aianim.gsc;
#using scripts\asm\asm.gsc;
#using scripts\common\vehicle_paths.gsc;
#using scripts\asm\asm_bb.gsc;

#namespace namespace_2c5957a7633fffbb;

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b5
// Size: 0x5fa
function guy_enter(guy, var_5b0cab0a9420da60) {
    guy endon("death_or_disconnect");
    /#
        assertex(!isspawner(self), "Tried to make guys enter a spawner");
    #/
    /#
        assertex(!isdefined(guy.ridingvehicle), "ai can't ride two vehicles at the same time");
    #/
    if (!isdefined(self) || !isalive(self)) {
        return;
    }
    if (!isdefined(self.vehicletype)) {
        return;
    }
    classname = get_vehicle_classname();
    vehicleanim = level.vehicle.templates.aianims[classname];
    self.attachedguys[self.attachedguys.size] = guy;
    pos = set_pos(guy, vehicleanim);
    if (!isdefined(pos)) {
        return;
    }
    if (pos == 0) {
        guy.drivingvehicle = 1;
    }
    var_c458edac96d58b16 = anim_pos(self, pos);
    self.usedpositions[pos] = 1;
    guy.vehicle_position = pos;
    guy.vehicle_idling = 0;
    if (isdefined(var_c458edac96d58b16.delay)) {
        guy.delay = var_c458edac96d58b16.delay;
        if (isdefined(var_c458edac96d58b16.delayinc)) {
            self.delayer = guy.delay;
        }
    }
    if (isdefined(var_c458edac96d58b16.delayinc)) {
        self.delayer = self.delayer + var_c458edac96d58b16.delayinc;
        guy.delay = self.delayer;
    }
    guy.ridingvehicle = self;
    guy.orghealth = guy.health;
    guy.vehicle_idle = var_c458edac96d58b16.idle;
    guy.vehicle_standattack = var_c458edac96d58b16.standattack;
    if (!getdvarint(@"hash_9403d7d31fc1d981")) {
        guy.deathanim = var_c458edac96d58b16.death;
        guy.deathanimscript = var_c458edac96d58b16.deathscript;
    }
    guy.standing = 0;
    guy.allowdeath = 1;
    if (!getdvarint(@"hash_9403d7d31fc1d981")) {
        if (isdefined(guy.deathanim) && !isdefined(guy.magic_bullet_shield) && vehicle_allows_rider_death()) {
            if (guy.vehicle_position != 0 || vehicle_allows_driver_death()) {
                guy.allowdeath = !isdefined(guy.script_allowdeath) || guy.script_allowdeath;
            }
        }
    } else if (!isdefined(guy.magic_bullet_shield) && vehicle_allows_rider_death()) {
        guy.allowdeath = !isdefined(guy.script_allowdeath) || guy.script_allowdeath;
    }
    if (!isdefined(guy.classname)) {
        return;
    }
    if (guy.classname == "script_model") {
        if (isdefined(var_c458edac96d58b16.death) && guy.allowdeath && (!isdefined(guy.script_allowdeath) || guy.script_allowdeath)) {
            thread guy_death(guy, var_c458edac96d58b16);
        }
    }
    self.riders[self.riders.size] = guy;
    if (guy.classname != "script_model" && spawn_failed(guy)) {
        return;
    }
    org = self gettagorigin(var_c458edac96d58b16.sittag);
    angles = self gettagangles(var_c458edac96d58b16.sittag);
    if (!getdvarint(@"hash_9403d7d31fc1d981")) {
        link_to_sittag(guy, var_c458edac96d58b16.sittag, var_c458edac96d58b16.sittag_origin_offset, var_c458edac96d58b16.sittag_angles_offset, var_c458edac96d58b16.linktoblend);
    } else if (guy.classname != "script_model" && !guy hasvehicle()) {
        var_d8d5168b7ec53597 = vehicle_getinstart(pos);
        guy entervehicle(self, 1, var_d8d5168b7ec53597, var_c458edac96d58b16);
    }
    if (isai(guy)) {
        if (!getdvarint(@"hash_9403d7d31fc1d981")) {
            guy forceteleport(org, angles);
        }
        if (isdefined(var_c458edac96d58b16.bhasgunwhileriding) && !var_c458edac96d58b16.bhasgunwhileriding) {
            guy gun_remove();
        }
        if (guy_should_man_turret(var_c458edac96d58b16)) {
            thread guy_man_turret(guy, pos, var_5b0cab0a9420da60);
        }
    } else {
        if (isdefined(var_c458edac96d58b16.bhasgunwhileriding) && !var_c458edac96d58b16.bhasgunwhileriding) {
            detach_models_with_substr(guy, "weapon_");
        }
        guy.origin = org;
        guy.angles = angles;
    }
    if (pos == 0) {
        self.driver = guy;
        if (getdvarint(@"hash_9403d7d31fc1d981") || isdefined(vehicleanim[0].death)) {
            thread driverdead(guy);
        }
    }
    self notify("guy_entered", guy);
    guy notify("loaded");
    namespace_3c37cb17ade254d::ent_flag_clear("unloaded");
    thread guy_handle(guy, pos);
    if (isdefined(var_c458edac96d58b16.rider_func)) {
        guy [[ var_c458edac96d58b16.rider_func ]]();
        return;
    }
    if (!getdvarint(@"hash_9403d7d31fc1d981")) {
        if (isdefined(var_c458edac96d58b16.getin_idle_func)) {
            thread [[ var_c458edac96d58b16.getin_idle_func ]](guy, pos);
        } else {
            thread guy_idle(guy, pos);
        }
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb6
// Size: 0x1b
function vehicle_allows_driver_death() {
    if (!isdefined(self.script_allow_driver_death)) {
        return 0;
    }
    return self.script_allow_driver_death;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd9
// Size: 0x1c
function vehicle_allows_rider_death() {
    if (!isdefined(self.script_allow_rider_deaths)) {
        return 1;
    }
    return self.script_allow_rider_deaths;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfd
// Size: 0x37
function guy_should_man_turret(var_c458edac96d58b16) {
    if (!isdefined(var_c458edac96d58b16.mgturret)) {
        return 0;
    }
    if (!isdefined(self.script_nomg)) {
        return 1;
    }
    return !self.script_nomg;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3c
// Size: 0x17a
function handle_attached_guys() {
    classname = get_vehicle_classname();
    self.attachedguys = [];
    if (!(isdefined(level.vehicle.templates.aianims) && isdefined(level.vehicle.templates.aianims[classname]))) {
        return;
    }
    var_d686c2bf0f2c7e39 = level.vehicle.templates.aianims[classname].size;
    if (isdefined(self.script_noteworthy) && self.script_noteworthy == "ai_wait_go") {
        thread ai_wait_go();
    }
    self.runningtovehicle = [];
    self.usedpositions = [];
    self.getinorgs = [];
    self.delayer = 0;
    vehicleanim = level.vehicle.templates.aianims[classname];
    for (i = 0; i < var_d686c2bf0f2c7e39; i++) {
        self.usedpositions[i] = 0;
        if (isdefined(self.script_nomg) && self.script_nomg && isdefined(vehicleanim[i].bisgunner) && vehicleanim[i].bisgunner) {
            self.usedpositions[1] = 1;
        }
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfbd
// Size: 0x16
function load_ai_goddriver(array) {
    load_ai(array, 1);
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfda
// Size: 0xf6
function guy_death(guy, var_c458edac96d58b16) {
    waittillframeend();
    /#
        assert(!isai(guy));
    #/
    guy setcandamage(1);
    guy endon("death");
    guy.allowdeath = 0;
    guy.health = 10150;
    if (isdefined(guy.script_startinghealth)) {
        guy.health = guy.health + guy.script_startinghealth;
    }
    guy endon("jumping_out");
    if (isdefined(guy.magic_bullet_shield) && guy.magic_bullet_shield) {
        while (isdefined(guy.magic_bullet_shield) && guy.magic_bullet_shield) {
            wait(0.05);
        }
    }
    while (guy.health > 10000) {
        guy waittill("damage");
    }
    thread guy_deathimate_me(guy, var_c458edac96d58b16);
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d7
// Size: 0x111
function guy_deathimate_me(guy, var_c458edac96d58b16) {
    var_ee7b04b3c11dffed = gettime() + getanimlength(var_c458edac96d58b16.death) * 1000;
    angles = guy.angles;
    origin = guy.origin;
    guy = convert_guy_to_drone(guy);
    detach_models_with_substr(guy, "weapon_");
    guy linkto(self);
    guy notsolid();
    guy setanim(var_c458edac96d58b16.death);
    if (isai(guy)) {
        guy script_func("anim_dropallaiweapons");
    } else {
        detach_models_with_substr(guy, "weapon_");
    }
    if (isdefined(var_c458edac96d58b16.death_delayed_ragdoll)) {
        guy unlink();
        if (isdefined(guy.fnpreragdoll)) {
            guy [[ guy.fnpreragdoll ]]();
        }
        guy startragdoll();
        wait(var_c458edac96d58b16.death_delayed_ragdoll);
        guy delete();
        return;
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ef
// Size: 0x88
function load_ai(array, var_2d4646dcbb00a733, group) {
    self endon("death");
    /#
        assert(self.code_classname == "script_vehicle");
    #/
    if (array.size) {
        if (!isdefined(var_2d4646dcbb00a733)) {
            var_2d4646dcbb00a733 = 0;
        }
        namespace_3c37cb17ade254d::ent_flag_clear("unloaded");
        namespace_3c37cb17ade254d::ent_flag_clear("loaded");
        array_levelthread(array, &get_in_vehicle, var_2d4646dcbb00a733, group);
        array_wait(array, "loaded");
    }
    namespace_3c37cb17ade254d::ent_flag_set("loaded");
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127e
// Size: 0x41
function is_rider(guy) {
    for (i = 0; i < self.riders.size; i++) {
        if (self.riders[i] == guy) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c7
// Size: 0x50
function get_in_vehicle(guy, var_2d4646dcbb00a733, group) {
    if (is_rider(guy)) {
        return;
    }
    if (!handle_detached_guys_check()) {
        return;
    }
    /#
        assertex(isalive(guy), "tried to load a vehicle with dead guy, check your AI count to assure spawnability of ai's");
    #/
    guy_runtovehicle(guy, self, var_2d4646dcbb00a733, group);
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131e
// Size: 0x6f
function handle_detached_guys_check() {
    if (vehicle_hasavailablespots()) {
        return 1;
    }
    if (!issp()) {
        classname = self.classname_mp;
    } else {
        classname = self.class;
    }
    /#
        assertmsg("script sent too many ai to vehicle( max is: " + level.vehicle.templates.aianims[classname].size + " )");
    #/
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1394
// Size: 0x3e
function vehicle_hasavailablespots() {
    if (level.vehicle.templates.aianims[get_vehicle_classname()].size - self.runningtovehicle.size) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d9
// Size: 0xe4
function guy_runtovehicle_loaded(guy, vehicle) {
    vehicle endon("death");
    vehicle endon("stop_loading");
    if (!getdvarint(@"hash_9403d7d31fc1d981")) {
        msg = guy waittill_any_return_3("long_death", "death", "enteredvehicle");
        if (msg != "enteredvehicle" && isdefined(guy.forced_startingposition)) {
            vehicle.usedpositions[guy.forced_startingposition] = 0;
        }
    } else if (!guy waitforentervehicle() && isdefined(guy.forced_startingposition)) {
        vehicle.usedpositions[guy.forced_startingposition] = 0;
    }
    vehicle.runningtovehicle = array_remove(vehicle.runningtovehicle, guy);
    vehicle_loaded_if_full(vehicle);
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c4
// Size: 0xb0
function vehicle_loaded_if_full(vehicle) {
    if (isdefined(vehicle.vehicletype) && isdefined(vehicle.vehicle_loaded_notify_size)) {
        if (vehicle.riders.size == vehicle.vehicle_loaded_notify_size) {
            vehicle namespace_3c37cb17ade254d::ent_flag_set("loaded");
        }
    } else if (!vehicle.runningtovehicle.size && vehicle.riders.size) {
        if (vehicle.usedpositions[0]) {
            vehicle namespace_3c37cb17ade254d::ent_flag_set("loaded");
        } else if (!getdvarint(@"hash_9403d7d31fc1d981")) {
            vehicle thread vehicle_reload();
        }
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x157b
// Size: 0x4f
function vehicle_reload() {
    /#
        assert(self.riders.size);
    #/
    riders = self.riders;
    vehicle_unload();
    namespace_3c37cb17ade254d::ent_flag_wait("unloaded");
    riders = array_removedead(riders);
    thread vehicle_load_ai(riders);
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d1
// Size: 0x25
function remove_magic_bullet_shield_from_guy_on_unload_or_death(guy) {
    waittill_any_2("unload", "death");
    guy stop_magic_bullet_shield();
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15fd
// Size: 0xee
function choose_vehicle_position(guy, var_287a5461f98150e9, var_2d4646dcbb00a733) {
    guy endon("stop_loading");
    self endon("stop_loading");
    if (!isdefined(var_2d4646dcbb00a733)) {
        var_2d4646dcbb00a733 = 0;
    }
    var_d0d2bb8c350e1f6b = undefined;
    origin = 0;
    if (isdefined(guy.script_startingposition)) {
        var_d0d2bb8c350e1f6b = vehicle_getinstart(guy.script_startingposition);
    } else if (!self.usedpositions[0]) {
        var_d0d2bb8c350e1f6b = vehicle_getinstart(0);
        if (var_2d4646dcbb00a733) {
            /#
                assertex(!isdefined(guy.magic_bullet_shield), "magic_bullet_shield guy told to god mode drive a vehicle, you should simply load_ai without the god function for this guy");
            #/
            guy thread magic_bullet_shield();
            thread remove_magic_bullet_shield_from_guy_on_unload_or_death(guy);
        }
    } else if (var_287a5461f98150e9.availablepositions.size) {
        var_d0d2bb8c350e1f6b = getclosest(guy.origin, var_287a5461f98150e9.availablepositions);
    } else {
        var_d0d2bb8c350e1f6b = undefined;
    }
    return var_d0d2bb8c350e1f6b;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f3
// Size: 0x695
function guy_runtovehicle(guy, vehicle, var_2d4646dcbb00a733, group) {
    guy endon("stop_loading");
    vehicle endon("stop_loading");
    var_5b0cab0a9420da60 = 1;
    if (!isdefined(var_2d4646dcbb00a733)) {
        var_2d4646dcbb00a733 = 0;
    }
    vehicleanim = level.vehicle.templates.aianims[vehicle get_vehicle_classname()];
    if (isdefined(vehicle.runtovehicleoverride)) {
        vehicle thread [[ vehicle.runtovehicleoverride ]](guy);
        return;
    }
    vehicle endon("death");
    guy endon("death");
    vehicle.runningtovehicle[vehicle.runningtovehicle.size] = guy;
    thread guy_runtovehicle_loaded(guy, vehicle);
    availablepositions = [];
    var_d0d2bb8c350e1f6b = undefined;
    origin = 0;
    var_f15089151c320c06 = getdvarint(@"hash_9403d7d31fc1d981");
    for (i = 0; i < vehicleanim.size; i++) {
        if (isdefined(vehicleanim[i].getin)) {
            var_f15089151c320c06 = 1;
        }
    }
    if (!var_f15089151c320c06) {
        guy notify("enteredvehicle");
        if (getdvarint(@"hash_9403d7d31fc1d981")) {
            var_d0d2bb8c350e1f6b = choose_vehicle_position(guy, get_availablepositions(group), var_2d4646dcbb00a733);
            guy.forced_startingposition = var_d0d2bb8c350e1f6b.vehicle_position;
            vehicle.usedpositions[var_d0d2bb8c350e1f6b.vehicle_position] = 1;
            guy entervehicle(self, 1, var_d0d2bb8c350e1f6b, anim_pos(self, guy.forced_startingposition));
        }
        vehicle guy_enter(guy, var_5b0cab0a9420da60);
        return;
    }
    if (!isdefined(guy.get_in_moving_vehicle)) {
        while (vehicle vehicle_getspeed() > 1) {
            wait(0.05);
        }
    }
    positions = vehicle get_availablepositions(group);
    if (!positions.availablepositions.size && positions.nonanimatedpositions.size) {
        guy notify("enteredvehicle");
        vehicle guy_enter(guy, var_5b0cab0a9420da60);
        return;
    }
    var_d0d2bb8c350e1f6b = choose_vehicle_position(guy, positions, var_2d4646dcbb00a733);
    if (!isdefined(var_d0d2bb8c350e1f6b)) {
        return;
    }
    origin = var_d0d2bb8c350e1f6b.origin;
    angles = var_d0d2bb8c350e1f6b.angles;
    guy.forced_startingposition = var_d0d2bb8c350e1f6b.vehicle_position;
    vehicle.usedpositions[var_d0d2bb8c350e1f6b.vehicle_position] = 1;
    if (!getdvarint(@"hash_9403d7d31fc1d981")) {
        guy.script_moveoverride = 1;
        guy notify("stop_going_to_node");
        guy set_forcegoal();
        guy disable_arrivals();
        guy.goalradius = 64;
        guy setgoalpos(origin);
        guy waittill("goal");
        guy enable_arrivals();
        guy unset_forcegoal();
        guy notify("boarding_vehicle");
    } else {
        guy requestentervehicle(self, 0, var_d0d2bb8c350e1f6b, anim_pos(self, var_d0d2bb8c350e1f6b.vehicle_position));
        guy waitforarrivedatvehicle();
    }
    var_c458edac96d58b16 = anim_pos(vehicle, var_d0d2bb8c350e1f6b.vehicle_position);
    if (isdefined(var_c458edac96d58b16.delay)) {
        guy.delay = var_c458edac96d58b16.delay;
        if (isdefined(var_c458edac96d58b16.delayinc)) {
            self.delayer = guy.delay;
        }
    }
    if (isdefined(var_c458edac96d58b16.delayinc)) {
        self.delayer = self.delayer + var_c458edac96d58b16.delayinc;
        guy.delay = self.delayer;
    }
    if (!getdvarint(@"hash_9403d7d31fc1d981")) {
        vehicle link_to_sittag(guy, var_c458edac96d58b16.sittag, var_c458edac96d58b16.sittag_origin_offset, var_c458edac96d58b16.sittag_angles_offset, var_c458edac96d58b16.linktoblend);
    }
    guy.allowdeath = 0;
    var_c458edac96d58b16 = vehicleanim[var_d0d2bb8c350e1f6b.vehicle_position];
    if (isdefined(var_d0d2bb8c350e1f6b)) {
        if (isdefined(var_c458edac96d58b16.vehicle_getinanim)) {
            var_b92de7d48a424c1c = isdefined(guy.no_vehicle_getoutanim);
            if (!var_b92de7d48a424c1c && !isagent(guy)) {
                if (isdefined(var_c458edac96d58b16.vehicle_getoutanim)) {
                    vehicle clearanim(var_c458edac96d58b16.vehicle_getoutanim, 0);
                }
                if (isdefined(var_c458edac96d58b16.vehicle_getoutanim_combat)) {
                    vehicle clearanim(var_c458edac96d58b16.vehicle_getoutanim_combat, 0);
                }
                if (isdefined(var_c458edac96d58b16.vehicle_getoutanim_combat_run)) {
                    vehicle clearanim(var_c458edac96d58b16.vehicle_getoutanim_combat_run, 0);
                }
            }
            vehicle = vehicle getanimatemodel();
            vehicle thread setanimrestart_once(var_c458edac96d58b16.vehicle_getinanim, var_c458edac96d58b16.vehicle_getinanim_clear);
            vehicle thread namespace_b5a115f53b441ef5::start_notetrack_wait(vehicle, "vehicle_anim_flag", undefined, undefined, var_c458edac96d58b16.vehicle_getinanim);
        }
        if (isdefined(var_c458edac96d58b16.vehicle_getinsoundtag)) {
            origin = vehicle gettagorigin(var_c458edac96d58b16.vehicle_getinsoundtag);
        } else {
            origin = vehicle.origin;
        }
        if (isdefined(var_c458edac96d58b16.vehicle_getinsound)) {
            playsoundatpos(origin, var_c458edac96d58b16.vehicle_getinsound);
        }
        var_499e24a61e1e6679 = undefined;
        var_dcba226db1794b09 = undefined;
        if (isdefined(var_c458edac96d58b16.getin_enteredvehicletrack)) {
            var_499e24a61e1e6679 = [];
            var_499e24a61e1e6679[0] = var_c458edac96d58b16.getin_enteredvehicletrack;
            var_dcba226db1794b09 = [];
            var_dcba226db1794b09[0] = &entered_vehicle_notify;
            vehicle link_to_sittag(guy, var_c458edac96d58b16.sittag, var_c458edac96d58b16.sittag_origin_offset, var_c458edac96d58b16.sittag_angles_offset, var_c458edac96d58b16.linktoblend);
        }
        if (!getdvarint(@"hash_9403d7d31fc1d981")) {
            vehicle animontag(guy, var_c458edac96d58b16.sittag, var_c458edac96d58b16.getin, var_499e24a61e1e6679, var_dcba226db1794b09, undefined, var_c458edac96d58b16.sittag_origin_offset, var_c458edac96d58b16.sittag_angles_offset);
        }
    }
    if (getdvarint(@"hash_9403d7d31fc1d981")) {
        guy waitforentervehicle();
    }
    guy notify("enteredvehicle");
    vehicle guy_enter(guy, var_5b0cab0a9420da60);
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d8f
// Size: 0xb
function entered_vehicle_notify() {
    self notify("enteredvehicle");
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1da1
// Size: 0xb7
function driverdead(guy) {
    if (namespace_dbbb37eb352edf96::ishelicopter()) {
        return;
    }
    self.driver = guy;
    self endon("death");
    guy endon("jumping_out");
    guy waittill("death");
    if (getdvarint(@"hash_bd29c0db2cf41967", 0) == 1) {
        return;
    }
    if (isdefined(self.vehicle_keeps_going_after_driver_dies)) {
        return;
    }
    self notify("driver dead");
    self.deaddriver = 1;
    if (isdefined(self.hasstarted) && self.hasstarted) {
        self setwaitspeed(0);
        self vehicle_setspeed(0, 20, 20);
        self waittill("reached_wait_speed");
    }
    if (!istrue(self.donotunloadondriverdeath)) {
        vehicle_unload();
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e5f
// Size: 0x112
function guy_becomes_real_ai(guy, pos) {
    if (isai(guy)) {
        return guy;
    }
    if (istrue(guy.drone_delete_on_unload)) {
        guy delete();
        return;
    }
    guy = script_func("spawner_makerealai", guy);
    if (utility::issp()) {
        classname = self.classname;
    } else {
        classname = self.classname_mp;
    }
    var_d686c2bf0f2c7e39 = level.vehicle.templates.aianims[classname].size;
    var_c458edac96d58b16 = anim_pos(self, pos);
    link_to_sittag(guy, var_c458edac96d58b16.sittag, var_c458edac96d58b16.sittag_origin_offset, var_c458edac96d58b16.sittag_angles_offset, var_c458edac96d58b16.linktoblend);
    guy.vehicle_idle = var_c458edac96d58b16.idle;
    if (!istrue(guy.disable_vehicle_idle)) {
        thread guy_idle(guy, pos);
    }
    return guy;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f79
// Size: 0x88
function link_to_sittag(guy, tag, origin_offset, angles_offset, linktoblend) {
    if (!isdefined(origin_offset)) {
        origin_offset = (0, 0, 0);
    }
    if (!isdefined(angles_offset)) {
        angles_offset = (0, 0, 0);
    }
    if (!isdefined(linktoblend)) {
        linktoblend = 0;
    }
    if (linktoblend && !isdefined(guy.script_drone)) {
        guy linktoblendtotag(self, tag, 0);
    } else {
        guy linkto(self, tag, origin_offset, angles_offset);
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2008
// Size: 0x64
function anim_pos(vehicle, pos) {
    /#
        assertex(isdefined(pos), "Rider's vehicle " + vehicle get_vehicle_classname() + " position is not defined");
    #/
    if (!isdefined(pos)) {
        return spawnstruct();
    }
    return level.vehicle.templates.aianims[vehicle get_vehicle_classname()][pos];
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2074
// Size: 0x48
function guy_deathhandle(guy, pos) {
    guy waittill("death");
    if (!isdefined(self)) {
        return;
    }
    self.riders = array_remove(self.riders, guy);
    self.usedpositions[pos] = 0;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20c3
// Size: 0x99
function setup_aianimthreads() {
    if (!isdefined(level.vehicle.aianimthread)) {
        level.vehicle.aianimthread = [];
    }
    if (!isdefined(level.vehicle.aianimcheck)) {
        level.vehicle.aianimcheck = [];
    }
    level.vehicle.aianimthread["idle"] = &guy_idle;
    level.vehicle.aianimthread["unload"] = &guy_unload;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2163
// Size: 0x2c
function guy_handle(guy, pos) {
    guy.vehicle_idling = 1;
    thread guy_deathhandle(guy, pos);
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2196
// Size: 0x86
function driver_idle_speed(driver, pos) {
    driver endon("newanim");
    self endon("death");
    driver endon("death");
    var_c458edac96d58b16 = anim_pos(self, pos);
    while (1) {
        if (self vehicle_getspeed() == 0) {
            driver.vehicle_idle = var_c458edac96d58b16.idle_animstop;
        } else {
            driver.vehicle_idle = var_c458edac96d58b16.idle_anim;
        }
        wait(0.25);
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2223
// Size: 0xc1
function guy_idle(guy, pos, var_a6ae0590ddfeaf03) {
    guy endon("newanim");
    if (!isdefined(var_a6ae0590ddfeaf03)) {
        self endon("death");
    }
    guy endon("death");
    guy.vehicle_idling = 1;
    guy notify("gotime");
    if (!isdefined(guy.vehicle_idle)) {
        return;
    }
    var_c458edac96d58b16 = anim_pos(self, pos);
    if (isdefined(var_c458edac96d58b16.mgturret)) {
        return;
    }
    if (isdefined(var_c458edac96d58b16.idle_animstop) && isdefined(var_c458edac96d58b16.idle_anim)) {
        thread driver_idle_speed(guy, pos);
    }
    while (1) {
        guy notify("idle");
        play_new_idle(guy, var_c458edac96d58b16);
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22eb
// Size: 0x171
function play_new_idle(guy, var_c458edac96d58b16) {
    if (isdefined(guy.vehicle_idle_override)) {
        animontag(guy, var_c458edac96d58b16.sittag, guy.vehicle_idle_override, undefined, undefined, undefined, var_c458edac96d58b16.sittag_origin_offset, var_c458edac96d58b16.sittag_angles_offset);
        return;
    }
    if (isdefined(var_c458edac96d58b16.idleoccurrence)) {
        theanim = randomoccurrance(guy, var_c458edac96d58b16.idleoccurrence);
        animontag(guy, var_c458edac96d58b16.sittag, guy.vehicle_idle[theanim], undefined, undefined, undefined, var_c458edac96d58b16.sittag_origin_offset, var_c458edac96d58b16.sittag_angles_offset);
        return;
    }
    if (isdefined(guy.playerpiggyback) && isdefined(var_c458edac96d58b16.player_idle)) {
        animontag(guy, var_c458edac96d58b16.sittag, var_c458edac96d58b16.player_idle, undefined, undefined, undefined, var_c458edac96d58b16.sittag_origin_offset, var_c458edac96d58b16.sittag_angles_offset);
        return;
    }
    if (isdefined(var_c458edac96d58b16.vehicle_idle)) {
        thread setanimrestart_once(var_c458edac96d58b16.vehicle_idle);
    }
    animontag(guy, var_c458edac96d58b16.sittag, guy.vehicle_idle, undefined, undefined, undefined, var_c458edac96d58b16.sittag_origin_offset, var_c458edac96d58b16.sittag_angles_offset);
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2463
// Size: 0x7c
function randomoccurrance(guy, var_e98cd170a6d8296d) {
    range = [];
    var_c32808289f6a7cc0 = 0;
    for (i = 0; i < var_e98cd170a6d8296d.size; i++) {
        var_c32808289f6a7cc0 = var_c32808289f6a7cc0 + var_e98cd170a6d8296d[i];
        range[i] = var_c32808289f6a7cc0;
    }
    var_3ec07b9f2f28c414 = randomint(var_c32808289f6a7cc0);
    for (i = 0; i < var_e98cd170a6d8296d.size; i++) {
        if (var_3ec07b9f2f28c414 < range[i]) {
            return i;
        }
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e6
// Size: 0x7e
function function_b4600df9b9f46f3d(guy) {
    self endon("death");
    wait(50);
    if (isdefined(guy) && array_contains(self.unloadque, guy)) {
        self.unloadque = array_remove(self.unloadque, guy);
        if (!self.unloadque.size) {
            namespace_3c37cb17ade254d::ent_flag_set("unloaded");
            self.unload_group = "default";
            self function_75feda26550d4f0e();
        }
        guy notify("jumpedout");
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x256b
// Size: 0x85
function guy_unload_que(guy) {
    self endon("death");
    self.unloadque = array_add(self.unloadque, guy);
    guy waittill_any_2("death", "jumpedout");
    self.unloadque = array_remove(self.unloadque, guy);
    if (!self.unloadque.size) {
        namespace_3c37cb17ade254d::ent_flag_set("unloaded");
        self.unload_group = "default";
        self function_75feda26550d4f0e();
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25f7
// Size: 0xbb
function riders_unloadable(unload_group) {
    if (!isdefined(self.riders)) {
        return 0;
    }
    if (!self.riders.size) {
        return 0;
    }
    for (i = 0; i < self.riders.size; i++) {
        if (!isalive(self.riders[i]) && !isdefined(self.riders[i].isvehicle)) {
            continue;
        }
        if (!isdefined(self.riders[i].vehicle_position)) {
            continue;
        }
        if (check_unloadgroup(self.riders[i].vehicle_position, unload_group)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26ba
// Size: 0xe7
function get_unload_group() {
    group = [];
    unloadgroups = [];
    unload_group = "default";
    if (isdefined(self.unload_group)) {
        unload_group = self.unload_group;
    }
    unloadgroups = level.vehicle.templates.unloadgroups[get_vehicle_classname()][unload_group];
    if (!isdefined(unloadgroups)) {
        unloadgroups = level.vehicle.templates.unloadgroups[get_vehicle_classname()]["default"];
    }
    foreach (pos in unloadgroups) {
        group[pos] = pos;
    }
    return group;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27a9
// Size: 0x112
function check_unloadgroup(pos, unload_group) {
    if (!isdefined(unload_group)) {
        unload_group = self.unload_group;
    }
    classname = get_vehicle_classname();
    if (!isdefined(level.vehicle.templates.unloadgroups[classname])) {
        return 1;
    }
    if (!isdefined(level.vehicle.templates.unloadgroups[classname][unload_group])) {
        /#
            println("reached_wait_speed" + self.currentnode.origin + "tag_origin" + unload_group + "fastrope_fall");
        #/
        /#
            println("anim_donotetracks");
        #/
        return 1;
    }
    group = level.vehicle.templates.unloadgroups[classname][unload_group];
    for (i = 0; i < group.size; i++) {
        if (pos == group[i]) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c3
// Size: 0x35
function getoutrig_model_idle(model, tag, animation) {
    self endon("unloading");
    while (1) {
        animontag(model, tag, animation);
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28ff
// Size: 0x133
function getoutrig_model(var_c458edac96d58b16, model, tag, animation, var_ec8a68bde7ac6a73) {
    classname = get_vehicle_classname();
    if (var_ec8a68bde7ac6a73) {
        thread getoutrig_model_idle(model, tag, level.vehicle.templates.attachedmodels[classname][var_c458edac96d58b16.fastroperig].idleanim);
        self waittill("unloading");
    }
    self.unloadque = array_add(self.unloadque, model);
    thread getoutrig_abort(model, tag, animation);
    if (!namespace_b479ac682b93cd92::vehicle_iscrashing()) {
        animontag(model, tag, animation);
    }
    model unlink();
    if (!isdefined(self)) {
        model delete();
        return;
    }
    /#
        assert(isdefined(self.unloadque));
    #/
    self.unloadque = array_remove(self.unloadque, model);
    if (!self.unloadque.size) {
        self notify("unloaded");
    }
    self.fastroperig[var_c458edac96d58b16.fastroperig] = undefined;
    wait(10);
    model delete();
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a39
// Size: 0x3d8
function getoutrig_model_new(var_c458edac96d58b16, model, tag, animation, var_ec8a68bde7ac6a73) {
    self endon("death");
    classname = get_vehicle_classname();
    thread delete_on_death(model);
    origin = self gettagorigin(tag);
    angles = self gettagangles(tag);
    xanim = level.vehicle.templates.attachedmodels[classname][var_c458edac96d58b16.fastroperig].idleanim;
    startorg = getstartorigin(origin, angles, xanim);
    startangles = getstartangles(origin, angles, xanim);
    startangles = self.angles;
    tagorigin = model gettagorigin("j_rope_1", 1);
    if (!isdefined(tagorigin)) {
        tagorigin = self.origin;
    }
    tagoffset = tagorigin - self.origin;
    if (var_ec8a68bde7ac6a73) {
        model.origin = startorg;
        model.angles = startangles;
        thread script_func("fastrope_anim", model, xanim, "getoutrigidle");
        namespace_3c37cb17ade254d::ent_flag_wait("unloaded");
    }
    origin = self gettagorigin(tag);
    angles = self gettagangles(tag);
    if (istrue(self.var_7b349dc60a25d9fe)) {
        if (namespace_4ff41449ab14a3a0::riders_unloadable(self.currentnode.script_unload)) {
            var_d2dc14a7732e42db = origin;
            thread getoutrig_abort(model, undefined, animation, var_d2dc14a7732e42db);
            if (!namespace_b479ac682b93cd92::vehicle_iscrashing()) {
                model unlink();
                model.origin = origin;
                model.angles = angles;
                thread script_func("fastrope_anim", model, animation, "getoutrigfall");
            }
        }
    } else {
        var_4cf543314c134490 = self.angles - startangles;
        var_4cf543314c134490 = (angleclamp(var_4cf543314c134490[0]), angleclamp(var_4cf543314c134490[1]), angleclamp(var_4cf543314c134490[2]));
        traceorigin = rotatevector(tagoffset, var_4cf543314c134490) + self.origin;
        results = ray_trace(traceorigin, traceorigin - (0, 0, 1000), self, create_world_contents());
        var_c995307daadda4fe = traceorigin[2] - 400;
        if (isdefined(results["position"])) {
            var_c995307daadda4fe = results["position"][2];
        }
        var_d2dc14a7732e42db = (origin[0], origin[1], var_c995307daadda4fe);
        if (istrue(self.var_e662d8c3659cb3e3)) {
            var_d2dc14a7732e42db = (origin[0], origin[1], origin[2]);
        }
        if (istrue(level.vehicle.templates.attachedmodels[classname][var_c458edac96d58b16.fastroperig].dropusestraceorigin)) {
            var_d2dc14a7732e42db = (traceorigin[0], traceorigin[1], var_c995307daadda4fe);
        }
        /#
            if (getdvarint(@"hash_c318492e4a168bb3", 0) == 1) {
                line(traceorigin, traceorigin - (0, 0, 1000), (0, 0, 1), 1, 0, 400);
                sphere(var_d2dc14a7732e42db, 4, (0, 1, 0), 0, 400);
            }
        #/
        thread getoutrig_abort(model, undefined, animation, var_d2dc14a7732e42db);
        if (!namespace_b479ac682b93cd92::vehicle_iscrashing()) {
            model unlink();
            model.origin = var_d2dc14a7732e42db;
            thread script_func("fastrope_anim", model, animation, "getoutrigfall");
        }
    }
    self.fastroperig[var_c458edac96d58b16.fastroperig] = undefined;
    wait(10);
    model delete();
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e18
// Size: 0x49
function getoutrig_disable_abort_notify_after_riders_out() {
    wait(0.05);
    while (isalive(self) && self.unloadque.size > 2) {
        wait(0.05);
    }
    if (!isalive(self) || namespace_b479ac682b93cd92::vehicle_iscrashing()) {
        return;
    }
    self notify("getoutrig_disable_abort");
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e68
// Size: 0x9a
function getoutrig_abort_while_deploying() {
    self endon("end_getoutrig_abort_while_deploying");
    while (!namespace_b479ac682b93cd92::vehicle_iscrashing()) {
        wait(0.05);
    }
    var_9e36434db96cf25d = [];
    foreach (rider in self.riders) {
        if (isalive(rider)) {
            array_add_safe(var_9e36434db96cf25d, rider);
        }
    }
    array_delete(var_9e36434db96cf25d);
    self notify("crashed_while_deploying");
    var_9e36434db96cf25d = undefined;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f09
// Size: 0x2f8
function getoutrig_abort(model, tag, animation, var_d2dc14a7732e42db) {
    var_1b711d7d9977b93d = getanimlength(animation);
    var_ec4312f917fcfbf3 = var_1b711d7d9977b93d - 1;
    if (self.vehicletype == "mi17") {
        var_ec4312f917fcfbf3 = var_1b711d7d9977b93d - 0.5;
    }
    var_22a98bc45239b860 = 0.8;
    /#
        assert(var_1b711d7d9977b93d > var_22a98bc45239b860);
    #/
    /#
        assert(var_ec4312f917fcfbf3 - var_22a98bc45239b860 > 0);
    #/
    self endon("getoutrig_disable_abort");
    thread getoutrig_disable_abort_notify_after_riders_out();
    thread getoutrig_abort_while_deploying();
    waittill_notify_or_timeout("crashed_while_deploying", var_22a98bc45239b860);
    self notify("end_getoutrig_abort_while_deploying");
    while (!isdefined(self.vehiclecrashing)) {
        waitframe();
    }
    if (isdefined(model)) {
        if (!isdefined(tag) && isdefined(var_d2dc14a7732e42db)) {
            model unlink();
            model.origin = var_d2dc14a7732e42db;
            if (!issp()) {
                if (iscp()) {
                    goto LOC_000001c6;
                }
                animindex = model namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias("animscripted", animation);
                xanim = model namespace_bf5a1761a8d1bb07::asm_getxanim("animscripted", animindex);
                startorg = getstartorigin(self.origin, self.angles, xanim);
                startangles = getstartangles(self.origin, self.angles, xanim);
                model dontinterpolate();
                model forceteleport(startorg, startangles);
                model animmode("nogravity");
                model aisetanim("animscripted", animindex);
            LOC_000001c6:
            } else {
                model animscripted("getoutrigfall", model.origin, model.angles, animation, undefined, undefined, 0);
            }
        } else {
            thread animontag(model, tag, animation);
        }
        waittillframeend();
        if (!iscp()) {
            model setanimtime(animation, var_ec4312f917fcfbf3 / var_1b711d7d9977b93d);
        }
    }
    attacker = self;
    if (isdefined(self.original_attacker)) {
        attacker = self.original_attacker;
    }
    for (i = 0; i < self.riders.size; i++) {
        if (!isdefined(self.riders[i])) {
            continue;
        }
        if (!isdefined(self.riders[i].ragdoll_getout_death)) {
            continue;
        }
        if (self.riders[i].ragdoll_getout_death != 1) {
            continue;
        }
        if (!isdefined(self.riders[i].ridingvehicle)) {
            continue;
        }
        self.riders[i].forcefallthroughonropes = 1;
        if (isalive(self.riders[i])) {
            thread animontag_ragdoll_death_fall(self.riders[i], self, attacker);
        }
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3208
// Size: 0x6b
function setanimrestart_once(var_93eecc7204143fa9, var_d393e2740e2af547) {
    self endon("death");
    self endon("dont_clear_anim");
    if (!isdefined(var_d393e2740e2af547)) {
        var_d393e2740e2af547 = 1;
    }
    var_7dd991f08b7a55c4 = getanimlength(var_93eecc7204143fa9);
    self endon("death");
    thread script_func("vehicle_door_anim", self, var_93eecc7204143fa9);
    wait(var_7dd991f08b7a55c4);
    if (utility::issp() && var_d393e2740e2af547) {
        self clearanim(var_93eecc7204143fa9, 0);
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x327a
// Size: 0x311
function getout_rigspawn(animatemodel, var_c458edac96d58b16, var_ec8a68bde7ac6a73) {
    if (!isdefined(var_ec8a68bde7ac6a73)) {
        var_ec8a68bde7ac6a73 = 1;
    }
    classname = get_vehicle_classname();
    if (isdefined(self.attach_model_override) && isdefined(self.attach_model_override[var_c458edac96d58b16.fastroperig])) {
        var_73fa9448302cbb29 = 1;
    } else {
        var_73fa9448302cbb29 = 0;
    }
    if (!isdefined(var_c458edac96d58b16.fastroperig) || isdefined(self.fastroperig[var_c458edac96d58b16.fastroperig]) || var_73fa9448302cbb29) {
        return;
    }
    origin = animatemodel gettagorigin(level.vehicle.templates.attachedmodels[classname][var_c458edac96d58b16.fastroperig].tag);
    angles = animatemodel gettagangles(level.vehicle.templates.attachedmodels[classname][var_c458edac96d58b16.fastroperig].tag);
    self.fastroperiganimating[var_c458edac96d58b16.fastroperig] = 1;
    getoutrig_model = spawn("script_model", origin);
    getoutrig_model.angles = angles;
    getoutrig_model.origin = origin;
    getoutrig_model useanimtree(%script_model);
    getoutrig_model setmodel(level.vehicle.templates.attachedmodels[classname][var_c458edac96d58b16.fastroperig].model);
    self.fastroperig[var_c458edac96d58b16.fastroperig] = getoutrig_model;
    getoutrig_model linkto(animatemodel, level.vehicle.templates.attachedmodels[classname][var_c458edac96d58b16.fastroperig].tag);
    if (getdvarint(@"hash_9403d7d31fc1d981")) {
        thread getoutrig_model_new(var_c458edac96d58b16, getoutrig_model, level.vehicle.templates.attachedmodels[classname][var_c458edac96d58b16.fastroperig].tag, level.vehicle.templates.attachedmodels[classname][var_c458edac96d58b16.fastroperig].dropanim, var_ec8a68bde7ac6a73);
    } else {
        thread getoutrig_model(var_c458edac96d58b16, getoutrig_model, level.vehicle.templates.attachedmodels[classname][var_c458edac96d58b16.fastroperig].tag, level.vehicle.templates.attachedmodels[classname][var_c458edac96d58b16.fastroperig].dropanim, var_ec8a68bde7ac6a73);
    }
    return getoutrig_model;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3593
// Size: 0x5d
function check_sound_tag_dupe(var_7c44d494aa24e518) {
    if (!isdefined(self.sound_tag_dupe)) {
        self.sound_tag_dupe = [];
    }
    var_4adf5358c5e1376b = 0;
    if (!isdefined(self.sound_tag_dupe[var_7c44d494aa24e518])) {
        self.sound_tag_dupe[var_7c44d494aa24e518] = 1;
    } else {
        var_4adf5358c5e1376b = 1;
    }
    thread check_sound_tag_dupe_reset(var_7c44d494aa24e518);
    return var_4adf5358c5e1376b;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35f8
// Size: 0x72
function check_sound_tag_dupe_reset(var_7c44d494aa24e518) {
    wait(0.05);
    if (!isdefined(self)) {
        return;
    }
    self.sound_tag_dupe[var_7c44d494aa24e518] = 0;
    keys = getarraykeys(self.sound_tag_dupe);
    for (i = 0; i < keys.size; i++) {
        if (self.sound_tag_dupe[keys[i]]) {
            return;
        }
    }
    self.sound_tag_dupe = undefined;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3671
// Size: 0x113
function vehicle_play_exit_anim(var_c458edac96d58b16, vehicle_getoutanim, vehicle_getoutanim_clear) {
    vehicleanim = level.vehicle.templates.aianims[get_vehicle_classname()];
    animatemodel = getanimatemodel();
    if (!isdefined(vehicle_getoutanim)) {
        vehicle_getoutanim = var_c458edac96d58b16.vehicle_getoutanim;
    }
    if (!isdefined(vehicle_getoutanim_clear)) {
        vehicle_getoutanim_clear = var_c458edac96d58b16.vehicle_getoutanim_clear;
    }
    if (isdefined(vehicle_getoutanim)) {
        animatemodel thread setanimrestart_once(vehicle_getoutanim, vehicle_getoutanim_clear);
        var_b3b5db2bc223ffd6 = 0;
        if (isdefined(var_c458edac96d58b16.vehicle_getoutsoundtag)) {
            var_b3b5db2bc223ffd6 = check_sound_tag_dupe(var_c458edac96d58b16.vehicle_getoutsoundtag);
            origin = animatemodel gettagorigin(var_c458edac96d58b16.vehicle_getoutsoundtag);
        } else {
            origin = animatemodel.origin;
        }
        if (isdefined(var_c458edac96d58b16.vehicle_getoutsound) && !var_b3b5db2bc223ffd6) {
            playsoundatpos(origin, var_c458edac96d58b16.vehicle_getoutsound);
        }
        var_b3b5db2bc223ffd6 = undefined;
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x378b
// Size: 0xcf
function vehicle_end_loop_sounds(guy, pos) {
    var_c458edac96d58b16 = anim_pos(self, pos);
    if (isdefined(guy.playerpiggyback) && isdefined(var_c458edac96d58b16.player_getout_sound_loop)) {
        level.player thread script_func("playloopsound_on_entity", var_c458edac96d58b16.player_getout_sound_loop);
    }
    if (isdefined(var_c458edac96d58b16.getoutloopsnd)) {
        guy thread script_func("playloopsound_on_entity", var_c458edac96d58b16.getoutloopsnd);
    }
    if (isdefined(guy.playerpiggyback) && isdefined(var_c458edac96d58b16.player_getout_sound_end)) {
        level.player thread script_func("playsound_on_entity", var_c458edac96d58b16.player_getout_sound_end);
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3861
// Size: 0xac
function prepdoorsforunload() {
    if (self function_8fa29bf693c94b27()) {
        return;
    }
    for (i = 0; i < level.vehicle.templates.aianims[get_vehicle_classname()].size; i++) {
        var_c458edac96d58b16 = level.vehicle.templates.aianims[get_vehicle_classname()][i];
        if (isdefined(var_c458edac96d58b16.vehicle_getoutanim)) {
            anim_name = getanimname(var_c458edac96d58b16.vehicle_getoutanim);
            self function_d043dd116c449128(anim_name);
        }
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3914
// Size: 0x196
function wait_for_open_door(guy, var_c458edac96d58b16) {
    guy endon("jumpedout");
    guy endon("death");
    self endon("death");
    prepdoorsforunload();
    while (!istrue(guy.requestopendoor)) {
        waitframe();
    }
    if (isdefined(var_c458edac96d58b16.vehicle_getoutanim)) {
        anim_name = getanimname(var_c458edac96d58b16.vehicle_getoutanim);
        if (!self function_6d897c252a37c080(anim_name)) {
            vehicle_getoutanim = var_c458edac96d58b16.vehicle_getoutanim;
            vehicle_getoutanim_clear = var_c458edac96d58b16.vehicle_getoutanim_clear;
            if (isdefined(guy.requestopendoorparams)) {
                if (guy.requestopendoorparams == "combat_run" && isdefined(var_c458edac96d58b16.vehicle_getoutanim_combat_run)) {
                    vehicle_getoutanim = var_c458edac96d58b16.vehicle_getoutanim_combat_run;
                    vehicle_getoutanim_clear = var_c458edac96d58b16.vehicle_getoutanim_combat_run_clear;
                } else if (guy.requestopendoorparams == "combat" && isdefined(var_c458edac96d58b16.vehicle_getoutanim_combat)) {
                    vehicle_getoutanim = var_c458edac96d58b16.vehicle_getoutanim_combat;
                    vehicle_getoutanim_clear = var_c458edac96d58b16.vehicle_getoutanim_combat_clear;
                }
            }
            vehicle_play_exit_anim(var_c458edac96d58b16, vehicle_getoutanim, vehicle_getoutanim_clear);
            self function_dcec5ea95982c90c(anim_name, 1);
        }
        if (isdefined(var_c458edac96d58b16.fastroperig) && !isdefined(self.fastroperig[var_c458edac96d58b16.fastroperig])) {
            animatemodel = getanimatemodel();
            getoutrig_model = getout_rigspawn(animatemodel, var_c458edac96d58b16, 1);
        }
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ab1
// Size: 0x46
function guy_setup_rope(guy, var_c458edac96d58b16) {
    if (isdefined(var_c458edac96d58b16.fastroperig)) {
        thread wait_for_open_door(guy, var_c458edac96d58b16);
        guy setuprope();
    } else {
        /#
            assertmsg("Guy is assigned to setup helicopter exit rope, but is missing a fastroperig.");
        #/
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3afe
// Size: 0xb72
function guy_unload(guy, pos) {
    isvehicle = 0;
    if (isdefined(guy.isvehicle)) {
        isvehicle = 1;
    }
    var_c458edac96d58b16 = anim_pos(self, pos);
    type = self.vehicletype;
    if (!check_unloadgroup(pos)) {
        if (!getdvarint(@"hash_9403d7d31fc1d981")) {
            thread guy_idle(guy, pos);
        }
        return;
    }
    if (!getdvarint(@"hash_9403d7d31fc1d981") && !isdefined(var_c458edac96d58b16.getout)) {
        thread guy_idle(guy, pos);
        return;
    }
    thread guy_unload_que(guy);
    if (!issp()) {
        thread function_b4600df9b9f46f3d(guy);
    }
    self endon("death");
    if (isai(guy) && isalive(guy)) {
        guy endon("death");
    }
    bnoanimunload = 0;
    if (isdefined(guy.getoffvehiclefunc)) {
        var_f5b7a13c571f124c = guy [[ guy.getoffvehiclefunc ]]();
        if (isdefined(var_f5b7a13c571f124c) && var_f5b7a13c571f124c) {
            bnoanimunload = 1;
        }
    }
    if (isdefined(guy.onrotatingvehicleturret)) {
        guy.onrotatingvehicleturret = undefined;
        if (isdefined(guy.getoffvehiclefunc)) {
            guy [[ guy.getoffvehiclefunc ]]();
        }
    }
    if (!getdvarint(@"hash_9403d7d31fc1d981")) {
        vehicle_play_exit_anim(var_c458edac96d58b16);
        delay = 0;
        if (isdefined(var_c458edac96d58b16.getout_timed_anim)) {
            delay = delay + getanimlength(var_c458edac96d58b16.getout_timed_anim);
        }
        if (isdefined(var_c458edac96d58b16.delay)) {
            delay = delay + var_c458edac96d58b16.delay;
        }
        if (isdefined(guy.delay)) {
            delay = delay + guy.delay;
        }
        if (delay > 0) {
            if (!getdvarint(@"hash_9403d7d31fc1d981")) {
                thread guy_idle(guy, pos);
            }
            wait(delay);
        }
    }
    if (!getdvarint(@"hash_9403d7d31fc1d981")) {
        guy.deathanim = undefined;
        guy.deathanimscript = undefined;
    }
    guy notify("newanim");
    if (isdefined(var_c458edac96d58b16.bhasgunwhileriding) && !var_c458edac96d58b16.bhasgunwhileriding) {
        if (!isdefined(guy.disable_gun_recall)) {
            guy gun_recall();
        }
    }
    if (isai(guy)) {
        guy pushplayer(1);
    }
    if (isdefined(var_c458edac96d58b16.bnoanimunload)) {
        bnoanimunload = 1;
    } else if (!getdvarint(@"hash_9403d7d31fc1d981") && !isdefined(var_c458edac96d58b16.getout) || !isdefined(self.script_unloadmgguy) && isdefined(var_c458edac96d58b16.bisgunner) && var_c458edac96d58b16.bisgunner || isdefined(self.script_keepdriver) && pos == 0) {
        thread guy_idle(guy, pos);
        return;
    }
    if (guy should_give_orghealth()) {
        guy.health = guy.orghealth;
    }
    guy.orghealth = undefined;
    if (isai(guy) && isalive(guy)) {
        guy endon("death");
    }
    guy.allowdeath = 0;
    tag = var_c458edac96d58b16.sittag;
    if (isdefined(guy.get_out_override)) {
        animation = guy.get_out_override;
    } else if (namespace_3c37cb17ade254d::ent_flag("landed") && isdefined(var_c458edac96d58b16.getout_landed)) {
        animation = var_c458edac96d58b16.getout_landed;
    } else if (isdefined(guy.playerpiggyback) && isdefined(var_c458edac96d58b16.player_getout)) {
        animation = var_c458edac96d58b16.player_getout;
    } else {
        animation = var_c458edac96d58b16.getout;
    }
    if (!bnoanimunload) {
        if (!getdvarint(@"hash_9403d7d31fc1d981")) {
            thread guy_unlink_on_death(guy);
        }
        if (!getdvarint(@"hash_9403d7d31fc1d981") && isdefined(var_c458edac96d58b16.fastroperig)) {
            if (!isdefined(self.fastroperig[var_c458edac96d58b16.fastroperig])) {
                if (!getdvarint(@"hash_9403d7d31fc1d981")) {
                    thread guy_idle(guy, pos);
                }
                animatemodel = getanimatemodel();
                getoutrig_model = getout_rigspawn(animatemodel, var_c458edac96d58b16, 1);
            }
        }
        if (isdefined(var_c458edac96d58b16.getoutsnd)) {
            guy thread script_func("playsound_on_tag", var_c458edac96d58b16.getoutsnd, "J_Wrist_RI", 1);
        }
        if (isdefined(guy.playerpiggyback) && isdefined(var_c458edac96d58b16.player_getout_sound)) {
            guy thread script_func("playsound_on_tag", var_c458edac96d58b16.player_getout_sound);
        }
        if (isdefined(var_c458edac96d58b16.getoutloopsnd)) {
            guy thread script_func("playloopsound_on_tag", var_c458edac96d58b16.getoutloopsnd);
        }
        if (isdefined(guy.playerpiggyback) && isdefined(var_c458edac96d58b16.player_getout_sound_loop)) {
            level.player thread script_func("playloopsound_on_tag", var_c458edac96d58b16.player_getout_sound_loop);
        }
        guy notify("newanim");
        guy notify("jumping_out");
        var_c87c13106eca1f = 0;
        if (!isai(guy) && !isvehicle) {
            var_c87c13106eca1f = 1;
        }
        if (!isdefined(guy.script_stay_drone) && !isvehicle) {
            guy = guy_becomes_real_ai(guy, pos);
        }
        if (!isalive(guy) && !isvehicle) {
            return;
        }
        if (!isvehicle) {
            guy.ragdoll_getout_death = 1;
        }
        if (isdefined(var_c458edac96d58b16.ragdoll_getout_death)) {
            guy.ragdoll_getout_death = 1;
            if (isdefined(var_c458edac96d58b16.ragdoll_fall_anim)) {
                guy.ragdoll_fall_anim = var_c458edac96d58b16.ragdoll_fall_anim;
            }
        }
        if (var_c87c13106eca1f) {
            self.riders = array_add(self.riders, guy);
            thread guy_deathhandle(guy, pos);
            thread guy_unload_que(guy);
            guy.ridingvehicle = self;
        }
        if (isai(guy)) {
            guy endon("death");
        }
        guy notify("newanim");
        guy notify("jumping_out");
        if (isdefined(var_c458edac96d58b16.littlebirde_getout_unlinks) && var_c458edac96d58b16.littlebirde_getout_unlinks) {
            thread stable_unlink(guy);
        }
        if (isalive(guy) && isai(guy) && guy_resets_goalpos(guy)) {
            guy.goalradius = 600;
            guy setgoalpos(guy.origin);
        }
        if (isdefined(var_c458edac96d58b16.getout_secondary)) {
            animontag(guy, tag, animation);
            var_dac541eb37e05fba = tag;
            if (isdefined(var_c458edac96d58b16.getout_secondary_tag)) {
                var_dac541eb37e05fba = var_c458edac96d58b16.getout_secondary_tag;
            }
            animontag(guy, var_dac541eb37e05fba, var_c458edac96d58b16.getout_secondary, undefined, undefined, undefined, var_c458edac96d58b16.sittag_origin_offset, var_c458edac96d58b16.sittag_angles_offset);
        } else {
            var_d71f1e388ef9f02e = 0;
            if (isdefined(var_c458edac96d58b16.getout_hover_loop) && isdefined(var_c458edac96d58b16.getout_hover_land)) {
                thread guy_unload_land(guy, tag, var_c458edac96d58b16.getout, var_c458edac96d58b16.getout_hover_loop, var_c458edac96d58b16.getout_hover_land);
                var_d71f1e388ef9f02e = 1;
            } else if (!isvehicle) {
                guy.anim_end_early = 1;
            }
            if (!getdvarint(@"hash_9403d7d31fc1d981")) {
                animontag(guy, tag, animation, undefined, undefined, undefined, var_c458edac96d58b16.sittag_origin_offset, var_c458edac96d58b16.sittag_angles_offset);
            } else {
                thread wait_for_open_door(guy, var_c458edac96d58b16);
                guy exitvehicle();
            }
            if (var_d71f1e388ef9f02e) {
                guy waittill("hoverunload_done");
            }
        }
        if (isdefined(guy.playerpiggyback) && isdefined(var_c458edac96d58b16.player_getout_sound_loop)) {
            level.player thread stop_loop_sound_on_entity(var_c458edac96d58b16.player_getout_sound_loop);
        }
        if (isdefined(var_c458edac96d58b16.getoutloopsnd)) {
            guy thread stop_loop_sound_on_entity(var_c458edac96d58b16.getoutloopsnd);
        }
        if (isdefined(guy.playerpiggyback) && isdefined(var_c458edac96d58b16.player_getout_sound_end)) {
            level.player thread script_func("playsound_on_entity", var_c458edac96d58b16.player_getout_sound_end);
        }
    } else if (!isai(guy)) {
        if (istrue(guy.drone_delete_on_unload)) {
            guy delete();
            return;
        }
        guy = script_func("spawner_makerealai", guy);
    }
    self.riders = array_remove(self.riders, guy);
    self.usedpositions[pos] = 0;
    guy.ridingvehicle = undefined;
    guy.drivingvehicle = undefined;
    if (!isalive(self) && !isdefined(var_c458edac96d58b16.unload_ondeath)) {
        guy delete();
        return;
    }
    if (!getdvarint(@"hash_9403d7d31fc1d981")) {
        guy unlink();
    }
    if (!isdefined(guy.magic_bullet_shield)) {
        guy.allowdeath = 1;
    }
    if (isalive(guy) || isvehicle) {
        guy.forced_startingposition = undefined;
        if (isai(guy)) {
            if (isdefined(var_c458edac96d58b16.getoutstance)) {
                guy.desired_anim_pose = var_c458edac96d58b16.getoutstance;
                guy allowedstances("crouch");
                guy thread script_func("anim_updateanimpose");
                guy allowedstances("stand", "crouch", "prone");
            }
            guy pushplayer(0);
            guy notify("pushplayerchanged");
        } else if (isvehicle) {
            guy.vspawner.origin = guy.origin;
            guy.vspawner.angles = guy.angles;
            if (isdefined(guy.vspawner.target)) {
                guy.vspawner spawn_vehicle_and_gopath();
            } else {
                var_5ccfd555ce351b7b = guy.vspawner utility::spawn_vehicle();
            }
            guy delete();
        }
        if (!getdvarint(@"hash_9403d7d31fc1d981")) {
            guy notify("jumpedout");
        }
    }
    if (isdefined(guy.script_noteworthy) && guy.script_noteworthy == "delete_after_unload") {
        guy delete();
        return;
    }
    if (isdefined(var_c458edac96d58b16.getout_delete) && var_c458edac96d58b16.getout_delete) {
        guy delete();
        return;
    }
    guy guy_cleanup_vehiclevars();
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4677
// Size: 0x2f1
function guy_unload_land(guy, exittag, jumpanim, loopanim, var_3212b2fca3eca795) {
    var_59ca84ff0b0b2c1b = self gettagorigin(exittag);
    var_c1d6ed48ac403e55 = self gettagangles(exittag);
    startorigin = getstartorigin(var_59ca84ff0b0b2c1b, var_c1d6ed48ac403e55, jumpanim);
    startangles = getstartangles(var_59ca84ff0b0b2c1b, var_c1d6ed48ac403e55, jumpanim);
    var_703dfd8395b70f99 = getmovedelta(jumpanim, 0, 1);
    ent = spawn_tag_origin();
    ent.origin = startorigin;
    ent.angles = startangles;
    endorigin = ent localtoworldcoords(var_703dfd8395b70f99);
    ent thread delete_on_notify("movedone");
    var_b8d60c94893978fa = endorigin;
    groundtrace = utility::groundpos(var_b8d60c94893978fa);
    var_101aa4df00c5c196 = getstartorigin(var_59ca84ff0b0b2c1b, var_c1d6ed48ac403e55, var_3212b2fca3eca795);
    var_703dfd8395b70f99 = getmovedelta(var_3212b2fca3eca795, 0, 1);
    var_ec9901a4ebe157bf = var_101aa4df00c5c196 + var_703dfd8395b70f99;
    var_e2895908736e88b = var_101aa4df00c5c196[2] - var_ec9901a4ebe157bf[2];
    var_a8e1edafff060bbb = groundtrace + (0, 0, var_e2895908736e88b);
    guy.allowdeath = 0;
    guy setcandamage(0);
    guy endon("death");
    wait(getanimlength(jumpanim) - 0.1);
    guy unlink();
    guy notify("animontag_thread");
    guy stopanimscripted();
    ent.origin = guy.origin;
    ent.angles = guy.angles;
    ent dontinterpolate();
    guy dontinterpolate();
    guy linkto(ent, "tag_origin", (0, 0, 0), (0, 0, 0));
    guy.allowdeath = 1;
    guy setcandamage(1);
    guy.unload_loopanim = loopanim;
    if (isai(guy)) {
        guy script_func("asm_animcustom", &guy_fall_loop, &guy_fall_loop_end);
    } else {
        guy thread guy_fall_loop();
    }
    falldist = length((0, 0, var_a8e1edafff060bbb[2]) - (0, 0, var_b8d60c94893978fa[2]));
    var_5493aa85df3321f = 350;
    falltime = falldist / var_5493aa85df3321f;
    ent moveto(var_a8e1edafff060bbb, falltime);
    ent waittill("movedone");
    guy unlink();
    guy animscripted("dropship_land", guy.origin, guy.angles, var_3212b2fca3eca795);
    wait(getanimlength(var_3212b2fca3eca795));
    guy notify("hoverunload_done");
    guy notify("anim_on_tag_done");
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x496f
// Size: 0x7f
function guy_fall_loop() {
    if (isai(self)) {
        if (actor_is3d()) {
            self orientmode("face angle 3d", self.angles);
        } else {
            self orientmode("face angle", self.angles[1]);
        }
        self animmode("zonly_physics", 1);
        self clearanim(namespace_bf5a1761a8d1bb07::asm_getbodyknob(), 0.2);
    }
    self setanim(self.unload_loopanim, 1);
    self waittill("dropship_land");
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49f5
// Size: 0x3
function guy_fall_loop_end() {
    
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49ff
// Size: 0xe2
function guy_resets_goalpos(guy) {
    if (isdefined(guy.script_delayed_playerseek)) {
        return 0;
    }
    if (istrue(guy script_func("ai_has_color"))) {
        return 0;
    }
    if (isdefined(guy.qsetgoalpos)) {
        return 0;
    }
    if (!isdefined(guy.target)) {
        return 1;
    }
    nodes = getnodearray(guy.target, "targetname");
    structs = getstructarray(guy.target, "targetname");
    if (nodes.size > 0 || structs.size > 0) {
        return 0;
    }
    ent = getent(guy.target, "targetname");
    if (isdefined(ent) && ent.classname == "info_volume") {
        return 0;
    }
    return 1;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ae9
// Size: 0x321
function animontag(guy, tag, animation, notetracks, var_a500f6eb31d94a23, flag, origin_offset, angles_offset) {
    guy notify("animontag_thread");
    guy endon("animontag_thread");
    if (!isdefined(origin_offset)) {
        origin_offset = (0, 0, 0);
    }
    if (!isdefined(angles_offset)) {
        angles_offset = (0, 0, 0);
    }
    if (!isdefined(flag)) {
        flag = "animontagdone";
    }
    if (isdefined(self.modeldummy)) {
        animatemodel = self.modeldummy;
    } else {
        animatemodel = self;
    }
    if (!isdefined(tag) || !hastag(animatemodel.model, tag)) {
        org = guy.origin;
        angles = guy.angles;
    } else {
        org = animatemodel gettagorigin(tag);
        angles = animatemodel gettagangles(tag) + angles_offset;
        var_996a07fd7388db1c = anglestoaxis(angles);
        var_8131b69e561ed5ac = [0:"forward", 1:"right", 2:"up"];
        for (i = 0; i < var_996a07fd7388db1c.size; i++) {
            org = org + var_996a07fd7388db1c[var_8131b69e561ed5ac[i]] * origin_offset[i];
        }
    }
    if (isdefined(guy.ragdoll_getout_death)) {
        level thread animontag_ragdoll_death(guy, self);
    }
    if (!issp()) {
        guy dontinterpolate();
        if (isai(guy)) {
            animindex = guy namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias("animscripted", animation);
            xanim = guy namespace_bf5a1761a8d1bb07::asm_getxanim("animscripted", animindex);
            startorg = getstartorigin(self.origin, self.angles, xanim);
            startangles = getstartangles(self.origin, self.angles, xanim);
            guy forceteleport(startorg, startangles);
            guy animmode("nogravity");
            guy aisetanim("animscripted", animindex);
        }
    } else {
        guy animscripted(flag, org, angles, animation);
    }
    if (isai(guy)) {
        thread donotetracks(guy, animatemodel, flag);
    }
    if (isdefined(guy.anim_end_early)) {
        guy.anim_end_early = undefined;
        var_4594c87aa6b0ac8d = getanimlength(animation) - 0.25;
        if (var_4594c87aa6b0ac8d > 0) {
            wait(var_4594c87aa6b0ac8d);
        }
        guy stopanimscripted();
        guy.interval = 0;
        guy thread recover_interval();
    } else {
        if (isdefined(notetracks)) {
            for (i = 0; i < notetracks.size; i++) {
                guy waittillmatch(flag, notetracks[i]);
                guy thread [[ var_a500f6eb31d94a23[i] ]]();
            }
        }
        guy waittillmatch(flag, "end");
    }
    guy notify("anim_on_tag_done");
    guy.ragdoll_getout_death = undefined;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e11
// Size: 0x26
function recover_interval() {
    self endon("death");
    wait(2);
    if (self.interval == 0) {
        self.interval = 80;
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e3e
// Size: 0xfc
function animontag_ragdoll_death(guy, vehicle) {
    if (isdefined(guy.magic_bullet_shield) && guy.magic_bullet_shield) {
        return;
    }
    if (!isai(guy)) {
        guy setcandamage(1);
    }
    guy endon("anim_on_tag_done");
    damage = undefined;
    attacker = undefined;
    var_d7c1a2eebd0b7c47 = vehicle.health <= 0;
    while (1) {
        if (!var_d7c1a2eebd0b7c47 && !(isdefined(vehicle) && vehicle.health > 0)) {
            break;
        }
        attacker = damage = guy waittill("damage");
        if (isdefined(guy.forcefallthroughonropes)) {
            break;
        }
        if (!isdefined(damage)) {
            continue;
        }
        if (damage < 1) {
            continue;
        }
        if (!isdefined(attacker)) {
            continue;
        }
        if (isplayer(attacker)) {
            break;
        }
    }
    if (!isalive(guy)) {
        return;
    }
    thread animontag_ragdoll_death_fall(guy, vehicle, attacker);
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f41
// Size: 0x29e
function animontag_ragdoll_death_fall(guy, vehicle, attacker) {
    guy.deathanim = undefined;
    guy.deathfunction = undefined;
    guy.anim_disablepain = 1;
    if (isdefined(guy.ragdoll_fall_anim)) {
        movedelta = getmovedelta(guy.ragdoll_fall_anim, 0, 1);
        groundpos = physicstrace(guy.origin + (0, 0, 16), guy.origin - (0, 0, 10000));
        var_49489dd09961f605 = distance(guy.origin + (0, 0, 16), groundpos);
        if (abs(movedelta[2] + 16) <= abs(var_49489dd09961f605)) {
            guy thread script_func("playsound_on_entity", "generic_death_falling");
            guy animscripted("fastrope_fall", guy.origin, guy.angles, guy.ragdoll_fall_anim);
            guy waittillmatch("fastrope_fall", "start_ragdoll");
        }
    }
    if (!isdefined(guy)) {
        return;
    }
    guy.deathanim = undefined;
    guy.deathfunction = undefined;
    guy.anim_disablepain = 1;
    guy notify("rope_death", attacker);
    guy kill(attacker.origin, attacker);
    if (isdefined(guy.script_stay_drone)) {
        guy notsolid();
        weapon_model = getweaponmodel(guy.weapon);
        weapon = guy.weapon;
        if (isdefined(weapon_model)) {
            guy detach(weapon_model, "tag_weapon_right");
            org = guy gettagorigin("tag_weapon_right");
            ang = guy gettagangles("tag_weapon_right");
            level.gun = spawn("weapon_" + getcompleteweaponname(weapon), (0, 0, 0));
            level.gun.angles = ang;
            level.gun.origin = org;
        }
    } else {
        guy script_func("anim_dropallaiweapons");
    }
    if (isdefined(guy.fnpreragdoll)) {
        guy [[ guy.fnpreragdoll ]]();
    }
    guy startragdoll();
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51e6
// Size: 0x46
function donotetracks(guy, vehicle, flag) {
    guy endon("idle");
    guy endon("newanim");
    vehicle endon("death");
    guy endon("death");
    guy script_func("anim_donotetracks", flag);
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5233
// Size: 0x42
function animatemoveintoplace(guy, org, angles, var_4e90bf2523360f6c) {
    guy animscripted("movetospot", org, angles, var_4e90bf2523360f6c);
    guy waittillmatch("movetospot", "end");
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x527c
// Size: 0x1b1
function guy_vehicle_death(guy, attacker) {
    /#
        assert(!getdvarint(@"hash_9403d7d31fc1d981"));
    #/
    if (!isalive(guy)) {
        return;
    }
    if (isdefined(self.no_rider_death)) {
        return;
    }
    var_c458edac96d58b16 = anim_pos(self, guy.vehicle_position);
    if (isdefined(var_c458edac96d58b16.explosion_death)) {
        return guy_blowup(guy);
    }
    classname = get_vehicle_classname();
    if (isdefined(level.vehicle.templates.rider_death_func) && isdefined(level.vehicle.templates.rider_death_func[classname])) {
        self [[ level.vehicle.templates.rider_death_func[classname] ]]();
        return;
    }
    if (isdefined(var_c458edac96d58b16.unload_ondeath) && isdefined(self)) {
        if (isdefined(self.dontunloadondeath) && self.dontunloadondeath) {
            return;
        }
        thread guy_idle(guy, guy.vehicle_position, 1);
        wait(var_c458edac96d58b16.unload_ondeath);
        if (isdefined(guy) && isdefined(self)) {
            self.groupedanim_pos = guy.vehicle_position;
            animate_guys("unload");
        }
        return;
    }
    if (isdefined(guy)) {
        if (isdefined(guy.ragdoll_getout_death)) {
            return;
        }
        /#
            /#
                assertex(!isdefined(guy.magic_bullet_shield), "<unknown string>" + guy getentitynumber());
            #/
        #/
        guy delete();
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5434
// Size: 0x1a
function ai_wait_go() {
    self endon("death");
    self waittill("loaded");
    namespace_3bb9da687f15383d::gopath(self);
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5455
// Size: 0x13f
function set_pos(guy, vehicleanim) {
    pos = guy.script_startingposition;
    /#
        if (isdefined(pos)) {
            /#
                assertex(pos < vehicleanim.size && pos >= 0, "<unknown string>" + vehicleanim.size - 1);
            #/
        }
    #/
    if (isdefined(guy.forced_startingposition)) {
        pos = guy.forced_startingposition;
    }
    if (isdefined(pos)) {
        return pos;
    }
    /#
        assertex(!isdefined(pos), "Illegal starting position");
    #/
    for (j = 0; j < self.usedpositions.size; j++) {
        if (self.usedpositions[j]) {
            continue;
        }
        if (isdefined(guy.isvehicle) && !isdefined(vehicleanim[j].isvehicle)) {
            continue;
        }
        if (!isdefined(guy.isvehicle) && isdefined(vehicleanim[j].isvehicle)) {
            continue;
        }
        return j;
    }
    if (isdefined(guy.isvehicle) && guy.isvehicle) {
        /#
            assertmsg("No vehicle (linked vehicles like cargo) positions were found.");
        #/
    } else {
        /#
            assertmsg("All spots on this vehicle were used up, too many AI trying to ride.");
        #/
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x559b
// Size: 0x104
function guy_man_turret(guy, pos, var_5b0cab0a9420da60) {
    var_c458edac96d58b16 = anim_pos(self, pos);
    turret = self.mgturret[var_c458edac96d58b16.mgturret];
    if (!isalive(guy)) {
        return;
    }
    turret endon("death");
    guy endon("death");
    if (isdefined(var_5b0cab0a9420da60) && var_5b0cab0a9420da60 && isdefined(var_c458edac96d58b16.passenger_2_turret_func)) {
        [[ var_c458edac96d58b16.passenger_2_turret_func ]](self, guy, pos, turret);
    }
    set_turret_team(turret);
    turret setdefaultdroppitch(0);
    wait(0.1);
    guy endon("guy_man_turret_stop");
    level thread vehicle_turret_difficulty(turret, utility::getdifficulty());
    turret self_func("setturretignoregoals", 1);
    pose = "stand";
    if (isdefined(var_c458edac96d58b16.turretpos)) {
        pose = var_c458edac96d58b16.turretpos;
    }
    guy namespace_28edc79fcf2fe234::bb_requestturret(turret);
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56a6
// Size: 0x27
function guy_unlink_on_death(guy) {
    guy endon("jumpedout");
    guy waittill("death");
    if (isdefined(guy)) {
        guy unlink();
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56d4
// Size: 0x2d9
function guy_blowup(guy) {
    if (!isdefined(guy.vehicle_position)) {
        return;
    }
    pos = guy.vehicle_position;
    anim_pos = anim_pos(self, pos);
    if (!isdefined(anim_pos.explosion_death)) {
        return;
    }
    guy.deathanim = anim_pos.explosion_death;
    angles = self.angles;
    origin = guy.origin;
    if (isdefined(anim_pos.explosion_death_offset)) {
        origin = origin + anglestoforward(angles) * anim_pos.explosion_death_offset[0];
        origin = origin + anglestoright(angles) * anim_pos.explosion_death_offset[1];
        origin = origin + anglestoup(angles) * anim_pos.explosion_death_offset[2];
    }
    guy = convert_guy_to_drone(guy);
    detach_models_with_substr(guy, "weapon_");
    guy notsolid();
    guy.origin = origin;
    guy.angles = angles;
    guy animscripted("deathanim", origin, angles, anim_pos.explosion_death);
    fraction = 0.3;
    if (isdefined(anim_pos.explosion_death_ragdollfraction)) {
        fraction = anim_pos.explosion_death_ragdollfraction;
    }
    animlength = getanimlength(anim_pos.explosion_death);
    timer = gettime() + animlength * 1000;
    wait(animlength * fraction);
    force = (0, 0, 1);
    org = guy.origin;
    if (getdvar(@"hash_17141fbd31e36b09") == "0") {
        guy delete();
        return;
    }
    if (isai(guy)) {
        guy script_func("anim_dropallaiweapons");
    } else {
        detach_models_with_substr(guy, "weapon_");
    }
    while (!guy isragdoll() && gettime() < timer) {
        org = guy.origin;
        wait(0.05);
        force = guy.origin - org;
        if (isdefined(guy.fnpreragdoll)) {
            guy [[ guy.fnpreragdoll ]]();
        }
        guy startragdoll();
    }
    wait(0.05);
    force = force * 20000;
    for (i = 0; i < 3; i++) {
        if (isdefined(guy)) {
            org = guy.origin;
        }
        wait(0.05);
    }
    if (!guy isragdoll()) {
        guy delete();
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59b4
// Size: 0xeb
function convert_guy_to_drone(guy, var_5d30c43be498cbaf) {
    if (!isdefined(var_5d30c43be498cbaf)) {
        var_5d30c43be498cbaf = 0;
    }
    model = spawn("script_model", guy.origin);
    model.angles = guy.angles;
    model setmodel(guy.model);
    size = guy getattachsize();
    for (i = 0; i < size; i++) {
        model attach(guy getattachmodelname(i), guy getattachtagname(i));
    }
    model useanimtree(%script_model);
    if (isdefined(guy.team)) {
        model.team = guy.team;
    }
    if (!var_5d30c43be498cbaf) {
        guy delete();
    }
    model self_func("makefakeai");
    return model;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5aa7
// Size: 0x24
function vehicle_animate(animation, animtree) {
    self useanimtree(animtree);
    self setanim(animation);
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ad2
// Size: 0x8e
function vehicle_getinstart(pos) {
    var_c458edac96d58b16 = anim_pos(self, pos);
    /#
        assert(isdefined(var_c458edac96d58b16));
    #/
    /#
        assert(isdefined(var_c458edac96d58b16.sittag));
    #/
    /#
        assert(getdvarint(@"hash_9403d7d31fc1d981") || isdefined(var_c458edac96d58b16.getin));
    #/
    return vehicle_getanimstart(var_c458edac96d58b16.getin, var_c458edac96d58b16.sittag, pos, var_c458edac96d58b16.canshootinvehicle);
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b68
// Size: 0xfe
function vehicle_getanimstart(animation, tag, pos, canshootinvehicle) {
    struct = spawnstruct();
    origin = undefined;
    angles = undefined;
    /#
        assert(getdvarint(@"hash_9403d7d31fc1d981") || isdefined(animation));
    #/
    org = self gettagorigin(tag);
    ang = self gettagangles(tag);
    if (!getdvarint(@"hash_9403d7d31fc1d981") || isdefined(animation)) {
        origin = getstartorigin(org, ang, animation);
        angles = getstartangles(org, ang, animation);
    } else {
        origin = org;
        angles = ang;
    }
    struct.origin = origin;
    struct.angles = angles;
    struct.vehicle_position = pos;
    struct.canshootinvehicle = canshootinvehicle;
    return struct;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c6e
// Size: 0xde
function is_position_in_group(vehicle, pos, group) {
    if (!isdefined(group)) {
        return 1;
    }
    classname = vehicle get_vehicle_classname();
    /#
        assert(isdefined(level.vehicle.templates.unloadgroups[classname][group]));
    #/
    var_4c040f8acaf932b4 = level.vehicle.templates.unloadgroups[classname][group];
    foreach (member in var_4c040f8acaf932b4) {
        if (member == pos) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d54
// Size: 0xf5
function get_availablepositions(group) {
    vehicleanim = level.vehicle.templates.aianims[get_vehicle_classname()];
    availablepositions = [];
    nonanimatedpositions = [];
    for (i = 0; i < self.usedpositions.size; i++) {
        if (self.usedpositions[i]) {
            continue;
        }
        if ((getdvarint(@"hash_9403d7d31fc1d981") || isdefined(vehicleanim[i].getin)) && is_position_in_group(self, i, group)) {
            availablepositions[availablepositions.size] = vehicle_getinstart(i);
        } else {
            nonanimatedpositions[nonanimatedpositions.size] = i;
        }
    }
    struct = spawnstruct();
    struct.availablepositions = availablepositions;
    struct.nonanimatedpositions = nonanimatedpositions;
    return struct;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e51
// Size: 0x1f
function getanimatemodel() {
    if (isdefined(self.modeldummy)) {
        return self.modeldummy;
    } else {
        return self;
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e77
// Size: 0xbc
function detach_models_with_substr(guy, substr) {
    size = guy getattachsize();
    var_895aea96c7debffd = [];
    var_e51d4c9a2f109b4b = [];
    index = 0;
    for (i = 0; i < size; i++) {
        modelname = guy getattachmodelname(i);
        tagname = guy getattachtagname(i);
        if (issubstr(modelname, substr)) {
            var_895aea96c7debffd[index] = modelname;
            var_e51d4c9a2f109b4b[index] = tagname;
        }
    }
    for (i = 0; i < var_895aea96c7debffd.size; i++) {
        guy detach(var_895aea96c7debffd[i], var_e51d4c9a2f109b4b[i]);
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f3a
// Size: 0x28
function should_give_orghealth() {
    if (!isai(self)) {
        return 0;
    }
    if (!isdefined(self.orghealth)) {
        return 0;
    }
    return !isdefined(self.magic_bullet_shield);
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f6a
// Size: 0x24
function stable_unlink(guy) {
    self waittill("stable_for_unlink");
    if (isalive(guy)) {
        guy unlink();
    }
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f95
// Size: 0x11d
function animate_guys(other) {
    var_4a5b0778cbc77a84 = [];
    foreach (guy in self.riders) {
        if (isai(guy) && !isalive(guy)) {
            continue;
        }
        if (isdefined(level.vehicle.aianimcheck[other]) && ![[ level.vehicle.aianimcheck[other] ]](guy, guy.vehicle_position)) {
            continue;
        }
        if (isdefined(level.vehicle.aianimthread[other])) {
            guy notify("newanim");
            thread [[ level.vehicle.aianimthread[other] ]](guy, guy.vehicle_position);
            var_4a5b0778cbc77a84[var_4a5b0778cbc77a84.size] = guy;
        } else {
            /#
                println("<unknown string>", other);
            #/
        }
    }
    return var_4a5b0778cbc77a84;
}

// Namespace namespace_2c5957a7633fffbb/namespace_4ff41449ab14a3a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60ba
// Size: 0x2b
function guy_cleanup_vehiclevars() {
    self.vehicle_idling = undefined;
    self.standing = undefined;
    self.vehicle_position = undefined;
    self.delay = undefined;
}
