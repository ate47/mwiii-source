#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\potg_events.gsc;
#using scripts\mp\flags.gsc;

#namespace potg;

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x708
// Size: 0x381
function init() {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() || istrue(game["isLaunchChunk"])) {
        level.potgenabled = 0;
        return;
    }
    if (!isdefined(level.potgenabled) || level.potgenabled) {
        level.potgenabled = level.finalkillcamtype == 1;
    }
    if (getdvarint(@"hash_6625c2cb0de90a41", 0) == 0) {
        level.potgenabled = 0;
    }
    if (!level.potgenabled) {
        return;
    }
    globals = spawnstruct();
    level.potgglobals = globals;
    globals.curpotgscene = undefined;
    globals.systemfinalized = 0;
    globals.entities = [];
    globals.settings = [];
    globals.settingtypes = [];
    globals.nextsceneid = 0;
    globals.lastarchivetime = -1;
    globals.pendingarchiverequest = 0;
    loadeventtable();
    if (function_acab8b716476b589()) {
        if (!isdefined(game["potg"])) {
            bundle = level.gametypebundle;
            var_a0bf9704c57af093 = bundle.var_fd6ad9506987a3a9 - 2 * bundle.var_c0bcb92698db94ff;
            var_a0e2ad04c5a168ad = bundle.var_fd47eb5069618387 - 2 * bundle.var_c0bcb92698db94ff;
            potg = spawnstruct();
            potg.var_f15f1ae1f182d55f = int(var_a0bf9704c57af093 * 1000);
            potg.var_f13c08e1f15c6611 = int(var_a0e2ad04c5a168ad * 1000);
            potg.bufferduration = int(bundle.var_c0bcb92698db94ff * 1000);
            potg.var_1754edabe7fe6405 = int(bundle.var_c2ae38b58d8126f9 * 1000);
            potg.var_2d7dbb87afd5e11 = default_to(bundle.var_54b8c66e7a10fce5, 0);
            potg.var_ad57f209122ed51d = [];
            potg.catalystevents = [];
            potg.var_2ec58fa823337cd8 = [];
            if (isdefined(bundle.var_8631c9f0b1efa3a7) && bundle.var_8631c9f0b1efa3a7.size > 0) {
                potg.var_2ec58fa823337cd8 = array_sort_with_func(bundle.var_8631c9f0b1efa3a7, &function_8f4e175dca760a87);
            }
            game["potg"] = potg;
        }
        if (isdefined(level.gametypebundle.var_e9789a14091683e1)) {
            level thread function_e14b5f1aa08d9caa();
        }
    } else {
        setdvarifuninitialized(@"hash_8606ee05fd13fa87", 8000);
        setdvarifuninitialized(@"hash_8629fc05fd3a6109", 3000);
        setdvarifuninitialized(@"hash_54872a63f6b7a88a", 3500);
        setdvarifuninitialized(@"hash_81e3c31a787ce483", 420);
    }
    setdvarifuninitialized(@"hash_1354f825daa8fdd3", 1000);
    /#
        setdevdvarifuninitialized(@"hash_ffd4a481b33d985a", 0);
        setdevdvarifuninitialized(@"hash_a8d6f0b654204b81", 0);
        setdevdvarifuninitialized(@"hash_1fd181ebeebe83bf", 0);
        setdevdvarifuninitialized(@"hash_ba2d7c5976a9ec58", 0);
        setdevdvarifuninitialized(@"hash_c2407250e6c4bbbc", 0);
        setdevdvarifuninitialized(@"hash_750a15da0bd4dc96", 750);
    #/
    thread onplayerconnect();
    scripts\mp\utility\disconnect_event_aggregator::registerondisconnecteventcallback(&onplayerdisconnect);
    scripts\mp\potg_events::init();
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa91
// Size: 0x2f
function getminimumscorerequired() {
    if (function_acab8b716476b589()) {
        return game["potg"].var_2d7dbb87afd5e11;
    }
    return getdvarint(@"hash_81e3c31a787ce483");
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac8
// Size: 0x2f
function getactionscenedurationmax() {
    if (function_acab8b716476b589()) {
        return game["potg"].var_f15f1ae1f182d55f;
    }
    return getdvarint(@"hash_8606ee05fd13fa87");
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaff
// Size: 0x2f
function getactionscenedurationmin() {
    if (function_acab8b716476b589()) {
        return game["potg"].var_f13c08e1f15c6611;
    }
    return getdvarint(@"hash_8629fc05fd3a6109");
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb36
// Size: 0x2f
function getscenebufferduration() {
    if (function_acab8b716476b589()) {
        return game["potg"].bufferduration;
    }
    return getdvarint(@"hash_54872a63f6b7a88a");
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6d
// Size: 0x2f
function function_c32dbde9550fc4d5() {
    if (function_acab8b716476b589()) {
        return game["potg"].var_1754edabe7fe6405;
    }
    return getdvarint(@"hash_54872a63f6b7a88a");
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba4
// Size: 0x12
function getwholescenedurationmin() {
    return getactionscenedurationmin() + getscenebufferduration() * 2;
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbf
// Size: 0x12
function getwholescenedurationmax() {
    return getactionscenedurationmax() + getscenebufferduration() * 2;
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbda
// Size: 0x10
function getminimumscorerequirednvidiahighlights() {
    return getdvarint(@"hash_750a15da0bd4dc96");
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf3
// Size: 0xd6
function loadeventtable() {
    if (function_acab8b716476b589()) {
        return;
    }
    globals = level.potgglobals;
    for (rowindex = 0; true; rowindex++) {
        eventref = tablelookupbyrow("mp/potg_event_table.csv", rowindex, 0);
        if (!isdefined(eventref) || eventref == "") {
            break;
        }
        globals.eventtable[eventref] = [];
        score = tablelookupbyrow("mp/potg_event_table.csv", rowindex, 1);
        globals.eventtable[eventref]["score"] = float(score);
        addOn = tablelookupbyrow("mp/potg_event_table.csv", rowindex, 2);
        globals.eventtable[eventref]["addOn"] = addOn != "";
    }
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd1
// Size: 0x4a
function onplayerconnect() {
    level endon("game_ended");
    while (true) {
        player = level waittill("connected");
        registerpotgentity(player);
        player thread updateplayerrecording();
        /#
            if (!scripts\mp\utility\game::lpcfeaturegated()) {
                player thread function_a7465123c4bb2ec5();
            }
        #/
    }
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd23
// Size: 0x4b
function updateplayerrecording() {
    level endon("game_ended");
    self endon("disconnect");
    while (true) {
        self waittill("spawned_player");
        startrecording();
        self waittill("death");
        if (!istrue(self.fauxdead)) {
            self waittill("death_delay_finished");
        }
        stoprecording();
    }
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd76
// Size: 0x13
function onplayerdisconnect(player) {
    deregisterpotgentity(player);
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd91
// Size: 0x2a
function onroundended(winner) {
    if (!istrue(level.potgenabled)) {
        return;
    }
    scripts\mp\potg_events::onroundended(winner);
    waitframe();
    thread waitforrecordingandfinalize();
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc3
// Size: 0x20
function waitforrecordingandfinalize() {
    wait getscenebufferduration() / 1000;
    waitframe();
    if (!shouldskippotg()) {
        finalizepotgsystem();
    }
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdeb
// Size: 0x41
function shouldskippotg() {
    currscene = getcurpotgscene();
    if (isdefined(currscene) && isdefined(currscene.primaryentity)) {
        return (currscene.score < getminimumscorerequired());
    }
    return 1;
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe34
// Size: 0x6d
function finalizepotgsystem() {
    level notify("potg_finalize");
    finalizeallrecordings();
    waittillframeend();
    level.potgglobals.systemfinalized = 1;
    if (shouldskippotg()) {
        return;
    }
    if (level.potgglobals.pendingarchiverequest) {
        archivecurrentgamestate();
    }
    var_cc46931e59a508d3 = getcurpotgscene();
    if (isdefined(var_cc46931e59a508d3)) {
        finalizescene(var_cc46931e59a508d3);
    }
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea9
// Size: 0x15
function issystemfinalized() {
    return level.potgglobals.systemfinalized;
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec7
// Size: 0x60
function function_acab8b716476b589() {
    if (!isdefined(level.gametypebundle)) {
        return false;
    }
    if (istrue(level.gametypebundle.var_76309a09e264bb97)) {
        if (function_950c8234f03299d4()) {
            return true;
        } else {
            /#
                function_5013853947770621(#"hash_7aa1f96477bc1fb6");
            #/
            level.gametypebundle.var_76309a09e264bb97 = 0;
            return false;
        }
    }
    return false;
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf30
// Size: 0x4b
function function_6ccc879a30fe522c() {
    if (function_acab8b716476b589()) {
        return level.gametypebundle.finalkillcamtype;
    }
    return getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_killcamType"), @"hash_769d7362e31fdf55");
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf83
// Size: 0xcc
function registerpotgentity(entity) {
    if (!level.potgenabled) {
        return;
    }
    globals = level.potgglobals;
    id = getentityid(entity);
    assert(isdefined(entity) && !isdefined(globals.entities[id]));
    newstruct = spawnstruct();
    newstruct.entity = entity;
    newstruct.events = [];
    newstruct.recordingenabledcount = 0;
    newstruct.lastrecordingstarttime = -1;
    newstruct.nexteventid = 0;
    globals.entities[id] = newstruct;
    /#
        function_931a8f6e47923a14(entity, "<dev string:x1c>");
    #/
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1057
// Size: 0x63
function deregisterpotgentity(entity) {
    if (!level.potgenabled) {
        return;
    }
    globals = level.potgglobals;
    id = getentityid(entity);
    globals.entities[id] = undefined;
    entity notify("cleanup_potg_entity");
    /#
        function_931a8f6e47923a14(entity, "<dev string:x27>");
    #/
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c2
// Size: 0x32
function getentitypotgdata(entity) {
    id = getentityid(entity);
    return level.potgglobals.entities[id];
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10fd
// Size: 0x43
function getentityid(entity) {
    if (isdefined(entity.potgid)) {
        return entity.potgid;
    }
    entity.potgid = entity getentitynumber();
    return entity.potgid;
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1149
// Size: 0x7f
function startrecording() {
    if (!level.potgenabled) {
        return;
    }
    if (issystemfinalized()) {
        return;
    }
    entdata = getentitypotgdata(self);
    assert(isdefined(entdata));
    assertex(!issystemfinalized(), "potg::startRecording called after recordings have been finalized");
    if (entdata.recordingenabledcount == 0) {
        onrecordingstarted(entdata);
    }
    entdata.recordingenabledcount++;
    /#
        function_4f8540de8b6894db(self, "<dev string:x34>");
    #/
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d0
// Size: 0x1c
function onrecordingstarted(entdata) {
    entdata.lastrecordingstarttime = gettime();
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f4
// Size: 0x85
function stoprecording() {
    if (!level.potgenabled) {
        return;
    }
    if (issystemfinalized()) {
        return;
    }
    entdata = getentitypotgdata(self);
    assert(isdefined(entdata));
    assertex(entdata.recordingenabledcount > 0, "POTG::stopRecording() Attempting to enable recording more times than startRecording has been called");
    entdata.recordingenabledcount--;
    if (entdata.recordingenabledcount == 0) {
        onrecordingstopped(entdata);
    }
    /#
        function_4f8540de8b6894db(self, "<dev string:x3a>");
    #/
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1281
// Size: 0x45
function forcestoprecording(entdata) {
    entdata.recordingenabledcount = 0;
    entdata.entity onrecordingstopped(entdata);
    /#
        function_4f8540de8b6894db(entdata.entity, "<dev string:x3f>");
    #/
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ce
// Size: 0x40
function onrecordingstopped(entdata) {
    globals = level.potgglobals;
    scripts\mp\potg_events::onpotgrecordingstopped();
    entdata.entity notify("potg_stop_recording");
    removeallevents(entdata);
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1316
// Size: 0x4a
function isrecordingenabled(entdata) {
    if (!level.potgenabled) {
        return false;
    }
    if (issystemfinalized()) {
        return false;
    }
    if (!isdefined(entdata)) {
        entdata = getentitypotgdata(self);
    }
    assert(isdefined(entdata));
    return entdata.recordingenabledcount > 0;
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1369
// Size: 0x77
function finalizeallrecordings() {
    globals = level.potgglobals;
    foreach (entdata in globals.entities) {
        forcestoprecording(entdata);
    }
    /#
        function_58af25849b7e7eee();
    #/
}

// Namespace potg / scripts\mp\potg
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e8
// Size: 0x298
function processevent(eventref, starttime, endtime, psoffsettime, scoreoverride, scoremultiplier) {
    if (!level.potgenabled) {
        return;
    }
    if (function_acab8b716476b589()) {
        if (!function_d03495fe6418377b(eventref)) {
            eventref = function_1823ff50bb28148d(eventref);
        }
        if (!eventtable_isevent(eventref)) {
            return;
        }
    } else {
        assertex(isdefined(level.potgglobals.eventtable[eventref]), "<dev string:x4a>" + eventref);
    }
    if (!isdefined(starttime)) {
        starttime = gettime();
    }
    if (!isdefined(endtime)) {
        endtime = starttime;
    }
    assert(endtime >= starttime);
    assert(starttime <= gettime());
    assert(endtime <= gettime());
    globals = level.potgglobals;
    entdata = getentitypotgdata(self);
    assert(isdefined(entdata));
    removeoldevents(entdata);
    if (!isrecordingenabled(entdata)) {
        return;
    }
    var_312642b9c7019ad5 = int(max(getcurwindowstarttime(), entdata.lastrecordingstarttime));
    if (starttime <= var_312642b9c7019ad5 || endtime <= var_312642b9c7019ad5) {
        return;
    }
    newevent = spawnstruct();
    player = self;
    score = undefined;
    if (isdefined(scoreoverride)) {
        score = scoreoverride;
    } else {
        score = eventtable_getscore(eventref, player);
    }
    if (isdefined(scoremultiplier)) {
        score *= scoremultiplier;
    }
    playerhealthratio = int(clamp(player.health / player.maxhealth * 127, 0, 127));
    newevent.eventref = eventref;
    newevent.starttime = starttime;
    newevent.endtime = endtime;
    newevent.score = score;
    newevent.psoffsettime = psoffsettime;
    newevent.playerhealthratio = playerhealthratio;
    eventid = entdata.nexteventid;
    entdata.nexteventid++;
    entdata.events[eventid] = newevent;
    /#
        function_7fe17c62b2ba41a2(eventref);
    #/
    /#
        function_89e809869ae732cc(self, eventref, score, starttime, endtime);
    #/
    datalog_newevent(newevent, eventid, self);
    if (!eventtable_isaddonevent(eventref)) {
        thread waitandnominatepotg(entdata);
    }
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1688
// Size: 0xb5
function waitandnominatepotg(entdata) {
    entity = entdata.entity;
    entity endon("disconnect");
    entity endon("cleanup_potg_entity");
    entity notify("waitAndNominatePOTG()");
    entity endon("waitAndNominatePOTG()");
    waittillframeend();
    if (!isrecordingenabled(entdata)) {
        return;
    }
    totalscore = calculatepotgscore(entdata.events);
    if (totalscore > getminimumscorerequired() && totalscore > getbestpotgscore()) {
        newscene = createscenefromnewevent(entdata, totalscore);
        entity thread waitformorerecordingtimeforscene(newscene);
        return;
    }
    /#
        function_db2034a316b2f949(entity, totalscore, entdata.events.size);
    #/
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1745
// Size: 0x88
function removeoldevents(entdata) {
    oldesttime = getcurwindowstarttime();
    foreach (eventkey, eventdata in entdata.events) {
        if (eventdata.starttime < oldesttime) {
            entdata.events[eventkey] = undefined;
        }
    }
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d5
// Size: 0x18
function removeallevents(entdata) {
    entdata.events = [];
}

// Namespace potg / scripts\mp\potg
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f5
// Size: 0x28c
function createscenefromnewevent(entdata, totalscore) {
    scene = spawnstruct();
    scene.primaryentity = entdata.entity;
    scene.events = entdata.events;
    scene.score = totalscore;
    scene.sceneid = level.potgglobals.nextsceneid;
    level.potgglobals.nextsceneid++;
    assert(entdata.events.size > 0);
    scene.actionstarttime = undefined;
    scene.actionendtime = undefined;
    scene.playerhealthratio = undefined;
    foreach (event in entdata.events) {
        if (!isdefined(scene.actionstarttime) || event.starttime < scene.actionstarttime) {
            scene.actionstarttime = event.starttime;
        }
        if (!isdefined(scene.actionendtime) || event.endtime > scene.actionendtime) {
            scene.actionendtime = event.endtime;
        }
        if (isdefined(event.playerhealthratio)) {
            if (!isdefined(scene.playerhealthratio) || scene.playerhealthratio != event.playerhealthratio) {
                scene.playerhealthratio = event.playerhealthratio;
            }
            continue;
        }
        scene.playerhealthratio = 127;
    }
    assert(scene.actionendtime >= scene.actionstarttime);
    assert(isdefined(entdata.lastrecordingstarttime));
    scene.recordingstarttime = entdata.lastrecordingstarttime;
    assert(scene.actionstarttime >= scene.recordingstarttime);
    scene.endtime = undefined;
    scene.playbackstarttime = undefined;
    scene.playbackendtime = undefined;
    return scene;
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8a
// Size: 0x19
function doesscenehaveenoughtotalrecordingtime(scene) {
    return getmaxsceneduration(scene) >= getwholescenedurationmin();
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aac
// Size: 0x5e
function doesscenehaveenoughbufferrecordingtime(scene) {
    assert(isdefined(scene.endtime));
    assert(scene.endtime >= scene.actionendtime);
    return scene.endtime - scene.actionendtime >= function_c32dbde9550fc4d5();
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b13
// Size: 0x62
function getmaxsceneduration(scene) {
    assert(isdefined(scene.recordingstarttime));
    assert(isdefined(scene.endtime));
    starttime = scene.recordingstarttime;
    return scene.endtime - scene.recordingstarttime;
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7e
// Size: 0x1f9
function waitformorerecordingtimeforscene(scene) {
    self endon("disconnect");
    self endon("cleanup_potg_entity");
    earliestendtime = scene.recordingstarttime + getwholescenedurationmin();
    idealendtime = scene.actionendtime + getscenebufferduration();
    latestendtime = scene.actionstarttime + getwholescenedurationmax();
    assert(earliestendtime <= latestendtime);
    endtime = int(clamp(idealendtime, earliestendtime, latestendtime));
    assert(endtime >= scene.actionendtime);
    /#
        function_6d136a77e61ca284(scene, "<dev string:x63>" + endtime - gettime() + "<dev string:x70>");
    #/
    result = "no_wait";
    if (endtime > gettime()) {
        thread watchpendingscenetimeout(endtime);
        result = waittill_any_return_no_endon_death_2("potg_pending_scene_timeout", "potg_stop_recording");
        self notify("potg_scene_finished_pending");
    }
    if (gettime() > endtime) {
        scene.endtime = endtime;
    } else {
        scene.endtime = gettime();
    }
    assertex(isdefined(self), "POTG: Entity deleted while a POTG was waiting on it's recording. It needed to be deregistered when it was destroyed");
    /#
        function_6d136a77e61ca284(scene, "<dev string:x74>" + result + "<dev string:x7b>");
    #/
    if (doesscenehaveenoughtotalrecordingtime(scene)) {
        if (doesscenehaveenoughbufferrecordingtime(scene)) {
            if (scene.score > getminimumscorerequired() && scene.score >= getbestpotgscore()) {
                setcurpotgscene(scene);
            } else {
                /#
                    function_2f99c1774457a61a(scene.primaryentity, scene, "<dev string:x7d>");
                #/
            }
        } else {
            /#
                function_2f99c1774457a61a(scene.primaryentity, scene, "<dev string:x9f>");
            #/
        }
        return;
    }
    /#
        function_2f99c1774457a61a(scene.primaryentity, scene, "<dev string:xc2>");
    #/
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d7f
// Size: 0x28
function watchpendingscenetimeout(endtime) {
    self endon("potg_scene_finished_pending");
    while (gettime() < endtime) {
        waitframe();
    }
    self notify("potg_pending_scene_timeout");
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1daf
// Size: 0xb2
function calculatepotgscore(events) {
    killcount = 0;
    scoretotal = 0;
    foreach (eventdata in events) {
        scoretotal += eventdata.score;
        if (eventdata.eventref == "kill") {
            killcount++;
        }
    }
    if (killcount > 2) {
        score = eventtable_getscore("triple_kill");
        scoretotal += score;
    }
    return scoretotal;
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e6a
// Size: 0x7b
function setcurpotgscene(scene) {
    assert(doesscenehaveenoughtotalrecordingtime(scene));
    calcsceneplaybacktimes(scene);
    requestarchive(scene.playbackstarttime, scene.playbackendtime);
    screenprint_newpotgchosen(scene, level.potgglobals.curpotgscene);
    level.potgglobals.curpotgscene = scene;
    /#
        function_eab0b74dcbef7e9c(scene);
    #/
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eed
// Size: 0x23
function getcurpotgscene() {
    if (!level.potgenabled) {
        return undefined;
    }
    return level.potgglobals.curpotgscene;
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f19
// Size: 0x4c
function getbestpotgscore() {
    if (!level.potgenabled) {
        return -1;
    }
    globals = level.potgglobals;
    if (!isdefined(globals.curpotgscene)) {
        return -1;
    }
    return globals.curpotgscene.score;
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f6e
// Size: 0xe
function getcurwindowstarttime() {
    return gettime() - getwholescenedurationmax();
}

// Namespace potg / scripts\mp\potg
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f85
// Size: 0x94
function eventtable_getscore(eventref, player) {
    if (function_acab8b716476b589()) {
        if (!function_d03495fe6418377b(eventref)) {
            eventref = function_1823ff50bb28148d(eventref);
        }
        if (!isdefined(level.scoreinfo[eventref])) {
            return 0;
        }
        basescore = level.scoreinfo[eventref][#"hash_98fbaf2f45d2fc09"];
        scoremodifier = function_972555778bce6766(eventref, player);
        return (basescore * scoremodifier);
    }
    return level.potgglobals.eventtable[eventref]["score"];
}

// Namespace potg / scripts\mp\potg
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2021
// Size: 0x45
function function_972555778bce6766(eventref, player) {
    scoremodifier = 1;
    scoremodifier *= function_f6c9a415f86697af(eventref);
    scoremodifier *= function_c488370b61042846(player);
    scoremodifier *= function_4ed25b1ffc14d7a8(player);
    return scoremodifier;
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x206f
// Size: 0xcf
function function_f6c9a415f86697af(eventref) {
    if (!isroundbased() || level.currentround == 1) {
        return 1;
    }
    if (!isdefined(level.gametypebundle.var_37420a2cbcb0ab)) {
        return 1;
    }
    if (!isdefined(game["potg"].catalystevents[level.currentround - 1])) {
        return 1;
    }
    if (!isdefined(eventref)) {
        return 1;
    }
    prevevent = game["potg"].catalystevents[level.currentround - 1];
    var_88016caa290ff502 = prevevent == eventref;
    if (var_88016caa290ff502) {
        return level.gametypebundle.var_37420a2cbcb0ab;
    }
    return 1;
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2147
// Size: 0x7b
function function_c488370b61042846(player) {
    if (!isroundbased() || level.currentround == 1) {
        return 1;
    }
    if (!isdefined(level.gametypebundle.var_2a467946281a4fd4)) {
        return 1;
    }
    if (!isdefined(player)) {
        return 1;
    }
    if (istrue(player.var_b74182dec395b240)) {
        return level.gametypebundle.var_2a467946281a4fd4;
    }
    return 1;
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21cb
// Size: 0xe6
function function_4ed25b1ffc14d7a8(player) {
    if (!isdefined(level.gametypebundle.var_8631c9f0b1efa3a7) || level.gametypebundle.var_8631c9f0b1efa3a7.size == 0) {
        return 1;
    }
    if (!isplayer(player)) {
        return 1;
    }
    var_b04380ede90495aa = player getplayerdata(level.var_5d69837cf4db0407, "roundsSinceLastPOTG");
    var_1498673d1311049b = game["potg"].var_2ec58fa823337cd8;
    if (var_b04380ede90495aa < var_1498673d1311049b[0].roundsSinceLastPOTG) {
        return 1;
    }
    for (i = var_1498673d1311049b.size - 1; i >= 0; i--) {
        if (var_b04380ede90495aa >= var_1498673d1311049b[i].roundsSinceLastPOTG) {
            return var_1498673d1311049b[i].modifier;
        }
    }
    return 1;
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ba
// Size: 0x102
function function_fa47d8c13e83a98c() {
    var_a520dc4735b5b315 = game["potg"].var_ad57f209122ed51d[level.currentround];
    var_a16a87f3dde73d18 = level.potgglobals.entities[var_a520dc4735b5b315].entity;
    var_a16a87f3dde73d18 setplayerdata(level.var_5d69837cf4db0407, "roundsSinceLastPOTG", 0);
    foreach (player in level.players) {
        if (!isplayer(player)) {
            continue;
        }
        if (player == var_a16a87f3dde73d18) {
            continue;
        }
        roundsSinceLastPOTG = player getplayerdata(level.var_5d69837cf4db0407, "roundsSinceLastPOTG");
        player setplayerdata(level.var_5d69837cf4db0407, "roundsSinceLastPOTG", roundsSinceLastPOTG + 1);
    }
}

// Namespace potg / scripts\mp\potg
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c4
// Size: 0x2a
function function_8f4e175dca760a87(var_9f57e1a03621e9d9, var_749e109bf218507a) {
    return var_9f57e1a03621e9d9.modifier < var_749e109bf218507a.modifier;
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f7
// Size: 0x35
function eventtable_isaddonevent(eventref) {
    if (function_acab8b716476b589()) {
        return 0;
    }
    return level.potgglobals.eventtable[eventref]["addOn"];
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2434
// Size: 0x68
function eventtable_isevent(eventref) {
    if (function_acab8b716476b589()) {
        if (!function_d03495fe6418377b(eventref)) {
            eventref = function_1823ff50bb28148d(eventref);
        }
        if (!isdefined(level.scoreinfo[eventref])) {
            return 0;
        }
        return (level.scoreinfo[eventref][#"hash_98fbaf2f45d2fc09"] != 0);
    }
    return isdefined(level.potgglobals.eventtable[eventref]);
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a4
// Size: 0xf4
function function_e14b5f1aa08d9caa() {
    level endon("game_ended");
    level scripts\mp\flags::gameflagwait("prematch_done");
    currround = level.currentround;
    prevround = currround - 1;
    cooldownrounds = level.gametypebundle.var_e9789a14091683e1;
    for (round = 1; round < currround; round++) {
        var_a520dc4735b5b315 = game["potg"].var_ad57f209122ed51d[round];
        var_a16a87f3dde73d18 = level.potgglobals.entities[var_a520dc4735b5b315].entity;
        if (!isdefined(var_a16a87f3dde73d18)) {
            continue;
        }
        var_b04380ede90495aa = prevround - round;
        if (var_b04380ede90495aa >= cooldownrounds) {
            var_a16a87f3dde73d18.var_b74182dec395b240 = 0;
            continue;
        }
        var_a16a87f3dde73d18.var_b74182dec395b240 = 1;
    }
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a0
// Size: 0xd1
function finalizescene(scene) {
    assert(issystemfinalized() || getdvarint(@"hash_a8d6f0b654204b81"));
    scene.finalized = 1;
    if (function_acab8b716476b589()) {
        game["potg"].var_ad57f209122ed51d[level.currentround] = getentityid(scene.primaryentity);
        game["potg"].catalystevents[level.currentround] = array_get_first_item(scene.events).eventref;
        level function_fa47d8c13e83a98c();
    }
    calcscenepsoffset(scene);
    resetscorefeedcontrolomnvar();
    /#
        function_434562c57a231693(scene);
    #/
    datalog_scenefinalized(scene);
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2679
// Size: 0xa3
function resetscorefeedcontrolomnvar() {
    foreach (player in level.players) {
        player setclientomnvar("ui_potg_score_event_control", -1);
        player setclientomnvar("ui_score_event_list_0", -1);
        player setclientomnvar("ui_score_event_list_1", -1);
        player setclientomnvar("ui_score_event_list_2", -1);
        player setclientomnvar("ui_score_event_list_3", -1);
        player setclientomnvar("ui_score_event_list_4", -1);
    }
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2724
// Size: 0x17a
function calcsceneplaybacktimes(scene) {
    var_6294534a03b3d4a7 = gettime() - 13500;
    var_27dc7d2c5dede987 = scene.endtime - getwholescenedurationmax();
    earlieststarttime = int(max(var_27dc7d2c5dede987, max(scene.recordingstarttime, var_6294534a03b3d4a7)));
    idealstarttime = scene.actionstarttime - getscenebufferduration();
    var_10dbae4afe99066b = int(min(scene.actionstarttime, scene.endtime - getwholescenedurationmin()));
    assert(var_10dbae4afe99066b >= earlieststarttime);
    assert(scene.endtime - earlieststarttime >= getwholescenedurationmin());
    assert(scene.endtime - var_10dbae4afe99066b >= getwholescenedurationmin());
    scene.playbackstarttime = int(clamp(idealstarttime, earlieststarttime, var_10dbae4afe99066b));
    scene.playbackendtime = scene.endtime;
    playbacklength = scene.playbackendtime - scene.playbackstarttime;
    assert(playbacklength >= getwholescenedurationmin());
    assert(playbacklength <= getwholescenedurationmax());
    assert(playbacklength <= 13500);
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28a6
// Size: 0x133
function calcscenepsoffset(scene) {
    psoffsettimes = [];
    foreach (event in scene.events) {
        if (isdefined(event.psoffsettime) && !isdefined(psoffsettimes[event.endtime])) {
            psoffsettimes[event.endtime] = event.psoffsettime;
        }
    }
    if (psoffsettimes.size <= 0) {
        scene.psoffsettime = 0;
        return;
    }
    var_9ae310be2354d6c3 = 0;
    foreach (time in psoffsettimes) {
        var_9ae310be2354d6c3 += time;
    }
    var_ad8e46ec031ef58d = var_9ae310be2354d6c3 / psoffsettimes.size;
    scene.psoffsettime = int(var_ad8e46ec031ef58d);
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29e1
// Size: 0xe4
function getfinalpotginfo() {
    assertex(level.potgenabled, "Attempting to show POTG, but POTG is disabled");
    assert(issystemfinalized() || getdvarint(@"hash_a8d6f0b654204b81"));
    var_cc46931e59a508d3 = getcurpotgscene();
    if (!isdefined(var_cc46931e59a508d3)) {
        return undefined;
    }
    assert(istrue(var_cc46931e59a508d3.finalized));
    assert(doesscenefitincurrentarchive(var_cc46931e59a508d3));
    info = spawnstruct();
    info.starttime = var_cc46931e59a508d3.playbackstarttime;
    info.endtime = var_cc46931e59a508d3.playbackendtime;
    info.spectateentity = var_cc46931e59a508d3.primaryentity;
    info.psoffsettime = var_cc46931e59a508d3.psoffsettime;
    return info;
}

// Namespace potg / scripts\mp\potg
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ace
// Size: 0x1e
function requestarchive(starttime, endtime) {
    level thread archiverequesthelper(starttime, endtime);
}

// Namespace potg / scripts\mp\potg
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2af4
// Size: 0xdf
function archiverequesthelper(starttime, endtime) {
    level endon("potg_finalize");
    level notify("potg_archiveRequestHelper()");
    level endon("potg_archiveRequestHelper()");
    level.potgglobals.pendingarchiverequest = 1;
    assert(endtime > starttime);
    assertex(endtime - starttime <= 13500, "POTG system attempting to archive a scene that is larger than the max archive length");
    assertex(gettime() - 13500 <= starttime, "POTG system attempting to request an archive that is outside the possible archive time");
    var_a127b5a0b26a9b01 = starttime + 13500 - 100;
    var_436681fb9914bb6a = var_a127b5a0b26a9b01 - gettime();
    assert(var_436681fb9914bb6a >= 0);
    /#
        function_6e0f018a9e890127(var_436681fb9914bb6a / 1000);
    #/
    wait_time_in_ms(var_436681fb9914bb6a);
    level.potgglobals.pendingarchiverequest = 0;
    archivecurrentgamestate();
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bdb
// Size: 0xba
function archivecurrentgamestate() {
    thread debug_watcharchivesize(getpotgstarttime(), getcurpotgscene());
    savepotgdata();
    var_b19688b8c0890315 = level.potgglobals.lastarchivetime;
    level.potgglobals.lastarchivetime = gettime();
    assert(doesscenefitincurrentarchive(getcurpotgscene()));
    timesincelastarchive = -1;
    if (var_b19688b8c0890315 > 0) {
        timesincelastarchive = level.potgglobals.lastarchivetime - var_b19688b8c0890315;
        assert(timesincelastarchive >= getrapidarchivewarningrate(), "POTG System trying to request archives too frequently. " + timesincelastarchive + "s since last archive");
    }
    /#
        function_1483fe96ec345b56(timesincelastarchive);
    #/
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c9d
// Size: 0xf
function getrapidarchivewarningrate() {
    return 13500 - getwholescenedurationmax() - 250;
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cb5
// Size: 0x5f
function doesscenefitincurrentarchive(scene) {
    archiveendtime = level.potgglobals.lastarchivetime;
    if (archiveendtime < 0) {
        return false;
    }
    archiveStartTime = archiveendtime - 13500;
    return scene.playbackstarttime >= archiveStartTime && scene.playbackendtime <= archiveendtime;
}

// Namespace potg / scripts\mp\potg
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d1d
// Size: 0x131
function screenprint_newpotgchosen(newscene, oldscene) {
    if (getdvarint(@"hash_ba2d7c5976a9ec58") == 0) {
        return;
    }
    if (newscene.score <= 250) {
        return;
    }
    newentname = undefined;
    if (isplayer(newscene.primaryentity)) {
        newentname = newscene.primaryentity.name;
    } else {
        newentname = "(GameObject)";
    }
    if (isplayer(newscene.primaryentity)) {
        newscene.primaryentity iprintlnbold("POTG Nominee! (" + newscene.score + ")");
    }
    if (isdefined(oldscene) && isplayer(oldscene.primaryentity) && oldscene.primaryentity != newscene.primaryentity) {
        oldscene.primaryentity iprintlnbold("Your POTG was bested by +" + newentname + "! (" + newscene.score + ")");
    }
    level.potgglobals.lastchosenscreenprinttime = gettime();
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e56
// Size: 0x110
function screenprint_dosceneprintplayback() {
    if (getdvarint(@"hash_ba2d7c5976a9ec58") == 0) {
        return;
    }
    scene = getcurpotgscene();
    playbackgametime = gettime() - int(self.archivetime * 1000);
    updaterate = 0.15;
    var_e9eb390a12336fc1 = [];
    while (true) {
        foreach (eventid, event in scene.events) {
            if (event.starttime <= playbackgametime && !isdefined(var_e9eb390a12336fc1[eventid])) {
                iprintlnbold(event.eventref);
                iprintln(event.eventref);
                var_e9eb390a12336fc1[eventid] = 1;
                break;
            }
        }
        wait updaterate;
        playbackgametime += int(updaterate * 1000);
    }
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f6e
// Size: 0x32
function datalog_getlogversion() {
    if (getdvarint(@"hash_6af7e4425b1f5d10", 0) != 0) {
        return -1;
    }
    if (getdvarint(@"hash_ff689af941dd10a1", 0) != 0) {
        return 9;
    }
    return -1;
}

// Namespace potg / scripts\mp\potg
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fa9
// Size: 0x12
function datalog_isloggingenabled() {
    return getdvarint(@"hash_1fd181ebeebe83bf") != 0;
}

// Namespace potg / scripts\mp\potg
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fc4
// Size: 0x1c3
function datalog_scenefinalized(scene) {
    if (!datalog_isloggingenabled()) {
        return;
    }
    scriptversion = datalog_getlogversion();
    dlog_recordevent("mpscript_potg", ["score", scene.score, "duration", scene.playbackendtime - scene.playbackstarttime, "start_time", scene.playbackstarttime, "action_start_offset", scene.actionstarttime - scene.playbackstarttime, "action_end_offset", scene.actionendtime - scene.playbackstarttime, "entity_id", getentityid(scene.primaryentity), "script_version", scriptversion]);
    foreach (event in scene.events) {
        dlog_recordevent("mpscript_potg_final_events", ["event_ref", event.eventref, "score", event.score, "start_time", event.playbackstarttime, "end_time", event.playbackendtime, "script_version", scriptversion]);
    }
}

// Namespace potg / scripts\mp\potg
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x318f
// Size: 0xc6
function datalog_newevent(event, id, entity) {
    if (!datalog_isloggingenabled()) {
        return;
    }
    dlog_recordevent("mpscript_potg_events", ["event_ref", event.eventref, "score", event.score, "start_time", event.starttime, "end_time", event.endtime, "event_id", id, "entity_id", getentityid(entity), "script_version", datalog_getlogversion()]);
}

// Namespace potg / scripts\mp\potg
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x325d
// Size: 0x104
function datalog_archivesaved(requesttime, archiveStartTime, archiveDuration, desiredSceneStartTime, desiredSceneEndTime) {
    if (getdvarint(@"hash_1354f825daa8fdd3", 0) == 0) {
        return;
    }
    version = datalog_getlogversion();
    dlog_recordevent("mpscript_potg_archive", ["requestTime", requesttime, "archiveStartTime", archiveStartTime, "archiveDuration", archiveDuration, "desiredSceneStartTime", desiredSceneStartTime, "desiredSceneEndTime", desiredSceneEndTime, "playerCount", level.players.size, "tickRate", int(1 / level.framedurationseconds), "dedi", ter_op(isdedicatedserver(), 1, 0), "version", 0]);
}

// Namespace potg / scripts\mp\potg
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3369
// Size: 0x38
function debug_watcharchivesize(prevstarttime, scene) {
    requesttime = gettime();
    thread debug_watcharchivefinished(requesttime, prevstarttime, scene);
    thread debug_watcharchiveinterrupted(requesttime, scene);
}

// Namespace potg / scripts\mp\potg
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33a9
// Size: 0x79
function debug_watcharchivefinished(requesttime, prevstarttime, scene) {
    level notify("watching_potg_archive_request");
    level endon("watching_potg_archive_request");
    if (getdvarint(@"hash_1354f825daa8fdd3") == 0) {
        return;
    }
    while (true) {
        curstarttime = getpotgstarttime();
        if (curstarttime != prevstarttime) {
            level notify("potg_archive_request_finished");
            debug_logarchiveresult(1, scene, requesttime, curstarttime, getpotgduration());
            break;
        }
        waitframe();
    }
}

// Namespace potg / scripts\mp\potg
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x342a
// Size: 0x2c
function debug_watcharchiveinterrupted(requesttime, scene) {
    level endon("potg_archive_request_finished");
    level waittill("watching_potg_archive_request");
    debug_logarchiveresult(0, scene, requesttime);
}

// Namespace potg / scripts\mp\potg
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x345e
// Size: 0x13e
function debug_logarchiveresult(result, scene, requesttime, finalstarttime, finalduration) {
    if (result) {
        thread datalog_archivesaved(requesttime, finalstarttime, finalduration, scene.playbackstarttime, scene.playbackendtime);
    }
    /#
        println("<dev string:xdc>");
        println("<dev string:xf6>" + ter_op(result, "<dev string:x108>", "<dev string:x111>"));
        println("<dev string:x11d>" + requesttime);
        println("<dev string:x135>" + gettime() - requesttime);
        if (result) {
            println("<dev string:x158>" + finalstarttime);
            println("<dev string:x176>" + finalduration);
            println("<dev string:x192>" + scene.playbackendtime - scene.playbackstarttime);
            println("<dev string:x1b0>" + scene.playbackstarttime);
            println("<dev string:x1cc>" + scene.playbackendtime);
            println("<dev string:x1e6>" + finalstarttime - scene.playbackstarttime);
            println("<dev string:x200>" + scene.playbackendtime - finalstarttime + finalduration);
        }
    #/
}

/#

    // Namespace potg / scripts\mp\potg
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x35a4
    // Size: 0x6a
    function debug_print(text, entity) {
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        entitytext = function_b5fc4169a40984f4(entity);
        if (entitytext != "<dev string:x218>") {
            entitytext = "<dev string:x219>" + entitytext + "<dev string:x7b>";
        }
        println("<dev string:x21b>" + entitytext + "<dev string:x224>" + text);
    }

    // Namespace potg / scripts\mp\potg
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3616
    // Size: 0x63
    function function_b5fc4169a40984f4(entity) {
        entitytext = "<dev string:x218>";
        if (isdefined(entity) && isent(entity)) {
            id = getentityid(entity);
            if (isplayer(entity)) {
                entitytext = entity.name;
            } else {
                entitytext = "<dev string:x218>" + id;
            }
        }
        return entitytext;
    }

    // Namespace potg / scripts\mp\potg
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x3681
    // Size: 0x39
    function function_931a8f6e47923a14(entity, registered) {
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        debug_print("<dev string:x227>" + registered, entity);
    }

    // Namespace potg / scripts\mp\potg
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x36c2
    // Size: 0x69
    function function_4f8540de8b6894db(entity, changetype) {
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        filterid = getdvarint(@"hash_c50427c6f2e00c08", -1);
        if (filterid != -1 && getentityid(entity) != filterid) {
            return;
        }
        debug_print("<dev string:x233>" + changetype, entity);
    }

    // Namespace potg / scripts\mp\potg
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3733
    // Size: 0x25
    function function_58af25849b7e7eee() {
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        debug_print("<dev string:x240>");
    }

    // Namespace potg / scripts\mp\potg
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x3760
    // Size: 0xb0
    function function_89e809869ae732cc(entity, eventref, eventscore, starttime, endtime) {
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        filterid = getdvarint(@"hash_c50427c6f2e00c08", -1);
        if (filterid != -1 && getentityid(entity) != filterid) {
            return;
        }
        if (function_d03495fe6418377b(eventref)) {
            eventref = function_3c8848a3a11b2553(eventref);
        }
        debug_print("<dev string:x254>" + eventref + "<dev string:x260>" + eventscore + "<dev string:x263>" + starttime + "<dev string:x26d>" + endtime + "<dev string:x7b>", entity);
    }

    // Namespace potg / scripts\mp\potg
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x3818
    // Size: 0xa1
    function function_db2034a316b2f949(entity, score, eventcount) {
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        filterid = getdvarint(@"hash_c50427c6f2e00c08", -1);
        if (filterid != -1 && getentityid(entity) != filterid) {
            return;
        }
        debug_print("<dev string:x273>", entity);
        debug_print("<dev string:x286>" + score, entity);
        debug_print("<dev string:x28f>" + getbestpotgscore(), entity);
        debug_print("<dev string:x29d>" + eventcount, entity);
    }

    // Namespace potg / scripts\mp\potg
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x38c1
    // Size: 0xf0
    function function_2f99c1774457a61a(entity, scene, reason) {
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        filterid = getdvarint(@"hash_c50427c6f2e00c08", -1);
        if (filterid != -1 && getentityid(entity) != filterid) {
            return;
        }
        debug_print("<dev string:x2ab>" + scene.sceneid + "<dev string:x2bb>" + reason, entity);
        debug_print("<dev string:x286>" + scene.score, entity);
        debug_print("<dev string:x28f>" + getbestpotgscore(), entity);
        debug_print("<dev string:x29d>" + scene.events.size, entity);
        function_14c0539b7a4ff13a(scene);
        function_b4ccc30f6252a635(scene.events);
        debug_print("<dev string:x2c8>");
    }

    // Namespace potg / scripts\mp\potg
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x39b9
    // Size: 0x8f
    function function_6d136a77e61ca284(scene, text) {
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        filterid = getdvarint(@"hash_c50427c6f2e00c08", -1);
        if (filterid != -1 && getentityid(scene.primaryentity) != filterid) {
            return;
        }
        debug_print("<dev string:x2ab>" + scene.sceneid + "<dev string:x2ca>" + text, scene.primaryentity);
    }

    // Namespace potg / scripts\mp\potg
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3a50
    // Size: 0x92
    function function_eab0b74dcbef7e9c(scene) {
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        debug_print("<dev string:x2ce>" + scene.sceneid + "<dev string:x2e0>" + scene.score + "<dev string:x2ea>" + function_b5fc4169a40984f4(scene.primaryentity));
        function_81d753db205136b6(scene);
        function_14c0539b7a4ff13a(scene);
        function_b4ccc30f6252a635(scene.events);
        debug_print("<dev string:x2c8>");
    }

    // Namespace potg / scripts\mp\potg
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3aea
    // Size: 0x92
    function function_434562c57a231693(scene) {
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        debug_print("<dev string:x2f5>" + scene.sceneid + "<dev string:x2e0>" + scene.score + "<dev string:x2ea>" + function_b5fc4169a40984f4(scene.primaryentity));
        function_81d753db205136b6(scene);
        function_14c0539b7a4ff13a(scene);
        function_b4ccc30f6252a635(scene.events);
        debug_print("<dev string:x2c8>");
    }

    // Namespace potg / scripts\mp\potg
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3b84
    // Size: 0x122
    function function_81d753db205136b6(scene) {
        debug_print("<dev string:x30b>" + scene.playbackstarttime);
        debug_print("<dev string:x322>" + scene.playbackendtime);
        debug_print("<dev string:x337>" + scene.playbackendtime - scene.playbackstarttime);
        debug_print("<dev string:x349>" + scene.actionstarttime);
        debug_print("<dev string:x35e>" + scene.actionendtime);
        debug_print("<dev string:x371>" + scene.actionendtime - scene.actionstarttime);
        debug_print("<dev string:x384>" + scene.actionstarttime - scene.playbackstarttime);
        debug_print("<dev string:x39b>" + scene.playbackendtime - scene.actionendtime);
        debug_print("<dev string:x3b3>" + scene.actionendtime - scene.playbackstarttime);
    }

    // Namespace potg / scripts\mp\potg
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3cae
    // Size: 0x81
    function function_14c0539b7a4ff13a(scene) {
        if (!function_acab8b716476b589()) {
            return;
        }
        debug_print("<dev string:x3c8>" + function_3c8848a3a11b2553(array_get_first_item(scene.events).eventref));
        debug_print("<dev string:x3da>" + function_c488370b61042846(scene.primaryentity));
        debug_print("<dev string:x407>" + function_4ed25b1ffc14d7a8(scene.primaryentity));
    }

    // Namespace potg / scripts\mp\potg
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3d37
    // Size: 0x121
    function function_b4ccc30f6252a635(events) {
        debug_print("<dev string:x437>");
        foreach (event in events) {
            eventref = event.eventref;
            if (function_acab8b716476b589()) {
                if (function_f6c9a415f86697af(eventref) == 1) {
                    debug_print("<dev string:x440>" + function_3c8848a3a11b2553(eventref) + "<dev string:x443>" + event.score + "<dev string:x448>");
                } else {
                    debug_print("<dev string:x440>" + function_3c8848a3a11b2553(eventref) + "<dev string:x443>" + event.score + "<dev string:x448>" + "<dev string:x44d>" + function_f6c9a415f86697af(eventref) + "<dev string:x7b>");
                }
                continue;
            }
            debug_print("<dev string:x440>" + eventref + "<dev string:x443>" + event.score + "<dev string:x448>");
        }
    }

    // Namespace potg / scripts\mp\potg
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3e60
    // Size: 0x36
    function function_6e0f018a9e890127(waittime) {
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        debug_print("<dev string:x469>" + waittime + "<dev string:x48b>");
    }

    // Namespace potg / scripts\mp\potg
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3e9e
    // Size: 0x3c
    function function_1483fe96ec345b56(timesincelastarchive) {
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        debug_print("<dev string:x48e>" + timesincelastarchive / 1000 + "<dev string:x49f>");
    }

    // Namespace potg / scripts\mp\potg
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3ee2
    // Size: 0x17a
    function function_a7465123c4bb2ec5() {
        level endon("<dev string:x4b4>");
        self endon("<dev string:x4bf>");
        self.var_2790de63f699069b = [];
        self.var_649bd2548fcd09fb = [];
        self.var_547a5f5c78feb97e = 0;
        if (isai(self)) {
            return;
        }
        while (true) {
            if (getdvarint(@"hash_c2407250e6c4bbbc") == 1 && self ishost()) {
                foreach (id, time in self.var_649bd2548fcd09fb) {
                    if (gettime() - time > 5000) {
                        self.var_649bd2548fcd09fb[id] = undefined;
                        self.var_2790de63f699069b[id] = undefined;
                    }
                }
                displaycount = int(min(10, self.var_2790de63f699069b.size));
                if (displaycount > 0) {
                    startid = self.var_547a5f5c78feb97e - 1;
                    endid = int(max(0, startid - displaycount - 1));
                    texty = 400;
                    for (id = startid; id >= endid; id--) {
                        printtoscreen2d(100, texty, self.var_2790de63f699069b[id], (1, 0.5, 0.7), 1.5);
                        texty += 20;
                    }
                }
            }
            waitframe();
        }
    }

    // Namespace potg / scripts\mp\potg
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4064
    // Size: 0x8f
    function function_7fe17c62b2ba41a2(eventref) {
        dvarvalue = getdvarint(@"hash_c2407250e6c4bbbc");
        if (function_d03495fe6418377b(eventref)) {
            eventref = function_3c8848a3a11b2553(eventref);
        }
        if (dvarvalue == 1) {
            self.var_2790de63f699069b[self.var_547a5f5c78feb97e] = eventref;
            self.var_649bd2548fcd09fb[self.var_547a5f5c78feb97e] = gettime();
            self.var_547a5f5c78feb97e++;
            return;
        }
        if (dvarvalue == 2) {
            self iprintln("<dev string:x4ca>" + eventref);
        }
    }

#/