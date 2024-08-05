#using scripts\cp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\cp_objectives.gsc;
#using script_6b80871eb8142180;
#using script_42f868a5dda17294;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_3a8f9ace195c9da9;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;

#namespace namespace_9d6ed0911e2ddf09;

// Namespace namespace_9d6ed0911e2ddf09 / namespace_d18e5dabdf7709e4
// Params 14, eflags: 0x0
// Checksum 0x0, Offset: 0x171
// Size: 0x447
function function_dc3c295fcb6d7c77(var_3881eff0775315b9, var_a5314968c4bbe787, var_b5fcfef6f18f1699, var_b243545cbdc0623, var_316849e7dbeacb69, var_c7e7d641c4ad0791, var_137172ebddcec040, var_9be5b3bb83a5fe1f, var_849d3ad1f2161f45, var_ba6b2056a030835e, var_6b9aa741fa69743e, var_3a7943131e7a9822, var_1ebfa39eec539a06, var_6b36fc7b3fdd0d70) {
    level endon("game_ended");
    if (!isdefined(self) || !isdefined(var_3881eff0775315b9)) {
        assertmsg("Requires valid objective!");
        return;
    }
    var_b5fcfef6f18f1699 = utility::default_to(var_b5fcfef6f18f1699, 50);
    var_b243545cbdc0623 = utility::default_to(var_b243545cbdc0623, 1200);
    var_316849e7dbeacb69 = utility::default_to(var_316849e7dbeacb69, 500);
    var_849d3ad1f2161f45 = utility::default_to(istrue(var_849d3ad1f2161f45), 0);
    var_ba6b2056a030835e = utility::default_to(var_ba6b2056a030835e, self);
    var_61eabcdffda9dc80 = utility::default_to(var_1ebfa39eec539a06, 1);
    var_6b36fc7b3fdd0d70 = utility::default_to(var_6b36fc7b3fdd0d70, 1);
    function_1ebfa39eec539a06(var_61eabcdffda9dc80);
    var_318140951796eea2 = 0;
    var_c9588af0e167e5a5 = var_3881eff0775315b9;
    self.var_191d2524aa36a7e = var_3881eff0775315b9;
    if (function_7f15ad998050dd8c()) {
        self.var_191d2524aa36a7e = objective_create();
    } else {
        self.var_191d2524aa36a7e = scripts\cp\cp_objectives::requestworldid(var_a5314968c4bbe787 + "_" + self.var_191d2524aa36a7e);
    }
    if (isdefined(var_3a7943131e7a9822)) {
        var_318140951796eea2 = var_3a7943131e7a9822;
        level.player namespace_96731f4d002634f6::function_a9652366b0728328(var_3a7943131e7a9822, var_c9588af0e167e5a5);
    } else if (isdefined(level.var_4898102a23066ba)) {
        var_318140951796eea2 = level.var_4898102a23066ba.objectives[var_c9588af0e167e5a5];
    }
    namespace_a8e999320b18af1d::function_85aedb842bdb548b();
    namespace_a8e999320b18af1d::function_ead81f9d7c6670d3();
    namespace_a8e999320b18af1d::function_75bf86ba2237d4a2(var_b5fcfef6f18f1699);
    namespace_a8e999320b18af1d::function_847531f882fe30d0(1);
    namespace_a8e999320b18af1d::function_bab704273dd54bf8(var_b243545cbdc0623);
    if (var_318140951796eea2 && namespace_a8e999320b18af1d::function_409b4b9bee1fbe1c(self)) {
        namespace_a8e999320b18af1d::function_d578cb697ac20521();
        function_c0ee40f76dcd495c(self.var_191d2524aa36a7e, var_6b9aa741fa69743e);
        if (var_849d3ad1f2161f45) {
            function_a05e758ecaf80cda(self.var_191d2524aa36a7e);
        }
    } else if (!var_318140951796eea2) {
        circle_origin = isdefined(var_c7e7d641c4ad0791) && isdefined(var_c7e7d641c4ad0791.origin) ? var_c7e7d641c4ad0791.origin : undefined;
        circle_radius = isdefined(var_c7e7d641c4ad0791) && isdefined(var_c7e7d641c4ad0791.radius) ? var_c7e7d641c4ad0791.radius : undefined;
        namespace_a8e999320b18af1d::function_b87282ce9cad9ef7(1, undefined, circle_radius, circle_origin);
        function_f2926e1d71be9abe(self.var_191d2524aa36a7e);
        if (var_849d3ad1f2161f45) {
            function_a05e758ecaf80cda(self.var_191d2524aa36a7e);
            namespace_a8e999320b18af1d::function_a45e799ed3aaf7e8(var_ba6b2056a030835e);
        } else {
            objective_setlocation(self.var_191d2524aa36a7e, 0, self.origin);
            offsetorigin = namespace_a8e999320b18af1d::function_b6f9073a006577f7(var_316849e7dbeacb69);
            namespace_a8e999320b18af1d::function_b773df738fa8577a(offsetorigin);
        }
    }
    if (isdefined(var_137172ebddcec040) && isfunction(var_137172ebddcec040)) {
        thread [[ var_137172ebddcec040 ]]();
    }
    var_e5b495906761a6cc = function_424a7f20ead73979(self, var_a5314968c4bbe787);
    if (isdefined(var_9be5b3bb83a5fe1f) && isfunction(var_9be5b3bb83a5fe1f)) {
        thread [[ var_9be5b3bb83a5fe1f ]]();
    }
    if (!var_318140951796eea2) {
        namespace_a8e999320b18af1d::function_b87282ce9cad9ef7(0);
        namespace_a8e999320b18af1d::function_d578cb697ac20521();
        level.player namespace_96731f4d002634f6::function_a9652366b0728328(1, var_c9588af0e167e5a5);
        function_1ebfa39eec539a06(0);
        if (namespace_a8e999320b18af1d::function_409b4b9bee1fbe1c(self)) {
            if (isdefined(var_e5b495906761a6cc) && var_e5b495906761a6cc == "spotter" && namespace_a8e999320b18af1d::function_9258d9b4344f8922(self)) {
                objective_setshowoncompass(self.var_191d2524aa36a7e, 0);
                self waittill("objective_ping_complete");
            }
            function_c0ee40f76dcd495c(self.var_191d2524aa36a7e, var_6b9aa741fa69743e);
            if (var_849d3ad1f2161f45) {
                function_a05e758ecaf80cda(self.var_191d2524aa36a7e);
            }
        }
    }
    if (isdefined(var_e5b495906761a6cc)) {
        self waittill(var_a5314968c4bbe787);
    }
    if (isdefined(self.var_191d2524aa36a7e)) {
        objective_setshowoncompass(self.var_191d2524aa36a7e, 0);
        objective_state(self.var_191d2524aa36a7e, "done");
        if (function_7f15ad998050dd8c()) {
            objective_reset(self.var_191d2524aa36a7e);
        } else {
            scripts\cp\cp_objectives::freeworldidbyobjid(self.var_191d2524aa36a7e);
        }
        if (isdefined(level.activequests) && level.activequests.size) {
            if (var_6b36fc7b3fdd0d70) {
                function_1ebfa39eec539a06(1);
            }
        }
        self notify("objective_complete");
    }
}

// Namespace namespace_9d6ed0911e2ddf09 / namespace_d18e5dabdf7709e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5c0
// Size: 0x33
function function_424a7f20ead73979(obj, var_a5314968c4bbe787) {
    obj endon(var_a5314968c4bbe787);
    var_e5b495906761a6cc = utility::flag_wait(obj.script_noteworthy);
    return var_e5b495906761a6cc;
}

// Namespace namespace_9d6ed0911e2ddf09 / namespace_d18e5dabdf7709e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5fc
// Size: 0x76
function function_384ac506734b0d9e(objectiveids) {
    level endon("game_ended");
    if (!isarray(objectiveids)) {
        objectiveids = [objectiveids];
    }
    foreach (id in objectiveids) {
        if (isnumber(id)) {
            thread scripts\cp\cp_objectives::function_c0663d9578eb8bbb(id);
        }
    }
}

// Namespace namespace_9d6ed0911e2ddf09 / namespace_d18e5dabdf7709e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67a
// Size: 0x23
function function_1ebfa39eec539a06(var_23c71a9282a816b8) {
    if (istrue(var_23c71a9282a816b8)) {
        thread scripts\cp\cp_objectives::function_b338aa1e9ec37fbd();
        return;
    }
    thread scripts\cp\cp_objectives::function_3ea9346c75f0a9bc();
}

// Namespace namespace_9d6ed0911e2ddf09 / namespace_d18e5dabdf7709e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a5
// Size: 0x53
function function_a9b5d13fe5f689e9() {
    return function_5175ee2a98016ca8(self) ? function_b7755ccb57f05b94(level.player.origin) : function_44daa65837a12044(level.player, self.origin, self.var_3d33ce746b270d75.objective_radius);
}

// Namespace namespace_9d6ed0911e2ddf09 / namespace_d18e5dabdf7709e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x701
// Size: 0x3e
function function_33f65e70afe93566() {
    var_def88a7e3787ba2c = level.player function_98e2681984d4b574(self);
    if (var_def88a7e3787ba2c) {
        var_69759bd657284bc9 = level.player function_32d239d0cac2dbdc(self);
    }
    return istrue(var_69759bd657284bc9);
}

// Namespace namespace_9d6ed0911e2ddf09 / namespace_d18e5dabdf7709e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x748
// Size: 0x73
function function_3f260a3a6acfc8f4(point) {
    assertex(function_acaa75ca8754452e(), "<dev string:x1c>");
    point = default_to(point, level.players[0].origin);
    var_1200ea4f929e72c0 = function_d9583306c5a171e4();
    var_793c3b1303bb2855 = function_166b0909addf83aa(level.players[0], var_1200ea4f929e72c0, var_1200ea4f929e72c0[2]);
    return var_793c3b1303bb2855;
}

// Namespace namespace_9d6ed0911e2ddf09 / namespace_d18e5dabdf7709e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7c4
// Size: 0xef
function function_b7755ccb57f05b94(position, offset) {
    origin = self.origin;
    var_872fff8a91852c9f = self.struct.var_74e936bbadd15418;
    var_870c0d8a915cd0b1 = self.struct.var_750c4cbbadf7cc32;
    angles = self.angles;
    if (isdefined(offset)) {
        var_872fff8a91852c9f += (offset, offset, offset);
        var_870c0d8a915cd0b1 += (offset, offset, offset);
    }
    var_8cb631ec340aeca3 = coordtransformtranspose(position, origin, angles);
    return var_8cb631ec340aeca3[0] >= var_872fff8a91852c9f[0] * -1 && var_8cb631ec340aeca3[0] <= var_870c0d8a915cd0b1[0] && var_8cb631ec340aeca3[1] >= var_872fff8a91852c9f[1] * -1 && var_8cb631ec340aeca3[1] <= var_870c0d8a915cd0b1[1] && var_8cb631ec340aeca3[2] >= var_872fff8a91852c9f[2] * -1 && var_8cb631ec340aeca3[2] <= var_870c0d8a915cd0b1[2];
}

// Namespace namespace_9d6ed0911e2ddf09 / namespace_d18e5dabdf7709e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8bc
// Size: 0xd2
function function_98e2681984d4b574(objective, offset) {
    assertex(function_409b4b9bee1fbe1c(objective), "Not a valid objective");
    var_99c51aeb29995c6e = default_to(offset, objective.var_3d33ce746b270d75.var_6ed7b1082a7e28f1);
    if (!isdefined(var_99c51aeb29995c6e)) {
        var_99c51aeb29995c6e = 1000;
    }
    if (!function_5175ee2a98016ca8(objective) && isdefined(objective.var_3d33ce746b270d75.objective_radius)) {
        var_c0eb8d67683fc1bc = function_327238912108e244(self.origin, objective.origin, objective.var_3d33ce746b270d75.objective_radius + var_99c51aeb29995c6e);
    } else {
        var_c0eb8d67683fc1bc = objective function_b7755ccb57f05b94(self.origin, var_99c51aeb29995c6e);
    }
    return istrue(var_c0eb8d67683fc1bc);
}

// Namespace namespace_9d6ed0911e2ddf09 / namespace_d18e5dabdf7709e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x997
// Size: 0x13e
function function_32d239d0cac2dbdc(objective) {
    assertex(function_409b4b9bee1fbe1c(objective), "Not a valid objective");
    var_99c51aeb29995c6e = default_to(objective.var_3d33ce746b270d75.var_6ed7b1082a7e28f1, 1000);
    playereye = self geteye();
    var_edfa8657164b3919 = playereye + anglestoforward(self getplayerangles()) * var_99c51aeb29995c6e;
    trace = scripts\engine\trace::ray_trace(playereye, var_edfa8657164b3919);
    if (isdefined(trace)) {
        closestpoint = trace["position"];
    }
    var_84aeba1f9b16720b = 0;
    if (!function_5175ee2a98016ca8(objective) && isdefined(objective.var_3d33ce746b270d75.objective_radius)) {
        var_84aeba1f9b16720b = function_327238912108e244(closestpoint, objective.origin, objective.var_3d33ce746b270d75.objective_radius);
    } else {
        var_84aeba1f9b16720b = objective function_b7755ccb57f05b94(closestpoint);
    }
    /#
        if (getdvarint(@"hash_f96cf0eb7c0d0f90", 0) == 1) {
            thread scripts\cp_mp\utility\debug_utility::drawsphere(closestpoint, 5, 0.25, (1, 0, 1));
        }
    #/
    return var_84aeba1f9b16720b;
}

// Namespace namespace_9d6ed0911e2ddf09 / namespace_d18e5dabdf7709e4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xade
// Size: 0x41
function function_327238912108e244(pointa, pointb, distance) {
    var_46331b4549e68fca = distancesquared(pointa, pointb);
    var_149b7b8b8da3e4bc = squared(distance);
    return var_46331b4549e68fca <= var_149b7b8b8da3e4bc;
}

// Namespace namespace_9d6ed0911e2ddf09 / namespace_d18e5dabdf7709e4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb28
// Size: 0x41
function function_166b0909addf83aa(pointa, pointb, distance) {
    var_46331b4549e68fca = distance2dsquared(pointa, pointb);
    var_149b7b8b8da3e4bc = squared(distance);
    return var_46331b4549e68fca <= var_149b7b8b8da3e4bc;
}

// Namespace namespace_9d6ed0911e2ddf09 / namespace_d18e5dabdf7709e4
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xb72
// Size: 0xa0
function private function_c0ee40f76dcd495c(var_191d2524aa36a7e, var_6b9aa741fa69743e) {
    var_fc1dd9ea1f3f2a3b = self.origin + (0, 0, 6);
    objective_state(var_191d2524aa36a7e, "current");
    objective_icon(var_191d2524aa36a7e, "icon_waypoint_objective_general");
    objective_setminimapiconsize(var_191d2524aa36a7e, "icon_medium");
    objective_setfadedisabled(var_191d2524aa36a7e, 1);
    objective_setlocation(var_191d2524aa36a7e, 0, var_fc1dd9ea1f3f2a3b);
    function_9766d0b79eada249(var_191d2524aa36a7e, 0);
    function_c047d7ffe7a83501(var_191d2524aa36a7e, 0, 0);
    objective_setbackground(var_191d2524aa36a7e, 1);
    objective_setshowoncompass(var_191d2524aa36a7e, 1, 1.4);
    if (isdefined(var_6b9aa741fa69743e)) {
        objective_setlabel(var_191d2524aa36a7e, var_6b9aa741fa69743e);
    }
}

// Namespace namespace_9d6ed0911e2ddf09 / namespace_d18e5dabdf7709e4
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc1a
// Size: 0x58
function private function_f2926e1d71be9abe(var_191d2524aa36a7e) {
    objective_state(var_191d2524aa36a7e, "active");
    objective_icon(var_191d2524aa36a7e, function_914b829c1006fba6());
    function_72cca3f9df2839fd(var_191d2524aa36a7e, 1);
    function_9766d0b79eada249(var_191d2524aa36a7e, 1);
    function_c047d7ffe7a83501(var_191d2524aa36a7e, 1, 2);
    objective_setbackground(var_191d2524aa36a7e, 1);
    objective_setshowoncompass(var_191d2524aa36a7e, 1, 1.4);
}

// Namespace namespace_9d6ed0911e2ddf09 / namespace_d18e5dabdf7709e4
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc7a
// Size: 0x3f
function private function_a05e758ecaf80cda(var_191d2524aa36a7e) {
    isentity = isent(self);
    assertex(isentity, "<dev string:x67>");
    if (isent(self)) {
        objective_onentity(var_191d2524aa36a7e, self);
    }
}
