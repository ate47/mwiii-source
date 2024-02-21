// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\system.gsc;
#using script_4a6760982b403bad;
#using scripts\asm\asm.gsc;
#using script_2ed63158b46a6d6f;
#using scripts\common\vehicle.gsc;

#namespace val;

// Namespace val/namespace_1cd9f6896754adb0
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xa11
// Size: 0x1a
function private autoexec __init__system__() {
    system::register(#"val", undefined, &function_ca54f37762600466, undefined);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa32
// Size: 0xeaa
function function_ca54f37762600466() {
    if (isdefined(level.var_750a82cea28f2f13)) {
        return;
    }
    level.var_750a82cea28f2f13 = 1;
    register("breath_system", 1, 0, "$self", &function_ff6d5864f8680d5e, "$value");
    register("damage", 1, 0, "$self", &function_a49123f94edb0267, "$value");
    register("death", 1, 0, "$self", &function_613f82ecdf9b56b8, "$value");
    register("damageshield", 0, 1, "$self", &function_8aba0b6af3dcb0ef, "$value");
    register("ignoresuppression", 0, 1, "$self", &function_9e8589036c3fd37e, "$value");
    register("whizby", 1, 0);
    register("ignoreme", 0, 1, "$self", &function_2553e8f1e80d32a9, "$value");
    register("ignoreall", 0, 1, "$self", &function_d3eeff01d5db508a, "$value");
    register("take_weapons", 0, 1, "$self", &set_takeweapons, "$value");
    register("weapon", 1, 0, "$self", &function_945a9012be94d89b, "$value");
    register("weapon_switch", 1, 0, "$self", &function_271781b97a830b8f, "$value");
    register("weapon_switch_clip", 1, 0, "$self", &function_cbbbe022b06a2d09, "$value");
    register("script_weapon_switch", 0, 1);
    register("reload", 1, 0, "$self", &function_6a7974bc3033866f, "$value");
    register("weapon_pickup", 1, 0, "$self", &function_ac139cd4bd7d232e, "$value");
    register("fire", 1, 0, "$self", &function_cda8ef3bebb4e3ee, "$value");
    register("autoreload", 1, 0, "$self", &function_1155b13235411eec, "$value");
    register("weapon_first_raise_anims", 1, 0, "$self", &function_782c9cfc7f78e416, "$value");
    register("offhand_weapons", 1, 0, "$self", &function_8fdf6df702996fa7, "$value");
    if (!isdefined(level.ismp) || level.ismp == 0) {
        link("offhand_weapons", "offhand_shield_weapons");
    }
    register("offhand_primary_weapons", 1, 0, "$self", &function_47279b5d7e2bcef3, "$value");
    register("offhand_secondary_weapons", 1, 0, "$self", &function_c8f662a90251117, "$value");
    link("offhand_secondary_weapons", "offhand_shield_weapons");
    register("offhand_shield_weapons", 1, 0, "$self", &function_f61d010ff82a69da, "$value");
    register("offhand_throwback", 1, 0, "$self", &function_54a3481116d62f02, "$value");
    register("allow_offhand_special", 1, 0, "$self", &function_8493479decad7dea, "$value");
    register("allow_aim_assist", 1, 0, "$self", &function_4e24d3eb9687a667, "$value");
    register("usability", 1, 0, "$self", &function_586996315a6703b0, "$value");
    register("freezecontrols", 0, 1, "$self", &function_15cc9bfda3c4adee, "$value");
    register("freezecontrols_allowlook", 0, 1, "$self", &function_9a6ef6fcc3e3c652, "$value");
    register("hide", 0, 1, "$self", &set_hide, "$value");
    register("health_regen", 1, 0, "$self", &set_health_regen, "$value");
    register("allow_health_regen_delay", 1, 0, "$self", &function_1140c973aa64c8d6, "$value");
    register("ignore_health_regen_delay", 0, 1, "$self", &set_ignore_health_regen_delay, "$value");
    register("stealth_social_reveal", 0, 1, "$self", &function_d4513b1bc21601, "$value");
    register("show_hud", 1, 0, "$self", &function_688748c7477e93dc, "$value");
    register("show_weapon_hud", 1, 0, "$self", &function_8b2fc23241e6448b, "$value");
    register("show_dpad_hud", 1, 0, "$self", &function_147fe8bda5949cf2, "$value");
    register("allow_jump", 1, 0, "$self", &function_c10182e05a99f789, "$value");
    register("allow_double_jump", 1, 0, "$self", &function_5d8c973a5b6b05d8, "$value");
    register("crouch", 1, 0, "$self", &function_4dd00f1be6c69677, "$value");
    register("prone", 1, 0, "$self", &function_d4a512c33a86e3d1, "$value");
    register("stance_change", 1, 0, "$self", &function_c8e47b79550e4319, "$value");
    register("melee", 1, 0, "$self", &function_ebf228fbb0a74d57, "$value");
    register("lean", 1, 0, "$self", &function_1e949110ce628e51, "$value");
    register("allow_melee_victim", 1, 0, "$self", &allow_melee_victim, "$value");
    register("mantle", 1, 0, "$self", &function_b3870b9ec763d70a, "$value");
    register("mount_top", 1, 0, "$self", &function_9b5befbb13ad7651, "$value");
    register("mount_side", 1, 0, "$self", &function_aac726af48296365, "$value");
    register("sprint", 1, 0, "$self", &function_f7c69559dbf71a1, "$value");
    register("jog", 1, 0, "$self", &function_2a827539b0ee61b7, "$value");
    register("ads", 1, 0, "$self", &function_888bc6393955267d, "$value");
    register("stand", 1, 0, "$self", &function_503f80a21c85a0ff, "$value");
    register("allow_movement", 1, 0, "$self", &function_1b400b9f81972824, "$value");
    register("ladder", 1, 0, "$self", &function_f3b4bc17c87adba5, "$value");
    register("swimming_underwater", 1, 0, "$self", &function_880120db350a6425, "$value");
    register("dtp", 1, 0, "$self", &function_d13b7a396eab0463, "$value");
    register("move_speed_scale", 1, 1, "$self", &function_46eda303c0fa6322, "$value");
    register("desired_speed", 0, 0, "$self", &function_ea87ab85d222844d, "$value");
    register("goalradius", 2048, 2048, "$self", &function_a93b95cf50f8c3c9, "$value");
    register("push_player", 0, 1, "$self", &function_5241aabb76d1bc21, "$value");
    register("skip_death", 0, 1, "$self", &function_397bdae9676d99b2, "$value");
    register("skip_scene_death", 0, 1, "$self", &function_c7cacbe604c9200d, "$value");
    register("supers", 1, 0, "$self", &function_ee3a42d7c6b37fe, "$value");
    register("wallrun", 1, 0, "$self", &function_98e071a6cc904543, "$value");
    register("doublejump", 1, 0, "$self", &function_156a6ef9e8bb6f63, "$value");
    register("slide", 1, 0, "$self", &function_60e7c22bac17f22f, "$value");
    register("execution_attack", 1, 0, "$self", &function_5e4e727a591c079d, "$value");
    register("execution_victim", 1, 0, "$self", &function_eb0398e7c2c3c055, "$value");
    register("vehicle_use", 1, 0, "$self", &function_e62e9efd7d1bf0da, "$value");
    register("vehicle_lean_out", 1, 0, "$self", &function_798a407672c35e3c, "$value");
    register("vehicle_seat_switch", 1, 0, "$self", &function_2a5481b1da502117, "$value");
    register("nvg", 1, 0, "$self", &function_7edde3ba90d9a36, "$value");
    register("spotter_scope", 1, 0, "$self", &function_2a4de4fe3103d24c, "$value");
    register("supersprint", 1, 0, "$self", &function_65fb0f9b12a90f29, "$value");
    register("shellshock", 1, 0, "$self", &function_3368e1d4052b1596, "$value");
    register("cinematic_motion", 1, 0, "$self", &function_ea01b65c909b99d2, "$value");
    register("armor", 1, 0, "$self", &function_293669b3b38c7221, "$value");
    register("door_frozen", 0, 1, "$self", &function_2937a757c6689fb3, "$value");
    register("interactions", 1, 0, "$self", &function_cbdfe6762b367d1b, "$value");
    register("action_slot_weapon", 1, 0, "$self", &function_dc9ce02e5a3bd6da, "$value");
    register("equipment_primary", 1, 0, "$self", &function_dd8e7fdce5f0dcff, "$value");
    register("equipment_secondary", 1, 0, "$self", &function_2b70e9743c9a71b, "$value");
    register("overlord_locked_priority", 0, 0, "$self", &function_f8b197beec8e9945, "$value");
    register("backpack_inventory", 1, 0, "$self", &function_4a0c36c985cc4a03, "$value");
    register("tacmap_scoreboard", 1, 0, "$self", &function_d093a1b1e1c340a3, "$value");
    register("demeanor", "", "", "$self", &set_demeanor, "$value");
    register("pain", 1, 0, "$self", &function_e839d0e33e07c756, "$value");
    register("infinite_ammo", 0, 1, "$self", &function_15b077dbaf3b063f, "$value");
    register("kill_on_damage", 0, 0, "$self", &function_7f308a0cfa036a48, "$value");
    register("hide_operator_backpack", 0, 1, "$self", &function_cfb80f3b8aad230, "$value");
    register("show_operator_pet", 1, 0, "$self", &function_9c9b518e967a4514, "$value");
    register("allow_give_super_point", 1, 1, "$self", &function_fc93ada8ce1701fe, "$value");
    register("pause_zombie_spawning", 0, 0, "$self", &function_3718505d535c6113, "$value");
    register("show_healthbar", 1, 1, "$self", &function_10613d0755b1655, "$value");
    register("attackeraccuracy", 1, 1, "$self", &function_ff795a8bf33046c1, "$value");
    register("ascender_use", 1, 0);
    register("crate_use", 1, 0);
    register("cough_gesture", 1, 0);
    register("ladder_placement", 1, 0);
    register("killstreaks", 1, 0);
    register("cp_munitions", 1, 0);
    register("cp_munitions_pickup", 1, 0);
    register("cp_supers_pickup", 1, 0);
    register("one_hit_melee_victim", 1, 0);
    register("flashed", 1, 0);
    register("stunned", 1, 0);
    register("stick_kill", 1, 0);
    register("unresolved_collisions", 1, 0);
    register("equipment_wheel", 1, 0, "$self", &function_1bc52d1afc4d1b95, [0:"equipment_wheel", 1:"$value"]);
    register("disallow_knockdown", 0, 1, "$self", &function_4c8f023af26b4a8a, "$value");
    register("disallow_stun", 0, 1, "$self", &function_db2848cc88d5a336, "$value");
    register("ignore_ai_collision", 0, 1, "$self", &function_b0146ba0c8f08192, "$value");
    register("spy_cam", 1, 0, "$self", &function_1bc52d1afc4d1b95, [0:"spy_cam", 1:"$value"]);
    register("ammomod_immune", 0, 1, "$self", &function_d549cfeb2ed5d5e2, "$value");
    register("allow_dismember", 1, 0, "$self", &function_b010672d21d0fdb1, "$value");
    register("cinematics_participant", 0, 1, "$self", &function_83f16f4f6bc886b2, "$value");
    register("overlord_speaker", "", "", "$self", &function_a93741c78d1d215b, "$value");
    register("ks_dont_forget", 0, 0, "$self", &function_13da7718a3ccfc98, "$value");
    register("ai_eventlist", "", "", "$self", &function_fd241a7be9d82fa5, "$value");
    register("stealth_ttlt_lkp", 8000, 8000, "$self", &function_f185596cc8242d28, "$value");
    register("stealth_ttlt_not_lkp", 3000, 3000, "$self", &function_4ef8b4df5173b05a, "$value");
    register("default_time_to_drop_threat_sight", 10000, 10000, "$self", &function_f1e27a27436441b4, "$value");
    register("global_esc_total_combat_time", -1, -1, "$self", &function_48cd47326fc3f73b, "$value");
    register("global_esc_percent_threshold", 0.8, 0.8, "$self", &function_dbb2149dbfbea743, "$value");
    register("vehicle_disallow_lockon", 0, 1, "$self", &function_69bc203e1b8c4e63, "$value");
    /#
        level thread debug_values();
        validate("freezecontrols", "show_hud", &function_1d19c0b0f63836bf);
        validate("prone", "show_hud", &function_c4d1d331dd972e60);
        validate("mount_top", "show_hud", &function_b07da66c065f9ef7);
    #/
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e3
// Size: 0xe5
function register(str_name, default_value, var_8f2a3de49e1f0527, call_on, func, args) {
    /#
        assert(isstring(str_name));
    #/
    if (!isdefined(level.values)) {
        level.values = [];
    }
    if (isdefined(level.values[str_name])) {
        /#
            assertmsg("Value '" + str_name + "' already registered.");
        #/
        return;
    }
    if (isdefined(args)) {
        if (!isarray(args)) {
            args = [0:args];
        }
    } else {
        args = [];
    }
    level.values[str_name] = {a_args:args, var_8f2a3de49e1f0527:var_8f2a3de49e1f0527, default_value:default_value, func:func, call_on:call_on, str_name:str_name};
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19cf
// Size: 0x24
function function_2239a4a14e69a8ef(str_name) {
    if (isdefined(level.values)) {
        level.values[str_name] = undefined;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19fa
// Size: 0x44
function function_2d6e7e0b80767910(group_name, var_347687dddfb04131) {
    /#
        thread function_15421e5286d72ec3(var_347687dddfb04131);
    #/
    if (!isdefined(level.var_2c32fa263b09c33b)) {
        level.var_2c32fa263b09c33b = [];
    }
    level.var_2c32fa263b09c33b[group_name] = var_347687dddfb04131;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1a45
// Size: 0x5d
function private function_15421e5286d72ec3(var_347687dddfb04131) {
    /#
        waitframe();
        foreach (var_ac29528daebed2ee in var_347687dddfb04131) {
            assert_registered(var_ac29528daebed2ee);
        }
    #/
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa9
// Size: 0x5f
function function_3633b947164be4f3(group_name, value) {
    /#
        /#
            assertex(isdefined(level.var_2c32fa263b09c33b[group_name]), "push_player" + group_name + "one_hit_melee_victim");
        #/
    #/
    str_id = "_group_" + group_name;
    function_59c053b89257bc95(str_id, level.var_2c32fa263b09c33b[group_name], value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b0f
// Size: 0x26
function function_588f2307a3040610(group_name) {
    str_id = "_group_" + group_name;
    function_c9d0b43701bdba00(str_id);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b3c
// Size: 0x38
function private assert_registered(str_name) {
    /#
        if (!isdefined(level.values[str_name])) {
            /#
                assertmsg("stunned" + str_name + "ammomod_immune");
            #/
            return 0;
        }
    #/
    return 1;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1b7c
// Size: 0x8a
function default_func(str_name, call_on, value, args) {
    if (assert_registered(str_name)) {
        if (isdefined(args) && !isarray(args)) {
            args = [0:args];
        }
        if (!isdefined(args)) {
            args = [];
        }
        s_value = level.values[str_name];
        s_value.default_call_on = call_on;
        s_value.default_value = value;
        s_value.default_args = args;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c0d
// Size: 0x95
function link(str_name, var_4d81048fd967e05, func) {
    if (assert_registered(str_name)) {
        s_value = level.values[str_name];
        var_5fe88b3a9d2968be = spawnstruct();
        var_5fe88b3a9d2968be.name = var_4d81048fd967e05;
        var_5fe88b3a9d2968be.func = func;
        if (!isdefined(var_5fe88b3a9d2968be.func)) {
            var_5fe88b3a9d2968be.func = &function_9d2fb572e4091b34;
        }
        s_value.links[var_4d81048fd967e05] = var_5fe88b3a9d2968be;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ca9
// Size: 0xd
function private function_9d2fb572e4091b34(b_value) {
    return b_value;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cbe
// Size: 0xec
function set(str_id, str_name, value) {
    if (assert_registered(str_name)) {
        if (!isdefined(value)) {
            value = level.values[str_name].var_8f2a3de49e1f0527;
        }
        function_84daf63cb0f79e23(str_id, str_name, value);
        function_2a218863f3cdf349(str_name, value);
    }
    if (isarray(level.values[str_name].links)) {
        foreach (var_97480d1662bb5aff in level.values[str_name].links) {
            set(str_id, var_97480d1662bb5aff.name, [[ var_97480d1662bb5aff.func ]](value));
        }
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db1
// Size: 0x6b
function function_59c053b89257bc95(str_id, var_d1450ef5ee023044, value) {
    foreach (str_name in var_d1450ef5ee023044) {
        set(str_id, str_name, value);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e23
// Size: 0x62
function function_38f73441260ce622(str_id, var_d1450ef5ee023044) {
    foreach (str_name in var_d1450ef5ee023044) {
        reset(str_id, str_name);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e8c
// Size: 0x8f
function get(str_name) {
    if (assert_registered(str_name)) {
        if (isdefined(self.values) && isdefined(self.values[str_name])) {
            n_index = self.values[str_name].size - 1;
            if (n_index >= 0 && isdefined(self.values[str_name][n_index].value)) {
                return self.values[str_name][n_index].value;
            }
        }
        return function_adc5570ca43bf869(str_name);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f22
// Size: 0x7a
function function_93258ad5961ae3d4(str_name) {
    if (assert_registered(str_name)) {
        if (isdefined(self.values) && isdefined(self.values[str_name])) {
            n_index = 0;
            if (isdefined(self.values[str_name][n_index].value)) {
                return self.values[str_name][n_index].value;
            }
        }
        return function_adc5570ca43bf869(str_name);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa3
// Size: 0x22
function function_b8752cbc9310dbbf(str_name, value) {
    set("radiant", str_name, value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1fcc
// Size: 0x40
function set_for_time(n_time, str_id, str_name, value) {
    self endon("death");
    set(str_id, str_name, value);
    wait(n_time);
    reset(str_id, str_name);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2013
// Size: 0x10d
function reset(str_id, str_name) {
    n_index = function_637fd9b91c8b1623(str_id, str_name);
    if (!n_index) {
        if (isdefined(self.values) && isdefined(self.values[str_name]) && self.values[str_name].size > 0) {
            function_2a218863f3cdf349(str_name, self.values[str_name][0].value);
        } else {
            function_548df0b2ffd1de95(str_name);
        }
    }
    if (isarray(level.values[str_name].links)) {
        foreach (var_97480d1662bb5aff in level.values[str_name].links) {
            reset(str_id, var_97480d1662bb5aff.name);
        }
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2127
// Size: 0xe9
function function_c9d0b43701bdba00(str_id) {
    if (!isdefined(self.values)) {
        return;
    }
    var_7354d28b732f3b06 = arraycopy(self.values);
    foreach (var_8f0d78aa4acfe8c5, var_6d0bb6fdbb532a90 in var_7354d28b732f3b06) {
        foreach (state in var_6d0bb6fdbb532a90) {
            if (isdefined(state.str_id) && state.str_id == str_id) {
                reset(str_id, var_8f0d78aa4acfe8c5);
            }
        }
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2217
// Size: 0x19
function function_1a0b0a06690c8088(str_name) {
    reset("radiant", str_name);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2237
// Size: 0x21
function nuke(str_name) {
    self.values[str_name] = [];
    function_548df0b2ffd1de95(str_name);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x225f
// Size: 0xb4
function function_8b5f9e0014775208() {
    if (!isdefined(self.values)) {
        return;
    }
    var_9c45b28e12994e8f = [];
    foreach (str_name, value in self.values) {
        var_9c45b28e12994e8f[var_9c45b28e12994e8f.size] = str_name;
    }
    foreach (str_name in var_9c45b28e12994e8f) {
        nuke(str_name);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x231a
// Size: 0xb0
function private function_84daf63cb0f79e23(str_id, str_name, value) {
    /#
        assert(isstring(str_id));
    #/
    function_637fd9b91c8b1623(str_id, str_name);
    if (!isdefined(self.values)) {
        self.values = [];
    }
    if (!isdefined(self.values[str_name])) {
        self.values[str_name] = [];
    }
    new_value = spawnstruct();
    new_value.str_id = str_id;
    new_value.value = value;
    self.values[str_name] = utility::array_insert(self.values[str_name], new_value, 0);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23d1
// Size: 0xdb
function private function_637fd9b91c8b1623(str_id, str_name) {
    if (!isdefined(self)) {
        return -1;
    }
    n_index = undefined;
    if (isdefined(self.values) && isdefined(self.values[str_name])) {
        for (n_index = self.values[str_name].size - 1; n_index >= 0; n_index--) {
            if (self.values[str_name][n_index].str_id == str_id) {
                self.values[str_name] = utility::array_remove_index(self.values[str_name], n_index);
                break;
            }
        }
        if (!self.values[str_name].size) {
            self.values[str_name] = undefined;
            if (!self.values.size) {
                self.values = undefined;
            }
        }
    }
    return utility::ter_op(isdefined(n_index), n_index, -1);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x24b4
// Size: 0xb2
function private function_2a218863f3cdf349(str_name, value) {
    s_value = level.values[str_name];
    if (isdefined(s_value)) {
        s_value.value = value;
        if (isdefined(s_value.func)) {
            call_on = utility::ter_op(isstring(s_value.call_on) && s_value.call_on == "$self", self, s_value.call_on);
            utility::single_func_argarray(call_on, s_value.func, function_bdf4bd4bfd210f6(s_value.a_args, value));
        }
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x256d
// Size: 0xce
function private function_adc5570ca43bf869(str_name) {
    default_value = undefined;
    s_value = level.values[str_name];
    if (isdefined(s_value) && isdefined(s_value.default_value)) {
        if (isfunction(s_value.default_value)) {
            call_on = utility::ter_op(isstring(s_value.default_call_on) && s_value.default_call_on == "$self", self, s_value.default_call_on);
            default_value = utility::single_func_argarray(call_on, s_value.default_value, function_bdf4bd4bfd210f6(s_value.default_args));
        } else {
            default_value = s_value.default_value;
        }
    }
    return default_value;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2643
// Size: 0x2c
function private function_548df0b2ffd1de95(str_name) {
    default_value = function_adc5570ca43bf869(str_name);
    if (isdefined(default_value)) {
        function_2a218863f3cdf349(str_name, default_value);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2676
// Size: 0x77
function private function_32efb357c319abf0(array, str_value, replacement) {
    foreach (i, val in array) {
        if (isstring(val) && val == str_value) {
            array[i] = replacement;
        }
    }
    return array;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x26f5
// Size: 0x38
function private function_bdf4bd4bfd210f6(a_args, value) {
    if (isdefined(a_args)) {
        a_args = function_32efb357c319abf0(a_args, "$self", self);
        a_args = function_32efb357c319abf0(a_args, "$value", value);
    }
    return a_args;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2735
// Size: 0x72
function private function_a49123f94edb0267(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (isplayer(self)) {
        if (utility::issp()) {
            if (b_value) {
                self disableinvulnerability();
            } else {
                self enableinvulnerability();
            }
        } else if (istrue(level.var_a12c755dc79cd6f3)) {
            self.takedamage = b_value;
        } else {
            /#
                iprintln("bullet");
            #/
        }
    } else {
        self setcandamage(b_value);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x27ae
// Size: 0x1e
function private function_1d19c0b0f63836bf() {
    if (isplayer(self)) {
        return !self isinvulnerable();
    } else {
        return self function_89db472b36958666();
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27d3
// Size: 0x3b
function private function_613f82ecdf9b56b8(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (isdefined(self.deathshieldfunc)) {
        self [[ self.deathshieldfunc ]](!b_value);
    }
    self.allowdeath = b_value;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2815
// Size: 0xc
function private function_c4d1d331dd972e60() {
    return self.allowdeath;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2829
// Size: 0x20
function private function_8aba0b6af3dcb0ef(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self.damageshield = b_value;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2850
// Size: 0xc
function private function_b07da66c065f9ef7() {
    return self.damageshield;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2864
// Size: 0x9
function private function_564dce69848aceaa() {
    return self function_3d73b8f9ddb1a76e();
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2875
// Size: 0x1f
function private function_9e8589036c3fd37e(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    self.ignoresuppression = b_value;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x289b
// Size: 0x172
function private set_takeweapons_thread(b_value) {
    self notify("set_takeweapons_thread");
    self endon("set_takeweapons_thread");
    self endon("death_or_disconnect");
    wait(level.framedurationseconds * 3);
    if (b_value) {
        if (!isdefined(self.var_7ec74e46c61be9d7)) {
            self.var_7ec74e46c61be9d7 = spawnstruct();
            self.var_7ec74e46c61be9d7.weapons = self getweaponslistall();
            self.var_7ec74e46c61be9d7.current = self getcurrentweapon();
        }
        self takeallweapons();
    } else if (isdefined(self.var_7ec74e46c61be9d7)) {
        var_c87505d07d64bd65 = self.var_7ec74e46c61be9d7.current;
        var_5e6961853f911abf = undefined;
        foreach (weapon in self.var_7ec74e46c61be9d7.weapons) {
            self giveweapon(weapon);
            if (!isdefined(var_5e6961853f911abf) && weapon.type == "bullet") {
                var_5e6961853f911abf = weapon;
            }
        }
        if (isdefined(var_5e6961853f911abf) && var_c87505d07d64bd65.basename == "none") {
            var_c87505d07d64bd65 = var_5e6961853f911abf;
        }
        self switchtoweaponimmediate(var_c87505d07d64bd65);
        self.var_7ec74e46c61be9d7 = undefined;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a14
// Size: 0x72
function private set_takeweapons(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    if (isplayer(self)) {
        thread set_takeweapons_thread(b_value);
        return;
    }
    if (b_value) {
        ai::gun_remove();
        if (isdefined(anim.var_c65f21298ce83c9c)) {
            self [[ anim.var_c65f21298ce83c9c ]]();
        }
    } else {
        ai::gun_recall();
        if (isdefined(anim.var_f240ef0c84eac2b2)) {
            self [[ anim.var_f240ef0c84eac2b2 ]]();
        }
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a8d
// Size: 0x7b
function private function_945a9012be94d89b(value) {
    if (!isdefined(value)) {
        value = 0;
    }
    if (value != 1) {
        self disableweapons(isnumber(value) && value == -1 ? 1 : 0);
        if (isdefined(level.allow_weapon_mp)) {
            self [[ level.allow_weapon_mp ]](0);
        }
    } else {
        self enableweapons();
        if (isdefined(level.allow_weapon_mp)) {
            self [[ level.allow_weapon_mp ]](1);
        }
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b0f
// Size: 0x2a
function private function_271781b97a830b8f(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self enableweaponswitch();
    } else {
        self disableweaponswitch();
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b40
// Size: 0x2d
function private function_cbbbe022b06a2d09(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self disableemptyclipweaponswitch(0);
    } else {
        self disableemptyclipweaponswitch(1);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b74
// Size: 0x2d
function private function_cda8ef3bebb4e3ee(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self allowfire(1);
    } else {
        self allowfire(0);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ba8
// Size: 0x8a
function private function_6a7974bc3033866f(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value != 1) {
        self allowreload(0);
        if (b_value != -1) {
            self cancelreload();
            var_5814d27874b48e54 = spawnstruct();
            var_5814d27874b48e54.player = self;
            var_5814d27874b48e54.var_c198f7ca473378fb = "ENTER_VEHICLE";
            var_5814d27874b48e54.var_c739ba1eb6635b73 = getsystemtimeinmicroseconds();
            namespace_c45ac99c4997e722::function_80820d6d364c1836("callback_on_reload_cancel", var_5814d27874b48e54);
        }
    } else {
        self allowreload(1);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c39
// Size: 0x2a
function private function_ac139cd4bd7d232e(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self enableweaponpickup();
    } else {
        self disableweaponpickup();
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c6a
// Size: 0x2a
function private function_1155b13235411eec(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self enableautoreload();
    } else {
        self disableautoreload();
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c9b
// Size: 0x2a
function private function_8fdf6df702996fa7(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self enableoffhandweapons();
    } else {
        self disableoffhandweapons();
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ccc
// Size: 0x2a
function private function_47279b5d7e2bcef3(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self enableoffhandprimaryweapons();
    } else {
        self disableoffhandprimaryweapons();
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2cfd
// Size: 0x2a
function private function_c8f662a90251117(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self enableoffhandsecondaryweapons();
    } else {
        self disableoffhandsecondaryweapons();
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d2e
// Size: 0x1d
function private function_f61d010ff82a69da(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    self allowoffhandshieldweapons(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d52
// Size: 0x2b
function private function_54a3481116d62f02(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    if (b_value) {
        self enableoffhandthrowback();
    } else {
        self disableoffhandthrowback();
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d84
// Size: 0x1a
function private function_8493479decad7dea(b_value) {
    /#
        assertmsg("set_allow_offhand_special not implemented");
    #/
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2da5
// Size: 0x49
function private function_4e24d3eb9687a667(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    /#
        assert(!isdefined(level.ismp) || level.ismp == 0);
    #/
    setsaveddvar(@"hash_3460979d7380da0", !b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2df5
// Size: 0x2a
function private function_586996315a6703b0(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self enableusability();
    } else {
        self disableusability();
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e26
// Size: 0x20
function private function_2553e8f1e80d32a9(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self.ignoreme = b_value;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e4d
// Size: 0x20
function private function_d3eeff01d5db508a(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self.ignoreall = b_value;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2e74
// Size: 0x41
function private function_ae5bbceb3d29efe6(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    /#
        assert(isplayer(self));
    #/
    if (b_value) {
        self.nohitmarkers = undefined;
    } else {
        self.nohitmarkers = 1;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ebc
// Size: 0x3c
function private set_hide(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    if (b_value) {
        if (b_value == 1) {
            self hide();
        } else {
            self hide();
        }
    } else {
        self show();
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2eff
// Size: 0x32
function private set_health_regen(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    if (b_value) {
        self.disable_health_regen = undefined;
    } else {
        self.disable_health_regen = 1;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f38
// Size: 0x31
function private function_1140c973aa64c8d6(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self.disable_health_regen_delay = undefined;
    } else {
        self.disable_health_regen_delay = 1;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f70
// Size: 0x32
function private set_ignore_health_regen_delay(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    if (b_value) {
        self.ignore_health_regen_delay = 1;
    } else {
        self.ignore_health_regen_delay = 0;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2fa9
// Size: 0x8c
function private function_a93b95cf50f8c3c9(val) {
    if (isdefined(val)) {
        self.goalradius = val;
    } else if (isdefined(self.radius)) {
        self.goalradius = float(self.radius);
    } else if (isdefined(self.spawner.radius)) {
        self.goalradius = float(self.spawner.radius);
    } else {
        self.goalradius = 2048;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x303c
// Size: 0x29
function private function_397bdae9676d99b2(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self.skipdeath = utility::ter_op(b_value, 1, 0);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x306c
// Size: 0x29
function private function_c7cacbe604c9200d(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self.skipscenedeath = utility::ter_op(b_value, 1, undefined);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x309c
// Size: 0x14
function private function_ff6d5864f8680d5e(b_allow) {
    self enableplayerbreathsystem(b_allow);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x30b7
// Size: 0x14
function private function_15cc9bfda3c4adee(b_freeze) {
    self freezecontrols(b_freeze);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x30d2
// Size: 0x14
function private function_9a6ef6fcc3e3c652(b_freeze) {
    self freezelookcontrols(b_freeze);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x30ed
// Size: 0x4f
function private function_d4513b1bc21601(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    if (!utility::ent_flag_exist("stealth_social_reveal")) {
        utility::ent_flag_init("stealth_social_reveal");
    }
    if (b_value) {
        utility::ent_flag_set("stealth_social_reveal");
    } else {
        utility::ent_flag_clear("stealth_social_reveal");
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3143
// Size: 0x27
function private function_688748c7477e93dc(b_value) {
    if (b_value) {
        b_value = 0;
    } else {
        b_value = 1;
    }
    self setclientomnvar("ui_hide_hud", b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3171
// Size: 0x27
function private function_8b2fc23241e6448b(b_value) {
    if (b_value) {
        b_value = 0;
    } else {
        b_value = 1;
    }
    self setclientomnvar("ui_hide_weapon_info", b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x319f
// Size: 0x27
function private function_147fe8bda5949cf2(b_value) {
    if (b_value) {
        b_value = 0;
    } else {
        b_value = 1;
    }
    self setclientomnvar("ui_hide_dpad_hud", b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x31cd
// Size: 0x29
function private allow_melee_victim(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self.canbemeleed = utility::ter_op(b_value, 1, 0);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x31fd
// Size: 0x1e
function private function_c10182e05a99f789(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self allowjump(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3222
// Size: 0x1e
function private function_5d8c973a5b6b05d8(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self allowdoublejump(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3247
// Size: 0x1e
function private function_4dd00f1be6c69677(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self allowcrouch(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x326c
// Size: 0x28
function private function_d4a512c33a86e3d1(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self.var_6900f3419d3c4dd0 = b_value;
    self allowprone(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x329b
// Size: 0xfd
function private function_c8e47b79550e4319(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    if (b_value) {
        self allowstand(1);
        self allowcrouch(1);
        self allowprone(1);
    } else {
        current = self getstance();
        foreach (stance in array_remove([0:"stand", 1:"crouch", 2:"prone"], current)) {
            switch (stance) {
            case #"hash_c6775c88e38f7803":
                self allowstand(0);
                break;
            case #"hash_3fed0cbd303639eb":
                self allowcrouch(0);
                break;
            case #"hash_d91940431ed7c605":
                self allowprone(0);
                break;
            }
        }
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x339f
// Size: 0x1e
function private function_ebf228fbb0a74d57(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self allowmelee(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x33c4
// Size: 0x1d
function private function_1e949110ce628e51(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    self allowlean(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x33e8
// Size: 0x1e
function private function_b3870b9ec763d70a(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self allowmantle(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x340d
// Size: 0x1d
function private function_9b5befbb13ad7651(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    self allowmounttop(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3431
// Size: 0x1d
function private function_aac726af48296365(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    self allowmountside(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3455
// Size: 0x1e
function private function_f7c69559dbf71a1(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self allowsprint(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x347a
// Size: 0x1e
function private function_2a827539b0ee61b7(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self allowjog(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x349f
// Size: 0x1e
function private function_503f80a21c85a0ff(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self allowstand(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34c4
// Size: 0x1e
function private function_1b400b9f81972824(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self allowmovement(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34e9
// Size: 0x1e
function private function_f3b4bc17c87adba5(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self function_b13377d16b8e41de(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x350e
// Size: 0x1e
function private function_880120db350a6425(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self function_f484b2c51e0d6f5e(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3533
// Size: 0x1e
function private function_d13b7a396eab0463(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self function_d92f18565aad28ec(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3558
// Size: 0x3b
function private function_46eda303c0fa6322(val) {
    if (!isdefined(val)) {
        val = 1;
    }
    if (isai(self)) {
        asm::asm_setmoveplaybackrate(val);
    } else if (isplayer(self)) {
        self setmovespeedscale(val);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x359a
// Size: 0x46
function private function_ea87ab85d222844d(val) {
    if (!isdefined(val)) {
        val = 0;
    }
    if (!isai(self)) {
        /#
            assertmsg("VAL_DESIRED_SPEED can only be used on AI entities");
        #/
        return;
    }
    if (val > 0) {
        self aisetdesiredspeed(val);
    } else {
        self aiclearscriptdesiredspeed(val);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x35e7
// Size: 0x1e
function private function_5241aabb76d1bc21(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self pushplayer(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x360c
// Size: 0x32
function private function_ee3a42d7c6b37fe(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self function_f9594ee32c931a2e();
    } else {
        self function_8a340e416d4d11ed();
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3645
// Size: 0x92
function private function_cfb80f3b8aad230(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        if (self tagexists("TAG_STOWED_BACKPACK_HIDE")) {
            if (!isdefined(self.operatorcustomization) || !isdefined(self.operatorcustomization.body) || self.operatorcustomization.body != "body_mp_gus_iw9_1_1") {
                self hidepart("TAG_STOWED_BACKPACK_HIDE");
            }
        }
    } else if (self tagexists("TAG_STOWED_BACKPACK_HIDE")) {
        self showpart("TAG_STOWED_BACKPACK_HIDE");
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x36de
// Size: 0x1e
function private function_9c9b518e967a4514(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    self function_360aa68e9d2fc8d3(!b_value, self);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3703
// Size: 0x1d
function private function_98e071a6cc904543(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    self allowwallrun(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3727
// Size: 0x95
function private function_156a6ef9e8bb6f63(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self energy_setenergy(0, self.doublejumpenergy);
        self energy_setrestorerate(0, self.doublejumpenergyrestorerate);
        self.doublejumpenergy = undefined;
        self.doublejumpenergyrestorerate = undefined;
        self allowdoublejump(1);
    } else {
        self.doublejumpenergy = self energy_getenergy(0);
        self.doublejumpenergyrestorerate = self energy_getrestorerate(0);
        self energy_setenergy(0, 0);
        self energy_setrestorerate(0, 0);
        self allowdoublejump(0);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x37c3
// Size: 0x1d
function private function_60e7c22bac17f22f(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    self allowslide(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x37e7
// Size: 0x36
function private function_5e4e727a591c079d(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self [[ level.enableexecutionattackfunc ]]();
    } else {
        self [[ level.disableexecutionattackfunc ]]();
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3824
// Size: 0x36
function private function_eb0398e7c2c3c055(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self [[ level.enableexecutionvictimfunc ]]();
    } else {
        self [[ level.disableexecutionvictimfunc ]]();
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3861
// Size: 0x1d
function private function_e62e9efd7d1bf0da(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    vehicle_allowplayeruse(self, b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3885
// Size: 0x1d
function private function_798a407672c35e3c(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    self function_681750c19a6216ca(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x38a9
// Size: 0x28
function private function_2a5481b1da502117(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    self.var_ea02a8bfcfde7c4b = utility::ter_op(b_value, undefined, 1);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x38d8
// Size: 0xa2
function private function_7edde3ba90d9a36(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (utility::iscp() && !isdefined(level.players[0].pers["useNVG"])) {
        return;
    }
    var_c7b3c8374684b876 = 2;
    if (b_value) {
        if (!isai(self)) {
            self setactionslot(var_c7b3c8374684b876, "nightvision");
            if (utility::iscp()) {
                self function_b1e64d364cf55b73(1);
            }
        }
    } else if (!isai(self)) {
        self setactionslot(var_c7b3c8374684b876, "");
        if (utility::iscp()) {
            self function_b1e64d364cf55b73(0);
        }
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3981
// Size: 0x43
function private function_2a4de4fe3103d24c(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        if (!isai(self)) {
            self.var_24e9ac46ba2ec580 = undefined;
        }
    } else if (!isai(self)) {
        self.var_24e9ac46ba2ec580 = 1;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x39cb
// Size: 0x1d
function private function_65fb0f9b12a90f29(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    self allowsupersprint(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x39ef
// Size: 0x50
function private function_3368e1d4052b1596(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        if (isdefined(level.enableshellshockfunc)) {
            self [[ level.enableshellshockfunc ]]();
        }
    } else if (isdefined(level.disableshellshockfunc)) {
        self [[ level.disableshellshockfunc ]]();
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a46
// Size: 0x4f
function private function_ea01b65c909b99d2(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        if (isdefined(self.cinematicmotionoverride)) {
            self setcinematicmotionoverride(self.cinematicmotionoverride);
        } else {
            self clearcinematicmotionoverride();
        }
    } else {
        self setcinematicmotionoverride("disabled");
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a9c
// Size: 0x52
function private function_293669b3b38c7221(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (isdefined(self.armor) && isdefined(self.armor.toggleuifunc)) {
        self [[ self.armor.toggleuifunc ]](b_value);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3af5
// Size: 0x56
function private getequipmenttableinfo(ref) {
    if (isdefined(ref) && !isdefined(level.equipment.table[ref])) {
        /#
            assertmsg("getEquipmentTableInfo was called fo equipment with a ref that wasn't initialized: " + ref + "!");
        #/
    }
    return level.equipment.table[ref];
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3b53
// Size: 0x26
function private getcurrentequipment(slot) {
    if (!isdefined(self.equipment)) {
        return undefined;
    }
    return self.equipment[slot];
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3b81
// Size: 0x45
function private disableslotinternal(slot) {
    if (slot == "primary") {
        self clearoffhandprimary();
    } else if (slot == "secondary") {
        self clearoffhandsecondary();
    } else if (slot == "super") {
        self clearoffhandspecial();
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3bcd
// Size: 0x2ff
function private enableslotinternal(slot) {
    ref = getcurrentequipment(slot);
    var_a1a3722fb9707783 = self getweaponslistoffhands();
    weapon = undefined;
    variantid = undefined;
    if (!isdefined(ref)) {
        return;
    }
    found = 0;
    foreach (equip in var_a1a3722fb9707783) {
        var_1189bd7fbe2861f8 = undefined;
        foreach (var_8bf83d28be4c2d4f in level.equipment.table) {
            if (isdefined(var_8bf83d28be4c2d4f.objweapon.basename) && equip.basename == var_8bf83d28be4c2d4f.objweapon.basename) {
                var_1189bd7fbe2861f8 = var_8bf83d28be4c2d4f.ref;
                break;
            }
        }
        if (isdefined(var_1189bd7fbe2861f8) && var_1189bd7fbe2861f8 == ref) {
            found = 1;
            if (isdefined(equip.variantid) && equip.variantid > 0) {
                variantid = equip.variantid;
                if (!isdefined(equip.basename)) {
                    return undefined;
                }
                if (isdefined(variantid) && variantid > 0) {
                    weapon = makeweapon(equip.basename, [], undefined, undefined, variantid);
                    var_1092bc40c58c1c9a = equip.basename + "|" + string(variantid);
                    attachments = level.var_a1e3b0d7b2a7836f[var_1092bc40c58c1c9a];
                    foreach (attachment, variant in attachments) {
                        weapon = weapon withattachment(attachment, variant);
                    }
                } else {
                    weapon = makeweapon(equip.basename);
                }
            } else {
                var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
                weapon = var_8bf83d28be4c2d4f.objweapon;
            }
            break;
        }
    }
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    if (!istrue(found)) {
        weapon = var_8bf83d28be4c2d4f.objweapon;
    }
    if (isdefined(weapon)) {
        if (isdefined(weapon) && !var_8bf83d28be4c2d4f.ispassive) {
            if (slot == "primary") {
                self assignweaponoffhandprimary(weapon);
            } else if (slot == "secondary") {
                self assignweaponoffhandsecondary(weapon);
            } else if (slot == "super") {
                self assignweaponoffhandspecial(weapon);
            }
        }
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ed3
// Size: 0x34
function private function_dd8e7fdce5f0dcff(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        enableslotinternal("primary");
    } else {
        disableslotinternal("primary");
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f0e
// Size: 0x34
function private function_2b70e9743c9a71b(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        enableslotinternal("secondary");
    } else {
        disableslotinternal("secondary");
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f49
// Size: 0x26
function private function_782c9cfc7f78e416(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    setsaveddvar(@"hash_4771e9353baf9732", !b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f76
// Size: 0x1e
function private function_2937a757c6689fb3(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self scriptabledoorfreeze(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f9b
// Size: 0x31
function private function_cbdfe6762b367d1b(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self.interactions_disabled = undefined;
    } else {
        self.interactions_disabled = 1;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3fd3
// Size: 0x40
function private function_4a0c36c985cc4a03(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (utility::iscp()) {
        if (b_value) {
            self setclientomnvar("ui_disable_inventory", 0);
        } else {
            self setclientomnvar("ui_disable_inventory", 1);
        }
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x401a
// Size: 0x43
function private function_d093a1b1e1c340a3(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (iscp()) {
        if (b_value) {
            self setclientomnvar("ui_show_tac_map", 1);
        } else {
            self setclientomnvar("ui_show_tac_map", 0);
        }
        goto LOC_00000041;
    }
LOC_00000041:
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4064
// Size: 0x34
function private function_4e80f7e4ffe334e0(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        utility::flag_clear("weapon_scanning_off");
    } else {
        utility::flag_set("weapon_scanning_off");
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x409f
// Size: 0x4f
function private function_dc9ce02e5a3bd6da(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value && isdefined(self.actionslotweapon)) {
        self setactionslot(1, "weapon", self.actionslotweapon);
    } else {
        self setactionslot(1, "");
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40f5
// Size: 0x38
function private set_demeanor(str_value) {
    if (isai(self)) {
        if (!isdefined(str_value) || str_value == "") {
            utility::clear_demeanor_override();
        } else {
            utility::demeanor_override(str_value);
        }
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4134
// Size: 0x1f
function private function_e839d0e33e07c756(b_value) {
    if (isai(self)) {
        self.allowpain = b_value;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x415a
// Size: 0x40
function private function_15b077dbaf3b063f(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    if (!isplayer(self) && !isagent(self)) {
        /#
            assertmsg("VAL_INFINITE_AMMO can only be applied to players and MP agents");
        #/
    }
    self function_ae3021dcebd28be1(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41a1
// Size: 0x27
function private function_f8b197beec8e9945(val) {
    if (isdefined(level.var_60fc087bc7deaadc)) {
        self [[ level.var_60fc087bc7deaadc ]](val);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41cf
// Size: 0x20
function private function_7f308a0cfa036a48(b_value) {
    if (isai(self)) {
        self.var_cbee08d81e41 = istrue(b_value);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41f6
// Size: 0x3c
function private function_fc93ada8ce1701fe(b_value) {
    if (isplayer(self) || isai(self)) {
        if (istrue(b_value)) {
            self.var_f405191d4605c15c = 0;
        } else {
            self.var_f405191d4605c15c = 1;
        }
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4239
// Size: 0x17
function private function_3718505d535c6113(b_value) {
    self.var_f62adc4cc32e37c7 = istrue(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4257
// Size: 0xdf
function function_bee64cea73f1992b(str_id, value) {
    if (value) {
        set(str_id, "fire", !value);
        set(str_id, "offhand_weapons", !value);
        set(str_id, "allow_movement", !value);
        set(str_id, "allow_jump", !value);
        set(str_id, "melee", !value);
        set(str_id, "sprint", !value);
        set(str_id, "prone", !value);
    } else {
        reset(str_id, "fire");
        reset(str_id, "offhand_weapons");
        reset(str_id, "allow_movement");
        reset(str_id, "allow_jump");
        reset(str_id, "melee");
        reset(str_id, "sprint");
        reset(str_id, "prone");
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x433d
// Size: 0xa7
function function_91558560b423d58e(str_id, value) {
    if (value) {
        set(str_id, "offhand_weapons", !value);
        set(str_id, "allow_movement", !value);
        set(str_id, "allow_jump", !value);
        set(str_id, "melee", !value);
        set(str_id, "sprint", !value);
    } else {
        reset(str_id, "offhand_weapons");
        reset(str_id, "allow_movement");
        reset(str_id, "allow_jump");
        reset(str_id, "melee");
        reset(str_id, "sprint");
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x43eb
// Size: 0x1e
function private function_888bc6393955267d(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self allowads(b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4410
// Size: 0x19
function private function_1bc52d1afc4d1b95(s_notify, b_value) {
    self notify(s_notify, b_value);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4430
// Size: 0x1f
function private function_4c8f023af26b4a8a(b_value) {
    if (isai(self)) {
        self.disallow_knockdown = b_value;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4456
// Size: 0x1f
function private function_db2848cc88d5a336(b_value) {
    if (isai(self)) {
        self.disallow_stun = b_value;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x447c
// Size: 0x29
function private function_b0146ba0c8f08192(b_value) {
    if (isai(self)) {
        self enableavoidance(!b_value);
        self.var_3119604b74dfdbbd = !b_value;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x44ac
// Size: 0x1f
function private function_d549cfeb2ed5d5e2(b_value) {
    if (isai(self)) {
        self.var_b9527ed408c69385 = b_value;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x44d2
// Size: 0x1e
function private function_10613d0755b1655(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    self.var_b4e1188db8263d17 = b_value;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x44f7
// Size: 0x16
function private function_ff795a8bf33046c1(b_value) {
    self.attackeraccuracy = b_value;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4514
// Size: 0x45
function private function_b010672d21d0fdb1(b_value) {
    if (!utility::ent_flag_exist("allow_dismember")) {
        utility::ent_flag_init("allow_dismember");
    }
    if (b_value) {
        utility::ent_flag_set("allow_dismember");
    } else {
        utility::ent_flag_clear("allow_dismember");
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4560
// Size: 0x15
function private function_83f16f4f6bc886b2(b_value) {
    self function_3671ec427c125cb(istrue(b_value));
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x457c
// Size: 0x55
function private function_a93741c78d1d215b(var_cf8b5ceaf91df155) {
    if (!isdefined(var_cf8b5ceaf91df155) || var_cf8b5ceaf91df155 == "") {
        if (isdefined(level.var_673320093d434d55)) {
            self [[ level.var_673320093d434d55 ]]();
        }
    } else if (isdefined(level.var_237eaf521a80c304)) {
        self [[ level.var_237eaf521a80c304 ]](var_cf8b5ceaf91df155);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x45d8
// Size: 0x1f
function private function_69bc203e1b8c4e63(var_ce1774b1e0c60661) {
    if (namespace_dbbb37eb352edf96::isvehicle()) {
        self.var_ec60570ddbb987b1 = var_ce1774b1e0c60661;
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45fe
// Size: 0x1f
function function_13da7718a3ccfc98(value) {
    if (!isdefined(value)) {
        value = 0;
    }
    self.var_a8ccefef48c51019 = value;
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4624
// Size: 0x2b
function function_fd241a7be9d82fa5(eventlist) {
    if (is_equal(eventlist, "")) {
        function_ba91b16ee30d37ae();
    } else {
        function_71a28a935629a941(eventlist);
    }
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4656
// Size: 0x13
function function_f185596cc8242d28(val) {
    function_a1c249d52179826c(val);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4670
// Size: 0x13
function function_4ef8b4df5173b05a(val) {
    function_e280f14a391474ef(val);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x468a
// Size: 0x13
function function_f1e27a27436441b4(val) {
    function_129c37cc2498c0d5(val);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46a4
// Size: 0x13
function function_48cd47326fc3f73b(val) {
    function_412d0fae58ba3904(val);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46be
// Size: 0x13
function function_dbb2149dbfbea743(val) {
    function_dde84eabe77d9e18(val);
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x46d8
// Size: 0x83
function private validate(str_name, call_on, func) {
    /#
        if (!isdefined(level.values[str_name])) {
            /#
                assertmsg("stunned" + str_name + "ammomod_immune");
            #/
            return;
        }
        s_value = level.values[str_name];
        s_value.b_validate = 1;
        s_value.func_validate = func;
        s_value.validate_call_on = call_on;
    #/
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x4762
// Size: 0x130
function private validate_value(str_name, value, b_assert) {
    /#
        if (!isdefined(b_assert)) {
            b_assert = 0;
        }
        s_value = level.values[str_name];
        current_value = undefined;
        if (isdefined(s_value.func_validate)) {
            call_on = utility::ter_op(isstring(s_value.validate_call_on) && s_value.validate_call_on == "show_hud", self, s_value.validate_call_on);
            if (isdefined(s_value.validate_args)) {
                current_value = utility::single_func_argarray(call_on, s_value.func_validate, function_bdf4bd4bfd210f6(s_value.validate_args));
            } else {
                current_value = utility::single_func_argarray(call_on, s_value.func_validate, []);
            }
        } else {
            current_value = 0;
        }
        b_match = isdefined(current_value) && current_value == value;
        if (b_assert) {
            /#
                assert(b_match, "<unknown string>" + str_name + "<unknown string>" + current_value + "<unknown string>" + value + "<unknown string>");
            #/
        }
        return b_match;
    #/
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4899
// Size: 0x2e4
function private debug_values() {
    /#
        setdvarifuninitialized(@"hash_2bc65f5389e9ee5", 0);
        waitframe();
        scr_debug_values = 0;
        var_145377a3061eae2 = -1;
        while (1) {
            if (gettime() > var_145377a3061eae2) {
                scr_debug_values = getdvarint(@"hash_2bc65f5389e9ee5");
                var_145377a3061eae2 = gettime() + 1000;
            }
            if (!scr_debug_values) {
                waitframe();
                continue;
            }
            str_debug_values_entity = string::function_8345560e22fe3b10(getdvar(@"hash_9a21303d5beb8eed", "<unknown string>"));
            if (str_debug_values_entity == "<unknown string>" || str_debug_values_entity == "<unknown string>" || str_debug_values_entity == "<unknown string>") {
                hud_ent = level.host;
                if (!isdefined(hud_ent)) {
                    hud_ent = level.player;
                }
                if (!isdefined(hud_ent)) {
                    hud_ent = level.players[0];
                }
                str_label = "<unknown string>";
            } else {
                str_value = str_debug_values_entity;
                str_key = "<unknown string>";
                if (issubstr(str_value, "<unknown string>")) {
                    a_toks = strtok(str_value, "<unknown string>");
                    str_value = a_toks[0];
                    str_key = a_toks[1];
                }
                hud_ent = getent(str_value, str_key, 1);
                str_label = str_value + "<unknown string>" + str_key;
            }
            printtoscreen2d(200, 100, str_label, (1, 1, 1), 2);
            a_all_ents = getentarray();
            foreach (ent in a_all_ents) {
                if (isdefined(ent.values)) {
                    i = 1;
                    foreach (str_name, a_value in ent.values) {
                        top_value = a_value[0];
                        if (isdefined(top_value)) {
                            b_valid = 1;
                            if (istrue(level.values[str_name].b_validate)) {
                                b_assert = getdvarint(@"hash_2bc65f5389e9ee5", 0) > 1;
                                b_valid = ent validate_value(str_name, top_value.value, b_assert);
                            }
                            ent display_value(i, str_name, top_value.str_id, top_value.value, isdefined(hud_ent) && b_valid, isdefined(hud_ent) && ent == hud_ent);
                            i++;
                        }
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace val/namespace_1cd9f6896754adb0
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x4b84
// Size: 0x102
function private display_value(index, str_name, str_id, value, b_valid, on_hud) {
    /#
        if (!isdefined(on_hud)) {
            on_hud = 0;
        }
        str_value = "<unknown string>";
        if (string::function_8345560e22fe3b10(str_name) != "<unknown string>") {
            str_value = string::rjust(str_name, 20);
            if (isdefined(value)) {
                str_value = str_value + "<unknown string>" + value;
            }
            str_value = str_value + "<unknown string>" + string::ljust("<unknown string>" + str_id + "<unknown string>", 30);
        }
        color = utility::ter_op(b_valid, (1, 1, 1), (1, 0, 0));
        if (on_hud) {
            printtoscreen2d(200, 100 + index * 25, str_value, color, 2);
        }
        print3d(self.origin - (0, 0, index * 8), str_value, color, 1, 0.3, 1);
    #/
}

