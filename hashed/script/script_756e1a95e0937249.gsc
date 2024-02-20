// mwiii decomp prototype
#namespace PLAYTEST_LOGGER;

// Namespace PLAYTEST_LOGGER/namespace_71483b158f1361f1
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1
// Size: 0xcd
function function_223a972e008c4a09(var_2ea903451e753a5f, var_9dfaf49e38b7b10f, var_9113b547554386ba, var_e16ce54aa38571c0, var_1e9d08b8e40c246a, var_7eea86c60c0788e, var_b0b33580058b7f27, var_243ec5b0a130448e) {
    if (!isdefined(var_243ec5b0a130448e)) {
        var_243ec5b0a130448e = "PLAYTEST_LOGGER";
    }
    struct = spawnstruct();
    struct.var_243ec5b0a130448e = var_243ec5b0a130448e;
    struct.var_2ea903451e753a5f = var_2ea903451e753a5f;
    struct.var_9dfaf49e38b7b10f = var_9dfaf49e38b7b10f;
    struct.var_9113b547554386ba = var_9113b547554386ba;
    struct.var_e16ce54aa38571c0 = var_e16ce54aa38571c0;
    struct.var_1e9d08b8e40c246a = var_1e9d08b8e40c246a;
    struct.var_7eea86c60c0788e = var_7eea86c60c0788e;
    struct.var_b0b33580058b7f27 = var_b0b33580058b7f27;
    return struct;
}

// Namespace PLAYTEST_LOGGER/namespace_71483b158f1361f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186
// Size: 0x1f
function function_6bdedc239dbdac03(var_a0e2837da8b2a7e6, var_c5dab79fa2079db9) {
    function_275c43d7dd5c74d6(var_a0e2837da8b2a7e6, 3, var_c5dab79fa2079db9);
}

// Namespace PLAYTEST_LOGGER/namespace_71483b158f1361f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac
// Size: 0x1e
function function_805bf704f0d94819(msg, var_c5dab79fa2079db9) {
    function_275c43d7dd5c74d6(msg, 0, var_c5dab79fa2079db9);
}

// Namespace PLAYTEST_LOGGER/namespace_71483b158f1361f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d1
// Size: 0x1f
function function_66bc684bfce83dd7(msg, var_c5dab79fa2079db9) {
    function_275c43d7dd5c74d6(msg, 2, var_c5dab79fa2079db9);
}

// Namespace PLAYTEST_LOGGER/namespace_71483b158f1361f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f7
// Size: 0x1f
function function_623ec917984a5d9d(msg, var_c5dab79fa2079db9) {
    function_275c43d7dd5c74d6(msg, 1, var_c5dab79fa2079db9);
}

// Namespace PLAYTEST_LOGGER/namespace_71483b158f1361f1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21d
// Size: 0x9d
function function_275c43d7dd5c74d6(msg, var_d3967d9b1bf53375, var_5808a2476b7bce9b) {
    var_bf4eaca9064fa63f = function_d6a62191d9107d13(var_d3967d9b1bf53375, var_5808a2476b7bce9b);
    if (var_bf4eaca9064fa63f) {
        var_99d1ce3d45d3956a = function_5c8554b7d485da82(msg, var_d3967d9b1bf53375, var_5808a2476b7bce9b);
        logstring(var_99d1ce3d45d3956a);
    }
    /#
        if (!isdefined(var_99d1ce3d45d3956a)) {
            var_99d1ce3d45d3956a = function_5c8554b7d485da82(msg, var_d3967d9b1bf53375, var_5808a2476b7bce9b);
        }
        if (var_d3967d9b1bf53375 == 3 || var_d3967d9b1bf53375 == 0 && istrue(getdvarint(var_5808a2476b7bce9b.var_b0b33580058b7f27, 0))) {
            /#
                assertmsg(var_99d1ce3d45d3956a);
            #/
        } else if (!var_bf4eaca9064fa63f) {
            println(var_99d1ce3d45d3956a);
        }
    #/
}

// Namespace PLAYTEST_LOGGER/namespace_71483b158f1361f1
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c1
// Size: 0xa1
function private function_5c8554b7d485da82(msg, var_d3967d9b1bf53375, var_5808a2476b7bce9b) {
    if (var_d3967d9b1bf53375 == 3) {
        return (var_5808a2476b7bce9b.var_243ec5b0a130448e + "ASSERT: " + msg);
    } else if (var_d3967d9b1bf53375 == 1) {
        return (var_5808a2476b7bce9b.var_243ec5b0a130448e + "INFO: " + msg);
    } else if (var_d3967d9b1bf53375 == 0) {
        return (var_5808a2476b7bce9b.var_243ec5b0a130448e + "ERROR: " + msg);
    } else if (var_d3967d9b1bf53375 == 2) {
        return (var_5808a2476b7bce9b.var_243ec5b0a130448e + "WARNING: " + msg);
    }
    return var_5808a2476b7bce9b.var_243ec5b0a130448e + " [unknown log level]: ";
}

// Namespace PLAYTEST_LOGGER/namespace_71483b158f1361f1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x36a
// Size: 0xb6
function private function_d6a62191d9107d13(var_d3967d9b1bf53375, var_5808a2476b7bce9b) {
    if (!istrue(getdvarint(var_5808a2476b7bce9b.var_2ea903451e753a5f, 0))) {
        return 0;
    }
    if (istrue(getdvarint(var_5808a2476b7bce9b.var_7eea86c60c0788e, 0))) {
        return 1;
    } else if (var_d3967d9b1bf53375 == 3) {
        return istrue(getdvarint(var_5808a2476b7bce9b.var_1e9d08b8e40c246a));
    } else if (var_d3967d9b1bf53375 == 1) {
        return istrue(getdvarint(var_5808a2476b7bce9b.var_9dfaf49e38b7b10f, 0));
    } else if (var_d3967d9b1bf53375 == 0) {
        return istrue(getdvarint(var_5808a2476b7bce9b.var_e16ce54aa38571c0, 0));
    } else if (var_d3967d9b1bf53375 == 2) {
        return istrue(getdvarint(var_5808a2476b7bce9b.var_9113b547554386ba, 0));
    }
    return 0;
}
