// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_112ce5394d514e2f;
#using scripts\mp\gametypes\br.gsc;
#using script_14183df6f9af8737;
#using script_7ab5b649fa408138;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_62c595d55b88b26;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_21cccabf14b4dbe6;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\utility\omnvar_utility.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_38eb8f4be20d54f4;
#using scripts\mp\utility\player.gsc;

#namespace namespace_c2faa6c942574440;

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1476
// Size: 0x18
function main() {
    level.var_cdc15ee14362fbf = &namespace_3269a6faf5094cf5::init;
    namespace_d20f8ef223912e12::main();
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1495
// Size: 0x3
function function_f0245d1b6a36ef77() {
    
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x149f
// Size: 0x3
function function_5d6ed45785284123() {
    
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14a9
// Size: 0xdf
function init() {
    level thread namespace_6176022cc9d5b3f::function_7269c88a927e7937();
    level thread namespace_6176022cc9d5b3f::function_d7a7aa9ee1cc1071();
    level thread function_a5644ef903874738();
    level thread function_34b491f2bdf6da40();
    level thread function_b54de60f1c39483c();
    level thread function_7deac72bb9770203();
    level thread function_56d4fa60c084b45b();
    level thread function_f0245d1b6a36ef77();
    level thread function_9e9b01992f22aaf9();
    level thread function_fde30cebcacdb61e();
    thread namespace_e688cd9db0404268::function_f1aed36ab4598ea("mp_gamemode_lockdown");
    function_5d6ed45785284123();
    level.validautoassignquests = [];
    level.validautoassignquests[0] = "assassination";
    level.validautoassignquests[1] = "domination";
    level.validautoassignquests[2] = "scavenger";
    function_920c1da6479ae205();
    function_56240586d0ae0b1d();
    function_de45f3ba013d803c();
    function_9017ffcfbfb5d51c();
    function_c453d69202cbfb0f();
    /#
        level thread debug_init();
    #/
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x158f
// Size: 0x6a
function function_a5644ef903874738() {
    level endon("game_ended");
    namespace_71073fa38f11492::disablefeature("gulag");
    namespace_71073fa38f11492::disablefeature("drogBagLoadout");
    namespace_71073fa38f11492::disablefeature("dropBagLoop");
    namespace_71073fa38f11492::disablefeature("randomizeCircleCenter");
    namespace_71073fa38f11492::enablefeature("planeUseCircleRadius");
    namespace_71073fa38f11492::disablefeature("registerReviveCount");
    namespace_71073fa38f11492::enablefeature("gasVehicleSpawns");
    namespace_71073fa38f11492::disablefeature("vehiclesGasDamage");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1600
// Size: 0xc3
function function_34b491f2bdf6da40() {
    level endon("game_ended");
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&function_b96f59f29d1c4398);
    namespace_71073fa38f11492::registerbrgametypefunc("playerWelcomeSplashes", &function_e6b67d05f77313f);
    namespace_71073fa38f11492::registerbrgametypefunc("createMultiCircleObjectivesStruct", &function_94e64fe4713eff4b);
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("onPlayerKilled");
    namespace_71073fa38f11492::registerbrgametypefunc("onPlayerConnect", &function_28161557d00acfad);
    namespace_71073fa38f11492::registerbrgametypefunc("getGametypeTeamPlacement", &function_2aee645e0c39abd4);
    namespace_71073fa38f11492::registerbrgametypefunc("onPlayerEnterVehicle", &function_9aaed3ab745b2a1a);
    namespace_3c37cb17ade254d::registersharedfunc("zonecontrol", "packClientMatchData", &function_8ecdb9663cb000ac);
    namespace_71073fa38f11492::registerbrgametypefunc("playerGetRespawnPoint", &function_5c969a7697e1a7cd);
    namespace_71073fa38f11492::registerbrgametypefunc("dontConsiderAFK", &function_4e923934e9e9ffe7);
    level waittill("prematch_done");
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&function_5b8cd2b216a2086f);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16ca
// Size: 0x45
function function_b54de60f1c39483c() {
    level endon("game_ended");
    waittillframeend();
    function_26a43a730cdcccad();
    level waittill("prematch_done");
    function_f7fa8a135bb71bf1();
    function_56355c272f045e8c();
    function_17dafc2a055018cd();
    function_8e6d11416198da98();
    thread function_96d5ec7cfb96ba1e();
    function_5fd5d5232392f8e3();
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1716
// Size: 0x14
function function_26a43a730cdcccad() {
    namespace_36f464722d326bbe::removematchingents_bykey("delete_on_load", "targetname");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1731
// Size: 0x263
function function_7deac72bb9770203() {
    level endon("game_ended");
    waitframe();
    waittillframeend();
    game["dialog"]["match_start"] = "zncn_grav_name";
    game["dialog"]["offense_obj"] = "zncn_grav_boos";
    game["dialog"]["objective_desc"] = "zncn_grav_objt";
    game["dialog"]["zone_activation"] = "zncn_grav_nlck";
    game["dialog"]["zone_deactivation"] = "zncn_grav_clsd";
    game["dialog"]["halfway_leaders"] = "zncn_grav_hlff";
    game["dialog"]["halfway_others"] = "zncn_grav_hlfn";
    game["dialog"]["lead_first"] = "zncn_grav_ldfr";
    game["dialog"]["lead_marked"] = "zncn_grav_ldmr";
    game["dialog"]["lead_taking"] = "zncn_grav_ldtk";
    game["dialog"]["lead_lost"] = "zncn_grav_ldls";
    game["dialog"]["zone_secured"] = "zncn_grav_secr";
    game["dialog"]["zone_contested"] = "zncn_grav_ctvc";
    game["dialog"]["attacking_zone"] = "zncn_grav_ttck";
    game["dialog"]["activation_anticipation"] = "zncn_grav_t15n";
    game["dialog"]["deactivation_anticipation"] = "zncn_grav_tr15";
    game["dialog"]["play_objective"] = "zncn_grav_hint";
    game["dialog"]["overtime_start"] = "zncn_grav_vrtm";
    game["dialog"]["victory_close_leaders"] = "zncn_grav_vccf";
    game["dialog"]["victory_close_others"] = "zncn_grav_vccn";
    game["dialog"]["high_value_zone"] = "zncn_grav_trhv";
    game["dialog"]["match_end_soon"] = "zncn_grav_tmnd";
    game["dialog"]["squadmate_left"] = "zncn_grav_scdj";
    game["dialog"]["resurgence_on_player_disconnect"] = "";
    for (i = 0; i < level.brgametype.var_e8b86399cbd6a85e; i++) {
        letter = level.brgametype.letters[i];
        game["dialog"]["attacking_" + letter] = "zone_wzan_atk" + letter;
        game["dialog"][letter + "_contested"] = "zone_wzan_act" + letter;
        game["dialog"][letter + "_secured"] = "zone_wzan_sec" + letter;
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x199b
// Size: 0xa
function function_56d4fa60c084b45b() {
    level endon("game_ended");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19ac
// Size: 0xe0
function function_9e9b01992f22aaf9() {
    level endon("game_ended");
    level waittill("br_ready_to_jump");
    foreach (team in level.teamnamelist) {
        foreach (player in getteamdata(team, "players")) {
            player.radarmode = "slow_radar";
            player.skipuavupdate = 1;
        }
        setteamradar(team, 1);
        setteamradarstrength(team, 1);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a93
// Size: 0x9ce
function function_920c1da6479ae205() {
    level.brgametype.var_b184ddad2bcf6f49 = undefined;
    level.brgametype.var_ff62fbb921ae39bd = [];
    level.brgametype.var_6eef49fde768c24f = [];
    level.brgametype.var_8c60f1a7127109cf = 0;
    level.brgametype.var_b357705d6f9b3080 = getdvarint(@"hash_afe0ad16235c6390", 1);
    level.brgametype.var_6f677ae3468374bd = getdvarint(@"hash_fcc9fa7343b1ec14", 2);
    level.brgametype.var_bbce590c8e68f35b = getdvarint(@"hash_17b773757887a5f7", 25);
    level.brgametype.var_72a3808f03841546 = getdvarint(@"hash_2ca9cc987f401338", 650);
    level.brgametype.var_9fc633a4965b8851 = getdvarint(@"hash_4fc8a88f29991f0e", 15);
    level.brgametype.var_63f2dd4c20977582 = getdvarint(@"hash_f5045541bf7360a4", 1);
    level.brgametype.var_ef80665d53789d98 = getdvarint(@"hash_bc36b3edfdb08b10", 0);
    level.brgametype.var_a44df2a0823c0ace = getdvarint(@"hash_4176d6f6daf037f9", 0);
    level.brgametype.var_16118949d71fbb2f = getdvarint(@"hash_26aaa30a80c7fada", 2);
    level.brgametype.var_e9a4c3df54d13fd1 = getdvarint(@"hash_e6c9afdc35422cbc", 1);
    level.brgametype.var_d4a62f500784ad3b = getdvarint(@"hash_188c3454482783fd", 2);
    level.brgametype.var_30a69220cb03bba6 = function_6d83e1aad1b29028();
    level.brgametype.var_6e933ab788bf25e7 = getdvarint(@"hash_f329fb2ae3f22094", 1);
    level.brgametype.var_f5ca6a058f95e438 = getdvarint(@"hash_4f01d0b6c438cdfd", 7);
    level.brgametype.var_b4410fa3070bdb2f = getdvarint(@"hash_a0571b5581aac4ba", 5);
    level.brgametype.var_faf946460fcee87b = getdvarint(@"hash_82cae3f17c2975c5", 1);
    level.brgametype.var_416febdc38ed88be = getdvarint(@"hash_8564fd301e5235d6", 1);
    level.brgametype.var_a4153ae6bcb25fc3 = getdvarint(@"hash_bf61c823beacd1cb", 5);
    level.brgametype.var_a5fc9e22f4382909 = getdvarint(@"hash_22339f5888777d4d", 3);
    level.brgametype.var_8253cd4c8354424e = getdvarint(@"hash_3bf26249a54616b0", 2);
    level.brgametype.var_bd5d2a7a94c784ab = getdvarint(@"hash_fcd0a0fda2f77856", 0);
    level.brgametype.var_adafbaf3c7e24ad3 = function_2bf47d0bc2323f05();
    level.brgametype.var_b4a42a0051f3fed8 = getdvarint(@"hash_df248738e4894bf1", 30);
    level.brgametype.var_9fdb99442028fca4 = function_ea308097cbf28bf6();
    level.brgametype.var_6bf149b60da04f9b = level.brgametype.var_9fdb99442028fca4.size;
    level.brgametype.var_bd12e1c552278ad6 = function_2689681546ac00b4();
    level.brgametype.var_a0712831ec60ee71 = function_6bd66c998921855f();
    level.brgametype.var_7253b43ef30f88b9 = function_d426d35c0f2be953();
    level.brgametype.var_b458560354506894 = getdvarfloat(@"hash_ad4cb735a53a2f47", 6.75);
    level.brgametype.var_77134f0ddb570883 = getdvarfloat(@"hash_8b1077145e2c139", 15);
    level.brgametype.var_e97cd8f39e602a98 = getdvarfloat(@"hash_bd2ad1874ddb4fe6", 4000);
    var_ac9754e38f924b5 = getdvarint(@"hash_47f6fb1896633385", 1);
    if (istrue(var_ac9754e38f924b5)) {
        level.brgametype.var_8f7905b05ba12df4 = spawnstruct();
        level.brgametype.var_8f7905b05ba12df4.count = getdvarint(@"hash_f634c09ac19a0e83", 1);
        level.brgametype.var_8f7905b05ba12df4.duration = getdvarint(@"hash_755bbd8ba2793561", 60);
        level.brgametype.var_8f7905b05ba12df4.var_12926948d93c7ed0 = function_d029c67042b833ef();
    }
    level.brgametype.var_9b3e632a26358302 = getdvarint(@"hash_1d341d3600365498", 15);
    level.brgametype.var_13d640cee5df4ac3 = getdvarint(@"hash_7f61d5bfd6814ded", 5);
    level.brgametype.var_4a459e59b4b10244 = function_4f773961bb78fb7e();
    level.brgametype.var_80e82584c694b4a = level.brgametype.var_4a459e59b4b10244[0];
    level.brgametype.var_293dc429f3a19dfd = function_b3e0554cf34d5cf7(level.brgametype.var_80e82584c694b4a);
    level.brgametype.var_7bab81a92b4be919 = function_242319fc7747107f();
    level.brgametype.var_719c030c6596b6a5 = getdvarint(@"hash_19cd3aa47e9a9ef5", 0);
    level.brgametype.var_58b474cb0e57096a = [];
    level.brgametype.clusters = [];
    level.brgametype.letters = [0:"a", 1:"b", 2:"c", 3:"d", 4:"e", 5:"f", 6:"g", 7:"h"];
    level.brgametype.var_6b04289a49cae84d = getdvarint(@"hash_39e5a4f1ba733c1f", 0);
    level.brgametype.var_a7bd67e2c17c3dc1 = getdvarint(@"hash_a49776597b308f58", 10000);
    level.brgametype.var_36875a3df3ae81f0 = getdvarint(@"hash_ea138b5dad20e381", 7000);
    level.brgametype.var_d993bf69b9541cbf = getdvarint(@"hash_cb5d885251e81b6a", 4000);
    level.brgametype.var_efbaad993a315482 = getdvarint(@"hash_1bc38baa909b90ef", 6000);
    level.brgametype.var_36a5c1335a8ff080 = getdvarint(@"hash_19fda6a24870c61d", 2000);
    level.brgametype.var_78c2d7d97f7e9215 = getdvarint(@"hash_c0f82f769f124250", 1500);
    level.brgametype.var_a814399cc303b418 = getdvarint(@"hash_48afc9df42c9888e", 0);
    level.brgametype.var_e75711d488aad5c9 = getdvarfloat(@"hash_7efda168670cbd76", 2);
    level.brgametype.var_88a254227da87c7f = [];
    level.brgametype.var_af41098889966ee1 = function_67b4cff7142dd6bb();
    level.brgametype.var_bb9b77186cb79ae6 = 1;
    level.brgametype.var_4a8a68afccfa6692 = "zc_resurgence_respawn";
    level.brgametype.var_748a99415228de0e = "splash_list_iw9_br_zonecontrol";
    setdvar(@"hash_da4f64f6eb4d97da", 3);
    level.brgametype.var_65c42f3ac6958818 = function_cc65ff69b7798d8a();
    level.brgametype.var_2d08e0f710460f75 = function_4b142266db88b16f();
    level.brgametype.var_9429aeba8918c5ca = getdvarint(@"hash_99b1db027dff38c6", 60);
    level.brgametype.var_d35c2d99f63cec4a = getdvarint(@"hash_1455d87aedbbb31a", 30);
    level.brgametype.var_f983a9d28a83a074 = getdvarint(@"hash_8365ae49880f4b66", 60);
    level.brgametype.var_8ea33e944d74f0cf = getdvarint(@"hash_a42a89c01b404460", 1);
    level.brgametype.var_d6f1cdc1f64d318e = getdvarint(@"hash_724ed04aa79193f3", 1);
    level.brgametype.var_ccaf7dcc548b6df3 = getdvarint(@"hash_cbef5b58a4b634c4", 30);
    level.brgametype.var_c435bc516c8091ca = 1;
    level.brgametype.var_be0c10911fec189f = 1;
    level.brgametype.var_98ade9e8627af484 = 1;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2468
// Size: 0x624
function function_fde30cebcacdb61e() {
    waitframe();
    level.var_bcf7be5c24905ab9 = [];
    level.var_5477e9d7bbf824bf = [];
    params = spawnstruct();
    params.var_c0e23eeb5d47ec83 = &namespace_ab7fb53f62c7ae2e::function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &namespace_ab7fb53f62c7ae2e::function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &namespace_ab7fb53f62c7ae2e::function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"score"];
    params.floor = 1;
    params.maxvalue = 10000;
    params.scale = 0;
    namespace_ab7fb53f62c7ae2e::function_fa624b8c032afcf7("zc_mvp", params);
    params = spawnstruct();
    params.var_c0e23eeb5d47ec83 = &namespace_ab7fb53f62c7ae2e::function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &namespace_ab7fb53f62c7ae2e::function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &namespace_ab7fb53f62c7ae2e::function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"matchPoints"];
    params.floor = 1;
    params.maxvalue = 800;
    params.scale = 0;
    namespace_ab7fb53f62c7ae2e::function_fa624b8c032afcf7("zc_carrier", params);
    params = spawnstruct();
    params.var_c0e23eeb5d47ec83 = &namespace_ab7fb53f62c7ae2e::function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &namespace_ab7fb53f62c7ae2e::function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &namespace_ab7fb53f62c7ae2e::function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"longestScoreStreak"];
    params.floor = 1;
    params.maxvalue = 120;
    params.scale = 0;
    namespace_ab7fb53f62c7ae2e::function_fa624b8c032afcf7("zc_relentless", params);
    params = spawnstruct();
    params.var_c0e23eeb5d47ec83 = &namespace_ab7fb53f62c7ae2e::function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &namespace_ab7fb53f62c7ae2e::function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &namespace_ab7fb53f62c7ae2e::function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"deadSilenceKills", 1:"throwingKnifeKills", 2:"killstreakCUAVAssists", 3:"silencedKills"];
    params.floor = 1;
    params.maxvalue = 30;
    params.weight = 0.5;
    namespace_ab7fb53f62c7ae2e::function_1ef76151d5fb5218("ghost", "killstreakCUAVAssists", 0.5);
    namespace_ab7fb53f62c7ae2e::function_fa624b8c032afcf7("ghost", params);
    params = spawnstruct();
    params.var_c0e23eeb5d47ec83 = &namespace_ab7fb53f62c7ae2e::function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &namespace_ab7fb53f62c7ae2e::function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &namespace_ab7fb53f62c7ae2e::function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"kills"];
    params.floor = 1;
    params.maxvalue = 100;
    params.weight = 1;
    namespace_ab7fb53f62c7ae2e::function_fa624b8c032afcf7("killer", params);
    params = spawnstruct();
    params.var_c0e23eeb5d47ec83 = &namespace_ab7fb53f62c7ae2e::function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &namespace_ab7fb53f62c7ae2e::function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &namespace_ab7fb53f62c7ae2e::function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"munitionsBoxUsed", 1:"armorBoxUsed"];
    params.floor = 1;
    params.maxvalue = 10;
    params.weight = 1;
    namespace_ab7fb53f62c7ae2e::function_fa624b8c032afcf7("supplier", params);
    params = spawnstruct();
    params.var_c0e23eeb5d47ec83 = &namespace_ab7fb53f62c7ae2e::function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &namespace_ab7fb53f62c7ae2e::function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &namespace_ab7fb53f62c7ae2e::function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"rescues", 1:"kioskRevives"];
    params.floor = 1;
    params.maxvalue = 10;
    params.weight = 1;
    namespace_ab7fb53f62c7ae2e::function_fa624b8c032afcf7("medic", params);
    params = spawnstruct();
    params.var_c0e23eeb5d47ec83 = &namespace_ab7fb53f62c7ae2e::function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &namespace_ab7fb53f62c7ae2e::function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &namespace_ab7fb53f62c7ae2e::function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"damageHealed", 1:"gulagWins", 2:"rescued", 3:"revivedFromKiosk"];
    params.floor = 1;
    params.maxvalue = 20;
    params.weight = 0.5;
    namespace_ab7fb53f62c7ae2e::function_1ef76151d5fb5218("survivor", "damageHealed", 0.1);
    namespace_ab7fb53f62c7ae2e::function_fa624b8c032afcf7("survivor", params);
    params = spawnstruct();
    params.var_c0e23eeb5d47ec83 = &namespace_ab7fb53f62c7ae2e::function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &namespace_ab7fb53f62c7ae2e::function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &namespace_ab7fb53f62c7ae2e::function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"reconDroneMarks", 1:"killstreakUAVAssists", 2:"killstreakAUAVAssists", 3:"binocularMarks", 4:"snapshotHits", 5:"tacCamMarks"];
    params.floor = 5;
    params.maxvalue = 30;
    params.weight = 0.5;
    namespace_ab7fb53f62c7ae2e::function_fa624b8c032afcf7("scout", params);
    params = spawnstruct();
    params.var_c0e23eeb5d47ec83 = &namespace_ab7fb53f62c7ae2e::function_56c0ae4c11e6ecc3;
    params.var_fde59c56d8b89b3b = &namespace_ab7fb53f62c7ae2e::function_c8209fbd2f8c013;
    /#
        params.var_d6d8da4bfd3935ba = &namespace_ab7fb53f62c7ae2e::function_4fd5f112e483ad54;
    #/
    params.floor = 1;
    params.maxvalue = 30;
    params.weight = 0.5;
    namespace_ab7fb53f62c7ae2e::function_fa624b8c032afcf7("scavenger", params);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a93
// Size: 0x88
function function_2bf47d0bc2323f05() {
    var_bfd8abefb099a1e0 = strtok(getdvar(@"hash_7adcd307f6e7611b", "30 30 30 30"), " ");
    var_adafbaf3c7e24ad3 = [];
    foreach (var_220de96cf780522b in var_bfd8abefb099a1e0) {
        var_adafbaf3c7e24ad3[var_adafbaf3c7e24ad3.size] = int(var_220de96cf780522b);
    }
    return var_adafbaf3c7e24ad3;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b23
// Size: 0x88
function function_ea308097cbf28bf6() {
    var_b4011c42bdd8776b = strtok(getdvar(@"hash_e9aa6901b60a53f3", "120 120 120 120 120"), " ");
    var_9fdb99442028fca4 = [];
    foreach (var_e75bf341ce28d72a in var_b4011c42bdd8776b) {
        var_9fdb99442028fca4[var_9fdb99442028fca4.size] = int(var_e75bf341ce28d72a);
    }
    return var_9fdb99442028fca4;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bb3
// Size: 0xdd
function function_2689681546ac00b4() {
    var_bd12e1c552278ad6 = level.brgametype.var_b4a42a0051f3fed8;
    foreach (zoneduration in level.brgametype.var_9fdb99442028fca4) {
        var_bd12e1c552278ad6 = var_bd12e1c552278ad6 + zoneduration;
    }
    foreach (zoneactivationdelay in level.brgametype.var_adafbaf3c7e24ad3) {
        var_bd12e1c552278ad6 = var_bd12e1c552278ad6 + zoneactivationdelay;
    }
    return var_bd12e1c552278ad6;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c98
// Size: 0x2c
function function_6bd66c998921855f() {
    var_a0712831ec60ee71 = getdvar(@"hash_28904496acb0d67f", "");
    return strtok(var_a0712831ec60ee71, " ");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ccc
// Size: 0x2c
function function_d426d35c0f2be953() {
    var_7253b43ef30f88b9 = getdvar(@"hash_1d1df0335cc35ef3", "");
    return strtok(var_7253b43ef30f88b9, " ");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d00
// Size: 0x2c
function function_4f773961bb78fb7e() {
    var_7253b43ef30f88b9 = getdvar(@"hash_8b615c555c3f27bb", "1 2 3 4");
    return strtok(var_7253b43ef30f88b9, " ");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d34
// Size: 0x6c
function function_b3e0554cf34d5cf7(var_cbf035d71d332c29) {
    var_911edf512130ce9d = function_f60524c89fc95284(var_cbf035d71d332c29);
    var_9364e710471507de = [];
    if (var_911edf512130ce9d != "") {
        var_fbf0061b9920c119 = strtok(var_911edf512130ce9d, " ");
        var_9364e710471507de["1"] = int(var_fbf0061b9920c119[0]);
        var_9364e710471507de["2"] = int(var_fbf0061b9920c119[1]);
    }
    return var_9364e710471507de;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2da8
// Size: 0xb0
function function_f60524c89fc95284(var_cbf035d71d332c29) {
    switch (var_cbf035d71d332c29) {
    case #"hash_31100fbc01bd387c":
        return getdvar(@"hash_ae72da6dcd955cfe", "7 0");
    case #"hash_311012bc01bd3d35":
        return getdvar(@"hash_9f0581a85c59b0bb", "7 0");
    case #"hash_311011bc01bd3ba2":
        return getdvar(@"hash_d1c9ba0b2e2638f4", "6 0");
    case #"hash_31100cbc01bd33c3":
        return getdvar(@"hash_692ab13e0fa3def9", "6 0");
    default:
        /#
            assert("Invalid pacing argument");
        #/
        return;
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e5f
// Size: 0x58
function function_242319fc7747107f() {
    var_7bab81a92b4be919 = [];
    var_7bab81a92b4be919["1"] = function_7b354cbff410c6b8("1", 1, 2000, 0, "2");
    var_7bab81a92b4be919["2"] = function_7b354cbff410c6b8("2", 2, 5000, var_7bab81a92b4be919["1"].milestone, undefined);
    return var_7bab81a92b4be919;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2ebf
// Size: 0xb5
function function_7b354cbff410c6b8(name, multiplier, milestone, basescore, var_51bb8ba0dd6cab42) {
    var_bcc2e271115b13f0 = spawnstruct();
    var_bcc2e271115b13f0.name = name;
    if (isdefined(multiplier)) {
        var_bcc2e271115b13f0.multiplier = getdvarint(function_2ef675c13ca1c4af(@"hash_811ddd31fed8791a", name), multiplier);
    }
    if (isdefined(milestone)) {
        var_bcc2e271115b13f0.milestone = getdvarint(function_2ef675c13ca1c4af(@"hash_1cc2ea23ebd79bed", name), milestone);
    }
    if (isdefined(basescore)) {
        var_bcc2e271115b13f0.basescore = basescore;
    }
    var_bcc2e271115b13f0.var_51bb8ba0dd6cab42 = var_51bb8ba0dd6cab42;
    return var_bcc2e271115b13f0;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f7c
// Size: 0x1f7
function function_56240586d0ae0b1d() {
    var_1852da5050d81f13 = getentitylessscriptablearray("zc_cluster", "targetname");
    /#
        assertex(var_1852da5050d81f13.size > 0, "No scriptable_zonecontrol_cluster has been detected.");
    #/
    level.brgametype.var_e8b86399cbd6a85e = 0;
    foreach (var_93bb5850a0334fd2 in var_1852da5050d81f13) {
        if (array_contains(level.brgametype.var_7253b43ef30f88b9, var_93bb5850a0334fd2.targetname)) {
            continue;
        }
        cluster = spawnstruct();
        cluster.var_f945c49af8ce3f75 = var_93bb5850a0334fd2 function_75d1f81d43231b87();
        /#
            assertex(cluster.var_f945c49af8ce3f75.size >= level.brgametype.var_8253cd4c8354424e, "Not enough neighbours for the queue size. Add neighbours to the cluster or reduce the queue size.");
        #/
        cluster.zones = var_93bb5850a0334fd2 function_fafd7a9de6e4ba1e();
        var_c54302bb1c559c77 = cluster.zones.size;
        /#
            assertex(var_c54302bb1c559c77 >= function_7876f532a72a3bb8(), "Not enough zones in the cluster for the maximum zones count. Add zones to the cluster or double check filtered out zones.");
        #/
        cluster.name = var_93bb5850a0334fd2.target;
        cluster.origin = function_93785e8e7a4bddb2(cluster.zones);
        level.brgametype.clusters[cluster.name] = cluster;
        level.brgametype.var_e8b86399cbd6a85e = max(level.brgametype.var_e8b86399cbd6a85e, var_c54302bb1c559c77);
    }
    /#
        assert(level.brgametype.var_e8b86399cbd6a85e <= level.brgametype.letters.size);
    #/
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x317a
// Size: 0x134
function function_7876f532a72a3bb8() {
    var_870cf4a260c81e7e = function_b3e0554cf34d5cf7("1");
    var_f19c896f971bf709 = function_b3e0554cf34d5cf7("2");
    var_38bf4f5715700774 = function_b3e0554cf34d5cf7("3");
    var_b217544591b3f217 = function_b3e0554cf34d5cf7("4");
    var_570e6f8cef795ac = [0:var_870cf4a260c81e7e, 1:var_f19c896f971bf709, 2:var_38bf4f5715700774, 3:var_b217544591b3f217];
    var_a863a1430c541394 = 0;
    foreach (var_ea667411b8861fd7 in var_570e6f8cef795ac) {
        var_d599276e2f395a29 = 0;
        foreach (var_88de8ff497ab3b5f in var_ea667411b8861fd7) {
            var_d599276e2f395a29 = var_d599276e2f395a29 + var_88de8ff497ab3b5f;
        }
        if (var_d599276e2f395a29 > var_a863a1430c541394) {
            var_a863a1430c541394 = var_d599276e2f395a29;
        }
    }
    return var_a863a1430c541394;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32b6
// Size: 0x1c0
function function_de45f3ba013d803c() {
    var_7b1e1e474e9570a7 = [];
    ids = getdvar(@"hash_30c480d6c4bc482d", "");
    if (ids != "") {
        clusters = strtok(ids, " ");
        index = 0;
        foreach (cluster in clusters) {
            if (isdefined(level.brgametype.clusters[cluster]) && index < level.brgametype.var_6bf149b60da04f9b) {
                level.brgametype.var_58b474cb0e57096a[level.brgametype.var_58b474cb0e57096a.size] = clusters[index];
            }
            index++;
        }
    }
    if (level.brgametype.var_58b474cb0e57096a.size <= 0) {
        level.brgametype.var_58b474cb0e57096a[0] = function_ebc874d697ca40fa(randomint(level.brgametype.clusters.size));
    }
    var_7b1e1e474e9570a7 = function_8db616127c1ce8a8(var_7b1e1e474e9570a7);
    while (level.brgametype.var_58b474cb0e57096a.size < level.brgametype.var_6bf149b60da04f9b) {
        level.brgametype.var_58b474cb0e57096a[level.brgametype.var_58b474cb0e57096a.size] = function_b27519f5f601aad1(var_7b1e1e474e9570a7);
        var_7b1e1e474e9570a7 = function_8db616127c1ce8a8(var_7b1e1e474e9570a7);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x347d
// Size: 0x92
function function_ebc874d697ca40fa(var_6f8ae5b48e171eac) {
    iteration = 0;
    foreach (cluster in level.brgametype.clusters) {
        if (iteration == var_6f8ae5b48e171eac) {
            return cluster.name;
        }
        iteration++;
    }
    /#
        assert("There is no cluster for this index");
    #/
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3516
// Size: 0x5b
function function_93785e8e7a4bddb2(zones) {
    origin = (0, 0, 0);
    if (zones.size == 0) {
        return origin;
    }
    for (i = 0; i < zones.size; i++) {
        origin = origin + zones[i].origin;
    }
    return origin / zones.size;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3579
// Size: 0x60
function function_8db616127c1ce8a8(var_7b1e1e474e9570a7) {
    var_7b1e1e474e9570a7[var_7b1e1e474e9570a7.size] = level.brgametype.var_58b474cb0e57096a[level.brgametype.var_58b474cb0e57096a.size - 1];
    if (var_7b1e1e474e9570a7.size > level.brgametype.var_8253cd4c8354424e) {
        var_7b1e1e474e9570a7 = array_remove_index(var_7b1e1e474e9570a7, 0);
    }
    return var_7b1e1e474e9570a7;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35e1
// Size: 0xa9
function function_b27519f5f601aad1(var_7b1e1e474e9570a7) {
    var_e08e0cc44f5af529 = level.brgametype.var_58b474cb0e57096a[level.brgametype.var_58b474cb0e57096a.size - 1];
    var_10a5085ada658e2b = level.brgametype.clusters[var_e08e0cc44f5af529].var_f945c49af8ce3f75;
    var_10a5085ada658e2b = array_remove_array(var_10a5085ada658e2b, var_7b1e1e474e9570a7);
    /#
        assertex(var_10a5085ada658e2b.size > 0, "No valid neighbours found");
    #/
    var_6780fd50a2d4bc5b = randomint(var_10a5085ada658e2b.size);
    nextqueueindex = var_10a5085ada658e2b[var_6780fd50a2d4bc5b];
    return nextqueueindex;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3692
// Size: 0x1e
function function_5b8cd2b216a2086f(player) {
    function_bbf92c043b4c87c6(player.team);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x36b7
// Size: 0x41
function function_28161557d00acfad(player) {
    player.matchPoints = 0;
    player.var_53e3af3b2c8752bd = 1;
    player.scorestreak = 0;
    player.longestScoreStreak = 0;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36ff
// Size: 0x62
function function_5129b71105a55fcf() {
    foreach (team in level.teamnamelist) {
        function_bbf92c043b4c87c6(team, 1);
        function_1300c157b617abd7(team);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3768
// Size: 0x17c
function function_bbf92c043b4c87c6(team, var_840011efd5b6414e) {
    if (level.brgametype.var_63f2dd4c20977582 == 0 || getteamcount(team) == 0) {
        return;
    }
    var_9052970ff4bce526 = [];
    if (istrue(level.brgametype.var_e9a4c3df54d13fd1)) {
        teamplayers = getteamdata(team, "players");
        teamplayers = array_removeundefined(teamplayers);
        if (teamplayers.size != 1) {
            return;
        }
        player = teamplayers[0];
        var_9052970ff4bce526[var_9052970ff4bce526.size] = player;
        player.var_53e3af3b2c8752bd = level.brgametype.var_d4a62f500784ad3b;
    } else {
        var_d46bc9be217ec18d = function_43d0931e0c776713(team);
        if (var_d46bc9be217ec18d == 0) {
            return;
        }
        while (var_d46bc9be217ec18d > 0) {
            player = function_2dbe32176aeb50cf(team);
            player.var_53e3af3b2c8752bd++;
            var_d46bc9be217ec18d--;
            if (!array_contains(var_9052970ff4bce526, player)) {
                var_9052970ff4bce526[var_9052970ff4bce526.size] = player;
            }
        }
    }
    foreach (player in var_9052970ff4bce526) {
        player namespace_44abc05161e2e2cb::showsplash("zc_smateleft", undefined, undefined, undefined, undefined, "splash_list_iw9_br_zonecontrol");
        if (!istrue(var_840011efd5b6414e)) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialog("squadmate_left", undefined, [0:player], 0, 1, undefined);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38eb
// Size: 0x94
function function_43d0931e0c776713(team) {
    teamplayers = getteamdata(team, "players");
    var_d46bc9be217ec18d = level.maxsquadsize;
    foreach (player in teamplayers) {
        if (!isdefined(player)) {
            continue;
        }
        var_d46bc9be217ec18d = var_d46bc9be217ec18d - player.var_53e3af3b2c8752bd;
    }
    return var_d46bc9be217ec18d;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3987
// Size: 0x48
function function_2dbe32176aeb50cf(team) {
    teamplayers = getteamdata(team, "players");
    if (teamplayers.size == 0) {
        return undefined;
    }
    teamplayers = function_f9de48b78868b0dc(teamplayers);
    player = function_8d70afe0aa19f48d(teamplayers);
    return player;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39d7
// Size: 0xb8
function function_f9de48b78868b0dc(players) {
    var_50dd2127e3a2962 = [];
    var_cff5cdf93f2cd0af = level.maxsquadsize;
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player.var_53e3af3b2c8752bd < var_cff5cdf93f2cd0af) {
            var_50dd2127e3a2962 = [0:player];
            var_cff5cdf93f2cd0af = player.var_53e3af3b2c8752bd;
        } else if (player.var_53e3af3b2c8752bd == var_cff5cdf93f2cd0af) {
            var_50dd2127e3a2962[var_50dd2127e3a2962.size] = player;
        }
    }
    return var_50dd2127e3a2962;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a97
// Size: 0x91
function function_8d70afe0aa19f48d(players) {
    topscore = 0;
    topplayer = undefined;
    foreach (player in players) {
        if (!isdefined(topplayer) || player.matchPoints > topscore) {
            topplayer = player;
            topscore = player.matchPoints;
        }
    }
    return topplayer;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b30
// Size: 0x7a
function function_17dafc2a055018cd() {
    foreach (teamname in level.teamnamelist) {
        if (getteamcount(teamname) == 0) {
            continue;
        }
        rank = function_2aee645e0c39abd4(teamname);
        function_f7b9d28bd826e5c0(teamname, rank);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bb1
// Size: 0xc3
function function_2aee645e0c39abd4(team) {
    rank = 1;
    score = function_a97d64dd14f6d878(team);
    foreach (teamname in level.teamnamelist) {
        if (team == teamname || getteamcount(teamname) == 0) {
            continue;
        }
        teamscore = function_a97d64dd14f6d878(teamname);
        if (teamscore > score) {
            rank++;
        }
    }
    if (rank == 1 && !function_8ffe98714b82d58b(team)) {
        rank = 2;
    }
    return rank;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c7c
// Size: 0x7e
function function_f7b9d28bd826e5c0(team, rank) {
    teamplayers = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    foreach (player in teamplayers) {
        if (isdefined(player)) {
            player function_4bbcb0b68d6681b6(rank);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d01
// Size: 0x5d
function function_5e0aab868c752ed8() {
    foreach (player in level.players) {
        if (isdefined(player)) {
            player function_154e26c852e765f5();
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d65
// Size: 0x310
function function_96d5ec7cfb96ba1e() {
    level endon("game_ended");
    level endon("overtime");
    clusterindex = 0;
    function_fdf17ddb1f56d876(level.brgametype.var_58b474cb0e57096a[clusterindex]);
    function_a9edfbdc1855b5b9("active");
    namespace_4b0406965e556711::gameflagwait("infil_animatic_complete");
    wait(level.brgametype.var_b458560354506894);
    function_a9edfbdc1855b5b9("current");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialog("objective_desc", undefined, undefined, 1, 2, undefined);
    level.brgametype.var_d1d6fde697f2e010 = 2;
    thread function_5129b71105a55fcf();
    function_bd8347a5ebcbe61d();
    thread function_3ff03703317ed195(level.brgametype.var_bd12e1c552278ad6);
    thread function_ce8d756798226ff9();
    thread function_d8a422e76c69a3de(level.brgametype.var_b4a42a0051f3fed8);
    while (1) {
        level waittill("activate_next_active_zones");
        level.brgametype.var_d1d6fde697f2e010 = 0;
        level thread namespace_d3d40f75bb4e4c32::brleaderdialog("zone_activation", undefined, undefined, 1, 0, undefined);
        function_23a142e89743326d("uin_iw9_lockdown_zone_unlock");
        function_37d4a6e29f171ce();
        function_e1b409e458079ed2();
        function_f1dc82af499ca14d();
        level.brgametype.var_2a33f7cb739a32f1 = clusterindex;
        thread function_70ff1fa71db052c(level.brgametype.var_9fdb99442028fca4[clusterindex], 0);
        clusterindex++;
        if (clusterindex == level.brgametype.var_58b474cb0e57096a.size) {
            break;
        }
        level waittill("show_next_active_zone");
        function_fdf17ddb1f56d876(level.brgametype.var_58b474cb0e57096a[clusterindex]);
        function_388937da6a4b9e5b("uin_iw9_lockdown_zone_unlocked_ping", level.brgametype.var_58b474cb0e57096a[clusterindex]);
        namespace_52f6938dd902c7d0::showsplashtoall("zc_zone_spawned", undefined, undefined, undefined, undefined, "splash_list_iw9_br_zonecontrol");
        level.brgametype.var_d1d6fde697f2e010 = 1;
        level.brgametype.var_562e8657526813de = 1;
        if (level.brgametype.var_bd5d2a7a94c784ab > 0) {
            level waittill("deactivate_active_zone");
        }
        if (clusterindex < level.brgametype.var_58b474cb0e57096a.size) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialog("zone_deactivation", undefined, undefined, 1, 0, undefined);
            function_388937da6a4b9e5b("uin_iw9_lockdown_zone_deactivated_ping", level.brgametype.var_58b474cb0e57096a[clusterindex]);
            function_23a142e89743326d("uin_iw9_lockdown_round_completed");
        }
        function_a2eeace6ca96b9f9();
        function_ee4fd43f55427502(level.brgametype.var_ac1c493adfb1430e);
        level.brgametype.var_d1d6fde697f2e010 = 2;
        level.brgametype.var_562e8657526813de = 0;
        thread function_d8a422e76c69a3de(level.brgametype.var_adafbaf3c7e24ad3[level.brgametype.var_2a33f7cb739a32f1]);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x407c
// Size: 0x23
function function_fdf17ddb1f56d876(clusterindex) {
    function_ccceec3049422ef7(clusterindex);
    function_598b7b1949fca42e();
    function_d6651c2d7069674d(clusterindex);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40a6
// Size: 0xff
function function_f7fa8a135bb71bf1() {
    var_bab98e6efff82b79 = 9;
    for (i = 0; i < level.brgametype.var_e8b86399cbd6a85e; i++) {
        suffix = level.brgametype.letters[i];
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("zc_waypoint_lock_" + suffix, var_bab98e6efff82b79, "neutral", "MP_INGAME_ONLY/OBJ_ZC_LOCKED_CAPS", "icon_waypoint_lock_" + suffix, 0);
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("zc_waypoint_defending_" + suffix, var_bab98e6efff82b79, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_" + suffix, 0);
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("zc_waypoint_losing_" + suffix, var_bab98e6efff82b79, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_" + suffix, 0);
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("zc_waypoint_contested_" + suffix, var_bab98e6efff82b79, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_" + suffix, 0);
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("zc_waypoint_neutral_" + suffix, var_bab98e6efff82b79, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_" + suffix, 0);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41ac
// Size: 0x101
function function_d6651c2d7069674d(clusterindex) {
    if (!level.brgametype.var_6b04289a49cae84d) {
        return;
    }
    objidnum = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    var_1c683105d19d60a3 = level.brgametype.clusters[clusterindex].origin;
    namespace_5a22b6f3a56f7e9b::objective_add(objidnum, "invisible", var_1c683105d19d60a3, "hud_icon_objective_zclock", "icon_medium");
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objidnum, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(objidnum, undefined);
    function_1a20f52de11ba2ef(objidnum, 1);
    objective_setshowdistance(objidnum, 1);
    objective_sethideelevation(objidnum, 1);
    objective_setshowoncompass(objidnum, 0);
    function_c047d7ffe7a83501(objidnum, level.brgametype.var_a7bd67e2c17c3dc1, level.brgametype.var_36875a3df3ae81f0);
    objective_setplayintro(objidnum, 1);
    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(objidnum);
    level.brgametype.var_827395aad2c2c5a6 = objidnum;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42b4
// Size: 0x73
function function_37d4a6e29f171ce() {
    if (!level.brgametype.var_6b04289a49cae84d) {
        return;
    }
    level.brgametype.var_3a04d4ce47eb118 = level.brgametype.var_827395aad2c2c5a6;
    level.brgametype.var_827395aad2c2c5a6 = undefined;
    namespace_5a22b6f3a56f7e9b::update_objective_icon(level.brgametype.var_3a04d4ce47eb118, "hud_icon_objective_cluster");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x432e
// Size: 0x47
function function_a2eeace6ca96b9f9() {
    if (!level.brgametype.var_6b04289a49cae84d) {
        return;
    }
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(level.brgametype.var_3a04d4ce47eb118);
    level.brgametype.var_3a04d4ce47eb118 = undefined;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x437c
// Size: 0x324
function function_ccceec3049422ef7(clusterindex) {
    level.brgametype.var_38ba95f71251449 = [];
    cluster = level.brgametype.clusters[clusterindex];
    var_b2d6a56cc8091c98 = cluster.zones;
    if (getdvarint(@"hash_333139864c70cc89", 0) == 1) {
        foreach (zone in var_b2d6a56cc8091c98) {
            zone.var_bcc2e271115b13f0 = level.brgametype.var_7bab81a92b4be919["1"];
            level.brgametype.var_38ba95f71251449[level.brgametype.var_38ba95f71251449.size] = zone;
        }
        return;
    }
    var_d5228f9a181d6107 = 0;
    foreach (quantity in level.brgametype.var_293dc429f3a19dfd) {
        var_d5228f9a181d6107 = var_d5228f9a181d6107 + quantity;
    }
    var_1b55f97c09461b2b = int(var_d5228f9a181d6107 / 2);
    var_b052895e262e979f = var_d5228f9a181d6107 - var_1b55f97c09461b2b;
    var_32f0d5b203302413 = randomint(var_b2d6a56cc8091c98.size);
    var_f778714ff68135a2 = cluster function_a4e4ef93c0727408(cluster.zones[var_32f0d5b203302413].origin, level.brgametype.var_e97cd8f39e602a98);
    var_8fe9f75867d3a074 = cluster function_e6fe58eafe08822c(var_f778714ff68135a2, undefined, var_1b55f97c09461b2b);
    var_3381a786a11d230 = cluster function_e6fe58eafe08822c(var_32f0d5b203302413, var_8fe9f75867d3a074, var_b052895e262e979f);
    var_880afab75682943b = array_combine(var_8fe9f75867d3a074, var_3381a786a11d230);
    var_adb94e999b24cab3 = 0;
    foreach (var_4677a80a385b3f2d, quantity in level.brgametype.var_293dc429f3a19dfd) {
        for (i = 0; i < quantity; i++) {
            if (var_adb94e999b24cab3 < var_880afab75682943b.size) {
                zone = var_880afab75682943b[var_adb94e999b24cab3];
                zone.letter = level.brgametype.letters[var_adb94e999b24cab3];
                zone.var_bcc2e271115b13f0 = level.brgametype.var_7bab81a92b4be919[var_4677a80a385b3f2d];
                level.brgametype.var_38ba95f71251449[level.brgametype.var_38ba95f71251449.size] = zone;
                var_adb94e999b24cab3++;
            }
        }
    }
    function_33c85fefc873679e(var_32f0d5b203302413, cluster, var_adb94e999b24cab3);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x46a7
// Size: 0x163
function function_33c85fefc873679e(zoneindex, cluster, var_afe57c392b4e352a) {
    if (!isdefined(level.brgametype.var_8f7905b05ba12df4)) {
        return;
    }
    level.brgametype.var_8f7905b05ba12df4.zones = [];
    var_8f7905b05ba12df4 = cluster function_e6fe58eafe08822c(zoneindex, level.brgametype.var_38ba95f71251449, level.brgametype.var_8f7905b05ba12df4.count);
    foreach (zone in var_8f7905b05ba12df4) {
        zone.letter = level.brgametype.letters[var_afe57c392b4e352a];
        zone.var_bcc2e271115b13f0 = level.brgametype.var_7bab81a92b4be919["2"];
        level.brgametype.var_8f7905b05ba12df4.zones[level.brgametype.var_8f7905b05ba12df4.zones.size] = zone;
        var_afe57c392b4e352a++;
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4811
// Size: 0x77
function function_d8b31b9b82f66df6(zoneindex, var_b2d6a56cc8091c98) {
    var_73640074ac127dfd = array_remove_array(var_b2d6a56cc8091c98, level.brgametype.var_38ba95f71251449);
    var_8065266d3f5d57b8 = get_array_of_closest(var_b2d6a56cc8091c98[zoneindex].origin, var_73640074ac127dfd, undefined, level.brgametype.var_8f7905b05ba12df4.count);
    return var_8065266d3f5d57b8;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4890
// Size: 0x84
function function_a9edfbdc1855b5b9(newstate) {
    foreach (zone in level.brgametype.var_38ba95f71251449) {
        if (isdefined(zone.objidnum)) {
            objective_state(zone.objidnum, newstate);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x491b
// Size: 0xa7
function function_e1b409e458079ed2(zones) {
    level.brgametype.var_ac1c493adfb1430e = level.brgametype.var_38ba95f71251449;
    foreach (zone in level.brgametype.var_ac1c493adfb1430e) {
        zone function_9cbb049ed676e5bf();
    }
    namespace_52f6938dd902c7d0::showsplashtoall("zc_zone_activated", undefined, undefined, undefined, undefined, "splash_list_iw9_br_zonecontrol");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49c9
// Size: 0x1cd
function function_ee4fd43f55427502(zones) {
    foreach (zone in zones) {
        if (isdefined(zone.objidnum)) {
            foreach (player in zone.players) {
                if (isdefined(player)) {
                    namespace_5a22b6f3a56f7e9b::objective_unpin_player(zone.objidnum, player, 1);
                    if (isdefined(player.var_6688811dfb4d2d96) && player.var_6688811dfb4d2d96 == 1) {
                        player.var_6688811dfb4d2d96 = 0;
                        player function_a8722f6b1d8b1bcd(player.var_6688811dfb4d2d96);
                        player function_9b46d53abe69e2bf(0);
                        player function_e4bf8b6f5854c6ca(0);
                    }
                }
            }
            if (zone.var_bcc2e271115b13f0.name == "2") {
                function_38c981837ad9518b(zone.objidnum, "icon_waypoint_base_empty");
                waitframe();
            }
            zone function_c7641266e2fcbde4();
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(zone.objidnum);
            zone.objidnum = undefined;
        }
        zone.var_bcc2e271115b13f0 = undefined;
        zone.players = undefined;
        zone.vehicles = undefined;
        zone.var_d9dab6771a3caa4e = undefined;
        zone.isactive = 0;
        zone.var_46b09b33357e572e = 0;
        zone function_f6f080447d2f7e50();
        zone notify("deactivate_zone");
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b9d
// Size: 0xb0
function function_b4759d625b4e4ac0(var_db47053f2e2557db) {
    if (!isdefined(level.brgametype.var_8f7905b05ba12df4) || istrue(level.brgametype.var_fa48bea82741b77a)) {
        return;
    }
    level endon("game_ended");
    level endon("overtime");
    level endon("deactivate_active_zone");
    eventduration = 4 + level.brgametype.var_8f7905b05ba12df4.duration;
    if (eventduration >= var_db47053f2e2557db) {
        return;
    }
    wait(var_db47053f2e2557db - eventduration);
    if (istrue(level.brgametype.var_8f7905b05ba12df4.var_8f83fe56013a157c)) {
        function_bc52acacdd2c553d();
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c54
// Size: 0x62
function function_598b7b1949fca42e() {
    foreach (zone in level.brgametype.var_38ba95f71251449) {
        zone function_86543df2bb948a24();
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cbd
// Size: 0x109
function function_bc52acacdd2c553d() {
    if (!isdefined(level.brgametype.var_8f7905b05ba12df4) || level.brgametype.var_8f7905b05ba12df4.zones.size == 0) {
        return;
    }
    namespace_52f6938dd902c7d0::showsplashtoall("zc_extra_zones", undefined, undefined, undefined, undefined, "splash_list_iw9_br_zonecontrol");
    wait(4);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialog("high_value_zone", undefined, level.players, 0, 0, undefined);
    for (i = 0; i < level.brgametype.var_8f7905b05ba12df4.count; i++) {
        zone = level.brgametype.var_8f7905b05ba12df4.zones[i] function_86543df2bb948a24();
        zone function_9cbb049ed676e5bf();
        level.brgametype.var_ac1c493adfb1430e[level.brgametype.var_ac1c493adfb1430e.size] = zone;
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4dcd
// Size: 0xf3
function function_70ff1fa71db052c(time, var_4e378291cbea730e) {
    level endon("game_ended");
    level endon("overtime");
    function_adebca556fbb1224(time, var_4e378291cbea730e);
    thread function_b4759d625b4e4ac0(time);
    thread function_b22b15568ffa32af(time);
    thread function_1524c00de48c44f3(time, var_4e378291cbea730e);
    var_3b092428347e8d66 = level.brgametype.var_2a33f7cb739a32f1 < level.brgametype.var_58b474cb0e57096a.size && time > 16 && var_4e378291cbea730e != 2;
    if (istrue(var_3b092428347e8d66)) {
        thread function_7e136dd8ba2417ad(time);
    }
    var_b9b119b5af06d232 = min(level.brgametype.var_bd5d2a7a94c784ab, time);
    wait(time - var_b9b119b5af06d232);
    level notify("show_next_active_zone");
    wait(var_b9b119b5af06d232);
    function_63bf192d1fd856e5(level.brgametype.var_2a33f7cb739a32f1);
    level notify("deactivate_active_zone");
    function_5e0aab868c752ed8();
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ec7
// Size: 0x42
function function_b22b15568ffa32af(time) {
    level endon("game_ended");
    level endon("overtime");
    level endon("deactivate_active_zone");
    while (time > 1) {
        function_b9e478ad63e8153b();
        wait(1);
        time--;
        level.var_2d54101de4b3f30e = time;
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f10
// Size: 0x25
function function_4e923934e9e9ffe7(player) {
    if (isdefined(player) && isdefined(player.zone)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f3d
// Size: 0x31
function function_bd8347a5ebcbe61d() {
    level.brgametype.starttime = gettime();
    level.brgametype.var_4a6d6ca4bc4a64c0 = 0;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4f75
// Size: 0x75
function function_adebca556fbb1224(time, type) {
    level.brgametype.var_4a6d6ca4bc4a64c0 = level.brgametype.var_4a6d6ca4bc4a64c0 + time;
    if (isdefined(type)) {
        function_9ca19d36142d1919(type);
        if (type == 2) {
            thread function_df430a39e06206b7(time);
            return;
        }
    }
    function_1e3cf8b4c4579564(level.brgametype.var_4a6d6ca4bc4a64c0);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ff1
// Size: 0x58
function function_d8a422e76c69a3de(time) {
    level endon("game_ended");
    level endon("overtime");
    function_adebca556fbb1224(time, 1);
    if (time > 16) {
        var_e89c89a93773fa23 = time - 16;
        level thread namespace_d3d40f75bb4e4c32::brleaderdialog("activation_anticipation", undefined, undefined, 1, var_e89c89a93773fa23, undefined);
    }
    wait(time);
    level notify("activate_next_active_zones");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5050
// Size: 0x6a
function function_ce8d756798226ff9() {
    level endon("game_ended");
    level endon("overtime");
    wait(level.brgametype.var_bd12e1c552278ad6 - level.brgametype.var_ccaf7dcc548b6df3);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialog("match_end_soon", undefined, undefined, 1, 0, undefined);
    wait(level.brgametype.var_ccaf7dcc548b6df3);
    function_e861b56f866e4a9(1);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50c1
// Size: 0x113
function function_67b4cff7142dd6bb() {
    var_45188a9f344ebfe = function_29b527d8b0e817c3(@"hash_4fddbfb63e4afffa", "0 0.25 0.5 0.75 1");
    var_9be2dfd5a5c29111 = function_29b527d8b0e817c3(@"hash_f7d19878aacf8ee9", "18 23 28 28 18");
    var_7c95e46027b9f37a = function_29b527d8b0e817c3(@"hash_1f76b3ba6e820f12", "18 23 28 28 18");
    var_8b1354989ea17606 = function_29b527d8b0e817c3(@"hash_2b0d8b301df0c16", "13 18 23 23 13");
    var_1239a37ed7b8010d = function_29b527d8b0e817c3(@"hash_6e491da843b1e135", "8 13 18 18 8");
    if (var_45188a9f344ebfe.size != var_9be2dfd5a5c29111.size || var_45188a9f344ebfe.size != var_7c95e46027b9f37a.size || var_45188a9f344ebfe.size != var_8b1354989ea17606.size || var_45188a9f344ebfe.size != var_1239a37ed7b8010d.size) {
        /#
            assertmsg("Error with dvars arrays size. Keep resurgences data dvars sync.");
        #/
    }
    var_af41098889966ee1 = [];
    for (i = 0; i < var_45188a9f344ebfe.size; i++) {
        var_af41098889966ee1[i] = function_1e86e9fd0b721d59(var_45188a9f344ebfe[i], var_9be2dfd5a5c29111[i], var_7c95e46027b9f37a[i], var_8b1354989ea17606[i], var_1239a37ed7b8010d[i]);
    }
    return var_af41098889966ee1;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x51dc
// Size: 0xd0
function function_1e86e9fd0b721d59(milestone, var_5819a1f831db83d8, var_13fe8ef58bd08ed, var_b6e5ee78504f6791, var_c52ac290d2752fcc) {
    var_af41098889966ee1 = spawnstruct();
    var_af41098889966ee1.milestone = float(milestone) * level.brgametype.var_72a3808f03841546;
    var_af41098889966ee1.var_96197ae66bd1d8c3 = [];
    var_af41098889966ee1.var_96197ae66bd1d8c3["_quads"] = int(var_5819a1f831db83d8);
    var_af41098889966ee1.var_96197ae66bd1d8c3["_trios"] = int(var_13fe8ef58bd08ed);
    var_af41098889966ee1.var_96197ae66bd1d8c3["_duos"] = int(var_b6e5ee78504f6791);
    var_af41098889966ee1.var_96197ae66bd1d8c3["_solos"] = int(var_c52ac290d2752fcc);
    return var_af41098889966ee1;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x52b4
// Size: 0x31
function function_29b527d8b0e817c3(dvar, defaultvalue) {
    var_34bc96cfbee3b86f = getdvar(dvar, defaultvalue);
    return strtok(var_34bc96cfbee3b86f, " ");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x52ed
// Size: 0x160
function function_1300c157b617abd7(team) {
    if (getteamcount(team) == 0) {
        return;
    }
    var_2237e7cb6f4d0149 = function_a7afcb850c19c0cf(team);
    if (var_2237e7cb6f4d0149 == level.brgametype.var_af41098889966ee1.size - 1) {
        return;
    }
    teamscore = level.brgametype.var_6eef49fde768c24f[team];
    var_5928d7192719603e = var_2237e7cb6f4d0149;
    if (teamscore >= level.brgametype.var_af41098889966ee1[var_2237e7cb6f4d0149 + 1].milestone) {
        var_5928d7192719603e = var_2237e7cb6f4d0149 + 1;
    }
    if (!isdefined(level.brgametype.var_88a254227da87c7f[team])) {
        level.brgametype.var_88a254227da87c7f[team] = spawnstruct();
    }
    if (!isdefined(level.brgametype.var_88a254227da87c7f[team].var_4dade83aa767e6b2) || var_2237e7cb6f4d0149 != var_5928d7192719603e) {
        level.brgametype.var_88a254227da87c7f[team].var_4dade83aa767e6b2 = var_5928d7192719603e;
        level.brgametype.var_88a254227da87c7f[team].var_96197ae66bd1d8c3 = level.brgametype.var_af41098889966ee1[var_5928d7192719603e].var_96197ae66bd1d8c3;
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5454
// Size: 0x46
function function_a7afcb850c19c0cf(team) {
    if (isdefined(level.brgametype.var_88a254227da87c7f[team])) {
        return level.brgametype.var_88a254227da87c7f[team].var_4dade83aa767e6b2;
    }
    return 0;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54a2
// Size: 0x8f
function function_56355c272f045e8c() {
    foreach (teamname in level.teamnamelist) {
        if (getteamcount(teamname) == 0) {
            continue;
        }
        if (!isdefined(level.brgametype.var_6eef49fde768c24f[teamname])) {
            level.brgametype.var_6eef49fde768c24f[teamname] = 0;
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5538
// Size: 0x36
function function_6d83e1aad1b29028() {
    var_847926c333f5eeb5 = getdvarfloat(@"hash_97adbd29c0acfa59", 0.5);
    return level.brgametype.var_72a3808f03841546 * var_847926c333f5eeb5;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5576
// Size: 0x285
function function_b9e478ad63e8153b() {
    foreach (zone in level.brgametype.var_ac1c493adfb1430e) {
        var_24e879e009aee925 = zone function_4549da620dbe742b();
        if (zone.state != "occupied") {
            continue;
        }
        var_9ece534476d102bb = 0;
        var_6ab5606da9634c9a = zone function_dc8c285f0e287553(level.brgametype.var_b357705d6f9b3080);
        var_92cc00ad244291d3 = var_6ab5606da9634c9a;
        var_1190afa59b16f447 = ter_op(zone.var_bcc2e271115b13f0.name == "2", "highValueZone", "normalZone");
        if (istrue(var_24e879e009aee925)) {
            var_6ab5606da9634c9a = var_6ab5606da9634c9a + level.brgametype.var_416febdc38ed88be;
        }
        if (istrue(level.brgametype.var_e9a4c3df54d13fd1)) {
            foreach (player in zone.players) {
                playerscore = player function_60afa719948a5de2(var_6ab5606da9634c9a, zone);
                if (istrue(var_24e879e009aee925)) {
                    player function_3ae9c7708bf1def0(zone);
                }
                if (playerscore > var_6ab5606da9634c9a) {
                    var_6ab5606da9634c9a = playerscore;
                }
            }
            function_82abf65b162f526f(zone.players[0].team, var_92cc00ad244291d3, var_1190afa59b16f447);
            function_a5125e3bb9aa0b2a(zone.players[0].team, var_6ab5606da9634c9a);
            var_9ece534476d102bb = var_9ece534476d102bb + var_6ab5606da9634c9a;
        } else {
            foreach (player in zone.players) {
                playerscore = player function_60afa719948a5de2(var_6ab5606da9634c9a, zone);
                function_a5125e3bb9aa0b2a(player.team, playerscore);
                var_9ece534476d102bb = var_9ece534476d102bb + playerscore;
            }
        }
        zone function_3e26fdceed81d3a8(var_9ece534476d102bb);
    }
    function_8e6d11416198da98();
    function_17dafc2a055018cd();
    function_e861b56f866e4a9();
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5802
// Size: 0xcb
function function_a5125e3bb9aa0b2a(team, points) {
    if (!isdefined(team)) {
        return;
    }
    score = function_a97d64dd14f6d878(team) + points;
    level.brgametype.var_6eef49fde768c24f[team] = score;
    foreach (player in level.players) {
        if (isdefined(player)) {
            if (player.team == team) {
                player function_dae80bbaa1d7b643(score);
            }
            player function_943449ac36405826(player.team);
        }
    }
    function_1300c157b617abd7(team);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x58d4
// Size: 0x3c
function function_a97d64dd14f6d878(team) {
    if (isdefined(level.brgametype.var_6eef49fde768c24f[team])) {
        return level.brgametype.var_6eef49fde768c24f[team];
    }
    return 0;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5918
// Size: 0x256
function function_f151ae91a336c4f1(team) {
    if (!istrue(level.brgametype.var_faf946460fcee87b)) {
        return;
    }
    teamplayers = array_removeundefined(getteamdata(team, "players"));
    zones = array_combine(level.brgametype.var_ac1c493adfb1430e, level.brgametype.var_38ba95f71251449);
    foreach (zone in zones) {
        if (!isdefined(zone.players)) {
            continue;
        }
        var_9712c9e21fd915f = array_intersection(teamplayers, zone.players);
        foreach (player in var_9712c9e21fd915f) {
            var_c806c2fd9f920735 = isdefined(zone.state) && zone.state == "occupied" && var_9712c9e21fd915f.size > 1;
            var_6688811dfb4d2d96 = ter_op(var_c806c2fd9f920735, 1, 0);
            if (!isdefined(player.var_6688811dfb4d2d96) || player.var_6688811dfb4d2d96 != var_6688811dfb4d2d96) {
                player.var_6688811dfb4d2d96 = var_6688811dfb4d2d96;
                player function_a8722f6b1d8b1bcd(player.var_6688811dfb4d2d96);
            }
            teamplayers = array_remove(teamplayers, player);
            if (teamplayers.size == 0) {
                return;
            }
        }
    }
    foreach (player in teamplayers) {
        if (isdefined(player.var_6688811dfb4d2d96) && player.var_6688811dfb4d2d96 == 1) {
            player.var_6688811dfb4d2d96 = 0;
            player function_a8722f6b1d8b1bcd(player.var_6688811dfb4d2d96);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b75
// Size: 0x74
function function_e5b3acb7936aa9e0() {
    if (isdefined(level.brgametype.var_8a5e17fab329354c)) {
        return;
    }
    var_cbf035d71d332c29 = function_b0e67dd0180bb457();
    if (level.brgametype.var_80e82584c694b4a != var_cbf035d71d332c29) {
        level.brgametype.var_80e82584c694b4a = var_cbf035d71d332c29;
        level.brgametype.var_293dc429f3a19dfd = function_b3e0554cf34d5cf7(var_cbf035d71d332c29);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5bf0
// Size: 0x82
function function_b0e67dd0180bb457() {
    ratio = level.brgametype.var_8c60f1a7127109cf / level.brgametype.var_72a3808f03841546;
    if (ratio >= 1) {
        return "overtime";
    }
    index = int(floor(level.brgametype.var_4a459e59b4b10244.size * ratio));
    return level.brgametype.var_4a459e59b4b10244[index];
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c7a
// Size: 0x67
function function_8e6d11416198da98() {
    foreach (team in level.teamnamelist) {
        if (getteamcount(team) == 0) {
            continue;
        }
        function_10724ef5718c0736(team);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ce8
// Size: 0x26a
function function_10724ef5718c0736(team) {
    teamscore = function_a97d64dd14f6d878(team);
    highscore = function_4b1a1903cca7aa39();
    var_8c60f1a7127109cf = 0;
    if (isdefined(level.brgametype.var_b184ddad2bcf6f49)) {
        var_8c60f1a7127109cf = function_a97d64dd14f6d878(level.brgametype.var_b184ddad2bcf6f49);
    }
    var_ab08f00196e4be49 = teamscore == highscore;
    var_159b57523989b823 = isdefined(level.brgametype.var_b184ddad2bcf6f49) && level.brgametype.var_b184ddad2bcf6f49 == team;
    var_e93b3f2abeab81c = var_8c60f1a7127109cf < highscore;
    if (var_ab08f00196e4be49 && (var_159b57523989b823 || var_e93b3f2abeab81c)) {
        level.brgametype.var_b184ddad2bcf6f49 = team;
        level.brgametype.var_8c60f1a7127109cf = teamscore;
        if (teamscore < level.brgametype.var_72a3808f03841546) {
            function_e5b3acb7936aa9e0();
        }
        if (function_fbd948a0967f8af1() && (!isdefined(level.brgametype.var_3237373815779bf5) || istrue(var_e93b3f2abeab81c))) {
            level notify("new_leaders");
            function_b7f04ae2f89f6846();
            function_871fb9df81cdd81e();
        }
        if (!isdefined(level.brgametype.var_f24dd2e0d7a9fbc1) && level.brgametype.var_8c60f1a7127109cf > level.brgametype.var_65c42f3ac6958818) {
            function_a2a83b7513c9a3de("zc_midscore_leaders", "zc_midscore_others", "halfway_leaders", "halfway_others");
            level.brgametype.var_f24dd2e0d7a9fbc1 = 1;
        }
        if (function_d4f2d1878f57440b()) {
            level.brgametype.var_8f7905b05ba12df4.var_8f83fe56013a157c = 1;
        }
        if (!isdefined(level.brgametype.var_72138bffb8750c2a) && level.brgametype.var_8c60f1a7127109cf > level.brgametype.var_2d08e0f710460f75) {
            function_a2a83b7513c9a3de("zc_majorityscore_leaders", "zc_majorityscore_others", "victory_close_leaders", "victory_close_others");
            level.brgametype.var_72138bffb8750c2a = 1;
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f59
// Size: 0x87
function function_4b1a1903cca7aa39() {
    highscore = 0;
    foreach (team in level.teamnamelist) {
        if (getteamcount(team) == 0) {
            continue;
        }
        teamscore = function_a97d64dd14f6d878(team);
        if (teamscore > highscore) {
            highscore = teamscore;
        }
    }
    return highscore;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5fe8
// Size: 0x3a
function function_8ffe98714b82d58b(team) {
    if (isdefined(level.brgametype.var_b184ddad2bcf6f49)) {
        return (team == level.brgametype.var_b184ddad2bcf6f49);
    }
    return 0;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x602a
// Size: 0x6e
function function_d4f2d1878f57440b() {
    return isdefined(level.brgametype.var_8f7905b05ba12df4) && !isdefined(level.brgametype.var_8f7905b05ba12df4.var_8f83fe56013a157c) && level.brgametype.var_8c60f1a7127109cf > level.brgametype.var_8f7905b05ba12df4.var_12926948d93c7ed0;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60a0
// Size: 0x54
function function_fbd948a0967f8af1() {
    progression = level.brgametype.var_8c60f1a7127109cf / level.brgametype.var_72a3808f03841546 * 100;
    if (progression >= level.brgametype.var_9fc633a4965b8851) {
        return 1;
    }
    return 0;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60fc
// Size: 0x210
function function_871fb9df81cdd81e() {
    level.brgametype.var_3237373815779bf5 = level.brgametype.var_b184ddad2bcf6f49;
    teamplayers = getteamdata(level.brgametype.var_3237373815779bf5, "players");
    hasbeentracked = array_contains(level.brgametype.var_ff62fbb921ae39bd, level.brgametype.var_3237373815779bf5);
    foreach (player in level.players) {
        if (isdefined(player) && isalive(player)) {
            if (array_contains(teamplayers, player)) {
                var_1b4ada49a21b51ca = ter_op(hasbeentracked, "zc_lead_won", "zc_top_marked");
                vo = ter_op(hasbeentracked, "lead_taking", "lead_first");
                player namespace_44abc05161e2e2cb::showsplash(var_1b4ada49a21b51ca, undefined, undefined, undefined, undefined, "splash_list_iw9_br_zonecontrol");
                level thread namespace_d3d40f75bb4e4c32::brleaderdialog(vo, undefined, [0:player], 1, 0, undefined);
                player thread function_cf348fb9247c7213();
            } else if (!isdefined(level.brgametype.var_c4d2c929f6186c8a)) {
                player namespace_44abc05161e2e2cb::showsplash("zc_top_team_marked", undefined, undefined, undefined, undefined, "splash_list_iw9_br_zonecontrol");
                level thread namespace_d3d40f75bb4e4c32::brleaderdialog("lead_marked", undefined, [0:player], 1, 0, undefined);
            }
        }
    }
    if (!isdefined(level.brgametype.var_c4d2c929f6186c8a)) {
        level.brgametype.var_c4d2c929f6186c8a = 1;
    }
    if (!hasbeentracked) {
        level.brgametype.var_ff62fbb921ae39bd[level.brgametype.var_ff62fbb921ae39bd.size] = level.brgametype.var_3237373815779bf5;
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6313
// Size: 0xb5
function function_b7f04ae2f89f6846(var_5af933b7b2b07f42) {
    if (!isdefined(level.brgametype.var_3237373815779bf5)) {
        return;
    }
    teamplayers = getteamdata(level.brgametype.var_3237373815779bf5, "players");
    foreach (player in teamplayers) {
        if (isdefined(player) && isalive(player)) {
            function_7754e43584e5a8ea(player, player.objidnum, var_5af933b7b2b07f42);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x63cf
// Size: 0xbb
function function_f46e5521ac7dd59f() {
    var_88f532fcb60e4622 = [];
    otherplayers = [];
    foreach (player in level.players) {
        if (isdefined(player)) {
            if (function_8ffe98714b82d58b(player.team)) {
                var_88f532fcb60e4622[var_88f532fcb60e4622.size] = player;
            } else {
                otherplayers[otherplayers.size] = player;
            }
        }
    }
    players = spawnstruct();
    players.var_ce3c23b4ab427559 = var_88f532fcb60e4622;
    players.others = otherplayers;
    return players;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6492
// Size: 0x132
function function_a2a83b7513c9a3de(var_e5e5e4d824208ad2, var_915478babbbb5b95, var_2bb9fb22d055aff6, var_a9c602d95d54000d) {
    players = function_f46e5521ac7dd59f();
    foreach (player in players.var_ce3c23b4ab427559) {
        player namespace_44abc05161e2e2cb::showsplash(var_e5e5e4d824208ad2, undefined, undefined, undefined, undefined, "splash_list_iw9_br_zonecontrol");
    }
    foreach (player in players.others) {
        player namespace_44abc05161e2e2cb::showsplash(var_915478babbbb5b95, undefined, undefined, undefined, undefined, "splash_list_iw9_br_zonecontrol");
    }
    if (isdefined(var_2bb9fb22d055aff6)) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialog(var_2bb9fb22d055aff6, undefined, players.var_ce3c23b4ab427559, 1, 0, undefined);
    }
    if (isdefined(var_a9c602d95d54000d)) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialog(var_a9c602d95d54000d, undefined, players.others, 1, 0, undefined);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65cb
// Size: 0x36
function function_cc65ff69b7798d8a() {
    ratio = getdvarfloat(@"hash_8649481a9908db9e", 0.5);
    return level.brgametype.var_72a3808f03841546 * ratio;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6609
// Size: 0x36
function function_4b142266db88b16f() {
    ratio = getdvarfloat(@"hash_d944221a78af1923", 0.8463);
    return level.brgametype.var_72a3808f03841546 * ratio;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6647
// Size: 0x36
function function_d029c67042b833ef() {
    ratio = getdvarfloat(@"hash_8649481a9908db9e", 0.01);
    return level.brgametype.var_72a3808f03841546 * ratio;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6685
// Size: 0x83
function function_127ee218eb82d3c1() {
    level.brgametype.var_10182c9dcaf0d685 = 1;
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player namespace_d20f8ef223912e12::function_96d6b5e51dd4a63b();
        player.var_5393b7ee3366d551 = 0;
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x670f
// Size: 0x73
function function_e861b56f866e4a9(var_6dcc0656a06d44f4) {
    if (istrue(level.brgametype.var_8a5e17fab329354c)) {
        return;
    }
    if (istrue(var_6dcc0656a06d44f4) || level.brgametype.var_8c60f1a7127109cf >= level.brgametype.var_72a3808f03841546) {
        level.brgametype.var_8a5e17fab329354c = 1;
        function_fc9c904ab75e6755(istrue(var_6dcc0656a06d44f4));
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6789
// Size: 0xd6
function function_fc9c904ab75e6755(var_6dcc0656a06d44f4) {
    if (getdvarint(@"hash_9caa664d3fc05216", 1) == 0) {
        thread function_673752017801be1a(var_6dcc0656a06d44f4);
        return;
    }
    foreach (team, var_9a1c82e113823b06 in level.brgametype.var_6eef49fde768c24f) {
        if (!function_8ffe98714b82d58b(team)) {
            scorediff = level.brgametype.var_8c60f1a7127109cf - var_9a1c82e113823b06;
            if (scorediff <= level.brgametype.var_30a69220cb03bba6) {
                thread function_701a4d4de297e642();
                return;
            }
        }
    }
    thread function_673752017801be1a(var_6dcc0656a06d44f4);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6866
// Size: 0x66
function function_d99c89ae27f855e5() {
    foreach (player in level.players) {
        if (isdefined(player)) {
            player notify("force_stop_respawn");
            player freezecontrols(1);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68d3
// Size: 0xa0
function function_701a4d4de297e642() {
    level endon("game_ended");
    level notify("overtime");
    level.brgametype.var_fa48bea82741b77a = 1;
    var_fc4560a4bf4bb156 = getdvarint(@"hash_6d4c043f839d0769", 60);
    thread namespace_813f5a035e59565a::function_628f61246095f688(level.brgametype.var_2a33f7cb739a32f1, var_fc4560a4bf4bb156);
    namespace_52f6938dd902c7d0::showsplashtoall("zc_overtime", undefined, undefined, undefined, undefined, "splash_list_iw9_br_zonecontrol");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialog("overtime_start", undefined, undefined, 0, 0, undefined);
    function_494ff493b7c30886();
    function_70ff1fa71db052c(var_fc4560a4bf4bb156, 2);
    thread function_4187b508ee08dbd4();
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x697a
// Size: 0xa4
function function_494ff493b7c30886() {
    foreach (zone in level.brgametype.var_ac1c493adfb1430e) {
        zone.var_bcc2e271115b13f0 = level.brgametype.var_7bab81a92b4be919["2"];
        zone function_12f42921034bd85d(zone.var_bcc2e271115b13f0.name);
        zone function_d230e52ea9d04f61();
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a25
// Size: 0x59
function function_4187b508ee08dbd4() {
    level endon("game_ended");
    if (level.brgametype.var_63f2dd4c20977582 > 0) {
        level.brgametype.var_63f2dd4c20977582 = 0;
    }
    namespace_52f6938dd902c7d0::showsplashtoall("zc_end_game_times_up", undefined, undefined, undefined, undefined, "splash_list_iw9_br_zonecontrol");
    wait(5.5);
    function_985ed0ba7cd89af4();
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a85
// Size: 0x4f
function function_673752017801be1a(var_6dcc0656a06d44f4) {
    function_d99c89ae27f855e5();
    function_ee4fd43f55427502(level.brgametype.var_ac1c493adfb1430e);
    level.skipplaybodycountsound = 1;
    if (istrue(var_6dcc0656a06d44f4)) {
        thread function_4187b508ee08dbd4();
    } else {
        function_985ed0ba7cd89af4();
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6adb
// Size: 0x23e
function function_985ed0ba7cd89af4() {
    if (istrue(level.brgametype.var_fee4704875dae062)) {
        return;
    }
    if (level.brgametype.var_63f2dd4c20977582 > 0) {
        level.brgametype.var_63f2dd4c20977582 = 0;
    }
    function_127ee218eb82d3c1();
    level.brgametype.var_fee4704875dae062 = 1;
    var_8bcf55e50a4a221c = 0;
    secondplace = 0;
    foreach (teamname in level.teamnamelist) {
        if (getteamcount(teamname) == 0) {
            continue;
        }
        rank = function_2aee645e0c39abd4(teamname);
        if (rank == 1) {
            var_8bcf55e50a4a221c = function_a97d64dd14f6d878(teamname);
        } else if (rank == 2) {
            secondplace = function_a97d64dd14f6d878(teamname);
        }
        function_6f1b573f9cdbe3d(teamname, rank);
        if (!function_8ffe98714b82d58b(teamname)) {
            var_52cc6c848f589ad3 = getteamdata(teamname, "alivePlayers");
            if (var_52cc6c848f589ad3.size > 0) {
                foreach (player in var_52cc6c848f589ad3) {
                    player.plotarmor = 1;
                    player freezecontrols(1);
                    player function_a593971d75d82113();
                    player function_379bb555405c16bb("br_gametype_zonecontrol::brZoneControl_endGame()");
                    player namespace_3bbb5a98b932c46f::disableburnfx();
                }
            }
        }
    }
    function_d0e600deb7949696(level.brgametype.var_2a33f7cb739a32f1, var_8bcf55e50a4a221c - secondplace);
    winner = ter_op(isdefined(level.brgametype.var_b184ddad2bcf6f49), level.brgametype.var_b184ddad2bcf6f49, "tie");
    thread namespace_d576b6dc7cef9c62::endgame(winner, game["end_reason"]["objective_completed"], game["end_reason"]["br_eliminated"]);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6d20
// Size: 0x93
function function_6f1b573f9cdbe3d(team, var_ac573fb60acedace) {
    foreach (player in level.teamdata[team]["players"]) {
        if (!isdefined(player)) {
            continue;
        }
        player setclientomnvar("ui_br_player_position", var_ac573fb60acedace);
        if (var_ac573fb60acedace > 1) {
            player setclientomnvar("ui_br_squad_eliminated_active", 1);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6dba
// Size: 0x68
function function_f1dc82af499ca14d() {
    foreach (player in level.players) {
        if (isdefined(player) && isalive(player)) {
            player thread function_c31d411c03f9923b();
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e29
// Size: 0x3f
function function_7e136dd8ba2417ad(time) {
    level endon("game_ended");
    level endon("overtime");
    var_e89c89a93773fa23 = time - 16;
    wait(var_e89c89a93773fa23);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialog("deactivation_anticipation", undefined, undefined, 1, 0, undefined);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e6f
// Size: 0x25
function function_c453d69202cbfb0f() {
    namespace_e0a7597be4f2b843::function_d3cf7ff1a257e2c3("ui_zonecontrol_game_data", 0, 13, level.brgametype.var_72a3808f03841546);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e9b
// Size: 0x83
function function_3ff03703317ed195(value) {
    level endon("game_ended");
    setomnvar("ui_br_circle_state", 5);
    time = value * 1000;
    setomnvar("ui_hardpoint_timer", int(level.brgametype.starttime + time));
    wait(int(max(value - level.brgametype.var_9429aeba8918c5ca, 0)));
    setomnvar("ui_br_circle_state", 6);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f25
// Size: 0x41
function function_1e3cf8b4c4579564(value) {
    time = value * 1000;
    setomnvar("ui_zonecontrol_round_timer_value", int(level.brgametype.starttime + time));
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f6d
// Size: 0x1d
function function_9ca19d36142d1919(value) {
    namespace_e0a7597be4f2b843::function_d3cf7ff1a257e2c3("ui_zonecontrol_game_data", 13, 2, value);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f91
// Size: 0x94
function function_df430a39e06206b7(value) {
    level endon("game_ended");
    setomnvar("ui_br_circle_state", 5);
    gametime = gettime();
    time = value * 1000;
    setomnvar("ui_hardpoint_timer", int(gametime + time));
    setomnvar("ui_zonecontrol_round_timer_value", int(gametime + time));
    wait(int(max(value - level.brgametype.var_d35c2d99f63cec4a, 0)));
    setomnvar("ui_br_circle_state", 6);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x702c
// Size: 0x45
function function_8ecdb9663cb000ac() {
    var_9320300321c77f03 = [];
    var_9320300321c77f03[0] = int(min(self.longestScoreStreak, 1023));
    var_9320300321c77f03[1] = int(min(self.matchPoints, 4095));
    return var_9320300321c77f03;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7079
// Size: 0x38
function function_46db667f66f9761e(ent) {
    return ent namespace_dbbb37eb352edf96::isvehicle() || isdefined(ent.classname) && ent.classname == "script_vehicle";
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70b9
// Size: 0xe9
function function_fafd7a9de6e4ba1e() {
    cluster = self;
    zones = getentarray(cluster.target, "targetname");
    var_b2d6a56cc8091c98 = [];
    zoneindex = 0;
    foreach (zone in zones) {
        if (array_contains(level.brgametype.var_a0712831ec60ee71, zone.target)) {
            continue;
        }
        zone function_432462422e56f3a1();
        zone.letter = level.brgametype.letters[zoneindex];
        var_b2d6a56cc8091c98[var_b2d6a56cc8091c98.size] = zone;
        zoneindex++;
    }
    return var_b2d6a56cc8091c98;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x71aa
// Size: 0xd7
function function_75d1f81d43231b87() {
    cluster = self;
    /#
        assertex(isdefined(cluster.script_noteworthy), "Need to fix cluster's script_noteworthy. Should correspond the neighbours zone indexs.");
    #/
    var_c33028419ad7acd5 = cluster.script_noteworthy;
    var_d07b1c610b748f16 = [];
    if (var_c33028419ad7acd5 != "") {
        var_3d59c36e185837a1 = strtok(var_c33028419ad7acd5, " ");
        foreach (var_d65996ebbbd652a8 in var_3d59c36e185837a1) {
            if (array_contains(level.brgametype.var_7253b43ef30f88b9, var_d65996ebbbd652a8)) {
                continue;
            }
            var_d07b1c610b748f16[var_d07b1c610b748f16.size] = var_d65996ebbbd652a8;
        }
    }
    return var_d07b1c610b748f16;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7289
// Size: 0x7b
function function_e6fe58eafe08822c(zoneindex, excluders, var_d5228f9a181d6107, var_53002c30822e754c) {
    cluster = self;
    origin = cluster.zones[zoneindex].origin;
    var_8065266d3f5d57b8 = get_array_of_closest(origin, cluster.zones, excluders, var_d5228f9a181d6107, undefined, var_53002c30822e754c);
    return array_randomize(var_8065266d3f5d57b8);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x730c
// Size: 0xd0
function function_a4e4ef93c0727408(origin, mindistance) {
    cluster = self;
    var_73a56d219e2f275a = undefined;
    var_e55fcded0888c103 = undefined;
    var_37e269d27e0afa73 = undefined;
    var_46ae9a117f132a0a = -1;
    for (i = 0; i < cluster.zones.size; i++) {
        var_84a154235c811394 = distance2d(origin, cluster.zones[i].origin);
        if (!isdefined(var_e55fcded0888c103) || var_84a154235c811394 < var_e55fcded0888c103) {
            if (var_84a154235c811394 >= mindistance) {
                var_e55fcded0888c103 = var_84a154235c811394;
                var_73a56d219e2f275a = i;
            } else if (var_84a154235c811394 > var_46ae9a117f132a0a) {
                var_46ae9a117f132a0a = var_84a154235c811394;
                var_37e269d27e0afa73 = i;
            }
        }
    }
    return ter_op(isdefined(var_73a56d219e2f275a), var_73a56d219e2f275a, var_37e269d27e0afa73);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x73e4
// Size: 0xf0
function function_432462422e56f3a1() {
    zone = self;
    chevrons = getentitylessscriptablearray(zone.target, "targetname");
    var_e23e0bab88c6ef9f = [];
    foreach (var_eae85273686f4f4 in chevrons) {
        if (isdefined(var_eae85273686f4f4.script_noteworthy)) {
            /#
                assertex(int(var_eae85273686f4f4.script_noteworthy) <= 4, "Need to fix chevron's script_noteworthy KVP. Keep the value between 1 and 4.");
            #/
            var_eae85273686f4f4.var_b779cb958bc7769a = int(var_eae85273686f4f4.script_noteworthy);
            var_e23e0bab88c6ef9f[var_e23e0bab88c6ef9f.size] = var_eae85273686f4f4;
        } else {
            /#
                assertmsg("Chevron's script_noteworthy KVP is missing. Set the value between 1 and 4.");
            #/
        }
    }
    zone.chevrons = var_e23e0bab88c6ef9f;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x74db
// Size: 0x12e
function function_12f42921034bd85d(var_d660eea11eceaf33) {
    zone = self;
    foreach (var_bcc2e271115b13f0 in level.brgametype.var_7bab81a92b4be919) {
        if (var_d660eea11eceaf33 == var_bcc2e271115b13f0.name) {
            zone.var_bcc2e271115b13f0 = var_bcc2e271115b13f0;
            break;
        }
    }
    foreach (var_eae85273686f4f4 in zone.chevrons) {
        for (i = 0; i < var_eae85273686f4f4.var_b779cb958bc7769a; i++) {
            var_eae85273686f4f4 setscriptablepartstate("chevron_" + i, zone.var_bcc2e271115b13f0.name);
        }
    }
    zone function_a36dd8549e61c2a1();
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7610
// Size: 0xd1
function function_86543df2bb948a24() {
    zone = self;
    zone.objidnum = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    zone.players = [];
    zone.vehicles = [];
    zone.var_82a3887c0f3b738a = [];
    zone.var_383b3de50746912a = [];
    zone.score = 0;
    zone.isactive = 0;
    zone.var_46b09b33357e572e = 1;
    zone.state = "lock";
    zone.var_f7ec6d992938b955 = undefined;
    zone.var_4eb63a0dc6cd6400 = undefined;
    zone function_cebe23e67cc65f6d();
    zone function_a36dd8549e61c2a1();
    zone function_f6f080447d2f7e50();
    zone thread function_95e3204d0aa4581f();
    zone thread function_be2486dd0def6253();
    return zone;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x76e9
// Size: 0x76
function function_9cbb049ed676e5bf() {
    zone = self;
    zone function_12f42921034bd85d(zone.var_bcc2e271115b13f0.name);
    zone thread function_6f0e0e33cdb00ef6();
    zone.isactive = 1;
    zone.var_d004ede2f247eb3e = [];
    zone.var_46b09b33357e572e = 0;
    zone function_f6f080447d2f7e50();
    zone thread function_2c76ec79be5effdb();
    zone notify("zone_activated");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7766
// Size: 0x3e3
function function_f6f080447d2f7e50() {
    zone = self;
    newstate = zone.state;
    newowner = undefined;
    ownerleft = 0;
    var_7e62e3e7308090d3 = [];
    if (istrue(zone.isactive)) {
        if (istrue(zone.var_46b09b33357e572e)) {
            zone.var_46b09b33357e572e = 0;
        }
        if (zone.players.size == 0) {
            newstate = "idle";
        } else {
            foreach (player in zone.players) {
                if (isdefined(player) && !array_contains(var_7e62e3e7308090d3, player.team)) {
                    var_7e62e3e7308090d3 = array_add(var_7e62e3e7308090d3, player.team);
                }
            }
            if (var_7e62e3e7308090d3.size > 1) {
                newstate = "contested";
            } else {
                newstate = "occupied";
                newowner = var_7e62e3e7308090d3[0];
            }
        }
    } else {
        newstate = ter_op(istrue(zone.var_46b09b33357e572e), "lock", "off");
    }
    var_46b09b33357e572e = newstate == "lock";
    isidle = newstate == "idle";
    iscontested = newstate == "contested";
    var_950511821b7a2895 = newstate == "occupied";
    var_3c0f5c8539e8f9ae = zone.state != newstate;
    var_5e8bd0e4ebf95ac4 = !isdefined(zone.owner) && isdefined(newowner);
    var_443185a3b7bba89c = isdefined(zone.owner) && isdefined(newowner) && zone.owner != newowner;
    ownerleft = isdefined(zone.owner) && zone.owner != "" && iscontested && !array_contains(var_7e62e3e7308090d3, zone.owner);
    var_2098f6281324136c = var_5e8bd0e4ebf95ac4 || var_443185a3b7bba89c;
    if (var_2098f6281324136c) {
        zone.owner = newowner;
        if (var_5e8bd0e4ebf95ac4) {
            zone.var_d9dab6771a3caa4e = newowner;
        }
        zone notify("newOwner");
    }
    if (ownerleft) {
        zone.var_d9dab6771a3caa4e = zone.owner;
        zone.owner = "";
        zone notify("ownerLeft");
    }
    if (var_3c0f5c8539e8f9ae) {
        zone notify("state_changed");
        zone notify("zone_is_" + newstate);
        zone.state = newstate;
        if (iscontested) {
            zone function_675e7d91f544f261();
        } else if (var_950511821b7a2895) {
            zone function_c7689cdc1d1fca8a();
            if (isdefined(zone.var_d9dab6771a3caa4e) && zone.owner != zone.var_d9dab6771a3caa4e) {
                zone.var_d9dab6771a3caa4e = undefined;
            }
        } else if (isidle) {
            zone.owner = undefined;
            zone.var_d9dab6771a3caa4e = undefined;
        }
    }
    if (var_46b09b33357e572e || var_3c0f5c8539e8f9ae || var_2098f6281324136c) {
        zone function_a36dd8549e61c2a1();
        if (isdefined(zone.objidnum)) {
            zone function_d230e52ea9d04f61();
        }
        zone function_753569a44545aaf7();
        foreach (team in var_7e62e3e7308090d3) {
            function_f151ae91a336c4f1(team);
        }
    }
    zone notify("state_updated");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b50
// Size: 0xa0
function function_c7689cdc1d1fca8a() {
    zone = self;
    foreach (player in zone.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player.team == zone.owner) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialog("zone_secured", undefined, [0:player], 0, 0, undefined);
        }
    }
    zone function_a41693628d26ad26();
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7bf7
// Size: 0x13d
function function_675e7d91f544f261() {
    zone = self;
    var_7a46553e8bfe265 = [];
    foreach (player in zone.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (isdefined(zone.owner) && player.team == zone.owner) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialog("zone_contested", undefined, [0:player], 0, 0, undefined);
        } else {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialog("attacking_zone", undefined, [0:player], 0, 0, undefined);
            var_7a46553e8bfe265 = function_6d6af8144a5131f1(var_7a46553e8bfe265, player.team);
        }
    }
    zone function_c7cb254b79c81a4();
    foreach (team in var_7a46553e8bfe265) {
        zone function_ab7cd2b966ca5855(team);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7d3b
// Size: 0xc5
function function_ab7cd2b966ca5855(var_a84a76d896ebe174) {
    if (!istrue(level.brgametype.var_d6f1cdc1f64d318e)) {
        return;
    }
    zone = self;
    teamplayers = getteamdata(var_a84a76d896ebe174, "players");
    foreach (player in teamplayers) {
        if (!array_contains(zone.players, player)) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialog("attacking_" + zone.letter, undefined, [0:player], 0, 0, undefined);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e07
// Size: 0xf7
function function_c7cb254b79c81a4() {
    zone = self;
    if (!istrue(level.brgametype.var_d6f1cdc1f64d318e) || !isdefined(zone.owner)) {
        return;
    }
    if (!isdefined(level.teamdata[zone.owner])) {
        return;
    }
    teamplayers = getteamdata(zone.owner, "players");
    if (!isdefined(teamplayers)) {
        return;
    }
    foreach (player in teamplayers) {
        if (!array_contains(zone.players, player)) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialog(zone.letter + "_contested", undefined, [0:player], 0, 0, undefined);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f05
// Size: 0xf7
function function_a41693628d26ad26() {
    zone = self;
    if (!istrue(level.brgametype.var_d6f1cdc1f64d318e) || !isdefined(zone.owner)) {
        return;
    }
    if (!isdefined(level.teamdata[zone.owner])) {
        return;
    }
    teamplayers = getteamdata(zone.owner, "players");
    if (!isdefined(teamplayers)) {
        return;
    }
    foreach (player in teamplayers) {
        if (!array_contains(zone.players, player)) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialog(zone.letter + "_secured", undefined, [0:player], 0, 0, undefined);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8003
// Size: 0xad
function function_6dd0ce29670eee49(team) {
    zone = self;
    teamplayers = getteamdata(team, "players");
    var_45a3eb54a169cef8 = [];
    foreach (player in teamplayers) {
        if (isdefined(player) && isalive(player) && array_contains(zone.players, player)) {
            var_45a3eb54a169cef8[var_45a3eb54a169cef8.size] = player;
        }
    }
    return var_45a3eb54a169cef8;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x80b8
// Size: 0x51
function function_28e62546df1df48d(team) {
    zone = self;
    var_5e1d8a112ce40669 = spawnstruct();
    var_5e1d8a112ce40669.progress = 0;
    var_5e1d8a112ce40669.players = [];
    zone.var_defcbdc5b9796b2e[team] = var_5e1d8a112ce40669;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8110
// Size: 0x9a
function function_2c76ec79be5effdb() {
    if (!istrue(level.brgametype.var_6e933ab788bf25e7)) {
        return;
    }
    zone = self;
    level endon("game_ended");
    zone endon("deactivate_zone");
    zone.var_defcbdc5b9796b2e = [];
    zone childthread function_5a4a36906bc5ab3c();
    while (1) {
        zone waittill("newOwner");
        if (!isdefined(zone.var_d9dab6771a3caa4e) || zone.var_d9dab6771a3caa4e != zone.owner) {
            zone thread function_ccb54531676bd87e(zone.owner);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x81b1
// Size: 0x18e
function function_ccb54531676bd87e(team) {
    zone = self;
    zone endon("newOwner");
    zone endon("takeover");
    zone endon("ownerLeft");
    zone endon("deactivate_zone");
    var_b4410fa3070bdb2f = level.brgametype.var_b4410fa3070bdb2f;
    while (istrue(zone.isactive) && zone.owner == team) {
        while (zone.state == "occupied") {
            wait(1);
            if (!istrue(zone.state == "occupied")) {
                continue;
            }
            var_b4410fa3070bdb2f--;
            var_9712c9e21fd915f = zone function_6dd0ce29670eee49(team);
            foreach (player in var_9712c9e21fd915f) {
                if (!isdefined(player)) {
                    continue;
                }
                progress = level.brgametype.var_b4410fa3070bdb2f - var_b4410fa3070bdb2f;
                zone.var_defcbdc5b9796b2e[player.team].progress = progress;
                player function_e4bf8b6f5854c6ca(progress);
            }
            if (var_b4410fa3070bdb2f == 0) {
                zone.var_d9dab6771a3caa4e = team;
                zone function_fc7d1961a75ca741(team);
                zone notify("takeover");
            }
        }
        zone waittill("state_updated");
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8346
// Size: 0x307
function function_5a4a36906bc5ab3c() {
    zone = self;
    var_12a76d3d3d173a49 = [];
    while (istrue(zone.isactive)) {
        var_edb67895aa6d6773 = [];
        var_8fe35caa2baf54b0 = [];
        var_edb67895aa6d6773 = array_difference(var_12a76d3d3d173a49, zone.players);
        var_8fe35caa2baf54b0 = array_difference(zone.players, var_12a76d3d3d173a49);
        foreach (player in var_8fe35caa2baf54b0) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(zone.owner) && (!isdefined(zone.var_d9dab6771a3caa4e) || zone.var_d9dab6771a3caa4e != player.team)) {
                if (!array_contains_key(zone.var_defcbdc5b9796b2e, player.team)) {
                    zone function_28e62546df1df48d(player.team);
                }
                zone.var_defcbdc5b9796b2e[player.team].players = array_add(zone.var_defcbdc5b9796b2e[player.team].players, player);
                player function_e4bf8b6f5854c6ca(zone.var_defcbdc5b9796b2e[player.team].progress);
                player function_9b46d53abe69e2bf(1);
            }
        }
        foreach (player in var_edb67895aa6d6773) {
            if (!isdefined(player)) {
                continue;
            }
            player function_9b46d53abe69e2bf(0);
            player function_e4bf8b6f5854c6ca(0);
            if (isdefined(zone.var_defcbdc5b9796b2e[player.team])) {
                zone.var_defcbdc5b9796b2e[player.team].players = array_remove(zone.var_defcbdc5b9796b2e[player.team].players, player);
                if (zone.var_defcbdc5b9796b2e[player.team].players.size == 0) {
                    zone.var_defcbdc5b9796b2e = array_remove_key(zone.var_defcbdc5b9796b2e, player.team);
                    if (isdefined(zone.var_d9dab6771a3caa4e) && zone.var_d9dab6771a3caa4e == player.team) {
                        zone.var_d9dab6771a3caa4e = undefined;
                    }
                }
            }
        }
        var_12a76d3d3d173a49 = zone.players;
        zone waittill_any_2("state_updated", "player_left");
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8654
// Size: 0x101
function function_fc7d1961a75ca741(owner) {
    zone = self;
    foreach (player in zone.players) {
        if (player.team == owner) {
            player function_60afa719948a5de2(level.brgametype.var_f5ca6a058f95e438, zone, 1);
        }
    }
    function_82abf65b162f526f(owner, level.brgametype.var_f5ca6a058f95e438, "takeover");
    function_a5125e3bb9aa0b2a(owner, level.brgametype.var_f5ca6a058f95e438);
    zone function_3e26fdceed81d3a8(level.brgametype.var_f5ca6a058f95e438);
    function_10724ef5718c0736(owner);
    function_17dafc2a055018cd();
    function_e861b56f866e4a9();
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x875c
// Size: 0x8f
function function_753569a44545aaf7() {
    zone = self;
    if (!isdefined(zone.players) || zone.players.size == 0) {
        return;
    }
    foreach (player in zone.players) {
        if (isdefined(player)) {
            player function_10e521b3e1abc656(zone);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x87f2
// Size: 0xff
function function_a36dd8549e61c2a1() {
    zone = self;
    state = zone.state;
    if (zone.state != "off") {
        state = state + zone.var_bcc2e271115b13f0.name;
    }
    foreach (var_eae85273686f4f4 in zone.chevrons) {
        for (i = 0; i < var_eae85273686f4f4.var_b779cb958bc7769a; i++) {
            var_eae85273686f4f4 setscriptablepartstate("chevron_" + i, state);
            if (zone.state == "occupied") {
                var_eae85273686f4f4 function_fca5bdbe24070d20("chevron_" + i, zone.owner);
            }
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88f8
// Size: 0xf8
function function_cebe23e67cc65f6d() {
    zone = self;
    objidnum = zone.objidnum;
    zone.objective = namespace_19b4203b51d56488::createobjidobject(zone.origin, "neutral", (0, 0, 0), objidnum, "any");
    objective_setshowdistance(objidnum, 1);
    objective_sethideelevation(objidnum, 1);
    objective_setshowoncompass(objidnum, 1);
    function_1a20f52de11ba2ef(objidnum, 1);
    function_4eb76f8d303679f4(objidnum, 1);
    if (istrue(level.brgametype.var_a814399cc303b418)) {
        function_c047d7ffe7a83501(objidnum, level.brgametype.var_d993bf69b9541cbf, level.brgametype.var_efbaad993a315482);
        function_f749eb3fbf7dfd39(objidnum, level.brgametype.var_36a5c1335a8ff080, level.brgametype.var_78c2d7d97f7e9215);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x89f7
// Size: 0x1d7
function function_d230e52ea9d04f61() {
    zone = self;
    islocked = zone.state == "lock";
    iscontested = zone.state == "contested";
    var_6e12d19de1a02fe2 = zone.letter;
    var_5d9d309cfc3403bf = ter_op(islocked, "icon_waypoint_base_frame_lock", "icon_waypoint_base_frame_idle");
    var_ef385701debe70b0 = var_5d9d309cfc3403bf + zone.var_bcc2e271115b13f0.name;
    zone.objective.cancontestclaim = !islocked;
    zone.objective.stalemate = iscontested;
    switch (zone.state) {
    case #"hash_7dca1839ef64aba2":
        zone.objective namespace_19b4203b51d56488::setobjectivestatusicons("zc_waypoint_lock_" + var_6e12d19de1a02fe2);
        break;
    case #"hash_1c39674e5b0de0f3":
        zone.objective namespace_19b4203b51d56488::setobjectivestatusicons("zc_waypoint_neutral_" + var_6e12d19de1a02fe2);
        break;
    case #"hash_86bf1a776a7c4cbe":
        zone.objective namespace_19b4203b51d56488::setobjectivestatusicons("zc_waypoint_contested_" + var_6e12d19de1a02fe2);
        break;
    case #"hash_6c1bd689daa03029":
        zone.objective namespace_19b4203b51d56488::setobjectivestatusicons("zc_waypoint_defending_" + var_6e12d19de1a02fe2, "zc_waypoint_losing_" + var_6e12d19de1a02fe2, zone.objidnum, zone.owner);
        break;
    }
    zone.objective.wasstalemate = zone.objective.stalemate;
    function_38c981837ad9518b(zone.objidnum, var_ef385701debe70b0);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8bd5
// Size: 0x92
function function_95e3204d0aa4581f() {
    zone = self;
    level endon("game_ended");
    zone endon("deactivate_zone");
    while (1) {
        var_b25b5c45202c880c = zone waittill("trigger");
        if (isplayer(var_b25b5c45202c880c)) {
            if (array_contains(zone.players, var_b25b5c45202c880c)) {
                continue;
            }
            zone thread function_a32464c6dffe6d1(var_b25b5c45202c880c);
        } else if (function_46db667f66f9761e(var_b25b5c45202c880c)) {
            if (array_contains(zone.vehicles, var_b25b5c45202c880c)) {
                continue;
            }
            zone thread function_ad2906ab4702c1e6(var_b25b5c45202c880c);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8c6e
// Size: 0xf4
function private function_53b59fd7e847103b() {
    zone = self;
    var_98a5425ad272810f = zone getboundshalfsize();
    var_4a6abc8d46fb3619 = sqrt(squared(var_98a5425ad272810f[0]) + squared(var_98a5425ad272810f[1]));
    var_58cab040fd809108 = getlootscriptablearrayinradius(undefined, undefined, zone.origin, var_4a6abc8d46fb3619);
    var_15837bd28f442406 = [];
    if (isdefined(var_58cab040fd809108)) {
        foreach (var_db376ee90688810d in var_58cab040fd809108) {
            var_bd3e849e7b352d21 = var_db376ee90688810d getscriptableisreserved() && isdefined(var_db376ee90688810d.brpickupscriptableid);
            if (var_bd3e849e7b352d21 && namespace_cb965d2f71fefddc::function_2ae5e94bd6518ab5(var_db376ee90688810d, 0)) {
                var_15837bd28f442406 = array_add(var_15837bd28f442406, var_db376ee90688810d);
            }
        }
    }
    return var_15837bd28f442406;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x8d6a
// Size: 0x6b
function private function_a59c0799e29f229c(var_7603fa242367c756, var_7603f9242367c523) {
    /#
        assert(isdefined(var_7603fa242367c756));
    #/
    /#
        assert(isdefined(var_7603fa242367c756.brpickupscriptableid));
    #/
    /#
        assert(isdefined(var_7603f9242367c523));
    #/
    /#
        assert(isdefined(var_7603f9242367c523.brpickupscriptableid));
    #/
    return var_7603fa242367c756.brpickupscriptableid < var_7603f9242367c523.brpickupscriptableid;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8ddd
// Size: 0x90
function private function_be2486dd0def6253() {
    zone = self;
    level endon("game_ended");
    zone endon("deactivate_zone");
    while (1) {
        var_a679c918818fa808 = function_53b59fd7e847103b();
        var_a679c918818fa808 = array_sort_with_func(var_a679c918818fa808, &function_a59c0799e29f229c);
        var_a0a4105e0662ede0 = max(var_a679c918818fa808.size - level.brgametype.var_77134f0ddb570883, 0);
        for (i = 0; i < var_a0a4105e0662ede0; i++) {
            namespace_cb965d2f71fefddc::loothide(var_a679c918818fa808[i]);
        }
        wait(10);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e74
// Size: 0xaa
function function_a32464c6dffe6d1(player) {
    zone = self;
    level endon("game_ended");
    zone endon("deactivate_zone");
    player endon("death_or_disconnect");
    while (1) {
        waitframe();
        if (ispointinvolume(player.origin + (0, 0, 10), zone)) {
            if (array_contains(zone.players, player)) {
                continue;
            }
            if (!player namespace_f8065cafc523dba5::_isalive()) {
                continue;
            }
            zone function_3261ee4bb897dff4(player);
        } else if (array_contains(zone.players, player)) {
            zone function_a105b78e4fe62e20(player);
            break;
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8f25
// Size: 0x9d
function function_ad2906ab4702c1e6(vehicle) {
    zone = self;
    level endon("game_ended");
    zone endon("deactivate_zone");
    vehicle endon("death");
    while (1) {
        waitframe();
        if (ispointinvolume(vehicle.origin + (0, 0, 10), zone)) {
            if (array_contains(zone.vehicles, vehicle)) {
                continue;
            }
            zone function_b4d85f72946eac2b(vehicle);
        } else if (array_contains(zone.vehicles, vehicle)) {
            zone function_47e70a48eeafa5f3(vehicle);
            break;
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8fc9
// Size: 0xde
function function_6f0e0e33cdb00ef6() {
    zone = self;
    level endon("game_ended");
    zone endon("deactivate_zone");
    zone endon("last_state_reach");
    if (!istrue(level.brgametype.var_719c030c6596b6a5)) {
        return;
    }
    zone.score = zone.var_bcc2e271115b13f0.basescore;
    while (1) {
        if (zone.var_bcc2e271115b13f0.name == "2") {
            zone notify("last_state_reach");
            break;
        }
        zone waittill("zone_score_updated");
        if (zone.score > zone.var_bcc2e271115b13f0.milestone) {
            zone function_12f42921034bd85d(zone.var_bcc2e271115b13f0.var_51bb8ba0dd6cab42);
            function_f6f080447d2f7e50();
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x90ae
// Size: 0x89
function function_c7641266e2fcbde4() {
    zone = self;
    if (zone.players.size == 0) {
        return;
    }
    foreach (player in zone.players) {
        if (isdefined(player)) {
            namespace_5a22b6f3a56f7e9b::objective_unpin_player(zone.objidnum, player, 0);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x913e
// Size: 0x39
function function_3e26fdceed81d3a8(var_df1128c61de0989d) {
    zone = self;
    zone.score = zone.score + var_df1128c61de0989d;
    zone notify("zone_score_updated");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x917e
// Size: 0x2f
function function_dc8c285f0e287553(score) {
    zone = self;
    return score * zone.var_bcc2e271115b13f0.multiplier;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x91b5
// Size: 0x1ec
function function_4549da620dbe742b() {
    if (!istrue(level.brgametype.var_faf946460fcee87b)) {
        return 0;
    }
    zone = self;
    if (!isdefined(zone.var_f7ec6d992938b955) || !isdefined(zone.var_4eb63a0dc6cd6400)) {
        zone function_5a69b488063c5b72();
    }
    var_b5159586171affa6 = 0;
    switch (zone.state) {
    case #"hash_6c1bd689daa03029":
        if (zone.players.size >= 2) {
            var_df918fdc2ed39815 = zone.players[0].team;
            if (zone.var_f7ec6d992938b955 == var_df918fdc2ed39815) {
                zone.var_4eb63a0dc6cd6400--;
                if (zone.var_4eb63a0dc6cd6400 == 0) {
                    function_82abf65b162f526f(var_df918fdc2ed39815, level.brgametype.var_416febdc38ed88be, "squadBonus");
                    var_b5159586171affa6 = 1;
                    zone function_5a69b488063c5b72(var_df918fdc2ed39815);
                }
            } else {
                zone function_5a69b488063c5b72(var_df918fdc2ed39815);
            }
        } else {
            zone function_5a69b488063c5b72();
        }
        break;
    case #"hash_86bf1a776a7c4cbe":
        if (zone.var_f7ec6d992938b955 != "") {
            var_ebaeb4f62b1d5c42 = 0;
            foreach (player in zone.players) {
                if (player.team == zone.var_f7ec6d992938b955) {
                    var_ebaeb4f62b1d5c42 = 1;
                    break;
                }
            }
            if (!istrue(var_ebaeb4f62b1d5c42)) {
                zone function_5a69b488063c5b72();
            }
        }
        break;
    default:
        zone function_5a69b488063c5b72();
        break;
    }
    return var_b5159586171affa6;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x93a9
// Size: 0x51
function function_5a69b488063c5b72(var_df918fdc2ed39815) {
    zone = self;
    zone.var_4eb63a0dc6cd6400 = level.brgametype.var_a4153ae6bcb25fc3;
    zone.var_f7ec6d992938b955 = ter_op(isdefined(var_df918fdc2ed39815), var_df918fdc2ed39815, "");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9401
// Size: 0xba
function function_3261ee4bb897dff4(player) {
    zone = self;
    zone.players = array_add(zone.players, player);
    player.zone = zone;
    player thread function_46c6d8c759215e1c(zone);
    player thread function_d30659dffead9a7d(zone);
    zone thread function_18bf6044ff24f869(player);
    namespace_5a22b6f3a56f7e9b::objective_pin_player(zone.objidnum, player);
    if (zone.state == "contested") {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialog("attacking_zone", undefined, [0:player], 0, 0, undefined);
    }
    zone function_f6f080447d2f7e50();
    function_f151ae91a336c4f1(player.team);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x94c2
// Size: 0x89
function function_a105b78e4fe62e20(player) {
    zone = self;
    player notify("player_left_zone");
    player function_5e5f912a3729eb(zone);
    namespace_5a22b6f3a56f7e9b::objective_unpin_player(zone.objidnum, player, 1);
    zone.players = array_remove(zone.players, player);
    player.zone = undefined;
    zone function_f6f080447d2f7e50();
    zone notify("player_left");
    function_f151ae91a336c4f1(player.team);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9552
// Size: 0xb8
function function_b4d85f72946eac2b(vehicle) {
    zone = self;
    zone.vehicles = array_add(zone.vehicles, vehicle);
    foreach (player in vehicle.occupants) {
        if (!array_contains(zone.players, player)) {
            zone function_3261ee4bb897dff4(player);
        }
        zone thread function_b37580861362cc67(vehicle, player);
    }
    zone thread function_a8244d901881cb3a(vehicle);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9611
// Size: 0xab
function function_47e70a48eeafa5f3(vehicle) {
    zone = self;
    vehicle notify("vehicle_left_zone");
    foreach (player in vehicle.occupants) {
        if (array_contains(zone.players, player)) {
            zone function_a105b78e4fe62e20(player);
        }
    }
    zone.vehicles = array_remove(zone.vehicles, vehicle);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x96c3
// Size: 0x95
function function_18bf6044ff24f869(player) {
    zone = self;
    level endon("game_ended");
    player endon("player_left_zone");
    zone endon("deactivate_zone");
    player waittill("death_or_disconnect");
    if (isdefined(player)) {
        namespace_5a22b6f3a56f7e9b::objective_unpin_player(zone.objidnum, player, 1);
        zone.players = array_remove(zone.players, player);
    } else {
        zone.players = array_removeundefined(zone.players);
    }
    zone function_f6f080447d2f7e50();
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x975f
// Size: 0x82
function function_a8244d901881cb3a(vehicle) {
    zone = self;
    level endon("game_ended");
    vehicle endon("vehicle_left_zone");
    zone endon("deactivate_zone");
    vehicle waittill_any_2("death", "player_enter");
    if (isdefined(vehicle)) {
        zone.vehicles = array_remove(zone.vehicles, vehicle);
    } else {
        zone.vehicles = array_removeundefined(zone.vehicles);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x97e8
// Size: 0x8c
function function_b37580861362cc67(vehicle, player) {
    zone = self;
    level endon("game_ended");
    vehicle endon("vehicle_left_zone");
    zone endon("deactivate_zone");
    waittill_any_ents(vehicle, "death", player, "vehicle_exit", player, "death_or_disconnect");
    if (array_contains(zone.players, player)) {
        zone function_a105b78e4fe62e20(player);
    } else {
        zone.players = array_removeundefined(zone.players);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x987b
// Size: 0x21
function function_9aaed3ab745b2a1a(vehicle, player) {
    if (isdefined(vehicle)) {
        vehicle notify("player_enter");
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x98a3
// Size: 0x46
function function_928e26a37ff97761(player) {
    zone = self;
    var_a9de32a7b66e5872 = istrue(zone.isactive) && !array_contains(zone.var_82a3887c0f3b738a, player);
    return var_a9de32a7b66e5872;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x98f1
// Size: 0x46
function function_a627c95c694d7093(player) {
    zone = self;
    var_a9de32a7b66e5872 = istrue(zone.isactive) && !array_contains(zone.var_383b3de50746912a, player);
    return var_a9de32a7b66e5872;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x993f
// Size: 0x68
function function_a06dbccc97e32939(player) {
    zone = self;
    player endon("disconnect");
    level endon("game_ended");
    zone.var_82a3887c0f3b738a = array_add(zone.var_82a3887c0f3b738a, player);
    wait(0.3);
    zone.var_82a3887c0f3b738a = array_remove(zone.var_82a3887c0f3b738a, player);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x99ae
// Size: 0x68
function function_d1736a0c0c0b2e0b(player) {
    zone = self;
    player endon("disconnect");
    level endon("game_ended");
    zone.var_383b3de50746912a = array_add(zone.var_383b3de50746912a, player);
    wait(0.3);
    zone.var_383b3de50746912a = array_remove(zone.var_383b3de50746912a, player);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a1d
// Size: 0x66
function function_e6b67d05f77313f() {
    player = self;
    player endon("disconnect");
    player waittill("spawned_player");
    wait(1);
    if (!istrue(level.br_infils_disabled)) {
        player waittill("joining_Infil");
    } else {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    wait(1);
    player namespace_44abc05161e2e2cb::showsplash("zc_mode_intro", undefined, undefined, undefined, undefined, "splash_list_iw9_br_zonecontrol");
    namespace_a011fbf6d93f25e5::branalytics_landing(player);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9a8a
// Size: 0x1bc
function function_60afa719948a5de2(points, zone, var_7a58fc3a248245b0) {
    player = self;
    var_b2222a047729c009 = isdefined(zone) && (zone.state == "occupied" || istrue(var_7a58fc3a248245b0));
    if (!istrue(var_b2222a047729c009)) {
        return 0;
    }
    if (!istrue(var_7a58fc3a248245b0)) {
        points = points * player.var_53e3af3b2c8752bd;
    }
    player.matchPoints = player.matchPoints + points;
    player.pers["matchPoints"] = player.matchPoints;
    player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("matchPoints", player.matchPoints);
    if (isdefined(zone) && player.scorestreak == 0) {
        player function_92ac85a6bf2d40ce(zone);
        player thread function_9c429a69b568b5f1(zone);
    }
    player thread function_73581db4ca9f8bfa(zone);
    player.scorestreak = player.scorestreak + points;
    player function_f2278c0d03136386(player.scorestreak);
    if (player.scorestreak >= 10 && !istrue(player.var_aa3bef3360032a04) && isdefined(zone)) {
        player thread function_7686d4004be7259c();
    }
    if (player.scorestreak > player.longestScoreStreak) {
        player.longestScoreStreak = player.scorestreak;
        player.pers["longestScoreStreak"] = player.scorestreak;
        player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("longestScoreStreak", int(min(player.longestScoreStreak, 1023)));
    }
    return points;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c4e
// Size: 0x1f7
function function_46c6d8c759215e1c(zone) {
    player = self;
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("player_left_zone");
    zone endon("deactivate_zone");
    if (!istrue(zone.isactive)) {
        zone waittill("zone_activated");
    }
    while (1) {
        victim = player waittill("got_a_kill");
        if (zone.state != "occupied") {
            continue;
        }
        if (ispointinvolume(player.origin + (0, 0, 10), zone)) {
            var_6ab5606da9634c9a = 0;
            if (isdefined(level.brgametype.var_3237373815779bf5) && victim.team == level.brgametype.var_3237373815779bf5) {
                player namespace_48a08c5037514e04::doScoreEvent(#"hash_aa8de88677f7703e");
                if (istrue(level.brgametype.var_ef80665d53789d98)) {
                    var_6ab5606da9634c9a = level.brgametype.var_bbce590c8e68f35b;
                    player thread function_a18eeb8060957a40();
                    if (istrue(level.brgametype.var_fa48bea82741b77a)) {
                        var_6ab5606da9634c9a = var_6ab5606da9634c9a * level.brgametype.var_16118949d71fbb2f;
                    }
                }
            } else if (istrue(level.brgametype.var_a44df2a0823c0ace)) {
                player function_38643bc5200d7146(zone);
                var_6ab5606da9634c9a = zone function_dc8c285f0e287553(level.brgametype.var_6f677ae3468374bd);
            }
            if (var_6ab5606da9634c9a == 0) {
                continue;
            }
            var_6ab5606da9634c9a = player function_60afa719948a5de2(var_6ab5606da9634c9a, zone);
            function_a5125e3bb9aa0b2a(player.team, var_6ab5606da9634c9a);
            function_10724ef5718c0736(player.team);
            zone function_3e26fdceed81d3a8(var_6ab5606da9634c9a);
            function_17dafc2a055018cd();
            function_e861b56f866e4a9();
        } else {
            zone function_a105b78e4fe62e20(player);
            break;
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9e4c
// Size: 0xf3
function function_10e521b3e1abc656(zone) {
    player = self;
    switch (zone.state) {
    case #"hash_7dca1839ef64aba2":
        player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(1, "MP_INGAME_ONLY/OBJ_ZC_LOCKED_CAPS", 0);
        break;
    case #"hash_86bf1a776a7c4cbe":
        player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(1, "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", 0);
        break;
    case #"hash_1c39674e5b0de0f3":
        player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(1, "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", 0);
        break;
    case #"hash_6c1bd689daa03029":
        if (isdefined(zone.owner) && player.team == zone.owner) {
            player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(1, "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", 0);
        } else {
            player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(1, "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", 0);
        }
        break;
    default:
        break;
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9f46
// Size: 0x39
function function_5e5f912a3729eb(zone) {
    player = self;
    if (zone function_a627c95c694d7093(player)) {
        player playlocalsound("uin_iw9_lockdown_zone_exit");
        zone thread function_d1736a0c0c0b2e0b(player);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9f86
// Size: 0xcf
function function_d30659dffead9a7d(zone) {
    player = self;
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("player_left_zone");
    if (!istrue(zone.isactive)) {
        zone waittill("zone_activated");
    }
    if (ispointinvolume(player.origin + (0, 0, 10), zone)) {
        if (zone function_928e26a37ff97761(player)) {
            var_943e7b35d7d5a26e = zone.var_bcc2e271115b13f0.name == "2";
            var_761a6a24f41d95c8 = ter_op(var_943e7b35d7d5a26e, "uin_iw9_lockdown_zone_enter_special", "uin_iw9_lockdown_zone_enter");
            player playlocalsound(var_761a6a24f41d95c8);
            zone thread function_a06dbccc97e32939(player);
        }
        player thread function_8d62c12b7583fa6a(zone);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa05c
// Size: 0x41
function function_8d62c12b7583fa6a(zone) {
    player = self;
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("player_left_zone");
    zone waittill("deactivate_zone");
    player playlocalsound("uin_iw9_lockdown_zone_exit");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa0a4
// Size: 0x9b
function function_7686d4004be7259c() {
    player = self;
    level endon("game_ended");
    player endon("death_or_disconnect");
    if (level.var_2d54101de4b3f30e < 25) {
        return;
    }
    if (isdefined(player.var_acfbb9caed7125f9) && player.var_acfbb9caed7125f9 == 1) {
        var_9be07d4da97c507b = namespace_e688cd9db0404268::function_17ee301cf0b5ba85("zc_zone_streak_main_classic");
        player setplayermusicstate(var_9be07d4da97c507b);
    } else {
        var_e9602e7cd3b7a190 = namespace_e688cd9db0404268::function_17ee301cf0b5ba85("zc_zone_streak_main");
        player setplayermusicstate(var_e9602e7cd3b7a190);
    }
    player.var_aa3bef3360032a04 = 1;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa146
// Size: 0x28
function function_154e26c852e765f5() {
    player = self;
    player setplayermusicstate("");
    player.var_aa3bef3360032a04 = 0;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa175
// Size: 0x54
function function_92ac85a6bf2d40ce(zone) {
    player = self;
    if (isdefined(player.var_d62a69764568db0e) && player.var_d62a69764568db0e == 0) {
        return;
    }
    player namespace_48a08c5037514e04::doScoreEvent(#"hash_c96052f73cdd535");
    player thread function_7d8b3761cad2aa7a(zone);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa1d0
// Size: 0x6e
function function_7d8b3761cad2aa7a(zone) {
    player = self;
    player endon("disconnect");
    level endon("game_ended");
    player.var_d62a69764568db0e = 0;
    waittill_any_ents(player, "death", player, "player_left_zone", zone, "deactivate_zone");
    wait(level.brgametype.var_9b3e632a26358302);
    player.var_d62a69764568db0e = 1;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa245
// Size: 0x4f
function function_38643bc5200d7146(zone) {
    player = self;
    scoreevent = function_2ef675c13ca1c4af(#"hash_47a10fc2dcd83760", zone.var_bcc2e271115b13f0.name);
    player namespace_48a08c5037514e04::doScoreEvent(scoreevent);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa29b
// Size: 0xa6
function function_9c429a69b568b5f1(zone) {
    player = self;
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("player_left_zone");
    zone endon("deactivate_zone");
    while (1) {
        wait(level.brgametype.var_13d640cee5df4ac3);
        if (zone.state == "occupied") {
            scoreevent = function_2ef675c13ca1c4af(#"hash_c53d998f9895672b", zone.var_bcc2e271115b13f0.name);
            player namespace_48a08c5037514e04::doScoreEvent(scoreevent);
        } else {
            zone waittill("state_changed");
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa348
// Size: 0xf5
function function_3ae9c7708bf1def0(zone) {
    player = self;
    if (!istrue(level.brgametype.var_faf946460fcee87b)) {
        return;
    }
    teamplayers = getteamdata(player.team, "players");
    playercount = 0;
    foreach (var_736d8d9188ccbd45 in teamplayers) {
        if (isdefined(var_736d8d9188ccbd45) && array_contains(zone.players, var_736d8d9188ccbd45)) {
            playercount++;
        }
    }
    if (playercount < 2) {
        return;
    }
    player function_105610bcc7bfe379();
    scoreevent = function_2ef675c13ca1c4af(#"hash_8e73d19416d829d9", playercount);
    player namespace_48a08c5037514e04::doScoreEvent(scoreevent);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa444
// Size: 0x112
function function_4cd419222e96102d(player) {
    /#
        assert(isdefined(player));
    #/
    /#
        assert(isalive(player));
    #/
    if (istrue(player.var_5393b7ee3366d551)) {
        return;
    }
    player.var_5393b7ee3366d551 = 1;
    player.objidnum = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    namespace_5a22b6f3a56f7e9b::objective_add(player.objidnum, "active", player.origin, "ui_mp_br_mapmenu_icon_assassin_objective_enemy");
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(player.objidnum, 1);
    namespace_5a22b6f3a56f7e9b::objective_mask_showtoenemyteam(player.objidnum, player);
    function_d76cc64b205084a3(player.objidnum, 1);
    player thread function_20ccc09dd75230ad();
    player thread function_87903377a0c54746();
    var_67572a1be4aee419 = player namespace_f8065cafc523dba5::isinvehicle();
    if (!istrue(level.brgametype.var_10182c9dcaf0d685) && !istrue(var_67572a1be4aee419)) {
        player namespace_d20f8ef223912e12::function_8d739ec62c568c41("prop_zc_game_flag");
    }
    player thread function_e1a5576f165b30ae(var_67572a1be4aee419);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa55d
// Size: 0x7a
function function_20ccc09dd75230ad() {
    player = self;
    level endon("game_ended");
    level endon("new_leaders");
    player endon("death_or_disconnect");
    while (1) {
        wait(level.brgametype.var_e75711d488aad5c9);
        if (isdefined(player.objidnum)) {
            namespace_5a22b6f3a56f7e9b::update_objective_position(player.objidnum, player.origin + (0, 0, 80));
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa5de
// Size: 0x4c
function function_87903377a0c54746() {
    player = self;
    level endon("game_ended");
    level endon("new_leaders");
    var_82794b442ea4abce = player.objidnum;
    waittill_any_ents(player, "death_or_disconnect");
    level function_7754e43584e5a8ea(player, var_82794b442ea4abce, 1);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa631
// Size: 0x79
function function_e1a5576f165b30ae(var_67572a1be4aee419) {
    player = self;
    level endon("game_ended");
    level endon("new_leaders");
    player endon("death_or_disconnect");
    while (1) {
        if (!istrue(var_67572a1be4aee419)) {
            player waittill("vehicle_enter");
            player namespace_d20f8ef223912e12::function_96d6b5e51dd4a63b();
        }
        player waittill("vehicle_exit");
        var_67572a1be4aee419 = 0;
        if (!istrue(level.brgametype.var_10182c9dcaf0d685)) {
            player namespace_d20f8ef223912e12::function_8d739ec62c568c41("prop_zc_game_flag");
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa6b1
// Size: 0xa2
function function_7754e43584e5a8ea(player, var_82794b442ea4abce, var_5af933b7b2b07f42) {
    var_11a6666371459fa7 = !isdefined(player);
    if (var_11a6666371459fa7) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(var_82794b442ea4abce);
    } else if (istrue(player.var_5393b7ee3366d551)) {
        player.var_5393b7ee3366d551 = undefined;
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(var_82794b442ea4abce);
        player.objidnum = undefined;
        player namespace_d20f8ef223912e12::function_96d6b5e51dd4a63b();
        if (!istrue(var_5af933b7b2b07f42)) {
            player namespace_44abc05161e2e2cb::showsplash("zc_lead_lost", undefined, undefined, undefined, undefined, "splash_list_iw9_br_zonecontrol");
            level thread namespace_d3d40f75bb4e4c32::brleaderdialog("lead_lost", undefined, [0:player], 1, 0, undefined);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa75a
// Size: 0x101
function function_73581db4ca9f8bfa(zone) {
    player = self;
    player notify("beginScorestreak");
    level endon("game_ended");
    player endon("disconnect");
    player endon("beginScorestreak");
    isinzone = 1;
    while (isinzone) {
        waittill_any_ents(player, "death", player, "player_left_zone", zone, "deactivate_zone");
        if (isalive(player) && !isdefined(player.zone)) {
            wait(level.brgametype.var_a5fc9e22f4382909);
        }
        if (isalive(player) && isdefined(player.zone) && (player.zone.state == "occupied" || player.zone.state == "contested")) {
            zone = player.zone;
        } else {
            isinzone = 0;
        }
    }
    player function_f61be6566453b5a4();
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa862
// Size: 0x89
function function_b96f59f29d1c4398() {
    player = self;
    player thread function_c31d411c03f9923b();
    score = function_a97d64dd14f6d878(player.team);
    if (!isdefined(level.brgametype.var_3237373815779bf5)) {
        return;
    }
    var_c12cc113066dd7fa = getteamdata(level.brgametype.var_3237373815779bf5, "players");
    if (array_contains(var_c12cc113066dd7fa, player)) {
        player thread function_cf348fb9247c7213();
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa8f2
// Size: 0x101
function function_c31d411c03f9923b() {
    player = self;
    var_72519cd6ec9cc2e2 = !isdefined(level.brgametype.var_ac1c493adfb1430e) || level.brgametype.var_ac1c493adfb1430e.size == 0 || !istrue(level.brgametype.var_ac1c493adfb1430e[0].isactive);
    if (!istrue(level.brgametype.var_8ea33e944d74f0cf) || istrue(var_72519cd6ec9cc2e2) || istrue(player.var_23b725dc2dcc0eca)) {
        return;
    }
    player notify("tryPlayObjectiveDialog");
    level endon("game_ended");
    level endon("deactivate_active_zone");
    player endon("death_or_disconnect");
    player endon("beginScorestreak");
    player endon("tryPlayObjectiveDialog");
    wait(level.brgametype.var_f983a9d28a83a074);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialog("play_objective", undefined, [0:player], 0, 0, undefined);
    player.var_23b725dc2dcc0eca = 1;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa9fa
// Size: 0x7f
function function_cf348fb9247c7213() {
    player = self;
    level endon("game_ended");
    player endon("death_or_disconnect");
    if (!isdefined(level.brgametype.var_3237373815779bf5)) {
        return;
    }
    while (!player isonground()) {
        waitframe();
    }
    var_c12cc113066dd7fa = getteamdata(level.brgametype.var_3237373815779bf5, "players");
    if (array_contains(var_c12cc113066dd7fa, player)) {
        level function_4cd419222e96102d(player);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa80
// Size: 0x37
function function_f61be6566453b5a4() {
    player = self;
    player.scorestreak = 0;
    player function_f2278c0d03136386(player.scorestreak);
    player function_154e26c852e765f5();
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaabe
// Size: 0x2a
function function_f2278c0d03136386(scorestreak) {
    player = self;
    player namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_zonecontrol_client_data2", 6, 13, scorestreak);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaaef
// Size: 0x29
function function_4bbcb0b68d6681b6(rank) {
    player = self;
    player namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_zonecontrol_client_data2", 0, 6, rank);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab1f
// Size: 0x3b
function function_a18eeb8060957a40() {
    player = self;
    player namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_zonecontrol_client_data2", 14 + 6, 1, 1);
    waitframe();
    player namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_zonecontrol_client_data2", 14 + 6, 1, 0);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xab61
// Size: 0x2d
function function_9b46d53abe69e2bf(active) {
    player = self;
    player namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_zonecontrol_client_data2", 15 + 6, 1, active);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xab95
// Size: 0x2d
function function_e4bf8b6f5854c6ca(var_fe29c8d83f80ff32) {
    player = self;
    player namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_zonecontrol_client_data2", 17 + 6, 3, var_fe29c8d83f80ff32);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xabc9
// Size: 0x3b
function function_105610bcc7bfe379() {
    player = self;
    player namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_zonecontrol_client_data2", 16 + 6, 1, 1);
    waitframe();
    player namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_zonecontrol_client_data2", 16 + 6, 1, 0);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xac0b
// Size: 0x2d
function function_a8722f6b1d8b1bcd(isactive) {
    player = self;
    player namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_zonecontrol_client_data2", 13 + 6, 1, isactive);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xac3f
// Size: 0x29
function function_dae80bbaa1d7b643(score) {
    player = self;
    player namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_zonecontrol_client_data", 0, 13, score);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xac6f
// Size: 0x9f
function function_943449ac36405826(playerteam) {
    player = self;
    enemyscore = 0;
    foreach (team, var_6eef49fde768c24f in level.brgametype.var_6eef49fde768c24f) {
        if (playerteam == team) {
            continue;
        }
        if (var_6eef49fde768c24f > enemyscore) {
            enemyscore = var_6eef49fde768c24f;
        }
    }
    player namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_zonecontrol_client_data", 13, 13, enemyscore);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xad15
// Size: 0x3c
function function_5c969a7697e1a7cd(var_447913206d1f7916, timeuntilspawn, var_f9a785628f97eec6) {
    spawnorigin = namespace_c5622898120e827f::getrandompointinboundssafecircle();
    if (isdefined(spawnorigin)) {
        spawnorigin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(spawnorigin);
    }
    return spawnorigin;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xad59
// Size: 0xea
function function_9017ffcfbfb5d51c() {
    var_9de5c42a0edb36f4 = [];
    var_b0cf0545c2fdf0e0 = [];
    var_d00bf195e2ab16cf = getdvarint(@"hash_b0e54987b343400d", 3500);
    foreach (cluster in level.brgametype.var_58b474cb0e57096a) {
        var_9de5c42a0edb36f4[var_9de5c42a0edb36f4.size] = level.brgametype.clusters[cluster].origin;
        var_b0cf0545c2fdf0e0[var_b0cf0545c2fdf0e0.size] = function_2b12c267b4a765f1(cluster) + var_d00bf195e2ab16cf;
    }
    level.brgametype.var_9de5c42a0edb36f4 = var_9de5c42a0edb36f4;
    level.brgametype.var_b0cf0545c2fdf0e0 = var_b0cf0545c2fdf0e0;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae4a
// Size: 0xda
function function_2b12c267b4a765f1(var_ded994656b8d402a) {
    var_1c683105d19d60a3 = level.brgametype.clusters[var_ded994656b8d402a].origin;
    var_b2d6a56cc8091c98 = level.brgametype.clusters[var_ded994656b8d402a].zones;
    circleradius = 0;
    foreach (zone in var_b2d6a56cc8091c98) {
        var_6580de42ef106baf = distance2d(var_1c683105d19d60a3, zone.origin);
        if (circleradius < var_6580de42ef106baf) {
            circleradius = var_6580de42ef106baf;
        }
    }
    return circleradius;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaf2c
// Size: 0xa4
function function_94e64fe4713eff4b() {
    var_c661e5b77c016382 = getdvarint(@"hash_feb7dc22d6befab3", 10);
    var_d5bb10777af0fdb1 = namespace_813f5a035e59565a::createMultiCircleObjectivesStruct(level.brgametype.var_b4a42a0051f3fed8 + level.brgametype.var_b458560354506894, level.brgametype.var_9fdb99442028fca4, var_c661e5b77c016382, level.brgametype.var_adafbaf3c7e24ad3, level.brgametype.var_9de5c42a0edb36f4, level.brgametype.var_b0cf0545c2fdf0e0);
    return var_d5bb10777af0fdb1;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xafd8
// Size: 0x8e
function function_ed8612f4c8e6bb7e(var_501501dcd163ba3e, var_c68ed0ffa54d516b, var_3f29bc8b1c6fc48) {
    foreach (team in level.teamnamelist) {
        if (team == var_501501dcd163ba3e) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam(var_c68ed0ffa54d516b, team, undefined, 1);
        } else {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam(var_3f29bc8b1c6fc48, team, undefined, 1);
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb06d
// Size: 0x5b
function debug_init() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("dialog");
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("lead_lost", "zncn_grav_vccf", &function_2e238c75db4dd1de);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("_secured", "zc_mvp", &function_1423f70cfe3c2937);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("medic", "1", &function_1b4adfc797fdf296);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb0cf
// Size: 0x163
function function_2e238c75db4dd1de() {
    /#
        if (istrue(level.brgametype.var_e03c2d67a1480c16)) {
            function_1423f70cfe3c2937();
        }
        level.brgametype.var_e03c2d67a1480c16 = 1;
        var_80f79f1f34962641 = 32;
        foreach (var_ded994656b8d402a in level.brgametype.var_58b474cb0e57096a) {
            function_fdf17ddb1f56d876(var_ded994656b8d402a);
            cluster = level.brgametype.clusters[var_ded994656b8d402a];
            foreach (zone in cluster.zones) {
                if (!isdefined(zone.objidnum)) {
                    zone.objidnum = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
                    zone function_cebe23e67cc65f6d();
                }
                objective_state(zone.objidnum, "deactivate_active_zone");
                var_80f79f1f34962641--;
                if (var_80f79f1f34962641 <= 0) {
                    return;
                }
            }
        }
    #/
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb239
// Size: 0xed
function function_1423f70cfe3c2937() {
    /#
        foreach (cluster in level.brgametype.clusters) {
            foreach (zone in cluster.zones) {
                if (isdefined(zone.objidnum)) {
                    namespace_5a22b6f3a56f7e9b::returnobjectiveid(zone.objidnum);
                    zone.objidnum = undefined;
                }
            }
        }
        level.brgametype.var_e03c2d67a1480c16 = 0;
    #/
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb32d
// Size: 0x65
function function_1b4adfc797fdf296() {
    /#
        var_d64013abdcc3ea51 = istrue(level.brgametype.var_e03c2d67a1480c16);
        if (var_d64013abdcc3ea51) {
            function_1423f70cfe3c2937();
        }
        level.brgametype.var_58b474cb0e57096a = [];
        function_de45f3ba013d803c();
        function_9017ffcfbfb5d51c();
        namespace_c5622898120e827f::initcircle();
        if (var_d64013abdcc3ea51) {
            function_2e238c75db4dd1de();
        }
    #/
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb399
// Size: 0xa
function function_5ba95c324df19c13() {
    level endon("game_ended");
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb3aa
// Size: 0xd2
function function_1524c00de48c44f3(time, var_4e378291cbea730e) {
    level endon("game_ended");
    level endon("overtime");
    var_ad07cb0c4e8d2c6c = ter_op(time >= 15 && var_4e378291cbea730e == 0, 1, 0);
    if (istrue(var_ad07cb0c4e8d2c6c)) {
        wait(time - 15);
        var_e4f897fd579ba3c7 = ter_op(istrue(level.brgametype.var_2a33f7cb739a32f1 == level.brgametype.var_6bf149b60da04f9b - 1), "uin_iw9_lockdown_final_round_end_time_15sec", "uin_iw9_lockdown_round_end_time_15sec");
        function_23a142e89743326d(var_e4f897fd579ba3c7);
    } else {
        var_e4a56d4ef907a94e = ter_op(time >= 15 && var_4e378291cbea730e == 2, 1, 0);
        if (istrue(var_e4a56d4ef907a94e)) {
            wait(time - 20);
            function_23a142e89743326d("uin_iw9_lockdown_overtime_timer_20sec");
        }
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb483
// Size: 0x75
function function_23a142e89743326d(sfx) {
    foreach (player in level.players) {
        if (!isdefined(player) || !namespace_7e17181d03156026::isreallyalive(player)) {
            continue;
        }
        player playlocalsound(sfx);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb4ff
// Size: 0x3a
function function_388937da6a4b9e5b(sfx, clusterindex) {
    playsoundatpos(level.brgametype.clusters[clusterindex].origin, sfx);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb540
// Size: 0x107
function function_5fd5d5232392f8e3() {
    level.brgametype.var_6d00c3e0bd12eaf8 = [];
    foreach (teamname in level.teamnamelist) {
        if (getteamcount(teamname) == 0) {
            continue;
        }
        level.brgametype.var_6d00c3e0bd12eaf8[teamname] = [];
        level.brgametype.var_6d00c3e0bd12eaf8[teamname]["takeover"] = 0;
        level.brgametype.var_6d00c3e0bd12eaf8[teamname]["squadBonus"] = 0;
        level.brgametype.var_6d00c3e0bd12eaf8[teamname]["normalZone"] = 0;
        level.brgametype.var_6d00c3e0bd12eaf8[teamname]["highValueZone"] = 0;
    }
    thread function_e72095332b0d736b();
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb64e
// Size: 0x4d
function function_82abf65b162f526f(teamname, value, source) {
    level.brgametype.var_6d00c3e0bd12eaf8[teamname][source] = level.brgametype.var_6d00c3e0bd12eaf8[teamname][source] + value;
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb6a2
// Size: 0xe2
function function_e72095332b0d736b() {
    level waittill("game_ended");
    foreach (teamname, var_b339e6ff7bc878a5 in level.brgametype.var_6d00c3e0bd12eaf8) {
        eventparams = [];
        eventparams[eventparams.size] = "team";
        eventparams[eventparams.size] = teamname;
        eventparams[eventparams.size] = "takeover_points";
        eventparams[eventparams.size] = var_b339e6ff7bc878a5["takeover"];
        eventparams[eventparams.size] = "squad_bonus_points";
        eventparams[eventparams.size] = var_b339e6ff7bc878a5["squadBonus"];
        eventparams[eventparams.size] = "normal_zone_points";
        eventparams[eventparams.size] = var_b339e6ff7bc878a5["normalZone"];
        eventparams[eventparams.size] = "high_value_zone_points";
        eventparams[eventparams.size] = var_b339e6ff7bc878a5["highValueZone"];
        dlog_recordevent("dlog_event_zc_match_points_stats", eventparams);
    }
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb78b
// Size: 0x51
function function_d0e600deb7949696(var_dacb0af906c45ca5, scorediff) {
    eventparams = [];
    eventparams[eventparams.size] = "round_index";
    eventparams[eventparams.size] = var_dacb0af906c45ca5;
    eventparams[eventparams.size] = "score_diff";
    eventparams[eventparams.size] = int(scorediff);
    dlog_recordevent("dlog_event_zc_match_end", eventparams);
}

// Namespace namespace_c2faa6c942574440/namespace_3269a6faf5094cf5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb7e3
// Size: 0x105
function function_63bf192d1fd856e5(var_dacb0af906c45ca5) {
    totalscore = 0;
    foreach (zone in level.brgametype.var_ac1c493adfb1430e) {
        if (isdefined(zone.score)) {
            totalscore = totalscore + zone.score;
        }
    }
    totalscore = totalscore / level.brgametype.var_ac1c493adfb1430e.size;
    eventparams = [];
    eventparams[eventparams.size] = "round_index";
    eventparams[eventparams.size] = var_dacb0af906c45ca5;
    eventparams[eventparams.size] = "average_points_given";
    eventparams[eventparams.size] = int(totalscore);
    eventparams[eventparams.size] = "is_overtime";
    eventparams[eventparams.size] = istrue(level.brgametype.var_fa48bea82741b77a);
    dlog_recordevent("dlog_event_zc_round_end", eventparams);
}
