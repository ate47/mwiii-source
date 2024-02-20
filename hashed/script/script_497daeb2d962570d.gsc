// mwiii decomp prototype
#using script_2047cdbf5176ba0;
#using script_92b815b18f0ba61;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using script_a462ba1c690f492;
#using script_69a720c9d6e76eaf;
#using script_2a73cf62256b4021;
#using script_624397dc74b139e0;
#using script_62a4f7a62643fe8;
#using script_7cb35f89ed0ca240;
#using script_2816a042b9f7996;
#using script_1107d6250762b72b;
#using script_5d813d45c6b1b1be;
#using script_22f1701e151b9d12;
#using script_7cfaa6fd841fb4dd;

#namespace namespace_d770e9883578056e;

// Namespace namespace_d770e9883578056e/namespace_26f5b9f025c6ef83
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x30c
// Size: 0x11
function autoexec init() {
    level.var_d6d4a817542a6b12 = &main;
}

// Namespace namespace_d770e9883578056e/namespace_26f5b9f025c6ef83
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x324
// Size: 0x11a
function main() {
    function_eb7f544259415a09("mp_jup_bigmap_ob");
    function_3c4620aaf1b2a314();
    level thread namespace_e39de371869cd948::function_9a77b5ad8fe80b87();
    namespace_46bab6a1c7f2b759::main();
    namespace_168ecff99ee1ba99::main();
    namespace_3c37cb17ade254d::flag_set("gas_station_create_script_initialized");
    namespace_900b5c2f06237e4c::main();
    thread namespace_6776e8e74ed64842::init();
    if (getdvarint(@"hash_ce91a4697b7f675d", 0)) {
        thread function_34f9339be7842373();
        thread function_59857be1344085d3();
    } else {
        thread function_5e1d3784c9aa680f();
        level callback::add("register_activities", &function_98dce343b7f26b31);
        level callback::add("register_objectives", &function_ecac14e0ca8cf16);
        level callback::add("register_features", &function_78d897de4d1793f);
    }
    setdvar(@"hash_f1d095735ac37f33", 1);
    thread function_9e62f0bf427c88b2();
    namespace_eaf2d79326b082fa::main();
    var_21af86bdbe252abf = getstructarray("vehicle_group_e", "script_noteworthy");
    level thread namespace_f9b6a4254d2d8100::function_63c6d4fbc0bc4d94(var_21af86bdbe252abf);
    if (getdvar(@"hash_6e5464e5ee3bd77d", "0") == "1") {
        namespace_7505bd48eaef63fb::main();
        thread namespace_d0c78bdaf71b04f6::init();
    }
}

// Namespace namespace_d770e9883578056e/namespace_26f5b9f025c6ef83
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x445
// Size: 0xd0
function function_34f9339be7842373() {
    waitframe();
    function_9b8829ab4092a7d7("ob_soldier_ambient", 1);
    namespace_614554f86e52695c::function_e4a440552e4cf1f4(&function_7a74948bde86f65);
    function_4ff17efd15d01d3f(256);
    function_1611d0f6b5f84b9a(700);
    var_6019f08417208580 = [0:"c_sabotage_lowtown_park_1", 1:"c_sabotage_lowtown_park_1", 2:"c_sabotage_lowtown_park_1", 3:"c_sabotage_lowtown_park_1", 4:"c_sabotage_lowtown_park_1", 5:"e_cover_merc_camp_lowtown_market", 6:"e_cover_merc_camp_lowtown_riverfront", 7:"e_cover_merc_camp_lowtown_shanty"];
    foreach (str in var_6019f08417208580) {
        namespace_64135de19550f047::function_e9158c9e8c391f25(str);
    }
}

// Namespace namespace_d770e9883578056e/namespace_26f5b9f025c6ef83
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x51c
// Size: 0x47
function private function_7a74948bde86f65(agent, requestid, data) {
    if (!isdefined(data.script_stealthgroup)) {
        data.script_stealthgroup = "sgp_" + requestid;
    }
    agent thread function_26ee393ba852c090();
}

// Namespace namespace_d770e9883578056e/namespace_26f5b9f025c6ef83
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x56a
// Size: 0xce
function private function_26ee393ba852c090() {
    self endon("death");
    while (1) {
        while (!isdefined(self.enemy)) {
            wait(0.1);
        }
        if (getdvarint(@"hash_479f55fba6e8526b", 0)) {
            while (isdefined(self.enemy)) {
                mintime = getdvarfloat(@"hash_83cb4d26f93ea87e", 9);
                maxtime = getdvarfloat(@"hash_8e181885f3741094", 15);
                movetime = randomfloatrange(mintime, maxtime);
                wait(movetime);
                newspot = getrandomnavpoint(self.origin, 500);
                if (isdefined(newspot)) {
                    self setgoalpos(newspot, 64);
                    self waittill("goal");
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_d770e9883578056e/namespace_26f5b9f025c6ef83
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63f
// Size: 0x82
function function_59857be1344085d3() {
    waitframe();
    namespace_614554f86e52695c::function_daa39d0822248e1c();
    var_be8ebaf932e93656 = namespace_614554f86e52695c::function_930897c0d1a7eb24("demo_gas_encounter");
    function_fc38783a3da0bc71(var_be8ebaf932e93656, 1);
    waitframe();
    function_606642b946a01237("demo1", (17896.5, -9628.5, 2067.5), 800, 1);
    function_606642b946a01237("demo2", (17722.5, -11636.5, 2067.5), 1200, 1);
    function_606642b946a01237("demo3", (16652.5, -9595.5, 2067.5), 500, 1);
}

// Namespace namespace_d770e9883578056e/namespace_26f5b9f025c6ef83
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c8
// Size: 0x11
function function_9e62f0bf427c88b2() {
    function_678622c552cadad4();
    namespace_614554f86e52695c::function_b1fa4578ef08136f();
}

// Namespace namespace_d770e9883578056e/namespace_26f5b9f025c6ef83
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e0
// Size: 0xf
function function_678622c552cadad4() {
    flag_wait("mp_jup_st_e_ob_objective_mercdefend_cs_completed");
}

// Namespace namespace_d770e9883578056e/namespace_26f5b9f025c6ef83
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f6
// Size: 0x1b7
function function_5e1d3784c9aa680f() {
    waitframe();
    if (getdvarint(@"hash_375c55d964a04d46", 0)) {
        function_9b8829ab4092a7d7("ob_test_abomination", 1);
    }
    function_9b8829ab4092a7d7("ob_zombie_ambient", 1);
    var_f6e341b64f830a1 = namespace_3c37cb17ade254d::getstructarray("s_ob_overpass_supress", "targetname");
    foreach (pos in var_f6e341b64f830a1) {
        function_606642b946a01237("overpass_supress", pos.origin, pos.radius, 1);
    }
    var_102014ab68ac4b78 = namespace_3c37cb17ade254d::getstructarray("s_ob_infil_supress", "targetname");
    foreach (pos in var_102014ab68ac4b78) {
        function_606642b946a01237("infil_supress", pos.origin, pos.radius, 1);
    }
    var_102015ab68ac4dab = namespace_3c37cb17ade254d::getstructarray("s_ambient_blocker", "targetname");
    foreach (pos in var_102015ab68ac4dab) {
        if (isdefined(pos.radius)) {
            function_606642b946a01237("ambient_blocker", pos.origin, pos.radius, 1);
        }
    }
}
