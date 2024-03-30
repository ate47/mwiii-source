// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7ab5b649fa408138;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_48814951e916af89;
#using scripts\mp\ai_behavior.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\poi.gsc;
#using script_15ca41a3fbb0e379;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_57d3850a12cf1d8f;
#using scripts\mp\utility\game.gsc;
#using script_371b4c2ab5861e62;
#using scripts\mp\utility\debug.gsc;
#using script_744cad313ed0a87e;
#using scripts\mp\objidpoolmanager.gsc;
#using script_64acb6ce534155b7;
#using script_6a8ec730b2bfa844;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using script_600b944a95c3a7bf;

#namespace namespace_6c6c9cbca3ea8e6e;

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x112a
// Size: 0x707
function fortress_init() {
    level endon("game_ended");
    if (getdvarint(@"hash_64d5a12998e68c07", 1) != 1) {
        return;
    }
    setdvar(@"hash_43ab4ce9faa45add", 0);
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    while (!isdefined(level.patrolpaths) && !istrue(level.var_4fe0c43951f6ce37)) {
        waitframe();
    }
    while (!flag_exist("create_script_initialized")) {
        if (!flag_exist("poi_initialized")) {
            waitframe();
            continue;
        }
        break;
    }
    while (!flag_exist("poi_initialized")) {
        flag_wait("create_script_initialized");
    }
    waitframe();
    gameflaginit("fortress_system_init", 0);
    level.lockedvolumes = [];
    level.var_c7d1916b16f57d7b = [];
    level.var_f1073fbd45b59a06 = spawnstruct();
    level.var_f1073fbd45b59a06.var_224d6c29e9bb566b = [];
    function_b8b841d5628094e5();
    level.var_45ca3cfb9dca4f97 = 0;
    level.var_f1073fbd45b59a06.var_ce199e9de0a90ec9 = getdvarint(@"hash_f9ce5651f5c8dc5", 0);
    function_6da7791be58cc019();
    if (scripts/engine/utility::issharedfuncdefined("fortress", "acknowledge")) {
        [[ scripts/engine/utility::getsharedfunc("fortress", "acknowledge") ]]();
    } else {
        function_6ce4cd468e93ecd();
    }
    function_64fafa59eca9ca33();
    function_de96257d602d3ad8();
    if (!istrue(level.var_4fe0c43951f6ce37)) {
        if (!isdefined(level.var_41670c1c65f3d3cf.fortresses)) {
            level.var_41670c1c65f3d3cf.fortresses = [];
        }
        level.var_f1073fbd45b59a06.var_89cc4de8832d0ea9["small"] = getdvarint(@"hash_44c6b04f31cd85c2", 4);
        level.var_f1073fbd45b59a06.var_89cc4de8832d0ea9["medium"] = getdvarint(@"hash_153cef3a49bced1c", 7);
        level.var_f1073fbd45b59a06.var_89cc4de8832d0ea9["large"] = getdvarint(@"hash_b5a2dce30d58a61e", 9);
        level.var_f1073fbd45b59a06.var_89cc4de8832d0ea9["hero"] = getdvarint(@"hash_489d69be23c1889f", 13);
        level.var_f1073fbd45b59a06.var_89cc4de8832d0ea9["hero_epic"] = getdvarint(@"hash_d951db3ddbc5f88d", 20);
        level.var_f1073fbd45b59a06.var_89cc4de8832d0ea9["hero_disabled"] = getdvarint(@"hash_489d69be23c1889f", 8);
        level.var_f1073fbd45b59a06.var_6212ae7684246846["small"] = getdvarint(@"hash_d058080352ecc66b", 1);
        level.var_f1073fbd45b59a06.var_6212ae7684246846["medium"] = getdvarint(@"hash_bdf93d46f026ff4b", 2);
        level.var_f1073fbd45b59a06.var_6212ae7684246846["large"] = getdvarint(@"hash_8318724c082ee73", 2);
        level.var_f1073fbd45b59a06.var_6212ae7684246846["hero"] = getdvarint(@"hash_8318724c082ee73", 2);
        level.var_f1073fbd45b59a06.var_6212ae7684246846["hero_epic"] = getdvarint(@"hash_8318724c082ee73", 2);
        level.var_f1073fbd45b59a06.var_6212ae7684246846["hero_disabled"] = getdvarint(@"hash_8318724c082ee73", 1);
        level.var_f1073fbd45b59a06.var_ac0cf04e7aacfadf["small"] = getdvarint(@"hash_fec8ea1a8159d32", 4);
        level.var_f1073fbd45b59a06.var_ac0cf04e7aacfadf["medium"] = getdvarint(@"hash_760ec21fcd642f2c", 6);
        level.var_f1073fbd45b59a06.var_ac0cf04e7aacfadf["large"] = getdvarint(@"hash_999086b0d702a14e", 8);
        level.var_f1073fbd45b59a06.var_ac0cf04e7aacfadf["hero"] = getdvarint(@"hash_999086b0d702a14e", 8);
        level.var_f1073fbd45b59a06.var_ac0cf04e7aacfadf["hero_disabled"] = getdvarint(@"hash_999086b0d702a14e", 4);
        level.var_f1073fbd45b59a06.var_5cd7132d90176250["small"] = getdvarint(@"hash_29783938106118c0", 1);
        level.var_f1073fbd45b59a06.var_5cd7132d90176250["medium"] = getdvarint(@"hash_64c0716b8b6937f2", 2);
        level.var_f1073fbd45b59a06.var_5cd7132d90176250["large"] = getdvarint(@"hash_598eca83d0e33998", 2);
        level.var_f1073fbd45b59a06.var_5cd7132d90176250["hero"] = getdvarint(@"hash_d11c877bdb74184d", 2);
        level.var_f1073fbd45b59a06.var_5cd7132d90176250["hero_epic"] = getdvarint(@"hash_f75fadd18816ab4f", 3);
        level.var_f1073fbd45b59a06.var_b450d0ab756e4716 = getdvarint(@"hash_22e7107141c60d09", 7);
        level.var_f1073fbd45b59a06.var_5cd7132d90176250["hero_disabled"] = 0;
    }
    level.var_447a5d19ba3b177a = getdvarint(@"hash_9503d7933365675f", 1);
    setdvar(@"hash_9d95d1671eeaf942", 0);
    level.var_59cffb78293fe83c = spawnstruct();
    level.var_59cffb78293fe83c.var_90ccd093de8c8c55 = &function_4527248d0334a562;
    level.var_59cffb78293fe83c.ondeath = &function_1cbdd3db07bff2d6;
    level.var_59cffb78293fe83c.var_9e729433fd479f19 = &function_de7803621d18c6a8;
    foreach (fortress in level.var_f1073fbd45b59a06.var_df987907a483df89) {
        function_4e6dd86684152b17(fortress);
    }
    level.var_f1073fbd45b59a06.gatheredvolumes = 1;
    if (!istrue(level.var_4fe0c43951f6ce37) && getdvarint(@"hash_fc19c5c3a70c0c45", 1)) {
        namespace_bfef6903bca5845d::function_2fc80954fa70d153();
    }
    if (scripts/engine/utility::issharedfuncdefined("fortress", "spawn")) {
        [[ scripts/engine/utility::getsharedfunc("fortress", "spawn") ]]();
    } else {
        function_3bb788d495b1c7a0();
    }
    level thread function_6d27f6675243f8be();
    level.var_f1073fbd45b59a06.var_9b87fdb80920f442 = 1;
    gameflagset("fortress_system_init");
    /#
        level thread function_1ab4df6f91b702df();
        level thread function_377254fcb380b9fe();
    #/
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1838
// Size: 0x2b0
function function_3bb788d495b1c7a0() {
    foreach (fortress in level.var_f1073fbd45b59a06.var_df987907a483df89) {
        if (istrue(fortress.isactive)) {
            continue;
        }
        if (isdefined(fortress.poi) && isdefined(fortress.subarea.var_71ad22c5d093d90b) && isdefined(level.poi[fortress.poi]["subAreas"][fortress.subarea.var_71ad22c5d093d90b].var_7da9883d4168b7f1)) {
            fortress.tieroverride = level.poi[fortress.poi]["subAreas"][fortress.subarea.var_71ad22c5d093d90b].var_7da9883d4168b7f1.var_84ecaeab58167d39;
        }
        fortress.poi = scripts/mp/poi::function_6cc445c02b5effac(fortress.origin);
        if (!function_4ec4f39a2e1745f2(fortress)) {
            function_2d916d4ae382a8eb(fortress);
        }
    }
    function_cbf0fedf537ce343();
    if (istrue(level.var_f1073fbd45b59a06.var_ce199e9de0a90ec9)) {
        foreach (fortress in level.var_f1073fbd45b59a06.var_8a40ff9ed07bd5f3) {
            if (!array_contains(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress)) {
                function_eecb9fd7f5e8181b(fortress);
                function_956a7feefd3a23aa(fortress);
                if (isdefined(fortress.poi) && isdefined(fortress.subarea.var_71ad22c5d093d90b) && isdefined(level.poi[fortress.poi]["subAreas"][fortress.subarea.var_71ad22c5d093d90b].var_7da9883d4168b7f1)) {
                    fortress.tieroverride = level.poi[fortress.poi]["subAreas"][fortress.subarea.var_71ad22c5d093d90b].var_7da9883d4168b7f1.var_84ecaeab58167d39;
                }
                function_2d916d4ae382a8eb(fortress);
            }
        }
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aef
// Size: 0xc2
function function_956a7feefd3a23aa(fortress) {
    if (istrue(level.var_4fe0c43951f6ce37)) {
        return;
    }
    if (!isdefined(level.var_41670c1c65f3d3cf.fortresses)) {
        level.var_41670c1c65f3d3cf.fortresses = [];
    }
    index = level.var_41670c1c65f3d3cf.fortresses.size;
    level.var_41670c1c65f3d3cf.fortresses[index] = spawnstruct();
    level.var_41670c1c65f3d3cf.fortresses[index].var_13235d60c661e10b = 0;
    fortress.var_fdbe1a2317a6a37d = level.var_41670c1c65f3d3cf.fortresses[index];
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb8
// Size: 0x26b
function function_6da7791be58cc019() {
    var_c910c1bb857a9d7f = getstructarray("fortress", "targetname");
    var_8a40ff9ed07bd5f3 = [];
    foreach (fortress in var_c910c1bb857a9d7f) {
        navpoint = getclosestpointonnavmesh(fortress.origin);
        if (distance2dsquared(navpoint, fortress.origin) < 1048576) {
            noteworthy = tolower(fortress.script_noteworthy);
            if (issubstr(noteworthy, "hero") || issubstr(noteworthy, "largetower")) {
                if (issubstr(noteworthy, "notacmap")) {
                    fortress.var_c6cf0a05d2f9b5df = 1;
                    fortress.var_c8c070d7375ef1e = "medium";
                } else {
                    fortress.ishero = 1;
                    fortress.var_c8c070d7375ef1e = "hero";
                }
                function_9f1e4a5acad09f4b(fortress);
            } else if (issubstr(noteworthy, "small")) {
                fortress.var_c8c070d7375ef1e = "small";
            } else if (issubstr(noteworthy, "medium")) {
                fortress.var_c8c070d7375ef1e = "medium";
            } else if (issubstr(noteworthy, "large")) {
                fortress.var_c8c070d7375ef1e = "large";
            } else {
                /#
                    println("stuck" + fortress.origin);
                #/
                fortress.var_c8c070d7375ef1e = "small";
            }
            if (!isdefined(fortress.target)) {
                fortress.var_5683fb2485637c86 = 1;
            }
            if (!isdefined(fortress.poi)) {
                fortress.poi = scripts/mp/poi::function_6cc445c02b5effac(fortress.origin, 1);
            }
            if (scripts/engine/utility::issharedfuncdefined("fortress", "gatherAdditionalDataForCoreNodes")) {
                fortress = [[ scripts/engine/utility::getsharedfunc("fortress", "gatherAdditionalDataForCoreNodes") ]](fortress);
            }
            var_8a40ff9ed07bd5f3[var_8a40ff9ed07bd5f3.size] = fortress;
        }
    }
    level.var_f1073fbd45b59a06.var_8a40ff9ed07bd5f3 = var_8a40ff9ed07bd5f3;
    level.var_f1073fbd45b59a06.var_e5f0869fedd95408 = [];
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e2a
// Size: 0x76
function function_4d5a3497a81aaa2f(target) {
    foreach (fortress in level.var_f1073fbd45b59a06.var_8a40ff9ed07bd5f3) {
        if (fortress.target == target) {
            return fortress;
        }
    }
    return undefined;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ea8
// Size: 0x14e
function function_6ce4cd468e93ecd() {
    level.var_f1073fbd45b59a06.var_df987907a483df89 = [];
    level.var_f1073fbd45b59a06.unusedfortresses = level.var_f1073fbd45b59a06.var_8a40ff9ed07bd5f3;
    var_dd6dbe56be1a77fe = function_356aeca51ec05bc0();
    if (!isdefined(var_dd6dbe56be1a77fe)) {
        return;
    }
    foreach (target in var_dd6dbe56be1a77fe) {
        fortress = function_4d5a3497a81aaa2f(target);
        if (isdefined(fortress)) {
            fortress.var_6a9a1aeeaa7c25df = "mainFortress";
            level.var_f1073fbd45b59a06.var_df987907a483df89[level.var_f1073fbd45b59a06.var_df987907a483df89.size] = fortress;
            level.var_f1073fbd45b59a06.unusedfortresses = array_remove(level.var_f1073fbd45b59a06.unusedfortresses, fortress);
            /#
                namespace_d1a9ca87d78d9813::function_9533653868e59fb6("fortressDoorOpened", fortress.var_6a9a1aeeaa7c25df, undefined, undefined, undefined, undefined, fortress.poi, fortress.origin);
            #/
        }
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ffd
// Size: 0x8f8
function function_eecb9fd7f5e8181b(corenode, keynameoverride) {
    if (istrue(corenode.var_5683fb2485637c86)) {
        return;
    }
    var_55a8cd2462d707dc = array_combine(getstructarray(corenode.target, "targetname"), getentarray(corenode.target, "targetname"), function_f159c10d5cf8f0b4(corenode.target, "targetname"));
    corenode.guardnodes = [];
    corenode.elites = [];
    corenode.patrolpaths = [];
    corenode.lockeddoors = [];
    corenode.var_84b0ef6bddd2907a = [];
    corenode.var_511459d6509633b1 = [];
    corenode.var_de77472db7bdd0ec = [];
    corenode.firebarrels = [];
    corenode.gaspuddles = [];
    corenode.defenselevel = function_908ef13b806cc4c2();
    corenode.subarea = function_a44e168e8cced18(corenode.origin, corenode.poi);
    corenode.flags = [];
    corenode.boss = [];
    corenode.props = [];
    corenode.loadout = [];
    corenode.locker = [];
    corenode.poi = scripts/mp/poi::function_6cc445c02b5effac(corenode.origin);
    corenode.var_aa7c37b8b3ec1f46 = [];
    corenode.lootcaches = [];
    corenode.var_ce9a81d514b212b7 = undefined;
    corenode.spawnzones = [];
    corenode.spawnzones["high"] = [];
    corenode.spawnzones["medium"] = [];
    corenode.spawnzones["low"] = [];
    if (!isdefined(corenode.ishero) || !isdefined(corenode.var_c6cf0a05d2f9b5df)) {
        if (issubstr(corenode.script_noteworthy, "hero")) {
            if (issubstr(corenode.script_noteworthy, "noTacMap")) {
                corenode.var_c6cf0a05d2f9b5df = 1;
            } else {
                corenode.ishero = 1;
            }
        }
    }
    foreach (node in var_55a8cd2462d707dc) {
        if (!isdefined(node.script_noteworthy)) {
            continue;
        }
        if (!isdefined(node.angles)) {
            node.angles = (0, 0, 0);
        }
        if (issubstr(node.script_noteworthy, "flag") && issubstr(node.script_noteworthy, "mayh")) {
            corenode.flags[corenode.flags.size] = node;
            continue;
        }
        if (issubstr(node.script_noteworthy, "boss") || issubstr(node.script_noteworthy, "minion")) {
            if (issubstr(node.script_noteworthy, "boss")) {
                node.var_f28f3885995a439d = corenode;
                corenode.boss[corenode.boss.size] = node;
            }
            continue;
        }
        script_noteworthy = tolower(node.script_noteworthy);
        if (issubstr(script_noteworthy, "guard")) {
            if (scripts/cp_mp/utility/game_utility::function_e21746abaaaf8414() && function_9886567fbafcd11a(node.origin, (-790, 7085, 434), 64)) {
                continue;
            }
            corenode.guardnodes[corenode.guardnodes.size] = node;
            continue;
        } else if (issubstr(script_noteworthy, "spawnzone")) {
            struct = spawnstruct();
            struct.volume = node;
            struct.guardnodes = [];
            struct.agenttarget = 0;
            if (issubstr(script_noteworthy, "high")) {
                corenode.spawnzones["high"][corenode.spawnzones["high"].size] = struct;
            } else if (issubstr(script_noteworthy, "medium")) {
                corenode.spawnzones["medium"][corenode.spawnzones["medium"].size] = struct;
            } else if (issubstr(script_noteworthy, "low")) {
                corenode.spawnzones["low"][corenode.spawnzones["low"].size] = struct;
            }
            continue;
        }
        switch (script_noteworthy) {
        case #"hash_4926d3a8cf03e120":
            corenode.elites[corenode.elites.size] = node;
            break;
        case #"hash_cd0ffa281c8e3a8":
        case #"hash_d35ffa282189588":
            keyname = "fortress";
            if (isdefined(keynameoverride)) {
                keyname = keynameoverride;
            }
            corenode.lockeddoors = namespace_58dcf42cf567f34f::function_ad1b6accbaab404e(node, corenode.lockeddoors, keyname, 0);
            break;
        case #"hash_41c0868cf5054ad":
        case #"hash_6a6b47ec1700520d":
            break;
        case #"hash_a0a74a8a22d1d16":
            keyname = "stuck";
            corenode.var_84b0ef6bddd2907a = namespace_58dcf42cf567f34f::function_ad1b6accbaab404e(node, corenode.var_84b0ef6bddd2907a, keyname, 0);
            break;
        case #"hash_800a6d0437386f09":
            corenode.laddercovers[corenode.laddercovers.size] = node;
            break;
        case #"hash_32d78286d133011e":
            corenode.var_aa7c37b8b3ec1f46[corenode.var_aa7c37b8b3ec1f46.size] = node;
            break;
        case #"hash_6c4c3516ab5ce943":
            corenode.loadout[corenode.loadout.size] = node;
            break;
        case #"hash_921d99011947b9c0":
            corenode.locker[corenode.locker.size] = node;
            break;
        case #"hash_210b7aafdd930498":
            corenode.var_de77472db7bdd0ec[corenode.var_de77472db7bdd0ec.size] = node;
            break;
        case #"hash_44424dd83e5be405":
            corenode.firebarrels[corenode.firebarrels.size] = node;
            break;
        case #"hash_a84e8c7c29718ade":
            corenode.gaspuddles[corenode.gaspuddles.size] = node;
            break;
        case #"hash_6f31f411a0fcf1cb":
            corenode.lootcaches[corenode.lootcaches.size] = node;
            break;
        case #"hash_949700a42a05db6b":
        case #"hash_d33f462c9ac49ccb":
            corenode.var_ce9a81d514b212b7 = node;
            break;
        case #"hash_8760a6f4c8798ea4":
            keyname = "biobunker_fortress";
            corenode.lockeddoors = namespace_58dcf42cf567f34f::function_ad1b6accbaab404e(node, corenode.lockeddoors, keyname, 0);
            break;
        default:
            corenode.props[corenode.props.size] = node;
            break;
        }
    }
    if (!isdefined(corenode.var_aa7c37b8b3ec1f46) || corenode.var_aa7c37b8b3ec1f46.size == 0) {
        function_8668cfb45844f507();
        corenode.var_aa7c37b8b3ec1f46 = level.var_42d94681e15bbbdd;
        vol = getclosest(corenode.origin, corenode.var_aa7c37b8b3ec1f46);
        if (isdefined(vol) && isdefined(vol.targetname)) {
            corenode.var_aa7c37b8b3ec1f46 = array_combine(getentarray(vol.targetname, "targetname"), function_f159c10d5cf8f0b4(vol.targetname, "targetname"));
        } else {
            corenode.var_aa7c37b8b3ec1f46 = [vol];
        }
    }
    if (istrue(level.var_4fe0c43951f6ce37)) {
        return;
    }
    corenode.patrolpaths = function_af107842f66082ba(corenode.origin, corenode.poi);
    corenode.spawnpackages = function_e2b80b7fa8aca2b0(corenode.origin, corenode.poi, corenode.subarea, 1);
    scripts/mp/ai_behavior::function_b60b5affd510926c(corenode, 1);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28fc
// Size: 0x62
function function_64fafa59eca9ca33() {
    foreach (var_6c01b37e33d16fd8 in level.var_f1073fbd45b59a06.unusedfortresses) {
        function_9a3e15573892c4a3(var_6c01b37e33d16fd8);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2965
// Size: 0x2e3
function function_9a3e15573892c4a3(corenode) {
    if (istrue(corenode.var_5683fb2485637c86)) {
        return;
    }
    var_55a8cd2462d707dc = array_combine(getstructarray(corenode.target, "targetname"), getentarray(corenode.target, "targetname"));
    corenode.var_30dd991a898ecc38 = [];
    corenode.var_aa7c37b8b3ec1f46 = [];
    var_da6c688620302099 = [];
    foreach (node in var_55a8cd2462d707dc) {
        if (!isdefined(node.script_noteworthy)) {
            continue;
        }
        if (!isdefined(node.angles)) {
            node.angles = (0, 0, 0);
        }
        script_noteworthy = tolower(node.script_noteworthy);
        if (issubstr(script_noteworthy, "window")) {
            corenode.var_30dd991a898ecc38[corenode.var_30dd991a898ecc38.size] = node;
            continue;
        }
        if (issubstr(script_noteworthy, "guard")) {
            var_da6c688620302099[var_da6c688620302099.size] = node;
            continue;
        }
        if (script_noteworthy == "fortress_volume") {
            corenode.var_aa7c37b8b3ec1f46[corenode.var_aa7c37b8b3ec1f46.size] = node;
        }
    }
    if (!isdefined(corenode.var_aa7c37b8b3ec1f46) || corenode.var_aa7c37b8b3ec1f46.size == 0) {
        function_8668cfb45844f507();
        corenode.var_aa7c37b8b3ec1f46 = level.var_42d94681e15bbbdd;
        vol = getclosest(corenode.origin, corenode.var_aa7c37b8b3ec1f46);
        if (isdefined(vol) && isdefined(vol.targetname)) {
            corenode.var_aa7c37b8b3ec1f46 = array_combine(getentarray(vol.targetname, "targetname"), function_f159c10d5cf8f0b4(vol.targetname, "targetname"));
        } else {
            corenode.var_aa7c37b8b3ec1f46 = [vol];
        }
    }
    foreach (node in var_da6c688620302099) {
        if (function_20f6e9317b1baf3d(node.origin, corenode)) {
            if (!isdefined(corenode.spawnclosetnodes)) {
                corenode.spawnclosetnodes = [];
            }
            corenode.spawnclosetnodes[corenode.spawnclosetnodes.size] = node;
        }
    }
    corenode.var_aa7c37b8b3ec1f46 = undefined;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c4f
// Size: 0x11a
function function_de96257d602d3ad8() {
    var_819789cbd076311f = getdvarint(@"hash_fc146a67ce24927c", 3);
    if (var_819789cbd076311f <= 0) {
        return;
    }
    var_e45d5f2d42bd0730 = getdvarint(@"hash_a12a51b8c9c5fafb", 8);
    var_3e9fdf9a7c2dee59 = 0;
    foreach (var_6c01b37e33d16fd8 in level.var_f1073fbd45b59a06.unusedfortresses) {
        var_6c01b37e33d16fd8.var_30dd991a898ecc38 = array_randomize(var_6c01b37e33d16fd8.var_30dd991a898ecc38);
        for (i = 0; i < var_819789cbd076311f; i++) {
            if (isdefined(var_6c01b37e33d16fd8.var_30dd991a898ecc38[i])) {
                glassradiusdamage(var_6c01b37e33d16fd8.var_30dd991a898ecc38[i].origin, 100, 64, 0);
                var_3e9fdf9a7c2dee59++;
            }
            if (var_3e9fdf9a7c2dee59 == var_e45d5f2d42bd0730) {
                waitframe();
                var_3e9fdf9a7c2dee59 = 0;
            }
        }
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d70
// Size: 0xbb
function function_8668cfb45844f507() {
    if (!isdefined(level.var_42d94681e15bbbdd)) {
        level.var_42d94681e15bbbdd = array_combine(getentarray("fortress_volume", "script_noteworthy"), function_f159c10d5cf8f0b4("fortress_volume", "script_noteworthy"));
        if (scripts/cp_mp/utility/game_utility::function_e21746abaaaf8414()) {
            level.var_42d94681e15bbbdd = array_combine(level.var_42d94681e15bbbdd, function_f159c10d5cf8f0b4("mediumWarehouse02", "script_noteworthy"));
            level.var_42d94681e15bbbdd = array_combine(level.var_42d94681e15bbbdd, function_f159c10d5cf8f0b4("mediumOffice01", "script_noteworthy"));
            level.var_42d94681e15bbbdd = array_combine(level.var_42d94681e15bbbdd, function_f159c10d5cf8f0b4("smallWarehousesmall01", "script_noteworthy"));
        }
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e32
// Size: 0xe7
function function_af107842f66082ba(origin, poiname) {
    if (!isdefined(level.patrolpaths)) {
        waitframe();
    }
    patrolpaths = [];
    possiblepaths = undefined;
    if (scripts/mp/poi::function_47d356083884f913()) {
        possiblepaths = level.poi[poiname]["patrolPaths"];
    } else {
        possiblepaths = level.patrolpaths;
    }
    foreach (pathstruct in possiblepaths) {
        if (!pathstruct.claimed && distance2dsquared(origin, pathstruct.path[0].origin) < 6250000) {
            patrolpaths[patrolpaths.size] = pathstruct;
        }
    }
    return patrolpaths;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f21
// Size: 0x11c
function function_e2b80b7fa8aca2b0(origin, poiname, subarea, var_f283dda5bae047e9) {
    spawnpackages = [];
    var_91018faa607cfbb0 = [];
    if (isdefined(subarea) && subarea.var_71ad22c5d093d90b != "orphan") {
        var_91018faa607cfbb0 = subarea.var_24a2cd19eed8f75d;
    }
    if (istrue(var_f283dda5bae047e9)) {
        if (scripts/mp/poi::function_47d356083884f913()) {
            var_91018faa607cfbb0 = array_combine(var_91018faa607cfbb0, level.poi[poiname]["subAreas"]["orphan"].var_24a2cd19eed8f75d);
        }
    }
    foreach (package in var_91018faa607cfbb0) {
        if (!istrue(package.spawned) && distance2dsquared(origin, package.origin) < 4000000) {
            spawnpackages[spawnpackages.size] = package;
        }
    }
    return sortbydistance(spawnpackages, origin);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3045
// Size: 0x3c
function function_baef4910acea00f0(origin, var_9262f0f1ad57fef7, var_25a3e7e5699ec26b, poiname) {
    sorted = function_22e481ecb8fc7bf1(origin, var_9262f0f1ad57fef7, var_25a3e7e5699ec26b, poiname);
    return sorted[0];
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3089
// Size: 0x101
function function_22e481ecb8fc7bf1(origin, var_9262f0f1ad57fef7, var_25a3e7e5699ec26b, poiname) {
    if (istrue(var_9262f0f1ad57fef7)) {
        var_8a40ff9ed07bd5f3 = level.var_f1073fbd45b59a06.unusedfortresses;
    } else {
        var_8a40ff9ed07bd5f3 = level.var_f1073fbd45b59a06.var_8a40ff9ed07bd5f3;
    }
    var_ce5b743e3b2dd235 = [];
    if (istrue(var_25a3e7e5699ec26b)) {
        if (!isdefined(poiname)) {
            poiname = scripts/mp/poi::function_6cc445c02b5effac(origin);
        }
        foreach (fortress in var_8a40ff9ed07bd5f3) {
            if (isdefined(fortress.poi) && fortress.poi == poiname) {
                var_ce5b743e3b2dd235[var_ce5b743e3b2dd235.size] = fortress;
            }
        }
        if (var_ce5b743e3b2dd235.size > 0) {
            var_8a40ff9ed07bd5f3 = var_ce5b743e3b2dd235;
        }
    }
    var_8a40ff9ed07bd5f3 = sortbydistance(var_8a40ff9ed07bd5f3, origin);
    return var_8a40ff9ed07bd5f3;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3192
// Size: 0xd0
function function_bbe42d7091bedfc5(origin, poolname, var_9262f0f1ad57fef7) {
    var_bc6fce51761a976d = function_f6e735e018927744(poolname);
    if (!isdefined(var_bc6fce51761a976d)) {
        return undefined;
    }
    var_55a8cd2462d707dc = [];
    foreach (target in function_f6e735e018927744(poolname)) {
        fortress = function_4d5a3497a81aaa2f(target);
        if (isdefined(fortress)) {
            if (isdefined(var_9262f0f1ad57fef7) && istrue(var_9262f0f1ad57fef7)) {
                continue;
            }
            var_55a8cd2462d707dc[var_55a8cd2462d707dc.size] = fortress;
        }
    }
    if (var_55a8cd2462d707dc.size < 1) {
        return undefined;
    }
    var_55a8cd2462d707dc = sortbydistance(var_55a8cd2462d707dc, origin);
    return var_55a8cd2462d707dc[0];
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x326a
// Size: 0x54
function function_287b1c363d0aff09(fortress) {
    if (!isdefined(level.var_cba5fa3b3b5130a1)) {
        level.var_cba5fa3b3b5130a1 = 0;
    }
    name = "fortressUniqueName" + level.var_cba5fa3b3b5130a1;
    fortress.uniquename = name;
    level.var_cba5fa3b3b5130a1++;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32c5
// Size: 0x968
function function_dec2a213ee64b9d(fortress, insideignore, skipcqb) {
    function_543e6ec06c4ffa97(fortress);
    var_58a1836e68ac562f = skipcqb;
    function_287b1c363d0aff09(fortress);
    function_572838690d80d959(fortress.uniquename);
    var_d95f081254349631 = 0;
    if (fortress.var_c8c070d7375ef1e == "hero_epic") {
        var_d95f081254349631 = level.var_f1073fbd45b59a06.var_b450d0ab756e4716;
    }
    if (istrue(level.var_4094a9c5b998313d) && istrue(fortress.isblacksite)) {
        var_d95f081254349631 = 0;
    }
    if (scripts/mp/utility/game::getsubgametype() == "dmz") {
        scripts/mp/flags::gameflagwait("start_fortress_spawns");
    }
    if (!istrue(fortress.var_a49aa0ba3a6824ff)) {
        foreach (bossnode in fortress.boss) {
            agent = function_90bfd0310a78f7c9(bossnode, 0, fortress);
            if (istrue(insideignore) && function_20f6e9317b1baf3d(bossnode.origin, fortress)) {
                function_c1ca4693a6278ba6(agent);
            }
        }
        foreach (var_aff03355d9684ed4 in fortress.elites) {
            agent = function_90bfd0310a78f7c9(var_aff03355d9684ed4, 0, fortress, skipcqb);
            namespace_14d36171baccf528::function_1828f1e20e52b418(agent, fortress.tieroverride);
            if (istrue(insideignore) && function_20f6e9317b1baf3d(var_aff03355d9684ed4.origin, fortress)) {
                function_c1ca4693a6278ba6(agent);
            }
        }
        if (isdefined(fortress.var_5b034a098fb968ad)) {
            var_d68856e67750e167 = fortress.var_5b034a098fb968ad;
        } else {
            var_d68856e67750e167 = level.var_f1073fbd45b59a06.var_89cc4de8832d0ea9[fortress.var_c8c070d7375ef1e];
        }
        var_e2480c89547ba47a = level.var_f1073fbd45b59a06.var_5cd7132d90176250[fortress.var_c8c070d7375ef1e];
        guardnodes = array_randomize(fortress.guardnodes);
        forceelite = 0;
        for (i = 0; i < var_d68856e67750e167; i++) {
            node = guardnodes[i];
            if (!isdefined(node)) {
                break;
            }
            if (var_e2480c89547ba47a > 0 && function_20f6e9317b1baf3d(node.origin, fortress)) {
                node.script_noteworthy = "guard_riotshield";
                node.agent_type = "topTier";
                skipcqb = 1;
                var_e2480c89547ba47a--;
            } else if (var_d95f081254349631 > 0) {
                forceelite = 1;
                var_d95f081254349631--;
            }
            if (istrue(fortress.isblacksite) && istrue(level.var_4094a9c5b998313d)) {
                if (mod(i, 2) == 0) {
                    agent = function_90bfd0310a78f7c9(node, issubstr(node.script_noteworthy, "stationary"), fortress, skipcqb, istrue(forceelite), 1);
                } else {
                    agent = function_90bfd0310a78f7c9(node, issubstr(node.script_noteworthy, "stationary"), fortress, skipcqb, istrue(forceelite), 2);
                }
            } else {
                agent = function_90bfd0310a78f7c9(node, issubstr(node.script_noteworthy, "stationary"), fortress, skipcqb, istrue(forceelite));
            }
            if (isdefined(agent)) {
                if (istrue(forceelite)) {
                    namespace_14d36171baccf528::function_1828f1e20e52b418(agent);
                    forceelite = 0;
                }
                if (istrue(insideignore) && function_20f6e9317b1baf3d(node.origin, fortress)) {
                    function_c1ca4693a6278ba6(agent);
                }
            }
            skipcqb = var_58a1836e68ac562f;
        }
    } else {
        fortress.spawnzones["high"] = array_randomize(fortress.spawnzones["high"]);
        fortress.spawnzones["medium"] = array_randomize(fortress.spawnzones["medium"]);
        fortress.spawnzones["low"] = array_randomize(fortress.spawnzones["low"]);
        var_cb3d902a4916e523 = [];
        foreach (zone in fortress.spawnzones["high"]) {
            zone.guardnodes = array_randomize(zone.guardnodes);
            var_f25bb8724fff3684 = array_slice(zone.guardnodes, 0, zone.agenttarget);
            var_cb3d902a4916e523 = array_combine(var_cb3d902a4916e523, var_f25bb8724fff3684);
            /#
                if (zone.guardnodes.size < zone.agenttarget) {
                    println("stronghold_hero_civic_center" + zone.origin + "brloot_weapon_lm_foxtrot_lege");
                }
            #/
        }
        foreach (zone in fortress.spawnzones["medium"]) {
            zone.guardnodes = array_randomize(zone.guardnodes);
            var_f25bb8724fff3684 = array_slice(zone.guardnodes, 0, zone.agenttarget);
            var_cb3d902a4916e523 = array_combine(var_cb3d902a4916e523, var_f25bb8724fff3684);
            /#
                if (zone.guardnodes.size < zone.agenttarget) {
                    println("stronghold_hero_civic_center" + zone.origin + "brloot_weapon_lm_foxtrot_lege");
                }
            #/
        }
        foreach (zone in fortress.spawnzones["low"]) {
            zone.guardnodes = array_randomize(zone.guardnodes);
            var_f25bb8724fff3684 = array_slice(zone.guardnodes, 0, zone.agenttarget);
            var_cb3d902a4916e523 = array_combine(var_cb3d902a4916e523, var_f25bb8724fff3684);
            /#
                if (zone.guardnodes.size < zone.agenttarget) {
                    println("stronghold_hero_civic_center" + zone.origin + "brloot_weapon_lm_foxtrot_lege");
                }
            #/
        }
        var_e2480c89547ba47a = level.var_f1073fbd45b59a06.var_5cd7132d90176250[fortress.var_c8c070d7375ef1e];
        var_cb3d902a4916e523 = array_randomize(var_cb3d902a4916e523);
        forceelite = 0;
        foreach (node in var_cb3d902a4916e523) {
            if (var_e2480c89547ba47a > 0 && function_20f6e9317b1baf3d(node.origin, fortress)) {
                node.script_noteworthy = "guard_riotshield";
                skipcqb = 1;
                var_e2480c89547ba47a--;
            } else if (var_d95f081254349631 > 0 && function_20f6e9317b1baf3d(node.origin, fortress)) {
                forceelite = 1;
                var_d95f081254349631--;
            }
            agent = function_90bfd0310a78f7c9(node, issubstr(node.script_noteworthy, "stationary"), fortress, skipcqb, istrue(forceelite));
            if (isdefined(agent)) {
                if (istrue(forceelite)) {
                    agenttier = 1;
                    if (!isagent(agent)) {
                        aitype = level.var_879053468f168806[agent].aitype;
                        if (issubstr(aitype, "tier2")) {
                            agenttier = 2;
                        } else if (issubstr(aitype, "tier3")) {
                            agenttier = 3;
                        }
                    } else {
                        agenttier = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "tier");
                    }
                    namespace_14d36171baccf528::function_1828f1e20e52b418(agent, agenttier);
                    forceelite = 0;
                }
                if (istrue(insideignore) && function_20f6e9317b1baf3d(node.origin, fortress)) {
                    function_c1ca4693a6278ba6(agent);
                }
            }
            skipcqb = var_58a1836e68ac562f;
        }
    }
    var_2b9f49bc95a370d8 = level.var_f1073fbd45b59a06.var_6212ae7684246846[fortress.var_c8c070d7375ef1e];
    patrols = array_randomize(fortress.patrolpaths);
    for (i = 0; i < var_2b9f49bc95a370d8; i++) {
        if (patrols.size <= 0) {
            break;
        }
        patrolstruct = function_1a2e58ffaafb1d40(patrols);
        if (isdefined(patrolstruct)) {
            agent = function_92fa32ee6185892(patrolstruct, fortress);
            if (istrue(insideignore) && function_20f6e9317b1baf3d(patrolstruct.origin, fortress)) {
                function_c1ca4693a6278ba6(agent);
            }
        }
    }
    fortress notify("spawned_agents");
    fortress.spawnedagents = 1;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c34
// Size: 0xbb
function function_4527248d0334a562(agent, var_451a9d27d63c746b) {
    agent.agentStruct.var_451a9d27d63c746b = var_451a9d27d63c746b;
    function_c36f897d56e28169(agent, agent.agentStruct.fortress.uniquename);
    function_e812b7065161da79(var_451a9d27d63c746b, agent.agentStruct.fortress.uniquename);
    if (issubstr(agent.agent_type, "riotshield") && !istrue(agent.agentStruct.fortress.unlocked)) {
        function_b6fae9e25ce5d86e(agent);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cf6
// Size: 0x8e
function fortress_agentPostDormancy(agent) {
    function_c36f897d56e28169(agent.agentStruct.var_451a9d27d63c746b, agent.agentStruct.fortress.uniquename);
    function_e812b7065161da79(agent, agent.agentStruct.fortress.uniquename);
    if (issubstr(agent.agent_type, "riotshield")) {
        agent thread function_70c8a3094cab3d57(agent);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d8b
// Size: 0x30
function function_de7803621d18c6a8(struct, id) {
    function_c36f897d56e28169(id, struct.fortress.uniquename);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dc2
// Size: 0x15a
function function_1cbdd3db07bff2d6(agent, killer) {
    if (isagent(agent)) {
        agentStruct = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "agentStruct");
        if (isdefined(agentStruct)) {
            function_c36f897d56e28169(agent, agentStruct.fortress.uniquename);
            if (isdefined(killer) && isplayer(killer) && isdefined(agentStruct.fortress.contributingplayers) && !array_contains(agentStruct.fortress.contributingplayers, killer)) {
                agentStruct.fortress.contributingplayers[agentStruct.fortress.contributingplayers.size] = killer;
            }
        }
    } else if (isint(agent)) {
        info = namespace_14d36171baccf528::function_2b0e82156fa6075b(agent);
        if (isdefined(info) && isdefined(info.agentStruct) && isdefined(info.agentStruct.fortress)) {
            function_c36f897d56e28169(agent, info.agentStruct.fortress.uniquename);
        }
    }
    namespace_14d36171baccf528::function_3ea1225bf6192343(agent, undefined);
    namespace_14d36171baccf528::function_97fbd14bbcf19d9c(agent, "fortress_agentPostDormancy", &fortress_agentPostDormancy);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f23
// Size: 0x83f
function function_543e6ec06c4ffa97(fortress) {
    if (fortress.spawnzones["high"].size + fortress.spawnzones["medium"].size + fortress.spawnzones["low"].size <= 0) {
        return;
    }
    fortress.var_a49aa0ba3a6824ff = 1;
    allzones = array_combine_multiple([fortress.spawnzones["high"], fortress.spawnzones["medium"], fortress.spawnzones["low"]]);
    foreach (zone in allzones) {
        zone.tier = function_3af63ebaf6c4ffe4(zone.volume);
        zone.origin = zone.volume.origin;
    }
    foreach (guardnode in fortress.guardnodes) {
        var_2dc6f44641d0cbd3 = 0;
        foreach (zone in allzones) {
            if (ispointinvolume(guardnode.origin, zone.volume)) {
                guardnode.var_ba20d31f7b5ce32 = zone.tier;
                zone.guardnodes[zone.guardnodes.size] = guardnode;
                var_2dc6f44641d0cbd3 = 1;
                break;
            }
        }
        if (var_2dc6f44641d0cbd3) {
            continue;
        }
        closestzone = undefined;
        closestdist = undefined;
        foreach (zone in allzones) {
            dist = distance2dsquared(guardnode.origin, zone.volume.origin);
            if (!isdefined(closestzone)) {
                closestzone = zone;
                closestdist = dist;
                continue;
            }
            if (dist < closestdist) {
                closestzone = zone;
                closestdist = dist;
            }
        }
        guardnode.var_ba20d31f7b5ce32 = closestzone.tier;
        closestzone.guardnodes[closestzone.guardnodes.size] = guardnode;
    }
    foreach (zone in allzones) {
        zone.volume delete();
    }
    fortress.spawnzones["high"] = array_randomize(fortress.spawnzones["high"]);
    fortress.spawnzones["medium"] = array_randomize(fortress.spawnzones["medium"]);
    fortress.spawnzones["low"] = array_randomize(fortress.spawnzones["low"]);
    if (isdefined(fortress.var_5b034a098fb968ad)) {
        var_d68856e67750e167 = fortress.var_5b034a098fb968ad;
    } else {
        var_d68856e67750e167 = level.var_f1073fbd45b59a06.var_89cc4de8832d0ea9[fortress.var_c8c070d7375ef1e];
    }
    var_548d72407774b1f = var_d68856e67750e167 / allzones.size;
    var_9ea1d5bb680b2893 = 0;
    foreach (spawnzone in fortress.spawnzones["high"]) {
        spawnzone.agenttarget = var_548d72407774b1f + 1;
        var_9ea1d5bb680b2893++;
    }
    foreach (spawnzone in fortress.spawnzones["low"]) {
        spawnzone.agenttarget = var_548d72407774b1f - 1;
        var_9ea1d5bb680b2893--;
    }
    if (var_9ea1d5bb680b2893 > 0) {
        foreach (spawnzone in fortress.spawnzones["medium"]) {
            if (var_9ea1d5bb680b2893 > 0) {
                spawnzone.agenttarget = var_548d72407774b1f - 0.5;
                var_9ea1d5bb680b2893 = var_9ea1d5bb680b2893 - 0.5;
                continue;
            }
            spawnzone.agenttarget = var_548d72407774b1f;
        }
    }
    lowesthigh = undefined;
    var_cf8ced66ea8c05bb = 0;
    foreach (spawnzone in fortress.spawnzones["high"]) {
        spawnzone.agenttarget = int(ceil(spawnzone.agenttarget));
        var_cf8ced66ea8c05bb = var_cf8ced66ea8c05bb + spawnzone.agenttarget;
        if (!isdefined(lowesthigh) || spawnzone.agenttarget < lowesthigh) {
            lowesthigh = spawnzone.agenttarget;
        }
    }
    foreach (spawnzone in fortress.spawnzones["low"]) {
        spawnzone.agenttarget = int(floor(spawnzone.agenttarget));
        if (spawnzone.agenttarget <= 0) {
            spawnzone.agenttarget = 1;
        }
        var_cf8ced66ea8c05bb = var_cf8ced66ea8c05bb + spawnzone.agenttarget;
    }
    highestmedium = undefined;
    foreach (spawnzone in fortress.spawnzones["medium"]) {
        potentialmedium = int(ceil(spawnzone.agenttarget));
        if (potentialmedium < lowesthigh) {
            spawnzone.agenttarget = potentialmedium;
        } else {
            spawnzone.agenttarget = int(spawnzone.agenttarget);
        }
        if (!isdefined(highestmedium) || spawnzone.agenttarget > highestmedium) {
            highestmedium = spawnzone.agenttarget;
        }
        var_cf8ced66ea8c05bb = var_cf8ced66ea8c05bb + spawnzone.agenttarget;
    }
    if (var_cf8ced66ea8c05bb > var_d68856e67750e167) {
        foreach (spawnzone in fortress.spawnzones["high"]) {
            if (spawnzone.agenttarget - 1 > highestmedium) {
                spawnzone.agenttarget = spawnzone.agenttarget - 1;
                var_cf8ced66ea8c05bb--;
            }
            if (var_cf8ced66ea8c05bb <= var_d68856e67750e167) {
                return;
            }
        }
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4769
// Size: 0x69
function function_3af63ebaf6c4ffe4(volume) {
    if (issubstr(volume.script_noteworthy, "tier3")) {
        return 3;
    }
    if (issubstr(volume.script_noteworthy, "tier2")) {
        return 2;
    }
    if (issubstr(volume.script_noteworthy, "tier1")) {
        return 1;
    }
    return -1;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47d9
// Size: 0x47
function function_c1ca4693a6278ba6(agent) {
    if (!isdefined(agent)) {
        return;
    }
    if (isagent(agent)) {
        agent.ignoreall = 1;
        return;
    }
    if (isint(agent)) {
        namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "fortressAgent_setIgnoreAgentPostSpawn", &fortressAgent_setIgnoreAgentPostSpawn);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4827
// Size: 0x1d
function fortressAgent_setIgnoreAgentPostSpawn() {
    agent = self;
    agent.ignoreall = 1;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x484b
// Size: 0x414
function function_90bfd0310a78f7c9(node, isstationary, fortress, skipcqb, var_15a8207a3c22904b, tieroverride) {
    runcqb = 0;
    var_d00e2f0d8ce26377 = 0;
    cqbnodes = [];
    if (function_20f6e9317b1baf3d(node.origin, fortress) || isdefined(fortress.name) && isstring(fortress.name) && fortress.name == "oilfield") {
        var_d00e2f0d8ce26377 = 1;
    }
    if (!istrue(skipcqb) && (var_d00e2f0d8ce26377 || function_4ec4f39a2e1745f2(fortress))) {
        nodearray = array_combine(fortress.var_e67f0b2ea7ae69ed, fortress.var_8a055a821dda7da0);
        if (nodearray.size == 0) {
            nodearray = fortress.var_3288c473e8336ab4;
        } else if (nodearray.size < 6) {
            nodearray = array_combine(nodearray, fortress.var_3288c473e8336ab4);
        }
        nodearray = array_randomize(nodearray);
        cqbnodes = function_3a17f0ccddc999b4(node.origin, nodearray, 2, 256);
        if (cqbnodes.size > 0) {
            runcqb = 1;
        }
    }
    node.var_4b0bad4944a4cbc0 = 1;
    priority = "high";
    if (function_4ec4f39a2e1745f2(fortress)) {
        priority = "high";
    }
    tier = fortress.tieroverride;
    if (isdefined(tieroverride)) {
        tier = tieroverride;
    }
    if (isdefined(node.var_ba20d31f7b5ce32) && node.var_ba20d31f7b5ce32 > 0) {
        tier = node.var_ba20d31f7b5ce32;
    }
    if (istrue(var_15a8207a3c22904b)) {
        tier = 3;
    }
    nationalityoverride = fortress.nationalityoverride;
    if (!isdefined(nationalityoverride)) {
        nationalityoverride = level.var_97718bb0cb314f6b;
    }
    aitype = function_d5bc07eabf352abb(node, undefined, undefined, undefined, tier, nationalityoverride);
    groupname = function_59cdfe39e161a336(node);
    agent = ai_mp_requestspawnagent(aitype, node.origin, node.angles, priority, "fortressGuards", undefined, groupname, undefined, undefined, fortress.poi, runcqb);
    if (!isdefined(agent)) {
        return;
    }
    if (istrue(level.var_45ca3cfb9dca4f97)) {
        level thread scripts/mp/utility/debug::drawsphere(node.origin, 128, 500, (0, 1, 0));
    }
    fortress.var_fdbe1a2317a6a37d.var_13235d60c661e10b++;
    agentStruct = spawnstruct();
    agentStruct.fortress = fortress;
    agentStruct.var_90ccd093de8c8c55 = &function_4527248d0334a562;
    agentStruct.ondeath = &function_1cbdd3db07bff2d6;
    agentStruct.var_9e729433fd479f19 = &function_de7803621d18c6a8;
    if (isint(agent)) {
        agentStruct.var_451a9d27d63c746b = agent;
    }
    namespace_14d36171baccf528::function_3ea1225bf6192343(agent, agentStruct);
    namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "fortress_agentPostDormancy", &fortress_agentPostDormancy);
    function_e812b7065161da79(agent, fortress.uniquename);
    if (node.script_noteworthy == "guard_riotshield") {
        wanderradius = 32;
        if (!isint(agent)) {
            agent.agentStruct.fortress = fortress;
            agent thread function_70c8a3094cab3d57(agent);
        }
    } else {
        wanderradius = undefined;
    }
    if (isagent(agent)) {
        if (runcqb) {
            agent thread behavior_cqb(agent, cqbnodes);
        } else if (istrue(isstationary)) {
            agent thread function_b11c1964f528574b(agent);
        } else {
            agent thread function_9bbf1713a14fa580(agent, wanderradius);
        }
    } else if (isint(agent)) {
        if (runcqb) {
            function_29b1f7f88b879860(agent, cqbnodes);
        } else if (!istrue(isstationary)) {
            function_e786aa52b93833eb(agent, undefined, wanderradius);
        } else {
            function_d1e130608e4f8487(agent);
        }
    }
    return agent;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c67
// Size: 0x13c
function function_92fa32ee6185892(pathstruct, fortress) {
    pathstruct.var_4b0bad4944a4cbc0 = 1;
    if (!isdefined(pathstruct.poi)) {
        pathstruct.poi = fortress.poi;
    }
    nationalityoverride = fortress.nationalityoverride;
    if (!isdefined(nationalityoverride)) {
        nationalityoverride = level.var_97718bb0cb314f6b;
    }
    if (isdefined(pathstruct.path) && isdefined(pathstruct.path[0]) && !isdefined(pathstruct.path[0].nationality)) {
        pathstruct.path[0].nationality = nationalityoverride;
    }
    agents = namespace_bfef6903bca5845d::spawnpatrol(pathstruct, level.var_f1073fbd45b59a06.var_33cf4079b4096eb8, level.var_f1073fbd45b59a06.var_1bdf3af6b78dc2ca, fortress, "medium", "fortressPatrols");
    if (!isdefined(agents)) {
        return agents;
    }
    fortress.var_fdbe1a2317a6a37d.var_13235d60c661e10b = fortress.var_fdbe1a2317a6a37d.var_13235d60c661e10b + agents.size;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4daa
// Size: 0x14
function function_2d916d4ae382a8eb(fortress) {
    function_5d8264355db47371(fortress);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dc5
// Size: 0x5d2
function function_9f1e4a5acad09f4b(fortress) {
    fortress.script_noteworthy = tolower(fortress.script_noteworthy);
    if (!isdefined(fortress.poi) && scripts/mp/poi::function_47d356083884f913()) {
        fortress.poi = scripts/mp/poi::function_6cc445c02b5effac(fortress.origin, 1);
    } else {
        fortress.poi = "none";
    }
    if (scripts/cp_mp/utility/game_utility::function_7ee65fae13124702()) {
        if (issubstr(fortress.script_noteworthy, "cave") || issubstr(fortress.poi, "cave")) {
            fortress.name = "cave";
            fortress.var_1a4d8a1df4da9847 = 4500;
        } else if (issubstr(fortress.script_noteworthy, "center")) {
            fortress.name = "civic_center";
        } else if (issubstr(fortress.script_noteworthy, "embassy")) {
            fortress.name = "embassy";
        } else if (issubstr(fortress.poi, "fort")) {
            fortress.name = "fort";
        } else if ((issubstr(fortress.script_noteworthy, "mall") || issubstr(fortress.poi, "sira")) && !issubstr(fortress.script_noteworthy, "small")) {
            fortress.name = "mall";
            fortress.skipcqb = 1;
            fortress.var_fe7de213c314772a = 20;
            fortress.var_5b034a098fb968ad = 25;
        } else if (issubstr(fortress.script_noteworthy, "marshland") || issubstr(fortress.poi, "marshland") && !issubstr(fortress.script_noteworthy, "postoffice")) {
            fortress.name = "marshland";
        } else if (issubstr(fortress.script_noteworthy, "oilfield") || issubstr(fortress.poi, "oilfield")) {
            fortress.name = "oilfield";
        } else if (issubstr(fortress.script_noteworthy, "policeacademy")) {
            fortress.name = "police_academy";
        } else if (issubstr(fortress.script_noteworthy, "postoffice")) {
            fortress.name = "post_office";
        } else if (issubstr(fortress.script_noteworthy, "ship") || issubstr(fortress.poi, "lone")) {
            fortress.name = "ship";
        } else if (issubstr(fortress.script_noteworthy, "terminal")) {
            fortress.name = "terminal";
        } else if (issubstr(fortress.script_noteworthy, "tower")) {
            fortress.name = "tower";
            fortress.var_1a4d8a1df4da9847 = 4500;
        } else if (issubstr(fortress.script_noteworthy, "warehouse") || issubstr(fortress.poi, "exhume")) {
            fortress.name = "warehouse";
        }
    } else if (scripts/cp_mp/utility/game_utility::function_e21746abaaaf8414()) {
        if (issubstr(fortress.script_noteworthy, "castle")) {
            fortress.name = "sealion_castle";
        } else if (issubstr(fortress.script_noteworthy, "cityhall")) {
            fortress.name = "sealion_cityhall";
        }
    } else if (scripts/cp_mp/utility/game_utility::function_5e0e3a24dbb1fae1()) {
        if (issubstr(fortress.script_noteworthy, "aquarium")) {
            fortress.name = "delta_aquarium";
        } else if (issubstr(fortress.script_noteworthy, "castle")) {
            fortress.name = "delta_castle";
        } else if (issubstr(fortress.script_noteworthy, "cityhall")) {
            fortress.name = "delta_cityhall";
        } else if (issubstr(fortress.script_noteworthy, "firestation")) {
            fortress.name = "delta_firestation";
        } else if (issubstr(fortress.script_noteworthy, "oldmuseum")) {
            fortress.name = "delta_oldmuseum";
        } else if (issubstr(fortress.script_noteworthy, "stadium")) {
            fortress.name = "delta_stadium";
        } else if (issubstr(fortress.script_noteworthy, "terminal")) {
            fortress.name = "delta_terminal";
        } else if (issubstr(fortress.script_noteworthy, "trainstation")) {
            fortress.name = "delta_trainstation";
        }
    }
    if (!isdefined(fortress.name)) {
        fortress.name = "unnamed";
    }
    level.var_f1073fbd45b59a06.var_224d6c29e9bb566b[fortress.name] = fortress;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x539e
// Size: 0xa8
function function_4e6dd86684152b17(fortress, keynameoverride) {
    if (!isdefined(fortress.var_6a9a1aeeaa7c25df)) {
        fortress.var_6a9a1aeeaa7c25df = "nonMainFortress";
        if (!isdefined(level.var_f1073fbd45b59a06.var_e5f0869fedd95408)) {
            level.var_f1073fbd45b59a06.var_e5f0869fedd95408 = [];
        }
        level.var_f1073fbd45b59a06.var_e5f0869fedd95408[level.var_f1073fbd45b59a06.var_e5f0869fedd95408.size] = fortress;
    }
    function_eecb9fd7f5e8181b(fortress, keynameoverride);
    if (!istrue(level.var_4fe0c43951f6ce37)) {
        function_956a7feefd3a23aa(fortress);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x544d
// Size: 0x1cb
function function_5d8264355db47371(fortress, lockdoors, var_42293210dec86d6d, var_7a020beed970e537, spawnagents, keynameoverride, var_f2fd46ab32db5810, var_bc2c2d8e7a8cce59, spawntraps, var_29550a90eeb9ced8, trackclearing, skipcqb) {
    level.var_f1073fbd45b59a06.unusedfortresses = array_remove(level.var_f1073fbd45b59a06.unusedfortresses, fortress);
    if (!array_contains(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress)) {
        level.var_f1073fbd45b59a06.var_df987907a483df89[level.var_f1073fbd45b59a06.var_df987907a483df89.size] = fortress;
    }
    fortress.isactive = 1;
    if (!isdefined(lockdoors) || lockdoors) {
        function_68a6379d51e7dbc2(fortress, keynameoverride, var_f2fd46ab32db5810);
    }
    if (!namespace_bd614c3c2275579a::function_a9b26d3ed078e149()) {
        if (!issubstr(fortress.script_noteworthy, "noTacMap") && (!isdefined(var_7a020beed970e537) || var_7a020beed970e537)) {
            function_fb256f37d5e18aeb(fortress);
        }
        if (!isdefined(spawnagents) || spawnagents) {
            if (isdefined(var_bc2c2d8e7a8cce59) && isfunction(var_bc2c2d8e7a8cce59)) {
                [[ var_bc2c2d8e7a8cce59 ]](fortress);
            } else {
                thread function_dec2a213ee64b9d(fortress, undefined, skipcqb);
            }
        }
    }
    if (istrue(level.var_447a5d19ba3b177a) && (!isdefined(spawntraps) || spawntraps)) {
        function_b941ee96c15c2b44(fortress);
        function_eb55b7b980bca63c(fortress);
        thread function_2a0231b6edcafa35(fortress);
    }
    if (!isdefined(trackclearing) || trackclearing) {
        thread function_8d2765f0ce279c28(fortress);
    }
    function_3f213275327cf454(fortress, var_29550a90eeb9ced8);
    thread function_7fdb1a4cf3b80584(fortress);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x561f
// Size: 0x30
function function_5fdeef1aff6dd31c(fortress) {
    fortress.var_ddb9adc01816d747 = 1;
    function_5d8264355db47371(fortress, 0, undefined, 1, 1, undefined, undefined, undefined, undefined, undefined, undefined, 1);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x5656
// Size: 0xb0
function function_f88db9c7ac59f910(origin, lockdoors, var_42293210dec86d6d, var_7a020beed970e537, spawnagents, keynameoverride, var_f2fd46ab32db5810, var_bc2c2d8e7a8cce59) {
    fortress = function_baef4910acea00f0(origin);
    if (!isdefined(fortress) || istrue(fortress.var_5683fb2485637c86)) {
        return;
    }
    function_4e6dd86684152b17(fortress);
    if (!isdefined(lockdoors)) {
        lockdoors = 1;
    }
    if (!isdefined(var_42293210dec86d6d)) {
        var_42293210dec86d6d = 1;
    }
    if (!isdefined(var_7a020beed970e537)) {
        var_7a020beed970e537 = 1;
    }
    if (!isdefined(spawnagents)) {
        spawnagents = 1;
    }
    function_5d8264355db47371(fortress, lockdoors, var_42293210dec86d6d, var_7a020beed970e537, spawnagents, keynameoverride, var_f2fd46ab32db5810, var_bc2c2d8e7a8cce59, undefined, undefined, 0);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x570d
// Size: 0xba
function function_b672261b8246a1e5(origin, poolname, lockdoors, var_42293210dec86d6d, var_7a020beed970e537, spawnagents, keynameoverride, var_f2fd46ab32db5810, var_bc2c2d8e7a8cce59) {
    fortress = function_bbe42d7091bedfc5(origin, poolname);
    if (!isdefined(fortress) || istrue(fortress.var_5683fb2485637c86)) {
        return;
    }
    function_4e6dd86684152b17(fortress);
    if (!isdefined(lockdoors)) {
        lockdoors = 1;
    }
    if (!isdefined(var_42293210dec86d6d)) {
        var_42293210dec86d6d = 1;
    }
    if (!isdefined(var_7a020beed970e537)) {
        var_7a020beed970e537 = 1;
    }
    if (!isdefined(spawnagents)) {
        spawnagents = 1;
    }
    function_5d8264355db47371(fortress, lockdoors, var_42293210dec86d6d, var_7a020beed970e537, spawnagents, keynameoverride, var_f2fd46ab32db5810, var_bc2c2d8e7a8cce59, undefined, undefined, 0);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57ce
// Size: 0x187
function function_51b43a371a041049(fortress) {
    switch (fortress.name) {
    case #"hash_325407a74dd364f3":
        return "civic_center";
    case #"hash_88e45a0bc4f1ee33":
        return "embassy";
    case #"hash_fba4191526afd34c":
        return "fort";
    case #"hash_faf90534e4a82c5b":
        return "sira_mall";
    case #"hash_beb77da089687145":
        return "resort_entrance";
    case #"hash_61a92409714ee106":
        return "police_academy";
    case #"hash_b5f5fe978d76188":
        return "post_office_stronghold";
    case #"hash_2daf318af0c70342":
        return "control_tower";
    case #"hash_e0c4f0458c96fa04":
        return "exhume_warehouse";
    case #"hash_ee3a4e86c1774bb7":
        return "sealion_castle";
    case #"hash_cfdb6796aee73a0f":
        return "sealion_cityhall";
    case #"hash_d14427741fd7135d":
        return "delta_aquarium";
    case #"hash_5065eaea648578ee":
        return "delta_castle";
    case #"hash_14bbe6b90c8369ca":
        return "delta_cityhall";
    case #"hash_4f1ad34662aa3a82":
        return "delta_firestation";
    case #"hash_b15f219a61158d6b":
        return "delta_oldmuseum";
    case #"hash_e26564d1e7044875":
        return "delta_stadium";
    case #"hash_c6f07a0b07c6b7b2":
        return "delta_terminal";
    case #"hash_6c341d6c88ae4824":
        return "delta_trainstation";
    default:
        return "fortress";
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x595c
// Size: 0x70
function function_5baba80d74039d3(fortress, keyname) {
    foreach (door in fortress.lockeddoors) {
        door.keyname = keyname;
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59d3
// Size: 0xfb
function function_5bcf13b1577b232c(fortress, var_14dcea3d745e5b2b) {
    foreach (door in fortress.lockeddoors) {
        namespace_58dcf42cf567f34f::function_fbbfe6f05eda5eb1(door);
        door.fortress = fortress;
        if (isdefined(var_14dcea3d745e5b2b)) {
            door.var_def557e8fd5c6763 = var_14dcea3d745e5b2b;
            continue;
        }
        door.var_def557e8fd5c6763 = &function_3c65e3630088b116;
    }
    foreach (door in fortress.var_84b0ef6bddd2907a) {
        namespace_58dcf42cf567f34f::function_fbbfe6f05eda5eb1(door);
        door.fortress = fortress;
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ad5
// Size: 0x63
function function_a113cf2be454f78d(fortress) {
    foreach (door in fortress.lockeddoors) {
        namespace_58dcf42cf567f34f::function_b092780f9ec4496e(door);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b3f
// Size: 0x33
function function_68a6379d51e7dbc2(fortress, keyname, var_f2fd46ab32db5810) {
    if (isdefined(keyname)) {
        function_5baba80d74039d3(fortress, keyname);
    }
    function_5bcf13b1577b232c(fortress, var_f2fd46ab32db5810);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b79
// Size: 0xb0
function function_f01e587e03e81414(var_14dcea3d745e5b2b) {
    if (!istrue(level.var_94d533fb4f4e5728)) {
        return;
    }
    fortress = self;
    foreach (door in fortress.var_511459d6509633b1) {
        namespace_58dcf42cf567f34f::function_fbbfe6f05eda5eb1(door);
        door.fortress = fortress;
        if (isdefined(var_14dcea3d745e5b2b)) {
            door.var_def557e8fd5c6763 = var_14dcea3d745e5b2b;
            continue;
        }
        door.var_def557e8fd5c6763 = &function_42c99af4faac0aee;
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c30
// Size: 0x3d6
function function_fb256f37d5e18aeb(fortress, teamplayers) {
    if (istrue(level.var_c62d39d6e6afb119)) {
        if (istrue(level.var_3f29c197a71f3be9) && isdefined(level.var_f1073fbd45b59a06.var_f1ab12c7e26976db) && array_contains(level.var_f1073fbd45b59a06.var_f1ab12c7e26976db, fortress)) {
            var_670492475c1687b9 = "ui_map_icon_loot_cache";
            fortress.var_192f741c1625715e = scripts/mp/objidpoolmanager::requestobjectiveid(99);
            scripts/mp/objidpoolmanager::objective_add_objective(fortress.var_192f741c1625715e, "active", fortress.origin + (0, -350, 0), var_670492475c1687b9);
            scripts/mp/objidpoolmanager::update_objective_setbackground(fortress.var_192f741c1625715e, 8);
            scripts/mp/objidpoolmanager::function_bf66c6833e867284(fortress.var_192f741c1625715e, 14);
            scripts/mp/objidpoolmanager::function_d7e3c4a08682c1b9(fortress.var_192f741c1625715e, 1);
            scripts/mp/objidpoolmanager::function_98ba077848896a3(fortress.var_192f741c1625715e, 1);
            objective_setlabel(fortress.var_192f741c1625715e, "MP_BR_INGAME/ABANDONEDCACHE");
            if (getdvarint(@"hash_370a18d02683271b", 1) == 0) {
                function_11cbcb8303075da(fortress.var_192f741c1625715e, 114, 226, 112, 1);
            }
            return;
        }
        fortress namespace_1eb3c4e0e28fac71::createquestobjicon(fortress.var_2ea336a7ebdede49, "active", fortress.origin + (0, -350, 0));
        scripts/mp/objidpoolmanager::update_objective_setbackground(fortress.objectiveiconid, 1);
        scripts/mp/objidpoolmanager::function_d7e3c4a08682c1b9(fortress.objectiveiconid, 1);
        scripts/mp/objidpoolmanager::function_98ba077848896a3(fortress.objectiveiconid, 1);
        if (istrue(fortress.isblacksite) && isdefined(teamplayers)) {
            scripts/mp/objidpoolmanager::function_f5862ad1ad967602(fortress.objectiveiconid);
            scripts/mp/objidpoolmanager::function_79a1a16de6b22b2d(fortress.objectiveiconid, 18);
            objective_setlabel(fortress.objectiveiconid, "MP_BR_INGAME/BLACK_SITE");
        } else {
            scripts/mp/objidpoolmanager::function_df6a3e032fa07d22(fortress.objectiveiconid);
            scripts/mp/objidpoolmanager::function_79a1a16de6b22b2d(fortress.objectiveiconid, 17);
            objective_setlabel(fortress.objectiveiconid, "MP_BR_INGAME/FORTRESS");
        }
        if (getdvarint(@"hash_370a18d02683271b", 1) == 0) {
            function_11cbcb8303075da(fortress.objectiveiconid, 114, 226, 112, 1);
        }
        thread function_5130ed243b288a07(fortress);
        return;
    }
    offset = (0, 0, 0);
    scriptable = undefined;
    tacorigin = fortress.origin;
    if (isdefined(fortress.var_ce9a81d514b212b7)) {
        tacorigin = fortress.var_ce9a81d514b212b7.origin;
    }
    if (!isdefined(fortress.script_noteworthy) || !issubstr(tolower(fortress.script_noteworthy), "notacmap")) {
        if (function_4ec4f39a2e1745f2(fortress)) {
            if (isdefined(fortress.name) && fortress.name != "unnamed") {
                scriptable = spawnscriptable("fortress_hero_tacmap_location_" + fortress.name, tacorigin + offset);
                if (istrue(fortress.var_ddb9adc01816d747)) {
                    scriptable setscriptablepartstate("fortress_hero_tacmap_location", "disabled");
                } else if (fortress.var_c8c070d7375ef1e == "hero_epic") {
                    scriptable setscriptablepartstate("fortress_hero_tacmap_location", "epic");
                }
            } else {
                scriptable = spawnscriptable("fortress_tacmap_location_scriptable", tacorigin + offset);
            }
        } else {
            scriptable = spawnscriptable("fortress_tacmap_location_scriptable", tacorigin + offset);
        }
    }
    fortress.var_6451879e18908224 = scriptable;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x600d
// Size: 0x27
function function_d1ec6d522c8102d9(fortress) {
    fortress.var_6451879e18908224 setscriptablepartstate("fortress_tacmap_location_scriptable", "hidden");
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x603b
// Size: 0x4a
function function_50aa951ab3c71fa4() {
    fortress = self;
    fortress namespace_1eb3c4e0e28fac71::deletequestobjicon();
    if (isdefined(fortress.var_a274fc61bede1a17)) {
        scripts/mp/objidpoolmanager::function_f5862ad1ad967602(fortress.var_a274fc61bede1a17);
        scripts/mp/objidpoolmanager::returnobjectiveid(fortress.var_a274fc61bede1a17);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x608c
// Size: 0x67
function function_5130ed243b288a07(fortress) {
    function_d95dbf57b47734d9(fortress, 0);
    var_e929acd9485c3641 = getdvarint(@"hash_5633ae4f34076c54", 0);
    if (fortress.var_c8c070d7375ef1e == "large" && istrue(var_e929acd9485c3641)) {
        gameflagwait("br_ready_to_jump");
        namespace_1eb3c4e0e28fac71::showquestobjicontoall(fortress.objectiveiconid);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60fa
// Size: 0x89
function function_d95dbf57b47734d9(fortress, active) {
    if (istrue(active)) {
        scripts/mp/objidpoolmanager::update_objective_icon(fortress.objectiveiconid, fortress.var_cef34adbe3f8caab);
        return;
    }
    scripts/mp/objidpoolmanager::update_objective_icon(fortress.objectiveiconid, fortress.var_2ea336a7ebdede49);
    scripts/mp/objidpoolmanager::function_df6a3e032fa07d22(fortress.objectiveiconid);
    if (isdefined(fortress.var_a274fc61bede1a17)) {
        scripts/mp/objidpoolmanager::function_f5862ad1ad967602(fortress.var_a274fc61bede1a17);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x618a
// Size: 0x29
function function_be5a531f97b7c07e(fortress) {
    scripts/mp/objidpoolmanager::update_objective_icon(fortress.objectiveiconid, fortress.var_9b65e6a548478e7c);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61ba
// Size: 0x24f
function function_b663f29079a15c71(fortress, captured, player) {
    if (istrue(captured)) {
        if (istrue(level.var_25e8b4afe5e06169) && isdefined(fortress.var_a274fc61bede1a17)) {
            scripts/mp/objidpoolmanager::function_f5862ad1ad967602(fortress.var_a274fc61bede1a17);
            scripts/mp/objidpoolmanager::function_df6a3e032fa07d22(fortress.objectiveiconid);
            foreach (teammember in getteamdata(player.team, "players")) {
                scripts/mp/objidpoolmanager::objective_playermask_addshowplayer(fortress.var_a274fc61bede1a17, teammember);
                scripts/mp/objidpoolmanager::objective_playermask_hidefrom(fortress.objectiveiconid, teammember);
            }
        } else {
            fortress.var_a274fc61bede1a17 = scripts/mp/objidpoolmanager::requestobjectiveid(1);
            if (fortress.var_a274fc61bede1a17 == -1) {
                /#
                    assertex(fortress.var_a274fc61bede1a17 != -1, "Stronghold: out of objective ID slots");
                #/
                return;
            }
            scripts/mp/objidpoolmanager::objective_add_objective(fortress.var_a274fc61bede1a17, "active", fortress.origin + (0, -350, 0), fortress.var_2253390a6ba835c3);
            scripts/mp/objidpoolmanager::function_d7e3c4a08682c1b9(fortress.var_a274fc61bede1a17, 1);
            scripts/mp/objidpoolmanager::function_98ba077848896a3(fortress.var_a274fc61bede1a17, 1);
            scripts/mp/objidpoolmanager::function_f5862ad1ad967602(fortress.var_a274fc61bede1a17);
            scripts/mp/objidpoolmanager::update_objective_icon(fortress.objectiveiconid, fortress.var_9b65e6a548478e7c);
            scripts/mp/objidpoolmanager::function_df6a3e032fa07d22(fortress.objectiveiconid);
            foreach (teammember in getteamdata(player.team, "players")) {
                scripts/mp/objidpoolmanager::objective_playermask_addshowplayer(fortress.var_a274fc61bede1a17, teammember);
                scripts/mp/objidpoolmanager::objective_playermask_hidefrom(fortress.objectiveiconid, teammember);
            }
        }
        return;
    }
    function_be5a531f97b7c07e(fortress);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6410
// Size: 0x3a
function function_917d94cc077ca94e(fortress, player) {
    scripts/mp/objidpoolmanager::objective_playermask_hidefrom(fortress.objectiveiconid, player);
    scripts/mp/objidpoolmanager::objective_playermask_addshowplayer(fortress.var_a274fc61bede1a17, player);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6451
// Size: 0x5e
function function_7ee5340d1a5a2ca9(fortress, player) {
    if (!isdefined(fortress)) {
        return;
    }
    if (isdefined(fortress.var_a274fc61bede1a17)) {
        scripts/mp/objidpoolmanager::objective_playermask_hidefrom(fortress.var_a274fc61bede1a17, player);
    }
    if (isdefined(fortress.objectiveiconid)) {
        scripts/mp/objidpoolmanager::objective_playermask_addshowplayer(fortress.objectiveiconid, player);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64b6
// Size: 0x3a
function function_c7dcbb4c3ac66791(fortress, player) {
    scripts/mp/objidpoolmanager::objective_playermask_hidefrom(fortress.var_a274fc61bede1a17, player);
    scripts/mp/objidpoolmanager::objective_playermask_hidefrom(fortress.objectiveiconid, player);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64f7
// Size: 0x3f3
function function_401b0949743b45a9(fortress) {
    foreach (node in fortress.props) {
        scriptable = spawnscriptable("fortress_scriptable_props", node.origin, node.angles);
        haspartstate = scriptable getscriptableparthasstate("scriptable_prop", node.script_noteworthy);
        if (!istrue(haspartstate)) {
            /#
                println("<unknown string>" + node.origin);
            #/
            scriptable freescriptable();
            continue;
        }
        scriptable setscriptablepartstate("scriptable_prop", node.script_noteworthy);
        if (node.script_noteworthy == "door_metal_roller_01_closed_large_01_emb") {
            createnavobstaclebybounds(node.origin, (16, 64, 55), node.angles);
            continue;
        }
        if (node.script_noteworthy == "door_metal_barn_02_sliding") {
            left = anglestoleft(node.angles);
            origin = node.origin + left * 128;
            createnavobstaclebybounds(origin, (16, 100, 55), node.angles);
            continue;
        }
        if (node.script_noteworthy == "fence_corrugated_metal_03_128") {
            right = anglestoright(node.angles);
            origin = node.origin + right * 45;
            createnavobstaclebybounds(origin, (16, 80, 55), node.angles);
            continue;
        }
        if (node.script_noteworthy == "door_security_gate_double_mp_01_green") {
            createnavobstaclebybounds(node.origin, (16, 64, 55), node.angles);
            continue;
        }
        if (node.script_noteworthy == "fence_corrugated_metal_03_256") {
            right = anglestoright(node.angles);
            origin = node.origin + right * 90;
            createnavobstaclebybounds(origin, (16, 128, 55), node.angles);
            continue;
        }
        if (node.script_noteworthy == "uk_scaffold_kit_128x64_01") {
            left = anglestoleft(node.angles);
            origin = node.origin + left * 80;
            createnavobstaclebybounds(origin, (16, 64, 55), node.angles);
        }
    }
    if (isdefined(fortress.flags)) {
        if (getdvarint(@"hash_eb46a7db8733a155", 0) != 1) {
            foreach (node in fortress.flags) {
                if (issubstr(node.script_noteworthy, "texas")) {
                    continue;
                }
                if (node.script_noteworthy == "vfx_mayh_gameplay_dmz_long_thin_aq_flag_wind_1") {
                    node.script_noteworthy = "vfx_mayh_gameplay_dmz_long_thin_aq_flag_wind_2";
                }
                if (node.script_noteworthy == "vfx_mayh_gameplay_dmz_rectangular_aq_flag_wind_1") {
                    node.script_noteworthy = "vfx_mayh_gameplay_dmz_rectangular_aq_flag_wind_2";
                }
                scriptable = spawnscriptable("fortress_scriptable_flags", node.origin, node.angles);
                scriptable setscriptablepartstate("scriptable_flag", node.script_noteworthy);
            }
        }
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68f1
// Size: 0x4
function function_908ef13b806cc4c2() {
    return false;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x68fd
// Size: 0xb3
function function_e9d20f2e232baf6e(agent, fortress, origin) {
    agent.goalradius = 10;
    agent setgoalpos(getclosestpointonnavmesh(origin + (10000, 0, 0)));
    waitframe();
    if (isdefined(fortress.inside_goalvolume)) {
        if (ispointinvolume(origin, fortress.inside_goalvolume)) {
            agent setgoalvolume(fortress.inside_goalvolume);
        }
        return;
    }
    if (isdefined(fortress.outside_goalvolume)) {
        if (ispointinvolume(origin, fortress.outside_goalvolume)) {
            agent setgoalvolume(fortress.outside_goalvolume);
        }
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x69b7
// Size: 0x63
function function_7b62bcd7e8786051(fortress) {
    foreach (node in fortress.lootcaches) {
        function_c872d24014c40b47(node);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a21
// Size: 0x2d
function function_c872d24014c40b47(node) {
    spawnscriptable("br_loot_cache_lege", node.origin, node.angles);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a55
// Size: 0xfd
function function_3c65e3630088b116(door, player) {
    if (isdefined(door.fortress) && !istrue(door.fortress.unlocked)) {
        door.fortress.unlocked = 1;
        namespace_8361bad7391de074::function_1d1df26df05a6c8(door, player);
        if (isdefined(door.var_783ce7df56ce2748)) {
            self thread [[ door.var_783ce7df56ce2748 ]](player);
        }
        wait(randomfloatrange(1, 3));
        function_fdd0934f1a32f70d(player.origin, 128, "dmz_stronghold_unlock", player.team, undefined, "dmz_stronghold_unlock_classic");
        level thread function_d83e81ea09406450(door.fortress);
        wait(randomintrange(15, 25));
        agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(5, door.origin, "medium", "reinforcements", "fortressDoorOpened");
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b59
// Size: 0x55
function function_42c99af4faac0aee(door, player) {
    if (isdefined(door.fortress) && !istrue(door.fortress.unlocked)) {
        door.fortress.unlocked = 1;
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bb5
// Size: 0x14
function function_2cde636a73aead3d(origin) {
    return isdefined(function_c0a211a69f5f8f2f(origin));
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bd1
// Size: 0x8c
function function_f59f68adc71d49b3(origin) {
    if (isdefined(level.lockedvolumes) && level.lockedvolumes.size > 0) {
        foreach (volume in level.lockedvolumes) {
            if (!isdefined(volume)) {
                continue;
            }
            if (ispointinvolume(origin, volume)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c65
// Size: 0x125
function function_ae011f52b2b15baf(origin, ignoreheight) {
    if (isdefined(level.var_f1073fbd45b59a06)) {
        foreach (fortress in level.var_f1073fbd45b59a06.var_df987907a483df89) {
            foreach (volume in fortress.var_aa7c37b8b3ec1f46) {
                if (scripts/mp/utility/game::getsubgametype() == "aladdin" && !isdefined(volume)) {
                    continue;
                }
                if (istrue(ignoreheight)) {
                    var_58e222086a2d297e = (origin[0], origin[1], volume.origin[2]);
                    if (ispointinvolume(var_58e222086a2d297e, volume)) {
                        return true;
                    }
                    continue;
                }
                if (ispointinvolume(origin, volume)) {
                    return true;
                }
            }
        }
    }
    return false;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d92
// Size: 0x84
function function_f0201365c368cf88(origin) {
    if (isdefined(level.var_c7d1916b16f57d7b) && level.var_c7d1916b16f57d7b.size > 0) {
        foreach (volume in level.var_c7d1916b16f57d7b) {
            if (ispointinvolume(origin, volume)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e1e
// Size: 0x99
function function_c0a211a69f5f8f2f(origin) {
    if (!isdefined(level.var_f1073fbd45b59a06) || !isdefined(level.var_f1073fbd45b59a06.var_df987907a483df89)) {
        return undefined;
    }
    foreach (fortress in level.var_f1073fbd45b59a06.var_df987907a483df89) {
        if (function_20f6e9317b1baf3d(origin, fortress)) {
            return fortress;
        }
    }
    return undefined;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ebf
// Size: 0xc5
function function_20f6e9317b1baf3d(origin, fortress) {
    if (!isdefined(fortress) || !isdefined(fortress.var_aa7c37b8b3ec1f46) || fortress.var_aa7c37b8b3ec1f46.size == 0) {
        return false;
    }
    if (!isdefined(fortress.var_aa7c37b8b3ec1f46) || fortress.var_aa7c37b8b3ec1f46.size == 0) {
        return false;
    }
    foreach (volume in fortress.var_aa7c37b8b3ec1f46) {
        if (isdefined(volume) && ispointinvolume(origin, volume)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f8c
// Size: 0x20
function function_afa1f5bf0de4e4d1() {
    if (!function_2d421d1f793f6f93()) {
        return;
    }
    return level.var_f1073fbd45b59a06.var_df987907a483df89;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fb4
// Size: 0x90
function function_888d8429a71c944c(name) {
    if (!function_2d421d1f793f6f93()) {
        return;
    }
    foreach (fortress in level.var_f1073fbd45b59a06.var_df987907a483df89) {
        if (isdefined(fortress.name) && name == fortress.name) {
            return fortress;
        }
    }
    return undefined;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x704c
// Size: 0xf
function function_54bb7cf730d65649() {
    return random(function_afa1f5bf0de4e4d1());
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7063
// Size: 0xd
function function_2d421d1f793f6f93() {
    return isdefined(level.var_f1073fbd45b59a06);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7078
// Size: 0x39
function function_771f278c8c749a28(fortress) {
    return !istrue(fortress.unlocked) && !isdefined(fortress.ishero) && !isdefined(fortress.var_c6cf0a05d2f9b5df);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70b9
// Size: 0xfc
function function_b941ee96c15c2b44(fortress) {
    tripwires = array_randomize(getentitylessscriptablearray("scriptable_dmz_tripwire", "classname"));
    foreach (tripwire in tripwires) {
        if (!isdefined(tripwire.target)) {
            continue;
        }
        var_3a6b42ab825a103e = tripwire.origin + anglestoforward(tripwire.angles) * 45;
        if (function_20f6e9317b1baf3d(var_3a6b42ab825a103e, fortress)) {
            if (!isdefined(fortress.tripwires)) {
                fortress.tripwires = [];
            }
            fortress.tripwires[fortress.tripwires.size] = tripwire;
            tripwire.var_aad14f891fb70d86 = 1;
        }
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71bc
// Size: 0x1ba
function function_eb55b7b980bca63c(fortress) {
    if (!isdefined(fortress.tripwires)) {
        return;
    }
    mintraps = 0;
    maxtraps = 0;
    if (isdefined(fortress.var_fe7de213c314772a)) {
        mintraps = fortress.var_fe7de213c314772a - 1;
        maxtraps = fortress.var_fe7de213c314772a;
    } else {
        switch (fortress.var_c8c070d7375ef1e) {
        case #"hash_5971965ed985a26c":
            mintraps = 1;
            maxtraps = 2;
            break;
        case #"hash_c71b112fe04823d6":
            mintraps = 2;
            maxtraps = 3;
            break;
        case #"hash_4bf33d595d8f4894":
            mintraps = 2;
            maxtraps = 4;
            break;
        case #"hash_b0cb9e547c45dab9":
            mintraps = 3;
            maxtraps = 6;
            break;
        case #"hash_d243059de5613193":
            mintraps = 6;
            maxtraps = 8;
            break;
        case #"hash_102d658881a66d2a":
            mintraps = 0;
            maxtraps = 1;
            break;
        }
    }
    var_7f964221bfb0dae1 = randomintrange(mintraps, maxtraps);
    fortress.tripwires = array_randomize(fortress.tripwires);
    foreach (index, tripwire in fortress.tripwires) {
        if (index < var_7f964221bfb0dae1) {
            if (isdefined(level.var_e9a6fc11b0aa7eb2)) {
                [[ level.var_e9a6fc11b0aa7eb2 ]](tripwire);
            }
            continue;
        }
        if (isdefined(level.var_d9d80893720b39df)) {
            [[ level.var_d9d80893720b39df ]](tripwire);
        }
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x737d
// Size: 0x1af
function function_2a0231b6edcafa35(fortress) {
    if (!isdefined(level.firetraps)) {
        return;
    }
    var_e54fabb89186a3e8 = 0;
    foreach (barrel in fortress.firebarrels) {
        if (var_e54fabb89186a3e8 >= 5) {
            break;
        }
        if (!isdefined(level.firetraps.traps["fireBarrel"].spawnfunction)) {
            break;
        }
        var_993f213b7e366216 = [[ level.firetraps.traps["fireBarrel"].spawnfunction ]](barrel);
        if (isdefined(var_993f213b7e366216)) {
            var_993f213b7e366216.fortress = fortress;
            var_e54fabb89186a3e8++;
        }
    }
    foreach (gasPuddle in fortress.gaspuddles) {
        if (!isdefined(level.firetraps.traps["fireBarrel"].spawnfunction)) {
            break;
        }
        var_caf7f0d9711e0a49 = [[ level.firetraps.traps["gasPuddle"].spawnfunction ]](gasPuddle);
        if (isdefined(var_caf7f0d9711e0a49)) {
            var_caf7f0d9711e0a49.fortress = fortress;
        }
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7533
// Size: 0x2d9
function function_8d2765f0ce279c28(fortress) {
    level endon("game_ended");
    fortress.contributingplayers = [];
    if (!istrue(fortress.spawnedagents)) {
        fortress waittill("spawned_agents");
    }
    while (true) {
        agents = function_b4b9401715cf98ea(fortress.uniquename);
        numagents = agents.size;
        var_fa8d978e0f21c38a = 0;
        fortress.var_fa8d978e0f21c38a = 0;
        foreach (agent in agents) {
            origin = undefined;
            if (isagent(agent)) {
                origin = agent.origin;
            } else if (isint(agent)) {
                info = namespace_14d36171baccf528::function_2b0e82156fa6075b(agent);
                if (isdefined(info)) {
                    origin = info.origin;
                }
            }
            var_c79dca57049c64d4 = isdefined(origin) && function_20f6e9317b1baf3d(origin, fortress);
            inrange = isdefined(origin) && distance2d(origin, fortress.origin) < 1000;
            if (var_c79dca57049c64d4 || inrange) {
                var_fa8d978e0f21c38a++;
                if (istrue(fortress.cleared)) {
                    fortress.cleared = 0;
                }
                continue;
            }
            if (!istrue(level.var_c62d39d6e6afb119)) {
                function_1cbdd3db07bff2d6(agent);
            }
        }
        fortress.var_fa8d978e0f21c38a = var_fa8d978e0f21c38a;
        if (var_fa8d978e0f21c38a == 0) {
            teamscontributing = [];
            var_7da5b2082e28ab9d = [];
            foreach (player in fortress.contributingplayers) {
                if (isdefined(player.team) && !array_contains(teamscontributing, player.team)) {
                    teamscontributing[teamscontributing.size] = player.team;
                    var_7da5b2082e28ab9d[var_7da5b2082e28ab9d.size] = player;
                }
            }
            foreach (player in var_7da5b2082e28ab9d) {
                namespace_8361bad7391de074::function_59fe5e0d7d5e7947(player, fortress);
            }
            if (istrue(level.var_c62d39d6e6afb119) && !istrue(fortress.cleared)) {
                fortress.cleared = 1;
            } else {
                return;
            }
        }
        wait(1);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7813
// Size: 0xda
function function_3f213275327cf454(fortress, var_29550a90eeb9ced8) {
    foreach (volume in fortress.var_aa7c37b8b3ec1f46) {
        level.lockedvolumes[level.lockedvolumes.size] = volume;
    }
    if (istrue(var_29550a90eeb9ced8)) {
        foreach (volume in fortress.var_aa7c37b8b3ec1f46) {
            level.var_c7d1916b16f57d7b[level.var_c7d1916b16f57d7b.size] = volume;
        }
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78f4
// Size: 0x64
function function_7fdb1a4cf3b80584(fortress) {
    foreach (loc in fortress.var_de77472db7bdd0ec) {
        thread function_efd7a7c699ab2828(loc);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x795f
// Size: 0xd0
function function_efd7a7c699ab2828(loc) {
    level endon("game_ended");
    while (true) {
        playersinrange = scripts/mp/utility/player::getplayersinradius(loc.origin, 128);
        foreach (player in playersinrange) {
            if (isplayer(player) && !isagent(player)) {
                if (isdefined(player.musicpack) && player.musicpack == 1) {
                    player setplayermusicstate("dmz_stronghold_unlock_classic");
                    continue;
                }
                player setplayermusicstate("dmz_stronghold_unlock");
            }
        }
        wait(2);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a36
// Size: 0x309
function function_cbf0fedf537ce343() {
    var_725ddbe5849a247d = getdvarint(@"hash_f2a7d1ed476ed0e1", 4);
    arraykeys = array_randomize(getarraykeys(level.var_f1073fbd45b59a06.var_224d6c29e9bb566b));
    foreach (key in arraykeys) {
        if (level.var_f1073fbd45b59a06.var_224d6c29e9bb566b[key].name != "unnamed") {
            level.var_f1073fbd45b59a06.var_224d6c29e9bb566b[key].var_c8c070d7375ef1e = "hero_epic";
            var_725ddbe5849a247d--;
        }
        if (var_725ddbe5849a247d <= 0) {
            break;
        }
    }
    foreach (var_e45ac70ba6569d32 in level.var_f1073fbd45b59a06.var_224d6c29e9bb566b) {
        if (istrue(var_e45ac70ba6569d32.isactive)) {
            continue;
        }
        if (var_e45ac70ba6569d32.name == "unnamed") {
            continue;
        }
        if (!istrue(level.var_4cfd75aa6ddde156)) {
            if (!isdefined(var_e45ac70ba6569d32.poi) || !scripts/mp/poi::poi_ispoiactive(var_e45ac70ba6569d32.poi)) {
                continue;
            }
        }
        function_4e6dd86684152b17(var_e45ac70ba6569d32);
        if (!istrue(level.var_4cfd75aa6ddde156)) {
            if (isdefined(var_e45ac70ba6569d32.poi) && isdefined(var_e45ac70ba6569d32.subarea.var_71ad22c5d093d90b) && isdefined(level.poi[var_e45ac70ba6569d32.poi]["subAreas"][var_e45ac70ba6569d32.subarea.var_71ad22c5d093d90b].var_7da9883d4168b7f1)) {
                var_e45ac70ba6569d32.tieroverride = level.poi[var_e45ac70ba6569d32.poi]["subAreas"][var_e45ac70ba6569d32.subarea.var_71ad22c5d093d90b].var_7da9883d4168b7f1.var_84ecaeab58167d39;
            }
        }
        if (!array_contains(level.var_f1073fbd45b59a06.var_df987907a483df89, var_e45ac70ba6569d32)) {
            var_e45ac70ba6569d32.var_c8c070d7375ef1e = "hero_disabled";
            level thread function_5fdeef1aff6dd31c(var_e45ac70ba6569d32);
        } else {
            level thread function_5d8264355db47371(var_e45ac70ba6569d32, 1, 1, 1, 1, function_51b43a371a041049(var_e45ac70ba6569d32), undefined, undefined, 1, 0, 1, var_e45ac70ba6569d32.skipcqb);
            level thread function_64017446db1ebf75(var_e45ac70ba6569d32);
            if (var_e45ac70ba6569d32.var_c8c070d7375ef1e == "hero_epic") {
                function_36f2d57a4d831748(var_e45ac70ba6569d32.origin);
            }
        }
        function_2c1f8e18242de1f5(var_e45ac70ba6569d32);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d46
// Size: 0x28
function function_4ec4f39a2e1745f2(fortress) {
    return istrue(fortress.ishero) || istrue(fortress.var_c6cf0a05d2f9b5df);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d76
// Size: 0x14d
function function_6d27f6675243f8be() {
    while (!scripts/mp/flags::gameflagexists("prematch_done") || scripts/mp/flags::gameflagexists("prematch_done") && !scripts/mp/flags::gameflag("prematch_done")) {
        waitframe();
    }
    var_7bbcdc05c49e9b86 = [];
    foreach (var_272bb004283094c7 in level.var_f1073fbd45b59a06.unusedfortresses) {
        function_8668cfb45844f507();
        closestvolume = getclosest(var_272bb004283094c7.origin, level.var_42d94681e15bbbdd);
        if (distance2dsquared(closestvolume.origin, var_272bb004283094c7.origin) > 2359296) {
            /#
                println("<unknown string>" + var_272bb004283094c7.origin);
            #/
            continue;
        }
        volumes = [closestvolume];
        if (isdefined(closestvolume.targetname)) {
            volumes = getentarray(closestvolume.targetname, "targetname");
        }
        var_7bbcdc05c49e9b86 = array_combine(var_7bbcdc05c49e9b86, volumes);
    }
    array_delete(var_7bbcdc05c49e9b86);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eca
// Size: 0xa9
function function_64017446db1ebf75(fortress) {
    if (getdvarint(@"hash_a13f3213c557f5fd", 1) == 0) {
        return;
    }
    foreach (volume in fortress.var_aa7c37b8b3ec1f46) {
        volume.name = fortress.name;
        volume.poi = fortress.poi;
        level thread function_63dfc24db0d4f1a4(volume);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f7a
// Size: 0x1a7
function function_63dfc24db0d4f1a4(volume) {
    volume.var_b670211e29d8308d = [];
    volume.var_dd410313d5c4f27b = [];
    while (true) {
        wait(1);
        if (!isdefined(volume.poi)) {
            var_fe16f116477f0084 = level.players;
        } else {
            var_fe16f116477f0084 = level.poi[volume.poi]["players"];
        }
        if (!isdefined(var_fe16f116477f0084) || var_fe16f116477f0084.size == 0) {
            continue;
        }
        foreach (player in var_fe16f116477f0084) {
            if (distance2dsquared(volume.origin, player.origin) < 25000000) {
                playerid = player getentitynumber();
                if (ispointinvolume(player.origin, volume)) {
                    if (isdefined(volume.onplayerenter) && !isdefined(volume.var_b670211e29d8308d[playerid])) {
                        volume thread [[ volume.onplayerenter ]](player);
                    }
                    if (function_ec1e1bbe558ac28b(playerid, volume)) {
                        player thread function_60c9f8db44495ef1(player, volume.name);
                    }
                    continue;
                }
                if (isdefined(volume.onplayerexit) && isdefined(volume.var_b670211e29d8308d[playerid])) {
                    volume thread [[ volume.onplayerexit ]](player);
                }
                volume.var_b670211e29d8308d[playerid] = undefined;
            }
        }
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8128
// Size: 0xb5
function function_ec1e1bbe558ac28b(playerid, volume) {
    time = gettime();
    if (istrue(volume.var_b670211e29d8308d[playerid])) {
        volume.var_dd410313d5c4f27b[playerid] = time;
        return 0;
    } else {
        volume.var_b670211e29d8308d[playerid] = 1;
    }
    var_6737d550c9b4c95f = 45000;
    if (isdefined(volume.var_dd410313d5c4f27b[playerid])) {
        if (volume.var_dd410313d5c4f27b[playerid] + var_6737d550c9b4c95f < time) {
            volume.var_dd410313d5c4f27b[playerid] = time;
            return 1;
        }
        return 0;
    }
    volume.var_dd410313d5c4f27b[playerid] = time;
    return 1;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81e4
// Size: 0x2a3
function function_60c9f8db44495ef1(player, var_7d02860466aba0c4) {
    if (!isdefined(player) || !isdefined(var_7d02860466aba0c4)) {
        return;
    }
    var_7d02860466aba0c4 = tolower(var_7d02860466aba0c4);
    playerarray = [player];
    splashname = undefined;
    if (issubstr(var_7d02860466aba0c4, "cave")) {
        splashname = "stronghold_hero_cave";
    } else if (issubstr(var_7d02860466aba0c4, "center")) {
        splashname = "stronghold_hero_civic_center";
    } else if (issubstr(var_7d02860466aba0c4, "embassy")) {
        splashname = "stronghold_hero_embassy";
    } else if (issubstr(var_7d02860466aba0c4, "fort")) {
        splashname = "stronghold_hero_fort_underground";
    } else if (issubstr(var_7d02860466aba0c4, "mall") && !issubstr(var_7d02860466aba0c4, "small")) {
        splashname = "stronghold_hero_sira_mall";
    } else if (issubstr(var_7d02860466aba0c4, "marshland")) {
        splashname = "stronghold_hero_resort_entrance";
    } else if (issubstr(var_7d02860466aba0c4, "oilfield")) {
        splashname = "stronghold_hero_oilfield";
    } else if (issubstr(var_7d02860466aba0c4, "police_academy")) {
        splashname = "stronghold_hero_police_academy";
    } else if (issubstr(var_7d02860466aba0c4, "post_office")) {
        splashname = "stronghold_hero_post_office_stronghold";
    } else if (issubstr(var_7d02860466aba0c4, "ship")) {
        splashname = "stronghold_hero_ship";
    } else if (issubstr(var_7d02860466aba0c4, "terminal")) {
        splashname = "stronghold_hero_terminal";
    } else if (issubstr(var_7d02860466aba0c4, "tower")) {
        splashname = "stronghold_hero_control_tower";
    } else if (issubstr(var_7d02860466aba0c4, "warehouse")) {
        splashname = "stronghold_hero_exhume_warehouse";
    }
    if (scripts/cp_mp/utility/game_utility::function_e21746abaaaf8414()) {
        if (issubstr(var_7d02860466aba0c4, "castle")) {
            splashname = "stronghold_hero_sealion_castle";
        } else if (issubstr(var_7d02860466aba0c4, "cityhall")) {
            splashname = "stronghold_hero_sealion_cityhall";
        }
    }
    if (scripts/cp_mp/utility/game_utility::function_5e0e3a24dbb1fae1()) {
        if (issubstr(var_7d02860466aba0c4, "aquarium")) {
            splashname = "stronghold_hero_delta_aquarium";
        } else if (issubstr(var_7d02860466aba0c4, "castle")) {
            splashname = "stronghold_hero_delta_castle";
        } else if (issubstr(var_7d02860466aba0c4, "cityhall")) {
            splashname = "stronghold_hero_delta_cityhall";
        } else if (issubstr(var_7d02860466aba0c4, "firestation")) {
            splashname = "stronghold_hero_delta_firestation";
        } else if (issubstr(var_7d02860466aba0c4, "oldmuseum")) {
            splashname = "stronghold_hero_delta_oldmuseum";
        } else if (issubstr(var_7d02860466aba0c4, "stadium")) {
            splashname = "stronghold_hero_delta_stadium";
        } else if (issubstr(var_7d02860466aba0c4, "terminal")) {
            splashname = "stronghold_hero_delta_terminal";
        } else if (issubstr(var_7d02860466aba0c4, "trainstation")) {
            splashname = "stronghold_hero_delta_trainstation";
        }
    }
    if (!isdefined(splashname)) {
        return;
    }
    scripts/mp/gametypes/br_gametype_dmz::showdmzsplash(splashname, playerarray);
    thread namespace_446fc987a980892f::playevent("denied_area_enter", playerarray);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x848e
// Size: 0x125
function function_2c1f8e18242de1f5(fortress) {
    if (fortress.name == "fort") {
        var_ce8fc891e4bd83c5 = getentitylessscriptablearray("scriptable_military_ascendertop_heavy", "classname", (18607, -55932, 1081), 1024);
        foreach (ascender in var_ce8fc891e4bd83c5) {
            ascender setscriptablepartstate("top", "off");
        }
        return;
    }
    if (fortress.name == "delta_oldmuseum") {
        var_ce8fc891e4bd83c5 = getentitylessscriptablearray("scriptable_military_ascendertop_heavy", "classname", (8366.5, -5415.5, 882), 1024);
        foreach (ascender in var_ce8fc891e4bd83c5) {
            ascender setscriptablepartstate("top", "off");
        }
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85ba
// Size: 0x8f8
function function_b8b841d5628094e5() {
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400 = [];
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"] = [];
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"] = [];
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"] = [];
    level.var_f1073fbd45b59a06.var_1ec347b0fe6b96d0 = [];
    level.var_f1073fbd45b59a06.var_1ec347b0fe6b96d0["valuables"] = 60;
    level.var_f1073fbd45b59a06.var_1ec347b0fe6b96d0["rare"] = 35;
    level.var_f1073fbd45b59a06.var_1ec347b0fe6b96d0["epic"] = 5;
    level.var_f1073fbd45b59a06.var_6381d686975b2f8 = [];
    level.var_f1073fbd45b59a06.var_6381d686975b2f8["valuables"] = "consumable";
    level.var_f1073fbd45b59a06.var_6381d686975b2f8["rare"] = "weapon";
    level.var_f1073fbd45b59a06.var_6381d686975b2f8["epic"] = "weapon";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"].size] = "brloot_plunder_cash_epic_1";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"].size] = "brloot_plunder_cash_epic_2";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"].size] = "brloot_plunder_cash_legendary_1";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"].size] = "brloot_plate_carrier_3";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"].size] = "brloot_killstreak_clusterstrike";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"].size] = "brloot_killstreak_precision_airstrike";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"].size] = "brloot_killstreak_uav";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["valuables"].size] = "brloot_valuable_goldbar";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_br_msecho_epic";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_la_rpapa7_epic";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_dm_pgolf1_epic";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_dm_la700_epic";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_br_soscar14_epic";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_sh_charlie725_epic";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_sh_mviktor_epic";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_pi_golf17_epic";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_lm_ahotel_epic";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_lm_kilo21_epic";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_ar_mike4_epic";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_ar_kilo53_epic";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_sm_papa90_epic";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_ar_golf3_lege";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_br_msecho_lege";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_dm_mike14_lege";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_dm_sa700_lege";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_dm_scromeo_lege";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_sh_mbravo_lege";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_pi_decho_lege";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_lm_foxtrot_lege";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_lm_rkilo_lege";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_ar_kilo53_lege";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_ar_augolf_epic";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_ar_akilo_lege";
    level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"][level.var_f1073fbd45b59a06.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_sm_victor_lege";
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8eb9
// Size: 0x15a
function function_da4adea9b5215a37() {
    totaltickets = 0;
    foreach (categorytickets in level.var_f1073fbd45b59a06.var_1ec347b0fe6b96d0) {
        totaltickets = totaltickets + categorytickets;
    }
    roll = randomint(totaltickets);
    var_f812ab39ef6b4406 = 0;
    var_ed881975d628c656 = undefined;
    foreach (category, categorytickets in level.var_f1073fbd45b59a06.var_1ec347b0fe6b96d0) {
        var_f812ab39ef6b4406 = var_f812ab39ef6b4406 + categorytickets;
        if (roll <= var_f812ab39ef6b4406) {
            var_ed881975d628c656 = category;
            break;
        }
    }
    if (!isdefined(var_ed881975d628c656)) {
        return [undefined, undefined];
    }
    item = random(level.var_f1073fbd45b59a06.var_e0fffa1af7503400[var_ed881975d628c656]);
    itemtable = level.var_f1073fbd45b59a06.var_6381d686975b2f8[var_ed881975d628c656];
    return [item, itemtable];
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x901b
// Size: 0x22e
function function_36f2d57a4d831748(var_590672f7b5711c59) {
    var_c4f53e871df9789d = getlootscriptablearrayinradius("br_loot_cache_lege", undefined, var_590672f7b5711c59, 2048);
    var_2f7339e0fabe6594 = getentitylessscriptablearray("dmz_crate_wood", undefined, var_590672f7b5711c59, 2048);
    var_c54e8a88506815aa = array_combine(var_c4f53e871df9789d, var_2f7339e0fabe6594);
    foreach (cache in var_c54e8a88506815aa) {
        if (istrue(cache.var_c93ea8f612f4aaba)) {
            continue;
        }
        items = getscriptablelootcachecontents(cache);
        cache.containertype = 3;
        cache.contents = scripts/mp/gametypes/br_lootcache::function_ec87b214cd429e96(items, undefined);
        var_ec9ee727d559d94d = function_da4adea9b5215a37();
        itemtable = var_ec9ee727d559d94d[1];
        lootitem = var_ec9ee727d559d94d[0];
        if (!isdefined(lootitem)) {
            return;
        }
        ref = undefined;
        if (itemtable == "weapon") {
            lootid = level.br_pickups.var_7b2bff2d04ee1017[lootitem];
            var_ea346ad3175aa7ea = 0;
            count = 1;
            ref = lootitem;
        } else {
            lootid = namespace_38b993c4618e76cd::getlootidfromref(lootitem);
            var_ea346ad3175aa7ea = ter_op(items.size < 3, items.size, 3);
            if (istrue(level.var_a9350d89a2e4d752)) {
                count = "";
                if (isdefined(level.br_pickups.counts[lootitem])) {
                    count = level.br_pickups.counts[lootitem];
                }
            } else {
                count = tablelookup(level.brloottablename, 1, lootitem, 4);
                if (count == "") {
                    count = tablelookup(level.brloottablename, 1, lootitem, 4);
                }
            }
        }
        cache.contents = scripts/mp/gametypes/br_lootcache::function_848e20cf1d6cab8f(cache.contents, count, lootid, ref, var_ea346ad3175aa7ea);
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9250
// Size: 0xa4
function function_70c8a3094cab3d57(agent) {
    agent endon("death");
    while (!isdefined(agent.agentStruct.fortress)) {
        waitframe();
    }
    fortress = agent.agentStruct.fortress;
    if (istrue(fortress.unlocked)) {
        return;
    }
    agent.var_c833409fb72d15fb = 1;
    if (!isdefined(fortress.var_54fa4e2ef227341c)) {
        fortress.var_54fa4e2ef227341c = [];
    }
    fortress.var_54fa4e2ef227341c[fortress.var_54fa4e2ef227341c.size] = agent;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92fb
// Size: 0x52
function function_b6fae9e25ce5d86e(agent) {
    agent.agentStruct.fortress.var_54fa4e2ef227341c = array_remove(agent.agentStruct.fortress.var_54fa4e2ef227341c, agent);
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9354
// Size: 0xa1
function function_d83e81ea09406450(fortress) {
    if (!isdefined(fortress.var_54fa4e2ef227341c) || fortress.var_54fa4e2ef227341c.size <= 0) {
        return;
    }
    foreach (agent in fortress.var_54fa4e2ef227341c) {
        if (isdefined(agent) && isagent(agent) && isalive(agent)) {
            agent thread function_234c1cae9aa83d1e(agent);
        }
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93fc
// Size: 0x53
function function_234c1cae9aa83d1e(agent, delaymin, delaymax) {
    agent endon("death");
    if (!isdefined(delaymin)) {
        delaymin = 2;
    }
    if (!isdefined(delaymax)) {
        delaymax = 8;
    }
    wait(randomintrange(delaymin, delaymax));
    if (isalive(agent)) {
        agent.var_c833409fb72d15fb = 0;
    }
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9456
// Size: 0x27
function function_9886567fbafcd11a(origin1, origin2, tolerance) {
    return distancesquared(origin1, origin2) <= tolerance * tolerance;
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9485
// Size: 0x1a
function function_687b1a056a415976(fortress) {
    /#
        println("<unknown string>");
    #/
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x94a6
// Size: 0x3
function function_98c9446690331268() {
    
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x94b0
// Size: 0x1b2
function function_1ab4df6f91b702df() {
    /#
        while (true) {
            if (getdvarint(@"hash_43ab4ce9faa45add", 0) == 1) {
                foreach (fortress in level.var_f1073fbd45b59a06.var_8a40ff9ed07bd5f3) {
                    color = (0, 0, 1);
                    if (istrue(fortress.var_5683fb2485637c86)) {
                        color = (1, 0, 0);
                    }
                    thread scripts/mp/utility/debug::drawsphere(fortress.origin, 256, 1, color);
                }
                foreach (fortress in level.var_f1073fbd45b59a06.var_df987907a483df89) {
                    thread scripts/mp/utility/debug::drawsphere(fortress.origin, 512, 1, (0, 1, 0));
                }
                foreach (fortress in level.var_f1073fbd45b59a06.var_e5f0869fedd95408) {
                    thread scripts/mp/utility/debug::drawsphere(fortress.origin, 512, 1, (0, 1, 1));
                }
            }
            wait(1);
        }
    #/
}

// Namespace namespace_6c6c9cbca3ea8e6e / namespace_9823ee6035594d67
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9669
// Size: 0x208
function function_377254fcb380b9fe() {
    /#
        while (true) {
            value = getdvarint(@"hash_9d95d1671eeaf942", 0);
            if (value == 1) {
                if (function_2cde636a73aead3d(level.players[0].origin)) {
                    printtoscreen2d(150, 100, "<unknown string>", (0, 0, 1), 2);
                } else if (function_f59f68adc71d49b3(level.players[0].origin)) {
                    printtoscreen2d(150, 100, "<unknown string>", (0, 0, 1), 2);
                } else {
                    printtoscreen2d(150, 100, "<unknown string>", (0, 0, 1), 2);
                }
            }
            if (value == 2) {
                fortress = function_c0a211a69f5f8f2f(level.players[0].origin);
                if (isdefined(fortress)) {
                    agents = function_b4b9401715cf98ea(fortress.uniquename);
                    if (isdefined(agents)) {
                        foreach (agent in agents) {
                            origin = undefined;
                            if (isagent(agent)) {
                                origin = agent.origin;
                            } else if (isint(agent)) {
                                info = namespace_14d36171baccf528::function_2b0e82156fa6075b(agent);
                                origin = info.origin;
                            }
                            sphere(origin, 30, ter_op(isagent(agent), (1, 0, 0), (0, 1, 0)), 0, 3);
                        }
                        printtoscreen2d(150, 100, "<unknown string>" + agents.size, (1, 0, 0), 1, 2);
                    }
                }
            }
            waitframe();
        }
    #/
}

