// mwiii decomp prototype
#using script_89c4e8e66e8a360;
#using script_2f981f68661d5e1a;
#using script_5dfa1fb6b030bdcb;
#using script_32d93a194074fa6a;
#using script_47a7dd805c87b33f;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\utility.gsc;

#namespace namespace_fbc22dc6f2271b4;

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dd
// Size: 0x1f
function function_77b897f7716b8ff8(var_c85ba41ed96f4c4) {
    function_a9984444514ff39a();
    wait(2);
    thread function_a587d9fffed95ccf(var_c85ba41ed96f4c4);
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x203
// Size: 0xc7
function function_a9984444514ff39a() {
    flag_init("ftue_player_walked");
    flag_init("ftue_player_sprinted");
    flag_init("ftue_player_tactial_sprinted");
    flag_init("ftue_player_auto_sprinted");
    flag_init("ftue_player_moved_camera");
    flag_init("ftue_player_moved_camera_and_walked");
    flag_init("ftue_player_gas_minimap");
    thread function_33749fefab503510(getdvarint(@"hash_ee469d27e4289247", 2));
    thread function_348924356f8bad24();
    thread function_d4a746782d28e9ad();
    thread function_4cf7b50740f57f7b();
    thread function_105bd25b72f6ea55(getdvarint(@"hash_662138da96c93838", 90));
    thread function_4f94f7b207e54b3f(getdvarint(@"hash_23cd75bde42da8fa", 2), getdvarint(@"hash_687f1b162dc45a02", 90));
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d1
// Size: 0x18e
function function_a587d9fffed95ccf(var_c85ba41ed96f4c4) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("ftue_completed");
    function_88c0dc3a363b9d3(getdvarint(@"hash_d97115f3374e6f10", 2), &function_a68431a04c04726a, &function_f586b8896b2759b3);
    flag_wait("ftue_player_walked");
    function_7fd621b8ba80e652();
    function_916ba40ea734f75a(getdvarint(@"hash_6ecd83ec95c61773", 2), &function_6b645084fae7a31d, &function_8043b1f8506098);
    flag_wait("ftue_player_sprinted");
    function_7fd621b8ba80e652();
    function_9b8b2a6fd4a868b(getdvarint(@"hash_c211b7f4a4014a19", 2), &function_87f2199e3e30690a, &function_bf9901ce62634b7b);
    flag_wait("ftue_player_tactial_sprinted");
    function_7fd621b8ba80e652();
    function_1fbdad041cade585(getdvarint(@"hash_ac9065e141511f57", 2), &function_9190de7599424864, &function_f4173cc2bd202aa5);
    flag_wait("ftue_player_auto_sprinted");
    function_7fd621b8ba80e652();
    function_44f78ee91dcbe658(getdvarint(@"hash_25b38d4a50722d1a", 2), &function_d8acf8fde84000d7, &function_e8a74242053642aa);
    flag_wait("ftue_player_moved_camera");
    function_7fd621b8ba80e652();
    function_d5254a5df1ead52d(getdvarint(@"hash_ee37365ae1bbdbb6", 2), &function_ddf68434578cbc75, &function_82852a9b4b43a5a8);
    flag_wait("ftue_player_moved_camera_and_walked");
    function_7fd621b8ba80e652();
    function_fa5e2cb288f43afb(var_c85ba41ed96f4c4);
    flag_wait("ftue_player_fired");
    function_7fd621b8ba80e652();
    function_9e0151baa208fe9e(#"hash_832d3da8b0e1bea7", 5);
    self notify("ftue_completed");
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x466
// Size: 0x27
function function_88c0dc3a363b9d3(var_2ca8d0a52885d908, var_6e8b41e0a5648f49, var_eecb169540a9f109) {
    thread function_7c4b6588a387e2d5(var_2ca8d0a52885d908, var_6e8b41e0a5648f49, var_eecb169540a9f109);
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x494
// Size: 0x18
function function_a68431a04c04726a(player) {
    flag_set("ftue_player_walked");
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b3
// Size: 0x1f
function function_f586b8896b2759b3(player) {
    player function_9e0151baa208fe9e(#"walkTip", 5);
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4d9
// Size: 0x27
function function_916ba40ea734f75a(var_2ca8d0a52885d908, var_6e8b41e0a5648f49, var_eecb169540a9f109) {
    thread function_ee0f48a23c219539(var_2ca8d0a52885d908, var_6e8b41e0a5648f49, var_eecb169540a9f109);
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x507
// Size: 0x18
function function_6b645084fae7a31d(player) {
    flag_set("ftue_player_sprinted");
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x526
// Size: 0x1f
function function_8043b1f8506098(player) {
    player function_9e0151baa208fe9e(#"hash_8f1fbb7838ddae5a", 5);
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x54c
// Size: 0x27
function function_9b8b2a6fd4a868b(var_2ca8d0a52885d908, var_6e8b41e0a5648f49, var_eecb169540a9f109) {
    thread function_4dfbc95b23a556f4(var_2ca8d0a52885d908, var_6e8b41e0a5648f49, var_eecb169540a9f109);
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x57a
// Size: 0x1f
function function_bf9901ce62634b7b(player) {
    player function_9e0151baa208fe9e(#"hash_e3b4235c0ca36fd5", 5);
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a0
// Size: 0x18
function function_87f2199e3e30690a(player) {
    flag_set("ftue_player_tactial_sprinted");
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5bf
// Size: 0x27
function function_1fbdad041cade585(var_2ca8d0a52885d908, var_6e8b41e0a5648f49, var_eecb169540a9f109) {
    thread function_768aaa759077df62(var_2ca8d0a52885d908, var_6e8b41e0a5648f49, var_eecb169540a9f109);
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ed
// Size: 0x1f
function function_f4173cc2bd202aa5(player) {
    player function_9e0151baa208fe9e(#"hash_b225d2992d771e07", 5);
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x613
// Size: 0x18
function function_9190de7599424864(player) {
    flag_set("ftue_player_auto_sprinted");
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x632
// Size: 0x27
function function_44f78ee91dcbe658(var_2ca8d0a52885d908, var_6e8b41e0a5648f49, var_eecb169540a9f109) {
    thread function_e58bb74ec5f54731(var_2ca8d0a52885d908, var_6e8b41e0a5648f49, var_eecb169540a9f109);
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x660
// Size: 0x1f
function function_e8a74242053642aa(player) {
    player function_9e0151baa208fe9e(#"hash_3d6c462c919908fc", 5);
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x686
// Size: 0x18
function function_d8acf8fde84000d7(player) {
    flag_set("ftue_player_moved_camera");
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6a5
// Size: 0x27
function function_d5254a5df1ead52d(var_2ca8d0a52885d908, var_6e8b41e0a5648f49, var_eecb169540a9f109) {
    thread function_e7a33bfb4cba7633(var_2ca8d0a52885d908, var_6e8b41e0a5648f49, var_eecb169540a9f109);
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d3
// Size: 0x1f
function function_82852a9b4b43a5a8(player) {
    player function_9e0151baa208fe9e(#"hash_9d2c341d798189a", 5);
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f9
// Size: 0x18
function function_ddf68434578cbc75(player) {
    flag_set("ftue_player_moved_camera_and_walked");
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x718
// Size: 0x86
function function_fa5e2cb288f43afb(var_c85ba41ed96f4c4) {
    function_9e0151baa208fe9e(#"hash_fb30dff35889cbbf", 5);
    self.targetcount = var_c85ba41ed96f4c4.size;
    foreach (target in var_c85ba41ed96f4c4) {
        target function_6b3a1552a79f4cff(self, 0, &function_b8d2cfca22b74498);
        target setcandamage(1);
    }
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7a5
// Size: 0x51
function function_6b3a1552a79f4cff(player, var_a519a2a30c26b6da, damagecallback) {
    objectivelabel = "FTUE_MOBILE/SHOOT_TEST";
    if (var_a519a2a30c26b6da) {
        objectivelabel = "FTUE_MOBILE/SHOOT_ADS_TEST";
    }
    function_70e0de6281199e7(self, objectivelabel, "icon_waypoint_objective_general", 5);
    function_1efd3ef097bc71ef(player, var_a519a2a30c26b6da, damagecallback);
}

// Namespace namespace_fbc22dc6f2271b4/namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7fd
// Size: 0x70
function function_b8d2cfca22b74498(player) {
    if (!isdefined(player.var_289b15bd825735d0)) {
        player.var_289b15bd825735d0 = 0;
    }
    function_b30874d13004d4c5(self);
    player.var_289b15bd825735d0 = player.var_289b15bd825735d0 + 1;
    if (player.var_289b15bd825735d0 == player.targetcount) {
        flag_set("ftue_player_fired");
    }
}

