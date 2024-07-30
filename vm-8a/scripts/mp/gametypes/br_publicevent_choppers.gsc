#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_functional_poi.gsc;
#using scripts\mp\gametypes\br_lootchopper.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\outofbounds.gsc;

#namespace br_publicevent_choppers;

// Namespace br_publicevent_choppers / scripts\mp\gametypes\br_publicevent_choppers
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x309
// Size: 0x13
function autoexec main() {
    scripts\mp\gametypes\br_publicevents::function_dbc8f6cb3760cd82("choppers", &init);
}

// Namespace br_publicevent_choppers / scripts\mp\gametypes\br_publicevent_choppers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x324
// Size: 0x146
function init(config) {
    eventinfo = spawnstruct();
    eventinfo.validatefunc = &validatefunc;
    eventinfo.weight = config.weight;
    eventinfo.waitfunc = &waitfunc;
    eventinfo.activatefunc = &activatefunc;
    eventinfo.postinitfunc = &postinitfunc;
    eventinfo.var_d72a1842c5b57d1d = config.maxtimes;
    eventinfo.circleeventweights = scripts\mp\gametypes\br_publicevents::function_8fc51a5af06412cf(config.circleweights);
    eventinfo.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("choppers");
    var_92294971f87d4169 = ter_op(getsubgametype() == "plunder", 180, 0);
    lifetime = getdvarint(@"hash_98bd89274e7e4312", var_92294971f87d4169);
    eventinfo.helilifetime = lifetime;
    registersharedfunc("br_lootchopper", "lootChopper_onCrateUse", &oncrateuse);
    scripts\mp\gametypes\br_publicevents::function_5b7d8ca93f8705f1(eventinfo, "choppers");
    scripts\mp\gametypes\br_publicevents::registerpublicevent(1, eventinfo);
    scripts\mp\gametypes\br_circle::function_eca79fa0f341ee08(8, &dangercircletick);
}

// Namespace br_publicevent_choppers / scripts\mp\gametypes\br_publicevent_choppers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x472
// Size: 0x15
function postinitfunc() {
    game["dialog"]["public_events_choppers_start"] = "chpp_grav_bmev";
}

// Namespace br_publicevent_choppers / scripts\mp\gametypes\br_publicevent_choppers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48f
// Size: 0x4
function validatefunc() {
    return true;
}

// Namespace br_publicevent_choppers / scripts\mp\gametypes\br_publicevent_choppers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49c
// Size: 0x23
function waitfunc() {
    level endon("game_ended");
    level endon("cancel_public_event");
    eventstarttime = calculateeventstarttime();
    wait eventstarttime;
}

// Namespace br_publicevent_choppers / scripts\mp\gametypes\br_publicevent_choppers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c7
// Size: 0xc7
function activatefunc() {
    level endon("game_ended");
    numchoppers = getdvarint(@"hash_352a2ebca39850c0", 6);
    showsplashtoall("br_plunder_pe_attack_choppers_active", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
    scripts\mp\gametypes\br_public::brleaderdialog("public_events_choppers_start");
    setomnvar("ui_publicevent_timer_type", 12);
    eventduration = self.helilifetime;
    eventendtime = gettime() + eventduration * 1000 + 25000;
    setomnvar("ui_publicevent_timer", eventendtime);
    setomnvar("ui_minimap_pulse", 1);
    thread spawnchoppers(numchoppers);
    mintime = 10;
    waituntilallchoppersaredead(mintime, eventendtime);
    setomnvar("ui_publicevent_timer_type", 0);
}

// Namespace br_publicevent_choppers / scripts\mp\gametypes\br_publicevent_choppers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x596
// Size: 0x51
function calculateeventstarttime() {
    minstarttime = getdvarfloat(@"hash_1eff74e2cf4c0351", 555);
    maxstarttime = getdvarfloat(@"hash_1f2286e2cf72729f", 765);
    if (maxstarttime > minstarttime) {
        return randomfloatrange(minstarttime, maxstarttime);
    }
    return minstarttime;
}

// Namespace br_publicevent_choppers / scripts\mp\gametypes\br_publicevent_choppers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ef
// Size: 0x89
function waituntilallchoppersaredead(mintime, eventendtime) {
    level endon("game_ended");
    if (isdefined(mintime)) {
        wait mintime;
    }
    timeron = isdefined(eventendtime);
    while (true) {
        choppersremaining = level.loot_choppers;
        if (!isdefined(choppersremaining)) {
            break;
        }
        choppersremaining = array_removeundefined(choppersremaining);
        if (choppersremaining.size == 0) {
            break;
        }
        if (timeron && gettime() > eventendtime) {
            setomnvar("ui_publicevent_timer_type", 0);
            timeron = 0;
        }
        wait 1;
    }
}

// Namespace br_publicevent_choppers / scripts\mp\gametypes\br_publicevent_choppers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x680
// Size: 0x2da
function spawnchoppers(numchoppers) {
    level endon("game_ended");
    circlecenter = undefined;
    circleradius = undefined;
    if (isdefined(level.br_circle) && isdefined(level.br_circle.dangercircleent)) {
        circlecenter = scripts\mp\gametypes\br_circle::getdangercircleorigin();
        circleradius = scripts\mp\gametypes\br_circle::getdangercircleradius();
    } else {
        level.adjusteventdistributionpadding = 35;
        level.pushdistributiontowardoppositecorner = 1;
        level.buystationsusepaddingdistribution = 0;
        level thread scripts\mp\gametypes\br_functional_poi::setupmapquadrantcornersandgrid();
    }
    scripts\mp\gametypes\br_lootchopper::init();
    if (!isdefined(level.pe_chopper_zones)) {
        circleinfo = scripts\mp\gametypes\br_lootchopper::lootchopper_initcircleinfo(circlecenter, circleradius);
        scripts\mp\gametypes\br_lootchopper::lootchopper_initspawninfo(circleinfo);
    }
    var_35039a9883ab69d2 = getdvarint(@"hash_648fb12ceba1403", 8000);
    if (level.mapname == "mp_br_mechanics") {
        var_35039a9883ab69d2 = 1000;
    }
    for (i = 0; i < numchoppers; i++) {
        patrolzone = undefined;
        if (isdefined(level.pe_chopper_zones)) {
            assert(i < level.pe_chopper_zones.size);
            patrolzone = level.pe_chopper_zones[i];
        } else {
            quadid = i % 4 + 1;
            patrolzone = scripts\mp\gametypes\br_lootchopper::lootchopper_findunoccupiedpatrolzone(level.loot_chopper_spawns["quad_" + quadid], var_35039a9883ab69d2);
        }
        newChopper = scripts\mp\gametypes\br_lootchopper::lootchopper_spawn(patrolzone, ter_op(istrue(level.var_a83a4e71446bfef7), "veh9_mil_air_heli_hind_nophysics_br", "veh_chopper_support_pe_mp"));
        if (isdefined(newChopper)) {
            newChopper.lootfunc = &dropcrate;
            newChopper.flaresreservecount = getdvarint(@"hash_f572acb2a1f29288", 0);
            newChopper.health = getdvarint(@"hash_51cd58c60b7def3b", 3000);
            newChopper.maxhealth = getdvarint(@"hash_51cd58c60b7def3b", 3000);
            if (self.helilifetime) {
                newChopper.lifetime = self.helilifetime;
            }
            scripts\mp\objidpoolmanager::update_objective_icon(newChopper.objectiveiconid, "hud_icon_minimap_vehicle_heli_blima");
            scripts\mp\objidpoolmanager::function_2946e9eb07acb3f1(newChopper.objectiveiconid, %VEHICLES/LOOT_CHOPPER);
            scripts\mp\objidpoolmanager::update_objective_setbackground(newChopper.objectiveiconid, 11);
            newChopper.scriptedobjid = newChopper.objectiveiconid;
            newChopper function_1cd1ee312fd03bb4(1);
            newChopper setscriptablepartstate("objective", "hidden");
        }
        wait 1;
    }
    var_bcc3bc0329135935 = getdvarfloat(@"hash_9ef34944baaba114", 10);
    level.br_pe_chopper_damage_time = gettime() + int(var_bcc3bc0329135935 * 1000);
}

// Namespace br_publicevent_choppers / scripts\mp\gametypes\br_publicevent_choppers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x962
// Size: 0x97
function dropcrate() {
    droplocation = scripts\mp\gametypes\br_lootchopper::lootchopper_finddroplocation(self.origin + (0, 0, 500));
    if (isdefined(droplocation)) {
        plundercrate = scripts\cp_mp\killstreaks\airdrop::dropbrlootchoppercrateforpublicevent(self.origin, droplocation);
        triggerobject = scripts\cp_mp\killstreaks\airdrop::gettriggerobject(plundercrate);
        triggerobject.usetimeoverride = 1;
        if (!isdefined(level.br_pe_chopper_crates)) {
            level.br_pe_chopper_crates = [];
        }
        level.br_pe_chopper_crates[level.br_pe_chopper_crates.size] = plundercrate;
    }
}

// Namespace br_publicevent_choppers / scripts\mp\gametypes\br_publicevent_choppers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa01
// Size: 0x124
function oncrateuse(player) {
    self.itemsdropped = 0;
    if (!isdefined(level.br_pe_chopper_crate_index)) {
        level.br_pe_chopper_crate_index = 0;
    } else {
        level.br_pe_chopper_crate_index = (level.br_pe_chopper_crate_index + 1) % 10;
    }
    items = getscriptcachecontents("pe_chopper_crate", level.br_pe_chopper_crate_index);
    /#
        if (isdefined(items)) {
            items = scripts\mp\gametypes\br_lootcache::function_6975415e57cd5a29(items, player);
        }
    #/
    if (isdefined(items) && player scripts\mp\utility\perk::_hasperk("specialty_br_extra_killstreak_chance")) {
        items = scripts\mp\gametypes\br_lootcache::lootcontentsadjustkillchain(items, player);
    }
    if (isdefined(items)) {
        pickupents = scripts\mp\gametypes\br_lootcache::lootcachespawncontents(items, 0, player);
    }
    if (!isdefined(player.lootcachesopened)) {
        player.lootcachesopened = 1;
    } else {
        player.lootcachesopened++;
    }
    if (scripts\mp\utility\game::getsubgametype() == "risk" || scripts\mp\utility\game::getsubgametype() == "plunder") {
        player scripts\mp\gametypes\br_public::updatebrscoreboardstat("lootCachesOpened", player.lootcachesopened);
    }
    player thread scripts\mp\utility\points::doScoreEvent(#"hash_70e5de61cfaa916b");
}

// Namespace br_publicevent_choppers / scripts\mp\gametypes\br_publicevent_choppers
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2d
// Size: 0x22c
function dangercircletick(var_819edacdacb810e4, dangercircleradius, thresholdradius) {
    if (!isdefined(level.br_pe_chopper_damage_time) || gettime() < level.br_pe_chopper_damage_time) {
        return;
    }
    damageamount = getdvarfloat(@"hash_a8e8e154baf8b969", 500);
    heliradius = 240;
    helis = level.loot_choppers;
    if (isdefined(helis)) {
        helis = array_removeundefined(helis);
        foreach (heli in helis) {
            var_13d5b2ac0e7c768b = 0;
            vehicleorigin = heli.origin;
            var_24135b85b8e536b8 = distance2d(var_819edacdacb810e4, vehicleorigin);
            if (var_24135b85b8e536b8 + heliradius > dangercircleradius) {
                var_13d5b2ac0e7c768b = 1;
            }
            if (var_13d5b2ac0e7c768b) {
                oldhealth = heli.health;
                maxhealth = heli.maxhealth;
                heli dodamage(damageamount, vehicleorigin, undefined, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
            }
        }
    }
    thresholddistance = getdvarfloat(@"hash_d6d1181cd67d957d", 1000);
    crates = level.br_pe_chopper_crates;
    if (isdefined(crates)) {
        crates = array_removeundefined(crates);
        foreach (crate in crates) {
            cratedistancesq = distance2dsquared(crate.origin, var_819edacdacb810e4);
            adjustedcircleradius = max(0, dangercircleradius + thresholddistance);
            if (cratedistancesq > adjustedcircleradius * adjustedcircleradius) {
                crate thread scripts\cp_mp\killstreaks\airdrop::destroycrate();
            }
        }
    }
}

// Namespace br_publicevent_choppers / scripts\mp\gametypes\br_publicevent_choppers
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd61
// Size: 0x208
function calculatehelispawndata(numchoppers) {
    level endon("game_ended");
    if (!isdefined(level.br_circle) || !isdefined(level.br_circle.dangercircleent)) {
        return;
    }
    circlecenter = scripts\mp\gametypes\br_circle::getdangercircleorigin();
    circleradius = scripts\mp\gametypes\br_circle::getdangercircleradius();
    minradiuspct = 0.3;
    maxradiuspct = 0.8;
    minrange = circleradius * minradiuspct;
    maxrange = circleradius * maxradiuspct;
    var_57ad0dc40b2fdda = findminmaxangleovertime(circlecenter, minrange, maxrange);
    maxyaw = var_57ad0dc40b2fdda[1];
    minyaw = var_57ad0dc40b2fdda[0];
    if (minyaw == maxyaw) {
        return;
    }
    if (minyaw != 0 || maxyaw != 360) {
        minyaw += 20;
        maxyaw -= 20;
        if (maxyaw <= minyaw) {
            return;
        }
    } else {
        randyaw = randomfloatrange(0, 360);
        minyaw += randyaw;
        maxyaw += randyaw;
    }
    angleincrement = (maxyaw - minyaw) / max(1, numchoppers - 1);
    level.pe_chopper_zones = [];
    for (chopperindex = 0; chopperindex < numchoppers; chopperindex++) {
        chopperyaw = minyaw + angleincrement * chopperindex;
        choppervec = anglestoforward((0, chopperyaw, 0));
        chopperrange = randomfloatrange(minrange, maxrange);
        chopperorigin = circlecenter + choppervec * chopperrange;
        if (isnavmeshloaded()) {
            chopperorigin = getclosestpointonnavmesh(chopperorigin);
        }
        newzone = spawnstruct();
        newzone.origin = chopperorigin;
        level.pe_chopper_zones[chopperindex] = newzone;
    }
}

// Namespace br_publicevent_choppers / scripts\mp\gametypes\br_publicevent_choppers
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf71
// Size: 0x2d2
function findminmaxangleovertime(circlecenter, minrange, maxrange) {
    level endon("game_ended");
    basevec = level.mapcenter - circlecenter;
    basevec = (basevec[0], basevec[1], 0);
    basevec = vectornormalize(basevec);
    baseyaw = vectortoyaw(basevec);
    var_1dedb65eb8b4cfc6 = circlecenter + basevec * minrange;
    var_1e10c85eb8db3f14 = circlecenter + basevec * maxrange;
    var_68037475d59abaa0 = !scripts\mp\outofbounds::ispointinoutofbounds(var_1dedb65eb8b4cfc6) && !scripts\mp\outofbounds::ispointinoutofbounds(var_1e10c85eb8db3f14);
    if (!var_68037475d59abaa0) {
        return [0, 0];
    }
    leftincrement = 45;
    rightincrement = 45;
    var_da21db3f5d1fcf57 = baseyaw;
    var_e7b8fe64cd569f72 = baseyaw + leftincrement;
    var_ba526b477f9c97f6 = baseyaw;
    var_3c634c6ad0bcecfb = baseyaw - rightincrement;
    iterations = 0;
    var_b824bc967d25c7ba = 180 / int(leftincrement);
    assert(var_b824bc967d25c7ba == 4);
    hitboundary = 0;
    minincrement = 1;
    while (true) {
        if (leftincrement >= minincrement) {
            leftvec = anglestoforward((0, var_e7b8fe64cd569f72, 0));
            leftpointmin = circlecenter + leftvec * minrange;
            leftpointmax = circlecenter + leftvec * maxrange;
            var_bfdd77649ea019e0 = !scripts\mp\outofbounds::ispointinoutofbounds(leftpointmin) && !scripts\mp\outofbounds::ispointinoutofbounds(leftpointmax);
            if (var_bfdd77649ea019e0) {
                var_da21db3f5d1fcf57 = var_e7b8fe64cd569f72;
                var_e7b8fe64cd569f72 = var_da21db3f5d1fcf57 + leftincrement;
            } else {
                hitboundary = 1;
                leftincrement *= 0.5;
                var_e7b8fe64cd569f72 = var_da21db3f5d1fcf57 + leftincrement;
            }
        }
        if (rightincrement >= minincrement) {
            rightvec = anglestoforward((0, var_3c634c6ad0bcecfb, 0));
            rightpointmin = circlecenter + rightvec * minrange;
            rightpointmax = circlecenter + rightvec * maxrange;
            var_d132bf554650b07f = !scripts\mp\outofbounds::ispointinoutofbounds(rightpointmin) && !scripts\mp\outofbounds::ispointinoutofbounds(rightpointmax);
            if (var_d132bf554650b07f) {
                var_ba526b477f9c97f6 = var_3c634c6ad0bcecfb;
                var_3c634c6ad0bcecfb = var_ba526b477f9c97f6 - rightincrement;
            } else {
                hitboundary = 1;
                rightincrement *= 0.5;
                var_3c634c6ad0bcecfb = var_ba526b477f9c97f6 - rightincrement;
            }
        }
        if (!hitboundary) {
            iterations++;
            if (iterations >= var_b824bc967d25c7ba) {
                return [0, 360];
            }
        }
        if (leftincrement < minincrement && rightincrement < minincrement) {
            return [var_ba526b477f9c97f6, var_da21db3f5d1fcf57];
        }
        waitframe();
    }
}
