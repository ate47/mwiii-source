// mwiii decomp prototype
#namespace flags;

// Namespace flags/namespace_4b0406965e556711
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129
// Size: 0x17
function initgameflags() {
    if (!isdefined(game["flags"])) {
        game["flags"] = [];
    }
}

// Namespace flags/namespace_4b0406965e556711
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x147
// Size: 0x30
function gameflaginit(flagname, isenabled) {
    /#
        assert(isdefined(game["flags"]));
    #/
    game["flags"][flagname] = isenabled;
}

// Namespace flags/namespace_4b0406965e556711
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e
// Size: 0x22
function gameflagexists(flagname) {
    return isdefined(game["flags"]) && isdefined(game["flags"][flagname]);
}

// Namespace flags/namespace_4b0406965e556711
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8
// Size: 0x35
function gameflag(flagname) {
    /#
        assertex(isdefined(game["flags"][flagname]), "gameFlag " + flagname + " referenced without being initialized; usegameFlagInit( <flagName>, <isEnabled> )");
    #/
    return game["flags"][flagname];
}

// Namespace flags/namespace_4b0406965e556711
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e5
// Size: 0x3c
function gameflagset(flagname) {
    /#
        assertex(isdefined(game["flags"][flagname]), "gameFlag " + flagname + " referenced without being initialized; usegameFlagInit( <flagName>, <isEnabled> )");
    #/
    game["flags"][flagname] = 1;
    level notify(flagname);
}

// Namespace flags/namespace_4b0406965e556711
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228
// Size: 0x37
function gameflagclear(flagname) {
    /#
        assertex(isdefined(game["flags"][flagname]), "gameFlag " + flagname + " referenced without being initialized; usegameFlagInit( <flagName>, <isEnabled> )");
    #/
    game["flags"][flagname] = 0;
}

// Namespace flags/namespace_4b0406965e556711
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x266
// Size: 0x3d
function gameflagwait(flagname) {
    /#
        assertex(isdefined(game["flags"][flagname]), "gameFlag " + flagname + " referenced without being initialized; usegameFlagInit( <flagName>, <isEnabled> )");
    #/
    while (!gameflag(flagname)) {
        level waittill(flagname);
    }
}

// Namespace flags/namespace_4b0406965e556711
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aa
// Size: 0x22
function function_1240434f4201ac9d(flagname) {
    while (!gameflagexists(flagname)) {
        waitframe();
    }
    gameflagwait(flagname);
}

// Namespace flags/namespace_4b0406965e556711
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d3
// Size: 0x1a
function initlevelflags() {
    if (!isdefined(level.levelflags)) {
        level.levelflags = [];
    }
}

// Namespace flags/namespace_4b0406965e556711
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f4
// Size: 0x34
function levelflaginit(flagname, isenabled) {
    /#
        assert(isdefined(level.levelflags));
    #/
    level.levelflags[flagname] = isenabled;
}

// Namespace flags/namespace_4b0406965e556711
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32f
// Size: 0x39
function levelflag(flagname) {
    /#
        assertex(isdefined(level.levelflags[flagname]), "levelFlag " + flagname + " referenced without being initialized; use levelFlagInit( <flagName>, <isEnabled> )");
    #/
    return level.levelflags[flagname];
}

// Namespace flags/namespace_4b0406965e556711
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x370
// Size: 0x40
function levelflagset(flagname) {
    /#
        assertex(isdefined(level.levelflags[flagname]), "levelFlag " + flagname + " referenced without being initialized; use levelFlagInit( <flagName>, <isEnabled> )");
    #/
    level.levelflags[flagname] = 1;
    level notify(flagname);
}

// Namespace flags/namespace_4b0406965e556711
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b7
// Size: 0x3f
function levelflagclear(flagname) {
    /#
        assertex(isdefined(level.levelflags[flagname]), "levelFlag " + flagname + " referenced without being initialized; use levelFlagInit( <flagName>, <isEnabled> )");
    #/
    level.levelflags[flagname] = 0;
    level notify(flagname);
}

// Namespace flags/namespace_4b0406965e556711
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fd
// Size: 0x3f
function levelflagwait(flagname) {
    /#
        assertex(isdefined(level.levelflags[flagname]), "levelFlag " + flagname + " referenced without being initialized; use levelFlagInit( <flagName>, <isEnabled> )");
    #/
    while (!levelflag(flagname)) {
        level waittill(flagname);
    }
}

// Namespace flags/namespace_4b0406965e556711
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x443
// Size: 0x3f
function levelflagwaitopen(flagname) {
    /#
        assertex(isdefined(level.levelflags[flagname]), "levelFlag " + flagname + " referenced without being initialized; use levelFlagInit( <flagName>, <isEnabled> )");
    #/
    while (levelflag(flagname)) {
        level waittill(flagname);
    }
}
