// mwiii decomp prototype
#using scripts\unittest\util.gsc;

#namespace unittest_loop;

// Namespace unittest_loop / scripts/unittest/loop
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x160
// Size: 0xa6
function for_simple() {
    test_print("for simple");
    for (i = 0; i < 10; i++) {
        test_print("for: " + i);
    }
    x = 0;
    test_print("for 2 cond");
    for (i = 0; i < 10 && x < 20; i++) {
        x = x + i;
        test_print("for: " + i);
    }
    test_print("for empty");
    for (i = 0; ; i++) {
        test_print("for: " + i);
        if (i >= 9) {
            break;
        }
    }
}

// Namespace unittest_loop / scripts/unittest/loop
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20d
// Size: 0xbe
function foreach_shared_variables(x) {
    test_print("foreach_shared_variables");
    if (isdefined(x)) {
        foreach (a in x) {
            test_print(" " + a);
        }
    } else {
        return;
    }
    foreach (a in x) {
        test_print(" " + a);
    }
}

// Namespace unittest_loop / scripts/unittest/loop
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d2
// Size: 0x94
function foreach_mutable_key() {
    test_print("foreach_mutable_key");
    a = [1, 2, 3, 4];
    foreach (x, y in a) {
        test_print(" " + x + "," + y);
        x = x + 1;
    }
}

// Namespace unittest_loop / scripts/unittest/loop
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36d
// Size: 0xf3
function foreach_simple() {
    test_print("foreach_simple");
    a = [1, 2, 3, 4];
    foreach (x in a) {
        test_print(" " + x);
    }
    test_print("foreach_simple(x,y)");
    foreach (x, y in a) {
        test_print(" " + x + "," + y);
    }
    foreach_shared_variables(a);
    foreach_mutable_key();
}

// Namespace unittest_loop / scripts/unittest/loop
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x467
// Size: 0xab
function while_simple() {
    test_print("while simple");
    for (i = 0; i < 10; i++) {
        test_print("while: " + i);
    }
    test_print("while 2 cond");
    x = 0;
    for (i = 0; i < 10 && x < 20; i++) {
        x = x + i;
        test_print("while: " + i);
    }
    test_print("while true");
    for (i = 0; true; i++) {
        test_print("while: " + i);
        if (i >= 9) {
            break;
        }
    }
}

// Namespace unittest_loop / scripts/unittest/loop
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x519
// Size: 0x97
function loop_control() {
    test_print("for control");
    for (i = 0; i < 1; i++) {
        if (i % 1) {
            sum = 1;
        } else {
            sum = 0;
        }
        test_print("for var exposed: sum: " + sum);
    }
    for (;;) {
        q = 1;
        break;
    }
    test_print("for break: q: " + q);
    while (true) {
        z = 2;
        break;
    }
    test_print("while break: z: " + z);
}

// Namespace unittest_loop / scripts/unittest/loop
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b7
// Size: 0x37
function main() {
    test_begin("Loops");
    for_simple();
    foreach_simple();
    while_simple();
    loop_control();
    test_end("Loops");
}

