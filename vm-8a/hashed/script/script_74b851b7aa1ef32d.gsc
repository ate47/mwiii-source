#using scripts\mp\utility\game.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\utility\points.gsc;

#namespace namespace_40cd4a4db2010f22;

// Namespace namespace_40cd4a4db2010f22 / namespace_a850435086c88de3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb
// Size: 0x140
function doonactionscoreevent(eventtype, eventname, cooldown) {
    if (getdvarint(hashcat(@"hash_d98c82b5a26dc973", scripts\mp\utility\game::getsubgametype(), "_disable_onactionscoreevents"), 0) == 1) {
        return;
    }
    if (scripts\mp\utility\game::getgametype() == "br" && !isdefined(level.prematchendtime)) {
        return;
    }
    if (!isdefined(cooldown)) {
        cooldown = 12;
    }
    cooldownms = cooldown * 1000;
    var_b7d39a4661f3460 = gettime();
    if (!isdefined(self.xpcooldowns)) {
        self.xpcooldowns = [];
    }
    if (!isdefined(self.xpcooldowns[eventname])) {
        self.xpcooldowns[eventname] = 0;
    } else if (self.xpcooldowns[eventname] > var_b7d39a4661f3460) {
        return;
    }
    self.xpcooldowns[eventname] = var_b7d39a4661f3460 + cooldownms;
    switch (eventtype) {
    case 0: 
        function_a56759f3dec70990(eventname);
        break;
    case 1: 
        function_e4278547ad0ee8c8(eventname);
        break;
    case 2: 
        function_d25feb1da4499bae(eventname);
        break;
    default: 
        break;
    }
}

// Namespace namespace_40cd4a4db2010f22 / namespace_a850435086c88de3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x223
// Size: 0x2a
function function_a56759f3dec70990(eventname) {
    var_c7cba7d0db108110 = function_1823ff50bb28148d("altScore_equipment_" + eventname);
    function_558e5516ee7925aa(var_c7cba7d0db108110);
}

// Namespace namespace_40cd4a4db2010f22 / namespace_a850435086c88de3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x255
// Size: 0x2a
function function_e4278547ad0ee8c8(eventname) {
    var_c7cba7d0db108110 = function_1823ff50bb28148d("altScore_fieldUp_" + eventname);
    function_558e5516ee7925aa(var_c7cba7d0db108110);
}

// Namespace namespace_40cd4a4db2010f22 / namespace_a850435086c88de3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x287
// Size: 0x2a
function function_d25feb1da4499bae(eventname) {
    var_c7cba7d0db108110 = function_1823ff50bb28148d("altScore_killstreak_" + eventname);
    function_558e5516ee7925aa(var_c7cba7d0db108110);
}

// Namespace namespace_40cd4a4db2010f22 / namespace_a850435086c88de3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b9
// Size: 0x37
function function_558e5516ee7925aa(var_c7cba7d0db108110) {
    points = scripts\mp\rank::getscoreinfovalue(var_c7cba7d0db108110);
    if (isdefined(points)) {
        thread scripts\mp\utility\points::doScoreEvent(var_c7cba7d0db108110, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
    }
}
