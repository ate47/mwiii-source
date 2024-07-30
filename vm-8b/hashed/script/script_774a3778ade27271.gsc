#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using script_64acb6ce534155b7;
#using script_728ffcee8cbf30ee;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\common\callbacks.gsc;
#using script_46cf752d93dc17b;
#using script_261e315c49e5e4ef;
#using scripts\common\devgui.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using script_14183df6f9af8737;
#using script_135f13d8aa1c1f19;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\dev.gsc;

#namespace namespace_5b571ef9950b8a9e;

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x4fa
// Size: 0x2e
function autoexec main() {
    utility::registersharedfunc("elite_resurgence", "get_contract_data", &getcontractdata);
    utility::registersharedfunc("elite_arrow_resurgence", "get_contract_data", &namespace_6c622b52017c6808::getcontractdata);
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x530
// Size: 0xf7
function getcontractdata(data) {
    quest_init();
    data.funcs["onInit"] = &function_e05bdb2a6122fe4a;
    data.funcs["onTeamAssigned"] = &function_89e3fc49199d2019;
    data.funcs["onCancel"] = &task_oncancel;
    data.funcs["onPlayerTearDown"] = &function_30ff47cffe7fca99;
    data.funcs["onPlayerAssimilated"] = &function_e16cc4efa3a21aad;
    data.funcs["onPlayerKilled"] = &task_onplayerkilled;
    data.funcs["onEliteTearDown"] = &function_63f50da280099f3f;
    data.funcs["getOnEliteDropQuestPayload"] = &function_2601f6b6db6b0e60;
    data.funcs["onPlayerRespawn"] = &namespace_2d7f47b19ccdb41d::function_dcf3929e77fe1de9;
    scripts\engine\utility::registersharedfunc("eliteArrow", "getBombsiteScriptable", &function_e7799b3ad0d7b9fd);
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x62f
// Size: 0x84
function function_e7799b3ad0d7b9fd() {
    gametype = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
    if (gametype == "resurgence" && level.arrow.elementorder[0] == "ber" && level.arrow.elementorder[1] == "nep" && level.arrow.elementorder[2] == "tri") {
        return "brloot_elite_arrow_bombsite_resurgence";
    }
    return undefined;
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6bc
// Size: 0x21
function quest_init() {
    function_adc3c411e839c811();
    function_63ede2e37ad0a069();
    function_89538dc128a24e58();
    /#
        function_5dee7155086e9ada();
    #/
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e5
// Size: 0xe2
function function_adc3c411e839c811() {
    level.var_5b571ef9950b8a9e = spawnstruct();
    level.var_5b571ef9950b8a9e.enabled = getdvarint(@"hash_84f986c445eddc92", 1);
    level.var_5b571ef9950b8a9e.splashenabled = getdvarint(@"hash_bd51e15ac642c7ac", 0);
    level.var_5b571ef9950b8a9e.var_ca3030ba010b4931 = getdvarint(@"hash_ef181ed4a0003ccb", 1);
    level.var_5b571ef9950b8a9e.var_85713cd02f5c4052 = getdvarfloat(@"hash_c08eafc166c9f3f0", 0.9);
    level.var_5b571ef9950b8a9e.var_b7c8a04fbbf0d563 = getdvarint(@"hash_9883680b3d43a62", 30);
    level.var_5b571ef9950b8a9e.lootcache = 0;
    function_6bc368988ece01a8();
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7cf
// Size: 0xd1
function function_6bc368988ece01a8() {
    level.var_5b571ef9950b8a9e.time = getdvarint(@"hash_e79dedeff3865070", function_ea591c2a379e3424("elite_resurgence"));
    times = [];
    times[times.size] = getdvarint(hashcat(@"hash_e79dedeff3865070", "_solos"), 260);
    times[times.size] = getdvarint(hashcat(@"hash_e79dedeff3865070", "_duos"), 390);
    times[times.size] = getdvarint(hashcat(@"hash_e79dedeff3865070", "_trios"), 485);
    times[times.size] = getdvarint(hashcat(@"hash_e79dedeff3865070", "_quads"), 605);
    level.var_5b571ef9950b8a9e.times = times;
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a8
// Size: 0x2b
function function_63ede2e37ad0a069() {
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("onResurgenceScoreworthyModifier", &function_c2e05bfedcc7179b);
    scripts\common\callbacks::add("br_supply_drops_init", &function_86eb339b3311543b);
    function_80f90963ddf8341c();
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8db
// Size: 0x39
function function_89538dc128a24e58() {
    assert(isdefined(game["<dev string:x1c>"]));
    game["dialog"]["arrow_first_timer"] = "recq_grav_q1ta";
    game["dialog"]["arrow_generic_timer"] = "recq_grav_cqgt";
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x91c
// Size: 0x5d
function function_86eb339b3311543b(params) {
    dropstruct = namespace_fd99f400a596934b::function_69b2e5235bfb7998("br_elite_resurgence_element_drop", "ks_airdrop_crate_br");
    dropstruct namespace_fd99f400a596934b::function_80e49e34fc8d70b8("br_elite_resurgence_element_drop", "planeDropRun", &namespace_f51c41a139e03299::function_4583dcd65450a629);
    dropstruct namespace_fd99f400a596934b::function_80e49e34fc8d70b8("br_elite_resurgence_element_drop", "spawnDropCrate", &task_dropcrate);
    dropstruct function_3719308fbf3bd1db();
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x981
// Size: 0xca
function function_3719308fbf3bd1db() {
    dropstruct = self;
    dropstruct.var_2e0d8ba0a46ce1b1 = 1;
    dropstruct.var_3077f6d3d97bb34b = getdvarint(@"hash_703ddc426e89229a", 1000);
    dropstruct.var_3c3ed534c61a56e4 = getdvarint(@"hash_5424b1706e3a3b09", 100);
    dropstruct.var_9612b650d147f458 = getdvarint(@"hash_fd2c28af75368793", 200);
    dropstruct.var_81986b2d8e843970 = getdvarint(@"hash_8e6c23761a0d2d56", level.var_5d2af95280a3cf58 * level.var_5d2af95280a3cf58 + 1);
    dropstruct.initialmove = 0;
    dropstruct.spawnsmoke = 0;
    dropstruct.var_30daf66a65a215e7 = 1;
}

/#

    // Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa53
    // Size: 0x44
    function function_5dee7155086e9ada() {
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x26>");
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x4b>", "<dev string:x66>", &function_1c35bcf919ecbf37);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x7d>", "<dev string:x8f>", &function_3f460c87ff0d374);
        scripts\common\devgui::function_fe953f000498048f();
    }

#/

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa9f
// Size: 0x13c
function function_f41c6714ec0d4ea3(timerpaused) {
    newvalue = self.var_8b96f28b4b926851 + 1;
    if (istrue(timerpaused) && !istrue(self.var_7f9b5c8a7bb44c10)) {
        newvalue += 4194304;
    }
    self.var_7f9b5c8a7bb44c10 = undefined;
    if (isdefined(self.var_d40dec94520dda24)) {
        eventid = scripts\mp\rank::function_1e00d01d19fde519(self.var_d40dec94520dda24);
        var_a4e353fa34a0f7bd = 0;
        if (!isdefined(eventid) || eventid < 0) {
            eventid = getscoreinfocategory(self.var_d40dec94520dda24, #"hash_edd89bb2cc2d506");
        } else {
            var_a4e353fa34a0f7bd = 1;
        }
        newvalue += (var_a4e353fa34a0f7bd << 10) + (eventid << 11);
    }
    teamplayers = teams::getteamdata(self.teams[0], "players");
    foreach (player in teamplayers) {
        player setclientomnvar("ui_elite_resurgence_timer", newvalue);
    }
    self.var_330ac03bfd4f17cc = undefined;
    self.var_d40dec94520dda24 = undefined;
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbe3
// Size: 0x47
function function_8d032f436b816d9d(success) {
    self notify("task_ended");
    self.ended = 1;
    thread function_8af2a0d1c41847e3();
    wait 1;
    endcontract(istrue(success) ? self.teams[0] : undefined);
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc32
// Size: 0x1c
function function_e05bdb2a6122fe4a() {
    if (!level.var_5b571ef9950b8a9e.enabled) {
        return false;
    }
    return true;
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc57
// Size: 0xca
function function_89e3fc49199d2019() {
    self.category = "elite_resurgence";
    teamname = self.teams[0];
    function_c28cf680f4d0d4dc(teamname);
    function_b76f3380abd30d8e();
    if (isdefined(self.payload) && self.payload.type == "elite_resurgence" && isdefined(self.payload.var_8b96f28b4b926851)) {
        time = self.payload.var_8b96f28b4b926851;
    } else {
        time = function_82579ba57b257de0(teamname);
        time = function_9b6275085fbcb8f4(time);
    }
    self.var_8b96f28b4b926851 = time;
    function_10af3c34cb23710f();
    function_f41c6714ec0d4ea3();
    thread function_aee8d19f56916dd7();
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd29
// Size: 0xa8
function function_82579ba57b257de0(teamname) {
    if (isdefined(level.var_5b571ef9950b8a9e.times)) {
        players = getteamdata(teamname, "players");
        var_e0bbe74095e09884 = int(clamp(players.size - 1, 0, level.var_5b571ef9950b8a9e.times.size));
        time = level.var_5b571ef9950b8a9e.times[var_e0bbe74095e09884];
        if (isdefined(time) && time > 0) {
            return time;
        }
    }
    return level.var_5b571ef9950b8a9e.time;
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xdda
// Size: 0x79
function function_30ff47cffe7fca99(player, oldteam, newteam) {
    if (oldteam == self.teams[0]) {
        if (!scripts\mp\gametypes\br_quest_util::isteamvalid(oldteam, level.contractmanager.defaultfilter)) {
            thread task_oncancel(oldteam);
            return;
        }
        player uiobjectivehide();
        if (isdefined(self.objectiveiconid)) {
            objective_removeclientfrommask(self.objectiveiconid, player);
        }
    }
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe5b
// Size: 0x56
function function_e16cc4efa3a21aad(player, oldteam, newteam) {
    if (!isdefined(self.vehicle)) {
        return;
    }
    if (newteam == self.teams[0]) {
        objective_addclienttomask(self.objectiveiconid, player);
        player uiobjectiveshow("elite_resurgence");
    }
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeb9
// Size: 0x25
function task_oncancel(team) {
    if (istrue(self.teams[0] == team)) {
        thread function_8d032f436b816d9d(0);
    }
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xee6
// Size: 0x4c
function function_c28cf680f4d0d4dc(team) {
    if (level.var_5b571ef9950b8a9e.splashenabled) {
        displayteamsplash(team, "br_elite_resurgence_start");
    }
    displaysquadmessagetoteam(team, self.var_d154ac2657c5f44, 6, getquestindex("elite_resurgence"));
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf3a
// Size: 0x2
function function_b76f3380abd30d8e() {
    
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf44
// Size: 0x2
function function_75719462a6e4937f() {
    
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf4e
// Size: 0x103
function task_onplayerkilled(attacker, victim) {
    team = victim.team;
    if (team == self.teams[0]) {
        penalty = victim namespace_6176022cc9d5b3f::getrespawndelay();
        penalty *= level.var_5b571ef9950b8a9e.var_ca3030ba010b4931;
        self.var_8b96f28b4b926851 += penalty;
        self.var_7f9b5c8a7bb44c10 = 1;
        playercount = scripts\mp\utility\teams::getteamdata(team, "teamCount");
        alivecount = scripts\mp\utility\teams::getteamdata(team, "aliveCount");
        var_ca7fce2f16d8d108 = playercount == 1 ? playercount == alivecount : playercount == alivecount + 1;
        self.var_1c936f76cb45c26b = var_ca7fce2f16d8d108 ? penalty : self.var_1c936f76cb45c26b + penalty;
        if (var_ca7fce2f16d8d108 && !function_94b58e83cf516837(team)) {
            self.var_e68564659cd968ef = gettime();
        }
    }
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1059
// Size: 0x6c
function function_63f50da280099f3f(team) {
    if (isdefined(self.crate)) {
        self.crate function_7bb18b32417b36ca();
        self.crate setscriptablepartstate(#"capture", #"fade", 0);
        self.crate setscriptablepartstate(#"visibility", #"hide", 0);
    }
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10cd
// Size: 0xa9
function function_2601f6b6db6b0e60() {
    payload = spawnstruct();
    payload.type = "elite_resurgence";
    payload.time = int(max(namespace_6c622b52017c6808::function_d47c61711c9c094c(), 2));
    if (!istrue(self.var_279c65c589aab601)) {
        timer = self.var_8b96f28b4b926851;
        if (isdefined(self.var_e68564659cd968ef)) {
            timer -= gettime() - self.var_e68564659cd968ef;
        }
        timer -= self.var_1c936f76cb45c26b;
        payload.var_8b96f28b4b926851 = int(max(timer, 5));
    }
    return payload;
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x117f
// Size: 0xce
function function_aee8d19f56916dd7() {
    level endon("game_ended");
    team = self.teams[0];
    teaminfo = level.arrow.teaminfo[team];
    teaminfo endon("on_end");
    for (var_7bad97b69c3e29dd = 0; self.var_8b96f28b4b926851 > 0; var_7bad97b69c3e29dd = !var_7bad97b69c3e29dd) {
        wait 0.5;
        timerpaused = 1;
        function_10af3c34cb23710f();
        if (function_94b58e83cf516837(self.teams[0])) {
            timerpaused = 0;
            if (self.var_8b96f28b4b926851 > 0 && istrue(var_7bad97b69c3e29dd)) {
                self.var_8b96f28b4b926851 -= 1;
            }
        }
        function_f41c6714ec0d4ea3(timerpaused);
    }
    function_aa9b266dda4f7272();
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1255
// Size: 0x40
function function_10af3c34cb23710f() {
    team = self.teams[0];
    if (function_94b58e83cf516837(team)) {
        uiobjectiveshowtoteam("elite_resurgence", team);
        return;
    }
    uiobjectiveshowtoteam("elite_resurgence_loot", team);
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x129d
// Size: 0x33
function function_94b58e83cf516837(team) {
    teaminfo = level.arrow.teaminfo[team];
    return teaminfo namespace_6c622b52017c6808::function_6085101092321954();
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d9
// Size: 0x82
function function_aa9b266dda4f7272() {
    if (istrue(self.var_111844fa2d5f6b02)) {
        return;
    }
    self.var_111844fa2d5f6b02 = 1;
    self.activeteam = self.teams[0];
    uiobjectiveshowtoteam("elite_resurgence_loot", self.activeteam);
    spawnorigin = function_9cab914019e4dbba(self.activeteam);
    plane = namespace_fd99f400a596934b::function_1a01863a6ec2ad05(spawnorigin, "br_elite_resurgence_element_drop");
    plane.task = self;
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1363
// Size: 0x13f
function function_c2e05bfedcc7179b(player, var_3056bd5b2b8e47e5) {
    if (!isdefined(level.var_81e77c935dfefd11)) {
        return;
    }
    if (!isdefined(player) || !isdefined(player.team)) {
        return;
    }
    if (!namespace_b11d742e70949af1::function_73689348205a9057(player.team)) {
        return;
    }
    task = level.contractmanager.var_b6fae9c9655c73bf[player.team];
    if (!isdefined(task)) {
        return;
    }
    if (task.category != "elite_resurgence") {
        return;
    }
    if (!function_94b58e83cf516837(player.team)) {
        return;
    }
    task.var_8b96f28b4b926851 = int(max(0, task.var_8b96f28b4b926851 - var_3056bd5b2b8e47e5.delaymodifier));
    if (isdefined(var_3056bd5b2b8e47e5.event) && (!isdefined(task.var_330ac03bfd4f17cc) || var_3056bd5b2b8e47e5.delaymodifier < task.var_330ac03bfd4f17cc)) {
        task.var_d40dec94520dda24 = var_3056bd5b2b8e47e5.event;
        task.var_330ac03bfd4f17cc = var_3056bd5b2b8e47e5.delaymodifier;
    }
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14aa
// Size: 0x149
function task_dropcrate(dropend, dropstruct) {
    team = self.task.teams[0];
    if (!namespace_6c622b52017c6808::function_2eac770cf8006e0b(team)) {
        return;
    }
    crate = scripts\cp_mp\killstreaks\airdrop::dropcrate(undefined, undefined, "br_elite_resurgence_element_drop", self.origin, (0, randomfloat(360), 0), dropend);
    if (isdefined(crate)) {
        crate.skipminimapicon = 1;
        crate setscriptablepartstate(#"objective_map", #"hash_e0257dc3ae9c640c", 0);
        crate.smokesignal = spawn("script_model", dropend);
        crate.smokesignal setmodel("ks_airdrop_crate_br");
        crate.smokesignal setscriptablepartstate(#"smoke_signal", #"hash_681713bdddb46d8e", 0);
    }
    crate.task = self.task;
    self.task.crate = crate;
    if (isdefined(crate.task.activeteam)) {
        function_c94f59f543708f7d(crate.task.activeteam);
    }
    return crate;
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15fc
// Size: 0x5e
function function_c94f59f543708f7d(team) {
    teaminfo = level.arrow.teaminfo[team];
    dialog = teaminfo.firstpickups > 0 ? "arrow_generic_timer" : "arrow_first_timer";
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam(dialog, team);
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1662
// Size: 0xfd
function function_9cab914019e4dbba(team) {
    players = scripts\mp\utility\teams::getteamdata(team, "alivePlayers");
    droppos = (0, 0, 0);
    if (players.size > 0) {
        foreach (player in players) {
            droppos += player.origin;
        }
        droppos /= players.size;
    }
    safepos = scripts\mp\gametypes\br_circle::function_177e9958fce17793(droppos, level.var_5b571ef9950b8a9e.var_85713cd02f5c4052, level.var_5b571ef9950b8a9e.var_b7c8a04fbbf0d563, 1);
    if (isdefined(safepos)) {
        droppos = safepos;
    }
    droplocation = function_ba5504c9ef2acc0(droppos + (0, 0, 500));
    return droppos;
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1768
// Size: 0x80
function function_ba5504c9ef2acc0(starttrace) {
    droplocation = undefined;
    endtrace = starttrace - (0, 0, 20000);
    var_404ee298808e4e1b = scripts\engine\trace::create_contents(0, 1, 1, 1, 0, 1, 0);
    trace = scripts\engine\trace::ray_trace(starttrace, endtrace, undefined, var_404ee298808e4e1b);
    if (isdefined(trace) && trace["hittype"] != "hittype_none") {
        droplocation = trace["position"];
    }
    return droplocation;
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17f1
// Size: 0x164
function function_a1ea17b3a2931b82(player) {
    team = self.task.teams[0];
    if (!namespace_6c622b52017c6808::function_2eac770cf8006e0b(team)) {
        return;
    }
    task = self.task;
    task.var_279c65c589aab601 = 1;
    task notify("task_ended");
    task endcontract(team);
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    dropinfo = spawnstruct();
    dropinfo.origin = self.origin;
    dropinfo.angles = self.angles;
    dropinfo.itemsdropped = 0;
    items = getscriptcachecontents("br_elite_resurgence_crate", level.var_5b571ef9950b8a9e.lootcache);
    if (isdefined(items)) {
        pickupents = dropinfo scripts\mp\gametypes\br_lootcache::lootspawnitemlist(dropstruct, items, 1, player);
    }
    level.var_5b571ef9950b8a9e.lootcache = (level.var_5b571ef9950b8a9e.lootcache + 1) % 10;
    element = namespace_6c622b52017c6808::function_f517a8eefb0eb61a(team);
    namespace_6c622b52017c6808::function_cc25131864fa213c(team, dropinfo.origin, dropinfo.angles, element, dropstruct);
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x195d
// Size: 0x1c
function function_8af2a0d1c41847e3() {
    if (checkforactiveobjicon()) {
        deletequestobjicon();
        self.objectiveiconid = undefined;
    }
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1981
// Size: 0x108
function function_80f90963ddf8341c() {
    leveldata = scripts\cp_mp\killstreaks\airdrop::getleveldata("br_elite_resurgence_element_drop");
    leveldata.capturestring = %MP/BR_CRATE_ELITE;
    leveldata.basemodel = "military_carepackage_01_elite_chopper";
    leveldata.mountmantlemodel = undefined;
    leveldata.supportsownercapture = 0;
    leveldata.headicon = undefined;
    leveldata.usepriority = -1;
    leveldata.usefov = 180;
    leveldata.timeout = 600;
    leveldata.friendlyuseonly = 1;
    leveldata.ownerusetime = 0.5;
    leveldata.otherusetime = 0.5;
    leveldata.activatecallback = &function_71bbbcba8da1ccbc;
    leveldata.capturecallback = &function_17236ea7aa75d43b;
    leveldata.destroycallback = &function_3b0a58fc8512cd37;
    leveldata.destroyoncapture = 1;
    leveldata.isdropcrate = 1;
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a91
// Size: 0xb
function function_71bbbcba8da1ccbc(isfirstactivation) {
    
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1aa4
// Size: 0x1a
function function_17236ea7aa75d43b(player) {
    function_a1ea17b3a2931b82(player);
    function_7bb18b32417b36ca();
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac6
// Size: 0x12
function function_3b0a58fc8512cd37(immediate) {
    function_7bb18b32417b36ca();
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ae0
// Size: 0x5a
function function_7bb18b32417b36ca() {
    self setscriptablepartstate(#"objective_map", #"inactive", 0);
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate(#"smoke_signal", #"off", 0);
        self.smokesignal delete();
    }
}

// Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b42
// Size: 0xb8
function function_ccd9c8a4c38baaff(position, destination) {
    crate = dropcrate(undefined, undefined, "br_elite_resurgence_element_drop", position, (0, randomfloat(360), 0), destination);
    if (isdefined(crate)) {
        crate.skipminimapicon = 1;
        crate setscriptablepartstate(#"objective_map", #"hash_e0257dc3ae9c640c", 0);
        crate.smokesignal = spawn("script_model", destination);
        crate.smokesignal setmodel("ks_airdrop_crate_br");
        crate.smokesignal setscriptablepartstate(#"smoke_signal", #"hash_681713bdddb46d8e", 0);
    }
    return crate;
}

/#

    // Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c03
    // Size: 0x57
    function function_1c35bcf919ecbf37() {
        host = scripts\mp\dev::devfindhost();
        println("<dev string:xa6>");
        println("<dev string:xca>");
        println("<dev string:xed>" + level.var_5b571ef9950b8a9e.enabled);
        println("<dev string:xa6>");
    }

    // Namespace namespace_5b571ef9950b8a9e / namespace_cc912e9fc04cdf93
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c62
    // Size: 0x16
    function function_3f460c87ff0d374() {
        setdvar(@"hash_ecb5e1553c7d66d2", 1);
    }

#/
