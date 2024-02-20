// mwiii decomp prototype
#using scripts\unittest\util.gsc;
#using scripts\unittest\patch_far.gsc;

#namespace namespace_bdcbcfceab56aa1e;

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x519
// Size: 0xf
function add() {
    test_print("add");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52f
// Size: 0x3
function patch_self_check() {
    
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x539
// Size: 0xe
function meth_patch() {
    self.value = 1;
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54e
// Size: 0x3a
function meth() {
    s = spawnstruct();
    s meth_patch();
    test_print("meth: " + s.value);
    patch_self_check();
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58f
// Size: 0x4
function func_patch() {
    return 0;
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59b
// Size: 0x22
function func() {
    x = func_patch();
    test_print("func: " + x);
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c4
// Size: 0x3c
function vars_print(s) {
    test_print("s.active: " + s.active);
    test_print("s.notcanon: " + s.notcanon);
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x607
// Size: 0x2c
function vars_update(s) {
    test_print("vars_update");
    vars_print(s);
    test_print("vars_update: end");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x63a
// Size: 0x62
function vars() {
    s = spawnstruct();
    s.active = 1;
    s.notcanon = "hi";
    test_print("vars");
    vars_print(s);
    vars_update(s);
    vars_print(s);
    test_print("vars: end");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a3
// Size: 0xf
function func_thread() {
    test_print("func_thread");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6b9
// Size: 0x6d
function thread_wait_patch(var_819b28728ab38c03) {
    x = 0;
    test_print("thread_wait_patch:(" + x + "): " + var_819b28728ab38c03);
    if (var_819b28728ab38c03 == 0) {
        level waittill("thread_wait");
    } else if (var_819b28728ab38c03 > 0) {
        thread_wait_native(var_819b28728ab38c03 - 1);
    } else {
        thread thread_wait_native(var_819b28728ab38c03 + 1);
    }
    test_print("thread_wait_patch end: " + var_819b28728ab38c03);
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72d
// Size: 0x30
function thread_wait_native(var_819b28728ab38c03) {
    test_print("thread_wait_native: " + var_819b28728ab38c03);
    thread_wait_patch(var_819b28728ab38c03);
    test_print("thread_wait_native end: " + var_819b28728ab38c03);
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x764
// Size: 0x30
function thread_wait_local() {
    x = 0;
    test_print("thread_wait_local");
    thread_wait(1);
    test_print("thread_wait_local end");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x79b
// Size: 0x69
function thread_wait(var_ec256753c321f81e) {
    test_print("thread_wait");
    thread thread_wait_native(0);
    level notify("thread_wait");
    waittillframeend();
    thread thread_wait_native(1);
    level notify("thread_wait");
    waittillframeend();
    thread thread_wait_native(-1);
    level notify("thread_wait");
    waittillframeend();
    if (!istrue(var_ec256753c321f81e)) {
        thread_wait_local();
        waittillframeend();
    }
    test_print("thread_wait end");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80b
// Size: 0x10
function native_wait() {
    test_print("native_wait");
    waittillframeend();
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x822
// Size: 0x4
function patch_wait_frameend() {
    waittillframeend();
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x82d
// Size: 0x23
function patch_wait() {
    test_print("patch_wait: start");
    patch_wait_frameend();
    waittillframeend();
    test_print("patch_wait: end");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x857
// Size: 0x1e
function define() {
    test_print("define: int: " + 1 + " float: " + 2.2);
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x87c
// Size: 0xf
function f1() {
    test_print("fp1");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x892
// Size: 0x15
function f2(var_cdde4578f5299bdd) {
    [[ var_cdde4578f5299bdd ]]("fp2");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ae
// Size: 0x2f
function func_pointer() {
    fp1 = &f1;
    [[ fp1 ]]();
    fp2 = &test_print;
    f2(fp2);
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8e4
// Size: 0xa
function far() {
    namespace_e206c8e82d1e5029::patch_far();
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8f5
// Size: 0x3d
function e5(t, n) {
    test_print("e5 start: " + t);
    f = 6;
    test_print("e5 end: " + t);
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x939
// Size: 0x46
function e4(t, n) {
    test_print("e4 start: " + t);
    e = 5;
    e5(t, n);
    test_print("e4 end: " + t);
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x986
// Size: 0x46
function e3(t, n) {
    test_print("e3 start: " + t);
    d = 4;
    e4(t, n);
    test_print("e3 end: " + t);
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9d3
// Size: 0x46
function e2(t, n) {
    test_print("e2 start: " + t);
    c = 3;
    e3(t, n);
    test_print("e2 end: " + t);
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa20
// Size: 0x46
function e1(t, n) {
    test_print("e1 start: " + t);
    b = 2;
    e2(t, n);
    test_print("e1 end: " + t);
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa6d
// Size: 0x52
function endontest_endon(t, n) {
    test = "endontest_" + t;
    test_print(test + "_start: " + n);
    level endon(test);
    e1(t, n);
    test_print(test + "_end: " + n);
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xac6
// Size: 0x3
function endontest() {
    
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xad0
// Size: 0x2b
function anim_test() {
    foo = multiplayer%mp_stand_reload;
    bar = multiplayer%mp_crouch_reload;
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb02
// Size: 0xf
function stack_patch_waittill_leaf() {
    test_print("stack_patch_waittill_leaf");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb18
// Size: 0x16
function stack_patch_waittill_node() {
    test_print("stack_patch_waittill_node");
    stack_patch_waittill_leaf();
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb35
// Size: 0x16
function stack_patch_waittill_stack() {
    test_print("stack_patch_waittill_stack");
    stack_patch_waittill_leaf();
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb52
// Size: 0x1d
function stack_patch_waittill_root() {
    test_print("stack_patch_waittill_root");
    stack_patch_waittill_node();
    stack_patch_waittill_stack();
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb76
// Size: 0x1b
function stack_patch_waittill_context_patch() {
    test_print("stack_patch_waittill_context_patch");
    test_print("stack_patch_waittill_context_patch: end");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb98
// Size: 0x50
function stack_patch_waittill_context(s) {
    test_print("stack_patch_waittill_context: start: " + s.value);
    s.value++;
    stack_patch_waittill_context_patch();
    waittillframeend();
    test_print("stack_patch_waitill_context: end: " + s.value);
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbef
// Size: 0x1b
function stack_patch_waittill_context_far_patch() {
    test_print("stack_patch_waittill_context_far_patch");
    test_print("stack_patch_waittill_context_far_patch: end");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc11
// Size: 0x50
function stack_patch_waittill_context_far(s) {
    test_print("stack_patch_waittill_context_far: start: " + s.value);
    s.value++;
    stack_patch_waittill_context_far_patch();
    waittillframeend();
    test_print("stack_patch_waitill_context_far: end: " + s.value);
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc68
// Size: 0x23
function stack_patch_thread() {
    test_print("stack_patch_thread");
    level waittill("stack_patch");
    test_print("stack_patch_thread: end");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc92
// Size: 0x22
function stack_patch_thread_leaf() {
    test_print("stack_patch_thread_leaf");
    stack_patch_thread();
    test_print("stack_patch_thread_leaf: end");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcbb
// Size: 0x1b
function stack_patch_thread_node() {
    test_print("stack_patch_thread_node");
    test_print("stack_patch_thread_node: end");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcdd
// Size: 0x22
function stack_patch_thread_root() {
    test_print("stack_patch_thread_root");
    stack_patch_thread_node();
    test_print("stack_patch_thread_root: end");
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd06
// Size: 0x62
function stack_patch() {
    test_print("stack_patch");
    thread stack_patch_waittill_root();
    s = spawnstruct();
    s.value = 0;
    thread stack_patch_waittill_context(s);
    thread stack_patch_waittill_context_far(s);
    stack_patch_thread_root();
    test_print("stack_patch: notify");
    level notify("stack_patch");
    waittillframeend();
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd6f
// Size: 0x2c
function function_a65aa16b3c5889a5() {
    x = getdvarint(@"hash_f66df8c14aff0548", 1);
    test_print("builtin_patch: " + x);
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xda2
// Size: 0x3
function sre() {
    
}

// Namespace namespace_bdcbcfceab56aa1e/namespace_9568d5a950126997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdac
// Size: 0x96
function main() {
    test_begin("Patch");
    s = spawnstruct();
    func();
    s meth();
    add();
    vars();
    thread func_thread();
    thread_wait();
    patch_wait();
    define();
    func_pointer();
    far();
    endontest();
    anim_test();
    stack_patch();
    function_a65aa16b3c5889a5();
    sre();
    test_end("Patch");
}
