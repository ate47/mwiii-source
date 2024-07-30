#using scripts\engine\utility.gsc;
#using scripts\engine\dev.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\carriable.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\calloutmarkerping_mp.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_263974019a8ba3fa;
#using scripts\mp\gametypes\br_keypad_util.gsc;
#using script_fea74ca25a69884;
#using scripts\mp\gametypes\br_vehicles.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_multi_circle.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\gametypes\br_helicopters.gsc;
#using scripts\mp\gametypes\br_rewards.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\gametypes\br_callouts.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using script_b7a9ce0a2282b79;
#using script_6893a0a79807f057;
#using script_64acb6ce534155b7;
#using scripts\mp\gamescore.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_728ffcee8cbf30ee;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_303fd53078a244f1;
#using scripts\mp\class.gsc;
#using script_600b944a95c3a7bf;
#using script_7c40fa80892a721;
#using scripts\mp\menus.gsc;
#using script_744cad313ed0a87e;
#using scripts\mp\agents\agent_utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\mp\gametypes\br_dev.gsc;
#using script_55e418c5cc946593;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\killstreaks\airstrike.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\common\callbacks.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using script_6775ad452d13858;
#using script_188008b85f8b14d4;

#namespace br_dev;

// Namespace br_dev / scripts\mp\gametypes\br_dev
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c3
// Size: 0x40
function init() {
    /#
        registerhandlecommand(&function_c96d7535862e245c);
        level thread function_7c57dd42429eb995();
        level thread function_fe99ab4dc900865e();
        thread commandwatcher(@"hash_97cda940cb7bd182", &handlecommand);
    #/
    namespace_ed19ace3eeb2e4::init();
}

// Namespace br_dev / scripts\mp\gametypes\br_dev
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b
// Size: 0xbf
function commandwatcher(dvarname, var_d4bb121b87421c8) {
    level notify("commandWatcher_" + function_f28fd66285fa2c9(dvarname));
    level endon("commandWatcher_" + function_f28fd66285fa2c9(dvarname));
    setdvar(dvarname, "");
    while (true) {
        waitframe();
        dvarvalue = getdvar(dvarname);
        if (dvarvalue == "") {
            continue;
        }
        setdvar(dvarname, "");
        tokens = strtok(dvarvalue, " ");
        if (!isdefined(tokens) || tokens.size < 1) {
            continue;
        }
        command = tokens[0];
        arglist = array_slice(tokens, 1);
        [[ var_d4bb121b87421c8 ]](command, arglist);
    }
}

// Namespace br_dev / scripts\mp\gametypes\br_dev
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2
// Size: 0x74
function handlecommand(command, args) {
    if (!isdefined(level.handlecommandfuncs)) {
        return;
    }
    foreach (func in level.handlecommandfuncs) {
        [[ func ]](command, args);
    }
}

// Namespace br_dev / scripts\mp\gametypes\br_dev
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44e
// Size: 0x38
function registerhandlecommand(func) {
    if (!isdefined(level.handlecommandfuncs)) {
        level.handlecommandfuncs = [];
    }
    level.handlecommandfuncs[level.handlecommandfuncs.size] = func;
}

/#

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x48e
    // Size: 0x77
    function function_6a7b9641a3a20e1f(command, args) {
        if (!isdefined(level.var_e06803212476eb2a)) {
            return;
        }
        foreach (func in level.var_e06803212476eb2a) {
            [[ func ]](command, args);
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x50d
    // Size: 0x3d3e
    function function_c96d7535862e245c(command, args) {
        firstplayer = level.players[0];
        if (!isdefined(firstplayer)) {
            return;
        }
        switch (command) {
        case #"hash_2546668b41b70df2": 
            if (args.size < 1) {
                iprintlnbold("<dev string:x26>");
                break;
            }
            defname = args[0];
            if (!isscriptabledefined(defname)) {
                iprintlnbold("<dev string:x42>");
                break;
            }
            function_4d1c100badcf41a8(firstplayer, defname);
            break;
        case #"hash_fa47ccf6bd7c59c1": 
            scripts\mp\gametypes\br_vehicles::brvehiclesreset();
            break;
        case #"hash_fa11c2f6bd5168fc": 
            resetglass();
            break;
        case #"hash_fa37ccf6bd6f8dce": 
            if (args.size < 1) {
                iprintlnbold("<dev string:x5e>");
            }
            victimname = args[0];
            attackername = args[1];
            function_5b5ab8ab53c49d4d(victimname, attackername);
            break;
        case #"hash_fa34c6f6bd6d45c5": 
            if (args.size < 2) {
                iprintlnbold("<dev string:x7f>");
            }
            var_6cca86b6634aa67e = args[0];
            victimname = args[1];
            attackername = args[2];
            function_53a0f5e4d6bbc7a4(victimname, attackername, var_6cca86b6634aa67e);
            break;
        case #"hash_30b20a099c3735ec": 
            if (args.size < 1) {
                iprintlnbold("<dev string:xab>");
            }
            playername = args[0];
            function_72c1806e62a9bd10(playername);
            break;
        case #"hash_543cf0bb67313e3a": 
            if (args.size < 1) {
                iprintlnbold("<dev string:xcf>");
            }
            playername = args[0];
            function_72c1806e62a9bd10(playername, 1);
            break;
        case #"hash_425434cf8e59e2f1": 
            level thread function_2729e9ab8a4ec44e();
            break;
        case #"hash_d7404b430bfb6e59": 
            firstplayer thread scripts\mp\hud_message::showsplash("<dev string:x101>");
            break;
        case #"hash_4c34e58a34face70": 
            level thread function_9bb9422480e6aa6d();
            break;
        case #"hash_6201f99dbadb9e66": 
            if (args.size < 1) {
                iprintlnbold("<dev string:x11d>");
            }
            winningteam = args[0];
            function_429110eb5af4a19c();
            if (isdefined(level.teamswithplayers) && array_contains(level.teamswithplayers, winningteam)) {
                level thread function_c3b8a31470635593(winningteam);
            }
            break;
        case #"hash_9a4940566b4804d1": 
            firstplayer scripts\mp\gametypes\br_pickups::droponplayerdeath();
            break;
        case #"hash_59a2b6aee1837a39": 
            setomnvar("<dev string:x14c>", 1);
            wait 5;
            setomnvar("<dev string:x14c>", -1);
            break;
        case #"hash_65f1ac7ad95daf95": 
            firstplayer scripts\mp\gametypes\br_pickups::function_874048c58e96731();
            break;
        case #"hash_23b3bc8a2f9265f7": 
            if (args.size < 3) {
                iprintlnbold("<dev string:x169>");
            }
            playeridx = int(args[0]);
            foreach (candidate in level.players) {
                if (playeridx == candidate getentitynumber()) {
                    candidate scripts\mp\gametypes\br_public::updatebrscoreboardstat(args[1], int(args[2]));
                    break;
                }
            }
            break;
        case #"hash_ec91a685aa7f22c0": 
            bunkeridx = int(args[0]);
            firstplayer thread function_9cbddfdef8f1125b(bunkeridx);
            break;
        case #"hash_fe9c87c407e02cfd": 
            if (args.size > 0) {
                minradius = undefined;
                bdistance2d = undefined;
                maxradius = float(args[0]);
                if (args.size > 1) {
                    minradius = float(args[1]);
                    if (args.size > 2) {
                        bdistance2d = int(args[2]) != 0;
                        points = getunusedlootcachepoints(firstplayer.origin, maxradius, minradius, bdistance2d);
                    } else {
                        points = getunusedlootcachepoints(firstplayer.origin, maxradius, minradius);
                    }
                } else {
                    points = getunusedlootcachepoints(firstplayer.origin, maxradius);
                }
            } else {
                points = getunusedlootcachepoints();
            }
            foreach (point in points) {
                debugstar(point.origin, (1, 0, 1), 100);
            }
            break;
        case #"hash_3622bda090e50ce6": 
            if (args.size < 1) {
                iprintlnbold("<dev string:x1a8>");
                return;
            }
            pointtype = int(args[0]);
            origin = undefined;
            maxradius = undefined;
            minradius = undefined;
            bdistance2d = undefined;
            if (args.size > 1) {
                origin = firstplayer.origin;
                maxradius = float(args[1]);
                if (args.size > 2) {
                    minradius = float(args[2]);
                    if (args.size > 3) {
                        bdistance2d = int(args[3]) != 0;
                        points = getquestpoints(pointtype, origin, maxradius, minradius, bdistance2d);
                    } else {
                        points = getquestpoints(pointtype, origin, maxradius, minradius);
                    }
                } else {
                    points = getquestpoints(pointtype, origin, maxradius);
                }
            } else {
                points = getquestpoints(pointtype);
            }
            foreach (point in points) {
                debugstar(point.origin, (0, 1, 1), 100);
            }
            break;
        case #"hash_f458016c03940942": 
            if (args.size < 1) {
                iprintlnbold("<dev string:x1e6>");
                return;
            }
            pointindex = int(args[0]);
            disablelootspawnpoint(pointindex);
            break;
        case #"hash_31f1df2db98384de": 
            if (args.size < 4) {
                iprintlnbold("<dev string:x20b>");
            }
            testloc = (float(args[0]), float(args[1]), float(args[2]));
            yaw = float(args[3]);
            firstplayer notify("<dev string:x23a>", testloc, yaw);
            break;
        case #"hash_6d84033b4c81f07": 
            level thread scripts\mp\gametypes\br::brclosealldoors();
            break;
        case #"hash_22cf50efb1690259": 
            level thread scripts\mp\gametypes\br_circle::function_9eb173d6a8fed181();
            break;
        case #"hash_b4f4ef49f66ee87e": 
            exclusion_zones::function_afa41ee45eb3172f();
            break;
        case #"hash_94c57f2ff385d10c": 
            exclusion_zones::function_7176642fe2ed10cd(0);
            break;
        case #"hash_88184c9f0929a28e": 
            exclusion_zones::function_7176642fe2ed10cd(1);
            break;
        case #"hash_f9203276319358ff": 
            exclusion_zones::function_14767b88f55e26e0();
            break;
        case #"hash_66f6a40540298feb": 
            if (args.size < 1) {
                iprintlnbold("<dev string:x29c>");
                break;
            }
            circle = int(args[0]);
            level thread scripts\mp\gametypes\br_multi_circle::function_5d9c9221653df2f3(circle);
            break;
        case #"hash_35d376d7e454979a": 
            level thread scripts\mp\gametypes\br_multi_circle::function_154cd3a077d16782();
            break;
        case #"hash_6a1fabe3febface6": 
            level thread scripts\mp\gametypes\br_circle::function_46097952cff4dc2e();
            break;
        case #"hash_286b6adaa1a6599": 
            level thread scripts\mp\gametypes\br_circle::function_e5958529715b6395();
            break;
        case #"hash_89b2c6b04528a2a": 
            level thread scripts\mp\gametypes\br_circle::function_6a6e7f489e42bcda();
            break;
        case #"hash_f968160ea226d84e": 
            level thread scripts\mp\gametypes\br_multi_circle::function_cdabf323178aabc6();
            break;
        case #"hash_399f8b169219d209": 
            level thread scripts\mp\gametypes\br_multi_circle::function_295e765fd8265c81();
            break;
        case #"hash_f484096c03b6a81c": 
            points = args[0];
            if (isdefined(points)) {
                points = float(points);
            }
            areacount = args[1];
            if (isdefined(areacount)) {
                areacount = int(areacount);
            }
            circleindex = args[2];
            if (isdefined(circleindex)) {
                circleindex = int(circleindex);
            }
            level thread scripts\mp\gametypes\br_circle::function_907a72325980713f(points, areacount, circleindex);
            break;
        case #"hash_fa53d3f6bd855f22": 
            scripts\mp\gametypes\br_circle::applycirclesettings();
            level thread scripts\mp\gametypes\br_multi_circle::function_f92da29572a7dc78();
            level thread scripts\mp\gametypes\br_circle::_precalcsafecirclecenters();
            level thread scripts\mp\gametypes\br_multi_circle::function_e71987651701448a();
            break;
        case #"hash_1a92216c17e9696e": 
            if (isdefined(level.player)) {
                scripts\mp\gametypes\br_circle::applycirclesettings();
                level thread scripts\mp\gametypes\br_multi_circle::function_f92da29572a7dc78();
                level thread scripts\mp\gametypes\br_circle::_precalcsafecirclecenters(level.player.origin);
                level thread scripts\mp\gametypes\br_multi_circle::function_e71987651701448a();
            }
            break;
        case #"hash_3671f92e8779a2d": 
            namespace_bbc79db4c3949a5c::savecircles();
            break;
        case #"hash_b15d9bc5054a8bdc": 
            namespace_bbc79db4c3949a5c::function_d12a7c7251710cbf();
            break;
        case #"hash_e6cefeebcbd5658d": 
            level thread scripts\mp\gametypes\br_circle::function_184d1e23ec969c18(10);
            break;
        case #"hash_f4a2ff6c03ce9d44": 
            if (isdefined(level.player)) {
                if (isdefined(level.var_2bec641aeb4e5980)) {
                    foreach (index in level.var_2bec641aeb4e5980) {
                        scripts\mp\objidpoolmanager::returnobjectiveid(index);
                    }
                    level.var_2bec641aeb4e5980 = undefined;
                } else {
                    foreground = args[0];
                    if (!isdefined(foreground)) {
                        foreground = "<dev string:x352>";
                    }
                    var_48094c816bbd08e0 = 6;
                    level.var_2bec641aeb4e5980 = [];
                    for (i = 0; i < var_48094c816bbd08e0; i++) {
                        objectiveiconid = scripts\mp\objidpoolmanager::requestobjectiveid(1);
                        if (objectiveiconid != -1) {
                            level.var_2bec641aeb4e5980[level.var_2bec641aeb4e5980.size] = objectiveiconid;
                            origin = level.player.origin + (1, i - int(var_48094c816bbd08e0 / 2), 0) * 400;
                            scripts\mp\objidpoolmanager::objective_add_objective(objectiveiconid, "<dev string:x373>", origin, foreground);
                            scripts\mp\objidpoolmanager::update_objective_setbackground(objectiveiconid, i);
                        }
                    }
                }
            }
            break;
        case #"hash_81ebf88ef0730994": 
            player = level.players[0];
            player.var_859654e0445a36d9 = !istrue(player.var_859654e0445a36d9);
            break;
        case #"hash_13432d1b64f9f725": 
            scripts\mp\gametypes\br_pickups::spawndebugpickupfromdevgui(args[0]);
            break;
        case #"hash_88aa1ef1a7274457": 
            scripts\mp\gametypes\br_pickups::spawndebugpickupfromdevgui(args[0], 0, args[1]);
            break;
        case #"hash_6f2d097b3165fadb": 
            scripts\mp\gametypes\br_pickups::spawndebugpickupfromdevgui(args[0], 1);
            break;
        case #"hash_d156118a517dec2e": 
            scripts\mp\gametypes\br_pickups::function_c87696a022a2c6fc();
            break;
        case #"hash_f50dad861a606d48": 
            scripts\mp\gametypes\br_pickups::function_c87696a022a2c6fc(1);
            break;
        case #"hash_d50c079dfca42a66": 
            scripts\mp\gametypes\br_pickups::function_510f82785bd2c148();
            break;
        case #"hash_ce57e2eaa93aa441": 
            scripts\mp\gametypes\br_pickups::function_b158d838449b637e(args[0]);
            break;
        case #"hash_91bce2b64809c686": 
            scripts\mp\gametypes\br_pickups::function_e2d83df8b282b199(args[0]);
            break;
        case #"hash_c715dc4c34c07470": 
            for (index = 0; index < 20; index++) {
                scripts\mp\gametypes\br_pickups::spawndebugpickupfromdevgui(args[0]);
                wait 0.3;
            }
            break;
        case #"hash_bb2e498025a5100": 
            foreach (player in level.players) {
                player thread scripts\mp\gametypes\br_pickups::function_849640d4a4d5ae98();
            }
            break;
        case #"hash_ee0dc7e8340124b0": 
            itemslotindex = int(args[0]);
            foreach (player in level.players) {
                player thread scripts\mp\gametypes\br_pickups::quickdropitem(itemslotindex);
            }
            break;
        case #"hash_55977e57b7d74172": 
            host = scripts\mp\gamelogic::gethostplayer();
            if (isdefined(host)) {
                cachetype = int(args[0]);
                scripts\mp\gametypes\br_lootcache::spawnlootcache(host.origin, host.angles, cachetype);
            }
            break;
        case #"hash_543d105aa3e01d5f": 
            host = scripts\mp\gamelogic::gethostplayer();
            if (isdefined(host)) {
                spawnorigin = host.origin + anglestoforward(host.angles) * 100 + (0, 0, 10);
                if (issharedfuncdefined("<dev string:x486>", "<dev string:x498>")) {
                    [[ getsharedfunc("<dev string:x486>", "<dev string:x498>") ]](spawnorigin, host.angles);
                }
            }
            break;
        case #"hash_3fd5c20ad5fdf076": 
            host = scripts\mp\gamelogic::gethostplayer();
            if (isdefined(host)) {
                if (issharedfuncdefined("<dev string:x4c0>", "<dev string:x4d7>")) {
                    spawnorigin = host.origin + anglestoforward(host.angles) * 100 + (0, 0, 10);
                    level thread [[ getsharedfunc("<dev string:x4c0>", "<dev string:x4d7>") ]](spawnorigin, host.angles);
                }
            }
            break;
        case #"hash_21d7c416f08db3ca": 
            if (issharedfuncdefined("<dev string:x50e>", "<dev string:x519>")) {
                level thread [[ getsharedfunc("<dev string:x50e>", "<dev string:x519>") ]](8, int(args[0]));
            }
            break;
        case #"hash_4a7dcc9be6321a31": 
            if (issharedfuncdefined("<dev string:x50e>", "<dev string:x519>")) {
                level thread [[ getsharedfunc("<dev string:x50e>", "<dev string:x519>") ]](int(args[0]));
            }
            break;
        case #"hash_e67849f9be3e5694": 
            if (issharedfuncdefined("<dev string:x50e>", "<dev string:x571>")) {
                level thread [[ getsharedfunc("<dev string:x50e>", "<dev string:x571>") ]]();
            }
            break;
        case #"hash_f4bfffd3aac18802": 
            scripts\mp\gametypes\br_helicopters::forceejectall();
            break;
        case #"hash_e13779c2ed7bb949": 
            foreach (player in level.players) {
                player thread scripts\mp\gametypes\br_rewards::function_efb496dab102df58();
                break;
            }
            break;
        case #"hash_fa8ca7ecbb266177": 
            level thread scripts\mp\gametypes\br_rewards::precomputedropbagpositions(0);
            break;
        case #"hash_7c2b8c824464365d": 
            foreach (player in level.players) {
                player setorigin((0, 0, 24000));
                player thread scripts\cp_mp\parachute::startfreefall(5, 0, undefined, (1, 0, 0) * scripts\mp\gametypes\br_c130::getc130speed());
                break;
            }
            break;
        case #"hash_a6aaa6d4367207ed": 
            amount = int(args[0]);
            foreach (player in level.players) {
                player scripts\mp\gametypes\br_plunder::playerplunderpickup(amount);
            }
            break;
        case #"hash_18ff195f73506428": 
            foreach (player in level.players) {
                player scripts\mp\gametypes\br_plunder::playerthrowsmokesignal();
            }
            break;
        case #"hash_a369d55fee4139a4": 
            testcase = int(args[0]);
            level thread scripts\mp\gametypes\br::debugtestcirclevfx(testcase);
            break;
        case #"hash_2d711ba89ea418a": 
            level thread scripts\mp\gametypes\br_analytics::branalytics_endgame();
            break;
        case #"hash_f484066c03b6a363": 
            level thread scripts\mp\gametypes\br_callouts::function_1d1637db14bbc7d1();
            break;
        case #"hash_d5d3012bbaba6238": 
            thread scripts\mp\gametypes\br_c130::function_6fd27619248c2584();
            break;
        case #"hash_4e4776a3fadda5df": 
            thread scripts\mp\gametypes\br_c130::function_c6f09ac70af3c7cb();
            break;
        case #"hash_ac9fc9d4872c3163": 
            thread scripts\mp\gametypes\br_c130::function_22c604d143e3eb87(args[0]);
            break;
        case #"hash_8ff3986c5518a2e3": 
            if (args.size < 2) {
                iprintlnbold("<dev string:x642>");
                return;
            }
            type = args[0];
            if (type == "<dev string:x65d>") {
                var_9714ddda6a6df159 = int(max(0, int(args[1]) / 100));
                firstplayer scripts\mp\gametypes\br_plunder::playersetplundercount(var_9714ddda6a6df159);
            }
            break;
        case #"hash_ba72800f31a3607c": 
            if (args.size < 1) {
                iprintlnbold("<dev string:x66a>");
                return;
            }
            functable["<dev string:x693>"] = &devgivemaxammo;
            functable["<dev string:x698>"] = &function_bc261c1a1cb59524;
            functable["<dev string:x65d>"] = &function_28dc06904e18e469;
            functable["<dev string:x69e>"] = &function_5377fd507f9ea057;
            functable["<dev string:x6a9>"] = &function_c41e8bac1d7f3bc8;
            functable["<dev string:x6af>"] = &function_a2fdd1067da9ff6e;
            functable["<dev string:x6b4>"] = &function_26ab41fd72f1c761;
            if (args[0] == "<dev string:x6b8>") {
                args = getarraykeys(functable);
            }
            foreach (type in args) {
                foreach (player in level.players) {
                    utility::trycall(functable[type], player);
                }
            }
            break;
        case #"hash_1447f46e153fa1b6": 
            if (args.size < 1) {
                iprintlnbold("<dev string:x6c1>");
                return;
            }
            functable["<dev string:x69e>"] = &function_559b4cb8f64848b5;
            if (args[0] == "<dev string:x6b8>") {
                args = getarraykeys(functable);
            }
            foreach (type in args) {
                foreach (player in level.players) {
                    utility::trycall(functable[type], player);
                }
            }
            break;
        case #"hash_fa11c4f6bd516c22": 
            ammount = int(args[0]);
            if (args.size == 3) {
                team = args[1];
                index = int(args[2]);
                level.teamdata[team]["<dev string:x6ed>"][index] scripts\mp\gametypes\br_plunder::playerplunderpickup(ammount);
            } else if (args.size == 2) {
                team = args[1];
                foreach (player in level.teamdata[team]["<dev string:x6ed>"]) {
                    player scripts\mp\gametypes\br_plunder::playerplunderpickup(ammount);
                }
            } else {
                foreach (team, data in level.teamdata) {
                    foreach (player in data["<dev string:x6ed>"]) {
                        player scripts\mp\gametypes\br_plunder::playerplunderpickup(ammount);
                    }
                }
            }
            break;
        case #"hash_39157f6520b45cf3": 
            thread scripts\mp\gametypes\br_c130::function_7d4cd5dc8e9151a0();
            break;
        case #"hash_70cd4cd3fcb23ac2": 
            thread function_4c35185bbc6a8506();
            break;
        case #"hash_6d0d996c43611d83": 
            level thread function_7a26b30793922b87();
            break;
        case #"hash_fa21b3f6bd5e1d52": 
            level thread scripts\mp\gametypes\br_circle::function_acc901c78fe65b94(args);
            break;
        case #"hash_ca0d86eadeeb0f28": 
            scripts\mp\carriable::function_a1a40eb763fdd549(args[0]);
            break;
        case #"hash_262e09660f30b224": 
            scripts\mp\carriable::function_a6ec7bb20c89f0e8();
            break;
        case #"hash_f9b86a90368cfa3e": 
            level thread function_29e8c83db696b457();
            break;
        case #"hash_1b126254bb5a3b99": 
            level thread function_820b8302ada04c55();
            break;
        case #"hash_520d2a58ee102c35": 
            level thread scripts\mp\carriable::function_a48e852b0f6a3295(args[0]);
            break;
        case #"hash_c902de6620bec3c9": 
            host = scripts\mp\gamelogic::gethostplayer();
            if (isdefined(host)) {
                host scripts\mp\gametypes\br_armory_kiosk::playerhandlecirclepickitem();
            }
            break;
        case #"hash_9f5c4b24b1adbf08": 
            thread function_d671c39a7867f243(args);
            break;
        case #"hash_eeb8782d88cce2a1": 
            if (isdefined(level.var_802eea8e2cbeb0)) {
                level thread [[ level.var_802eea8e2cbeb0 ]](args[0]);
            }
            break;
        case #"hash_ee1f628b0f38b069": 
            if (args[0].size > 0) {
                value = int(args[0]);
                host = scripts\mp\gamelogic::gethostplayer();
                host function_179a8d5a185dfb56(value);
            }
            break;
        case #"hash_a95269034d36f9c": 
            host = scripts\mp\gamelogic::gethostplayer();
            bot = host function_5718089fc75809c3();
            if (isdefined(bot) && isbot(bot)) {
                botnum = bot getentitynumber();
                kick(botnum);
            }
            break;
        case #"hash_3da52d78f16a33d": 
            foreach (player in level.players) {
                player thread namespace_a38a2e1fe7519183::function_c563bbc48f1dd3d2(player);
            }
            break;
        case #"hash_73d6df617868209": 
            foreach (player in level.players) {
                player namespace_a38a2e1fe7519183::function_e64d9a42c66018c9(player);
            }
            break;
        case #"hash_d3e042390aa07110": 
            namespace_bf7e4ac48f40185::activate();
            break;
        case #"hash_b4d8c64baa74a93": 
            namespace_bf7e4ac48f40185::activate_enemy();
            break;
        case #"hash_9a14147eba150d7": 
            level thread function_9503654ca3380f8a(args);
            break;
        case #"hash_67690a8767af2434": 
            if (args.size == 1) {
                function_237b71faf9fb62d9(firstplayer, args[0]);
            }
            break;
        case #"hash_f3962c3d914738f7": 
            if (args.size == 2) {
                player = devgetplayerbyname(args[1]);
                if (!isdefined(player)) {
                    iprintlnbold("<dev string:x853>");
                    break;
                }
                namespace_1eb3c4e0e28fac71::function_22671614e8f79513(player, args[0]);
            } else if (args.size == 1) {
                namespace_1eb3c4e0e28fac71::function_22671614e8f79513(firstplayer, args[0]);
            }
            break;
        case #"hash_f8cd0b61d913bc46": 
            host = scripts\mp\gamelogic::gethostplayer();
            var_c0173f6249a46bd1 = scripts\mp\gamescore::gethighestscore();
            highestscore = var_c0173f6249a46bd1[1];
            highestteam = var_c0173f6249a46bd1[0];
            scripts\mp\gamescore::_setteamscore(host.team, highestscore + 1);
            scripts\mp\gamelogic::forceend();
            break;
        case #"hash_ce1f2c196fa400a8": 
            if (args[0] == "<dev string:x89a>") {
                var_99bcf6bdf31a0e49 = 1;
            } else if (args[0] == "<dev string:x89d>") {
                var_99bcf6bdf31a0e49 = 0;
            } else {
                iprintlnbold("<dev string:x8a2>");
                break;
            }
            if (args.size == 2) {
                player = devgetplayerbyname(args[1]);
                if (!isdefined(player)) {
                    iprintlnbold("<dev string:x8d4>");
                    break;
                }
                if (issharedfuncdefined("<dev string:x903>", "<dev string:x90d>")) {
                    [[ getsharedfunc("<dev string:x903>", "<dev string:x90d>") ]](player, var_99bcf6bdf31a0e49);
                }
            } else if (args.size == 1) {
                if (issharedfuncdefined("<dev string:x903>", "<dev string:x90d>")) {
                    [[ getsharedfunc("<dev string:x903>", "<dev string:x90d>") ]](firstplayer, var_99bcf6bdf31a0e49);
                }
            }
            break;
        case #"hash_e155e96b5e579879": 
            if (args.size != 2) {
                iprintlnbold("<dev string:x939>");
                break;
            }
            initialplayer = devgetplayerbyname(args[0]);
            var_784c8ada1184ff89 = devgetplayerbyname(args[1]);
            if (!isdefined(initialplayer) || !isdefined(var_784c8ada1184ff89)) {
                iprintlnbold("<dev string:x96d>");
                break;
            }
            if (issharedfuncdefined("<dev string:x903>", "<dev string:x99e>")) {
                [[ getsharedfunc("<dev string:x903>", "<dev string:x99e>") ]](initialplayer, var_784c8ada1184ff89, 0);
            }
            break;
        case #"hash_a739340327e3089e": 
            var_99bcf6bdf31a0e49 = 1;
            if (isdefined(args[0])) {
                if (args[0] == "<dev string:x89a>") {
                    var_99bcf6bdf31a0e49 = 1;
                } else if (args[0] == "<dev string:x89d>") {
                    var_99bcf6bdf31a0e49 = 0;
                }
            }
            host = scripts\mp\gamelogic::gethostplayer();
            var_1a115880d69eba7d = host function_bfe726b5e0b35c27();
            if (!isdefined(var_1a115880d69eba7d)) {
                break;
            }
            if (issharedfuncdefined("<dev string:x903>", "<dev string:x9c7>")) {
                [[ getsharedfunc("<dev string:x903>", "<dev string:x9c7>") ]](host, var_1a115880d69eba7d, var_99bcf6bdf31a0e49, 0);
            }
            break;
        case #"hash_cdd3d19e11186e13": 
            var_1ebfd0ce882dbcc6 = level.player;
            if (args.size >= 1) {
                var_1ebfd0ce882dbcc6 = function_b2dcd958dd436171(tolower(args[0]));
            }
            if (isdefined(var_1ebfd0ce882dbcc6)) {
                var_1ebfd0ce882dbcc6 dodamage(var_1ebfd0ce882dbcc6.health, var_1ebfd0ce882dbcc6.origin, var_1ebfd0ce882dbcc6);
            }
            break;
        case #"hash_779e498488e0fd4f":
        case #"hash_d542616c7a17d00d":
        case #"hash_dddecc2751311914":
        case #"hash_663b0900ff0e81c7":
        case #"hash_5549fae4e940416f":
        case #"hash_fa4dbef6bd80c0e5":
        case #"hash_fa50aaf6bd82e000": 
            if (issharedfuncdefined(command, "<dev string:xa18>")) {
                level thread [[ getsharedfunc(command, "<dev string:xa18>") ]](args);
            }
            break;
        case #"hash_4bbfcf4e978d515f": 
            duration = int(ter_op(isdefined(args[0]), args[0], 60));
            suffix = ter_op(isdefined(args[1]), args[1], "<dev string:xa31>");
            replacevisionset(duration, suffix);
            break;
        case #"hash_54601a5ea45e2833": 
            showsplash(args[0], args[1]);
            break;
        case #"hash_b9253a7e780b5cc4": 
            if (args.size < 1) {
                iprintlnbold("<dev string:xa51>");
                break;
            }
            player = firstplayer;
            if (args.size == 2) {
                player = devgetplayerbyname(args[1]);
                if (!isdefined(player)) {
                    iprintlnbold("<dev string:xa8e>");
                    break;
                }
            }
            if (args[0] == "<dev string:xabf>") {
                player scripts\cp_mp\challenges::function_ca0ab723ebcf6d79();
            } else if (args[0] == "<dev string:xac5>") {
                player scripts\cp_mp\challenges::function_8935e658d461fc50();
            } else if (args[0] == "<dev string:xacc>") {
                tokencount = player scripts\cp_mp\challenges::function_3d871e989c0bdb6d();
                println("<dev string:xad2>" + player.name + "<dev string:xaf2>" + tokencount);
            }
            break;
        case #"hash_bd306f1bddba5304": 
            if (args.size < 1) {
                iprintlnbold("<dev string:xb0e>");
                break;
            }
            player = firstplayer;
            if (args.size == 2) {
                player = devgetplayerbyname(args[1]);
                if (!isdefined(player)) {
                    iprintlnbold("<dev string:xb41>");
                    break;
                }
            }
            if (!function_1fb1cb439aa1e23c(args[0])) {
                iprintlnbold("<dev string:xb70>");
                break;
            }
            bitnumber = int(args[0]);
            if (bitnumber < 0) {
                iprintlnbold("<dev string:xb9f>");
                break;
            }
            if (bitnumber > ae_utility::function_e2ff8f4b4e94f723(#"hash_4a7f024e87253788", #"hash_c34c2acd5ddc3949")) {
                iprintlnbold("<dev string:xbc7>");
            }
            player scripts\cp_mp\challenges::function_b7793133df5fb0df(bitnumber);
            break;
        case #"hash_26072a9c395b034d": 
            if (!isdefined(level.arrow)) {
                return;
            }
            level.arrow.dvars.skiptoken = 1;
            host = scripts\mp\gamelogic::gethostplayer();
            tablet = namespace_6c622b52017c6808::function_3ff56f0ba058501a(host.origin, (0, 0, 0));
            level.arrow.props.tablets[level.arrow.props.tablets.size] = tablet;
            if (issharedfuncdefined("<dev string:xc06>", "<dev string:xc11>")) {
                level thread [[ getsharedfunc("<dev string:xc06>", "<dev string:xc11>") ]](tablet);
            }
            namespace_6c622b52017c6808::function_cd4ce58be10fb51d();
            break;
        case #"hash_f5a6eea7650767e2": 
            if (args.size < 1) {
                iprintlnbold("<dev string:xc35>");
                break;
            }
            circleid = args[0];
            if (isdefined(args[1])) {
                size = int(args[1]);
            } else {
                size = 6000;
            }
            var_1592c280e0665445 = spawnstruct();
            var_1592c280e0665445 scripts\cp_mp\utility\game_utility::function_6b6b6273f8180522(circleid, level.players[0].origin, size);
            var_1592c280e0665445 scripts\cp_mp\utility\game_utility::function_6988310081de7b45();
            break;
        case #"hash_b2e3447c4867d691": 
            if (isdefined(level.var_ed20ae31a47f989f) && isdefined(level.var_ed20ae31a47f989f.debug_spawn)) {
                [[ level.var_ed20ae31a47f989f.debug_spawn ]]();
            } else {
                iprintlnbold("<dev string:xc81>");
            }
            break;
        case #"hash_99831dfe2bc2e9a5": 
            amount = 10;
            if (args.size > 0) {
                amount = int(args[0]);
            }
            function_548e30d6072b85e9(firstplayer, amount);
            break;
        case #"hash_6631f1880c4f8339": 
            namespace_a5b4009d7c2e0b3d::addscore();
            break;
        case #"hash_aa98a879ea5c1a8b": 
            function_510cb3df7efc44a7(firstplayer);
            break;
        case #"hash_ac6e596ee6823fff": 
            firstplayer scripts\mp\gametypes\br::givestandardtableloadout(0, 1);
            break;
        case #"hash_1872556a49857987": 
            if (isdefined(firstplayer.classstruct) && isdefined(firstplayer.classstruct.var_91e10e152b08ec1d) && !firstplayer hasweapon(firstplayer.classstruct.var_91e10e152b08ec1d)) {
                firstplayer scripts\mp\class::function_4ffce833ce15363c(firstplayer.classstruct);
            }
            break;
        case #"hash_34260c14fedd5a2e": 
            if (args.size < 2) {
                iprintlnbold("<dev string:xd10>");
                break;
            }
            player = firstplayer;
            if (args.size == 3) {
                player = devgetplayerbyname(args[2]);
                if (!isdefined(player)) {
                    iprintlnbold("<dev string:xd4d>");
                    break;
                }
            }
            if (args[0] == "<dev string:x665>") {
                player scripts\mp\gametypes\br_pickups::function_7cb3c8630787467e(args[1]);
            }
            if (args[0] == "<dev string:x6bc>") {
                player scripts\mp\gametypes\br_pickups::function_b53322f9aca1b83b(args[1]);
            }
            break;
        case #"hash_87532133ab44aca2": 
            lootid = undefined;
            platelevel = ter_op(args.size > 1 && isdefined(args[1]), args[1], "<dev string:xd92>");
            if (!isdefined(args) || !isdefined(args[0]) || args[0] == "<dev string:xa31>") {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<dev string:xd94>" + platelevel);
            } else if (issubstr(args[0], "<dev string:xdaa>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<dev string:xd94>" + platelevel + "<dev string:xdb0>");
            } else if (issubstr(args[0], "<dev string:xdb7>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<dev string:xd94>" + platelevel + "<dev string:xdbd>");
            } else if (issubstr(args[0], "<dev string:xdc4>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<dev string:xd94>" + platelevel + "<dev string:xdcc>");
            } else if (issubstr(args[0], "<dev string:xdd5>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<dev string:xdde>");
            } else if (issubstr(args[0], "<dev string:xdfc>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<dev string:xe0a>");
            }
            if (!isdefined(lootid)) {
                break;
            }
            foreach (player in level.players) {
                if (!isbot(player)) {
                    continue;
                }
                player.avoidkillstreakonspawntimer = undefined;
                player lootitem(lootid, 1);
                player namespace_f8d3520d3483c1::setArmorHealth(player.maxarmorhealth);
            }
            break;
        case #"hash_ad34b62d6259eff9": 
            lootid = undefined;
            if (issubstr(args[0], "<dev string:xe3f>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<dev string:xe44>");
            } else if (issubstr(args[0], "<dev string:xe59>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<dev string:xe60>");
            } else if (issubstr(args[0], "<dev string:xe77>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<dev string:xe7d>");
            } else if (issubstr(args[0], "<dev string:xe93>")) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("<dev string:xe9a>");
            }
            if (!isdefined(lootid)) {
                break;
            }
            foreach (player in level.players) {
                if (!isbot(player)) {
                    continue;
                }
                player lootitem(lootid, 1);
            }
            break;
        case #"hash_a500569760927bb6": 
            foreach (player in level.players) {
                if (isbot(player)) {
                    continue;
                }
                player scripts\mp\menus::handleteamchange("<dev string:xec0>", 3);
                break;
            }
            break;
        case #"hash_f43300f0e110f9f7": 
            foreach (player in level.players) {
                if (isbot(player)) {
                    continue;
                }
                if (isdefined(level.var_4358d3a0ee13b0f9)) {
                    [[ level.var_4358d3a0ee13b0f9 ]](player, player.origin);
                }
                break;
            }
            break;
        case #"hash_d729000c152b2477": 
            if (isdefined(level.deployablekiosks) && isdefined(level.deployablekiosks.drones)) {
                level.deployablekiosks.drones = array_removeundefined(level.deployablekiosks.drones);
                foreach (deployablekiosk in level.deployablekiosks.drones) {
                    if (isdefined(level.var_ae0244c4c517ba75)) {
                        deployablekiosk thread [[ level.var_ae0244c4c517ba75 ]](level.players[0]);
                    }
                }
            }
            break;
        case #"hash_b60a10a83e46ca28": 
            function_5263a8371400329b();
            break;
        case #"hash_e3a60bc0c0aa07ff": 
            part = args[0];
            state = args[1];
            ent = function_274ba9ea825a3b5f(level.player);
            if (isdefined(ent)) {
                result = ent scripts\common\utility::function_3677f2be30fdd581(part, state);
                if (result) {
                    color = (0, 1, 0);
                    text = "<dev string:xf19>";
                } else {
                    color = (1, 0, 0);
                    text = "<dev string:xf21>";
                }
                iprintlnbold(text);
                drawentitybounds(ent, color, 1, 20);
            } else {
                iprintlnbold("<dev string:xf28>");
            }
            break;
        case #"hash_bf920f1431fc58e7": 
            level.players[0] nightvisionviewon();
            break;
        case #"hash_8f2d4dcab02be48b": 
            level.players[0] nightvisionviewoff();
            break;
        case #"hash_77cdec786733416b": 
            if (!isdefined(level.var_ec572828f01f1c6d)) {
                break;
            }
            blacksite = undefined;
            if (isdefined(firstplayer.blacksites) && firstplayer.blacksites.size > 0) {
                blacksite = firstplayer.blacksite[0];
            } else if (isdefined(level.var_f1073fbd45b59a06.blacksites)) {
                var_e880c9b9e22eb6c1 = randomint(level.var_f1073fbd45b59a06.blacksites.size);
                blacksite = level.var_f1073fbd45b59a06.blacksites[var_e880c9b9e22eb6c1];
            }
            firstplayer [[ level.var_ec572828f01f1c6d ]](blacksite);
            break;
        case #"hash_5bfe76ac355e2867": 
            if (!isdefined(level.var_91044985cdb24c8b)) {
                break;
            }
            blacksite = undefined;
            if (isdefined(firstplayer.blacksites) && firstplayer.blacksites.size > 0) {
                blacksite = firstplayer.blacksite[0];
            } else if (isdefined(level.var_f1073fbd45b59a06.blacksites)) {
                var_e880c9b9e22eb6c1 = randomint(level.var_f1073fbd45b59a06.blacksites.size);
                blacksite = level.var_f1073fbd45b59a06.blacksites[var_e880c9b9e22eb6c1];
            }
            firstplayer [[ level.var_91044985cdb24c8b ]](blacksite);
            break;
        case #"hash_70f3163baf120876": 
            var_477bd548940c3a78 = args[0];
            var_5c9ddcf56d36f133 = undefined;
            if (args.size > 1) {
                var_5c9ddcf56d36f133 = int(args[1]);
            }
            if (!isdefined(var_5c9ddcf56d36f133)) {
                var_5c9ddcf56d36f133 = 1;
            }
            firstplayer preloadcinematicforplayer(var_477bd548940c3a78);
            firstplayer playcinematicforplayer(var_477bd548940c3a78);
            firstplayer setclientomnvar("<dev string:xf80>", var_5c9ddcf56d36f133);
            wait 5;
            firstplayer setclientomnvar("<dev string:xf80>", 0);
            firstplayer stopcinematicforplayer();
            break;
        case #"hash_8673ffe7cf06c3b1": 
            player = firstplayer;
            dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
            player namespace_bd614c3c2275579a::function_9d216f4cd30f141d(dropstruct, getteamarray(player.team, 0), player.team);
            blacksite = level.var_f1073fbd45b59a06.var_9a3603fc71c8c69d[0];
            blacksite notify("<dev string:xfaa>");
            waitframe();
            boss = blacksite.var_837c4b569aa8a376[0];
            guards = function_7eb04ca16d045775("<dev string:xfc1>");
            firstguard = guards[0];
            scripts\mp\agents\agent_utility::killagent(firstguard);
            wait 1;
            aitype = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_sharedfunc("<dev string:xfd0>")[0];
            namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(aitype, boss.origin, (0, 0, 0), boss.team);
            break;
        case #"hash_259e6db48da06ba7": 
            if (args.size > 1) {
                attacker = scripts\mp\gametypes\br_dev::devgetplayerbyname(args[0]);
                victim = scripts\mp\gametypes\br_dev::devgetplayerbyname(args[1]);
                if (isdefined(attacker) && isdefined(victim) && isdefined(level.var_d1df695cab85185c)) {
                    victim thread [[ level.var_d1df695cab85185c ]](attacker);
                    attacker function_758ee105bdf0c62d();
                }
            }
            break;
        case #"hash_78bd6494a4d6e599": 
            if (args.size > 0) {
                perk = args[0];
                player = level.players[0];
                if (args.size > 1) {
                    player = scripts\mp\gametypes\br_dev::devgetplayerbyname(args[1]);
                }
                if (isdefined(player) && isdefined(perk)) {
                    player giveperk(perk);
                }
            }
            break;
        case #"hash_3ed5eb31dd5ed16c": 
            if (args.size > 0) {
                var_84a5decdc6b5a4c0 = args[0];
                weaponobj = function_fb77bd36161c7d9b(var_84a5decdc6b5a4c0);
                player = level.players[0];
                if (args.size > 1) {
                    player = devgetplayerbyname(args[1]);
                }
                if (isdefined(weaponobj)) {
                    maxammo = weaponmaxammo(weaponobj);
                    dropstruct = function_7b9f3966a7a42003();
                    dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
                    scripts\mp\gametypes\br_pickups::spawnpickup(var_84a5decdc6b5a4c0, dropinfo, maxammo, 1, weaponobj, 0, 0);
                }
            }
            break;
        case #"hash_cf9a6afff924db7d": 
            reviver = undefined;
            revivee = undefined;
            var_b1ba82194643d11d = 1;
            itemdata = ["<dev string:x1027>":["<dev string:x6bc>":[], "<dev string:x665>":[]], "<dev string:x101f>":["<dev string:x6bc>":[], "<dev string:x665>":[]]];
            if (args.size > 0) {
                foreach (arg in args) {
                    var_a6bf85cbfade3e88 = tolower(arg);
                    multival = strtok(var_a6bf85cbfade3e88, "<dev string:x102f>");
                    switch (multival.size) {
                    case 2: 
                        player = scripts\mp\gametypes\br_dev::devgetplayerbyname(multival[1]);
                        if (isdefined(player)) {
                            switch (multival[0]) {
                            case #"hash_94a335b456789386": 
                                reviver = player;
                                break;
                            case #"hash_94a348b45678b16f": 
                                revivee = player;
                                break;
                            }
                        }
                        break;
                    case 1: 
                        var_f56523e4e60d3b68 = issubstr(var_a6bf85cbfade3e88, "<dev string:x1027>");
                        var_f5651ae4e60d279d = issubstr(var_a6bf85cbfade3e88, "<dev string:x101f>");
                        takeitem = getsubstr(var_a6bf85cbfade3e88, 0, 2) == "<dev string:x1031>";
                        var_47b75bbc48a0809a = issubstr(var_a6bf85cbfade3e88, "<dev string:x1034>");
                        var_e74398cf5ec73470 = issubstr(var_a6bf85cbfade3e88, "<dev string:x103e>");
                        playerkey = undefined;
                        if (istrue(var_f56523e4e60d3b68)) {
                            playerkey = "<dev string:x1027>";
                        } else if (istrue(var_f5651ae4e60d279d)) {
                            playerkey = "<dev string:x101f>";
                        }
                        if (isdefined(playerkey)) {
                            arrkey = undefined;
                            itemval = undefined;
                            if (istrue(takeitem)) {
                                arrkey = "<dev string:x6bc>";
                            } else {
                                arrkey = "<dev string:x665>";
                            }
                            if (istrue(var_47b75bbc48a0809a)) {
                                itemval = "<dev string:x104b>";
                            } else if (istrue(var_e74398cf5ec73470)) {
                                itemval = "<dev string:x1068>";
                            }
                            if (isdefined(itemval)) {
                                var_2473e092f49eb0d6 = itemdata[playerkey][arrkey].size;
                                var_80d10756b23df0bf = 1;
                                itemdata[playerkey][arrkey][var_2473e092f49eb0d6] = itemval;
                            }
                        }
                        if (!istrue(var_80d10756b23df0bf)) {
                            switch (var_a6bf85cbfade3e88) {
                            case #"hash_285e1562bf1a1d13": 
                                var_e1407db69ba9775f = 1;
                                break;
                            default: 
                                player = scripts\mp\gametypes\br_dev::devgetplayerbyname(var_a6bf85cbfade3e88);
                                if (isdefined(player)) {
                                    if (!isdefined(reviver)) {
                                        reviver = player;
                                    }
                                }
                                break;
                            }
                        }
                        break;
                    default: 
                        break;
                    }
                }
            }
            if (!isdefined(reviver)) {
                reviver = level.players[0];
            }
            attacker = undefined;
            foreach (player in level.players) {
                if (!isdefined(attacker) && player.team != reviver.team && isreallyalive(player) && !isinlaststand(player)) {
                    attacker = player;
                }
                if (!isdefined(revivee) && player != reviver && (!istrue(var_b1ba82194643d11d) || isbot(player)) && player.team == reviver.team && isreallyalive(player) && !isinlaststand(player)) {
                    revivee = player;
                }
                if (isdefined(revivee) && isdefined(attacker)) {
                    break;
                }
            }
            if (!isdefined(revivee)) {
                return;
            }
            itemdata["<dev string:x1027>"]["<dev string:x108c>"] = revivee;
            itemdata["<dev string:x101f>"]["<dev string:x108c>"] = reviver;
            if (istrue(var_e1407db69ba9775f) && !revivee br_public::hasselfrevivetoken()) {
                revivee function_aaaa1b3dfe18885c(1, 8548);
            }
            foreach (playerarr in itemdata) {
                foreach (item in ["<dev string:x1068>", "<dev string:x104b>"]) {
                    player = playerarr["<dev string:x108c>"];
                    isperk = issubstr(item, "<dev string:x1093>");
                    var_4aa12e0ed3f6b745 = issubstr(item, "<dev string:x109e>");
                    if (array_contains(playerarr["<dev string:x665>"], item)) {
                        if (isperk) {
                            if (!player _hasperk(item)) {
                                player giveperk(item);
                            }
                        } else if (var_4aa12e0ed3f6b745) {
                            player function_9a34cb51ac957c0(item);
                        }
                    }
                    if (array_contains(playerarr["<dev string:x6bc>"], item)) {
                        if (isperk) {
                            if (player _hasperk(item)) {
                                player removeperk(item);
                            }
                            continue;
                        }
                        if (var_4aa12e0ed3f6b745) {
                            if (isdefined(player.var_4045f099f3da4bd) && player.var_4045f099f3da4bd == item) {
                                player function_f5e211bdcc0d8f79();
                            }
                        }
                    }
                }
            }
            lookpos = getplayerlookatpos(reviver);
            revivee setorigin(lookpos);
            if (isreallyalive(revivee)) {
                if (!isinlaststand(revivee)) {
                    revivee dodamage(99999, attacker.origin, attacker, attacker, "<dev string:x10ac>");
                } else if (isdefined(revivee.var_65a2b57b2b474c00)) {
                    revivee.var_65a2b57b2b474c00.curprogress = 0;
                }
            }
            if (isbot(revivee) && istrue(var_e1407db69ba9775f)) {
                level.var_78184ec36f669844 = 1;
                revivee.var_f932828585d0926c = 1;
            }
            thread function_1eaac96384e4a9d7(revivee);
            break;
        case #"hash_f8135c74ca6027b2": 
            revivee = level.players[0];
            if (args.size > 0) {
                foreach (arg in args) {
                    var_a6bf85cbfade3e88 = tolower(arg);
                    if (var_a6bf85cbfade3e88 == "<dev string:x10cb>") {
                        var_757d32718dcfc4e6 = 1;
                        continue;
                    }
                    if (var_a6bf85cbfade3e88 == "<dev string:x10d8>") {
                        var_9bf3bd9792819eec = 1;
                        continue;
                    }
                    player = scripts\mp\gametypes\br_dev::devgetplayerbyname(var_a6bf85cbfade3e88);
                    if (isdefined(player)) {
                        revivee = player;
                    }
                }
            }
            if (!isdefined(revivee)) {
                return;
            }
            attacker = undefined;
            foreach (player in level.players) {
                if (!isdefined(attacker) && player.team != revivee.team && isreallyalive(player) && !isinlaststand(player)) {
                    attacker = player;
                    break;
                }
            }
            if (!revivee br_public::hasselfrevivetoken()) {
                revivee function_aaaa1b3dfe18885c(1, 8548);
            }
            if (istrue(var_757d32718dcfc4e6) && !revivee _hasperk("<dev string:x1068>")) {
                revivee giveperk("<dev string:x1068>");
            }
            if (istrue(var_9bf3bd9792819eec)) {
                revivee function_9a34cb51ac957c0("<dev string:x104b>");
            }
            if (isdefined(attacker)) {
                damagepos = attacker.origin;
            } else {
                damagepos = revivee.origin;
            }
            if (isreallyalive(revivee) && !isinlaststand(revivee)) {
                revivee dodamage(99999, damagepos, attacker, attacker, "<dev string:x10ac>");
            } else if (isdefined(revivee.var_65a2b57b2b474c00)) {
                revivee.var_65a2b57b2b474c00.curprogress = 0;
            }
            thread function_1eaac96384e4a9d7(revivee);
            break;
        case #"hash_ad336c5f44b99d2e": 
            player = level.players[0];
            if (args.size > 0) {
                argplayer = scripts\mp\gametypes\br_dev::devgetplayerbyname(args[0]);
                if (isdefined(argplayer)) {
                    player = argplayer;
                }
            }
            player namespace_708f627020de59d3::function_19868614946c4df4();
            player function_e98a5a4e0e001ac3(player);
            defaultperks = scripts\mp\class::function_87c3b562f2b366ee(player);
            if (isdefined(player.perks)) {
                foreach (perk, count in player.perks) {
                    if (isdefined(player.loadoutperks) && array_contains(player.loadoutperks, perk)) {
                        player.loadoutperks = array_remove(player.loadoutperks, perk);
                    }
                    if (!array_contains(defaultperks, perk)) {
                        player scripts\mp\perks\perks::_unsetperk(perk);
                    }
                }
                player function_df87366a6b9bc3a0(player.loadoutperks);
            }
            break;
        case #"hash_1f46336a51f2920c": 
            thread function_d3b9dc1b6f956ff8();
            break;
        case #"hash_cb39bf247f39251f": 
            if (args.size > 0) {
                victim = scripts\mp\gametypes\br_dev::devgetplayerbyname(args[0]);
                attacker = undefined;
                if (args.size > 1) {
                    attacker = scripts\mp\gametypes\br_dev::devgetplayerbyname(args[0]);
                } else {
                    foreach (player in level.players) {
                        if (player.team != victim.team && isreallyalive(player)) {
                            attacker = player;
                            break;
                        }
                    }
                }
                if (isdefined(attacker) && isdefined(victim)) {
                    var_629cef8d43ca621b = namespace_708f627020de59d3::function_fb59c1d91c97a058(attacker);
                    if (!isdefined(var_629cef8d43ca621b) || function_43044da0ed44d79f(var_629cef8d43ca621b)) {
                        var_a746cf0b1aac05a1 = getarraykey(level.var_952400f520b7f68d, randomint(level.var_952400f520b7f68d.size));
                        lootref = level.br_pickups.var_838863c4848d4c26[var_a746cf0b1aac05a1];
                        fakeent = spawnstruct();
                        fakeent.scriptablename = lootref;
                        attacker namespace_708f627020de59d3::function_c3023358dc648bf1(fakeent, 0, 0, undefined, 0);
                    }
                    if (victim _hasperk("<dev string:x1124>")) {
                        victim removeperk("<dev string:x1124>");
                    }
                    player.var_15da77dc195bd80a = 0;
                    victim.var_add7dba6d7dab7d9 = 1;
                    victim dodamage(999999, attacker.origin, attacker, attacker, "<dev string:x10ac>");
                    victim.var_add7dba6d7dab7d9 = undefined;
                }
            }
            break;
        case #"hash_8ffd6bd28ea1c5bc": 
            if (args.size > 0) {
                equipref = args[0];
                var_c00e3162499a2e59 = function_94c116c69c037a47(equipref, ["<dev string:x1150>", "<dev string:x115a>", "<dev string:x1160>", "<dev string:x116e>"]);
                scriptbundle = var_c00e3162499a2e59[1];
                type = var_c00e3162499a2e59[0];
                if (!isdefined(type) || !isdefined(scriptbundle)) {
                    return;
                }
                switch (type) {
                case #"hash_93c71e7b6c0b81d7": 
                    equipmentref = scriptbundle.ref;
                    equipmentbundle = scriptbundle;
                    grenadeweaponref = scriptbundle.useweapon;
                    grenadeweaponbundle = getscriptbundle("<dev string:x117c>", grenadeweaponref);
                    break;
                case #"hash_e534fd8ec73eafb4": 
                    grenadeweaponref = scriptbundle.offhandweapon;
                    grenadeweaponbundle = getscriptbundle("<dev string:x117c>", grenadeweaponref);
                    superref = equipref;
                    superbundle = scriptbundle;
                    break;
                case #"hash_a30c9a25c758a239": 
                    grenadeweaponref = equipref;
                    grenadeweaponbundle = scriptbundle;
                    break;
                case #"hash_9c153fb2a039b16f": 
                    equipmentref = scriptbundle.baseweapon;
                    equipstruct = ter_op(array_contains_key(level.equipment.table, equipmentref), level.equipment.table[equipmentref], undefined);
                    if (!isdefined(equipstruct)) {
                        return;
                    }
                    equipbundle = equipstruct.bundle;
                    grenadeweaponref = equipstruct.weaponname;
                    grenadeweaponbundle = getscriptbundle("<dev string:x117c>", grenadeweaponref);
                    break;
                default: 
                    return;
                }
                if (!isdefined(equipmentref)) {
                    foreach (equip, item in level.equipment.table) {
                        if (item.weaponname == grenadeweaponref) {
                            equipmentref = equip;
                            equipmentbundle = item.bundle;
                            break;
                        }
                    }
                }
                if (!isdefined(equipmentref)) {
                    return;
                }
                if (isdefined(equipmentbundle)) {
                    switch (equipmentbundle.equipmenttype) {
                    case #"hash_b5ec22be8111413a":
                    case #"hash_e534fd8ec73eafb4": 
                        if (!isdefined(superref)) {
                            superref = scripts\mp\supers::getsuperrefforsuperuseweapon(grenadeweaponref);
                            superbundle = getscriptbundle(hashcat("<dev string:x119b>", superref));
                        }
                        break;
                    }
                }
                victim = level.players[0];
                if (args.size > 1) {
                    argplayer = scripts\mp\gametypes\br_dev::devgetplayerbyname(args[1]);
                    if (isdefined(argplayer)) {
                        victim = argplayer;
                    }
                }
                attacker = function_5da181c6905a7a49(victim);
                spawnpos = getplayerlookatpos(victim);
                if (!isdefined(attacker)) {
                    return;
                }
                if (isdefined(superref)) {
                    var_5d7589bf09bdf4d8 = getscriptbundle(level.supertable);
                    foreach (item in var_5d7589bf09bdf4d8.super_list) {
                        if (isdefined(item.bundle) && item.bundle == superref) {
                            basesuper = item.ref;
                            break;
                        }
                    }
                    if (isdefined(basesuper)) {
                        attacker givesuper(basesuper);
                        attacker setorigin(spawnpos);
                        waitframe();
                        attacker scripts\mp\perks\perkpackage::perkpackage_forceusesuper();
                    }
                } else {
                    grenade = attacker _launchgrenade(grenadeweaponref, spawnpos + (0, 0, 5), (0, 0, 0), undefined, 0);
                    attacker scripts\mp\weapons::grenadeused(grenade);
                }
            }
            break;
        case #"hash_a9ac0a5962cdb952": 
            isfriendly = 1;
            if (args.size > 0) {
                isfriendly = int(args[0]);
            }
            airstrikeowner = undefined;
            if (isfriendly) {
                teammates = scripts\mp\utility\teams::getteamdata(firstplayer.team, "<dev string:x6ed>");
                if (teammates.size > 1) {
                    foreach (teammate in teammates) {
                        if (teammate != firstplayer) {
                            airstrikeowner = teammate;
                            break;
                        }
                    }
                }
            } else {
                foreach (teamname, teamdata in level.teamdata) {
                    if (teamname == firstplayer.team) {
                        continue;
                    }
                    teammembers = scripts\mp\utility\teams::getteamdata(teamname, "<dev string:x6ed>");
                    if (teammembers.size > 0) {
                        airstrikeowner = teammembers[0];
                        break;
                    }
                }
            }
            if (isdefined(airstrikeowner)) {
                streakinfo = spawnstruct();
                streakinfo.streakname = "<dev string:x11ba>";
                streakinfo.debug_state = "<dev string:x11ce>";
                streakinfo.shots_fired = 0;
                location = firstplayer.origin;
                animname = level.scr_anim[streakinfo.streakname]["<dev string:x11d8>"];
                var_4c4796c182975686 = getanimlength(animname);
                var_7225662d8217d65a = get_notetrack_time(animname, "<dev string:x11e8>");
                var_b333ee8fea365230 = var_4c4796c182975686 - 5;
                airstrikeid = scripts\cp_mp\killstreaks\airstrike::airstrike_addactivestrike(location, airstrikeowner, var_b333ee8fea365230);
                airstrikeowner thread airstrike_watchkills(streakinfo, var_7225662d8217d65a * 2, airstrikeid);
                airstrikeowner thread watchairstrikeowner(airstrikeid);
                airstrikeowner thread airstrike_watchgameend(streakinfo, airstrikeid);
                airstrikeowner finishairstrikeusage(location, undefined, undefined, streakinfo, animname, airstrikeid);
                level thread function_7893c28cfbf65865(airstrikeowner, airstrikeid, var_b333ee8fea365230);
                scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(var_4c4796c182975686);
                level scripts\common\callbacks::callback("<dev string:x11ef>", {#streakinfo:streakinfo});
            }
            break;
        case #"hash_19160383ea61c1b5": 
            var_742e3b452c9bb9b0 = 0;
            if (args.size > 0) {
                var_742e3b452c9bb9b0 = int(args[0]);
            }
            level thread function_533bda33b99fab22(firstplayer, var_742e3b452c9bb9b0);
            break;
        default: 
            break;
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4253
    // Size: 0x86
    function givesuper(superref) {
        if (!isdefined(superref) || !array_contains_key(level.br_pickups.var_838863c4848d4c26, superref)) {
            return;
        }
        var_a06806243448e2c7 = level.br_pickups.var_838863c4848d4c26[superref];
        fakeent = spawnstruct();
        fakeent.scriptablename = var_a06806243448e2c7;
        fakeent.count = 1;
        scripts\mp\gametypes\br_pickups::takesuperpickup(fakeent);
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x42e1
    // Size: 0x9e
    function function_94c116c69c037a47(refname, typearr) {
        foreach (type in typearr) {
            bundlestr = type + "<dev string:x1219>" + refname;
            bundle = getscriptbundle(bundlestr);
            if (isdefined(bundle)) {
                return [type, bundle];
            }
        }
        return [undefined, undefined];
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4387
    // Size: 0xd7
    function function_5da181c6905a7a49(targetplayer, botsonly) {
        if (!isdefined(botsonly)) {
            botsonly = 0;
        }
        if (!isdefined(targetplayer)) {
            return;
        }
        if (isstring(targetplayer)) {
            targetplayer = scripts\mp\gametypes\br_dev::devgetplayerbyname(targetplayer);
        }
        if (!isdefined(targetplayer) || !isplayer(targetplayer)) {
            return;
        }
        foreach (player in level.players) {
            if (player.team != targetplayer.team && isreallyalive(player) && !isinlaststand(player) && (isbot(player) || !istrue(botsonly))) {
                return player;
            }
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4466
    // Size: 0x264
    function function_fb77bd36161c7d9b(scriptable, lootweaponlist) {
        if (!isdefined(lootweaponlist)) {
            lootweaponlist = "<dev string:x121b>";
        }
        var_97f1b48fd49a7224 = getscriptbundle(hashcat(%"hash_36fa976a8ae12763", lootweaponlist));
        if (isdefined(var_97f1b48fd49a7224) && isdefined(var_97f1b48fd49a7224.var_890049f984dd3e53)) {
            foreach (data in var_97f1b48fd49a7224.var_890049f984dd3e53) {
                lootitemdef = data.loot_item_def;
                if (isdefined(lootitemdef)) {
                    lootitem = getscriptbundle(hashcat(%"loot_item_def:", lootitemdef));
                    if (isdefined(lootitem)) {
                        if (lootitem.name == scriptable) {
                            lootid = lootitem.lootid;
                            weaponroot = function_1cc3fd00b6ccc3ba(lootid);
                            var_25152a36c536d7f = loot::function_793e8a72cedb8ef3(lootid);
                            attachmentlistbundle = lootitem.attachmentlist;
                            attachmentlist = getscriptbundle(hashcat(%"hash_6ab26ee9c0dc2c2f", attachmentlistbundle));
                            var_91bbf8d2294a656e = [];
                            if (isdefined(attachmentlist)) {
                                foreach (data in attachmentlist.attachment_list) {
                                    if (isdefined(data.attachmentid)) {
                                        var_91bbf8d2294a656e[data.attachment] = data.attachmentid;
                                        continue;
                                    }
                                    var_91bbf8d2294a656e[data.attachment] = 0;
                                }
                            }
                            baseweaponname = weaponroot;
                            camo = undefined;
                            if (isdefined(lootitem.camo)) {
                                camo = lootitem.camo;
                            }
                            fullweaponobj = undefined;
                            if (!isdefined(var_91bbf8d2294a656e)) {
                                fullweaponobj = namespace_e0ee43ef2dddadaa::buildweapon_attachmentidmap(weaponroot, camo, undefined, undefined);
                            } else {
                                fullweaponobj = namespace_e0ee43ef2dddadaa::buildweapon_attachmentidmap(weaponroot, var_91bbf8d2294a656e, camo, undefined, undefined);
                            }
                            return fullweaponobj;
                        }
                    }
                }
            }
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x46d2
    // Size: 0x6a
    function function_9a34cb51ac957c0(var_19cadf7d520f4072, maxwaittimems) {
        function_e98a5a4e0e001ac3(self, var_19cadf7d520f4072);
        waittime = 0;
        maxwaittime = 1000;
        if (isdefined(maxwaittimems)) {
            maxwaittime = maxwaittimems;
        }
        while (self.var_4045f099f3da4bd != var_19cadf7d520f4072) {
            if (waittime >= maxwaittime) {
                return;
            }
            waitframe();
            waittime += level.frameduration;
        }
        return 1;
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4744
    // Size: 0x3a
    function function_f5e211bdcc0d8f79() {
        var_2e1d1af8afe39ba8 = getdvarint(@"hash_fde1113ce9981d91", 3);
        var_347aa4935f42810 = scripts\mp\gametypes\br_public::function_c2f2bb9e0ae9a454(var_2e1d1af8afe39ba8);
        function_9a34cb51ac957c0(var_347aa4935f42810);
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4786
    // Size: 0x13e
    function function_1eaac96384e4a9d7(revivee) {
        level endon("<dev string:x1230>");
        revivee endon("<dev string:x123b>");
        revivee notify("<dev string:x1246>");
        revivee.revivetimems = 0;
        revivee.var_4ab61a57453e2816 = 1;
        notifycalled = revivee waittill_any_return_4("<dev string:x125e>", "<dev string:x1271>", "<dev string:x1285>", "<dev string:x1246>");
        if ((notifycalled == "<dev string:x125e>" || notifycalled == "<dev string:x1271>") && isalive(revivee) && isdefined(revivee.revivetimems) && revivee.revivetimems > 0) {
            targetms = 3000;
            framecount = int(targetms / level.frameduration + 0.5);
            revivetimestr = "<dev string:x128b>" + revivee.revivetimems + "<dev string:x129c>";
            printtoscreen2d(800, 300, revivetimestr, (1, 1, 1), 2, framecount);
        }
        if (notifycalled != "<dev string:x1246>") {
            revivee.var_4ab61a57453e2816 = undefined;
            revivee.revivetimems = undefined;
            revivee.var_f932828585d0926c = undefined;
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x48cc
    // Size: 0x10e
    function function_4d1c100badcf41a8(player, defname) {
        playerorigin = player.origin;
        playerangles = player getplayerangles();
        playerforward = anglestoforward(playerangles);
        tracestart = (playerorigin[0], playerorigin[1], playerorigin[2] + player getplayerviewheight());
        traceend = tracestart + playerforward * 5000;
        tracecontents = scripts\engine\trace::create_default_contents(1);
        trace = scripts\engine\trace::ray_trace(tracestart, traceend, player, tracecontents);
        spawnorigin = tracestart + playerforward * 100;
        if (trace["<dev string:x12a0>"] < 1) {
            spawnorigin = trace["<dev string:x12a9>"];
        }
        spawnorigin += (0, 0, 5);
        scriptable = spawnscriptable(defname, spawnorigin, (0, 0, 0));
        scripts\mp\gametypes\br_pickups::registerscriptableinstance(scriptable);
        return scriptable;
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x49e2
    // Size: 0x1c
    function function_5d92949cc218ebdd(playername) {
        return strtok(playername, "<dev string:x12b2>")[0];
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4a06
    // Size: 0x86
    function function_b2dcd958dd436171(name) {
        foreach (player in level.players) {
            shortname = function_5d92949cc218ebdd(player.name);
            if (tolower(shortname) == name) {
                return player;
            }
        }
        return undefined;
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4a94
    // Size: 0x16f
    function function_5b5ab8ab53c49d4d(victimname, attackername) {
        attacker = undefined;
        victimname = tolower(victimname);
        victim = function_b2dcd958dd436171(victimname);
        if (isdefined(attackername)) {
            attackername = tolower(attackername);
            foreach (player in level.players) {
                shortname = function_5d92949cc218ebdd(player.name);
                if (tolower(shortname) == attackername) {
                    attacker = player;
                    break;
                }
            }
        } else {
            foreach (player in level.players) {
                if (victim.team != player.team) {
                    attacker = player;
                    break;
                }
            }
        }
        if (isdefined(victim)) {
            victim.var_add7dba6d7dab7d9 = 1;
            victim dodamage(999999, victim.origin, attacker, attacker, "<dev string:x10ac>");
            victim.var_add7dba6d7dab7d9 = undefined;
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x4c0b
    // Size: 0x1d9
    function function_53a0f5e4d6bbc7a4(victimname, attackername, damage) {
        victim = undefined;
        attacker = undefined;
        victimname = tolower(victimname);
        attackerweapon = undefined;
        foreach (player in level.players) {
            shortname = function_5d92949cc218ebdd(player.name);
            if (tolower(shortname) == victimname) {
                victim = player;
                break;
            }
        }
        if (isdefined(attackername)) {
            attackername = tolower(attackername);
            foreach (player in level.players) {
                shortname = function_5d92949cc218ebdd(player.name);
                if (tolower(shortname) == attackername) {
                    attacker = player;
                    attackerweapon = attacker.primaryweapon;
                    break;
                }
            }
        } else {
            foreach (player in level.players) {
                if (victim.team != player.team) {
                    attacker = player;
                    break;
                }
            }
        }
        if (isdefined(victim)) {
            victim dodamage(float(damage), victim.origin, attacker, attacker);
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4dec
    // Size: 0xc5
    function function_72c1806e62a9bd10(playername, var_6be1bd68cd41dbbd) {
        playername = tolower(playername);
        foreach (player in level.players) {
            shortname = function_5d92949cc218ebdd(player.name);
            if (tolower(shortname) == playername) {
                clientnum = player getentitynumber();
                if (istrue(var_6be1bd68cd41dbbd)) {
                    kick(clientnum, "<dev string:x12b4>", 1);
                } else {
                    kick(clientnum);
                }
                break;
            }
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4eb9
    // Size: 0x97
    function function_5718089fc75809c3() {
        start = self geteye();
        dir = anglestoforward(self getplayerangles());
        end = start + 8000 * dir;
        trace = scripts\engine\trace::_bullet_trace(start, end, 1, self);
        player = undefined;
        if (isdefined(trace["<dev string:x12ce>"]) && isplayer(trace["<dev string:x12ce>"]) && isreallyalive(trace["<dev string:x12ce>"])) {
            player = trace["<dev string:x12ce>"];
        }
        return player;
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4f58
    // Size: 0xc4
    function function_78ec4accff5f158b(player) {
        angles = player getplayerangles();
        fwd = anglestoforward(angles);
        eye = player geteye();
        end = eye + fwd * 10000;
        traces = scripts\engine\trace::ray_trace_get_all_results(eye, end);
        foreach (trace in traces) {
            if (!isdefined(trace["<dev string:x12ce>"])) {
                return trace["<dev string:x12a9>"];
            }
        }
        return undefined;
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5024
    // Size: 0xc4
    function function_274ba9ea825a3b5f(player) {
        angles = player getplayerangles();
        fwd = anglestoforward(angles);
        eye = player geteye();
        end = eye + fwd * 10000;
        traces = scripts\engine\trace::ray_trace_get_all_results(eye, end);
        foreach (trace in traces) {
            if (isdefined(trace["<dev string:x12ce>"])) {
                return trace["<dev string:x12ce>"];
            }
        }
        return undefined;
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x50f0
    // Size: 0x117
    function function_c3b8a31470635593(winningteam) {
        setdvar(@"hash_31bfb430e958888c", 2);
        wait 2;
        foreach (team in level.teamswithplayers) {
            if (team != winningteam) {
                teamplayers = getteamdata(team, "<dev string:x6ed>");
                foreach (player in teamplayers) {
                    if (isalive(player)) {
                        player.var_add7dba6d7dab7d9 = 1;
                        player dodamage(999999, player.origin, player, player, "<dev string:x10ac>");
                        player.var_add7dba6d7dab7d9 = undefined;
                        wait 1;
                    }
                }
            }
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x520f
    // Size: 0x97
    function function_429110eb5af4a19c() {
        foreach (team in level.teamnamelist) {
            teamcount = getteamdata(team, "<dev string:x12d5>");
            if (teamcount && !array_contains(level.teamswithplayers, team)) {
                level.teamswithplayers[level.teamswithplayers.size] = team;
            }
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x52ae
    // Size: 0x16a
    function function_9bb9422480e6aa6d() {
        level endon("<dev string:x1230>");
        if (istrue(level.var_4887475a9fd2c26)) {
            return;
        }
        level.var_4887475a9fd2c26 = 1;
        hudtext = function_1ce3276d3ef55a0a("<dev string:x12df>", 0.8);
        hudtext setpoint("<dev string:x12e7>", "<dev string:x12e7>", 200, 160);
        hudtext setdevtext("<dev string:x12ef>");
        for (lastmessage = "<dev string:xa31>"; true; lastmessage = nameinfo) {
            wait 0.1;
            if (!isdefined(level.players) || !level.players.size) {
                continue;
            }
            nameinfo = "<dev string:xa31>";
            function_429110eb5af4a19c();
            foreach (teamname in level.teamswithplayers) {
                var_6428e68df37399d3 = "<dev string:x1302>";
                if (isdefined(level.var_8f337a661bccb9f) && isdefined(level.var_8f337a661bccb9f[teamname])) {
                    var_6428e68df37399d3 = level.var_8f337a661bccb9f[teamname];
                }
                nameinfo += "<dev string:x1309>" + teamname + "<dev string:x130c>" + var_6428e68df37399d3 + "<dev string:x1311>";
            }
            if (nameinfo != lastmessage) {
                hudtext setdevtext(nameinfo);
            }
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5420
    // Size: 0x3fe
    function function_2729e9ab8a4ec44e() {
        level endon("<dev string:x1230>");
        if (istrue(level.var_5f61ffe168666863)) {
            return;
        }
        level.var_5f61ffe168666863 = 1;
        hudtext = function_1ce3276d3ef55a0a("<dev string:x12df>", 0.8);
        hudtext setpoint("<dev string:x12e7>", "<dev string:x12e7>", 20, 160);
        hudtext setdevtext("<dev string:x1315>");
        for (lastmessage = "<dev string:xa31>"; true; lastmessage = nameinfo) {
            waitframe();
            if (!isdefined(level.players) || !level.players.size) {
                continue;
            }
            nameinfo = "<dev string:xa31>";
            function_429110eb5af4a19c();
            foreach (teamname in level.teamswithplayers) {
                nameinfo += "<dev string:x1309>" + teamname + "<dev string:x132a>";
                foreach (player in getteamarray(teamname)) {
                    entnum = player getentitynumber();
                    print3d(player.origin + (0, 0, 70), "<dev string:x132f>" + entnum + "<dev string:x1331>" + player.name, (1, 1, 1), 1, 0.4, 1);
                    print3d(player.origin + (0, 0, 65), teamname + "<dev string:x1334>" + player.health + player.armorhealth, (1, 1, 1), 1, 0.3, 1);
                    isplayeralive = isalive(player) && !istrue(player.gulag);
                    var_2e74464713803f2f = get_int_or_0(player.gulaguses);
                    playername = ter_op(isdefined(player.name), player.name, "<dev string:x1337>") + "<dev string:x133e>" + var_2e74464713803f2f + "<dev string:x1341>";
                    if (isplayeralive) {
                        nameinfo += "<dev string:x1343>" + playername + "<dev string:x1348>";
                    } else if (!istrue(level.br_prematchstarted)) {
                        nameinfo += "<dev string:x1350>" + playername + "<dev string:x1355>";
                    } else if (scripts\mp\gametypes\br_spectate::isvalidspectatetarget(player)) {
                        nameinfo += "<dev string:x135c>" + playername + "<dev string:x1361>";
                    } else if (istrue(player.br_iseliminated)) {
                        nameinfo += "<dev string:x1350>" + playername + "<dev string:x1369>";
                        namecolor = ter_op(istrue(player.killcam), "<dev string:x1376>", "<dev string:x1309>");
                        spectatingplayer = player getspectatingplayer();
                        if (isdefined(spectatingplayer)) {
                            nameinfo += "<dev string:x1379>" + namecolor + spectatingplayer.name + "<dev string:x137e>";
                        }
                        if (isdefined(level.var_8f337a661bccb9f) && isdefined(level.var_8f337a661bccb9f[player.team])) {
                            nameinfo += "<dev string:x1382>" + level.var_8f337a661bccb9f[player.team] + "<dev string:x137e>";
                        }
                    } else {
                        nameinfo += "<dev string:x1343>" + playername + "<dev string:x1389>";
                    }
                    nameinfo += "<dev string:x1311>";
                }
            }
            if (nameinfo.size > 1000) {
                nameinfo = getsubstr(nameinfo, 0, 1000);
            }
            if (nameinfo != lastmessage) {
                hudtext setdevtext(nameinfo);
            }
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x5826
    // Size: 0xe8
    function function_1ce3276d3ef55a0a(font, fontscale) {
        hudelem = newhudelem();
        hudelem.elemtype = "<dev string:x1393>";
        hudelem.font = font;
        hudelem.fontscale = fontscale;
        hudelem.basefontscale = fontscale;
        hudelem.x = 0;
        hudelem.y = 0;
        hudelem.width = 0;
        hudelem.height = int(level.fontheight * fontscale);
        hudelem.xoffset = 0;
        hudelem.yoffset = 0;
        hudelem.children = [];
        hudelem setparent(level.uiparent);
        hudelem.hidden = 0;
        return hudelem;
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5916
    // Size: 0x68
    function function_69dffe7a5cb1b4b9() {
        foreach (player in level.players) {
            if (!isbot(player) && !istestclient(player)) {
                return player;
            }
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5986
    // Size: 0x1c6
    function function_7a26b30793922b87() {
        notbot = function_69dffe7a5cb1b4b9();
        if (!isdefined(notbot)) {
            iprintlnbold("<dev string:x1398>");
            return;
        }
        if (!istrue(level.br_prematchstarted)) {
            level notify("<dev string:x13b6>");
            wait 3;
        }
        var_d3a4d4e30c0118d3 = [[ getsharedfunc("<dev string:x13c6>", "<dev string:x13cb>") ]](notbot.team, 1);
        if (var_d3a4d4e30c0118d3.size < 2) {
            if (level.maxteamsize < 2) {
                level.maxteamsize = 2;
            }
            setdvar(@"hash_9e5da81386e98d36", notbot.team);
            setdvar(@"hash_955d9d2c8102c6bc", 1);
            while (var_d3a4d4e30c0118d3.size < 2) {
                waitframe();
                var_d3a4d4e30c0118d3 = [[ getsharedfunc("<dev string:x13c6>", "<dev string:x13cb>") ]](notbot.team, 1);
            }
            frameswaited = 0;
            while (true) {
                if (frameswaited > 100) {
                    iprintlnbold("<dev string:x13de>");
                    return;
                }
                friendlyready = 0;
                foreach (player in var_d3a4d4e30c0118d3) {
                    if (player == notbot) {
                        continue;
                    }
                    if (player.sessionstate != "<dev string:x1408>") {
                        friendlyready = 1;
                        break;
                    }
                }
                if (friendlyready) {
                    break;
                }
                frameswaited++;
                waitframe();
            }
        }
        waittillframeend();
        setdvar(@"hash_12d23346fbacee91", 2);
        setdvar(@"hash_6ce01b6572751b18", 1);
        notbot.gulagloser = 1;
        notbot scripts\mp\gametypes\br::sendafksquadmembertogulag();
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5b54
    // Size: 0xc4
    function function_9cbddfdef8f1125b(bunkerindex) {
        player = self;
        player playersetkeypadstateindex(1);
        player playersetkeypadcodelengthindex(8);
        while (true) {
            message, value = player waittill("<dev string:x1412>");
            if (isdefined(message)) {
                if (message == "<dev string:x1422>") {
                    if (verifybunkercode(bunkerindex, value)) {
                        player playersetkeypadstateindex(2);
                        wait 2;
                        iprintlnbold("<dev string:x1433>");
                        break;
                    } else {
                        player playersetkeypadstateindex(3);
                        waitframe();
                        iprintlnbold("<dev string:x1458>");
                        player playersetkeypadstateindex(1);
                    }
                    continue;
                }
                if (message == "<dev string:x147d>") {
                    break;
                }
            }
        }
        player playersetkeypadstateindex(0);
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5c20
    // Size: 0x8e
    function devgetplayerbyname(playername) {
        playername = tolower(playername);
        foreach (player in level.players) {
            shortname = function_5d92949cc218ebdd(player.name);
            if (tolower(shortname) == playername) {
                return player;
            }
        }
        return undefined;
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5cb6
    // Size: 0x36
    function function_bc261c1a1cb59524(player) {
        br_forcegivecustompickupitem(player, "<dev string:x148c>", 1, level.br_pickups.maxcounts["<dev string:x148c>"]);
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5cf4
    // Size: 0x66
    function devgivemaxammo(player) {
        foreach (ammotype, maxcount in level.br_ammo_max) {
            br_ammo_give_type(player, ammotype, maxcount, 0);
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5d62
    // Size: 0x29
    function function_28dc06904e18e469(player) {
        player scripts\mp\gametypes\br_plunder::playerplunderpickup(level.br_plunder.plunderlimit);
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5d93
    // Size: 0x16
    function function_c41e8bac1d7f3bc8(player) {
        player addrespawntoken();
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5db1
    // Size: 0x16
    function function_5377fd507f9ea057(player) {
        player addselfrevivetoken();
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5dcf
    // Size: 0x25
    function function_559b4cb8f64848b5(player) {
        if (!isdefined(player.inlaststand)) {
            player removeselfrevivetoken();
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5dfc
    // Size: 0x1d
    function function_a2fdd1067da9ff6e(player) {
        br_forcegivecustompickupitem(player, "<dev string:x149f>", 1);
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5e21
    // Size: 0x2a
    function function_26ab41fd72f1c761(player) {
        lootweapon = scripts\mp\gametypes\br_weapons::br_getrandomlootweapon();
        br_forcegivecustompickupitem(player, lootweapon, 1);
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5e53
    // Size: 0x75
    function function_fe99ab4dc900865e() {
        killtriggers = getentarray("<dev string:x14b4>", "<dev string:x14c1>");
        foreach (trigger in killtriggers) {
            trigger.targetname = "<dev string:x14cb>";
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5ed0
    // Size: 0xb5
    function function_4c35185bbc6a8506() {
        host = scripts\mp\gamelogic::gethostplayer();
        foreach (player in level.players) {
            if (isdefined(player) && !isalive(player) && !istrue(player.br_iseliminated) && !istrue(player.gulag)) {
                if (isdefined(host)) {
                    host iprintlnbold("<dev string:x14d7>" + player.name + "<dev string:x14df>");
                }
            }
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5f8d
    // Size: 0xfa
    function function_7c57dd42429eb995() {
        level endon("<dev string:x1230>");
        setdvarifuninitialized(@"hash_5ec38dd7bdfbfe50", 0);
        while (true) {
            if (getdvarint(@"hash_5ec38dd7bdfbfe50", 0)) {
                squadleaderlist = [];
                foreach (player in level.players) {
                    if (player scripts\mp\gametypes\br_public::isplayerbrsquadleader()) {
                        squadleaderlist = array_add(squadleaderlist, player);
                    }
                }
                foreach (player in squadleaderlist) {
                    player scripts\mp\gametypes\br::abandonbrsquadleader();
                }
                setdvar(@"hash_5ec38dd7bdfbfe50", 0);
            }
            wait 1;
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x608f
    // Size: 0xfc
    function function_29e8c83db696b457() {
        player = function_69dffe7a5cb1b4b9();
        if (!isdefined(player)) {
            iprintlnbold("<dev string:x1398>");
            return;
        }
        spawndata = spawnstruct();
        spawndata.origin = player.origin + (100, 0, 0);
        spawndata.angles = player.angles;
        spawndata.modelname = "<dev string:x14eb>";
        spawndata.vehicletype = "<dev string:x14f9>";
        spawndata.targetname = "<dev string:x1505>";
        spawndata.cannotbesuspended = 1;
        faildata = spawnstruct();
        vehicle = scripts\cp_mp\vehicles\vehicle_tracking::_spawnvehicle(spawndata, faildata);
        player setusingremote("<dev string:x150e>");
        vehicle setotherent(player);
        vehicle setentityowner(player);
        player controlslinkto(vehicle);
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6193
    // Size: 0x1d
    function function_820b8302ada04c55() {
        player = function_69dffe7a5cb1b4b9();
        player function_968fe965d3e8c967();
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x61b8
    // Size: 0x5a0
    function function_d671c39a7867f243(args) {
        var_a3f2c8b5048491c9 = 5000;
        var_177fceb85436c082 = 100;
        var_fe52faf102ebf57b = 1000;
        var_e0be8bb269d1b3ee = -2400;
        if (isdefined(level.br_level) && isdefined(level.br_level.var_540c681a924e2df2)) {
            var_e0be8bb269d1b3ee = level.br_level.var_540c681a924e2df2;
        }
        var_3b5ad6f63af5e57a = 10000;
        var_e25c6801a01f7fce = 5000;
        var_befd185e0007a7b8 = -18000 + var_e0be8bb269d1b3ee;
        var_e89346b6c5bfd043 = 15;
        resolution = 1000;
        precision = 5;
        var_1c8f7cdf53fa7b1f = 8000;
        if (args.size == 1 && int(args[0]) == 0) {
            if (istrue(level.var_90a078e35115c032)) {
                level notify("<dev string:x1513>");
                level notify("<dev string:x1524>");
                level.var_90a078e35115c032 = undefined;
                level.holesa = [];
                level.holesb = [];
                level.var_ca369ce88e799edd = [];
                level.var_ca3699e88e799844 = [];
                level.var_ca369ae88e799a77 = [];
                level.var_fce03ebb07aa6a47 = [];
                level.var_fce03fbb07aa6c7a = [];
                level.var_8fd311aaa85b95cf = [];
                level.var_8fd312aaa85b9802 = [];
                return;
            }
        } else if (args.size > 0 && int(args[0]) > 1) {
            resolution = int(args[0]);
            if (args.size > 1) {
                precision = int(max(1, int(args[1])));
            }
            if (args.size > 2) {
                var_1c8f7cdf53fa7b1f = int(max(1, int(args[1])));
            }
        }
        level endon("<dev string:x1513>");
        level.var_90a078e35115c032 = 1;
        host = scripts\mp\gamelogic::gethostplayer();
        origin = host.origin;
        level.holesa = [];
        level.holesb = [];
        level.var_ca369ce88e799edd = [];
        level.var_ca3699e88e799844 = [];
        level.var_ca369ae88e799a77 = [];
        level.var_fce03ebb07aa6a47 = [];
        level.var_fce03fbb07aa6c7a = [];
        level.var_8fd311aaa85b95cf = [];
        level.var_8fd312aaa85b9802 = [];
        thread function_f474574f5e52f583();
        contents = scripts\engine\trace::create_contents(0, 1, 1, 1, 0, 0, 1);
        org = scripts\engine\trace::sphere_trace(origin + (0, 0, var_e25c6801a01f7fce), origin + (0, 0, var_befd185e0007a7b8), var_e89346b6c5bfd043, undefined, contents)["<dev string:x12a9>"];
        checkheight = org[2] - var_fe52faf102ebf57b;
        count = 0;
        countglobal = 0;
        total = pow(2 * resolution / precision, 2) * 1;
        for (x = -1 * resolution; x <= resolution; x += precision) {
            host iprintlnbold("<dev string:x152e>" + int(countglobal / total * 100));
            for (y = -1 * resolution; y <= resolution; y += precision) {
                countglobal++;
                nextorg = (x + origin[0], y + origin[1], origin[2]);
                nextorg2 = droptogroundmultitrace(nextorg);
                count++;
                if (count >= var_1c8f7cdf53fa7b1f) {
                    waitframe();
                    count = 0;
                }
                if (nextorg2[2] < var_e0be8bb269d1b3ee) {
                    if (level.holesa.size > var_a3f2c8b5048491c9) {
                        break;
                    }
                    level.holesa[level.holesa.size] = nextorg + (0, 0, var_e25c6801a01f7fce);
                    level.holesb[level.holesb.size] = nextorg2;
                    continue;
                }
                count++;
                if (count >= var_1c8f7cdf53fa7b1f) {
                    waitframe();
                    count = 0;
                }
                var_e1acc589eb122473 = scripts\engine\utility::drop_to_ground(nextorg, var_e25c6801a01f7fce, var_befd185e0007a7b8, undefined, contents);
                if (var_e1acc589eb122473[2] < var_e0be8bb269d1b3ee) {
                    if (level.var_ca369ce88e799edd.size > var_a3f2c8b5048491c9) {
                        break;
                    }
                    level.var_ca369ce88e799edd[level.var_ca369ce88e799edd.size] = nextorg + (0, 0, var_e25c6801a01f7fce);
                    level.var_ca3699e88e799844[level.var_ca3699e88e799844.size] = nextorg2;
                    level.var_ca369ae88e799a77[level.var_ca369ae88e799a77.size] = var_e1acc589eb122473;
                    continue;
                }
                if (var_e1acc589eb122473[2] < checkheight && level.var_fce03ebb07aa6a47.size < var_177fceb85436c082) {
                    level.var_fce03ebb07aa6a47[level.var_fce03ebb07aa6a47.size] = nextorg + (0, 0, var_e25c6801a01f7fce);
                    level.var_fce03fbb07aa6c7a[level.var_fce03fbb07aa6c7a.size] = var_e1acc589eb122473;
                    continue;
                }
                if ((abs(x) == abs(resolution) || x + precision > resolution) && (abs(y) == abs(resolution) || y + precision > resolution)) {
                    level.var_8fd311aaa85b95cf[level.var_8fd311aaa85b95cf.size] = nextorg + (0, 0, var_e25c6801a01f7fce);
                    level.var_8fd312aaa85b9802[level.var_8fd312aaa85b9802.size] = nextorg2;
                }
            }
            if (level.holesa.size > var_a3f2c8b5048491c9 || level.var_ca369ce88e799edd.size > var_a3f2c8b5048491c9) {
                break;
            }
        }
        host iprintlnbold("<dev string:x1538>" + level.holesa.size + "<dev string:x1540>" + level.var_ca369ce88e799edd.size + "<dev string:x1550>" + level.var_fce03ebb07aa6a47.size);
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6760
    // Size: 0x19d
    function function_f474574f5e52f583() {
        level notify("<dev string:x1524>");
        level endon("<dev string:x1524>");
        while (true) {
            for (i = 0; i < level.holesa.size; i++) {
                orga = level.holesa[i];
                orgb = level.holesb[i];
                line(orga, orgb, (1, 0, 0), 1, 1, 1);
            }
            for (i = 0; i < level.var_ca369ce88e799edd.size; i++) {
                orga = level.var_ca369ce88e799edd[i];
                orgb = level.var_ca3699e88e799844[i];
                orgc = level.var_ca369ae88e799a77[i];
                line(orga, orgb, (1, 1, 0), 1, 1, 1);
                line(orgb, orgc, (1, 0, 0), 1, 1, 1);
            }
            for (i = 0; i < level.var_fce03ebb07aa6a47.size; i++) {
                orga = level.var_fce03ebb07aa6a47[i];
                orgb = level.var_fce03fbb07aa6c7a[i];
                line(orga, orgb, (1, 0, 1), 1, 1, 1);
            }
            for (i = 0; i < level.var_8fd311aaa85b95cf.size; i++) {
                orga = level.var_8fd311aaa85b95cf[i];
                orgb = level.var_8fd312aaa85b9802[i];
                line(orga, orgb, (0, 1, 0), 1, 1, 1);
            }
            waitframe();
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x6905
    // Size: 0x19d
    function function_237b71faf9fb62d9(player, contractref) {
        if (!isdefined(player)) {
            return;
        }
        playerorigin = player.origin;
        playerangles = player getplayerangles();
        playerforward = anglestoforward(playerangles);
        tracestart = (playerorigin[0], playerorigin[1], playerorigin[2] + player getplayerviewheight());
        traceend = tracestart + playerforward * 5000;
        tracecontents = scripts\engine\trace::create_default_contents(0);
        trace = scripts\engine\trace::ray_trace(tracestart, traceend, player, tracecontents);
        if (isdefined(trace["<dev string:x12ce>"]) || isalive(trace["<dev string:x12ce>"])) {
            namespace_1eb3c4e0e28fac71::function_22671614e8f79513(trace["<dev string:x12ce>"], contractref);
            return;
        }
        closestplayer = undefined;
        closestdist = 0;
        foreach (otherplayer in level.players) {
            if (otherplayer == player) {
                continue;
            }
            dist = distance2dsquared(otherplayer.origin, trace["<dev string:x12a9>"]);
            if (closestdist == 0 || dist < closestdist) {
                closestdist = dist;
                closestplayer = otherplayer;
            }
        }
        if (isdefined(closestplayer)) {
            namespace_1eb3c4e0e28fac71::function_22671614e8f79513(closestplayer, contractref);
            return;
        }
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x6aaa
    // Size: 0x16f
    function function_9503654ca3380f8a(args) {
        skin = undefined;
        if (args.size > 0) {
            skin = args[0];
        } else {
            skins = ["<dev string:x155a>", "<dev string:x156b>", "<dev string:x157c>", "<dev string:x158d>", "<dev string:x159e>", "<dev string:x15af>", "<dev string:x15c0>", "<dev string:x15d1>"];
            skin = array_random(skins);
        }
        body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(skin);
        head = namespace_465d40bb08a5337a::function_223061772e2a61b9(skin);
        if (body == "<dev string:xa31>" || head == "<dev string:xa31>") {
            return;
        }
        host = scripts\mp\gamelogic::gethostplayer();
        start = host geteye();
        dir = anglestoforward(host getplayerangles());
        end = start + 8000 * dir;
        trace = scripts\engine\trace::_bullet_trace(start, end, 1, host);
        if (trace["<dev string:x12a0>"] >= 1) {
            return;
        }
        neworigin = trace["<dev string:x12a9>"];
        newent = spawn("<dev string:x15e2>", neworigin);
        newent function_dd6d30b9ec87c1b3(body, head, "<dev string:x15ef>");
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x6c21
    // Size: 0x23
    function showsplash(splash, var_42b1e877ab187c6) {
        scripts\mp\hud_util::showsplashtoall(splash, undefined, undefined, undefined, undefined, var_42b1e877ab187c6);
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x6c4c
    // Size: 0x1c0
    function function_548e30d6072b85e9(player, amount) {
        var_affbd0043656d928 = ["<dev string:x1608>", "<dev string:x1618>", "<dev string:x1628>", "<dev string:x1638>", "<dev string:x164a>", "<dev string:xe9a>", "<dev string:xe7d>", "<dev string:x165d>", "<dev string:x1673>", "<dev string:x1693>", "<dev string:x16b9>", "<dev string:x16cc>", "<dev string:x149f>", "<dev string:x16e3>", "<dev string:x16fd>"];
        remainingloot = arraycopy(var_affbd0043656d928);
        dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
        for (i = 0; i < amount - 2; i++) {
            if (remainingloot.size == 0) {
                remainingloot = array_combine(var_affbd0043656d928);
            }
            lootname = random(remainingloot);
            remainingloot = array_remove(remainingloot, lootname);
            dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
            scripts\mp\gametypes\br_pickups::spawnpickup(lootname, dropinfo);
        }
        dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
        scripts\mp\gametypes\br_pickups::spawnpickup("<dev string:x1713>", dropinfo);
        weapon = player getcurrentprimaryweapon();
        dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
        scripts\mp\gametypes\br_pickups::spawnpickup(weapon.basename, dropinfo, 1, undefined, weapon);
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x6e14
    // Size: 0x237
    function function_510cb3df7efc44a7(player) {
        teammate = undefined;
        closestdist = 0;
        foreach (otherplayer in level.players) {
            if (isbot(otherplayer) && otherplayer.team == player.team) {
                dist = distance2dsquared(otherplayer.origin, player.origin);
                if (closestdist == 0 || dist < closestdist) {
                    closestdist = dist;
                    teammate = otherplayer;
                }
            }
        }
        if (!isdefined(teammate)) {
            return;
        }
        pingindex = undefined;
        pingdist = 0;
        playerorigin = player.origin;
        playerangles = player getplayerangles();
        playerforward = anglestoforward(playerangles);
        var_6e226a212b12f77f = (playerorigin[0], playerorigin[1], playerorigin[2] + player getplayerviewheight());
        var_b2e0a2db9493ce49 = 5000;
        var_1bd3970314fa9aea = var_6e226a212b12f77f + playerforward * var_b2e0a2db9493ce49;
        for (var_abc56346e63aa2e3 = 0; var_abc56346e63aa2e3 < 10; var_abc56346e63aa2e3++) {
            isowner = player scripts\cp_mp\calloutmarkerping::function_1e008bf9d31b2b01(var_abc56346e63aa2e3);
            if (isowner && player calloutmarkerping_getactive(var_abc56346e63aa2e3)) {
                pingorigin = player calloutmarkerping_getorigin(var_abc56346e63aa2e3);
                var_c8fb4167ea618ba8 = pointonsegmentnearesttopoint(var_6e226a212b12f77f, var_1bd3970314fa9aea, pingorigin);
                var_3a8a224f346d546f = distance(pingorigin, var_c8fb4167ea618ba8);
                if (!isdefined(pingindex) || var_3a8a224f346d546f < pingdist) {
                    pingindex = var_abc56346e63aa2e3;
                    pingdist = var_3a8a224f346d546f;
                }
            }
        }
        if (!isdefined(pingindex)) {
            return;
        }
        if (player function_9482e9c50b5fe82(teammate, pingindex)) {
            player function_69aa7fcdcfff4e0a(teammate, pingindex, 0);
            return;
        }
        player function_69aa7fcdcfff4e0a(teammate, pingindex, 1);
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x7053
    // Size: 0x37
    function function_5263a8371400329b() {
        level endon("<dev string:x1230>");
        namespace_27cdbf2464b21c84::function_ed4c2d913d203bf(level.players, "<dev string:x1730>");
        waitframe();
        namespace_27cdbf2464b21c84::function_ed4c2d913d203bf(level.players, "<dev string:x1744>");
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x7092
    // Size: 0x97
    function function_bfe726b5e0b35c27() {
        start = self geteye();
        dir = anglestoforward(self getplayerangles());
        end = start + 8000 * dir;
        trace = scripts\engine\trace::_bullet_trace(start, end, 1, self);
        player = undefined;
        if (isdefined(trace["<dev string:x12ce>"]) && isplayer(trace["<dev string:x12ce>"]) && isreallyalive(trace["<dev string:x12ce>"])) {
            player = trace["<dev string:x12ce>"];
        }
        return player;
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x7131
    // Size: 0x38
    function function_d3b9dc1b6f956ff8() {
        host = scripts\mp\gamelogic::gethostplayer();
        if (isdefined(host.savedloadout)) {
            host scripts\mp\gametypes\br::playerloadoutrestore();
            return;
        }
        host scripts\mp\gametypes\br::function_10ffa1071b1c2681();
    }

    // Namespace br_dev / scripts\mp\gametypes\br_dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x7171
    // Size: 0x48
    function function_533bda33b99fab22(victim, var_742e3b452c9bb9b0) {
        level endon("<dev string:x1230>");
        victim namespace_f8d3520d3483c1::function_13caa305c839a278("<dev string:x1757>", var_742e3b452c9bb9b0);
        waitframe();
        waitframe();
        waitframe();
        waitframe();
        waitframe();
        waitframe();
        waitframe();
        function_53a0f5e4d6bbc7a4(victim.name, undefined, 300);
    }

#/
