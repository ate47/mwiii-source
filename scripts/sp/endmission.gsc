#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_575fda2758b0a36e;
#using scripts\sp\analytics.gsc;

#namespace namespace_ba235658cd692ae8;

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x280
// Size: 0x16d
function main() {
    missionsettings = createmission();
    level.missionsettings = missionsettings;
    level.lowestgameskill = getdvarint(@"g_gameskill");
    nil = undefined;
    var_e55705af85d11cb9 = function_91d6763e1921a524();
    foreach (mapinfo in var_e55705af85d11cb9) {
        var_f9e628cf36da6985 = undefined;
        if (isdefined(mapinfo.var_f9e628cf36da6985)) {
            var_f9e628cf36da6985 = strtok(mapinfo.var_f9e628cf36da6985, ", ");
        }
        settletime = default_to(mapinfo.settletime, 10);
        clientsettletime = default_to(mapinfo.clientsettletime, 100);
        var_24407299b37c0607 = mapinfo.var_dd5f1ceda1154582;
        addlevel(mapinfo.mapname, 0, nil, 1, nil, settletime, clientsettletime, nil, var_f9e628cf36da6985, 0, var_24407299b37c0607);
    }
    if (isdefined(level.endmission_main_func)) {
        [[ level.endmission_main_func ]]();
        level.endmission_main_func = undefined;
    }
    /#
        thread function_b47ee5b0dae14294();
    #/
    thread debug_test_next_mission();
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f5
// Size: 0x61
function debug_test_next_mission() {
    version = getbuildversion();
    if (version == "SHIP") {
        return;
    }
    setdvarifuninitialized(@"hash_1b003ace1ee16807", 0);
    wait 10;
    while (getdvarint(@"hash_1b003ace1ee16807") < 1) {
        wait 3;
    }
    setdvar(@"hash_1b003ace1ee16807", 0);
    nextmission_internal();
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x45e
// Size: 0x150
function nextmission_preload_internal(type, var_740cf07d74dba935) {
    if (!isdefined(type)) {
        type = "full";
    }
    if (!isdefined(var_740cf07d74dba935)) {
        var_740cf07d74dba935 = 1;
    }
    var_3012abbf8b098d0f = level.missionsettings getlevelindex(level.script);
    var_ad4e2213692993b6 = var_3012abbf8b098d0f + 1;
    preload_transients = level.missionsettings.levels[var_ad4e2213692993b6].preload_transients;
    if (var_740cf07d74dba935) {
        level thread nextmission_primeloadbink();
    }
    if (getdvarint(@"hash_b61ca996f1ab8a8", 1)) {
        levelname = level.missionsettings getlevelname(var_ad4e2213692993b6);
        switch (type) {
        case #"hash_af9a1714fe58109c": 
            if (isdefined(preload_transients)) {
                array = array_combine([levelname], preload_transients);
                preloadzones(array);
            } else {
                preloadzones(levelname);
            }
            break;
        case #"hash_4d3e1f9017db6ba5": 
            preloadzones(levelname);
            break;
        case #"hash_ce8bfbd622fff22a": 
            if (isdefined(preload_transients)) {
                preloadzones(preload_transients);
            }
            break;
        }
        while (!ispreloadzonescomplete()) {
            waitframe();
        }
    }
    flag_set("nextmission_preload_complete");
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b6
// Size: 0xf9
function nextmission_primeloadbink_internal() {
    if (!isdefined(getlevelindex(level.script)) || !isdefined(getlevelindex(level.script) + 1)) {
        return;
    }
    if (!flag_exist("nextmission_transition_bink_primed")) {
        flag_init("nextmission_transition_bink_primed");
    }
    var_ad4e2213692993b6 = getlevelindex(level.script) + 1;
    var_1b5061c6c41a4d30 = getlevelbink(var_ad4e2213692993b6);
    setsaveddvar(@"bg_cinematicFullscreen", "0");
    setsaveddvar(@"bg_cinematicCanPause", "1");
    stopcinematicingame();
    waitframe();
    if (!isdefined(var_1b5061c6c41a4d30)) {
        /#
            iprintlnbold("<dev string:x1c>");
        #/
        var_1b5061c6c41a4d30 = "default";
    }
    cinematicingame(var_1b5061c6c41a4d30, 1, 1, 1, 0, 0, 1);
    while (!iscinematicplaying()) {
        waitframe();
    }
    println("<dev string:x84>" + var_1b5061c6c41a4d30);
    flag_set("nextmission_transition_bink_primed");
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6b7
// Size: 0x6f
function getrestartlevel(levelname) {
    if (!isdefined(level.missionsettings)) {
        return undefined;
    }
    index = getlevelindex(levelname);
    if (isdefined(level.missionsettings.levels[index].restartlevel)) {
        return level.missionsettings.levels[index].restartlevel;
    }
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72e
// Size: 0x52
function level_settle_time_get(levelname) {
    assert(isdefined(levelname));
    index = getlevelindex(levelname);
    if (!isdefined(index)) {
        return 0;
    }
    return level.missionsettings.levels[index].settletime;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x788
// Size: 0x52
function client_settle_time_get(levelname) {
    assert(isdefined(levelname));
    index = getlevelindex(levelname);
    if (!isdefined(index)) {
        return 0;
    }
    return level.missionsettings.levels[index].clientsettletime;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e2
// Size: 0x94
function level_settle_time_wait(levelname) {
    if (!isdefined(levelname)) {
        levelname = level.script;
    }
    settletime = level_settle_time_get(levelname);
    clientsettletime = client_settle_time_get(levelname);
    if (!isdefined(settletime)) {
        settletime = 0;
    }
    if (!isdefined(clientsettletime)) {
        clientsettletime = 0;
    } else {
        clientsettletime *= 0.02;
    }
    var_814a0605452d6c7 = settletime + clientsettletime;
    if (isdefined(var_814a0605452d6c7)) {
        wait var_814a0605452d6c7 * 0.05;
    }
    if (isdefined(clientsettletime) && clientsettletime <= 0) {
        waitframe();
        return;
    }
    if (!isdefined(settletime) || settletime <= 0) {
        waitframe();
    }
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x87e
// Size: 0x52
function function_65085d2b5d1f245c() {
    difficultystring = "";
    var_58af24983c50b5f1 = level.player function_ff103db8e0d75209();
    for (index = 0; index < var_58af24983c50b5f1.size; index++) {
        difficultystring += string(var_58af24983c50b5f1[index]);
    }
    return difficultystring;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8d9
// Size: 0x68f
function nextmission_internal() {
    /#
        if (getdvarint(@"hash_bb95f621f8f2a810")) {
            iprintlnbold("<dev string:x95>");
            return;
        }
    #/
    if (utility::is_demo()) {
        if (isdefined(level.nextmission_exit_time)) {
            changelevel("", 0, level.nextmission_exit_time);
            return;
        }
        changelevel("", 0);
        return;
    }
    scripts\sp\analytics::analytics_upload_during_nextmission();
    level notify("nextmission");
    level.nextmission = 1;
    level.player enableinvulnerability();
    var_3012abbf8b098d0f = undefined;
    setdvar(@"hash_8c684d38f4200b12", "0");
    setdvar(@"hash_b5229012ccf8e014", "");
    setdvar(@"hash_3e810e7dcf052f5d", level.script);
    game["previous_map"] = undefined;
    var_3012abbf8b098d0f = getlevelindex(level.script);
    if (!isdefined(var_3012abbf8b098d0f)) {
        missionsuccess(level.script);
        return;
    }
    if (!is_lastlevel()) {
        scripts\engine\sp\utility::level_end_save();
    } else {
        var_5963a57373cba5b4 = "none";
        level.player setplayerprogression("currentMission", var_5963a57373cba5b4);
    }
    setlevelcompleted(var_3012abbf8b098d0f);
    collateraldamageassessment(level.script);
    println("<dev string:xb5>");
    var_e1f111891b10722c = updatesppercent();
    /#
        if (getdvarint(@"hash_bc76f1b9a1f7ba07") != 0) {
            highestmission_ifnotcheating_set(getdvarint(@"hash_b50de240594f8df4"));
            level.missionsettings setlevelcompleted(max(0, getdvarint(@"hash_b50de240594f8df4") - 1));
            setdvar(@"hash_bc76f1b9a1f7ba07", "<dev string:xe3>");
        }
        if (var_e1f111891b10722c < level.player getplayerprogression("<dev string:xe4>")) {
            println("<dev string:xf6>" + var_e1f111891b10722c + "<dev string:x118>" + level.player getplayerprogression("<dev string:xe4>") + "<dev string:x121>");
        }
        println("<dev string:x126>" + getdvarint(@"hash_bc76f1b9a1f7ba07") + "<dev string:x143>" + getdvarint(@"hash_1adbe88f794c0245") + "<dev string:x14e>");
        println("<dev string:x151>" + function_65085d2b5d1f245c() + "<dev string:x16d>");
        println("<dev string:x16f>" + var_e1f111891b10722c / 100 + "<dev string:x18e>");
        println("<dev string:x191>" + var_3012abbf8b098d0f + "<dev string:x16d>");
        println("<dev string:x1a8>" + level.script + "<dev string:x16d>");
        println("<dev string:x1bf>" + level.missionsettings.levels.size + "<dev string:x16d>");
    #/
    updategamerprofile();
    if (level.missionsettings hasachievement(var_3012abbf8b098d0f)) {
        scripts\sp\utility::giveachievement_wrapper(level.missionsettings getachievement(var_3012abbf8b098d0f));
    }
    if (level.missionsettings haslevelveteranaward(var_3012abbf8b098d0f) && getlevelcompleted(var_3012abbf8b098d0f) == 4 && level.missionsettings check_other_haslevelveteranachievement(var_3012abbf8b098d0f)) {
        scripts\sp\utility::giveachievement_wrapper(level.missionsettings getlevelveteranaward(var_3012abbf8b098d0f));
    }
    if (level.missionsettings hasmissionhardenedaward() && level.missionsettings getlowestskill() > 2) {
        giveachievement_wrapper(level.missionsettings gethardenedaward());
    }
    scripts\sp\analytics::start_point_update("mission_end", 1);
    if (function_8f7452209f2fa982()) {
        if (isdefined(level.var_483eedd411ddb20e) && level.script != "gunship_compound") {
            function_cd65c2cdeeb89a30(level.var_483eedd411ddb20e, "completed");
        }
    }
    if (is_lastlevel()) {
        changelevel("", 0);
        return;
    }
    var_ad4e2213692993b6 = var_3012abbf8b098d0f + 1;
    assert(var_ad4e2213692993b6 < level.missionsettings.levels.size);
    var_1b5061c6c41a4d30 = getlevelbink(var_ad4e2213692993b6);
    var_b02ce1c02cd503c9 = level.missionsettings getlevelname(var_ad4e2213692993b6);
    var_7291ff60dd218210 = function_b146e0d2e5d91eef(var_b02ce1c02cd503c9);
    /#
        println("<dev string:x1d6>" + var_b02ce1c02cd503c9 + "<dev string:x16d>");
        println("<dev string:x1ed>" + var_7291ff60dd218210.var_60699f6be12aea0d + "<dev string:x16d>");
    #/
    if (isdefined(var_1b5061c6c41a4d30) && !istrue(level.endmission_bink_skip)) {
        println("<dev string:x20a>" + var_1b5061c6c41a4d30 + "<dev string:x16d>");
        setdvar(@"hash_4967b5f5316f16af", var_1b5061c6c41a4d30);
        if (!flag_exist("nextmission_transition_bink_primed")) {
            flag_init("nextmission_transition_bink_primed");
        }
        setomnvar("ui_hide_hud", 1);
        if (!level.player islinked()) {
            tag = level.player spawn_tag_origin();
            level.player playerlinktoabsolute(tag);
        }
        level.player freezecontrols(1);
        if (flag("nextmission_transition_bink_primed")) {
            /#
                print("<dev string:x223>");
            #/
            setsaveddvar(@"bg_cinematicFullscreen", "1");
            setsaveddvar(@"bg_cinematicCanPause", "1");
            pausecinematicingame(0);
        } else {
            /#
                print("<dev string:x246>");
            #/
            setsaveddvar(@"bg_cinematicFullscreen", "1");
            setsaveddvar(@"bg_cinematicCanPause", "1");
            flags = 128 | 2048 | 8192;
            if (var_7291ff60dd218210.var_60699f6be12aea0d) {
                flags |= 33554432;
            }
            cinematicingame(var_1b5061c6c41a4d30, flags);
        }
    }
    scripts\sp\analytics::analytics_lui_mission_end_dlog();
    if (level.missionsettings getlevelstreamsync(var_ad4e2213692993b6)) {
        setstreamsynconnextlevel();
    }
    if (var_7291ff60dd218210.var_60699f6be12aea0d) {
        wait 1;
        function_bb63844d1b8da6ae(var_b02ce1c02cd503c9);
        return;
    }
    if (isdefined(level.missionsettings getfadetime(var_3012abbf8b098d0f))) {
        changelevel(var_b02ce1c02cd503c9, level.missionsettings getkeepweapons(var_3012abbf8b098d0f), level.missionsettings getfadetime(var_3012abbf8b098d0f));
        return;
    }
    changelevel(var_b02ce1c02cd503c9, level.missionsettings getkeepweapons(var_3012abbf8b098d0f));
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf70
// Size: 0x6d
function collateraldamageassessment(levelname) {
    var_92ff386352d386a0 = getcollateraldamagegrade();
    level.player setplayerprogression("civiliansKilledGrade", levelname, var_92ff386352d386a0);
    best = level.player getplayerprogression("civiliansKilledGradeBest", levelname);
    if (var_92ff386352d386a0 > best) {
        level.player setplayerprogression("civiliansKilledGradeBest", levelname, var_92ff386352d386a0);
    }
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfe5
// Size: 0x3f
function getcollateraldamagegrade() {
    var_d40d6d92361e9a2 = 4;
    var_92ff386352d386a0 = int(min(level.friendlyfire["civilians_killed"], var_d40d6d92361e9a2));
    var_92ff386352d386a0 = var_d40d6d92361e9a2 - var_92ff386352d386a0;
    return int(var_92ff386352d386a0);
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x102d
// Size: 0x66
function updatesppercent() {
    var_e1f111891b10722c = int(gettotalpercentcompletesp() * 100);
    if (getdvarint(@"mis_cheat") == 0) {
        assertex(var_e1f111891b10722c >= 0 && var_e1f111891b10722c <= 10000, "SP's Completion percentage [ " + var_e1f111891b10722c + "% ] is outside of 0 to 100 range!");
        level.player setplayerprogression("percentCompleteSP", var_e1f111891b10722c);
    }
    return var_e1f111891b10722c;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x109c
// Size: 0x41
function addprereq(missionindex) {
    var_82b6d1fbefcc5fae = level.missionsettings.prereqs.size;
    level.missionsettings.prereqs[var_82b6d1fbefcc5fae] = missionindex;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10e5
// Size: 0x75
function getpostloadbink(levelname) {
    assert(isdefined(levelname));
    index = getlevelindex(levelname);
    if (isdefined(index)) {
        if (isdefined(level.missionsettings.levels[index].postloadbink)) {
            return level.missionsettings.levels[index].postloadbink;
        }
    }
    return "none";
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1163
// Size: 0x20
function getlevelname(var_3012abbf8b098d0f) {
    return self.levels[var_3012abbf8b098d0f].name;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x118c
// Size: 0x5a
function function_823f915153b5fcd8() {
    if (level.missionsettings.levels.size == 0) {
        return level.script;
    }
    return level.missionsettings.levels[level.missionsettings.levels.size - 1].name;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11ef
// Size: 0x20
function getkeepweapons(var_3012abbf8b098d0f) {
    return self.levels[var_3012abbf8b098d0f].keepweapons;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1218
// Size: 0x20
function getachievement(var_3012abbf8b098d0f) {
    return self.levels[var_3012abbf8b098d0f].achievement;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1241
// Size: 0x20
function getlevelveteranaward(var_3012abbf8b098d0f) {
    return self.levels[var_3012abbf8b098d0f].veteran_achievement;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x126a
// Size: 0x20
function getlevelstreamsync(var_3012abbf8b098d0f) {
    return self.levels[var_3012abbf8b098d0f].streamsync;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1293
// Size: 0x34
function setfadetime(index, time) {
    level.missionsettings.levels[index].fade_time = time;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12cf
// Size: 0x3b
function getfadetime(index) {
    if (!isdefined(self.levels[index].fade_time)) {
        return undefined;
    }
    return self.levels[index].fade_time;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1313
// Size: 0x2c
function haslevelveteranaward(var_3012abbf8b098d0f) {
    if (isdefined(self.levels[var_3012abbf8b098d0f].veteran_achievement)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1347
// Size: 0x2c
function hasachievement(var_3012abbf8b098d0f) {
    if (isdefined(self.levels[var_3012abbf8b098d0f].achievement)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x137b
// Size: 0x81
function check_other_haslevelveteranachievement(var_3012abbf8b098d0f) {
    for (i = 0; i < self.levels.size; i++) {
        if (i == var_3012abbf8b098d0f) {
            continue;
        }
        if (!haslevelveteranaward(i)) {
            continue;
        }
        if (self.levels[i].veteran_achievement == self.levels[var_3012abbf8b098d0f].veteran_achievement) {
            if (getlevelcompleted(i) < 4) {
                return false;
            }
        }
    }
    return true;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1405
// Size: 0xb
function gethardenedaward() {
    return self.hardenedaward;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1419
// Size: 0x17
function hasmissionhardenedaward() {
    if (isdefined(self.hardenedaward)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1438
// Size: 0x1af
function gettotalpercentcompletesp() {
    var_a5da2519a559b16b = max(getstat_progression(1), getstat_progression(2));
    var_870ca0c572d3b097 = 0.5;
    println("<dev string:x26d>" + var_a5da2519a559b16b + "<dev string:x282>" + "<dev string:x284>" + var_870ca0c572d3b097 * 100 + "<dev string:x286>");
    var_44a90f29ee2b00ff = getstat_progression(3);
    var_be0978ec6507b6f3 = 0.25;
    println("<dev string:x289>" + var_44a90f29ee2b00ff + "<dev string:x282>" + "<dev string:x284>" + var_be0978ec6507b6f3 * 100 + "<dev string:x286>");
    var_7bcbe5e3d1151d8b = getstat_progression(4);
    var_286fdc6f7b7f3ef7 = 0.1;
    println("<dev string:x29f>" + var_7bcbe5e3d1151d8b + "<dev string:x282>" + "<dev string:x284>" + var_286fdc6f7b7f3ef7 * 100 + "<dev string:x286>");
    var_40b251f18dfa02cc = getstat_intel();
    var_64951e461b04a4c0 = 0.15;
    println("<dev string:x2b4>" + var_40b251f18dfa02cc + "<dev string:x282>" + "<dev string:x284>" + var_64951e461b04a4c0 * 100 + "<dev string:x286>");
    assertex(var_870ca0c572d3b097 + var_be0978ec6507b6f3 + var_286fdc6f7b7f3ef7 + var_64951e461b04a4c0 <= 1, "Total sum of SP progress breakdown contributes to more than 100%!");
    var_d40a0853f6656185 = 0;
    var_d40a0853f6656185 += var_870ca0c572d3b097 * var_a5da2519a559b16b;
    var_d40a0853f6656185 += var_be0978ec6507b6f3 * var_44a90f29ee2b00ff;
    var_d40a0853f6656185 += var_286fdc6f7b7f3ef7 * var_7bcbe5e3d1151d8b;
    var_d40a0853f6656185 += var_64951e461b04a4c0 * var_40b251f18dfa02cc;
    assertex(var_d40a0853f6656185 <= 100, "Total Percentage calculation is out of bound, larger then 100%");
    println("<dev string:x2c7>" + var_d40a0853f6656185 + "<dev string:x282>");
    return var_d40a0853f6656185;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15f0
// Size: 0xe4
function getstat_progression(difficulty) {
    assert(isdefined(level.missionsettings));
    assert(isdefined(level.script));
    var_315582283fa4e062 = level.player function_ff103db8e0d75209();
    levels = 0;
    var_c51133d2565044c9 = [];
    skipped = 0;
    missioncount = min(var_315582283fa4e062.size, level.missionsettings.levels.size - 1);
    for (i = 0; i < missioncount; i++) {
        if (var_315582283fa4e062[i] >= difficulty) {
            levels++;
        }
    }
    completion = levels / (level.missionsettings.levels.size - 1) * 100;
    return completion;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16dd
// Size: 0x1b
function getstat_intel() {
    return level.player getplayerprogression("cheatPoints") / 45 * 100;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1701
// Size: 0x1a
function getlevelcompleted(var_3012abbf8b098d0f) {
    return level.player function_b3bf603811212474(var_3012abbf8b098d0f);
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1724
// Size: 0x61
function setlevelcompleted(var_3012abbf8b098d0f) {
    levelprogressioncomplete(var_3012abbf8b098d0f);
    var_a22f6f453396a4f0 = level.player function_b3bf603811212474(var_3012abbf8b098d0f);
    if (level.lowestgameskill + 1 > var_a22f6f453396a4f0) {
        level.player function_4b0cd7f9ce03cf8(var_3012abbf8b098d0f, level.lowestgameskill + 1);
    }
    function_d46d93b0a99a612d();
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x178d
// Size: 0x23
function highestmission_ifnotcheating_set(mission) {
    if (getdvar(@"mis_cheat") == "1") {
        return;
    }
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17b8
// Size: 0x9e
function function_d46d93b0a99a612d() {
    if (getdvar(@"mis_cheat") == "1") {
        return;
    }
    var_64820f36de0a7e54 = level.player function_ff103db8e0d75209();
    if (var_64820f36de0a7e54.size >= level.missionsettings.levels.size) {
        var_f6fef0a5f712672b = 1;
        for (i = 0; i < level.missionsettings.levels.size; i++) {
            if (var_64820f36de0a7e54[i] != 4 && var_64820f36de0a7e54[i] != 5) {
                var_f6fef0a5f712672b = undefined;
                break;
            }
        }
    }
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x185e
// Size: 0x1a
function getlevelskill(var_3012abbf8b098d0f) {
    return level.player function_b3bf603811212474(var_3012abbf8b098d0f);
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1881
// Size: 0x6a
function getlowestskill() {
    var_37daa4b0905d726 = level.player function_ff103db8e0d75209();
    var_37c87fd960c29bc4 = 4;
    var_5b5a922bcf1c5c9f = min(var_37daa4b0905d726.size, self.levels.size);
    for (index = 0; index < var_5b5a922bcf1c5c9f; index++) {
        if (var_37daa4b0905d726[index] < var_37c87fd960c29bc4) {
            var_37c87fd960c29bc4 = var_37daa4b0905d726[index];
        }
    }
    return var_37c87fd960c29bc4;
}

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18f4
// Size: 0x30
function getnextlevelindex() {
    for (index = 0; index < self.levels.size; index++) {
        if (!getlevelskill(index)) {
            return index;
        }
    }
    return 0;
}

/#

    // Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x192d
    // Size: 0x4f
    function function_b47ee5b0dae14294() {
        for (;;) {
            if (getdvarint(@"hash_1adbe88f794c0245")) {
                clearall();
                level.player setplayerprogression("<dev string:xe4>", 0);
                setdvar(@"hash_1adbe88f794c0245", "<dev string:xe3>");
            }
            wait 0.05;
        }
    }

#/

// Namespace namespace_ba235658cd692ae8 / scripts\sp\endmission
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1984
// Size: 0x54
function clearall() {
    var_37daa4b0905d726 = [];
    arraycount = level.player function_2d447b52456ea3b8();
    for (index = 0; index < arraycount; index++) {
        var_37daa4b0905d726[index] = 0;
    }
    level.player function_a320e75d6ec43bb5(var_37daa4b0905d726);
}
