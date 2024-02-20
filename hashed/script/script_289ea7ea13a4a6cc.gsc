// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7ab5b649fa408138;
#using script_930a1e7bd882c1d;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_72a196b6c7df2f38;
#using script_75377e59f5becac8;
#using scripts\mp\music_and_dialog.gsc;
#using script_6775ad452d13858;

#namespace namespace_5954a99719111147;

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2985
// Size: 0x21e
function init() {
    /#
        assert(isdefined(level.infilstruct));
    #/
    /#
        setdevdvarifuninitialized(@"hash_bfded00ac93c45b7", 1);
        setdevdvarifuninitialized(@"hash_7f1da0c3501cbdf2", 1);
    #/
    level.infilstruct.var_fd05dc031a2e7283 = "jup_black_wz::veh9_mil_air_cargo_plane_exterior_infil";
    level.infilstruct.var_30e653e12f358438 = "veh9_mil_air_cargo_plane_interior_infil";
    level.infilstruct.var_c3a4f4442070a8b5 = "tag_body_animate";
    level.infilstruct.var_7a96307b6a7ed797 = "veh_br_infil_c17_distant_lp";
    level.infilstruct.var_12c912ee9672fa1 = 1;
    level.infilstruct.var_eb0e85a583f21b9d = 1;
    if (getdvarint(@"hash_4da4ea33e4dc6045", 0)) {
        level.infilstruct.var_878cbe1580f47685 = 1;
        level.infilstruct.var_477bd548940c3a78 = "jup_wz_infil_opening";
        level.infilstruct.var_10d27b439af13a2a = 6.49;
    }
    level.infilstruct.var_5a3d20651fd80005 = &function_8cb390c64468017;
    level.infilstruct.var_eb0cd5e47dbbfd6a = &function_eb0cd5e47dbbfd6a;
    level.infilstruct.var_b381e33e977da440 = &function_3158c3418412e97f;
    level.infilstruct.var_ae9e4023110acc6e = &function_ad4a7a73c7d7d9e0;
    level.infilstruct.var_8d5c19a9b693e913 = &function_8d5c19a9b693e913;
    level.infilstruct.var_dc0bc83a31193177 = &function_dc0bc83a31193177;
    var_1809e16510055e87 = [0:"cam_orbit_br_infil_ac130_player1", 1:"cam_orbit_br_infil_ac130_player2", 2:"cam_orbit_br_infil_ac130_player3", 3:"cam_orbit_br_infil_ac130_player4", 4:"cam_orbit_br_infil_ac130_player1"];
    function_226e337633a44059(var_1809e16510055e87);
    function_ad12d29d41483e8a("prematch", &function_cd7e1a37d5e2ca2b);
    function_ad12d29d41483e8a("fadedown", &function_26874fd7694aa29);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2baa
// Size: 0x57
function function_eb0cd5e47dbbfd6a() {
    var_cddd3c2ea93f8e9c = getent("infil_exfil_hq_origin", "targetname");
    if (isdefined(var_cddd3c2ea93f8e9c)) {
        level.infilstruct.var_6930961c8a8d33fc = var_cddd3c2ea93f8e9c.origin;
        level.infilstruct.var_2a959f4ba13b75da = 1;
    }
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c08
// Size: 0x48d0
function function_3158c3418412e97f(movingc130) {
    animstruct = spawnstruct();
    animstruct.cleanupfunc = &function_f48f4d028a11be8f;
    animstruct.var_ab8494260b910b51 = &function_52bedae2ced8e191;
    animstruct.movingc130 = movingc130;
    animstruct.movingc130.animname = "movingC130";
    animstruct.var_3772737101aa4af = 1;
    var_cddd3c2ea93f8e9c = getent("infil_exfil_hq_origin", "targetname");
    if (!isdefined(var_cddd3c2ea93f8e9c)) {
        var_cddd3c2ea93f8e9c = spawnstruct();
        var_cddd3c2ea93f8e9c.origin = (0, 0, 0);
        var_cddd3c2ea93f8e9c.angles = (0, 0, 0);
    }
    animstruct.origin = getdvarvector(@"hash_e30e6380ab2f16f7", var_cddd3c2ea93f8e9c.origin);
    animstruct.angles = var_cddd3c2ea93f8e9c.angles;
    animstruct.var_e73ce295ae9d4104 = animstruct spawn_script_model("generic_prop_x30", "camera");
    animstruct.var_e73ce295ae9d4104.angles = getdvarvector(@"hash_a243c97d0dc94bd7", animstruct.var_e73ce295ae9d4104.angles);
    animstruct.var_b50860e78d9e1e5[0] = animstruct spawn_script_model("tag_player", "playerTag1");
    animstruct.var_b50860e78d9e1e5[1] = animstruct spawn_script_model("tag_player", "playerTag2");
    animstruct.var_b50860e78d9e1e5[2] = animstruct spawn_script_model("tag_player", "playerTag3");
    animstruct.var_b50860e78d9e1e5[3] = animstruct spawn_script_model("tag_player", "playerTag4");
    animstruct.var_b50860e78d9e1e5[0] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_4", (0, 0, 0), (0, 0, 0));
    animstruct.var_b50860e78d9e1e5[1] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_5", (0, 0, 0), (0, 0, 0));
    animstruct.var_b50860e78d9e1e5[2] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_6", (0, 0, 0), (0, 0, 0));
    animstruct.var_b50860e78d9e1e5[3] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_7", (0, 0, 0), (0, 0, 0));
    animstruct.var_a552ec61e51ece6e[0] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player1");
    animstruct.var_a552ec61e51ece6e[1] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player2");
    animstruct.var_a552ec61e51ece6e[2] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player3");
    animstruct.var_a552ec61e51ece6e[3] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player4");
    animstruct.var_a552ec61e51ece6e[0] linkto(animstruct.var_b50860e78d9e1e5[0], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.var_a552ec61e51ece6e[1] linkto(animstruct.var_b50860e78d9e1e5[1], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.var_a552ec61e51ece6e[2] linkto(animstruct.var_b50860e78d9e1e5[2], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.var_a552ec61e51ece6e[3] linkto(animstruct.var_b50860e78d9e1e5[3], "tag_player", (0, 0, 0), (0, 0, 0));
    skins = [0:"milsim_western_a", 1:"milsim_western_b", 2:"milsim_western_c", 3:"milsim_western_d", 4:"milsim_eastern_a", 5:"milsim_eastern_b", 6:"milsim_eastern_c", 7:"milsim_eastern_d"];
    var_d84aaa47282d5918 = array_randomize(skins);
    animstruct.var_a552ec61e51ece6e[0] function_66b13900c5013de5(var_d84aaa47282d5918[0]);
    animstruct.var_a552ec61e51ece6e[1] function_66b13900c5013de5(var_d84aaa47282d5918[1]);
    animstruct.var_a552ec61e51ece6e[2] function_66b13900c5013de5(var_d84aaa47282d5918[2]);
    animstruct.var_a552ec61e51ece6e[3] function_66b13900c5013de5(var_d84aaa47282d5918[3]);
    animstruct.var_2668fb5d52d6438d = [];
    animstruct.var_2668fb5d52d6438d[0] = animstruct spawn_script_model("fullbody_mp_hero_graves_pmc_noglasses_infil", "graves");
    animstruct.var_2668fb5d52d6438d[1] = animstruct spawn_script_model("fullbody_mp_shadow_company_03", "npc1");
    animstruct.var_2668fb5d52d6438d[2] = animstruct spawn_script_model("fullbody_mp_shadow_company_02", "npc2");
    animstruct.var_2668fb5d52d6438d[0] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_3", (0, 0, 0), (0, 0, 0));
    animstruct.var_2668fb5d52d6438d[1] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_8", (0, 0, 0), (0, 0, 0));
    animstruct.var_2668fb5d52d6438d[2] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_9", (0, 0, 0), (0, 0, 0));
    animstruct.var_6266728e14c12b27 = function_e4715ff546c6059e();
    animstruct.var_7e40e03490016ab1 = [];
    animstruct.var_7e40e03490016ab1[0] = animstruct spawn_script_model("c_t10_gear_navy_seal_parachute_01_exfil", "parachute1");
    animstruct.var_7e40e03490016ab1[1] = animstruct spawn_script_model("c_t10_gear_navy_seal_parachute_01_exfil", "parachute2");
    animstruct.var_7e40e03490016ab1[2] = animstruct spawn_script_model("c_t10_gear_navy_seal_parachute_01_exfil", "parachute3");
    animstruct.var_7e40e03490016ab1[3] = animstruct spawn_script_model("c_t10_gear_navy_seal_parachute_01_exfil", "parachute4");
    animstruct.var_7e40e03490016ab1[0] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_10", (0, 0, 0), (0, 0, 0));
    animstruct.var_7e40e03490016ab1[1] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_11", (0, 0, 0), (0, 0, 0));
    animstruct.var_7e40e03490016ab1[2] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_12", (0, 0, 0), (0, 0, 0));
    animstruct.var_7e40e03490016ab1[3] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_13", (0, 0, 0), (0, 0, 0));
    animstruct.var_9574d80eb717270a = [];
    animstruct.var_9574d80eb717270a[0] = animstruct spawn_script_model("c_t10_gear_navy_seal_parachute_01a_flat_exfil", "flatParachute1");
    animstruct.var_9574d80eb717270a[1] = animstruct spawn_script_model("c_t10_gear_navy_seal_parachute_01b_flat_exfil", "flatParachute2");
    animstruct.var_9574d80eb717270a[2] = animstruct spawn_script_model("c_t10_gear_navy_seal_parachute_01a_flat_exfil", "flatParachute3");
    animstruct.var_9574d80eb717270a[3] = animstruct spawn_script_model("c_t10_gear_navy_seal_parachute_01b_flat_exfil", "flatParachute4");
    animstruct.var_9574d80eb717270a[0] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_14", (0, 0, 0), (0, 0, 0));
    animstruct.var_9574d80eb717270a[1] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_15", (0, 0, 0), (0, 0, 0));
    animstruct.var_9574d80eb717270a[2] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_16", (0, 0, 0), (0, 0, 0));
    animstruct.var_9574d80eb717270a[3] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_17", (0, 0, 0), (0, 0, 0));
    animstruct.props = [];
    animstruct.props[0] = animstruct spawn_script_model("veh9_mil_air_cargo_plane_black", "cargoPlane");
    animstruct.props[1] = animstruct spawn_script_model("clothing_sunglasses_02", "sunglasses");
    animstruct.props[2] = animstruct spawn_script_model("jup_environment_props_infil", "infilProps");
    animstruct.props[3] = animstruct spawn_script_model("jup_environment_props_exfil", "exfilProps");
    animstruct.props[4] = animstruct spawn_script_model("device_laptop_exfil_dam", "laptop1");
    animstruct.props[5] = animstruct spawn_script_model("device_laptop_exfil_dam", "laptop2");
    animstruct.props[6] = animstruct spawn_script_model("device_laptop_exfil_dam", "laptop3");
    animstruct.props[0] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_2", (0, 0, 0), (0, 0, 0));
    animstruct.props[1] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_18", (0, 0, 0), (0, 0, 0));
    animstruct.props[2] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_19", (0, 0, 0), (0, 0, 0));
    animstruct.props[3] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_20", (0, 0, 0), (0, 0, 0));
    animstruct.props[4] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_21", (0, 0, 0), (0, 0, 0));
    animstruct.props[5] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_22", (0, 0, 0), (0, 0, 0));
    animstruct.props[6] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_23", (0, 0, 0), (0, 0, 0));
    animstruct.packs = [];
    n = 0;
    if (!getdvarint(@"hash_4da4ea33e4dc6045", 0)) {
        animstruct.packs[n] = animstruct create_animpack("scene_010");
        animstruct.packs[n] add_pack_startfunc([], &function_f22cb9522711b2ea);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_gprop"]);
        animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_gprop"], "wz_br_jup_infil_sh010_xcam");
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_plyr1"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_plyr2"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_plyr3"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_plyr4"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_plyr1"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_plyr2"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_plyr3"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_plyr4"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83[animstruct.var_6266728e14c12b27[n]]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_npc01"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_npc02"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_parachute01"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_parachute02"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_parachute03"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_parachute04"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_parachute_flat01"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_parachute_flat02"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_parachute_flat03"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_parachute_flat04"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.props[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_crgopln"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.props[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_glasses"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.props[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_infil_prop"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.props[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_exfil_prop"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.props[4], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_laptop1"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.props[5], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_laptop2"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.props[6], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh010_laptop3"]);
        n++;
        var_61957df77321c285 = &function_53532f9526762349;
    }
    if (!isdefined(var_61957df77321c285)) {
        var_61957df77321c285 = &function_f22cb9522711b2ea;
    }
    animstruct.packs[n] = animstruct create_animpack("scene_020");
    animstruct.packs[n] add_pack_startfunc([], var_61957df77321c285);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_gprop"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_gprop"], "wz_br_jup_infil_sh020_xcam");
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_plyr1"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_plyr2"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_plyr3"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_plyr4"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_plyr1"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_plyr2"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_plyr3"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_plyr4"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83[animstruct.var_6266728e14c12b27[n]]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_npc01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_npc02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_parachute01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_parachute02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_parachute03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_parachute04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_parachute_flat01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_parachute_flat02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_parachute_flat03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_parachute_flat04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_crgopln"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_glasses"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_infil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_exfil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[4], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_laptop1"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[5], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_laptop2"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[6], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh020_laptop3"]);
    n++;
    animstruct.packs[n] = animstruct create_animpack("scene_030");
    animstruct.packs[n] add_pack_startfunc([], &function_6fde71a53407e890);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_gprop"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_gprop"], "wz_br_jup_infil_sh030_xcam");
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_plyr1"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_plyr2"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_plyr3"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_plyr4"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_plyr1"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_plyr2"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_plyr3"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_plyr4"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83[animstruct.var_6266728e14c12b27[n]]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_npc01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_npc02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_parachute01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_parachute02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_parachute03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_parachute04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_parachute_flat01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_parachute_flat02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_parachute_flat03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_parachute_flat04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_crgopln"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_glasses"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_infil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_exfil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[4], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_laptop1"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[5], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_laptop2"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[6], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh030_laptop3"]);
    n++;
    animstruct.packs[n] = animstruct create_animpack("scene_040");
    animstruct.packs[n] add_pack_startfunc([], &function_1f317f1b65bfeeff);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_gprop"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_gprop"], "wz_br_jup_infil_sh040_xcam");
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_plyr1"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_plyr2"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_plyr3"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_plyr4"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_plyr1"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_plyr2"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_plyr3"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_plyr4"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83[animstruct.var_6266728e14c12b27[n]]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_npc01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_npc02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_parachute01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_parachute02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_parachute03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_parachute04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_parachute_flat01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_parachute_flat02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_parachute_flat03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_parachute_flat04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_crgopln"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_glasses"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_infil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_exfil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[4], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_laptop1"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[5], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_laptop2"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[6], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh040_laptop3"]);
    n++;
    animstruct.packs[n] = animstruct create_animpack("scene_050");
    animstruct.packs[n] add_pack_startfunc([], &function_244ef8d9a1722b66);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_gprop"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_gprop"], "wz_br_jup_infil_sh050_xcam");
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_plyr1"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_plyr2"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_plyr3"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_plyr4"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_plyr1"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_plyr2"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_plyr3"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_plyr4"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83[animstruct.var_6266728e14c12b27[n]]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_npc01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_npc02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_parachute01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_parachute02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_parachute03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_parachute04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_parachute_flat01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_parachute_flat02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_parachute_flat03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_parachute_flat04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_crgopln"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_glasses"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_infil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_exfil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[4], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_laptop1"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[5], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_laptop2"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[6], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh050_laptop3"]);
    n++;
    animstruct.packs[n] = animstruct create_animpack("scene_060");
    animstruct.packs[n] add_pack_startfunc([], &function_11047ac53c2edeb5);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_gprop"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_gprop"], "wz_br_jup_infil_sh060_xcam");
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_plyr1"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_plyr2"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_plyr3"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_plyr4"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_plyr1"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_plyr2"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_plyr3"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_plyr4"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83[animstruct.var_6266728e14c12b27[n]]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_npc01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_npc02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_parachute01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_parachute02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_parachute03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_parachute04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_parachute_flat01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_parachute_flat02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_parachute_flat03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_parachute_flat04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_crgopln"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_glasses"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_infil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_exfil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[4], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_laptop1"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[5], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_laptop2"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[6], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh060_laptop3"]);
    n++;
    animstruct.packs[n] = animstruct create_animpack("scene_070");
    animstruct.packs[n] add_pack_startfunc([], &function_c64b1669d5b0a83c);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_gprop"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_gprop"], "wz_br_jup_infil_sh070_xcam");
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_plyr1"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_plyr2"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_plyr3"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_plyr4"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_plyr1"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_plyr2"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_plyr3"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_plyr4"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83[animstruct.var_6266728e14c12b27[n]]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_npc01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_npc02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_parachute01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_parachute02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_parachute03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_parachute04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_parachute_flat01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_parachute_flat02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_parachute_flat03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_parachute_flat04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_crgopln"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_glasses"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_infil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_exfil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[4], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_laptop1"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[5], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_laptop2"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[6], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh070_laptop3"]);
    n++;
    animstruct.packs[n] = animstruct create_animpack("scene_080");
    animstruct.packs[n] add_pack_startfunc([], &function_2c74c22f4a5738b);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_gprop"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_gprop"], "wz_br_jup_infil_sh080_xcam");
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_plyr1"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_plyr2"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_plyr3"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_plyr4"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_plyr1"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_plyr2"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_plyr3"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_plyr4"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83[animstruct.var_6266728e14c12b27[n]]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_npc01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_npc02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_parachute01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_parachute02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_parachute03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_parachute04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_parachute_flat01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_parachute_flat02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_parachute_flat03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_parachute_flat04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_crgopln"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_glasses"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_infil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_exfil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[4], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_laptop1"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[5], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_laptop2"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[6], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh080_laptop3"]);
    n++;
    animstruct.packs[n] = animstruct create_animpack("scene_090");
    animstruct.packs[n] add_pack_startfunc([], &function_83c85bdfccb862b2);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_gprop"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_gprop"], "wz_br_jup_infil_sh090_xcam");
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_plyr1"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_plyr2"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_plyr3"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_plyr4"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_plyr1"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_plyr2"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_plyr3"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_plyr4"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83[animstruct.var_6266728e14c12b27[n]]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_npc01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_npc02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_parachute01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_parachute02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_parachute03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_parachute04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_parachute_flat01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_parachute_flat02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_parachute_flat03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_parachute_flat04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_crgopln"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_glasses"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_infil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_exfil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[4], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_laptop1"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[5], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_laptop2"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[6], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh090_laptop3"]);
    n++;
    animstruct.packs[n] = animstruct create_animpack("scene_100");
    animstruct.packs[n] add_pack_startfunc([], &function_12e8683b52f21db4);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_gprop"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_gprop"], "wz_br_jup_infil_sh100_xcam");
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_plyr1"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_plyr2"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_plyr3"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_plyr4"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_plyr1"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_plyr2"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_plyr3"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_plyr4"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83[animstruct.var_6266728e14c12b27[n]]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_npc01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_npc02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_parachute01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_parachute02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_parachute03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_7e40e03490016ab1[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_parachute04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_parachute_flat01"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_parachute_flat02"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_parachute_flat03"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_9574d80eb717270a[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_parachute_flat04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_crgopln"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_glasses"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_infil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_exfil_prop"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[4], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_laptop1"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[5], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_laptop2"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.props[6], level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_laptop3"]);
    n++;
    animstruct.packs[n] = animstruct create_animpack("prelooping", 0);
    animstruct.packs[n] add_pack_startfunc([0:45], &function_6f33464b9145231b);
    animstruct.packs[n] add_pack_modelanim(animstruct.movingc130, level.var_1a209bd995a7fa83["wz_br_jup_infil_idle_crgopln"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_gprop"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_gprop"], "wz_br_jup_infil_transition_xcam");
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr1"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr2"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr3"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr4"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr1"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr2"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr3"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr4"]);
    n++;
    animstruct.packs[n] = animstruct create_animpack("looping", 1);
    animstruct.packs[n] add_pack_startfunc([0:45], &function_f3ae4b41df047ba0);
    animstruct.packs[n] add_pack_modelanim(animstruct.movingc130, level.var_1a209bd995a7fa83["wz_br_jup_infil_idle_crgopln"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_infil_g_prop_idle_sh010"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_idle_sh010"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_idle_sh010"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_idle_sh010"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_idle_sh010"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_idle_sh010"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_idle_sh010"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "j_prop_1");
    return animstruct;
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x74e0
// Size: 0x1b2
function private function_e4715ff546c6059e() {
    var_2e499da7fec99524 = [0:"wz_br_jup_infil_sh010_cmdr", 1:"wz_br_jup_infil_sh020_cmdr", 2:"wz_br_jup_infil_sh030_cmdr", 3:"wz_br_jup_infil_sh040_cmdr", 4:"wz_br_jup_infil_sh050_cmdr", 5:"wz_br_jup_infil_sh060_cmdr", 6:"wz_br_jup_infil_sh070_cmdr", 7:"wz_br_jup_infil_sh080_cmdr", 8:"wz_br_jup_infil_sh090_cmdr", 9:"wz_br_jup_infil_sh100_cmdr"];
    var_6cb889c93ea2fbe2 = [0:1, 1:1, 2:1, 3:1, 4:1, 5:1, 6:0, 7:0, 8:0, 9:0];
    var_f423b07db05160b2 = [0:0, 1:0, 2:1, 3:0, 4:1, 5:0, 6:0, 7:0, 8:0, 9:0];
    var_db488c3a1777b95e = [0:"_a", 1:"_b", 2:"_c"];
    if (getdvarint(@"hash_4da4ea33e4dc6045", 0)) {
        var_2e499da7fec99524 = array_remove_index(var_2e499da7fec99524, 0);
        var_6cb889c93ea2fbe2 = array_remove_index(var_6cb889c93ea2fbe2, 0);
        var_f423b07db05160b2 = array_remove_index(var_f423b07db05160b2, 0);
    }
    var_674c56d9e4bb6f63 = [];
    var_18e8b4bc3930f848 = "";
    for (var_c9910f322154c0f4 = 0; var_c9910f322154c0f4 < var_2e499da7fec99524.size; var_c9910f322154c0f4++) {
        if (!var_6cb889c93ea2fbe2[var_c9910f322154c0f4]) {
            var_18e8b4bc3930f848 = "";
        } else if (!var_f423b07db05160b2[var_c9910f322154c0f4]) {
            var_18e8b4bc3930f848 = utility::function_7a2aaa4a09a4d250(var_db488c3a1777b95e);
        }
        var_71890d873d9d0bec = var_2e499da7fec99524[var_c9910f322154c0f4];
        var_674c56d9e4bb6f63[var_674c56d9e4bb6f63.size] = var_71890d873d9d0bec + var_18e8b4bc3930f848;
    }
    return var_674c56d9e4bb6f63;
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x769a
// Size: 0x486
function function_f3ae4b41df047ba0(array) {
    pack = self.var_2739b8c6b038ba5e;
    /#
        assert(isdefined(pack));
    #/
    var_e49a1c04ac964563 = 0;
    var_1ff908a48d4dc0d3 = 4;
    /#
        var_e49a1c04ac964563 = namespace_56a3588493afc984::function_c43d732289ecf3e8();
        var_1ff908a48d4dc0d3 = namespace_56a3588493afc984::function_d8220f4960da76cd();
    #/
    function_583f118c4064ca21(level.infilstruct.players);
    teams = function_cc1b64e82fd4680c(level.infilstruct.players);
    foreach (players in teams) {
        numplayers = players.size;
        if (var_e49a1c04ac964563) {
            numplayers = var_1ff908a48d4dc0d3;
        }
        var_f5b09a636e6e3153 = [0:1, 1:2, 2:3, 3:4];
        var_2a0daf6e400c4b91 = [];
        playercount = 0;
        foreach (player in players) {
            player.infilanimindex = var_f5b09a636e6e3153[playercount % var_f5b09a636e6e3153.size];
            player.var_db122a8941dfee14 = numplayers;
            playercount++;
            var_2a0daf6e400c4b91[var_2a0daf6e400c4b91.size] = player.infilanimindex;
        }
        for (var_856290d228426047 = 0; var_856290d228426047 < 4; var_856290d228426047++) {
            foreach (player in players) {
                self.var_7e40e03490016ab1[var_856290d228426047] hidefromplayer(player);
                self.var_9574d80eb717270a[var_856290d228426047] hidefromplayer(player);
            }
        }
        foreach (index in var_2a0daf6e400c4b91) {
            foreach (player in players) {
                self.var_7e40e03490016ab1[index - 1] showtoplayer(player);
                self.var_9574d80eb717270a[index - 1] showtoplayer(player);
            }
        }
    }
    if (var_e49a1c04ac964563) {
        pack.var_3bd5282b118d27f8 = array_removeundefined(pack.var_3bd5282b118d27f8);
        var_2246d8f267e2c3de = 0;
        foreach (var_10727dcc51c74547 in pack.var_3bd5282b118d27f8) {
            if (var_2246d8f267e2c3de < var_1ff908a48d4dc0d3) {
                var_10727dcc51c74547 show();
            } else {
                var_10727dcc51c74547 hide();
            }
        }
        for (idx = 0; idx < var_1ff908a48d4dc0d3; idx++) {
            foreach (player in players) {
                self.var_7e40e03490016ab1[idx] showtoplayer(player);
                self.var_9574d80eb717270a[idx] showtoplayer(player);
            }
        }
    }
    if (isdefined(array) && array.size >= 1 && isnumber(array[0])) {
        foreach (player in level.infilstruct.players) {
            if (isdefined(player)) {
                player setclientdvar(@"hash_df1dc712c4a91588", array[0]);
                player setclientdvar(@"hash_71c6c0b8428e44a7", 1);
            }
        }
    }
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b27
// Size: 0x84
function function_6b9d9dca95e84a2a() {
    var_2a5e082b65f82a5c = getdvarint(@"hash_7f1da0c3501cbdf2", 1);
    if (var_2a5e082b65f82a5c) {
        self function_451319f93d30ebe5(%"hash_34c59bed7392d266");
        self function_451319f93d30ebe5(%"hash_6672d428dc04ad44");
    }
    self setclientomnvar("ui_br_infil_exfil_player_focus", 1);
    function_a408e30ca85e03a9(level.players, "mp_jup_br_infil", 0.5);
    function_c79f9300ee85f805(level.players, "mute_ambience_elements_emitters", 0.5);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bb2
// Size: 0x149
function function_f22cb9522711b2ea(array) {
    function_f3ae4b41df047ba0(array);
    var_2a5e082b65f82a5c = getdvarint(@"hash_7f1da0c3501cbdf2", 1);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (var_2a5e082b65f82a5c) {
            player function_451319f93d30ebe5(%"hash_34c59bed7392d266");
            player function_451319f93d30ebe5(%"hash_6672d428dc04ad44");
        }
    }
    namespace_81156089ff1fe819::function_42f1462f1d4193af("infil_light");
    function_6199c35f4cf4524c(&function_6b9d9dca95e84a2a);
    br_infil_intro = function_17ee301cf0b5ba85("br_infil_intro");
    br_infil_intro_classic = function_17ee301cf0b5ba85("br_infil_intro_classic");
    function_fe75a89529dd0fd0(level.infilstruct.players, br_infil_intro, undefined, undefined, br_infil_intro_classic);
    function_a408e30ca85e03a9(level.players, "mp_jup_br_infil", 1);
    function_c79f9300ee85f805(level.players, "mute_ambience_elements_emitters", 1);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d02
// Size: 0x14
function function_53532f9526762349(array) {
    function_f3ae4b41df047ba0(array);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d1d
// Size: 0x14
function function_6fde71a53407e890(array) {
    function_f3ae4b41df047ba0(array);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d38
// Size: 0x14
function function_1f317f1b65bfeeff(array) {
    function_f3ae4b41df047ba0(array);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d53
// Size: 0x14
function function_244ef8d9a1722b66(array) {
    function_f3ae4b41df047ba0(array);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d6e
// Size: 0x61
function function_11047ac53c2edeb5(array) {
    function_f3ae4b41df047ba0(array);
    delaythread(1.5, &function_c79f9300ee85f805, level.players, "mute_music", 8);
    delaythread(2.6, &function_7acde5feb50c98f2, level.infilstruct.players, "scn_jup_br_infil_c17_takeoff_spinup_lssrss");
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dd6
// Size: 0xd9
function function_c64b1669d5b0a83c(array) {
    function_f3ae4b41df047ba0(array);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player setclientomnvar("ui_br_infil_exfil_player_focus", 1);
    }
    delaythread(2.9, &function_7acde5feb50c98f2, level.infilstruct.players, "scn_jup_br_infil_c17_takeoff_main_lr");
    function_326e5ed05234a4f0(level.players, 5);
    function_4e8ba327eb12540c(level.players, "mute_ambience_elements_emitters", 5);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eb6
// Size: 0x14
function function_2c74c22f4a5738b(array) {
    function_f3ae4b41df047ba0(array);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ed1
// Size: 0x14
function function_83c85bdfccb862b2(array) {
    function_f3ae4b41df047ba0(array);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eec
// Size: 0x5d
function function_84e4d632067a8529() {
    var_8cfe7cedc00ff8d3 = getdvarfloat(@"hash_224074cc9cbd34e3", 1);
    self visionsetnakedforplayer("", var_8cfe7cedc00ff8d3);
    var_2a5e082b65f82a5c = getdvarint(@"hash_7f1da0c3501cbdf2", 1);
    if (var_2a5e082b65f82a5c) {
        self function_df8fad503896462(%"hash_34c59bed7392d266");
    }
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f50
// Size: 0xf2
function function_1362f28ff2863ca() {
    delayseconds = getdvarfloat(@"hash_ef579438c4248057", 3.75);
    var_8cfe7cedc00ff8d3 = getdvarfloat(@"hash_224074cc9cbd34e3", 1);
    if (delayseconds > 0) {
        wait(delayseconds);
    }
    var_2a5e082b65f82a5c = getdvarint(@"hash_7f1da0c3501cbdf2", 1);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player visionsetnakedforplayer("", var_8cfe7cedc00ff8d3);
        if (var_2a5e082b65f82a5c) {
            player function_df8fad503896462(%"hash_34c59bed7392d266");
        }
    }
    function_6199c35f4cf4524c(&function_84e4d632067a8529);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8049
// Size: 0x85
function function_df58740c11de1e44() {
    var_17d62d898336a400 = [0:"dx_br_jpbm_infl_grav_tkoa", 1:"dx_br_jpbm_infl_grav_tkob", 2:"dx_br_jpbm_infl_grav_tkoc"];
    var_1a5da463b37dc379 = [0:18, 1:15, 2:28];
    choice = randomint(var_17d62d898336a400.size);
    wait(var_1a5da463b37dc379[choice] * level.framedurationseconds);
    function_7acde5feb50c98f2(level.infilstruct.players, var_17d62d898336a400[choice]);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80d5
// Size: 0x129
function function_9701a6ee79db05cd() {
    var_bd25ff1a5c5bdb9c = 1;
    var_d57cae2c24552936 = 1;
    var_d5a7b6bed377d4ce = 1.25;
    var_930f9bb4bc01c989 = getanimlength(level.var_1a209bd995a7fa83["wz_br_jup_infil_sh100_gprop"]);
    var_71c61f76b6381d1c = max(0.05, var_930f9bb4bc01c989 - var_bd25ff1a5c5bdb9c);
    var_e5e91bf1cc6084ad = var_71c61f76b6381d1c + var_d57cae2c24552936 + var_d5a7b6bed377d4ce;
    function_a408e30ca85e03a9(level.players, "br_c17_infil_ext", var_e5e91bf1cc6084ad + 3);
    function_c79f9300ee85f805(level.players, "mute_ambience_elements_emitters", var_e5e91bf1cc6084ad + 3);
    wait(var_71c61f76b6381d1c);
    function_ea856ec0b3c4cfc6(0.9, level.infilstruct.players, "hq_transition");
    wait(var_d57cae2c24552936);
    teleportToMovingPlane();
    thread function_1362f28ff2863ca();
    wait(var_d5a7b6bed377d4ce);
    function_7f3ad8fe6df1b8fe(1, level.infilstruct.players, "hq_transition");
    function_c79f9300ee85f805(level.players, "jup_br_infil_igc", 1);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8205
// Size: 0x4d
function function_12e8683b52f21db4(array) {
    function_f3ae4b41df047ba0(array);
    thread function_9701a6ee79db05cd();
    thread function_df58740c11de1e44();
    delaythread(2.8, &function_7acde5feb50c98f2, level.infilstruct.players, "scn_jup_br_infil_c17_transition_lr");
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8259
// Size: 0x37b
function function_6f33464b9145231b(array) {
    function_f3ae4b41df047ba0(array);
    self.var_2668fb5d52d6438d[0] unlink();
    self.var_2668fb5d52d6438d[1] unlink();
    self.var_2668fb5d52d6438d[2] unlink();
    self.var_2668fb5d52d6438d[0] hide();
    self.var_2668fb5d52d6438d[1] hide();
    self.var_2668fb5d52d6438d[2] hide();
    self.var_7e40e03490016ab1[0] unlink();
    self.var_7e40e03490016ab1[1] unlink();
    self.var_7e40e03490016ab1[2] unlink();
    self.var_7e40e03490016ab1[3] unlink();
    self.var_7e40e03490016ab1[0] hide();
    self.var_7e40e03490016ab1[1] hide();
    self.var_7e40e03490016ab1[2] hide();
    self.var_7e40e03490016ab1[3] hide();
    self.var_9574d80eb717270a[0] unlink();
    self.var_9574d80eb717270a[1] unlink();
    self.var_9574d80eb717270a[2] unlink();
    self.var_9574d80eb717270a[3] unlink();
    self.var_9574d80eb717270a[0] hide();
    self.var_9574d80eb717270a[1] hide();
    self.var_9574d80eb717270a[2] hide();
    self.var_9574d80eb717270a[3] hide();
    self.props[0] unlink();
    self.props[1] unlink();
    self.props[2] unlink();
    self.props[3] unlink();
    self.props[4] unlink();
    self.props[5] unlink();
    self.props[6] unlink();
    self.props[0] hide();
    self.props[1] hide();
    self.props[2] hide();
    self.props[3] hide();
    self.props[4] hide();
    self.props[5] hide();
    self.props[6] hide();
    self.var_b50860e78d9e1e5[0] linkto(self.var_e73ce295ae9d4104, "j_prop_2", (0, 0, 0), (0, 0, 0));
    self.var_b50860e78d9e1e5[1] linkto(self.var_e73ce295ae9d4104, "j_prop_3", (0, 0, 0), (0, 0, 0));
    self.var_b50860e78d9e1e5[2] linkto(self.var_e73ce295ae9d4104, "j_prop_4", (0, 0, 0), (0, 0, 0));
    self.var_b50860e78d9e1e5[3] linkto(self.var_e73ce295ae9d4104, "j_prop_5", (0, 0, 0), (0, 0, 0));
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85db
// Size: 0x25
function function_8f7e8b26075a5371() {
    self.manualoverridewindmaterial = undefined;
    setwind("1");
    self setallstreamloaddist(0);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8607
// Size: 0x150
function teleportToMovingPlane() {
    self.movingc130 setscriptablepartstate("running_lights", "on");
    namespace_81156089ff1fe819::function_2bbe7f3e487520c6();
    setomnvar("ui_hide_player_icons", 0);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player setallstreamloaddist(0);
        player clearpredictedstreampos();
        player setclientomnvar("ui_br_infil_chyron_change", 1);
    }
    if (isdefined(self.movingc130)) {
        self.var_e73ce295ae9d4104 unlink();
        self.var_e73ce295ae9d4104 linkto(self.movingc130, "tag_body_animate", (0, 0, 0), (0, 0, 0));
        if (!istrue(level.infilstruct.var_df94e780c2b3c994) || function_8663da4077fa7e20()) {
            self.movingc130 notify("start_moving");
        }
    }
    level notify("teleportToMovingPlane");
    thread function_708e8449a90a636f();
    function_6199c35f4cf4524c(&function_8f7e8b26075a5371);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x875e
// Size: 0x10
function function_708e8449a90a636f() {
    wait(0.1);
    function_16f307c48e420065();
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8775
// Size: 0x1c
function function_16f307c48e420065() {
    self.movingc130 setscriptablepartstate("int_lights_green_all", "on");
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8798
// Size: 0x20b
function function_ad4a7a73c7d7d9e0() {
    self clearclienttriggeraudiozone(3);
    var_522a77434d41564a = self getplayerangles(1);
    playerforward = anglestoforward(var_522a77434d41564a);
    var_4b52f031a2cbef8e = anglestoforward(level.infilstruct.c130.angles);
    var_d8bb89f41ae3d919 = anglestoright(level.infilstruct.c130.angles);
    var_172d42d175e16c61 = vectordot(playerforward, var_4b52f031a2cbef8e);
    var_ed451f0ea36c48c6 = vectordot(playerforward, var_d8bb89f41ae3d919);
    if (!isdefined(self.infilanimindex)) {
        self.infilanimindex = 1;
    }
    var_8e3afd40d3c95b46 = "j_prop_" + self.infilanimindex + 1;
    cos45 = cos(45);
    if (var_172d42d175e16c61 < -1 * cos45) {
        return [0:"wz_infil_gprop_standard_sh010", 1:level.var_1a209bd995a7fa83["wz_infil_gprop_standard_sh010"], 2:"wz_infil_standardforward_jump_sh010", 3:var_8e3afd40d3c95b46];
    }
    if (var_ed451f0ea36c48c6 > cos45) {
        return [0:"wz_infil_gprop_l90_sh010", 1:level.var_1a209bd995a7fa83["wz_infil_gprop_l90_sh010"], 2:"wz_infil_l90_jump_sh010", 3:var_8e3afd40d3c95b46];
    } else if (var_ed451f0ea36c48c6 < -1 * cos45) {
        return [0:"wz_infil_gprop_r90_sh010", 1:level.var_1a209bd995a7fa83["wz_infil_gprop_r90_sh010"], 2:"wz_infil_r90_jump_sh010", 3:var_8e3afd40d3c95b46];
    } else if (var_ed451f0ea36c48c6 > 0) {
        return [0:"wz_infil_gprop_l180_sh010", 1:level.var_1a209bd995a7fa83["wz_infil_gprop_l180_sh010"], 2:"wz_infil_l180_jump_sh010", 3:var_8e3afd40d3c95b46];
    } else {
        return [0:"wz_infil_gprop_r180_sh010", 1:level.var_1a209bd995a7fa83["wz_infil_gprop_r180_sh010"], 2:"wz_infil_r180_jump_sh010", 3:var_8e3afd40d3c95b46];
    }
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89aa
// Size: 0x3c
function function_d99d934d14e73d() {
    self endon("disconnect");
    wait(5);
    var_2a5e082b65f82a5c = getdvarint(@"hash_7f1da0c3501cbdf2", 1);
    if (var_2a5e082b65f82a5c) {
        self function_df8fad503896462(%"hash_6672d428dc04ad44");
    }
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89ed
// Size: 0x40
function function_8d5c19a9b693e913() {
    thread function_d99d934d14e73d();
    if (getdvarint(@"hash_549df6ab370a2bc4", 1)) {
        self lerpfovscalefactor(0, 0);
        self setclientdvar(@"hash_71c6c0b8428e44a7", 0);
    }
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a34
// Size: 0x86
function function_dc0bc83a31193177() {
    self endon("disconnect");
    self lerpfov(65, 0.5);
    if (getdvarint(@"hash_549df6ab370a2bc4", 1)) {
        self lerpfovscalefactor(1, 0.5);
    }
    wait(1);
    if (isdefined(self.var_1f0a019572c9f8e2)) {
        self.var_1f0a019572c9f8e2 = undefined;
        self disablephysicaldepthoffieldscripting();
    }
    self setclientdvar(@"hash_df1dc712c4a91588", 65);
    self setclientdvar(@"hash_71c6c0b8428e44a7", 0);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ac1
// Size: 0x22
function private function_cd7e1a37d5e2ca2b() {
    level.nosuspensemusic = 1;
    thread namespace_3bde6869e44a2770::stopsuspensemusic();
    function_f1aed36ab4598ea("mp_gamemode_br_infils_jup");
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8aea
// Size: 0xc
function private function_26874fd7694aa29() {
    level thread function_8d050f78fe1d180f();
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8afd
// Size: 0x96
function private function_8d050f78fe1d180f() {
    function_4e8ba327eb12540c(level.players, "jup_br_infil_igc", 2.5);
    function_4e8ba327eb12540c(level.players, "mute_ambience_elements_emitters", 3);
    function_a408e30ca85e03a9(level.players, "mp_jup_br_infil_exfil_null", 3);
    function_6f9b54cea87f1c9e();
    function_4e8ba327eb12540c(level.players, "mute_music", 8, 0.683772);
    wait(2.5);
    function_c79f9300ee85f805(level.players, "mp_br_lobby_fade", 0);
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b9a
// Size: 0x1d
function function_f48f4d028a11be8f() {
    function_e66f664ad726f2e();
    function_f4e0ff5cb899686d("mp_gamemode_br_infils_jup");
    namespace_56a3588493afc984::cleanupents();
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bbe
// Size: 0x5b
function function_52bedae2ced8e191() {
    var_a910600eadf5e31c = level._effect["vfx_br_ac130_clouds"];
    var_8b26de022a9f35f = level._effect["vfx_br_ac130_oneshot"];
    if (isdefined(var_a910600eadf5e31c)) {
        stopfxontag(var_a910600eadf5e31c, self, "tag_body");
    }
    if (isdefined(var_8b26de022a9f35f)) {
        stopfxontag(var_8b26de022a9f35f, self, "tag_body");
    }
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8c20
// Size: 0xb3
function private function_cc1b64e82fd4680c(players) {
    /#
        assertex(isarray(players));
    #/
    teams = [];
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(teams[player.team])) {
            teams[player.team] = [];
        }
        teams[player.team][teams[player.team].size] = player;
    }
    return teams;
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8cdb
// Size: 0xc3
function private leaderdialog(var_d653377138d5eff2) {
    if (!getdvarint(@"hash_bfded00ac93c45b7", 1)) {
        return;
    }
    var_1499e7c2d69e0074 = 2;
    if (soundexists(var_d653377138d5eff2)) {
        var_1499e7c2d69e0074 = lookupsoundlength(var_d653377138d5eff2, 1) / 1000;
    }
    var_cb3339ece72dbdeb = game["dialog"][var_d653377138d5eff2];
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player queuedialogforplayer(var_cb3339ece72dbdeb, var_d653377138d5eff2, var_1499e7c2d69e0074);
    }
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8da5
// Size: 0x54
function private function_66b13900c5013de5(var_c26fc18bda607b7) {
    body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(var_c26fc18bda607b7);
    head = namespace_465d40bb08a5337a::function_223061772e2a61b9(var_c26fc18bda607b7);
    if (body == "" || head == "") {
        return;
    }
    self function_dd6d30b9ec87c1b3(body, head, "iw9_avatar_scriptable_mp");
}

// Namespace namespace_5954a99719111147/namespace_8229c5f55435b3e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e00
// Size: 0x1b
function function_8cb390c64468017() {
    self setallstreamloaddist(getdvarint(@"hash_2f896ce49cf13d0c", 7500));
}
