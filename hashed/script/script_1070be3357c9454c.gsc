// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;

#namespace namespace_79cde40897d177f7;

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xda
// Size: 0xbf
function init_dev() {
    /#
        setdevdvarifuninitialized(@"hash_db53798b3c5b4e9a", -1);
        setdevdvarifuninitialized(@"hash_4f76d4cdd982e0cb", "<unknown string>");
        setdevdvarifuninitialized(@"hash_7f3daeba250a9d7d", 0);
        setdevdvarifuninitialized(@"hash_98784b47329ab19", 0);
        thread function_d98adc9e2868395b(@"hash_db53798b3c5b4e9a", -1, 0.5, &function_6a9438d4640f8e60);
        thread function_f5d9e458de1ccd69(@"hash_4f76d4cdd982e0cb", "<unknown string>", 0.5, &function_32605b6bb881ab61);
        thread function_d98adc9e2868395b(@"hash_98784b47329ab19", 0, 0.5, &function_a6ec40ab5ebf91ae);
        thread function_fd1434db987f4453(@"hash_7f3daeba250a9d7d", 0.5, &function_c66a86ff03679ba6);
    #/
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a0
// Size: 0x59
function init() {
    var_b2f29ec079807fbf = ["t10_sprint_variants", "t10_sprint_variant_a", "t10_sprint_variant_b", "t10_sprint_variant_c"];
    level.var_3bedd0a92453a1df = array_randomize(var_b2f29ec079807fbf);
    scripts/mp/utility/join_team_aggregator::registeronplayerjointeamnospectatorcallback(&function_b9d238d0b3043270);
    /#
        init_dev();
    #/
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200
// Size: 0xc
function function_fcb289b4d9d2198e() {
    return level.var_3bedd0a92453a1df;
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x214
// Size: 0xc8
function function_b9d238d0b3043270(player) {
    /#
        assert(isdefined(player));
    #/
    locomotion_variants = function_fcb289b4d9d2198e();
    if (locomotion_variants.size == 0) {
        return;
    }
    if (!isdefined(level.teamdata[player.team]["teamAddedCount"])) {
        level.teamdata[player.team]["teamAddedCount"] = 0;
    }
    var_d4a9f3765962d3fc = level.teamdata[player.team]["teamAddedCount"] % locomotion_variants.size;
    player.var_a8dab01d882b1e9f = locomotion_variants[var_d4a9f3765962d3fc];
    player function_b593a4a8e497ff86();
    level.teamdata[player.team]["teamAddedCount"]++;
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e3
// Size: 0x25
function function_b0c47b36a5b76623(moveset) {
    /#
        if (isdefined(self.var_c12ea6f6a9136bd7)) {
            return;
        }
    #/
    self function_b4d14c500183cbd6(moveset);
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30f
// Size: 0x26
function function_2a4ecac859ca54d7() {
    /#
        if (isdefined(self.var_c12ea6f6a9136bd7)) {
            return self.var_c12ea6f6a9136bd7;
        }
    #/
    return self.var_a8dab01d882b1e9f;
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33d
// Size: 0x21
function function_b593a4a8e497ff86() {
    if (!isdefined(self.var_a8dab01d882b1e9f)) {
        return;
    }
    function_b0c47b36a5b76623(self.var_a8dab01d882b1e9f);
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x365
// Size: 0x47
function function_43e653ffc0c06d4e(index) {
    /#
        /#
            assert(isint(index));
        #/
        locomotion_variants = function_fcb289b4d9d2198e();
        /#
            assert(index >= 0 && index < locomotion_variants.size);
        #/
        return locomotion_variants[index];
    #/
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b3
// Size: 0x29
function function_bc275414eb193d19(index) {
    /#
        overridename = function_43e653ffc0c06d4e(index);
        function_646f751aa1f46fa3(overridename);
    #/
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e3
// Size: 0x30
function function_646f751aa1f46fa3(name) {
    /#
        /#
            assert(isstring(name));
        #/
        self.var_c12ea6f6a9136bd7 = name;
        self function_b4d14c500183cbd6(name);
    #/
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41a
// Size: 0x17
function function_a1302efd0c478b4c() {
    /#
        self.var_c12ea6f6a9136bd7 = undefined;
        function_b593a4a8e497ff86();
    #/
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x438
// Size: 0x6c
function function_f5d9e458de1ccd69(dvar, dvar_default, waitinterval, onchange) {
    /#
        level endon("<unknown string>");
        for (prevval = undefined; true; prevval = val) {
            wait(waitinterval);
            val = getdvar(dvar, dvar_default);
            if (!isdefined(prevval) || val != prevval) {
                [[ onchange ]](val, prevval);
            }
        }
    #/
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4ab
// Size: 0x6c
function function_d98adc9e2868395b(dvar, dvar_default, waitinterval, onchange) {
    /#
        level endon("<unknown string>");
        for (prevval = undefined; true; prevval = val) {
            wait(waitinterval);
            val = getdvarint(dvar, dvar_default);
            if (!isdefined(prevval) || val != prevval) {
                [[ onchange ]](val, prevval);
            }
        }
    #/
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x51e
// Size: 0x48
function function_fd1434db987f4453(dvar, waitinterval, onset) {
    /#
        level endon("<unknown string>");
        while (true) {
            wait(waitinterval);
            if (getdvarint(dvar, 0) != 0) {
                [[ onset ]]();
                setdvar(dvar, 0);
            }
        }
    #/
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x56d
// Size: 0xb0
function function_6a9438d4640f8e60(val, prev) {
    /#
        if (val == -1) {
            function_a1302efd0c478b4c();
            return;
        }
        locomotion_variants = function_fcb289b4d9d2198e();
        if (val < 0 || val >= locomotion_variants.size) {
            return;
        }
        foreach (player in level.players) {
            player function_bc275414eb193d19(val);
        }
        setdvar(@"hash_4f76d4cdd982e0cb", "<unknown string>");
    #/
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x624
// Size: 0x90
function function_32605b6bb881ab61(val, prev) {
    /#
        if (val == "<unknown string>") {
            function_a1302efd0c478b4c();
            return;
        }
        foreach (player in level.players) {
            player function_646f751aa1f46fa3(val);
        }
        setdvar(@"hash_db53798b3c5b4e9a", -1);
    #/
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6bb
// Size: 0xae
function function_7fb26d53f97b4152() {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        while (true) {
            waitframe();
            foreach (player in level.players) {
                print3d(player.origin + (0, 0, 60), isdefined(player function_2a4ecac859ca54d7()) ? player function_2a4ecac859ca54d7() : "<unknown string>", undefined, undefined, 0.5, undefined, 1);
            }
        }
    #/
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x770
// Size: 0x31
function function_a6ec40ab5ebf91ae(val, prev) {
    /#
        if (val == 1) {
            thread function_7fb26d53f97b4152();
            return;
        }
        level notify("<unknown string>");
    #/
}

// Namespace namespace_79cde40897d177f7 / namespace_144a3b0d146004de
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a8
// Size: 0x10a
function function_c66a86ff03679ba6() {
    /#
        println("<unknown string>");
        println("<unknown string>");
        foreach (variant in function_fcb289b4d9d2198e()) {
            println(variant);
        }
        println("<unknown string>");
        foreach (player in level.players) {
            println("<unknown string>" + player getentitynumber() + "<unknown string>" + player.var_a8dab01d882b1e9f + "<unknown string>" + (isdefined(player function_2a4ecac859ca54d7()) ? player function_2a4ecac859ca54d7() : "<unknown string>"));
        }
    #/
}

