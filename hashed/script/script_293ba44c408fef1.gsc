// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_b22cd55021fb8178;

// Namespace namespace_b22cd55021fb8178 / namespace_c8d5de7d515ce477
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa8
// Size: 0x86
function private function_b3ea117eb5fbb4a(player, achievementid) {
    if (!isdefined(player.achievements)) {
        player.achievements = [];
    }
    if (!isdefined(player.achievements[achievementid])) {
        player.achievements[achievementid] = spawnstruct();
        player.achievements[achievementid].dataready = 0;
        player.achievements[achievementid].progressvalues = [];
    }
}

// Namespace namespace_b22cd55021fb8178 / namespace_c8d5de7d515ce477
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135
// Size: 0x51
function getstate(player, achievementid) {
    /#
        println("<unknown string>" + player.name + "<unknown string>" + achievementid);
    #/
    if (player iscodcaster()) {
        return;
    }
    function_b3ea117eb5fbb4a(player, achievementid);
    player function_86af48e06c94360a(achievementid);
}

// Namespace namespace_b22cd55021fb8178 / namespace_c8d5de7d515ce477
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d
// Size: 0x1f
function function_691880160b33d133(progressname) {
    return int(tablelookup("ae/ae_progress_target_ids.csv", 0, progressname, 1));
}

// Namespace namespace_b22cd55021fb8178 / namespace_c8d5de7d515ce477
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4
// Size: 0x40
function function_ec4c795c2898be52(player, achievementid, progressname, defaultvalue) {
    progressid = function_691880160b33d133(progressname);
    return function_c983c43f38eabbc(player, achievementid, progressid, defaultvalue);
}

// Namespace namespace_b22cd55021fb8178 / namespace_c8d5de7d515ce477
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc
// Size: 0x72
function function_c983c43f38eabbc(player, achievementid, progressid, defaultvalue) {
    function_b3ea117eb5fbb4a(player, achievementid);
    progressvalue = defaultvalue;
    if (isdefined(player.achievements[achievementid].progressvalues[progressid])) {
        progressvalue = player.achievements[achievementid].progressvalues[progressid];
    }
    return progressvalue;
}

// Namespace namespace_b22cd55021fb8178 / namespace_c8d5de7d515ce477
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x276
// Size: 0xd2
function challenge_progress(player, achievementid, progression) {
    /#
        println("<unknown string>" + player.name + "<unknown string>" + achievementid);
    #/
    function_b3ea117eb5fbb4a(player, achievementid);
    for (index = 0; index < progression.progress_values.size; index++) {
        progress_id = progression.progress_values[index].progress_id;
        progress_value = progression.progress_values[index].progress;
        player.achievements[achievementid].progressvalues[progress_id] = progress_value;
    }
    player notify("challengeProgress", achievementid);
}

