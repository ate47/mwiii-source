#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using script_3a9930dfe832ae05;
#using scripts\common\powerups.gsc;
#using script_16ea1b94f0f381b3;

#namespace double_points;

// Namespace double_points / namespace_64ac970ecb9e73c9
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x11b
// Size: 0x1c
function autoexec main() {
    if (getdvarint(@"hash_6a3719fb3017314", 0)) {
        return;
    }
    function_8680030b255bf011();
}

// Namespace double_points / namespace_64ac970ecb9e73c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f
// Size: 0x5e
function function_8680030b255bf011(var_40708f9ae5a8070e) {
    register_powerup("double_points", &grab_double_points);
    /#
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_b23a59dfb4ca49a1("<dev string:x2c>", "<dev string:x4c>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<dev string:x70>", "<dev string:x90>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

// Namespace double_points / namespace_64ac970ecb9e73c9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5
// Size: 0x7b
function grab_double_points(str_powerup, ent_powerup) {
    a_players = function_a56a8b17eae57b09(str_powerup);
    foreach (player in a_players) {
        player thread function_44e15a446f4d00a9();
    }
    level notify("zmb_double_points_level");
}

// Namespace double_points / namespace_64ac970ecb9e73c9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228
// Size: 0xcd
function function_44e15a446f4d00a9() {
    self notify("powerup doublepoints_active");
    self endon("powerup doublepoints_active");
    root = function_ecdae672c660149e();
    self [[ root.var_40708f9ae5a8070e ]](2);
    utility::function_f3bb4f4911a1beb2("powerup_double_points", "apply_effect");
    n_lifetime = root.powerups["double_points"].var_f862e718db266e0a;
    if (isdefined(level.powerup_timeout_override)) {
        n_lifetime = self [[ level.powerup_timeout_override ]](n_lifetime);
    }
    thread namespace_2b1145f62aa835b8::function_a93fbc5ac33fc2f2("double_points", n_lifetime);
    waittill_any_timeout_2(n_lifetime, "end_double_points", "death");
    if (isdefined(self)) {
        self [[ root.var_40708f9ae5a8070e ]](1);
        utility::function_f3bb4f4911a1beb2("powerup_double_points", "remove_effect");
    }
}

