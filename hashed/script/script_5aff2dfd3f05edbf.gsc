#using scripts\common\callbacks.gsc;
#using scripts\common\debug.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\killstreaks\airstrike.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\killstreaks\toma_strike.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\common\devgui.gsc;

#namespace bunker_buster;

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x60d
// Size: 0x18
function autoexec main() {
    killstreak_shared::function_df7ab5b0f898e8bc(function_1823ff50bb28148d("bunker_buster"), &init);
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x62d
// Size: 0x70
function private init() {
    /#
        utility::function_2bf8ec790b5a10f8(@"hash_fa92580eadd91682", &debug_init);
    #/
    if (utility::issharedfuncdefined("bunker_buster", "init")) {
        [[ utility::getsharedfunc("bunker_buster", "init") ]]();
    }
    namespace_2b1145f62aa835b8::function_62de81d97c7d9e49("bunker_buster", &function_4927316e0d7c0fde, undefined, undefined);
    utility::registersharedfunc("bunker_buster", "tryUseKillstreak", &function_4927316e0d7c0fde);
    init_vars();
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6a5
// Size: 0x1cf
function private init_vars() {
    level.bunker_buster = {#count:0, #active:[], #max_active:2};
    bundle = level.streakglobals.streakbundles["bunker_buster"];
    assertex(isdefined(bundle), "<dev string:x1c>" + "<dev string:x38>" + "<dev string:x52>" + "<dev string:x63>");
    level.bunker_buster.gas_lifetime = getdvarint(@"hash_13661b583bd4e977", bundle.var_af691ff0e5ce5649);
    level.bunker_buster.gas_radius = getdvarint(@"hash_84afb79d4b21c60a", bundle.var_9f87e4c344f40cb8);
    level.bunker_buster.travel_distance = getdvarint(@"hash_45fce07839c26931", bundle.var_3232856ac106d7ea);
    level.bunker_buster.explosion_radius = getdvarint(@"hash_e9222aff0b6e25e4", bundle.var_f2c3bbfb75adbeee);
    level.bunker_buster.var_daf4bed8de8f6195 = getdvarint(@"hash_3dd9eddc725440b6", bundle.var_f650a0ecedab0825);
    level.bunker_buster.var_fc268ff83cc63313 = getdvarint(@"hash_c84afea8311a2900", bundle.var_1029beb459a7eeb3);
    level.bunker_buster.var_d11e5db66c099464 = getdvarint(@"hash_183522347c70eb09", bundle.var_c9e04fc7188592a5);
    level.bunker_buster.projectile_weapon = bundle.projectileweapon;
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x87c
// Size: 0x109
function private function_4927316e0d7c0fde(streakinfo) {
    if (!isdefined(streakinfo)) {
        streakinfo = killstreak_utility::createstreakinfo("bunker_buster", self);
    }
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return false;
        }
    }
    bundle = level.streakglobals.streakbundles["bunker_buster"];
    deployresult = namespace_2b1145f62aa835b8::function_de31b76c1bf488e8(streakinfo, weapon_utility::function_eeaa22f0cd1ff845(bundle.deployweaponname), "weapon_fired", &function_bc826a7fccd0726, &airstrike::weaponswitchendedairstrike, &function_ae65fc01c45c017);
    if (!istrue(deployresult)) {
        self setclientomnvar("ui_using_bunkerbuster", 0);
        return false;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return false;
        }
    }
    if (utility::issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        level thread [[ utility::getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_" + "bunker_buster", self);
    }
    strike_create(streakinfo);
    return true;
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x98e
// Size: 0x60
function private function_bc826a7fccd0726(streakinfo) {
    if (level.bunker_buster.active.size >= level.bunker_buster.max_active) {
        [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        return false;
    }
    self setclientomnvar("ui_using_bunkerbuster", 1);
    return true;
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x9f7
// Size: 0xcb
function private function_ae65fc01c45c017(streakinfo, var_a9dd4e8c5e5c7178, firedprojectile) {
    if (!isdefined(streakinfo.targetoverride)) {
        mappoint = airstrike::airstrike_getownerlookatpos(self, 1);
        if (!isdefined(mappoint)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/INVALID_POINT");
            }
            return "continue";
        }
    }
    if (namespace_2b1145f62aa835b8::function_f3890748bda5f813()) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/CANNOT_BE_USED");
        }
        return "continue";
    }
    if (namespace_2b1145f62aa835b8::function_b1412f0ab907bab7()) {
        self setclientomnvar("ui_using_bunkerbuster", 0);
    }
    return "success";
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xacb
// Size: 0x7e
function private strike_create(streakinfo) {
    streakinfo.uid = function_a9a0e979105b948d();
    thread strike_fire(streakinfo);
    level.bunker_buster.active = utility::array_add(level.bunker_buster.active, streakinfo.uid);
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    level callback::callback("killstreak_finish_use", {#streakinfo:streakinfo});
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb51
// Size: 0x16e
function strike_fire(streakinfo) {
    streakinfo.shots_fired++;
    marker_pos = isdefined(streakinfo.targetoverride) ? streakinfo.targetoverride : toma_strike::tomastrike_getownerlookat(self);
    marker = utility::spawn_model("ks_toma_strike_marker_mp", marker_pos);
    marker.objidnum = 0;
    marker.icon = "icon_waypoint_bunker_buster";
    if (utility::issharedfuncdefined("game", "requestObjectiveID")) {
        marker.objidnum = [[ utility::getsharedfunc("game", "requestObjectiveID") ]](99);
    }
    marker setotherent(self);
    marker toma_strike::toma_strike_setmarkerobjective(marker.objidnum, marker.icon, self, 50);
    marker thread function_aad1a178bf665f2a();
    utility::function_f3bb4f4911a1beb2("bunker_buster", "dialog_deploy", self);
    namespace_2b1145f62aa835b8::function_940b2080e171a9d3(self, self.team, 1024, "bunker_buster", marker_pos);
    notify_players = function_153d5add7253b500(self, self.team, 1024, marker_pos);
    utility::function_f3bb4f4911a1beb2("bunker_buster", "dialog_warning", notify_players[0], notify_players[1]);
    namespace_2b1145f62aa835b8::function_2284137aa92dbd16(level.bunker_buster.var_d11e5db66c099464);
    strike_logic(marker_pos, streakinfo);
    thread strike_end(streakinfo);
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcc7
// Size: 0x84
function strike_end(streakinfo) {
    if (utility::array_contains(level.bunker_buster.active, streakinfo.uid)) {
        level.bunker_buster.active = utility::array_remove(level.bunker_buster.active, streakinfo.uid);
    }
    level notify("bunker_buster" + "_finished_" + streakinfo.uid);
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xd53
// Size: 0xc8
function private function_153d5add7253b500(owner, team, range, location) {
    players = getplayersinradius(location, range, 1000);
    friendlies = [];
    enemies = [];
    foreach (player in players) {
        if (player == owner) {
            continue;
        }
        if (player.team == team) {
            friendlies[friendlies.size] = player;
            continue;
        }
        enemies[enemies.size] = player;
    }
    return [friendlies, enemies];
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe24
// Size: 0x36
function function_a9a0e979105b948d() {
    level.bunker_buster.count++;
    return self getxuid() + "_" + level.bunker_buster.count;
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe63
// Size: 0x32d
function strike_logic(position, streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("bunker_buster" + "_finished_" + streakinfo.uid);
    missile = missile_spawn(position, 5000, (0, 0, -1000));
    missile.streakinfo = streakinfo;
    missile.streakname = streakinfo.streakname;
    results = missile function_f4b21fbcf97269e8(self);
    stuck_to = results[0];
    missile = results[1];
    hit = results[2];
    if (!isdefined(missile)) {
        return;
    }
    streakinfo.impact_location = missile.origin;
    streakinfo.water_impact = missile.water_impact;
    streakinfo.impact_time = scripts\cp_mp\utility\game_utility::gettimepassed();
    missile function_9d0257c1da72ca5d();
    missile.angles = (0, 0, 0);
    if (missile islinked()) {
        missile unlink();
    }
    missile setscriptablepartstate("visibility", "hide");
    missile.exploded = 1;
    streakinfo.explosion_victims = function_5ddd621f797a85b5(streakinfo.impact_location, self);
    streakinfo.gas_victims = [];
    waitframe();
    missile setscriptablepartstate("explode", istrue(streakinfo.water_impact) ? "explode_water" : "explode");
    missile function_5300adfce0ef3191();
    if (istrue(hit)) {
        streakinfo.explosion_victims["exception_credit"] = 1;
    }
    wait 0.25;
    currentradius = 30;
    streakinfo.mapcircle = function_dc11c1caffe56e16("NovaGas_Br", streakinfo.impact_location[0], streakinfo.impact_location[1], currentradius, self);
    streakinfo.mapcircle show();
    deltaradius = level.bunker_buster.gas_radius - currentradius;
    level thread function_c6c97baa041205e(streakinfo, &game_utility::function_4584ad1c0e2c58ec, currentradius, deltaradius, 1.25);
    wait 0.75;
    missile delete();
    utility::function_f3bb4f4911a1beb2("bunker_buster", "missile_gas_volume", streakinfo.impact_location + (0, 0, 128), streakinfo.impact_location - (0, 0, level.bunker_buster.travel_distance), level.bunker_buster.gas_radius, streakinfo);
    thread function_61ac63303c87acda(3, streakinfo);
    level thread function_4c86258acf5f82bf(streakinfo.impact_location, streakinfo.water_impact);
    streakinfo.mapcircle thread utility::function_b4b04de87729a6f3(level.bunker_buster.gas_lifetime);
    level thread function_d86280932be7b254(level.bunker_buster.gas_lifetime, streakinfo);
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1198
// Size: 0x2c
function function_d86280932be7b254(delay, streak_info) {
    level endon("game_ended");
    wait delay;
    function_184a66360bf3e401(streak_info);
    function_ce7b42754785fc(streak_info);
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x11cc
// Size: 0xdd
function private function_5ddd621f797a85b5(location, owner) {
    affected_players = getplayersinradius(location, level.bunker_buster.travel_distance);
    victims = [];
    foreach (player in affected_players) {
        if (player != owner && player.team == owner.team) {
            continue;
        }
        if (distance2d(player.origin, location) > level.bunker_buster.explosion_radius) {
            continue;
        }
        victims[victims.size] = player;
    }
    return victims;
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x12b2
// Size: 0x36
function private function_61ac63303c87acda(delay, streak_info) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    wait delay;
    utility::function_f3bb4f4911a1beb2("bunker_buster", "dialog_hits", self, streak_info);
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x12f0
// Size: 0x227
function missile_spawn(origin, offset, velocity, exp_time, prev_missile) {
    if (!isdefined(offset)) {
        offset = 4096;
    }
    if (!isdefined(velocity)) {
        velocity = (0, 0, 0);
    }
    if (!isdefined(exp_time)) {
        exp_time = 6;
    }
    var_206dbd116490dd48 = {#initvelocity:velocity, #sourcepos:origin + (0, 0, offset), #goalpos:origin};
    missile = magicgrenademanual("bunker_buster_proj_jup_mp", var_206dbd116490dd48.sourcepos, var_206dbd116490dd48.initvelocity, exp_time);
    if (!isdefined(prev_missile)) {
        missile setscriptablepartstate("trail", "active", 0);
    } else {
        missile setscriptablepartstate("trail", "continue", 0);
    }
    if (!isdefined(prev_missile)) {
        missile setscriptablepartstate("launch", "active", 0);
        missile thread function_2a1d38d2eba581d2(self);
    }
    if (isdefined(prev_missile)) {
        minimapid = prev_missile.minimapid;
        streakinfo = prev_missile.streakinfo;
        prev_missile delete();
    } else {
        minimapid = undefined;
        if (utility::issharedfuncdefined("game", "createObjective")) {
            minimapid = missile [[ utility::getsharedfunc("game", "createObjective") ]]("hud_icon_minimap_killstreak_bunker_buster", self.team, undefined, 1, 1);
        }
    }
    missile.minimapid = minimapid;
    missile.owner = self;
    if (isdefined(streakinfo)) {
        missile.streakinfo = streakinfo;
        missile.streakname = streakinfo.streakname;
    }
    missile setentityowner(self);
    missile setotherent(self);
    missile forcenetfieldhighlod(1);
    missile thread function_fd8677bd03da3d3b();
    missile thread function_93c5e685b2a30986();
    missile.empapplycallback = &function_240e63c6a103482b;
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        missile [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_240e63c6a103482b);
    }
    return missile;
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1520
// Size: 0x4a
function function_2a1d38d2eba581d2(owner) {
    level endon("game_ended");
    owner endon("disconnect");
    self endon("death");
    self endon("emp_debuff");
    self endon("missile_stuck");
    self endon("missile_water_impact");
    wait 1;
    function_9d0257c1da72ca5d(1);
    self setmissileminimapvisible(1);
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1572
// Size: 0x10c
function function_5300adfce0ef3191() {
    streakinfo = self.streakinfo;
    if (isdefined(streakinfo.explosion_victims)) {
        foreach (player in streakinfo.explosion_victims) {
            v_dist = abs(self.origin[2] - player.origin[2]);
            travel_time = mapfloat(0, level.bunker_buster.travel_distance, 0, 0.5, v_dist);
            thread function_f71fc273e43f587b(player, travel_time);
        }
    }
    function_e45e5fd94ec4af36(0.5, 0.3, 0.2, 1.5, self.origin, level.bunker_buster.explosion_radius, 1000, 5000);
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1686
// Size: 0xd9
function function_f71fc273e43f587b(player, travel_time) {
    player endon("disconnect");
    if (travel_time >= level.framedurationseconds) {
        wait travel_time;
    }
    var_78098af3a02ebf0c = distance2d(player.origin, self.origin);
    damage = int(mapfloat(0, level.bunker_buster.explosion_radius, level.bunker_buster.var_fc268ff83cc63313, level.bunker_buster.var_daf4bed8de8f6195, var_78098af3a02ebf0c));
    player dodamage(damage, self.origin, self.owner, self, "MOD_EXPLOSIVE", level.bunker_buster.projectile_weapon, "none", undefined, 1);
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1767
// Size: 0x7d
function function_93c5e685b2a30986() {
    level endon("game_ended");
    self.owner endon("disconnect");
    self endon("death");
    self endon("missile_stuck");
    self endon("missile_water_impact");
    self waittill("emp_debuff");
    self setscriptablepartstate("explode", "explode_air");
    self setscriptablepartstate("visibility", "hide");
    waitframe();
    function_5300adfce0ef3191();
    function_9d0257c1da72ca5d();
    strike_end(self.streakinfo);
    self delete();
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17ec
// Size: 0x3e
function function_fd8677bd03da3d3b() {
    self endon("death");
    level endon("game_ended");
    self.owner waittill("disconnect");
    function_9d0257c1da72ca5d();
    strike_end(self.streakinfo);
    self delete();
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1832
// Size: 0x5f
function function_aad1a178bf665f2a() {
    self endon("death");
    self setscriptablepartstate("target", "on", 0);
    namespace_2b1145f62aa835b8::function_2284137aa92dbd16(6);
    if (isdefined(self)) {
        if (utility::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ utility::getsharedfunc("game", "returnObjectiveID") ]](self.objidnum);
        }
        self delete();
    }
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1899
// Size: 0x66
function function_9d0257c1da72ca5d(var_1c9946c37879dc15) {
    if (!isdefined(var_1c9946c37879dc15)) {
        var_1c9946c37879dc15 = 0;
    }
    if (!var_1c9946c37879dc15) {
        self setmissileminimapvisible(0);
    }
    if (isdefined(self.minimapid)) {
        if (utility::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ utility::getsharedfunc("game", "returnObjectiveID") ]](self.minimapid);
        }
        self.minimapid = undefined;
    }
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1907
// Size: 0x26c
function function_f4b21fbcf97269e8(player) {
    missile = self;
    hit = 0;
    while (true) {
        impact_info = missile killstreak_shared::function_51afe751c1e36723("missile_stuck", "missile_water_impact");
        stuck_to = undefined;
        if (isdefined(impact_info)) {
            if (impact_info.msg == "missile_stuck") {
                stuck_to = impact_info.param1;
            } else if (impact_info.msg == "missile_water_impact") {
                missile.water_impact = 1;
            }
        }
        if (!isdefined(stuck_to) && isdefined(impact_info.param5)) {
            var_c8004735a05ab3f7 = sortbydistance(getentitylessscriptablearray("scriptable_scriptable_redeploy_drone", "classname"), impact_info.param5)[0];
            if (isdefined(var_c8004735a05ab3f7) && istrue(var_c8004735a05ab3f7.b_occupied) && distancesquared(impact_info.param5, var_c8004735a05ab3f7.origin) < squared(100)) {
                if (!istrue(var_c8004735a05ab3f7.var_3d94e3b5be6fd3d1)) {
                    if (utility::issharedfuncdefined("redeploy_drone", "redeploy_drone_repopulation_watcher")) {
                        level thread [[ utility::getsharedfunc("redeploy_drone", "redeploy_drone_repopulation_watcher") ]](var_c8004735a05ab3f7);
                    }
                }
                if (utility::issharedfuncdefined("redeploy_drone", "redeploy_drone_destroyed")) {
                    var_c8004735a05ab3f7 [[ utility::getsharedfunc("redeploy_drone", "redeploy_drone_destroyed") ]](player, undefined, 1);
                }
                hit = 1;
                missile = player missile_spawn(missile.origin, 0, (0, 0, -3000), undefined, missile);
                continue;
            }
        }
        if (isdefined(stuck_to) && isdefined(stuck_to.classname) && stuck_to.classname == "script_vehicle" && stuck_to function_89db472b36958666()) {
            data = spawnstruct();
            data.inflictor = self;
            data.objweapon = undefined;
            data.meansofdeath = "MOD_CRUSH";
            data.attacker = player;
            stuck_to thread scripts\cp_mp\vehicles\vehicle::vehicle_explode(data, 1);
            hit = 1;
            missile = player missile_spawn(missile.origin, 0, (0, 0, -3000), undefined, missile);
            continue;
        }
        return [stuck_to, missile, hit];
    }
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b7b
// Size: 0x150
function function_4c86258acf5f82bf(impact_position, water_impact) {
    level endon("game_ended");
    scriptables = [];
    if (!istrue(water_impact)) {
        dir = (0, 0, -1);
        base_offset = level.bunker_buster.travel_distance / 2 * dir;
        height_offset = base_offset * 0.5;
        for (i = 0; i < 2; i++) {
            s = spawnscriptable("ks_bunker_buster_gas_sfx", impact_position + base_offset * i + height_offset);
            s setscriptablepartstate("ks_bunker_buster_gas_sfx", "on");
            scriptables[scriptables.size] = s;
        }
    } else {
        s = spawnscriptable("ks_bunker_buster_gas_sfx", impact_position);
        s setscriptablepartstate("ks_bunker_buster_gas_sfx", "on");
        scriptables[scriptables.size] = s;
    }
    wait level.bunker_buster.gas_lifetime + 1;
    foreach (scriptable in scriptables) {
        scriptable freescriptable();
    }
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cd3
// Size: 0x34
function function_240e63c6a103482b(data) {
    if (isdefined(self) && isdefined(self.owner) && !istrue(self.exploded)) {
        self notify("emp_debuff");
    }
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0f
// Size: 0xbe
function function_184a66360bf3e401(streak_info) {
    eventparams = ["pos_x", streak_info.impact_location[0], "pos_y", streak_info.impact_location[1], "pos_z", streak_info.impact_location[2], "impact_time", streak_info.impact_time, "explosion_victims", streak_info.explosion_victims.size, "gas_victims", streak_info.gas_victims.size];
    dlog_recordevent("dlog_event_br_bunker_buster_complete", eventparams);
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dd5
// Size: 0x52
function function_ce7b42754785fc(streak_info) {
    if (!isdefined(streak_info.owner)) {
        return;
    }
    victims = streak_info.explosion_victims;
    if (victims.size > 0) {
        challenges::function_8359cadd253f9604(streak_info.owner, "br_decay_ks_strike_hit", victims.size);
    }
}

// Namespace bunker_buster / namespace_a86704cc4785573f
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x1e2f
// Size: 0x92
function private function_c6c97baa041205e(object, func, var_6fd9b0faefe473cf, var_9318be71129b2752, seconds) {
    level endon("game_ended");
    starttime = gettime();
    seconds *= 1000;
    while (true) {
        elapsedtime = gettime() - starttime;
        if (elapsedtime >= seconds) {
            break;
        }
        scale = elapsedtime / seconds;
        var_7037ccb752aad36a = var_6fd9b0faefe473cf + var_9318be71129b2752 * scale;
        object [[ func ]](var_7037ccb752aad36a);
        waitframe();
    }
}

/#

    // Namespace bunker_buster / namespace_a86704cc4785573f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ec9
    // Size: 0x5
    function function_b1eab7c7fda1fb57() {
        
    }

    // Namespace bunker_buster / namespace_a86704cc4785573f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ed6
    // Size: 0xe
    function debug_init() {
        level thread function_db5c75f2a84ff03d();
    }

    // Namespace bunker_buster / namespace_a86704cc4785573f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1eec
    // Size: 0x44
    function function_db5c75f2a84ff03d() {
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x75>");
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x8d>", "<dev string:x9c>", &function_defff2269ca98e79);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:xb9>", "<dev string:xcc>", &function_b45f9974855e1e8);
        scripts\common\devgui::function_fe953f000498048f();
    }

    // Namespace bunker_buster / namespace_a86704cc4785573f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f38
    // Size: 0xa9
    function function_defff2269ca98e79() {
        v_pos = (3673, 7719, 5000);
        heli = sortbydistance(level.vehicle.instances["<dev string:xed>"], v_pos)[0];
        if (heli == level.research_vessel.heli) {
            heli = sortbydistance(level.vehicle.instances["<dev string:xed>"], v_pos)[1];
        }
        while (isalive(heli)) {
            heli vehicle_teleport(v_pos, (0, 0, 0), 1);
            waitframe();
        }
    }

    // Namespace bunker_buster / namespace_a86704cc4785573f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1fe9
    // Size: 0xd
    function function_b45f9974855e1e8() {
        level init_vars();
    }

#/