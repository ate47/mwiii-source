// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using script_28144ebcb239e561;
#using scripts\mp\utility\outline.gsc;
#using script_62384cde1a08c286;
#using scripts\mp\flags.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\engine\scriptable.gsc;
#using script_518ae857a3d351c;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\equipment\tactical_cover.gsc;

#namespace namespace_db33ab6330bb5189;

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeb1
// Size: 0x9f
function function_28c9bb84699d73b2() {
    var_5e775cbe1e4b789f = level namespace_f4ed8842b49252fd::function_e2344ec3f70a089c();
    if (istrue(var_5e775cbe1e4b789f)) {
        function_e5c4e335df2843c();
        function_3a30249a5c64c552();
        function_566826c5ccdd0270();
        function_b4ebcfb94d5a02a6();
        function_d010329c992047c7();
        function_e688c950f545c6dc();
        function_12f730953d7999fd();
        level function_43a60391e95332e();
        level function_714ca74c07bcc71c();
        level function_259b94f62f15b4be();
        level function_503244ee309d918d();
        level._effect["sandbag_built"] = loadfx("vfx/jup/level/mp_jup_launchfacility/vfx_jup_lf_sandbags_debris_02.vfx");
        level._effect["turret_fixed"] = loadfx("vfx/jup/level/mp_jup_launchfacility/vfx_jup_lf_machinegun_repaired_glow.vfx");
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf57
// Size: 0xf6
function function_566826c5ccdd0270() {
    level.scr_animtree["Hesco"] = %animated_props;
    level.scr_anim["Hesco"]["building"] = animated_props%jup_fxanim_war_military_buildable_set_cosecho_barrier_open_01;
    level.scr_animname["Hesco"]["building"] = "jup_fxanim_war_military_buildable_set_cosecho_barrier_open_01";
    level.scr_anim["Hesco"]["idle"] = animated_props%jup_fxanim_war_military_buildable_set_cosecho_barrier_idle;
    level.scr_animname["Hesco"]["idle"] = "jup_fxanim_war_military_buildable_set_cosecho_barrier_idle";
    level.var_c88bedfa8ddcb42c["Hesco"] = [];
    level.var_c88bedfa8ddcb42c["Hesco"]["models"] = [0:"jup_military_buildable_cosecho_barrier_02_fxanim"];
    level.var_c88bedfa8ddcb42c["Hesco"]["animations"] = [0:"Hesco", 1:[0:"building"], 2:[0:"idle"]];
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1054
// Size: 0xc9
function function_e688c950f545c6dc() {
    buildinfo = spawnstruct();
    buildinfo.models = level.var_c88bedfa8ddcb42c["Hesco"]["models"];
    buildinfo.animations = level.var_c88bedfa8ddcb42c["Hesco"]["animations"];
    buildinfo.var_29f5481763dbf9df = 4;
    buildinfo.gestureweapon = "nothing_here";
    buildinfo.hintstring = "MP_JUP_WM/BUILD";
    buildinfo.var_32a2681a13f18cb1 = &function_eeb5fae661444ab6;
    buildinfo.var_fc147a62066d05bd = &function_219488eeb71cf8ce;
    buildinfo.var_562da06e56403b2f = &function_f7d3423c552f1596;
    level.var_2d2b6d9851424059["bdb_hesco"] = buildinfo;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1124
// Size: 0x32f
function function_259b94f62f15b4be() {
    ents = getentarray("tri_build_hesco", "targetname");
    foreach (ent in ents) {
        var_febb042dd9982690 = getstruct(ent.target, "targetname");
        var_c96dc31f024483a8 = getentarray(var_febb042dd9982690.target, "targetname");
        if (!isdefined(var_febb042dd9982690) || !isdefined(var_c96dc31f024483a8)) {
            continue;
        }
        buildable = namespace_f4ed8842b49252fd::function_e20a97a059fba2ea("bdb_hesco", ent, ent.script_noteworthy, 0, var_febb042dd9982690.origin, var_febb042dd9982690.angles);
        ent.buildable = buildable;
        ent.buildable.clips = var_c96dc31f024483a8;
        foreach (clip in var_c96dc31f024483a8) {
            clip notsolid();
            if (!isdefined(clip.script_parameters)) {
                ent.buildable.clip = clip;
                ent.buildable.clip connectpaths();
                ent.buildable.clip.origin = ent.buildable.clip.origin - (0, 0, 50);
            } else if (clip.script_parameters == "surrounding") {
                clip.origin = clip.origin - (0, 0, 50);
                if (!isdefined(ent.buildable.var_b9f9e69ecdc695dc)) {
                    ent.buildable.var_b9f9e69ecdc695dc = [];
                }
                ent.buildable.var_b9f9e69ecdc695dc[ent.buildable.var_b9f9e69ecdc695dc.size] = clip;
            } else if (clip.script_parameters == "pop_up") {
                ent.buildable.var_50a6206249c12b19 = clip;
            }
            clip.moverdoesnotkill = 1;
        }
        if (isdefined(ent.buildable.models[0])) {
            ent.buildable.models[0].outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(ent.buildable.models[0], "shimmer_crafting_wm_buildable", "level_script");
        }
        ent usetriggerrequirelookat(1);
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x145a
// Size: 0x1b5
function function_eeb5fae661444ab6(player, buildable) {
    var_c22e8f6d44833e5e = 50 * anglestoright(buildable.models[0].angles);
    buildable.var_50a6206249c12b19 solid();
    buildable.var_50a6206249c12b19.originpos = buildable.var_50a6206249c12b19.origin;
    buildable.var_50a6206249c12b19 moveto(buildable.var_50a6206249c12b19.origin + var_c22e8f6d44833e5e, 0.2);
    buildable.models[0] function_adc7327a592cc4a1();
    /#
        sphere(buildable.var_50a6206249c12b19.origin, 10, undefined, undefined, 10000);
    #/
    foreach (clip in buildable.var_b9f9e69ecdc695dc) {
        clip solid();
        clip.originpos = clip.origin;
        clip delaycall(0.2, &movez, 50, 0.2);
    }
    buildable.clip solid();
    buildable.clip.originpos = buildable.clip.origin;
    buildable.clip movez(50, 4);
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1616
// Size: 0x90
function function_219488eeb71cf8ce(player, buildable) {
    foreach (clip in buildable.clips) {
        clip notsolid();
        if (isdefined(clip.originpos)) {
            clip.origin = clip.originpos;
        }
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ad
// Size: 0x11a
function function_f7d3423c552f1596(player, buildable) {
    ent = buildable.var_6bcc6405c250ecb4;
    foreach (clip in buildable.clips) {
        if (isdefined(clip.script_parameters)) {
            clip notsolid();
            clip delete();
        } else {
            clip disconnectpaths();
        }
    }
    if (isdefined(buildable.models[0])) {
        playfx(level._effect["sandbag_built"], buildable.models[0].origin);
    }
    namespace_cbd3754a0c69cc63::outlinedisable(buildable.models[0].outlineid, buildable.models[0]);
    buildable.clip function_adc7327a592cc4a1();
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ce
// Size: 0x13e
function function_3a30249a5c64c552() {
    level.scr_animtree["TankTrap"] = %animated_props;
    level.scr_anim["TankTrap"]["idle"] = animated_props%jup_fxanim_war_military_buildable_hedgehog_idle;
    level.scr_animname["TankTrap"]["idle"] = "jup_fxanim_war_military_buildable_hedgehog_idle";
    level.scr_anim["TankTrap"]["building"] = animated_props%jup_fxanim_war_military_buildable_hedgehog_repair;
    level.scr_animname["TankTrap"]["building"] = "jup_fxanim_war_military_buildable_hedgehog_repair";
    level.scr_anim["TankTrap"]["destroy"] = animated_props%jup_fxanim_war_military_buildable_hedgehog_destroy;
    level.scr_animname["TankTrap"]["destroy"] = "jup_fxanim_war_military_buildable_hedgehog_destroy";
    level.var_c88bedfa8ddcb42c["TankTrap"] = [];
    level.var_c88bedfa8ddcb42c["TankTrap"]["models"] = [0:"jup_military_buildable_hedgehog_02_fxanim"];
    level.var_c88bedfa8ddcb42c["TankTrap"]["animations"] = [0:"TankTrap", 1:[0:"building"], 2:[0:"idle"], 3:[0:"destroy"]];
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1913
// Size: 0xc9
function function_12f730953d7999fd() {
    buildinfo = spawnstruct();
    buildinfo.models = level.var_c88bedfa8ddcb42c["TankTrap"]["models"];
    buildinfo.animations = level.var_c88bedfa8ddcb42c["TankTrap"]["animations"];
    buildinfo.var_29f5481763dbf9df = 4;
    buildinfo.hintstring = "MP_JUP_WM/BUILD";
    buildinfo.gestureweapon = "jup_war_ges_wrench_hedgehog";
    buildinfo.var_32a2681a13f18cb1 = &namespace_555f6ee22fb8fd82::function_14557abb4173c907;
    buildinfo.var_fc147a62066d05bd = &namespace_555f6ee22fb8fd82::function_e6e4ec899d114c59;
    buildinfo.var_562da06e56403b2f = &namespace_555f6ee22fb8fd82::function_18b4ff54f4110b21;
    level.var_2d2b6d9851424059["bdb_tankTrap"] = buildinfo;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e3
// Size: 0x2b7
function function_503244ee309d918d() {
    ents = getentarray("tri_build_tank_trap", "targetname");
    foreach (index, ent in ents) {
        var_1c59cace1457e117 = getstruct(ent.target, "targetname");
        buildable = namespace_f4ed8842b49252fd::function_e20a97a059fba2ea("bdb_tankTrap", ent, ent.script_noteworthy, 0, var_1c59cace1457e117.origin, var_1c59cace1457e117.angles);
        ent.buildable = buildable;
        ent.id = index;
        if (isdefined(ent.buildable.models[0])) {
            ent.buildable.models[0].outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(ent.buildable.models[0], "shimmer_crafting_wm_buildable", "level_script");
        }
        var_58c4969f9f12ba44 = getent(var_1c59cace1457e117.target, "targetname");
        var_58c4969f9f12ba44 notsolid();
        var_58c4969f9f12ba44.origin = var_58c4969f9f12ba44.origin - (0, 0, 50);
        var_58c4969f9f12ba44.originalpos = var_58c4969f9f12ba44.origin;
        var_58c4969f9f12ba44.var_fd7d4b141d35432a = anglestoforward(var_1c59cace1457e117.angles);
        buildable.clip = var_58c4969f9f12ba44;
        var_cac0ba71c228c744 = getentarray(ent.target, "targetname");
        foreach (part in var_cac0ba71c228c744) {
            if (!isdefined(part.script_noteworthy)) {
                continue;
            } else if (part.script_noteworthy == "destroy_trigger") {
                ent.var_735c00db82bfcb5f = part;
            }
        }
        var_58a3507e55f38dfe = getscriptablearray(ent.target, "targetname");
        buildable.c4 = var_58a3507e55f38dfe[0];
        ent usetriggerrequirelookat(1);
        ent thread function_17763afd915cc73c();
        buildable thread function_a0f277273d13196a("zone_2");
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca1
// Size: 0x1d
function function_14557abb4173c907(player, buildable) {
    buildable thread function_b6a76446c385ef9e();
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cc5
// Size: 0xa5
function function_b6a76446c385ef9e() {
    level endon("game_ended");
    self endon("stop_building");
    self notify("start_push");
    self endon("start_push");
    var_58c4969f9f12ba44 = self.clip;
    var_58c4969f9f12ba44 solid();
    var_58c4969f9f12ba44 movez(50, 0.2);
    wait(0.2);
    goalpos = var_58c4969f9f12ba44.origin + var_58c4969f9f12ba44.var_fd7d4b141d35432a * 60;
    var_58c4969f9f12ba44 moveto(goalpos, 0.2);
    wait(0.2);
    var_58c4969f9f12ba44 notsolid();
    var_58c4969f9f12ba44.origin = var_58c4969f9f12ba44.originalpos;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d71
// Size: 0x50
function function_e6e4ec899d114c59(player, buildable) {
    buildable notify("stop_building");
    var_58c4969f9f12ba44 = buildable.clip;
    var_58c4969f9f12ba44 notsolid();
    var_58c4969f9f12ba44.origin = var_58c4969f9f12ba44.originalpos;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc8
// Size: 0x153
function function_18b4ff54f4110b21(player, buildable) {
    ent = buildable.var_6bcc6405c250ecb4;
    playfx(level._effect["sandbag_built"], buildable.models[0].origin);
    buildable thread function_5907a34f5fb0bf04("zone_2");
    buildable.clip notsolid();
    buildable.clip.origin = buildable.clip.originalpos;
    buildable.c4 setscriptablepartstate("body", "built");
    buildable.c4.outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(buildable.c4, "shimmer_crafting_wm_buildable", "level_script");
    var_7d1c20f0c6c0e55e = namespace_f4ed8842b49252fd::function_310f1a814bf9c37c(buildable, ent.var_735c00db82bfcb5f, "MP_JUP_LAUNCHFACILITY/REMOVETANKTRAP", 3, undefined, &function_44bc02179cd2ed83);
    setomnvar("ui_wm_escort_trap_" + ent.id, ent.progress);
    buildable thread namespace_f4ed8842b49252fd::function_62602b0ea1741bd2(buildable.models[0], "hogs_destroyed");
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f22
// Size: 0x1b2
function function_44bc02179cd2ed83(player) {
    self.buildable notify("trap_destroyed");
    ent = self.buildable.var_6bcc6405c250ecb4;
    setomnvar("ui_wm_escort_trap_" + ent.id, 0);
    var_8d088c859e5f8f2f = self.buildable.models[0];
    if (isdefined(var_8d088c859e5f8f2f)) {
        namespace_cbd3754a0c69cc63::outlinedisable(var_8d088c859e5f8f2f.outlineid, var_8d088c859e5f8f2f);
    }
    var_2642ca865799c9 = var_8d088c859e5f8f2f.origin;
    var_c617038fddbdb57 = var_8d088c859e5f8f2f.angles;
    var_374f9f93264cd757 = namespace_f4ed8842b49252fd::function_e20a97a059fba2ea(self.buildable.name, self.buildable.var_6bcc6405c250ecb4, self.buildable.zonename, 0, var_2642ca865799c9, var_c617038fddbdb57);
    ent.buildable = var_374f9f93264cd757;
    var_374f9f93264cd757.clip = self.buildable.clip;
    newmodel = var_374f9f93264cd757.models[0];
    if (isdefined(newmodel)) {
        newmodel.outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(newmodel, "shimmer_crafting_wm_buildable", "level_script");
    }
    ent.buildable.c4 = self.buildable.c4;
    ent usetriggerrequirelookat(1);
    ent thread function_17763afd915cc73c();
    var_374f9f93264cd757 thread function_a0f277273d13196a("zone_2");
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20db
// Size: 0xe4
function function_17763afd915cc73c() {
    self notify("stop_get_progress");
    self endon("stop_get_progress");
    level endon("game_ended");
    pathnodes = getvehiclenodearray("tank_trap_pos", "script_noteworthy");
    pathnode = sortbydistance(pathnodes, self.origin)[0];
    namespace_4b0406965e556711::gameflagwait("zone_2" + "_objective_start");
    var_8336f113929858a6 = distance2dsquared(self.origin, pathnode.origin);
    if (var_8336f113929858a6 > 3000) {
        /#
            assertmsg(var_8336f113929858a6 + "Warning:  Disable the trap at " + self.origin + " , add a vehicle node at the position of tank trap in Radiant, and add script_noteworthy [tank_trap_pos]!!");
        #/
        self.buildable.useobj.trigger makeunusable();
    }
    self.progress = pathnode.progress;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c6
// Size: 0x234
function function_a0f277273d13196a(zoneinfo) {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait(zoneinfo + "_objective_start");
    tank = level.var_e718773786ad42e8[0];
    while (!isdefined(self.var_6bcc6405c250ecb4.progress) || !isdefined(tank.progress) || !isdefined(tank.var_56df20c41f5b3159)) {
        waitframe();
    }
    var_31a72e6f2e39b666 = spawn("script_model", self.var_6bcc6405c250ecb4.origin);
    var_31a72e6f2e39b666.angles = self.var_6bcc6405c250ecb4.angles;
    var_31a72e6f2e39b666 makeusable();
    var_31a72e6f2e39b666 sethintdisplayrange(256);
    var_31a72e6f2e39b666 sethintdisplayfov(360);
    var_31a72e6f2e39b666 setuserange(256);
    var_31a72e6f2e39b666 setusefov(360);
    var_31a72e6f2e39b666 sethintonobstruction("show");
    var_31a72e6f2e39b666 setcursorhint("HINT_NOBUTTON");
    var_31a72e6f2e39b666 sethintstring("MP/UNABLE_TO_BUILD_TRAP");
    while (self.var_f7ea333b7272c92a == 0) {
        if (abs(self.var_6bcc6405c250ecb4.progress - tank.progress) > tank.var_56df20c41f5b3159 * 400) {
            self.useobj.trigger makeusable();
            foreach (player in level.players) {
                var_31a72e6f2e39b666 disableplayeruse(player);
            }
        } else {
            self.useobj.trigger makeunusable();
            foreach (player in level.players) {
                var_31a72e6f2e39b666 enableplayeruse(player);
            }
        }
        waitframe();
    }
    var_31a72e6f2e39b666 delete();
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2401
// Size: 0x1cc
function function_5907a34f5fb0bf04(zoneinfo) {
    level endon("game_ended");
    self endon("deleted");
    namespace_4b0406965e556711::gameflagwait(zoneinfo + "_objective_start");
    ref = self.models[0] getentitynumber();
    tank = level.var_e718773786ad42e8[0];
    while (!isdefined(self.var_6bcc6405c250ecb4.progress) || !isdefined(tank.progress) || !isdefined(tank.var_56df20c41f5b3159)) {
        waitframe();
    }
    while (1) {
        if (!istrue(tank.var_7150b8620d62148[ref]) && istrue(function_4671e4cafead83aa(tank.var_56df20c41f5b3159, self.var_6bcc6405c250ecb4.progress, tank.progress))) {
            tank.var_7150b8620d62148[ref] = 1;
            if (self.var_6bcc6405c250ecb4.progress > tank.progress) {
                tank.var_9776a7ea13c434a2[ref] = "forward";
            } else {
                tank.var_9776a7ea13c434a2[ref] = "backward";
            }
        }
        msg = waittill_notify_or_timeout_return("trap_destroyed", 0.2);
        if (msg == "trap_destroyed") {
            tank.var_7150b8620d62148[ref] = 0;
            break;
        } else if (istrue(tank.var_7150b8620d62148[ref]) && !istrue(function_4671e4cafead83aa(tank.var_56df20c41f5b3159, self.var_6bcc6405c250ecb4.progress, tank.progress))) {
            tank.var_7150b8620d62148[ref] = 0;
        }
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d4
// Size: 0x33
function function_4671e4cafead83aa(var_56df20c41f5b3159, var_47ded9cb9b7c0ab9, var_f26b89a1d530fa76) {
    return var_f26b89a1d530fa76 - var_47ded9cb9b7c0ab9 > var_56df20c41f5b3159 * 170 * -1 && var_f26b89a1d530fa76 - var_47ded9cb9b7c0ab9 < var_56df20c41f5b3159 * 210;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x260f
// Size: 0x185
function function_e5c4e335df2843c() {
    level.scr_animtree["EarthenWall"] = %animated_props;
    level.scr_anim["EarthenWall"]["building_1"] = animated_props%jup_fxanim_war_military_buildable_wall_repair_half;
    level.scr_animname["EarthenWall"]["building_1"] = "jup_fxanim_war_military_buildable_wall_repair_half";
    level.scr_anim["EarthenWall"]["building_2"] = animated_props%jup_fxanim_war_military_buildable_wall_repair_full;
    level.scr_animname["EarthenWall"]["building_2"] = "jup_fxanim_war_military_buildable_wall_repair_full";
    level.scr_anim["EarthenWall"]["idle_1"] = animated_props%jup_fxanim_war_military_buildable_wall_idle_half;
    level.scr_animname["EarthenWall"]["idle_1"] = "jup_fxanim_war_military_buildable_wall_idle_half";
    level.scr_anim["EarthenWall"]["idle_2"] = animated_props%jup_fxanim_war_military_buildable_wall_idle_full;
    level.scr_animname["EarthenWall"]["idle_2"] = "jup_fxanim_war_military_buildable_wall_idle_full";
    level.var_c88bedfa8ddcb42c["EarthenWall"] = [];
    level.var_c88bedfa8ddcb42c["EarthenWall"]["models"] = [0:"jup_military_buildable_wall_05_fxanim", 1:"jup_military_buildable_wall_06_fxanim"];
    level.var_c88bedfa8ddcb42c["EarthenWall"]["animations"] = [0:"EarthenWall", 1:[0:"building_1", 1:"building_2"], 2:[0:"idle_1", 1:"idle_2"]];
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x279b
// Size: 0xea
function function_d010329c992047c7() {
    buildinfo = spawnstruct();
    buildinfo.phases = [0:0, 1:0.5, 2:1];
    buildinfo.models = level.var_c88bedfa8ddcb42c["EarthenWall"]["models"];
    buildinfo.animations = level.var_c88bedfa8ddcb42c["EarthenWall"]["animations"];
    buildinfo.var_29f5481763dbf9df = 3;
    buildinfo.gestureweapon = "nothing_here";
    buildinfo.hintstring = "MP_JUP_WM/BUILD";
    buildinfo.var_32a2681a13f18cb1 = &function_4b51ad34a0eb9787;
    buildinfo.var_b3b899b146453c0c = &function_927b512a6d2c5d6d;
    buildinfo.var_562da06e56403b2f = &function_2e4f60aab0b9caa1;
    level.var_2d2b6d9851424059["bdb_earthen_wall"] = buildinfo;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x288c
// Size: 0x43d
function function_714ca74c07bcc71c() {
    ents = getentarray("wm_build_wall", "targetname");
    foreach (ent in ents) {
        var_def6818429c77a68 = getstruct(ent.target, "targetname");
        buildable = namespace_f4ed8842b49252fd::function_e20a97a059fba2ea("bdb_earthen_wall", ent, ent.script_noteworthy, 0, var_def6818429c77a68.origin, var_def6818429c77a68.angles);
        var_76cb4cf7eaa25d5e = getent(var_def6818429c77a68.target, "targetname");
        buildable.var_76cb4cf7eaa25d5e = var_76cb4cf7eaa25d5e;
        var_ce9a172174e95c6 = getent(var_76cb4cf7eaa25d5e.target, "targetname");
        buildable.var_ce9a172174e95c6 = var_ce9a172174e95c6;
        buildable.var_76cb4cf7eaa25d5e.moverdoesnotkill = 1;
        buildable.var_ce9a172174e95c6.moverdoesnotkill = 1;
        buildable.var_76cb4cf7eaa25d5e connectpaths();
        buildable.var_ce9a172174e95c6 connectpaths();
        buildable.var_76cb4cf7eaa25d5e notsolid();
        buildable.var_ce9a172174e95c6 notsolid();
        buildable.var_ce9a172174e95c6.origin = buildable.var_ce9a172174e95c6.origin - (0, 0, 400);
        buildable.var_76cb4cf7eaa25d5e.origin = buildable.var_76cb4cf7eaa25d5e.origin - (0, 0, 400);
        buildable.var_aad507fcd3fa7aac = buildable.var_ce9a172174e95c6.origin;
        buildable.var_1e6b32b3a669c4a4 = buildable.var_76cb4cf7eaa25d5e.origin;
        var_8c093373c4b24c9b = getstructarray(var_def6818429c77a68.target, "targetname");
        foreach (node in var_8c093373c4b24c9b) {
            if (node.script_noteworthy == "full_warp_over") {
                buildable.var_25ce1472104e7323 = node;
            } else {
                buildable.var_9add75b4f63984db = node;
            }
        }
        foreach (model in buildable.models) {
            model.outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(model, "shimmer_crafting_wm_buildable", "level_script");
        }
        var_58a3507e55f38dfe = getscriptablearray(ent.target, "targetname");
        foreach (c4 in var_58a3507e55f38dfe) {
            c4 setscriptablepartstate("body", "init");
            var_abc3ccef994e1c54 = c4.origin - buildable.models[0].origin;
            var_a12e637c4db09413 = vectordot(var_abc3ccef994e1c54, anglestoforward(buildable.models[0].angles));
            if (var_a12e637c4db09413 > 0) {
                buildable.var_93cc0b181dbbe72b = c4;
            } else {
                buildable.var_d325995197f41bd5 = c4;
            }
        }
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd0
// Size: 0x28
function function_4b51ad34a0eb9787(player, buildable) {
    buildable.models[0] function_adc7327a592cc4a1();
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cff
// Size: 0x12d
function function_927b512a6d2c5d6d(player, buildable, var_f7ea333b7272c92a) {
    if (var_f7ea333b7272c92a == 1) {
        buildable.var_ce9a172174e95c6 solid();
        buildable.var_ce9a172174e95c6 movez(400, 0.2);
        buildable.var_ce9a172174e95c6 delaycall(1, &disconnectpaths);
        endnode = getstruct(buildable.var_9add75b4f63984db.target, "targetname");
        createnavlink("half_wall_warp_over", buildable.var_9add75b4f63984db.origin, endnode.origin, "traverse_warp_over");
        buildable thread function_aee75e15f0b3ace2();
        buildable.var_ce9a172174e95c6 delaythread(0.2, &function_adc7327a592cc4a1);
        if (isdefined(buildable.zonename) && buildable.zonename == level.zone.name) {
            buildable.useobj namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_Buildable_Built");
        }
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e33
// Size: 0xae
function function_aee75e15f0b3ace2() {
    level endon("game_ended");
    self endon("stop_half_watch");
    self.models[0] childthread namespace_f4ed8842b49252fd::function_df66656601b04226();
    self.models[0] waittillmatch("scriptableNotification", "half_wall_destroyed");
    self.var_ce9a172174e95c6.origin = self.var_aad507fcd3fa7aac;
    self.var_ce9a172174e95c6 connectpaths();
    self.models[0] notsolid();
    self.models[0] connectpaths();
    function_3b27c12823e5dc9();
    self.var_f7ea333b7272c92a = 0;
    self.models[0] notify("destroyed");
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee8
// Size: 0x2ca
function function_2e4f60aab0b9caa1(player, buildable) {
    buildable notify("stop_half_watch");
    buildable.var_76cb4cf7eaa25d5e solid();
    buildable.var_76cb4cf7eaa25d5e movez(400, 0.2);
    buildable.var_76cb4cf7eaa25d5e delaycall(1, &disconnectpaths);
    buildable.var_76cb4cf7eaa25d5e delaythread(0.2, &function_adc7327a592cc4a1);
    if (level.mapname == "mp_jup_skydiving") {
        buildable thread function_2e82354313bdf801();
    }
    buildable.var_ce9a172174e95c6 delaycall(0.2, &moveto, buildable.var_aad507fcd3fa7aac, 0.1);
    buildable.var_ce9a172174e95c6 delaycall(0.2, &notsolid);
    destroynavlink("half_wall_warp_over");
    if (level.var_2d2b6d9851424059["bdb_earthen_wall"].canmantle) {
        endnode = getstruct(buildable.var_25ce1472104e7323.target, "targetname");
        createnavlink("full_wall_warp_over", buildable.var_25ce1472104e7323.origin, endnode.origin, "traverse_warp_over");
    }
    var_96d232e2a285463c = getentarrayinradius("huge_deploy_cover_close", "targetname", buildable.var_6bcc6405c250ecb4.origin, 100);
    var_96d232e2a285463c = var_96d232e2a285463c[0];
    buildable.var_93cc0b181dbbe72b setscriptablepartstate("body", "built");
    buildable.var_93cc0b181dbbe72b.outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(buildable.var_93cc0b181dbbe72b, "shimmer_crafting_wm_buildable", "level_script");
    buildable.var_d325995197f41bd5 setscriptablepartstate("body", "built");
    buildable.var_d325995197f41bd5.outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(buildable.var_d325995197f41bd5, "shimmer_crafting_wm_buildable", "level_script");
    foreach (model in buildable.models) {
        namespace_cbd3754a0c69cc63::outlinedisable(model.outlineid, model);
    }
    var_7d1c20f0c6c0e55e = namespace_f4ed8842b49252fd::function_310f1a814bf9c37c(buildable, var_96d232e2a285463c, "MP_JUP_LAUNCHFACILITY/REMOVEWALL", 3, undefined, &function_1e4edfddaf68a61f);
    buildable thread namespace_f4ed8842b49252fd::function_62602b0ea1741bd2(buildable.models[1], "full_wall_destroyed");
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31b9
// Size: 0xe2
function function_2e82354313bdf801() {
    level endon("game_ended");
    wait(0.2);
    var_9bd78a968ebb5620 = self.var_76cb4cf7eaa25d5e.origin;
    var_fd7d4b141d35432a = anglestoforward(self.var_76cb4cf7eaa25d5e.angles);
    var_be98bcbb32524e17 = self.var_76cb4cf7eaa25d5e.origin + var_fd7d4b141d35432a * 30;
    var_76bdd022f5057445 = self.var_76cb4cf7eaa25d5e.origin - var_fd7d4b141d35432a * 30;
    self.var_76cb4cf7eaa25d5e moveto(var_be98bcbb32524e17, 0.1);
    wait(0.1);
    self.var_76cb4cf7eaa25d5e moveto(var_76bdd022f5057445, 0.1);
    wait(0.1);
    self.var_76cb4cf7eaa25d5e.origin = var_9bd78a968ebb5620;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32a2
// Size: 0x2cd
function function_1e4edfddaf68a61f(player) {
    var_def6818429c77a68 = getstruct(self.buildable.var_6bcc6405c250ecb4.target, "targetname");
    buildable = namespace_f4ed8842b49252fd::function_e20a97a059fba2ea(self.buildable.name, self.buildable.var_6bcc6405c250ecb4, self.buildable.zonename, 0, var_def6818429c77a68.origin, var_def6818429c77a68.angles);
    var_76cb4cf7eaa25d5e = getent(var_def6818429c77a68.target, "targetname");
    buildable.var_76cb4cf7eaa25d5e = var_76cb4cf7eaa25d5e;
    var_ce9a172174e95c6 = getent(var_76cb4cf7eaa25d5e.target, "targetname");
    buildable.var_ce9a172174e95c6 = var_ce9a172174e95c6;
    buildable.var_76cb4cf7eaa25d5e connectpaths();
    buildable.var_ce9a172174e95c6 connectpaths();
    buildable.var_76cb4cf7eaa25d5e notsolid();
    buildable.var_ce9a172174e95c6 notsolid();
    buildable.var_aad507fcd3fa7aac = self.buildable.var_aad507fcd3fa7aac;
    buildable.var_1e6b32b3a669c4a4 = self.buildable.var_1e6b32b3a669c4a4;
    buildable.var_ce9a172174e95c6.origin = buildable.var_aad507fcd3fa7aac;
    buildable.var_76cb4cf7eaa25d5e.origin = buildable.var_1e6b32b3a669c4a4;
    if (level.var_2d2b6d9851424059["bdb_earthen_wall"].canmantle) {
        destroynavlink("full_wall_warp_over");
    }
    buildable.var_9add75b4f63984db = self.buildable.var_9add75b4f63984db;
    buildable.var_25ce1472104e7323 = self.buildable.var_25ce1472104e7323;
    buildable.var_d325995197f41bd5 = self.buildable.var_d325995197f41bd5;
    buildable.var_93cc0b181dbbe72b = self.buildable.var_93cc0b181dbbe72b;
    foreach (model in buildable.models) {
        model.outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(model, "shimmer_crafting_wm_buildable", "level_script");
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3576
// Size: 0x87
function function_b4ebcfb94d5a02a6() {
    buildinfo = spawnstruct();
    buildinfo.var_29f5481763dbf9df = 4;
    buildinfo.hintstring = "MP_JUP_WM/REPAIR";
    buildinfo.gestureweapon = "jup_war_ges_wrench_turret";
    buildinfo.var_32a2681a13f18cb1 = &function_4009bbde647f8862;
    buildinfo.var_fc147a62066d05bd = &function_8735b98397aaf042;
    buildinfo.var_562da06e56403b2f = &function_723905cbc30e0b0a;
    level.var_2d2b6d9851424059["bdb_turret"] = buildinfo;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3604
// Size: 0x1c0
function function_43a60391e95332e() {
    ents = getentarray("tri_build_turret", "targetname");
    foreach (ent in ents) {
        var_b5deff62ba0378ca = getstruct(ent.target, "targetname");
        ent.buildable = namespace_f4ed8842b49252fd::function_e20a97a059fba2ea("bdb_turret", ent, ent.script_noteworthy, 0, var_b5deff62ba0378ca.origin, var_b5deff62ba0378ca.angles);
        var_ade9e61eec747ec0 = function_68c608676c867d5e(var_b5deff62ba0378ca.origin, var_b5deff62ba0378ca.angles);
        ent.buildable.turret = var_ade9e61eec747ec0;
        ent.buildable thread function_c01e8dd2223036f6();
        ent.buildable.turret.maxhealth = 500;
        ent.buildable.turret setdefaultdroppitch(15);
        ent.buildable.turret thread function_eefc4642e9cfa7d2();
        ent.buildable.turret.scriptable = spawnscriptable("jup_launchfacility_buildable_turret", var_b5deff62ba0378ca.origin);
        var_ade9e61eec747ec0.outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(var_ade9e61eec747ec0, "shimmer_crafting_wm_buildable", "level_script");
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37cb
// Size: 0x50
function function_4009bbde647f8862(player, buildable) {
    namespace_cbd3754a0c69cc63::outlinedisable(buildable.turret.outlineid, buildable.turret);
    buildable.turret.outlineid = undefined;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3822
// Size: 0x45
function function_8735b98397aaf042(player, buildable) {
    buildable.turret.outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(buildable.turret, "shimmer_crafting_wm_buildable", "level_script");
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x386e
// Size: 0x185
function function_723905cbc30e0b0a(player, buildable) {
    buildable.turret.outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(buildable.turret, "shimmer_crafting_wm_buildable", "level_script");
    buildable.turret notify("turret_fixed");
    buildable.turret setdefaultdroppitch(0);
    buildable.turret setscriptablepartstate("shutdown", "off");
    buildable.turret.scriptable setscriptablepartstate("sfx", "completed");
    playfx(getfx("turret_fixed"), buildable.turret.origin);
    var_5e8eb3c31f9c265c = "j_trigger";
    var_963953c3478bf4fe = buildable.turret gettagorigin(var_5e8eb3c31f9c265c);
    buildable.turret.useobj = namespace_19b4203b51d56488::createhintobject(var_963953c3478bf4fe, "HINT_BUTTON", "hud_icon_turret", "MP/USE_TURRET", undefined, "duration_none", undefined, undefined, undefined, 50);
    buildable.turret.useobj linkto(buildable.turret, var_5e8eb3c31f9c265c);
    buildable.turret thread function_5da085c617056ddf();
    buildable.turret.maxhealth = 1650;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39fa
// Size: 0x54
function function_eefc4642e9cfa7d2() {
    level endon("game_ended");
    self endon("turret_fixed");
    self endon("kill_turret");
    while (1) {
        self setscriptablepartstate("shutdown", "on");
        self playsound("jup_machine_gun_smoke");
        wait(2);
        self setscriptablepartstate("shutdown", "off");
        wait(1);
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a55
// Size: 0x3b
function function_c01e8dd2223036f6() {
    level endon("game_ended");
    self.turret waittill("kill_turret");
    self.useobj.trigger makeunusable();
    namespace_f4ed8842b49252fd::function_717a6e0a56c606b(self);
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a97
// Size: 0x1c2
function function_68c608676c867d5e(origin, angles) {
    turret = spawnturret("misc_turret", origin, "manual_turret_jup_mp", 0);
    turret.ammocount = 120;
    turret.health = 9999;
    turret.maxhealth = 1650;
    turret.team = "neutral";
    turret.angles = angles;
    turret setmodel("weapon_wm_mg_mobile_turret");
    turret makeunusable();
    turret setmode("sentry_offline");
    turret setsentryowner(undefined);
    turret setdefaultdroppitch(0);
    turret setturretmodechangewait(1);
    turret setnodeploy(1);
    turret thread function_488548e8c88863f6();
    turret thread namespace_3e725f3cc58bddd3::monitordamage(turret.maxhealth, "hitequip", &function_3098fc5fbbf03d1a, &function_97dac16042181936, 0);
    turret namespace_5a51aa78ea0b1b9f::allow_emp(0);
    turret.colmodel = spawn("script_model", turret.origin);
    turret.colmodel setmodel("weapon_vm_mg_sentry_turret_invis_base");
    turret.colmodel dontinterpolate();
    turret.colmodel.moverdoesnotkill = 1;
    turret.colmodel.turretparent = turret;
    turret.colmodel.angles = turret.angles;
    turret.colmodel.origin = turret.origin;
    turret.colmodel linkto(turret, "tag_aim_pivot");
    return turret;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c61
// Size: 0x1ad
function function_5da085c617056ddf() {
    level endon("game_ended");
    self endon("kill_turret");
    while (1) {
        player = self.useobj waittill("trigger");
        if (!isalive(player) || istrue(self.inuse)) {
            continue;
        }
        self.inuse = 1;
        namespace_cbd3754a0c69cc63::outlinedisable(self.outlineid, self);
        player namespace_d325722f2754c2c4::saveweaponstates();
        player namespace_df5cfdbe6e2d3812::_giveweapon("manual_turret_jup_mp", undefined, undefined, 1);
        result = player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch("manual_turret_jup_mp", 1, 0, 1);
        if (distance2d(self.useobj.origin, player.origin) > 50) {
            result = 0;
        }
        if (!istrue(result)) {
            self.inuse = undefined;
            if (isdefined(player)) {
                if (isalive(player)) {
                    lastweaponobj = player namespace_d325722f2754c2c4::restoreweaponstates(player.lastdroppableweaponobj);
                    player switchtoweaponimmediate(lastweaponobj);
                }
                player _takeweapon("manual_turret_jup_mp");
            }
            continue;
        }
        self setmode("manual");
        player controlturreton(self);
        self.owner = player;
        self.team = player.team;
        self.colmodel.owner = self.owner;
        self.colmodel.team = self.team;
        function_b051576de9e5c175(player);
        thread function_7aa3cf0550137f02(player);
        thread function_a37b6ca7eb2d6e8c(player);
        thread function_1fb0cef396256648(player);
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e15
// Size: 0x4e
function function_b051576de9e5c175(player) {
    player namespace_9abe40d2af041eb2::_setvisibiilityomnvarforkillstreak("manual_turret", "on");
    player setclientomnvar("ui_killstreak_countdown", 0);
    player setclientomnvar("ui_mobile_turret_controls", 1);
    player setclientomnvar("ui_killstreak_weapon_1_ammo", self.ammocount);
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e6a
// Size: 0x2b
function function_68e5a6da697b6ff(player) {
    player namespace_9abe40d2af041eb2::_setvisibiilityomnvarforkillstreak("manual_turret", "off");
    player setclientomnvar("ui_mobile_turret_controls", 0);
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e9c
// Size: 0xee
function function_7aa3cf0550137f02(player) {
    level endon("game_ended");
    self endon("kill_turret");
    player endon("end_turret_use");
    player endon("disconnect");
    player endon("death");
    self.hideammoindex = 1;
    var_83fb464c27e79a0e = weaponfiretime("manual_turret_jup_mp");
    /#
        assertex(isdefined(var_83fb464c27e79a0e) && var_83fb464c27e79a0e > 0, "turretFireDelay is either not defined or less than 0, make sure your turret weapon has a valid fire time");
    #/
    while (player isusingturret()) {
        while (player attackbuttonpressed()) {
            self.ammocount--;
            player setclientomnvar("ui_killstreak_weapon_1_ammo", self.ammocount);
            if (self.ammocount <= 12) {
                self setscriptablepartstate("hide_ammo_" + self.hideammoindex, "on", 0);
                self.hideammoindex++;
            }
            if (self.ammocount <= 0) {
                self notify("kill_turret");
                break;
            }
            wait(var_83fb464c27e79a0e);
        }
        waitframe();
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f91
// Size: 0xf6
function function_88a41bba2ebcecdc(player) {
    self.inuse = undefined;
    self.owner = undefined;
    self.team = "neutral";
    self.colmodel.owner = self.owner;
    self.colmodel.team = self.team;
    self setmode("sentry_offline");
    self.outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(self, "shimmer_crafting_wm_buildable", "level_script");
    if (isdefined(player)) {
        player controlturretoff(self);
        function_68e5a6da697b6ff(player);
        if (isalive(player)) {
            lastweaponobj = player namespace_d325722f2754c2c4::restoreweaponstates(player.lastdroppableweaponobj);
            player switchtoweaponimmediate(lastweaponobj);
            player setplayerangles(self.lastuserangles);
        }
        player _takeweapon("manual_turret_jup_mp");
        player notify("end_turret_use");
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x408e
// Size: 0x6b
function function_a37b6ca7eb2d6e8c(player) {
    level endon("game_ended");
    self endon("kill_turret");
    player endon("disconnect");
    player endon("end_turret_use");
    while (player usebuttonpressed()) {
        waitframe();
    }
    while (1) {
        if (player usebuttonpressed() || player isinexecutionvictim()) {
            function_88a41bba2ebcecdc(player);
            break;
        }
        self.lastuserangles = player getplayerangles();
        waitframe();
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4100
// Size: 0x40
function function_1fb0cef396256648(player) {
    level endon("game_ended");
    self endon("kill_turret");
    player endon("end_turret_use");
    player waittill_any_3("death_or_disconnect", "last_stand_start", "death");
    function_88a41bba2ebcecdc(player);
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4147
// Size: 0x23
function function_97dac16042181936(data) {
    modifieddamage = data.damage;
    return modifieddamage;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4172
// Size: 0xbf
function function_3098fc5fbbf03d1a(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    explosivedamage = 0;
    if (type == "MOD_EXPLOSIVE" || type == "MOD_PROJECTILE" || type == "MOD_PROJECTILE_SPLASH" || type == "MOD_GRENADE_SPLASH") {
        explosivedamage = 1;
    }
    self notify("kill_turret", explosivedamage);
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4238
// Size: 0xfd
function function_488548e8c88863f6() {
    level endon("game_ended");
    killer = var_b2797481a55c620 = self waittill("kill_turret");
    function_88a41bba2ebcecdc(self.owner);
    self.useobj delete();
    if (!istrue(var_b2797481a55c620)) {
        self playsound("jup_machine_gun_smoke");
        self setscriptablepartstate("shutdown", "on");
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(2);
        self setscriptablepartstate("explode", "regular");
    } else {
        self setscriptablepartstate("explode", "violent");
    }
    self playsound("jup_machine_gun_explode");
    if (isdefined(killer)) {
        if (isdefined(killer.owner) && isplayer(killer.owner)) {
            killer = killer.owner;
        }
        killer function_2591bed1172e3c08(0);
    }
    self.colmodel delete();
    wait(0.2);
    self delete();
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x433c
// Size: 0x13e
function function_61359962e417f21() {
    level.scr_animtree["Baffle"] = %animated_props;
    level.scr_anim["Baffle"]["idle"] = animated_props%jup_fxanim_war_military_buildable_security_bollards_idle;
    level.scr_animname["Baffle"]["idle"] = "jup_fxanim_war_military_buildable_security_bollards_idle";
    level.scr_anim["Baffle"]["building"] = animated_props%jup_fxanim_war_military_buildable_security_bollards_repair;
    level.scr_animname["Baffle"]["building"] = "jup_fxanim_war_military_buildable_security_bollards_repair";
    level.scr_anim["Baffle"]["destroy"] = animated_props%jup_fxanim_war_military_buildable_security_bollards_destroy;
    level.scr_animname["Baffle"]["destroy"] = "jup_fxanim_war_military_buildable_security_bollards_destroy";
    level.var_c88bedfa8ddcb42c["Baffle"] = [];
    level.var_c88bedfa8ddcb42c["Baffle"]["models"] = [0:"jup_military_security_bollards_fxanim"];
    level.var_c88bedfa8ddcb42c["Baffle"]["animations"] = [0:"Baffle", 1:[0:"building"], 2:[0:"idle"], 3:[0:"destroy"]];
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4481
// Size: 0xc9
function function_a622792cc81eaea2() {
    buildinfo = spawnstruct();
    buildinfo.models = level.var_c88bedfa8ddcb42c["Baffle"]["models"];
    buildinfo.animations = level.var_c88bedfa8ddcb42c["Baffle"]["animations"];
    buildinfo.var_29f5481763dbf9df = 4;
    buildinfo.hintstring = "MP_JUP_WM/BUILD";
    buildinfo.gestureweapon = "jup_war_ges_wrench_bollard";
    buildinfo.var_32a2681a13f18cb1 = &namespace_555f6ee22fb8fd82::function_2cd909ef45d6629a;
    buildinfo.var_fc147a62066d05bd = &namespace_555f6ee22fb8fd82::function_736d94f76d0d49a;
    buildinfo.var_562da06e56403b2f = &namespace_555f6ee22fb8fd82::function_8da7f2ee4b0a5572;
    level.var_2d2b6d9851424059["bdb_Baffle"] = buildinfo;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4551
// Size: 0x41e
function function_51311df691f23540() {
    ents = getentarray("tri_build_tank_trap", "targetname");
    foreach (index, ent in ents) {
        var_1c59cace1457e117 = getstruct(ent.target, "targetname");
        buildable = namespace_f4ed8842b49252fd::function_e20a97a059fba2ea("bdb_Baffle", ent, ent.script_noteworthy, 0, var_1c59cace1457e117.origin, var_1c59cace1457e117.angles);
        ent.buildable = buildable;
        ent.id = index;
        if (isdefined(ent.buildable.models[0])) {
            ent.buildable.models[0].outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(ent.buildable.models[0], "shimmer_crafting_wm_buildable", "level_script");
        }
        var_58c4969f9f12ba44 = getent(var_1c59cace1457e117.target, "targetname");
        var_58c4969f9f12ba44.var_7a64011f0deec917 = var_58c4969f9f12ba44.origin;
        var_58c4969f9f12ba44 connectpaths();
        var_58c4969f9f12ba44 notsolid();
        var_58c4969f9f12ba44.origin = var_58c4969f9f12ba44.origin - (0, 0, 50);
        var_58c4969f9f12ba44.originalpos = var_58c4969f9f12ba44.origin;
        buildable.clip = var_58c4969f9f12ba44;
        var_cac0ba71c228c744 = getentarray(ent.target, "targetname");
        foreach (part in var_cac0ba71c228c744) {
            if (!isdefined(part.script_noteworthy)) {
                continue;
            } else if (part.script_noteworthy == "destroy_trigger") {
                ent.var_735c00db82bfcb5f = part;
            }
        }
        var_58a3507e55f38dfe = getscriptablearray(ent.target, "targetname");
        foreach (c4 in var_58a3507e55f38dfe) {
            c4 setscriptablepartstate("body", "init");
            var_abc3ccef994e1c54 = c4.origin - buildable.models[0].origin;
            var_a12e637c4db09413 = vectordot(var_abc3ccef994e1c54, anglestoforward(buildable.models[0].angles));
            if (var_a12e637c4db09413 > 0) {
                buildable.var_93cc0b181dbbe72b = c4;
            } else {
                buildable.var_d325995197f41bd5 = c4;
            }
        }
        var_8c093373c4b24c9b = getstructarray(var_58c4969f9f12ba44.target, "targetname");
        foreach (node in var_8c093373c4b24c9b) {
            if (node.script_noteworthy == "forward") {
                buildable.var_27d08fc3c69c0059 = node;
            } else {
                buildable.var_e336e2182bf34119 = node;
            }
        }
        ent usetriggerrequirelookat(1);
        ent thread function_380b6579f5fa4cd();
        buildable thread function_819c53825b132b02("zone_2");
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4976
// Size: 0xb1
function function_d1a514fda655e409() {
    ents = getentarray("tri_build_tank_trap", "targetname");
    foreach (ent in ents) {
        var_1c59cace1457e117 = getstruct(ent.target, "targetname");
        var_58c4969f9f12ba44 = getent(var_1c59cace1457e117.target, "targetname");
        var_58c4969f9f12ba44 notsolid();
        var_58c4969f9f12ba44 connectpaths();
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a2e
// Size: 0x32
function function_2cd909ef45d6629a(player, buildable) {
    buildable thread function_3f4db4dc27eadcb0(player);
    buildable.models[0] function_adc7327a592cc4a1();
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a67
// Size: 0x19b
function function_3f4db4dc27eadcb0(player) {
    level endon("game_ended");
    self endon("stop_building");
    self notify("start_push");
    self endon("start_push");
    var_58c4969f9f12ba44 = self.clip;
    var_b7e0e91fb38920df = var_58c4969f9f12ba44.originalpos + (0, 0, 50);
    var_58c4969f9f12ba44 solid();
    var_58c4969f9f12ba44 movez(40, 0.2);
    var_abc3ccef994e1c54 = player.origin - self.models[0].origin;
    var_5f6cefedf599151 = vectordot(var_abc3ccef994e1c54, anglestoforward(self.models[0].angles));
    if (var_5f6cefedf599151 > 0) {
        var_31d52e8d08db777a = self.models[0].origin + anglestoforward(self.models[0].angles) * 10;
    } else {
        var_31d52e8d08db777a = self.models[0].origin - anglestoforward(self.models[0].angles) * 10;
    }
    var_58c4969f9f12ba44 function_ad9433aab9fcdf04(0.2, "stop_building", &moveto, var_31d52e8d08db777a, 0.2);
    var_58c4969f9f12ba44 function_ad9433aab9fcdf04(0.4, "stop_building", &movez, 10, 0.1);
    var_58c4969f9f12ba44 function_ad9433aab9fcdf04(0.5, "stop_building", &moveto, var_b7e0e91fb38920df, 0.2);
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c09
// Size: 0x58
function function_736d94f76d0d49a(player, buildable) {
    buildable notify("stop_building");
    var_58c4969f9f12ba44 = buildable.clip;
    var_58c4969f9f12ba44 notify("stop_building");
    var_58c4969f9f12ba44 notsolid();
    var_58c4969f9f12ba44.origin = var_58c4969f9f12ba44.originalpos;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c68
// Size: 0x23c
function function_8da7f2ee4b0a5572(player, buildable) {
    ent = buildable.var_6bcc6405c250ecb4;
    playfx(level._effect["sandbag_built"], buildable.models[0].origin);
    buildable thread function_9017bcad2eca0813("zone_2");
    buildable.clip disconnectpaths();
    buildable.clip function_adc7327a592cc4a1();
    buildable.var_93cc0b181dbbe72b setscriptablepartstate("body", "built");
    buildable.var_93cc0b181dbbe72b.outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(buildable.var_93cc0b181dbbe72b, "shimmer_crafting_wm_buildable", "level_script");
    buildable.var_d325995197f41bd5 setscriptablepartstate("body", "built");
    buildable.var_d325995197f41bd5.outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(buildable.var_d325995197f41bd5, "shimmer_crafting_wm_buildable", "level_script");
    var_f98327f6f11a1fab = getstruct(buildable.var_27d08fc3c69c0059.target, "targetname");
    var_5f6aee81c4699f6b = getstruct(buildable.var_e336e2182bf34119.target, "targetname");
    createnavlink("baffle_forward_warp_over", buildable.var_27d08fc3c69c0059.origin, var_f98327f6f11a1fab.origin, "traverse_warp_over");
    createnavlink("baffle_back_warp_over", buildable.var_e336e2182bf34119.origin, var_5f6aee81c4699f6b.origin, "traverse_warp_over");
    var_7d1c20f0c6c0e55e = namespace_f4ed8842b49252fd::function_310f1a814bf9c37c(buildable, ent.var_735c00db82bfcb5f, "MP_JUP_LAUNCHFACILITY/REMOVETANKTRAP", 3, undefined, &function_acb62a89095ed874);
    setomnvar("ui_wm_escort_trap_" + ent.id, ent.progress);
    buildable thread namespace_f4ed8842b49252fd::function_62602b0ea1741bd2(buildable.models[0], "hogs_destroyed");
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eab
// Size: 0x29b
function function_acb62a89095ed874(player) {
    self.buildable notify("trap_destroyed");
    ent = self.buildable.var_6bcc6405c250ecb4;
    setomnvar("ui_wm_escort_trap_" + ent.id, 0);
    var_8d088c859e5f8f2f = self.buildable.models[0];
    if (isdefined(var_8d088c859e5f8f2f)) {
        namespace_cbd3754a0c69cc63::outlinedisable(var_8d088c859e5f8f2f.outlineid, var_8d088c859e5f8f2f);
    }
    var_2642ca865799c9 = var_8d088c859e5f8f2f.origin;
    var_c617038fddbdb57 = var_8d088c859e5f8f2f.angles;
    var_374f9f93264cd757 = namespace_f4ed8842b49252fd::function_e20a97a059fba2ea(self.buildable.name, self.buildable.var_6bcc6405c250ecb4, self.buildable.zonename, 0, var_2642ca865799c9, var_c617038fddbdb57);
    ent.buildable = var_374f9f93264cd757;
    var_374f9f93264cd757.clip = self.buildable.clip;
    newmodel = var_374f9f93264cd757.models[0];
    if (isdefined(newmodel)) {
        newmodel.outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(newmodel, "shimmer_crafting_wm_buildable", "level_script");
    }
    ent.buildable.var_d325995197f41bd5 = self.buildable.var_d325995197f41bd5;
    ent.buildable.var_93cc0b181dbbe72b = self.buildable.var_93cc0b181dbbe72b;
    destroynavlink("baffle_forward_warp_over");
    destroynavlink("baffle_back_warp_over");
    ent.buildable.var_27d08fc3c69c0059 = self.buildable.var_27d08fc3c69c0059;
    ent.buildable.var_e336e2182bf34119 = self.buildable.var_e336e2182bf34119;
    ent.buildable.clip connectpaths();
    ent.buildable.clip notsolid();
    ent.buildable.clip movez(-50, 0.2);
    ent usetriggerrequirelookat(1);
    ent thread function_380b6579f5fa4cd();
    var_374f9f93264cd757 thread function_819c53825b132b02("zone_2");
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x514d
// Size: 0xe4
function function_380b6579f5fa4cd() {
    self notify("stop_get_progress");
    self endon("stop_get_progress");
    level endon("game_ended");
    pathnodes = getvehiclenodearray("tank_trap_pos", "script_noteworthy");
    pathnode = sortbydistance(pathnodes, self.origin)[0];
    namespace_4b0406965e556711::gameflagwait("zone_2" + "_objective_start");
    var_8336f113929858a6 = distance2dsquared(self.origin, pathnode.origin);
    if (var_8336f113929858a6 > 3000) {
        /#
            assertmsg(var_8336f113929858a6 + "Warning:  Disable the trap at " + self.origin + " , add a vehicle node at the position of tank trap in Radiant, and add script_noteworthy [tank_trap_pos]!!");
        #/
        self.buildable.useobj.trigger makeunusable();
    }
    self.progress = pathnode.progress;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5238
// Size: 0x238
function function_819c53825b132b02(zoneinfo) {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait(zoneinfo + "_objective_start");
    tank = level.var_e718773786ad42e8[0];
    while (!isdefined(self.var_6bcc6405c250ecb4.progress) || !isdefined(tank.progress) || !isdefined(tank.var_56df20c41f5b3159)) {
        waitframe();
    }
    var_31a72e6f2e39b666 = spawn("script_model", self.var_6bcc6405c250ecb4.origin);
    var_31a72e6f2e39b666.angles = self.var_6bcc6405c250ecb4.angles;
    var_31a72e6f2e39b666 makeusable();
    var_31a72e6f2e39b666 sethintdisplayrange(128);
    var_31a72e6f2e39b666 sethintdisplayfov(360);
    var_31a72e6f2e39b666 setuserange(128);
    var_31a72e6f2e39b666 setusefov(360);
    var_31a72e6f2e39b666 sethintonobstruction("show");
    var_31a72e6f2e39b666 setcursorhint("HINT_NOBUTTON");
    var_31a72e6f2e39b666 sethintstring("MP_JUP_WM/UNABLE_TO_BUILD_BAFFLE");
    while (self.var_f7ea333b7272c92a == 0 && isdefined(tank)) {
        if (abs(self.var_6bcc6405c250ecb4.progress - tank.progress) > tank.var_56df20c41f5b3159 * 200) {
            self.useobj.trigger makeusable();
            foreach (player in level.players) {
                var_31a72e6f2e39b666 disableplayeruse(player);
            }
        } else {
            self.useobj.trigger makeunusable();
            foreach (player in level.players) {
                var_31a72e6f2e39b666 enableplayeruse(player);
            }
        }
        waitframe();
    }
    var_31a72e6f2e39b666 delete();
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5477
// Size: 0x1d0
function function_9017bcad2eca0813(zoneinfo) {
    level endon("game_ended");
    self endon("deleted");
    namespace_4b0406965e556711::gameflagwait(zoneinfo + "_objective_start");
    ref = self.models[0] getentitynumber();
    tank = level.var_e718773786ad42e8[0];
    while (!isdefined(self.var_6bcc6405c250ecb4.progress) || !isdefined(tank.progress) || !isdefined(tank.var_56df20c41f5b3159)) {
        waitframe();
    }
    while (1) {
        if (!istrue(tank.var_7150b8620d62148[ref]) && istrue(function_a8fd08ad364df689(tank.var_56df20c41f5b3159, self.var_6bcc6405c250ecb4.progress, tank.progress))) {
            tank.var_7150b8620d62148[ref] = 1;
            if (self.var_6bcc6405c250ecb4.progress > tank.progress) {
                tank.var_9776a7ea13c434a2[ref] = "forward";
            } else {
                tank.var_9776a7ea13c434a2[ref] = "backward";
            }
        }
        msg = waittill_notify_or_timeout_return("trap_destroyed", level.framedurationseconds);
        if (msg == "trap_destroyed") {
            tank.var_7150b8620d62148[ref] = 0;
            break;
        } else if (istrue(tank.var_7150b8620d62148[ref]) && !istrue(function_a8fd08ad364df689(tank.var_56df20c41f5b3159, self.var_6bcc6405c250ecb4.progress, tank.progress))) {
            tank.var_7150b8620d62148[ref] = 0;
        }
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x564e
// Size: 0x33
function function_a8fd08ad364df689(var_56df20c41f5b3159, var_47ded9cb9b7c0ab9, var_f26b89a1d530fa76) {
    return var_f26b89a1d530fa76 - var_47ded9cb9b7c0ab9 > var_56df20c41f5b3159 * 45 * -1 && var_f26b89a1d530fa76 - var_47ded9cb9b7c0ab9 < var_56df20c41f5b3159 * 90;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5689
// Size: 0x87
function function_4f6fdee5d536dbc6() {
    buildinfo = spawnstruct();
    buildinfo.var_29f5481763dbf9df = 4;
    buildinfo.hintstring = "MP_JUP_WM/BUILD";
    buildinfo.gestureweapon = "jup_war_ges_wrench_turret";
    buildinfo.var_32a2681a13f18cb1 = &function_ccfeb6ffd88791c0;
    buildinfo.var_fc147a62066d05bd = &function_2f7f31fd23d0f3b4;
    buildinfo.var_562da06e56403b2f = &function_d75c2c4738e6ea9c;
    level.var_2d2b6d9851424059["bdb_laser_trap"] = buildinfo;
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5717
// Size: 0x2d1
function function_60897351370d2636() {
    namespace_3c37cb17ade254d::registersharedfunc("lasertrap", "customDefuseScoreEventFunc", &function_1f4f0653f2db0e27);
    namespace_17c25f0877bfb620::scriptable_addnotifycallback("wm_laser_trap_c4_disabled", &function_1e9f18ce193adc1b);
    ents = getentarray("tri_build_laser", "targetname");
    foreach (ent in ents) {
        var_f25bed886fd05253 = getstruct(ent.target, "targetname");
        var_1e680b51bc3cdaac = getstruct(var_f25bed886fd05253.target, "targetname");
        if (isdefined(var_f25bed886fd05253.script_index)) {
            var_f25bed886fd05253.script_index = string(var_f25bed886fd05253.script_index);
        }
        var_8aafe272251dbaea = spawn_model("", var_1e680b51bc3cdaac.origin, var_1e680b51bc3cdaac.angles);
        ent.emitter = var_8aafe272251dbaea;
        ent.var_1e680b51bc3cdaac = var_1e680b51bc3cdaac;
        ent.var_1e680b51bc3cdaac.script_groupname = "nomove";
        ent.var_f25bed886fd05253 = var_f25bed886fd05253;
        var_3e61289b681334e5 = getentitylessscriptablearray(var_f25bed886fd05253.target + "_panel", "script_noteworthy");
        var_60b96b2d43f5f428 = var_3e61289b681334e5[0];
        ent.var_60b96b2d43f5f428 = var_60b96b2d43f5f428;
        if (isdefined(ent.script_noteworthy) && ent.script_noteworthy == "built") {
            ent.buildable = namespace_f4ed8842b49252fd::function_e20a97a059fba2ea("bdb_laser_trap", ent, ent.script_noteworthy, 1, var_1e680b51bc3cdaac.origin, var_1e680b51bc3cdaac.angles);
        } else {
            ent.buildable = namespace_f4ed8842b49252fd::function_e20a97a059fba2ea("bdb_laser_trap", ent, ent.script_noteworthy, 0, var_1e680b51bc3cdaac.origin, var_1e680b51bc3cdaac.angles);
            ent.var_60b96b2d43f5f428 function_3677f2be30fdd581("model", "visible_with_outline");
            ent.buildable.var_6bcc6405c250ecb4 playloopsound("jup_skydiving_laser_trap_idle");
        }
        ent.buildable.useobj.trigger setusefov(360);
        ent.buildable.useobj.trigger sethintdisplayfov(360);
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59ef
// Size: 0xe9
function function_ccfeb6ffd88791c0(player, buildable) {
    if (player.team == "allies") {
        buildable.gestureweapon = "jup_war_ges_phone_laser";
        buildable.var_6bcc6405c250ecb4.var_60b96b2d43f5f428 function_3677f2be30fdd581("screen", "building_0");
    } else if (player.team == "axis") {
        buildable.gestureweapon = "nothing_here";
        buildable.var_6bcc6405c250ecb4.var_60b96b2d43f5f428 function_3677f2be30fdd581("screen", "building_defender_0");
    }
    buildable.var_6bcc6405c250ecb4.var_60b96b2d43f5f428 function_3677f2be30fdd581("model", "visible");
    buildable.var_6bcc6405c250ecb4 playloopsound("jup_skydiving_laser_building");
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5adf
// Size: 0x8a
function function_2f7f31fd23d0f3b4(player, buildable) {
    buildable.var_6bcc6405c250ecb4.var_60b96b2d43f5f428 function_3677f2be30fdd581("model", "visible_with_outline");
    buildable.var_6bcc6405c250ecb4.var_60b96b2d43f5f428 function_3677f2be30fdd581("screen", "init");
    buildable.var_6bcc6405c250ecb4 stoploopsound();
    wait(1);
    buildable.var_6bcc6405c250ecb4 playloopsound("jup_skydiving_laser_trap_idle");
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b70
// Size: 0x1dc
function function_d75c2c4738e6ea9c(player, buildable) {
    var_3a84039ec9a5370a = player.pers["team"];
    buildable.var_6bcc6405c250ecb4.emitter notify("emitter_fixed");
    buildable.var_6bcc6405c250ecb4.var_f25bed886fd05253.turrets[0] = namespace_66ade5cda10fe3aa::function_9c405ffa3bb2dcf0(buildable.var_6bcc6405c250ecb4.var_1e680b51bc3cdaac, var_3a84039ec9a5370a, undefined, undefined, buildable.var_6bcc6405c250ecb4.var_f25bed886fd05253, "laser_trap_skydiving");
    level thread namespace_66ade5cda10fe3aa::function_2cc59ea2a67bd2f4(buildable.var_6bcc6405c250ecb4.var_f25bed886fd05253, buildable.var_6bcc6405c250ecb4.var_f25bed886fd05253.turrets, "jup_skydiving_laser_trap_c4");
    buildable.var_6bcc6405c250ecb4.var_f25bed886fd05253.turrets[0] function_5dad5f705234257();
    buildable.var_6bcc6405c250ecb4.var_f25bed886fd05253.parentent = buildable.var_6bcc6405c250ecb4;
    buildable.var_6bcc6405c250ecb4.var_60b96b2d43f5f428 function_3677f2be30fdd581("screen", "built");
    buildable.var_6bcc6405c250ecb4 stoploopsound();
    buildable.var_6bcc6405c250ecb4 playsound("jup_skydiving_laser_armed");
    buildable.var_6bcc6405c250ecb4.headiconid = buildable.var_6bcc6405c250ecb4 namespace_7bdde15c3500a23f::setheadicon_singleimage(var_3a84039ec9a5370a, "hud_icon_head_equipment_friendly", 10, undefined, undefined, undefined, undefined, undefined, undefined, buildable.var_6bcc6405c250ecb4.var_60b96b2d43f5f428.origin);
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d53
// Size: 0x15
function function_1f4f0653f2db0e27(player) {
    player namespace_f4ed8842b49252fd::function_2591bed1172e3c08(0);
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d6f
// Size: 0xbe
function function_1e9f18ce193adc1b(instance, var_62bd486904f50c98, params, var_535d9c3fdddab5a9) {
    /#
        assertex(isdefined(instance.parent_struct), "C4 struct not found");
    #/
    /#
        assertex(isdefined(instance.parent_struct.parentent), "laser trap trigger entity not found");
    #/
    var_f25bed886fd05253 = instance.parent_struct;
    if (isdefined(var_f25bed886fd05253) && isdefined(var_f25bed886fd05253.parentent)) {
        setheadicon_deleteicon(var_f25bed886fd05253.parentent.headiconid);
        var_f25bed886fd05253.parentent.headiconid = undefined;
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e34
// Size: 0x80
function function_7d79e0a416280c35() {
    level endon("game_ended");
    self endon("touch_player");
    while (1) {
        foreach (player in level.players) {
            if (player istouching(self)) {
                self hide();
                self notify("touch_player");
            }
        }
        waitframe();
    }
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ebb
// Size: 0x3a
function function_5dad5f705234257() {
    var_4d16d428538ff673 = self.var_779c916529c44b1a.angles;
    var_878bae61aca86fc5 = anglestoforward(var_4d16d428538ff673);
    self function_83ea6f9ebc30c9a4(var_878bae61aca86fc5);
}

// Namespace namespace_db33ab6330bb5189/namespace_555f6ee22fb8fd82
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5efc
// Size: 0xd2
function function_adc7327a592cc4a1() {
    var_29c5e5c42368a131 = self physics_getentityaabb();
    var_fa8d5f684b034b30 = physics_createcontents([0:"physicscontents_item"]);
    var_646389193279e8ec = [0:self];
    var_f3f22330151d410a = physics_aabbbroadphasequery(var_29c5e5c42368a131["min"], var_29c5e5c42368a131["max"], var_fa8d5f684b034b30, var_646389193279e8ec);
    foreach (ent in var_f3f22330151d410a) {
        if (isdefined(ent.equipmentref) && ent.equipmentref == "equip_tac_cover") {
            ent namespace_e76aa51cbf8812ee::tac_cover_destroy(undefined, 0);
        }
    }
}
