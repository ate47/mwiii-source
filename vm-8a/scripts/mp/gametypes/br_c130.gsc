#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using script_930a1e7bd882c1d;
#using scripts\mp\gametypes\br.gsc;
#using script_7933519955f32c4e;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_gametype_truckwar.gsc;

#namespace br_c130;

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b4
// Size: 0x23
function init() {
    gameflaginit("br_ready_to_jump", 0);
    setdvarifuninitialized(@"hash_4ae50abb410517ab", 2);
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6df
// Size: 0x39
function spawnc130pathstruct(centeroverride, radiusoverride) {
    var_40240ae50b8189b1 = makepathparamsstruct(centeroverride, radiusoverride);
    pathstruct = makepathstruct(var_40240ae50b8189b1);
    return pathstruct;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x721
// Size: 0x125
function makepathparamsstruct(centeroverride, radiusoverride) {
    var_ca0329944922ab3f = 160;
    var_c9e0379448fc8251 = 200;
    if (isdefined(centeroverride)) {
        centerpt = centeroverride;
    } else {
        centerpt = (0, 0, 0);
    }
    if (level.mapname == "mp_torez") {
        var_ca0329944922ab3f = 165;
        var_c9e0379448fc8251 = 195;
        centerpt = (3000, -2000, 0);
    }
    twopi = 6.28318;
    randomangle = randomfloatrange(0, 360);
    endangleoffset = randomfloatrange(var_ca0329944922ab3f, var_c9e0379448fc8251);
    if (isdefined(radiusoverride)) {
        r = radiusoverride;
    } else {
        r = level.br_level.br_circleradii[0];
    }
    paramstruct = spawnstruct();
    paramstruct.r = r;
    paramstruct.randomangle = randomangle;
    paramstruct.endangleoffset = endangleoffset;
    paramstruct.centerpt = centerpt;
    return paramstruct;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84f
// Size: 0x128
function makepathstruct(var_40240ae50b8189b1) {
    r = var_40240ae50b8189b1.r;
    randomangle = var_40240ae50b8189b1.randomangle;
    endangleoffset = var_40240ae50b8189b1.endangleoffset;
    centerpt = var_40240ae50b8189b1.centerpt;
    endangle = (randomangle + endangleoffset) % 360;
    startpt = (r * cos(randomangle), r * sin(randomangle), scripts\cp_mp\parachute::getc130height()) + centerpt;
    endpt = (r * cos(endangle), r * sin(endangle), scripts\cp_mp\parachute::getc130height()) + centerpt;
    pathdir = vectornormalize(endpt - startpt);
    endpt += pathdir * r;
    startpt -= pathdir * r * 2;
    pathstruct = spawnstruct();
    pathstruct.startpt = startpt;
    pathstruct.endpt = endpt;
    pathstruct.angle = vectortoangles(pathdir);
    return pathstruct;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x980
// Size: 0xa8
function snappointtomapbounds2d(point) {
    bounds = level.br_level.br_mapbounds;
    if (point[0] < bounds[1][0]) {
        point = (bounds[1][0], point[1], point[2]);
    } else if (point[0] > bounds[0][0]) {
        point = (bounds[0][0], point[1], point[2]);
    }
    if (point[1] < bounds[1][1]) {
        point = (point[0], bounds[1][1], point[2]);
    } else if (point[1] > bounds[0][1]) {
        point = (point[0], bounds[0][1], point[2]);
    }
    return point;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa31
// Size: 0x135
function ray_trace_trigger_radius_2d(start, end, triggerradiusents) {
    points = [];
    foreach (triggerradiusent in triggerradiusents) {
        assert(triggerradiusent.classname == "trigger_radius");
        point = scripts\engine\math::function_cc2ad02dcf5030d8(start, end, triggerradiusent.origin, triggerradiusent.radius);
        points[points.size] = point;
    }
    closestpt = undefined;
    var_7b076d31304fe0a4 = 0;
    foreach (point in points) {
        distsq = distance2dsquared(start, point);
        if (!isdefined(closestpt) || distsq < var_7b076d31304fe0a4) {
            closestpt = point;
            var_7b076d31304fe0a4 = distsq;
        }
    }
    return closestpt;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6f
// Size: 0x138
function snappointtooutofboundstriggertrace(startpoint, var_c1e273ba6cef8058) {
    if (!isdefined(level.outofboundstriggers) || level.outofboundstriggers.size == 0) {
        return snappointtomapbounds2d(var_c1e273ba6cef8058);
    }
    if (!isdefined(level.outofboundstriggersplanetrace)) {
        level.outofboundstriggersplanetrace = level.outofboundstriggers;
    }
    contents = physics_createcontents(["physicscontents_trigger"]);
    trace = scripts\engine\trace::ray_trace_ents(startpoint, var_c1e273ba6cef8058, level.outofboundstriggersplanetrace, contents);
    if (trace["fraction"] < 1) {
        var_c1e273ba6cef8058 = trace["position"];
    }
    if (isdefined(level.outofboundstriggersspawned) && level.outofboundstriggersspawned.size > 0 && getdvarint(@"hash_b6f6771f7d380c01", 0) == 0) {
        var_b735ec48cd0b4308 = ray_trace_trigger_radius_2d(startpoint, var_c1e273ba6cef8058, level.outofboundstriggersspawned);
        if (isdefined(var_b735ec48cd0b4308)) {
            distsqtrace = distance2dsquared(startpoint, var_c1e273ba6cef8058);
            var_e1b832aba05bc49a = distance2dsquared(startpoint, var_b735ec48cd0b4308);
            if (var_e1b832aba05bc49a < distsqtrace) {
                var_c1e273ba6cef8058 = (var_b735ec48cd0b4308[0], var_b735ec48cd0b4308[1], var_c1e273ba6cef8058[2]);
            }
        }
    }
    return var_c1e273ba6cef8058;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb0
// Size: 0x9b
function getplanepathsaferadiusfromcenter(radiusoverride) {
    var_18404860cd4bedba = getdvarfloat(@"hash_95884eb90393fa6d", 0.7);
    var_4bc476776e118554 = (level.br_level.br_mapsize[0] / 2 + level.br_level.br_mapsize[1] / 2) / 2;
    if (isdefined(radiusoverride)) {
        var_4bc476776e118554 = radiusoverride;
    } else if (isdefined(level.var_addf1fc5251608bc)) {
        var_4bc476776e118554 = level.var_addf1fc5251608bc;
    }
    saferadius = var_18404860cd4bedba * var_4bc476776e118554;
    return saferadius;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd54
// Size: 0x8b
function function_1f389456d7c530a() {
    offset = (0, 0, 0);
    if (getdvarint(@"hash_b394d0e649406cc1", 1) == 0) {
        return offset;
    }
    if (isdefined(level.br_level.var_96bc2ccd011ba845)) {
        offset = level.br_level.var_96bc2ccd011ba845;
    }
    if (getdvar(@"hash_ab9afcc6db47793e", "") != "") {
        offset = getdvarvector(@"hash_ab9afcc6db47793e", offset);
    }
    return offset;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde8
// Size: 0x59
function iswithinplanepathsaferadius(pt) {
    centerpt = level.br_level.br_mapcenter;
    centerpt += function_1f389456d7c530a();
    saferadius = getplanepathsaferadiusfromcenter();
    dist = distance2d(centerpt, pt);
    return dist < saferadius;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4a
// Size: 0x2de
function spawnc130pathstructnew(var_1ac3dec2a5426bd4, radiusoverride, mapcenteroverride, var_92fcc390c4c0acd7) {
    centerpt = level.br_level.br_mapcenter;
    if (isdefined(var_1ac3dec2a5426bd4)) {
        centerpt = var_1ac3dec2a5426bd4;
    } else {
        centerpt += function_1f389456d7c530a();
    }
    saferadius = getplanepathsaferadiusfromcenter(radiusoverride);
    randomyaw = randomfloat(360);
    if (scripts\mp\gametypes\br_public::isBrPracticeMode()) {
        if (isdefined(level.infilplaneyaw)) {
            randomyaw = level.infilplaneyaw;
        } else {
            randomyaw = 75;
        }
    }
    offsetvec = anglestoforward((0, randomyaw, 0));
    offsetvec *= saferadius * randomfloatrange(-1, 1);
    offsetvec += (0, 0, getc130knownsafeheight());
    if (!scripts\mp\gametypes\br_gametypes::isfeaturedisabled("randomizeCircleCenter")) {
        centerpt += offsetvec;
    }
    if (!scripts\mp\gametypes\br_public::isBrPracticeMode() && !scripts\mp\gametypes\br_public::isdmzbotpracticematch()) {
        centerpt = getdvarvector(@"hash_3956f0ca6c9c5f89", centerpt);
    }
    randomangles = (0, randomfloatrange(0, 360), 0);
    if (scripts\mp\gametypes\br_gametypes::isfeaturedisabled("randomizeCircleCenter")) {
        if (isdefined(var_92fcc390c4c0acd7)) {
            offsetvec = anglestoforward((0, randomyaw, 0)) * var_92fcc390c4c0acd7;
            offsetvec += (0, 0, getc130knownsafeheight());
        }
        var_969e949840554584 = level.br_level.br_mapcenter + offsetvec;
        if (isdefined(mapcenteroverride)) {
            var_969e949840554584 = mapcenteroverride + offsetvec;
        }
        planedir = centerpt - var_969e949840554584;
        if (cointoss() && getdvarint(@"hash_4a9026a0d0f3719a", 0) == 0) {
            planedir *= -1;
        }
        planeyaw = vectortoyaw(planedir);
        randomangles = (0, planeyaw, 0);
    }
    if (scripts\mp\gametypes\br_public::isBrPracticeMode()) {
        randomangles = (0, 75, 0);
    } else {
        randomangles = (0, getdvarfloat(@"hash_7343d5620b46bbc3", randomangles[1]), 0);
    }
    circleradius = level.br_level.br_circleradii[0];
    if (isdefined(radiusoverride)) {
        circleradius = radiusoverride;
    }
    pathradius = circleradius * 2;
    if (scripts\mp\gametypes\br_gametypes::isfeatureenabled("planeUseCircleRadius")) {
        pathradius = circleradius;
    }
    c130height = scripts\cp_mp\parachute::getc130height();
    pathstruct = spawnc130pathstructnewinternal(centerpt, randomangles, c130height, pathradius);
    /#
        println("<dev string:x1c>" + pathstruct.startpt + "<dev string:x2f>" + centerpt + "<dev string:x3a>" + pathstruct.endpt);
        println("<dev string:x49>" + randomangles[1] + "<dev string:x5c>" + pathstruct.pathdir + "<dev string:x65>" + pathradius);
    #/
    return pathstruct;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1131
// Size: 0x203
function spawnc130pathstructnewinternal(centerpt, angles, planeheight, pathradius) {
    pathdir = anglestoforward(angles);
    if (!isdefined(pathradius)) {
        pathradius = level.br_level.br_circleradii[0] * 2;
        if (scripts\mp\gametypes\br_public::isBrPracticeMode()) {
            pathradius = level.br_level.br_circleradii[2] * 2;
        }
    }
    startpt = centerpt - pathdir * pathradius;
    endpt = centerpt + pathdir * pathradius;
    if (scripts\mp\gametypes\br_gametypes::isfeatureenabled("infilUsePlaneHeightOOB")) {
        startpt += (0, 0, planeheight);
        endpt += (0, 0, planeheight);
    }
    if (!scripts\mp\gametypes\br_gametypes::isfeaturedisabled("planeSnapToOOB")) {
        startpt = snappointtooutofboundstriggertrace(centerpt, startpt);
        endpt = snappointtooutofboundstriggertrace(centerpt, endpt);
    }
    startptui = startpt;
    endptui = endpt;
    if (scripts\mp\gametypes\br_gametypes::isfeaturedisabled("planeSnapToOOB")) {
        if (!ispointinbounds(startpt)) {
            startptui = snappointtooutofboundstriggertrace(centerpt, startpt);
        }
        if (!ispointinbounds(endpt)) {
            endptui = snappointtooutofboundstriggertrace(centerpt, endpt);
        }
    }
    pathdir = vectornormalize(endpt - startpt);
    var_88be2123b5a143a0 = function_130df32ea7502b9e();
    startpt -= pathdir * getc130speed() * var_88be2123b5a143a0;
    endpt += pathdir * 100000;
    if (scripts\mp\gametypes\br_public::isBrPracticeMode()) {
        startpt -= pathdir * getc130speed() * 20;
    }
    pathstruct = spawnstruct();
    pathstruct.startpt = (startpt[0], startpt[1], planeheight);
    pathstruct.endpt = (endpt[0], endpt[1], planeheight);
    pathstruct.startptui = startptui;
    pathstruct.endptui = endptui;
    pathstruct.angle = angles;
    pathstruct.pathdir = pathdir;
    pathstruct.centerpt = centerpt;
    return pathstruct;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133d
// Size: 0x7d
function function_130df32ea7502b9e() {
    var_88be2123b5a143a0 = getdvarfloat(@"hash_a7872d3e53452e4e", 10);
    if (getsubgametype() == "mini" || getsubgametype() == "mini_mgl") {
        var_88be2123b5a143a0 = 2;
    }
    if (isdefined(level.infilstruct) && isdefined(level.infilstruct.var_b2d2eec29dbaba05)) {
        var_88be2123b5a143a0 += level.infilstruct.var_b2d2eec29dbaba05;
    }
    return var_88be2123b5a143a0;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c3
// Size: 0x6c
function getc130speed() {
    if (isdefined(level.br_level) && isdefined(level.br_level.c130_speedoverride)) {
        return level.br_level.c130_speedoverride;
    }
    /#
        setdvarifuninitialized(@"hash_c25457fbe123d92f", "<dev string:x70>");
        if (getdvarint(@"hash_c25457fbe123d92f") > 0) {
            return 12000;
        }
    #/
    return 3044;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1438
// Size: 0x5
function getc130knownsafeheight() {
    return 8000;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1446
// Size: 0x69
function setc130heightoverrides(heightoverride, var_924f9394b6feb3e) {
    if (isdefined(heightoverride)) {
        level.br_level.c130_heightoverride = heightoverride;
    }
    if (isdefined(var_924f9394b6feb3e)) {
        level.br_level.c130_sealeveloverride = var_924f9394b6feb3e;
    }
    setomnvar("ui_br_altimeter_c130_height", scripts\cp_mp\parachute::getc130height());
    setomnvar("ui_br_altimeter_sea_height", scripts\cp_mp\parachute::getc130sealevel());
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b7
// Size: 0x1ab
function updatec130pathomnvars(c130path) {
    if (!isdefined(c130path)) {
        return;
    }
    if (!isdefined(c130path.startpt) || !isdefined(c130path.endpt) || !isdefined(c130path.angle)) {
        return;
    }
    if (getsubgametype() == "resurgence_mgl") {
        centerpt = (c130path.startptui + c130path.endptui) * 0.5;
        var_76d1babbc7524a83 = vectornormalize(c130path.startptui - centerpt);
        startptui = centerpt + var_76d1babbc7524a83 * level.br_level.br_circleradii[0] * 2;
        endptui = centerpt - var_76d1babbc7524a83 * level.br_level.br_circleradii[0] * 2;
        setomnvar("ui_br_c130_path_start_x", int(startptui[0]));
        setomnvar("ui_br_c130_path_start_y", int(startptui[1]));
        setomnvar("ui_br_c130_path_end_x", int(endptui[0]));
        setomnvar("ui_br_c130_path_end_y", int(endptui[1]));
        return;
    }
    setomnvar("ui_br_c130_path_start_x", int(c130path.startptui[0]));
    setomnvar("ui_br_c130_path_start_y", int(c130path.startptui[1]));
    setomnvar("ui_br_c130_path_end_x", int(c130path.endptui[0]));
    setomnvar("ui_br_c130_path_end_y", int(c130path.endptui[1]));
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166a
// Size: 0xbd
function createtestc130path(var_1ac3dec2a5426bd4, radiusoverride, mapcenteroverride, var_92fcc390c4c0acd7) {
    self notify("debug130Line");
    if (isdefined(level.br_level.br_mapcenter) && isdefined(level.br_level.br_mapsize)) {
        pathstruct = spawnc130pathstructnew(var_1ac3dec2a5426bd4, radiusoverride, mapcenteroverride, var_92fcc390c4c0acd7);
        level thread scripts\mp\gametypes\br_analytics::branalytics_planepath(pathstruct.centerpt, pathstruct.angle[1], pathstruct.startptui, pathstruct.endptui);
    } else {
        pathstruct = spawnc130pathstruct(var_1ac3dec2a5426bd4, radiusoverride);
    }
    updatec130pathomnvars(pathstruct);
    return pathstruct;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1730
// Size: 0xce
function spawnc130(planemodel, var_954a35001716e7cb, var_8281f83c750dace6, pathstruct, var_58bb50874e340160, soundalias) {
    dist = distance(pathstruct.startpt, pathstruct.endpt);
    time = dist / getc130speed();
    var_8f56f6c6c54e17d9 = 1;
    level.br_ac130 = gunship_spawn(planemodel, var_954a35001716e7cb, var_8281f83c750dace6, pathstruct.startpt, pathstruct.endpt, time, var_8f56f6c6c54e17d9, var_58bb50874e340160, soundalias);
    level.br_ac130.pathstruct = pathstruct;
    level.br_ac130 function_14df8550b1ce14be();
    return time;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1807
// Size: 0xf4
function spawnplayertoc130() {
    if (isdefined(level.infil_vignette_anim_type) && level.infil_vignette_anim_type == "script_model") {
        self unlink();
    }
    namespace_81156089ff1fe819::endprematchskydiving();
    thread playerputinc130(level.br_ac130);
    /#
        if (self isnoclip()) {
            self noclip();
        }
        if (self isufo()) {
            self ufo();
        }
    #/
    self.brneverlanded = 1;
    self.var_91a2b1303b861667 = 1;
    issolo = scripts\cp_mp\utility\game_utility::function_4fb37368ae3585bb() == 1 || isdefined(self.team) && getteamdata(self.team, "players").size == 1;
    if (istrue(self.isbrsquadleader) && !istrue(level.brgametype.var_be0c10911fec189f) && !istrue(issolo)) {
        level scripts\mp\gametypes\br_public::brleaderdialogplayer("deploy_squad_leader", self, 1, 0);
    }
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1903
// Size: 0x9b
function playerputinc130(c130) {
    self.angles = c130.angles;
    self allowcrouch(0);
    self allowprone(0);
    self allowfire(0);
    self allowmelee(0);
    thread listenjump(c130, 0);
    thread listenkick(c130, 0);
    self.br_infil_type = "c130";
    if (!getdvarint(@"hash_187e8c5233803ac8", 0)) {
        thread orbitcam(c130);
    }
    if (!scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
        self setclientomnvar("ui_hide_nameplate_strings", 1);
    }
    thread scripts\mp\gametypes\br::function_467380e90c7db5a7();
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a6
// Size: 0xe6
function orbitcam(gunship) {
    self endon("death");
    if (isdefined(level.infil_vignette_anim_type) && level.infil_vignette_anim_type == "script_model") {
        self.angles = gunship.angles;
        self playerlinkto(gunship, "");
        function_a593971d75d82113();
        function_379bb555405c16bb("br_c130::orbitCam()");
    }
    _visionsetnaked("", 0);
    self setplayerangles(gunship.angles);
    var_c7f1d28e52436ecd = undefined;
    if (namespace_973962356ce55fee::function_b4e9d46918f067bb()) {
        slotnumber = 1;
        if (isdefined(self.infilanimindex)) {
            slotnumber = self.infilanimindex;
        }
        if (slotnumber >= 5) {
            slotnumber = 1;
        }
        var_c7f1d28e52436ecd = "cam_orbit_br_ac130_player" + slotnumber;
    } else {
        var_c7f1d28e52436ecd = namespace_81156089ff1fe819::function_f18696ac7694ed9();
    }
    self cameraset(var_c7f1d28e52436ecd);
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a94
// Size: 0x22
function private gunship_sound(soundalias) {
    self endon("death");
    self waittill("start_moving");
    self playloopsound(soundalias);
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1abe
// Size: 0x255
function gunship_spawn(planemodel, var_954a35001716e7cb, var_8281f83c750dace6, startpt, endpt, time, var_8f56f6c6c54e17d9, var_58bb50874e340160, soundalias) {
    if (!isdefined(planemodel)) {
        planemodel = "veh8_mil_air_acharlie130_magma_animated";
        var_954a35001716e7cb = "veh8_mil_air_acharlie130_magma_rigid";
    }
    if (!isdefined(var_8f56f6c6c54e17d9)) {
        var_8f56f6c6c54e17d9 = 1;
    }
    gunship = spawn("script_model", startpt);
    gunship setmodel(planemodel);
    gunship forcenetfieldhighlod(1);
    gunship setcandamage(0);
    gunship.maxhealth = 100000;
    gunship.health = gunship.maxhealth;
    gunship.cleanme = 1;
    gunship.startpt = startpt;
    if (isstring(soundalias)) {
        gunship thread gunship_sound(soundalias);
    }
    gunship.dir = vectornormalize(endpt - startpt);
    gunship.angles = vectortoangles(gunship.dir);
    if (isdefined(var_954a35001716e7cb)) {
        if (!isdefined(var_8281f83c750dace6)) {
            var_8281f83c750dace6 = "";
        }
        gunship.innards = spawn("script_model", startpt);
        gunship.innards setmodel(var_954a35001716e7cb);
        gunship.innards forcenetfieldhighlod(1);
        gunship.innards.cleanme = 1;
        gunship.innards linkto(gunship, var_8281f83c750dace6, (0, 0, 0), (0, 0, 0));
    }
    gunship.playeroffsets = [(32, 30, -500), (-32, 30, -500), (0, 30, -500), (16, 30, -500), (-16, 30, -500)];
    gunship.currentplayeroffset = 0;
    if (var_8f56f6c6c54e17d9) {
        gunship thread kickwhenoutofbounds("c130");
    }
    if (isdefined(var_58bb50874e340160)) {
        gunship thread [[ var_58bb50874e340160 ]](endpt, time);
    } else {
        gunship thread gunship_handlemovement(endpt, time);
    }
    return gunship;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d1c
// Size: 0x2f
function private function_7fbc7b6e0103c3e5() {
    gunship = self;
    if (isdefined(gunship.objectiveid)) {
        scripts\mp\objidpoolmanager::returnobjectiveid(gunship.objectiveid);
    }
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d53
// Size: 0x6e
function private function_14df8550b1ce14be() {
    gunship = self;
    gunship function_7fbc7b6e0103c3e5();
    if (scripts\engine\utility::issharedfuncdefined("game", "createObjective")) {
        gunship.objectiveid = gunship [[ scripts\engine\utility::getsharedfunc("game", "createObjective") ]]("hud_icon_minimap_killstreak_gunship", undefined, undefined, 1, 1, "icon_regular");
        objective_setlabel(gunship.objectiveid, %KILLSTREAKS/AC130);
    }
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc9
// Size: 0xba
function gunship_handlemovement(movedestination, movetime) {
    level endon("game_ended");
    self endon("death");
    if (!scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
        self hide();
        if (isdefined(self.innards)) {
            self.innards hide();
        }
    }
    self waittill("start_moving");
    if (!scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
        self show();
        if (isdefined(self.innards)) {
            self.innards show();
        }
    }
    self moveto(movedestination, movetime);
    /#
        if (getdvarint(@"hash_c25457fbe123d92f")) {
            movetime -= 10;
        }
    #/
    thread killaftertime(movetime, "c130");
    thread gunship_spawnvfx();
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e8b
// Size: 0x7b
function gunship_spawnvfx() {
    level endon("game_ended");
    if (!namespace_973962356ce55fee::function_b4e9d46918f067bb()) {
        return;
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        if (scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
            wait 0.001;
        } else {
            wait 0.1;
        }
        self setscriptablepartstate("br_fx", "clouds");
        return;
    }
    cloudfx = level._effect["vfx_snatch_ac130_clouds"];
    if (!isdefined(cloudfx)) {
        return;
    }
    wait 0.1;
    playfxontag(cloudfx, self, "tag_body");
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f0e
// Size: 0xf3
function inmapbounds(pt) {
    bounds = level.br_level.br_mapbounds;
    if (isdefined(level.br_level.br_mapboundsfull)) {
        bounds = level.br_level.br_mapboundsfull;
    }
    if ((scripts\mp\gametypes\br_public::isdmzbotpracticematch() || scripts\mp\gametypes\br_public::isBrPracticeMode()) && isdefined(level.br_ac130)) {
        inmapbounds = pt[0] < bounds[1][0] && pt[0] > bounds[0][0] && pt[1] < bounds[1][1] && pt[1] > bounds[0][1];
    } else {
        inmapbounds = pt[0] < bounds[0][0] && pt[0] > bounds[1][0] && pt[1] < bounds[0][1] && pt[1] > bounds[1][1];
    }
    return inmapbounds;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200a
// Size: 0x148
function ispointinbounds(pt, checkplayerradius) {
    inmapbounds = inmapbounds(pt);
    if ((scripts\mp\gametypes\br_public::isBrPracticeMode() || scripts\mp\gametypes\br_public::isdmzbotpracticematch()) && isdefined(level.br_ac130)) {
        return inmapbounds;
    }
    if (!inmapbounds) {
        return 0;
    }
    if (iswithinplanepathsaferadius(pt)) {
        return 1;
    }
    outofbounds = scripts\mp\outofbounds::ispointinoutofbounds(pt);
    if (outofbounds) {
        return 0;
    }
    if (istrue(checkplayerradius)) {
        player_radius = 16;
        contents = physics_createcontents(["physicscontents_trigger"]);
        results = physics_spherecast(pt, pt, player_radius, contents, undefined, "physicsquery_all");
        foreach (result in results) {
            ent = result["entity"];
            if (isdefined(ent) && isdefined(ent.targetname) && ent.targetname == "OutOfBounds") {
                return 0;
            }
        }
    }
    return 1;
}

/#

    // Namespace br_c130 / scripts\mp\gametypes\br_c130
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x215b
    // Size: 0x3b
    function function_7d4cd5dc8e9151a0() {
        if (!isdefined(level.var_7d4cd5dc8e9151a0)) {
            level.var_7d4cd5dc8e9151a0 = 1;
            level thread function_5c36b2448f145721();
            return;
        }
        level notify("<dev string:x71>");
        level.var_7d4cd5dc8e9151a0 = undefined;
    }

    // Namespace br_c130 / scripts\mp\gametypes\br_c130
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x219e
    // Size: 0xc7
    function function_5c36b2448f145721() {
        level endon("<dev string:x71>");
        host = scripts\mp\gamelogic::gethostplayer();
        if (!isdefined(host)) {
            return;
        }
        while (true) {
            angles = host getplayerangles();
            dir = anglestoforward(angles);
            eye = host geteye();
            testpoint = eye + dir * 50;
            inbounds = ispointinbounds(host.origin, 1);
            color = ter_op(inbounds, (0, 1, 0), (1, 0, 0));
            sphere(testpoint, 5, color);
            waitframe();
        }
    }

#/

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x226d
// Size: 0x7f
function planewaittillcandrop() {
    assert(isdefined(self.pathstruct));
    planedir = anglestoforward(self.angles);
    while (true) {
        tostart = vectornormalize(self.pathstruct.startptui - self.origin);
        paststart = vectordot(planedir, tostart) < 0;
        if (paststart) {
            break;
        }
        waitframe();
    }
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f4
// Size: 0x443
function kickwhenoutofbounds(flighttype) {
    level endon("game_ended");
    self endon("death");
    if (!scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
        setomnvarforallclients("ui_hide_minimap", 1);
    }
    waitframe();
    planewaittillcandrop();
    var_505b3a065e348bab = scripts\mp\gametypes\br_c130::getc130knownsafeheight();
    while (!ispointinbounds((self.origin[0], self.origin[1], var_505b3a065e348bab))) {
        waitframe();
    }
    var_32d93b13c134184 = getdvarint(@"hash_3ade460504ff5346", 1);
    if (var_32d93b13c134184) {
        while (true) {
            var_fc52cb238f5b3bf = 1;
            circleradii = namespace_bbc79db4c3949a5c::function_bf15a5aa7e72aee9();
            foreach (circleradius in circleradii) {
                if (circleradius <= 0) {
                    var_fc52cb238f5b3bf = 0;
                }
            }
            if (!var_fc52cb238f5b3bf || namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(self.origin)) {
                break;
            }
            waitframe();
        }
    }
    level.br_latejoininfilready = 1;
    level.c130inbounds = 1;
    level notify("br_c130_in_bounds");
    println("<dev string:x86>");
    if (!scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
        setomnvarforallclients("ui_hide_minimap", 0);
    }
    while (true) {
        planedir = anglestoforward(self.angles);
        tocenter = vectornormalize(self.pathstruct.centerpt - self.origin);
        pasthalfway = vectordot(planedir, tocenter) < 0;
        if (pasthalfway) {
            break;
        }
        waitframe();
    }
    var_35a6a9c45130ec10 = getdvarint(@"hash_e82b8618853a182c", 3500);
    while (true) {
        planedir = anglestoforward(self.angles);
        var_54cbc103add3c81c = self.origin + planedir * var_35a6a9c45130ec10;
        var_54cbc103add3c81c = (var_54cbc103add3c81c[0], var_54cbc103add3c81c[1], var_505b3a065e348bab);
        if (!ispointinbounds(var_54cbc103add3c81c)) {
            level.br_c130spawndone = 1;
            foreach (player in level.players) {
                if (isdefined(player) && isdefined(player.br_infil_type) && player.br_infil_type == flighttype && !isdefined(player.jumptype)) {
                    player.jumptype = "outOfBounds";
                    player notify("halo_kick_c130");
                }
            }
            break;
        }
        if (var_32d93b13c134184) {
            var_fc52cb238f5b3bf = 1;
            circleradii = namespace_bbc79db4c3949a5c::function_bf15a5aa7e72aee9();
            foreach (circleradius in circleradii) {
                if (circleradius <= 0) {
                    var_fc52cb238f5b3bf = 0;
                }
            }
            if (var_fc52cb238f5b3bf && !namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(var_54cbc103add3c81c)) {
                level.br_c130spawndone = 1;
                foreach (player in level.players) {
                    if (isdefined(player) && isdefined(player.br_infil_type) && player.br_infil_type == flighttype && !isdefined(player.jumptype)) {
                        player.jumptype = "outOfBounds";
                        player notify("halo_kick_c130");
                    }
                }
                break;
            }
        }
        waitframe();
    }
    level.c130inbounds = undefined;
    level notify("br_c130_left_bounds");
    level.infilstruct.playersinc130 = 0;
    setomnvar("ui_br_players_left_in_plane", level.infilstruct.playersinc130);
    println("<dev string:xaf>");
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x273f
// Size: 0x2a5
function killaftertime(time, flighttype) {
    level endon("game_ended");
    self endon("death");
    wait time;
    if (isdefined(self.players)) {
        foreach (player in self.players) {
            if (isdefined(player) && isdefined(player.br_infil_type) && player.br_infil_type == flighttype && !isdefined(player.jumptype)) {
                player.jumptype = "outOfBounds";
                player notify("halo_kick_c130");
            }
        }
    } else {
        foreach (player in level.players) {
            if (isdefined(player) && isdefined(player.br_infil_type) && player.br_infil_type == flighttype && !isdefined(player.jumptype)) {
                player.jumptype = "outOfBounds";
                player notify("halo_kick_c130");
            }
        }
    }
    function_7fbc7b6e0103c3e5();
    self stoploopsound();
    if (isdefined(self.animstruct.var_ab8494260b910b51)) {
        self [[ self.animstruct.var_ab8494260b910b51 ]]();
    }
    wait 0.1;
    if (isdefined(self.animstruct)) {
        var_b76a71dfbb3cf37d = 1;
        while (var_b76a71dfbb3cf37d) {
            var_b76a71dfbb3cf37d = 0;
            foreach (player in level.players) {
                if (isdefined(player.br_infil_type)) {
                    var_b76a71dfbb3cf37d = 1;
                    break;
                }
            }
            if (var_b76a71dfbb3cf37d) {
                wait 0.5;
            }
        }
        if (isdefined(self.animstruct.cleanupfunc)) {
            self.animstruct thread [[ self.animstruct.cleanupfunc ]]();
        } else {
            level thread scripts\mp\gametypes\br_public::cleanac130struct(self.animstruct);
        }
        return;
    }
    if (isdefined(self.innards)) {
        self.innards delete();
    }
    self delete();
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29ec
// Size: 0x29
function calctrailpoint() {
    droppoint = self.origin - anglestoforward(self.angles) * 150;
    return droppoint;
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1e
// Size: 0x74
function listenkick(c130, forcechute) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("cancel_c130");
    self endon("br_jump");
    viewanglesoverride = self waittill("halo_kick_c130");
    if (!isdefined(viewanglesoverride)) {
        viewanglesoverride = (0, c130.angles[1] + 180, 0);
    }
    self.brkickedfromplane = 1;
    thread leaveplane(c130, forcechute, viewanglesoverride, 0);
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a9a
// Size: 0x39f
function listenjump(c130, var_1b89121ef11344d5) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("cancel_c130");
    self endon("br_jump");
    var_f9805aad354a150e = undefined;
    self.redeployenabled = 0;
    var_ad4f519dc0dfd573 = getdvarint(@"hash_5c93dcd7535822e6", 0);
    c130 planewaittillcandrop();
    while (true) {
        result = waittill_any_return_4("halo_jump_c130", "halo_jump_solo_c130", "halo_jump_parachute_c130", "halo_jump_parachute_solo_c130");
        if (!isdefined(result)) {
            result = "halo_jump_c130";
        }
        /#
            var_ad4f519dc0dfd573 = getdvarint(@"hash_5c93dcd7535822e6", 0);
        #/
        teammates = getteamdata(self.team, "players");
        if (!var_ad4f519dc0dfd573) {
            var_f9805aad354a150e = c130 calctrailpoint();
            if (ispointinbounds(var_f9805aad354a150e)) {
                self.jumptype = "solo";
                self notify("halo_kick_c130");
                thread_on_notify("infil_jump_done", &scripts\mp\gametypes\br_public::updatebrscoreboardstat, "jumpMasterState", 0);
                break;
            } else {
                self iprintlnbold(%MP_BR_INGAME/NOT_PLAYABLE);
            }
            continue;
        }
        squadleader = scripts\mp\gametypes\br_public::isplayerbrsquadleader() || isdefined(self.var_3f78c6a0862f9e25) && self.var_3f78c6a0862f9e25 == 0;
        if (!squadleader && teammates.size > 1) {
            if (result == "halo_jump_solo_c130") {
                var_f9805aad354a150e = c130 calctrailpoint();
                if (ispointinbounds(var_f9805aad354a150e)) {
                    self.jumptype = "solo";
                    self notify("halo_kick_c130");
                    thread_on_notify("infil_jump_done", &scripts\mp\gametypes\br_public::updatebrscoreboardstat, "jumpMasterState", 0);
                    break;
                } else {
                    self iprintlnbold(%MP_BR_INGAME/NOT_PLAYABLE);
                }
            }
            continue;
        }
        var_f9805aad354a150e = c130 calctrailpoint();
        if (ispointinbounds(var_f9805aad354a150e)) {
            if (squadleader) {
                self.jumptype = "leader";
                usingsquads = isdefined(level.squaddata);
                if (usingsquads) {
                    squad = level.squaddata[self.team][self.sessionsquadid];
                    teammates = squad.players;
                }
                foreach (player in teammates) {
                    if (player != self && isdefined(player.br_infil_type) && !isdefined(player.jumptype)) {
                        player.jumptype = "follower";
                        player notify("halo_kick_c130", self getplayerangles());
                    }
                    player playlocalsound("tmp_br_infil_ac130_jumpmaster_go");
                }
                if (result != "halo_jump_solo_c130" && getdvarint(@"hash_d649575e14a3dc9f", 0)) {
                    thread holdteammatestosquadleader(teammates);
                } else {
                    foreach (player in teammates) {
                        if (isdefined(player.br_infil_type)) {
                            setteammateomnvarsforplayer(player, teammates, 0);
                        }
                    }
                }
            }
            break;
        } else {
            self iprintlnbold(%MP_BR_INGAME/NOT_PLAYABLE);
        }
        var_f9805aad354a150e = c130 calctrailpoint();
        waitframe();
    }
    thread leaveplane(c130, var_1b89121ef11344d5, self getplayerangles(), 0);
    println("<dev string:xdc>");
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e41
// Size: 0x245
function leaveplane(c130, forcechute, viewanglesoverride, inheritvelocity) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("cancel_c130");
    setdvarifuninitialized(@"hash_8bbef9dfe5efa122", 1);
    assert(isdefined(self.jumptype));
    self notify("br_jump");
    self allowcrouch(1);
    self allowprone(1);
    self allowfire(1);
    self allowmelee(1);
    self.plotarmor = undefined;
    self.c130 = undefined;
    scripts\mp\gametypes\br_public::updatebrscoreboardstat("isInInfilPlane", 0);
    if (isdefined(level.infilstruct) && isdefined(level.infilstruct.playersinc130) && level.infilstruct.playersinc130 > 0) {
        level.infilstruct.playersinc130--;
    }
    if (getdvarint(@"hash_57377f405b99ecd2", 0) && isdefined(level.infilstruct.var_129d4a6c887fcfa5) && level.infilstruct.var_129d4a6c887fcfa5 > 0) {
        level.infilstruct.var_129d4a6c887fcfa5--;
    }
    self notifyonplayercommandremove("halo_jump_c130", "+gostand");
    self notifyonplayercommandremove("halo_jump_solo_c130", "+gostand");
    if (!isbot(self)) {
        self notifyonplayercommandremove("halo_jump_parachute_c130", "+open_parachute");
        self notifyonplayercommandremove("halo_jump_parachute_solo_c130", "+open_parachute");
    }
    self notifyonplayercommandremove("abandon_fireteam_leader", "+frag");
    self notifyonplayercommandremove("br_pass_squad_leader", "+usereload");
    self notifyonplayercommandremove("br_pass_squad_leader", "+activate");
    self waittill("infil_jump_done");
    self cameradefault();
    self.br_infil_type = undefined;
    thread parachute(c130, forcechute, viewanglesoverride, inheritvelocity);
    if (getsubgametype() == "truckwar") {
        scripts\mp\gametypes\br_gametype_truckwar::getspawnpoint(1);
        self setorigin(self.redeployspawn.origin, 1);
        self setplayerangles(self.redeployspawn.angles);
    }
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308e
// Size: 0x22f
function holdteammatestosquadleader(teammates) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    thread watchforsquadleaddisconnect(teammates);
    squadleader = self;
    wait 0.2;
    spots = [(-250, 0, 0), (-150, -150, 0), (-150, 150, 0)];
    num = 0;
    foreach (player in teammates) {
        if (!isdefined(player) || !isalive(player)) {
            continue;
        }
        if (player != squadleader) {
            if (isdefined(player.jumptype) && player.jumptype != "solo") {
                player thread pushplayertoplayeroffset(squadleader, spots[num]);
                num++;
                continue;
            }
            setteammateomnvarsforplayer(player, teammates, 0);
        }
    }
    deployheight = 2700;
    offground = 999999999;
    while (!self usebuttonpressed() && offground > deployheight) {
        gpos = utility::groundpos(squadleader.origin);
        offground = squadleader.origin[2] - gpos[2];
        if (squadleader isparachuting()) {
            break;
        }
        waitframe();
    }
    foreach (teammate in teammates) {
        if (!isdefined(teammate) || !isalive(teammate)) {
            continue;
        }
        if (teammate != self && istrue(teammate.beingpushed)) {
            teammate notify("stop_push");
            teammate.beingpushed = undefined;
        }
        setteammateomnvarsforplayer(teammate, teammates, 0);
    }
    self notify("hold_teammates_complete");
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32c5
// Size: 0xaa
function watchforsquadleaddisconnect(teammates) {
    level endon("game_ended");
    self endon("hold_teammates_complete");
    waittill_any_2("death", "disconnect");
    foreach (teammate in teammates) {
        if (!isdefined(teammate)) {
            continue;
        }
        if (teammate != self && istrue(teammate.beingpushed)) {
            teammate notify("stop_push");
            teammate.beingpushed = undefined;
        }
        setteammateomnvarsforplayer(teammate, teammates, 0);
    }
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3377
// Size: 0x44
function setteammateomnvarsforplayer(player, teamplayers, defaultvalue) {
    attachedvalue = ter_op(player scripts\mp\gametypes\br_public::isplayerbrsquadleader(), 2, defaultvalue);
    player scripts\mp\gametypes\br_public::updatebrscoreboardstat("jumpMasterState", attachedvalue);
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33c3
// Size: 0x48
function playerparachutedetachresetomnvars() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stop_push");
    self waittill("skydive_deployparachute");
    teammates = getteamdata(self.team, "players");
    setteammateomnvarsforplayer(self, teammates, 0);
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3413
// Size: 0x15d
function pushplayertoplayeroffset(squadleader, offset) {
    level endon("game_ended");
    self.beingpushed = 1;
    linkedplayer = self;
    linkedplayer endon("death_or_disconnect");
    linkedplayer endon("stop_push");
    linkedplayer thread playerparachutedetachresetomnvars();
    offsetlength = length(offset);
    while (!linkedplayer isonground() && !linkedplayer usebuttonpressed() && isdefined(squadleader) && !linkedplayer isparachuting()) {
        angle = squadleader getplayerangles();
        newoffset = rotatepointaroundvector((0, 0, 1), offset, angle[1]);
        forcevector = squadleader.origin + newoffset - linkedplayer.origin;
        dist = length(forcevector);
        if (dist > offsetlength) {
            var_e9bb054c142820bf = linkedplayer getvelocity();
            linkedplayer setvelocity(forcevector + var_e9bb054c142820bf * 0.9);
        }
        waitframe();
    }
    linkedplayer notify("stop_push");
    linkedplayer.beingpushed = undefined;
    teammates = getteamdata(linkedplayer.team, "players");
    setteammateomnvarsforplayer(linkedplayer, teammates, 0);
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3578
// Size: 0x115
function parachute(c130, var_1b89121ef11344d5, var_e7edb50a3e562402, inheritvelocity) {
    self setclientomnvar("ui_br_infiled", 1);
    self setclientomnvar("ui_hide_nameplate_strings", 0);
    self unlink();
    if (isdefined(self.br_orbitcam)) {
        self.br_orbitcam delete();
    }
    thread infilfreefallparachuteaudio(c130);
    waitframe();
    function_6fb380927695ee76(1);
    if (isdefined(var_e7edb50a3e562402)) {
        self setplayerangles(var_e7edb50a3e562402);
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        self.br_isplayerbeforeinitialinfildeploy = undefined;
        scripts\mp\gametypes\br_analytics::branalytics_deploytriggered(self);
    }
    velocity = (0, 0, 0);
    if (inheritvelocity) {
        velocity = anglestoforward(c130.angles) * getc130speed();
    }
    self.ignorefalldamagetime = gettime() + 5000;
    self skydive_setdeploymentstatus(0);
    var_9aa9310d89be4b46 = getdvarfloat(@"hash_4ae50abb410517ab", 2);
    thread scripts\cp_mp\parachute::startfreefall(var_9aa9310d89be4b46, var_1b89121ef11344d5, undefined, velocity);
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3695
// Size: 0xd2
function infilfreefallparachuteaudio(c130) {
    self endon("disconnect");
    player = self;
    if (isdefined(c130)) {
        flyby_soundalias = "veh_br_c17_flyby";
        if (isdefined(c130.model) && issubstr(c130.model, "c130")) {
            flyby_soundalias = "br_ac130_flyby";
        }
        c130 playsoundtoplayer(flyby_soundalias, player, c130);
    }
    player setsoundsubmix("mp_br_infil_music", 0);
    br_plane_jump = function_17ee301cf0b5ba85("br_plane_jump");
    player setplayermusicstate(br_plane_jump);
    player.jump_music = 1;
    wait 1;
    player clearclienttriggeraudiozone(3);
    wait 5;
    player clearsoundsubmix("mp_br_infil_music", 15);
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x376f
// Size: 0x3a
function setplayervarinrespawnc130(value) {
    if (isdefined(self.inrespawnc130) && self.inrespawnc130 == value) {
        return;
    }
    self.inrespawnc130 = value;
    level notify("update_circle_hide");
}

// Namespace br_c130 / scripts\mp\gametypes\br_c130
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37b1
// Size: 0xe4
function waittoplayinfildialog() {
    level endon("game_ended");
    assert(isdefined(level.br_ac130));
    level.br_ac130 endon("death");
    level.br_ac130 planewaittillcandrop();
    while (true) {
        var_f9805aad354a150e = level.br_ac130 calctrailpoint();
        if (ispointinbounds(var_f9805aad354a150e)) {
            foreach (player in level.players) {
                if (isplayer(player)) {
                    player playlocalsound("evt_br_infil_jump_buzzer");
                }
            }
            wait 1;
            gameflagset("br_ready_to_jump");
            scripts\mp\gametypes\br_analytics::branalytics_deployallowed();
            return;
        }
        waitframe();
    }
}

/#

    // Namespace br_c130 / scripts\mp\gametypes\br_c130
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x389d
    // Size: 0x18e
    function function_6fd27619248c2584() {
        host = scripts\mp\gamelogic::gethostplayer();
        if (!isdefined(level.var_a466e30a5f16f8ad)) {
            if (isdefined(host)) {
                host setclientomnvar("<dev string:xfd>", 0);
            }
            level.var_a466e30a5f16f8ad = 1;
            level endon("<dev string:x10b>");
        } else {
            if (isdefined(host)) {
                host setclientomnvar("<dev string:xfd>", 1);
            }
            level.var_a466e30a5f16f8ad = undefined;
            level notify("<dev string:x10b>");
            return;
        }
        while (true) {
            host = scripts\mp\gamelogic::gethostplayer();
            if (isdefined(host)) {
                pathradius = level.br_level.br_circleradii[0] * 2;
                c130height = scripts\cp_mp\parachute::getc130height();
                pathstruct = spawnc130pathstructnewinternal(host.origin, host.angles, c130height, pathradius);
                host updatec130pathomnvars(pathstruct);
                var_35a6a9c45130ec10 = 600;
                dir = anglestoforward(host.angles);
                forwardorg = host.origin + dir * getdvarint(@"hash_e82b8618853a182c", 3500);
                inbounds = scripts\mp\gametypes\br_c130::ispointinbounds(forwardorg);
                color = (0, 1, 0);
                if (!inbounds) {
                    color = (1, 0, 0);
                }
                sphere(forwardorg, 10, color);
            }
            waitframe();
        }
    }

    // Namespace br_c130 / scripts\mp\gametypes\br_c130
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3a33
    // Size: 0xe2
    function function_c6f09ac70af3c7cb(host) {
        if (istrue(level.var_c6f09ac70af3c7cb)) {
            if (isdefined(level.var_6e7c447f81c7fe8)) {
                level.var_6e7c447f81c7fe8 delete();
            }
            level.var_c6f09ac70af3c7cb = undefined;
            level notify("<dev string:x11f>");
            return;
        }
        level endon("<dev string:x11f>");
        level.var_c6f09ac70af3c7cb = 1;
        centerpt = level.br_level.br_mapcenter + (0, 0, scripts\cp_mp\parachute::getc130height());
        centerpt += function_1f389456d7c530a();
        saferadius = getplanepathsaferadiusfromcenter();
        level.var_6e7c447f81c7fe8 = function_dc11c1caffe56e16("<dev string:x135>", centerpt[0], centerpt[1], saferadius, host);
        while (true) {
            scripts\engine\utility::draw_circle(centerpt, saferadius, (0, 1, 0), 1, 0, 1);
            waitframe();
        }
    }

    // Namespace br_c130 / scripts\mp\gametypes\br_c130
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3b1d
    // Size: 0x1c0
    function function_22c604d143e3eb87(num) {
        level notify("<dev string:x140>");
        level endon("<dev string:x140>");
        host = scripts\mp\gamelogic::gethostplayer();
        if (!isdefined(host)) {
            return;
        }
        if (!istrue(level.var_c6f09ac70af3c7cb)) {
            thread function_c6f09ac70af3c7cb(host);
        }
        if (!isdefined(num)) {
            num = 1000;
        } else {
            num = int(num);
        }
        host setclientomnvar("<dev string:xfd>", 1);
        smallestdist = undefined;
        chosenpath = undefined;
        for (i = 0; i < num; i++) {
            originoverride = undefined;
            radiusoverride = undefined;
            if (scripts\mp\gametypes\br_gametypes::isfeaturedisabled("<dev string:x156>")) {
                originoverride = (level.br_level.br_circlecenters[1][0], level.br_level.br_circlecenters[1][1], 0);
                radiusoverride = level.br_level.br_circleradii[1];
            }
            pathstruct = spawnc130pathstructnew(originoverride, radiusoverride);
            distsq = distance2d(pathstruct.startptui, pathstruct.endptui);
            if (!isdefined(smallestdist) || distsq < smallestdist) {
                chosenpath = pathstruct;
                smallestdist = distsq;
            }
            if (i % 100 == 0) {
                host setclientomnvar("<dev string:xfd>", 0);
                host updatec130pathomnvars(chosenpath);
                waitframe();
            }
        }
        host setclientomnvar("<dev string:xfd>", 0);
        host updatec130pathomnvars(chosenpath);
        host iprintlnbold("<dev string:x16c>");
        level.infilstruct.c130pathstruct = chosenpath;
    }

#/