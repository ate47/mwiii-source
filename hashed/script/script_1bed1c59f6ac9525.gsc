// mwiii decomp prototype
#using script_2047cdbf5176ba0;
#using script_92b815b18f0ba61;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using script_5cc103e78831ad9f;
#using script_79de05378402bed1;
#using script_2b15a0bac31ce30;
#using script_62a4f7a62643fe8;
#using script_369ec26a4522e639;
#using script_7ff1c5399d2d9500;
#using script_7b1a097c3912e1bb;
#using script_5d813d45c6b1b1be;
#using script_22f1701e151b9d12;

#namespace namespace_6690c1df72f98f32;

// Namespace namespace_6690c1df72f98f32/namespace_722ce752470892b
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1d7
// Size: 0x11
function autoexec init() {
    level.var_8bc670aa106fa796 = &main;
}

// Namespace namespace_6690c1df72f98f32/namespace_722ce752470892b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef
// Size: 0xdb
function main() {
    function_eb7f544259415a09("mp_jup_bigmap_ob");
    level thread function_7efd8a5b87c6c04b();
    namespace_ebb067ffc73349::main();
    namespace_f2713faa50431351::main();
    namespace_3c37cb17ade254d::flag_set("gas_station_create_script_initialized");
    level callback::add("register_activities", &function_98dcdf43b7f26265);
    level callback::add("register_objectives", &function_ecacd4e0ca8e97a);
    level callback::add("register_features", &function_78d8d7de4d1820b);
    function_3c4614aaf1b288b0();
    namespace_9e7d5c0658c6dddc::main();
    thread namespace_6776e8e74ed64842::init();
    if (getdvar(@"hash_6ffd9adb060c50c9", "0") == "1") {
        namespace_5b92d94106f62eb3::main();
        thread namespace_d7e80b14e1130dc4::init();
    }
    if (getdvar(@"hash_6e5464e5ee3bd77d", "0") == "1") {
        namespace_3524338e05fdd14b::main();
        thread namespace_d0c78bdaf71b04f6::init();
    }
    thread function_91dcb17ad9e37fde();
}

// Namespace namespace_6690c1df72f98f32/namespace_722ce752470892b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d1
// Size: 0x12f
function function_7efd8a5b87c6c04b() {
    setdvar(@"hash_f1d095735ac37f33", 1);
    waitframe();
    function_9b8829ab4092a7d7("ob_zombie_ambient", 1);
    var_f6e341b64f830a1 = namespace_3c37cb17ade254d::getstructarray("s_ob_infil_supress", "targetname");
    foreach (pos in var_f6e341b64f830a1) {
        function_606642b946a01237("infil_supress", pos.origin, pos.radius, 1);
    }
    var_102014ab68ac4b78 = namespace_3c37cb17ade254d::getstructarray("s_ambient_blocker", "targetname");
    foreach (pos in var_102014ab68ac4b78) {
        if (isdefined(pos.radius)) {
            function_606642b946a01237("ambient_blocker", pos.origin, pos.radius, 1);
        }
    }
}

// Namespace namespace_6690c1df72f98f32/namespace_722ce752470892b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x407
// Size: 0x11
function function_91dcb17ad9e37fde() {
    function_699dd374c113c360();
    namespace_614554f86e52695c::function_b1fa4578ef08136f();
}

// Namespace namespace_6690c1df72f98f32/namespace_722ce752470892b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41f
// Size: 0xf
function function_699dd374c113c360() {
    flag_wait("mp_jup_st_i_ob_contracts_merc_defend_cs_completed");
}
