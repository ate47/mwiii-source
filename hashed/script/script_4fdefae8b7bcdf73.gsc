// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_2707474774db34b;
#using script_7956d56c4922bd1;
#using script_3ac7886f9e4eceef;
#using script_3a13b8032b62a5e6;
#using scripts\mp\objidpoolmanager.gsc;
#using script_4d39bd4c621e7680;

#namespace namespace_c669075cf56436f4;

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x246
// Size: 0x3f
function function_36a95c9de2ace25a(bundlename, shouldpin, var_777b269d7a4d5633) {
    var_4a558cc732837ca3 = hashcat(%"hash_334a4b8da1c7fd3f", bundlename);
    return function_f7680f0db96cad7b(var_4a558cc732837ca3, shouldpin, var_777b269d7a4d5633);
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28d
// Size: 0x81
function function_f7680f0db96cad7b(var_4a558cc732837ca3, shouldpin, var_777b269d7a4d5633) {
    var_777b269d7a4d5633 = default_to(var_777b269d7a4d5633, 1);
    shouldpin = default_to(shouldpin, 0);
    var_e18422fb39577bb4 = namespace_871f41e67db0bf7a::function_594acad17d5c9722(var_4a558cc732837ca3);
    if (isdefined(var_e18422fb39577bb4) && var_e18422fb39577bb4 != -1) {
        function_6f02ac608d44fdbf(var_e18422fb39577bb4, shouldpin, var_777b269d7a4d5633);
    } else {
        /#
            assertmsg("Could not add the Objective Marker from bundle: " + function_3c8848a3a11b2553(var_4a558cc732837ca3) + " to the Activity Instance: " + namespace_68dc261109a9503f::function_a4748b32a824c79c(self));
        #/
    }
    return var_e18422fb39577bb4;
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x316
// Size: 0xb9
function function_6f02ac608d44fdbf(markerid, shouldpin, var_777b269d7a4d5633) {
    var_777b269d7a4d5633 = default_to(var_777b269d7a4d5633, 1);
    self.objectivemarkers[markerid] = spawnstruct();
    self.objectivemarkers[markerid].id = markerid;
    self.objectivemarkers[markerid].shouldpin = istrue(shouldpin);
    self.objectivemarkers[markerid].var_1a64187243779c27 = var_777b269d7a4d5633;
    activitynexuslog("MARKER IS BEING MANAGED:" + function_203add19f2f26253(markerid), @"hash_ee2680c4a8804012", self);
    if (var_777b269d7a4d5633) {
        objective_removeallfrommask(markerid);
        function_c32880b1943fa8ba(self.var_6c29f2fdb0054bbe, markerid);
    }
    return markerid;
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d7
// Size: 0x53
function function_70fba69479c7f650(markerid) {
    if (!isdefined(self.objectivemarkers[markerid])) {
        return;
    }
    self.objectivemarkers = array_remove_key(self.objectivemarkers, markerid);
    activitynexuslog("MARKER IS NO LONGER BEING MANAGED:" + function_203add19f2f26253(markerid), @"hash_ee2680c4a8804012", self);
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x431
// Size: 0x62
function function_765b706dc170e214(markerid) {
    if (!isdefined(markerid) || !isdefined(self.objectivemarkers[markerid])) {
        return;
    }
    self.objectivemarkers = array_remove_key(self.objectivemarkers, markerid);
    scripts/mp/objidpoolmanager::returnobjectiveid(markerid);
    activitynexuslog("MARKER RETURNED TO OBJECTIVE POOL:" + function_203add19f2f26253(markerid), @"hash_ee2680c4a8804012", self);
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49a
// Size: 0x4f
function function_2a691f6f7cceb283(markerid) {
    /#
        assertex(isdefined(self.objectivemarkers[markerid]), "The objective marker id given does not correspond to any markers currently added to the activity.");
    #/
    self.objectivemarkers[markerid].shouldpin = 1;
    function_8e26a7c882870c4(self.var_6c29f2fdb0054bbe, markerid);
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f0
// Size: 0x4e
function function_48f5297a819ff2e(markerid) {
    /#
        assertex(isdefined(self.objectivemarkers[markerid]), "The objective marker id given does not correspond to any markers currently added to the activity.");
    #/
    self.objectivemarkers[markerid].shouldpin = 0;
    function_5aade87a12c96e0d(self.var_6c29f2fdb0054bbe, markerid);
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x545
// Size: 0x92
function function_47a5129abc55bd53(activityinstance, activitymoment) {
    if (function_cdea2ef0bf179c63(activityinstance)) {
        type = function_c3f893aeddade548(activityinstance);
        var_cdd4cb94d85d0f38 = function_ec3073136fa5be4f(activityinstance);
        var_276eec611efa4f11 = function_77041690eb55db6e(activityinstance);
        if (var_cdd4cb94d85d0f38 == activitymoment) {
            if (type == "Scriptable") {
                function_9dd7c4ff55eca947(activityinstance);
            } else {
                function_293783f421e3bdc0(activityinstance);
            }
            return;
        }
        if (var_276eec611efa4f11 == activitymoment) {
            if (type == "GSCScript") {
                function_dd2abd81ef1b965d(activityinstance);
            }
        }
    }
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5de
// Size: 0x17
function function_592fd3b0ebcfd2dc(activityinstance) {
    return activityinstance.var_d953047f1b4c7c9;
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fd
// Size: 0xa5
function function_451ffc1b7133042f(player) {
    foreach (marker in self.objectivemarkers) {
        if (marker.var_1a64187243779c27) {
            function_c32880b1943fa8ba([player], marker.id);
            if (marker.shouldpin) {
                function_8e26a7c882870c4([player], marker.id);
            }
        }
    }
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a9
// Size: 0xa5
function function_2d38888e45d6a28a(player) {
    foreach (marker in self.objectivemarkers) {
        if (marker.var_1a64187243779c27) {
            function_271c0af82f71d8b8([player], marker.id);
            if (marker.shouldpin) {
                function_5aade87a12c96e0d([player], marker.id);
            }
        }
    }
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x755
// Size: 0x6c
function function_1c5d0098478465a() {
    foreach (marker in self.objectivemarkers) {
        scripts/mp/objidpoolmanager::returnobjectiveid(marker.id);
    }
    self.objectivemarkers = [];
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c8
// Size: 0x87
function function_c32880b1943fa8ba(players, markerid) {
    foreach (player in players) {
        objective_addclienttomask(markerid, player);
        objective_showtoplayersinmask(markerid);
        activitynexuslog("PLAYER ADDED TO MARKER VISIBILITY MASK:" + function_203add19f2f26253(markerid), @"hash_ee2680c4a8804012", self, players);
    }
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x856
// Size: 0x80
function function_271c0af82f71d8b8(players, markerid) {
    foreach (player in players) {
        objective_removeclientfrommask(markerid, player);
        activitynexuslog("PLAYER REMOVED FROM MARKER VISIBILITY MASK:" + function_203add19f2f26253(markerid), @"hash_ee2680c4a8804012", self, players);
    }
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8dd
// Size: 0x62
function private function_8e26a7c882870c4(players, markerid) {
    foreach (player in players) {
        scripts/mp/objidpoolmanager::objective_pin_player(markerid, player);
    }
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x946
// Size: 0x62
function private function_5aade87a12c96e0d(players, markerid) {
    foreach (player in players) {
        scripts/mp/objidpoolmanager::objective_unpin_player(markerid, player);
    }
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9af
// Size: 0x7b
function private function_9dd7c4ff55eca947(activityinstance) {
    var_4619ceba115b296 = function_aa0f1a318b382e70(activityinstance);
    origin = namespace_68dc261109a9503f::function_8988a4c89289d7f4(activityinstance);
    var_276eec611efa4f11 = function_77041690eb55db6e(activityinstance);
    scriptable = namespace_779ebc650a9ef856::function_cb2e672e5fb4f3(activityinstance, var_4619ceba115b296, origin, var_276eec611efa4f11);
    var_d953047f1b4c7c9 = function_b75091dec6ad315a("Scriptable", scriptable);
    activityinstance.var_d953047f1b4c7c9 = var_d953047f1b4c7c9;
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa31
// Size: 0x9b
function private function_293783f421e3bdc0(activityinstance) {
    var_8ab21a9034ddd977 = function_aa0f1a318b382e70(activityinstance);
    var_637960f33380a722 = function_dff7dd2b4e3cf89e(activityinstance);
    shouldpin = function_1574d7fd9a2d904a(activityinstance);
    var_cbb2c370f6f0d524 = activityinstance function_f7680f0db96cad7b(var_8ab21a9034ddd977, shouldpin, var_637960f33380a722);
    origin = namespace_68dc261109a9503f::function_8988a4c89289d7f4(activityinstance);
    scripts/mp/objidpoolmanager::update_objective_position(var_cbb2c370f6f0d524, origin);
    var_d953047f1b4c7c9 = function_b75091dec6ad315a("GSCScript", var_cbb2c370f6f0d524);
    activityinstance.var_d953047f1b4c7c9 = var_d953047f1b4c7c9;
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xad3
// Size: 0x36
function private function_dd2abd81ef1b965d(activityinstance) {
    var_d953047f1b4c7c9 = function_592fd3b0ebcfd2dc(activityinstance);
    if (isdefined(var_d953047f1b4c7c9)) {
        activityinstance function_765b706dc170e214(var_d953047f1b4c7c9.objectivemarkerid);
    }
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb10
// Size: 0x59
function private function_b75091dec6ad315a(var_9062a4b6d1047da9, var_d2471cfb79096bfe) {
    var_d953047f1b4c7c9 = spawnstruct();
    var_d953047f1b4c7c9.var_1cc67d9c5314c74e = var_9062a4b6d1047da9;
    if (var_9062a4b6d1047da9 == "Scriptable") {
        var_d953047f1b4c7c9.scriptable = var_d2471cfb79096bfe;
    } else {
        var_d953047f1b4c7c9.objectivemarkerid = var_d2471cfb79096bfe;
    }
    return var_d953047f1b4c7c9;
}

// Namespace namespace_c669075cf56436f4 / namespace_5ab9942d4e45708d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb71
// Size: 0x13
function private function_203add19f2f26253(markerid) {
    return " objective marker id: " + markerid;
}

