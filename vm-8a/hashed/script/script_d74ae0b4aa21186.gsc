#using scripts\engine\utility.gsc;
#using script_4a941421347ff7df;

#namespace mind;

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c5
// Size: 0x92
function globalinitialize(var_f9320d3953360ca2) {
    if (isdefined(level.mind)) {
        return;
    }
    level.mind = spawnstruct();
    level.mind.callbacks = spawnstruct();
    level.mind.callbacks.var_b7d58173e645ec4f = var_f9320d3953360ca2;
    level.mind.events = spawnstruct();
    level.mind.var_577f45571c039a54 = namespace_823e1abd5161abb1::function_6930ba7fa0669dba();
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f
// Size: 0x38
function initialize() {
    assert(isdefined(level.mind));
    self.mind = spawnstruct();
    function_fc6ca7aac4a988f5();
    function_e1aad2d0b9d1a56f();
    function_505d8b7080733a24();
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49f
// Size: 0x8d
function initializeupdate() {
    foreach (decision in self.mind.var_f0a8822dcc782c9d.var_577f45571c039a54) {
        decision.var_6b8af58a3f65c8f2 = 0;
    }
    self.mind.var_c38fcea73953365e.var_dd12ce0e7469509b = undefined;
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x534
// Size: 0x8e
function update() {
    starttimeus = getsystemtimeinmicroseconds();
    if (function_edd1c69fa427f0e5()) {
        function_5bb78fd119f84548();
        function_6935ab68e207ab2b();
        function_bf27f58f5ee818da();
    }
    currenttimeus = getsystemtimeinmicroseconds();
    if (currenttimeus < starttimeus) {
        elapsedtimeus = 2147483647 - starttimeus + 1 + currenttimeus;
    } else {
        elapsedtimeus = currenttimeus - starttimeus;
    }
    waittimesec = 0.1 - elapsedtimeus * 1e-06;
    if (waittimesec > 0) {
        wait waittimesec;
        return;
    }
    wait 0.001;
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ca
// Size: 0x114
function function_edd1c69fa427f0e5() {
    needupdate = 0;
    foreach (decision in self.mind.var_f0a8822dcc782c9d.var_577f45571c039a54) {
        decision.var_10f0b5c52ece08ce = 0;
        if (!decision.enabled) {
            continue;
        }
        decision.var_6b8af58a3f65c8f2 -= 100;
        if (decision.var_6b8af58a3f65c8f2 <= 0) {
            decision.var_6b8af58a3f65c8f2 += decision.var_ed2441bc0e552f8d;
            if (decision.var_6b8af58a3f65c8f2 == 0) {
                decision.var_6b8af58a3f65c8f2 = decision.var_ed2441bc0e552f8d;
            }
            decision.var_10f0b5c52ece08ce = 1;
            needupdate = 1;
        }
    }
    return needupdate;
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e7
// Size: 0x41
function function_fc6ca7aac4a988f5() {
    self.mind.eventstream = spawnstruct();
    self.mind.eventstream.events = [];
    namespace_823e1abd5161abb1::createevents();
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x730
// Size: 0x20
function function_c74368899713e7e6() {
    event = spawnstruct();
    event.evaluated = 0;
    return event;
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x759
// Size: 0x70
function function_5bb78fd119f84548() {
    foreach (event in self.mind.eventstream.events) {
        event.evaluated = 0;
    }
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d1
// Size: 0x137
function function_e1aad2d0b9d1a56f() {
    var_f0a8822dcc782c9d = spawnstruct();
    var_f0a8822dcc782c9d.var_577f45571c039a54 = [];
    /#
        var_f0a8822dcc782c9d.debuginfo = "<dev string:x1c>";
    #/
    descriptions = level.mind.var_577f45571c039a54;
    var_141f7edd65e37a2d = namespace_823e1abd5161abb1::function_bfa5c0c232ced7eb();
    foreach (decisionname in var_141f7edd65e37a2d) {
        desc = descriptions[decisionname];
        assertex(isdefined(desc), "Invalid decision name: " + decisionname);
        var_87f71c8ba2104b76 = desc.var_87f71c8ba2104b76;
        assertex(isdefined(var_87f71c8ba2104b76), "Not found 'createDecisionMethod' of decision: " + decisionname);
        decision = [[ var_87f71c8ba2104b76 ]]();
        decision.name = decisionname;
        var_f0a8822dcc782c9d.var_577f45571c039a54[decisionname] = decision;
    }
    self.mind.var_f0a8822dcc782c9d = var_f0a8822dcc782c9d;
    function_b4c45ed36fa851d5();
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x910
// Size: 0x7f
function function_bffb5b682a4ef6a2(scoremethod, var_90645b7af425f119, var_ed2441bc0e552f8d, var_b97e27a7552f6031) {
    decision = spawnstruct();
    decision.evaluatescore = scoremethod;
    decision.actiongenerator = var_90645b7af425f119;
    decision.var_b97e27a7552f6031 = var_b97e27a7552f6031;
    decision function_f7033a7afad12cdd(var_ed2441bc0e552f8d);
    decision.score = 0;
    decision.enabled = 1;
    return decision;
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x998
// Size: 0xbf
function function_f7033a7afad12cdd(var_ed2441bc0e552f8d) {
    var_465d72931390a18e = 1000;
    var_a9c773f1d0e72281 = self.var_ed2441bc0e552f8d;
    self.var_ed2441bc0e552f8d = default_to(var_ed2441bc0e552f8d, var_465d72931390a18e);
    if (self.var_ed2441bc0e552f8d < 100) {
        self.var_ed2441bc0e552f8d = 100;
    }
    if (isdefined(var_a9c773f1d0e72281) && var_a9c773f1d0e72281 != self.var_ed2441bc0e552f8d && isdefined(self.var_6b8af58a3f65c8f2) && self.var_6b8af58a3f65c8f2 != 0) {
        self.var_6b8af58a3f65c8f2 += self.var_ed2441bc0e552f8d - var_a9c773f1d0e72281;
        if (self.var_6b8af58a3f65c8f2 < 0) {
            self.var_6b8af58a3f65c8f2 = 0;
        }
    }
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5f
// Size: 0x154
function function_bf27f58f5ee818da() {
    var_37f47315e6bcba99 = undefined;
    foreach (decision in self.mind.var_f0a8822dcc782c9d.var_577f45571c039a54) {
        decision.var_df9d35d9b4bee654 = undefined;
        if (!decision.var_10f0b5c52ece08ce) {
            decision.score = 0;
            continue;
        }
        decision.score = decision [[ decision.evaluatescore ]](self);
        if (decision.score > 0) {
            if (!isdefined(var_37f47315e6bcba99) || decision.score > var_37f47315e6bcba99.score) {
                var_37f47315e6bcba99 = decision;
            }
        }
    }
    if (isdefined(var_37f47315e6bcba99)) {
        var_e25a797f1d46b511 = function_b697ed2efbe072b9(var_37f47315e6bcba99);
        if (isdefined(var_e25a797f1d46b511)) {
            var_37f47315e6bcba99 = var_e25a797f1d46b511;
        }
        if (var_37f47315e6bcba99 function_7d9b2d9364b68c8e(self)) {
            function_3cf1fa93b66c0336(var_37f47315e6bcba99.var_df9d35d9b4bee654, var_37f47315e6bcba99.score);
        }
    }
    /#
        self.mind.var_f0a8822dcc782c9d.debuginfo = "<dev string:x1c>";
    #/
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbb
// Size: 0x13b
function function_b697ed2efbe072b9(decision) {
    if (!decision function_7d9b2d9364b68c8e(self)) {
        return undefined;
    }
    var_de3528a27254711d = undefined;
    foreach (executing in self.mind.var_c38fcea73953365e.actions) {
        if (decision.var_df9d35d9b4bee654.var_1cd1b7db5606880e == executing.var_1cd1b7db5606880e) {
            var_de3528a27254711d = executing;
            break;
        }
    }
    if (isdefined(var_de3528a27254711d)) {
        var_eb0138d72f9fb02a = var_de3528a27254711d.decision;
        if (var_eb0138d72f9fb02a.enabled && !var_eb0138d72f9fb02a.var_10f0b5c52ece08ce) {
            var_eb0138d72f9fb02a.var_df9d35d9b4bee654 = undefined;
            score = var_eb0138d72f9fb02a [[ var_eb0138d72f9fb02a.evaluatescore ]](self);
            if (score >= decision.score) {
                var_eb0138d72f9fb02a.score = score;
                return var_eb0138d72f9fb02a;
            } else {
                var_eb0138d72f9fb02a.var_df9d35d9b4bee654 = undefined;
            }
        }
    }
    return undefined;
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcff
// Size: 0x77
function function_7d9b2d9364b68c8e(bot) {
    if (isdefined(self.var_df9d35d9b4bee654)) {
        return 1;
    }
    if (isdefined(self.actiongenerator)) {
        self.var_df9d35d9b4bee654 = self [[ self.actiongenerator ]](bot);
        assert(isdefined(self.var_df9d35d9b4bee654));
        return 1;
    }
    assertmsg("No action generated for a made decision '" + self.name + "'");
    return 0;
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7e
// Size: 0x95
function function_5e44c9968544264(enabled, var_1e19818e63c57531) {
    foreach (name, decision in self.mind.var_f0a8822dcc782c9d.var_577f45571c039a54) {
        if (isdefined(var_1e19818e63c57531) && array_contains(var_1e19818e63c57531, name)) {
            continue;
        }
        decision.enabled = enabled;
    }
}

/#

    // Namespace mind / namespace_56b9cc3deb6e3f5e
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xe1b
    // Size: 0x1a3
    function function_e3becfc53745debe(var_ddd5b02aaf128173) {
        assert(!isdefined(var_ddd5b02aaf128173) || var_ddd5b02aaf128173 > 0);
        var_f0a8822dcc782c9d = self.mind.var_f0a8822dcc782c9d;
        if (var_f0a8822dcc782c9d.debuginfo.size > 0) {
            return var_f0a8822dcc782c9d.debuginfo;
        }
        var_21b72418e16677fb = function_e60ece723e993125(var_f0a8822dcc782c9d.var_577f45571c039a54);
        debuginfo = "<dev string:x1c>";
        count = 0;
        foreach (decision in var_21b72418e16677fb) {
            score = int(decision.score);
            if (score <= 0) {
                break;
            }
            if (debuginfo.size > 0) {
                debuginfo += "<dev string:x1d>";
            }
            if (isdefined(decision.var_df9d35d9b4bee654)) {
                name = decision.var_df9d35d9b4bee654 getdescription();
            } else {
                name = decision.name;
            }
            debuginfo += score + "<dev string:x21>" + name;
            count++;
            if (isdefined(var_ddd5b02aaf128173) && count == var_ddd5b02aaf128173) {
                break;
            }
        }
        if (debuginfo.size > 0) {
            println("<dev string:x23>" + self getentitynumber() + "<dev string:x3e>" + debuginfo);
        }
        var_f0a8822dcc782c9d.debuginfo = debuginfo;
        return debuginfo;
    }

    // Namespace mind / namespace_56b9cc3deb6e3f5e
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xfc6
    // Size: 0x4e
    function getdescription() {
        var_11728671e7960b51 = 25;
        description = self.description;
        len = description.size;
        if (len > var_11728671e7960b51) {
            description = getsubstr(description, 0, var_11728671e7960b51 - 3) + "<dev string:x41>";
        }
        return description;
    }

#/

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101c
// Size: 0x6e
function function_e60ece723e993125(var_577f45571c039a54) {
    array = [];
    foreach (decision in var_577f45571c039a54) {
        array[array.size] = decision;
    }
    return array_sort_with_func(array, &function_6630749576e808a7);
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1093
// Size: 0x2a
function function_6630749576e808a7(var_577f07571c0311fa, var_577f06571c030fc7) {
    return var_577f07571c0311fa.score > var_577f06571c030fc7.score;
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c6
// Size: 0x95
function function_4e58bf49977d1bfd(argument) {
    action = self.var_8ff05874bbb1ac7c;
    if (!isdefined(action)) {
        return 0;
    }
    currentargument = action.argument;
    if (isdefined(currentargument) != isdefined(argument)) {
        return 0;
    }
    if (isdefined(currentargument)) {
        if (isdefined(self.var_b97e27a7552f6031)) {
            if (![[ self.var_b97e27a7552f6031 ]](currentargument, argument)) {
                return 0;
            }
        } else {
            assertex(!isstruct(currentargument), "Need to provide a 'argumentComparer' function if argument is of struct type");
            if (currentargument != argument) {
                return 0;
            }
        }
    }
    return action.sunkcost;
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1164
// Size: 0x51
function function_39b811fb3872bdb8(var_d721b9cd69442737, metatag) {
    assertex(isdefined(var_d721b9cd69442737), "DecisionConstants(), parameter 'loadConstantsMethod' must be defined.");
    constants = spawnstruct();
    [[ var_d721b9cd69442737 ]](constants);
    constants.var_5d6ecf0f2ffb1b0d = default_to(metatag, "");
    return constants;
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11be
// Size: 0x63
function function_30e98541032449dd(var_d721b9cd69442737, metatag) {
    assertex(isstruct(self), "DerivedDecisionConstants() must be called on a constants of struct type.");
    assertex(isdefined(var_d721b9cd69442737) && isdefined(metatag), "DerivedDecisionConstants(), parameters must be defined.");
    var_c87591a99f9a3d13 = structcopy(self, 1);
    [[ var_d721b9cd69442737 ]](var_c87591a99f9a3d13);
    var_c87591a99f9a3d13.var_5d6ecf0f2ffb1b0d = metatag;
    return var_c87591a99f9a3d13;
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x122a
// Size: 0xd4
function function_4e8e4b3605e73a33(createmethod, var_6beb626a7b315296) {
    assertex(isdefined(createmethod), "CreateDecisionDescription(), parameter 'createMethod' must be defined.");
    desc = spawnstruct();
    desc.var_87f71c8ba2104b76 = createmethod;
    if (isdefined(var_6beb626a7b315296)) {
        constantsmap = [];
        constantslist = [[ var_6beb626a7b315296 ]]();
        foreach (constants in constantslist) {
            if (isdefined(constants.var_5d6ecf0f2ffb1b0d)) {
                constantsmap[constants.var_5d6ecf0f2ffb1b0d] = constants;
            }
        }
        desc.constantsmap = constantsmap;
    }
    return desc;
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1307
// Size: 0x10f
function function_b4c45ed36fa851d5() {
    assert(isdefined(self.mind) && isdefined(self.mind.var_f0a8822dcc782c9d));
    var_f0a8822dcc782c9d = self.mind.var_f0a8822dcc782c9d;
    descriptions = level.mind.var_577f45571c039a54;
    matchlist = namespace_823e1abd5161abb1::function_dd6540682cd2ab87();
    foreach (name, decision in var_f0a8822dcc782c9d.var_577f45571c039a54) {
        desc = descriptions[name];
        assert(isdefined(desc));
        if (isdefined(desc.constantsmap)) {
            decision.constants = namespace_823e1abd5161abb1::function_f56bbc9f43769ff6(desc.constantsmap, matchlist);
        }
    }
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141e
// Size: 0x5a
function function_505d8b7080733a24() {
    var_c38fcea73953365e = spawnstruct();
    var_c38fcea73953365e.actions = [];
    var_c38fcea73953365e.var_33619db9d3c4b989 = namespace_823e1abd5161abb1::function_68397cb2cf3494e9();
    /#
        var_c38fcea73953365e.debuginfo = "<dev string:x1c>";
    #/
    self.mind.var_c38fcea73953365e = var_c38fcea73953365e;
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1480
// Size: 0x16a
function createactionbase(name, argument, var_1cd1b7db5606880e, description, processmethod, decision, endhandler, var_da2f00d6903b03b7, var_daec6fd98c7cee50) {
    assert(!isdefined(var_da2f00d6903b03b7) || var_da2f00d6903b03b7 > 0);
    assert(!isdefined(var_daec6fd98c7cee50) || var_daec6fd98c7cee50 > 0);
    assertex(isdefined(var_da2f00d6903b03b7) || !isdefined(var_daec6fd98c7cee50), "If max value exists, increment value must also exist");
    if (!isdefined(description)) {
        assertmsg("The description of action " + name + " is undefined. It is used to distinguish different instances of the same action. Specify an empty string to it if all instances are the same");
        description = "";
    }
    action = spawnstruct();
    action.name = name;
    action.argument = argument;
    action.var_1cd1b7db5606880e = var_1cd1b7db5606880e;
    action.description = name;
    if (description.size > 0) {
        action.description += " " + description;
    }
    action.processmethod = processmethod;
    action.decision = decision;
    action.endhandler = endhandler;
    action.var_da2f00d6903b03b7 = var_da2f00d6903b03b7;
    action.var_daec6fd98c7cee50 = var_daec6fd98c7cee50;
    action.sunkcost = 0;
    return action;
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f3
// Size: 0x12c
function function_6935ab68e207ab2b() {
    var_c38fcea73953365e = self.mind.var_c38fcea73953365e;
    deltatimesec = 0;
    time = gettime();
    if (isdefined(var_c38fcea73953365e.var_dd12ce0e7469509b)) {
        deltatimesec = (time - var_c38fcea73953365e.var_dd12ce0e7469509b) * 0.001;
    }
    var_c38fcea73953365e.var_dd12ce0e7469509b = time;
    foreach (action in var_c38fcea73953365e.actions) {
        var_da2f00d6903b03b7 = action.var_da2f00d6903b03b7;
        if (isdefined(var_da2f00d6903b03b7)) {
            action.sunkcost += var_da2f00d6903b03b7 * deltatimesec;
            var_daec6fd98c7cee50 = action.var_daec6fd98c7cee50;
            if (isdefined(var_daec6fd98c7cee50) && action.sunkcost > var_daec6fd98c7cee50) {
                action.sunkcost = var_daec6fd98c7cee50;
            }
        }
    }
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1727
// Size: 0xd4
function function_3cf1fa93b66c0336(action, score) {
    var_c38fcea73953365e = self.mind.var_c38fcea73953365e;
    foreach (executing in var_c38fcea73953365e.actions) {
        if (action.description == executing.description) {
            return;
        }
    }
    action.score = score;
    action.decision.var_8ff05874bbb1ac7c = action;
    action.var_7fdb8fdafb49730 = var_c38fcea73953365e;
    startaction(action);
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1803
// Size: 0x148
function startaction(action) {
    var_c38fcea73953365e = self.mind.var_c38fcea73953365e;
    if (action.var_1cd1b7db5606880e != "") {
        removers = [];
        foreach (executing in var_c38fcea73953365e.actions) {
            if (action.var_1cd1b7db5606880e == executing.var_1cd1b7db5606880e) {
                removers[removers.size] = executing;
            }
        }
        if (removers.size > 0) {
            foreach (removing in removers) {
                endaction(removing);
            }
        }
    }
    var_c38fcea73953365e.actions[var_c38fcea73953365e.actions.size] = action;
    /#
        var_c38fcea73953365e.debuginfo = "<dev string:x1c>";
    #/
    thread actionthread(action);
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1953
// Size: 0xe6
function actionthread(action) {
    level endon("game_ended");
    endconditions = ["bot_suspended", "death_or_disconnect", action.description];
    foreach (condition in endconditions) {
        self endon(condition);
    }
    self notify("bot_action_start", action);
    thread function_cfab1366832a49eb(endconditions, action);
    action.lasterror = action [[ action.processmethod ]](self);
    /#
        if (isdefined(action.lasterror)) {
            action.var_24323dd7256d2d04 = gettime();
        }
    #/
    self notify(action.description);
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a41
// Size: 0x186
function function_cfab1366832a49eb(endconditions, action) {
    function_1d3af9a375f218dd(endconditions);
    action.completed = 1;
    action.decision.var_8ff05874bbb1ac7c = undefined;
    var_c38fcea73953365e = self.mind.var_c38fcea73953365e;
    var_c38fcea73953365e.actions = array_remove(var_c38fcea73953365e.actions, action);
    if (isdefined(action.endhandler)) {
        lasterror = [[ action.endhandler ]](action);
        if (isdefined(lasterror)) {
            action.lasterror = lasterror;
            /#
                action.var_24323dd7256d2d04 = gettime();
            #/
        }
    }
    if (isdefined(var_c38fcea73953365e.var_33619db9d3c4b989)) {
        [[ var_c38fcea73953365e.var_33619db9d3c4b989 ]](action);
    }
    /#
        if (isdefined(action.lasterror) && action.lasterror.size > 0) {
            var_c38fcea73953365e.lasterror = action.lasterror + "<dev string:x1d>" + action getdescription() + "<dev string:x1d>" + action.var_1cd1b7db5606880e;
            var_c38fcea73953365e.var_24323dd7256d2d04 = action.var_24323dd7256d2d04;
        }
        var_c38fcea73953365e.debuginfo = "<dev string:x1c>";
    #/
    self notify("bot_action_end", action);
    self notify(action.description + "Ended");
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bcf
// Size: 0x43
function function_1d3af9a375f218dd(messages) {
    assertex(messages.size > 0, "Message array must contain at least one string.");
    for (i = 0; i < messages.size; i++) {
        self endon(messages[i]);
    }
    level waittill("game_ended");
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c1a
// Size: 0x3d
function endaction(action) {
    if (istrue(action.completed)) {
        return;
    }
    self notify(action.description);
    self waittill(action.description + "Ended");
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5f
// Size: 0x6b
function function_cd40e795b7776f14() {
    foreach (action in self.mind.var_c38fcea73953365e.actions) {
        endaction(action);
    }
}

// Namespace mind / namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd2
// Size: 0x4
function function_d57dd414963503d1() {
    return isdefined(self);
}

/#

    // Namespace mind / namespace_56b9cc3deb6e3f5e
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1cdf
    // Size: 0x14e
    function function_895e12d8ae226936() {
        var_c38fcea73953365e = self.mind.var_c38fcea73953365e;
        if (var_c38fcea73953365e.debuginfo.size > 0) {
            return var_c38fcea73953365e.debuginfo;
        }
        debuginfo = "<dev string:x1c>";
        foreach (action in var_c38fcea73953365e.actions) {
            if (debuginfo.size > 0) {
                debuginfo += "<dev string:x1d>";
            }
            group = action.var_1cd1b7db5606880e;
            name = action.description;
            if (isdefined(action.var_55a389ca3c7d0111) && action.var_55a389ca3c7d0111.size > 0) {
                name += "<dev string:x45>" + action.var_55a389ca3c7d0111;
            }
            debuginfo += group + "<dev string:x21>" + name;
        }
        if (debuginfo.size > 0) {
            println("<dev string:x49>" + self getentitynumber() + "<dev string:x3e>" + debuginfo);
        }
        var_c38fcea73953365e.debuginfo = debuginfo;
        return debuginfo;
    }

    // Namespace mind / namespace_56b9cc3deb6e3f5e
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e35
    // Size: 0x8d
    function function_7ec4108a3d7a4091() {
        if (!isdefined(self.mind.var_c38fcea73953365e.lasterror)) {
            return undefined;
        }
        timesec = int((gettime() - self.mind.var_c38fcea73953365e.var_24323dd7256d2d04) * 0.001);
        return self.mind.var_c38fcea73953365e.lasterror + "<dev string:x1d>" + timesec + "<dev string:x68>";
    }

    // Namespace mind / namespace_56b9cc3deb6e3f5e
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1eca
    // Size: 0x59
    function function_f3cf203834e48c6d(status) {
        assert(isdefined(status));
        if (isdefined(self.var_55a389ca3c7d0111) && self.var_55a389ca3c7d0111 == status) {
            return;
        }
        self.var_55a389ca3c7d0111 = status;
        self.var_7fdb8fdafb49730.debuginfo = "<dev string:x1c>";
    }

#/
