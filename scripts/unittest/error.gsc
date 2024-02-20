// mwiii decomp prototype
#using scripts\unittest\util.gsc;

#namespace namespace_9a8cc0e0b9d06106;

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x610
// Size: 0x38
function error_print(msg, var) {
    if (isdefined(var)) {
        test_print(msg + ": defined");
    } else {
        test_print(msg + ": not defined");
    }
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x64f
// Size: 0x1c
function func(a, b, c) {
    
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x672
// Size: 0x11
function cond_func() {
    test_print("cond func");
    return 1;
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68b
// Size: 0xc6
function params() {
    s = spawnstruct();
    test_print("func param");
    func(1, "x", s);
    test_print("meth param");
    s func(1, "x", s);
    test_print("func thread param");
    thread func(1, "x", s);
    test_print("meth thread param");
    s thread func(1, "x", s);
    f = &func;
    test_print("func pointer param");
    thread [[ f ]](1, "x", s);
    test_print("meth pointer param");
    s thread [[ f ]](1, "x", s);
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x758
// Size: 0x3bf
function types() {
    x = 1;
    s = spawnstruct();
    a = [0:1, 1:2, 2:3, 3:4, 4:5, 5:6];
    v = (1, 2, 3);
    p = level.players[0];
    str = "foo";
    y = x + s;
    error_print("+", y);
    y = x < str;
    error_print("lt", y);
    y = x >= str;
    error_print("ge", y);
    y = 1;
    y++;
    error_print("inc float", y);
    s++;
    error_print("inc struct", s);
    y = s && cond_func();
    error_print("and struct", y);
    y = s || cond_func();
    error_print("or struct", y);
    y = x < str || cond_func();
    error_print("or expr", y);
    test_print("array field");
    x = a.foo;
    test_print("array field ref");
    a.foo = 0;
    test_print("vector field");
    x = v.foo;
    test_print("vector field ref");
    v.foo = 0;
    s.a[0] = 1;
    y = s.a[1];
    error_print("unknown array int", y);
    y = s.a["hi"];
    error_print("unknown array string", y);
    test_print("vec ref");
    v[0] = 0;
    test_print("str ref");
    str[0] = "x";
    s[0] = 0;
    test_print("array ref bad int index");
    a[16777216] = 0;
    test_print("array ref bad struct index");
    a[s] = 0;
    test_print("ent field array ref");
    p.team[0] = 0;
    test_print("ent array ref");
    p[0] = 0;
    y = v[3];
    error_print("vec bad int index", y);
    y = v["hi"];
    error_print("vec str index", y);
    y = str[3];
    error_print("str bad int index", y);
    y = str["hi"];
    error_print("str str index", y);
    y = a[16777216];
    error_print("array bad int index", y);
    y = a[s];
    error_print("array struct index", y);
    y = p[0];
    error_print("ent array index", y);
    test_print("str clear");
    s[0] = undefined;
    test_print("array clear bad int index");
    a[16777216] = undefined;
    test_print("array clear struct index");
    a[s] = undefined;
    test_print("array clear player");
    p[0] = undefined;
    test_print("array clear vector");
    v[0] = undefined;
    y = v.size;
    error_print("vector size", y);
    y = s.size;
    error_print("struct size", y);
    y = p.size;
    error_print("player size", y);
    y = x.size;
    error_print("int size", y);
    test_print("bad vector");
    var_b2d20569a97aff8e = (0, str, 1);
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb1e
// Size: 0x56
function wait_notify() {
    s = spawnstruct();
    x = 1;
    wait(-1);
    wait(-1);
    wait(16777216);
    wait(s);
    level waittill(1);
    x waittill("foo");
    level endon(1);
    x endon("foo");
    level notify(1);
    x notify("foo");
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb7b
// Size: 0x84
function switch_func(msg, var) {
    test_print(msg);
    switch (var) {
    case 0:
        test_print("0");
        break;
    case #"":
        test_print("empty");
        break;
    default:
        test_print("default");
        break;
    }
    test_print(msg + " end");
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc06
// Size: 0x55
function switch_test() {
    switch_func("switch float", 1);
    switch_func("switch bad int", 16777216);
    switch_func("switch struct", spawnstruct());
    switch_func("switch vec", [0:1, 1:2, 2:3]);
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc62
// Size: 0x2fb
function cond() {
    s = spawnstruct();
    if (s) {
        test_print("struct if");
    } else {
        test_print("struct else");
    }
    if (!s) {
        test_print("struct not if");
    } else {
        test_print("struct not else");
    }
    x = 1;
    y = "hi";
    if (x < y) {
        test_print("lt if");
    } else {
        test_print("lt else");
    }
    if (s && cond_func()) {
        test_print("and if");
    } else {
        test_print("and else");
    }
    if (s || cond_func()) {
        test_print("or if");
    } else {
        test_print("or else");
    }
    if (!(s < 1) && cond_func()) {
        test_print("!bool and if");
    } else {
        test_print("!bool and else");
    }
    if (!(s < 1) || cond_func()) {
        test_print("!bool or if");
    } else {
        test_print("!bool or else");
    }
    if (!s && cond_func()) {
        test_print("!struct and if");
    } else {
        test_print("!struct and else");
    }
    if (!s || cond_func()) {
        test_print("!struct or if");
    } else {
        test_print("!struct or else");
    }
    if (!(s && cond_func())) {
        test_print("!(and) if");
    } else {
        test_print("!(and) else");
    }
    if (!(s || cond_func())) {
        test_print("!(or) if");
    } else {
        test_print("!(or) else");
    }
    c = 0;
    while (x < y) {
        test_print("lt while: " + c);
        c++;
        if (c > 2) {
            break;
        }
    }
    c = 0;
    while (!(x < y)) {
        test_print("!lt while: " + c);
        c++;
        if (c > 2) {
            break;
        }
    }
    c = 0;
    while (c < 2 && x < y) {
        test_print("lt for: " + c);
        c++;
        if (c > 2) {
            break;
        }
        s++;
    }
    c = 0;
    while (c < 2 && !(x < y)) {
        test_print("!lt for: " + c);
        c++;
        if (c > 2) {
            break;
        }
        s++;
    }
    b = s ? 1 : 0;
    if (b) {
        test_print("struct ternary if");
    } else {
        test_print("struct ternary else");
    }
    if (!s) {
        goto LOC_000002d8;
    }
    b = 0;
    if (b) {
        test_print("struct ternary not if");
    } else {
        test_print("struct ternary not else");
    }
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf64
// Size: 0x58
function is_true_print(val, name) {
    b = istrue(val);
    if (!isdefined(b)) {
        b = "undefined";
    }
    d = isdefined(val);
    test_print("is_true: " + name + ": " + b + " isdefined: " + d);
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfc3
// Size: 0x39
function is_true() {
    a = [];
    is_true_print(a, "array");
    s = spawnstruct();
    is_true_print(s, "struct");
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1003
// Size: 0xbc
function builtin() {
    key = function_5162a2aaad39b2c7(undefined, -1);
    test_print("builtin");
    p = &function_5162a2aaad39b2c7;
    key = builtin [[ p ]](undefined, -1);
    test_print("builtin pointer");
    p = undefined;
    builtin [[ p ]](1, 2, 3);
    test_print("builtin pointer invalid");
    m = undefined;
    m moveto(1, 2, 3);
    test_print("builtin method");
    p = &moveto;
    m builtin [[ p ]](1, 2, 3);
    test_print("builtin method pointer");
    p = undefined;
    m builtin [[ p ]](1, 2, 3);
    test_print("builtin method pointer invalid");
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c6
// Size: 0xb
function n3() {
    return 1 + spawnstruct();
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10d9
// Size: 0xa
function n2() {
    n3();
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10ea
// Size: 0x27
function function_ce510078f5a82cf4(index) {
    if (index <= 0) {
        n2();
    } else {
        function_ce510078f5a82cf4(index - 1);
    }
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1118
// Size: 0x18
function nested() {
    function_ce510078f5a82cf4(3);
    test_print("nested");
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1137
// Size: 0x61
function function_b5410a15d3ff2e84(count) {
    level endon("vm_execute_error_context");
    var_1f34c3efad7a70f5 = count - 1;
    test_print("vm_execute_error_context: " + count);
    if (count <= 0) {
        x = var_1f34c3efad7a70f5 + spawnstruct();
        test_print("vm_execute_error_context: done");
        return;
    }
    function_79d19ed5ae591fb5(&vm_execute_error_context, var_1f34c3efad7a70f5);
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x119f
// Size: 0x14
function function_b5410d15d3ff351d(count) {
    function_b5410a15d3ff2e84(count);
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11ba
// Size: 0x14
function vm_execute_error_context(count) {
    function_b5410d15d3ff351d(count);
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11d5
// Size: 0x5a
function function_c1262a8e708035d7(count) {
    var_1f34c3efad7a70f5 = count - 1;
    test_print("vm_execute_error_stack: " + count);
    if (count <= 0) {
        x = var_1f34c3efad7a70f5 + spawnstruct();
        test_print("vm_execute_error_stack: done");
        return;
    }
    function_79d19ed5ae591fb5(&function_84bd830f4916d5a, var_1f34c3efad7a70f5);
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1236
// Size: 0x14
function function_c1262b8e7080380a(count) {
    function_c1262a8e708035d7(count);
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1251
// Size: 0x14
function function_84bd830f4916d5a(count) {
    function_c1262b8e7080380a(count);
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x126c
// Size: 0x15
function function_6f617c533b22e78b() {
    vm_execute_error_context(3);
    function_84bd830f4916d5a(3);
}

// Namespace namespace_9a8cc0e0b9d06106/namespace_54810301a27614b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1288
// Size: 0x5a
function main() {
    test_begin("Error");
    params();
    types();
    wait_notify();
    switch_test();
    cond();
    is_true();
    builtin();
    nested();
    function_6f617c533b22e78b();
    test_end("Error");
}
