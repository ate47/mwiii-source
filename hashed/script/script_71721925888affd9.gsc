#using script_63258e3c8c400b7a;

#namespace zmbosshealthbar;

// Namespace zmbosshealthbar / namespace_16b628e68243c807
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa3
// Size: 0x16
function register() {
    return function_f245f059d32d19d1("ZMBossHealthBar", #"zmbosshealthbar");
}

// Namespace zmbosshealthbar / namespace_16b628e68243c807
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc2
// Size: 0x1c
function open(player, flags) {
    function_12e2ab1f2879518a(player, flags);
}

// Namespace zmbosshealthbar / namespace_16b628e68243c807
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe6
// Size: 0x13
function close(player) {
    function_e98e8bd148625cd0(player);
}

// Namespace zmbosshealthbar / namespace_16b628e68243c807
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x101
// Size: 0x12
function is_open(player) {
    return function_23de77f715d51c8b(player);
}

// Namespace zmbosshealthbar / namespace_16b628e68243c807
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11c
// Size: 0x1e
function function_4032c55b1a2de180(player, value) {
    function_2c7278ea5ca893e5(player, 1, value);
}

// Namespace zmbosshealthbar / namespace_16b628e68243c807
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x142
// Size: 0x1e
function function_fa61dfb76d14641f(player, value) {
    function_2c7278ea5ca893e5(player, 2, value);
}

// Namespace zmbosshealthbar / namespace_16b628e68243c807
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x168
// Size: 0x1e
function function_c4b608fac8636725(player, value) {
    function_2c7278ea5ca893e5(player, 3, value);
}

// Namespace zmbosshealthbar / namespace_16b628e68243c807
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18e
// Size: 0x1e
function function_7996b90ec9893e23(player, value) {
    function_2c7278ea5ca893e5(player, 4, value);
}

// Namespace zmbosshealthbar / namespace_16b628e68243c807
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b4
// Size: 0x1e
function function_205b1b924ed09c63(player, value) {
    function_2c7278ea5ca893e5(player, 5, value);
}
