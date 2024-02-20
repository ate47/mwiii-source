// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_48814951e916af89;
#using script_120270bd0a747a35;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\hud_util.gsc;
#using script_5cda031797dce489;
#using script_5bc60484d17fa95c;
#using script_3583ff375ab3a91e;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\equipment\gas_grenade.gsc;

#namespace namespace_5c7433352e1f5cc7;

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa55
// Size: 0x34a
function function_4a0935954bbfdeb1() {
    level.var_37e52c7fb7267efc = spawnstruct();
    level.var_37e52c7fb7267efc.var_2e88fff6c419ee6a = 1;
    level.var_37e52c7fb7267efc.var_7d4922396daa0192 = getdvarint(@"hash_674e53f15c9ff53d", 1);
    level.var_37e52c7fb7267efc.var_37afb6f23303b55a = getdvarint(@"hash_7e7947ccb6191852", 1);
    level.var_37e52c7fb7267efc.var_5cd8016b769d02aa = getdvarint(@"hash_bc73689cd8209e75", 1);
    level.var_37e52c7fb7267efc.var_4b133d9c5b92891d = getdvarint(@"hash_a3f1cff5c396d63d", 12);
    level.var_37e52c7fb7267efc.var_e74cdbc9111d53c7 = getdvarint(@"hash_5b3585afd70eaf8e", 0);
    level.var_37e52c7fb7267efc.var_2713a9cf5318d984 = getdvarint(@"hash_a206a25a0ce81dda", 1);
    level.var_37e52c7fb7267efc.var_5b74e1e54f3f3b74 = getdvarint(@"hash_f14d2f2480b4b618", 0);
    level.var_37e52c7fb7267efc.var_54c7916bcea2b113 = getdvarint(@"hash_8993dd89b4d00b97", 0);
    level.var_37e52c7fb7267efc.var_3564a4453eafcacb = getdvarint(@"hash_d824b632ccb82353", 0);
    level.var_37e52c7fb7267efc.var_f98aec28092ae4f2 = getdvarfloat(@"hash_546a3f7597c568a", 9);
    level.var_37e52c7fb7267efc.var_f04a0fb05108f52e = getdvarint(@"hash_eaccaf202728ce0c", 0);
    level.var_37e52c7fb7267efc.var_ddcc046e7b061885 = getdvarint(@"hash_8d62b3080c53b03f", 0);
    level.var_37e52c7fb7267efc.var_609a4f76dce95688 = getdvarint(@"hash_bfbfcd12d33dce15", 1);
    level.var_37e52c7fb7267efc.var_be0bbfd2065c69b3 = getdvarint(@"hash_19476c64d4742882", 0);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetMatchDuration", &function_92cfa932b04a6719);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagIsMatchPending", &function_d1b3eed24bb52b44);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetClosedCircleIndex", &function_ebafdb7112db8628);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetCountdownLength", &function_441f914ba636643b);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagIsOneTeamLeft", &function_94aa98226f7a425c);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetVictoryWait", &function_eb1596a5daea0ef5);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetPostVictoryWait", &function_d556bd222194d447);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagHandleLossInfiniteEarly", &function_bd71f506af2cac70);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGiveAIKillRewards", &function_f561af47db779c79);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagWinSequence", &function_2b0fd45ef612b4a5);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagLoseSequence", &function_9dbb71aaae4e335e);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulag_startWaitingStartTime", &function_fd55f9d5ef55b95e);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulag_initPlayerArena", &function_9d53e328c2d1aec4);
    namespace_eb17b46cdcb98eea::function_8debf0c616bf9480("gulagOvertime");
    level function_93add0b65db9f722(&function_a7a1d8d937762614);
    level thread function_9d02912cfe66605a();
    if (!isdefined(level.var_289df80e1ded586f)) {
        thread namespace_bfef6903bca5845d::init();
    }
    if (namespace_ad49798629176e96::function_7ad9fcb1ac4f3db8()) {
        level thread function_669d65fcd2ac3d84();
    }
    level thread function_25a296c2ed85e35f();
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda6
// Size: 0x6f2
function function_9d02912cfe66605a() {
    level waittill("prematch_done");
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("second_chance_cargo", &function_f63baad2f7765f34);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("second_chance_cable", &function_875f67700e4d2769);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("second_chance_camera", &function_6c9ae1f39f71f7e1);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("second_chance_bag", &function_e40faa26da957604);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("second_chance_vent", &function_b0f86be8e080101);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("second_chance_door", &function_3bc6f653f16663aa);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("second_chance_door_win", &function_b7e4cbd2a1618bdc);
    if (istrue(level.var_37e52c7fb7267efc.var_e74cdbc9111d53c7)) {
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("second_chance_drive", &function_ed3b3a2040c051a6);
    }
    foreach (arena in level.gulag.arenas) {
        var_f50999508e0b9282 = getentarray(arena.target, "targetname");
        foreach (var_dfa9fb8402123505 in var_f50999508e0b9282) {
            if (!isdefined(var_dfa9fb8402123505.script_noteworthy)) {
                continue;
            }
            if (var_dfa9fb8402123505.script_noteworthy == "gulag_ai_goal_door") {
                arena.var_42097eb056866b9c = var_dfa9fb8402123505;
                jumpiftrue(istrue(level.var_37e52c7fb7267efc.var_e74cdbc9111d53c7)) LOC_000001cd;
                arena.var_42097eb056866b9c delete();
            } else {
            LOC_000001cd:
                if (var_dfa9fb8402123505.script_noteworthy == "gulag_ai_goal_volume") {
                    if (!istrue(level.var_37e52c7fb7267efc.var_609a4f76dce95688)) {
                        arena.var_b59e8b6b1c730b69 = var_dfa9fb8402123505;
                    }
                }
                if (var_dfa9fb8402123505.script_noteworthy == "gulag_ai_camera_door") {
                    arena.var_ddc1e4a34c27b016 = var_dfa9fb8402123505;
                    arena.var_ddc1e4a34c27b016 delete();
                }
            }
        }
        arena.var_79f102b3abcc6f8a = [];
        arena.var_74128aa339e351b0 = [];
        arena.var_4e0ba30b0c9f09d2 = [];
        arena.var_267f3a45751996c2 = [];
        arena.var_60792b044c2d2cb = [];
        arena.var_4d916bb4bda1f18 = [];
        if (istrue(level.var_43307855f189eb31.var_732a414f682801cc)) {
            arena.var_62d1855d36cff5d2 = [];
        }
        var_bb81957d1ae1cf3a = getstructarray(arena.target, "targetname");
        foreach (var_bdf25d8a73ff7dad in var_bb81957d1ae1cf3a) {
            if (var_bdf25d8a73ff7dad.script_noteworthy == "guard_stationary_smg" || isstartstr(var_bdf25d8a73ff7dad.script_noteworthy, "gulag_ai_enemy")) {
                arena.var_79f102b3abcc6f8a[arena.var_79f102b3abcc6f8a.size] = var_bdf25d8a73ff7dad;
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "mhc_legendary_loot_structs " || var_bdf25d8a73ff7dad.script_noteworthy == "gulag_ai_legendary_loot_structs") {
                arena.var_74128aa339e351b0[arena.var_74128aa339e351b0.size] = var_bdf25d8a73ff7dad;
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "mhc_loot_structs" || var_bdf25d8a73ff7dad.script_noteworthy == "gulag_ai_loot_structs") {
                arena.var_4e0ba30b0c9f09d2[arena.var_4e0ba30b0c9f09d2.size] = var_bdf25d8a73ff7dad;
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_ai_cabin_door") {
                arena.var_60792b044c2d2cb[arena.var_60792b044c2d2cb.size] = var_bdf25d8a73ff7dad;
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_ai_camera") {
                arena.var_267f3a45751996c2[arena.var_267f3a45751996c2.size] = var_bdf25d8a73ff7dad;
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_ai_cable") {
                arena.cable = spawnscriptable("second_chance_cable", var_bdf25d8a73ff7dad.origin + (0, 0, level.var_37e52c7fb7267efc.var_3564a4453eafcacb), (0, 180, 0));
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_ai_cameras") {
                arena.camera = spawnscriptable("second_chance_camera", var_bdf25d8a73ff7dad.origin);
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_ai_cargo") {
                if (level.var_37e52c7fb7267efc.var_ddcc046e7b061885 < 0) {
                    arena.cargo = spawnscriptable("second_chance_cargo", var_bdf25d8a73ff7dad.origin + (0, 0, level.var_37e52c7fb7267efc.var_3564a4453eafcacb));
                } else {
                    arena.cargo = var_bdf25d8a73ff7dad thread function_6341d4f1620c75fd();
                }
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_ai_usb" && istrue(level.var_37e52c7fb7267efc.var_e74cdbc9111d53c7)) {
                arena.var_1dfb62f15b7d51cf = spawnscriptable("second_chance_drive", var_bdf25d8a73ff7dad.origin);
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_ai_ot_flag") {
                arena.var_1df1acee38dcca72 = var_bdf25d8a73ff7dad.origin;
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_ai_vent") {
                arena.vent = spawnscriptable("second_chance_vent", var_bdf25d8a73ff7dad.origin + (0, 0, -10));
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_ai_vent_bag") {
                arena.var_b5ecc103c0e9710d = spawnscriptable("second_chance_bag", var_bdf25d8a73ff7dad.origin + (0, 0, level.var_37e52c7fb7267efc.var_3564a4453eafcacb));
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_ai_escape_doors") {
                if (istrue(level.var_37e52c7fb7267efc.var_609a4f76dce95688)) {
                    var_68a6e69ddb34008a = spawnscriptable("second_chance_door_win", var_bdf25d8a73ff7dad.origin, var_bdf25d8a73ff7dad.angles);
                    arena.var_4d916bb4bda1f18[arena.var_4d916bb4bda1f18.size] = var_68a6e69ddb34008a;
                }
            }
        }
        function_cb74a3e70ddfe7ac(arena);
        if (istrue(level.var_37e52c7fb7267efc.var_37afb6f23303b55a)) {
            arena.objid = function_3e4c7d5b30f40ed9(arena);
        }
        level thread function_591aa4c281221460(arena);
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x149f
// Size: 0x16
function function_92cfa932b04a6719() {
    return getdvarfloat(@"hash_8be34599dfa102b8", 50);
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14bd
// Size: 0x86
function function_d1b3eed24bb52b44(var_607899d4420fe1a5, arena) {
    if (var_607899d4420fe1a5.size < 2) {
        if (function_d58396c1483bfbdb()) {
            foreach (p in var_607899d4420fe1a5) {
                if (!isdefined(p.var_d95581fdfc29ec7a)) {
                    return 1;
                } else {
                    return 0;
                }
            }
        } else {
            return 0;
        }
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154a
// Size: 0x36
function function_ebafdb7112db8628(offset) {
    return level.br_level.br_circledelaytimes.size - 1 - getdvarint(@"hash_1141fea0c6ef428f", 4) - offset;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1588
// Size: 0x13
function function_441f914ba636643b() {
    return getdvarint(@"hash_fb05c5f6825931d", 3);
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a3
// Size: 0xe
function function_94aa98226f7a425c() {
    if (function_6a7fe34afaa1a01d()) {
        return 0;
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b8
// Size: 0x8
function function_eb1596a5daea0ef5() {
    return 4.5;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c8
// Size: 0x8
function function_d556bd222194d447() {
    return 2;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15d8
// Size: 0x62
function function_f6681bde87af34c8(arena) {
    if (istrue(level.var_37e52c7fb7267efc.var_5b74e1e54f3f3b74)) {
        if (level.var_37e52c7fb7267efc.var_54c7916bcea2b113 == 1) {
            arena function_7e3b92cd362571d0();
        }
        arena thread function_7cfce31d9c561b2d(arena.arenaplayers);
    }
    level thread function_591aa4c281221460(arena);
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1641
// Size: 0x41c
function function_8116af5afa37b9bf(arena) {
    level endon("game_ended");
    if (!istrue(level.var_37e52c7fb7267efc.var_609a4f76dce95688)) {
        level thread function_7525a0ed21932d7(arena);
    }
    if (isdefined(arena.var_42097eb056866b9c)) {
        level thread function_39c797f7e7c6ca87(arena.var_42097eb056866b9c);
    }
    var_6e5fdafe4800cd7d = "gulagai" + arena.gulagindex;
    var_1ce1b071385a88f0 = "gulagplayers" + arena.gulagindex;
    if (!threatbiasgroupexists(var_1ce1b071385a88f0)) {
        createthreatbiasgroup(var_1ce1b071385a88f0);
    }
    if (!threatbiasgroupexists(var_6e5fdafe4800cd7d)) {
        createthreatbiasgroup(var_6e5fdafe4800cd7d);
        setthreatbiasagainstall(var_6e5fdafe4800cd7d, -100000);
        setthreatbias(var_6e5fdafe4800cd7d, var_1ce1b071385a88f0, 2000);
    }
    foreach (ai in arena.var_707537a8904aa962) {
        if (isagent(ai)) {
            ai setthreatbiasgroup(var_6e5fdafe4800cd7d);
        }
    }
    arena.var_4eb3ce9801991000 = undefined;
    foreach (player in arena.arenaplayers) {
        player.var_b807b84e723c5cea = undefined;
        player.var_d95581fdfc29ec7a = undefined;
        player.var_a51592fb4017d57b = undefined;
        player.var_32484cd3b17f16c8 = undefined;
        player.var_3a7c9a3e9aa20358 = undefined;
        player.var_d25277121d9d0a6c = undefined;
        player.var_322535086c0890fa = undefined;
        player.var_938604a8b5dd849 = undefined;
        player.var_e1ed3a7677ef1776 = undefined;
        if (isdefined(player.var_97ac1ea78faea6e3)) {
            player.var_97ac1ea78faea6e3 = undefined;
            arena.var_c83619011083e3c2 = 1;
        }
        if (!istrue(level.var_37e52c7fb7267efc.var_5b74e1e54f3f3b74)) {
            player thread namespace_44abc05161e2e2cb::showsplash("br_ai_gulag_start");
        }
        if (istrue(level.var_37e52c7fb7267efc.var_37afb6f23303b55a) && isdefined(arena.objid)) {
            objective_addclienttomask(arena.objid, player);
            objective_showtoplayersinmask(arena.objid);
        }
        player namespace_ad49798629176e96::function_63776b389e7c92c1();
        player namespace_ad49798629176e96::function_1167994a7ce49346();
        player function_10aa5ac1861ffb67(0);
        player setthreatbiasgroup(var_1ce1b071385a88f0);
        player thread gulag_trackPlayerBullets();
    }
    if (isdefined(arena.var_6d49ea26b65fddaf)) {
        arena.var_6d49ea26b65fddaf freescriptable();
        arena.var_6d49ea26b65fddaf = undefined;
    }
    if (isdefined(arena.var_62d1855d36cff5d2) && arena.var_62d1855d36cff5d2.size > 0) {
        foreach (loot in arena.var_62d1855d36cff5d2) {
            if (!isdefined(loot)) {
                continue;
            }
            loot setscriptablepartstate(loot.type, "visible");
        }
        arena.var_62d1855d36cff5d2 = [];
    }
    if (istrue(arena.var_c83619011083e3c2)) {
        function_f431c7f719a5a19(arena);
        arena.var_c83619011083e3c2 = undefined;
    }
    arena.var_f69974791bb59e4b = undefined;
    if (istrue(level.var_37e52c7fb7267efc.var_e74cdbc9111d53c7)) {
        function_51a5c2cbddb8569a(arena);
    }
    if (isdefined(arena.var_707537a8904aa962)) {
        arena.var_28a470799d66ecd7 = arena.var_707537a8904aa962.size;
    }
    if (isdefined(arena.arenaplayers)) {
        arena.var_b6b01621833467d1 = arena.arenaplayers.size;
    }
    arena notify("ai_gulag_matchStarted");
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a64
// Size: 0x84
function gulag_trackPlayerBullets() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player notify("gulag_trackPlayerBullets");
    player endon("gulag_trackPlayerBullets");
    player endon("can_show_splashes");
    while (1) {
        objweapon = player waittill("weapon_fired");
        if (!isdefined(player.var_322535086c0890fa)) {
            player.var_322535086c0890fa = 0;
        }
        player.var_322535086c0890fa = player.var_322535086c0890fa + 1;
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aef
// Size: 0x82
function function_669d65fcd2ac3d84() {
    level endon("game_ended");
    level waittill("prematch_done");
    wait(10);
    foreach (player in level.players) {
        if (!isalive(player)) {
            continue;
        }
        if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
            continue;
        }
        player kill();
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b78
// Size: 0x49
function function_51a5c2cbddb8569a(arena) {
    if (isdefined(arena.var_937fd276db7d6dcf)) {
        arena.var_937fd276db7d6dcf delete();
    }
    function_cdb25f748b945cfa(arena.var_1dfb62f15b7d51cf.origin, arena);
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bc8
// Size: 0x10b
function function_6341d4f1620c75fd() {
    var_bdf25d8a73ff7dad = self;
    level endon("game_ended");
    time = 0;
    if (isdefined(level.br_level) && isdefined(level.br_level.br_circlecenters)) {
        var_4ebf4fdb24b6df5c = function_764cf6b0bca0fe0a();
        for (circleindex = 0; circleindex < var_4ebf4fdb24b6df5c; circleindex++) {
            timedelay = level.br_level.br_circledelaytimes[circleindex];
            var_3d8565e2775a243c = level.br_level.br_circleclosetimes[circleindex];
            time = time + timedelay + var_3d8565e2775a243c;
        }
    }
    waittime = int(time);
    wait(waittime);
    if (!isdefined(var_bdf25d8a73ff7dad)) {
        return;
    }
    var_f97856743fbd4b44 = spawnscriptable("second_chance_cargo", var_bdf25d8a73ff7dad.origin + (0, 0, level.var_37e52c7fb7267efc.var_3564a4453eafcacb));
    return var_f97856743fbd4b44;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cdb
// Size: 0xa2
function function_764cf6b0bca0fe0a() {
    if (!isdefined(level.br_level) || !isdefined(level.br_level.br_circledelaytimes) || !isdefined(level.var_37e52c7fb7267efc.var_ddcc046e7b061885)) {
        return 0;
    }
    if (isdefined(level.var_37e52c7fb7267efc.var_ddcc046e7b061885) && level.var_37e52c7fb7267efc.var_ddcc046e7b061885 > 0) {
        return level.var_37e52c7fb7267efc.var_ddcc046e7b061885;
    }
    var_4ebf4fdb24b6df5c = max(0, getgulagclosedcircleindex() - 1);
    return var_4ebf4fdb24b6df5c;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d85
// Size: 0x102
function function_f63baad2f7765f34(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        return;
    }
    if (!isdefined(instance.var_fcdbd9bcf3239f14)) {
        instance.var_fcdbd9bcf3239f14 = 0;
    }
    if (instance.var_fcdbd9bcf3239f14 > 16 || istrue(player.var_b807b84e723c5cea)) {
        return;
    }
    player.var_b807b84e723c5cea = 1;
    player playsoundonmovingent("mine_betty_click");
    instance.origin = instance.origin + (0, -35, 0);
    instance.var_fcdbd9bcf3239f14++;
    player.var_44722265234d31b0 = 1;
    if (instance.var_fcdbd9bcf3239f14 > 16) {
        player function_10167f4c451aadff(instance);
        instance thread function_1aa190da562f8db3();
    }
    player thread function_a71c019ff0f90d9d();
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e8e
// Size: 0x45
function function_a71c019ff0f90d9d() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    wait(1.5);
    if (isdefined(player) && isdefined(player.var_b807b84e723c5cea)) {
        player.var_b807b84e723c5cea = 0;
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eda
// Size: 0xba
function function_10167f4c451aadff(instance) {
    player = self;
    arena = function_de20b194b1a37513(player);
    if (!isdefined(arena) || !isdefined(arena.jailedplayers) || arena.jailedplayers.size == 0) {
        return;
    }
    foreach (p in arena.jailedplayers) {
        p thread namespace_44abc05161e2e2cb::showsplash("br_ai_gulag_cargo_success");
    }
    instance thread function_a4b9cc7ede16275c(arena);
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f9b
// Size: 0x4b
function function_1aa190da562f8db3() {
    instance = self;
    level endon("game_ended");
    wait(10);
    instance.origin = instance.origin + (0, 560, 0);
    instance.var_fcdbd9bcf3239f14 = 0;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fed
// Size: 0x58
function function_6c9ae1f39f71f7e1(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        return;
    }
    if (istrue(player.var_4bb14f07087a5da)) {
        return;
    }
    player thread function_f5a4fd44b6a9e2ac();
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x204c
// Size: 0x32c
function function_f5a4fd44b6a9e2ac() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    arena = function_de20b194b1a37513(player);
    if (!isdefined(arena)) {
        return;
    }
    player.var_4bb14f07087a5da = 1;
    player.var_dbe1d28321e708dd = 1;
    player playsoundonmovingent("mine_betty_click");
    camera = spawn("script_model", arena.var_267f3a45751996c2[0].origin);
    camera setmodel("tag_origin");
    camera.angles = arena.var_267f3a45751996c2[0].angles;
    var_1f2c6c0d410aab78 = spawn("script_model", arena.var_267f3a45751996c2[1].origin);
    var_1f2c6c0d410aab78 setmodel("tag_origin");
    var_1f2c6c0d410aab78.angles = arena.var_267f3a45751996c2[1].angles;
    var_16c2c02f4bb475fa = spawn("script_model", arena.var_267f3a45751996c2[2].origin);
    var_16c2c02f4bb475fa setmodel("tag_origin");
    var_16c2c02f4bb475fa.angles = arena.var_267f3a45751996c2[2].angles;
    if (istrue(level.var_37e52c7fb7267efc.var_2713a9cf5318d984)) {
        foreach (enemyai in function_b4b9401715cf98ea("gulag")) {
            enemyai hudoutlineenableforclient(player, "outlinefill_nodepth_red");
        }
    }
    wait(1);
    if (istrue(player function_5322b4a5ec08d2c9(camera, var_1f2c6c0d410aab78, var_16c2c02f4bb475fa))) {
        return;
    }
    player setclientomnvar("ui_rcd_controls", 2);
    player cameralinkto(camera, "tag_origin", 1, 1);
    wait(3);
    if (istrue(player function_5322b4a5ec08d2c9(camera, var_1f2c6c0d410aab78, var_16c2c02f4bb475fa))) {
        return;
    }
    player cameraunlink();
    player cameralinkto(var_1f2c6c0d410aab78, "tag_origin", 1, 1);
    wait(3);
    if (istrue(player function_5322b4a5ec08d2c9(camera, var_1f2c6c0d410aab78, var_16c2c02f4bb475fa))) {
        return;
    }
    player cameraunlink();
    player cameralinkto(var_16c2c02f4bb475fa, "tag_origin", 1, 1);
    wait(3);
    if (istrue(player function_5322b4a5ec08d2c9(camera, var_1f2c6c0d410aab78, var_16c2c02f4bb475fa))) {
        return;
    }
    if (istrue(level.var_37e52c7fb7267efc.var_2713a9cf5318d984)) {
        foreach (enemyai in function_b4b9401715cf98ea("gulag")) {
            enemyai hudoutlinedisableforclient(player);
        }
    }
    player setclientomnvar("ui_rcd_controls", 0);
    player cameraunlink();
    camera delete();
    var_1f2c6c0d410aab78 delete();
    player.var_4bb14f07087a5da = undefined;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x237f
// Size: 0x66
function function_5322b4a5ec08d2c9(camera, var_1f2c6c0d410aab78, var_16c2c02f4bb475fa) {
    player = self;
    if (!isdefined(player) || !istrue(player.var_4bb14f07087a5da)) {
        if (isdefined(camera)) {
            camera delete();
        }
        if (isdefined(var_1f2c6c0d410aab78)) {
            var_1f2c6c0d410aab78 delete();
        }
        if (isdefined(var_16c2c02f4bb475fa)) {
            var_16c2c02f4bb475fa delete();
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ed
// Size: 0x6d
function function_875f67700e4d2769(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        return;
    }
    if (istrue(player.var_e9343fd6e229b035)) {
        return;
    }
    player.var_525c703cfddaf913 = 1;
    player thread function_f229c4ce80428ffe("briefcase_bomb_mp", 3);
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2461
// Size: 0x9d
function function_b0f86be8e080101(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        return;
    }
    if (!isdefined(player.var_a51592fb4017d57b)) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP/BR_AI_GULAG_VENT_UNABLE");
        return;
    }
    player.var_a51592fb4017d57b = undefined;
    player.var_97ac1ea78faea6e3 = 1;
    player.var_e60b359eb0c2f51d = 1;
    player playsoundonmovingent("mine_betty_click");
    player thread namespace_44abc05161e2e2cb::showsplash("br_ai_gulag_vent_success");
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2505
// Size: 0xac
function function_3bc6f653f16663aa(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(player);
    if (!isdefined(arena)) {
        return;
    }
    if (!isdefined(arena.var_f69974791bb59e4b)) {
        arena.var_f69974791bb59e4b = [];
    }
    if (array_contains(arena.var_f69974791bb59e4b, player)) {
        return;
    }
    arena.var_f69974791bb59e4b[arena.var_f69974791bb59e4b.size] = player;
    arena function_2ac2880e868dfec6();
    player playsoundonmovingent("mine_betty_click");
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25b8
// Size: 0x172
function function_e40faa26da957604(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        return;
    }
    if (isdefined(player.var_a51592fb4017d57b) && !istrue(instance.var_5eece9bdfc3e3e6)) {
        return;
    }
    player playsoundonmovingent("mine_betty_click");
    if (istrue(instance.var_5eece9bdfc3e3e6)) {
        player.pers["gamemodeLoadout"] = function_f4fab9c1a6e08991();
        player.class = "gamemode";
        player.prevweaponobj = undefined;
        struct = player namespace_d19129e4fa5d176::loadout_getclassstruct();
        struct = player namespace_d19129e4fa5d176::loadout_updateclass(struct, "gamemode");
        player namespace_d19129e4fa5d176::preloadandqueueclassstruct(struct, 1, 1);
        player namespace_d19129e4fa5d176::giveloadout(player.team, "gamemode", 0, 0);
        player givestartammo(struct.loadoutprimaryobject);
        player namespace_3bcd40a3005712ec::br_give_weapon_clip(struct.loadoutprimaryobject, 2);
        if (isdefined(struct.loadoutsecondaryobject)) {
            player givestartammo(struct.loadoutsecondaryobject);
            player namespace_3bcd40a3005712ec::br_give_weapon_clip(struct.loadoutsecondaryobject, 2);
        }
    } else {
        player.var_a51592fb4017d57b = 1;
        player.var_2ac81a7104e85b68 = 1;
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2731
// Size: 0xe9
function function_b7e4cbd2a1618bdc(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(player);
    if (!isdefined(arena)) {
        return;
    }
    if (array_contains(arena.arenaplayers, player)) {
        player thread namespace_ad49798629176e96::function_a65df5d97ee38203(arena);
        player namespace_ad49798629176e96::function_dcead2b56fdbf3e("win");
        player namespace_ad49798629176e96::function_3f18739ae34d9958();
        player function_10aa5ac1861ffb67(-1);
        if (istrue(level.var_37e52c7fb7267efc.var_37afb6f23303b55a) && isdefined(arena.objid)) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(arena.objid, player);
        }
        player thread gulagvictory(arena, player, 1, 0, "gulag_ai");
        if (namespace_ad49798629176e96::function_7ad9fcb1ac4f3db8()) {
            player thread function_45c3dc4231157a10();
        }
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2821
// Size: 0x82
function function_f431c7f719a5a19(arena) {
    if (!isdefined(arena.var_4e0ba30b0c9f09d2) || arena.var_4e0ba30b0c9f09d2.size == 0) {
        return;
    }
    arena.var_6d49ea26b65fddaf = spawnscriptable("second_chance_bag", arena.var_4e0ba30b0c9f09d2[0].origin + (0, 0, 10));
    arena.var_6d49ea26b65fddaf.var_5eece9bdfc3e3e6 = 1;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28aa
// Size: 0x41
function function_f229c4ce80428ffe(weaponref, waitduration) {
    player = self;
    player.var_e9343fd6e229b035 = 1;
    player function_45cbf298abfaf76a(weaponref, waitduration);
    player function_bfb05639e6a851c0(weaponref);
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28f2
// Size: 0x79
function function_45cbf298abfaf76a(weaponref, waitduration) {
    player = self;
    player endon("beginNewFight");
    player endon("can_show_splashes");
    item = makeweapon(weaponref);
    player namespace_df5cfdbe6e2d3812::_giveweapon(item, undefined, undefined, 0);
    player setweaponammostock(item, 0);
    player setweaponammoclip(item, 0);
    player thread namespace_19b4203b51d56488::switchtouseweapon(item, 1);
    wait(waitduration);
    player thread namespace_44abc05161e2e2cb::showsplash("br_ai_gulag_cable_tempered");
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2972
// Size: 0x2c
function function_bfb05639e6a851c0(weaponref) {
    player = self;
    player namespace_df5cfdbe6e2d3812::getridofweapon(weaponref);
    player.var_e9343fd6e229b035 = undefined;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29a5
// Size: 0x1f8
function function_ed3b3a2040c051a6(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(player);
    if (!isdefined(arena)) {
        return;
    }
    if (istrue(arena.overtime)) {
        return;
    }
    foreach (player in arena.arenaplayers) {
        player thread namespace_44abc05161e2e2cb::showsplash("br_ai_gulag_reached_end");
    }
    if (!istrue(level.var_37e52c7fb7267efc.var_609a4f76dce95688)) {
        function_cdb25f748b945cfa(arena.var_b59e8b6b1c730b69.origin, arena);
    }
    arena.var_42097eb056866b9c.var_431d7a8ab1fddfdc = 1;
    arena.var_42097eb056866b9c.origin = arena.var_42097eb056866b9c.origin - (0, 0, 200);
    if (istrue(level.var_37e52c7fb7267efc.var_e74cdbc9111d53c7)) {
        arena.overtime = 1;
        arena.dom.arenaflag arenaflag_setenabled(1);
        arena.dom.arenaflag arenaflag_setvisible(arena, 1);
        arena.dom.arenaflag.flagmodel playsoundonmovingent("flag_spawned");
        progress = clamp(arena.time / getovertimelength(), 0, 1);
        setovertimeomnvarprogress(arena, progress);
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ba4
// Size: 0xe1
function function_7525a0ed21932d7(arena) {
    level endon("game_ended");
    while (arena.arenaplayers.size > 0) {
        player = arena.var_b59e8b6b1c730b69 waittill("trigger");
        if (array_contains(arena.arenaplayers, player)) {
            player thread namespace_ad49798629176e96::function_a65df5d97ee38203(arena);
            player namespace_ad49798629176e96::function_dcead2b56fdbf3e("win");
            player namespace_ad49798629176e96::function_3f18739ae34d9958();
            player function_10aa5ac1861ffb67(-1);
            if (istrue(level.var_37e52c7fb7267efc.var_37afb6f23303b55a) && isdefined(arena.objid)) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(arena.objid, player);
            }
            player thread gulagvictory(arena, player, 1, 0, "gulag_ai");
            if (namespace_ad49798629176e96::function_7ad9fcb1ac4f3db8()) {
                player thread function_45c3dc4231157a10();
            }
        }
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c8c
// Size: 0x27
function function_45c3dc4231157a10() {
    player = self;
    player endon("disconnect");
    level endon("game_ended");
    wait(9);
    player kill();
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cba
// Size: 0x6a
function function_39c797f7e7c6ca87(door) {
    level endon("game_ended");
    if (!isdefined(door.originalloc)) {
        door.originalloc = door.origin;
    }
    if (isdefined(door.var_431d7a8ab1fddfdc)) {
        door.origin = door.originalloc;
        door.var_431d7a8ab1fddfdc = undefined;
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d2b
// Size: 0x34
function function_7f1a7d1e230f666c(item, location) {
    scriptable = spawnscriptable(item, location, (0, 0, 0));
    return scriptable;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d67
// Size: 0xfc
function function_3e4c7d5b30f40ed9(arena) {
    if (istrue(level.var_37e52c7fb7267efc.var_609a4f76dce95688)) {
        if (isdefined(arena.var_4d916bb4bda1f18[0])) {
            location = arena.var_4d916bb4bda1f18[0].origin;
        } else if (isdefined(arena.var_b59e8b6b1c730b69)) {
            location = arena.var_b59e8b6b1c730b69.origin;
        } else {
            location = (0, 0, 0);
        }
    } else {
        location = arena.var_b59e8b6b1c730b69.origin;
    }
    objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    if (objid != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "current", location, "ui_mp_br_mapmenu_icon_x1_05_objective");
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 1);
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(objid);
    } else {
        /#
            println("gulag_ai_enemy");
        #/
    }
    return objid;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e6b
// Size: 0x36
function function_cdb25f748b945cfa(location, arena) {
    if (!isdefined(arena.objid)) {
        return;
    }
    objective_position(arena.objid, location);
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ea8
// Size: 0x55
function function_b42c7b95b41f363c() {
    player = self;
    wait(level.var_37e52c7fb7267efc.var_4b133d9c5b92891d);
    if (isdefined(player) && player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        var_5c6ef2a007983454 = function_de20b194b1a37513(player);
        if (isdefined(var_5c6ef2a007983454)) {
            player.var_d95581fdfc29ec7a = undefined;
        }
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f04
// Size: 0x133
function function_82434e34c1223971() {
    loadout = [];
    loadout["loadoutArchetype"] = "archetype_assault";
    loadout["loadoutPrimary"] = "iw9_pi_decho";
    loadout["loadoutPrimaryAttachment"] = "none";
    loadout["loadoutPrimaryAttachment2"] = "none";
    loadout["loadoutPrimaryCamo"] = "none";
    loadout["loadoutPrimaryReticle"] = "none";
    loadout["loadoutSecondary"] = "none";
    loadout["loadoutSecondaryAttachment"] = "none";
    loadout["loadoutSecondaryAttachment2"] = "none";
    loadout["loadoutSecondaryCamo"] = "none";
    loadout["loadoutSecondaryReticle"] = "none";
    loadout["loadoutMeleeSlot"] = "none";
    loadout["loadoutEquipmentPrimary"] = "equip_frag";
    loadout["loadoutEquipmentSecondary"] = "equip_snapshot_grenade";
    loadout["loadoutStreakType"] = "assault";
    loadout["loadoutKillstreak1"] = "none";
    loadout["loadoutKillstreak2"] = "none";
    loadout["loadoutKillstreak3"] = "none";
    loadout["loadoutSuper"] = "super_br_extract";
    loadout["loadoutPerks"] = [0:"specialty_null"];
    loadout["loadoutGesture"] = "playerData";
    loadout["loadoutExecution"] = "none";
    return loadout;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x303f
// Size: 0x133
function function_f4fab9c1a6e08991() {
    loadout = [];
    loadout["loadoutArchetype"] = "archetype_assault";
    loadout["loadoutPrimary"] = "iw9_sm_aviktor_mp";
    loadout["loadoutPrimaryAttachment"] = "none";
    loadout["loadoutPrimaryAttachment2"] = "none";
    loadout["loadoutPrimaryCamo"] = "none";
    loadout["loadoutPrimaryReticle"] = "none";
    loadout["loadoutSecondary"] = "iw9_sh_mbravo";
    loadout["loadoutSecondaryAttachment"] = "none";
    loadout["loadoutSecondaryAttachment2"] = "none";
    loadout["loadoutSecondaryCamo"] = "none";
    loadout["loadoutSecondaryReticle"] = "none";
    loadout["loadoutMeleeSlot"] = "none";
    loadout["loadoutEquipmentPrimary"] = "equip_frag";
    loadout["loadoutEquipmentSecondary"] = "equip_concussion";
    loadout["loadoutStreakType"] = "assault";
    loadout["loadoutKillstreak1"] = "none";
    loadout["loadoutKillstreak2"] = "none";
    loadout["loadoutKillstreak3"] = "none";
    loadout["loadoutSuper"] = "super_br_extract";
    loadout["loadoutPerks"] = [0:"specialty_munitions_2"];
    loadout["loadoutGesture"] = "playerData";
    loadout["loadoutExecution"] = "none";
    return loadout;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x317a
// Size: 0x3a
function function_9dbb71aaae4e335e(arena) {
    namespace_ad49798629176e96::function_dcead2b56fdbf3e("lost");
    if (isdefined(arena.objid)) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(arena.objid, self);
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31bb
// Size: 0x36
function function_2b0fd45ef612b4a5(arena, var_b6acf0c07c4311e6) {
    winner = self;
    winner.var_22f8f8d138d3c02f = 2;
    winner function_f071db381e990d80();
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f8
// Size: 0x3a
function function_fd55f9d5ef55b95e() {
    player = self;
    player.var_7af171f0ae71a689 = gettime();
    player.var_d95581fdfc29ec7a = gettime();
    player thread function_b42c7b95b41f363c();
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3239
// Size: 0x53
function function_9d53e328c2d1aec4() {
    player = self;
    player.var_ad6498e5d4b1ae34 = gettime() - player.var_7af171f0ae71a689;
    player.var_7af171f0ae71a689 = undefined;
    weaponobj = player getcurrentprimaryweapon();
    player namespace_3bcd40a3005712ec::br_give_weapon_clip(weaponobj, 2);
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3293
// Size: 0xb1
function function_f561af47db779c79(arena) {
    player = self;
    player endon("death_or_disconnect");
    level endon("game_ended");
    if (!isdefined(arena.var_4eb3ce9801991000)) {
        return;
    }
    points = arena.var_4eb3ce9801991000;
    wait(5);
    while (!player isonground()) {
        wait(0.5);
    }
    if (points >= 2) {
        player namespace_c6ccccd95254983f::playerplunderpickup(5);
    }
    if (points >= 6) {
        namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, "brloot_armor_plate", 1, 2);
    }
    if (points >= 8) {
        player namespace_c6ccccd95254983f::playerplunderpickup(10);
    }
    if (points >= 10) {
        namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, "brloot_super_munitionsbox", 1);
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x334b
// Size: 0xfd
function function_a4b9cc7ede16275c(arena) {
    cargo = self;
    if (!isdefined(arena.jailedplayers) || arena.jailedplayers.size < 1) {
        return;
    }
    foreach (p in arena.jailedplayers) {
        if (isdefined(p.var_b807b84e723c5cea)) {
            p thread gulagvictory(p.arena, p, 1, 1, "jailbreakEvent");
            if (namespace_ad49798629176e96::function_7ad9fcb1ac4f3db8()) {
                p thread function_45c3dc4231157a10();
            }
        }
    }
    playsoundatpos(cargo.origin, "evt_br_gulag_round_start_buzzer");
    arena.jailedplayers = array_removeundefined(arena.jailedplayers);
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x344f
// Size: 0x1a0
function function_a7a1d8d937762614(agent, killer) {
    if (!isplayer(killer)) {
        return;
    }
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(killer);
    if (!isdefined(arena)) {
        return;
    }
    if (!isdefined(arena.var_4eb3ce9801991000)) {
        arena.var_4eb3ce9801991000 = 0;
    }
    if (!isdefined(killer.var_32484cd3b17f16c8)) {
        killer.var_32484cd3b17f16c8 = 0;
    }
    arena.var_4eb3ce9801991000 = arena.var_4eb3ce9801991000 + 1;
    killer.var_32484cd3b17f16c8 = killer.var_32484cd3b17f16c8 + 1;
    if (arena.var_4eb3ce9801991000 == 2 || arena.var_4eb3ce9801991000 == 6 || arena.var_4eb3ce9801991000 == 8 || arena.var_4eb3ce9801991000 == 10) {
        foreach (p in arena.arenaplayers) {
            p playsoundtoplayer("mp_killconfirm_tags_pickup", p);
        }
    }
    foreach (p in arena.arenaplayers) {
        p function_10aa5ac1861ffb67(arena.var_4eb3ce9801991000);
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35f6
// Size: 0x25
function function_10aa5ac1861ffb67(value) {
    player = self;
    player setclientomnvar("ui_br_ai_gulag_score", value);
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3622
// Size: 0x1a3
function function_f071db381e990d80() {
    player = self;
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(player);
    if (!isdefined(arena)) {
        return;
    }
    var_283bf79efcf70762 = 0;
    var_4abdc6dfe813cd0e = 0;
    if (isdefined(arena.arenaplayers) && isdefined(arena.arenaplayers[0]) && isdefined(arena.arenaplayers[0].var_22f8f8d138d3c02f)) {
        var_283bf79efcf70762 = arena.arenaplayers[0].var_22f8f8d138d3c02f;
    }
    if (isdefined(arena.arenaplayers) && isdefined(arena.arenaplayers[1]) && isdefined(arena.arenaplayers[1].var_22f8f8d138d3c02f)) {
        var_4abdc6dfe813cd0e = arena.arenaplayers[1].var_22f8f8d138d3c02f;
    }
    /#
        /#
            assertex(var_283bf79efcf70762 < 16, "flag_spawned");
        #/
        /#
            assertex(var_4abdc6dfe813cd0e < 16, "<unknown string>");
        #/
    #/
    var_3f65a52935223a7a = (var_4abdc6dfe813cd0e << 4) + var_283bf79efcf70762;
    var_87b2be9fef844de = array_combine(arena.jailedplayers, arena.arenaplayers);
    foreach (p in var_87b2be9fef844de) {
        p setclientomnvar("ui_br_ai_gulag_player_state", var_3f65a52935223a7a);
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37cc
// Size: 0xd0
function function_de20b194b1a37513(player) {
    for (i = 0; i < level.gulag.arenas.size; i++) {
        var_f40e6deec30ee209 = level.gulag.arenas[i];
        foreach (jailedplayers in var_f40e6deec30ee209.jailedplayers) {
            if (jailedplayers == player) {
                arena = level.gulag.arenas[i];
                return arena;
            }
        }
    }
    return undefined;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38a4
// Size: 0x2c
function function_7effa8a355ddc886() {
    if (isdefined(level.var_37e52c7fb7267efc) && istrue(level.var_37e52c7fb7267efc.var_2e88fff6c419ee6a)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38d8
// Size: 0x59
function function_79fdf5cd036ff575() {
    if (isdefined(level.var_37e52c7fb7267efc) && istrue(level.var_37e52c7fb7267efc.var_2e88fff6c419ee6a) && istrue(level.var_37e52c7fb7267efc.var_f04a0fb05108f52e) || getdvarint(@"hash_8ffa9721c8dd3dcc", 0) != 0) {
        return 1;
    }
    return 0;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3939
// Size: 0x44
function function_d58396c1483bfbdb() {
    if (isdefined(level.var_37e52c7fb7267efc) && istrue(level.var_37e52c7fb7267efc.var_2e88fff6c419ee6a) && istrue(level.var_37e52c7fb7267efc.var_7d4922396daa0192)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3985
// Size: 0x14a
function function_bd71f506af2cac70(arena) {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    if (isdefined(arena.objid)) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(arena.objid, player);
    }
    if (player.health == 0) {
        wait(7);
        if (!isdefined(player)) {
            return;
        }
        player.gulag = 0;
        teammate = player;
        teammates = level.teamdata[player.team]["players"];
        foreach (p in teammates) {
            if (p == player) {
                continue;
            }
            teammate = p;
        }
        if (isdefined(teammate)) {
            teammate = teammates[0];
            teammate namespace_cb965d2f71fefddc::addrespawntoken(1);
            player playergulagautowin("aiGulag", teammate);
            wait(7);
            if (!isdefined(player)) {
                return;
            }
            player kill();
        }
    } else {
        player thread gulagvictory(arena, player, 1, 0, "shutdown");
        wait(7);
        if (!isdefined(player)) {
            return;
        }
        player kill();
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ad6
// Size: 0x62
function function_7b08c98431abda40(attacker, victim) {
    if (!function_7effa8a355ddc886() || !isdefined(victim) || !isdefined(attacker)) {
        return 0;
    }
    if (isplayer(victim) && isplayer(attacker)) {
        if (istrue(victim.gulag) && istrue(attacker.gulag)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b40
// Size: 0x2c
function function_6a7fe34afaa1a01d() {
    if (isdefined(level.var_37e52c7fb7267efc) && istrue(level.var_37e52c7fb7267efc.var_5cd8016b769d02aa)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b74
// Size: 0xd4
function function_7cfce31d9c561b2d(arenaplayers) {
    arena = self;
    if (level.var_37e52c7fb7267efc.var_54c7916bcea2b113 == 0) {
        arena function_ae6dce59ccb4b681();
        arena thread function_5427c6229b93668e(arena.fightspawns);
    } else if (level.var_37e52c7fb7267efc.var_54c7916bcea2b113 == 1) {
        foreach (p in arenaplayers) {
            p thread namespace_44abc05161e2e2cb::showsplash("br_ai_gulag_afk_door");
        }
        arena function_ae6dce59ccb4b681();
        arena function_16d6792e689d7559();
        arena function_3a22dd56aa026e21(arenaplayers);
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c4f
// Size: 0x23
function function_ae6dce59ccb4b681() {
    arena = self;
    wait(level.var_37e52c7fb7267efc.var_f98aec28092ae4f2);
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c79
// Size: 0x196
function function_5427c6229b93668e(locations, var_3929f105e3444df2, var_ba599e887e5cdae4, var_6611564090223dab, var_74ab6e197feae88b) {
    arena = self;
    arena endon("matchEnded");
    arena endon("fight_over");
    level endon("game_ended");
    if (!isdefined(locations)) {
        return;
    }
    if (!isdefined(var_3929f105e3444df2)) {
        var_3929f105e3444df2 = 11;
    }
    if (!isdefined(var_ba599e887e5cdae4)) {
        var_ba599e887e5cdae4 = 0;
    }
    if (!isdefined(var_6611564090223dab)) {
        var_6611564090223dab = 15;
    }
    if (!isdefined(var_74ab6e197feae88b)) {
        var_74ab6e197feae88b = 1.5;
    }
    foreach (player in arena.arenaplayers) {
        player thread function_f3c05e86869e397c(var_6611564090223dab, var_74ab6e197feae88b);
    }
    foreach (loc in locations) {
        position = loc.origin;
        playfx(getfx("glsmoke"), position, anglestoup((0, 90, 0)));
        arena thread namespace_d39a86483d995ed1::gas_createtrigger(position, arena.var_707537a8904aa962[0], arena.var_707537a8904aa962[0].team, var_3929f105e3444df2, 0.7);
        wait(var_ba599e887e5cdae4);
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e16
// Size: 0x5c
function function_f3c05e86869e397c(var_6611564090223dab, var_74ab6e197feae88b) {
    player = self;
    player endon("gulagRespawn");
    player endon("gulagLost");
    player endon("death_or_disconnect");
    level endon("game_ended");
    while (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        player waittill("gas_begin_coughing");
        player thread function_870d349c1ed60c21(var_6611564090223dab, var_74ab6e197feae88b);
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e79
// Size: 0x74
function function_870d349c1ed60c21(var_6611564090223dab, var_74ab6e197feae88b) {
    player = self;
    player endon("gas_modify_blur");
    player endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        if (player.health - var_6611564090223dab <= 0) {
            player kill();
        } else {
            player.health = player.health - var_6611564090223dab;
        }
        wait(var_74ab6e197feae88b);
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ef4
// Size: 0x33
function function_2ac2880e868dfec6() {
    arena = self;
    if (arena.var_f69974791bb59e4b.size >= arena.arenaplayers.size) {
        arena notify("gulag_both_doors_interacted");
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f2e
// Size: 0xa5
function function_7e3b92cd362571d0() {
    arena = self;
    arena.var_6c9e6734548f435 = [];
    foreach (var_e05cefde9287f4f2 in arena.var_60792b044c2d2cb) {
        door = spawnscriptable("second_chance_door", var_e05cefde9287f4f2.origin);
        arena.var_6c9e6734548f435[arena.var_6c9e6734548f435.size] = door;
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fda
// Size: 0xf1
function function_16d6792e689d7559() {
    arena = self;
    if (!isdefined(arena.var_6c9e6734548f435) || arena.var_6c9e6734548f435.size < 1) {
        return;
    }
    foreach (door in arena.var_6c9e6734548f435) {
        door freescriptable();
    }
    arena.var_6c9e6734548f435 = undefined;
    foreach (p in arena.arenaplayers) {
        p thread namespace_44abc05161e2e2cb::showsplash("br_ai_gulag_start");
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40d2
// Size: 0xe4
function function_3a22dd56aa026e21(arenaplayers) {
    arena = self;
    if (!isdefined(arena.var_f69974791bb59e4b) || arena.var_f69974791bb59e4b.size < 1) {
        foreach (p in arenaplayers) {
            p function_2f3cee02d1664ac3();
        }
        return;
    }
    foreach (p in arenaplayers) {
        if (!array_contains(arena.var_f69974791bb59e4b, p)) {
            p function_2f3cee02d1664ac3();
        }
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41bd
// Size: 0x2b
function function_2f3cee02d1664ac3() {
    player = self;
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(player);
    player thread gulagplayerlost(arena);
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41ef
// Size: 0x52
function function_591aa4c281221460(arena) {
    if (!isdefined(arena.var_707537a8904aa962)) {
        arena.aiset = 1;
        if (isdefined(arena.var_79f102b3abcc6f8a)) {
            thread function_7872ad2759563bc9(arena);
        }
        arena waittill("matchEnded");
        thread function_ec081b1e504799de(arena);
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4248
// Size: 0x24
function function_cb74a3e70ddfe7ac(arena) {
    category = "gulag";
    function_ba4022744dce59f6(category);
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4273
// Size: 0x7b
function function_7872ad2759563bc9(arena) {
    if (namespace_ad49798629176e96::function_d8f18f1d691c0ef8(arena)) {
        thread function_89235e4fe5354b16(arena);
    } else {
        foreach (var_55e69fb0ce97f15e in arena.var_79f102b3abcc6f8a) {
            thread function_390d1a2dc50058c0(arena, var_55e69fb0ce97f15e);
        }
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42f5
// Size: 0x112
function function_390d1a2dc50058c0(arena, var_55e69fb0ce97f15e) {
    aitype = "enemy_mp_smg_tier1_aq";
    spawnlocation = var_55e69fb0ce97f15e.origin;
    if (!getdvarint(@"hash_b3d7a9483362813e", 0)) {
        spawnlocation = getclosestpointonnavmesh(var_55e69fb0ce97f15e.origin);
    }
    agent = ai_mp_requestSpawnAgent(aitype, spawnlocation, var_55e69fb0ce97f15e.angles, "absolute", "gulag", undefined, undefined, undefined, undefined, undefined, 1);
    if (isagent(agent)) {
        agent thread function_c31f3a6ef58a2928(arena);
        if (getdvarint(@"hash_b3d7a9483362813e", 0)) {
            agent forceteleport(spawnlocation, var_55e69fb0ce97f15e.angles);
            agent setgoalpos(agent.origin, 32);
            agent clearpath();
            agent.fixednode = 1;
            agent thread function_b11c1964f528574b(agent, 1, agent.origin);
        } else {
            agent thread function_b11c1964f528574b(agent);
        }
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x440e
// Size: 0xed
function function_90e71e5ac7c0ee5d(arena) {
    if (!istrue(arena.aiset)) {
        function_591aa4c281221460(arena);
    }
    var_c99a915a0dd0df12 = 0;
    foreach (player in arena.arenaplayers) {
        if (player namespace_ad49798629176e96::function_3facab0d974296c1()) {
            var_c99a915a0dd0df12 = 1;
            break;
        }
    }
    if (var_c99a915a0dd0df12) {
        foreach (agent in arena.var_707537a8904aa962) {
            if (isagent(agent)) {
            }
        }
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4502
// Size: 0x46
function function_c31f3a6ef58a2928(arena) {
    if (!isdefined(arena.var_707537a8904aa962)) {
        arena.var_707537a8904aa962 = [];
    }
    arena.var_707537a8904aa962 = array_add(arena.var_707537a8904aa962, self);
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x454f
// Size: 0x8e
function function_5a881c43e5febf38(arena) {
    if (isdefined(arena.var_707537a8904aa962)) {
        arena.var_707537a8904aa962 = array_remove(arena.var_707537a8904aa962, self);
        if (isagent(self)) {
            if (isalive(self)) {
                function_28b90eb2b591003f();
            } else {
                body = self getcorpseentity();
                if (isdefined(body)) {
                    body delete();
                }
            }
        }
        if (arena.var_707537a8904aa962.size <= 0) {
            arena.var_707537a8904aa962 = undefined;
        }
    }
}

// Namespace namespace_5c7433352e1f5cc7/namespace_ed76df41b0f397fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45e4
// Size: 0x12a
function function_ec081b1e504799de(arena) {
    if (isdefined(arena.var_707537a8904aa962)) {
        foreach (agent in arena.var_707537a8904aa962) {
            if (isagent(agent)) {
                agent function_5a881c43e5febf38(arena);
                agent setthreatbiasgroup();
            }
        }
        arena.var_707537a8904aa962 = undefined;
        arena.aiset = undefined;
    }
    waitframe();
    var_2e903a90a966d9c2 = 2950;
    var_f9d6732a60363240 = getlootscriptablearrayinradius(undefined, undefined, arena.center, var_2e903a90a966d9c2);
    foreach (var_d8cd9c1941a88194 in var_f9d6732a60363240) {
        if (var_d8cd9c1941a88194 getscriptableisreserved() && var_d8cd9c1941a88194 getscriptableisloot()) {
            var_d8cd9c1941a88194 namespace_cb965d2f71fefddc::deletescriptableinstance();
        }
    }
}

