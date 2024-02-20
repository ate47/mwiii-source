// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;

#namespace objpoints;

// Namespace objpoints/namespace_5265b344212055e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a
// Size: 0x63
function init() {
    precacheshader("objpoint_default");
    level.objpointnames = [];
    level.objpoints = [];
    if (level.splitscreen) {
        level.objpointsize = 15;
    } else {
        level.objpointsize = 8;
    }
    level.objpoint_alpha_default = 0.75;
    level.objpointscale = 1;
}

// Namespace objpoints/namespace_5265b344212055e8
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x104
// Size: 0x14f
function createteamobjpoint(index, origin, team, shader, alpha, scale) {
    /#
        assert(team == "all");
    #/
    if (!isdefined(shader)) {
        shader = "objpoint_default";
    }
    if (!isdefined(scale)) {
        scale = 1;
    }
    var_b74984f8b12cf978 = undefined;
    if (team != "all") {
        var_b74984f8b12cf978 = newteamhudelem(team);
    } else {
        var_b74984f8b12cf978 = newhudelem();
    }
    var_b74984f8b12cf978.id = index;
    var_b74984f8b12cf978.x = origin[0];
    var_b74984f8b12cf978.y = origin[1];
    var_b74984f8b12cf978.z = origin[2];
    var_b74984f8b12cf978.team = team;
    var_b74984f8b12cf978.isflashing = 0;
    var_b74984f8b12cf978.isshown = 1;
    var_b74984f8b12cf978 setshader(shader, level.objpointsize, level.objpointsize);
    var_b74984f8b12cf978 setwaypoint(1, 0);
    if (isdefined(alpha)) {
        var_b74984f8b12cf978.alpha = alpha;
    } else {
        var_b74984f8b12cf978.alpha = level.objpoint_alpha_default;
    }
    var_b74984f8b12cf978.basealpha = var_b74984f8b12cf978.alpha;
    return var_b74984f8b12cf978;
}

// Namespace objpoints/namespace_5265b344212055e8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25b
// Size: 0x120
function deleteobjpoint(var_2f8b2ff7e0389b27) {
    /#
        assert(level.objpoints.size == level.objpointnames.size);
    #/
    if (level.objpoints.size == 1) {
        /#
            assert(level.objpointnames[0] == var_2f8b2ff7e0389b27.name);
        #/
        /#
            assert(isdefined(level.objpoints[var_2f8b2ff7e0389b27.name]));
        #/
        level.objpoints = [];
        level.objpointnames = [];
        var_2f8b2ff7e0389b27 destroy();
        return;
    }
    newindex = var_2f8b2ff7e0389b27.index;
    oldindex = level.objpointnames.size - 1;
    var_b74984f8b12cf978 = getobjpointbyindex(oldindex);
    level.objpointnames[newindex] = var_b74984f8b12cf978.name;
    var_b74984f8b12cf978.index = newindex;
    level.objpointnames[oldindex] = undefined;
    level.objpoints[var_2f8b2ff7e0389b27.name] = undefined;
    var_2f8b2ff7e0389b27 destroy();
}

// Namespace objpoints/namespace_5265b344212055e8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x382
// Size: 0x64
function updateorigin(origin) {
    if (self.x != origin[0]) {
        self.x = origin[0];
    }
    if (self.y != origin[1]) {
        self.y = origin[1];
    }
    if (self.z != origin[2]) {
        self.z = origin[2];
    }
}

// Namespace objpoints/namespace_5265b344212055e8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3ed
// Size: 0x2f
function setoriginbyname(name, origin) {
    var_b74984f8b12cf978 = getobjpointbyname(name);
    var_b74984f8b12cf978 updateorigin(origin);
}

// Namespace objpoints/namespace_5265b344212055e8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x423
// Size: 0x2c
function getobjpointbyname(name) {
    if (isdefined(level.objpoints[name])) {
        return level.objpoints[name];
    } else {
        return undefined;
    }
}

// Namespace objpoints/namespace_5265b344212055e8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x456
// Size: 0x36
function getobjpointbyindex(index) {
    if (isdefined(level.objpointnames[index])) {
        return level.objpoints[level.objpointnames[index]];
    } else {
        return undefined;
    }
}

// Namespace objpoints/namespace_5265b344212055e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x493
// Size: 0x91
function startflashing() {
    self endon("stop_flashing_thread");
    if (self.isflashing) {
        return;
    }
    self.isflashing = 1;
    while (self.isflashing) {
        self fadeovertime(0.75);
        self.alpha = 0.35 * self.basealpha;
        wait(0.75);
        self fadeovertime(0.75);
        self.alpha = self.basealpha;
        wait(0.75);
    }
    self.alpha = self.basealpha;
}

// Namespace objpoints/namespace_5265b344212055e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52b
// Size: 0x1a
function stopflashing() {
    if (!self.isflashing) {
        return;
    }
    self.isflashing = 0;
}
