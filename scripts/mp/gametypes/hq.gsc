// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\obj_zonecapture.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\flags.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\gamelogic.gsc;
#using script_548072087c9fd504;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\gametypes\grnd.gsc;
#using scripts\mp\callouts.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\spawnfactor.gsc;

#namespace hq;

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc77
// Size: 0x3c4
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = "hqloc";
    allowed[1] = "hardpoint";
    allowed[2] = "tdm";
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registertimelimitdvar(getgametype(), 300);
        registerscorelimitdvar(getgametype(), 200);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    updategametypedvars();
    level.hpstarttime = 0;
    level.scoreperplayer = undefined;
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.modeonspawnplayer = &onspawnplayer;
    level.modeonsuicidedeath = &onsuicidedeath;
    level.onplayerkilled = &onplayerkilled;
    level.onrespawndelay = &getrespawndelay;
    level.modeonteamchangedeath = &modeonteamchangedeath;
    level.canspawnontacinsert = &canspawnontacinsert;
    level.onplayerjoinedteam = &namespace_8276d48525f0f398::onplayerjoinedteam;
    level.lastcaptime = gettime();
    level.usezonecapture = 1;
    level.lastcaptureteam = undefined;
    level.previousclosespawnent = undefined;
    setomnvar("ui_hq_num_alive", 0);
    setomnvar("ui_hq_ownerteam", -1);
    if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
        game["dialog"]["gametype"] = "dx_mp_hqhc_mode_t141_name";
    } else {
        game["dialog"]["gametype"] = "dx_mp_head_game_uktl_name";
    }
    game["dialog"]["boost"] = "dx_mp_head_game_uktl_bost";
    game["dialog"]["offense_obj"] = "dx_mp_head_game_uktl_bost";
    game["dialog"]["defense_obj"] = "dx_mp_head_game_uktl_bost";
    game["dialog"]["obj_destroyed"] = "obj_destroyed";
    game["dialog"]["obj_captured"] = "obj_captured";
    game["dialog"]["hp_first"] = "dx_mp_head_game_uktl_hqo1";
    game["dialog"]["hp_active"] = "dx_mp_head_game_uktl_hqoa";
    game["dialog"]["hp_new_location"] = "dx_mp_head_game_uktl_hqnl";
    game["dialog"]["hp_captured_enemy"] = "dx_mp_head_game_uktl_hqec";
    game["dialog"]["hp_captured_friendly"] = "dx_mp_head_game_uktl_hqfc";
    game["dialog"]["hp_contested"] = "dx_mp_head_game_uktl_hqct";
    game["dialog"]["hp_move_soon"] = "dx_mp_head_game_uktl_hqmv";
    game["dialog"]["hp_capturing_enemy"] = "dx_mp_head_game_uktl_ecip";
    game["dialog"]["hp_capturing_friendly"] = "dx_mp_head_game_uktl_fcip";
    game["dialog"]["hp_lost"] = "dx_mp_head_game_uktl_hqls";
    game["dialog"]["hp_timeout"] = "dx_mp_head_game_uktl_hqto";
    game["dialog"]["hp_secured_friendly"] = "dx_mp_head_game_uktl_hqsc";
    game["dialog"]["hp_owned_lost"] = "dx_mp_head_game_uktl_hqds";
    game["dialog"]["hp_disabling_enemy"] = "dx_mp_head_game_uktl_hqed";
    game["dialog"]["hp_disabling_friendly"] = "dx_mp_head_game_uktl_hqfd";
    game["dialog"]["hp_dead"] = "dx_mp_head_game_uktl_hqde";
    thread writeplayerrotationscoretomatchdataongameend();
    level._effect["hq_explode"] = loadfx("vfx/iw8_mp/gamemode/vfx_hq_box_destroy.vfx");
    level.nosuspensemusic = 1;
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1042
// Size: 0x16a
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(function_3514ae5d09f47ed2("zoneTimeout"), getmatchrulesdata("hqData", "zoneTimeout"));
    setdynamicdvar(function_3514ae5d09f47ed2("zoneLifetime"), getmatchrulesdata("hqData", "zoneLifetime"));
    setdynamicdvar(function_3514ae5d09f47ed2("zoneCaptureTime"), getmatchrulesdata("hqData", "zoneCaptureTime"));
    setdynamicdvar(function_3514ae5d09f47ed2("firstZoneActivationDelay"), getmatchrulesdata("hqData", "firstZoneActivationDelay"));
    setdynamicdvar(function_3514ae5d09f47ed2("zoneActivationDelay"), getmatchrulesdata("hqData", "zoneActivationDelay"));
    setdynamicdvar(function_3514ae5d09f47ed2("zoneSelectionDelay"), getmatchrulesdata("hqData", "zoneSelectionDelay"));
    setdynamicdvar(function_3514ae5d09f47ed2("randomLocationOrder"), getmatchrulesdata("hqData", "randomLocationOrder"));
    setdynamicdvar(function_3514ae5d09f47ed2("additiveScoring"), getmatchrulesdata("hqData", "additiveScoring"));
    setdynamicdvar(function_3514ae5d09f47ed2("pauseTime"), getmatchrulesdata("hqData", "pauseTime"));
    setdynamicdvar(function_3514ae5d09f47ed2("delayPlayer"), getmatchrulesdata("hqData", "delayPlayer"));
    setdynamicdvar(function_3514ae5d09f47ed2("halftime"), 0);
    registerhalftimedvar(getgametype(), 0);
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b3
// Size: 0x13b
function onstartgametype() {
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/HQ");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/HQ");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/HQ_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/HQ_HINT");
    }
    if (level.scoremod["kill"] > 0) {
        game["dialog"]["offense_obj"] = "boost_groundwar";
        game["dialog"]["defense_obj"] = "boost_groundwar";
    }
    setclientnamemode("auto_change");
    level thread setupzones();
    initspawns();
    seticonnames();
    if (!level.zonerandomlocationorder) {
        remaphardpointorder();
    }
    level thread hqmainloop();
    /#
        level thread function_1f98c5616d8b3d67();
        level thread function_bed0f399bee034f8();
        level thread function_ef4f5aa9c42838b2();
        level thread function_be67fb2ebcca86d1();
        level thread function_b4c2563f73b02c80();
    #/
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f5
// Size: 0x103
function updategametypedvars() {
    updatecommongametypedvars();
    level.zonetimeout = dvarfloatvalue("zoneTimeout", 60, 0, 300);
    level.zoneduration = dvarfloatvalue("zoneLifetime", 60, 0, 300);
    level.zonecapturetime = dvarfloatvalue("zoneCaptureTime", 0, 0, 30);
    level.firstzoneactivationdelay = dvarfloatvalue("firstZoneActivationDelay", 30, 0, 120);
    level.zoneactivationdelay = dvarfloatvalue("zoneActivationDelay", 30, 0, 120);
    level.zoneselectiondelay = dvarfloatvalue("zoneSelectionDelay", 15, 0, 120);
    level.zonerandomlocationorder = dvarintvalue("randomLocationOrder", 1, 0, 1);
    level.zoneadditivescoring = dvarintvalue("additiveScoring", 0, 0, 1);
    level.pausemodetimer = dvarintvalue("pauseTime", 1, 0, 1);
    level.delayplayer = dvarintvalue("delayPlayer", 0, 0, 1);
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ff
// Size: 0x576
function hqmainloop() {
    level endon("game_ended");
    setomnvar("ui_objective_timer_stopped", 1);
    setomnvar("ui_hardpoint_timer", 0);
    setomnvar("ui_hq_status", -1);
    level.zone = getfirstzone();
    var_2afaf68657598b47 = 1;
    level.kothhillrotation = 0;
    level.zone.visuals[0] scriptmodelplayanim("iw8_mp_military_hq_crate_close");
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level waittill_any_2("prematch_done", "start_mode_setup");
    }
    level.zone namespace_8276d48525f0f398::activatezone();
    level.favorclosespawnent = level.zone;
    level.zone.active = 1;
    level.zone namespace_19b4203b51d56488::setvisibleteam("any");
    level.zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icontarget);
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.player = level.zone;
    var_7e2c53b0bcf117d9.eventname = "hill_moved";
    var_7e2c53b0bcf117d9.position = level.zone.trigger.origin;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (level.pausemodetimer) {
        level namespace_d576b6dc7cef9c62::pausetimer();
    }
    setomnvar("ui_objective_timer_stopped", 0);
    var_570ba02607c0425c = 0;
    if (level.firstzoneactivationdelay) {
        level thread waitthenshowfirsthqsplash();
        var_570ba02607c0425c = 1;
        level.zoneendtime = int(gettime() + level.firstzoneactivationdelay * 1000);
        setomnvar("ui_hardpoint_timer", level.zoneendtime);
        setomnvar("ui_hq_status", 1);
        level thread waitthenplaynewobj();
        level.zone thread namespace_19b4203b51d56488::function_d36dcacac1708708(level.firstzoneactivationdelay);
        wait(level.firstzoneactivationdelay);
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(7, "free");
    }
    setomnvar("ui_objective_timer_stopped", 0);
    while (1) {
        if (!isdefined(level.mapcalloutsready)) {
            level thread setupzonecallouts();
        }
        level.objectivesetorder = 1;
        waittillframeend();
        if (!var_570ba02607c0425c) {
            foreach (player in level.players) {
                namespace_5a22b6f3a56f7e9b::objective_unpin_player(level.zone.objidnum, player);
            }
        }
        level.zone namespace_19b4203b51d56488::enableobject();
        level.zone.capturecount = 0;
        if (level.codcasterenabled) {
            level.zone thread namespace_8276d48525f0f398::trackgametypevips();
        }
        namespace_b2d5aa2baf2b5701::clearlastteamspawns();
        hqactivatenextzone(var_570ba02607c0425c, var_2afaf68657598b47);
        var_2afaf68657598b47 = 0;
        var_570ba02607c0425c = 0;
        setomnvar("ui_hq_status", 2);
        namespace_b2d5aa2baf2b5701::clearlastteamspawns();
        level.zone.visuals[0] scriptmodelplayanim("iw8_mp_military_hq_crate_open");
        level.zone.visuals[0] playloopsound("mp_buy_station_attract_lp");
        hpcaptureloop();
        ownerteam = level.zone namespace_19b4203b51d56488::getownerteam();
        setomnvar("ui_hq_ownerteam", 0);
        level.spectateoverride[game["attackers"]].allowenemyspectate = 0;
        level.spectateoverride[game["defenders"]].allowenemyspectate = 0;
        level.lastcaptureteam = undefined;
        level.zone killhardpointvfx();
        level.zone.active = 0;
        if (istrue(level.usehpzonebrushes)) {
            foreach (player in level.players) {
                level.zone namespace_8276d48525f0f398::hideplayerspecificbrushes(player);
            }
        }
        level.zone namespace_19b4203b51d56488::disableobject();
        level.zone namespace_19b4203b51d56488::allowuse("none");
        level.zone namespace_19b4203b51d56488::setownerteam("neutral");
        updateservericons("zone_shift", 0);
        level notify("zone_reset");
        level.zone namespace_8276d48525f0f398::deactivatezone();
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(undefined, "hq_capture", "hq_capture");
        setomnvar("ui_hq_status", 5);
        zoneselectiondelay = int(gettime() + level.zoneselectiondelay * 1000 + 500);
        setomnvar("ui_hardpoint_timer", zoneselectiondelay);
        if (level.zoneselectiondelay > 0) {
            if (level.pausemodetimer) {
                level namespace_d576b6dc7cef9c62::pausetimer();
            }
        }
        thread forcespawnplayers();
        wait(level.zoneselectiondelay);
        spawn_next_zone();
        wait(0.5);
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x197c
// Size: 0x79
function waitthenplaynewobj() {
    if (istrue(level.infilvotiming)) {
        wait(8.5);
    } else {
        wait(6);
    }
    foreach (entry in level.teamnamelist) {
        namespace_944ddf7b8df1b0e3::statusdialog("hp_first", entry);
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19fc
// Size: 0x37
function waitthenshowfirsthqsplash() {
    if (istrue(level.infilvotiming)) {
        wait(6.5);
    } else {
        wait(5.5);
    }
    level thread namespace_44abc05161e2e2cb::notifyteam("hq_located", "hq_located", "allies");
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3a
// Size: 0x13b
function killhardpointvfx() {
    foreach (player in level.players) {
        foreach (var_25ac26fac33ac6f3 in player._hardpointeffect) {
            player._hardpointeffect = array_remove(player._hardpointeffect, var_25ac26fac33ac6f3);
            if (isdefined(var_25ac26fac33ac6f3)) {
                var_25ac26fac33ac6f3 delete();
            }
        }
    }
    if (isdefined(self.neutralhardpointfx) && self.neutralhardpointfx.size > 0) {
        foreach (var_25ac26fac33ac6f3 in self.neutralhardpointfx) {
            var_25ac26fac33ac6f3 delete();
        }
    }
    self.neutralhardpointfx = [];
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7c
// Size: 0x231
function remaphardpointorder() {
    switch (level.mapname) {
    case #"hash_a3aa6afd955c54d":
    case #"hash_8cd7282b2d63b917":
        level.remappedhpzoneorder = [0:"1", 1:"4", 2:"3", 3:"9", 4:"8"];
        break;
    case #"hash_be52fbd3b8746bc":
    case #"hash_d83171ba75f8b8fe":
        level.remappedhpzoneorder = [0:"5", 1:"4", 2:"3", 3:"2", 4:"6"];
        break;
    case #"hash_66ce5cdcd3b547f3":
    case #"hash_ff009e5fab42b778":
        level.remappedhpzoneorder = [0:"1", 1:"5", 2:"2", 3:"3", 4:"4"];
        break;
    case #"hash_1ab428ea9c0ee9e5":
        level.remappedhpzoneorder = [0:"1", 1:"9", 2:"4", 3:"5", 4:"2"];
        break;
    case #"hash_62c07791a2eda185":
        level.remappedhpzoneorder = [0:"12", 1:"11", 2:"3", 3:"1", 4:"2"];
        break;
    case #"hash_f09747c9feb47eb1":
        level.remappedhpzoneorder = [0:"20", 1:"2", 2:"8", 3:"9", 4:"5"];
        break;
    case #"hash_d8bbcfc499e70e6f":
        level.remappedhpzoneorder = [0:"1", 1:"5", 2:"7", 3:"3", 4:"8"];
        break;
    default:
        break;
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db4
// Size: 0x5a
function getfirstzone() {
    if (isdefined(level.remappedhpzoneorder)) {
        zone = level.objectives[level.remappedhpzoneorder[0]];
        level.prevzoneindex = 0;
    } else {
        zone = level.objectives["1"];
        level.prevzoneindex = 1;
    }
    return zone;
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e16
// Size: 0x493
function getnextzone() {
    if (level.zonerandomlocationorder) {
        var_bcadda10e825a297 = [];
        foreach (entry in level.teamnamelist) {
            var_bcadda10e825a297[entry] = (0, 0, 0);
        }
        var_cfd9fb898b8a8fde = getpotentiallivingplayers();
        foreach (player in var_cfd9fb898b8a8fde) {
            if (player.team == "spectator") {
                continue;
            }
            var_bcadda10e825a297[player.team] = var_bcadda10e825a297[player.team] + player.origin;
        }
        var_f95feb63c772e28f = [];
        foreach (entry in level.teamnamelist) {
            players = getteamdata(entry, "players");
            teamsize = max(players.size, 1);
            var_f95feb63c772e28f[entry] = var_bcadda10e825a297[entry] / teamsize;
        }
        if (!isdefined(level.prevzonelist) || isdefined(level.prevzonelist) && level.prevzonelist.size == level.objectives.size - 1) {
            level.prevzonelist = [];
        }
        level.prevzonelist[level.prevzonelist.size] = level.prevzoneindex;
        var_c5746701a936226c = 0.7;
        var_1062b157c642e6b7 = 0.3;
        var_36710543fbaa2aaf = undefined;
        var_94ccba012b7736a = undefined;
        foreach (objective in level.objectives) {
            skip = 0;
            foreach (zoneindex in level.prevzonelist) {
                if (objective.objectivekey == string(zoneindex)) {
                    skip = 1;
                    break;
                }
            }
            if (skip) {
                continue;
            }
            zone = objective;
            var_4e58252555a3aca1 = 0;
            foreach (entry in level.teamnamelist) {
                var_4e58252555a3aca1 = var_4e58252555a3aca1 + distance2dsquared(zone.curorigin, var_f95feb63c772e28f[entry]);
            }
            var_5a8b9d38b749dae2 = distance2dsquared(zone.curorigin, level.zone.curorigin);
            var_d552c16abf741bf4 = var_4e58252555a3aca1 * var_c5746701a936226c + var_5a8b9d38b749dae2 * var_1062b157c642e6b7;
            if (!isdefined(var_94ccba012b7736a) || var_d552c16abf741bf4 > var_94ccba012b7736a) {
                var_94ccba012b7736a = var_d552c16abf741bf4;
                var_36710543fbaa2aaf = objective.objectivekey;
            }
        }
        zone = level.objectives[var_36710543fbaa2aaf];
        level.prevzoneindex = var_36710543fbaa2aaf;
    } else if (isdefined(level.remappedhpzoneorder)) {
        level.prevzoneindex++;
        if (level.prevzoneindex > level.remappedhpzoneorder.size - 1) {
            level.prevzoneindex = 0;
        }
        zone = level.objectives[level.remappedhpzoneorder[level.prevzoneindex]];
    } else {
        level.prevzoneindex++;
        if (level.prevzoneindex > level.objectives.size) {
            level.prevzoneindex = 1;
        }
        zone = level.objectives[string(level.prevzoneindex)];
    }
    return zone;
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22b1
// Size: 0x133
function spawn_next_zone() {
    writecurrentrotationteamscore();
    level.zone = getnextzone();
    level.kothhillrotation++;
    level.zone resetzone();
    level.zone namespace_8276d48525f0f398::activatezone();
    level.favorclosespawnent = level.zone;
    level.zone.active = 1;
    level.zone.lastactivatetime = gettime();
    if (level.zoneactivationdelay > 0) {
        level.zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icontarget);
    } else {
        level.zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
    }
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.player = level.zone;
    var_7e2c53b0bcf117d9.eventname = "hill_moved";
    var_7e2c53b0bcf117d9.position = level.zone.trigger.origin;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23eb
// Size: 0xe3
function resetzone() {
    self.lastclaimteam = "none";
    self.lastprogressteam = "none";
    self.ownerteam = "neutral";
    self.prevownerteam = "neutral";
    self.curprogress = 0;
    teams = getarraykeys(self.teamprogress);
    foreach (team in teams) {
        self.teamprogress[team] = 0;
    }
    namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(self.objidnum, undefined);
    namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d5
// Size: 0x2f7
function hqactivatenextzone(var_570ba02607c0425c, var_2afaf68657598b47) {
    if (!var_2afaf68657598b47 && level.zoneselectiondelay > 5 && level.zoneactivationdelay > 5) {
        foreach (entry in level.teamnamelist) {
            namespace_944ddf7b8df1b0e3::statusdialog("hp_new_location", entry);
        }
    }
    if (isdefined(level.zone.curorigin)) {
        playsoundatpos(level.zone.curorigin, "mp_hq_activate_sfx");
    }
    level.zone thread namespace_8276d48525f0f398::hardpoint_setneutral();
    level.zone namespace_19b4203b51d56488::allowuse("none");
    if (istrue(var_570ba02607c0425c)) {
        goto LOC_000001e4;
    }
    if (level.zoneactivationdelay) {
        level thread namespace_44abc05161e2e2cb::notifyteam("hq_located", "hq_located", "allies");
        level.zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icontarget);
        updateservericons("zone_activation_delay", 0);
        waitframe();
        level.zoneendtime = int(gettime() + 1000 * level.zoneactivationdelay);
        setomnvar("ui_hardpoint_timer", level.zoneendtime);
        setomnvar("ui_hq_status", 1);
        if (level.pausemodetimer) {
            level namespace_d576b6dc7cef9c62::pausetimer();
        }
        level.zone thread namespace_19b4203b51d56488::function_d36dcacac1708708(level.zoneactivationdelay);
        wait(level.zoneactivationdelay);
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(7, "free");
    LOC_000001e4:
    }
LOC_000001e4:
    foreach (entry in level.teamnamelist) {
        namespace_944ddf7b8df1b0e3::statusdialog("hp_active", entry);
    }
    level thread namespace_44abc05161e2e2cb::notifyteam("hq_capture", "hq_capture", "allies");
    if (level.pausemodetimer) {
        level namespace_d576b6dc7cef9c62::resumetimer();
    }
    level.zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
    updateservericons("neutral", 0);
    if (level.zoneduration) {
        updateservericons("neutral", 0);
        if (level.zonetimeout == 0) {
            thread locktimeruntilcap();
        } else {
            timeout = level.zonetimeout;
            thread movezoneaftertime(timeout);
            level.zoneendtime = int(gettime() + 1000 * timeout);
            setomnvar("ui_hardpoint_timer", level.zoneendtime);
        }
    } else {
        level.zonedestroyedbytimer = 0;
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27d3
// Size: 0x48
function locktimeruntilcap() {
    level endon("zone_captured");
    while (1) {
        level.zoneendtime = int(gettime() + 1000 * level.zoneduration);
        setomnvar("ui_hardpoint_timer", level.zoneendtime);
        waitframe();
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2822
// Size: 0x277
function hpcaptureloop() {
    level endon("game_ended");
    level endon("zone_moved");
    level.hpstarttime = gettime();
    while (1) {
        level.zone namespace_19b4203b51d56488::allowuse("enemy");
        level.zone namespace_19b4203b51d56488::setvisibleteam("any");
        level.zone namespace_19b4203b51d56488::setusetext("MP/SECURING_POSITION");
        if (isdefined(level.matchrules_droptime) && level.matchrules_droptime) {
            level thread namespace_36b7108419a0e401::randomdrops();
        }
        msg = level waittill_any_return_2("zone_captured", "zone_destroyed");
        if (msg == "zone_destroyed") {
            continue;
        } else {
            level.zoneendtime = int(gettime() + 1000 * level.zoneduration);
            setomnvar("ui_hardpoint_timer", level.zoneendtime);
            setomnvar("ui_hq_status", 3);
        }
        ownerteam = level.zone namespace_19b4203b51d56488::getownerteam();
        thread updaterespawntimer();
        if (level.zoneduration > 0) {
            thread movezoneaftertime(level.zoneduration);
        }
        if (level.zonecapturetime > 0) {
            var_4725e52b7c3aa25c = getteamdata(ownerteam, "players");
            player = getfriendlyplayers(ownerteam, 0)[0];
            level thread namespace_44abc05161e2e2cb::notifyteam("hq_captured", "hq_destroy", ownerteam, var_4725e52b7c3aa25c, undefined, undefined, player);
        }
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(ownerteam, "hq_defend", "hq_detroy");
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(8, ownerteam);
        destroy_team = level waittill("zone_destroyed");
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(9, "free");
        if (level.zonecapturetime > 0) {
            enemyteam = getotherteam(ownerteam)[0];
            player = getfriendlyplayers(enemyteam, 0)[0];
            level thread namespace_44abc05161e2e2cb::notifyteam("hq_destroyed", "hq_destroyed", enemyteam, undefined, undefined, undefined, player);
        }
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(undefined, "hq_capture", "hq_capture");
        level.spawndelay = undefined;
        if (isdefined(destroy_team)) {
            level.zone namespace_19b4203b51d56488::setownerteam(destroy_team);
        } else {
            level.zone namespace_19b4203b51d56488::setownerteam("none");
        }
        setomnvar("ui_hardpoint_timer", 0);
        setomnvar("ui_hq_status", -1);
        break;
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aa0
// Size: 0x9b
function updaterespawntimer() {
    level endon("game_ended");
    level endon("zone_moved");
    level endon("zone_destroyed");
    starttime = gettime();
    if (level.zoneduration > 0) {
        endtime = starttime + level.zoneduration * 1000;
    } else {
        endtime = starttime + gettimelimit() * 1000 - gettimepassed();
    }
    currenttime = starttime;
    while (currenttime < endtime) {
        currenttime = gettime();
        level.spawndelay = (endtime - currenttime) / 1000 + 0.1;
        waitframe();
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b42
// Size: 0x2fd
function initspawns() {
    if (!spawnlogic::function_bff229a11ecd1e34()) {
        spawnlogic::setactivespawnlogic("Default", "Crit_Frontline", 1);
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    var_6170ec00c4bc9b5b = "koth";
    if (spawnlogic::function_b17bf43316b9fb08(var_6170ec00c4bc9b5b)) {
        spawnlogic::function_afe4709b818e7c9e(var_6170ec00c4bc9b5b);
    } else {
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_koth_spawn_allies_start");
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_koth_spawn_axis_start");
        namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_koth_spawn_allies_start");
        namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_koth_spawn_axis_start");
        attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_koth_spawn_allies_start");
        defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_koth_spawn_axis_start");
        namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
        namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_koth_spawn", 1);
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_koth_spawn", 1);
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_koth_spawn_secondary", 1, 1);
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_koth_spawn_secondary", 1, 1);
        namespace_b2d5aa2baf2b5701::registerspawnset("primary", namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_koth_spawn"));
        namespace_b2d5aa2baf2b5701::registerspawnset("fallback", namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_koth_spawn_secondary"));
        spawnlogic::function_48ed29b53fd72775();
    }
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    foreach (zone in level.objectives) {
        zone.furthestspawndistsq = 0;
        zone.spawnpoints = [];
        zone.spawnpoints[0] = [];
        zone.spawnpoints[2] = [];
    }
    namespace_10eb9162061dea8d::function_4265173fd3869f34(0, "primary", var_6170ec00c4bc9b5b);
    namespace_10eb9162061dea8d::function_4265173fd3869f34(2, "fallback", var_6170ec00c4bc9b5b);
    foreach (objid, zone in level.objectives) {
        zone.spawnset = "koth_" + objid;
        spawnlogic::registerspawnset(zone.spawnset, zone.spawnpoints[0]);
        zone.fallbackspawnset = "koth_fallback_" + objid;
        spawnlogic::registerspawnset(zone.fallbackspawnset, zone.spawnpoints[2]);
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e46
// Size: 0xde
function comparezoneindexes(zone_a, zone_b) {
    script_index_a = int(zone_a.objectivekey);
    script_index_b = int(zone_b.objectivekey);
    if (!isdefined(script_index_a) && !isdefined(script_index_b)) {
        /#
            println("dx_mp_head_game_uktl_hqmv" + zone_a.origin + "prematch_done" + zone_b.origin);
        #/
        return 0;
    }
    if (!isdefined(script_index_a) && isdefined(script_index_b)) {
        /#
            println("dx_mp_head_game_uktl_hqmv" + zone_a.origin);
        #/
        return 1;
    }
    if (isdefined(script_index_a) && !isdefined(script_index_b)) {
        /#
            println("dx_mp_head_game_uktl_hqmv" + zone_b.origin);
        #/
        return 0;
    }
    if (script_index_a > script_index_b) {
        return 1;
    }
    return 0;
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f2c
// Size: 0x10d
function getzonearray(targetname) {
    zones = getentarray(targetname, "targetname");
    foreach (z in zones) {
        z.objectivekey = z.script_label;
    }
    if (!isdefined(zones) || zones.size == 0) {
        return undefined;
    }
    swapped = 1;
    for (n = zones.size; swapped; n--) {
        swapped = 0;
        for (i = 0; i < n - 1; i++) {
            if (comparezoneindexes(zones[i], zones[i + 1])) {
                temp = zones[i];
                zones[i] = zones[i + 1];
                zones[i + 1] = temp;
                swapped = 1;
            }
        }
    }
    return zones;
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3041
// Size: 0x340
function setupzones() {
    trigs = getzonearray("hq_zone");
    if (!isdefined(trigs)) {
        trigs = getzonearray("hardpoint_zone");
    }
    /#
        assert(isdefined(trigs) && trigs.size > 3);
    #/
    maperrors = [];
    errored = 0;
    radios = getentarray("hqloc", "targetname");
    visuals = [];
    if (trigs.size != radios.size) {
        maperrors[maperrors.size] = "Number of hqloc Radios and hardpoint_zone triggers are not equal";
        errored = 1;
        foreach (trig in trigs) {
            var_ad440e7908375fd4 = 0;
            foreach (radio in radios) {
                if (radio istouching(trig)) {
                    var_ad440e7908375fd4 = 1;
                    break;
                }
            }
            if (!var_ad440e7908375fd4) {
                maperrors[maperrors.size] = "hardpoint_zone: " + trig.script_label + " has no hqloc radio inside it";
            }
        }
    }
    level.objectives = [];
    for (i = 0; i < radios.size; i++) {
        radio = radios[i];
        trig = undefined;
        for (j = 0; j < trigs.size; j++) {
            if (radio istouching(trigs[j])) {
                if (isdefined(trig)) {
                    maperrors[maperrors.size] = "Radio at " + radio.origin + " is touching more than one "hardpoint_zone" trigger";
                    errored = 1;
                    break;
                }
                trig = trigs[j];
                break;
            }
        }
        if (!isdefined(trig) && getdvarint(@"hash_b6e38e5a0db26c74", 0)) {
            trig = getclosest(radio.origin, trigs);
            /#
                level thread function_46cdb774ca022e52(trig.origin, radio.origin);
            #/
        }
        if (!isdefined(trig)) {
            jumpiftrue(errored) LOC_0000027e;
            maperrors[maperrors.size] = "Radio at " + radio.origin + " is not inside any "hardpoint_zone" trigger";
            errored = 1;
        } else {
        LOC_0000027e:
            /#
                assert(!errored);
            #/
            visuals = [];
            visuals[0] = radio;
            othervisuals = getentarray(radio.target, "targetname");
            for (k = 0; k < othervisuals.size; k++) {
                visuals[visuals.size] = othervisuals[k];
            }
            if (isdefined(trig)) {
                zone = namespace_8276d48525f0f398::setupobjective(trig, visuals);
                level.objectives[zone.objectivekey] = zone;
            }
        }
    }
    if (maperrors.size > 0) {
        /#
            println("any");
            for (i = 0; i < maperrors.size; i++) {
                println(maperrors[i]);
            }
            println("hq_defend");
        #/
        /#
            assertmsg("Map errors. See above");
        #/
        return;
    }
    return 1;
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3389
// Size: 0x52
function function_46cdb774ca022e52(origin1, origin2) {
    /#
        while (1) {
            line(origin1, origin2, (1, 0, 0), 1, 0, 1);
            box(origin1, 0, (1, 0, 0), 0, 1);
            waitframe();
        }
    #/
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33e2
// Size: 0xae
function setupzonecallouts() {
    var_49996ebebbbbf375 = undefined;
    zonetrigger = level.zone.visuals[0];
    if (isdefined(zonetrigger.script_noteworthy)) {
        var_49996ebebbbbf375 = level.calloutglobals.areaidmap[zonetrigger.script_noteworthy];
    }
    if (!isdefined(var_49996ebebbbbf375)) {
        var_49996ebebbbbf375 = namespace_8554064ba5e7d07::function_45d5ee5f369ad604(zonetrigger);
    }
    if (isdefined(var_49996ebebbbbf375)) {
        setomnvar("ui_hp_callout_id", var_49996ebebbbbf375);
    }
    namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(6, "free");
    /#
        assertex(isdefined(var_49996ebebbbbf375), "Headquarters " + zonetrigger.targetname + " origin needs to be inside a callout area or the callout trigger and zone trigger need a common script_noteworthy");
    #/
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3497
// Size: 0xa8
function forcespawnplayers() {
    players = level.players;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (!isdefined(player) || istrue(player.fauxdead) && player isusingremote() || isalive(player) && !istrue(player.fauxdead)) {
            continue;
        }
        namespace_5a22b6f3a56f7e9b::objective_unpin_player(level.zone.objidnum, player);
        player notify("force_spawn");
        waitframe();
    }
    thread function_7f5bcc4009c143bd();
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3546
// Size: 0xbc
function function_7f5bcc4009c143bd() {
    wait(3);
    players = level.players;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (player isinkillcam()) {
            player thread function_2fb169121f027ccc();
            continue;
        } else if (!isdefined(player) || istrue(player.fauxdead) && player isusingremote() || isalive(player) && !istrue(player.fauxdead)) {
            continue;
        }
        namespace_5a22b6f3a56f7e9b::objective_unpin_player(level.zone.objidnum, player);
        player notify("force_spawn");
        waitframe();
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3609
// Size: 0x2e
function function_2fb169121f027ccc() {
    level endon("game_ended");
    self endon("spawned");
    while (isinkillcam()) {
        wait(0.1);
    }
    wait(1);
    self notify("force_spawn");
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x363e
// Size: 0x134
function getspawnpoint() {
    var_2fa17baefe0fa286 = getkothzonedeadzonedist();
    var_629e5fe2f6b337fa = namespace_b41002c7afebd276::function_75c03ed937b75b22(level.zone.trigger getentitynumber(), level.zone.furthestspawndistsq, var_2fa17baefe0fa286 * var_2fa17baefe0fa286, 12250000);
    var_b54c2c899faec51d = spawnlogic::shoulduseteamstartspawn();
    if (spawnlogic::function_bff229a11ecd1e34()) {
        var_f6cf8482a6f0b335 = #"default";
        if (var_b54c2c899faec51d) {
            var_f6cf8482a6f0b335 = #"start";
        }
        if (!spawnlogic::function_8ac9620f8251ef84(var_f6cf8482a6f0b335)) {
            spawnlogic::setactivespawnlogic(var_f6cf8482a6f0b335);
        }
    }
    if (var_b54c2c899faec51d) {
        return spawnlogic::function_8be1c339876506b9(self, "start", self.pers["team"], var_629e5fe2f6b337fa);
    } else if (istrue(level.var_307162ed6f880997)) {
        return spawnlogic::function_8be1c339876506b9(self, "default", self.pers["team"], var_629e5fe2f6b337fa);
    }
    return namespace_b2d5aa2baf2b5701::getspawnpoint(self, self.pers["team"], level.zone.spawnset, level.zone.fallbackspawnset, 2, var_629e5fe2f6b337fa);
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x377a
// Size: 0x25
function getkothzonedeadzonedist() {
    if (!istrue(level.zone.active)) {
        return 2000;
    } else {
        return 1000;
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37a6
// Size: 0xa0
function onspawnplayer(var_9156b53bcf7ce573) {
    self setclientomnvar("ui_hq_norespawn", 0);
    if (isdefined(level.zone) && isdefined(level.zone.ownerteam) && level.zone.ownerteam != "neutral") {
        setomnvar("ui_hq_num_alive", namespace_54d20dd0dd79277f::getteamdata(level.zone.ownerteam, "aliveCount"));
    }
    self.forcespawnnearteammates = undefined;
    self.skipspawncamera = undefined;
    thread updatematchstatushintonspawn();
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x384d
// Size: 0xe7
function movezoneaftertime(time) {
    level notify("startMoveTimer");
    level endon("startMoveTimer");
    level endon("game_ended");
    level endon("zone_reset");
    level endon("dev_force_zone");
    level.zonemovetime = time;
    level.zonedestroyedbytimer = 0;
    namespace_8276d48525f0f398::zonetimerwait();
    level.zonedestroyedbytimer = 1;
    if (level.zoneselectiondelay + level.zoneactivationdelay > 5) {
        foreach (entry in level.teamnamelist) {
            namespace_944ddf7b8df1b0e3::statusdialog("hp_timeout", entry);
        }
    }
    namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(9, "free");
    level notify("zone_moved");
    level notify("zone_destroyed");
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x393b
// Size: 0x2d
function onsuicidedeath(victim) {
    setomnvar("ui_hq_num_alive", getteamdata(victim.team, "aliveCount"));
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x396f
// Size: 0x2d
function modeonteamchangedeath(player) {
    setomnvar("ui_hq_num_alive", getteamdata(player.leaving_team, "aliveCount"));
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39a3
// Size: 0x38
function canspawnontacinsert(player) {
    var_a3036ebee981194e = level.zone.ownerteam == player.team;
    return !var_a3036ebee981194e;
}

// Namespace hq/namespace_d1f589f22374fa09
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39e3
// Size: 0x2b9
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    ownerteam = level.zone.ownerteam;
    if (!isplayer(attacker) || attacker.team == self.team) {
        if (ownerteam != "neutral") {
            self.skipspawncamera = 1;
        }
        return;
    }
    if (attacker == self) {
        return;
    }
    if (!isdefined(level.zone)) {
        return;
    }
    ownerteam = level.zone.ownerteam;
    if (!isdefined(ownerteam)) {
        return;
    }
    if (isdefined(objweapon) && iskillstreakweapon(objweapon.basename)) {
        return;
    }
    victim = self;
    var_9ff9376383f4bc58 = 0;
    attackerteam = attacker.team;
    if (ownerteam != "neutral") {
        level updatehqaliveomnvars(ownerteam);
    }
    if (ownerteam == victim.team) {
        victim.skipspawncamera = 1;
    }
    if (level.zone.active) {
        if (level.zonecapturetime > 0 && attacker istouching(level.zone.trigger)) {
            if (ownerteam != attackerteam) {
                var_9ff9376383f4bc58 = 1;
            }
        }
        if (attackerteam != ownerteam) {
            if (var_9ff9376383f4bc58) {
                attacker thread function_e3e3e81453fd788b(#"hash_470103fde6a5e1ae");
            } else if (victim istouching(level.zone.trigger)) {
                attacker thread namespace_62c556437da28f50::scoreeventpopup(#"assault");
                attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5a3b180273be47b1");
                thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "defending");
            }
        } else if (attacker istouching(level.zone.trigger)) {
            attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
            attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2");
            attacker incpersstat("defends", 1);
            attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
            attacker setextrascore1(attacker.pers["defends"]);
        }
    }
    thread checkallowspectating();
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ca3
// Size: 0x72
function checkallowspectating() {
    if (level.zone.ownerteam == "neutral") {
        return;
    }
    if (!getteamdata(level.zone.ownerteam, "aliveCount")) {
        level.spectateoverride[level.zone.ownerteam].allowenemyspectate = 1;
        namespace_5aeecefc462876::updatespectatesettings();
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d1c
// Size: 0x23
function updatehqaliveomnvars(ownerteam) {
    setomnvar("ui_hq_num_alive", getteamdata(ownerteam, "aliveCount"));
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d46
// Size: 0x416
function give_capture_credit(touchlist, capturetime, capture_team, lastcaptureteam, var_22282e7d48ca3400, var_886cde1ef52223c3) {
    level endon("game_ended");
    level.lastcaptime = gettime();
    first_player = undefined;
    var_eeb573d717f07f64 = 0;
    if (isdefined(var_22282e7d48ca3400)) {
        var_7f98a969b68d5171 = touchlist[var_22282e7d48ca3400.guid];
        var_eeb573d717f07f64 = var_7f98a969b68d5171.var_d96989d14549fd76;
        if (var_eeb573d717f07f64) {
            if (isdefined(var_7f98a969b68d5171.owner)) {
                first_player = var_7f98a969b68d5171.owner;
            }
        } else {
            first_player = var_7f98a969b68d5171.player;
        }
    }
    if (isdefined(first_player)) {
        if (!isscoreboosting(first_player)) {
            var_7e2c53b0bcf117d9 = spawnstruct();
            var_7e2c53b0bcf117d9.player = first_player;
            var_7e2c53b0bcf117d9.eventname = "capture";
            var_7e2c53b0bcf117d9.position = first_player.origin;
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
            first_player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_cbcb83b1a39c5c8e");
            if (var_eeb573d717f07f64) {
                first_player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_36af03684ac64eb8");
            } else {
                first_player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_194ad9a7fdb13341");
            }
            if (isdefined(level.zone.lastactivatetime) && gettime() - level.zone.lastactivatetime <= 2100) {
                if (var_eeb573d717f07f64) {
                    first_player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_14ca5d321828d5c5");
                } else {
                    first_player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_4d98aed9e6ebbf28");
                }
            }
            if (first_player.lastkilltime + 500 > gettime()) {
                goto LOC_00000259;
            }
            first_player namespace_8276d48525f0f398::setcrankedtimerzonecap(first_player);
        LOC_00000259:
        }
    LOC_00000259:
    }
LOC_00000259:
    players = getarraykeys(touchlist);
    for (i = 0; i < players.size; i++) {
        var_299187353eae616d = touchlist[players[i]];
        var_8a11b26acefd3594 = var_299187353eae616d.var_d96989d14549fd76;
        if (var_8a11b26acefd3594) {
            if (isdefined(var_299187353eae616d.owner)) {
                player = var_299187353eae616d.owner;
            } else {
                player = undefined;
            }
        } else {
            player = var_299187353eae616d.player;
        }
        if (isdefined(player)) {
            player updatecapsperminute(lastcaptureteam);
            if (!isscoreboosting(player)) {
                player namespace_b919c4be206d3c80::function_48544e365f4f5648(15, 1);
                player incpersstat("captures", 1);
                player namespace_2685ec368e022695::statsetchild("round", "captures", player.pers["captures"]);
                player setextrascore0(player.pers["captures"]);
            } else {
                /#
                    player iprintlnbold("defends");
                #/
            }
        }
        wait(0.05);
    }
    if (isdefined(var_886cde1ef52223c3.assisttouchlist)) {
        if (var_886cde1ef52223c3.assisttouchlist[capture_team].size > 0) {
            var_9eb80458ef362367 = getarraykeys(var_886cde1ef52223c3.assisttouchlist[capture_team]);
            foreach (id in players) {
                foreach (var_2c6d54a195121e5f in var_9eb80458ef362367) {
                    if (var_2c6d54a195121e5f == id) {
                        var_886cde1ef52223c3.assisttouchlist[capture_team][var_2c6d54a195121e5f] = undefined;
                    }
                }
            }
        }
        if (var_886cde1ef52223c3.assisttouchlist[capture_team].size > 0) {
            var_886cde1ef52223c3 thread function_11ce247555fb7a20(capture_team);
        }
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4163
// Size: 0x169
function function_11ce247555fb7a20(team) {
    level endon("game_ended");
    var_9eb80458ef362367 = getarraykeys(self.assisttouchlist[team]);
    if (var_9eb80458ef362367.size > 0) {
        for (index = 0; index < var_9eb80458ef362367.size; index++) {
            var_6c7881393d098340 = self.assisttouchlist[team][var_9eb80458ef362367[index]];
            var_8a11b26acefd3594 = var_6c7881393d098340.var_d96989d14549fd76;
            if (var_8a11b26acefd3594) {
                if (isdefined(var_6c7881393d098340.owner)) {
                    player = var_6c7881393d098340.owner;
                } else {
                    player = undefined;
                }
            } else {
                player = var_6c7881393d098340.player;
            }
            if (isdefined(player)) {
                player incpersstat("captures", 1);
                player namespace_2685ec368e022695::statsetchild("round", "captures", player.pers["captures"]);
                player setextrascore0(player.pers["captures"]);
                if (isdefined(var_8a11b26acefd3594)) {
                    player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_70c24ce7e0579e7a");
                } else {
                    player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_971a82e17e683215");
                    player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_7a10d07e9cc5745b");
                }
                player namespace_8276d48525f0f398::setcrankedtimerzonecap(player);
            }
            self.assisttouchlist[team][var_9eb80458ef362367[index]] = undefined;
            wait(0.05);
        }
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d3
// Size: 0xf1
function awardcapturepoints() {
    level endon("game_ended");
    level endon("zone_reset");
    level endon("zone_moved");
    level notify("awardCapturePointsRunning");
    level endon("awardCapturePointsRunning");
    seconds = 1;
    score = 1;
    while (!level.gameended) {
        waittime = 0;
        while (waittime < seconds) {
            wait(level.framedurationseconds);
            namespace_e323c8674b44c8f4::waittillhostmigrationdone();
            waittime = waittime + level.framedurationseconds;
        }
        team = level.zone namespace_19b4203b51d56488::getownerteam();
        if (team == "neutral") {
            continue;
        }
        if (level.zoneadditivescoring) {
            score = level.zone.touchlist[team].size;
        }
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(team, score, 0);
        if (!istrue(level.scoreleadchanged)) {
            adjustmatchtimerpausedstatefromleadchange(team);
        }
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43cb
// Size: 0x69
function adjustmatchtimerpausedstatefromleadchange(team) {
    if (!level.pausemodetimer) {
        return;
    }
    var_e3f1a73a39054069 = namespace_e8a49b70d0769b66::_getteamscore(team);
    otherteamscore = namespace_e8a49b70d0769b66::_getteamscore(getotherteam(team)[0]);
    if (var_e3f1a73a39054069 > otherteamscore) {
        level.scoreleadchanged = 1;
        level namespace_d576b6dc7cef9c62::resumetimer();
    } else {
        level namespace_d576b6dc7cef9c62::pausetimer();
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x443b
// Size: 0xcb
function updatecapsperminute(lastownerteam) {
    if (!isdefined(self.capsperminute)) {
        self.numcaps = 0;
        self.capsperminute = 0;
    }
    if (!isdefined(lastownerteam) || lastownerteam == "neutral") {
        return;
    }
    self.numcaps++;
    minutespassed = gettimepassed() / 60000;
    if (isplayer(self) && isdefined(self.timeplayed["total"])) {
        minutespassed = self.timeplayed["total"] / 60;
    }
    self.capsperminute = self.numcaps / minutespassed;
    if (self.capsperminute > self.numcaps) {
        self.capsperminute = self.numcaps;
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x450d
// Size: 0x2a
function isscoreboosting(player) {
    return isdefined(player.capsperminute) && player.capsperminute > 3;
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x453f
// Size: 0x130
function onplayerconnect(player) {
    player setclientomnvar("ui_hq_norespawn", 0);
    player._hardpointeffect = [];
    player.numcaps = 0;
    player.capsperminute = 0;
    player.timebyrotation = [];
    player setextrascore0(0);
    if (isdefined(player.pers["captures"])) {
        player setextrascore0(player.pers["captures"]);
    }
    player setextrascore1(0);
    if (isdefined(player.pers["defends"])) {
        player setextrascore1(player.pers["defends"]);
    }
    thread onplayerspawned(player);
    foreach (zone in level.objectives) {
        if (istrue(level.usehpzonebrushes)) {
            zone namespace_8276d48525f0f398::hideplayerspecificbrushes(player);
        }
    }
    player thread refreshfreecamhardpointfx();
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4676
// Size: 0xab
function onplayerspawned(player) {
    while (1) {
        player waittill("spawned");
        foreach (zone in level.objectives) {
            if (istrue(zone.active)) {
                if (zone.ownerteam == "neutral") {
                    zone namespace_8276d48525f0f398::playhardpointneutralfx();
                } else {
                    zone namespace_8276d48525f0f398::showcapturedhardpointeffecttoplayer(zone.ownerteam, player);
                }
            }
        }
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4728
// Size: 0x3b
function gethqownerteamvalue(ownerteam) {
    if (ownerteam == "allies") {
        var_cabc886d846dd979 = 2;
    } else if (ownerteam == "axis") {
        var_cabc886d846dd979 = 1;
    } else {
        var_cabc886d846dd979 = 0;
    }
    return var_cabc886d846dd979;
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x476b
// Size: 0x9c
function updateservericons(state, contested) {
    var_cabc886d846dd979 = -1;
    if (contested) {
        var_cabc886d846dd979 = -2;
    } else if (isgameplayteam(state)) {
        player = thread getownerteamplayer(state);
        if (isdefined(player)) {
            var_cabc886d846dd979 = player getentitynumber();
        }
    } else {
        switch (state) {
        case #"hash_3bf8ec5fe1d42da8":
            var_cabc886d846dd979 = -3;
            break;
        case #"hash_c312107e6bce703c":
        default:
            break;
        }
    }
    setomnvar("ui_hardpoint", var_cabc886d846dd979);
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x480e
// Size: 0x7c
function getownerteamplayer(ownerteam) {
    var_a3010f9814a40c8d = undefined;
    foreach (player in level.players) {
        if (player.team == ownerteam) {
            var_a3010f9814a40c8d = player;
            break;
        }
    }
    return var_a3010f9814a40c8d;
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4892
// Size: 0xb6
function refreshfreecamhardpointfx() {
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        view = channel = self waittill("luinotifyserver");
        if (channel == "mlg_view_change") {
            foreach (zone in level.objectives) {
                if (zone.ownerteam != "neutral") {
                    zone namespace_8276d48525f0f398::showcapturedhardpointeffecttoplayer(zone.ownerteam, self);
                }
            }
        }
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x494f
// Size: 0x61
function getrespawndelay() {
    if (!istrue(level.delayplayer)) {
        return undefined;
    }
    ownerteam = level.zone.ownerteam;
    if (isdefined(ownerteam)) {
        if (self.pers["team"] == ownerteam) {
            if (!level.spawndelay) {
                return undefined;
            }
            return level.spawndelay;
        }
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49b7
// Size: 0x94
function updatematchstatushintonspawn() {
    level endon("game_ended");
    if (isdefined(level.zone)) {
        if (isdefined(level.zone.ownerteam)) {
            if (level.zone.ownerteam == "neutral") {
                namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("hq_capture");
            } else if (level.zone.ownerteam == self.team) {
                namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("hq_defend");
            } else {
                namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("hq_detroy");
            }
        }
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a52
// Size: 0x34
function showrespawnwarningmessage() {
    self endon("death_or_disconnect");
    self setclientomnvar("ui_hq_norespawn", 1);
    namespace_a34451ae3d453e::playsoundonplayers("mp_hq_respawn_disabled");
    wait(5);
    self setclientomnvar("ui_hq_norespawn", 0);
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a8d
// Size: 0x73
function seticonnames() {
    level.icontarget = "hq_target";
    level.iconneutral = "hq_neutral";
    level.iconcapture = "hq_destroy";
    level.icondefend = "hq_defend";
    level.iconcontested = "hq_contested";
    level.icontaking = "hq_taking";
    level.iconlosing = "hq_losing";
    level.icondefending = "hq_defending";
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b07
// Size: 0x12
function writeplayerrotationscoretomatchdataongameend() {
    level waittill("game_ended");
    writecurrentrotationteamscore();
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b20
// Size: 0x4e
function writecurrentrotationteamscore() {
    if (level.kothhillrotation < 24) {
        setmatchdata("alliesRoundScore", level.kothhillrotation, getteamscore("allies"));
        setmatchdata("axisRoundScore", level.kothhillrotation, getteamscore("axis"));
    }
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4b75
// Size: 0xa8
function function_49d30df50940b9d7(org, size, color) {
    /#
        for (i = 0; i < 10; i++) {
            var_ce0ee878f55f5e93 = i / 10 * 360;
            var_ce0ee978f55f60c6 = (i + 1) / 10 * 360;
            var_b1a981030274aadc = org + (cos(var_ce0ee878f55f5e93), sin(var_ce0ee878f55f5e93), 0) * size;
            var_b1a984030274b175 = org + (cos(var_ce0ee978f55f60c6), sin(var_ce0ee978f55f60c6), 0) * size;
            line(var_b1a981030274aadc, var_b1a984030274b175, color);
        }
    #/
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c24
// Size: 0x304
function function_dfb50c5482a4d86() {
    /#
        while (1) {
            if (getdvar(@"hash_657c47f657a0023c") != "<unknown string>") {
                wait(2);
                continue;
            }
            while (1) {
                if (getdvar(@"hash_657c47f657a0023c") != "<unknown string>") {
                    break;
                }
                if (!isdefined(level.players) || level.players.size <= 0) {
                    wait(0.05);
                    continue;
                }
                bestdistsq = 999999999;
                var_5f24d6ddb3a012c6 = level.radios[0];
                foreach (radio in level.radios) {
                    distsq = distancesquared(radio.origin, level.players[0].origin);
                    if (distsq < bestdistsq) {
                        bestdistsq = distsq;
                        var_5f24d6ddb3a012c6 = radio;
                    }
                }
                foreach (radio in level.radios) {
                    if (radio != var_5f24d6ddb3a012c6) {
                        function_49d30df50940b9d7(radio.origin, 50, (0.5, 0.5, 0.5));
                    }
                }
                radio = var_5f24d6ddb3a012c6;
                function_49d30df50940b9d7(radio.origin, 100, (1, 1, 1));
                foreach (spawnpoint in radio.var_4945049d500c1dec) {
                    line(radio.origin, spawnpoint.origin, (1, 0.5, 0.5));
                    function_49d30df50940b9d7(spawnpoint.origin, 20, (1, 0.5, 0.5));
                }
                foreach (spawnpoint in radio.var_f195ec37125a4ce7) {
                    line(radio.origin + (0, 0, 10), spawnpoint.origin + (0, 0, 10), (0.5, 1, 0.5));
                    function_49d30df50940b9d7(spawnpoint.origin, 30, (0.5, 1, 0.5));
                }
                wait(0.05);
            }
        }
    #/
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f2f
// Size: 0x76
function function_1f98c5616d8b3d67() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_4806172df45de691") != 0) {
                level notify("<unknown string>");
                level.zoneduration = 10000;
                break;
            }
            wait(1);
        }
        thread movezoneaftertime(level.zoneduration);
        level.var_2db03438253fa6e2 = 1;
        setdevdvar(@"hash_4806172df45de691", 0);
        thread function_1f98c5616d8b3d67();
    #/
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fac
// Size: 0xb2
function function_bed0f399bee034f8() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_796deaab0da995a1") != 0) {
                level notify("<unknown string>");
                level.zoneduration = 1;
                break;
            }
            wait(1);
        }
        thread movezoneaftertime(level.zoneduration);
        setdevdvar(@"hash_796deaab0da995a1", 0);
        if (isdefined(level.var_2db03438253fa6e2) && level.var_2db03438253fa6e2) {
            level.zoneduration = 10000;
        } else {
            level.zoneduration = getdvarint(@"hash_cb81f537c99c9657");
        }
        thread function_bed0f399bee034f8();
        self notify("<unknown string>");
    #/
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5065
// Size: 0x80
function function_ef4f5aa9c42838b2() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_4c260c16d548430f") != 0) {
                level notify("<unknown string>");
                level.zoneduration = getdvarint(@"hash_cb81f537c99c9657");
                break;
            }
            wait(1);
        }
        thread movezoneaftertime(level.zoneduration);
        level.var_2db03438253fa6e2 = 0;
        setdevdvar(@"hash_4c260c16d548430f", 0);
        thread function_ef4f5aa9c42838b2();
    #/
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50ec
// Size: 0x262
function function_be67fb2ebcca86d1() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_c000ec9a5a2f4b6c") != 0) {
                setdevdvar(@"hash_4806172df45de691", 1);
                level.zoneduration = 10000;
                level.var_2db03438253fa6e2 = 1;
                thread movezoneaftertime(level.zoneduration);
                level notify("<unknown string>");
                foreach (zone in level.objectives) {
                    if (isdefined(zone.neutralhardpointfx) && zone.neutralhardpointfx.size > 0) {
                        foreach (var_25ac26fac33ac6f3 in zone.neutralhardpointfx) {
                            zone.neutralhardpointfx = array_remove(zone.neutralhardpointfx, var_25ac26fac33ac6f3);
                            if (isdefined(var_25ac26fac33ac6f3)) {
                                var_25ac26fac33ac6f3 delete();
                            }
                        }
                    }
                    zone.neutralhardpointfx = [];
                    for (i = 1; i < zone.visuals.size; i++) {
                        var_5daa42f92e5e9be8 = anglestoforward(zone.visuals[i].angles);
                        zone.neutralhardpointfx[zone.neutralhardpointfx.size] = spawnfx(level.var_cef90b04e416c915["<unknown string>"], zone.visuals[i].baseorigin, var_5daa42f92e5e9be8);
                        zone.neutralhardpointfx[zone.neutralhardpointfx.size - 1] setfxkilldefondelete();
                        triggerfx(zone.neutralhardpointfx[zone.neutralhardpointfx.size - 1]);
                    }
                    zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
                    zone namespace_19b4203b51d56488::setvisibleteam("<unknown string>");
                }
            }
            setdevdvar(@"hash_c000ec9a5a2f4b6c", 0);
            wait(1);
        }
    #/
}

// Namespace hq/namespace_d1f589f22374fa09
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5355
// Size: 0xa5
function function_b4c2563f73b02c80() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", getdvarint(@"hash_46a6b424af6acbc2"), 0);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", getdvarint(@"hash_86e14326e43c0115"), 0);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_b4c2563f73b02c80();
    #/
}

