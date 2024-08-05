#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\sp\utility_code.gsc;
#using script_7e4d332e911e1b90;
#using scripts\anim\utility_common.gsc;
#using scripts\sp\starts.gsc;
#using scripts\sp\player.gsc;
#using scripts\asm\asm.gsc;
#using scripts\common\ai.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\autosave.gsc;
#using scripts\sp\spawner.gsc;
#using script_55b3046625fb79b6;
#using script_35de402efc5acfb3;
#using script_f4e8d02d2f70888;
#using scripts\sp\player\playerchatter.gsc;
#using scripts\sp\colors.gsc;
#using scripts\common\createfx.gsc;
#using scripts\sp\anim.gsc;
#using script_3433ee6b63c7e243;
#using scripts\common\vehicle_paths.gsc;
#using scripts\sp\endmission.gsc;
#using scripts\sp\audio.gsc;
#using scripts\sp\trigger.gsc;
#using scripts\sp\hud_util.gsc;
#using scripts\common\exploder.gsc;
#using scripts\common\anim.gsc;
#using scripts\sp\nvg\nvg_player.gsc;
#using scripts\sp\player\gestures.gsc;
#using script_4dac3680f88a01c3;
#using scripts\sp\interaction_manager.gsc;
#using scripts\sp\equipment\offhands.gsc;
#using scripts\sp\outline.gsc;

#namespace utility;

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3256
// Size: 0xc9
function function_df57c8a03e293db4(anime) {
    assertex(isdefined(level.scr_anim), "No level.scr_ animation arrays exist!");
    animnames = [];
    foreach (array in level.scr_anim) {
        foreach (xanim in array) {
            if (scene == anime) {
                animnames[animnames.size] = animname;
            }
        }
    }
    return animnames;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3328
// Size: 0x4d
function get_tag_list(model) {
    array = [];
    numparts = getnumparts(model);
    for (i = 0; i < numparts; i++) {
        array[array.size] = getpartname(model, i);
    }
    return array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x337e
// Size: 0xce
function get_all_closest_living(org, ai_array, max_dist, var_49e7756d07c8048d) {
    temp_array = [];
    if (ai_array.size < 1) {
        return temp_array;
    }
    if (!isdefined(var_49e7756d07c8048d)) {
        var_49e7756d07c8048d = 0;
    }
    max_dist = squared(max_dist);
    foreach (guy in ai_array) {
        if (!isalive(guy) || !isdefined(guy) || !var_49e7756d07c8048d && guy scripts\engine\utility::doinglongdeath()) {
            continue;
        }
        if (distancesquared(guy.origin, org) <= max_dist) {
            temp_array[temp_array.size] = guy;
        }
    }
    return temp_array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3455
// Size: 0xa7
function set_hudoutline(stype, var_aa202f6993ccc074, var_e1558af7c1cd5ad2) {
    num = undefined;
    assertex(isdefined(stype) && isstring(stype), "set_HudOutline() needs a string! Use 'friendly', 'enemy', 'objective', or 'neutral' ");
    stype = tolower(stype);
    array["friendly"] = "outline_nodepth_cyan";
    array["enemy"] = "outline_nodepth_red";
    array["objective"] = "outline_nodepth_orange";
    array["neutral"] = "outline_nodepth_white";
    assertex(isdefined(array[stype]), "set_hudOutline() called with invalid type. Use 'friendly', 'enemy', 'objective', or 'neutral' ");
    num = array[stype];
    hudoutline_enable_new(array[stype]);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3504
// Size: 0xfa
function convert_to_time_string(timer, var_9930ab910b718a51) {
    string = "";
    if (timer < 0) {
        string += "-";
    }
    timer = math::round_float(timer, 1, 0);
    var_87272c6f95dd558e = timer * 100;
    var_87272c6f95dd558e = int(var_87272c6f95dd558e);
    var_87272c6f95dd558e = abs(var_87272c6f95dd558e);
    minutes = var_87272c6f95dd558e / 6000;
    minutes = int(minutes);
    string += minutes;
    seconds = var_87272c6f95dd558e / 100;
    seconds = int(seconds);
    seconds -= minutes * 60;
    if (seconds < 10) {
        string += ":0" + seconds;
    } else {
        string += ":" + seconds;
    }
    if (isdefined(var_9930ab910b718a51) && var_9930ab910b718a51) {
        var_125a70ab390d60bd = var_87272c6f95dd558e;
        var_125a70ab390d60bd -= minutes * 6000;
        var_125a70ab390d60bd -= seconds * 100;
        var_125a70ab390d60bd = int(var_125a70ab390d60bd / 10);
        string += "." + var_125a70ab390d60bd;
    }
    return string;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3607
// Size: 0xc9
function sun_light_fade(var_277ede8250943ced, var_8300ef7e24b53984, var_e69c0fde567784b4) {
    var_e69c0fde567784b4 = int(var_e69c0fde567784b4 * 20);
    increment = [];
    for (i = 0; i < 4; i++) {
        increment[i] = (var_277ede8250943ced[i] - var_8300ef7e24b53984[i]) / var_e69c0fde567784b4;
    }
    var_80bbcd5efb3983a3 = [];
    for (i = 0; i < var_e69c0fde567784b4; i++) {
        wait 0.05;
        for (j = 0; j < 4; j++) {
            var_80bbcd5efb3983a3[j] = var_277ede8250943ced[j] - increment[j] * i;
        }
        setsuncolorandintensity(var_80bbcd5efb3983a3[0], var_80bbcd5efb3983a3[1], var_80bbcd5efb3983a3[2], var_80bbcd5efb3983a3[3]);
    }
    setsuncolorandintensity(var_8300ef7e24b53984[0], var_8300ef7e24b53984[1], var_8300ef7e24b53984[2], var_8300ef7e24b53984[3]);
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x36d8
// Size: 0x14d
function get_closest_to_player_view(array, player, var_c603e9ff12d40a5a, var_8461f3da37a8bf63) {
    if (!array.size) {
        return;
    }
    if (!isdefined(player)) {
        player = level.player;
    }
    if (!isdefined(var_8461f3da37a8bf63)) {
        var_8461f3da37a8bf63 = -1;
    }
    player_origin = player.origin;
    if (isdefined(var_c603e9ff12d40a5a) && var_c603e9ff12d40a5a) {
        player_origin = player geteye();
    }
    ent = undefined;
    player_angles = player getplayerangles();
    player_forward = anglestoforward(player_angles);
    dot = -1;
    foreach (var_2aa56193b94a18f8 in array) {
        angles = vectortoangles(var_2aa56193b94a18f8.origin - player_origin);
        forward = anglestoforward(angles);
        newdot = vectordot(player_forward, forward);
        if (newdot < dot) {
            continue;
        }
        if (newdot < var_8461f3da37a8bf63) {
            continue;
        }
        dot = newdot;
        ent = var_2aa56193b94a18f8;
    }
    return ent;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x382e
// Size: 0x109
function get_closest_index_to_player_view(array, player, var_c603e9ff12d40a5a) {
    if (!array.size) {
        return;
    }
    if (!isdefined(player)) {
        player = level.player;
    }
    player_origin = player.origin;
    if (isdefined(var_c603e9ff12d40a5a) && var_c603e9ff12d40a5a) {
        player_origin = player geteye();
    }
    index = undefined;
    player_angles = player getplayerangles();
    player_forward = anglestoforward(player_angles);
    dot = -1;
    for (i = 0; i < array.size; i++) {
        angles = vectortoangles(array[i].origin - player_origin);
        forward = anglestoforward(angles);
        newdot = vectordot(player_forward, forward);
        if (newdot < dot) {
            continue;
        }
        dot = newdot;
        index = i;
    }
    return index;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3940
// Size: 0x55
function flag_trigger_init(message, trigger, continuous) {
    flag_init(message);
    if (!isdefined(continuous)) {
        continuous = 0;
    }
    assert(issubstr(trigger.classname, "trigger"));
    trigger thread _flag_wait_trigger(message, continuous);
    return trigger;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x399e
// Size: 0x72
function flag_triggers_init(message, triggers, all) {
    flag_init(message);
    if (!isdefined(all)) {
        all = 0;
    }
    for (index = 0; index < triggers.size; index++) {
        assert(issubstr(triggers[index].classname, "trigger"));
        triggers[index] thread _flag_wait_trigger(message, 0);
    }
    return triggers;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3a19
// Size: 0x1d
function flag_clear_delayed(message, delay) {
    wait delay;
    flag_clear(message);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3a3e
// Size: 0x20
function flag_clear_delayed_endonset(message, delay) {
    level endon(message);
    wait delay;
    flag_clear(message);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a66
// Size: 0xb5
function level_end_save() {
    if (level.missionfailed) {
        return;
    }
    if (scripts\sp\utility::is_trials_level()) {
        return 0;
    }
    if (flag("game_saving")) {
        return;
    }
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (!isalive(player)) {
            return;
        }
    }
    flag_set("game_saving");
    imagename = "levelshots / autosave / autosave_" + level.script + "end";
    savegame("levelend", %AUTOSAVE_AUTOSAVE, imagename, 1);
    flag_clear("game_saving");
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3b23
// Size: 0x6c
function add_extra_autosave_check(name, func, msg) {
    level.autosave.extra_autosave_checks[name] = [];
    level.autosave.extra_autosave_checks[name]["func"] = func;
    level.autosave.extra_autosave_checks[name]["msg"] = msg;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b97
// Size: 0x20
function remove_extra_autosave_check(name) {
    level.autosave.extra_autosave_checks[name] = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bbf
// Size: 0x13
function autosave_silent() {
    thread autosave_by_name_thread("autosave_silent", undefined, undefined, 1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bda
// Size: 0x13
function autosave_stealth() {
    thread autosave_by_name_thread("autosave_stealth", 8, 1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bf5
// Size: 0x15
function autosave_stealth_silent() {
    thread autosave_by_name_thread("autosave_stealth", 8, 1, 1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c12
// Size: 0x11
function autosave_tactical() {
    autosave_tactical_setup();
    thread autosave_tactical_proc();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c2b
// Size: 0x14
function autosave_by_name(name) {
    thread autosave_by_name_thread(name);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c47
// Size: 0x18
function autosave_by_name_silent(name) {
    thread autosave_by_name_thread(name, undefined, undefined, 1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3c67
// Size: 0x70
function autosave_by_name_thread(name, timeout, var_f78389d2b10c1f26, var_7df840403f42ac86, var_7ee0e272b34faff) {
    if (!isdefined(name)) {
        name = "undefined";
    }
    imagename = "levelshots/autosave/autosave_" + level.script;
    result = level scripts\sp\autosave::tryautosave(name, "autosave", imagename, timeout, var_f78389d2b10c1f26, var_7df840403f42ac86, var_7ee0e272b34faff);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3cdf
// Size: 0x1d
function autosave_or_timeout(name, timeout) {
    thread autosave_by_name_thread(name, timeout);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3d04
// Size: 0x21
function autosave_try_once(name, var_7df840403f42ac86) {
    thread autosave_by_name_thread(name, undefined, undefined, var_7df840403f42ac86, 1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3d2d
// Size: 0x20
function autosave_or_timeout_silent(name, timeout) {
    thread autosave_by_name_thread(name, timeout, undefined, 1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3d55
// Size: 0xc0
function debug_message(message, origin, duration, entity) {
    if (!isdefined(duration)) {
        duration = 5;
    }
    if (isdefined(entity)) {
        entity endon("death");
        origin = entity.origin;
    }
    for (time = 0; time < duration * 20; time++) {
        if (!isdefined(entity)) {
            /#
                print3d(origin + (0, 0, 45), message, (0.48, 9.4, 0.76), 0.85);
            #/
        } else {
            /#
                print3d(entity.origin, message, (0.48, 9.4, 0.76), 0.85);
            #/
        }
        wait 0.05;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3e1d
// Size: 0x92
function debug_message_clear(message, origin, duration, extraendon) {
    if (isdefined(extraendon)) {
        level notify(message + extraendon);
        level endon(message + extraendon);
    } else {
        level notify(message);
        level endon(message);
    }
    if (!isdefined(duration)) {
        duration = 5;
    }
    for (time = 0; time < duration * 20; time++) {
        /#
            print3d(origin + (0, 0, 45), message, (0.48, 9.4, 0.76), 0.85);
        #/
        wait 0.05;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3eb7
// Size: 0x16
function closerfunc(dist1, dist2) {
    return dist1 >= dist2;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3ed6
// Size: 0x29
function getclosestfx(org, fxarray, dist) {
    return comparesizesfx(org, fxarray, dist, &closerfunc);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f08
// Size: 0x87
function get_farthest_ent(org, array) {
    if (array.size < 1) {
        return;
    }
    dist = distance(array[0] getorigin(), org);
    ent = array[0];
    for (i = 0; i < array.size; i++) {
        newdist = distance(array[i] getorigin(), org);
        if (newdist < dist) {
            continue;
        }
        dist = newdist;
        ent = array[i];
    }
    return ent;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3f98
// Size: 0x61
function get_within_range(org, array, dist) {
    guys = [];
    for (i = 0; i < array.size; i++) {
        if (distance(array[i].origin, org) <= dist) {
            guys[guys.size] = array[i];
        }
    }
    return guys;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4002
// Size: 0x61
function get_outside_range(org, array, dist) {
    guys = [];
    for (i = 0; i < array.size; i++) {
        if (distance(array[i].origin, org) > dist) {
            guys[guys.size] = array[i];
        }
    }
    return guys;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x406c
// Size: 0x93
function get_closest_living(org, array, dist) {
    if (!isdefined(dist)) {
        dist = 9999999;
    }
    if (array.size < 1) {
        return;
    }
    ent = undefined;
    for (i = 0; i < array.size; i++) {
        if (!isalive(array[i])) {
            continue;
        }
        newdist = distance(array[i].origin, org);
        if (newdist >= dist) {
            continue;
        }
        dist = newdist;
        ent = array[i];
    }
    return ent;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4108
// Size: 0xef
function get_highest_dot(start, end, array) {
    if (!array.size) {
        return;
    }
    ent = undefined;
    angles = vectortoangles(end - start);
    dotforward = anglestoforward(angles);
    dot = -1;
    foreach (member in array) {
        angles = vectortoangles(member.origin - start);
        forward = anglestoforward(angles);
        newdot = vectordot(dotforward, forward);
        if (newdot < dot) {
            continue;
        }
        dot = newdot;
        ent = member;
    }
    return ent;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4200
// Size: 0xac
function get_closest_index(org, array, dist) {
    if (!isdefined(dist)) {
        dist = 9999999;
    }
    if (array.size < 1) {
        return;
    }
    index = undefined;
    foreach (ent in array) {
        newdist = distance(ent.origin, org);
        if (newdist >= dist) {
            continue;
        }
        dist = newdist;
        index = i;
    }
    return index;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x42b5
// Size: 0x62
function get_closest_exclude(org, ents, excluders) {
    if (!isarray(ents) || ents.size == 0) {
        return undefined;
    }
    var_f894c63729b8b439 = array_remove_array(ents, excluders);
    if (var_f894c63729b8b439.size == 0) {
        return undefined;
    } else if (var_f894c63729b8b439.size > 1) {
        var_f894c63729b8b439 = sortbydistance(var_f894c63729b8b439, org);
    }
    return var_f894c63729b8b439[0];
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4320
// Size: 0x68
function get_closest_ai(org, team, excluders) {
    if (isdefined(team)) {
        ents = getaiarray(team);
    } else {
        ents = getaiarray();
    }
    if (ents.size == 0) {
        return undefined;
    }
    if (isdefined(excluders)) {
        assert(excluders.size > 0);
        ents = array_remove_array(ents, excluders);
    }
    return getclosest(org, ents);
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4391
// Size: 0x4d
function get_closest_ai_exclude(org, team, excluders) {
    if (isdefined(team)) {
        ents = getaiarray(team);
    } else {
        ents = getaiarray();
    }
    if (ents.size == 0) {
        return undefined;
    }
    return get_closest_exclude(org, ents, excluders);
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x43e7
// Size: 0x85
function get_progress(start, end, org, dist) {
    if (!isdefined(dist)) {
        dist = distance(start, end);
    }
    dist = max(0.01, dist);
    normal = vectornormalize(end - start);
    vec = org - start;
    progress = vectordot(vec, normal);
    progress /= dist;
    progress = clamp(progress, 0, 1);
    return progress;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4475
// Size: 0x14
function enable_blood_pool() {
    self.skipbloodpool = undefined;
    self setragdollnobloodpoolfx(0);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4491
// Size: 0x16
function disable_blood_pool() {
    self.skipbloodpool = 1;
    self setragdollnobloodpoolfx(1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44af
// Size: 0xb
function deletable_magic_bullet_shield() {
    magic_bullet_shield(1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44c2
// Size: 0xd
function get_ignoreme() {
    return val::get("ignoreme");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x44d8
// Size: 0x4b
function set_ignoreme(val) {
    assertex(issentient(self), "Non ai tried to set ignoreme");
    if (istrue(val)) {
        val::set("sp_utility", "ignoreme", 1);
        return;
    }
    val::reset("sp_utility", "ignoreme");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x452b
// Size: 0x4b
function set_ignoreall(val) {
    assertex(issentient(self), "Non ai tried to set ignoreall");
    if (istrue(val)) {
        val::set("sp_utility", "ignoreall", 1);
        return;
    }
    val::reset("sp_utility", "ignoreall");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x457e
// Size: 0x21
function function_478cf9edb77879f5() {
    assertex(issentient(self), "Non ai tried to get ignoraell");
    return val::get("ignoreall");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x45a8
// Size: 0x15
function set_favoriteenemy(enemy) {
    self.favoriteenemy = enemy;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45c5
// Size: 0xb
function get_pacifist() {
    return self.pacifist;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x45d9
// Size: 0x29
function set_pacifist(val) {
    assertex(issentient(self), "Non ai tried to set pacifist");
    self.pacifist = val;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x460a
// Size: 0x15
function set_maxsightdistsquared(value) {
    self.maxsightdistsqrd = value;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4627
// Size: 0x15
function set_maxvisibledist(value) {
    self.maxvisibledist = value;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4644
// Size: 0x15
function set_maxfaceenemydist(value) {
    self.maxfaceenemydist = value;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4661
// Size: 0x15
function set_sprint(value) {
    self.sprint = value;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x467e
// Size: 0x13
function flood_spawn(spawners) {
    scripts\sp\spawner::flood_spawner_scripted(spawners);
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4699
// Size: 0x46
function force_crawling_death(angle, var_4bd2747924ed0fc8, array, nofallanim) {
    assertmsg("Don't use this, it's deprecated. And we need a better wrapper");
    if (!isdefined(var_4bd2747924ed0fc8)) {
        var_4bd2747924ed0fc8 = 4;
    }
    thread force_crawling_death_proc(angle, var_4bd2747924ed0fc8, array, nofallanim);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46e7
// Size: 0x15e
function override_crawl_death_anims() {
    if (isdefined(self.a.custom_crawling_death_array)) {
        self.a.array["crawl"] = self.a.custom_crawling_death_array["crawl"];
        self.a.array["death"] = self.a.custom_crawling_death_array["death"];
        self.a.crawl_fx_rate = self.a.custom_crawling_death_array["blood_fx_rate"];
        if (isdefined(self.a.custom_crawling_death_array["blood_fx"])) {
            self.a.crawl_fx = self.a.custom_crawling_death_array["blood_fx"];
        }
    }
    self.a.array["stand_2_crawl"] = [];
    if (isdefined(self.nofallanim)) {
        self.currentpose = "prone";
    }
    self orientmode("face angle", self.a.force_crawl_angle);
    self.a.force_crawl_angle = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x484d
// Size: 0xdb
function force_crawling_death_proc(angle, var_4bd2747924ed0fc8, array, nofallanim) {
    self.forcelongdeath = 1;
    self.force_num_crawls = var_4bd2747924ed0fc8;
    self.noragdoll = 1;
    self.nofallanim = nofallanim;
    self.a.custom_crawling_death_array = array;
    self.crawlingpainanimoverridefunc = &override_crawl_death_anims;
    self.maxhealth = 100000;
    self.health = 100000;
    ai::enable_long_death();
    if (!isdefined(nofallanim) || nofallanim == 0) {
        self.a.force_crawl_angle = angle + 181.02;
        return;
    }
    self.a.force_crawl_angle = angle;
    thread namespace_acef762f74130ac8::notetrackposecrawl();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4930
// Size: 0x14
function ai_ragdoll_immediate() {
    self.skipdeathanim = 1;
    die();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x494c
// Size: 0xe6
function playerwatch_unresolved_collision(count) {
    self endon("death");
    self endon("stop_unresolved_collision_script");
    if (!isdefined(count)) {
        count = 20;
    }
    self.unresolved_collision_count = 0;
    while (true) {
        mover = self waittill("unresolved_collision");
        self.last_unresolved_collision_time = gettime();
        if (isdefined(mover) && (istrue(mover.doorclip) || istrue(mover.allowunresolvedcollision))) {
            continue;
        }
        childthread resetunresolvedcollision();
        self.unresolved_collision_count++;
        if (self.unresolved_collision_count >= count) {
            if (isdefined(mover) && isdefined(mover.unresolved_collision_func)) {
                mover [[ mover.unresolved_collision_func ]](self);
            }
            if (isdefined(self.handle_unresolved_collision)) {
                self [[ self.handle_unresolved_collision ]]();
                continue;
            }
            default_unresolved_collision_handler();
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a3a
// Size: 0x22
function resetunresolvedcollision() {
    self notify("newUnresolvedCollision");
    self endon("newUnresolvedCollision");
    wait 0.05;
    waittillframeend();
    self.unresolved_collision_count = 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a64
// Size: 0x15
function default_unresolved_collision_handler() {
    level.custom_death_quote = 438;
    scripts\sp\utility::missionfailedwrapper();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a81
// Size: 0xa
function stop_playerwatch_unresolved_collision() {
    self notify("stop_unresolved_collision_script");
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4a93
// Size: 0x1e
function play_sound_on_tag_endon_death(alias, tag) {
    play_sound_on_tag(alias, tag, 1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4ab9
// Size: 0xe0
function play_loop_sound_on_entity_with_pitch(alias, offset, var_c99d038c1c68d20a, var_3f5c9be80d64106f) {
    org = spawn("script_origin", (0, 0, 0));
    org endon("death");
    thread delete_on_death(org);
    if (!isdefined(var_c99d038c1c68d20a)) {
        var_c99d038c1c68d20a = 0;
    }
    if (!isdefined(var_3f5c9be80d64106f)) {
        var_3f5c9be80d64106f = 0;
    }
    if (isdefined(offset)) {
        org.origin = self.origin + offset;
    } else {
        org.origin = self.origin;
    }
    org.angles = self.angles;
    org linkto(self);
    org playloopsound(alias);
    org scalepitch(var_c99d038c1c68d20a, var_3f5c9be80d64106f);
    self waittill("stop sound" + alias);
    org stoploopsound(alias);
    org delete();
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4ba1
// Size: 0x33
function play_sound_on_entity(alias, var_b426f32755673ba6) {
    assertex(!isspawner(self), "Spawner tried to play a sound");
    play_sound_on_tag(alias, undefined, undefined, var_b426f32755673ba6);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4bdc
// Size: 0x60
function assign_animtree(animname) {
    if (isdefined(animname)) {
        self.animname = animname;
    }
    assertex(isdefined(level.scr_animtree[self.animname]), "There is no level.scr_animtree for animname " + self.animname);
    self useanimtree(level.scr_animtree[self.animname]);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c44
// Size: 0xa6
function assign_model() {
    assertex(isdefined(level.scr_model[self.animname]), "There is no level.scr_model for animname " + self.animname);
    if (isarray(level.scr_model[self.animname])) {
        randindex = randomint(level.scr_model[self.animname].size);
        self setmodel(level.scr_model[self.animname][randindex]);
        return;
    }
    self setmodel(level.scr_model[self.animname]);
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4cf2
// Size: 0x75
function spawn_anim_model(animname, origin, angles) {
    if (!isdefined(origin)) {
        origin = (0, 0, 0);
    }
    model = spawn("script_model", origin);
    model.animname = animname;
    model assign_animtree();
    model assign_model();
    if (isdefined(angles)) {
        model.angles = angles;
    }
    return model;
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4d70
// Size: 0xe8
function spawn_anim_weapon(animname, origin, angles, viewmodel) {
    if (!isdefined(origin)) {
        origin = (0, 0, 0);
    }
    if (!isdefined(viewmodel)) {
        viewmodel = 0;
    }
    model = spawn("script_model", origin);
    model.animname = animname;
    model assign_animtree();
    assertex(isdefined(level.scr_weapon[animname]), "There is no level.scr_weapon for animname " + model.animname);
    attachments = [];
    if (isdefined(level.scr_weapon[animname][1])) {
        attachments = level.scr_weapon[animname][1];
    }
    model make_weapon_model(level.scr_weapon[animname][0], attachments, viewmodel);
    if (isdefined(angles)) {
        model.angles = angles;
    }
    return model;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4e61
// Size: 0x5c
function trigger_wait(var_44541668ee276747, var_f70f72e84b51467b) {
    var_af79548fb29ebc00 = getent(var_44541668ee276747, var_f70f72e84b51467b);
    if (!isdefined(var_af79548fb29ebc00)) {
        assertmsg("trigger not found: " + var_44541668ee276747 + " key: " + var_f70f72e84b51467b);
        return;
    }
    var_4cd25328422b94ae = var_af79548fb29ebc00 waittill("trigger");
    level notify(var_44541668ee276747, var_4cd25328422b94ae);
    return var_4cd25328422b94ae;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ec6
// Size: 0x17
function trigger_wait_targetname(var_44541668ee276747) {
    return trigger_wait(var_44541668ee276747, "targetname");
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4ee6
// Size: 0x27
function set_flag_on_dead(spawners, var_e617a42386278bb6) {
    thread set_flag_on_func_wait_proc(spawners, var_e617a42386278bb6, &waittill_dead, "set_flag_on_dead");
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4f15
// Size: 0x27
function set_flag_on_dead_or_dying(spawners, var_e617a42386278bb6) {
    thread set_flag_on_func_wait_proc(spawners, var_e617a42386278bb6, &waittill_dead_or_dying, "set_flag_on_dead_or_dying");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f44
// Size: 0xb
function empty_func(var) {
    
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4f58
// Size: 0x53
function set_flag_on_spawned_ai_proc(system, var_bf0a2467af6b724b) {
    guy = self waittill("spawned");
    if (spawn_failed(guy)) {
        return;
    }
    system.ai[system.ai.size] = guy;
    ent_flag_set(var_bf0a2467af6b724b);
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4fb3
// Size: 0xfe
function set_flag_on_func_wait_proc(spawners, var_e617a42386278bb6, waitfunc, var_bf0a2467af6b724b) {
    system = spawnstruct();
    system.ai = [];
    assertex(spawners.size, "spawners is empty");
    foreach (key, spawn in spawners) {
        spawn ent_flag_init(var_bf0a2467af6b724b);
    }
    array_thread(spawners, &set_flag_on_spawned_ai_proc, system, var_bf0a2467af6b724b);
    foreach (spawn in spawners) {
        spawn ent_flag_wait(var_bf0a2467af6b724b);
    }
    [[ waitfunc ]](system.ai);
    flag_set(var_e617a42386278bb6);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x50b9
// Size: 0x3a
function set_flag_on_trigger(var_af79548fb29ebc00, var_e617a42386278bb6) {
    if (!flag(var_e617a42386278bb6)) {
        var_4cd25328422b94ae = var_af79548fb29ebc00 waittill("trigger");
        flag_set(var_e617a42386278bb6);
        return var_4cd25328422b94ae;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x50fb
// Size: 0x3c
function set_flag_on_targetname_trigger(msg) {
    if (flag(msg)) {
        return;
    }
    trigger = getent(msg, "targetname");
    trigger waittill("trigger");
    flag_set(msg);
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x513f
// Size: 0x175
function waittill_dead(guys, num, timeoutlength) {
    /#
        allalive = 1;
        foreach (member in guys) {
            if (isalive(member)) {
                continue;
            }
            allalive = 0;
            break;
        }
        assertex(allalive, "<dev string:x1c>");
        if (!allalive) {
            newarray = [];
            foreach (member in guys) {
                if (isalive(member)) {
                    newarray[newarray.size] = member;
                }
            }
            guys = newarray;
        }
    #/
    ent = spawnstruct();
    if (isdefined(timeoutlength)) {
        ent endon("thread_timed_out");
        ent thread waittill_dead_timeout(timeoutlength);
    }
    ent.count = guys.size;
    if (isdefined(num) && num < ent.count) {
        ent.count = num;
    }
    array_thread(guys, &waittill_dead_thread, ent);
    while (ent.count > 0) {
        ent waittill("waittill_dead guy died");
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x52bc
// Size: 0x10f
function waittill_dead_or_dying(guys, num, timeoutlength) {
    newarray = [];
    foreach (member in guys) {
        if (isalive(member) && !member.ignoreforfixednodesafecheck) {
            newarray[newarray.size] = member;
        }
    }
    guys = newarray;
    ent = spawnstruct();
    if (isdefined(timeoutlength)) {
        ent endon("thread_timed_out");
        ent thread waittill_dead_timeout(timeoutlength);
    }
    ent.count = guys.size;
    if (isdefined(num) && num < ent.count) {
        ent.count = num;
    }
    array_thread(guys, &waittill_dead_or_dying_thread, ent);
    while (ent.count > 0) {
        ent waittill("waittill_dead_guy_dead_or_dying");
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53d3
// Size: 0x24
function waittill_notetrack_or_damage(notetrack) {
    self endon("damage");
    self endon("death");
    self waittillmatch("single anim", notetrack);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x53ff
// Size: 0x51
function get_living_ai(name, type) {
    array = get_living_ai_array(name, type);
    if (array.size > 1) {
        assertmsg("get_living_ai used for more than one living ai of type " + type + " called " + name + ".");
        return undefined;
    }
    return array[0];
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5459
// Size: 0x132
function get_living_ai_array(name, type) {
    ai = getaispeciesarray("all", "all");
    array = [];
    foreach (actor in ai) {
        if (!isalive(actor)) {
            continue;
        }
        switch (type) {
        case #"hash_5a532485943b3d4b": 
            if (isdefined(actor.targetname) && actor.targetname == name) {
                array[array.size] = actor;
            }
            break;
        case #"hash_6d8a4db48060bf8": 
            if (isdefined(actor.script_noteworthy) && actor.script_noteworthy == name) {
                array[array.size] = actor;
            }
            break;
        case #"hash_a9ba80180b5bb733": 
            if (isdefined(actor.animname) && actor.animname == name) {
                array[array.size] = actor;
            }
            break;
        }
    }
    return array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5594
// Size: 0x63
function get_vehicle(name, type) {
    assert(isdefined(name));
    assert(isdefined(type));
    array = get_vehicle_array(name, type);
    if (!array.size) {
        return undefined;
    }
    assertex(array.size == 1, "tried to get_vehicle() on vehicles with key-pair: " + name + "," + type);
    return array[0];
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5600
// Size: 0xdb
function get_vehicle_array(name, type) {
    array = getentarray(name, type);
    vehicle = [];
    var_c274b6e0ea923011 = [];
    foreach (object in array) {
        if (object.code_classname != "script_vehicle") {
            continue;
        }
        var_c274b6e0ea923011[0] = object;
        if (isspawner(object)) {
            if (isdefined(object.last_spawned_vehicle)) {
                var_c274b6e0ea923011[0] = object.last_spawned_vehicle;
                vehicle = array_merge(vehicle, var_c274b6e0ea923011);
            }
            continue;
        }
        vehicle = array_merge(vehicle, var_c274b6e0ea923011);
    }
    return vehicle;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x56e4
// Size: 0x5a
function get_living_aispecies(name, type, var_a29c8a41c266f67d) {
    array = get_living_aispecies_array(name, type, var_a29c8a41c266f67d);
    if (array.size > 1) {
        assertmsg("get_living_aispecies used for more than one living ai of type " + type + " called " + name + ".");
        return undefined;
    }
    return array[0];
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5747
// Size: 0xf6
function get_living_aispecies_array(name, type, var_a29c8a41c266f67d) {
    if (!isdefined(var_a29c8a41c266f67d)) {
        var_a29c8a41c266f67d = "all";
    }
    ai = getaispeciesarray("allies", var_a29c8a41c266f67d);
    ai = array_combine(ai, getaispeciesarray("axis", var_a29c8a41c266f67d));
    array = [];
    for (i = 0; i < ai.size; i++) {
        switch (type) {
        case #"hash_5a532485943b3d4b": 
            if (isdefined(ai[i].targetname) && ai[i].targetname == name) {
                array[array.size] = ai[i];
            }
            break;
        case #"hash_6d8a4db48060bf8": 
            if (isdefined(ai[i].script_noteworthy) && ai[i].script_noteworthy == name) {
                array[array.size] = ai[i];
            }
            break;
        }
    }
    return array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5846
// Size: 0x9c
function gather_delay_proc(msg, delay) {
    if (isdefined(level.gather_delay[msg])) {
        if (level.gather_delay[msg]) {
            wait 0.05;
            if (isalive(self)) {
                self notify("gather_delay_finished" + msg + delay);
            }
            return;
        }
        level waittill(msg);
        if (isalive(self)) {
            self notify("gather_delay_finished" + msg + delay);
        }
        return;
    }
    level.gather_delay[msg] = 0;
    wait delay;
    level.gather_delay[msg] = 1;
    level notify(msg);
    if (isalive(self)) {
        self notify("gat    her_delay_finished" + msg + delay);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x58ea
// Size: 0x29
function gather_delay(msg, delay) {
    thread gather_delay_proc(msg, delay);
    self waittill("gather_delay_finished" + msg + delay);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x591b
// Size: 0x75
function getlinks_array(array, var_cd6d5de07f47fc51) {
    ents = [];
    for (j = 0; j < array.size; j++) {
        node = array[j];
        script_linkname = node.script_linkname;
        if (!isdefined(script_linkname)) {
            continue;
        }
        if (!isdefined(var_cd6d5de07f47fc51[script_linkname])) {
            continue;
        }
        ents[ents.size] = node;
    }
    return ents;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5999
// Size: 0xe8
function array_merge(array1, array2) {
    if (array1.size == 0) {
        return array2;
    }
    if (array2.size == 0) {
        return array1;
    }
    newarray = array1;
    foreach (var_3840497a74a156fa in array2) {
        var_31c64b5c5485bafc = 0;
        foreach (var_48d4ca1d57b450e7 in array1) {
            if (var_48d4ca1d57b450e7 == var_3840497a74a156fa) {
                var_31c64b5c5485bafc = 1;
                break;
            }
        }
        if (var_31c64b5c5485bafc) {
            continue;
        }
        newarray[newarray.size] = var_3840497a74a156fa;
    }
    return newarray;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5a8a
// Size: 0x7f
function array_compare(array1, array2) {
    if (array1.size != array2.size) {
        return false;
    }
    foreach (key, member in array1) {
        if (!isdefined(array2[key])) {
            return false;
        }
        var_8e35c2f9fd5ffb27 = array2[key];
        if (var_8e35c2f9fd5ffb27 != member) {
            return false;
        }
    }
    return true;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b12
// Size: 0x1a9
function deck_draw_specific(item, var_cca1a8591ddc8a23) {
    assertex(isstruct(self) && isdefined(self.items) && isdefined(self.index), "draw_from_deck_specific() must be called on a deck. Call create_deck()");
    deck = self;
    if (deck.items.size == 0) {
        return undefined;
    }
    if (deck.index >= deck.items.size) {
        if (deck.autoshuffle) {
            deck deck_shuffle();
        } else {
            deck.index = 0;
        }
    }
    foreach (item_index, var_9b5c4c307835273a in deck.items) {
        if (var_9b5c4c307835273a != item || !istrue(var_cca1a8591ddc8a23) && item_index < deck.index) {
            continue;
        }
        deck.last_drawn = deck.items[item_index];
        if (deck.autoshuffle) {
            deck.items[item_index] = deck.items[deck.index];
            deck.items[deck.index] = deck.last_drawn;
            deck.index++;
        } else {
            deck.index = item_index + 1;
        }
        return deck.last_drawn;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5cc3
// Size: 0x56
function refill_if_empty() {
    assertex(is_deck(self), "<dev string:x77>");
    deck = self;
    if (deck deck_is_empty()) {
        if (deck.autoshuffle) {
            deck deck_shuffle();
            return;
        }
        deck.index = 0;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d21
// Size: 0x2e
function deck_is_empty() {
    assertex(is_deck(self), "<dev string:xb6>");
    return self.index >= self.items.size;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d58
// Size: 0x31
function is_deck(object) {
    return isstruct(object) && isdefined(object.items) && isdefined(object.index);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d92
// Size: 0x8e
function getlinkedvehiclenodes() {
    array = [];
    if (isdefined(self.script_linkto)) {
        linknames = get_links();
        foreach (name in linknames) {
            entities = getvehiclenodearray(name, "script_linkname");
            array = array_combine(array, entities);
        }
    }
    return array;
}

/#

    // Namespace utility / scripts\engine\sp\utility
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x5e29
    // Size: 0x4a
    function draw_line(org1, org2, r, g, b) {
        while (true) {
            line(org1, org2, (r, g, b), 1);
            wait 0.05;
        }
    }

#/

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5e7b
// Size: 0x85
function draw_line_to_ent_for_time(org1, ent, r, g, b, timer) {
    timer = gettime() + timer * 1000;
    while (gettime() < timer) {
        /#
            line(org1, ent.origin, (r, g, b), 1);
        #/
        wait 0.05;
        if (!isdefined(ent) || !isdefined(ent.origin)) {
            return;
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5f08
// Size: 0x40
function draw_line_from_ent_for_time(ent, org, r, g, b, timer) {
    draw_line_to_ent_for_time(org, ent, r, g, b, timer);
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5f50
// Size: 0x86
function draw_line_from_ent_to_ent_for_time(ent1, ent2, r, g, b, timer) {
    ent1 endon("death");
    ent2 endon("death");
    timer = gettime() + timer * 1000;
    while (gettime() < timer) {
        /#
            line(ent1.origin, ent2.origin, (r, g, b), 1);
        #/
        wait 0.05;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x5fde
// Size: 0x99
function draw_line_from_ent_to_ent_until_notify(ent1, ent2, r, g, b, var_e332c90d19067e4d, notifystring) {
    assert(isdefined(var_e332c90d19067e4d));
    assert(isdefined(notifystring));
    ent1 endon("death");
    ent2 endon("death");
    var_e332c90d19067e4d endon(notifystring);
    /#
        while (true) {
            line(ent1.origin, ent2.origin, (r, g, b), 0.05);
            wait 0.05;
        }
    #/
}

// Namespace utility / scripts\engine\sp\utility
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x607f
// Size: 0x6e
function draw_line_until_notify(org1, org2, r, g, b, var_e332c90d19067e4d, notifystring) {
    assert(isdefined(var_e332c90d19067e4d));
    assert(isdefined(notifystring));
    var_e332c90d19067e4d endon(notifystring);
    while (true) {
        draw_line_for_time(org1, org2, r, g, b, 0.05);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x60f5
// Size: 0x9f
function draw_line_from_ent_to_vec_for_time(ent, vec, length, r, g, b, timer) {
    timer = gettime() + timer * 1000;
    vec *= length;
    while (gettime() < timer) {
        /#
            line(ent.origin, ent.origin + vec, (r, g, b), 1);
        #/
        wait 0.05;
        if (!isdefined(ent) || !isdefined(ent.origin)) {
            return;
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x619c
// Size: 0x105
function draw_circle_until_notify(center, radius, r, g, b, var_e332c90d19067e4d, notifystring) {
    circle_sides = 16;
    anglefrac = 360 / circle_sides;
    circlepoints = [];
    for (i = 0; i < circle_sides; i++) {
        angle = anglefrac * i;
        var_8a9f895755fd607e = cos(angle) * radius;
        var_d867033ab311670b = sin(angle) * radius;
        x = center[0] + var_8a9f895755fd607e;
        y = center[1] + var_d867033ab311670b;
        z = center[2];
        circlepoints[circlepoints.size] = (x, y, z);
    }
    thread draw_circle_lines_until_notify(circlepoints, r, g, b, var_e332c90d19067e4d, notifystring);
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x62a9
// Size: 0x90
function draw_circle_lines_until_notify(circlepoints, r, g, b, var_e332c90d19067e4d, notifystring) {
    for (i = 0; i < circlepoints.size; i++) {
        start = circlepoints[i];
        if (i + 1 >= circlepoints.size) {
            end = circlepoints[0];
        } else {
            end = circlepoints[i + 1];
        }
        thread draw_line_until_notify(start, end, r, g, b, var_e332c90d19067e4d, notifystring);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6341
// Size: 0x43
function battlechatter_off(team) {
    if (!isdefined(team)) {
        level.battlechatterdisabled = 1;
        return;
    }
    if (!isdefined(level.var_edce163bbab4f0ce)) {
        level.var_edce163bbab4f0ce = [];
    }
    level.var_edce163bbab4f0ce[team] = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x638c
// Size: 0x49
function battlechatter_on(team) {
    if (!isdefined(level.battlechatter)) {
        namespace_378f8281e2d12ced::init_battlechatter();
    }
    if (!isdefined(team)) {
        level.battlechatterdisabled = undefined;
        return;
    }
    if (isdefined(level.var_edce163bbab4f0ce)) {
        level.var_edce163bbab4f0ce[team] = undefined;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63dd
// Size: 0xb9
function battlechatter_commander_off(team) {
    if (team == "all") {
        setdvar(@"hash_702217ae066916b9", "all");
        return;
    }
    switch (getdvar(@"hash_702217ae066916b9")) {
    case #"": 
        setdvar(@"hash_702217ae066916b9", team);
        break;
    case #"hash_7c2d091e6337bf54": 
        if (team == "allies") {
            setdvar(@"hash_702217ae066916b9", "all");
        }
        break;
    case #"hash_5f54b9bf7583687f": 
        if (team == "axis") {
            setdvar(@"hash_702217ae066916b9", "all");
        }
        break;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x649e
// Size: 0xe8
function battlechatter_commander_on(team) {
    if (team == "all") {
        setdvar(@"hash_702217ae066916b9", "");
        return;
    }
    switch (getdvar(@"hash_702217ae066916b9")) {
    case #"hash_7c2d091e6337bf54": 
        if (team == "axis") {
            setdvar(@"hash_702217ae066916b9", "");
        }
        break;
    case #"hash_5f54b9bf7583687f": 
        if (team == "allies") {
            setdvar(@"hash_702217ae066916b9", "");
        }
        break;
    case #"hash_c482c6c109150a4": 
        if (team == "axis") {
            setdvar(@"hash_702217ae066916b9", "allies");
        } else if (team == "allies") {
            setdvar(@"hash_702217ae066916b9", "allies");
        }
        break;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x658e
// Size: 0xb9
function battlechatter_radioecho_off(team) {
    if (team == "all") {
        setdvar(@"hash_21778f568437cd09", "all");
        return;
    }
    switch (getdvar(@"hash_21778f568437cd09")) {
    case #"": 
        setdvar(@"hash_21778f568437cd09", team);
        break;
    case #"hash_7c2d091e6337bf54": 
        if (team == "allies") {
            setdvar(@"hash_21778f568437cd09", "all");
        }
        break;
    case #"hash_5f54b9bf7583687f": 
        if (team == "axis") {
            setdvar(@"hash_21778f568437cd09", "all");
        }
        break;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x664f
// Size: 0xe8
function battlechatter_radioecho_on(team) {
    if (team == "all") {
        setdvar(@"hash_21778f568437cd09", "");
        return;
    }
    switch (getdvar(@"hash_21778f568437cd09")) {
    case #"hash_7c2d091e6337bf54": 
        if (team == "axis") {
            setdvar(@"hash_21778f568437cd09", "");
        }
        break;
    case #"hash_5f54b9bf7583687f": 
        if (team == "allies") {
            setdvar(@"hash_21778f568437cd09", "");
        }
        break;
    case #"hash_c482c6c109150a4": 
        if (team == "axis") {
            setdvar(@"hash_21778f568437cd09", "allies");
        } else if (team == "allies") {
            setdvar(@"hash_21778f568437cd09", "axis");
        }
        break;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x673f
// Size: 0xb0
function battlechatter_otn_on(type, team) {
    assertex(isdefined(type), "No type defined.  Should be 'stealth' or 'combat'.");
    assertex(isdefined(team), "No team defined.  Should be 'axis', 'allies' or 'all'.");
    type = tolower(type);
    team = tolower(team);
    dvar = undefined;
    switch (type) {
    case #"hash_3d5f49f17b95335c": 
        dvar = @"hash_495535a4877b324d";
        break;
    case #"hash_9e02cd4a0f3ca981": 
        dvar = @"hash_87dca5163728ce02";
        break;
    default: 
        assertmsg("Incorrect type specified: " + type);
        break;
    }
    setdvar(dvar, team);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67f7
// Size: 0x94
function battlechatter_otn_off(type) {
    assertex(isdefined(type), "No type defined.  Should be 'stealth' or 'combat'.");
    type = tolower(type);
    dvar = undefined;
    switch (type) {
    case #"hash_3d5f49f17b95335c": 
        dvar = @"hash_495535a4877b324d";
        break;
    case #"hash_9e02cd4a0f3ca981": 
        dvar = @"hash_87dca5163728ce02";
        break;
    default: 
        assertmsg("Incorrect type specified: " + type);
        break;
    }
    setdvar(dvar, "off");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6893
// Size: 0x39
function battlechatter_probability(probability) {
    assertex(isdefined(self), "Must run this on an AI entity");
    assertex(isai(self), "Must run this on an AI entity");
    self.battlechatter_saytimescaled = probability;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x68d4
// Size: 0x77
function battlechatter_filter_on(type) {
    assertex(isdefined(self), "Must run this on an entity");
    if (!isarray(type)) {
        type = [type];
    }
    foreach (t in type) {
        battlechatter_filter_internal(t, 1);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6953
// Size: 0x76
function battlechatter_filter_off(type) {
    assertex(isdefined(self), "Must run this on an entity");
    if (!isarray(type)) {
        type = [type];
    }
    foreach (t in type) {
        battlechatter_filter_internal(t, undefined);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x69d1
// Size: 0x118
function battlechatter_filter_internal(type, toggle) {
    switch (type) {
    case #"hash_53dc45bfe25bbb01": 
        self.battlechatter.filterthreat = toggle;
        break;
    case #"hash_8c231c599933fd88": 
        self.battlechatter.filterinform = toggle;
        break;
    case #"hash_b9c0ff6cd406fe0f": 
        self.battlechatter.filtervehicle = toggle;
        break;
    case #"hash_92e2b89a2c37e077": 
        self.battlechatter.filterorder = toggle;
        break;
    case #"hash_19b7f63b88b6888a": 
        self.battlechatter.filterreaction = toggle;
        break;
    case #"hash_7f07e54152a6ce3e": 
        self.battlechatter.filterresponse = toggle;
        break;
    case #"hash_3d5f49f17b95335c": 
        self.battlechatter.filterstealth = toggle;
        break;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6af1
// Size: 0x3c
function battlechatter_friendlyfire_force(bool) {
    if (istrue(bool)) {
        self.battlechatter.friendlyfire_force = 1;
        return;
    }
    self.battlechatter.friendlyfire_force = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6b35
// Size: 0x53
function battlechatter_addvehicle(class) {
    assertex(isdefined(class), "Must defined a <class> for the vehicle, 'helicopter', 'vehicle', etc...");
    if (!isdefined(self.battlechatter)) {
        self.battlechatter = spawnstruct();
    }
    self.battlechatter.enemyclass = class;
    thread namespace_2fdc8e343bfb2334::aivehiclekillwaiter();
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6b90
// Size: 0xc8
function set_team_bcvoice(team, var_e1f5ba3e62ff8241) {
    if (!anim.chatinitialized) {
        return;
    }
    var_73caaf0ec409e8d1 = getarraykeys(anim.countryids);
    var_a3f20193b82b1467 = array_contains(var_73caaf0ec409e8d1, var_e1f5ba3e62ff8241);
    assertex(var_a3f20193b82b1467, "Tried to change ai's voice to " + var_e1f5ba3e62ff8241 + " but that voicetype is not supported!");
    if (!var_a3f20193b82b1467) {
        return;
    }
    allies = getaiarray(team);
    foreach (ai in allies) {
        ai set_ai_bcvoice(var_e1f5ba3e62ff8241);
        waitframe();
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c60
// Size: 0xa1
function set_ai_bcvoice(var_e1f5ba3e62ff8241) {
    var_73caaf0ec409e8d1 = getarraykeys(anim.countryids);
    var_a3f20193b82b1467 = array_contains(var_73caaf0ec409e8d1, var_e1f5ba3e62ff8241);
    assertex(var_a3f20193b82b1467, "Tried to change ai's voice to " + var_e1f5ba3e62ff8241 + " but that voicetype is not supported!");
    if (!var_a3f20193b82b1467) {
        return;
    }
    if (self.type == "dog") {
        return;
    }
    if (isdefined(self.battlechatter) && istrue(self.battlechatter.isspeaking)) {
        self waittill("done speaking");
        wait 0.1;
    }
    namespace_2fdc8e343bfb2334::setvoice(var_e1f5ba3e62ff8241);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d09
// Size: 0x16
function flavorbursts_on(team) {
    thread set_flavorbursts_team_state(1, team);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d27
// Size: 0x15
function flavorbursts_off(team) {
    thread set_flavorbursts_team_state(0, team);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6d44
// Size: 0x77
function set_flavorbursts_team_state(state, team) {
    if (!isdefined(team)) {
        team = "allies";
    }
    while (!isdefined(anim.chatinitialized)) {
        wait 0.05;
    }
    if (!anim.chatinitialized) {
        return;
    }
    wait 1.5;
    level.flavorbursts[team] = state;
    guys = [];
    guys = getaiarray(team);
    array_thread(guys, &set_flavorbursts, state);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6dc3
// Size: 0x15
function set_flavorbursts(state) {
    self.flavorbursts = state;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6de0
// Size: 0x74
function friendlyfire_warnings_off() {
    ais = getaiarray("allies");
    foreach (guy in ais) {
        if (isalive(guy)) {
            guy set_friendlyfire_warnings(0);
        }
    }
    level.friendlyfire_warnings = 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e5c
// Size: 0x76
function friendlyfire_warnings_on() {
    ais = getaiarray("allies");
    foreach (guy in ais) {
        if (isalive(guy)) {
            guy set_friendlyfire_warnings(1);
        }
    }
    level.friendlyfire_warnings = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6eda
// Size: 0x27
function set_friendlyfire_warnings(state) {
    if (state) {
        self.friendlyfire_warnings_disable = undefined;
        return;
    }
    self.friendlyfire_warnings_disable = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f09
// Size: 0xa
function player_battlechatter_on() {
    thread scripts\sp\player\playerchatter::player_battlechatter_on_thread();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f1b
// Size: 0xa
function player_battlechatter_off() {
    thread scripts\sp\player\playerchatter::player_battlechatter_off_thread();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f2d
// Size: 0x1f
function function_2a5c9a57cda3367b(name) {
    self.name = name;
    self.ainame = name;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f54
// Size: 0x1f
function set_rank(rank) {
    self.rank = rank;
    self.airank = rank;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f7b
// Size: 0x15
function function_ab35ae296c8f8609(callsign) {
    self.callsign = callsign;
}

/#

    // Namespace utility / scripts\engine\sp\utility
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6f98
    // Size: 0x115
    function debugorigin() {
        self notify("<dev string:xf3>");
        self endon("<dev string:xf3>");
        self endon("<dev string:x100>");
        for (;;) {
            forward = anglestoforward(self.angles);
            forwardfar = forward * 30;
            forwardclose = forward * 20;
            right = anglestoright(self.angles);
            left = right * -10;
            right *= 10;
            line(self.origin, self.origin + forwardfar, (0.9, 0.7, 0.6), 0.9);
            line(self.origin + forwardfar, self.origin + forwardclose + right, (0.9, 0.7, 0.6), 0.9);
            line(self.origin + forwardfar, self.origin + forwardclose + left, (0.9, 0.7, 0.6), 0.9);
            wait 0.05;
        }
    }

#/

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70b5
// Size: 0x38
function get_linked_struct() {
    array = get_linked_structs();
    if (!array.size) {
        return undefined;
    }
    assert(array.size == 1);
    assert(isdefined(array[0]));
    return array[0];
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70f6
// Size: 0x79
function get_last_ent_in_chain(var_512663d15f15351d) {
    var_fdd947d4b22c04a3 = self;
    cycles = 0;
    while (isdefined(var_fdd947d4b22c04a3.target)) {
        if (isdefined(var_fdd947d4b22c04a3.target)) {
            var_fdd947d4b22c04a3 = get_next_point_in_chain(var_512663d15f15351d, var_fdd947d4b22c04a3.target);
            cycles++;
            if (cycles == 10) {
                waitframe();
                cycles = 0;
            }
            continue;
        }
        break;
    }
    var_b503332fa2aa2168 = var_fdd947d4b22c04a3;
    return var_b503332fa2aa2168;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7178
// Size: 0x10f
function get_next_point_in_chain(var_512663d15f15351d, tname) {
    var_fdd947d4b22c04a3 = undefined;
    if (isdefined(var_512663d15f15351d)) {
        switch (var_512663d15f15351d) {
        case #"hash_73214da7c956e2af": 
            var_fdd947d4b22c04a3 = getvehiclenode(tname, "targetname");
            break;
        case #"hash_d2886253a54aa2e2": 
            var_fdd947d4b22c04a3 = getnode(tname, "targetname");
            break;
        case #"hash_ed49a46bfff900ba": 
            var_fdd947d4b22c04a3 = getent(tname, "targetname");
            break;
        case #"hash_961a09cded5ffc80": 
            var_fdd947d4b22c04a3 = getstruct(tname, "targetname");
            break;
        default: 
            assertmsg("sEntityType needs to be 'vehiclenode', 'pathnode', 'ent' or 'struct'");
            break;
        }
        return var_fdd947d4b22c04a3;
    } else {
        var_fdd947d4b22c04a3 = getstruct(tname, "targetname");
        if (isdefined(var_fdd947d4b22c04a3)) {
            return var_fdd947d4b22c04a3;
        }
        var_fdd947d4b22c04a3 = getnode(tname, "targetname");
        if (isdefined(var_fdd947d4b22c04a3)) {
            return var_fdd947d4b22c04a3;
        }
        var_fdd947d4b22c04a3 = getent(tname, "targetname");
        if (isdefined(var_fdd947d4b22c04a3)) {
            return var_fdd947d4b22c04a3;
        }
        var_fdd947d4b22c04a3 = getvehiclenode(tname, "targetname");
        if (isdefined(var_fdd947d4b22c04a3)) {
            return var_fdd947d4b22c04a3;
        }
    }
    return undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7290
// Size: 0x1c
function timeout(timeout) {
    self endon("death");
    wait timeout;
    self notify("timeout");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72b4
// Size: 0x65
function array_removedead_keepkeys(array) {
    newarray = [];
    keys = getarraykeys(array);
    for (i = 0; i < keys.size; i++) {
        key = keys[i];
        if (!isalive(array[key])) {
            continue;
        }
        newarray[key] = array[key];
    }
    return newarray;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7322
// Size: 0x49
function array_remove_nokeys(ents, remover) {
    newents = [];
    for (i = 0; i < ents.size; i++) {
        if (ents[i] != remover) {
            newents[newents.size] = ents[i];
        }
    }
    return newents;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7374
// Size: 0xd7
function array_remove_key_array(array, var_1011630871825fb8) {
    if (var_1011630871825fb8.size == 0) {
        return array;
    }
    newarray = [];
    foreach (key, item in array) {
        found = 0;
        foreach (var_b3e77f92460be011 in var_1011630871825fb8) {
            if (var_b3e77f92460be011 == key) {
                found = 1;
                break;
            }
        }
        if (found) {
            continue;
        }
        newarray[key] = item;
    }
    return newarray;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7454
// Size: 0x61
function array_notify(ents, var_b3d834019b5ea83f, match) {
    foreach (value in ents) {
        value notify(var_b3d834019b5ea83f, match);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74bd
// Size: 0x2d
function struct_arrayspawn() {
    struct = spawnstruct();
    struct.array = [];
    struct.lastindex = 0;
    return struct;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x74f3
// Size: 0x65
function structarray_add(struct, object) {
    assert(!isdefined(object.struct_array_index));
    struct.array[struct.lastindex] = object;
    object.struct_array_index = struct.lastindex;
    struct.lastindex++;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7560
// Size: 0x42
function structarray_remove(struct, object) {
    structarray_swaptolast(struct, object);
    struct.array[struct.lastindex - 1] = undefined;
    struct.lastindex--;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x75aa
// Size: 0xbc
function structarray_remove_index(struct, index) {
    if (isdefined(struct.array[struct.lastindex - 1])) {
        struct.array[index] = struct.array[struct.lastindex - 1];
        struct.array[index].struct_array_index = index;
        struct.array[struct.lastindex - 1] = undefined;
        struct.lastindex = struct.array.size;
        return;
    }
    struct.array[index] = undefined;
    structarray_remove_undefined(struct);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x766e
// Size: 0xe4
function structarray_remove_undefined(struct) {
    newarray = [];
    foreach (object in struct.array) {
        if (!isdefined(object)) {
            continue;
        }
        newarray[newarray.size] = object;
    }
    struct.array = newarray;
    foreach (object in struct.array) {
        object.struct_array_index = i;
    }
    struct.lastindex = struct.array.size;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x775a
// Size: 0x36
function structarray_swaptolast(struct, object) {
    struct structarray_swap(struct.array[struct.lastindex - 1], object);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7798
// Size: 0x5c
function structarray_shuffle(struct, shuffle) {
    for (i = 0; i < shuffle; i++) {
        struct structarray_swap(struct.array[i], struct.array[randomint(struct.lastindex)]);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x77fc
// Size: 0x12
function custom_battlechatter(phrase) {
    return namespace_2fdc8e343bfb2334::custom_battlechatter_internal(phrase);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7817
// Size: 0xdc
function get_stop_watch(time, var_44c5c34da5574d68) {
    watch = newhudelem();
    if (isplatformconsole()) {
        watch.x = 68;
        watch.y = 35;
    } else {
        watch.x = 58;
        watch.y = 95;
    }
    watch.alignx = "center";
    watch.aligny = "middle";
    watch.horzalign = "left";
    watch.vertalign = "middle";
    if (isdefined(var_44c5c34da5574d68)) {
        timer = var_44c5c34da5574d68;
    } else {
        timer = level.explosiveplanttime;
    }
    watch setclock(timer, time, "hudStopwatch", 64, 64);
    return watch;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x78fc
// Size: 0x3e
function set_mission_failed_override(func) {
    assertex(isdefined(func), "function handler not defined in call to add_mission_failed_override()");
    assertex(!isdefined(level.mission_fail_func), "mission failed override already exists.");
    level.mission_fail_func = func;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7942
// Size: 0x83
function get_force_color_guys(team, color) {
    ai = getaiarray(team);
    guys = [];
    for (i = 0; i < ai.size; i++) {
        guy = ai[i];
        if (!isdefined(guy.script_forcecolor)) {
            continue;
        }
        if (guy.script_forcecolor != color) {
            continue;
        }
        guys[guys.size] = guy;
    }
    return guys;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x79ce
// Size: 0x63
function get_all_force_color_friendlies() {
    ai = getaiarray("allies");
    guys = [];
    for (i = 0; i < ai.size; i++) {
        guy = ai[i];
        if (!isdefined(guy.script_forcecolor)) {
            continue;
        }
        guys[guys.size] = guy;
    }
    return guys;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a3a
// Size: 0x38
function enable_ai_color() {
    if (isdefined(self.script_forcecolor)) {
        return;
    }
    if (!isdefined(self.old_forcecolor)) {
        return;
    }
    set_force_color(self.old_forcecolor);
    self.old_forcecolor = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a7a
// Size: 0x14
function enable_ai_color_dontmove() {
    self.dontcolormove = 1;
    enable_ai_color();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a96
// Size: 0xc8
function disable_ai_color() {
    if (isdefined(self.new_force_color_being_set)) {
        self endon("death");
        self waittill("done_setting_new_color");
    }
    self clearfixednodesafevolume();
    if (!isdefined(self.script_forcecolor)) {
        return;
    }
    assertex(!isdefined(self.old_forcecolor), "Tried to disable forcecolor on a guy that somehow had a old_forcecolor already. Investigate!!!");
    self.old_forcecolor = self.script_forcecolor;
    level.arrays_of_colorforced_ai[scripts\sp\colors::get_team()][self.script_forcecolor] = array_remove(level.arrays_of_colorforced_ai[scripts\sp\colors::get_team()][self.script_forcecolor], self);
    scripts\sp\colors::left_color_node();
    self.script_forcecolor = undefined;
    self.currentcolorcode = undefined;
    /#
        update_debug_friendlycolor(self.unique_id);
    #/
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b66
// Size: 0x9
function clear_force_color() {
    disable_ai_color();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b77
// Size: 0x17
function get_force_color() {
    color = self.script_forcecolor;
    return color;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b97
// Size: 0x3c
function shortencolor(color) {
    assertex(isdefined(level.colorchecklist[tolower(color)]), "Tried to set force color on an undefined color: " + color);
    return level.colorchecklist[tolower(color)];
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7bdc
// Size: 0x16a
function set_force_color(_color) {
    color = shortencolor(_color);
    assertex(scripts\sp\colors::colorislegit(color), "Tried to set force color on an undefined color: " + color);
    if (!isai(self)) {
        set_force_color_spawner(color);
        return;
    }
    assertex(isalive(self), "Tried to set force color on a dead / undefined entity.");
    if (self.team == "allies") {
        self.fixednode = 1;
        self.fixednodesaferadius = 64;
        self.pathenemyfightdist = 0;
        self.pathenemylookahead = 0;
    }
    self.script_color_axis = undefined;
    self.script_color_allies = undefined;
    self.old_forcecolor = undefined;
    team = scripts\sp\colors::get_team();
    if (isdefined(self.script_forcecolor)) {
        level.arrays_of_colorforced_ai[team][self.script_forcecolor] = array_remove(level.arrays_of_colorforced_ai[team][self.script_forcecolor], self);
    }
    self.script_forcecolor = color;
    level.arrays_of_colorforced_ai[team][color] = array_removedead(level.arrays_of_colorforced_ai[team][color]);
    level.arrays_of_colorforced_ai[team][self.script_forcecolor] = array_add(level.arrays_of_colorforced_ai[team][self.script_forcecolor], self);
    thread new_color_being_set(color);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7d4e
// Size: 0x1f
function set_force_color_spawner(color) {
    self.script_forcecolor = color;
    self.old_forcecolor = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d75
// Size: 0x9
function restarteffect() {
    scripts\common\createfx::restart_fx_looper();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7d86
// Size: 0x78
function pauseexploder(num) {
    num += "";
    exploders = level.createfxexploders[num];
    if (isdefined(exploders)) {
        foreach (ent in exploders) {
            ent pauseeffect();
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e06
// Size: 0x78
function restartexploder(num) {
    num += "";
    exploders = level.createfxexploders[num];
    if (isdefined(exploders)) {
        foreach (ent in exploders) {
            ent restarteffect();
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e86
// Size: 0x266
function ignoreallenemies(var_c20fd24466dc43b8) {
    self notify("ignoreAllEnemies_threaded");
    self endon("ignoreAllEnemies_threaded");
    if (var_c20fd24466dc43b8) {
        self.old_threat_bias_group = self getthreatbiasgroup();
        num = undefined;
        /#
            num = self getentnum();
            println("<dev string:x106>" + num + "<dev string:x10f>");
            println("<dev string:x106>" + num + "<dev string:x125>" + self.old_threat_bias_group);
        #/
        createthreatbiasgroup("ignore_everybody");
        /#
            println("<dev string:x106>" + num + "<dev string:x10f>");
            println("<dev string:x106>" + num + "<dev string:x13a>");
        #/
        self setthreatbiasgroup("ignore_everybody");
        teams = [];
        teams["axis"] = "allies";
        teams["allies"] = "axis";
        assertex(self.team != "neutral", "Why are you making a guy have team neutral? And also, why is he doing anim_reach?");
        ai = getaiarray(teams[self.team]);
        groups = [];
        for (i = 0; i < ai.size; i++) {
            groups[ai[i] getthreatbiasgroup()] = 1;
        }
        keys = getarraykeys(groups);
        for (i = 0; i < keys.size; i++) {
            /#
                println("<dev string:x106>" + num + "<dev string:x10f>");
                println("<dev string:x106>" + num + "<dev string:x162>" + keys[i] + "<dev string:x173>");
            #/
            setthreatbias(keys[i], "ignore_everybody", 0);
        }
        return;
    }
    num = undefined;
    assertex(isdefined(self.old_threat_bias_group), "You can't use ignoreAllEnemies( false ) on an AI that has never ran ignoreAllEnemies( true )");
    /#
        num = self getentnum();
        println("<dev string:x106>" + num + "<dev string:x18b>");
        println("<dev string:x106>" + num + "<dev string:x1a2>" + self.old_threat_bias_group);
    #/
    if (self.old_threat_bias_group != "") {
        /#
            println("<dev string:x106>" + num + "<dev string:x18b>");
            println("<dev string:x106>" + num + "<dev string:x1c2>" + self.old_threat_bias_group + "<dev string:x1d8>");
        #/
        self setthreatbiasgroup(self.old_threat_bias_group);
    }
    self.old_threat_bias_group = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x80f4
// Size: 0x98
function add_start(msg, setup_func, var_32566017aa4406b, transient, catchup_function) {
    add_start_assert();
    msg = tolower(msg);
    assertex(!isstring(var_32566017aa4406b), "The loc_string parameter has been removed from add_start! Please remove that argument from your script!");
    array = add_start_construct(msg, setup_func, var_32566017aa4406b, transient, catchup_function);
    assertex(isdefined(setup_func), "add_start() called with no descriptions set and no func parameter..");
    level.start_functions[level.start_functions.size] = array;
    level.start_arrays[msg] = array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8194
// Size: 0x1a
function set_default_start(start) {
    level.default_start_override = tolower(start);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x81b6
// Size: 0x1a
function set_default_start_alt(start) {
    level.default_start_override_alt = tolower(start);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x81d8
// Size: 0x7e
function within_fov_of_players(end_origin, fov) {
    var_b17d99b17c3501ed = undefined;
    for (i = 0; i < level.players.size; i++) {
        playereye = level.players[i] geteye();
        var_b17d99b17c3501ed = within_fov(playereye, level.players[i] getplayerangles(), end_origin, fov);
        if (!var_b17d99b17c3501ed) {
            return false;
        }
    }
    return true;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x825f
// Size: 0x3c
function wait_for_buffer_time_to_pass(last_queue_time, buffer_time) {
    timer = buffer_time * 1000 - gettime() - last_queue_time;
    timer *= 0.001;
    if (timer > 0) {
        wait timer;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x82a3
// Size: 0x10
function bcs_scripted_dialogue_start() {
    anim.scripteddialoguestarttime = gettime();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x82bb
// Size: 0x1b
function dialogue_queue(msg) {
    bcs_scripted_dialogue_start();
    scripts\sp\anim::anim_single_queue(self, msg);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x82de
// Size: 0x26
function generic_dialogue_queue(msg, timeout) {
    bcs_scripted_dialogue_start();
    scripts\sp\anim::anim_generic_queue(self, msg, undefined, undefined, timeout);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x830c
// Size: 0x12c
function radio_dialogue(msg, timeout) {
    /#
        assertex(isdefined(level.scr_radio[msg]), "<dev string:x1db>" + msg + "<dev string:x1f9>");
        assertex(!issound3d(level.scr_radio[msg]), "<dev string:x228>" + msg + "<dev string:x242>");
    #/
    if (!isdefined(level.player_radio_emitter)) {
        ent = spawn("script_origin", (0, 0, 0));
        ent linkto(level.player, "", (0, 0, 0), (0, 0, 0));
        level.player_radio_emitter = ent;
    }
    bcs_scripted_dialogue_start();
    success = 0;
    if (!isdefined(timeout)) {
        success = level.player_radio_emitter function_stack(&playsoundontag, level.scr_radio[msg], undefined, 1);
    } else {
        success = level.player_radio_emitter function_stack_timeout(timeout, &playsoundontag, level.scr_radio[msg], undefined, 1);
    }
    return success;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8441
// Size: 0x63
function radio_dialogue_overlap(msg) {
    assertex(isdefined(level.scr_radio[msg]), "Tried to play radio dialogue " + msg + " that did not exist! Add it to level.scr_radio");
    assertex(isdefined(level.player_radio_emitter), "Tried to overlap dialogue but no radio dialogue was playing, use radio_dialogue.");
    level.player_radio_emitter play_sound_on_tag(level.scr_radio[msg], undefined, 1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x84ac
// Size: 0x1f
function radio_dialogue_stop() {
    if (!isdefined(level.player_radio_emitter)) {
        return;
    }
    level.player_radio_emitter delete();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x84d3
// Size: 0x20
function radio_dialogue_clear_stack() {
    if (!isdefined(level.player_radio_emitter)) {
        return;
    }
    level.player_radio_emitter function_stack_clear();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84fb
// Size: 0xb3
function radio_dialogue_interupt(msg) {
    assertex(isdefined(level.scr_radio[msg]), "Tried to play radio dialogue " + msg + " that did not exist! Add it to level.scr_radio");
    if (!isdefined(level.player_radio_emitter)) {
        ent = spawn("script_origin", (0, 0, 0));
        ent linkto(level.player, "", (0, 0, 0), (0, 0, 0));
        level.player_radio_emitter = ent;
    }
    level.player_radio_emitter play_sound_on_tag(level.scr_radio[msg], undefined, 1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x85b6
// Size: 0x17
function radio_dialogue_safe(msg) {
    return radio_dialogue(msg, 0.05);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x85d6
// Size: 0x24
function smart_radio_dialogue(dialogue, timeout) {
    add_to_radio(dialogue);
    radio_dialogue(dialogue, timeout);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8602
// Size: 0x22
function smart_radio_dialogue_interrupt(dialogue) {
    add_to_radio(dialogue);
    radio_dialogue_stop();
    radio_dialogue_interupt(dialogue);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x862c
// Size: 0x1b
function smart_radio_dialogue_overlap(dialogue) {
    add_to_radio(dialogue);
    radio_dialogue_overlap(dialogue);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x864f
// Size: 0x1f
function player_dialogue(msg, timeout) {
    return player_dialogue_gesture(msg, 0, undefined, undefined, undefined, timeout);
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x8677
// Size: 0x1e4
function _play_player_dialogue(alias, var_5f3c8cfe71ac11e7, gestures, var_90e92f9f64842594, var_539a0308b1cca14e) {
    if (is_dead_sentient()) {
        return;
    }
    org = spawn("script_origin", (0, 0, 0));
    org endon("death");
    org.origin = self.origin;
    org.angles = self.angles;
    org linkto(self);
    /#
        if (isdefined(level.player_dialogue_emitter) && self == level.player_dialogue_emitter) {
            println("<dev string:x255>" + alias);
        }
    #/
    if (var_5f3c8cfe71ac11e7 > 0) {
        org delaycall(var_5f3c8cfe71ac11e7, &playsound, alias, "sounddone");
    } else {
        org playsound(alias, "sounddone");
    }
    if (isdefined(gestures)) {
        assert(isdefined(var_90e92f9f64842594), "Tried to play player dialogue with gestures, but gestureDelays was not defined!");
        if (isarray(gestures)) {
            assertex(gestures.size == var_90e92f9f64842594.size, "Tried to play player dialogue but gestures and gestureDelays arrays were of different sizes!");
            for (i = 0; i < gestures.size; i++) {
                if (isdefined(var_539a0308b1cca14e) && isdefined(var_539a0308b1cca14e[i])) {
                    level.player delaythread(var_90e92f9f64842594[i], &player_gesture_force, gestures[i], var_539a0308b1cca14e[i]);
                    continue;
                }
                level.player delaythread(var_90e92f9f64842594[i], &player_gesture_force, gestures[i]);
            }
        } else if (isdefined(var_539a0308b1cca14e)) {
            level.player delaythread(var_90e92f9f64842594, &player_gesture_force, gestures, var_539a0308b1cca14e);
        } else {
            level.player delaythread(var_90e92f9f64842594, &player_gesture_force, gestures);
        }
    }
    if (var_5f3c8cfe71ac11e7 > 0) {
        wait var_5f3c8cfe71ac11e7;
    }
    if (!isdefined(wait_for_sounddone_or_death(org, level.player))) {
        org stopsounds();
    }
    wait 0.05;
    org delete();
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x8863
// Size: 0x12a
function player_dialogue_gesture(msg, var_5f3c8cfe71ac11e7, gestures, var_90e92f9f64842594, targetents, timeout) {
    assertex(isdefined(level.scr_plrdialogue[msg]), "Tried to play player dialogue " + msg + " that did not exist! Add it to level.scr_plrDialogue");
    if (!isdefined(level.player_dialogue_emitter)) {
        ent = spawn("script_origin", (0, 0, 0));
        ent linkto(level.player, "", (0, 0, 0), (0, 0, 0));
        level.player_dialogue_emitter = ent;
    }
    bcs_scripted_dialogue_start();
    success = 0;
    if (!isdefined(timeout)) {
        success = level.player_dialogue_emitter function_stack(&_play_player_dialogue, level.scr_plrdialogue[msg], var_5f3c8cfe71ac11e7, gestures, var_90e92f9f64842594, targetents);
    } else {
        success = level.player_dialogue_emitter function_stack_timeout(timeout, &_play_player_dialogue, level.scr_plrdialogue[msg], var_5f3c8cfe71ac11e7, gestures, var_90e92f9f64842594, targetents);
    }
    return success;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8996
// Size: 0x1f
function player_dialogue_stop() {
    if (!isdefined(level.player_dialogue_emitter)) {
        return;
    }
    level.player_dialogue_emitter delete();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x89bd
// Size: 0x20
function player_dialogue_clear_stack() {
    if (!isdefined(level.player_dialogue_emitter)) {
        return;
    }
    level.player_dialogue_emitter function_stack_clear();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x89e5
// Size: 0xb8
function player_dialogue_interrupt(msg) {
    assertex(isdefined(level.scr_plrdialogue[msg]), "Tried to play player dialogue " + msg + " that did not exist! Add it to level.scr_plrDialogue");
    player_dialogue_stop();
    if (!isdefined(level.player_dialogue_emitter)) {
        ent = spawn("script_origin", (0, 0, 0));
        ent linkto(level.player, "", (0, 0, 0), (0, 0, 0));
        level.player_dialogue_emitter = ent;
    }
    level.player_dialogue_emitter _play_player_dialogue(level.scr_plrdialogue[msg], 0);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8aa5
// Size: 0x24
function smart_player_dialogue(dialogue, timeout) {
    add_to_player_dialogue(dialogue);
    player_dialogue(dialogue, timeout);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8ad1
// Size: 0x1b
function smart_player_dialogue_interrupt(dialogue) {
    add_to_player_dialogue(dialogue);
    player_dialogue_interrupt(dialogue);
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x8af4
// Size: 0x48
function smart_player_dialogue_gesture(dialogue, var_5f3c8cfe71ac11e7, gestures, var_90e92f9f64842594, targetents, timeout) {
    add_to_player_dialogue(dialogue);
    player_dialogue_gesture(dialogue, var_5f3c8cfe71ac11e7, gestures, var_90e92f9f64842594, targetents, timeout);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8b44
// Size: 0x1b
function smart_dialogue(dialogue) {
    add_to_dialogue(dialogue);
    dialogue_queue(dialogue);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8b67
// Size: 0x1b
function smart_dialogue_generic(dialogue) {
    add_to_dialogue_generic(dialogue);
    generic_dialogue_queue(dialogue);
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8b8a
// Size: 0x26b
function function_77bcf02459f2ba7(dialogue, var_c5b2004cfe93f886, clearcurrent, maxlines) {
    if (!isdefined(maxlines) && isdefined(level.var_e45d4b8e1cc3925c)) {
        maxlines = level.var_e45d4b8e1cc3925c;
    }
    assert(!isdefined(maxlines) || maxlines >= 1, "Dialogue print max lines must be at least 1.");
    if (istrue(clearcurrent) && isdefined(level.dialoguehud) || isdefined(maxlines) && isdefined(level.dialoguehud) && level.dialoguehud.size >= maxlines) {
        dialogue_print_clear(1, maxlines - 1);
    }
    if (isplayer(self)) {
        color = "^3";
    } else if (isdefined(self.team)) {
        switch (self.team) {
        case #"hash_7c2d091e6337bf54": 
            color = "^1";
            break;
        case #"hash_5f54b9bf7583687f": 
            color = "^5";
            break;
        case #"hash_24b14065e10b1f8d": 
            color = "^4";
            break;
        default: 
            color = "^2";
            break;
        }
    } else {
        color = "^2";
    }
    print_str = "";
    if (isdefined(self.name)) {
        print_str += self.name;
    } else if (isplayer(self)) {
        print_str += "Player";
    } else if (isdefined(self.team)) {
        if (isdefined(level.var_76fed2ad3db8bb83) && isdefined(level.var_76fed2ad3db8bb83[self.team])) {
            print_str += level.var_76fed2ad3db8bb83[self.team];
        } else {
            switch (self.team) {
            case #"hash_7c2d091e6337bf54": 
                print_str += "Enemy";
                break;
            case #"hash_24b14065e10b1f8d": 
                print_str += "Team3";
                break;
            case #"hash_5f54b9bf7583687f": 
                print_str += "Friendly";
                break;
            default: 
                print_str += "Civ";
                break;
            }
        }
    }
    if (istrue(var_c5b2004cfe93f886)) {
        print_str += " Over Radio";
    }
    if (print_str != "") {
        print_str = color + print_str + ": ^7";
    }
    print_str += dialogue;
    thread function_ea8bbcc7fb7ae790(print_str);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8dfd
// Size: 0x543
function function_ea8bbcc7fb7ae790(string) {
    var_b54520c420443a7c = int(5.9);
    lineheight = int(10);
    var_7794fdd4649e6d7f = int(4);
    if (isdefined(level.var_eecd069bb8d057c5)) {
        endy = level.var_eecd069bb8d057c5;
    } else {
        endy = 425;
    }
    width = int(clamp(string.size * var_b54520c420443a7c, 350, 630));
    string_array = wrap_text(string, int(630 / var_b54520c420443a7c));
    height = lineheight * string_array.size + var_7794fdd4649e6d7f * 2;
    var_9a77f8c6fc5ac4a4 = [];
    foreach (i, string in string_array) {
        text = newhudelem();
        text.alpha = 0;
        text settext(string);
        text.fontscale = 1;
        text.row = i;
        text.y = 425;
        var_9a77f8c6fc5ac4a4[var_9a77f8c6fc5ac4a4.size] = text;
    }
    bg = newhudelem();
    bg.alpha = 0;
    bg setshader("black", width, height);
    bg.y = 425;
    if (isdefined(level.dialoguehud)) {
        foreach (var_a42acacca10b911d in level.dialoguehud) {
            foreach (hud in var_a42acacca10b911d) {
                hud moveovertime(0.1);
                hud.y -= height + 5;
            }
        }
    } else {
        level.dialoguehud = [];
    }
    array = array_add(var_9a77f8c6fc5ac4a4, bg);
    array[0] endon("dialogue_print_clear");
    level.dialoguehud[level.dialoguehud.size] = array;
    foreach (hud in array) {
        hud.alignx = "center";
        hud.aligny = "top";
        hud.x = 320;
        hud.y = 425;
        hud.sort = 5;
        if (isdefined(hud.row)) {
            hud.y += hud.row * lineheight + var_7794fdd4649e6d7f;
        }
    }
    endy -= height;
    foreach (hud in array) {
        hud fadeovertime(0.1);
        if (isdefined(hud.row)) {
            hud.alpha = 1;
        } else {
            hud.alpha = 0.5;
        }
        hud moveovertime(0.1);
        if (isdefined(hud.row)) {
            hud.y = endy + hud.row * lineheight + var_7794fdd4649e6d7f;
            continue;
        }
        hud.y = endy;
    }
    wait 2.1;
    foreach (hud in array) {
        hud fadeovertime(1);
        hud.alpha = 0;
    }
    wait 1;
    foreach (var_a42acacca10b911d in level.dialoguehud) {
        if (var_a42acacca10b911d[0] == array[0]) {
            level.dialoguehud = array_remove_index(level.dialoguehud, i, 0);
            break;
        }
    }
    if (!level.dialoguehud.size) {
        level.dialoguehud = undefined;
    }
    foreach (hud in array) {
        hud destroy();
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9348
// Size: 0x2b
function dialogue_print_clear(immediate, maxlines) {
    if (!isdefined(level.dialoguehud)) {
        return;
    }
    thread function_bbb6c68122529e12(immediate, maxlines);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x937b
// Size: 0x21e
function function_bbb6c68122529e12(immediate, maxlines) {
    if (!isdefined(maxlines)) {
        maxlines = 0;
    }
    linestoclear = [];
    currentlines = level.dialoguehud.size;
    for (i = 0; i < currentlines && currentlines - linestoclear.size > maxlines; i++) {
        level.dialoguehud[i][0] notify("dialogue_print_clear");
        linestoclear[linestoclear.size] = level.dialoguehud[i];
        level.dialoguehud = array_remove_index(level.dialoguehud, i, 1);
    }
    level.dialoguehud = array_combine(level.dialoguehud);
    if (!istrue(immediate)) {
        foreach (var_a42acacca10b911d in linestoclear) {
            foreach (hud in var_a42acacca10b911d) {
                if (hud.alpha > 0) {
                    hud fadeovertime(1);
                    hud.alpha = 0;
                }
            }
        }
        wait 1;
    }
    if (isdefined(level.dialoguehud) && !level.dialoguehud.size) {
        level.dialoguehud = undefined;
    }
    foreach (var_a42acacca10b911d in linestoclear) {
        foreach (hud in var_a42acacca10b911d) {
            if (isdefined(hud)) {
                hud destroy();
            }
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x95a1
// Size: 0x10b
function function_ddb9b7389886bcf2(y) {
    if (!isdefined(y)) {
        y = 425;
    }
    if (isdefined(level.dialoguehud)) {
        if (isdefined(level.var_eecd069bb8d057c5)) {
            var_baef87cc13a8c9df = level.var_eecd069bb8d057c5;
        } else {
            var_baef87cc13a8c9df = 425;
        }
        offset = y - var_baef87cc13a8c9df;
        foreach (var_a42acacca10b911d in level.dialoguehud) {
            foreach (hud in var_a42acacca10b911d) {
                hud.y += offset;
            }
        }
    }
    level.var_eecd069bb8d057c5 = y;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x96b4
// Size: 0xd4
function function_3deaf9fa976abf79(guy) {
    if (isdefined(level.battlechatter[guy.team]) && !istrue(level.battlechatter[guy.team])) {
        return;
    }
    level notify("dialogue_print_battlechatter");
    team = guy.team;
    waitframe();
    waittime = 3.1;
    if (isdefined(team)) {
        level battlechatter_off(team);
        level waittill_any_timeout(waittime, "dialogue_print_clear", "dialogue_print_battlechatter");
        level battlechatter_on(team);
        return;
    }
    if (isdefined(guy)) {
        guy endon("death");
        guy endon("entitydeleted");
        guy set_battlechatter(0);
        level waittill_any_timeout(waittime, "dialogue_print_clear", "dialogue_print_battlechatter");
        guy set_battlechatter(1);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9790
// Size: 0x13
function radio_dialogue_queue(msg) {
    radio_dialogue(msg);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x97ab
// Size: 0x7b
function ignoreeachother(group1, group2) {
    assertex(threatbiasgroupexists(group1), "Tried to make threatbias group " + group1 + " ignore " + group2 + " but " + group1 + " does not exist!");
    assertex(threatbiasgroupexists(group2), "Tried to make threatbias group " + group2 + " ignore " + group1 + " but " + group2 + " does not exist!");
    setignoremegroup(group1, group2);
    setignoremegroup(group2, group1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x982e
// Size: 0x8d
function add_global_spawn_function(team, function, param1, param2, param3) {
    assertex(isdefined(level.spawn_funcs), "Tried to add_global_spawn_function before calling _load");
    func = [];
    func["function"] = function;
    func["param1"] = param1;
    func["param2"] = param2;
    func["param3"] = param3;
    level.spawn_funcs[team][level.spawn_funcs[team].size] = func;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x98c3
// Size: 0x91
function remove_global_spawn_function(team, function) {
    assertex(isdefined(level.spawn_funcs), "Tried to remove_global_spawn_function before calling _load");
    array = [];
    for (i = 0; i < level.spawn_funcs[team].size; i++) {
        if (level.spawn_funcs[team][i]["function"] != function) {
            array[array.size] = level.spawn_funcs[team][i];
        }
    }
    level.spawn_funcs[team] = array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x995c
// Size: 0x61
function exists_global_spawn_function(team, function) {
    if (!isdefined(level.spawn_funcs)) {
        return false;
    }
    for (i = 0; i < level.spawn_funcs[team].size; i++) {
        if (level.spawn_funcs[team][i]["function"] == function) {
            return true;
        }
    }
    return false;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x99c6
// Size: 0xc0
function remove_spawn_function(function) {
    assertex(!isalive(self), "Tried to remove_spawn_function to a living guy.");
    assertex(isspawner(self), "Tried to remove_spawn_function to something that isn't a spawner.");
    assertex(isdefined(self.spawn_functions), "Tried to remove_spawn_function before calling _load");
    var_9590721335395c43 = [];
    foreach (var_8d40a831d76370f1 in self.spawn_functions) {
        if (var_8d40a831d76370f1["function"] == function) {
            continue;
        }
        var_9590721335395c43[var_9590721335395c43.size] = var_8d40a831d76370f1;
    }
    self.spawn_functions = var_9590721335395c43;
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x9a8e
// Size: 0x127
function add_spawn_function(function, param1, param2, param3, param4, param5) {
    assertex(!isalive(self), "Tried to add_spawn_function to a living guy.");
    assertex(isspawner(self), "Tried to add_spawn_function to something that isn't a spawner.");
    assertex(isdefined(self.spawn_functions), "Tried to add_spawn_function before calling _load");
    foreach (var_8d40a831d76370f1 in self.spawn_functions) {
        if (var_8d40a831d76370f1["function"] == function) {
            return;
        }
    }
    func = [];
    func["function"] = function;
    func["param1"] = param1;
    func["param2"] = param2;
    func["param3"] = param3;
    func["param4"] = param4;
    func["param5"] = param5;
    self.spawn_functions[self.spawn_functions.size] = func;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9bbd
// Size: 0x2d
function array_kill(array) {
    for (i = 0; i < array.size; i++) {
        array[i] kill();
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9bf2
// Size: 0x37
function ignore_triggers(timer) {
    self endon("death");
    self.ignoretriggers = 1;
    if (isdefined(timer)) {
        wait timer;
    } else {
        wait 0.5;
    }
    self.ignoretriggers = 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c31
// Size: 0x29
function activate_trigger_with_targetname(msg) {
    trigger = getent(msg, "targetname");
    trigger activate_trigger();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c62
// Size: 0x29
function activate_trigger_with_noteworthy(msg) {
    trigger = getent(msg, "script_noteworthy");
    trigger activate_trigger();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c93
// Size: 0x29
function disable_trigger_with_targetname(msg) {
    trigger = getent(msg, "targetname");
    trigger trigger_off();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9cc4
// Size: 0x29
function disable_trigger_with_noteworthy(msg) {
    trigger = getent(msg, "script_noteworthy");
    trigger trigger_off();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9cf5
// Size: 0x29
function enable_trigger_with_targetname(msg) {
    trigger = getent(msg, "targetname");
    trigger trigger_on();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9d26
// Size: 0x29
function enable_trigger_with_noteworthy(msg) {
    trigger = getent(msg, "script_noteworthy");
    trigger trigger_on();
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9d57
// Size: 0x4c
function set_team_pacifist(team, val) {
    ai = getaiarray(team);
    for (i = 0; i < ai.size; i++) {
        ai[i].pacifist = val;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9dab
// Size: 0x9
function replace_on_death() {
    scripts\sp\colors::colornode_replace_on_death();
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9dbc
// Size: 0x1c
function spawn_reinforcement(classname, color) {
    scripts\sp\colors::colornode_spawn_reinforcement(classname, color);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9de0
// Size: 0x60
function set_promotion_order(var_de7b6a1f9ef2afee, replacer) {
    if (!isdefined(level.current_color_order)) {
        level.current_color_order = [];
    }
    var_de7b6a1f9ef2afee = shortencolor(var_de7b6a1f9ef2afee);
    replacer = shortencolor(replacer);
    level.current_color_order[var_de7b6a1f9ef2afee] = replacer;
    if (!isdefined(level.current_color_order[replacer])) {
        set_empty_promotion_order(replacer);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9e48
// Size: 0x33
function set_empty_promotion_order(var_de7b6a1f9ef2afee) {
    if (!isdefined(level.current_color_order)) {
        level.current_color_order = [];
    }
    level.current_color_order[var_de7b6a1f9ef2afee] = "none";
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9e83
// Size: 0x72
function remove_color_from_array(array, color) {
    newarray = [];
    for (i = 0; i < array.size; i++) {
        guy = array[i];
        if (!isdefined(guy.script_forcecolor)) {
            continue;
        }
        if (guy.script_forcecolor == color) {
            continue;
        }
        newarray[newarray.size] = guy;
    }
    return newarray;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9efe
// Size: 0x72
function remove_noteworthy_from_array(array, noteworthy) {
    newarray = [];
    for (i = 0; i < array.size; i++) {
        guy = array[i];
        if (!isdefined(guy.script_noteworthy)) {
            continue;
        }
        if (guy.script_noteworthy == noteworthy) {
            continue;
        }
        newarray[newarray.size] = guy;
    }
    return newarray;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9f79
// Size: 0x5b
function get_closest_colored_friendly(color, origin) {
    allies = get_force_color_guys("allies", color);
    if (!isdefined(origin)) {
        var_30fe47a46e5a4479 = level.player.origin;
    } else {
        var_30fe47a46e5a4479 = origin;
    }
    return getclosest(var_30fe47a46e5a4479, allies);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9fdd
// Size: 0x5a
function remove_without_classname(array, classname) {
    newarray = [];
    for (i = 0; i < array.size; i++) {
        if (!issubstr(array[i].classname, classname)) {
            continue;
        }
        newarray[newarray.size] = array[i];
    }
    return newarray;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa040
// Size: 0x5a
function remove_without_model(array, model) {
    newarray = [];
    for (i = 0; i < array.size; i++) {
        if (!issubstr(array[i].model, model)) {
            continue;
        }
        newarray[newarray.size] = array[i];
    }
    return newarray;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa0a3
// Size: 0x6d
function get_closest_colored_friendly_with_classname(color, classname, origin) {
    allies = get_force_color_guys("allies", color);
    if (!isdefined(origin)) {
        var_30fe47a46e5a4479 = level.player.origin;
    } else {
        var_30fe47a46e5a4479 = origin;
    }
    allies = remove_without_classname(allies, classname);
    return getclosest(var_30fe47a46e5a4479, allies);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa119
// Size: 0x41
function promote_nearest_friendly(var_9024b7c85f6da81c, var_4f3679d48d415b9d) {
    for (;;) {
        friendly = get_closest_colored_friendly(var_9024b7c85f6da81c);
        if (!isalive(friendly)) {
            wait 1;
            continue;
        }
        friendly set_force_color(var_4f3679d48d415b9d);
        return;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa162
// Size: 0x57
function instantly_promote_nearest_friendly(var_9024b7c85f6da81c, var_4f3679d48d415b9d) {
    friendly = get_closest_colored_friendly(var_9024b7c85f6da81c);
    if (!isalive(friendly)) {
        assertex(0, "Instant promotion from " + var_9024b7c85f6da81c + " to " + var_4f3679d48d415b9d + " failed!");
        return;
    }
    friendly set_force_color(var_4f3679d48d415b9d);
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa1c5
// Size: 0x60
function instantly_promote_nearest_friendly_with_classname(var_9024b7c85f6da81c, var_4f3679d48d415b9d, classname) {
    friendly = get_closest_colored_friendly_with_classname(var_9024b7c85f6da81c, classname);
    if (!isalive(friendly)) {
        assertex(0, "Instant promotion from " + var_9024b7c85f6da81c + " to " + var_4f3679d48d415b9d + " failed!");
        return;
    }
    friendly set_force_color(var_4f3679d48d415b9d);
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa231
// Size: 0x4a
function promote_nearest_friendly_with_classname(var_9024b7c85f6da81c, var_4f3679d48d415b9d, classname) {
    for (;;) {
        friendly = get_closest_colored_friendly_with_classname(var_9024b7c85f6da81c, classname);
        if (!isalive(friendly)) {
            wait 1;
            continue;
        }
        friendly set_force_color(var_4f3679d48d415b9d);
        return;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa283
// Size: 0x8b
function instantly_set_color_from_array_with_classname(array, color, classname) {
    var_bd2749b7045b149e = 0;
    newarray = [];
    for (i = 0; i < array.size; i++) {
        guy = array[i];
        if (var_bd2749b7045b149e || !issubstr(guy.classname, classname)) {
            newarray[newarray.size] = guy;
            continue;
        }
        var_bd2749b7045b149e = 1;
        guy set_force_color(color);
    }
    return newarray;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa317
// Size: 0x6d
function instantly_set_color_from_array(array, color) {
    var_bd2749b7045b149e = 0;
    newarray = [];
    for (i = 0; i < array.size; i++) {
        guy = array[i];
        if (var_bd2749b7045b149e) {
            newarray[newarray.size] = guy;
            continue;
        }
        var_bd2749b7045b149e = 1;
        guy set_force_color(color);
    }
    return newarray;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa38d
// Size: 0x18
function wait_for_script_noteworthy_trigger(msg) {
    wait_for_trigger(msg, "script_noteworthy");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa3ad
// Size: 0x18
function wait_for_targetname_trigger(msg) {
    wait_for_trigger(msg, "targetname");
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa3cd
// Size: 0x23
function wait_for_flag_or_timeout(msg, timer) {
    if (flag(msg)) {
        return;
    }
    level endon(msg);
    wait timer;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa3f8
// Size: 0x18
function wait_for_notify_or_timeout(msg, timer) {
    self endon(msg);
    wait timer;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa418
// Size: 0x14
function wait_for_trigger_or_timeout(timer) {
    self endon("trigger");
    wait timer;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa434
// Size: 0x84
function wait_for_either_trigger(msg1, msg2) {
    ent = spawnstruct();
    array = [];
    array = array_combine(array, getentarray(msg1, "targetname"));
    array = array_combine(array, getentarray(msg2, "targetname"));
    for (i = 0; i < array.size; i++) {
        ent thread ent_waits_for_trigger(array[i]);
    }
    ent waittill("done");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa4c0
// Size: 0x29
function dronespawn_bodyonly(spawner) {
    drone = scripts\sp\spawner::spawner_dronespawn(spawner);
    assert(isdefined(drone));
    return drone;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa4f2
// Size: 0xa9
function fakeactorspawn(spawner) {
    if (!isdefined(spawner)) {
        spawner = self;
    }
    fakeactor = scripts\sp\spawner::spawner_dronespawn(spawner);
    assert(isdefined(fakeactor));
    fakeactor.spawn_funcs = spawner.spawn_functions;
    fakeactor.spawner = spawner;
    if (isdefined(spawner.script_nodrop)) {
        fakeactor.nodrop = spawner.script_nodrop;
    }
    if (isdefined(spawner.script_noragdoll)) {
        fakeactor.noragdoll = spawner.script_noragdoll;
    }
    fakeactor function_1fad0f895757885a();
    return fakeactor;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa5a4
// Size: 0x4e
function function_1fad0f895757885a(var_3a6fa490549f46d9) {
    assertex(isdefined(level.fakeactor_spawn_func), "level.fakeactor_spawn_func was not properly initialized.");
    self [[ level.fakeactor_spawn_func ]](var_3a6fa490549f46d9);
    self.spawn_functions = undefined;
    thread scripts\sp\spawner::run_spawn_functions();
    self.script_fakeactor = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa5fa
// Size: 0x54
function bodyonlyspawn(spawner) {
    var_19c864c6101b1f5b = scripts\sp\spawner::spawner_dronespawn(spawner);
    assert(isdefined(var_19c864c6101b1f5b));
    var_19c864c6101b1f5b.spawn_funcs = spawner.spawn_functions;
    var_19c864c6101b1f5b.spawn_functions = undefined;
    var_19c864c6101b1f5b thread scripts\sp\spawner::run_spawn_functions();
    return var_19c864c6101b1f5b;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa657
// Size: 0x81
function dronespawn(spawner) {
    if (!isdefined(spawner)) {
        spawner = self;
    }
    drone = scripts\sp\spawner::spawner_dronespawn(spawner);
    assert(isdefined(drone));
    assertex(isdefined(level.drone_spawn_func), "You need to put scriptsspdrone_civilian::init(); OR scriptsspdrone_ai::init(); in your level script! Use the civilian version if your drone is a civilian and the _ai version if it's a friendly or enemy.");
    drone [[ level.drone_spawn_func ]]();
    drone.spawn_funcs = spawner.spawn_functions;
    drone.spawn_functions = undefined;
    drone thread scripts\sp\spawner::run_spawn_functions();
    return drone;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa6e1
// Size: 0x75
function create_corpses() {
    corpses = getentarray("corpse", "script_noteworthy");
    if (corpses.size) {
        array_spawn_function(corpses, &init_corpse);
    }
    corpses = getentarray("corpse_noragdoll", "script_noteworthy");
    if (corpses.size) {
        array_spawn_function(corpses, &init_corpse);
    }
    corpses = get_spawner_array("corpse", "script_noteworthy");
    if (corpses.size) {
        array_spawn_function(corpses, &init_corpse);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa75e
// Size: 0x237
function init_corpse() {
    if (!isdefined(self.script_animation)) {
        assertmsg("You must define a script_animation for a corpse to work!");
        self delete();
        return;
    }
    self.animname = "corpse";
    self startusingheroonlylighting();
    if (isai(self)) {
        self.ignoreall = 1;
    } else {
        self notsolid();
    }
    if (isdefined(self.target)) {
        var_6031f28d78dedc3 = get_target_ent(self.target);
        self dontinterpolate();
        if (isai(self)) {
            self forceteleport(var_6031f28d78dedc3.origin, var_6031f28d78dedc3.angles);
        } else {
            self.origin = var_6031f28d78dedc3.origin;
            self.angles = var_6031f28d78dedc3.angles;
        }
    }
    weapon_model = getweaponmodel(self.weapon);
    if (isdefined(weapon_model) && weapon_model != "") {
        if (isai(self)) {
            gun_remove();
        }
        if (!isdefined(self.script_nodrop)) {
            gun = spawn("weapon_" + getcompleteweaponname(self.weapon), self gettagorigin("tag_weapon_right"));
            gun.angles = self gettagangles("tag_weapon_right");
        }
    }
    if (isai(self)) {
        if (self.script_noteworthy == "corpse_noragdoll") {
            self.noragdoll = 1;
        }
        set_deathanim(self.script_animation);
        self kill();
        return;
    }
    self animscripted("corpse_anim", self.origin, self.angles, getanim(self.script_animation), "deathplant", undefined, 0);
    if (self.script_noteworthy != "corpse_noragdoll") {
        var_80ae60f81a65a3d6 = getanimlength(getanim(self.script_animation));
        if (var_80ae60f81a65a3d6 > 0) {
            wait var_80ae60f81a65a3d6 * 0.35;
        }
        if (isdefined(self.fnpreragdoll)) {
            self [[ self.fnpreragdoll ]]();
        }
        self startragdoll();
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa99d
// Size: 0x4f
function get_trigger_flag() {
    if (isdefined(self.script_flag)) {
        return self.script_flag;
    }
    if (isdefined(self.script_noteworthy)) {
        return self.script_noteworthy;
    }
    assertex(0, "Flag trigger at " + self.origin + " has no script_flag set.");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa9f4
// Size: 0x18
function set_default_pathenemy_settings() {
    self.pathenemylookahead = 50;
    self.pathenemyfightdist = 192;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xaa14
// Size: 0xe2
function walk_and_talk(var_41e0c82e9f7aeb42, target, var_8e41959b7febe01) {
    if (var_41e0c82e9f7aeb42 == "on") {
        self._blackboard.walk_and_talk_requested = 1;
        if (isdefined(var_8e41959b7febe01)) {
            if (var_8e41959b7febe01 == "right") {
                self.walk_and_talk_hemisphere = "right";
            } else {
                assert(var_8e41959b7febe01 == "left");
                self.walk_and_talk_hemisphere = "left";
            }
        }
        if (!isdefined(target)) {
            self.walk_and_talk_target = level.player;
        } else {
            self.walk_and_talk_target = target;
            if (!isdefined(target.origin)) {
                assertmsg("Target passed into ai_walk_and_talk does not have an origin!");
            }
        }
        return;
    }
    assert(var_41e0c82e9f7aeb42 == "off");
    self._blackboard.walk_and_talk_requested = 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaafe
// Size: 0x5c
function enable_eight_point_strafe(isenabled) {
    if (self.type == "dog") {
        return;
    }
    if (isenabled) {
        self._blackboard.eight_point_strafe_requested = 1;
        return;
    }
    assert(isenabled == 0);
    self._blackboard.eight_point_strafe_requested = 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab62
// Size: 0xd
function enable_readystand() {
    self.busereadyidle = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab77
// Size: 0xc
function disable_readystand() {
    self.busereadyidle = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xab8b
// Size: 0x44
function cqb_aim(var_861348d15bdbe1c0) {
    if (!isdefined(var_861348d15bdbe1c0)) {
        self.var_6cd45c851740a435 = undefined;
        return;
    }
    self.var_6cd45c851740a435 = var_861348d15bdbe1c0;
    if (!isdefined(var_861348d15bdbe1c0.origin)) {
        assertmsg("target passed into cqb_aim does not have an origin!");
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xabd7
// Size: 0x61
function set_force_cover(val) {
    assertex(!isdefined(val) || val == 0 || val == 1, "invalid force cover set on guy");
    assertex(isalive(self), "Tried to set force cover on a dead guy");
    if (isdefined(val) && val) {
        self.forcesuppression = 1;
        return;
    }
    self.forcesuppression = 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xac40
// Size: 0x81
function first_touch(ent) {
    if (!isdefined(self.touched)) {
        self.touched = [];
    }
    assertex(isdefined(ent), "Ent is not defined!");
    assertex(isdefined(ent.unique_id), "Ent has no unique_id");
    if (isdefined(self.touched[ent.unique_id])) {
        return false;
    }
    self.touched[ent.unique_id] = 1;
    return true;
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xacca
// Size: 0xc3
function add_hint_string(name, string, var_4c4ab07dfd5327ff, var_28f8b27e22fcf9b5) {
    if (!isdefined(level.trigger_hint_string)) {
        level.trigger_hint_string = [];
        level.trigger_hint_func = [];
        level.var_f8ab4524d06cd18f = [];
    }
    assertex(isdefined(name), "Set a name for the hint string. This should be the same as the script_hint on the trigger_hint.");
    assertex(isdefined(string), "Set a string for the hint string. This is the string you want to appear when the trigger is hit.");
    assertex(!isdefined(level.trigger_hint_string[name]), "Tried to redefine hint " + name);
    level.trigger_hint_string[name] = string;
    precachestring(string);
    if (isdefined(var_4c4ab07dfd5327ff)) {
        level.trigger_hint_func[name] = var_4c4ab07dfd5327ff;
    }
    if (isdefined(var_28f8b27e22fcf9b5)) {
        level.var_f8ab4524d06cd18f[name] = var_28f8b27e22fcf9b5;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xad95
// Size: 0x26
function function_6c71a6be15e73611(name) {
    if (!isdefined(level.trigger_hint_string)) {
        return false;
    }
    return isdefined(level.trigger_hint_string[name]);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xadc4
// Size: 0x2f
function function_3acd0c97287b3c28(name, string) {
    if (!isdefined(level.trigger_hint_string)) {
        return 0;
    }
    level.trigger_hint_string[name] = string;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xadfb
// Size: 0x25
function clearthreatbias(group1, group2) {
    setthreatbias(group1, group2, 0);
    setthreatbias(group2, group1, 0);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae28
// Size: 0x15
function set_ignoresuppression(val) {
    self.ignoresuppression = val;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae45
// Size: 0x15
function set_goalradius(radius) {
    self.goalradius = radius;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae62
// Size: 0x15
function function_863020915099aafe(boolean) {
    self.var_9a320501108844bd = boolean;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae7f
// Size: 0x15
function set_allowdeath(val) {
    self.allowdeath = val;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xae9c
// Size: 0x96
function set_run_anim(anime, alwaysrunforward) {
    assertex(isdefined(anime), "Tried to set run anim but didn't specify which animation to ues");
    assertex(isdefined(self.animname), "Tried to set run anim on a guy that had no anim name");
    assertex(isdefined(level.scr_anim[self.animname][anime]), "Tried to set run anim but the anim was not defined in the maps _anim file");
    demeanor = "combat";
    set_move_anim(demeanor, anime);
    self.run_overrideanim = level.scr_anim[self.animname][anime];
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaf3a
// Size: 0x81
function set_move_anim(demeanor, anime) {
    assertex(isdefined(anime), "Tried to set move anim but didn't specify which animation to ues");
    assertex(isdefined(self.animname), "Tried to set move anim on a guy that had no anim name");
    assertex(isdefined(level.scr_anim[self.animname][anime]), "Tried to set move anim but the anim was not defined in the maps _anim file");
    asm_setdemeanoranimoverride(demeanor, "move", level.scr_anim[self.animname][anime]);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xafc3
// Size: 0x18
function clear_move_anim(demeanor) {
    asm_cleardemeanoranimoverride(demeanor, "move");
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xafe3
// Size: 0x81
function set_idle_anim(demeanor, anime) {
    assertex(isdefined(anime), "Tried to set idle anim but didn't specify which animation to ues");
    assertex(isdefined(self.animname), "Tried to set idle anim on a guy that had no anim name");
    assertex(isdefined(level.scr_anim[self.animname][anime]), "Tried to set idle anim but the anim was not defined in the maps _anim file");
    asm_setdemeanoranimoverride(demeanor, "idle", level.scr_anim[self.animname][anime]);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb06c
// Size: 0x18
function clear_idle_anim(demeanor) {
    asm_cleardemeanoranimoverride(demeanor, "idle");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb08c
// Size: 0x54
function set_dog_walk_anim() {
    assertex(self.type == "dog");
    self.a.movement = "walk";
    self.disablearrivals = 1;
    self.disableexits = 1;
    self.script_nobark = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb0e8
// Size: 0x52
function set_arrival_speed(factor) {
    if (!isdefined(factor)) {
        factor = 1;
    }
    if (isdefined(self.asm.arrivalspeed)) {
        self.asm.arrivalspeed = factor;
        return;
    }
    assertmsg("Entity does not have an arrival speed defined in it's init");
    return;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb142
// Size: 0x2f
function clear_arrival_speed() {
    if (isdefined(self.asm.arrivalspeed)) {
        self.asm.arrivalspeed = 1;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb179
// Size: 0x5a
function override_move_with_purpose(demeanor) {
    assert(isai(self));
    var_af1883b223cb5d63 = asm_lookupanimfromalias("move_walk_loop", "casual_purpose");
    asm_setdemeanoranimoverride(demeanor, "move", var_af1883b223cb5d63);
    if (demeanor == "casual") {
        thread set_arrival_speed(1.15);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb1db
// Size: 0x18
function clear_move_with_purpose() {
    thread clear_move_anim(scripts\asm\asm::asm_getdemeanor());
    thread clear_arrival_speed();
}

/#

    // Namespace utility / scripts\engine\sp\utility
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xb1fb
    // Size: 0x19
    function set_generic_idle_anim(anime) {
        assertmsg("this function is no longer supported.  please use set_idle_anim.");
    }

#/

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb21c
// Size: 0x14
function clear_generic_idle_anim() {
    self.specialidleanim = undefined;
    self notify("stop_specialidle");
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb238
// Size: 0x1d
function set_generic_run_anim(anime, alwaysrunforward) {
    set_generic_run_anim_array(anime, undefined, alwaysrunforward);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb25d
// Size: 0x25
function clear_generic_run_anim() {
    self notify("movemode");
    enable_turnanims();
    self.run_overrideanim = undefined;
    self.walk_overrideanim = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb28a
// Size: 0x1a7
function set_generic_run_anim_array(anime, weights, alwaysrunforward) {
    assertex(isdefined(anime), "Tried to set generic run anim but didn't specify which animation to ues");
    assertex(isdefined(level.scr_anim["generic"][anime]), "Tried to set generic run anim but the anim was not defined in the maps _anim file");
    assertex(!isdefined(weights) || isdefined(level.scr_anim["generic"][weights]), "weights needs to be a valid entry in level.scr_anim");
    assertex(!isdefined(weights) || isarray(level.scr_anim["generic"][weights]), "weights needs to be an array of animation weights (ascending order)");
    assertex(isarray(level.scr_anim["generic"][anime]) || !isdefined(weights), "its not valid to pass in a weights param and not an array of anims to run");
    assertex(!isdefined(weights) || level.scr_anim["generic"][weights].size == level.scr_anim["generic"][anime].size, "the weights array must equal the size of the anims array");
    self notify("movemode");
    if (!isdefined(alwaysrunforward) || alwaysrunforward) {
        self.alwaysrunforward = 1;
    } else {
        self.alwaysrunforward = undefined;
    }
    disable_turnanims();
    self.run_overrideanim = level.scr_anim["generic"][anime];
    self.walk_overrideanim = self.run_overrideanim;
    if (isdefined(weights)) {
        self.run_override_weights = level.scr_anim["generic"][weights];
        self.walk_override_weights = self.run_override_weights;
        return;
    }
    self.run_override_weights = undefined;
    self.walk_override_weights = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb439
// Size: 0x115
function set_run_anim_array(anime, weights, alwaysrunforward) {
    assertex(isdefined(anime), "Tried to set generic run anim but didn't specify which animation to ues");
    assertex(isdefined(self.animname), "Tried to set run anim on a guy that had no anim name");
    assertex(isdefined(level.scr_anim[self.animname][anime]), "Tried to set run anim but the anim was not defined in the maps _anim file");
    self notify("movemode");
    if (!isdefined(alwaysrunforward) || alwaysrunforward) {
        self.alwaysrunforward = 1;
    } else {
        self.alwaysrunforward = undefined;
    }
    disable_turnanims();
    self.run_overrideanim = level.scr_anim[self.animname][anime];
    self.walk_overrideanim = self.run_overrideanim;
    if (isdefined(weights)) {
        self.run_override_weights = level.scr_anim[self.animname][weights];
        self.walk_override_weights = self.run_override_weights;
        return;
    }
    self.run_override_weights = undefined;
    self.walk_override_weights = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb556
// Size: 0x89
function clear_run_anim() {
    self notify("clear_run_anim");
    self notify("movemode");
    if (self.type == "dog") {
        self.a.movement = "run";
        self.disablearrivals = 0;
        self.disableexits = 0;
        self.script_nobark = undefined;
        return;
    }
    demeanor = "combat";
    self.allowstrafe = 1;
    clear_move_anim(demeanor);
    self.run_overrideanim = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb5e7
// Size: 0x154
function physicsjolt_proximity(outer_radius, inner_radius, force) {
    self endon("death");
    self endon("stop_physicsjolt");
    if (!isdefined(outer_radius) || !isdefined(inner_radius) || !isdefined(force)) {
        outer_radius = 400;
        inner_radius = 256;
        force = (0, 0, 0.075);
    }
    var_c48d66ae325c0f13 = outer_radius * outer_radius;
    var_ae3425896251f3b3 = 3;
    var_3f13e00c5dc00ff8 = force;
    while (true) {
        wait 0.1;
        force = var_3f13e00c5dc00ff8;
        if (self.code_classname == "script_vehicle") {
            speed = self vehicle_getspeed();
            if (speed < var_ae3425896251f3b3) {
                scale = speed / var_ae3425896251f3b3;
                force = var_3f13e00c5dc00ff8 * scale;
            }
        }
        dist = distancesquared(self.origin, level.player.origin);
        scale = var_c48d66ae325c0f13 / dist;
        if (scale > 1) {
            scale = 1;
        }
        force *= scale;
        var_4c8bb7822373f21 = force[0] + force[1] + force[2];
        if (var_4c8bb7822373f21 > 0.025) {
            physicsjitter(self.origin, outer_radius, inner_radius, force[2], force[2] * 2);
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb743
// Size: 0x13
function set_goal_entity(ent) {
    self setgoalentity(ent);
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb75e
// Size: 0x65
function activate_trigger(name, type, var_2d9552508615d396) {
    if (!isdefined(name)) {
        activate_trigger_process(var_2d9552508615d396);
        return;
    }
    trigs = getentarray(name, type);
    assertex(trigs.size, "No trigger(s) with kvp: " + type + ", " + name);
    array_thread(trigs, &activate_trigger_process, var_2d9552508615d396);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb7cb
// Size: 0x75
function activate_trigger_process(var_2d9552508615d396) {
    assertex(!isdefined(self.trigger_off), "Tried to activate trigger that is OFF( either from trigger_off or from flags set on it through shift - G menu");
    if (isdefined(self.script_color_allies)) {
        self.activated_color_trigger = 1;
        scripts\sp\colors::activate_color_trigger("allies");
    }
    if (isdefined(self.script_color_axis)) {
        self.activated_color_trigger = 1;
        scripts\sp\colors::activate_color_trigger("axis");
    }
    self notify("trigger", var_2d9552508615d396);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb848
// Size: 0x9
function self_delete() {
    self delete();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb859
// Size: 0x42
function has_color() {
    if (scripts\sp\colors::get_team() == "axis") {
        return (isdefined(self.script_color_axis) || isdefined(self.script_forcecolor));
    }
    return isdefined(self.script_color_allies) || isdefined(self.script_forcecolor);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb8a4
// Size: 0x1a
function clear_colors() {
    clear_team_colors("axis");
    clear_team_colors("allies");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb8c6
// Size: 0x82
function clear_team_colors(team) {
    level.currentcolorforced[team]["r"] = undefined;
    level.currentcolorforced[team]["b"] = undefined;
    level.currentcolorforced[team]["c"] = undefined;
    level.currentcolorforced[team]["y"] = undefined;
    level.currentcolorforced[team]["p"] = undefined;
    level.currentcolorforced[team]["o"] = undefined;
    level.currentcolorforced[team]["g"] = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb950
// Size: 0x4d
function notify_delay(snotifystring, fdelay) {
    assert(isdefined(self));
    assert(isdefined(snotifystring));
    assert(isdefined(fdelay));
    self endon("death");
    if (fdelay > 0) {
        wait fdelay;
    }
    if (!isdefined(self)) {
        return;
    }
    self notify(snotifystring);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb9a5
// Size: 0x6d
function name_hide() {
    assertex(isai(self), "Calling on non AI");
    if (!isdefined(self.name)) {
        return;
    }
    self.og_name = self.name;
    self.name = undefined;
    if (isdefined(self.callsign)) {
        self.og_callsign = self.callsign;
        self.callsign = "";
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xba1a
// Size: 0x5f
function name_show() {
    assertex(isai(self), "Calling on non AI");
    assertex(isdefined(self.og_name), "self.og_name is not defined, use name_hide() to first hide the name ");
    self.name = self.og_name;
    if (isdefined(self.og_callsign)) {
        self.callsign = self.og_callsign;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xba81
// Size: 0x4c
function place_weapon_on(objweapon, location) {
    assert(isai(self));
    assert(isweapon(objweapon));
    if (!aihasweapon(objweapon)) {
        initweapon(objweapon);
    }
    namespace_223959d3e5206cfb::placeweaponon(objweapon, location);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbad5
// Size: 0x53
function player_moves(dist) {
    org = level.player.origin;
    for (;;) {
        if (distance(org, level.player.origin) > dist) {
            break;
        }
        wait 0.05;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xbb30
// Size: 0x51
function waittill_either_function(func1, parm1, func2, parm2) {
    ent = spawnstruct();
    thread waittill_either_function_internal(ent, func1, parm1);
    thread waittill_either_function_internal(ent, func2, parm2);
    ent waittill("done");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbb89
// Size: 0xf
function waittill_msg(msg) {
    self waittill(msg);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbba0
// Size: 0x1c
function in_realism_mode() {
    return isdefined(level.gameskill) && level.gameskill == 4;
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xbbc5
// Size: 0x64
function display_hint(hint, timeout, delay, endonentities, var_f63c23b8ec55b127) {
    if (in_realism_mode() || function_63171981a45b3ad8()) {
        return;
    }
    assertex(isdefined(level.trigger_hint_string), "tried display_hint without add_trigger_hint");
    thread display_hint_proc(hint, timeout, delay, endonentities, var_f63c23b8ec55b127);
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xbc31
// Size: 0x50
function display_hint_forced(hint, timeout, delay, endonentities, var_f63c23b8ec55b127) {
    assertex(isdefined(level.trigger_hint_string), "tried display_hint without add_trigger_hint");
    thread display_hint_proc(hint, timeout, delay, endonentities, var_f63c23b8ec55b127);
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xbc89
// Size: 0x1b6
function display_hint_proc(hint, timeout, delay, endonentities, var_f63c23b8ec55b127) {
    if (isdefined(endonentities) && isdefined(var_f63c23b8ec55b127)) {
        if (!isarray(endonentities)) {
            endonentities = [endonentities];
        }
        if (!isarray(var_f63c23b8ec55b127)) {
            var_f63c23b8ec55b127 = [var_f63c23b8ec55b127];
        }
        foreach (entity in endonentities) {
            foreach (message in var_f63c23b8ec55b127) {
                entity endon(message);
            }
        }
    }
    player = get_player_from_self();
    player endon("new_hint");
    if (isdefined(level.trigger_hint_func[hint])) {
        player endon("hint_function_cancel");
        player childthread display_hint_function_cancel_logic(level.trigger_hint_func[hint]);
    }
    if (istrue(delay)) {
        wait delay;
    }
    if (isdefined(level.trigger_hint_func[hint])) {
        if (player [[ level.trigger_hint_func[hint] ]]()) {
            return;
        }
        player thread hintprint(level.trigger_hint_string[hint], level.trigger_hint_func[hint], timeout, undefined, level.var_f8ab4524d06cd18f[hint], endonentities, var_f63c23b8ec55b127);
        return;
    }
    player thread hintprint(level.trigger_hint_string[hint], undefined, timeout, undefined, level.var_f8ab4524d06cd18f[hint], endonentities, var_f63c23b8ec55b127);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbe47
// Size: 0x22
function display_hint_function_cancel_logic(function) {
    while (true) {
        if ([[ function ]]()) {
            self notify("hint_function_cancel");
        }
        waitframe();
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbe71
// Size: 0x44
function getgenericanim(anime) {
    assertex(isdefined(level.scr_anim["generic"][anime]), "Generic anim " + anime + " was not defined in your _anim file.");
    return level.scr_anim["generic"][anime];
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbebe
// Size: 0x21
function enable_careful() {
    assertex(isai(self), "Tried to make an ai careful but it wasn't called on an AI");
    self.script_careful = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbee7
// Size: 0x28
function disable_careful() {
    assertex(isai(self), "Tried to unmake an ai careful but it wasn't called on an AI");
    self.script_careful = 0;
    self notify("stop_being_careful");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf17
// Size: 0x2d
function enable_sprint() {
    assertex(isai(self), "Tried to make an ai sprint but it wasn't called on an AI");
    self.sprint = 1;
    demeanor_override("sprint");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf4c
// Size: 0x27
function disable_sprint() {
    assertex(isai(self), "Tried to unmake an ai sprint but it wasn't called on an AI");
    self.sprint = undefined;
    clear_demeanor_override();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf7b
// Size: 0xd
function disable_bulletwhizbyreaction() {
    self.disablebulletwhizbyreaction = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf90
// Size: 0xc
function enable_bulletwhizbyreaction() {
    self.disablebulletwhizbyreaction = 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbfa4
// Size: 0xd
function set_fixednode_true() {
    self.fixednode = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbfb9
// Size: 0xc
function set_fixednode_false() {
    self.fixednode = 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xbfcd
// Size: 0x9d
function spawn_aitype(aitype, origin, angles, forcespawn, perfectenemyinfo, var_75c15e716113c51b, targetname) {
    if (!isdefined(forcespawn)) {
        forcespawn = 0;
    }
    if (!isdefined(perfectenemyinfo)) {
        perfectenemyinfo = 0;
    }
    if (!isdefined(var_75c15e716113c51b)) {
        var_75c15e716113c51b = 1;
    }
    spawned = dospawnaitype(aitype, origin, angles, forcespawn, perfectenemyinfo, var_75c15e716113c51b);
    if (isalive(spawned)) {
        if (isdefined(targetname)) {
            spawned.targetname = targetname;
        }
        spawned thread scripts\sp\spawner::spawn_think();
        if (!spawn_failed(spawned)) {
            return spawned;
        }
    }
    return undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc073
// Size: 0x58f
function spawn_ai(forcespawn, var_201eb40916a10809) {
    if (isdefined(self.script_delay_spawn)) {
        self endon("death");
        wait self.script_delay_spawn;
    }
    var_3bb35a1b2c0bf0a8 = undefined;
    var_75c15e716113c51b = isdefined(self.script_stealthgroup) && flag("stealth_enabled") && !flag("stealth_spotted");
    var_7208fc96ea182f6 = 0;
    if (isdefined(self.script_suspend)) {
        var_7208fc96ea182f6 = scripts\sp\spawner::prespawn_suspended_ai();
        if (self.count == 0 && !var_7208fc96ea182f6) {
            return undefined;
        }
    }
    var_580c2eaf7e445d19 = 0;
    var_32a16e8a7495d3 = 0;
    if (isdefined(self.script_drone)) {
        spawned = dronespawn(self);
    } else if (istrue(self.script_fakeactor)) {
        spawned = fakeactorspawn(self);
    } else if (isdefined(self.script_bodyonly)) {
        spawned = bodyonlyspawn(self);
    } else {
        var_580c2eaf7e445d19 = 1;
        if (isdefined(self.script_forcespawn) || istrue(forcespawn)) {
            spawned = self stalingradspawn(var_75c15e716113c51b);
            var_32a16e8a7495d3 = 1;
        } else if (isdefined(self.script_forcespawndist) && distancesquared(self.origin, level.player.origin) > squared(self.script_forcespawndist)) {
            spawned = self stalingradspawn(var_75c15e716113c51b);
            var_32a16e8a7495d3 = 1;
        } else {
            spawned = self dospawn(var_75c15e716113c51b);
        }
    }
    if (var_580c2eaf7e445d19) {
        if (isdefined(var_201eb40916a10809) && var_201eb40916a10809 && isalive(spawned)) {
            spawned magic_bullet_shield();
        }
        if (spawn_failed(spawned)) {
            assertex(!(var_7208fc96ea182f6 && isdefined(self.script_aigroup)), "Spawner @ " + self.origin + " cannot be suspended and have a .script_aigroup");
            if (!var_7208fc96ea182f6 && isdefined(self.script_aigroup)) {
                scripts\sp\spawner::aigroup_decrement(level._ai_group[self.script_aigroup]);
            }
            if (var_7208fc96ea182f6) {
                self.count--;
                if (!isdefined(self.try_og_origin)) {
                    /#
                        if (getunarchiveddebugdvar(@"hash_38a088b03f78dca1") == "<dev string:x275>") {
                            print3d(self.origin, "<dev string:x277>", (0.8, 0.8, 0.2), 1, 0.5, 200);
                            line(level.player.origin, self.origin, (0.8, 0.8, 0.2), 1, 0, 200);
                        }
                    #/
                    self.try_og_origin = 1;
                    spawned = spawn_ai();
                    return spawned;
                } else {
                    self.try_og_origin = undefined;
                }
            }
            /#
                if (getunarchiveddebugdvar(@"hash_38a088b03f78dca1") == "<dev string:x275>") {
                    aiarray = getaispeciesarray("<dev string:x299>", "<dev string:x299>");
                    print3d(self.origin, "<dev string:x29d>" + aiarray.size + "<dev string:x2ac>", (0.8, 0.2, 0.2), 1, 0.8, 200);
                    line(level.player.origin, self.origin, (0.8, 0.2, 0.2), 1, 0, 200);
                }
            #/
        } else if (var_32a16e8a7495d3) {
            /#
                if (getunarchiveddebugdvar(@"hash_38a088b03f78dca1") == "<dev string:x275>") {
                    origins = [spawned.origin, spawned geteye(), (spawned.origin + spawned geteye()) / 2];
                    var_3033e6e264183efb = 0;
                    foreach (origin in origins) {
                        var_3033e6e264183efb = sighttracepassed(level.player geteye(), origin, 0, [level.player, spawned], 0);
                        if (var_3033e6e264183efb) {
                            break;
                        }
                    }
                    if (var_3033e6e264183efb) {
                        if (isdefined(self.targetname)) {
                            println("<dev string:x2b4>" + level.player geteye() + "<dev string:x2c7>" + self.targetname + "<dev string:x2e9>" + self.origin);
                        } else if (isdefined(self.script_noteworthy)) {
                            println("<dev string:x2b4>" + level.player geteye() + "<dev string:x2ee>" + self.script_noteworthy + "<dev string:x2e9>" + self.origin);
                        } else {
                            println("<dev string:x2b4>" + level.player geteye() + "<dev string:x317>" + self.origin);
                        }
                        print3d(self.origin, "<dev string:x32c>", (0.8, 0.4, 0.2), 1, 0.8, 200);
                        line(level.player.origin, self.origin, (0.8, 0.4, 0.2), 1, 0, 200);
                    }
                }
            #/
        }
    }
    if (isdefined(self.script_spawn_once)) {
        self delete();
    }
    return spawned;
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xc60b
// Size: 0x5b
function function_stack(func, param1, param2, param3, param4, param5) {
    var_90714d802cc091f = spawnstruct();
    var_90714d802cc091f thread function_stack_proc(self, func, param1, param2, param3, param4, param5);
    return function_stack_wait_finish(var_90714d802cc091f);
}

// Namespace utility / scripts\engine\sp\utility
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xc66f
// Size: 0x98
function function_stack_timeout(timeout, func, param1, param2, param3, param4, param5) {
    var_90714d802cc091f = spawnstruct();
    var_90714d802cc091f thread function_stack_proc(self, func, param1, param2, param3, param4, param5);
    if (isdefined(var_90714d802cc091f.function_stack_func_begun) || var_90714d802cc091f waittill_any_timeout(timeout, "function_stack_func_begun") != "timeout") {
        return function_stack_wait_finish(var_90714d802cc091f);
    }
    var_90714d802cc091f notify("death");
    return 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc70f
// Size: 0x7a
function function_stack_clear() {
    newstack = [];
    if (isdefined(self.function_stack[0]) && isdefined(self.function_stack[0].function_stack_func_begun)) {
        newstack[0] = self.function_stack[0];
    }
    self.function_stack = undefined;
    self notify("clear_function_stack");
    waittillframeend();
    if (!newstack.size) {
        return;
    }
    if (!newstack[0].function_stack_func_begun) {
        return;
    }
    self.function_stack = newstack;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc791
// Size: 0x1b
function set_blur(magnitude, time) {
    setblur(magnitude, time);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc7b4
// Size: 0x15
function set_goal_radius(radius) {
    self.goalradius = radius;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc7d1
// Size: 0x15
function function_9ac6d210c012d43f(height) {
    self.goalheight = height;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc7ee
// Size: 0x31
function set_goal_node(node) {
    self.last_set_goalnode = node;
    self.last_set_goalpos = undefined;
    self.last_set_goalent = undefined;
    self setgoalnode(node);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc827
// Size: 0x3f
function set_goal_node_targetname(targetname) {
    assert(isdefined(targetname));
    node = getnode(targetname, "targetname");
    assert(isdefined(node));
    set_goal_node(node);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc86e
// Size: 0x31
function set_goal_pos(origin) {
    self.last_set_goalnode = undefined;
    self.last_set_goalpos = origin;
    self.last_set_goalent = undefined;
    self setgoalpos(origin);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc8a7
// Size: 0x51
function set_goal_ent(target) {
    set_goal_pos(target.origin);
    self.last_set_goalent = target;
    if (isstruct(target) && !isdefined(target.type)) {
        target.type = "struct";
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc900
// Size: 0x296
function get_spawner_array(name, key) {
    var_1a977ea95154cba4 = getspawnerarray();
    var_8daa7ef0c0f67dc1 = [];
    if (key == "code_classname") {
        foreach (spawner in var_1a977ea95154cba4) {
            if (isdefined(spawner.code_classname) && spawner.code_classname == name) {
                var_8daa7ef0c0f67dc1[var_8daa7ef0c0f67dc1.size] = spawner;
            }
        }
    } else if (key == "classname") {
        foreach (spawner in var_1a977ea95154cba4) {
            if (isdefined(spawner.classname) && spawner.classname == name) {
                var_8daa7ef0c0f67dc1[var_8daa7ef0c0f67dc1.size] = spawner;
            }
        }
    } else if (key == "target") {
        foreach (spawner in var_1a977ea95154cba4) {
            if (isdefined(spawner.target) && spawner.target == name) {
                var_8daa7ef0c0f67dc1[var_8daa7ef0c0f67dc1.size] = spawner;
            }
        }
    } else if (key == "script_linkname") {
        foreach (spawner in var_1a977ea95154cba4) {
            if (isdefined(spawner.script_linkname) && spawner.script_linkname == name) {
                var_8daa7ef0c0f67dc1[var_8daa7ef0c0f67dc1.size] = spawner;
            }
        }
    } else if (key == "script_noteworthy") {
        foreach (spawner in var_1a977ea95154cba4) {
            if (isdefined(spawner.script_noteworthy) && spawner.script_noteworthy == name) {
                var_8daa7ef0c0f67dc1[var_8daa7ef0c0f67dc1.size] = spawner;
            }
        }
    } else if (key == "targetname") {
        assertmsg("You are using targetname, use the code call GetSpawnerArray() instead of this script call");
    } else {
        assertmsg("key '%s' does not internally belong to entities", key);
    }
    return var_8daa7ef0c0f67dc1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xcb9f
// Size: 0x1a5
function array_spawn(spawners, bforcespawn, var_bcbfa4748fd0f1ea, var_9147e88682bab404) {
    if (!isdefined(var_bcbfa4748fd0f1ea)) {
        var_bcbfa4748fd0f1ea = 0;
    }
    guys = [];
    foreach (spawner in spawners) {
        spawner.count = 1;
        if (getsubstr(spawner.classname, 7, 10) == "veh") {
            guy = spawner spawn_vehicle();
            /#
                if (isdefined(spawner.export)) {
                    assertex(isalive(guy), "<dev string:x341>" + spawner.export + "<dev string:x356>");
                } else {
                    assertex(isalive(guy), "<dev string:x368>" + spawner.origin + "<dev string:x356>");
                }
            #/
            if (isdefined(guy.target) && !isdefined(guy.script_moveoverride)) {
                guy thread scripts\common\vehicle_paths::gopath();
            }
            guys[guys.size] = guy;
        } else {
            guy = spawner spawn_ai(bforcespawn);
            if (!var_bcbfa4748fd0f1ea) {
                assertex(isalive(guy), "Guy with export " + spawner.export + " failed to spawn.");
            }
            guys[guys.size] = guy;
        }
        if (istrue(var_9147e88682bab404)) {
            waitframe();
        }
    }
    if (!var_bcbfa4748fd0f1ea) {
        assertex(guys.size == spawners.size, "Didnt spawn correct number of guys");
    }
    return guys;
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xcd4d
// Size: 0x72
function array_spawn_targetname(targetname, forcespawn, var_bcbfa4748fd0f1ea, var_fb4c22ca40a3c27e, var_9147e88682bab404) {
    spawners = getspawnerarray(targetname);
    spawners = array_merge(spawners, getentarray(targetname, "targetname"));
    assertex(spawners.size, "Tried to spawn spawners with targetname " + targetname + " but there are no spawners");
    return array_spawn(spawners, forcespawn, var_bcbfa4748fd0f1ea, var_9147e88682bab404);
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xcdc8
// Size: 0x6f
function array_spawn_noteworthy(noteworthy, forcespawn, var_bcbfa4748fd0f1ea, var_fb4c22ca40a3c27e) {
    spawners = get_spawner_array(noteworthy, "script_noteworthy");
    spawners = array_merge(spawners, getentarray(noteworthy, "script_noteworthy"));
    assertex(spawners.size, "Tried to spawn spawners with script_noteworthy " + noteworthy + " but there are no spawners");
    return array_spawn(spawners, forcespawn, var_bcbfa4748fd0f1ea);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xce40
// Size: 0x55
function spawn_script_noteworthy(script_noteworthy, bforcespawn) {
    spawner = getspawner(script_noteworthy, "script_noteworthy");
    assertex(isdefined(spawner), "Spawner with script_noteworthy " + script_noteworthy + " does not exist.");
    guy = spawner spawn_ai(bforcespawn);
    return guy;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xce9e
// Size: 0x55
function spawn_targetname(targetname, bforcespawn) {
    spawner = getspawner(targetname, "targetname");
    assertex(isdefined(spawner), "Spawner with targetname " + targetname + " does not exist.");
    guy = spawner spawn_ai(bforcespawn);
    return guy;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcefc
// Size: 0x15
function set_grenadeammo(count) {
    self.grenadeammo = count;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcf19
// Size: 0x8d
function get_player_feet_from_view() {
    assert(isplayer(self));
    tagorigin = self.origin;
    upvec = anglestoup(self getplayerangles());
    height = self getplayerviewheight();
    player_eye = tagorigin + (0, 0, height);
    var_b3c795f07908b2ea = tagorigin + upvec * height;
    var_fe6e9a378ec04947 = player_eye - var_b3c795f07908b2ea;
    var_1b6b79d8eefc9ee7 = tagorigin + var_fe6e9a378ec04947;
    return var_1b6b79d8eefc9ee7;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcfaf
// Size: 0x15
function set_baseaccuracy(val) {
    self.baseaccuracy = val;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcfcc
// Size: 0xb
function get_baseaccuracy() {
    return self.baseaccuracy;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcfe0
// Size: 0x33
function set_attackeraccuracy(val) {
    if (issp() && isplayer(self)) {
        scripts\sp\utility::set_player_attacker_accuracy(val);
        return;
    }
    self.attackeraccuracy = val;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd01b
// Size: 0x12
function autosave_now(var_f450def949fd681e) {
    return scripts\sp\autosave::_autosave_game_now(var_f450def949fd681e);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd036
// Size: 0xa
function autosave_now_silent() {
    return scripts\sp\autosave::_autosave_game_now(1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd049
// Size: 0x26
function set_generic_deathanim(deathanim) {
    self.deathanim = getgenericanim(deathanim);
    self.var_2fa5eff1b71a2229 = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd077
// Size: 0x15
function set_dontmelee(bool) {
    self.dontmelee = bool;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd094
// Size: 0x25
function putgunaway() {
    namespace_223959d3e5206cfb::placeweaponon(self.weapon, "none");
    self.weapon = nullweapon();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd0c1
// Size: 0x19
function anim_stopanimscripted() {
    self stopanimscripted();
    self notify("stop_loop");
    self notify("stop_animmode");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd0e2
// Size: 0x29
function antigrav_float_ai_override(bool) {
    assertex(isai(self), "Tried to override antigrav floating on a non ai");
    self.allowantigrav = bool;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd113
// Size: 0x20
function antigrav_clear_float_ai_override() {
    assertex(isai(self), "Tried to clear override antigrav floating on a non ai");
    self.allowantigrav = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd13b
// Size: 0x1f0
function antigrav_disable_nav_obstacle_for_team(team, bool) {
    assertex(isdefined(level.antigrav), "Called antigrav_disable_nav_obstacle_for_teams before antigrav grenades were initialized!");
    if (bool) {
        if (!isdefined(level.antigrav.disablenavobstacleteams) || level.antigrav.disablenavobstacleteams.size == 0 || team == "all") {
            level.antigrav.disablenavobstacleteams = [];
            level.antigrav.disablenavobstacleteams[0] = team;
        } else if (level.antigrav.disablenavobstacleteams[0] != "all") {
            level.antigrav.disablenavobstacleteams = array_combine_unique(level.antigrav.disablenavobstacleteams, [team]);
        }
        return;
    }
    if (!isdefined(level.antigrav.disablenavobstacleteams) || level.antigrav.disablenavobstacleteams.size == 0) {
        return;
    }
    if (team == "all") {
        level.antigrav.disablenavobstacleteams = undefined;
        return;
    }
    if (level.antigrav.disablenavobstacleteams[0] == "all") {
        level.antigrav.disablenavobstacleteams = [];
        if (team == "allies") {
            level.antigrav.disablenavobstacleteams[0] = "axis";
        } else {
            level.antigrav.disablenavobstacleteams[0] = "allies";
        }
        return;
    }
    level.antigrav.disablenavobstacleteams = array_remove_array(level.antigrav.disablenavobstacleteams, [team]);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd333
// Size: 0x13
function kill_wrapper() {
    self enabledeathshield(0);
    self kill();
    return true;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd34f
// Size: 0x9c
function array_wait_match(array, match, message) {
    notifystruct = spawnstruct();
    foreach (element in array) {
        thread array_wait_match_proc(notifystruct, element, match, message);
    }
    for (i = 0; i < array.size; i++) {
        notifystruct waittill("array_wait_match_proc");
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd3f3
// Size: 0x39
function array_wait_match_proc(notifystruct, element, match, message) {
    notifystruct endon("array_wait_success");
    element waittillmatch(match, message);
    notifystruct notify("array_wait_match_proc");
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd434
// Size: 0x81
function array_any_wait_match(array, match, message) {
    notifystruct = spawnstruct();
    foreach (element in array) {
        thread array_any_wait_match_proc(notifystruct, element, match, message);
    }
    notifystruct waittill("array_wait_proc");
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd4bd
// Size: 0x32
function array_any_wait_match_proc(notifystruct, element, match, message) {
    element waittillmatch(match, message);
    notifystruct notify("array_wait_proc");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd4f7
// Size: 0x16
function die() {
    self kill((0, 0, 0));
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd515
// Size: 0x40
function getmodel(str) {
    assertex(isdefined(level.scr_model[str]), "Tried to getmodel on model " + str + " but level.scr_model[ " + str + " was not defined.");
    return level.scr_model[str];
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd55e
// Size: 0x1d
function isads() {
    assert(isplayer(self));
    return self playerads() > 0.5;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd584
// Size: 0x14
function disable_replace_on_death() {
    self.replace_on_death = undefined;
    self notify("_disable_reinforcement");
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xd5a0
// Size: 0x111
function waittill_player_lookat(dot, timer, dot_only, timeout, ignore_ent, player) {
    if (!isdefined(player)) {
        player = level.player;
    }
    timeoutent = spawnstruct();
    if (isdefined(timeout)) {
        timeoutent thread notify_delay("timeout", timeout);
    }
    timeoutent endon("timeout");
    if (!isdefined(dot)) {
        dot = 0.92;
    }
    if (!isdefined(timer)) {
        timer = 0;
    }
    var_47382793d414cbd0 = int(timer * 20);
    count = var_47382793d414cbd0;
    self endon("death");
    ai_guy = isai(self);
    org = undefined;
    for (;;) {
        if (ai_guy) {
            org = self geteye();
        } else {
            org = self.origin;
        }
        if (player player_looking_at(org, dot, dot_only, ignore_ent)) {
            count--;
            if (count <= 0) {
                return 1;
            }
        } else {
            count = var_47382793d414cbd0;
        }
        wait 0.05;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd6b9
// Size: 0x3f
function waittill_player_lookat_for_time(timer, dot, dot_only, ignore_ent) {
    assertex(isdefined(timer), "Tried to do waittill_player_lookat_for_time with no time parm.");
    waittill_player_lookat(dot, timer, dot_only, undefined, ignore_ent);
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd700
// Size: 0xe2
function player_looking_at(start, dot, dot_only, ignore_ent) {
    if (!isdefined(dot)) {
        dot = 0.8;
    }
    player = get_player_from_self();
    end = player geteye();
    angles = vectortoangles(start - end);
    forward = anglestoforward(angles);
    player_angles = player getplayerangles();
    player_forward = anglestoforward(player_angles);
    new_dot = vectordot(forward, player_forward);
    if (new_dot < dot) {
        return 0;
    }
    if (isdefined(dot_only)) {
        assertex(dot_only, "dot_only must be true or undefined");
        return 1;
    }
    return ray_trace_detail_passed(start, end, ignore_ent, create_default_contents(1));
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd7eb
// Size: 0x60
function either_player_looking_at(org, dot, dot_only, ignore_ent) {
    for (i = 0; i < level.players.size; i++) {
        if (level.players[i] player_looking_at(org, dot, dot_only, ignore_ent)) {
            return true;
        }
    }
    return false;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd854
// Size: 0x92
function point_orientation_relative_to_player(point) {
    player = get_player_from_self();
    angles = vectortoangles(point - player geteye());
    forward = anglestoforward(angles);
    player_angles = player getplayerangles();
    player_forward = anglestoforward(player_angles);
    cross = vectorcross(forward, player_forward);
    if (cross[2] < 0) {
        return "left";
    }
    return "right";
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd8ee
// Size: 0x66
function players_within_distance(fdist, org) {
    var_74a76bbc5f12d7ea = fdist * fdist;
    for (i = 0; i < level.players.size; i++) {
        if (distancesquared(org, level.players[i].origin) < var_74a76bbc5f12d7ea) {
            return true;
        }
    }
    return false;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd95d
// Size: 0xdd
function ai_delete_when_out_of_sight(ai_array, fdist) {
    if (!isdefined(ai_array)) {
        return;
    }
    var_7e36d51c34f3bf2f = 0.75;
    while (ai_array.size > 0) {
        wait 1;
        for (i = 0; i < ai_array.size; i++) {
            if (!isalive(ai_array[i])) {
                ai_array = array_remove(ai_array, ai_array[i]);
                continue;
            }
            if (players_within_distance(fdist, ai_array[i].origin)) {
                continue;
            }
            if (either_player_looking_at(ai_array[i].origin + (0, 0, 48), var_7e36d51c34f3bf2f, 1)) {
                continue;
            }
            if (isdefined(ai_array[i].magic_bullet_shield)) {
                ai_array[i] stop_magic_bullet_shield();
            }
            ai_array[i] delete();
            ai_array = array_remove(ai_array, ai_array[i]);
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xda42
// Size: 0x14e
function add_wait(func, parm1, parm2, parm3, parm4) {
    init_waits();
    /#
        thread add_wait_asserter();
    #/
    ent = spawnstruct();
    ent.caller = self;
    ent.func = func;
    ent.parms = [];
    if (isdefined(parm1)) {
        ent.parms[ent.parms.size] = parm1;
    }
    if (isdefined(parm2)) {
        ent.parms[ent.parms.size] = parm2;
    }
    if (isdefined(parm3)) {
        ent.parms[ent.parms.size] = parm3;
    }
    if (isdefined(parm4)) {
        ent.parms[ent.parms.size] = parm4;
    }
    if (!isdefined(level.waits.wait_any_func_array)) {
        level.waits.wait_any_func_array = [ent];
        return;
    }
    level.waits.wait_any_func_array[level.waits.wait_any_func_array.size] = ent;
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xdb98
// Size: 0xf3
function add_abort(func, parm1, parm2, parm3) {
    init_waits();
    /#
        thread add_wait_asserter();
    #/
    ent = spawnstruct();
    ent.caller = self;
    ent.func = func;
    ent.parms = [];
    if (isdefined(parm1)) {
        ent.parms[ent.parms.size] = parm1;
    }
    if (isdefined(parm2)) {
        ent.parms[ent.parms.size] = parm2;
    }
    if (isdefined(parm3)) {
        ent.parms[ent.parms.size] = parm3;
    }
    level.waits.abort_wait_any_func_array[level.waits.abort_wait_any_func_array.size] = ent;
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xdc93
// Size: 0x142
function add_func(func, parm1, parm2, parm3, parm4, var_77895a5b8a625552) {
    init_waits();
    /#
        thread add_wait_asserter();
    #/
    ent = spawnstruct();
    ent.caller = self;
    ent.func = func;
    ent.parms = [];
    if (isdefined(parm1)) {
        ent.parms[ent.parms.size] = parm1;
    }
    if (isdefined(parm2)) {
        ent.parms[ent.parms.size] = parm2;
    }
    if (isdefined(parm3)) {
        ent.parms[ent.parms.size] = parm3;
    }
    if (isdefined(parm4)) {
        ent.parms[ent.parms.size] = parm4;
    }
    if (isdefined(var_77895a5b8a625552)) {
        ent.parms[ent.parms.size] = var_77895a5b8a625552;
    }
    level.waits.run_func_after_wait_array[level.waits.run_func_after_wait_array.size] = ent;
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xdddd
// Size: 0x142
function add_call(func, parm1, parm2, parm3, parm4, var_77895a5b8a625552) {
    init_waits();
    /#
        thread add_wait_asserter();
    #/
    ent = spawnstruct();
    ent.caller = self;
    ent.func = func;
    ent.parms = [];
    if (isdefined(parm1)) {
        ent.parms[ent.parms.size] = parm1;
    }
    if (isdefined(parm2)) {
        ent.parms[ent.parms.size] = parm2;
    }
    if (isdefined(parm3)) {
        ent.parms[ent.parms.size] = parm3;
    }
    if (isdefined(parm4)) {
        ent.parms[ent.parms.size] = parm4;
    }
    if (isdefined(var_77895a5b8a625552)) {
        ent.parms[ent.parms.size] = var_77895a5b8a625552;
    }
    level.waits.run_call_after_wait_array[level.waits.run_call_after_wait_array.size] = ent;
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xdf27
// Size: 0x135
function add_noself_call(func, parm1, parm2, parm3, parm4, var_77895a5b8a625552) {
    init_waits();
    /#
        thread add_wait_asserter();
    #/
    ent = spawnstruct();
    ent.func = func;
    ent.parms = [];
    if (isdefined(parm1)) {
        ent.parms[ent.parms.size] = parm1;
    }
    if (isdefined(parm2)) {
        ent.parms[ent.parms.size] = parm2;
    }
    if (isdefined(parm3)) {
        ent.parms[ent.parms.size] = parm3;
    }
    if (isdefined(parm4)) {
        ent.parms[ent.parms.size] = parm4;
    }
    if (isdefined(var_77895a5b8a625552)) {
        ent.parms[ent.parms.size] = var_77895a5b8a625552;
    }
    level.waits.run_noself_call_after_wait_array[level.waits.run_noself_call_after_wait_array.size] = ent;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe064
// Size: 0x71
function add_endon(name) {
    init_waits();
    /#
        thread add_wait_asserter();
    #/
    ent = spawnstruct();
    ent.caller = self;
    ent.ender = name;
    level.waits.do_wait_endons_array[level.waits.do_wait_endons_array.size] = ent;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe0dd
// Size: 0x6d
function do_wait_any() {
    init_waits();
    assertex(isdefined(level.waits.wait_any_func_array), "Tried to do a do_wait without addings funcs first");
    assertex(level.waits.wait_any_func_array.size > 0, "Tried to do a do_wait without addings funcs first");
    do_wait(level.waits.wait_any_func_array.size - 1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe152
// Size: 0x20c
function do_wait(var_ff009ed2debc01c4) {
    init_waits();
    if (!isdefined(var_ff009ed2debc01c4)) {
        var_ff009ed2debc01c4 = 0;
    }
    /#
        level notify("<dev string:x374>");
    #/
    assertex(isdefined(level.waits.wait_any_func_array), "Tried to do a do_wait without addings funcs first");
    ent = spawnstruct();
    array = level.waits.wait_any_func_array;
    endons = level.waits.do_wait_endons_array;
    var_f9aa72a24a1a927 = level.waits.run_func_after_wait_array;
    var_502521f8ff044027 = level.waits.run_call_after_wait_array;
    var_953b218366c91a88 = level.waits.run_noself_call_after_wait_array;
    var_837c864ff77fcfdf = level.waits.abort_wait_any_func_array;
    level.waits.wait_any_func_array = [];
    level.waits.run_func_after_wait_array = [];
    level.waits.do_wait_endons_array = [];
    level.waits.abort_wait_any_func_array = [];
    level.waits.run_call_after_wait_array = [];
    level.waits.run_noself_call_after_wait_array = [];
    ent.count = array.size;
    ent array_levelthread(array, &waittill_func_ends, endons);
    ent thread do_abort(var_837c864ff77fcfdf);
    ent endon("any_funcs_aborted");
    for (;;) {
        if (ent.count <= var_ff009ed2debc01c4) {
            break;
        }
        ent waittill("func_ended");
    }
    ent notify("all_funcs_ended");
    array_levelthread(var_f9aa72a24a1a927, &exec_func, []);
    array_levelthread(var_502521f8ff044027, &exec_call);
    array_levelthread(var_953b218366c91a88, &exec_call_noself);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe366
// Size: 0x174
function do_funcs() {
    /#
        level notify("<dev string:x374>");
    #/
    assertex(isdefined(level.waits.wait_any_func_array), "Tried to do a do_wait without addings funcs first");
    ent = spawnstruct();
    assertex(!level.waits.wait_any_func_array.size, "Don't use add_wait and do_funcs together.");
    assertex(!level.waits.do_wait_endons_array.size, "Don't use add_endon and do_funcs together.");
    assertex(!level.waits.run_call_after_wait_array.size, "Don't use add_call and do_funcs together.");
    assertex(!level.waits.run_noself_call_after_wait_array.size, "Don't use add_call and do_funcs together.");
    assertex(!level.waits.abort_wait_any_func_array.size, "Do_funcs doesn't support add_abort.");
    var_f9aa72a24a1a927 = level.waits.run_func_after_wait_array;
    level.waits.run_func_after_wait_array = [];
    foreach (var_8040f6cacb33424d in var_f9aa72a24a1a927) {
        level exec_func(var_8040f6cacb33424d, []);
    }
    ent notify("all_funcs_ended");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe4e2
// Size: 0xa5
function is_default_start() {
    if (isdefined(level.forced_start_catchup) && level.forced_start_catchup == 1) {
        return false;
    }
    if (isdefined(level.default_start_override_alt) && level.default_start_override_alt == level.start_point) {
        return true;
    }
    if (isdefined(level.default_start_override)) {
        if (level.default_start_override == level.start_point) {
            return true;
        }
    } else if (level_has_start_points()) {
        return (level.start_point == level.start_functions[0]["name"]);
    }
    return level.start_point == "default";
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe590
// Size: 0x68
function manual_linkto(entity, offset) {
    entity endon("death");
    self endon("death");
    if (!isdefined(offset)) {
        offset = (0, 0, 0);
    }
    for (;;) {
        self.origin = entity.origin + offset;
        self.angles = entity.angles;
        wait 0.05;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe600
// Size: 0x9
function nextmission() {
    scripts\sp\endmission::nextmission_internal();
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe611
// Size: 0x4e
function nextmission_preload(type, var_740cf07d74dba935) {
    if (!flag_exist("nextmission_preload_complete")) {
        flag_init("nextmission_preload_complete");
    }
    flag_clear("nextmission_preload_complete");
    scripts\sp\endmission::nextmission_preload_internal(type, var_740cf07d74dba935);
    flag_set("nextmission_preload_complete");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe667
// Size: 0x9
function nextmission_primeloadbink() {
    scripts\sp\endmission::nextmission_primeloadbink_internal();
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xe678
// Size: 0x7a
function make_array(index1, index2, index3, var_5a488a6bae780669, var_5a48896bae780436) {
    assertex(isdefined(index1), "Need to define index 1 at least");
    array = [];
    array[array.size] = index1;
    if (isdefined(index2)) {
        array[array.size] = index2;
    }
    if (isdefined(index3)) {
        array[array.size] = index3;
    }
    if (isdefined(var_5a488a6bae780669)) {
        array[array.size] = var_5a488a6bae780669;
    }
    if (isdefined(var_5a48896bae780436)) {
        array[array.size] = var_5a48896bae780436;
    }
    return array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe6fb
// Size: 0xd
function fail_on_friendly_fire() {
    level.failonfriendlyfire = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe710
// Size: 0xc
function normal_friendly_fire_penalty() {
    level.failonfriendlyfire = 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe724
// Size: 0x78
function getplayerclaymores() {
    assert(isplayer(self));
    var_64d3777f9580a884 = 0;
    heldweapons = self.equippedweapons;
    for (i = 0; i < heldweapons.size; i++) {
        weapon = heldweapons[i];
        if (weapon.basename == "claymore") {
            var_64d3777f9580a884 += self getweaponammoclip(weapon);
        }
    }
    return var_64d3777f9580a884;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe7a5
// Size: 0xb6
function lerp_saveddvar(name, value, time) {
    curr = getdvarfloat(name);
    level notify(function_f28fd66285fa2c9(name) + "_lerp_savedDvar");
    level endon(function_f28fd66285fa2c9(name) + "_lerp_savedDvar");
    range = value - curr;
    interval = 0.05;
    count = int(time / interval);
    if (count > 0) {
        delta = range / count;
        while (count) {
            curr += delta;
            setsaveddvar(name, curr);
            wait interval;
            count--;
        }
    }
    setsaveddvar(name, value);
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xe863
// Size: 0xfd
function lerp_omnvar(name, value, time, round_float) {
    curr = getomnvar(name);
    level notify(function_f28fd66285fa2c9(name) + "_lerp_savedDvar");
    level endon(function_f28fd66285fa2c9(name) + "_lerp_savedDvar");
    range = value - curr;
    interval = 0.05;
    count = int(time / interval);
    delta = range / count;
    while (count) {
        curr += delta;
        if (isdefined(round_float)) {
            round = math::round_float(curr, round_float);
            setomnvar(name, round);
        } else {
            setomnvar(name, curr);
        }
        wait interval;
        count--;
    }
    if (isdefined(round_float)) {
        round = math::round_float(value, round_float);
        setomnvar(name, round);
        return;
    }
    setomnvar(name, value);
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe968
// Size: 0xba
function lerp_omnvarint(name, value, time) {
    curr = getomnvar(name);
    level notify(function_f28fd66285fa2c9(name) + "_lerp_savedDvar");
    level endon(function_f28fd66285fa2c9(name) + "_lerp_savedDvar");
    range = value - curr;
    interval = 0.05;
    count = int(time / interval);
    delta = range / count;
    while (count) {
        curr += delta;
        setomnvar(name, int(curr));
        wait interval;
        count--;
    }
    setomnvar(name, int(value));
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xea2a
// Size: 0x20
function slowmo_setspeed_slow(speed) {
    level.slowmo.speed_slow = speed;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xea52
// Size: 0x20
function slowmo_setspeed_norm(speed) {
    level.slowmo.speed_norm = speed;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xea7a
// Size: 0x20
function slowmo_setlerptime_in(time) {
    level.slowmo.lerp_time_in = time;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeaa2
// Size: 0x20
function slowmo_setlerptime_out(time) {
    level.slowmo.lerp_time_out = time;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeaca
// Size: 0x56
function slowmo_lerp_in() {
    if (istrue(level.no_slowmo)) {
        return;
    }
    scripts\sp\audio::set_slowmo_dialogue_start();
    setslowmotion(level.slowmo.speed_norm, level.slowmo.speed_slow, level.slowmo.lerp_time_in);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeb28
// Size: 0x56
function slowmo_lerp_out() {
    if (istrue(level.no_slowmo)) {
        return;
    }
    setslowmotion(level.slowmo.speed_slow, level.slowmo.speed_norm, level.slowmo.lerp_time_out);
    scripts\sp\audio::set_slowmo_dialogue_end();
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xeb86
// Size: 0x5c
function add_earthquake(name, mag, duration, radius) {
    level.earthquake[name]["magnitude"] = mag;
    level.earthquake[name]["duration"] = duration;
    level.earthquake[name]["radius"] = radius;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xebea
// Size: 0x7d
function get_average_origin(array) {
    origin = (0, 0, 0);
    foreach (member in array) {
        origin += member.origin;
    }
    return origin * 1 / array.size;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xec70
// Size: 0x7d
function function_874b64f0417c4374(array) {
    angles = (0, 0, 0);
    foreach (member in array) {
        angles += member.angles;
    }
    return angles * 1 / array.size;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xecf6
// Size: 0xff
function generic_damage_think() {
    if (!isdefined(self.damage_functions)) {
        self.damage_functions = [];
    }
    self endon("entitydeleted");
    self endon("stop_generic_damage_think");
    for (;;) {
        damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon = self waittill("damage");
        foreach (func in self.damage_functions) {
            thread [[ func ]](damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon);
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xedfd
// Size: 0x21
function add_damage_function(func) {
    self.damage_functions[self.damage_functions.size] = func;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xee26
// Size: 0x79
function remove_damage_function(damage_func) {
    new_array = [];
    foreach (func in self.damage_functions) {
        if (func == damage_func) {
            continue;
        }
        new_array[new_array.size] = func;
    }
    self.damage_functions = new_array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeea7
// Size: 0x1e
function playlocalsoundwrapper(alias) {
    assert(isdefined(alias));
    self playlocalsound(alias);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeecd
// Size: 0x4e
function teleport_player(object) {
    level.player setorigin(object.origin);
    if (isdefined(object.angles)) {
        level.player setplayerangles(object.angles);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef23
// Size: 0x60
function translate_local() {
    entities = [];
    if (isdefined(self.entities)) {
        entities = self.entities;
    }
    if (isdefined(self.entity)) {
        entities[entities.size] = self.entity;
    }
    assertex(entities.size > 0, "Tried to do translate_local without any entities");
    array_levelthread(entities, &translate_local_on_ent);
}

// Namespace utility / scripts\engine\sp\utility
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xef8b
// Size: 0x66
function open_up_fov(time, player_rig, tag, arcright, arcleft, arctop, arcbottom) {
    level.player endon("stop_opening_fov");
    wait time;
    level.player playerlinktodelta(player_rig, tag, 1, arcright, arcleft, arctop, arcbottom, 1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xeff9
// Size: 0xbb
function get_ai_touching_volume(steam, species, var_4e6d7bb6844ad4ec) {
    if (!isdefined(steam)) {
        steam = "all";
    }
    if (!isdefined(species)) {
        species = "all";
    }
    var_585e701daf27429 = getaispeciesarray(steam, species);
    var_3ecbf1096d1ba823 = [];
    foreach (guy in var_585e701daf27429) {
        assertex(isalive(guy), "Got ai array yet got a dead guy!");
        if (guy istouching(self)) {
            var_3ecbf1096d1ba823[var_3ecbf1096d1ba823.size] = guy;
        }
    }
    return var_3ecbf1096d1ba823;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf0bd
// Size: 0x109
function get_drones_touching_volume(steam) {
    if (!isdefined(steam)) {
        steam = "all";
    }
    var_bc02b7e0a9c33ef3 = [];
    if (steam == "all") {
        var_bc02b7e0a9c33ef3 = array_merge(level.drones["allies"].array, level.drones["axis"].array);
        var_bc02b7e0a9c33ef3 = array_merge(var_bc02b7e0a9c33ef3, level.drones["neutral"].array);
    } else {
        var_bc02b7e0a9c33ef3 = level.drones[steam].array;
    }
    var_eb117856ce650a18 = [];
    foreach (drone in var_bc02b7e0a9c33ef3) {
        if (!isdefined(drone)) {
            continue;
        }
        if (drone istouching(self)) {
            var_eb117856ce650a18[var_eb117856ce650a18.size] = drone;
        }
    }
    return var_eb117856ce650a18;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf1cf
// Size: 0xec
function get_drones_with_targetname(var_c1b40b757ebd4bd4) {
    var_bc02b7e0a9c33ef3 = array_merge(level.drones["allies"].array, level.drones["axis"].array);
    var_bc02b7e0a9c33ef3 = array_merge(var_bc02b7e0a9c33ef3, level.drones["neutral"].array);
    var_eb117856ce650a18 = [];
    foreach (drone in var_bc02b7e0a9c33ef3) {
        if (!isdefined(drone)) {
            continue;
        }
        if (isdefined(drone.targetname) && drone.targetname == var_c1b40b757ebd4bd4) {
            var_eb117856ce650a18[var_eb117856ce650a18.size] = drone;
        }
    }
    return var_eb117856ce650a18;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf2c4
// Size: 0x3d
function set_count(count) {
    /#
        assertex(isdefined(self), "<dev string:x38b>");
        assertex(!isalive(self), "<dev string:x3a3>");
    #/
    self.count = count;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf309
// Size: 0x9f
function follow_path(node, var_ffe0e746775a6d86, var_5e38f20c9628ae25) {
    self notify("_utility::follow_path");
    self endon("_utility::follow_path");
    self endon("death");
    assertmsg("follow_path() is going to be deprecated, call go_to_node() directly");
    var_69fa9325efe2f972 = self.script_forcegoal;
    self.script_forcegoal = 1;
    scripts\sp\spawner::go_to_node(node, var_ffe0e746775a6d86, var_5e38f20c9628ae25);
    self.script_forcegoal = var_69fa9325efe2f972;
    if (!isdefined(self.script_forcegoal) || !self.script_forcegoal) {
        self.goalradius = level.default_goalradius;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xf3b0
// Size: 0xcb
function enable_dynamic_run_speed(followent, minspeed, var_1b69369ed5cb9124, maxspeed, var_a765f9b570e8f8cc, middist, backdist) {
    setdvarifuninitialized(@"hash_c459efa5216607ee", 0);
    disable_dynamic_run_speed(0);
    if (!isdefined(minspeed)) {
        minspeed = 0;
    }
    if (!isdefined(var_1b69369ed5cb9124)) {
        var_1b69369ed5cb9124 = 205;
    }
    if (!isdefined(maxspeed)) {
        maxspeed = 250;
    }
    if (!isdefined(var_a765f9b570e8f8cc)) {
        var_a765f9b570e8f8cc = 100;
    }
    if (!isdefined(middist)) {
        middist = -100;
    }
    if (!isdefined(backdist)) {
        backdist = -200;
    }
    assertex(var_a765f9b570e8f8cc > middist, "frontDist cannot be less than midDist");
    assertex(var_a765f9b570e8f8cc > backdist, "frontDist cannot be less than midDist");
    assertex(middist > backdist, "frontDist cannot be less than midDist");
    thread dynamic_run_speed_thread(followent, minspeed, var_1b69369ed5cb9124, maxspeed, var_a765f9b570e8f8cc, middist, backdist);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf483
// Size: 0x48
function disable_dynamic_run_speed(speed) {
    /#
        if (getdvarint(@"hash_c459efa5216607ee")) {
            iprintln("<dev string:x3b6>");
        }
    #/
    if (!isdefined(speed)) {
        speed = 165;
    }
    self notify("stop_dynamic_run_speed");
    if (istrue(speed)) {
        set_movement_speed(speed);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf4d3
// Size: 0x86
function waittill_entity_in_range_or_timeout(entity, range, timeout) {
    self endon("death");
    entity endon("death");
    if (!isdefined(timeout)) {
        timeout = 5;
    }
    timeout_time = gettime() + timeout * 1000;
    while (isdefined(entity)) {
        if (distancesquared(entity.origin, self.origin) <= range * range) {
            break;
        }
        if (gettime() > timeout_time) {
            break;
        }
        wait 0.1;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf561
// Size: 0x52
function waittill_entity_in_range(entity, range) {
    self endon("death");
    entity endon("death");
    while (isdefined(entity)) {
        if (distancesquared(entity.origin, self.origin) <= range * range) {
            break;
        }
        wait 0.1;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf5bb
// Size: 0x52
function waittill_entity_out_of_range(entity, range) {
    self endon("death");
    entity endon("death");
    while (isdefined(entity)) {
        if (distancesquared(entity.origin, self.origin) > range * range) {
            break;
        }
        wait 0.1;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf615
// Size: 0x9a
function player_speed_percent(percent, time) {
    currspeed = int(getdvar(@"g_speed"));
    if (!isdefined(level.player.g_speed)) {
        level.player.g_speed = currspeed;
    }
    goalspeed = int(level.player.g_speed * percent * 0.01);
    level.player player_speed_set(goalspeed, time);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf6b7
// Size: 0x97
function player_speed_set(speed, time) {
    currspeed = int(getdvar(@"g_speed"));
    if (!isdefined(level.player.g_speed)) {
        level.player.g_speed = currspeed;
    }
    get_func = &g_speed_get_func;
    set_func = &g_speed_set_func;
    level.player thread player_speed_proc(speed, time, get_func, set_func, "player_speed_set");
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf756
// Size: 0x4d
function player_bob_scale_set(scale, time) {
    get_func = &g_bob_scale_get_func;
    set_func = &g_bob_scale_set_func;
    level.player thread player_speed_proc(scale, time, get_func, set_func, "player_bob_scale_set");
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf7ab
// Size: 0x8e
function blend_movespeedscale(scale, time, channel) {
    player = self;
    if (!isplayer(player)) {
        player = level.player;
    }
    if (!isdefined(player.movespeedscale)) {
        player.movespeedscale = 1;
    }
    get_func = &movespeed_get_func;
    set_func = &movespeed_set_func;
    player thread player_speed_proc(scale, time, get_func, set_func, "blend_movespeedscale", channel);
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf841
// Size: 0x78
function blend_movespeedscale_percent(percent, time, channel) {
    player = self;
    if (!isplayer(player)) {
        player = level.player;
    }
    if (!isdefined(player.movespeedscale)) {
        player.movespeedscale = 1;
    }
    var_c943dd9d8f55b20 = percent * 0.01;
    player blend_movespeedscale(var_c943dd9d8f55b20, time, channel);
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xf8c1
// Size: 0xd5
function player_speed_proc(speed, time, get_func, set_func, ender, channel) {
    self notify(ender);
    self endon(ender);
    currspeed = [[ get_func ]](channel);
    goalspeed = speed;
    if (isdefined(time) && time > 0) {
        range = goalspeed - currspeed;
        interval = 0.05;
        numcycles = time / interval;
        fraction = range / numcycles;
        while (abs(goalspeed - currspeed) > abs(fraction * 1.1)) {
            currspeed += fraction;
            [[ set_func ]](currspeed, channel);
            wait interval;
        }
    }
    [[ set_func ]](goalspeed, channel);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf99e
// Size: 0x5b
function player_speed_default(time) {
    if (!isdefined(level.player.g_speed)) {
        return;
    }
    level.player player_speed_set(level.player.g_speed, time);
    waittillframeend();
    level.player.g_speed = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfa01
// Size: 0x5d
function blend_movespeedscale_default(time, channel) {
    player = self;
    if (!isplayer(player)) {
        player = level.player;
    }
    if (!isdefined(player.movespeedscale)) {
        return;
    }
    player blend_movespeedscale(1, time, channel);
    player.movespeedscale = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfa66
// Size: 0x8c
function teleport_ent(ent) {
    if (isplayer(self)) {
        self setorigin(ent.origin);
        self setplayerangles(ent.angles);
        return;
    }
    if (isai(self)) {
        self forceteleport(ent.origin, ent.angles);
        return;
    }
    self.origin = ent.origin;
    self.angles = ent.angles;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfafa
// Size: 0x83
function teleport_to_ent_tag(ent, tag) {
    position = ent gettagorigin(tag);
    angles = ent gettagangles(tag);
    self dontinterpolate();
    if (isplayer(self)) {
        self setorigin(position);
        self setplayerangles(angles);
        return;
    }
    if (isai(self)) {
        self forceteleport(position, angles);
        return;
    }
    self.origin = position;
    self.angles = angles;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfb85
// Size: 0x64
function teleport_ai(var_4690fb463888cbd8) {
    assertex(isai(self), "Function teleport_ai can only be called on an AI entity");
    assertex(isdefined(var_4690fb463888cbd8), "Need to pass a node entity to function teleport_ai");
    self forceteleport(var_4690fb463888cbd8.origin, var_4690fb463888cbd8.angles);
    self setgoalpos(self.origin);
    self setgoalnode(var_4690fb463888cbd8);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfbf1
// Size: 0x79
function move_all_fx(vec) {
    foreach (fx in level.createfxent) {
        fx.v["origin"] = fx.v["origin"] + vec;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfc72
// Size: 0x20c
function getentwithflag(flag) {
    var_b65f27b4ba84b114 = scripts\sp\trigger::get_load_trigger_classes();
    triggers = [];
    foreach (class, _ in var_b65f27b4ba84b114) {
        if (!issubstr(class, "flag")) {
            continue;
        }
        var_fc9b8e336247843b = getentarray(class, "classname");
        triggers = array_combine(triggers, var_fc9b8e336247843b);
    }
    var_6ae9f8df81efa2d7 = scripts\sp\trigger::get_load_trigger_funcs();
    foreach (func, _ in var_6ae9f8df81efa2d7) {
        if (!issubstr(func, "flag")) {
            continue;
        }
        var_fc9b8e336247843b = getentarray(func, "targetname");
        triggers = array_combine(triggers, var_fc9b8e336247843b);
    }
    var_cb411ff28a70490 = undefined;
    /#
        foreach (trigger in triggers) {
            assertex(isdefined(trigger.script_flag), "<dev string:x3cd>" + trigger.origin + "<dev string:x3de>");
            if (trigger.script_flag == flag) {
                assertex(!isdefined(var_cb411ff28a70490), "<dev string:x3f2>" + flag + "<dev string:x40e>");
                var_cb411ff28a70490 = trigger;
            }
        }
    #/
    foreach (trigger in triggers) {
        if (trigger.script_flag == flag) {
            return trigger;
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfe86
// Size: 0x21a
function getentarraywithflag(flag) {
    var_b65f27b4ba84b114 = scripts\sp\trigger::get_load_trigger_classes();
    triggers = [];
    foreach (class, _ in var_b65f27b4ba84b114) {
        if (!issubstr(class, "flag")) {
            continue;
        }
        var_fc9b8e336247843b = getentarray(class, "classname");
        triggers = array_combine(triggers, var_fc9b8e336247843b);
    }
    var_6ae9f8df81efa2d7 = scripts\sp\trigger::get_load_trigger_funcs();
    foreach (func, _ in var_6ae9f8df81efa2d7) {
        if (!issubstr(func, "flag")) {
            continue;
        }
        var_fc9b8e336247843b = getentarray(func, "targetname");
        triggers = array_combine(triggers, var_fc9b8e336247843b);
    }
    var_97087726674fbf39 = [];
    /#
        foreach (trigger in triggers) {
            assertex(isdefined(trigger.script_flag), "<dev string:x3cd>" + trigger.origin + "<dev string:x3de>");
            if (trigger.script_flag == flag) {
                var_97087726674fbf39[var_97087726674fbf39.size] = trigger;
            }
        }
        assertex(var_97087726674fbf39.size, "<dev string:x43a>" + flag + "<dev string:x45a>");
        if (true) {
            return var_97087726674fbf39;
        }
    #/
    foreach (trigger in triggers) {
        if (trigger.script_flag == flag) {
            var_97087726674fbf39[var_97087726674fbf39.size] = trigger;
        }
    }
    return var_97087726674fbf39;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x100a9
// Size: 0x1c
function set_z(vec, z) {
    return (vec[0], vec[1], z);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x100ce
// Size: 0x1c
function set_y(vec, y) {
    return (vec[0], y, vec[2]);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x100f3
// Size: 0x1d
function set_x(vec, x) {
    return (x, vec[1], vec[2]);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10119
// Size: 0x5d
function get_rumble_ent(rumble) {
    player = get_player_from_self();
    if (!isdefined(rumble)) {
        rumble = "steady_rumble";
    }
    ent = spawn("script_origin", player geteye());
    ent.intensity = 1;
    ent thread update_rumble_intensity(player, rumble);
    return ent;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1017f
// Size: 0x2e
function set_rumble_intensity(intensity) {
    assertex(intensity >= 0 && intensity <= 1, "Intensity must be between 0 and 1");
    self.intensity = intensity;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x101b5
// Size: 0x16
function rumble_ramp_on(time) {
    thread rumble_ramp_to(1, time);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x101d3
// Size: 0x15
function rumble_ramp_off(time) {
    thread rumble_ramp_to(0, time);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x101f0
// Size: 0x98
function rumble_ramp_to(dest, time) {
    self notify("new_ramp");
    self endon("new_ramp");
    self endon("death");
    frames = time * 20;
    dif = dest - self.intensity;
    slice = dif / frames;
    for (i = 0; i < frames; i++) {
        self.intensity += slice;
        wait 0.05;
    }
    self.intensity = dest;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10290
// Size: 0x36
function get_player_from_self() {
    if (isdefined(self)) {
        if (!array_contains(level.players, self)) {
            return level.player;
        } else {
            return self;
        }
        return;
    }
    return level.player;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x102ce
// Size: 0x26
function get_player_gameskill() {
    assertex(isplayer(self), "get_player_gameskill() can only be called on a player.");
    return int(self getplayersetting("gameskill"));
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x102fd
// Size: 0x13f
function array_delete_evenly(array, var_56399788aae86e7a, var_bf94515c0e671b69) {
    assertex(var_56399788aae86e7a > 0, "Save size must be at least 1");
    assertex(var_bf94515c0e671b69 > 0, "Removal size must be at least 1");
    assertex(var_56399788aae86e7a < var_bf94515c0e671b69, "Save size must be less than removal size");
    removal = [];
    var_56399788aae86e7a = var_bf94515c0e671b69 - var_56399788aae86e7a;
    foreach (entry in array) {
        removal[removal.size] = entry;
        if (removal.size == var_bf94515c0e671b69) {
            removal = array_randomize(removal);
            for (i = var_56399788aae86e7a; i < removal.size; i++) {
                removal[i] delete();
            }
            removal = [];
        }
    }
    new_array = [];
    foreach (entry in array) {
        if (!isdefined(entry)) {
            continue;
        }
        new_array[new_array.size] = entry;
    }
    return new_array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10445
// Size: 0x51
function waittill_in_range(origin, range, resolution) {
    if (!isdefined(resolution)) {
        resolution = 0.5;
    }
    self endon("death");
    while (isdefined(self)) {
        if (distancesquared(origin, self.origin) <= range * range) {
            break;
        }
        wait resolution;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1049e
// Size: 0x51
function waittill_out_of_range(origin, range, resolution) {
    if (!isdefined(resolution)) {
        resolution = 0.5;
    }
    self endon("death");
    while (isdefined(self)) {
        if (distancesquared(origin, self.origin) > range * range) {
            break;
        }
        wait resolution;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x104f7
// Size: 0x13
function enable_surprise() {
    self.newenemyreactiondistsq = squared(512);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10512
// Size: 0x7
function getvehiclearray() {
    return vehicle_getarray();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10522
// Size: 0xa0
function getteamvehiclearray(teams) {
    if (!isarray(teams)) {
        teams[0] = teams;
    }
    vehicles = vehicle_getarray();
    foreach (vehicle in vehicles) {
        if (isdefined(vehicle.team) && array_contains(teams, vehicle.team)) {
            continue;
        }
        vehicles = array_remove(vehicles, vehicle);
    }
    return vehicles;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x105cb
// Size: 0xa8
function getvehiclearray_in_radius(pos, dist, team) {
    vehicles = get_array_of_closest(pos, vehicle_getarray(), undefined, undefined, dist);
    if (isdefined(team)) {
        temp_array = [];
        foreach (vehicle in vehicles) {
            if (is_equal(vehicle.script_team, team)) {
                temp_array[temp_array.size] = vehicle;
            }
        }
        vehicles = temp_array;
    }
    return vehicles;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1067c
// Size: 0x152
function hint(string, timeout, zoffset) {
    if (!isdefined(zoffset)) {
        zoffset = 0;
    }
    var_67eb70c3957052f2 = 0.5;
    level endon("clearing_hints");
    if (isdefined(level.hintelement)) {
        level.hintelement scripts\sp\hud_util::destroyelem();
    }
    level.hintelement = scripts\sp\hud_util::createfontstring("default", 1.5);
    level.hintelement scripts\sp\hud_util::setpoint("MIDDLE", undefined, 0, 30 + zoffset);
    level.hintelement.color = (1, 1, 1);
    level.hintelement settext(string);
    level.hintelement.alpha = 0;
    level.hintelement fadeovertime(0.5);
    level.hintelement.alpha = 1;
    wait 0.5;
    level.hintelement endon("death");
    if (isdefined(timeout)) {
        wait timeout;
    } else {
        return;
    }
    level.hintelement fadeovertime(var_67eb70c3957052f2);
    level.hintelement.alpha = 0;
    wait var_67eb70c3957052f2;
    level.hintelement scripts\sp\hud_util::destroyelem();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x107d6
// Size: 0x4b
function hint_fade() {
    var_67eb70c3957052f2 = 1;
    if (isdefined(level.hintelement)) {
        level notify("clearing_hints");
        level.hintelement fadeovertime(var_67eb70c3957052f2);
        level.hintelement.alpha = 0;
        wait var_67eb70c3957052f2;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10829
// Size: 0xd8
function kill_deathflag(theflag, time) {
    if (!isdefined(level.flag[theflag])) {
        return;
    }
    if (!isdefined(time)) {
        time = 0;
    }
    foreach (var_7b9cfb526bf80cb6 in level.deathflags[theflag]) {
        foreach (element in var_7b9cfb526bf80cb6) {
            if (isalive(element)) {
                element thread kill_deathflag_proc(time);
                continue;
            }
            element delete();
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x10909
// Size: 0xbd
function get_player_view_controller(model, tag, originoffset, turret) {
    if (!isdefined(turret)) {
        turret = "player_view_controller";
    }
    if (!isdefined(originoffset)) {
        originoffset = (0, 0, 0);
    }
    origin = model gettagorigin(tag);
    player_view_controller = spawnturret("misc_turret", origin, turret);
    player_view_controller.angles = model gettagangles(tag);
    player_view_controller setmodel("tag_turret");
    player_view_controller linkto(model, tag, originoffset, (0, 0, 0));
    player_view_controller makeunusable();
    player_view_controller hide();
    player_view_controller setmode("manual");
    return player_view_controller;
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x109cf
// Size: 0x42
function create_blend(func, var1, var2, var3) {
    ent = spawnstruct();
    ent childthread process_blend(func, self, var1, var2, var3);
    return ent;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10a1a
// Size: 0x11b
function store_players_weapons(scene) {
    if (!isdefined(self.stored_weapons)) {
        self.stored_weapons = [];
    }
    array = [];
    weapons = self getweaponslistall();
    foreach (weapon in weapons) {
        weaponname = getcompleteweaponname(weapon);
        array[weaponname] = [];
        array[weaponname]["clip_left"] = self getweaponammoclip(weapon, "left");
        array[weaponname]["clip_right"] = self getweaponammoclip(weapon, "right");
        array[weaponname]["stock"] = self getweaponammostock(weapon);
    }
    if (!isdefined(scene)) {
        scene = "default";
    }
    self.stored_weapons[scene] = [];
    self.stored_weapons[scene]["current_weapon"] = self getcurrentweapon();
    self.stored_weapons[scene]["inventory"] = array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10b3d
// Size: 0x137
function restore_players_weapons(scene, immediate) {
    if (!isdefined(scene)) {
        scene = "default";
    }
    if (!isdefined(self.stored_weapons) || !isdefined(self.stored_weapons[scene])) {
        println("<dev string:x46a>" + scene + "<dev string:x499>");
        return;
    }
    self takeallweapons();
    foreach (weapon, array in self.stored_weapons[scene]["inventory"]) {
        if (weaponinventorytype(weapon) != "altmode") {
            self giveweapon(weapon);
        }
        self setweaponammoclip(weapon, array["clip_left"], "left");
        self setweaponammoclip(weapon, array["clip_right"], "right");
        self setweaponammostock(weapon, array["stock"]);
    }
    current_weapon = self.stored_weapons[scene]["current_weapon"];
    if (!isnullweapon(current_weapon)) {
        if (istrue(immediate)) {
            self switchtoweaponimmediate(current_weapon);
            return;
        }
        self switchtoweapon(current_weapon);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c7c
// Size: 0x112
function hide_entity() {
    switch (self.code_classname) {
    case #"hash_3872eb7d97592cac":
    case #"hash_3e0cb1082de9d2a8":
    case #"hash_4af55147c6098215": 
        self hide();
        break;
    case #"hash_6318af6067faf262": 
        self hide();
        self notsolid();
        if (self.spawnflags & 1) {
            self connectpaths();
        }
        break;
    case #"hash_1b79c5d9e0f9886a":
    case #"hash_56b6f012db0ab679":
    case #"hash_5bb64935d67fde88":
    case #"hash_5e80cefd309127e7":
    case #"hash_747275424b5fb89f":
    case #"hash_8040aa10d9cac1e8":
    case #"hash_8c50f3158618de8d":
    case #"hash_b19df071202be3de": 
        trigger_off();
        break;
    default: 
        assertmsg("Unable to hide entity at " + self.origin + ". Need to define a method for handling entities of classname " + self.code_classname);
        break;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10d96
// Size: 0x112
function show_entity() {
    switch (self.code_classname) {
    case #"hash_3872eb7d97592cac":
    case #"hash_3e0cb1082de9d2a8":
    case #"hash_4af55147c6098215": 
        self show();
        break;
    case #"hash_6318af6067faf262": 
        self show();
        self solid();
        if (self.spawnflags & 1) {
            self disconnectpaths();
        }
        break;
    case #"hash_1b79c5d9e0f9886a":
    case #"hash_56b6f012db0ab679":
    case #"hash_5bb64935d67fde88":
    case #"hash_5e80cefd309127e7":
    case #"hash_747275424b5fb89f":
    case #"hash_8040aa10d9cac1e8":
    case #"hash_8c50f3158618de8d":
    case #"hash_b19df071202be3de": 
        trigger_on();
        break;
    default: 
        assertmsg("Unable to show entity at " + self.origin + ". Need to define a method for handling entities of classname " + self.code_classname);
        break;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10eb0
// Size: 0xb3
function set_moveplaybackrate(rate, time) {
    self notify("set_moveplaybackrate");
    self endon("set_moveplaybackrate");
    self endon("death");
    if (isdefined(time)) {
        current_rate = asm_getmoveplaybackrate();
        range = rate - current_rate;
        interval = 0.05;
        numcycles = time / interval;
        fraction = range / numcycles;
        while (abs(rate - current_rate) > abs(fraction * 1.1)) {
            asm_setmoveplaybackrate(current_rate + fraction);
            wait interval;
            current_rate = asm_getmoveplaybackrate();
        }
    }
    asm_setmoveplaybackrate(rate);
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x10f6b
// Size: 0xd0
function array_spawn_function(array, func, param1, param2, param3, param4) {
    assertex(isdefined(array), "That isn't an array!");
    assertex(isarray(array), "That isn't an array!");
    assertex(array.size, "That array is empty!");
    foreach (spawner in array) {
        assertex(isspawner(spawner), "This isn't a spawner!");
        spawner thread add_spawn_function(func, param1, param2, param3, param4);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x11043
// Size: 0x67
function array_spawn_function_targetname(key, func, param1, param2, param3, param4) {
    array = getspawnerarray(key);
    array = array_merge(array, getentarray(key, "targetname"));
    array_spawn_function(array, func, param1, param2, param3, param4);
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x110b2
// Size: 0x6d
function array_spawn_function_noteworthy(key, func, param1, param2, param3, param4) {
    array = get_spawner_array(key, "script_noteworthy");
    array = array_merge(array, getentarray(key, "script_noteworthy"));
    array_spawn_function(array, func, param1, param2, param3, param4);
}

// Namespace utility / scripts\engine\sp\utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x11127
// Size: 0x53
function array_spawn_function_aigroup(key, func, param1, param2, param3, param4) {
    array = get_ai_group_spawners(key);
    array_spawn_function(array, func, param1, param2, param3, param4);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11182
// Size: 0xd
function enable_dontevershoot() {
    self.dontevershoot = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11197
// Size: 0xc
function disable_dontevershoot() {
    self.dontevershoot = 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x111ab
// Size: 0x17c
function mask_exploders_in_volume(volumes) {
    if (getdvar(@"hash_284cbc4392371c00") != "") {
        return;
    }
    ents = getentarray("script_brushmodel", "classname");
    smodels = getentarray("script_model", "classname");
    for (i = 0; i < smodels.size; i++) {
        ents[ents.size] = smodels[i];
    }
    foreach (volume in volumes) {
        foreach (ent in ents) {
            if (isdefined(ent.script_prefab_exploder)) {
                ent.script_exploder = ent.script_prefab_exploder;
            }
            if (!isdefined(ent.script_exploder)) {
                continue;
            }
            if (!isdefined(ent.model)) {
                continue;
            }
            if (ent.code_classname != "script_model") {
                continue;
            }
            if (!ent istouching(volume)) {
                continue;
            }
            ent.masked_exploder = 1;
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1132f
// Size: 0x200
function activate_exploders_in_volume() {
    var_bec13b7c1b25df68 = spawn("script_origin", (0, 0, 0));
    foreach (var_f8ac4f4543b492e8 in level.createfxent) {
        if (!isdefined(var_f8ac4f4543b492e8.v["masked_exploder"])) {
            continue;
        }
        var_bec13b7c1b25df68.origin = var_f8ac4f4543b492e8.v["origin"];
        var_bec13b7c1b25df68.angles = var_f8ac4f4543b492e8.v["angles"];
        if (!var_bec13b7c1b25df68 istouching(self)) {
            continue;
        }
        model_name = var_f8ac4f4543b492e8.v["masked_exploder"];
        spawnflags = var_f8ac4f4543b492e8.v["masked_exploder_spawnflags"];
        disconnect_paths = var_f8ac4f4543b492e8.v["masked_exploder_script_disconnectpaths"];
        var_409e0e80f2171b93 = spawn("script_model", (0, 0, 0), spawnflags);
        var_409e0e80f2171b93 setmodel(model_name);
        var_409e0e80f2171b93.origin = var_f8ac4f4543b492e8.v["origin"];
        var_409e0e80f2171b93.angles = var_f8ac4f4543b492e8.v["angles"];
        var_f8ac4f4543b492e8.v["masked_exploder"] = undefined;
        var_f8ac4f4543b492e8.v["masked_exploder_spawnflags"] = undefined;
        var_f8ac4f4543b492e8.v["masked_exploder_script_disconnectpaths"] = undefined;
        var_409e0e80f2171b93.disconnect_paths = disconnect_paths;
        var_409e0e80f2171b93.script_exploder = var_f8ac4f4543b492e8.v["exploder"];
        scripts\common\exploder::setup_individual_exploder(var_409e0e80f2171b93);
        var_f8ac4f4543b492e8.model = var_409e0e80f2171b93;
    }
    var_bec13b7c1b25df68 delete();
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11537
// Size: 0x19d
function delete_destructibles_in_volumes(volumes, var_474701ab4c04774e) {
    foreach (volume in volumes) {
        volume.destructibles = [];
    }
    names = ["destructible_toy", "destructible_vehicle"];
    var_ad1166b62b968e30 = 0;
    if (!isdefined(var_474701ab4c04774e)) {
        var_474701ab4c04774e = 0;
    }
    foreach (name in names) {
        destructible_toy = getentarray(name, "targetname");
        foreach (var_e97365032a8760eb in destructible_toy) {
            foreach (volume in volumes) {
                if (var_474701ab4c04774e) {
                    var_ad1166b62b968e30++;
                    var_ad1166b62b968e30 %= 5;
                    if (var_ad1166b62b968e30 == 1) {
                        wait 0.05;
                    }
                }
                if (!volume istouching(var_e97365032a8760eb)) {
                    continue;
                }
                var_e97365032a8760eb delete();
                break;
            }
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x116dc
// Size: 0x17d
function delete_exploders_in_volumes(volumes, var_474701ab4c04774e) {
    ents = getentarray("script_brushmodel", "classname");
    smodels = getentarray("script_model", "classname");
    for (i = 0; i < smodels.size; i++) {
        ents[ents.size] = smodels[i];
    }
    var_c6a508e00615231 = [];
    var_bec13b7c1b25df68 = spawn("script_origin", (0, 0, 0));
    var_ad1166b62b968e30 = 0;
    if (!isdefined(var_474701ab4c04774e)) {
        var_474701ab4c04774e = 0;
    }
    foreach (volume in volumes) {
        foreach (ent in ents) {
            if (!isdefined(ent.script_exploder)) {
                continue;
            }
            var_bec13b7c1b25df68.origin = ent getorigin();
            if (!volume istouching(var_bec13b7c1b25df68)) {
                continue;
            }
            var_c6a508e00615231[var_c6a508e00615231.size] = ent;
        }
    }
    array_delete(var_c6a508e00615231);
    var_bec13b7c1b25df68 delete();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11861
// Size: 0xb7
function waittill_volume_dead() {
    for (;;) {
        ai = getaispeciesarray("axis", "all");
        var_1b645337cd41a04f = 0;
        foreach (guy in ai) {
            if (!isalive(guy)) {
                continue;
            }
            if (guy istouching(self)) {
                var_1b645337cd41a04f = 1;
                break;
            }
            wait 0.0125;
        }
        if (!var_1b645337cd41a04f) {
            var_cb6f0fb8b5464bcf = get_ai_touching_volume("axis");
            if (!var_cb6f0fb8b5464bcf.size) {
                break;
            }
        }
        wait 0.05;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11920
// Size: 0xdd
function waittill_volume_dead_or_dying() {
    var_68261d6b57587746 = 0;
    for (;;) {
        ai = getaispeciesarray("axis", "all");
        var_1b645337cd41a04f = 0;
        foreach (guy in ai) {
            if (!isalive(guy)) {
                continue;
            }
            if (guy istouching(self)) {
                if (guy doinglongdeath()) {
                    continue;
                }
                var_1b645337cd41a04f = 1;
                var_68261d6b57587746 = 1;
                break;
            }
            wait 0.0125;
        }
        if (!var_1b645337cd41a04f) {
            var_cb6f0fb8b5464bcf = get_ai_touching_volume("axis");
            if (!var_cb6f0fb8b5464bcf.size) {
                break;
            } else {
                var_68261d6b57587746 = 1;
            }
        }
        wait 0.05;
    }
    return var_68261d6b57587746;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11a06
// Size: 0x1a
function waittill_volume_dead_then_set_flag(var_6551b2a229ac5b48) {
    waittill_volume_dead();
    flag_set(var_6551b2a229ac5b48);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11a28
// Size: 0x44
function waittill_targetname_volume_dead_then_set_flag(targetname, msg) {
    volume = getent(targetname, "targetname");
    assertex(isdefined(volume), "No volume for targetname " + targetname);
    volume waittill_volume_dead_then_set_flag(msg);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11a74
// Size: 0x68
function array_index_by_parameters(var_705ce1a2233e5d34) {
    array = [];
    foreach (item in var_705ce1a2233e5d34) {
        array[item.script_parameters] = item;
    }
    return array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11ae5
// Size: 0x68
function array_index_by_classname(var_705ce1a2233e5d34) {
    array = [];
    foreach (item in var_705ce1a2233e5d34) {
        array[item.classname] = item;
    }
    return array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11b56
// Size: 0xa0
function array_index_by_script_index(array) {
    newarray = [];
    foreach (ent in array) {
        if (isdefined(ent.script_index)) {
            assertex(!isdefined(newarray[ent.script_index]), "Multiple ents had the same script_index of " + ent.script_index);
            newarray[ent.script_index] = ent;
        }
    }
    return newarray;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11bff
// Size: 0x8c
function get_color_volume_from_trigger() {
    info = get_color_info_from_trigger();
    team = info["team"];
    foreach (code in info["codes"]) {
        volume = level.arrays_of_colorcoded_volumes[team][code];
        if (isdefined(volume)) {
            return volume;
        }
    }
    return undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11c94
// Size: 0x8c
function get_color_nodes_from_trigger() {
    info = get_color_info_from_trigger();
    team = info["team"];
    foreach (code in info["codes"]) {
        nodes = level.arrays_of_colorcoded_nodes[team][code];
        if (isdefined(nodes)) {
            return nodes;
        }
    }
    return undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11d29
// Size: 0x11
function get_splineid(targetname) {
    return getcsplineid(targetname);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11d43
// Size: 0x11
function get_splineidarray(targetname) {
    return getcsplineidarray(targetname);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11d5d
// Size: 0x2b
function earthquake_and_rumble(position) {
    playrumbleonposition("grenade_rumble", position);
    earthquake(0.4, 0.5, position, 400);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11d90
// Size: 0x34
function pathrandompercent_set(value) {
    if (!isdefined(self.old_pathrandompercent)) {
        self.old_pathrandompercent = self.pathrandompercent;
    }
    self.pathrandompercent = value;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11dcc
// Size: 0x2c
function pathrandompercent_zero() {
    if (isdefined(self.old_pathrandompercent)) {
        return;
    }
    self.old_pathrandompercent = self.pathrandompercent;
    self.pathrandompercent = 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e00
// Size: 0x1e
function pathrandompercent_reset() {
    self.pathrandompercent = self.old_pathrandompercent;
    self.old_pathrandompercent = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e26
// Size: 0x48
function walkdist_zero() {
    if (isdefined(self.old_walkdistfacingmotion)) {
        return;
    }
    self.old_walkdist = self.walkdist;
    self.old_walkdistfacingmotion = self.walkdistfacingmotion;
    self.walkdist = 0;
    self.walkdistfacingmotion = 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e76
// Size: 0x60
function walkdist_reset() {
    assert(isdefined(self.old_walkdist));
    assert(isdefined(self.old_walkdistfacingmotion));
    self.walkdist = self.old_walkdist;
    self.walkdistfacingmotion = self.old_walkdistfacingmotion;
    self.old_walkdist = undefined;
    self.old_walkdistfacingmotion = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11ede
// Size: 0xa
function enable_ignorerandombulletdamage_drone() {
    thread ignorerandombulletdamage_drone_proc();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11ef0
// Size: 0xd9
function ignorerandombulletdamage_drone_proc() {
    assertex(!issentient(self), "AI tried to run enable_ignorerandombulletdamage_drone");
    self endon("disable_ignorerandombulletdamage_drone");
    self endon("death");
    self.ignorerandombulletdamage = 1;
    self.fakehealth = self.health;
    self.health = 1000000;
    while (true) {
        damage, attacker = self waittill("damage");
        if (!isplayer(attacker) && issentient(attacker)) {
            if (isdefined(attacker.enemy) && attacker.enemy != self) {
                continue;
            }
        }
        self.fakehealth -= damage;
        if (self.fakehealth <= 0) {
            break;
        }
    }
    self kill();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11fd1
// Size: 0x19
function hide_notsolid() {
    if (!isai(self)) {
        self notsolid();
    }
    self hide();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11ff2
// Size: 0x19
function show_solid() {
    if (!isai(self)) {
        self solid();
    }
    self show();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12013
// Size: 0x15
function set_brakes(num) {
    self.veh_brake = num;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12030
// Size: 0x3e
function disable_ignorerandombulletdamage_drone() {
    if (!isalive(self)) {
        return;
    }
    if (!isdefined(self.ignorerandombulletdamage)) {
        return;
    }
    self notify("disable_ignorerandombulletdamage_drone");
    self.ignorerandombulletdamage = undefined;
    self.health = self.fakehealth;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12076
// Size: 0x2f
function timeoutent(timeout) {
    ent = spawnstruct();
    ent delaythread(timeout, &send_notify, "timeout");
    return ent;
}

// Namespace utility / scripts\engine\sp\utility
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x120ae
// Size: 0x55
function delaychildthread(timer, func, param1, param2, param3, param4, param5, param6) {
    childthread delaychildthread_proc(func, timer, param1, param2, param3, param4, param5, param6);
}

// Namespace utility / scripts\engine\sp\utility
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1210b
// Size: 0x63
function flagwaitthread(flag, func, param1, param2, param3, param4, param5) {
    if (!isarray(flag)) {
        flag = [flag, 0];
    }
    thread flagwaitthread_proc(func, flag, param1, param2, param3, param4, param5);
}

// Namespace utility / scripts\engine\sp\utility
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x12176
// Size: 0x6a
function waittillthread(note, func, param1, param2, param3, param4, param5) {
    self endon("death");
    if (!isarray(note)) {
        note = [note, 0];
    }
    thread waittillthread_proc(func, note, param1, param2, param3, param4, param5);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x121e8
// Size: 0x21
function set_group_advance_to_enemy_parameters(interval, group_size) {
    function_64041b55e7ef96b(interval);
    function_77641e56fef12f25(group_size);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12211
// Size: 0x27
function set_battlechatter_variable(team, val) {
    level.battlechatter[team] = val;
    update_battlechatter_hud();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12240
// Size: 0x7f
function get_minutes_and_seconds(milliseconds) {
    time = [];
    time["minutes"] = 0;
    time["seconds"] = int(milliseconds / 1000);
    while (time["seconds"] >= 60) {
        time["minutes"]++;
        time["seconds"] = time["seconds"] - 60;
    }
    if (time["seconds"] < 10) {
        time["seconds"] = "0" + time["seconds"];
    }
    return time;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x122c8
// Size: 0xbf
function player_has_weapon(weap) {
    objweapon = weap;
    if (isstring(weap)) {
        attachments = function_6527364c1ecca6c6(weap);
        if (istrue(attachments.size)) {
            objweapon = makeweapon(weap, attachments);
        } else {
            objweapon = makeweaponfromstring(weap);
        }
    }
    weaponlist = level.player.primaryinventory;
    foreach (weapon in weaponlist) {
        if (issameweapon(weapon, objweapon, 1)) {
            return true;
        }
    }
    return false;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12390
// Size: 0xa5
function player_has_base_weapon(weap) {
    objweapon = weap;
    if (isstring(weap)) {
        objweapon = makeweaponfromstring(weap);
    }
    weaponlist = level.player.primaryinventory;
    foreach (weapon in weaponlist) {
        if (weapon.basename == objweapon.basename) {
            return true;
        }
    }
    return false;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1243e
// Size: 0xc7
function player_has_equipment(weap, var_26ee5805a9b07f08) {
    objweapon = weap;
    if (isstring(weap)) {
        attachments = function_6527364c1ecca6c6(weap);
        if (istrue(attachments.size)) {
            objweapon = makeweapon(weap, attachments);
        } else {
            objweapon = makeweaponfromstring(weap);
        }
    }
    var_70148ff25532a07f = level.player.offhandinventory;
    foreach (weapon in var_70148ff25532a07f) {
        if (issameweapon(weapon, objweapon, 1)) {
            return true;
        }
    }
    return false;
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1250e
// Size: 0x7b
function graph_position(v, min_x, min_y, max_x, max_y) {
    rise = max_y - min_y;
    run = max_x - min_x;
    assertex(run != 0, "max and min x must be different, or you havent defined any graph space.");
    slope = rise / run;
    v -= max_x;
    v = slope * v;
    v += max_y;
    return v;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12592
// Size: 0x3f
function musiclength(alias) {
    time = lookupsoundlength(alias);
    assertex(time > 0, "Music alias " + alias + " had zero time.");
    time *= 0.001;
    return time;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x125da
// Size: 0x23
function is_command_bound(cmd) {
    binding = getkeybinding(cmd);
    return binding["count"];
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12606
// Size: 0x26
function template_level(levelname) {
    iprintlnbold("remove 'template_level( " + levelname + " );' from " + levelname + ".gsc - this will error as of 5/19");
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12634
// Size: 0x1d
function fx_volume_pause_noteworthy(noteworthy, var_474701ab4c04774e) {
    thread fx_volume_pause_noteworthy_thread(noteworthy, var_474701ab4c04774e);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12659
// Size: 0x47
function fx_volume_pause_noteworthy_thread(noteworthy, var_474701ab4c04774e) {
    volume = getent(noteworthy, "script_noteworthy");
    volume notify("new_volume_command");
    volume endon("new_volume_command");
    wait 0.05;
    fx_volume_pause(volume, var_474701ab4c04774e);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x126a8
// Size: 0x14
function fx_volume_restart_noteworthy(noteworthy) {
    thread fx_volume_restart_noteworthy_thread(noteworthy);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x126c4
// Size: 0x59
function fx_volume_restart_noteworthy_thread(noteworthy) {
    volume = getent(noteworthy, "script_noteworthy");
    volume notify("new_volume_command");
    volume endon("new_volume_command");
    wait 0.05;
    if (!isdefined(volume.fx_paused)) {
        return;
    }
    volume.fx_paused = undefined;
    fx_volume_restart(volume);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12725
// Size: 0x2d
function fx_volume_restart(volume) {
    assert(isdefined(volume));
    array_thread(volume.fx, &restarteffect);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1275a
// Size: 0x9c
function add_cleanup_ent(ent, groupname) {
    assert(isdefined(ent));
    assert(isdefined(groupname));
    if (!isdefined(level.cleanup_ents)) {
        level.cleanup_ents = [];
    }
    if (!isdefined(level.cleanup_ents[groupname])) {
        level.cleanup_ents[groupname] = [];
    }
    /#
        if (array_contains(level.cleanup_ents[groupname], ent)) {
            assertmsg("<dev string:x4b2>");
        }
    #/
    level.cleanup_ents[groupname][level.cleanup_ents[groupname].size] = ent;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x127fe
// Size: 0x65
function cleanup_ents(groupname) {
    assert(isdefined(level.cleanup_ents));
    assert(isdefined(level.cleanup_ents[groupname]));
    array = level.cleanup_ents[groupname];
    array = array_removeundefined(array);
    array_delete(array);
    level.cleanup_ents[groupname] = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1286b
// Size: 0xdf
function cleanup_ents_removing_bullet_shield(groupname) {
    if (!isdefined(level.cleanup_ents)) {
        return;
    }
    if (!isdefined(level.cleanup_ents[groupname])) {
        return;
    }
    array = level.cleanup_ents[groupname];
    array = array_removeundefined(array);
    foreach (obj in array) {
        if (!isai(obj)) {
            continue;
        }
        if (!isalive(obj)) {
            continue;
        }
        if (!isdefined(obj.magic_bullet_shield)) {
            continue;
        }
        if (!obj.magic_bullet_shield) {
            continue;
        }
        obj stop_magic_bullet_shield();
    }
    array_delete(array);
    level.cleanup_ents[groupname] = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12952
// Size: 0x36
function add_trigger_function(function) {
    if (!isdefined(self.trigger_functions)) {
        thread add_trigger_func_thread();
    }
    self.trigger_functions[self.trigger_functions.size] = function;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12990
// Size: 0x36
function function_1c0a584731a90429(function) {
    if (!isdefined(self.var_f08830decd9eb50a)) {
        thread function_d4c885c9ef5c6bc8();
    }
    self.var_f08830decd9eb50a[self.var_f08830decd9eb50a.size] = function;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x129ce
// Size: 0x91
function getallweapons() {
    array = [];
    entities = getentarray();
    foreach (ent in entities) {
        if (!isdefined(ent.classname)) {
            continue;
        }
        if (string_starts_with(ent.classname, "weapon_")) {
            array[array.size] = ent;
        }
    }
    return array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12a68
// Size: 0xc3
function move_with_rate(origin, angles, moverate) {
    assert(isdefined(origin));
    assert(isdefined(angles));
    assert(isdefined(moverate));
    self notify("newmove");
    self endon("newmove");
    if (!isdefined(moverate)) {
        moverate = 200;
    }
    dist = distance(self.origin, origin);
    movetime = dist / moverate;
    movevec = vectornormalize(origin - self.origin);
    self moveto(origin, movetime, 0, 0);
    self rotateto(angles, movetime, 0, 0);
    wait movetime;
    if (!isdefined(self)) {
        return;
    }
    self.velocity = movevec * dist / movetime;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12b33
// Size: 0x1e
function flag_on_death(msg) {
    level endon(msg);
    self waittill("death");
    flag_set(msg);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12b59
// Size: 0xd
function enable_damagefeedback() {
    level.damagefeedback = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12b6e
// Size: 0xc
function disable_damagefeedback() {
    level.damagefeedback = 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12b82
// Size: 0x19
function is_damagefeedback_enabled() {
    return isdefined(level.damagefeedback) && level.damagefeedback;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12ba4
// Size: 0x64
function worldtolocalcoords(var_1a80ce8d4527040a) {
    var_f3589428c6ee8c59 = var_1a80ce8d4527040a - self.origin;
    return (vectordot(var_f3589428c6ee8c59, anglestoforward(self.angles)), -1 * vectordot(var_f3589428c6ee8c59, anglestoright(self.angles)), vectordot(var_f3589428c6ee8c59, anglestoup(self.angles)));
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12c11
// Size: 0x57
function sound_fade_and_delete(fade, var_470a4ab760eaae8) {
    self scalevolume(0, fade);
    if (istrue(var_470a4ab760eaae8)) {
        delaycall(fade + 0.05, &stoploopsound);
    } else {
        delaycall(fade + 0.05, &stopsounds);
    }
    delaycall(fade + 0.1, &delete);
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x12c70
// Size: 0x83
function sound_fade_in(alias, volume, fade, var_470a4ab760eaae8) {
    self endon("death");
    volume = clamp(volume, 0, 1);
    fade = max(0.05, fade);
    self scalevolume(0);
    wait 0.05;
    if (isdefined(var_470a4ab760eaae8)) {
        self playloopsound(alias);
    } else {
        self playsound(alias);
    }
    wait 0.05;
    delaycall(0.05, &scalevolume, volume, fade);
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x12cfb
// Size: 0x125
function function_e0d4c67fc1a382d0(alias, offset, fadein, fadeout) {
    org = spawn("script_origin", (0, 0, 0));
    org endon("death");
    thread delete_on_death(org);
    if (isdefined(offset)) {
        org.origin = self.origin + offset;
        org.angles = self.angles;
        org linkto(self);
    } else {
        org.origin = self.origin;
        org.angles = self.angles;
        org linkto(self);
    }
    if (isdefined(fadein) && fadein > 0) {
        org scalevolume(0);
    }
    org playloopsound(alias);
    if (isdefined(fadein) && fadein > 0) {
        org scalevolume(1, fadein);
    }
    self waittill("stop sound" + alias);
    if (isdefined(fadeout) && fadeout > 0) {
        org scalevolume(0, fadeout);
        wait fadeout;
    }
    org stoploopsound(alias);
    org delete();
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x12e28
// Size: 0xd3
function intro_screen_create(string1, string2, string3, string4, string5) {
    if (!isdefined(level.introscreen)) {
        level.introscreen = spawnstruct();
    }
    level.introscreen.completed_delay = 3;
    level.introscreen.fade_out_time = 1.5;
    level.introscreen.fade_in_time = undefined;
    level.introscreen.lines = [string1, string2, string3, string4, string5];
    noself_array_call(level.introscreen.lines, &precachestring);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12f03
// Size: 0x3b
function intro_screen_custom_func(function) {
    if (!isdefined(level.introscreen)) {
        level.introscreen = spawnstruct();
    }
    level.introscreen.customfunc = function;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12f46
// Size: 0x12a
function function_8ac37772d2e1050b(var_20e7486efb53100d) {
    /#
        function_64c8bf68f2b25ffe(var_20e7486efb53100d);
    #/
    if (!isdefined(level.var_d06c0df83859d1c3)) {
        level.var_d06c0df83859d1c3 = [];
    } else if (isdefined(level.var_d06c0df83859d1c3[var_20e7486efb53100d]) && level.var_d06c0df83859d1c3[var_20e7486efb53100d] == 1) {
        return;
    }
    switchtransientset(var_20e7486efb53100d);
    var_7835178d37ed4f9e = gettransientsinset(var_20e7486efb53100d);
    foreach (transient in var_7835178d37ed4f9e) {
        while (!istransientloaded(transient)) {
            waitframe();
        }
    }
    foreach (index, item in level.var_d06c0df83859d1c3) {
        if (index != var_20e7486efb53100d) {
            level.var_d06c0df83859d1c3[index] = 0;
        }
    }
    level.var_d06c0df83859d1c3[var_20e7486efb53100d] = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13078
// Size: 0x3f
function function_b919f3d6c1f1f825(var_20e7486efb53100d) {
    /#
        function_64c8bf68f2b25ffe(var_20e7486efb53100d);
    #/
    if (isdefined(level.var_d06c0df83859d1c3)) {
        if (isdefined(level.var_d06c0df83859d1c3[var_20e7486efb53100d])) {
            return level.var_d06c0df83859d1c3[var_20e7486efb53100d];
        }
    }
    return 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x130c0
// Size: 0x6c
function function_c42fe942fb416ae7() {
    if (isdefined(level.var_d06c0df83859d1c3)) {
        foreach (index, item in level.var_d06c0df83859d1c3) {
            if (level.var_d06c0df83859d1c3[index] == 1) {
                return index;
            }
        }
    }
    return undefined;
}

/#

    // Namespace utility / scripts\engine\sp\utility
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x13135
    // Size: 0x78
    function private function_64c8bf68f2b25ffe(var_20e7486efb53100d) {
        names = gettransientsetnames();
        foreach (name in names) {
            if (name == var_20e7486efb53100d) {
                return 1;
            }
        }
        assertmsg(var_20e7486efb53100d + "<dev string:x4db>");
    }

#/

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x131b5
// Size: 0x5d
function transient_load(name) {
    if (istransientloaded(name)) {
        return;
    }
    if (!flag_exist(name + "_loaded")) {
        flag_init(name + "_loaded");
    }
    loadtransient(name);
    while (!istransientloaded(name)) {
        waitframe();
    }
    flag_set(name + "_loaded");
    level notify("new_transient_loaded");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1321a
// Size: 0x37
function transient_unload(name) {
    if (!istransientloaded(name)) {
        return;
    }
    unloadtransient(name);
    while (istransientloaded(name)) {
        waitframe();
    }
    flag_clear(name + "_loaded");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13259
// Size: 0xc3
function transient_load_array(var_9d68a5fd6a22178c) {
    foreach (name in var_9d68a5fd6a22178c) {
        thread transient_load(name);
    }
    while (true) {
        alldone = 1;
        foreach (name in var_9d68a5fd6a22178c) {
            if (!istransientloaded(name)) {
                alldone = 0;
                break;
            }
        }
        if (alldone) {
            break;
        }
        waitframe();
    }
    level notify("new_transient_loaded");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13324
// Size: 0xbb
function transient_unload_array(var_9d68a5fd6a22178c) {
    foreach (name in var_9d68a5fd6a22178c) {
        thread transient_unload(name);
    }
    while (true) {
        alldone = 1;
        foreach (name in var_9d68a5fd6a22178c) {
            if (istransientloaded(name)) {
                alldone = 0;
                break;
            }
        }
        if (alldone) {
            break;
        }
        waitframe();
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x133e7
// Size: 0x55
function function_17175f6af83bafea(var_9d68a5fd6a22178c) {
    foreach (name in var_9d68a5fd6a22178c) {
        settransientvisibility(name, 1);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13444
// Size: 0x54
function function_7dcc5e04ab79399b(var_9d68a5fd6a22178c) {
    foreach (name in var_9d68a5fd6a22178c) {
        settransientvisibility(name, 0);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x134a0
// Size: 0x32
function transient_init(name) {
    assertex(!isdefined(level.script), "Can't create transients after load::main()");
    flag_init(name + "_loaded");
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x134da
// Size: 0x43
function transient_switch(prev, next) {
    if (flag(prev + "_loaded")) {
        transient_unload(prev);
    }
    if (!flag(next + "_loaded")) {
        transient_load(next);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13525
// Size: 0x19
function transient_unloadall_and_load(name) {
    unloadalltransients();
    transient_load(name);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13546
// Size: 0x3cb
function follow_path_and_animate(start_node, require_player_dist) {
    self endon("death");
    self endon("stop_path");
    self notify("stop_going_to_node");
    self notify("follow_path");
    self endon("follow_path");
    wait 0.1;
    node = start_node;
    getfunc = undefined;
    var_a2674252a261ca4 = undefined;
    if (!isdefined(require_player_dist)) {
        require_player_dist = 300;
    }
    self.current_follow_path = node;
    node script_delay();
    while (isdefined(node)) {
        self.current_follow_path = node;
        if (isdefined(node.lookahead)) {
            break;
        }
        if (isdefined(level.struct_class_names["targetname"][node.targetname])) {
            var_a2674252a261ca4 = &follow_path_animate_set_struct;
        } else if (isdefined(node.classname)) {
            var_a2674252a261ca4 = &follow_path_animate_set_ent;
        } else {
            var_a2674252a261ca4 = &follow_path_animate_set_node;
        }
        if (isdefined(node.radius) && node.radius != 0) {
            self.goalradius = node.radius;
        }
        if (self.goalradius < 16) {
            self.goalradius = 16;
        }
        if (isdefined(node.height) && node.height != 0) {
            self.goalheight = node.height;
        }
        var_3869c92dbf9cc5c2 = self.goalradius;
        self childthread [[ var_a2674252a261ca4 ]](node);
        if (isdefined(node.animation)) {
            node waittill(node.animation);
        } else {
            while (true) {
                self waittill("goal");
                if (distance(node.origin, self.origin) < var_3869c92dbf9cc5c2 + 10 || self.team != "allies") {
                    break;
                }
            }
        }
        node notify("trigger", self);
        if (isdefined(node.script_flag_set)) {
            flag_set(node.script_flag_set);
        }
        if (isdefined(node.script_parameters)) {
            words = strtok(node.script_parameters, " ");
            for (i = 0; i < words.size; i++) {
                if (isdefined(level.custom_followpath_parameter_func)) {
                    self [[ level.custom_followpath_parameter_func ]](words[i], node);
                }
                if (self.type == "dog") {
                    continue;
                }
                switch (words[i]) {
                case #"hash_493b8f0ecdefe593": 
                    enable_cqbwalk();
                    break;
                case #"hash_4a90998c82aa254a": 
                    disable_cqbwalk();
                    break;
                case #"hash_9843391b4c654860": 
                    self delete();
                    return;
                }
            }
        }
        if (!isdefined(node.script_requires_player) && require_player_dist > 0 && self.team == "allies") {
            while (isalive(level.player)) {
                if (follow_path_wait_for_player(node, require_player_dist)) {
                    break;
                }
                if (isdefined(node.animation)) {
                    self.goalradius = var_3869c92dbf9cc5c2;
                    self setgoalpos(self.origin);
                }
                wait 0.05;
            }
        }
        if (!isdefined(node.target)) {
            break;
        }
        if (isdefined(node.script_flag_wait)) {
            flag_wait(node.script_flag_wait);
        }
        if (isdefined(node.script_flag_waitopen)) {
            flag_waitopen(node.script_flag_waitopen);
        }
        node script_delay();
        node = node get_target_ent();
    }
    self notify("path_end_reached");
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13919
// Size: 0x158
function follow_path_wait_for_player(node, dist) {
    if (distance(level.player.origin, node.origin) < distance(self.origin, node.origin)) {
        return true;
    }
    vec = undefined;
    vec = anglestoforward(self.angles);
    vec2 = vectornormalize(level.player.origin - self.origin);
    if (isdefined(node.target)) {
        temp = get_target_ent(node.target);
        vec = vectornormalize(temp.origin - node.origin);
    } else if (isdefined(node.angles)) {
        vec = anglestoforward(node.angles);
    } else {
        vec = anglestoforward(self.angles);
    }
    if (vectordot(vec, vec2) > 0) {
        return true;
    }
    if (distance(level.player.origin, self.origin) < dist) {
        return true;
    }
    return false;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13a7a
// Size: 0xb7
function follow_path_animate_set_node(node) {
    self notify("follow_path_new_goal");
    if (isdefined(node.animation)) {
        node scripts\sp\anim::anim_generic_reach(self, node.animation);
        self notify("starting_anim", node.animation);
        if (isdefined(node.script_parameters) && issubstr(node.script_parameters, "gravity")) {
            node scripts\sp\anim::anim_generic_gravity(self, node.animation);
        } else {
            node scripts\common\anim::anim_generic_run(self, node.animation);
        }
        self setgoalpos(self.origin);
        return;
    }
    set_goal_node(node);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13b39
// Size: 0xb7
function follow_path_animate_set_ent(ent) {
    self notify("follow_path_new_goal");
    if (isdefined(ent.animation)) {
        ent scripts\sp\anim::anim_generic_reach(self, ent.animation);
        self notify("starting_anim", ent.animation);
        if (isdefined(ent.script_parameters) && issubstr(ent.script_parameters, "gravity")) {
            ent scripts\sp\anim::anim_generic_gravity(self, ent.animation);
        } else {
            ent scripts\common\anim::anim_generic_run(self, ent.animation);
        }
        self setgoalpos(self.origin);
        return;
    }
    set_goal_ent(ent);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13bf8
// Size: 0xd9
function follow_path_animate_set_struct(struct) {
    self notify("follow_path_new_goal");
    if (isdefined(struct.animation)) {
        struct scripts\sp\anim::anim_generic_reach(self, struct.animation);
        self notify("starting_anim", struct.animation);
        disable_exits();
        if (isdefined(struct.script_parameters) && issubstr(struct.script_parameters, "gravity")) {
            struct scripts\sp\anim::anim_generic_gravity(self, struct.animation);
        } else {
            struct scripts\common\anim::anim_generic_run(self, struct.animation);
        }
        delaythread(0.05, &enable_exits);
        self setgoalpos(self.origin);
        return;
    }
    set_goal_pos(struct.origin);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13cd9
// Size: 0x3b
function post_load_precache(function) {
    if (!isdefined(level.post_load_funcs)) {
        level.post_load_funcs = [];
    }
    level.post_load_funcs = array_add(level.post_load_funcs, function);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13d1c
// Size: 0x36
function ui_action_slot_force_active_on(slot) {
    dvarname = hashcat(@"hash_d0d5f7f6113a71e8", slot, "_forceActive");
    setdvar(dvarname, "on");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13d5a
// Size: 0x36
function ui_action_slot_force_active_off(slot) {
    dvarname = hashcat(@"hash_d0d5f7f6113a71e8", slot, "_forceActive");
    setdvar(dvarname, "turn_off");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13d98
// Size: 0x36
function ui_action_slot_force_active_one_time(slot) {
    dvarname = hashcat(@"hash_d0d5f7f6113a71e8", slot, "_forceActive");
    setdvar(dvarname, "onetime");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13dd6
// Size: 0xa2
function init_waits() {
    if (!add_init_script("waits", &init_waits)) {
        return;
    }
    level.waits = spawnstruct();
    level.waits.wait_any_func_array = [];
    level.waits.run_func_after_wait_array = [];
    level.waits.run_call_after_wait_array = [];
    level.waits.run_noself_call_after_wait_array = [];
    level.waits.do_wait_endons_array = [];
    level.waits.abort_wait_any_func_array = [];
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13e80
// Size: 0x35f
function set_start_location(val, guys) {
    nodes = [];
    if (isstring(val)) {
        nodes = get_target_array(val);
    } else if (isarray(val)) {
        nodes = val;
    }
    if (nodes.size == 0) {
        return;
    }
    if (!isarray(guys)) {
        guys = [guys];
    }
    foreach (guy in guys) {
        start_node = undefined;
        foreach (node in nodes) {
            if (!isdefined(node.angles)) {
                node.angles = (0, 0, 0);
            }
            if (!isdefined(node.script_noteworthy)) {
                continue;
            }
            if (isdefined(node.taken)) {
                continue;
            }
            if (isplayer(guy)) {
                if (node.script_noteworthy == "player") {
                    start_node = node;
                    break;
                }
                continue;
            }
            if (isdefined(guy.script_noteworthy) && guy.script_noteworthy == node.script_noteworthy) {
                start_node = node;
                break;
            }
        }
        if (isdefined(start_node)) {
            start_node.taken = 1;
            guy.start_node = start_node;
            if (isai(guy)) {
                guy setgoalpos(start_node.origin);
            }
            guy teleport_ent(start_node);
        }
    }
    foreach (guy in guys) {
        if (isdefined(guy.start_node)) {
            continue;
        }
        foreach (node in nodes) {
            if (!isdefined(node.taken)) {
                node.taken = 1;
                guy.start_node = node;
                if (isai(guy)) {
                    guy setgoalpos(node.origin);
                }
                guy teleport_ent(node);
                break;
            }
        }
    }
    foreach (guy in guys) {
        if (isdefined(guy.start_node)) {
            guy.start_node = undefined;
        }
    }
    foreach (node in nodes) {
        if (isdefined(node.taken)) {
            node.taken = undefined;
        }
    }
}

/#

    // Namespace utility / scripts\engine\sp\utility
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x141e7
    // Size: 0x19
    function kleenex_popup(autosave) {
        println("<dev string:x4f9>");
    }

#/

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14208
// Size: 0x25
function set_nvg_vision(vision, blendtime) {
    level.player scripts\sp\nvg\nvg_player::set_nvg_vision_proc(vision, blendtime);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14235
// Size: 0x1c
function set_nvg_light(light) {
    level.player scripts\sp\nvg\nvg_player::set_nvg_light_proc(light);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14259
// Size: 0x1c
function set_nvg_flir(enable) {
    level.player scripts\sp\nvg\nvg_player::set_nvg_flir_proc(enable);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1427d
// Size: 0x42
function is_flir_vision_on() {
    assertex(isplayer(self), "checking flir state on a non-player");
    if (isdefined(self.nvg) && self.nvg.flir) {
        return 1;
    }
    return 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x142c7
// Size: 0xa9
function player_gesture_combat(var_b03cfac5ee568943, lookatent) {
    assertex(self == level.player, "player_gesture_force must be called on level.player!");
    self endon("death");
    var_447611fd38474e73 = 0;
    blendtime = undefined;
    var_689635fc115b1160 = 0;
    if (level.player get_player_demeanor() == "safe") {
        blendtime = 1;
        var_689635fc115b1160 = 1;
    }
    var_e3fc3c4ab75476a4 = 0;
    if (isdefined(lookatent)) {
        var_447611fd38474e73 = self playgestureviewmodel(var_b03cfac5ee568943, lookatent, var_e3fc3c4ab75476a4, blendtime, undefined);
    } else {
        var_447611fd38474e73 = self playgestureviewmodel(var_b03cfac5ee568943, undefined, var_e3fc3c4ab75476a4, blendtime, undefined);
    }
    return var_447611fd38474e73;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14379
// Size: 0x51
function player_gesture_noncombat(var_b03cfac5ee568943, lookatent) {
    assertex(self == level.player, "player_gesture_force must be called on level.player!");
    self endon("death");
    if (self isfiring()) {
        return 0;
    }
    if (self isreloading()) {
        return 0;
    }
    return player_gesture_force(var_b03cfac5ee568943, lookatent);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x143d3
// Size: 0xcf
function player_gesture_force(var_b03cfac5ee568943, lookatent) {
    assertex(self == level.player, "player_gesture_force must be called on level.player!");
    self endon("death");
    var_447611fd38474e73 = 0;
    blendtime = undefined;
    var_689635fc115b1160 = 0;
    if (level.player get_player_demeanor() == "safe") {
        blendtime = 0.2;
        var_689635fc115b1160 = 1;
    }
    if (isdefined(lookatent) && isent(lookatent)) {
        var_447611fd38474e73 = self forceplaygestureviewmodel(var_b03cfac5ee568943, lookatent, blendtime, undefined, undefined);
    } else {
        var_447611fd38474e73 = self forceplaygestureviewmodel(var_b03cfac5ee568943, undefined, blendtime, undefined, undefined);
    }
    if (var_447611fd38474e73) {
        thread scripts\sp\player\gestures::player_gestures_input_disable(var_b03cfac5ee568943, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, undefined, "gesture");
    }
    return var_447611fd38474e73;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x144ab
// Size: 0x36
function get_ai_group_count(aigroup) {
    return level._ai_group[aigroup].spawnercount + level._ai_group[aigroup].aicount;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x144ea
// Size: 0x82
function get_ai_group_sentient_count(aigroup) {
    level._ai_group[aigroup].ai = array_removedead_or_dying(level._ai_group[aigroup].ai);
    level._ai_group[aigroup].ai = array_removeundefined(level._ai_group[aigroup].ai);
    return level._ai_group[aigroup].aicount;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14575
// Size: 0x20
function get_ai_group_spawner_count(aigroup) {
    return level._ai_group[aigroup].spawnercount;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1459e
// Size: 0x20
function get_ai_group_death_count(aigroup) {
    return level._ai_group[aigroup].aideaths;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x145c7
// Size: 0x20
function get_ai_group_spawners(aigroup) {
    return level._ai_group[aigroup].spawners;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x145f0
// Size: 0x82
function get_ai_group_ai(aigroup) {
    level._ai_group[aigroup].ai = array_removedead_or_dying(level._ai_group[aigroup].ai);
    level._ai_group[aigroup].ai = array_removeundefined(level._ai_group[aigroup].ai);
    return level._ai_group[aigroup].ai;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1467b
// Size: 0x45
function waittill_ai_group_dead(aigroup) {
    while (level._ai_group[aigroup].aicount || level._ai_group[aigroup].spawnercount) {
        wait 0.05;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x146c8
// Size: 0x4c
function fx_playontag_safe(fx, tag, delay, end_note, var_a6d635ca3756e9d7) {
    if (!isdefined(self.fx_ticket_queue)) {
        fx_regulate_init();
    }
    thread fx_playontag_safe_internal(fx, tag, delay, end_note, var_a6d635ca3756e9d7);
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1471c
// Size: 0xb8
function fx_playontag_safe_internal(fx, tag, delay, end_note, var_a6d635ca3756e9d7) {
    self endon("death");
    self endon("entitydeleted");
    if (isdefined(end_note)) {
        self endon(end_note);
    }
    if (isdefined(delay)) {
        wait delay;
    }
    fx_regulate();
    /#
        if (getdvarint(@"hash_4c2f239edafa91c9")) {
            print3d(self gettagorigin(tag), "<dev string:x52f>" + tag + "<dev string:x535>" + fx, (0, 1, 0), 1, 0.7, 20);
        }
    #/
    if (!isdefined(var_a6d635ca3756e9d7) || !var_a6d635ca3756e9d7) {
        test_tag(tag, fx);
    }
    playfxontag(getfx(fx), self, tag);
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x147dc
// Size: 0x4c
function fx_stopontag_safe(fx, tag, delay, end_note, var_a6d635ca3756e9d7) {
    if (!isdefined(self.fx_ticket_queue)) {
        fx_regulate_init();
    }
    thread fx_stopontag_safe_internal(fx, tag, delay, end_note, var_a6d635ca3756e9d7);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14830
// Size: 0x1ca
function test_tag(tag, fx) {
    if (self.model == "") {
        assertmsg("attempting to play fx <" + fx + "> on tag <" + tag + ">, but the entities model is empty");
    }
    if (isai(self)) {
        success = 0;
        models = [];
        if (isdefined(self.headmodel) && self.headmodel != "") {
            models[models.size] = self.headmodel;
        }
        if (isdefined(self.hatmodel) && self.hatmodel != "") {
            models[models.size] = self.hatmodel;
        }
        if (!isnullweapon(self.weapon)) {
            models[models.size] = getweaponmodel(self.weapon);
        }
        models[models.size] = self.model;
        foreach (model in models) {
            if (hastag(model, tag)) {
                success = 1;
                break;
            }
        }
        if (!success) {
            assertmsg("attempting to play fx <" + fx + "> on tag <" + tag + ">, but tag <" + tag + "> does not exist in ai <" + self.model + ">");
        }
        return;
    }
    if (!hastag(self.model, tag)) {
        assertmsg("attempting to play fx <" + fx + "> on tag <" + tag + ">, but tag <" + tag + "> does not exist in model <" + self + ">");
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x14a02
// Size: 0x72
function fx_stopontag_safe_internal(fx, tag, delay, end_note, var_a6d635ca3756e9d7) {
    self endon("death");
    self endon("entitydeleted");
    if (isdefined(end_note)) {
        self endon(end_note);
    }
    if (isdefined(delay)) {
        wait delay;
    }
    fx_regulate();
    if (!isdefined(var_a6d635ca3756e9d7) || !var_a6d635ca3756e9d7) {
        test_tag(tag, fx);
    }
    stopfxontag(getfx(fx), self, tag);
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x14a7c
// Size: 0x4c
function fx_killontag_safe(fx, tag, delay, end_note, var_a6d635ca3756e9d7) {
    if (!isdefined(self.fx_ticket_queue)) {
        fx_regulate_init();
    }
    thread fx_killontag_safe_internal(fx, tag, delay, end_note, var_a6d635ca3756e9d7);
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x14ad0
// Size: 0x9d
function fx_killontag_safe_internal(fx, tag, delay, end_note, var_a6d635ca3756e9d7) {
    self endon("death");
    self endon("entitydeleted");
    if (isdefined(end_note)) {
        self endon(end_note);
    }
    if (isdefined(delay)) {
        wait delay;
    }
    fx_regulate();
    if (!isdefined(var_a6d635ca3756e9d7) || !var_a6d635ca3756e9d7) {
        test_tag(tag, fx);
    }
    if (tag == "tag_flash" && isnullweapon(self.weapon)) {
        println("<dev string:x53b>");
        return;
    }
    killfxontag(getfx(fx), self, tag);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14b75
// Size: 0x1b
function get_fx_ticket() {
    self.fx_ticket++;
    return string(self.fx_ticket);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14b99
// Size: 0x2c
function fx_regulate_init() {
    if (isdefined(self.fx_ticket_queue)) {
        return;
    }
    self.fx_ticket_queue = [];
    self.fx_ticket = 0;
    thread fx_regulator();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14bcd
// Size: 0x7d
function fx_regulator() {
    self endon("entitydeleted");
    i = 0;
    while (true) {
        self waittill("new_fx_call");
        while (self.fx_ticket_queue.size > 0) {
            ticket = self.fx_ticket_queue[0];
            self.fx_ticket_queue = array_remove(self.fx_ticket_queue, ticket);
            self notify(ticket);
            i++;
            if (i == 3) {
                wait 0.05;
                i = 0;
            }
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14c52
// Size: 0x46
function fx_regulate() {
    self endon("death");
    self endon("entitydeleted");
    ticket = get_fx_ticket();
    self.fx_ticket_queue = array_add(self.fx_ticket_queue, ticket);
    self notify("new_fx_call");
    self waittill(ticket);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14ca0
// Size: 0x43
function stop_player_gesture(gesture) {
    assertex(self == level.player, "stop_player_gesture must be called on level.player!");
    if (isdefined(gesture)) {
        self stopgestureviewmodel(gesture);
    } else {
        self stopgestureviewmodel();
    }
    self notify("gesture_stop");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14ceb
// Size: 0xce
function set_player_demeanor(var_2ac2e047fa8225e9) {
    assertex(self == level.player, "set_player_demeanor must be called on level.player!");
    self notify("entering_new_demeanor");
    if (!isdefined(self.gestures)) {
        self.gestures = spawnstruct();
    }
    waittillframeend();
    switch (var_2ac2e047fa8225e9) {
    case #"hash_dc5052e5ad5e04ee": 
        scripts\sp\player\gestures::enter_demeanor_green_beam();
        break;
    case #"hash_84fcf5e68d7230b2": 
        scripts\sp\player\gestures::enter_demeanor_normal();
        break;
    case #"hash_c95b4ea9bd7d7dfc": 
        scripts\sp\player\gestures::enter_demeanor_relaxed();
        break;
    case #"hash_9682e089e580b4b8": 
        scripts\sp\player\gestures::enter_demeanor_safe();
        break;
    default: 
        assertmsg("set_player_demeanor called with invalid demeanorName '" + var_2ac2e047fa8225e9 + "'!");
        break;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14dc1
// Size: 0x10
function get_player_demeanor() {
    return level.player getdemeanorviewmodel();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14dda
// Size: 0x39
function init_gravity() {
    if (!isdefined(level.gravity_gameplay)) {
        level.gravity_gameplay = getdvarint(@"bg_gravity");
        level.gravity_physics = getomnvar("physics_gravity_z");
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14e1b
// Size: 0x52
function scale_gravity(var_4bc7ab4f16d366e0, var_441d643f70dc71e3) {
    init_gravity();
    if (isdefined(var_4bc7ab4f16d366e0)) {
        setsaveddvar(@"bg_gravity", level.gravity_gameplay * var_4bc7ab4f16d366e0);
    }
    if (isdefined(var_441d643f70dc71e3)) {
        physics_setgravity((0, 0, level.gravity_physics * var_441d643f70dc71e3));
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14e75
// Size: 0x4e
function atmosphere_enable(enable) {
    if (!isdefined(enable)) {
        enable = 1;
    }
    if (enable && !level.atmosphere) {
        level.atmosphere = enable;
        return;
    }
    if (!enable && level.atmosphere) {
        level.atmosphere = enable;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14ecb
// Size: 0x3e
function set_gravity(var_50f1f50958156800, var_1fb3cb1fe0a8c7f3) {
    init_gravity();
    if (isdefined(var_50f1f50958156800)) {
        setsaveddvar(@"bg_gravity", var_50f1f50958156800);
    }
    if (isdefined(var_1fb3cb1fe0a8c7f3)) {
        physics_setgravity((0, 0, var_1fb3cb1fe0a8c7f3));
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14f11
// Size: 0x2c
function reset_gravity() {
    setsaveddvar(@"bg_gravity", level.gravity_gameplay);
    physics_setgravity((0, 0, level.gravity_physics));
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14f45
// Size: 0x3d
function gesture_stop(var_480e0d93b559931c) {
    thread namespace_3123a12d1da4993::ai_gesture_eyes_stop(var_480e0d93b559931c * 0.1);
    thread namespace_3123a12d1da4993::ai_gesture_stop(var_480e0d93b559931c);
    self notify("stop_lookat");
    self notify("gesture_natural_stop");
    self.playing_gesture = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14f8a
// Size: 0x14
function gesture_torso_stop(var_480e0d93b559931c) {
    thread namespace_3123a12d1da4993::ai_gesture_torso_stop(var_480e0d93b559931c);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14fa6
// Size: 0x14
function gesture_eyes_stop(var_480e0d93b559931c) {
    thread namespace_3123a12d1da4993::ai_gesture_eyes_stop(var_480e0d93b559931c);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14fc2
// Size: 0x1b
function gesture_head_stop(var_480e0d93b559931c) {
    namespace_3123a12d1da4993::ai_gesture_stop(var_480e0d93b559931c);
    self notify("stop_lookat");
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14fe5
// Size: 0x2d
function gesture_follow_lookat(var_968583169a58b079, var_ebc28d027b66fd81, blend_in_time) {
    self endon("death");
    thread namespace_3123a12d1da4993::ai_gesture_lookat(var_968583169a58b079, var_ebc28d027b66fd81, blend_in_time);
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1501a
// Size: 0x2f
function gesture_follow_lookat_natural(var_968583169a58b079, var_ebc28d027b66fd81, blend_in_time, var_1134633b00730d29) {
    thread namespace_3123a12d1da4993::ai_gesture_lookat_natural(var_968583169a58b079, var_ebc28d027b66fd81, blend_in_time, var_1134633b00730d29);
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15051
// Size: 0x26
function gesture_follow_eyes(var_968583169a58b079, var_ebc28d027b66fd81, blend_in_time) {
    thread namespace_3123a12d1da4993::ai_gesture_eyes_lookat(var_968583169a58b079, var_ebc28d027b66fd81, blend_in_time);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1507f
// Size: 0x1d
function gesture_follow_torso(var_968583169a58b079, blend_in_time) {
    thread namespace_3123a12d1da4993::ai_gesture_lookat_torso(var_968583169a58b079, blend_in_time);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x150a4
// Size: 0x1c
function gesture_follow_lookat_update(var_3e53e7e020018fc0, var_809d5bbb11b6031c) {
    namespace_3123a12d1da4993::ai_gesture_update_lookat(var_3e53e7e020018fc0, var_809d5bbb11b6031c);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x150c8
// Size: 0x1c
function gesture_follow_eye_update(var_3e53e7e020018fc0, var_809d5bbb11b6031c) {
    namespace_3123a12d1da4993::ai_gesture_update_eyes_lookat(var_3e53e7e020018fc0, var_809d5bbb11b6031c);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x150ec
// Size: 0x13
function gesture_point(var_4a32ecbaa6c22f70) {
    namespace_3123a12d1da4993::ai_gesture_point(var_4a32ecbaa6c22f70);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15107
// Size: 0x13
function gesture_simple(var_7ca8d1ce367054f8) {
    namespace_3123a12d1da4993::ai_gesture_simple(var_7ca8d1ce367054f8);
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15122
// Size: 0x25
function gesture_directional_custom(target, anim_array, var_4e9e76b78d716037) {
    namespace_3123a12d1da4993::ai_gesture_directional_custom(target, anim_array, var_4e9e76b78d716037);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1514f
// Size: 0x1c
function gesture_custom(gesture_anim, var_4e9e76b78d716037) {
    namespace_3123a12d1da4993::ai_custom_gesture(gesture_anim, var_4e9e76b78d716037);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15173
// Size: 0x129
function gesture_eye_dart_loop(var_a9892a7cfb14ea8a, var_b572592541b23c03) {
    self endon("death");
    self endon("stop_lookat");
    self endon("eye_gesture_stop");
    if (!isdefined(self.is_eye_tracking)) {
        thread gesture_follow_eyes(var_a9892a7cfb14ea8a, 4, 0.1);
    }
    if (isdefined(var_b572592541b23c03) && var_b572592541b23c03) {
        thread gesture_follow_lookat(var_a9892a7cfb14ea8a, 0.15, 0.7);
    }
    wait 0.7;
    while (true) {
        thread gesture_follow_eye_update(var_a9892a7cfb14ea8a, 2);
        wait randomfloatrange(3, 5);
        var_a113289062b5d506 = var_a9892a7cfb14ea8a geteye() + (randomfloatrange(-5, 5), randomfloatrange(-5, 5), randomfloatrange(-2, 2));
        thread gesture_follow_eye_update(var_a113289062b5d506, 2);
        wait randomfloatrange(0.25, 0.5);
        if (cointoss()) {
            var_a113289062b5d506 = var_a9892a7cfb14ea8a geteye() + (randomfloatrange(-5, 5), randomfloatrange(-5, 5), randomfloatrange(-2, 2));
            thread gesture_follow_eye_update(var_a113289062b5d506, 2);
            wait randomfloatrange(0.25, 0.5);
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x152a4
// Size: 0xeb
function gesture_simple_when_close(var_7ca8d1ce367054f8, dist, var_deb1cd851149b0bf, var_8a65799b42bd1960) {
    self endon("death");
    self endon("gesture_stop");
    var_abcce04725ab3c73 = squared(dist);
    scripts\sp\interaction_manager::add_actor_to_manager();
    var_30e775ecae84eb6a = distance2dsquared(self.origin, var_deb1cd851149b0bf.origin);
    while (true) {
        if (var_30e775ecae84eb6a < var_abcce04725ab3c73 && scripts\sp\interaction_manager::can_play_nearby_gesture(dist * 3)) {
            break;
        }
        var_30e775ecae84eb6a = distance2dsquared(self.origin, var_deb1cd851149b0bf.origin);
        waitframe();
    }
    self.playing_gesture = 1;
    if (isdefined(var_8a65799b42bd1960)) {
        thread gesture_simple(var_7ca8d1ce367054f8);
        self [[ var_8a65799b42bd1960 ]]();
    } else {
        gesture_simple(var_7ca8d1ce367054f8);
    }
    wait 2;
    scripts\sp\interaction_manager::remove_actor_from_manager();
    self.playing_gesture = 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15397
// Size: 0xe7
function get_direction_value(var_c99a285cabf7ec7b, var_88daf353e30acf25, targetorigin) {
    anglestopoint = vectortoangles(targetorigin - var_88daf353e30acf25);
    angle = var_c99a285cabf7ec7b[1] - anglestopoint[1];
    angle += 360;
    angle = int(angle) % 360;
    if (angle > 350 || angle < 10) {
        direction = "8";
    } else if (angle < 60) {
        direction = "9";
    } else if (angle < 120) {
        direction = "6";
    } else if (angle < 150) {
        direction = "3";
    } else if (angle < 210) {
        direction = "2";
    } else if (angle < 240) {
        direction = "1";
    } else if (angle < 300) {
        direction = "4";
    } else {
        direction = "7";
    }
    return direction;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15487
// Size: 0x22
function give_melee_weapon(weapon) {
    take_melee_weapon();
    self giveweapon(weapon);
    self assignweaponmeleeslot(weapon);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x154b1
// Size: 0x5f
function take_melee_weapon() {
    meleeweapons = self.meleeweapons;
    foreach (meleeweapon in meleeweapons) {
        self takeweapon(meleeweapon);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15518
// Size: 0xd1
function offhandprecache(var_d76d57a68de988cc) {
    scripts\sp\equipment\offhands::init();
    offhandprecachefuncs = scripts\sp\equipment\offhands::offhandprecachefuncs();
    foreach (offhand in var_d76d57a68de988cc) {
        if (scripts\sp\equipment\offhands::offhandisprecached(offhand)) {
            continue;
        }
        precacheitem(offhand);
        if (array_contains_key(offhandprecachefuncs, offhand)) {
            [[ offhandprecachefuncs[offhand] ]](offhand);
        } else {
            assertmsg("attempting to prechache offhand <" + offhand + "> that has no precache func in scriptsspequipmentoffhands::offhandPrecacheFuncs()");
        }
        level.offhands.precached = array_add(level.offhands.precached, offhand);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x155f1
// Size: 0x3f
function give_offhand(weapon, var_1c7780cbd65c3c09, var_36a8844e4a3ba501) {
    if (isplayer(self)) {
        scripts\sp\player::offhandswap(weapon, var_1c7780cbd65c3c09, var_36a8844e4a3ba501);
        return;
    }
    assertmsg("give_offhand() should be called on player only");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15638
// Size: 0x2d
function take_offhand(weapon) {
    if (isplayer(self)) {
        scripts\sp\player::offhandremove(weapon);
        return;
    }
    assertmsg("give_offhand() should be called on player only");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1566d
// Size: 0x63
function get_melee_weapon() {
    meleeweapons = self.meleeweapons;
    foreach (meleeweapon in meleeweapons) {
        if (!isnullweapon(meleeweapon)) {
            return meleeweapon;
        }
    }
    return undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x156d9
// Size: 0x49
function give_action_slot_weapon(objweapon) {
    assert(isweapon(objweapon));
    self.actionslotweapon = objweapon;
    self giveweapon(objweapon);
    if (val::get("action_slot_weapon")) {
        self setactionslot(1, "weapon", objweapon);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1572a
// Size: 0x2a
function take_action_slot_weapon() {
    self setactionslot(1, "");
    self takeweapon(self.actionslotweapon);
    self.actionslotweapon = undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1575c
// Size: 0x22
function get_action_slot_weapon() {
    if (isdefined(self.actionslotweapon)) {
        return self.actionslotweapon;
    }
    return "";
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15786
// Size: 0xeb
function get_weapons_list_primaries(var_9b06efbc2fe3c5d6, var_cec1830ed2616f91) {
    primaryweapons = level.player.primaryweapons;
    if (isdefined(var_9b06efbc2fe3c5d6) && var_9b06efbc2fe3c5d6 == 1) {
        primaryweapons = array_combine(primaryweapons, level.player.alternateweapons);
    }
    filteredweapons = [];
    meleeweapon = level.player get_melee_weapon();
    if (isdefined(meleeweapon) && (!isdefined(var_cec1830ed2616f91) || var_cec1830ed2616f91 == 0)) {
        foreach (weapon in primaryweapons) {
            if (weapon != meleeweapon) {
                filteredweapons[filteredweapons.size] = weapon;
            }
        }
    } else {
        filteredweapons = primaryweapons;
    }
    return filteredweapons;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1587a
// Size: 0xd
function is_primary_equipment_button_down() {
    return flag("primary_equipment_input_down");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15890
// Size: 0xe
function wait_primary_equipment_button_up() {
    flag_waitopen("primary_equipment_input_down");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x158a6
// Size: 0xe
function wait_primary_equipment_button_down() {
    flag_wait("primary_equipment_input_down");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x158bc
// Size: 0x16
function wait_primary_equipment_button_pressed() {
    self waittill("primary_equipment_pressed");
    flag_wait("primary_equipment_input_down");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x158da
// Size: 0xd
function is_primary_equipment_in_use() {
    return flag("primary_equipment_in_use");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x158f0
// Size: 0xd
function is_secondary_equipment_button_down() {
    return flag("secondary_equipment_input_down");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15906
// Size: 0xe
function wait_secondary_equipment_button_up() {
    flag_waitopen("secondary_equipment_input_down");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1591c
// Size: 0xe
function wait_secondary_equipment_button_down() {
    flag_wait("secondary_equipment_input_down");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15932
// Size: 0x16
function wait_secondary_equipment_button_pressed() {
    self waittill("secondary_equipment_pressed");
    flag_wait("secondary_equipment_input_down");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15950
// Size: 0xd
function is_secondary_equipment_in_use() {
    return flag("secondary_equipment_in_use");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15966
// Size: 0x3
function get_primary_equipment() {
    return undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15972
// Size: 0x3
function get_primary_equipment_ammo() {
    return false;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1597e
// Size: 0x3
function get_secondary_equipment() {
    return undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1598a
// Size: 0x3
function get_secondary_equipment_ammo() {
    return false;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15996
// Size: 0x3
function get_stored_primary_equipment() {
    return undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x159a2
// Size: 0x4
function get_stored_primary_equipment_ammo() {
    return true;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x159af
// Size: 0x3
function get_stored_secondary_equipment() {
    return undefined;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x159bb
// Size: 0x4
function get_stored_secondary_equipment_ammo() {
    return true;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x159c8
// Size: 0xb2
function get_equipment_ammo(var_65914ef96f138c42) {
    var_db58c0ab3e7d1066 = [&get_primary_equipment, &get_stored_primary_equipment, &get_secondary_equipment, &get_stored_secondary_equipment];
    var_9403124dcdf20fce = [&get_primary_equipment_ammo, &get_stored_primary_equipment_ammo, &get_secondary_equipment_ammo, &get_stored_secondary_equipment_ammo];
    for (x = 0; x < var_db58c0ab3e7d1066.size; x++) {
        equipment = [[ var_db58c0ab3e7d1066[x] ]]();
        ammo = [[ var_9403124dcdf20fce[x] ]]();
        if (isdefined(equipment) && equipment == var_65914ef96f138c42) {
            return ammo;
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15a82
// Size: 0x2d
function get_corpse_origin() {
    if (getdvarint(@"hash_32196fa75434c856") && isactorcorpse(self)) {
        return self getcorpsephysicsorigin();
    }
    return self.origin;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15ab8
// Size: 0x25
function hudoutline_add_channel(channelname, priority, hudoutlinesettings) {
    scripts\sp\outline::hudoutline_add_channel_internal(channelname, priority, hudoutlinesettings);
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15ae5
// Size: 0x25
function hudoutline_add_child_channel(channelname, priority, var_f264487ee10b8afb) {
    scripts\sp\outline::hudoutline_add_child_channel_internal(channelname, priority, var_f264487ee10b8afb);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15b12
// Size: 0x1c
function hudoutline_force_channel(channelname, var_c3f2838383281c9d) {
    scripts\sp\outline::hudoutline_force_channel_internal(channelname, var_c3f2838383281c9d);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15b36
// Size: 0x1c
function hudoutline_enable_new(hudoutlineasset, channelname) {
    scripts\sp\outline::hudoutline_enable_internal(channelname, hudoutlineasset);
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x15b5a
// Size: 0x30
function hudoutline_enable(color_index, var_aa202f6993ccc074, var_e1558af7c1cd5ad2, channelname) {
    scripts\sp\outline::hudoutline_enable_internal(channelname, "outline_depth_red");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15b92
// Size: 0x13
function hudoutline_disable(channelname) {
    scripts\sp\outline::hudoutline_disable_internal(channelname);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15bad
// Size: 0x2e
function hudoutline_channel_animation(channelname, var_4706652761de8d03) {
    scripts\sp\outline::play_animation_on_channel(channelname, var_4706652761de8d03);
    level notify("hudoutline_anim_complete");
    level notify("hudoutline_anim_complete" + channelname);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15be3
// Size: 0x1d
function hudoutline_channel_animation_loop(channelname, var_4706652761de8d03) {
    thread scripts\sp\outline::play_animation_on_channel_loop(channelname, var_4706652761de8d03);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15c08
// Size: 0x10e
function hudoutline_vis_enemy_settings(var_b4c5adb007bc6a66) {
    if (!isdefined(var_b4c5adb007bc6a66)) {
        var_b4c5adb007bc6a66 = 1;
    }
    setsaveddvar(@"r_hudOutlineEnable", 1);
    var_2404ba146fcf9c19 = "0.5 0.5 0.5";
    var_2404b9146fcf99e6 = "1 1 1";
    if (var_b4c5adb007bc6a66) {
        var_2404ba146fcf9c19 = "0.5 0.5 0.5 1";
        var_2404b9146fcf99e6 = "0.5 0.5 0.5 0.2";
        var_d685dfe2e3084122 = "0.5 0.5 0.5 1";
        var_3237f5d053c238a8 = "0.7 0.7 0.7 1";
        var_1e261a3df31da8ed = "0.5 0.5 0.5 1";
    } else {
        var_2404ba146fcf9c19 = "0.5 0.5 0.5 0";
        var_2404b9146fcf99e6 = "0.5 0.5 0.5 0";
        var_d685dfe2e3084122 = "0.5 0.5 0.5 1";
        var_3237f5d053c238a8 = "0.5 0.5 0.5 0.5";
        var_1e261a3df31da8ed = "0.5 0.5 0.5 0.5";
    }
    setsaveddvar(@"r_hudOutlineFillColor0", var_2404ba146fcf9c19);
    setsaveddvar(@"r_hudOutlineFillColor1", var_2404b9146fcf99e6);
    setsaveddvar(@"r_hudOutlineOccludedOutlineColor", var_d685dfe2e3084122);
    setsaveddvar(@"r_hudOutlineOccludedInlineColor", var_3237f5d053c238a8);
    setsaveddvar(@"r_hudOutlineOccludedInteriorColor", var_1e261a3df31da8ed);
    setsaveddvar(@"r_hudOutlineOccludedColorFromFill", 1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15d1e
// Size: 0xa7
function hudoutline_vis_enemy(enabled, forcedteam) {
    var_a03351218e3800d5["allies"] = "friendly";
    var_a03351218e3800d5["axis"] = "enemy";
    var_a03351218e3800d5["team3"] = "neutral";
    var_a03351218e3800d5["dead"] = "neutral";
    if (isdefined(forcedteam)) {
        team = forcedteam;
    } else if (isdefined(self.team)) {
        team = self.team;
    } else {
        team = "dead";
    }
    if (enabled && isdefined(var_a03351218e3800d5[team])) {
        set_hudoutline(var_a03351218e3800d5[team], 0);
        return;
    }
    self hudoutlinedisable();
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15dcd
// Size: 0x99
function hud_bink(var_22cd6ae7dcae5e3f) {
    setomnvar("ui_show_bink", 1);
    setsaveddvar(@"bg_cinematicFullscreen", "0");
    setsaveddvar(@"bg_cinematicCanPause", "1");
    cinematicingame(var_22cd6ae7dcae5e3f);
    while (!iscinematicplaying()) {
        waitframe();
    }
    while (iscinematicplaying()) {
        waitframe();
    }
    stopcinematicingame();
    setomnvar("ui_show_bink", 0);
    setsaveddvar(@"bg_cinematicFullscreen", "1");
    setsaveddvar(@"bg_cinematicCanPause", "1");
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15e6e
// Size: 0x40
function hud_fluff_text_message(var_b20525d46c0361c9, context) {
    if (!isdefined(var_b20525d46c0361c9)) {
        var_b20525d46c0361c9 = "fluff_messages_default";
    }
    if (!isdefined(context)) {
        context = 1;
    }
    setomnvar("ui_sp_fluff_messaging", var_b20525d46c0361c9);
    setomnvar("ui_sp_fluff_messaging_context", context);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15eb6
// Size: 0x3f
function _intel_waypoint_button_listener() {
    level notify("stopstop_intel_waypoint_int");
    level endon("stop_intel_waypoint");
    self.intel_waypoint_request = undefined;
    self notifyonplayercommand("set_waypoint", "+weapnext");
    self waittill("set_waypoint");
    self.intel_waypoint_request = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15efd
// Size: 0x4f
function _intel_dismiss_button_listener() {
    self endon("dismiss_skipped");
    self notifyonplayercommand("intel_dismiss", "+gostand");
    self notifyonplayercommand("intel_dismiss", "+activate");
    self notifyonplayercommand("intel_dismiss", "+usereload");
    self waittill("intel_dismiss");
    self.intel_dismiss_request = 1;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15f54
// Size: 0x29
function init_manipulate_ent() {
    var_e0a173ed691689e1 = getentarray("manipulate_ent", "script_noteworthy");
    array_thread(var_e0a173ed691689e1, &manipulate_ent_setup);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15f85
// Size: 0x20e
function manipulate_ent_setup() {
    if (isdefined(self.script_flag_wait)) {
        flag_init(self.script_flag_wait);
    }
    if (isdefined(self.script_flag_waitopen)) {
        flag_init(self.script_flag_waitopen);
    }
    if (isdefined(self.script_deathflag)) {
        flag_init(self.script_deathflag);
    }
    if (isdefined(self.script_rotation_speed)) {
        self.start_angles = self.angles;
        if (!isdefined(self.script_rotation_max)) {
            self.script_rotation_max = (0, 0, 0);
        }
        self.rotation_spring_index = [];
        for (i = 0; i < 3; i++) {
            if (self.script_rotation_max[i] != 0) {
                if (self.script_rotation_speed[i] > 0) {
                    self.rotation_spring_index[i] = math::spring_make_under_damped(self.script_rotation_speed[i] * 10, 0, self.start_angles[i] + self.script_rotation_max[i], 0);
                    continue;
                }
                assertmsg("A manipulate_ent that has a script_rotation_max must also have a script_rotation_speed greater than 0");
            }
        }
        thread rotate_ent_think();
    }
    if (isdefined(self.script_translate_speed)) {
        self.start_origin = self.origin;
        if (!isdefined(self.script_translate_max)) {
            self.script_translate_max = (0, 0, 0);
        }
        self.translate_spring_index = [];
        for (i = 0; i < 3; i++) {
            if (self.script_translate_max[i] != 0) {
                if (self.script_translate_speed[i] > 0) {
                    self.translate_spring_index[i] = math::spring_make_under_damped(self.script_translate_speed[i] * 10, 0, self.start_origin[i] + self.script_translate_max[i], 0);
                    continue;
                }
                assertmsg("A manipulate_ent that has a script_translate_max must also have a script_translate_speed greater than 0");
            }
        }
        thread translate_ent_think();
    }
    thread manipulate_ent_death_think();
    thread manipulate_ent_cleanup();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1619b
// Size: 0x132
function translate_ent_think() {
    self endon("death");
    self endon("stop_manipulate_ent");
    if (isdefined(self.script_flag_wait)) {
        flag_wait(self.script_flag_wait);
    }
    if (isdefined(self.script_flag_waitopen)) {
        flag_waitopen(self.script_flag_waitopen);
    }
    while (true) {
        new_origin = [];
        for (i = 0; i < 3; i++) {
            if (self.script_translate_speed[i] == 0) {
                new_origin[i] = self.start_origin[i];
                continue;
            }
            if (self.script_translate_speed[i] != 0 && self.script_translate_max[i] == 0) {
                new_origin[i] = self.origin[i] + self.script_translate_speed[i] / 20;
                continue;
            }
            if (self.script_translate_speed[i] > 0 && self.script_translate_max[i] != 0) {
                new_origin[i] = math::spring_update(self.translate_spring_index[i], self.start_origin[i]);
            }
        }
        self.origin = (new_origin[0], new_origin[1], new_origin[2]);
        waitframe();
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x162d5
// Size: 0x144
function rotate_ent_think() {
    self endon("death");
    self endon("stop_manipulate_ent");
    if (isdefined(self.script_flag_wait)) {
        flag_wait(self.script_flag_wait);
    }
    if (isdefined(self.script_flag_waitopen)) {
        flag_waitopen(self.script_flag_waitopen);
    }
    while (true) {
        new_angle = [];
        for (i = 0; i < 3; i++) {
            if (self.script_rotation_speed[i] == 0) {
                new_angle[i] = self.start_angles[i];
                continue;
            }
            if (self.script_rotation_speed[i] != 0 && self.script_rotation_max[i] == 0) {
                new_angle[i] = self.angles[i] + self.script_rotation_speed[i] / 20;
                continue;
            }
            if (self.script_rotation_speed[i] > 0 && self.script_rotation_max[i] != 0) {
                new_angle[i] = math::spring_update(self.rotation_spring_index[i], self.start_angles[i]);
            }
        }
        new_angle = (angleclamp(new_angle[0]), angleclamp(new_angle[1]), angleclamp(new_angle[2]));
        self.angles = new_angle;
        waitframe();
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16421
// Size: 0x52
function manipulate_ent_death_think() {
    self endon("death");
    if (isdefined(self.script_deathflag)) {
        flag_wait(self.script_deathflag);
        if (isdefined(self.script_delete) && self.script_delete) {
            self delete();
            return;
        }
        self notify("stop_manipulate_ent");
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1647b
// Size: 0xc6
function manipulate_ent_cleanup() {
    waittill_either("death", "stop_manipulate_ent");
    if (isdefined(self.rotation_spring_index)) {
        foreach (spring_index in self.rotation_spring_index) {
            math::spring_delete(spring_index);
        }
    }
    if (isdefined(self.translate_spring_index)) {
        foreach (spring_index in self.translate_spring_index) {
            math::spring_delete(spring_index);
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16549
// Size: 0x3d
function strip_suffix(lookupstring, stripstring) {
    if (lookupstring.size <= stripstring.size) {
        return lookupstring;
    }
    if (getsubstr(lookupstring, lookupstring.size - stripstring.size, lookupstring.size) == stripstring) {
        return getsubstr(lookupstring, 0, lookupstring.size - stripstring.size);
    }
    return lookupstring;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1658f
// Size: 0x35
function set_exception(type, func) {
    assert(isdefined(self.exception[type]));
    self.exception[type] = func;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x165cc
// Size: 0x4c
function set_all_exceptions(var_cc281db326fd2a24) {
    keys = getarraykeys(self.exception);
    for (i = 0; i < keys.size; i++) {
        self.exception[keys[i]] = var_cc281db326fd2a24;
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x16620
// Size: 0x136
function waittill_multiple_ents(ent1, string1, ent2, string2, ent3, string3, ent4, string4) {
    self endon("death");
    ent = spawnstruct();
    ent.threads = 0;
    if (isdefined(ent1)) {
        assert(isdefined(string1));
        ent1 childthread waittill_string(string1, ent);
        ent.threads++;
    }
    if (isdefined(ent2)) {
        assert(isdefined(string2));
        ent2 childthread waittill_string(string2, ent);
        ent.threads++;
    }
    if (isdefined(ent3)) {
        assert(isdefined(string3));
        ent3 childthread waittill_string(string3, ent);
        ent.threads++;
    }
    if (isdefined(ent4)) {
        assert(isdefined(string4));
        ent4 childthread waittill_string(string4, ent);
        ent.threads++;
    }
    while (ent.threads) {
        ent waittill("returned");
        ent.threads--;
    }
    ent notify("die");
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1675e
// Size: 0x7b
function get_linked_scriptables() {
    array = [];
    if (isdefined(self.script_linkto)) {
        linknames = get_links();
        if (linknames.size == 1) {
            return getscriptablearray(linknames[0], "script_linkname");
        } else if (linknames.size > 1) {
            return function_10dd8bfac2862053(linknames, "script_linkname");
        }
    }
    if (!array.size && gettime() <= 300) {
        assertmsg("Scriptables are not initialized immediately - do you need to wait until they're initialized?");
    }
    return array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x167e2
// Size: 0xde
function get_linked_vehicles() {
    array = [];
    if (isdefined(self.script_linkto)) {
        linknames = get_links();
        allvehicles = vehicle_getarray();
        foreach (vehicle in allvehicles) {
            foreach (name in linknames) {
                if (is_equal(vehicle.script_linkname, name)) {
                    array[array.size] = vehicle;
                }
            }
        }
    }
    return array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168c9
// Size: 0xde
function get_linked_vehicle_spawners() {
    array = [];
    if (isdefined(self.script_linkto)) {
        linknames = get_links();
        spawners = vehicle_getspawnerarray();
        foreach (spawner in spawners) {
            foreach (name in linknames) {
                if (is_equal(spawner.script_linkname, name)) {
                    array[array.size] = spawner;
                }
            }
        }
    }
    return array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x169b0
// Size: 0xde
function get_linked_spawners() {
    array = [];
    if (isdefined(self.script_linkto)) {
        linknames = get_links();
        var_8a0da49670997c6d = getspawnerarray();
        foreach (spawner in var_8a0da49670997c6d) {
            foreach (name in linknames) {
                if (is_equal(spawner.script_linkname, name)) {
                    array[array.size] = spawner;
                }
            }
        }
    }
    return array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16a97
// Size: 0x5a
function get_linked_vehicle_nodes() {
    array = [];
    if (isdefined(self.script_linkto)) {
        linknames = get_links();
        if (linknames.size == 1) {
            return getvehiclenodearray(linknames[0], "script_linkname");
        } else if (linknames.size > 1) {
            return function_df5a62cb94a82870(linknames, "script_linkname");
        }
    }
    return array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x16afa
// Size: 0x134
function run_thread_on_targetname(msg, func, param1, param2, param3) {
    array = getentarray(msg, "targetname");
    array_thread(array, func, param1, param2, param3);
    if (isdefined(level.getspawnerarrayfunction)) {
        all = builtin [[ level.getspawnerarrayfunction ]](msg);
        foreach (s in all) {
            if (isnonentspawner(s)) {
                array_thread([s], func, param1, param2, param3);
            }
        }
    }
    array = getstructarray(msg, "targetname");
    array_thread(array, func, param1, param2, param3);
    array = builtin [[ level.getnodearrayfunction ]](msg, "targetname");
    array_thread(array, func, param1, param2, param3);
    array = getvehiclenodearray(msg, "targetname");
    array_thread(array, func, param1, param2, param3);
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x16c36
// Size: 0x154
function run_thread_on_noteworthy(msg, func, param1, param2, param3) {
    array = getentarray(msg, "script_noteworthy");
    array_thread(array, func, param1, param2, param3);
    if (isdefined(level.getspawnerarrayfunction)) {
        all = builtin [[ level.getspawnerarrayfunction ]]();
        foreach (s in all) {
            if (isdefined(s.script_noteworthy) && s.script_noteworthy == msg && isnonentspawner(s)) {
                array_thread([s], func, param1, param2, param3);
            }
        }
    }
    array = getstructarray(msg, "script_noteworthy");
    array_thread(array, func, param1, param2, param3);
    array = builtin [[ level.getnodearrayfunction ]](msg, "script_noteworthy");
    array_thread(array, func, param1, param2, param3);
    array = getvehiclenodearray(msg, "script_noteworthy");
    array_thread(array, func, param1, param2, param3);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16d92
// Size: 0x9b
function get_noteworthy_ent(noteworthy) {
    assertex(isdefined(noteworthy), "No script_noteworthy provided!");
    ent = getent(noteworthy, "script_noteworthy");
    if (isdefined(ent)) {
        return ent;
    }
    if (issp()) {
        ent = builtin [[ level.getnodefunction ]](noteworthy, "script_noteworthy");
        if (isdefined(ent)) {
            return ent;
        }
    }
    ent = getstruct(noteworthy, "script_noteworthy");
    if (isdefined(ent)) {
        return ent;
    }
    ent = getvehiclenode(noteworthy, "script_noteworthy");
    if (isdefined(ent)) {
        return ent;
    }
    assertex("Tried to get a ent by noteworthy \"" + noteworthy + "\" but none were found.");
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16e35
// Size: 0x60
function is_locked(msg) {
    assert(isdefined(level.lock));
    assert(isdefined(level.lock[msg]));
    lock = level.lock[msg];
    return lock.count > lock.max_count;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x16e9e
// Size: 0xb7
function getfarthest(org, array, maxdist) {
    if (!isdefined(maxdist)) {
        maxdist = 500000;
    }
    dist = 0;
    ent = undefined;
    foreach (item in array) {
        newdist = distance(item.origin, org);
        if (newdist <= dist || newdist >= maxdist) {
            continue;
        }
        dist = newdist;
        ent = item;
    }
    return ent;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16f5e
// Size: 0x96
function array_sort_by_handler(array, compare_func) {
    assertex(isdefined(array), "Array not defined.");
    assertex(isdefined(compare_func), "Compare function not defined.");
    for (i = 0; i < array.size - 1; i++) {
        for (j = i + 1; j < array.size; j++) {
            if (array[j] [[ compare_func ]]() < array[i] [[ compare_func ]]()) {
                ref = array[j];
                array[j] = array[i];
                array[i] = ref;
            }
        }
    }
    return array;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16ffd
// Size: 0xd8
function monitor_interact_delay(interact, var_7154510918c87924) {
    who = interact waittill("trigger");
    level.player enableslowaim(0.1, 0.1);
    level.player val::set("monitor_interact_delay", "ads", 0);
    while (!level.player isonground()) {
        wait 0.05;
    }
    currentstance = level.player getstance();
    if (currentstance != var_7154510918c87924) {
        level.player setstance(var_7154510918c87924);
        if (currentstance == "prone") {
            wait 0.2;
        }
    }
    level.player disableslowaim();
    level.player val::reset_all("monitor_interact_delay");
    return who;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x170de
// Size: 0x81
function ai_create_weapon_stow(weapon) {
    self.weapon_stow = spawn("script_model", self gettagorigin("tag_stowed_back"));
    self.weapon_stow setmodel(getweaponmodel(weapon));
    self.weapon_stow notsolid();
    self.weapon_stow.angles = self gettagangles("tag_stowed_back");
    self.weapon_stow linkto(self, "tag_stowed_back");
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17167
// Size: 0x4e
function countdown_start(time, message) {
    level notify("countdown_start");
    level endon("countdown_start");
    level endon("countdown_end");
    setomnvar("ui_countdown_mission_text", message);
    setomnvar("ui_countdown_timer", gettime() + time * 1000 * 60);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x171bd
// Size: 0x16
function countdown_end() {
    level notify("countdown_end");
    setomnvar("ui_countdown_timer", 0);
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x171db
// Size: 0x1f
function setfirstsavetime(time) {
    time = max(time, 2);
    level.beginningoflevelsavedelay = time;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17202
// Size: 0x39
function motion_blur_disable(time) {
    if (!isdefined(time)) {
        time = 0;
    }
    thread lerp_saveddvar(@"r_mbVelocityScale", 0, time);
    thread lerp_saveddvar(@"r_mbVelocityScaleViewModel", 0, time);
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x17243
// Size: 0xb1
function motion_blur_enable(var_5ec4be66bd87c8a4, var_cf9b7c5dc6ba7bb2, time) {
    if (!isdefined(var_5ec4be66bd87c8a4)) {
        var_5ec4be66bd87c8a4 = ter_op(isdefined(level.motionblur), level.motionblur["velocityScaleDefault"], getdvarfloat(@"r_mbVelocityScale"));
    }
    if (!isdefined(var_cf9b7c5dc6ba7bb2)) {
        var_cf9b7c5dc6ba7bb2 = ter_op(isdefined(level.motionblur), level.motionblur["velocityScaleViewModelDefault"], getdvarfloat(@"r_mbVelocityScaleViewModel"));
    }
    if (!isdefined(time)) {
        time = 0;
    }
    thread lerp_saveddvar(@"r_mbVelocityScale", var_5ec4be66bd87c8a4, time);
    thread lerp_saveddvar(@"r_mbVelocityScaleViewModel", var_cf9b7c5dc6ba7bb2, time);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x172fc
// Size: 0x69
function create_motion_blur_defaults(var_5ec4be66bd87c8a4, var_cf9b7c5dc6ba7bb2) {
    if (!isdefined(var_5ec4be66bd87c8a4)) {
        var_5ec4be66bd87c8a4 = getdvarfloat(@"r_mbVelocityScale");
    }
    if (!isdefined(var_cf9b7c5dc6ba7bb2)) {
        var_cf9b7c5dc6ba7bb2 = getdvarfloat(@"r_mbVelocityScaleViewModel");
    }
    level.motionblur = [];
    level.motionblur["velocityScaleDefault"] = var_5ec4be66bd87c8a4;
    level.motionblur["velocityScaleViewModelDefault"] = var_cf9b7c5dc6ba7bb2;
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1736d
// Size: 0x6b
function actionslotoverride(actionslot, material, ammocount, function, var_96a185efc1665bec) {
    self setweaponhudiconoverride("actionslot" + actionslot, material);
    if (isdefined(ammocount)) {
        setactionslotoverrideammo(actionslot, ammocount);
    }
    if (isdefined(function)) {
        thread actionslotoverridecallback(actionslot, function, var_96a185efc1665bec);
    }
    level.player thread scripts\sp\player::allow_player_weapon_info(1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x173e0
// Size: 0x93
function actionslotoverridecallback(actionslot, function, var_96a185efc1665bec) {
    self endon("death");
    self endon("removeActionslot" + actionslot);
    self notifyonplayercommand("actionslot" + actionslot, "+" + "actionslot " + actionslot);
    while (true) {
        self waittill("actionslot" + actionslot);
        if (!isdefined(var_96a185efc1665bec) || !var_96a185efc1665bec || var_96a185efc1665bec && level.player usinggamepad()) {
            level.player thread scripts\sp\player::allow_player_weapon_info(1);
            self thread [[ function ]]();
        }
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1747b
// Size: 0x4b
function actionslotoverrideremove(actionslot) {
    self notify("removeActionslot" + actionslot);
    self setweaponhudiconoverrideammo("actionslot" + actionslot, -1);
    self setweaponhudiconoverride("actionslot" + actionslot, "none");
    level.player thread scripts\sp\player::allow_player_weapon_info(1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x174ce
// Size: 0x56
function setactionslotoverrideammo(actionslot, ammocount) {
    assertex(self getweaponhudiconoverride("actionslot" + actionslot) != "none", "SetActionSlotOverrideAmmo() set on actionslot that has not been overrided with ActionSlotOverride()");
    self setweaponhudiconoverrideammo("actionslot" + actionslot, ammocount);
    level.player thread scripts\sp\player::allow_player_weapon_info(1);
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1752c
// Size: 0x4b
function function_6078d3c20d55c620(var_b317e04efaad4acb, var_71d55740c12bb86c) {
    if (!isdefined(var_b317e04efaad4acb)) {
        var_b317e04efaad4acb = 0;
    }
    if (!isdefined(var_71d55740c12bb86c)) {
        var_71d55740c12bb86c = 0;
    }
    self takeallweapons(var_b317e04efaad4acb, var_71d55740c12bb86c);
    if (isdefined(self.var_2a9f3313825d58d)) {
        scripts\sp\utility::give_weapon(self.var_2a9f3313825d58d);
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1757f
// Size: 0x13
function giveweaponmaxammo(weapon) {
    self givemaxammo(weapon);
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1759a
// Size: 0xcb
function can_trace_to_player(start, var_2fc7b90001702e5c, contentoverride) {
    if (!isdefined(var_2fc7b90001702e5c)) {
        var_2fc7b90001702e5c = [];
    }
    if (!isarray(var_2fc7b90001702e5c)) {
        var_2fc7b90001702e5c = [var_2fc7b90001702e5c];
    }
    var_2fc7b90001702e5c[var_2fc7b90001702e5c.size] = level.player;
    if (isent(self) || isai(self)) {
        var_2fc7b90001702e5c[var_2fc7b90001702e5c.size] = self;
    }
    if (scripts\engine\trace::ray_trace_passed(start, level.player.origin, var_2fc7b90001702e5c, contentoverride)) {
        return true;
    }
    if (scripts\engine\trace::ray_trace_passed(start, level.player.origin + (0, 0, 30), var_2fc7b90001702e5c, contentoverride)) {
        return true;
    }
    if (scripts\engine\trace::ray_trace_passed(start, level.player geteye(), var_2fc7b90001702e5c, contentoverride)) {
        return true;
    }
    return false;
}

// Namespace utility / scripts\engine\sp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1766e
// Size: 0x53
function function_4f6cdffaa41ad3d1(surface, actiontype, movetype) {
    if (is_dead_sentient()) {
        return;
    }
    if (!isdefined(surface)) {
        surface = "dirt";
    }
    if (!isdefined(actiontype)) {
        actiontype = "step";
    }
    if (!isdefined(movetype)) {
        movetype = "run";
    }
    self function_5d8b2d5d3d1b06dc(surface, actiontype, movetype);
}

/#

    // Namespace utility / scripts\engine\sp\utility
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x176c9
    // Size: 0x21
    function play_footstep_sound(alias, surface) {
        println("<dev string:x582>");
    }

#/

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x176f2
// Size: 0x30
function wait_for_sounddone_or_death(org, other) {
    if (isdefined(other)) {
        other endon("death");
    }
    self endon("death");
    org waittill("sounddone");
    return true;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1772b
// Size: 0x3b
function delete_on_death_wait_sound(ent, sounddone) {
    ent endon("death");
    self waittill("death");
    if (isdefined(ent)) {
        if (ent iswaitingonsound()) {
            ent waittill(sounddone);
        }
        ent delete();
    }
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1776e
// Size: 0x5a
function is_touching_any(array) {
    foreach (item in array) {
        if (self istouching(item)) {
            return true;
        }
    }
    return false;
}

// Namespace utility / scripts\engine\sp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x177d1
// Size: 0x1d
function scripter_note(str, duration) {
    thread scripter_note_proc(str, duration);
}

// Namespace utility / scripts\engine\sp\utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x177f6
// Size: 0x17b
function play_sound_on_tag(alias, tag, ends_on_death, var_b426f32755673ba6, radio_dialog) {
    if (is_dead_sentient()) {
        return;
    }
    org = spawn("script_origin", self.origin);
    org endon("death");
    thread delete_on_death_wait_sound(org, "sounddone");
    if (isdefined(tag)) {
        org linkto(self, tag, (0, 0, 0), (0, 0, 0));
    } else {
        org.origin = self.origin;
        org.angles = self.angles;
        org linkto(self);
    }
    /#
        if (isdefined(level.player_radio_emitter) && self == level.player_radio_emitter) {
            println("<dev string:x5f3>" + alias);
        }
        if (getdvarint(@"hash_b95e70dfa43a9845") && !soundexists(alias)) {
            println("<dev string:x612>" + alias + "<dev string:x62b>");
            org delete();
            return;
        }
    #/
    org playsound(alias, "sounddone");
    if (isdefined(ends_on_death)) {
        assertex(ends_on_death, "ends_on_death must be true or undefined");
        if (!isdefined(wait_for_sounddone_or_death(org))) {
            org stopsounds();
        }
        wait 0.05;
    } else {
        org waittill("sounddone");
    }
    if (isdefined(var_b426f32755673ba6)) {
        self notify(var_b426f32755673ba6);
    }
    org delete();
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17979
// Size: 0x32
function setupglobalcallbackfunctions_sp() {
    if (!add_init_script("globalCallbacks_SP", &setupglobalcallbackfunctions_sp)) {
        return;
    }
    level.fnplaysoundonentity = &play_sound_on_entity;
    level.fnplaysoundontag = &play_sound_on_tag;
}

// Namespace utility / scripts\engine\sp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x179b3
// Size: 0x17
function function_1ae8f046dee579e0(bool) {
    setomnvar("ui_cutscene_active", bool);
}

// Namespace utility / scripts\engine\sp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x179d2
// Size: 0xe
function function_63171981a45b3ad8() {
    return getomnvar("ui_cutscene_active") > 0;
}

// Namespace utility / scripts\engine\sp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x179e9
// Size: 0x6a
function fake_bullet(endpoint, weaponname, var_171824639ae2e4f2, var_f45ef6b4367cc3ea) {
    bullettracer(self.origin, endpoint, weaponname, 0);
    self function_37993e92380a422(weaponname);
    if (isdefined(var_171824639ae2e4f2)) {
        tagname = isdefined(var_f45ef6b4367cc3ea) ? var_f45ef6b4367cc3ea : "tag_origin";
        playfxontag(getfx(var_171824639ae2e4f2), self, tagname);
    }
}
