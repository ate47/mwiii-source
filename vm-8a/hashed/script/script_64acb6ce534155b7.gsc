#using scripts\engine\utility.gsc;
#using scripts\engine\throttle.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using script_5238dee479bbf7fb;
#using script_3ff084f114b7f6c9;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_dom_quest.gsc;
#using scripts\mp\gametypes\br_assassination_quest.gsc;
#using scripts\mp\gametypes\br_vip_quest.gsc;
#using scripts\mp\gametypes\br_scavenger_quest.gsc;
#using scripts\mp\gametypes\br_timedrun_quest.gsc;
#using script_4e77eb48df5875ee;
#using script_1c9fa9bfb0a2fd44;
#using script_29e75e5ebeca383d;
#using script_7cf8223c43bbe80b;
#using script_28a1eb678d22e4e3;
#using script_2190c693b7121ab3;
#using script_4948cdf739393d2d;
#using scripts\mp\poi.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_58f20490049af6ac;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_1f97a44d1761c919;
#using script_728ffcee8cbf30ee;
#using script_189b67b2735b981d;
#using script_3ff2458477d23489;

#namespace namespace_c133516bfc1d803c;

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf74
// Size: 0x21a
function function_bf4fd0b5a7c2f528() {
    if (!getdvarint(@"hash_56d4c1121bffcdf1", 1)) {
        return;
    }
    if (game_utility::getsubgametype() == "dmz" || game_utility::getsubgametype() == "exgm") {
        return;
    }
    level.contractmanager = spawnstruct();
    function_7630fa0c7b8a8999();
    inittablets();
    namespace_758f4cbc8c088674::registerondisconnecteventcallback(&onplayerdisconnect);
    namespace_1a2fa2b6ae5d223c::setupcirclepeek();
    namespace_6bf5a85a2b78b77a::registerteamassimilatecallback(&function_6bdc6f56944dc3aa);
    namespace_95a52c4860eaf4dd::registeronluieventcallback(&function_7871e27c25160f63);
    assert(isdefined(game["dialog"]));
    game["dialog"]["mission_gen_accept"] = "gnrc_grav_msns";
    game["dialog"]["mission_misc_success"] = "gnrc_grav_msnc";
    game["dialog"]["mission_obj_change"] = "gnrc_grav_bjcn";
    game["dialog"]["mission_obj_moved"] = "gnrc_grav_bjcr";
    game["dialog"]["mission_obj_next_ptarget"] = "gnrc_grav_trgn";
    game["dialog"]["mission_obj_next_nptarget"] = "gnrc_grav_bjcn";
    game["dialog"]["mission_obj_warning_time"] = "gnrc_grav_mstw";
    game["dialog"]["mission_obj_warning_capture"] = "mission_mission_obj_warning_capture";
    game["dialog"]["mission_obj_circle_fail"] = "gnrc_grav_msfr";
    game["dialog"]["mission_gen_fail"] = "gnrc_grav_msnf";
    game["dialog"]["mission_gen_fail_time"] = "gnrc_grav_mstt";
    game["dialog"]["mission_teammate_down"] = "tmmd_grav_mssn";
    game["dialog"]["mission_enemy_down"] = "nmyd_grav_mssn";
    level._effect["vfx_dom_flare"] = loadfx("vfx/iw8_br/gameplay/vfx_br_flare_dom");
    level._effect["vfx_revive_flare"] = loadfx("vfx/iw8_br/gameplay/vfx_br_flare_revive");
    level._effect["vfx_smktrail_mortar"] = loadfx("vfx/iw8_br/gameplay/vfx_br_flare_smktrail");
    level._effect["vfx_marker_base_orange_pulse"] = loadfx("vfx/iw8_br/gameplay/vfx_br_tr_marker.vfx");
    level.brmodevariantrewardcullfunc = undefined;
    br_circle::function_eca79fa0f341ee08(3, &dangercircletick, &function_1a1709943670772a, &function_6ac289b030b7cabe);
    /#
        thread function_870ec8b83fc533fd();
    #/
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1196
// Size: 0x6b8
function function_7630fa0c7b8a8999() {
    level.contractmanager.contractdata = [];
    level.contractmanager.var_766f9de01948c219 = [];
    level.contractmanager.var_8764d5e454e66ea3 = [];
    level.contractmanager.var_b6fae9c9655c73bf = [];
    level.contractmanager.var_ab841cfaca2f23ad = [];
    level.contractmanager.var_8f51bbe0d6629b2c = [];
    level.contractmanager.currenttasks = [];
    level.contractmanager.defaultfilter = [];
    level.contractmanager.defaultfilter[0] = &filtercondition_isdead;
    level.contractmanager.defaultfilter[1] = &filtercondition_ingulag;
    level.contractmanager.var_2bdaf97f6bfeab76 = getdvarint(@"hash_f6a77ffd2ac4d6d1", 1);
    level.contractmanager.rewards = spawnstruct();
    level.contractmanager.rewards.categorytogroup = [];
    level.contractmanager.rewards.grouptorewards = [];
    level.contractmanager.rewards.scalertoscaleinfo = [];
    level.contractmanager.rewards.rewardtotype = [];
    level.contractmanager.rewards.rewardtovalue = [];
    level.contractmanager.tiers = [];
    level.contractmanager.var_5c6031bde94872a7 = "MP_BR_INGAME/CONTRACT_CANCEL_TIME";
    level.contractmanager.cancelmessage = "MP_BR_INGAME/CONTRACT_CANCEL";
    level.contractmanager.var_1108707ce662e831 = 2.5;
    if (!isdefined(level.gametypebundle)) {
        var_a52e57a689222a7c = %"hash_e921a882197419d";
    } else {
        var_a52e57a689222a7c = level.gametypebundle.contractlist;
    }
    contractlist = getscriptbundle(var_a52e57a689222a7c).contractlist;
    for (contractidx = 0; contractidx < contractlist.size; contractidx++) {
        if (!isdefined(contractlist[contractidx].contract)) {
            continue;
        }
        contractbundle = getscriptbundle(contractlist[contractidx].contract);
        contractdata = spawnstruct();
        contractdata.index = contractidx;
        contractdata.enabled = contractbundle.enabled;
        contractdata.ref = contractbundle.name;
        contractdata.lootref = contractbundle.starterloot;
        contractdata.funcs = [];
        contractdata.var_8d4889067c776936 = function_854eaac890bc7c17(contractdata.ref, 22, -1);
        contractdata.var_839e7395b90ff0ec = function_854eaac890bc7c17(contractdata.ref, 23, -1);
        contractdata.var_a517ddce5d9509a8 = function_854eaac890bc7c17(contractdata.ref, 24, 0);
        contractdata.var_17e740da24ef39aa = function_854eaac890bc7c17(contractdata.ref, 25, -1);
        if (issharedfuncdefined(contractdata.ref, "get_contract_data")) {
            function_f3bb4f4911a1beb2(contractdata.ref, "get_contract_data", contractdata);
        } else {
            switch (contractdata.ref) {
            case #"hash_f4a9126c03d3385b": 
                scripts\mp\gametypes\br_dom_quest::getcontractdata(contractdata);
                break;
            case #"hash_96e641d7fe5b1cf1": 
                scripts\mp\gametypes\br_assassination_quest::getcontractdata(contractdata);
                break;
            case #"hash_f81960af7095fbde": 
                scripts\mp\gametypes\br_assassination_quest::getcontractdata(contractdata, "master");
                break;
            case #"hash_7b0c576c4a7e4890": 
                scripts\mp\gametypes\br_vip_quest::getcontractdata(contractdata);
                break;
            case #"hash_5c57b61aa79410db": 
                scripts\mp\gametypes\br_scavenger_quest::getcontractdata(contractdata);
                break;
            case #"hash_d0eb63c46c25ef55": 
                scripts\mp\gametypes\br_timedrun_quest::getcontractdata(contractdata);
                break;
            case #"hash_cf3abe09f0094696": 
                namespace_78324ffeb3033698::getcontractdata(contractdata);
                break;
            case #"hash_bf5597954aaed3d7": 
                namespace_a12ab42942591824::getcontractdata(contractdata);
                break;
            case #"hash_d22bc78737d8a069": 
                namespace_cc15148f4ce22771::getcontractdata(contractdata);
                break;
            case #"hash_69146251ab5ca13a": 
                namespace_6c622b52017c6808::getcontractdata(contractdata);
                break;
            case #"hash_4aae0f3e58abb932": 
                namespace_522ef15f95ed6589::getcontractdata(contractdata);
                break;
            case #"hash_9bcbe04c85a6a767": 
                namespace_6a760ad730220f95::getcontractdata(contractdata);
                break;
            case #"hash_73f686029a5278dc": 
                namespace_97c4e054660113b7::getcontractdata(contractdata);
                break;
            case #"hash_74ed0c0772e5616":
            case #"hash_3684a21686064f80":
            case #"hash_55cbaf99a55ad833":
            case #"hash_74becfc3db09261d":
            case #"hash_c13e659fe3bd1db3":
            case #"hash_d055a3a4707f4721":
            case #"hash_e2589cebce7ef39c": 
                break;
            default: 
                assertmsg("Unhandled contract type: " + contractdata.ref);
                break;
            }
        }
        level.contractmanager.contractdata[level.contractmanager.contractdata.size] = contractdata;
        level.contractmanager.var_766f9de01948c219[contractdata.ref] = contractdata;
        level.contractmanager.var_8764d5e454e66ea3[contractdata.lootref] = contractdata;
    }
    numstates = tablelookupgetnumrows("mp/brmissions.csv");
    for (stateidx = 0; stateidx < numstates; stateidx++) {
        state = spawnstruct();
        state.index = int(tablelookupbyrow("mp/brmissions.csv", stateidx, 0));
        state.ref = tablelookupbyrow("mp/brmissions.csv", stateidx, 1);
        state.contractref = tablelookupbyrow("mp/brmissions.csv", stateidx, 18);
        level.contractmanager.var_8f51bbe0d6629b2c[state.ref] = state;
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1856
// Size: 0xc84
function inittablets() {
    level.contractmanager.activetablets = [];
    level.contractmanager.hiddentablets = [];
    level.contractmanager.var_a140d7e8412b4051 = [];
    level.contractmanager.var_546b3948246e4aa3 = [];
    level.contractmanager.var_b6012b6ffdb53601 = [];
    hidepercent = 0;
    var_d1358da240d157c5 = getdvarfloat(@"hash_4ec62b4599196026", 0.667);
    var_18d89c513b75caf6 = [];
    locationmin = getdvarint(@"hash_61d045aa9b2d5565", 3);
    var_4c41f1d284a449f2 = getdvarint(@"hash_3b86f15e6ab5c0b0", 0);
    if (locationmin > 0 && isdefined(level.poi_names)) {
        foreach (poi in level.poi_names) {
            poiname = scripts\mp\poi::function_150af7f3a2874667(poi);
            var_18d89c513b75caf6[poiname] = locationmin;
        }
    }
    totalcontracts = 0;
    foreach (type in level.contractmanager.contractdata) {
        if (!isdefined(type.var_57bedc271771b7a6) || !istrue(type.var_57bedc271771b7a6)) {
            tablets = getentitylessscriptablearray(type.lootref);
        } else {
            tablets = [[ type.funcs["spawnScriptables"] ]]();
        }
        if (!type.enabled) {
            foreach (tablet in tablets) {
                function_2aa2583aa4c84697(tablet);
            }
            continue;
        }
        level.contractmanager.var_546b3948246e4aa3[type.lootref] = 0;
        level.contractmanager.var_b6012b6ffdb53601[type.lootref] = 0;
        if (isdefined(type.var_2f8b14dbb63cc32a)) {
            hidepercent = type.var_2f8b14dbb63cc32a;
        } else {
            hidepercent = var_d1358da240d157c5;
        }
        var_6d130ebb53ad2136 = getdvarfloat(@"hash_341fd6b76f01c2e8", 1200);
        if (var_6d130ebb53ad2136 > 0 && tablets.size > 0) {
            foreach (kiosk in level.br_armory_kiosk.scriptables) {
                closetablets = getlootscriptablearrayinradius(type.lootref, undefined, kiosk.origin, var_6d130ebb53ad2136);
                foreach (closetablet in closetablets) {
                    closetablet.hideme = 1;
                }
            }
            for (i = tablets.size - 1; i >= 0; i--) {
                if (!istrue(tablets[i].hideme)) {
                    continue;
                }
                tablets[i].hideme = undefined;
                result = function_2aa2583aa4c84697(tablets[i]);
                assertex(result, "Contract added to hideForever list twice when not expected");
                tablets[i] = tablets[tablets.size - 1];
                tablets[tablets.size - 1] = undefined;
            }
        }
        for (i = tablets.size - 1; i >= 0; i--) {
            tablet = tablets[i];
            tablet tabletinit(type);
            if (!tablet.init || namespace_6c6c9cbca3ea8e6e::function_f0201365c368cf88(tablet.origin) || !br_circle::ispointwithininitialdangercircle(tablet.origin) || function_60094dbeee6e39b0(tablet.origin)) {
                result = function_2aa2583aa4c84697(tablet);
                assertex(result, "Contract added to hideForever list twice when not expected");
                tablets[i] = tablets[tablets.size - 1];
                tablets[tablets.size - 1] = undefined;
            }
        }
        totalcontracts += tablets.size;
        if (tablets.size) {
            setobjectivetypesomvarbit(type);
        }
        if (type.var_8d4889067c776936 > 0) {
            var_5731f7181809474a = tablets.size;
        } else {
            var_2c3363605abb4836 = tablets.size * hidepercent;
            var_5731f7181809474a = int(var_2c3363605abb4836);
            extrachance = var_2c3363605abb4836 - var_5731f7181809474a;
            if (randomfloat(1) < extrachance) {
                var_5731f7181809474a++;
            }
        }
        for (i = 0; i < var_5731f7181809474a; i++) {
            randindex = randomintrange(0, tablets.size);
            tablet = tablets[randindex];
            level.contractmanager.hiddentablets[level.contractmanager.hiddentablets.size] = tablets[randindex];
            tablets[randindex] = tablets[tablets.size - 1];
            tablets[tablets.size - 1] = undefined;
        }
        foreach (tablet in tablets) {
            if (var_18d89c513b75caf6.size > 0) {
                poi = poi::function_6cc445c02b5effac(tablet.origin);
                poiname = scripts\mp\poi::function_150af7f3a2874667(poi);
                if (isdefined(poiname) && isdefined(var_18d89c513b75caf6[poiname])) {
                    var_18d89c513b75caf6[poiname]--;
                    if (!var_18d89c513b75caf6[poiname]) {
                        var_18d89c513b75caf6[poiname] = undefined;
                    }
                }
            }
        }
        foreach (tablet in tablets) {
            if (var_4c41f1d284a449f2 > 0) {
                if (br_circle::ispointwithininitialdangercircle(tablet.origin)) {
                    var_4c41f1d284a449f2--;
                }
            }
        }
        foreach (tablet in tablets) {
            tablet tabletshow();
        }
    }
    if (var_18d89c513b75caf6.size) {
        level.contractmanager.hiddentablets = utility::array_randomize(level.contractmanager.hiddentablets);
        for (i = level.contractmanager.hiddentablets.size - 1; i >= 0; i--) {
            tablet = level.contractmanager.hiddentablets[i];
            poi = poi::function_6cc445c02b5effac(tablet.origin);
            poiname = scripts\mp\poi::function_150af7f3a2874667(poi);
            if (isdefined(poiname) && isdefined(var_18d89c513b75caf6[poiname]) && function_d857e2fd8227f1bd(tablet.task.type, 1) == 1) {
                level.contractmanager.hiddentablets[i] = level.contractmanager.hiddentablets[level.contractmanager.hiddentablets.size - 1];
                level.contractmanager.hiddentablets[level.contractmanager.hiddentablets.size - 1] = undefined;
                tablet tabletshow();
                var_18d89c513b75caf6[poiname]--;
                if (!var_18d89c513b75caf6[poiname]) {
                    var_18d89c513b75caf6[poiname] = undefined;
                    if (!var_18d89c513b75caf6.size) {
                        break;
                    }
                }
            }
        }
    }
    if (var_4c41f1d284a449f2 > 0) {
        level.contractmanager.hiddentablets = utility::array_randomize(level.contractmanager.hiddentablets);
        for (i = level.contractmanager.hiddentablets.size - 1; i >= 0; i--) {
            tablet = level.contractmanager.hiddentablets[i];
            if (br_circle::ispointwithininitialdangercircle(tablet.origin) && function_d857e2fd8227f1bd(tablet.task.type, 1) == 1) {
                level.contractmanager.hiddentablets[i] = level.contractmanager.hiddentablets[level.contractmanager.hiddentablets.size - 1];
                level.contractmanager.hiddentablets[level.contractmanager.hiddentablets.size - 1] = undefined;
                tablet tabletshow();
                var_4c41f1d284a449f2--;
                if (var_4c41f1d284a449f2 == 0) {
                    break;
                }
            }
        }
    }
    var_391489a137dd38a1 = squared(getdvarint(@"hash_526a7311f94ae394", 0));
    if (var_391489a137dd38a1 > 0) {
        var_380e9cbe80c1f6ca = 0;
        var_65462a5df4649b45 = [];
        for (i = level.contractmanager.activetablets.size - 1; i >= 0; i--) {
            tablet = level.contractmanager.activetablets[i];
            if (tablet function_26073a27a7bc12e1(var_391489a137dd38a1, level.contractmanager.activetablets)) {
                level.contractmanager.activetablets[i] = level.contractmanager.activetablets[level.contractmanager.activetablets.size - 1];
                level.contractmanager.activetablets[level.contractmanager.activetablets.size - 1] = undefined;
                var_65462a5df4649b45[var_65462a5df4649b45.size] = tablet;
                var_380e9cbe80c1f6ca++;
            }
        }
        level.contractmanager.hiddentablets = utility::array_randomize(level.contractmanager.hiddentablets);
        for (i = level.contractmanager.hiddentablets.size - 1; i >= 0; i--) {
            if (var_380e9cbe80c1f6ca == 0) {
                break;
            }
            tablet = level.contractmanager.hiddentablets[i];
            if (!tablet function_26073a27a7bc12e1(var_391489a137dd38a1, level.contractmanager.activetablets) && function_d857e2fd8227f1bd(tablet.task.type, 1) == 1) {
                tablet tabletshow();
                level.contractmanager.hiddentablets[i] = level.contractmanager.hiddentablets[level.contractmanager.hiddentablets.size - 1];
                level.contractmanager.hiddentablets[level.contractmanager.hiddentablets.size - 1] = undefined;
                var_380e9cbe80c1f6ca--;
            }
        }
        level.contractmanager.hiddentablets = utility::array_combine(level.contractmanager.hiddentablets, var_65462a5df4649b45);
    }
    level thread function_968df0af5e2d28ea();
    activecontracts = level.contractmanager.activetablets.size;
    hiddencontracts = level.contractmanager.hiddentablets.size;
    level thread function_2651277c09935bde(160000);
    br_analytics::branalytics_inittablets(totalcontracts, activecontracts, hiddencontracts, hidepercent);
    if (br_gametypes::isfeatureenabled("tabletReplace")) {
        level.contractmanager thread tabletreplace();
    } else {
        level.contractmanager thread delayedshowtablets();
    }
    level notify("contractmanager_inittablets_done");
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e2
// Size: 0xa1
function function_531ddda805acc45a(var_4073dfe8bf38ba47, var_a682e84261a6b971) {
    if (!isdefined(var_a682e84261a6b971)) {
        var_a682e84261a6b971 = level.contractmanager.activetablets;
    }
    i_distance = sqrt(var_4073dfe8bf38ba47);
    var_a682e84261a6b971 = sortbydistancecullbyradius(var_a682e84261a6b971, self.origin, i_distance);
    foreach (tablet in var_a682e84261a6b971) {
        if (tablet == self) {
            continue;
        }
        return tablet;
    }
    return undefined;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x258c
// Size: 0x28
function function_26073a27a7bc12e1(var_4073dfe8bf38ba47, var_a682e84261a6b971) {
    nearbytablet = function_531ddda805acc45a(var_4073dfe8bf38ba47, var_a682e84261a6b971);
    return isdefined(nearbytablet);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25bd
// Size: 0x59
function setobjectivetypesomvarbit(type) {
    index = function_3d262d56274bd22e(type.ref);
    assertex(index < 32, "Quest type " + type.ref + " has index >= 32");
    setomnvarbit("ui_br_objective_types", index, 1);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x261e
// Size: 0x105
function tabletreplace() {
    if (!isdefined(level.br_level)) {
        return;
    }
    flags::gameflagwait("prematch_done");
    level.contractmanager.hiddentablets = utility::array_randomize(level.contractmanager.hiddentablets);
    var_fb4145cf6a25541e = 0;
    var_40fb495a4451d505 = level.tabletreplacefrequency;
    for (i = 0; i < level.contractmanager.hiddentablets.size; i++) {
        tablet = level.contractmanager.hiddentablets[i];
        level waittill("quest_started");
        if (isdefined(level.tabletreplacefrequency) && level.tabletreplacefrequency != -1) {
            var_fb4145cf6a25541e++;
            if (var_fb4145cf6a25541e >= var_40fb495a4451d505) {
                tablet tabletshow();
                var_40fb495a4451d505 += level.tabletreplacefrequency;
                i++;
            }
            continue;
        }
        tablet tabletshow();
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x272b
// Size: 0xd2
function function_fe5d4d0a6a530b1e(contractref, origin, angles, iselite) {
    foreach (data in level.contractmanager.contractdata) {
        ref = data.ref;
        if (ref == contractref) {
            newtablet = spawnscriptable(data.lootref, origin, angles);
            br_pickups::registerscriptableinstance(newtablet);
            newtablet tabletinit(data, iselite);
            newtablet tabletshow();
            return newtablet;
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2805
// Size: 0x594
function delayedshowtablets() {
    if (!isdefined(level.br_level)) {
        return;
    }
    lastcircle = level.br_level.br_circledelaytimes.size - 1 - getdvarint(@"hash_96878da693689ccd", 4);
    showpercent = getdvarfloat(@"hash_743253d28cd0d1f7", 0.3);
    flags::gameflagwait("prematch_done");
    validtablets = [];
    for (i = 0; i < level.contractmanager.hiddentablets.size; i++) {
        tablet = level.contractmanager.hiddentablets[i];
        tablet.circleindex = namespace_553788426d0f4133::function_d5cf183ee258befb(tablet.origin);
        if (tablet.circleindex >= 0) {
            validtablets[validtablets.size] = tablet;
        }
    }
    level.contractmanager.hiddentablets = utility::array_randomize(validtablets);
    while (true) {
        level waittill("br_circle_set");
        if (!level.br_circle.circleindex) {
            br_analytics::branalytics_delayedshowtablets(0, showpercent, validtablets.size, 0);
            continue;
        }
        var_391489a137dd38a1 = squared(getdvarint(@"hash_526a7311f94ae394", 0));
        var_842f8fcc3ce6073 = [];
        var_91c73aa76ed988d0 = [];
        foreach (type in level.contractmanager.contractdata) {
            var_91c73aa76ed988d0[type.lootref] = 0;
            if (function_d857e2fd8227f1bd(type) != 1) {
                var_842f8fcc3ce6073[type.lootref] = 0;
                continue;
            }
            var_842f8fcc3ce6073[type.lootref] = type.var_a517ddce5d9509a8;
        }
        validtablets = [];
        prioritytablets = [];
        skippedtablets = [];
        for (i = 0; i < level.contractmanager.hiddentablets.size; i++) {
            tablet = level.contractmanager.hiddentablets[i];
            if (tablet.circleindex >= level.br_circle.circleindex) {
                if (!function_ebdf8f6e61c84882(tablet)) {
                    continue;
                }
                result = function_d857e2fd8227f1bd(tablet.task.type);
                if (result == -1) {
                    continue;
                } else if (result == 0) {
                    skippedtablets[skippedtablets.size] = tablet;
                    continue;
                }
                if (var_391489a137dd38a1 > 0) {
                    if (tablet function_26073a27a7bc12e1(var_391489a137dd38a1, level.contractmanager.activetablets)) {
                        skippedtablets[skippedtablets.size] = tablet;
                        continue;
                    }
                    if (tablet function_26073a27a7bc12e1(var_391489a137dd38a1, validtablets)) {
                        skippedtablets[skippedtablets.size] = tablet;
                        continue;
                    }
                }
                if (var_842f8fcc3ce6073[tablet.type] > 0) {
                    prioritytablets[prioritytablets.size] = tablet;
                    var_842f8fcc3ce6073[tablet.type]--;
                    continue;
                }
                validtablets[validtablets.size] = tablet;
            }
        }
        showcount = int(ceil(validtablets.size * showpercent));
        var_cf6dc40ca9d1b393 = int(max(0, getdvarint(@"hash_6cd10c5d6e2a6220", 100) - level.contractmanager.activetablets.size) - getdvarint(@"hash_48094445b4d0cade", 20) * level.br_circle.circleindex);
        showcount = int(min(showcount, var_cf6dc40ca9d1b393));
        var_c03697880b987159 = 0;
        foreach (tablet in prioritytablets) {
            if (!isdefined(tablet)) {
                continue;
            }
            tablet tabletshow();
            var_91c73aa76ed988d0[tablet.type]++;
            var_c03697880b987159++;
        }
        foreach (tablet in validtablets) {
            if (var_c03697880b987159 >= showcount) {
                skippedtablets[skippedtablets.size] = tablet;
                continue;
            }
            if (var_91c73aa76ed988d0[tablet.type] >= level.contractmanager.var_8764d5e454e66ea3[tablet.type].var_17e740da24ef39aa && level.contractmanager.var_8764d5e454e66ea3[tablet.type].var_17e740da24ef39aa >= 0) {
                skippedtablets[skippedtablets.size] = tablet;
                continue;
            }
            tablet tabletshow();
            var_91c73aa76ed988d0[tablet.type]++;
            var_c03697880b987159++;
        }
        level.contractmanager.hiddentablets = skippedtablets;
        br_analytics::branalytics_delayedshowtablets(level.br_circle.circleindex, showpercent, validtablets.size, var_c03697880b987159);
        if (level.br_circle.circleindex >= lastcircle) {
            break;
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da1
// Size: 0x69
function function_ebdf8f6e61c84882(tablet) {
    if (isdefined(tablet.task.type.funcs["validateContractNotInStronghold"])) {
        return tablet.task [[ tablet.task.type.funcs["validateContractNotInStronghold"] ]]();
    }
    return 1;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e13
// Size: 0xe4
function function_1c1f9f1aa4944459() {
    self endon("game_ended");
    while (!isdefined(level.lockedvolumes) || level.lockedvolumes.size < 1) {
        wait 0.5;
    }
    foreach (tablet in level.contractmanager.activetablets) {
        if (isdefined(tablet.task.type.funcs["validateContractNotInStronghold"])) {
            tablet.task [[ tablet.task.type.funcs["validateContractNotInStronghold"] ]]();
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2eff
// Size: 0xcf
function disablealltablets() {
    foreach (type in level.contractmanager.contractdata) {
        tablets = getlootscriptablearray(type.lootref);
        if (type.enabled) {
            foreach (tablet in tablets) {
                tablet tablethide();
            }
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fd6
// Size: 0x83
function function_2aa2583aa4c84697(tablet) {
    if (flags::gameflag("prematch_done")) {
        assertmsg("hideForverAfterPrematch Called after prematch");
        return;
    }
    if (istrue(tablet.var_f1d383d9d3b40188)) {
        return 0;
    }
    count = level.contractmanager.var_a140d7e8412b4051.size;
    level.contractmanager.var_a140d7e8412b4051[count] = tablet;
    tablet.var_f1d383d9d3b40188 = 1;
    return 1;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3061
// Size: 0x1ae
function function_968df0af5e2d28ea() {
    flags::gameflagwait("prematch_done");
    var_d1c571c1e3ed81ca = getdvarint(@"hash_88cc8ac36a3c2863", 32);
    tablet_throttle = throttle::function_af33edfaf05fc572("tablet", var_d1c571c1e3ed81ca);
    foreach (tablet in level.contractmanager.var_a140d7e8412b4051) {
        throttle::function_6f7b33660ae155ef(tablet_throttle);
        tablet thread tablethide();
        tablet.var_f1d383d9d3b40188 = undefined;
    }
    level.contractmanager.var_a140d7e8412b4051 = undefined;
    foreach (tablet in level.contractmanager.hiddentablets) {
        throttle::function_6f7b33660ae155ef(tablet_throttle);
        tablet thread tablethide();
    }
    foreach (tablet in level.contractmanager.activetablets) {
        if (istrue(tablet.startdisabled)) {
            throttle::function_6f7b33660ae155ef(tablet_throttle);
            tablet.startdisabled = undefined;
            tablet thread tablethide();
        }
    }
    throttle::throttle_destroy(tablet_throttle);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3217
// Size: 0x8d
function tablethide(hideforever) {
    self endon("show");
    if (istrue(hideforever)) {
        self.hiddenforever = 1;
    }
    if (isdefined(level.contractmanager.var_b6012b6ffdb53601) && isdefined(level.contractmanager.var_b6012b6ffdb53601[self.type])) {
        level.contractmanager.var_b6012b6ffdb53601[self.type]++;
    }
    flags::gameflagwait("prematch_done");
    br_pickups::loothide(self);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32ac
// Size: 0x8e
function function_6ac289b030b7cabe(obj) {
    if (isdefined(obj.tablettype) && !istrue(obj.hiddenforever)) {
        allowshow = 1;
        if (isdefined(obj.tablettype.funcs["onShowAgain"])) {
            allowshow = obj.task [[ obj.tablettype.funcs["onShowAgain"] ]]();
        }
        if (allowshow) {
            obj tabletshow(1);
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3342
// Size: 0xf2
function tabletshow(var_132f5385c2f23a96) {
    assert(isdefined(self.init));
    if (isdefined(level.contractmanager.var_546b3948246e4aa3) && isdefined(level.contractmanager.var_546b3948246e4aa3[self.type])) {
        level.contractmanager.var_546b3948246e4aa3[self.type]++;
    }
    self notify("show");
    part = self.type;
    self setscriptablepartstate(part, "visible");
    if (!utility::array_contains(level.contractmanager.activetablets, self)) {
        level.contractmanager.activetablets[level.contractmanager.activetablets.size] = self;
    }
    if (!istrue(var_132f5385c2f23a96)) {
        br_analytics::branalytics_spawntablet(self);
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x343c
// Size: 0xcf
function tabletinit(type, iselite) {
    if (isdefined(self.init)) {
        return;
    }
    self.init = 1;
    self.tablettype = type;
    tabletinit = type.funcs["onInit"];
    if (isdefined(tabletinit)) {
        task = spawnstruct();
        task.teams = [];
        task.type = type;
        task.iselite = iselite;
        self.task = task;
        task.tablet = self;
        self.init = task [[ tabletinit ]]();
        if (!self.init) {
            br_analytics::branalytics_invalidtablet(self);
        }
    }
    return self.init;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3514
// Size: 0xc6
function function_4d5dd20e109455f2(instance) {
    level.contractmanager.activetablets = utility::array_remove(level.contractmanager.activetablets, instance);
    instance notify("onTabletHidden");
    if (isdefined(instance) && isdefined(instance.tablettype) && isdefined(instance.tablettype.ref)) {
        contractdata = function_2a81be592adacdaa(instance.tablettype.ref);
        if (isdefined(contractdata) && isdefined(contractdata.funcs["onTabletHidden"])) {
            [[ contractdata.funcs["onTabletHidden"] ]](instance);
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35e2
// Size: 0x165
function function_8ad1b4ddc1fd852a(team, player) {
    br_analytics::branalytics_missionstart(self, player);
    level.contractmanager.var_b6fae9c9655c73bf[team] = self;
    level.contractmanager.currenttasks[level.contractmanager.currenttasks.size] = self;
    if (!isdefined(self.teams)) {
        self.teams = [];
    }
    self.teams[self.teams.size] = team;
    self.var_d154ac2657c5f44 = player;
    if (isdefined(player) && isdefined(player.closestpoi)) {
        self.startingpoi = player.closestpoi;
    }
    function_473ab9452660e60f(self.type.ref);
    players = teams::getteamdata(team, "players");
    foreach (teamplayer in players) {
        teamplayer challenges::oncontractstart(self.type.index, player);
        namespace_27c74152ccb91331::function_55b08d6d71b41402(teamplayer, "contract_start");
    }
    level notify("quest_started", team);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x374f
// Size: 0x45b
function endcontract(var_5e671fc71e72d5e8, results, var_752106078fe9b8fc, endstate) {
    if (br_gametypes::isbrgametypefuncdefined("contractEnd")) {
        br_gametypes::function_d72afdccedfc9b07("contractEnd", self, self.teams[0], isdefined(var_5e671fc71e72d5e8) && var_5e671fc71e72d5e8 == self.teams[0]);
    }
    var_c893965b0b5cc806 = isdefined(var_5e671fc71e72d5e8);
    numteamplayers = 0;
    foreach (team in self.teams) {
        assertex(isdefined(level.contractmanager.var_b6fae9c9655c73bf[team]), "releaseTeamOnQuest called for unregistered team '" + team + "'");
        var_da1e4a8f39765732 = var_c893965b0b5cc806 && var_5e671fc71e72d5e8 == team;
        if (!istrue(self.iselite)) {
            uiobjectivehidefromteam(team);
            level.contractmanager.var_b6fae9c9655c73bf[team] = undefined;
        }
        if (var_da1e4a8f39765732) {
            players = teams::getteamdata(team, "players");
            numteamplayers = players.size;
            foreach (player in players) {
                if (!isdefined(player.brmissionscompleted)) {
                    player.brmissionscompleted = 0;
                }
                player.brmissionscompleted++;
                if (level.var_58adce74179ab9ef) {
                    player stats::incpersstat("objectivesCompleted", 1);
                    player br_public::updatebrscoreboardstat("missionsCompleted", player stats::getpersstat("objectivesCompleted"));
                } else {
                    player br_public::updatebrscoreboardstat("missionsCompleted", player.brmissionscompleted);
                }
                player scripts\cp_mp\challenges::oncontractend(self.type.index, 1, 1, self.startingpoi);
            }
            if (!isdefined(level.contractmanager.var_ab841cfaca2f23ad[team])) {
                level.contractmanager.var_ab841cfaca2f23ad[team] = 0;
            }
            level.contractmanager.var_ab841cfaca2f23ad[team]++;
            continue;
        }
        players = teams::getteamdata(team, "players");
        foreach (player in players) {
            player challenges::oncontractend(self.type.index, 0, 1);
        }
        if (isdefined(var_752106078fe9b8fc)) {
            var_da60ac7aae847d8 = teams::getteamdata(var_752106078fe9b8fc, "players");
            foreach (var_c92902ad553e3854 in var_da60ac7aae847d8) {
                var_c92902ad553e3854 challenges::oncontractend(self.type.index, 1, 2);
            }
        }
    }
    instanceholder = spawnstruct();
    instanceholder.questcategory = self.category;
    if (var_c893965b0b5cc806) {
        instanceholder.result = "success";
    } else {
        instanceholder.result = "failure";
    }
    if (isdefined(self.tablet)) {
        instanceholder.missionid = utility::string(self.tablet.index);
        instanceholder.endstate = endstate;
        if (!isdefined(results)) {
            results = [];
        }
        br_analytics::branalytics_missionend(instanceholder, 1, results, numteamplayers);
    }
    if (!istrue(self.iselite)) {
        level.contractmanager.currenttasks = utility::array_remove(level.contractmanager.currenttasks, self);
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bb2
// Size: 0x15f
function function_bb413728bc5231d0(instance) {
    lootref = instance.type;
    if (isdefined(level.contractmanager.var_8764d5e454e66ea3[lootref].funcs["onTeamAssigned"])) {
        if (function_7094c7010c5e3827(self.team)) {
            assertmsg(self.team + " tried to pickup a contract but was already in teamsOnContract!");
            return;
        }
        giveteampoints(self.team, #"hash_67eb4b642067882a");
        instance tablethide();
        instance.task function_8ad1b4ddc1fd852a(self.team, self);
        instance.task.var_7ca287a82f54e4f6 = self;
        instance.task [[ level.contractmanager.var_8764d5e454e66ea3[lootref].funcs["onTeamAssigned"] ]]();
        br_plunder::modify_plunder_itemsinworld("brloot_mission_tablet", -1);
        if (br_gametypes::isbrgametypefuncdefined("contractStart")) {
            br_gametypes::runbrgametypefunc("contractStart", instance.task, self.team);
        }
        return;
    }
    assertmsg("onTeamAssigned function has not been defined for " + instance.type.ref);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d19
// Size: 0x47
function function_7094c7010c5e3827(team) {
    return isdefined(level.contractmanager) && isdefined(level.contractmanager.var_b6fae9c9655c73bf) && isdefined(level.contractmanager.var_b6fae9c9655c73bf[team]);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d69
// Size: 0x47
function function_22239d4cff05d0a1(team) {
    if (isdefined(level.contractmanager) && isdefined(level.contractmanager.var_b6fae9c9655c73bf)) {
        return level.contractmanager.var_b6fae9c9655c73bf[team];
    }
    return undefined;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3db9
// Size: 0x2f4
function dangercircletick(var_819edacdacb810e4, dangercircleradius, thresholdradius) {
    var_52d59c928eb97c81 = dangercircleradius + thresholdradius;
    activetablets = [];
    if (!game_utility::function_fa7bfcc1d68b7b73()) {
        if (!isdefined(level.contractmanager) || !isdefined(level.contractmanager.activetablets)) {
            return;
        } else {
            activetablets = level.contractmanager.activetablets;
        }
        foreach (contract in level.contractmanager.contractdata) {
            if (isdefined(contract.funcs["circleTick"])) {
                foreach (task in level.contractmanager.currenttasks) {
                    if (contract.ref == task.type.ref) {
                        task [[ contract.funcs["circleTick"] ]](var_819edacdacb810e4, var_52d59c928eb97c81);
                    }
                }
            }
        }
    } else {
        if (!isdefined(level.questinfo)) {
            return;
        } else {
            activetablets = level.questinfo.activetablets;
        }
        foreach (quest in level.questinfo.quests) {
            if (isdefined(quest.funcs["circleTick"])) {
                foreach (instance in quest.instances) {
                    instance [[ quest.funcs["circleTick"] ]](var_819edacdacb810e4, var_52d59c928eb97c81);
                }
            }
        }
    }
    foreach (tablet in activetablets) {
        if (distance2dsquared(var_819edacdacb810e4, tablet.origin) > var_52d59c928eb97c81 * var_52d59c928eb97c81) {
            br_pickups::loothide(tablet);
            br_plunder::modify_plunder_itemsinworld("brloot_mission_tablet", -1);
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40b5
// Size: 0x1fa
function function_1a1709943670772a() {
    if (!isdefined(level.contractmanager)) {
        return;
    }
    foreach (contract in level.contractmanager.contractdata) {
        if (isdefined(contract.funcs["circleTick"])) {
            foreach (task in level.contractmanager.currenttasks) {
                if (contract.ref == task.type.ref) {
                    task [[ contract.funcs["circleTick"] ]]();
                }
            }
        }
    }
    hiddentablets = [];
    foreach (tablet in level.contractmanager.activetablets) {
        if (!isdefined(tablet) || !isdefined(tablet.type)) {
            continue;
        }
        if (!br_pickups::isquesttablet(tablet.type)) {
            continue;
        }
        if (!isdefined(tablet.origin)) {
            logstring("br_contract_manager::dangerMultiCircleTick tablet does not have an origin! " + tablet.type);
            continue;
        }
        if (!namespace_553788426d0f4133::function_ee854fdd1e77efc4(tablet.origin)) {
            hiddentablets[hiddentablets.size] = tablet;
            br_pickups::loothide(tablet);
            br_plunder::modify_plunder_itemsinworld("brloot_mission_tablet", -1);
        }
    }
    return hiddentablets;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42b8
// Size: 0x129
function onplayerkilled(attacker, victim) {
    if (!isdefined(level.contractmanager) || !isdefined(victim)) {
        return;
    }
    foreach (contract in level.contractmanager.contractdata) {
        if (isdefined(contract.funcs["onPlayerKilled"])) {
            foreach (task in level.contractmanager.currenttasks) {
                if (contract.ref == task.type.ref) {
                    task [[ contract.funcs["onPlayerKilled"] ]](attacker, victim);
                }
            }
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43e9
// Size: 0x55
function onplayerconnect(player) {
    if (!isdefined(player.team) || !isdefined(level.contractmanager)) {
        return;
    }
    setquestrewardtier(player.team, getquestrewardtier(player.team));
    player function_ab19a58fc4be9ce2();
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4446
// Size: 0x11f
function onplayerdisconnect(player) {
    if (!isdefined(level.contractmanager) || !isdefined(player)) {
        return;
    }
    foreach (contract in level.contractmanager.contractdata) {
        if (isdefined(contract.funcs["onPlayerDisconnect"])) {
            foreach (task in level.contractmanager.currenttasks) {
                if (contract.ref == task.type.ref) {
                    task [[ contract.funcs["onPlayerDisconnect"] ]](player);
                }
            }
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x456d
// Size: 0x98
function onplayerentergulag() {
    if (!isdefined(level.contractmanager)) {
        return;
    }
    if (function_7094c7010c5e3827(self.team)) {
        task = function_22239d4cff05d0a1(self.team);
        if (isdefined(task.type.funcs["onEnterGulag"])) {
            task [[ task.type.funcs["onEnterGulag"] ]](self);
        }
        if (isdefined(task.var_972eddbdcf30619c)) {
            function_1e64ea5eb68d8119();
        }
    }
    onGlobalPlayerEnterGulag();
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x460d
// Size: 0xff
function onGlobalPlayerEnterGulag() {
    foreach (contract in level.contractmanager.contractdata) {
        if (isdefined(contract.funcs["onGlobalPlayerEnterGulag"])) {
            foreach (task in level.contractmanager.currenttasks) {
                if (contract.ref == task.type.ref) {
                    task [[ contract.funcs["onGlobalPlayerEnterGulag"] ]](self);
                }
            }
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4714
// Size: 0xa9
function onplayerrespawn() {
    if (!isdefined(level.contractmanager)) {
        return;
    }
    self setclientomnvar("ui_player_spawned_notify", gettime());
    if (function_7094c7010c5e3827(self.team)) {
        task = function_22239d4cff05d0a1(self.team);
        if (isdefined(task.type.funcs["onPlayerRespawn"])) {
            task [[ task.type.funcs["onPlayerRespawn"] ]](self);
        }
        if (isdefined(task.var_972eddbdcf30619c)) {
            function_1e64ea5eb68d8119();
        }
    }
    onGlobalPlayerRespawn();
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47c5
// Size: 0xff
function onGlobalPlayerRespawn() {
    foreach (contract in level.contractmanager.contractdata) {
        if (isdefined(contract.funcs["onGlobalPlayerRespawn"])) {
            foreach (task in level.contractmanager.currenttasks) {
                if (contract.ref == task.type.ref) {
                    task [[ contract.funcs["onGlobalPlayerRespawn"] ]](self);
                }
            }
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48cc
// Size: 0x51
function packsplashparambits(contractindex, rewardcash) {
    assert(contractindex >= 0 && contractindex < 64);
    assert(rewardcash >= 0 && rewardcash < 8192);
    value = contractindex;
    value |= rewardcash << 5;
    return value;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4926
// Size: 0xc6
function function_878ebcc241b54505(splashref, contractindex, rewardcash, team, delay, var_42b1e877ab187c6) {
    if (isdefined(delay) && delay > 0) {
        wait delay;
    }
    params = packsplashparambits(contractindex, rewardcash);
    players = teams::getteamdata(team, "players");
    foreach (player in players) {
        player thread hud_message::showsplash(splashref, params, undefined, undefined, undefined, var_42b1e877ab187c6);
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49f4
// Size: 0x57
function displayteamsplash(team, splash_key, params, var_42b1e877ab187c6) {
    assertex(isdefined(splash_key), "No splash_key defined for message being displayed to '" + team);
    players = teams::getteamdata(team, "players");
    displaysplashtoplayers(players, splash_key, params, var_42b1e877ab187c6);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a53
// Size: 0xd3
function displaysplashtoplayers(players, splash_key, params, var_42b1e877ab187c6) {
    assertex(isdefined(splash_key), "No splash_key defined for message being displayed");
    foreach (player in players) {
        if (player br_public::isplayeringulag()) {
            continue;
        }
        if (isbot(player) && br_public::istutorial()) {
            continue;
        }
        if (isdefined(params)) {
            if (isdefined(params.excludedplayers)) {
                if (utility::array_contains(params.excludedplayers, player)) {
                    continue;
                }
            }
        }
        displayplayersplash(player, splash_key, params, var_42b1e877ab187c6);
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b2e
// Size: 0xb0
function displayplayersplash(player, splash_key, params, var_42b1e877ab187c6) {
    assertex(isdefined(splash_key), "No splash_key defined for message being displayed to '" + player.name);
    if (isdefined(params) && isdefined(params.packedbits)) {
        player thread hud_message::showsplash(splash_key, params.packedbits, undefined, undefined, undefined, var_42b1e877ab187c6);
        return;
    }
    if (isdefined(params) && isdefined(params.intvar)) {
        player thread hud_message::showsplash(splash_key, params.intvar, undefined, undefined, undefined, var_42b1e877ab187c6);
        return;
    }
    player thread hud_message::showsplash(splash_key, undefined, undefined, undefined, undefined, var_42b1e877ab187c6);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4be6
// Size: 0x6a
function displaysquadmessagetoplayer(player_ref, state, missionid) {
    player = player_ref getentitynumber();
    if (!isdefined(state)) {
        state = 0;
    }
    if (!isdefined(player)) {
        player = 0;
    }
    if (!isdefined(missionid)) {
        missionid = 0;
    }
    value = 0;
    value = missionid << 12 | player << 4 | state;
    self setclientomnvar("ui_br_expanded_obit_message", value);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c58
// Size: 0x7f
function displaysquadmessagetoteam(team, player_ref, state, missionid) {
    foreach (player in teams::getteamdata(team, "players")) {
        player displaysquadmessagetoplayer(player_ref, state, missionid);
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4cdf
// Size: 0x1d
function giveplayerpoints(player, ref) {
    player thread points::doScoreEvent(ref);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d04
// Size: 0x6d
function giveteampoints(team, ref) {
    foreach (player in teams::getteamdata(team, "players")) {
        player thread points::doScoreEvent(ref);
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4d79
// Size: 0x10b
function giveteamplunderflat(team, amount) {
    var_8e3c5f90e4f80a58 = getdvarfloat(@"hash_7165dad703502609", 0.4);
    var_2cefa8f8a2ba6bfe = 0;
    foreach (player in teams::getteamdata(team, "players")) {
        if (isbot(player) && br_public::istutorial()) {
            continue;
        }
        var_36773a58eb035bff = amount;
        if (!player::isreallyalive(player)) {
            var_36773a58eb035bff = int(amount * var_8e3c5f90e4f80a58);
        } else {
            var_36773a58eb035bff = int(var_36773a58eb035bff * function_fd4c76c90a1a0333(player));
        }
        player br_plunder::playerplunderpickup(var_36773a58eb035bff);
        level.br_plunder.plunder_awarded_by_missions_total += var_36773a58eb035bff;
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4e8c
// Size: 0xdd
function giveteamplunderdistributive(players, amount) {
    amountperplayer = int(amount / players.size);
    foreach (player in players) {
        if (isbot(player) && br_public::istutorial()) {
            continue;
        }
        var_18417c862feb0b9e = int(amountperplayer * function_fd4c76c90a1a0333(player));
        player br_plunder::playerplunderpickup(var_18417c862feb0b9e);
        level.br_plunder.plunder_awarded_by_missions_total += var_18417c862feb0b9e;
        br_analytics::trackcashevent(player, "mission", var_18417c862feb0b9e);
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4f71
// Size: 0x314
function dropplunder(ammount, var_5b7bf3433d244cdf, var_76212928fed46301, var_41271de03a84a690) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    info_name = 0;
    info_scale = 1;
    info_percent = 2;
    var_82c3fc1e774a5a35[0] = ["brloot_plunder_cash_uncommon_3", level.br_plunder.quantityepic, getdvarfloat(@"hash_53dd15287f7df644", 0.2)];
    var_82c3fc1e774a5a35[1] = ["brloot_plunder_cash_uncommon_2", level.br_plunder.quantityrare, getdvarfloat(@"hash_8fa17586ac872da9", 0.3)];
    var_82c3fc1e774a5a35[2] = ["brloot_plunder_cash_uncommon_1", level.br_plunder.quantitycommon, getdvarfloat(@"hash_30bf1dd438567db0", 0.5)];
    totalpercent = 0;
    for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
        info = var_82c3fc1e774a5a35[i];
        totalpercent += info[info_percent];
    }
    plundertotal = 0;
    for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
        info = var_82c3fc1e774a5a35[i];
        info[info_percent] = info[info_percent] / totalpercent;
        plundertotal += info[info_scale] * info[info_percent];
    }
    numdrops = ammount / plundertotal;
    rewardremaining = ammount;
    plunderdrops = [];
    for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
        info = var_82c3fc1e774a5a35[i];
        plunderdrops[i] = int(numdrops * info[info_percent]);
        rewardremaining -= plunderdrops[i] * info[info_scale];
    }
    if (rewardremaining > 0) {
        for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
            info = var_82c3fc1e774a5a35[i];
            extra = int(rewardremaining / info[info_scale]);
            plunderdrops[i] = plunderdrops[i] + extra;
            rewardremaining -= extra * info[info_scale];
        }
    }
    droptypes = [];
    for (i = 0; i < plunderdrops.size; i++) {
        for (j = 0; j < plunderdrops[i]; j++) {
            droptypes[droptypes.size] = i;
        }
    }
    droptypes = utility::array_randomize(droptypes);
    dropstruct = br_pickups::function_7b9f3966a7a42003();
    for (i = 0; i < droptypes.size; i++) {
        dropinfo = br_pickups::getitemdroporiginandangles(dropstruct, var_5b7bf3433d244cdf, var_76212928fed46301, var_41271de03a84a690);
        br_pickups::spawnpickup(var_82c3fc1e774a5a35[droptypes[i]][info_name], dropinfo, var_82c3fc1e774a5a35[droptypes[i]][info_scale], 1);
    }
    level.br_plunder.plunder_awarded_by_missions_total += ammount;
    level thread br_plunder::dropplundersounds(var_5b7bf3433d244cdf, droptypes.size);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x528d
// Size: 0x55
function function_d282041688c032b5(category) {
    contractref = tablelookup("mp/brmissions.csv", 1, category, 18);
    contractbundle = function_99b5f579a15f808d(contractref);
    cashreward = contractbundle.cashreward;
    if (!isdefined(cashreward)) {
        return 0;
    }
    return cashreward;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52eb
// Size: 0x5e
function function_854eaac890bc7c17(category, column, nullreturn) {
    if (category == "intel") {
        category = "intel_upload";
    }
    data = tablelookup("mp/brmissions.csv", 1, category, column);
    if (!isdefined(data) || data == "") {
        return nullreturn;
    }
    return int(data);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5352
// Size: 0x91
function function_d857e2fd8227f1bd(type, nocircle) {
    mincircle = type.var_8d4889067c776936;
    maxcircle = type.var_839e7395b90ff0ec;
    if (istrue(nocircle)) {
        if (mincircle <= 0) {
            return 1;
        } else {
            return 0;
        }
    }
    if (level.br_circle.circleindex < mincircle) {
        return 0;
    }
    if (level.br_circle.circleindex > maxcircle && maxcircle != -1) {
        return -1;
    }
    return 1;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53ec
// Size: 0x72
function function_d212a5e7a40d7c8d(contractname, team, rewardposition) {
    contractbundle = function_99b5f579a15f808d(contractname);
    groupref = contractbundle.rewardgroup;
    if (isdefined(groupref) && groupref != "") {
        return br_quest_util::givequestrewardgroup(groupref, team, rewardposition.origin, rewardposition.angles);
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5466
// Size: 0x4a
function function_6ddd1eecbe562acf(groupref, team, rewardposition) {
    if (isdefined(groupref) && groupref != "") {
        return br_quest_util::givequestrewardgroup(groupref, team, rewardposition.origin, rewardposition.angles);
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54b8
// Size: 0x2a
function function_3d262d56274bd22e(ref) {
    return level.contractmanager.var_766f9de01948c219[ref].index;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54eb
// Size: 0x2a
function getquestindex(ref) {
    return level.contractmanager.var_8f51bbe0d6629b2c[ref].index;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x551e
// Size: 0x2a
function getquesttableindex(ref) {
    index = int(tablelookup("mp/brmissions.csv", 1, ref, 0));
    return index;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5551
// Size: 0x34
function uiobjectiveshow(ref) {
    assert(isplayer(self));
    index = getquestindex(ref);
    setquestindexomnvar(index);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x558d
// Size: 0x6c
function uiobjectiveshowtoteam(ref, team) {
    foreach (player in teams::getteamdata(team, "players")) {
        player uiobjectiveshow(ref);
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5601
// Size: 0x19
function uiobjectivehide() {
    assert(isplayer(self));
    setquestindexomnvar(0);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5622
// Size: 0x63
function uiobjectivehidefromteam(team) {
    foreach (player in teams::getteamdata(team, "players")) {
        player uiobjectivehide();
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x568d
// Size: 0x77
function function_e2aa45e2c6b5dec1(value, value2) {
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        player uiobjectivesetparameter(value, value2);
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x570c
// Size: 0x51
function uiobjectivesetparameter(value, value2) {
    assert(isplayer(self));
    self setclientomnvar("ui_br_objective_param", value);
    if (isdefined(value2)) {
        assertex(isdefined(value), "First parameter should be defined before setting extra parameter.");
        self setclientomnvar("ui_br_objective_extraParam", value2);
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5765
// Size: 0x27
function uiobjectivesetlootid(value) {
    assert(isplayer(self));
    self setclientomnvar("ui_br_objective_loot_id", value);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5794
// Size: 0xb5
function createquestobjicon(iconref, state, var_38116998df9814d4) {
    self.objectiveiconid = namespace_6c8a837ec98fe0b8::requestobjectiveid(1);
    if (self.objectiveiconid != -1) {
        namespace_6c8a837ec98fe0b8::objective_add_objective(self.objectiveiconid, state, (0, 0, 0), iconref);
        namespace_6c8a837ec98fe0b8::update_objective_setbackground(self.objectiveiconid, 4);
        objective_showtoplayersinmask(self.objectiveiconid);
        namespace_6c8a837ec98fe0b8::objective_set_play_intro(self.objectiveiconid, 1);
        if (isdefined(var_38116998df9814d4)) {
            movequestobjicon(var_38116998df9814d4);
        }
        return;
    }
    println(self.category + "<dev string:x1c>");
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5851
// Size: 0x1c
function movequestobjicon(neworigin) {
    namespace_6c8a837ec98fe0b8::update_objective_position(self.objectiveiconid, neworigin);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5875
// Size: 0x1b
function showquestobjicontoplayer(player) {
    objective_addclienttomask(self.objectiveiconid, player);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5898
// Size: 0x12
function showquestobjicontoall(objid) {
    objective_addalltomask(objid);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58b2
// Size: 0x1b
function hidequestobjiconfromplayer(player) {
    objective_removeclientfrommask(self.objectiveiconid, player);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58d5
// Size: 0xc
function checkforactiveobjicon() {
    return isdefined(self.objectiveiconid);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58ea
// Size: 0x22
function deletequestobjicon() {
    namespace_6c8a837ec98fe0b8::objective_playermask_hidefromall(self.objectiveiconid);
    namespace_6c8a837ec98fe0b8::returnobjectiveid(self.objectiveiconid);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5914
// Size: 0x8c
function function_425f0abdafad5a76(objectiveidnum, teamname) {
    players = getteamdata(teamname, "players");
    foreach (player in players) {
        if (isreallyalive(player) && !player scripts\mp\gametypes\br_public::isplayeringulag()) {
            objective_addclienttomask(objectiveidnum, player);
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59a8
// Size: 0xa7
function function_ead4d06481b4437e(objectiveidnum, teamname) {
    level endon("game_ended");
    wait level.contractmanager.var_1108707ce662e831;
    players = getteamdata(teamname, "players");
    foreach (player in players) {
        if (isreallyalive(player) && !player scripts\mp\gametypes\br_public::isplayeringulag()) {
            objective_addclienttomask(objectiveidnum, player);
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a57
// Size: 0x4b
function function_42a0806457ea8039(player) {
    if (!isdefined(player.team) || !isdefined(self.teams[0])) {
        return false;
    }
    if (player.team == self.teams[0]) {
        return true;
    }
    return false;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5aab
// Size: 0x1bd
function utilflare_shootflare(spawn_origin, flaretype, var_30a49dc77e377647, var_ff51d4e9d2fae932) {
    level endon("game_ended");
    content_filter = trace::create_contents(0, 1, 0, 1, 0, 0, 0);
    new_position = trace::ray_trace(spawn_origin + (0, 0, 4000), spawn_origin, undefined, content_filter, undefined, 1)["position"];
    if (!isdefined(var_30a49dc77e377647)) {
        var_30a49dc77e377647 = 0;
    }
    if (istrue(var_30a49dc77e377647)) {
        flare = spawn("script_model", spawn_origin);
    } else {
        flare = spawn("script_model", new_position);
    }
    if (!isdefined(flare)) {
        return;
    }
    start_pos = flare.origin;
    flare.angles = vectortoangles((0, 0, 1));
    if (isdefined(var_ff51d4e9d2fae932)) {
        flare setmodel("equip_flare_ob");
    } else {
        flare setmodel("equip_flare_br");
    }
    wait 0.5;
    start_state = isdefined(flaretype) && flare getscriptableparthasstate("launch", "start_" + flaretype) ? "start_" + flaretype : "start";
    flare setscriptablepartstate("launch", start_state, 0);
    travel_state = isdefined(flaretype) && flare getscriptableparthasstate("travel", "start_" + flaretype) ? "start_" + flaretype : "start";
    if (isdefined(flaretype)) {
        if (flaretype == "4th_july") {
            playsoundatpos(start_pos, "mus_iw9_flare_launch_stinger_july4");
        }
    }
    flare setscriptablepartstate("travel", travel_state, 0);
    flare thread _utilflare_lerpflare(flaretype);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c70
// Size: 0x52
function _utilflare_lerpflare(flaretype) {
    self endon("death");
    level endon("game_ended");
    movetime = 3.125;
    self moveto(self.origin + (0, 0, 2500), movetime);
    wait movetime;
    _utilflare_flareexplode(flaretype);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cca
// Size: 0x73
function _utilflare_flareexplode(flaretype) {
    if (!isdefined(flaretype)) {
        flaretype = "<undefined>";
    }
    self setscriptablepartstate("travel", "off", 0);
    if (!_utilflare_isvalidflaretype(flaretype)) {
        assertmsg("util flared called with invalid flare type string '" + flaretype + "'");
        return;
    }
    fxstate = "start_" + flaretype;
    self setscriptablepartstate("explode", fxstate, 0);
    thread sfx_br_flare_phosphorus(flaretype);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d45
// Size: 0x75
function _utilflare_isvalidflaretype(flaretype) {
    var_3ba45e0e07877b7 = 0;
    if (isdefined(flaretype)) {
        switch (flaretype) {
        case #"hash_81d3708cb9f6fbd":
        case #"hash_3d59be23329d4272":
        case #"hash_46a03ade8d786057":
        case #"hash_b06d15a59bd8ea50":
        case #"hash_c03ed6f6f4fe9dad":
        case #"hash_f4a9126c03d3385b": 
            var_3ba45e0e07877b7 = 1;
            break;
        }
    }
    return var_3ba45e0e07877b7;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dc3
// Size: 0x158
function sfx_br_flare_phosphorus(flaretype) {
    self endon("death");
    level endon("game_ended");
    var_779efa68800909d1 = isdefined(flaretype) && self getscriptableparthasstate("phosphorus", "start_" + flaretype) ? "start_" + flaretype : "start";
    var_7593f454aad2cf18 = isdefined(flaretype) && self getscriptableparthasstate("phosphorus_loop", "start_" + flaretype) ? "start_" + flaretype : "start";
    var_c18aafa4107a3316 = isdefined(flaretype) && self getscriptableparthasstate("phosphorus", "end_" + flaretype) ? "end_" + flaretype : "end";
    self setscriptablepartstate("phosphorus", var_779efa68800909d1, 0);
    wait 0.3;
    self setscriptablepartstate("phosphorus_loop", var_7593f454aad2cf18, 0);
    switch (flaretype) {
    case #"hash_46a03ade8d786057": 
        wait 40;
        break;
    case #"hash_f4a9126c03d3385b": 
        break;
    case #"hash_81d3708cb9f6fbd": 
        wait 2;
        break;
    default: 
        wait 12;
        break;
    }
    self setscriptablepartstate("phosphorus", var_c18aafa4107a3316, 0);
    wait 0.3;
    self setscriptablepartstate("phosphorus_loop", "off", 0);
    wait 5;
    self delete();
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f23
// Size: 0x5e
function questpointgetradius(point) {
    radius = 0;
    if (point.spawnflags & 4) {
        radius = 256;
    } else if (point.spawnflags & 2) {
        radius = 128;
    } else if (point.spawnflags & 1) {
        radius = 168;
    }
    return radius;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f8a
// Size: 0x1f
function function_99b5f579a15f808d(contractname) {
    return getscriptbundle(hashcat(%"hash_371be13214f11a56", contractname));
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fb2
// Size: 0x3b
function function_ea591c2a379e3424(category) {
    contractbundle = function_99b5f579a15f808d(category);
    contracttime = contractbundle.contracttime;
    if (!isdefined(contracttime)) {
        return 0;
    }
    return contracttime;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ff6
// Size: 0x48
function function_2a81be592adacdaa(contractref) {
    if (!isdefined(level.contractmanager) || !isdefined(level.contractmanager.var_766f9de01948c219)) {
        return undefined;
    }
    return level.contractmanager.var_766f9de01948c219[contractref];
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6047
// Size: 0x44
function function_5a15174d34f0670c(time, animbuffer) {
    if (!isdefined(animbuffer)) {
        animbuffer = 0;
    }
    totaltime = time + animbuffer;
    self.missiontime = gettime() + totaltime * 1000;
    function_51d3a2b4cde79545();
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6093
// Size: 0x2a
function function_5606274c76b4a2df(time) {
    self.missiontime += time * 1000;
    function_51d3a2b4cde79545();
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60c5
// Size: 0x70
function function_234c4428a084ca58(time) {
    if (self.missiontime - gettime() <= 1000) {
        return;
    }
    if (self.missiontime - gettime() - time * 1000 <= 0) {
        self.missiontime = gettime() + 1000;
    } else {
        self.missiontime -= time * 1000;
    }
    function_51d3a2b4cde79545();
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x613d
// Size: 0xb8
function function_51d3a2b4cde79545() {
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
    }
    contractdata = function_2a81be592adacdaa(self.category);
    updatefunc = contractdata.funcs["onTimerUpdate"];
    if (isdefined(updatefunc)) {
        [[ updatefunc ]]();
    }
    thread function_b58cd7d548d363b4();
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61fd
// Size: 0xab
function function_b58cd7d548d363b4() {
    self notify("updatecontractTimer");
    self endon("game_ended");
    self endon("updatecontractTimer");
    self endon("task_ended");
    waittime = (self.missiontime - gettime()) / 1000;
    if (waittime < 0) {
        self.missiontime = gettime() + 1000;
        waittime = (self.missiontime - gettime()) / 1000;
    }
    wait waittime;
    contractdata = function_2a81be592adacdaa(self.category);
    expiredfunc = contractdata.funcs["onTimerExpired"];
    if (isdefined(expiredfunc)) {
        [[ expiredfunc ]]();
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62b0
// Size: 0x13
function questrewardcirclepeek(team) {
    namespace_1a2fa2b6ae5d223c::function_647a8c40104e4866(team);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62cb
// Size: 0xdd
function function_496ed653faacacd2(rewardteam) {
    var_20bf70e9bc435ed5 = self;
    if (isdefined(var_20bf70e9bc435ed5) && player::isreallyalive(var_20bf70e9bc435ed5) && !var_20bf70e9bc435ed5 br_public::isplayeringulag()) {
        var_20bf70e9bc435ed5 br_pickups::forcegivesuper("super_supply_drop", 1, 0, 0, 0);
        return;
    }
    foreach (player in teams::getteamdata(rewardteam, "players")) {
        if (!isdefined(player)) {
            continue;
        }
        if (isdefined(var_20bf70e9bc435ed5) && player == var_20bf70e9bc435ed5) {
            continue;
        }
        if (!player::isreallyalive(player)) {
            continue;
        }
        if (player br_public::isplayeringulag()) {
            continue;
        }
        player br_pickups::forcegivesuper("super_supply_drop", 1, 0, 0, 0);
        break;
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63b0
// Size: 0x29
function function_9b6275085fbcb8f4(time) {
    if (br_gametypes::isbrgametypefuncdefined("contractTimeModify")) {
        time = br_gametypes::runbrgametypefunc("contractTimeModify", self, time);
    }
    return time;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63e2
// Size: 0x29
function function_f69c3e487b364f2f(time) {
    if (br_gametypes::isbrgametypefuncdefined("contractTimeAddModify")) {
        time = br_gametypes::runbrgametypefunc("contractTimeAddModify", self, time);
    }
    return time;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6414
// Size: 0x35
function getquestrewardtier(team) {
    tier = level.contractmanager.tiers[team];
    if (!isdefined(tier)) {
        tier = 1;
    }
    return tier;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6452
// Size: 0x40
function setquestrewardtier(team, tier) {
    if (isdefined(level.contractmanager)) {
        level.contractmanager.tiers[team] = tier;
    }
    setquestrewardtierteamomnvar(team, tier);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x649a
// Size: 0x24
function addquestrewardtier(team, value) {
    setquestrewardtier(team, getquestrewardtier(team) + value);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x64c6
// Size: 0x25
function addquestrewardtierframeend(team, value) {
    waittillframeend();
    setquestrewardtier(team, getquestrewardtier(team) + value);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64f3
// Size: 0xd2
function function_473ab9452660e60f(ref) {
    index = getquesttableindex(ref);
    foreach (team in self.teams) {
        players = teams::getteamdata(team, "players");
        foreach (player in players) {
            player setquestindexomnvar(index);
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65cd
// Size: 0x6c
function setquestindexteamomnvar(team, questindex) {
    foreach (player in teams::getteamdata(team, "players")) {
        player setquestindexomnvar(questindex);
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6641
// Size: 0x18
function setquestindexomnvar(questindex) {
    self setclientomnvar("ui_br_objective_index", questindex);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6661
// Size: 0x6c
function setquestrewardtierteamomnvar(team, tier) {
    foreach (player in teams::getteamdata(team, "players")) {
        player setquestrewardtieromnvar(tier);
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66d5
// Size: 0x18
function setquestrewardtieromnvar(tier) {
    self setclientomnvar("ui_br_objective_reward_tier", tier);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66f5
// Size: 0x6f
function function_19582ba0dbcc0ab0(targetplayer, threatlevel) {
    if (isdefined(self.aq_targethudenabled) && self.aq_targethudenabled && isdefined(targetplayer)) {
        entitynumber = targetplayer getentitynumber();
    } else {
        entitynumber = -1;
    }
    entitynumber += 1;
    value = threatlevel << 8 | entitynumber;
    self setclientomnvar("ui_br_assassination_target", value);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x676c
// Size: 0xfe
function function_ab19a58fc4be9ce2() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    if (!level.contractmanager.var_2bdaf97f6bfeab76 || isbot(player)) {
        return;
    }
    scripts\mp\flags::gameflagwait("infil_animatic_complete");
    while (level.contractmanager.activetablets.size > 0) {
        notification, var_db3ef040d8f07322 = player waittill("calloutmarkerping_notifyhandled");
        if (notification != "custom_loot_card_update") {
            continue;
        }
        assert(isdefined(var_db3ef040d8f07322));
        if (!var_db3ef040d8f07322 || !istrue(player.canhackcontracts) || !isreallyalive(player)) {
            continue;
        }
        closestphone = function_c1ac85f526f2b937(level.contractmanager.activetablets, player.origin, 400);
        if (isdefined(closestphone)) {
            namespace_735f8af4d2aa34fb::function_4f6916c4e48cc55(closestphone, player);
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6872
// Size: 0x100
function private function_2651277c09935bde(mindistancesq) {
    level endon("game_ended");
    level waittill("infils_ready");
    foreach (phone in level.contractmanager.activetablets) {
        foreach (otherphone in level.contractmanager.activetablets) {
            if (phone == otherphone) {
                continue;
            }
            if (distancesquared(phone.origin, otherphone.origin) <= mindistancesq) {
                println("<dev string:x38>");
            }
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x697a
// Size: 0x38b
function function_6bdc6f56944dc3aa(player, oldteam, newteam) {
    foreach (task in level.contractmanager.currenttasks) {
        if (task.type.ref == "assassination") {
            if (task.targetplayer == player) {
                if (isdefined(task.type.funcs["onTargetAssimilated"])) {
                    task [[ task.type.funcs["onTargetAssimilated"] ]](player, oldteam, newteam);
                }
                continue;
            }
            if (task.targetplayer.team == oldteam) {
                if (isdefined(task.type.funcs["onTargetTeamTearDown"])) {
                    task [[ task.type.funcs["onTargetTeamTearDown"] ]](player, oldteam, newteam);
                }
                continue;
            }
            if (task.targetplayer.team == newteam) {
                if (isdefined(task.type.funcs["onTargetTeamAssimilated"])) {
                    task [[ task.type.funcs["onTargetTeamAssimilated"] ]](player, oldteam, newteam);
                }
            }
        }
    }
    if (isdefined(level.contractmanager.var_b6fae9c9655c73bf[oldteam])) {
        if (isdefined(level.contractmanager.var_b6fae9c9655c73bf[oldteam].type.funcs["onPlayerTearDown"])) {
            foreach (task in level.contractmanager.currenttasks) {
                if (level.contractmanager.var_b6fae9c9655c73bf[oldteam].teams[0] == task.teams[0]) {
                    task [[ task.type.funcs["onPlayerTearDown"] ]](player, oldteam, newteam);
                }
            }
        }
    }
    if (isdefined(level.contractmanager.var_b6fae9c9655c73bf[newteam])) {
        if (isdefined(level.contractmanager.var_b6fae9c9655c73bf[newteam].type.funcs["onPlayerAssimilated"])) {
            foreach (task in level.contractmanager.currenttasks) {
                if (level.contractmanager.var_b6fae9c9655c73bf[newteam].teams[0] == task.teams[0]) {
                    task thread function_17d78a198feb85d5(player, oldteam, newteam);
                }
            }
        }
    }
    namespace_1a2fa2b6ae5d223c::function_b8022b0e5e976f66(oldteam, newteam);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d0d
// Size: 0x4a
function function_17d78a198feb85d5(player, oldteam, newteam) {
    level endon("game_ended");
    self endon("task_ended");
    waitframe();
    self [[ self.type.funcs["onPlayerAssimilated"] ]](player, oldteam, newteam);
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d5f
// Size: 0x9e
function function_8a25384bacdd7b79(newtablet, lootref) {
    if (!isdefined(level.contractmanager.contractdata)) {
        return;
    }
    foreach (data in level.contractmanager.contractdata) {
        if (data.lootref == lootref) {
            newtablet tabletinit(data);
            break;
        }
    }
}

/#

    // Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6e05
    // Size: 0x4e2
    function function_870ec8b83fc533fd() {
        level endon("<dev string:xd7>");
        while (true) {
            foreach (data in level.contractmanager.contractdata) {
                ref = data.ref;
                dvar = hashcat(@"hash_1fbd753c98c4b8b4", ref);
                if (getdvarint(dvar, 0)) {
                    setdvar(dvar, 0);
                    foreach (tablet in level.contractmanager.activetablets) {
                        if (tablet.type == data.lootref) {
                            level.players[0] function_bb413728bc5231d0(tablet);
                            break;
                        }
                    }
                }
                dvar = @"hash_79cdeeba217bc3d8";
                if (getdvarint(dvar, 0)) {
                    setdvar(dvar, 0);
                    task = level.contractmanager.var_b6fae9c9655c73bf[level.players[0].team];
                    task endcontract(task.teams[0]);
                }
                dvar = @"hash_99194b03dd977e5";
                if (getdvarint(dvar, 0)) {
                    setdvar(dvar, 0);
                    task = level.contractmanager.var_b6fae9c9655c73bf[level.players[0].team];
                    task endcontract(undefined);
                }
                dvar = hashcat(@"hash_8f2895efe9ecd943", ref);
                if (getdvarint(dvar, 0)) {
                    setdvar(dvar, 0);
                    tablet = spawnscriptable(data.lootref, level.players[0].origin);
                    br_pickups::registerscriptableinstance(tablet);
                    tablet tabletinit(data);
                    tablet tabletshow();
                }
                dvar = hashcat(@"hash_511c5d962c539aa8", ref);
                if (getdvarint(dvar, 0)) {
                    setdvar(dvar, 0);
                    foreach (teamdata in level.teamdata) {
                        if (istrue(teamdata["<dev string:xe2>"].size > 0)) {
                            if (teamdata["<dev string:xe2>"][0].team != level.players[0].team) {
                                function_22671614e8f79513(teamdata["<dev string:xe2>"][0], ref);
                            }
                        }
                    }
                }
                dvar = hashcat(@"hash_7b9d7f89b65a3054", ref);
                if (getdvarint(dvar, 0)) {
                    setdvar(dvar, 0);
                    foreach (teamdata in level.teamdata) {
                        if (istrue(teamdata["<dev string:xe2>"].size > 0)) {
                            if (isdefined(level.contractmanager) && isdefined(level.contractmanager.var_b6fae9c9655c73bf)) {
                                if (isdefined(level.contractmanager.var_b6fae9c9655c73bf[teamdata["<dev string:xe2>"][0].team])) {
                                    continue;
                                }
                            }
                            if (teamdata["<dev string:xe2>"][0].team != level.players[0].team) {
                                function_22671614e8f79513(teamdata["<dev string:xe2>"][0], ref);
                                break;
                            }
                        }
                    }
                }
            }
            var_6be853beafdcc6f2 = getdvarint(@"hash_86d0a6d671419333", 0);
            if (var_6be853beafdcc6f2 > 0) {
                setdvar(@"hash_86d0a6d671419333", 0);
                var_6be853beafdcc6f2 = min(var_6be853beafdcc6f2, level.contractmanager.activetablets.size);
                foreach (tablet in level.contractmanager.activetablets) {
                    tablet tablethide();
                    var_6be853beafdcc6f2 -= 1;
                    if (var_6be853beafdcc6f2 <= 0) {
                        break;
                    }
                }
            }
            wait 0.5;
        }
    }

    // Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x72ef
    // Size: 0x170
    function function_22671614e8f79513(player, contractref) {
        if (!isdefined(player.team) || !isdefined(level.contractmanager.contractdata) || !isdefined(level.contractmanager.var_766f9de01948c219[contractref])) {
            return;
        }
        newtablet = undefined;
        foreach (data in level.contractmanager.contractdata) {
            ref = data.ref;
            if (ref == contractref) {
                newtablet = spawnscriptable(data.lootref, (0, 0, 0), (0, 0, 0));
                br_pickups::registerscriptableinstance(newtablet);
                newtablet tabletinit(data);
                break;
            }
        }
        if (!isdefined(newtablet)) {
            return;
        }
        newtablet.task function_8ad1b4ddc1fd852a(player.team, player);
        newtablet.task [[ level.contractmanager.var_766f9de01948c219[contractref].funcs["<dev string:xef>"] ]]();
    }

#/

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7467
// Size: 0x18
function filtercondition_isdead(player) {
    if (!isalive(player)) {
        return false;
    }
    return true;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7488
// Size: 0x19
function filtercondition_ingulag(player) {
    if (player br_public::isplayerinorgoingtogulag()) {
        return false;
    }
    return true;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74aa
// Size: 0x84
function function_eb0a92e43754af9f(team) {
    validplayers = [];
    foreach (player in teams::getteamdata(team, "players")) {
        if (!player br_public::isplayerinorgoingtogulag() && player::isreallyalive(player)) {
            validplayers[validplayers.size] = player;
        }
    }
    return validplayers;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7537
// Size: 0x294
function function_581c09aed5aa4ed7(team) {
    var_f67f078b2693e6c8 = getdvarint(@"hash_9d25d6735879edd5", 1);
    var_e2fcc37fccc34974 = getdvarint(@"hash_896b3c10c7a229fa", 1);
    var_ddb222c7faf5ab50 = getdvarint(@"hash_6d95fadfacaba24f", 60);
    if (!isdefined(level.teamdata[team]["currentContractCancels"])) {
        level.teamdata[team]["currentContractCancels"] = 0;
    }
    if (var_f67f078b2693e6c8 > 0) {
        if (level.teamdata[team]["currentContractCancels"] == var_f67f078b2693e6c8 - 1 && var_e2fcc37fccc34974) {
            level.teamdata[team]["cancelDelayTime"] = gettime() + var_ddb222c7faf5ab50 * 1000;
            level.teamdata[team]["currentContractCancels"]++;
            return true;
        } else if (level.teamdata[team]["currentContractCancels"] >= var_f67f078b2693e6c8) {
            if (var_e2fcc37fccc34974) {
                if (gettime() < level.teamdata[team]["cancelDelayTime"]) {
                    self.var_972eddbdcf30619c = [];
                    playersonteam = function_eb0a92e43754af9f(team);
                    foreach (player in playersonteam) {
                        n = (level.teamdata[team]["cancelDelayTime"] - gettime()) / 1000;
                        n = int(max(0, ceil(n)));
                        player hud_message::showerrormessage(level.contractmanager.var_5c6031bde94872a7, n);
                    }
                    return false;
                }
                level.teamdata[team]["cancelDelayTime"] = gettime() + var_ddb222c7faf5ab50 * 1000;
                level.teamdata[team]["currentContractCancels"]++;
                return true;
            } else {
                self.var_972eddbdcf30619c = [];
                playersonteam = function_eb0a92e43754af9f(team);
                foreach (player in playersonteam) {
                    player hud_message::showerrormessage(level.contractmanager.cancelmessage);
                }
                return false;
            }
        }
    }
    level.teamdata[team]["currentContractCancels"]++;
    return true;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77d4
// Size: 0x47
function function_31378ee55a2fb527(team) {
    if (isdefined(self.type.funcs["onCancel"])) {
        self thread [[ self.type.funcs["onCancel"] ]](team);
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7823
// Size: 0x9c
function function_c142d6b260f19ee7(team) {
    if (!isdefined(self.var_972eddbdcf30619c)) {
        self.var_972eddbdcf30619c = [];
    }
    numplayers = 0;
    playersonteam = function_eb0a92e43754af9f(team);
    foreach (player in playersonteam) {
        if (utility::array_contains(self.var_972eddbdcf30619c, player)) {
            numplayers++;
        }
    }
    return numplayers;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78c8
// Size: 0xef
function function_1d3d389050ddce74(team) {
    if (!isdefined(self.var_972eddbdcf30619c)) {
        self.var_972eddbdcf30619c = [];
    }
    playersonteam = function_eb0a92e43754af9f(team);
    if (function_c142d6b260f19ee7(team) == playersonteam.size && function_581c09aed5aa4ed7(team)) {
        level thread overlord::function_9793a81bc3bc19e9("mission_cancel_complete", team, 1);
        function_31378ee55a2fb527(team);
        foreach (player in playersonteam) {
            player setclientomnvar("ui_br_contract_cancellation_state", 0);
        }
        level thread br_public::brleaderdialogteam("mission_gen_fail", team, 1, 2);
        displayteamsplash(team, "br_contract_cancelled_" + self.type.ref);
        return true;
    }
    return false;
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79c0
// Size: 0x24f
function function_db96249c7bfdec0b() {
    if (isdefined(self) && isdefined(self.team) && function_7094c7010c5e3827(self.team)) {
        contract = function_22239d4cff05d0a1(self.team);
        if (!isdefined(contract)) {
            assertmsg("contract team has a mission that returned true but the task is undefined!");
            return;
        }
        if (!isdefined(contract.type.funcs["onCancel"])) {
            assertmsg("contract team has a mission that does not have a cancel function!");
            return;
        }
        if (!isdefined(contract.var_972eddbdcf30619c)) {
            contract.var_972eddbdcf30619c = [];
        }
        if (utility::array_contains(contract.var_972eddbdcf30619c, self)) {
            contract function_1d3d389050ddce74(self.team);
            return;
        }
        contract.var_972eddbdcf30619c[contract.var_972eddbdcf30619c.size] = self;
        if (!contract function_1d3d389050ddce74(self.team)) {
            squadmates = function_eb0a92e43754af9f(self.team);
            overlord::playevent("mission_cancel_request", utility::array_remove_array(squadmates, contract.var_972eddbdcf30619c));
            var_7aa06be6f06bef26 = contract function_c142d6b260f19ee7(self.team);
            totalplayers = squadmates.size;
            combineddata = var_7aa06be6f06bef26 | totalplayers << 3;
            foreach (player in squadmates) {
                player setclientomnvar("ui_br_contract_cancellation_state", combineddata);
            }
            if (contract.var_972eddbdcf30619c.size > 0) {
                foreach (player in squadmates) {
                    if (!utility::array_contains(contract.var_972eddbdcf30619c, player)) {
                        displayplayersplash(player, "br_" + contract.type.ref + "_quest_pending");
                    }
                }
            }
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c17
// Size: 0x189
function function_1e64ea5eb68d8119() {
    if (isdefined(self) && isdefined(self.team) && function_7094c7010c5e3827(self.team)) {
        contract = function_22239d4cff05d0a1(self.team);
        squadmates = function_eb0a92e43754af9f(self.team);
        if (!isdefined(contract)) {
            assertmsg("contract team has a mission that returned true but the task is undefined!");
            return;
        }
        if (!isdefined(contract.var_972eddbdcf30619c)) {
            return;
        }
        if (utility::array_contains(contract.var_972eddbdcf30619c, self)) {
            if (br_public::isplayerinorgoingtogulag() || !player::isreallyalive(self)) {
                contract.var_972eddbdcf30619c = utility::array_remove(contract.var_972eddbdcf30619c, self);
            }
        }
        if (!contract function_1d3d389050ddce74(self.team)) {
            overlord::playevent("mission_cancel_request", utility::array_remove_array(squadmates, contract.var_972eddbdcf30619c));
            var_7aa06be6f06bef26 = contract function_c142d6b260f19ee7(self.team);
            totalplayers = squadmates.size;
            combineddata = var_7aa06be6f06bef26 | totalplayers << 3;
            foreach (player in squadmates) {
                player setclientomnvar("ui_br_contract_cancellation_state", combineddata);
            }
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7da8
// Size: 0x37
function function_7871e27c25160f63(notification, value) {
    if (isdefined(notification)) {
        switch (notification) {
        case #"hash_9fd64c8b171158f": 
            function_db96249c7bfdec0b();
            break;
        }
    }
}

// Namespace namespace_c133516bfc1d803c / namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7de7
// Size: 0x44
function private function_60094dbeee6e39b0(tabletorigin) {
    isunderwater = 0;
    waterheightz = function_b81e710fd636efab(tabletorigin);
    if (isdefined(waterheightz)) {
        diffz = tabletorigin[2] - waterheightz;
        isunderwater = diffz < 0;
    }
    return isunderwater;
}

