// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\killstreaks\nuke.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\gametypes\arm.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\common\vehicle_paths.gsc;
#using script_2c17aa19d1e937b2;
#using script_e5db4163ddc9246;
#using scripts\mp\utility\game.gsc;
#using script_2bc0b0102f9b7751;
#using script_48814951e916af89;
#using scripts\mp\menus.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_3b8fc89cb1e6b305;

// Namespace namespace_3b8fc89cb1e6b305/namespace_8ced5a717f2e8054
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x464
// Size: 0xe
function init() {
    level.var_ee656bfaf5da1c13 = 1;
}

// Namespace namespace_3b8fc89cb1e6b305/namespace_8ced5a717f2e8054
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x479
// Size: 0x28
function function_1c915051680a9364(var_65c66b5814217d34, var_4866730a34490fbc) {
    level.var_cdb45c94ef19a71a = var_65c66b5814217d34;
    level.var_eb56ee71d36c7f7a = var_4866730a34490fbc;
}

// Namespace namespace_3b8fc89cb1e6b305/namespace_8ced5a717f2e8054
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a8
// Size: 0xff
function function_cc892bd20a432474(winner) {
    level.var_2f006c7490fb7639 = 1;
    if (is_equal(winner, game["defenders"])) {
        var_3d7f2c319e778125 = level.var_eb56ee71d36c7f7a;
    } else {
        var_3d7f2c319e778125 = level.var_cdb45c94ef19a71a;
    }
    if (!isdefined(var_3d7f2c319e778125)) {
        var_3d7f2c319e778125 = &function_5989ba2dcd956dff;
    }
    setomnvarforallclients("post_game_state", 16);
    camera = [[ var_3d7f2c319e778125 ]]();
    var_47375a7229c47914 = getentarray("mp_global_intermission", "classname");
    foreach (ent in var_47375a7229c47914) {
        ent.origin = camera.origin;
        ent.angles = camera.angles;
    }
}

// Namespace namespace_3b8fc89cb1e6b305/namespace_8ced5a717f2e8054
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ae
// Size: 0x271
function ending_viewing_players_setup(animstruct, var_4f8af551aae92267, var_174e703931ab1a87) {
    level.brspawnplayersending = 1;
    level notify("brSpawnPlayersEnding");
    foreach (player in level.players) {
        /#
            if (getdvarint(@"hash_dd3266b5409a856b") && player ishost()) {
                goto LOC_000001b3;
            }
        #/
        player function_b88c89bb7cd1ab8e(animstruct.origin);
        player utility::hidehudenable();
        player setcinematicmotionoverride("disabled");
        player setclientomnvar("ui_hide_hud", 1);
        if (isdefined(player.sessionstate)) {
            if (player.sessionstate == "intermission") {
                player updatesessionstate("spectator");
            }
            if (player.sessionstate == "spectator") {
                player setspectatedefaults(animstruct.cam.origin, animstruct.cam.angles);
                player spawn(animstruct.cam.origin, animstruct.cam.angles);
            } else {
                player setorigin(animstruct.origin + (0, 0, 100));
            LOC_000001b3:
            }
        LOC_000001b3:
        }
    LOC_000001b3:
    }
    foreach (player in level.players) {
        /#
            if (getdvarint(@"hash_dd3266b5409a856b") && player ishost()) {
                goto LOC_0000025d;
            }
        #/
        var_32e1477741db4378 = "tag_player";
        linkent = animstruct.cam;
        if (isdefined(var_174e703931ab1a87)) {
            var_32e1477741db4378 = var_174e703931ab1a87;
        }
        if (isdefined(var_4f8af551aae92267)) {
            linkent = var_4f8af551aae92267;
        }
        player cameralinkto(linkent, var_32e1477741db4378, 1, 1);
        player playerlinkto(animstruct.cam, "tag_player");
        player playerhide();
    LOC_0000025d:
    }
}

// Namespace namespace_3b8fc89cb1e6b305/namespace_8ced5a717f2e8054
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x826
// Size: 0x51
function create_cam() {
    model = spawn("script_model", self.origin);
    model setmodel("tag_origin");
    model forcenetfieldhighlod(1);
    model useanimtree(%script_model);
    model.animname = "endingCam";
    return model;
}

// Namespace namespace_3b8fc89cb1e6b305/namespace_8ced5a717f2e8054
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87f
// Size: 0xa9
function function_5989ba2dcd956dff() {
    animstruct = spawnstruct();
    animstruct.angles = (0, 0, 0);
    animstruct.origin = (0, 0, 0);
    animstruct.cam = animstruct create_cam();
    animstruct.cam.angles = animstruct.angles;
    ending_viewing_players_setup(animstruct);
    animstruct.cam movez(128, 4, 0.3);
    wait(3);
    return animstruct.cam;
}

// Namespace namespace_3b8fc89cb1e6b305/namespace_8ced5a717f2e8054
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x930
// Size: 0x17b
function function_28bb7459a1fec3ef() {
    level.mercymatchending_time = 5;
    animstruct = getstruct("wm_st_c_ending_cam_attackers", "targetname");
    animstruct.cam = animstruct create_cam();
    animstruct.cam.angles = animstruct.angles;
    ending_viewing_players_setup(animstruct);
    wm_missile_st_c = getent("wm_missile_st_c", "targetname");
    wm_missile_st_c movez(4096, 3, 0.3);
    animstruct.cam movez(2048, 4, 0.3);
    wait(4);
    foreach (player in level.players) {
        thread namespace_36f464722d326bbe::function_852712268d005332(player, 1, 1);
    }
    wait(1);
    setomnvarforallclients("post_game_state", 12);
    foreach (player in level.players) {
        thread namespace_36f464722d326bbe::function_852712268d005332(player, 0, 1);
    }
    wait(5);
    wait(6);
    return animstruct.cam;
}

// Namespace namespace_3b8fc89cb1e6b305/namespace_8ced5a717f2e8054
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab3
// Size: 0x2ee
function function_ac89b9c54d572b13() {
    struct = getstructarray("mp_jup_dam_heli_spawn", "targetname")[0];
    spawndata = spawnstruct();
    spawndata.origin = struct.origin;
    spawndata.angles = struct.angles;
    var_d0697af2eca83d63 = spawnstruct();
    var_d0697af2eca83d63.origin = struct.origin + (0, 100, 0);
    var_d0697af2eca83d63.angles = struct.angles;
    vehicle = vehicle_spawn("veh9_blima", spawndata);
    vehicle setscriptablepartstate("running_lights", "on");
    vehicle.animname = "blima";
    vehicle.var_918c5a31037e00ee = spawnstruct();
    vehicle.var_918c5a31037e00ee.speed = 85;
    vehicle thread vehicle_paths_helicopter(var_d0697af2eca83d63);
    animstruct = getstruct("attackers_fail_outro_cam_1", "targetname");
    animstruct.cam = animstruct create_cam();
    animstruct.cam.angles = animstruct.angles;
    var_77fa37bcf1780140 = getstruct("samsite_loc_cinematic", "targetname");
    turret = function_fefa23bed4e70fb2(var_77fa37bcf1780140, "military_samsite_01_rig_skeleton_war_mode_mp");
    function_f7c5fc38fdc4df8c(turret);
    missile_fired = turret.var_692fc766d262881a;
    turret.target_entity = vehicle;
    turret settargetentity(turret.target_entity);
    ending_viewing_players_setup(animstruct);
    animstruct.cam movez(128, 10, 0.3);
    wait(2);
    turret thread function_44e4433ebac52609();
    wait(1);
    struct = getstruct("attackers_fail_outro_cam_2", "targetname");
    animstruct.cam.origin = struct.origin;
    animstruct.cam.angles = struct.angles;
    wait(1.25);
    playfx(getfx("veh_jup_razorback_explosion"), missile_fired.origin, anglestoforward(missile_fired.angles), anglestoup(missile_fired.angles));
    missile_fired hide();
    vehicle vehphys_crash();
    vehicle setscriptablepartstate("engine", "on");
    vehicle setscriptablepartstate("damageHeavy", "lowSpeed");
    vehicle setscriptablepartstate("damageEngine", "explode");
    wait(3.5);
    return animstruct.cam;
}

// Namespace namespace_3b8fc89cb1e6b305/namespace_8ced5a717f2e8054
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xda9
// Size: 0x10e
function spawninfilvehicle(struct) {
    spawnpos = struct.origin;
    var_b7850001037aa074 = struct.angles;
    model = "veh9_mil_air_heli_blima_mp";
    var_ab5cd311f5dc80a6 = "veh9_mil_air_heli_blima_physics_mp";
    vehicle = spawnvehicle(model, "wmHeliOutro", var_ab5cd311f5dc80a6, spawnpos, var_b7850001037aa074);
    vehicle.animname = "blima";
    vehicle setcandamage(0);
    if (vehicle vehicle_isphysveh()) {
        vehicle function_247ad6a91f6a4ffe(1);
        vehicle vehphys_forcekeyframedmotion();
    } else {
        vehicle notsolid();
    }
    vehicle hidepart("tag_main_rotor_blade_01");
    vehicle hidepart("tag_main_rotor_blade_02");
    vehicle hidepart("tag_main_rotor_blade_03");
    vehicle hidepart("tag_main_rotor_blade_04");
    vehicle hidepart("tag_tail_rotor_blade_01");
    vehicle hidepart("tag_tail_rotor_blade_02");
    vehicle hidepart("tag_tail_rotor_blade_03");
    vehicle hidepart("tag_tail_rotor_blade_04");
    return vehicle;
}

// Namespace namespace_3b8fc89cb1e6b305/namespace_8ced5a717f2e8054
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xebf
// Size: 0x37d
function function_64dd96614abf2d2(animstruct) {
    animstruct = getstructarray("wm_attackers_win_camera", "targetname")[0];
    animstruct.cam = animstruct create_cam();
    animstruct.cam.angles = animstruct.angles;
    ending_viewing_players_setup(animstruct);
    namespace_bfef6903bca5845d::init();
    setdvar(@"hash_365d77262b3a350e", 0);
    foreach (player in level.players) {
        thread namespace_36f464722d326bbe::function_852712268d005332(player, 1, 0);
    }
    while (!isdefined(level.agentarray) || level.agentarray.size == 0) {
        waitframe();
    }
    while (!isdefined(level.var_41670c1c65f3d3cf)) {
        waitframe();
    }
    while (!isdefined(level.players) || level.players.size == 0) {
        waitframe();
    }
    level.var_bdb4d0cd41b1c39d = 1;
    level.var_b4c49b42d82621c9 = 1;
    setdvar(@"hash_45680b15d7117402", 2000);
    function_b1d1e7e3b23e0dfe([0:"reinforcements"]);
    namespace_7ae25d9e5d5a28ef::function_d0ffcd08e0870cf2();
    var_b78d4edd3c77906f = getstructarray("attacker_reinforcements_goal", "targetname")[0];
    agenttype = "enemy_mp_firebug_tier2_pmc";
    level.var_1a2b600a06ec21f4.var_d49e76efde35f3e0 = 1;
    level.var_75041b516b3785c6 = "pmc";
    var_b58631347b6ab04 = namespace_7ae25d9e5d5a28ef::function_3779deb97b61a65(6, var_b78d4edd3c77906f.origin, "high", "reinforcements", "debug", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, "veh9_blima");
    if (!isdefined(var_b58631347b6ab04)) {
        return 0;
    }
    foreach (player in level.players) {
        thread namespace_36f464722d326bbe::function_852712268d005332(player, 0, 1);
    }
    vehicle = var_b58631347b6ab04[0].vehicle;
    up = -250;
    left = -250;
    animstruct.cam linkto(vehicle, "tag_origin", (up, left, 0), (0, 30, 0));
    wait(4);
    up = 75;
    left = -175;
    animstruct.cam unlink();
    animstruct.cam linkto(vehicle, "tag_origin", (up, left, -70), (0, 110, 0));
    wait(10);
    animstruct.cam unlink();
    var_93898055528798eb = getstruct("wm_attackers_win_camera_2", "targetname");
    animstruct.cam.origin = var_93898055528798eb.origin;
    animstruct.cam.angles = var_93898055528798eb.angles;
    animstruct.cam movex(128, 20);
    wait(14);
    return animstruct.cam;
}

