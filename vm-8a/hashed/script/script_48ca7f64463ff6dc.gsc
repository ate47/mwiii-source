#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;

#namespace ai_formation;

// Namespace ai_formation / namespace_21337af87513582c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x185
// Size: 0x19
function init_formations() {
    if (!isdefined(level.formationlist)) {
        level.formationlist = [];
    }
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a6
// Size: 0x7a
function function_a18d80bcfacb9e00(formationname, formationtype) {
    if (!isdefined(level.formationlist)) {
        init_formations();
    }
    if (isdefined(level.formationlist[formationname])) {
        return level.formationlist[formationname];
    }
    assertex(formationtype >= 0 && formationtype < 4, "Invalid formation type of " + formationtype);
    level.formationlist[formationname] = newaiformation(formationtype);
    return level.formationlist[formationname];
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x229
// Size: 0x37
function delete_formation(formationname) {
    if (!isdefined(level.formationlist[formationname])) {
        return;
    }
    function_795225119619e713(level.formationlist[formationname]);
    level.formationlist[formationname] = undefined;
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x268
// Size: 0xc4
function function_73d6d4ee28a18071(formationname, var_129f5d1ec2e3fec5, formationtype) {
    if (!isdefined(formationtype)) {
        formationtype = 3;
    }
    if (!isdefined(level.formationlist)) {
        init_formations();
    }
    if (!isdefined(level.formationlist[formationname])) {
        function_a18d80bcfacb9e00(formationname, formationtype);
    }
    if (!isarray(var_129f5d1ec2e3fec5)) {
        var_129f5d1ec2e3fec5 = [var_129f5d1ec2e3fec5];
    }
    foreach (ai in var_129f5d1ec2e3fec5) {
        ai enter_formation(level.formationlist[formationname]);
        ai thread need_to_run(formationname);
    }
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x334
// Size: 0x118
function function_98e62e94c2b167e0(formationname, horizontalcount, verticalcount, var_b4060a330731f1bd, var_1b9a7d48f06da667, var_9af84e76946ada66) {
    if (!isdefined(var_9af84e76946ada66)) {
        var_9af84e76946ada66 = 0;
    }
    if (!isdefined(level.formationlist[formationname])) {
        return;
    }
    mid = floor(horizontalcount / 2);
    offsetcount = 1;
    for (verticalindex = 0; verticalindex < verticalcount; verticalindex++) {
        for (horizontalindex = 0; horizontalindex < horizontalcount; horizontalindex++) {
            if (!var_9af84e76946ada66 && verticalindex == 0 && horizontalindex == mid) {
                continue;
            }
            yoffset = var_b4060a330731f1bd * -1 * (horizontalindex - mid);
            xoffset = var_1b9a7d48f06da667 * -1 * verticalindex;
            if (var_9af84e76946ada66) {
                yoffset -= 0.5 * (horizontalcount - 1) % 2 * var_b4060a330731f1bd;
                xoffset -= var_1b9a7d48f06da667;
            }
            function_c412284514efc768(level.formationlist[formationname], offsetcount, (xoffset, yoffset, 0));
            offsetcount++;
        }
    }
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x454
// Size: 0x27e
function function_cf3f27c3c5266ee2(formationname, var_3f4d3640a452a225, numai, var_b4060a330731f1bd, var_1b9a7d48f06da667, var_9af84e76946ada66) {
    if (!isdefined(var_9af84e76946ada66)) {
        var_9af84e76946ada66 = 0;
    }
    if (!isdefined(level.formationlist[formationname])) {
        return 1;
    }
    if (numai <= 1) {
        return 1;
    }
    if (var_9af84e76946ada66 && var_3f4d3640a452a225 != 1) {
        numai--;
    }
    switch (var_3f4d3640a452a225) {
    case 1: 
        dimension = ceil((sqrt(8 * numai + 1) - 1) / 2);
        offsetcount = 1;
        for (verticalindex = 0; verticalindex < dimension; verticalindex++) {
            for (horizontalindex = 0; horizontalindex < verticalindex + 1; horizontalindex++) {
                if (verticalindex == 0 && horizontalindex == 0) {
                    continue;
                }
                yoffset = var_b4060a330731f1bd * (horizontalindex - verticalindex / 2);
                xoffset = var_1b9a7d48f06da667 * -1 * verticalindex;
                function_c412284514efc768(level.formationlist[formationname], offsetcount, (xoffset, yoffset, 0));
                offsetcount++;
            }
        }
        return ((dimension - 1) * var_b4060a330731f1bd);
    case 2: 
        mid = 0;
        horizontalcount = 1;
        verticalcount = numai;
        break;
    case 3: 
        mid = 1;
        horizontalcount = 2;
        verticalcount = ceil(numai / horizontalcount);
        break;
    case 4: 
        mid = 1;
        horizontalcount = 3;
        verticalcount = ceil(numai / horizontalcount);
        break;
    default: 
        horizontalcount = ceil(sqrt(numai));
        verticalcount = ceil(numai / horizontalcount);
        mid = floor(horizontalcount / 2);
        break;
    }
    offsetcount = 1;
    for (verticalindex = 0; verticalindex < verticalcount; verticalindex++) {
        for (horizontalindex = 0; horizontalindex < horizontalcount; horizontalindex++) {
            if (!var_9af84e76946ada66 && verticalindex == 0 && horizontalindex == mid) {
                continue;
            }
            yoffset = var_b4060a330731f1bd * -1 * (horizontalindex - mid);
            xoffset = var_1b9a7d48f06da667 * -1 * verticalindex;
            if (var_9af84e76946ada66) {
                yoffset -= 0.5 * (horizontalcount - 1) % 2 * var_b4060a330731f1bd;
                xoffset -= var_1b9a7d48f06da667;
            }
            function_c412284514efc768(level.formationlist[formationname], offsetcount, (xoffset, yoffset, 0));
            offsetcount++;
        }
    }
    return (horizontalcount - 1) * var_b4060a330731f1bd;
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6db
// Size: 0xb6
function function_e780688c49cc9549(formationname, var_93e0bc97a6d45499) {
    if (!isdefined(level.formationlist[formationname])) {
        return;
    }
    assertex(var_93e0bc97a6d45499.size < 31, "Exceeding max number of formation offsets of " + 32 - 1 + " . Formation name of " + level.formationlist[formationname]);
    count = 1;
    foreach (offset in var_93e0bc97a6d45499) {
        function_c412284514efc768(level.formationlist[formationname], count, offset);
        count++;
    }
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x799
// Size: 0x77
function function_bc785df299663d60(formationname, formationslot, customoffset) {
    if (!isdefined(level.formationlist[formationname])) {
        return;
    }
    maxcount = 31;
    assertex(formationslot < maxcount && formationslot > 0, "Setting invalid formation slot custom offset, must be below " + maxcount + " and above 0. Formation name of " + level.formationlist[formationname]);
    function_c412284514efc768(level.formationlist[formationname], formationslot, customoffset);
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x818
// Size: 0x35
function set_goal(formationname, goalposition) {
    if (!isdefined(level.formationlist[formationname])) {
        return;
    }
    function_e29a9a1d854faa6a(level.formationlist[formationname], goalposition);
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x855
// Size: 0x69
function leave_formation(var_cc408e19cc4792d2) {
    if (!isarray(var_cc408e19cc4792d2)) {
        var_cc408e19cc4792d2 = [var_cc408e19cc4792d2];
    }
    foreach (ai in var_cc408e19cc4792d2) {
        ai exit_formation();
    }
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8c6
// Size: 0x7a
function follow_entity(formationname, ent, followdistance, timestep) {
    if (!isdefined(followdistance)) {
        followdistance = 100;
    }
    if (!isdefined(ent)) {
        return false;
    }
    if (!isdefined(level.formationlist[formationname])) {
        return false;
    }
    leader = get_leader(formationname);
    if (isdefined(leader)) {
        leader setgoalentity(ent);
        function_34c06b9933952e67(level.formationlist[formationname], followdistance);
        return true;
    }
    return false;
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x949
// Size: 0x3e
function function_5e8d7d93ecffa23f(formationname) {
    if (!isdefined(level.formationlist[formationname])) {
        return false;
    }
    leader = get_leader(formationname);
    if (isdefined(leader)) {
        leader cleargoalentity();
        return true;
    }
    return false;
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x990
// Size: 0x2c
function get_leader(formationname) {
    if (!isdefined(level.formationlist[formationname])) {
        return undefined;
    }
    return function_37a4bf80ea1cae75(level.formationlist[formationname]);
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c5
// Size: 0x2f
function function_679b2830741a1384(formationname) {
    formationid = level.formationlist[formationname];
    if (!isdefined(formationid)) {
        return;
    }
    self function_5ba70c95e357a4f9(formationid);
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9fc
// Size: 0x27
function private exit_formation() {
    if (istrue(self.information)) {
        self.information = 0;
        self function_fd663014f7eae161();
        function_699890f2ebe93aa9();
    }
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa2b
// Size: 0x25
function private enter_formation(formationid) {
    exit_formation();
    self.information = 1;
    self function_19ef30914f93393e(formationid);
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa58
// Size: 0x1db
function private need_to_run(formationname) {
    self endon("death");
    self endon("enemy");
    self endon("following_entity");
    level endon("game_ended");
    self notify("ai_formation_run_watcher");
    self endon("ai_formation_run_watcher");
    var_5ceb8e651146f51c = 1000;
    var_4a9b8203f0e14a0 = 250;
    while (true) {
        leader = get_leader(formationname);
        if (!isdefined(leader)) {
            wait 1;
            continue;
        }
        disttogoal = self pathdisttogoal() - leader pathdisttogoal();
        /#
            if (getdvarint(@"hash_96eb05fe9867a3a4", 0) == 1) {
                print3d(self.origin, self getdemeanor(), (1, 0, 0), 1, 1, 20);
                goal = self getgoalpos(3);
                draw_circle(goal, var_5ceb8e651146f51c, (1, 0, 0), 50);
                draw_circle(goal, var_4a9b8203f0e14a0, (0, 1, 0), 50);
            }
        #/
        var_dd47ec6a7eac4674 = "sprint";
        if (self.var_7bd1c0edbaafb6e0 != var_dd47ec6a7eac4674 && disttogoal > var_5ceb8e651146f51c) {
            self enableavoidance(1);
            if (!isdefined(self.var_3bca4b669ba7140c) || !isdefined(self.var_d008717a85388441)) {
                self.var_3bca4b669ba7140c = self.var_7bd1c0edbaafb6e0;
                self.var_d008717a85388441 = self.var_5bdfa4fd67341cf5;
            }
            self.var_7bd1c0edbaafb6e0 = var_dd47ec6a7eac4674;
            self.var_5bdfa4fd67341cf5 = var_dd47ec6a7eac4674;
        } else if (self.var_7bd1c0edbaafb6e0 == var_dd47ec6a7eac4674 && disttogoal < var_4a9b8203f0e14a0) {
            self enableavoidance(0);
            self.var_7bd1c0edbaafb6e0 = self.var_3bca4b669ba7140c;
            self.var_5bdfa4fd67341cf5 = self.var_d008717a85388441;
        }
        wait 1;
    }
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc3b
// Size: 0x40
function private function_699890f2ebe93aa9() {
    if (isdefined(self.var_3bca4b669ba7140c)) {
        self.var_7bd1c0edbaafb6e0 = self.var_3bca4b669ba7140c;
    }
    if (isdefined(self.var_d008717a85388441)) {
        self.var_5bdfa4fd67341cf5 = self.var_d008717a85388441;
    }
}
