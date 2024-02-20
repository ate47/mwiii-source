// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_3b64eb40368c1450;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_7956d56c4922bd1;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using script_860bfdfe82326e3;
#using script_3e31016b9c11a616;
#using script_2583ee5680cf4736;
#using scripts\mp\objidpoolmanager.gsc;
#using script_220d0eb95a8fab7d;
#using scripts\mp\hud_message.gsc;
#using script_58be75c518bf0d40;
#using scripts\mp\hud_util.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_53aac5ae7d2ac1b4;
#using scripts\common\vehicle_code.gsc;
#using script_4ef01fe6151dde4d;
#using script_3ab210ea917601e7;
#using script_64acb6ce534155b7;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\common\vehicle.gsc;
#using script_749ff6f56673a813;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_22f1701e151b9d12;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\mp_agent.gsc;
#using scripts\anim\utility_common.gsc;
#using script_371b4c2ab5861e62;
#using script_1f97a44d1761c919;

#namespace exfil;

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121d
// Size: 0x178
function init_exfil() {
    flag_init("exfil_initialized");
    namespace_70aa82e7f409bc33::function_86f446036c3c25a3(level.var_f823a30649b48284, level.var_3a96331857b5f453);
    function_8e0a16f0ca8e45e9("REV_OB_EXFIL", &function_4b7ee60fbfb23129);
    namespace_4164bc931714b00b::function_72f3dd0512f43c96("exfil", &function_a61e7ab12361f107);
    level.var_2562ea48235e90b5 = [];
    level.var_b8b3ed33712220d8 = [];
    level.var_44194c664b77bf1b = [];
    level.var_250dc4a23947d41 = [];
    level.var_dc9d9add8a02556a = 1;
    callback::add("player_spawned", &on_player_spawned);
    callback::add("player_disconnect", &on_player_disconnect);
    callback::add("on_ai_killed", &on_ai_killed);
    callback::add("on_zombie_ai_damaged", &on_ai_damaged);
    callback::add("on_turned", &function_65ec7747ff7a397a);
    setdvarifuninitialized(@"hash_bc321023e9100f4", 0);
    setdvarifuninitialized(@"hash_ab8956c864b4d3a4", 0);
    setdvarifuninitialized(@"hash_348544f95be5e424", 0);
    var_df3db7e4827942b6 = getentarray("walkable_heli_navmesh", "targetname");
    foreach (var_e9fc2f7678426142 in var_df3db7e4827942b6) {
        var_e9fc2f7678426142 notsolid();
        var_e9fc2f7678426142 hide();
    }
    level thread function_ec1e9e6af7af5cf();
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x139c
// Size: 0x19
function function_8d3b8265c47a2223() {
    if (getdvarint(@"hash_348544f95be5e424", 0)) {
        return 1;
    }
    return 0;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bd
// Size: 0x49
function function_4027f5445bb7c8fb(var_751df20fceaee5) {
    if (isdefined(var_751df20fceaee5) && isdefined(var_751df20fceaee5.instance) && is_equal(var_751df20fceaee5.instance.script_noteworthy, "quest_exfil")) {
        return 1;
    }
    return 0;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140e
// Size: 0x136
function function_3b7f6a9e23d14c41(var_751df20fceaee5) {
    var_751df20fceaee5 notify("endon_start_exfil_defend_mode");
    var_751df20fceaee5 endon("endon_start_exfil_defend_mode");
    while (!isdefined(var_751df20fceaee5.var_576f57af0204c38c)) {
        wait(0.5);
    }
    var_751df20fceaee5.var_576f57af0204c38c endon("death");
    if (!istrue(var_751df20fceaee5.var_1265336893f89f10)) {
        var_751df20fceaee5.var_576f57af0204c38c ent_flag_wait("landed");
    }
    var_514253bf9141a3c4 = isdefined(var_751df20fceaee5.var_81fff6332116316f) ? 35 : var_751df20fceaee5.var_81fff6332116316f;
    if (isdefined(var_751df20fceaee5.var_651b83653ae1f156)) {
        var_514253bf9141a3c4 = [[ var_751df20fceaee5.var_651b83653ae1f156 ]](var_751df20fceaee5);
    }
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        if (isalive(player) && player.sessionstate == "playing") {
            player thread function_836e4857db4bf132(var_514253bf9141a3c4, var_751df20fceaee5);
        }
    }
    level thread exfil_timer(var_751df20fceaee5, var_514253bf9141a3c4);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154b
// Size: 0x85
function function_4b7ee60fbfb23129() {
    function_89384091f7a2dbd("REV_OB_EXFIL", 0, &function_d7bf9b4af85cbf07);
    function_89384091f7a2dbd("REV_OB_EXFIL", 1, &function_45d940ec8c857432);
    function_89384091f7a2dbd("REV_OB_EXFIL", 2, &function_b256cf67627a5412);
    function_89384091f7a2dbd("REV_OB_EXFIL", 3, &function_10752dbaaf34420f);
    function_89384091f7a2dbd("REV_OB_EXFIL", 4, &function_ea8918a722bcbeed);
    if (isdefined(level.var_132e390bddaa01b5)) {
        function_89384091f7a2dbd("REV_OB_EXFIL", 5, level.var_132e390bddaa01b5);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d7
// Size: 0x4c
function function_415547ee4122c2ca() {
    difficulty_region = undefined;
    if (isdefined(level.var_fac39a693f085779)) {
        difficulty_region = [[ level.var_fac39a693f085779 ]](function_ea8918a722bcbeed());
    }
    if (!isdefined(difficulty_region) || is_equal(difficulty_region, "difficulty_undefined")) {
        return "difficulty_easy";
    }
    return difficulty_region;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162b
// Size: 0x1a
function function_d7bf9b4af85cbf07() {
    self.difficulty_region = function_415547ee4122c2ca();
    function_b6fc2c96b463c007(self);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164c
// Size: 0x28
function on_player_disconnect(params) {
    if (isdefined(self.var_a4408405ef23e289)) {
        self.var_a4408405ef23e289 delete();
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x167b
// Size: 0x55
function on_player_spawned(params) {
    self endon("death_or_disconnect");
    /#
        flag_wait("tag_origin");
        if (level.var_dc9d9add8a02556a && isarray(level.var_2562ea48235e90b5) && level.var_2562ea48235e90b5.size) {
            function_dc9d9add8a02556a();
        }
    #/
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16d7
// Size: 0x6b
function function_7d7775bea2f0ecca(str_name) {
    foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
        if (var_751df20fceaee5.name == str_name) {
            return var_751df20fceaee5;
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1749
// Size: 0xb7
function function_dd773e92c0ad5582(str_name, var_6f43094370856dfe, var_6f430a4370857031) {
    n_ent_num = 0;
    if (isdefined(var_6f43094370856dfe) && isdefined(var_6f430a4370857031)) {
        n_ent_num = int(var_6f430a4370857031);
    } else if (isdefined(var_6f43094370856dfe)) {
        n_ent_num = int(var_6f43094370856dfe);
    }
    foreach (player in level.players) {
        if (player.name == str_name || player getentitynumber() == n_ent_num) {
            return player;
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1807
// Size: 0x1f3
function function_a19741910eb710b4() {
    /#
        function_6e7290c8ee4f558b("visible");
        function_a9a864379a098ad6("on_exfil_start", "SHARED_HINTSTRINGS/EXFIL_OPT_IN", &function_a3523c367b28d76a, 1);
        function_fe953f000498048f();
        waitframe();
        function_6e7290c8ee4f558b("stop");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            var_751df20fceaee5 function_c4228da55910ea6b();
            function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "traverse_helicopter_rear_left_" + var_751df20fceaee5.name + "exfil_called_15_out", &function_29cada162a27a32);
        }
        function_fe953f000498048f();
        waitframe();
        function_6e7290c8ee4f558b("GAME_MODE");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            var_751df20fceaee5 function_c4228da55910ea6b();
            function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "traverse_helicopter_rear_left_" + var_751df20fceaee5.name + "on_exfil_complete_kill_count", &function_29cada162a27a32);
        }
        function_fe953f000498048f();
        function_6e7290c8ee4f558b("zombie");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            var_751df20fceaee5 function_c4228da55910ea6b();
            function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "<unknown string>" + var_751df20fceaee5.name + "on_exfil_complete_kill_count", &function_c68e0d71575a2ff4);
        }
        function_fe953f000498048f();
        waitframe();
        flag_set("tag_origin");
    #/
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a01
// Size: 0x7fb
function function_a3523c367b28d76a() {
    /#
        var_39239d1f90650b = (0, 0, 4);
        var_e33953429ed350f = 0.25;
        while (1) {
            foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
                if (!isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
                    continue;
                }
                var_d8b783bf56b63a71 = "<unknown string>";
                if (isent(var_751df20fceaee5.var_d182b8d3f3aaa93b.interact) && var_751df20fceaee5.var_d182b8d3f3aaa93b.interact tagexists("<unknown string>")) {
                    v_position = var_751df20fceaee5.var_d182b8d3f3aaa93b gettagorigin("<unknown string>");
                    var_d8b783bf56b63a71 = "<unknown string>";
                } else if (isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b.interact)) {
                    v_position = var_751df20fceaee5.var_d182b8d3f3aaa93b.interact.origin;
                } else {
                    v_position = var_751df20fceaee5.origin;
                }
                if (function_8d3b8265c47a2223()) {
                    var_10a09b4e9dcdf2ed = 394;
                } else {
                    var_10a09b4e9dcdf2ed = 64;
                }
                draw_circle(v_position, var_10a09b4e9dcdf2ed, (0, 0, 1), 1, 0, 1);
                sphere(v_position, 200, (0, 0, 1));
                print3d(v_position, "<unknown string>" + var_751df20fceaee5.name, (0, 1, 0), 1, var_e33953429ed350f);
                print3d(v_position - var_39239d1f90650b * 1, "<unknown string>" + var_751df20fceaee5.var_c9164736baf0694a.size, (0, 1, 0), 1, var_e33953429ed350f);
                print3d(v_position - var_39239d1f90650b * 2, "<unknown string>" + var_751df20fceaee5.var_953c0bb9dec80174.size, (0, 1, 0), 1, var_e33953429ed350f);
                print3d(v_position - var_39239d1f90650b * 3, "<unknown string>" + ter_op(istrue(var_751df20fceaee5.var_1326008dc390c510), "<unknown string>", "<unknown string>"), (0, 1, 0), 1, var_e33953429ed350f);
                if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572)) {
                    var_c566965043ea9831 = var_751df20fceaee5.var_55b9fdf7eacf9572.origin;
                    var_640b35adafbb5c65 = 0;
                    if (isdefined(var_751df20fceaee5.targetname) && isdefined(getstruct(var_751df20fceaee5.targetname + "<unknown string>", "<unknown string>"))) {
                        var_96f7284b1752c0c7 = getstruct(var_751df20fceaee5.targetname + "<unknown string>", "<unknown string>");
                        var_c566965043ea9831 = var_96f7284b1752c0c7.origin;
                    } else if (var_751df20fceaee5.var_55b9fdf7eacf9572 == var_751df20fceaee5) {
                        var_c566965043ea9831 = var_c566965043ea9831 - var_39239d1f90650b * 4;
                        var_640b35adafbb5c65 = 1;
                    }
                    if (var_640b35adafbb5c65) {
                        print3d(var_c566965043ea9831, "<unknown string>", (0, 1, 0), 1, var_e33953429ed350f);
                    } else {
                        draw_circle(var_c566965043ea9831, 200, (0, 0, 1), 1, 0, 1);
                        sphere(var_c566965043ea9831, 200, (0, 0, 1));
                        line(v_position, var_c566965043ea9831);
                        print3d(var_c566965043ea9831, "<unknown string>" + var_751df20fceaee5.name, (0, 1, 0), 1, var_e33953429ed350f);
                    }
                    if (!function_8d3b8265c47a2223()) {
                        print3d(var_c566965043ea9831 - var_39239d1f90650b * 1, "<unknown string>" + function_9621ef0d09be048d(var_751df20fceaee5), (0, 1, 0), 1, var_e33953429ed350f);
                    }
                } else if (isdefined(var_751df20fceaee5.target2)) {
                    var_7b0a39123a9c2f88 = getstructarray(var_751df20fceaee5.target2, "<unknown string>");
                    foreach (n_index, var_55b9fdf7eacf9572 in var_7b0a39123a9c2f88) {
                        draw_circle(var_55b9fdf7eacf9572.origin, 200, (1, 0, 0), 1, 0, 1);
                        sphere(var_55b9fdf7eacf9572.origin, 200, (1, 0, 0));
                        line(v_position, var_55b9fdf7eacf9572.origin);
                        print3d(var_55b9fdf7eacf9572.origin, "<unknown string>" + n_index + "<unknown string>" + var_751df20fceaee5.name, (0, 1, 0), 1, var_e33953429ed350f);
                    }
                }
                foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
                    if (isplayer(player)) {
                        print3d(player.origin, "<unknown string>" + var_751df20fceaee5.name, (0, 1, 0), 1, var_e33953429ed350f);
                    }
                }
                var_751df20fceaee5.var_ed2b93690e12fb86 = array_removedead_or_dying(var_751df20fceaee5.var_ed2b93690e12fb86);
                foreach (ai in var_751df20fceaee5.var_ed2b93690e12fb86) {
                    if (isalive(ai)) {
                        print3d(ai.origin, "<unknown string>" + var_751df20fceaee5.name, (0, 1, 0), 1, var_e33953429ed350f);
                        print3d(ai.origin - var_39239d1f90650b, "<unknown string>" + var_751df20fceaee5.var_ed2b93690e12fb86.size, (0, 1, 0), 1, var_e33953429ed350f);
                    }
                }
                if (isdefined(var_751df20fceaee5.var_576f57af0204c38c)) {
                    draw_circle(var_751df20fceaee5.var_576f57af0204c38c.origin, 500, (0, 1, 0), 1, 0, 1);
                    print3d(var_751df20fceaee5.var_576f57af0204c38c.origin, var_751df20fceaee5.var_576f57af0204c38c vehicle_getspeed() + "<unknown string>", (0, 1, 0), 1, var_e33953429ed350f * 4);
                    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572)) {
                        line(var_751df20fceaee5.var_576f57af0204c38c.origin, var_751df20fceaee5.var_55b9fdf7eacf9572.origin, (0, 1, 0));
                        var_4163a1f601f054ed = var_751df20fceaee5.var_576f57af0204c38c vehicle_getspeed();
                        if (var_4163a1f601f054ed > 0) {
                            var_2b2e9399c3f18884 = distance(var_751df20fceaee5.var_576f57af0204c38c.origin, var_751df20fceaee5.var_55b9fdf7eacf9572.origin) / 63360;
                            var_465c08a30c93971a = var_2b2e9399c3f18884 / var_4163a1f601f054ed;
                            var_465c08a30c93971a = var_465c08a30c93971a * 3600;
                            print3d(var_751df20fceaee5.var_576f57af0204c38c.origin - var_39239d1f90650b, "<unknown string>" + var_465c08a30c93971a + "<unknown string>", (0, 1, 0), 1, var_e33953429ed350f * 4);
                        }
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2203
// Size: 0x436
function function_dc9d9add8a02556a() {
    /#
        if (istrue(self.var_fe5253691314ec55)) {
            return;
        }
        self.var_fe5253691314ec55 = 1;
        var_3352bf952cfc182a = function_53c4c53197386572(self.name, "<unknown string>" + self getentitynumber());
        function_6e7290c8ee4f558b("<unknown string>" + var_3352bf952cfc182a + "<unknown string>");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            if (isdefined(var_751df20fceaee5.target2)) {
                var_fb43e2df572cabdf = getstructarray(var_751df20fceaee5.target2, "<unknown string>");
                foreach (n_index, var_55b9fdf7eacf9572 in var_fb43e2df572cabdf) {
                    function_b23a59dfb4ca49a1(var_751df20fceaee5.name + "<unknown string>" + n_index + "<unknown string>", "<unknown string>" + var_751df20fceaee5.name + "<unknown string>" + var_3352bf952cfc182a + "<unknown string>" + n_index + "<unknown string>" + self getentitynumber(), &function_e86085969e06a72f);
                }
            } else {
                function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "<unknown string>" + var_751df20fceaee5.name + "<unknown string>" + var_3352bf952cfc182a + "<unknown string>" + self getentitynumber(), &function_e86085969e06a72f);
            }
        }
        function_fe953f000498048f();
        waitframe();
        function_6e7290c8ee4f558b("<unknown string>" + var_3352bf952cfc182a + "<unknown string>");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "<unknown string>" + var_751df20fceaee5.name + "<unknown string>" + var_3352bf952cfc182a + "<unknown string>" + self getentitynumber(), &function_125c8891683ddba9);
        }
        function_fe953f000498048f();
        waitframe();
        function_6e7290c8ee4f558b("<unknown string>" + var_3352bf952cfc182a + "<unknown string>");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "<unknown string>" + var_751df20fceaee5.name + "<unknown string>" + var_3352bf952cfc182a + "<unknown string>" + self getentitynumber(), &function_419da4ebcd2d6a49);
        }
        function_fe953f000498048f();
        waitframe();
        function_6e7290c8ee4f558b("<unknown string>" + var_3352bf952cfc182a + "<unknown string>");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "<unknown string>" + var_751df20fceaee5.name + "<unknown string>" + var_3352bf952cfc182a + "<unknown string>" + self getentitynumber(), &function_adcb708587848ffb);
        }
        function_fe953f000498048f();
        function_6e7290c8ee4f558b("<unknown string>" + var_3352bf952cfc182a + "<unknown string>");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "<unknown string>" + var_751df20fceaee5.name + "<unknown string>" + var_3352bf952cfc182a + "<unknown string>" + self getentitynumber(), &function_7ce9ab45ae5f8406);
        }
        function_fe953f000498048f();
    #/
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2640
// Size: 0xac
function function_e86085969e06a72f(params) {
    /#
        var_751df20fceaee5 = function_7d7775bea2f0ecca(params[0]);
        player = function_dd773e92c0ad5582(params[1], params[2], params[3]);
        if (isdefined(var_751df20fceaee5)) {
            if (isdefined(params[2]) && isdefined(params[3])) {
                var_751df20fceaee5.var_2c60ad87c1ee7615 = int(params[2]);
            }
            setdvar(@"hash_bc321023e9100f4", 1);
            var_751df20fceaee5.b_disabled = undefined;
            var_751df20fceaee5 function_2e0dc001c9a5c661();
            var_751df20fceaee5.var_d182b8d3f3aaa93b.interact function_a1778cdfcc8373ae(player);
        }
    #/
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26f3
// Size: 0x4a
function function_125c8891683ddba9(params) {
    /#
        var_751df20fceaee5 = function_7d7775bea2f0ecca(params[0]);
        player = function_dd773e92c0ad5582(params[1], params[2]);
        player.var_43ca0dfb1b29c6ff = 1;
    #/
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2744
// Size: 0x4a
function function_419da4ebcd2d6a49(params) {
    /#
        var_751df20fceaee5 = function_7d7775bea2f0ecca(params[0]);
        player = function_dd773e92c0ad5582(params[1], params[2]);
        player.var_fc0a0836d3931cdb = 1;
    #/
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2795
// Size: 0x93
function function_29cada162a27a32(params) {
    /#
        var_751df20fceaee5 = function_7d7775bea2f0ecca(params[0]);
        if (!isdefined(var_751df20fceaee5) || !istrue(var_751df20fceaee5.var_1326008dc390c510)) {
            return;
        }
        if (params[1] == "<unknown string>") {
            function_ae18d20050b99c2(var_751df20fceaee5);
            var_751df20fceaee5.n_kills = function_5cdb6bf616f071c2(var_751df20fceaee5);
            var_751df20fceaee5.var_18da16a5ee3e8314 namespace_3ab0c2d9cd55890e::function_82a2f59593fe059e("<unknown string>", function_9621ef0d09be048d(var_751df20fceaee5));
            function_303cb92b5afb6e87(var_751df20fceaee5);
        } else {
            var_751df20fceaee5 notify("<unknown string>");
        }
    #/
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x282f
// Size: 0x5c
function function_c68e0d71575a2ff4(params) {
    /#
        var_751df20fceaee5 = function_7d7775bea2f0ecca(params[0]);
        if (!isdefined(var_751df20fceaee5) || !istrue(var_751df20fceaee5.var_1326008dc390c510)) {
            return;
        }
        if (isdefined(var_751df20fceaee5.var_576f57af0204c38c)) {
            var_751df20fceaee5.var_576f57af0204c38c function_b7edf3fe42e320a6(var_751df20fceaee5);
        }
    #/
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2892
// Size: 0x8a
function function_adcb708587848ffb(params) {
    /#
        var_751df20fceaee5 = function_7d7775bea2f0ecca(params[0]);
        player = function_dd773e92c0ad5582(params[1], params[2]);
        if (isdefined(var_751df20fceaee5.var_576f57af0204c38c)) {
            if (function_18a23b9f6568641e()) {
                var_751df20fceaee5.var_576f57af0204c38c thread function_59e7feccaa753a46(player, 1);
            } else {
                var_751df20fceaee5.var_576f57af0204c38c.interact function_ef855ac387639af6(player);
            }
        }
    #/
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2923
// Size: 0x71
function function_7ce9ab45ae5f8406(params) {
    /#
        var_751df20fceaee5 = function_7d7775bea2f0ecca(params[0]);
        player = function_dd773e92c0ad5582(params[1], params[2]);
        if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572) && isplayer(player)) {
            player setorigin(var_751df20fceaee5.var_55b9fdf7eacf9572.origin);
        }
    #/
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x299b
// Size: 0x433
function function_ec1e9e6af7af5cf() {
    level endon("game_ended");
    wait(1);
    if (isdefined(level.var_5924b0bd99878b50) && !getdvarint(@"hash_ee51e09f87ec1371", 0)) {
        var_85cda42514dc11d2 = [[ level.var_5924b0bd99878b50 ]]();
        if (var_85cda42514dc11d2 > 0) {
            wait(var_85cda42514dc11d2);
        }
    }
    var_89a48fee7588a0ac = getstructarray("content_destination", "variantname");
    foreach (destination in var_89a48fee7588a0ac) {
        if (is_equal(destination.script_noteworthy, "quest_destination")) {
            continue;
        }
        level thread function_cb80f3df972cd7d4(destination);
    }
    wait(0.5);
    level.var_2562ea48235e90b5 = array_randomize(level.var_2562ea48235e90b5);
    if (function_8d3b8265c47a2223()) {
        if (getdvarint(@"hash_ee51e09f87ec1371", 0)) {
            foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
                var_751df20fceaee5 function_2e0dc001c9a5c661();
                level thread function_53350420745f6c60(var_751df20fceaee5);
            }
            var_6c259ac96406b5a3 = level.var_2562ea48235e90b5;
            if (isdefined(level.var_8873839ca6498959)) {
                var_6b64c68d444fc421 = [[ level.var_8873839ca6498959 ]](var_6c259ac96406b5a3);
                foreach (var_751df20fceaee5 in var_6b64c68d444fc421) {
                    var_751df20fceaee5.b_disabled = 0;
                }
            }
        } else {
            var_6c259ac96406b5a3 = [];
            foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
                if (!isdefined(var_751df20fceaee5.script_parameters) || var_751df20fceaee5.script_parameters != "disabled") {
                    var_6c259ac96406b5a3[var_6c259ac96406b5a3.size] = var_751df20fceaee5;
                }
            }
            if (isdefined(level.var_8873839ca6498959)) {
                var_6b64c68d444fc421 = [[ level.var_8873839ca6498959 ]](var_6c259ac96406b5a3);
                foreach (var_751df20fceaee5 in var_6b64c68d444fc421) {
                    var_751df20fceaee5.b_disabled = 0;
                }
                namespace_cfae3bfa0fa8d1dd::reservevehicle(var_6b64c68d444fc421.size);
            } else {
                var_c0f5102d47ed1ec3 = 0;
                foreach (var_751df20fceaee5 in var_6c259ac96406b5a3) {
                    var_751df20fceaee5.b_disabled = 0;
                    var_c0f5102d47ed1ec3 = var_c0f5102d47ed1ec3 + 1;
                    if (var_c0f5102d47ed1ec3 >= 4) {
                        break;
                    }
                }
            }
            foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
                if (!isdefined(var_751df20fceaee5.b_disabled)) {
                    var_751df20fceaee5.b_disabled = 1;
                }
                var_751df20fceaee5 function_2e0dc001c9a5c661();
                if (!var_751df20fceaee5.b_disabled) {
                    level thread function_53350420745f6c60(var_751df20fceaee5);
                }
            }
        }
    } else {
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            var_751df20fceaee5 function_2e0dc001c9a5c661();
        }
    }
    wait(1);
    flag_set("exfil_initialized");
    /#
        function_a19741910eb710b4();
    #/
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd5
// Size: 0xfd
function function_cb80f3df972cd7d4(destination) {
    if (!isdefined(destination.locations)) {
        /#
            assertmsg("No content_location structs associated with content_destination struct " + destination.targetname);
        #/
        return;
    }
    foreach (location in destination.locations) {
        var_dc7002eba85cb997 = location.instances["exfil"];
        if (isdefined(var_dc7002eba85cb997)) {
            foreach (instance in var_dc7002eba85cb997.var_67b2b78e28eaa758) {
                namespace_4164bc931714b00b::function_7e2984b7610f3616(instance);
            }
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ed9
// Size: 0x175
function function_a61e7ab12361f107(instance) {
    if (isarray(instance.var_305e36cbb51f88ce["exfil_interact"])) {
        var_d142d9da844b0025 = getdvar(@"hash_e497b4cbd51708bd", "");
        var_71b80581febb7711 = strtok(var_d142d9da844b0025, ",");
        level.var_2562ea48235e90b5 = array_combine_unique(level.var_2562ea48235e90b5, instance.var_305e36cbb51f88ce["exfil_interact"]);
        str_destination = instance.location.destination.targetname;
        foreach (var_751df20fceaee5 in instance.var_305e36cbb51f88ce["exfil_interact"]) {
            var_751df20fceaee5.instance = instance;
            var_751df20fceaee5.str_destination = str_destination;
            level.var_b8b3ed33712220d8[str_destination] = function_6d6af8144a5131f1(level.var_b8b3ed33712220d8[str_destination], var_751df20fceaee5);
            if (var_71b80581febb7711.size && isdefined(var_751df20fceaee5.targetname) && function_fc64178f71375137(var_71b80581febb7711, var_751df20fceaee5.targetname)) {
                var_751df20fceaee5.script_parameters = "disabled";
            }
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3055
// Size: 0x66
function function_7d45a9e5bf7a3d3e(var_751df20fceaee5) {
    var_4a06475b75dd7646 = function_53c4c53197386572(level.var_3a96331857b5f453, "REV_OB_EXFIL");
    if (isdefined(var_751df20fceaee5) && isdefined(var_751df20fceaee5.var_8d00284a103c5803)) {
        var_4a06475b75dd7646 = var_751df20fceaee5.var_8d00284a103c5803;
    }
    var_6f7e6fb7938bbea2 = namespace_c8e2077fca5ac679::function_3fe7cd75f13c980b(var_4a06475b75dd7646);
    return namespace_c8e2077fca5ac679::function_b9c4aa88ad97ee68(var_6f7e6fb7938bbea2);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c3
// Size: 0x5a
function function_c4228da55910ea6b() {
    if (!isdefined(self.name)) {
        level.var_43add10cc0e80a42 = function_53c4c53197386572(level.var_43add10cc0e80a42, 0);
        self.name = function_53c4c53197386572(self.targetname, "Exfil_" + level.var_43add10cc0e80a42);
        level.var_43add10cc0e80a42++;
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3124
// Size: 0x43f
function function_2e0dc001c9a5c661() {
    var_cad2ff0bf935f3d4 = function_7d45a9e5bf7a3d3e(self);
    self.var_2a1eeca3276ddc4c = function_53c4c53197386572(var_cad2ff0bf935f3d4.var_44e5ab6b68eae86, "tag_origin");
    if (function_8d3b8265c47a2223()) {
        self.radius = function_53c4c53197386572(self.radius, 394);
    } else {
        self.radius = function_53c4c53197386572(self.radius, 64);
    }
    self.angles = function_53c4c53197386572(self.angles, (0, 0, 0));
    self.var_953c0bb9dec80174 = [];
    self.var_c9164736baf0694a = [];
    self.var_ed2b93690e12fb86 = [];
    self.var_fb43e2df572cabdf = [];
    self.n_kills = 0;
    self.var_6e5b4d39d36d4d34 = 0;
    function_360cc0762c8f8dc6(0, self);
    function_c4228da55910ea6b();
    if (function_8d3b8265c47a2223()) {
        self.origin = getgroundposition(self.origin + (0, 0, 8), 16) + (0, 0, 2);
    }
    function_5169ff9e47582e7a(self);
    if (!isdefined(self.var_d182b8d3f3aaa93b.interact)) {
        if (isent(self.var_d182b8d3f3aaa93b) && !function_4027f5445bb7c8fb(self)) {
            self.var_d182b8d3f3aaa93b.interact = namespace_5775ad2badedbcaa::function_90472496b91b94b3(self.var_d182b8d3f3aaa93b, self.radius, &function_a1778cdfcc8373ae, function_53c4c53197386572(level.var_7cc298fa98ce0c7a, "SHARED_HINTSTRINGS/EXFIL_START_USE_GENERIC"));
            self.var_d182b8d3f3aaa93b.interact sethintonobstruction("show");
        } else {
            self.var_d182b8d3f3aaa93b.interact = namespace_5775ad2badedbcaa::function_32645103f7520635(self.var_d182b8d3f3aaa93b, &function_a1778cdfcc8373ae);
        }
    }
    if (isent(self.var_d182b8d3f3aaa93b.interact) && !function_4027f5445bb7c8fb(self)) {
        self.var_d182b8d3f3aaa93b.interact setuseholdduration(1500);
        if (self.var_d182b8d3f3aaa93b.interact tagexists("tag_hint")) {
            self.var_d182b8d3f3aaa93b.interact sethinttag("tag_hint");
        }
    } else {
        self.var_d182b8d3f3aaa93b.interact utility::function_3677f2be30fdd581("cp_mp_exfil_site", "ready");
    }
    self.var_d182b8d3f3aaa93b.interact.var_751df20fceaee5 = self;
    if (function_8d3b8265c47a2223()) {
        function_9cf09a569caf1a26(self);
        self.var_55b9fdf7eacf9572 = random(self.var_fb43e2df572cabdf);
        function_871ded736cf89cc4(self);
        self.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b setscriptablepartstate("cp_mp_exfil_icon", "default_icon");
    }
    if (istrue(self.b_disabled)) {
        if (isdefined(self.var_d182b8d3f3aaa93b.interact)) {
            if (isent(self.var_d182b8d3f3aaa93b.interact)) {
                self.var_d182b8d3f3aaa93b.interact delete();
            } else {
                self.var_d182b8d3f3aaa93b.interact freescriptable();
            }
        }
        if (isdefined(self.var_d182b8d3f3aaa93b)) {
            if (isent(self.var_d182b8d3f3aaa93b)) {
                self.var_d182b8d3f3aaa93b delete();
            } else {
                self.var_d182b8d3f3aaa93b freescriptable();
            }
        }
        if (isdefined(self.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b)) {
            if (isent(self.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b)) {
                self.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b delete();
            } else {
                self.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b freescriptable();
            }
        }
        return;
    }
    level.var_44194c664b77bf1b[level.var_44194c664b77bf1b.size] = self;
    function_e3ba83b1bb428b8e();
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x356a
// Size: 0x117
function function_5169ff9e47582e7a(var_751df20fceaee5) {
    if (!isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
        if (function_4027f5445bb7c8fb(var_751df20fceaee5) && isdefined(var_751df20fceaee5.var_1f97475ff2d69ebf)) {
            var_751df20fceaee5.var_d182b8d3f3aaa93b = namespace_4164bc931714b00b::spawn_script_model(var_751df20fceaee5, var_751df20fceaee5.var_1f97475ff2d69ebf, 0, 1);
            params = spawnstruct();
            params.var_d182b8d3f3aaa93b = var_751df20fceaee5.var_d182b8d3f3aaa93b;
            callback::callback("quest_exfil_spawned", params);
        } else if (function_8d3b8265c47a2223()) {
            if (!isdefined(level.var_f08929157ba33935)) {
                level.var_f08929157ba33935 = "cp_mp_exfil_site_entityless";
            }
            var_751df20fceaee5.var_d182b8d3f3aaa93b = spawnscriptable(level.var_f08929157ba33935, var_751df20fceaee5.origin, var_751df20fceaee5.angles);
        } else {
            var_751df20fceaee5.var_d182b8d3f3aaa93b = namespace_4164bc931714b00b::spawn_script_model(var_751df20fceaee5, var_751df20fceaee5.var_2a1eeca3276ddc4c, 0, 1);
        }
    }
    namespace_a655003e419fc731::function_6b9641d0060c3a2c(var_751df20fceaee5.var_d182b8d3f3aaa93b);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3688
// Size: 0x91
function function_871ded736cf89cc4(var_751df20fceaee5) {
    if (!isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b)) {
        if (function_8d3b8265c47a2223() && isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
            var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b = var_751df20fceaee5.var_d182b8d3f3aaa93b;
        } else {
            var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b = namespace_4164bc931714b00b::spawn_script_model(var_751df20fceaee5.var_55b9fdf7eacf9572, "cp_mp_exfil_site_xmodel", 0, 1);
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3720
// Size: 0xfa
function function_e3ba83b1bb428b8e() {
    if (isdefined(level.var_5533a67bdfed946d)) {
        self.var_d182b8d3f3aaa93b thread [[ level.var_5533a67bdfed946d ]]();
        return;
    }
    var_93d6759e8f6864fd = "ui_map_icon_cp_mp_exfil";
    if (function_4027f5445bb7c8fb(self)) {
        var_93d6759e8f6864fd = "ui_map_icon_ob_quest_exfil";
    }
    if (istrue(level.var_a77333195caab0e3)) {
        n_obj_id = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
        self.var_d182b8d3f3aaa93b.n_obj_id = n_obj_id;
        namespace_5a22b6f3a56f7e9b::objective_add_objective(n_obj_id, "invisible", self.var_d182b8d3f3aaa93b.origin, var_93d6759e8f6864fd, "icon_regular");
        if (isent(self.var_d182b8d3f3aaa93b)) {
            namespace_5a22b6f3a56f7e9b::update_objective_onentity(n_obj_id, self.var_d182b8d3f3aaa93b);
        }
        namespace_5a22b6f3a56f7e9b::function_c3c6bff089dfdd34(n_obj_id, "icon_regular");
        objective_setlabel(n_obj_id, "SHARED_HINTSTRINGS/EXFIL");
        objective_setplayintro(n_obj_id, 0);
        self.var_d182b8d3f3aaa93b thread function_b67571ea5e759130(1024);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3821
// Size: 0x1fb
function function_b67571ea5e759130(n_distance) {
    self notify("end_exfil_interact_objective_distance");
    self endon("death");
    self endon("end_exfil_interact_objective_distance");
    if (!isdefined(self.n_obj_id)) {
        return;
    }
    n_obj_id = self.n_obj_id;
    var_8a342cea9420741a = n_distance * n_distance;
    while (1) {
        objective_showtoplayersinmask(n_obj_id);
        foreach (player in level.players) {
            if (!isplayer(player)) {
                continue;
            }
            if (isdefined(level.var_d8b6115a502e7e76)) {
                if (!self [[ level.var_d8b6115a502e7e76 ]](player)) {
                    if (isdefined(self.var_751df20fceaee5.var_35e7c712de6487f6)) {
                        self.var_751df20fceaee5.var_35e7c712de6487f6 setscriptablepartstate("content_interact", "hidden");
                    }
                    self disableplayeruse(player);
                    objective_removeclientfrommask(n_obj_id, player);
                    continue;
                }
                self enableplayeruse(player);
                if (isdefined(self.var_751df20fceaee5.var_35e7c712de6487f6)) {
                    self.var_751df20fceaee5.var_35e7c712de6487f6 setscriptablepartstate("content_interact", "visible");
                }
            }
            if (player function_aa1f91da154a3d90()) {
                objective_removeclientfrommask(n_obj_id, player);
            } else if (isdefined(self.var_751df20fceaee5) && (istrue(self.var_751df20fceaee5.var_1326008dc390c510) || istrue(self.var_751df20fceaee5.b_disabled))) {
                objective_removeclientfrommask(n_obj_id, player);
            } else {
                if (distancesquared(player.origin, self.origin) <= var_8a342cea9420741a) {
                    objective_addclienttomask(n_obj_id, player);
                } else {
                    objective_removeclientfrommask(n_obj_id, player);
                }
                waitframe();
            }
        }
        wait(0.5);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a23
// Size: 0x14f
function function_a1778cdfcc8373ae(player) {
    if (!isdefined(self.var_751df20fceaee5) || istrue(self.var_751df20fceaee5.var_1326008dc390c510)) {
        if (isdefined(self.var_751df20fceaee5)) {
            logstring("==CPMP EXFIL: Exfil " + self.var_751df20fceaee5.name + " is already active and was never properly reset!");
        } else {
            logstring("==CPMP Exfil: Exfil at " + player.origin + " does not have a valid struct assigned!");
        }
        return;
    }
    if (isdefined(level.var_d8b6115a502e7e76)) {
        if (!self [[ level.var_d8b6115a502e7e76 ]](player)) {
            if (isent(self)) {
                self playsoundtoplayer("ui_zm_core_door_purchase_deny", player);
            }
            return;
        }
    }
    if (istrue(level.var_319c5fcabbf91284) && isdefined(level.var_867a2a58a53c66f2)) {
        params = spawnstruct();
        params.var_751df20fceaee5 = self.var_751df20fceaee5;
        if (!player [[ level.var_867a2a58a53c66f2 ]](#"hash_eea98455a74fc364", params)) {
            return;
        }
    }
    level.var_44194c664b77bf1b = array_remove(level.var_44194c664b77bf1b, self.var_751df20fceaee5);
    function_555064e06fc5f4b3(0);
    level thread exfil_start(self.var_751df20fceaee5, player);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b79
// Size: 0x66
function function_555064e06fc5f4b3(var_316a6ff3dd821de6) {
    if (!isdefined(var_316a6ff3dd821de6)) {
        var_316a6ff3dd821de6 = 1;
    }
    if (isent(self) && !function_4027f5445bb7c8fb(self.var_751df20fceaee5)) {
        self function_dfb78b3e724ad620(var_316a6ff3dd821de6);
    } else if (var_316a6ff3dd821de6) {
        utility::function_3677f2be30fdd581("cp_mp_exfil_site", "ready");
    } else {
        utility::function_3677f2be30fdd581("cp_mp_exfil_site", "standby");
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be6
// Size: 0x22
function function_aa1f91da154a3d90() {
    if (isdefined(self.var_751df20fceaee5) || istrue(self.var_fd7c2a423b7a47a5)) {
        return 1;
    }
    return 0;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c10
// Size: 0x19
function function_18a23b9f6568641e() {
    if (getdvarint(@"hash_ab8956c864b4d3a4", 0)) {
        return 1;
    }
    return 0;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c31
// Size: 0x38
function function_360cc0762c8f8dc6(n_spawns, var_751df20fceaee5) {
    var_751df20fceaee5 = function_53c4c53197386572(var_751df20fceaee5, level.var_980b9351a7816ae8);
    if (isdefined(var_751df20fceaee5)) {
        var_751df20fceaee5.var_6a8db94b5533083c = n_spawns;
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c70
// Size: 0x37
function function_5cdb6bf616f071c2(var_751df20fceaee5) {
    var_751df20fceaee5 = function_53c4c53197386572(var_751df20fceaee5, level.var_980b9351a7816ae8);
    if (isdefined(var_751df20fceaee5)) {
        return function_53c4c53197386572(var_751df20fceaee5.var_6a8db94b5533083c, 0);
    }
    return 0;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3caf
// Size: 0x44
function function_a374bb164261c788(var_751df20fceaee5) {
    var_751df20fceaee5 = function_53c4c53197386572(var_751df20fceaee5, level.var_980b9351a7816ae8);
    var_df6b5557dbf001d3 = function_5cdb6bf616f071c2(var_751df20fceaee5);
    if (var_751df20fceaee5.var_6e5b4d39d36d4d34 >= var_df6b5557dbf001d3) {
        return 1;
    }
    return 0;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cfb
// Size: 0x62
function function_e1a9c5d3a4c2a90b(var_751df20fceaee5) {
    var_751df20fceaee5 = function_53c4c53197386572(var_751df20fceaee5, level.var_980b9351a7816ae8);
    if (isdefined(var_751df20fceaee5) && isarray(var_751df20fceaee5.var_ed2b93690e12fb86)) {
        var_751df20fceaee5.var_ed2b93690e12fb86 = array_removedead_or_dying(var_751df20fceaee5.var_ed2b93690e12fb86);
        return var_751df20fceaee5.var_ed2b93690e12fb86.size;
    }
    return 0;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d65
// Size: 0x30
function function_76a9bc9a24e5cffb(var_751df20fceaee5) {
    var_751df20fceaee5 = function_53c4c53197386572(var_751df20fceaee5, level.var_980b9351a7816ae8);
    if (isdefined(var_751df20fceaee5)) {
        return var_751df20fceaee5.n_kills;
    }
    return 0;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d9d
// Size: 0x34
function function_9621ef0d09be048d(var_751df20fceaee5) {
    var_751df20fceaee5 = function_53c4c53197386572(var_751df20fceaee5, level.var_980b9351a7816ae8);
    if (isdefined(var_751df20fceaee5)) {
        return (function_5cdb6bf616f071c2(var_751df20fceaee5) - function_76a9bc9a24e5cffb(var_751df20fceaee5));
    }
    return 0;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dd9
// Size: 0x3
function function_45d940ec8c857432() {
    
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3de3
// Size: 0x3
function function_b256cf67627a5412() {
    
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ded
// Size: 0x8d
function function_ea8918a722bcbeed() {
    if (isdefined(self.var_751df20fceaee5)) {
        if (isdefined(self.var_751df20fceaee5.var_55b9fdf7eacf9572)) {
            return self.var_751df20fceaee5.var_55b9fdf7eacf9572.origin;
        } else {
            return self.var_751df20fceaee5.origin;
        }
    } else if (isdefined(level.var_980b9351a7816ae8)) {
        return level.var_980b9351a7816ae8.origin;
    }
    return (0, 0, 0);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e82
// Size: 0x4c2
function exfil_start(var_751df20fceaee5, var_985e82f034f67960) {
    level flag_set("exfil_start");
    level.var_980b9351a7816ae8 = var_751df20fceaee5;
    var_751df20fceaee5.var_1326008dc390c510 = 1;
    var_4a06475b75dd7646 = function_53c4c53197386572(level.var_3a96331857b5f453, "REV_OB_EXFIL");
    if (isdefined(var_751df20fceaee5.var_8d00284a103c5803)) {
        var_4a06475b75dd7646 = var_751df20fceaee5.var_8d00284a103c5803;
    }
    var_751df20fceaee5.var_18da16a5ee3e8314 = namespace_68dc261109a9503f::function_67f4d8928c638abb("REV_OB_EXFIL", var_4a06475b75dd7646);
    var_751df20fceaee5.var_18da16a5ee3e8314.var_751df20fceaee5 = var_751df20fceaee5;
    var_751df20fceaee5.var_985e82f034f67960 = var_985e82f034f67960;
    var_676b838fa769666b = function_72f374c6e3031639(var_751df20fceaee5, var_985e82f034f67960);
    var_751df20fceaee5.var_c9164736baf0694a = array_removeundefined(var_751df20fceaee5.var_c9164736baf0694a);
    if (!var_751df20fceaee5.var_c9164736baf0694a.size || isdefined(var_676b838fa769666b) && !var_676b838fa769666b) {
        var_751df20fceaee5.var_1326008dc390c510 = undefined;
        foreach (player in var_751df20fceaee5.var_953c0bb9dec80174) {
            player.var_751df20fceaee5 = undefined;
        }
        var_751df20fceaee5.var_985e82f034f67960 = undefined;
        if (isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
            var_751df20fceaee5.var_d182b8d3f3aaa93b notify("end_exfil_interact_objective_distance");
        }
        if (!istrue(level.var_1e47df2ee21ee5d6)) {
            if (function_8d3b8265c47a2223()) {
                var_136f67d0e18850d3 = 1;
            } else {
                var_136f67d0e18850d3 = getdvarint(@"hash_62412da41b8eaf67", 60);
            }
            logstring("==CPMP Exfil: Exfil " + var_751df20fceaee5.name + " will reset in " + var_136f67d0e18850d3 + " seconds!");
            level delaythread(var_136f67d0e18850d3, &reset_exfil, var_751df20fceaee5);
        }
        logstring("==CPMP Exfil: Exfil " + var_751df20fceaee5.name + " was unable to be opted into! Resetting Exfil in " + 60 + " seconds");
        level flag_clear("exfil_start");
        return;
    }
    level callback::callback("on_exfil_start", var_751df20fceaee5);
    var_751df20fceaee5.b_disabled = undefined;
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572) && isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b)) {
    }
    if (function_4027f5445bb7c8fb(var_751df20fceaee5)) {
        if (isdefined(level.var_4dc2d161649b3568)) {
            self thread [[ level.var_4dc2d161649b3568 ]](var_751df20fceaee5, var_985e82f034f67960);
        }
    } else {
        if (!isdefined(var_751df20fceaee5.var_64f10a0f19df265f)) {
            var_751df20fceaee5.var_64f10a0f19df265f = "exfil_called_acknowledged";
        }
        var_751df20fceaee5.var_c9164736baf0694a thread delaythread(3.5, &function_895c7e0e9911ff6e, var_751df20fceaee5, var_751df20fceaee5.var_64f10a0f19df265f);
        foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
            player callback::callback("exfil_acknowledged");
        }
    }
    if (isdefined(level.var_55a32133643b9217)) {
        level thread [[ level.var_55a32133643b9217 ]](var_751df20fceaee5, var_985e82f034f67960);
        return;
    }
    function_9cf09a569caf1a26(var_751df20fceaee5);
    var_751df20fceaee5.var_55b9fdf7eacf9572 = function_a5c4615f0b00ff83(var_751df20fceaee5);
    var_751df20fceaee5.var_55b9fdf7eacf9572.angles = function_53c4c53197386572(var_751df20fceaee5.var_55b9fdf7eacf9572.angles, (0, 0, 0));
    var_751df20fceaee5.var_55b9fdf7eacf9572.var_1326008dc390c510 = 1;
    var_514253bf9141a3c4 = function_890f1e94c79decb(var_751df20fceaee5);
    var_751df20fceaee5.n_time_remaining = var_514253bf9141a3c4;
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        if (isalive(player) && player.sessionstate == "playing") {
            if (!function_8d3b8265c47a2223()) {
                player thread function_836e4857db4bf132(var_514253bf9141a3c4, var_751df20fceaee5);
            }
            player thread function_689f5a3123aba709(var_751df20fceaee5);
        }
    }
    level thread function_2503b81a18276e3f(var_751df20fceaee5, var_985e82f034f67960);
    level thread function_367542eff2c7e695(var_751df20fceaee5, var_985e82f034f67960);
    level thread function_3c0534cf6dbf9399(var_751df20fceaee5);
    if (!function_8d3b8265c47a2223()) {
        level thread exfil_timer(var_751df20fceaee5, var_514253bf9141a3c4);
    }
    level thread function_748fd8b59180efd1(var_751df20fceaee5);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x434b
// Size: 0x41d
function function_1590a66b9f6c2c3b(var_751df20fceaee5, var_514253bf9141a3c4) {
    if (istrue(var_751df20fceaee5.b_disabled)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    level flag_set("exfil_start");
    level.var_980b9351a7816ae8 = var_751df20fceaee5;
    var_751df20fceaee5.var_1326008dc390c510 = 1;
    var_4a06475b75dd7646 = function_53c4c53197386572(level.var_3a96331857b5f453, "REV_OB_EXFIL");
    if (isdefined(var_751df20fceaee5.var_8d00284a103c5803)) {
        var_4a06475b75dd7646 = var_751df20fceaee5.var_8d00284a103c5803;
    }
    var_751df20fceaee5.var_18da16a5ee3e8314 = namespace_68dc261109a9503f::function_67f4d8928c638abb("REV_OB_EXFIL", var_4a06475b75dd7646);
    var_751df20fceaee5.var_18da16a5ee3e8314.var_751df20fceaee5 = var_751df20fceaee5;
    var_751df20fceaee5.var_c9164736baf0694a = [];
    foreach (player in level.players) {
        if (isalive(player) && player.sessionstate == "playing" && !isdefined(player.var_751df20fceaee5)) {
            if (isdefined(var_751df20fceaee5.var_cfaabfb649760fac) && var_751df20fceaee5 [[ var_751df20fceaee5.var_cfaabfb649760fac ]](player)) {
                continue;
            }
            player.var_751df20fceaee5 = var_751df20fceaee5;
            var_751df20fceaee5.var_c9164736baf0694a[var_751df20fceaee5.var_c9164736baf0694a.size] = player;
            namespace_d886885225a713a7::function_bbdcd857d0c2a65e(var_751df20fceaee5.var_18da16a5ee3e8314, player);
            if (!istrue(var_751df20fceaee5.var_1c13f1737dccef9a)) {
                player namespace_44abc05161e2e2cb::showsplash("cp_mp_exfil_inbound");
            }
        }
    }
    level callback::callback("on_exfil_start", var_751df20fceaee5);
    var_751df20fceaee5 ent_flag_set("player_reached_exfil");
    if (!isdefined(var_751df20fceaee5.var_64f10a0f19df265f)) {
        var_751df20fceaee5.var_64f10a0f19df265f = "exfil_called_acknowledged";
    }
    var_751df20fceaee5.var_c9164736baf0694a thread delaythread(3, &function_895c7e0e9911ff6e, var_751df20fceaee5, var_751df20fceaee5.var_64f10a0f19df265f);
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        player callback::callback("exfil_acknowledged");
    }
    function_9cf09a569caf1a26(var_751df20fceaee5);
    if (var_751df20fceaee5.var_c9164736baf0694a.size > 0) {
        var_751df20fceaee5.var_55b9fdf7eacf9572 = function_a5c4615f0b00ff83(var_751df20fceaee5);
    } else {
        var_751df20fceaee5.var_55b9fdf7eacf9572 = random(var_751df20fceaee5.var_fb43e2df572cabdf);
    }
    var_751df20fceaee5.var_55b9fdf7eacf9572.angles = isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.angles) ? (0, 0, 0) : var_751df20fceaee5.var_55b9fdf7eacf9572.angles;
    var_751df20fceaee5.var_55b9fdf7eacf9572.var_1326008dc390c510 = 1;
    var_751df20fceaee5.n_time_remaining = var_514253bf9141a3c4;
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        if (isalive(player) && player.sessionstate == "playing") {
            if (!function_8d3b8265c47a2223()) {
                player thread function_836e4857db4bf132(var_514253bf9141a3c4, var_751df20fceaee5);
            }
            player thread function_689f5a3123aba709(var_751df20fceaee5);
        }
    }
    level thread function_2503b81a18276e3f(var_751df20fceaee5, undefined);
    level thread function_367542eff2c7e695(var_751df20fceaee5, undefined);
    level thread function_3c0534cf6dbf9399(var_751df20fceaee5);
    if (function_8d3b8265c47a2223()) {
        level thread function_53350420745f6c60(var_751df20fceaee5);
    } else {
        level thread exfil_timer(var_751df20fceaee5, var_514253bf9141a3c4);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x476f
// Size: 0x13a
function function_9cf09a569caf1a26(var_751df20fceaee5) {
    if (isdefined(var_751df20fceaee5.target2) && !issubstr(var_751df20fceaee5.target2, "exit")) {
        var_751df20fceaee5.var_7b0a39123a9c2f88 = getstructarray(var_751df20fceaee5.target2, "targetname");
        if (isdefined(var_751df20fceaee5.var_2c60ad87c1ee7615)) {
            var_751df20fceaee5.var_fb43e2df572cabdf = [0:var_751df20fceaee5.var_7b0a39123a9c2f88[var_751df20fceaee5.var_2c60ad87c1ee7615]];
            var_751df20fceaee5.var_2c60ad87c1ee7615 = undefined;
        } else {
            foreach (var_55b9fdf7eacf9572 in var_751df20fceaee5.var_7b0a39123a9c2f88) {
                if (!istrue(var_55b9fdf7eacf9572.var_1326008dc390c510)) {
                    var_751df20fceaee5.var_fb43e2df572cabdf = function_6d6af8144a5131f1(var_751df20fceaee5.var_fb43e2df572cabdf, var_55b9fdf7eacf9572);
                }
            }
        }
    } else {
        var_751df20fceaee5.var_a22c85cb6c2df5a0 = 1;
        var_751df20fceaee5.var_fb43e2df572cabdf = [0:var_751df20fceaee5];
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48b0
// Size: 0xb3
function function_5daedbca2b53bfdf(var_b70155cf3a8fcacf) {
    n_time_remaining = var_b70155cf3a8fcacf.var_621cb2c0d9b1cdae;
    level notify("exfil_time_remaining", n_time_remaining);
    self.var_751df20fceaee5.n_time_remaining = int(n_time_remaining);
    foreach (player in self.var_751df20fceaee5.var_c9164736baf0694a) {
        if (isdefined(player)) {
            player notify("exfil_time_remaining", n_time_remaining);
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x496a
// Size: 0x238
function function_72f374c6e3031639(var_751df20fceaee5, var_985e82f034f67960) {
    if (isdefined(level.var_38452d51edfb282c)) {
        var_676b838fa769666b = level [[ level.var_38452d51edfb282c ]](var_751df20fceaee5, var_985e82f034f67960);
        return var_676b838fa769666b;
    }
    var_c9b69aecc5c631ed = var_985e82f034f67960 namespace_ca7b90256548aa40::getSquadMembers(undefined, 1);
    var_751df20fceaee5.var_953c0bb9dec80174 = array_combine_unique([0:var_985e82f034f67960], var_c9b69aecc5c631ed);
    foreach (player in level.players) {
        if (!player function_aa1f91da154a3d90() && distance(var_985e82f034f67960.origin, player.origin) <= 5000) {
            player.var_fd7c2a423b7a47a5 = 1;
            var_751df20fceaee5.var_953c0bb9dec80174 = function_6d6af8144a5131f1(var_751df20fceaee5.var_953c0bb9dec80174, player);
        }
    }
    array_thread(var_751df20fceaee5.var_953c0bb9dec80174, &namespace_44abc05161e2e2cb::showsplash, "cp_mp_exfil_ready");
    callback::callback("on_exfil_player_available", var_751df20fceaee5);
    wait(3);
    array_thread(var_751df20fceaee5.var_953c0bb9dec80174, &function_1054441d9ce3414, var_751df20fceaee5, 10, var_985e82f034f67960);
    if (var_751df20fceaee5.var_c9164736baf0694a.size < var_751df20fceaee5.var_953c0bb9dec80174.size) {
        var_751df20fceaee5 waittill_any_timeout_1(10, "exfil_opt_in_done");
    }
    var_751df20fceaee5 notify("exfil_opt_in_done");
    var_751df20fceaee5.var_c9164736baf0694a = array_removeundefined(var_751df20fceaee5.var_c9164736baf0694a);
    if (!istrue(var_751df20fceaee5.var_1c13f1737dccef9a)) {
        array_thread(var_751df20fceaee5.var_c9164736baf0694a, &namespace_44abc05161e2e2cb::showsplash, "cp_mp_exfil_inbound");
    }
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        namespace_d886885225a713a7::function_bbdcd857d0c2a65e(var_751df20fceaee5.var_18da16a5ee3e8314, player);
    }
    return 1;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4baa
// Size: 0x11f
function function_c263d61b84b751b6(n_timer) {
    if (isbot(self)) {
        return;
    }
    self endon("disconnect");
    self notifyonplayercommand("exfil_vote_accept", "-actionslot 1");
    self notifyonplayercommand("exfil_vote_decline", "+actionslot 2");
    if (!self usinggamepad()) {
        self notifyonplayercommand("exfil_vote_accept", "+breath_sprint");
        self notifyonplayercommand("exfil_vote_decline", "+prone");
        val::set("exfil", "prone", 0);
    }
    msg = waittill_any_timeout_3(n_timer, "exfil_vote_accept", "exfil_vote_decline", "exfil_opt_in_done");
    if (msg == "exfil_vote_accept") {
        self.var_43ca0dfb1b29c6ff = 1;
    } else if (msg == "exfil_vote_decline") {
        self.var_fc0a0836d3931cdb = 1;
    }
    self notifyonplayercommandremove("exfil_vote_accept", "-actionslot 1");
    self notifyonplayercommandremove("exfil_vote_decline", "+actionslot 2");
    self notifyonplayercommandremove("exfil_vote_accept", "+breath_sprint");
    self notifyonplayercommandremove("exfil_vote_decline", "+prone");
    val::reset("exfil", "prone");
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cd0
// Size: 0x2f2
function function_1054441d9ce3414(var_751df20fceaee5, n_time, var_985e82f034f67960, var_e0f041f233006ee7) {
    n_timer = function_53c4c53197386572(n_time, 10);
    self.var_fd7c2a423b7a47a5 = 1;
    self.var_85229ab89df19bb = namespace_52f6938dd902c7d0::createtimer("hudsmall", 1);
    self.var_85229ab89df19bb.x = 0;
    self.var_85229ab89df19bb.y = 0;
    if (self usinggamepad()) {
        self.var_85229ab89df19bb.label = "SHARED_HINTSTRINGS/EXFIL_OPT_IN";
    } else {
        self.var_85229ab89df19bb.label = "SHARED_HINTSTRINGS/EXFIL_OPT_IN_KBM";
    }
    self.var_85229ab89df19bb.alignx = "center";
    self.var_85229ab89df19bb.aligny = "middle";
    self.var_85229ab89df19bb.horzalign = "center";
    self.var_85229ab89df19bb.vertalign = "middle";
    self.var_85229ab89df19bb.alpha = 1;
    self.var_85229ab89df19bb.glowalpha = 0;
    self.var_85229ab89df19bb.archived = 0;
    self.var_85229ab89df19bb settimer(n_timer);
    thread function_6a6527d46f420f47(var_751df20fceaee5);
    thread function_c263d61b84b751b6(n_timer);
    while (isalive(self) && n_timer >= 0) {
        if (istrue(self.var_43ca0dfb1b29c6ff) || is_equal(var_985e82f034f67960, self) || isdefined(var_e0f041f233006ee7) && var_751df20fceaee5.var_c9164736baf0694a.size >= var_e0f041f233006ee7) {
            self.var_751df20fceaee5 = var_751df20fceaee5;
            var_751df20fceaee5.var_c9164736baf0694a = function_6d6af8144a5131f1(var_751df20fceaee5.var_c9164736baf0694a, self);
            self.var_85229ab89df19bb.label = "SHARED_HINTSTRINGS/EXFIL_OPT_IN_WAITING_FOR_OTHER_PLAYERS";
            if (var_751df20fceaee5.var_c9164736baf0694a.size >= var_751df20fceaee5.var_953c0bb9dec80174.size) {
                var_751df20fceaee5 notify("exfil_opt_in_done");
            }
            callback::callback("on_exfil_player_joined", var_751df20fceaee5);
            self notify("exfil_opt_in_done");
            break;
        } else if (istrue(self.var_fc0a0836d3931cdb)) {
            var_751df20fceaee5.var_953c0bb9dec80174 = array_remove(var_751df20fceaee5.var_953c0bb9dec80174, self);
            self.var_85229ab89df19bb.label = "SHARED_HINTSTRINGS/EXFIL_OPT_IN_WAITING_FOR_OTHER_PLAYERS";
            if (var_751df20fceaee5.var_c9164736baf0694a.size >= var_751df20fceaee5.var_953c0bb9dec80174.size) {
                var_751df20fceaee5 notify("exfil_opt_in_done");
            }
            self notify("exfil_opt_in_done");
            break;
        }
        waitframe();
        n_timer = n_timer - level.framedurationseconds;
    }
    if (isdefined(self)) {
        self.var_fd7c2a423b7a47a5 = undefined;
        self.var_43ca0dfb1b29c6ff = undefined;
        self.var_fc0a0836d3931cdb = undefined;
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4fc9
// Size: 0x37
function private function_6a6527d46f420f47(var_751df20fceaee5) {
    self endon("disconnect");
    var_751df20fceaee5 waittill("exfil_opt_in_done");
    if (isdefined(self.var_85229ab89df19bb)) {
        self.var_85229ab89df19bb destroy();
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5007
// Size: 0x103
function function_a5c4615f0b00ff83(var_751df20fceaee5) {
    if (isdefined(level.var_570abefbef9b4a90)) {
        var_55b9fdf7eacf9572 = [[ level.var_570abefbef9b4a90 ]](var_751df20fceaee5);
        return var_55b9fdf7eacf9572;
    }
    var_26efe5d3cfb2c000 = [];
    var_3b258b7b9af78cd5 = [];
    v_pos = (0, 0, 0);
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        v_pos = v_pos + player.origin;
    }
    v_pos = v_pos / var_751df20fceaee5.var_c9164736baf0694a.size;
    var_55b9fdf7eacf9572 = get_array_of_farthest(v_pos, var_751df20fceaee5.var_fb43e2df572cabdf)[0];
    if (!isdefined(var_55b9fdf7eacf9572)) {
        var_55b9fdf7eacf9572 = random(var_751df20fceaee5.var_fb43e2df572cabdf);
    }
    return var_55b9fdf7eacf9572;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5112
// Size: 0x11d
function on_ai_killed(params) {
    if (istrue(self.var_47993ccd09da9c11) && !isdefined(self.var_941802a0997e0c42)) {
        player = params.eattacker;
        var_dbe260cceef2da56 = 0;
        if (!isdefined(player)) {
            return;
        }
        if (isdefined(player.var_941802a0997e0c42)) {
            var_dbe260cceef2da56 = 1;
            player = player.var_941802a0997e0c42;
        }
        if (player namespace_1f188a13f7e79610::isvehicle() && !var_dbe260cceef2da56) {
            player = params.eattacker.owner;
        }
        var_c2a1a952582c736 = isplayer(player) && istrue(player.var_ea2269fdafc7eac) && isdefined(player.var_751df20fceaee5) && isdefined(self.var_751df20fceaee5) && player.var_751df20fceaee5 == self.var_751df20fceaee5;
        if (var_c2a1a952582c736 || istrue(self.nuked)) {
            /#
                println("<unknown string>");
            #/
            function_530d63dcbaef6061(self.var_751df20fceaee5);
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5236
// Size: 0xcc
function on_ai_damaged(params) {
    level.var_250dc4a23947d41 = array_removeundefined(level.var_250dc4a23947d41);
    foreach (var_576f57af0204c38c in level.var_250dc4a23947d41) {
        if (function_18a23b9f6568641e() && var_576f57af0204c38c namespace_421fb1e92658d94c::function_773691f1a617f7d9(self.origin)) {
            if (isdefined(self.var_7050024e5f8ca246) && params.idamage >= self.health) {
                self.var_7e4b076a06c6df27 = 1;
                self [[ self.var_7050024e5f8ca246 ]]();
            }
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5309
// Size: 0x37
function function_65ec7747ff7a397a(params) {
    if (isdefined(self.var_751df20fceaee5)) {
        /#
            println("<unknown string>");
        #/
        function_530d63dcbaef6061(self.var_751df20fceaee5);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5347
// Size: 0x57
function function_530d63dcbaef6061(var_751df20fceaee5) {
    var_751df20fceaee5 = function_53c4c53197386572(var_751df20fceaee5, level.var_980b9351a7816ae8);
    var_751df20fceaee5.var_ed2b93690e12fb86 = array_removedead_or_dying(var_751df20fceaee5.var_ed2b93690e12fb86);
    if (istrue(var_751df20fceaee5.var_dd4749307484eec4)) {
        return;
    }
    var_751df20fceaee5.n_kills++;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53a5
// Size: 0x134
function function_890f1e94c79decb(var_751df20fceaee5) {
    v_start = (0, 0, 0);
    a_players = var_751df20fceaee5.var_c9164736baf0694a;
    foreach (player in a_players) {
        v_start = v_start + player.origin;
    }
    v_start = v_start / a_players.size;
    n_dist = distance2d(var_751df20fceaee5.var_55b9fdf7eacf9572.origin, v_start);
    var_5c4014b318324da1 = n_dist / 10000;
    if (isdefined(level.var_b1f9a4ecd91da49b)) {
        var_d6d97e149fb05528 = level.var_b1f9a4ecd91da49b;
    } else {
        var_d6d97e149fb05528 = max(var_5c4014b318324da1 * 120, 120) + 60 + max(-30, min(30, 3 * function_53c4c53197386572(level.var_c25f9db7395a37f, 1)));
    }
    return int(min(600, var_d6d97e149fb05528));
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54e1
// Size: 0xb4
function function_3c0534cf6dbf9399(var_751df20fceaee5) {
    var_751df20fceaee5 endon("exfil_complete_kill_count");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    while (1) {
        var_f47f25c4410f0c37 = 1;
        foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
            if (isalive(player) && player.sessionstate == "playing") {
                var_f47f25c4410f0c37 = 0;
                break;
            }
        }
        if (var_f47f25c4410f0c37) {
            var_751df20fceaee5 notify("exfil_players_dead");
            break;
        }
        wait(1);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x559c
// Size: 0x3ae
function function_3c26533e550baeb9(var_751df20fceaee5, n_speed, n_acceleration, var_ec4d0b8900732e35) {
    if (!isdefined(self)) {
        return;
    }
    self endon("death");
    if (istrue(self.leaving)) {
        return;
    }
    n_speed = function_53c4c53197386572(n_speed, 25);
    n_acceleration = function_53c4c53197386572(n_acceleration, 15);
    var_ec4d0b8900732e35 = function_53c4c53197386572(var_ec4d0b8900732e35, "air");
    if (self issuspendedvehicle()) {
        self wakeupvehicle();
    }
    self notify("leaving");
    self.leaving = 1;
    self clearlookatent();
    self.var_9882cd795c6bfaa = 1;
    function_90637b157ab21264(var_751df20fceaee5);
    function_698d1a79b041d92e();
    namespace_b479ac682b93cd92::vehicle_disable_navobstacles();
    if (istrue(var_751df20fceaee5.var_b81951dbbe126712)) {
        function_c7311cb3f768f21e(var_751df20fceaee5.name);
        var_751df20fceaee5.var_b81951dbbe126712 = undefined;
    }
    var_7628ae7e56c936bb = undefined;
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.target2)) {
        var_50619964211c8bec = getstructarray(var_751df20fceaee5.var_55b9fdf7eacf9572.target2, "targetname");
        var_7628ae7e56c936bb = random(var_50619964211c8bec);
    }
    if (isstruct(var_7628ae7e56c936bb)) {
        while (isstruct(var_7628ae7e56c936bb)) {
            v_goal = var_7628ae7e56c936bb.origin;
            n_speed = function_53c4c53197386572(var_7628ae7e56c936bb.script_speed, n_speed);
            n_acceleration = function_53c4c53197386572(var_7628ae7e56c936bb.script_accel, n_acceleration);
            var_141440cafe6f5d9 = function_53c4c53197386572(var_7628ae7e56c936bb.script_decel, n_acceleration / 2);
            self vehicle_setspeed(n_speed, n_acceleration, var_141440cafe6f5d9);
            function_d3cc50a6ae77242(v_goal, 0);
            self waittill("goal");
            if (isdefined(var_7628ae7e56c936bb.target)) {
                var_50619964211c8bec = getstructarray(var_7628ae7e56c936bb.target, "targetname");
                var_7628ae7e56c936bb = random(var_50619964211c8bec);
            } else {
                break;
            }
        }
    } else {
        if (var_ec4d0b8900732e35 == "air") {
            self vehicle_setspeed(n_speed, n_acceleration);
            v_goal = self.origin + (0, 0, 2000);
        } else {
            self vehicle_setspeed(n_speed, n_acceleration);
            v_goal = self.origin + anglestoforward((0, randomint(360), 0)) * 500;
        }
        function_d3cc50a6ae77242(v_goal, 1);
        self waittill("goal");
        pathrandomness = 150;
        halfdistance = 25000;
        yaw = self.angles[1];
        direction = (0, yaw, 0);
        v_end = self.origin + anglestoforward(direction) * halfdistance;
        if (var_ec4d0b8900732e35 == "air") {
            var_a221887544c34172 = max(v_end[2], getdvarfloat(@"hash_7f6b2729e5a85bb5", 6000));
            v_end = (v_end[0], v_end[1], var_a221887544c34172);
        }
        self vehicle_setspeed(n_speed * 3);
        function_d3cc50a6ae77242(v_end, 0);
        thread function_4b9b9bf8680f3b73();
        self waittill("goal");
    }
    self stoploopsound();
    if (isdefined(self.var_f6564fd566f04ac9)) {
        self.var_f6564fd566f04ac9 delete();
    }
    if (isdefined(self.var_d017de0e75c72d87)) {
        self.var_d017de0e75c72d87 unlink();
        self.var_d017de0e75c72d87.var_576f57af0204c38c = undefined;
    }
    function_fbe2ebb67d8d52dd(var_751df20fceaee5, 1);
    var_751df20fceaee5 notify("exfil_vehicle_gone");
    self notify("exfil_vehicle_gone");
    thread function_b7edf3fe42e320a6(var_751df20fceaee5);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5951
// Size: 0x156
function private function_d86f8d71e862ceb(var_751df20fceaee5, var_402f13a206b51b0, iterations, var_efd83c932228be65, distance) {
    if (!isdefined(var_efd83c932228be65)) {
        var_efd83c932228be65 = 0;
    }
    if (!isdefined(distance)) {
        distance = 1000;
    }
    self endon("death");
    var_42bef2b79361fa61 = var_751df20fceaee5.var_ed2b93690e12fb86;
    var_42bef2b79361fa61 = array_combine_unique(var_42bef2b79361fa61, getaiarrayinradius(self.origin, distance));
    for (iteration = 0; iteration < iterations; iteration++) {
        foreach (ai in var_42bef2b79361fa61) {
            if (isalive(ai) && ai.team != var_402f13a206b51b0) {
                groundent = ai getgroundentity();
                if (var_efd83c932228be65 || isdefined(groundent) && self == ai getgroundentity()) {
                    ai.var_7e4b076a06c6df27 = 1;
                    if (isdefined(ai.var_7050024e5f8ca246)) {
                        ai [[ ai.var_7050024e5f8ca246 ]]();
                    }
                    ai kill();
                    wait(0.2);
                }
            }
        }
        wait(1);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5aae
// Size: 0x160
function function_90637b157ab21264(var_751df20fceaee5) {
    if (isarray(self.var_cac0b7d65fca5e1b)) {
        var_402f13a206b51b0 = "allies";
        if (isdefined(var_751df20fceaee5)) {
            if (isdefined(var_751df20fceaee5.var_985e82f034f67960)) {
                var_402f13a206b51b0 = var_751df20fceaee5.var_985e82f034f67960.team;
            }
            function_d86f8d71e862ceb(var_751df20fceaee5, var_402f13a206b51b0, 1);
        }
        waitframe();
        foreach (var_50084330acc6846 in self.var_cac0b7d65fca5e1b) {
            destroynavlink(var_50084330acc6846);
            waitframe();
        }
        var_42bef2b79361fa61 = getaiarrayinradius(self.origin, 1000);
        foreach (ai in var_42bef2b79361fa61) {
            ai clearpath();
        }
        wait(0.2);
        self.var_cac0b7d65fca5e1b = undefined;
        if (isdefined(var_751df20fceaee5)) {
            function_d86f8d71e862ceb(var_751df20fceaee5, var_402f13a206b51b0, 2);
            wait(1);
            function_d86f8d71e862ceb(var_751df20fceaee5, var_402f13a206b51b0, 1, 1, 300);
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c15
// Size: 0x2b
function function_5afba0462c9a0889() {
    if (isdefined(self.var_d017de0e75c72d87)) {
        self.var_d017de0e75c72d87 dockmovingplatform(undefined);
        self.var_f80d26d657cd2817 = 1;
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c47
// Size: 0x54
function function_698d1a79b041d92e() {
    if (isdefined(self.var_d017de0e75c72d87) && istrue(self.var_f80d26d657cd2817)) {
        var_32227d5ad0dad6c9 = getdvarint(@"hash_272475e1eed3e1d0", 0) != 0;
        self.var_d017de0e75c72d87 undockmovingplatform(var_32227d5ad0dad6c9);
        self.var_f80d26d657cd2817 = undefined;
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ca2
// Size: 0x479
function exfil_timer(var_751df20fceaee5, var_514253bf9141a3c4, var_b634aaf3ea2ab9ec) {
    var_751df20fceaee5 notify("end_exfil_timer");
    var_751df20fceaee5 endon("end_exfil_timer");
    var_751df20fceaee5.var_8d29349c076b7199 = 1;
    if (isdefined(var_751df20fceaee5.var_18da16a5ee3e8314.var_e3d833b1e5d30b03["exfil_timer"])) {
        var_751df20fceaee5.var_18da16a5ee3e8314 namespace_2bb19978a7035533::function_b0afa182f3914d4f("exfil_timer");
    }
    var_751df20fceaee5.var_18da16a5ee3e8314 namespace_2bb19978a7035533::function_95f8d1b9f6685b61("exfil_timer", var_514253bf9141a3c4, &function_5daedbca2b53bfdf);
    str_result = var_751df20fceaee5 waittill_any_timeout_2(var_514253bf9141a3c4, "exfil_timer_force_complete", "exfil_players_dead");
    var_751df20fceaee5 notify("exfil_complete_timeout");
    var_751df20fceaee5 ent_flag_set("exfil_complete_timeout");
    level notify("exfil_time_remaining", 0);
    level callback::callback("on_exfil_complete_timeout", var_751df20fceaee5);
    if (isdefined(var_751df20fceaee5.var_576f57af0204c38c.interact) && !function_18a23b9f6568641e()) {
        var_751df20fceaee5.var_576f57af0204c38c.interact function_dfb78b3e724ad620(0);
    }
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b.n_obj_id)) {
        if (isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
            var_751df20fceaee5.var_d182b8d3f3aaa93b notify("end_exfil_interact_objective_distance");
        }
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b.n_obj_id);
        var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b.n_obj_id = undefined;
    }
    waitframe();
    namespace_68dc261109a9503f::function_612d18fdbc979c0b(var_751df20fceaee5.var_18da16a5ee3e8314, 0);
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572) && isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b)) {
        var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b setscriptablepartstate("cp_mp_exfil_icon", "disabled_icon");
        var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b setscriptablepartstate("cp_mp_exfil_smoke", "stop");
    }
    var_751df20fceaee5.var_55b9fdf7eacf9572.var_1326008dc390c510 = undefined;
    var_751df20fceaee5.var_1326008dc390c510 = undefined;
    if (!function_8d3b8265c47a2223() || function_8d3b8265c47a2223() && !getdvarint(@"hash_fa33eaab52d52fd3", 0)) {
        var_751df20fceaee5.var_576f57af0204c38c thread function_3c26533e550baeb9(var_751df20fceaee5);
        wait(1);
    }
    if (!function_8d3b8265c47a2223()) {
        var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b delete();
    }
    if (!function_8d3b8265c47a2223()) {
        var_751df20fceaee5.var_55b9fdf7eacf9572 = undefined;
    }
    var_751df20fceaee5.var_18da16a5ee3e8314 = undefined;
    foreach (ai in var_751df20fceaee5.var_ed2b93690e12fb86) {
        ai.var_751df20fceaee5 = undefined;
    }
    var_751df20fceaee5.var_ed2b93690e12fb86 = [];
    var_751df20fceaee5.var_c9164736baf0694a = array_removeundefined(var_751df20fceaee5.var_c9164736baf0694a);
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        player.var_ed2b93690e12fb86 = [];
        if (isdefined(player.var_d118936613d86299)) {
            player.var_d118936613d86299 destroy();
        }
        if (function_8d3b8265c47a2223()) {
            player setclientomnvar("ui_match_start_countdown", -1);
            player setclientomnvar("ui_is_exfil_countdown", 0);
        }
    }
    function_fbe2ebb67d8d52dd(var_751df20fceaee5);
    if (isdefined(level.var_5a7da78693d33e77) && !isdefined(var_b634aaf3ea2ab9ec)) {
        var_b634aaf3ea2ab9ec = [[ level.var_5a7da78693d33e77 ]]();
    }
    var_136f67d0e18850d3 = isdefined(var_b634aaf3ea2ab9ec) ? getdvarint(@"hash_62412da41b8eaf67", 60) : var_b634aaf3ea2ab9ec;
    logstring("==CPMP Exfil: Exfil " + var_751df20fceaee5.name + " will reset in " + var_136f67d0e18850d3 + " seconds!");
    level delaythread(var_136f67d0e18850d3, &reset_exfil, var_751df20fceaee5);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6122
// Size: 0x1f6
function function_836e4857db4bf132(var_514253bf9141a3c4, var_751df20fceaee5) {
    self notify("endon_exfil_timer_player_ui");
    self endon("endon_exfil_timer_player_ui");
    if (function_8d3b8265c47a2223()) {
        thread function_3cfb407e41bc7f54(var_751df20fceaee5);
    }
    str_notify = var_751df20fceaee5 waittill_any_timeout_2(var_514253bf9141a3c4, "exfil_complete_timeout", "exfil_players_dead");
    if (isalive(self) && str_notify != "exfil_players_dead" && (istrue(self.var_f52eb40ba99ffa4c) || istrue(self.var_68b9486f4adbcb62))) {
        if (function_18a23b9f6568641e()) {
            if (istrue(self.var_68b9486f4adbcb62)) {
                var_c9b69aecc5c631ed = namespace_ca7b90256548aa40::getSquadMembers();
                foreach (var_9191cfe9f04a69a8 in var_c9b69aecc5c631ed) {
                    if (!isalive(var_9191cfe9f04a69a8)) {
                        break;
                    }
                }
                if (isdefined(level.var_53677277fc550387)) {
                    if (![[ level.var_53677277fc550387 ]](var_c9b69aecc5c631ed)) {
                        thread function_36d898a4d1fd0a31(var_751df20fceaee5);
                    }
                } else {
                    thread function_36d898a4d1fd0a31(var_751df20fceaee5);
                }
                params = spawnstruct();
                params.var_751df20fceaee5 = var_751df20fceaee5;
                callback::callback("on_exfil_exiting_ao", params);
                var_751df20fceaee5.var_576f57af0204c38c.interact function_ef855ac387639af6(self);
            } else if (istrue(self.var_f52eb40ba99ffa4c)) {
                if (function_8d3b8265c47a2223()) {
                    function_5de93100388ae73a(var_751df20fceaee5);
                } else {
                    var_751df20fceaee5.var_576f57af0204c38c thread function_59e7feccaa753a46(self, 1);
                }
            }
        }
    } else {
        function_5de93100388ae73a(var_751df20fceaee5);
    }
    if (str_notify == "timeout" || str_notify == "exfil_complete_timeout") {
        self notify("exfil_time_remaining", 0);
    }
    if (isdefined(self)) {
        self.var_751df20fceaee5 = undefined;
        self.var_ea2269fdafc7eac = undefined;
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x631f
// Size: 0x6a
function function_36d898a4d1fd0a31(var_751df20fceaee5) {
    if (function_4027f5445bb7c8fb(var_751df20fceaee5)) {
        return;
    }
    if (!istrue(var_751df20fceaee5.var_bab7d5b1eb545062)) {
        var_1d4ef168fa9068f8 = function_2a44a4371afd7190(var_751df20fceaee5);
        if (var_1d4ef168fa9068f8.size) {
            thread utility::delaythread(7, &function_895c7e0e9911ff6e, var_751df20fceaee5, "exfil_called_exiting_ao_zombies_inside");
        } else {
            thread utility::delaythread(7, &function_895c7e0e9911ff6e, var_751df20fceaee5, "exfil_called_exiting_ao");
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6390
// Size: 0x137
function function_5de93100388ae73a(var_751df20fceaee5) {
    if (!isdefined(self)) {
        return;
    }
    self endon("disconnect");
    if (!isdefined(var_751df20fceaee5.var_ba71f0b6b1b651f5)) {
        var_751df20fceaee5.var_ba71f0b6b1b651f5 = "exfil_called_timeout";
    }
    if (!function_4027f5445bb7c8fb(var_751df20fceaee5)) {
        thread function_895c7e0e9911ff6e(var_751df20fceaee5, var_751df20fceaee5.var_ba71f0b6b1b651f5);
    }
    if (function_8d3b8265c47a2223() && function_18a23b9f6568641e()) {
        var_751df20fceaee5 waittill_any_timeout_1(15, "exfil_vehicle_gone");
        if (isalive(self) && isdefined(var_751df20fceaee5.var_576f57af0204c38c) && array_contains_key(var_751df20fceaee5.var_576f57af0204c38c.var_878914b0358bc7b5, self.guid)) {
            self.var_764da0de2a46452c = 1;
            var_751df20fceaee5.var_576f57af0204c38c.interact function_ef855ac387639af6(self);
            return;
        }
    }
    if (!istrue(level.var_40e72101aaba1098)) {
        thread namespace_44abc05161e2e2cb::showsplash("cp_mp_exfil_failure");
    }
    callback::callback("on_exfil_player_failure", var_751df20fceaee5);
    if (isdefined(var_751df20fceaee5.var_18da16a5ee3e8314)) {
        var_751df20fceaee5.var_18da16a5ee3e8314 namespace_d886885225a713a7::function_91c9ad377a3c4725(var_751df20fceaee5.var_18da16a5ee3e8314, self);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64ce
// Size: 0x297
function function_62265a47b3eedbaa(var_751df20fceaee5) {
    var_751df20fceaee5 = function_53c4c53197386572(var_751df20fceaee5, level.var_980b9351a7816ae8);
    if (!isdefined(var_751df20fceaee5.var_18da16a5ee3e8314)) {
        return;
    }
    var_61e5ce4489b4c22b = 0;
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        if (isalive(player) && player.sessionstate == "playing" && istrue(player.var_ea2269fdafc7eac)) {
            var_61e5ce4489b4c22b = 1;
            break;
        }
    }
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        if (istrue(var_751df20fceaee5.var_dd4749307484eec4)) {
            var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d("exfil_get_to_vehicle", [0:player]);
            var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d("exfil_kills_remaining", [0:player]);
            if (!function_8d3b8265c47a2223()) {
                var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_1281c7fff9456e18("exfil_board_vehicle", [0:player]);
            }
        } else if (istrue(player.var_ea2269fdafc7eac) || istrue(level.var_c0cced8a5f5b9107) && var_61e5ce4489b4c22b) {
            if (function_8d3b8265c47a2223()) {
                var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d("exfil_kills_remaining", [0:player]);
                if (istrue(player.var_68b9486f4adbcb62)) {
                    goto LOC_000001bd;
                }
            LOC_000001bd:
            } else {
                var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d("exfil_get_to_vehicle", [0:player]);
                var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_1281c7fff9456e18("exfil_kills_remaining", [0:player]);
            }
        } else if (!istrue(player.var_ea2269fdafc7eac) || istrue(level.var_c0cced8a5f5b9107) && !var_61e5ce4489b4c22b) {
            if (function_8d3b8265c47a2223()) {
                var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d("exfil_kills_remaining", [0:player]);
            } else {
                var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d("exfil_kills_remaining", [0:player]);
                var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_1281c7fff9456e18("exfil_get_to_vehicle", [0:player]);
            }
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x676c
// Size: 0x12e
function function_689f5a3123aba709(var_751df20fceaee5) {
    var_751df20fceaee5 = function_53c4c53197386572(var_751df20fceaee5, level.var_980b9351a7816ae8);
    var_751df20fceaee5 endon("exfil_complete_kill_count");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    self endon("disconnect");
    var_751df20fceaee5.var_c9164736baf0694a = function_53c4c53197386572(var_751df20fceaee5.var_c9164736baf0694a, []);
    var_751df20fceaee5.var_c9164736baf0694a = function_6d6af8144a5131f1(var_751df20fceaee5.var_c9164736baf0694a, self);
    waitframe();
    if (function_8db1b18eb8068fb9(var_751df20fceaee5)) {
        self.var_ea2269fdafc7eac = 1;
        var_751df20fceaee5 ent_flag_set("player_reached_exfil");
    }
    function_62265a47b3eedbaa(var_751df20fceaee5);
    while (1) {
        if (isdefined(var_751df20fceaee5) && isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572)) {
            if (istrue(self.var_ea2269fdafc7eac) && (!isalive(self) || !function_8db1b18eb8068fb9(var_751df20fceaee5))) {
                self.var_ea2269fdafc7eac = undefined;
                function_62265a47b3eedbaa(var_751df20fceaee5);
            } else if (!istrue(self.var_ea2269fdafc7eac) && function_8db1b18eb8068fb9(var_751df20fceaee5)) {
                self.var_ea2269fdafc7eac = 1;
                var_751df20fceaee5 ent_flag_set("player_reached_exfil");
                function_62265a47b3eedbaa(var_751df20fceaee5);
            }
        }
        wait(0.5);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68a1
// Size: 0x63
function function_8db1b18eb8068fb9(var_751df20fceaee5) {
    if (isdefined(level.var_6859449d7f699aec)) {
        return [[ level.var_6859449d7f699aec ]](var_751df20fceaee5);
    } else if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572)) {
        return (distancesquared(self.origin, var_751df20fceaee5.var_55b9fdf7eacf9572.origin) <= 3062500);
    }
    return 0;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x690c
// Size: 0x226
function function_2503b81a18276e3f(var_751df20fceaee5, var_985e82f034f67960) {
    if (isdefined(level.var_537c4380eaca8f1c)) {
        level thread [[ level.var_537c4380eaca8f1c ]](var_751df20fceaee5, var_985e82f034f67960);
        return;
    }
    function_871ded736cf89cc4(var_751df20fceaee5);
    var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b setscriptablepartstate("cp_mp_exfil_site", "standby");
    if (function_4027f5445bb7c8fb(var_751df20fceaee5)) {
        level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare(var_751df20fceaee5.var_55b9fdf7eacf9572.origin, "dmz_exfil", undefined, 1);
    } else {
        level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare(var_751df20fceaee5.var_55b9fdf7eacf9572.origin, "dmz_exfil");
    }
    if (!function_8d3b8265c47a2223()) {
        var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b makeunusable();
    }
    if (istrue(level.var_a77333195caab0e3) && !istrue(var_751df20fceaee5.var_9dae2c1a677985a8)) {
        n_obj_id = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
        var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b.n_obj_id = n_obj_id;
        namespace_5a22b6f3a56f7e9b::objective_add_objective(n_obj_id, "invisible", var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b.origin, "ui_map_icon_cp_mp_exfil", "icon_small");
        if (isent(var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b)) {
            namespace_5a22b6f3a56f7e9b::update_objective_onentity(n_obj_id, var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b);
        }
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(n_obj_id, 40);
        objective_setlabel(n_obj_id, "SHARED_HINTSTRINGS/EXFIL");
        foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
            objective_addclienttomask(n_obj_id, player);
            objective_showtoplayersinmask(n_obj_id);
        }
    }
    level thread function_e0733edbed9b4d59(var_751df20fceaee5, var_985e82f034f67960);
    var_751df20fceaee5 ent_flag_wait("exfil_complete_kill_count");
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b39
// Size: 0xd1
function function_5b992e42fb3acc6e(var_751df20fceaee5) {
    self endon("leaving");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    self waittill("death");
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        if (isdefined(player)) {
            player.var_751df20fceaee5 = undefined;
            player.var_ea2269fdafc7eac = undefined;
        }
    }
    if (istrue(var_751df20fceaee5.var_8d29349c076b7199)) {
        var_751df20fceaee5 notify("exfil_timer_force_complete");
    } else {
        level thread exfil_timer(var_751df20fceaee5, 1, 1);
        var_751df20fceaee5 notify("exfil_timer_force_complete");
    }
    if (isdefined(self)) {
        function_90637b157ab21264(var_751df20fceaee5);
        function_b7edf3fe42e320a6(var_751df20fceaee5);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c11
// Size: 0x5b
function function_4ade3f10e35d81fc(n_time, v_destination) {
    n_speed = 30;
    if (n_time > 0) {
        var_e17f7dba583248bd = n_time / 3600;
        var_2b2e9399c3f18884 = distance(self.origin, v_destination) / 63360;
        n_speed = var_2b2e9399c3f18884 / var_e17f7dba583248bd;
    }
    return n_speed;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c74
// Size: 0x18be
function function_e0733edbed9b4d59(var_751df20fceaee5, var_985e82f034f67960, var_ec4d0b8900732e35) {
    n_speed = 150;
    n_acceleration = 15;
    var_686b3d1d807eeac2 = var_751df20fceaee5.var_55b9fdf7eacf9572.origin;
    var_ec4d0b8900732e35 = function_53c4c53197386572(var_ec4d0b8900732e35, "air");
    var_4805567cd9027bd7 = undefined;
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.target) && !istrue(var_751df20fceaee5.var_a22c85cb6c2df5a0)) {
        var_c90a0dae35b30ec8 = getstructarray(var_751df20fceaee5.var_55b9fdf7eacf9572.target, "targetname");
        var_4805567cd9027bd7 = random(var_c90a0dae35b30ec8);
    }
    if (isdefined(level.var_3a96331857b5f453) && isdefined(var_751df20fceaee5.targetname) && isdefined(getstruct(var_751df20fceaee5.targetname, "script_noteworthy"))) {
        var_4805567cd9027bd7 = getstruct(var_751df20fceaee5.targetname, "script_noteworthy");
    }
    if (isstruct(var_4805567cd9027bd7)) {
        var_1790664d2cfa3432 = var_4805567cd9027bd7.origin;
        var_751df20fceaee5.var_63eece1a5168ba92 = var_4805567cd9027bd7.angles;
    } else {
        var_64b356b06ba31794 = level.mapcenter - var_686b3d1d807eeac2;
        var_64b356b06ba31794 = vectornormalize((var_64b356b06ba31794[0], var_64b356b06ba31794[1], 0));
        var_1790664d2cfa3432 = var_64b356b06ba31794 * -30000 + (0, 0, 1) * 1000 * 2 + (0, 0, var_686b3d1d807eeac2[2]);
    }
    var_751df20fceaee5.var_576f57af0204c38c = function_98cfcc7bd2f1db6c(var_751df20fceaee5, var_985e82f034f67960, var_1790664d2cfa3432);
    var_751df20fceaee5.var_576f57af0204c38c thread function_5b992e42fb3acc6e(var_751df20fceaee5);
    var_751df20fceaee5.var_576f57af0204c38c endon("death");
    var_751df20fceaee5.var_576f57af0204c38c endon("leaving");
    var_751df20fceaee5.var_576f57af0204c38c function_f909f101541f5e10(1);
    var_e17f7dba583248bd = getdvarint(@"hash_eb873c5e99093d11", 50);
    n_speed = var_751df20fceaee5.var_576f57af0204c38c function_4ade3f10e35d81fc(var_e17f7dba583248bd, var_686b3d1d807eeac2);
    if (n_speed <= 15) {
        n_speed = 15;
    }
    n_start_time = gettime();
    var_751df20fceaee5.var_576f57af0204c38c thread function_a0a341bd8db877c3(var_751df20fceaee5);
    if (isstruct(var_4805567cd9027bd7)) {
        while (isstruct(var_4805567cd9027bd7)) {
            v_goal = var_4805567cd9027bd7.origin;
            var_f265596c068668b2 = function_53c4c53197386572(var_4805567cd9027bd7.script_speed, n_speed);
            n_acceleration = function_53c4c53197386572(var_4805567cd9027bd7.script_accel, n_acceleration);
            var_141440cafe6f5d9 = function_53c4c53197386572(var_4805567cd9027bd7.script_decel, n_acceleration / 2);
            var_751df20fceaee5.var_576f57af0204c38c vehicle_setspeed(var_f265596c068668b2, n_acceleration, var_141440cafe6f5d9);
            var_751df20fceaee5.var_576f57af0204c38c function_d3cc50a6ae77242(v_goal, !isdefined(var_4805567cd9027bd7.target));
            msg = var_751df20fceaee5.var_576f57af0204c38c waittill_any_timeout_1(40, "goal");
            if (isdefined(var_4805567cd9027bd7.target)) {
                var_c90a0dae35b30ec8 = getstructarray(var_4805567cd9027bd7.target, "targetname");
                var_4805567cd9027bd7 = random(var_c90a0dae35b30ec8);
            } else {
                break;
            }
        }
    }
    if (isdefined(level.var_3a96331857b5f453) && isdefined(var_751df20fceaee5.targetname) && isdefined(getstruct(var_751df20fceaee5.targetname + "_dest", "script_noteworthy"))) {
        var_751df20fceaee5.var_2407da160e8cc5d6 = getstruct(var_751df20fceaee5.targetname + "_dest", "script_noteworthy");
        var_751df20fceaee5.var_c64d7f43bc274daf = var_751df20fceaee5.var_2407da160e8cc5d6.origin;
        var_57691bb062576aca = var_751df20fceaee5.var_c64d7f43bc274daf + (0, 0, 1000);
    } else {
        var_57691bb062576aca = var_686b3d1d807eeac2 + (0, 0, 1000);
    }
    var_751df20fceaee5.var_576f57af0204c38c vehicle_setspeed(n_speed, n_acceleration);
    var_751df20fceaee5.var_576f57af0204c38c function_d3cc50a6ae77242(var_57691bb062576aca, 1);
    str_return = var_751df20fceaee5.var_576f57af0204c38c waittill_any_timeout_1(var_e17f7dba583248bd + 15, "goal");
    if (str_return == "timeout") {
        var_751df20fceaee5.var_576f57af0204c38c.origin = var_57691bb062576aca;
    }
    n_elapsed_time = utility::function_c89ed1840c8d0f0f(gettime() - n_start_time);
    /#
        iprintln("<unknown string>" + var_751df20fceaee5.name + "<unknown string>" + n_elapsed_time + "<unknown string>");
    #/
    logstring("Exfil Helicopter at: " + var_751df20fceaee5.name + " took " + n_elapsed_time + " seconds to arrive");
    var_751df20fceaee5.var_576f57af0204c38c function_f909f101541f5e10(0);
    if (function_8d3b8265c47a2223()) {
        var_751df20fceaee5 ent_flag_wait("player_reached_exfil");
    } else {
        var_751df20fceaee5 ent_flag_wait("exfil_complete_kill_count");
    }
    if (!istrue(var_751df20fceaee5.var_1defa642cf137bd)) {
        if (isdefined(level.var_667b02b5d11ccfcb)) {
            foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
                if (![[ level.var_667b02b5d11ccfcb ]](player)) {
                    player thread function_895c7e0e9911ff6e(var_751df20fceaee5, "exfil_called_landing");
                }
            }
        } else {
            var_751df20fceaee5.var_c9164736baf0694a thread function_895c7e0e9911ff6e(var_751df20fceaee5, "exfil_called_landing");
        }
    }
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572) && isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b)) {
        var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b setscriptablepartstate("cp_mp_exfil_smoke", "dissipate");
    }
    if (var_751df20fceaee5.var_576f57af0204c38c tagexists("tag_ground")) {
        goto LOC_0000084c;
    }
    var_72464fd78466e015 = "tag_origin_static";
    var_72464fd78466e015 = function_53c4c53197386572(var_72464fd78466e015, "tag_origin");
    if (function_18a23b9f6568641e()) {
        if (isdefined(level.var_3a96331857b5f453) && isdefined(var_751df20fceaee5.var_c64d7f43bc274daf)) {
            var_fa96ac06dccfd25c = var_751df20fceaee5.var_c64d7f43bc274daf;
            var_72464fd78466e015 = "tag_origin";
        } else {
            var_126d0c717cbe5dfa = var_751df20fceaee5.var_576f57af0204c38c getboundshalfsize();
            var_9beefe21d77d578 = getgroundposition(var_686b3d1d807eeac2 + (0, 0, 8), max(var_126d0c717cbe5dfa[0], var_126d0c717cbe5dfa[1])) + (0, 0, 4);
            var_fa96ac06dccfd25c = var_9beefe21d77d578;
        }
    } else {
        var_751df20fceaee5.var_576f57af0204c38c.var_f6564fd566f04ac9 = utility::spawn_model("br_plunder_extraction_delivery_rope", var_751df20fceaee5.var_576f57af0204c38c.origin, var_751df20fceaee5.var_576f57af0204c38c.angles);
        var_751df20fceaee5.var_576f57af0204c38c.var_f6564fd566f04ac9 linkto(var_751df20fceaee5.var_576f57af0204c38c, var_72464fd78466e015, (0, 0, 0), (0, 0, 0));
        var_fa96ac06dccfd25c = var_686b3d1d807eeac2 + (0, 0, 307.692);
    }
    var_ee8324d52198d1dd = var_751df20fceaee5.var_576f57af0204c38c function_4ade3f10e35d81fc(getdvarfloat(@"hash_346baccb7a031727", 7), var_fa96ac06dccfd25c);
    var_751df20fceaee5.var_576f57af0204c38c vehicle_setspeed(var_ee8324d52198d1dd, 5);
    var_6b0ec32547042455 = undefined;
    if (isdefined(level.var_3a96331857b5f453) && isdefined(var_751df20fceaee5.var_2407da160e8cc5d6)) {
        var_751df20fceaee5.var_576f57af0204c38c function_d3cc50a6ae77242(var_fa96ac06dccfd25c, 1, var_751df20fceaee5.var_2407da160e8cc5d6.angles);
        var_6b0ec32547042455 = var_751df20fceaee5.var_2407da160e8cc5d6.angles[1];
    } else {
        var_751df20fceaee5.var_576f57af0204c38c function_d3cc50a6ae77242(var_fa96ac06dccfd25c, 1, var_751df20fceaee5.var_55b9fdf7eacf9572.angles);
        var_6b0ec32547042455 = var_751df20fceaee5.var_55b9fdf7eacf9572.angles[1];
    }
    if (function_18a23b9f6568641e()) {
        var_126d0c717cbe5dfa = var_751df20fceaee5.var_576f57af0204c38c getboundshalfsize();
        n_radius = max(var_126d0c717cbe5dfa[0], var_126d0c717cbe5dfa[1]);
        var_751df20fceaee5.var_576f57af0204c38c.interact = var_751df20fceaee5.var_576f57af0204c38c;
        var_751df20fceaee5.var_576f57af0204c38c.interact.var_751df20fceaee5 = var_751df20fceaee5;
        var_751df20fceaee5.var_576f57af0204c38c thread function_25794fb990b0b716(var_72464fd78466e015, var_fa96ac06dccfd25c);
        while (1) {
            var_6587fb87039b58d4 = var_751df20fceaee5.var_576f57af0204c38c gettagorigin(var_72464fd78466e015);
            var_9a09f0bcc9be9dde = var_751df20fceaee5.var_576f57af0204c38c vehicle_getspeed();
            var_6b2f4df48eb57c0d = var_751df20fceaee5.var_576f57af0204c38c.angles[1] - var_6b0ec32547042455;
            n_height_diff = var_6587fb87039b58d4[2] - var_fa96ac06dccfd25c[2];
            foreach (player in level.players) {
                if (function_8d3b8265c47a2223()) {
                    continue;
                }
                if (isalive(player) && player.sessionstate == "playing" && distance(player.origin, var_fa96ac06dccfd25c) < n_radius) {
                    dir = vectornormalize(var_fa96ac06dccfd25c - player.origin);
                    vel = dir * -150;
                    player setvelocity(vel);
                }
            }
            var_d5eb755a325771ba = getentarrayinradius("script_vehicle", "code_classname", var_fa96ac06dccfd25c, n_radius, 1);
            foreach (vehicle in var_d5eb755a325771ba) {
                if (vehicle == var_751df20fceaee5.var_576f57af0204c38c) {
                    continue;
                }
                if (isalive(vehicle)) {
                    if (vehicle istouching(var_751df20fceaee5.var_576f57af0204c38c)) {
                        namespace_1fbd40990ee60ede::vehicle_occupancy_ejectalloccupants(vehicle);
                        vehicle dodamage(vehicle.health + 666, vehicle.origin);
                    }
                }
            }
            var_42bef2b79361fa61 = getaiarrayinradius(var_fa96ac06dccfd25c, n_radius);
            foreach (ai in var_42bef2b79361fa61) {
                if (isalive(ai) && ai istouching(var_751df20fceaee5.var_576f57af0204c38c)) {
                    ai kill();
                }
            }
            waitframe();
        }
    LOC_00000d08:
    } else {
        var_751df20fceaee5.var_576f57af0204c38c.interact = namespace_5775ad2badedbcaa::function_90472496b91b94b3(var_751df20fceaee5.var_55b9fdf7eacf9572.origin + (0, 0, 16), 100, &function_ef855ac387639af6, "SHARED_HINTSTRINGS/EXFIL_COMPLETE_USE");
        var_751df20fceaee5.var_576f57af0204c38c.interact.var_751df20fceaee5 = var_751df20fceaee5;
        msg = var_751df20fceaee5.var_576f57af0204c38c waittill_any_timeout_1(10, "goal");
    }
    var_751df20fceaee5.var_576f57af0204c38c ent_flag_set("landed");
    namespace_a655003e419fc731::function_ffd6eed18c767472(var_751df20fceaee5.var_d182b8d3f3aaa93b, var_751df20fceaee5.var_576f57af0204c38c, 6, 21, (0, 0, 72));
    if (!istrue(var_751df20fceaee5.var_4e8463d4b66778dc)) {
        var_751df20fceaee5.var_c9164736baf0694a thread function_895c7e0e9911ff6e(var_751df20fceaee5, "exfil_called_touchdown");
    }
    if (var_751df20fceaee5.var_576f57af0204c38c namespace_dbbb37eb352edf96::ishelicopter() && function_18a23b9f6568641e()) {
        var_751df20fceaee5.var_576f57af0204c38c sethoverparams(0, 0, 0);
        var_751df20fceaee5.var_576f57af0204c38c cleargoalyaw();
        var_751df20fceaee5.var_576f57af0204c38c settargetyaw(flat_angle(var_751df20fceaee5.var_576f57af0204c38c.angles)[1]);
    }
    var_751df20fceaee5.var_576f57af0204c38c namespace_b479ac682b93cd92::vehicle_remove_navobstacle();
    var_751df20fceaee5.var_576f57af0204c38c.navobstacleid = createnavbadplacebyent(var_751df20fceaee5.var_576f57af0204c38c);
    wait(0.5);
    var_751df20fceaee5.var_576f57af0204c38c namespace_b479ac682b93cd92::vehicle_remove_navobstacle();
    var_751df20fceaee5.var_576f57af0204c38c.navobstacleid = createnavbadplacebyent(var_751df20fceaee5.var_576f57af0204c38c);
    var_42bef2b79361fa61 = getaiarrayinradius(var_fa96ac06dccfd25c, n_radius);
    foreach (ai in var_42bef2b79361fa61) {
        if (isalive(ai) && ai istouching(var_751df20fceaee5.var_576f57af0204c38c)) {
            ai kill();
            waitframe();
        }
    }
    if (function_8d3b8265c47a2223() && getdvarint(@"hash_46e4f95ef8ccb491", 0)) {
        waitframe();
        var_751df20fceaee5.var_576f57af0204c38c.var_3c8a83869e2d8da = 0;
        if (!isdefined(var_751df20fceaee5.var_576f57af0204c38c.var_d017de0e75c72d87)) {
            var_df3db7e4827942b6 = getentarray("walkable_heli_navmesh", "targetname");
            foreach (var_e9fc2f7678426142 in var_df3db7e4827942b6) {
                if (!isdefined(var_e9fc2f7678426142.var_576f57af0204c38c)) {
                    var_751df20fceaee5.var_576f57af0204c38c.var_d017de0e75c72d87 = var_e9fc2f7678426142;
                    var_751df20fceaee5.var_576f57af0204c38c.var_d017de0e75c72d87 show();
                    var_751df20fceaee5.var_576f57af0204c38c.var_d017de0e75c72d87 solid();
                    var_e9fc2f7678426142.var_576f57af0204c38c = var_751df20fceaee5.var_576f57af0204c38c;
                    var_751df20fceaee5.var_576f57af0204c38c.var_d017de0e75c72d87.origin = var_751df20fceaee5.var_576f57af0204c38c.origin;
                    var_751df20fceaee5.var_576f57af0204c38c.var_d017de0e75c72d87.angles = var_751df20fceaee5.var_576f57af0204c38c.angles;
                    var_751df20fceaee5.var_576f57af0204c38c.var_d017de0e75c72d87 linkto(var_751df20fceaee5.var_576f57af0204c38c, "tag_origin", (0, 0, -6), (0, 0, 0));
                    break;
                }
            }
        }
        if (isdefined(var_751df20fceaee5.var_576f57af0204c38c.var_d017de0e75c72d87)) {
            var_751df20fceaee5.var_576f57af0204c38c function_5afba0462c9a0889();
            var_751df20fceaee5.var_576f57af0204c38c.var_d017de0e75c72d87.moverdoesnotkill = 1;
            var_751df20fceaee5.var_576f57af0204c38c.var_d017de0e75c72d87.carriabletype = 1;
            var_59d36e2537eb9215 = var_751df20fceaee5.var_576f57af0204c38c gettagangles("tag_turret_rear") + (0, 90, 0);
            var_11e758fc4333f947 = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("tag_turret_rear") + anglestoforward(var_59d36e2537eb9215) * 100;
            var_878db166ee07c0ad = var_11e758fc4333f947 + anglestoforward(var_59d36e2537eb9215) * 30;
            var_d9bf73caac395a66 = var_751df20fceaee5.var_576f57af0204c38c gettagangles("tag_turret_left");
            var_91cf3756ceb58cfc = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("tag_turret_left") + anglestoforward(var_d9bf73caac395a66) * -20 + anglestoforward(var_59d36e2537eb9215) * 10;
            var_859e2c0cf71107de = var_91cf3756ceb58cfc + anglestoforward(var_d9bf73caac395a66) * 80;
            var_c44d47f56e2e293b = var_751df20fceaee5.var_576f57af0204c38c gettagangles("tag_turret_right");
            var_bacf92acacfc05a9 = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("tag_turret_right") + anglestoforward(var_c44d47f56e2e293b) * -20 + anglestoforward(var_59d36e2537eb9215) * 10;
            var_92d78f2a9e00400f = var_bacf92acacfc05a9 + anglestoforward(var_c44d47f56e2e293b) * 80 + anglestoforward(var_59d36e2537eb9215) * -10;
            var_34dc9e9012fdcad9 = var_11e758fc4333f947 + (0, 0, 4) + anglestoforward(var_d9bf73caac395a66) * 20;
            var_5abff59ffaf0965f = var_878db166ee07c0ad + anglestoforward(var_d9bf73caac395a66) * 20;
            var_236a941ea9a8237a = var_11e758fc4333f947 + (0, 0, 4) + anglestoforward(var_c44d47f56e2e293b) * 20;
            var_c77c56bb4875780c = var_878db166ee07c0ad + anglestoforward(var_c44d47f56e2e293b) * 20;
            var_7be063cc20e0b014 = var_751df20fceaee5.var_576f57af0204c38c gettagangles("wheel_rear_left");
            var_45cb3f35ff5c5436 = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_left") + (0, 0, 100);
            var_aefcd015f728958 = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_left") + anglestoleft(var_7be063cc20e0b014) * 70;
            var_1ce92188a70af59f = var_751df20fceaee5.var_576f57af0204c38c gettagangles("wheel_rear_right");
            var_7ee420fb0a326689 = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_right") + (0, 0, 100);
            var_f3979475a517bd2f = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_right") + anglestoright(var_1ce92188a70af59f) * 70;
            var_68ca99f6005e692a = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_left") + (0, 0, 100) + anglestoforward(var_7be063cc20e0b014) * 60;
            var_1cb4e98d5a62639c = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_left") + anglestoforward(var_7be063cc20e0b014) * 140;
            var_c6ac57dbfe079b05 = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_right") + (0, 0, 100) + anglestoforward(var_1ce92188a70af59f) * 60;
            var_6f722903c1e6ccb = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_right") + anglestoforward(var_1ce92188a70af59f) * 140;
            if (!isdefined(level.var_898f44671aebc109)) {
                level.var_898f44671aebc109 = 0;
            }
            level.var_898f44671aebc109 = level.var_898f44671aebc109 + 1;
            n_ent_num = level.var_898f44671aebc109;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[0] = "traverse_helicopter_rear_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[1] = "traverse_helicopter_rear_right_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[2] = "traverse_helicopter_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[3] = "traverse_helicopter_right_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[4] = "traverse_helicopter_reverse_rear_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[5] = "traverse_helicopter_reverse_rear_right_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[6] = "traverse_helicopter_reverse_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[7] = "traverse_helicopter_reverse_right_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[8] = "traverse_helicopter_wing_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[9] = "traverse_helicopter_wing_right_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[10] = "traverse_helicopter_reverse_wing_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[11] = "traverse_helicopter_reverse_wing_right_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[12] = "traverse_helicopter_wing_front_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[13] = "traverse_helicopter_wing_front_right_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[14] = "traverse_helicopter_reverse_wing_front_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[15] = "traverse_helicopter_reverse_wing_front_right_" + n_ent_num;
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[0], var_5abff59ffaf0965f, var_34dc9e9012fdcad9);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[1], var_c77c56bb4875780c, var_236a941ea9a8237a);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[2], var_859e2c0cf71107de, var_91cf3756ceb58cfc + (0, 0, 4));
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[3], var_92d78f2a9e00400f, var_bacf92acacfc05a9 + (0, 0, 4));
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[4], var_34dc9e9012fdcad9, var_5abff59ffaf0965f);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[5], var_236a941ea9a8237a, var_c77c56bb4875780c);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[6], var_91cf3756ceb58cfc + (0, 0, 4), var_859e2c0cf71107de);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[7], var_bacf92acacfc05a9 + (0, 0, 4), var_92d78f2a9e00400f);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[8], var_45cb3f35ff5c5436, var_aefcd015f728958);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[9], var_7ee420fb0a326689, var_f3979475a517bd2f);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[10], var_aefcd015f728958, var_45cb3f35ff5c5436);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[11], var_f3979475a517bd2f, var_7ee420fb0a326689);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[12], var_68ca99f6005e692a, var_1cb4e98d5a62639c);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[13], var_c6ac57dbfe079b05, var_6f722903c1e6ccb);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[14], var_1cb4e98d5a62639c, var_68ca99f6005e692a);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[15], var_6f722903c1e6ccb, var_c6ac57dbfe079b05);
        }
    }
    var_751df20fceaee5.var_576f57af0204c38c thread function_e76e826b76d20d32(var_751df20fceaee5);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8539
// Size: 0xa7
function function_a0a341bd8db877c3(var_751df20fceaee5) {
    self endon("death");
    self endon("landed");
    while (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572) && !istrue(var_751df20fceaee5.var_35d53d54bebe2864)) {
        var_465c08a30c93971a = distance(self.origin, var_751df20fceaee5.var_55b9fdf7eacf9572.origin) / 63360 / max(1, self vehicle_getspeed());
        var_465c08a30c93971a = var_465c08a30c93971a * 3600;
        if (var_465c08a30c93971a <= 15) {
            var_751df20fceaee5.var_c9164736baf0694a thread function_895c7e0e9911ff6e(var_751df20fceaee5, "exfil_called_15_out");
            return;
        }
        wait(1);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85e7
// Size: 0xcc
function function_d3cc50a6ae77242(v_pos, var_f0e9262ca24fed50, v_ang) {
    if (isstruct(v_pos)) {
        v_ang = v_pos.angles;
        v_pos = v_pos.origin;
    }
    if (self vehicle_isphysveh() && self function_1e8542a707a8002("p2p")) {
        self function_a7fac0397762d7a6("p2p", "brakeAtGoal", istrue(var_f0e9262ca24fed50));
        self function_a7fac0397762d7a6("p2p", "goalPoint", v_pos);
        if (isdefined(v_ang)) {
            self function_a7fac0397762d7a6("p2p", "goalAngles", (0, v_ang[1], 0));
        }
    } else {
        self setvehgoalpos(v_pos, var_f0e9262ca24fed50);
        if (isdefined(v_ang)) {
            self setgoalyaw(flat_angle(v_ang)[1]);
            self settargetyaw(flat_angle(v_ang)[1]);
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86ba
// Size: 0xb8
function function_4b9b9bf8680f3b73() {
    self endon("goal");
    self endon("death");
    while (1) {
        partenum = ent = normalspeed = normal = position = flag1 = flag0 = body1 = body0 = self waittill("collision");
        if (!isdefined(ent) || !isdefined(ent.classname) || ent.classname == "worldspawn") {
            self notify("goal");
            return;
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8779
// Size: 0xd6
function function_25794fb990b0b716(var_72464fd78466e015, var_fa96ac06dccfd25c) {
    self endon("death");
    self endon("landed");
    var_728a8d0ce6b1f8be = self gettagorigin(var_72464fd78466e015);
    var_95c0b0fccf49faf6 = 0;
    var_97ba094469f8831b = 20;
    var_19db4597bc58eea5 = 0;
    while (1) {
        var_37efcfcde90fb8ca = self gettagorigin(var_72464fd78466e015);
        n_height_diff = var_37efcfcde90fb8ca[2] - var_fa96ac06dccfd25c[2];
        if (distance(var_37efcfcde90fb8ca, var_728a8d0ce6b1f8be) < 5) {
            var_95c0b0fccf49faf6 = var_95c0b0fccf49faf6 + 1;
        } else {
            var_728a8d0ce6b1f8be = var_37efcfcde90fb8ca;
            var_95c0b0fccf49faf6 = 0;
        }
        if (abs(n_height_diff) <= 200) {
            var_19db4597bc58eea5 = var_19db4597bc58eea5 + 1;
        }
        if (var_95c0b0fccf49faf6 >= 5 || var_19db4597bc58eea5 >= var_97ba094469f8831b) {
            self.var_7bb70699db655bd6 = 1;
            break;
        }
        wait(1);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8856
// Size: 0x1dd
function function_b7edf3fe42e320a6(var_751df20fceaee5) {
    if (isdefined(self.var_d017de0e75c72d87)) {
        self.var_d017de0e75c72d87 unlink();
        function_698d1a79b041d92e();
        self.var_d017de0e75c72d87.var_576f57af0204c38c = undefined;
        self.var_d017de0e75c72d87 notsolid();
        self.var_d017de0e75c72d87.origin = self.var_d017de0e75c72d87.origin + (0, 0, 500);
        self.var_d017de0e75c72d87 hide();
    }
    if (isent(self.var_f6564fd566f04ac9)) {
        self.var_f6564fd566f04ac9 delete();
    }
    if (isarray(self.var_b23e608ef55db7fa)) {
        foreach (pilot in self.var_b23e608ef55db7fa) {
            if (isent(pilot)) {
                pilot delete();
            }
        }
    }
    foreach (player in level.players) {
        if (istrue(player.liveRagdoll) && namespace_421fb1e92658d94c::function_773691f1a617f7d9(player.origin)) {
            player setorigin(var_751df20fceaee5.origin + (0, 0, 4));
        }
    }
    level.var_250dc4a23947d41 = utility::array_remove(level.var_250dc4a23947d41, self);
    thread namespace_cfae3bfa0fa8d1dd::_deletevehicle(self);
    namespace_cfae3bfa0fa8d1dd::reservevehicle();
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a3a
// Size: 0xfd
function function_e76e826b76d20d32(var_751df20fceaee5) {
    self endon("death");
    if (!function_8d3b8265c47a2223() || getdvarint(@"hash_46e4f95ef8ccb491", 0)) {
        return;
    }
    var_126d0c717cbe5dfa = self getboundshalfsize();
    n_radius = max(var_126d0c717cbe5dfa[0], var_126d0c717cbe5dfa[1]);
    if (isdefined(var_751df20fceaee5.var_985e82f034f67960)) {
        var_402f13a206b51b0 = var_751df20fceaee5.var_985e82f034f67960.team;
    } else {
        var_402f13a206b51b0 = "allies";
    }
    while (1) {
        a_ai = function_2a44a4371afd7190(var_751df20fceaee5);
        foreach (ai in a_ai) {
            ai kill();
            waitframe();
        }
        wait(1);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b3e
// Size: 0x10f
function function_2a44a4371afd7190(var_751df20fceaee5) {
    var_126d0c717cbe5dfa = self getboundshalfsize();
    n_radius = max(var_126d0c717cbe5dfa[0], var_126d0c717cbe5dfa[1]);
    if (isdefined(var_751df20fceaee5.var_985e82f034f67960)) {
        var_402f13a206b51b0 = var_751df20fceaee5.var_985e82f034f67960.team;
    } else {
        var_402f13a206b51b0 = "allies";
    }
    a_ai = getaiarrayinradius(self.origin, n_radius);
    var_1d4ef168fa9068f8 = [];
    foreach (ai in a_ai) {
        if (isalive(ai) && ai.team != var_402f13a206b51b0 && namespace_421fb1e92658d94c::function_773691f1a617f7d9(ai.origin)) {
            var_1d4ef168fa9068f8[var_1d4ef168fa9068f8.size] = ai;
        }
    }
    return var_1d4ef168fa9068f8;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c55
// Size: 0x49
function function_f909f101541f5e10(b_enable) {
    if (b_enable) {
        if (self vehicle_isphysveh()) {
            self function_247ad6a91f6a4ffe(b_enable);
        } else {
            self notsolid();
        }
    } else if (self vehicle_isphysveh()) {
        self function_247ad6a91f6a4ffe(b_enable);
    } else {
        self notsolid();
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ca5
// Size: 0x186
function function_98cfcc7bd2f1db6c(var_751df20fceaee5, var_985e82f034f67960, var_1790664d2cfa3432) {
    if (function_18a23b9f6568641e()) {
        var_576f57af0204c38c = function_f65e637087bf650a(var_751df20fceaee5, var_985e82f034f67960, var_1790664d2cfa3432);
        var_576f57af0204c38c.var_9bd69326cfeb9fe9 = 1;
        var_576f57af0204c38c function_a609274d97743733();
    } else {
        spawndata = spawnstruct();
        spawndata.origin = var_1790664d2cfa3432;
        spawndata.angles = (0, 0, 0);
        spawndata.spawntype = "GAME_MODE";
        spawndata.var_14cde247ac3313a4 = var_751df20fceaee5.var_4cdfc3869e61bd9b;
        var_cad2ff0bf935f3d4 = namespace_9f6a961447bab709::function_7d45a9e5bf7a3d3e(var_751df20fceaee5);
        if (!isdefined(var_cad2ff0bf935f3d4.var_a097893014a748de)) {
            goto LOC_000000ed;
        }
        var_5a68cfc13f7b49de = var_cad2ff0bf935f3d4.var_a097893014a748de;
        var_576f57af0204c38c = namespace_1f188a13f7e79610::vehicle_spawn(var_5a68cfc13f7b49de, spawndata);
        namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(var_576f57af0204c38c);
    }
    var_576f57af0204c38c.var_751df20fceaee5 = var_751df20fceaee5;
    var_576f57af0204c38c.godmode = 1;
    var_576f57af0204c38c val::set("exfil", "vehicle_disallow_lockon", 1);
    var_576f57af0204c38c namespace_b479ac682b93cd92::vehicle_disable_navobstacles();
    level.var_250dc4a23947d41[level.var_250dc4a23947d41.size] = var_576f57af0204c38c;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("exfil", "setupHeliGasmasks")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("exfil", "setupHeliGasmasks") ]](var_576f57af0204c38c);
    }
    var_576f57af0204c38c callback::callback("on_exfil_vehicle_spawned");
    return var_576f57af0204c38c;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8e33
// Size: 0x318
function private function_f65e637087bf650a(var_751df20fceaee5, var_985e82f034f67960, var_1790664d2cfa3432) {
    spawndata = spawnstruct();
    spawndata.origin = function_81384ca609ee5b57(var_1790664d2cfa3432);
    if (isdefined(var_751df20fceaee5.var_63eece1a5168ba92)) {
        var_63eece1a5168ba92 = var_751df20fceaee5.var_63eece1a5168ba92;
    } else {
        var_63eece1a5168ba92 = (0, 0, 0);
    }
    spawndata.angles = var_63eece1a5168ba92;
    spawndata.spawntype = "GAME_MODE";
    spawndata.var_14cde247ac3313a4 = var_751df20fceaee5.var_4cdfc3869e61bd9b;
    var_cad2ff0bf935f3d4 = namespace_9f6a961447bab709::function_7d45a9e5bf7a3d3e(var_751df20fceaee5);
    var_5a68cfc13f7b49de = function_53c4c53197386572(var_cad2ff0bf935f3d4.var_a097893014a748de, "veh9_palfa");
    heli = undefined;
    n_tries = 0;
    var_ee8da5624236dc89 = spawnstruct();
    while (1) {
        namespace_cfae3bfa0fa8d1dd::clearvehiclereservation();
        heli = namespace_1f188a13f7e79610::vehicle_spawn(var_5a68cfc13f7b49de, spawndata, var_ee8da5624236dc89);
        if (isdefined(heli)) {
            break;
        }
        n_tries++;
        namespace_cfae3bfa0fa8d1dd::reservevehicle();
        logstring("==CPMP Exfil: Walkable vehicle failed to spawn at " + spawndata.origin + " for exfil: " + var_751df20fceaee5.name + ". Attempts: " + n_tries + ". Reason: " + (isdefined(var_ee8da5624236dc89.fail) ? "unknown" : var_ee8da5624236dc89.fail));
        wait(0.5);
        if (n_tries > 60) {
            spawndata.origin = var_751df20fceaee5.var_55b9fdf7eacf9572.origin + (0, 0, 1000);
        } else {
            var_64b356b06ba31794 = var_751df20fceaee5.var_55b9fdf7eacf9572.origin - level.mapcenter;
            var_64b356b06ba31794 = vectornormalize((var_64b356b06ba31794[0], var_64b356b06ba31794[1], 0));
            var_2b2e9399c3f18884 = -30000 + n_tries * 500;
            spawndata.origin = var_64b356b06ba31794 * var_2b2e9399c3f18884 + (0, 0, 1) * 1000 * 2;
            /#
                iprintln("<unknown string>" + var_751df20fceaee5.name + "<unknown string>" + distance(spawndata.origin, var_751df20fceaee5.var_55b9fdf7eacf9572.origin) + "<unknown string>");
            #/
        }
    }
    namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(heli);
    heli namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage(0);
    heli.var_1e897ae1c018b2c2 = isdefined(var_985e82f034f67960) ? var_985e82f034f67960.team : undefined;
    heli.var_878914b0358bc7b5 = [];
    heli.onStartRiding = &function_b28cb16c37f8e7b;
    heli.onEndRiding = &function_5f4563731f3e286f;
    heli.unload_land_offset = 255;
    heli.var_fd91112a53ea4fea = 1;
    heli.var_4a4265af0a6f92e9 = 1;
    return heli;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9153
// Size: 0xe4
function private function_a609274d97743733() {
    var_3c83c6524fa234cc = [0:"body_sp_ally_pilot_western_vm_fullbody", 1:"body_sp_ally_pilot_western_vm_fullbody"];
    var_1484eb6048310f02 = [0:"iw9_mp_heli_palfa_seat_0_idle", 1:"iw9_heli_palfa_seat_1_idle"];
    var_1e29645dfa86c4e9 = [0:"tag_seat_0", 1:"tag_seat_1"];
    self.var_b23e608ef55db7fa = [];
    foreach (i, var_3d2b9f6f56c7979b in var_3c83c6524fa234cc) {
        var_d245217fed05724d = function_33f93635439fc805(i, var_1e29645dfa86c4e9[i], var_1484eb6048310f02[i], var_3d2b9f6f56c7979b);
        if (isdefined(var_d245217fed05724d)) {
            self.var_b23e608ef55db7fa = array_add(self.var_b23e608ef55db7fa, var_d245217fed05724d);
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x923e
// Size: 0x116
function private function_33f93635439fc805(var_dcef536353ea980b, tag, animname, model, headmodel) {
    v_pos = self gettagorigin(tag);
    v_ang = self gettagangles(tag);
    if (!isdefined(v_pos) || !isdefined(v_ang)) {
        return;
    }
    var_d245217fed05724d = utility::spawn_model(model, v_pos, v_ang);
    v_pos = var_d245217fed05724d gettagorigin("j_spine4");
    v_ang = var_d245217fed05724d gettagangles("j_spine4");
    var_d245217fed05724d.linkedents = [];
    if (isdefined(headmodel)) {
        head = spawn("script_model", v_pos);
        head.angles = v_ang;
        head setmodel(headmodel);
        head linkto(var_d245217fed05724d, "j_spine4");
        var_d245217fed05724d.linkedents[var_d245217fed05724d.linkedents.size] = head;
        var_d245217fed05724d.head = head;
    }
    var_d245217fed05724d linkto(self);
    if (isdefined(animname)) {
        var_d245217fed05724d scriptmodelplayanim(animname);
    }
    return var_d245217fed05724d;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x935c
// Size: 0x15
function function_b28cb16c37f8e7b(player) {
    thread function_f814294925882e0(player);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9378
// Size: 0x436
function private function_f814294925882e0(player) {
    player notify("endon_enter_walkable_vehicle");
    player endon("endon_enter_walkable_vehicle");
    player endon("disconnect");
    player.var_68b9486f4adbcb62 = 1;
    player.var_cac91eb6521df629 = self;
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.var_751df20fceaee5)) {
        goto LOC_000000f8;
    }
    var_751df20fceaee5 = self.var_751df20fceaee5;
    if (!isdefined(var_751df20fceaee5)) {
        logstring("==CPMP Exfil: Exfil vehicle exists, but can't get actual Exfil struct!");
        return;
    }
    ent_flag_wait("landed");
    var_751df20fceaee5.var_c9164736baf0694a = function_6d6af8144a5131f1(var_751df20fceaee5.var_c9164736baf0694a, player);
    var_751df20fceaee5.var_c9164736baf0694a = function_fdc9d5557c53078e(var_751df20fceaee5.var_c9164736baf0694a);
    self.var_878914b0358bc7b5 = function_fdc9d5557c53078e(self.var_878914b0358bc7b5, 1);
    if (!array_contains_key(self.var_878914b0358bc7b5, player.guid)) {
        self.var_878914b0358bc7b5[player.guid] = player;
        namespace_d9c77dc2a6fe29c6::enableoobimmunity(player);
        function_62265a47b3eedbaa(var_751df20fceaee5);
        if (!function_8d3b8265c47a2223()) {
            player function_15c99e8995143f9f(var_751df20fceaee5);
        }
    }
    if (function_8d3b8265c47a2223()) {
        if (!isdefined(var_751df20fceaee5.var_985e82f034f67960)) {
            return;
        }
        var_c9b69aecc5c631ed = var_751df20fceaee5.var_985e82f034f67960 namespace_ca7b90256548aa40::getSquadMembers(undefined, 1);
        var_c718f42faa957098 = 0;
        var_2736b3848a47330f = 0;
        foreach (var_9191cfe9f04a69a8 in var_c9b69aecc5c631ed) {
            if (istrue(var_9191cfe9f04a69a8.var_68b9486f4adbcb62)) {
                var_2736b3848a47330f++;
            }
        }
        if (var_2736b3848a47330f == var_c9b69aecc5c631ed.size) {
            var_c718f42faa957098 = 1;
        } else {
            var_c718f42faa957098 = 0;
            if (var_2736b3848a47330f >= var_c9b69aecc5c631ed.size / 2) {
                var_2d5b80c94b21ea0e = [];
                var_c0b9c6085cb34c = [];
                foreach (var_9191cfe9f04a69a8 in var_c9b69aecc5c631ed) {
                    if (istrue(var_9191cfe9f04a69a8.var_68b9486f4adbcb62)) {
                        var_2d5b80c94b21ea0e = array_add(var_2d5b80c94b21ea0e, var_9191cfe9f04a69a8);
                    } else {
                        var_c0b9c6085cb34c = array_add(var_c0b9c6085cb34c, var_9191cfe9f04a69a8);
                    }
                }
                if (var_751df20fceaee5.n_time_remaining > 5) {
                    var_2d5b80c94b21ea0e thread function_895c7e0e9911ff6e(var_751df20fceaee5, "exfil_called_missing");
                }
            }
        }
        if (var_c718f42faa957098 && !istrue(var_751df20fceaee5.var_eeb8c244f1d18546)) {
            var_751df20fceaee5.var_eeb8c244f1d18546 = 1;
            if (isdefined(var_751df20fceaee5.n_time_remaining) && var_751df20fceaee5.n_time_remaining > 5) {
                if (!getdvarint(@"hash_fa33eaab52d52fd3", 0)) {
                    level thread function_cc026051a7037c25(var_751df20fceaee5);
                }
            } else if (!istrue(var_751df20fceaee5.var_bff042c325c612a0)) {
                var_751df20fceaee5.var_c9164736baf0694a thread utility::delaythread(6, &function_895c7e0e9911ff6e, var_751df20fceaee5, "exfil_called_lastsecond");
            }
        }
        return;
    }
    foreach (player_heli in var_751df20fceaee5.var_c9164736baf0694a) {
        if (!istrue(player_heli.var_68b9486f4adbcb62)) {
            return;
        }
    }
    foreach (player_heli in var_751df20fceaee5.var_c9164736baf0694a) {
        self.interact function_ef855ac387639af6(player_heli);
    }
    if (!istrue(self.leaving) && !getdvarint(@"hash_fa33eaab52d52fd3", 0)) {
        namespace_68dc261109a9503f::function_612d18fdbc979c0b(var_751df20fceaee5.var_18da16a5ee3e8314, 1);
        thread function_3c26533e550baeb9(var_751df20fceaee5);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97b5
// Size: 0xc2
function function_3cfb407e41bc7f54(var_751df20fceaee5) {
    self notify("endon_exfil_defend_mode_timer");
    self endon("endon_exfil_defend_mode_timer");
    self endon("death_or_disconnect");
    self setclientomnvar("ui_is_exfil_countdown", 1);
    if (!isdefined(var_751df20fceaee5.var_74144fabf9631d37)) {
        goto LOC_0000005f;
    }
    var_6d06ffa37ff9a762 = var_751df20fceaee5.var_74144fabf9631d37;
    while (1) {
        n_time_remaining = self waittill("exfil_time_remaining");
        if (n_time_remaining <= var_6d06ffa37ff9a762) {
            n_time_remaining = int(n_time_remaining);
            self setclientomnvar("ui_match_start_countdown", n_time_remaining);
            self setclientomnvar("ui_is_exfil_countdown", 1);
            if (n_time_remaining <= 0) {
                self setclientomnvar("ui_match_start_countdown", -1);
                self setclientomnvar("ui_is_exfil_countdown", 0);
                break;
            }
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x987e
// Size: 0x14b
function function_cc026051a7037c25(var_751df20fceaee5) {
    var_44ff48a7843fe636 = 5;
    if (isplayer(var_751df20fceaee5.var_985e82f034f67960)) {
        var_c9b69aecc5c631ed = var_751df20fceaee5.var_985e82f034f67960 namespace_ca7b90256548aa40::getSquadMembers();
        foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
            if (isplayer(player) && !istrue(player.var_68b9486f4adbcb62) && !array_contains(var_c9b69aecc5c631ed, player)) {
                var_44ff48a7843fe636 = 10;
                break;
            }
        }
    }
    if (!function_4027f5445bb7c8fb(var_751df20fceaee5)) {
        var_751df20fceaee5.var_c9164736baf0694a thread function_895c7e0e9911ff6e(var_751df20fceaee5, "exfil_called_shortcut");
    }
    if (isdefined(var_751df20fceaee5.var_18da16a5ee3e8314.var_e3d833b1e5d30b03["exfil_timer"])) {
        var_751df20fceaee5.var_18da16a5ee3e8314 namespace_2bb19978a7035533::function_b0afa182f3914d4f("exfil_timer");
    }
    var_751df20fceaee5.var_18da16a5ee3e8314 namespace_2bb19978a7035533::function_95f8d1b9f6685b61("exfil_timer", int(var_44ff48a7843fe636), &function_5daedbca2b53bfdf);
    wait(var_44ff48a7843fe636 - 1);
    var_751df20fceaee5 notify("exfil_timer_force_complete");
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99d0
// Size: 0xc0
function function_5f4563731f3e286f(player) {
    if (player isjumping() && namespace_421fb1e92658d94c::function_773691f1a617f7d9(player.origin)) {
        thread function_575416f2acbdceb3(player);
        return;
    }
    player notify("endon_enter_walkable_vehicle");
    self.var_878914b0358bc7b5[player.guid] = undefined;
    if (namespace_d9c77dc2a6fe29c6::isoobimmune(player)) {
        namespace_d9c77dc2a6fe29c6::disableoobimmunity(player);
    }
    var_751df20fceaee5 = self.interact.var_751df20fceaee5;
    player.var_68b9486f4adbcb62 = undefined;
    player.var_cac91eb6521df629 = undefined;
    if (istrue(player.var_65be3afaddfe3a79)) {
        player val::reset("exfil", "damage");
    }
    function_62265a47b3eedbaa(var_751df20fceaee5);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a97
// Size: 0x52
function function_575416f2acbdceb3(player) {
    self endon("death");
    player notify("endon_exfil_vehicle_jump_hack");
    player endon("disconnect");
    player endon("endon_exfil_vehicle_jump_hack");
    while (player isjumping()) {
        waitframe();
    }
    if (!namespace_421fb1e92658d94c::function_773691f1a617f7d9(player.origin)) {
        function_5f4563731f3e286f(player);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9af0
// Size: 0x8d
function function_59e7feccaa753a46(player, var_45fd392609262a96) {
    self endon("death");
    if (function_8d3b8265c47a2223() && !istrue(var_45fd392609262a96) && !istrue(self.leaving)) {
        return;
    }
    if ((istrue(self.leaving) || istrue(var_45fd392609262a96)) && !istrue(player.var_68b9486f4adbcb62)) {
        namespace_36f464722d326bbe::function_852712268d005332(player, 1, 0.25);
        player setorigin(self gettagorigin("tag_seat_7"));
        level thread namespace_36f464722d326bbe::function_852712268d005332(player, 0, 0.25);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b84
// Size: 0x179
function function_fbe2ebb67d8d52dd(var_751df20fceaee5, var_6b53052bba864b7a) {
    if (function_8d3b8265c47a2223() && function_18a23b9f6568641e() && isdefined(var_751df20fceaee5.var_576f57af0204c38c)) {
        foreach (player in level.players) {
            if (isalive(player) && player.sessionstate == "playing" && (var_751df20fceaee5.var_576f57af0204c38c namespace_421fb1e92658d94c::function_773691f1a617f7d9(player.origin) || array_contains_key(var_751df20fceaee5.var_576f57af0204c38c.var_878914b0358bc7b5, player.guid)) && !istrue(player.var_f7b106ebc7f3abf0)) {
                if (!isdefined(player.name)) {
                    goto LOC_00000110;
                }
                logstring("unknown" + player.name + " at exfil " + var_751df20fceaee5.name, "==CPMP Exfil: Attempting to fallback complete exfil for ");
                if (istrue(var_6b53052bba864b7a)) {
                    player.var_764da0de2a46452c = 1;
                }
                player.var_751df20fceaee5 = var_751df20fceaee5;
                var_751df20fceaee5.var_576f57af0204c38c.interact function_ef855ac387639af6(player);
            }
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d04
// Size: 0x108
function function_ef855ac387639af6(player) {
    if (!isplayer(player) || istrue(player.var_f7b106ebc7f3abf0) || getdvarint(@"hash_fa33eaab52d52fd3", 0)) {
        return;
    }
    var_751df20fceaee5 = isdefined(self.var_751df20fceaee5) ? player.var_751df20fceaee5 : self.var_751df20fceaee5;
    player function_15c99e8995143f9f(var_751df20fceaee5);
    player.var_f7b106ebc7f3abf0 = 1;
    if (!isdefined(player.var_751df20fceaee5)) {
        player.var_751df20fceaee5 = var_751df20fceaee5;
    }
    if (!isdefined(player.name)) {
        goto LOC_000000c2;
    }
    logstring("unknown" + player.name + " at " + var_751df20fceaee5.name, "==CPMP Exfil: Start of exfil completion for ");
    if (isdefined(level.var_78e0845802741355)) {
        self thread [[ level.var_78e0845802741355 ]](player);
        return;
    }
    /#
        player iprintlnbold("<unknown string>");
    #/
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e13
// Size: 0x91
function function_15c99e8995143f9f(var_751df20fceaee5) {
    if (istrue(self.var_f52eb40ba99ffa4c) || getdvarint(@"hash_fa33eaab52d52fd3", 0)) {
        return;
    }
    self.var_f52eb40ba99ffa4c = 1;
    if (!function_8d3b8265c47a2223()) {
        thread namespace_44abc05161e2e2cb::showsplash("cp_mp_exfil_success");
    }
    thread exfil_board_vehicle(var_751df20fceaee5);
    callback::callback("on_exfil_board_vehicle", var_751df20fceaee5);
    if (isdefined(var_751df20fceaee5.var_18da16a5ee3e8314)) {
        var_751df20fceaee5.var_18da16a5ee3e8314 namespace_d886885225a713a7::function_91c9ad377a3c4725(var_751df20fceaee5.var_18da16a5ee3e8314, self);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9eab
// Size: 0x1c1
function exfil_board_vehicle(var_751df20fceaee5) {
    if (istrue(self.var_68b9486f4adbcb62) || istrue(var_751df20fceaee5.var_199168ca946185b0)) {
        return;
    }
    self endon("disconnect");
    self.var_a4408405ef23e289 = utility::spawn_model("tag_origin", self.origin, self.angles);
    self lerpviewangleclamp(1, 0, 0, 45, 45, 45, 45, 1);
    self playerlinktodelta(self.var_a4408405ef23e289, "tag_origin", 1, 60, 60, 45, 45, 1);
    var_a758a3aef0e1e62d = 11;
    for (i = 2; i <= var_a758a3aef0e1e62d; i++) {
        var_d089cec462f6900f = "tag_seat_" + i;
        var_751df20fceaee5.var_576f57af0204c38c.var_9ca68f1ac4e51748 = function_53c4c53197386572(var_751df20fceaee5.var_576f57af0204c38c.var_9ca68f1ac4e51748, []);
        if (!array_contains(var_751df20fceaee5.var_576f57af0204c38c.var_9ca68f1ac4e51748, var_d089cec462f6900f) && var_751df20fceaee5.var_576f57af0204c38c tagexists(var_d089cec462f6900f)) {
            var_751df20fceaee5.var_576f57af0204c38c.var_9ca68f1ac4e51748 = array_add(var_751df20fceaee5.var_576f57af0204c38c.var_9ca68f1ac4e51748, var_d089cec462f6900f);
            level namespace_36f464722d326bbe::function_852712268d005332(self, 1, 0.5);
            self.var_a4408405ef23e289 linkto(var_751df20fceaee5.var_576f57af0204c38c, var_d089cec462f6900f, (0, 0, 20), (0, 0, 0));
            level thread namespace_36f464722d326bbe::function_852712268d005332(self, 0, 0.5);
            self.var_68b9486f4adbcb62 = 1;
            break;
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa073
// Size: 0x3fd
function function_367542eff2c7e695(var_751df20fceaee5, var_985e82f034f67960) {
    var_751df20fceaee5 = function_53c4c53197386572(var_751df20fceaee5, level.var_980b9351a7816ae8);
    var_751df20fceaee5 endon("exfil_complete_kill_count");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    if (isdefined(level.var_f39442d551882408)) {
        level thread [[ level.var_f39442d551882408 ]](var_751df20fceaee5, var_985e82f034f67960);
        return;
    }
    n_player_count = var_751df20fceaee5.var_c9164736baf0694a.size;
    switch (n_player_count) {
    case 1:
        function_360cc0762c8f8dc6(35, var_751df20fceaee5);
        break;
    case 2:
        function_360cc0762c8f8dc6(int(46.9), var_751df20fceaee5);
        break;
    case 3:
        function_360cc0762c8f8dc6(int(59.5), var_751df20fceaee5);
        break;
    case 4:
    default:
        function_360cc0762c8f8dc6(int(71.4), var_751df20fceaee5);
        break;
    }
    var_686b3d1d807eeac2 = var_751df20fceaee5.var_55b9fdf7eacf9572.origin;
    team = "team_two_hundred";
    var_2377fe3f0b3be5cf = 60;
    var_751df20fceaee5.var_185669f0381856d6 = int(min(var_2377fe3f0b3be5cf / (var_751df20fceaee5.var_c9164736baf0694a.size + 1), var_2377fe3f0b3be5cf / 3));
    if (!function_8d3b8265c47a2223()) {
        var_751df20fceaee5.var_18da16a5ee3e8314 namespace_2bb19978a7035533::function_b05f987b9adfdc21("exfil_kills_remaining", function_5cdb6bf616f071c2(var_751df20fceaee5), 0);
    }
    function_62265a47b3eedbaa(var_751df20fceaee5);
    var_1d6b32b06fe04f23 = undefined;
    if (isdefined(level.var_35aa4c6db25e81ae)) {
        var_1d6b32b06fe04f23 = [[ level.var_35aa4c6db25e81ae ]](var_751df20fceaee5, 1);
    }
    level thread function_d006864bb66299cb(var_751df20fceaee5);
    if (!function_8d3b8265c47a2223()) {
        level thread function_e4da3de7a5e67901(var_751df20fceaee5, 3, 1, 1);
    }
    if (isdefined(var_1d6b32b06fe04f23)) {
        if (!function_8d3b8265c47a2223()) {
            level thread function_53350420745f6c60(var_751df20fceaee5);
        }
        if (!getdvarint(@"hash_3d3a3936aa88a240", 0)) {
            return;
        }
        var_751df20fceaee5.var_c9164736baf0694a = array_removeundefined(var_751df20fceaee5.var_c9164736baf0694a);
        var_751df20fceaee5.var_33f4e93d8420b61f = namespace_614554f86e52695c::function_54da428ad4a96f2e(var_1d6b32b06fe04f23, var_751df20fceaee5.origin, 10000, 1, 0);
        if (isdefined(var_751df20fceaee5.var_33f4e93d8420b61f)) {
            function_f1a80db7eb652acc(var_751df20fceaee5.var_33f4e93d8420b61f, var_751df20fceaee5.var_c9164736baf0694a);
            namespace_614554f86e52695c::function_bc5315dc37ae4cf(var_751df20fceaee5.var_33f4e93d8420b61f, &function_f7f5cf2d9974cd7c, var_751df20fceaee5);
            namespace_614554f86e52695c::function_e4a67fe4ddca7ed5(var_751df20fceaee5.var_33f4e93d8420b61f, &function_5217bec60e76c1b3, var_751df20fceaee5);
            namespace_614554f86e52695c::function_73147cdf5c28d10c(var_751df20fceaee5.var_33f4e93d8420b61f, &function_18710afbe1a02611, var_751df20fceaee5);
            foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
                player.var_df1c932fb5f9cc0d = var_751df20fceaee5.var_33f4e93d8420b61f;
            }
        }
    } else {
        if (!getdvarint(@"hash_3d3a3936aa88a240", 0)) {
            return;
        }
        while (1) {
            if (function_e1a9c5d3a4c2a90b(var_751df20fceaee5) < function_9621ef0d09be048d(var_751df20fceaee5)) {
                foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
                    if (isalive(player) && player.sessionstate == "playing" && !namespace_7e17181d03156026::isinlaststand(player)) {
                        player thread exfil_per_player_spawns(var_751df20fceaee5, var_686b3d1d807eeac2, team, var_751df20fceaee5.var_185669f0381856d6);
                    }
                }
            }
            wait(randomfloatrange(5, 10));
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa477
// Size: 0x101
function function_e4da3de7a5e67901(var_751df20fceaee5, var_1d9d993a883b7051, var_d28bfd15b43eae53, var_d8ff55e583769d60) {
    if (!isdefined(var_1d9d993a883b7051)) {
        var_1d9d993a883b7051 = 5;
    }
    if (!isdefined(var_d28bfd15b43eae53)) {
        var_d28bfd15b43eae53 = 0;
    }
    if (!isdefined(var_d8ff55e583769d60)) {
        var_d8ff55e583769d60 = 0;
    }
    var_751df20fceaee5 notify("end_track_exfil_ai_at_destination");
    var_751df20fceaee5 endon("end_track_exfil_ai_at_destination");
    var_751df20fceaee5 endon("exfil_complete_kill_count");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    while (1) {
        var_5eb85cc70f4b70a0 = function_368cc1002f8e3c9f(var_751df20fceaee5);
        if (var_d28bfd15b43eae53) {
            var_7480bd83f5b1bef3 = max(function_9621ef0d09be048d(var_751df20fceaee5), var_5eb85cc70f4b70a0.size);
        } else {
            var_7480bd83f5b1bef3 = function_9621ef0d09be048d(var_751df20fceaee5);
        }
        if (var_7480bd83f5b1bef3 > 0) {
            var_751df20fceaee5.var_18da16a5ee3e8314 namespace_3ab0c2d9cd55890e::function_82a2f59593fe059e("exfil_kills_remaining", var_7480bd83f5b1bef3);
        }
        if (function_9621ef0d09be048d(var_751df20fceaee5) <= 0 && (!var_d28bfd15b43eae53 || var_5eb85cc70f4b70a0.size <= var_1d9d993a883b7051) && (!var_d8ff55e583769d60 || !var_751df20fceaee5 ent_flag("exfil_boss_alive"))) {
            break;
        }
        wait(0.25);
    }
    level thread function_303cb92b5afb6e87(var_751df20fceaee5);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa57f
// Size: 0xc4
function function_5217bec60e76c1b3(requestid, userdata, agent, data) {
    var_751df20fceaee5 = userdata;
    if (!function_8d3b8265c47a2223()) {
        var_751df20fceaee5.var_c9164736baf0694a = array_removeundefined(var_751df20fceaee5.var_c9164736baf0694a);
        closest_player = get_array_of_closest(agent.origin, var_751df20fceaee5.var_c9164736baf0694a)[0];
        function_81adda380966c872(var_751df20fceaee5, agent, closest_player);
    } else {
        agent.var_751df20fceaee5 = var_751df20fceaee5;
        var_751df20fceaee5.var_ed2b93690e12fb86 = array_add(var_751df20fceaee5.var_ed2b93690e12fb86, agent);
    }
    agent callback::callback("on_exfil_ai_spawned");
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa64a
// Size: 0xc4
function function_e94ce448218abffe(requestid, userdata, agent, data) {
    var_751df20fceaee5 = userdata;
    if (!function_8d3b8265c47a2223()) {
        var_751df20fceaee5.var_c9164736baf0694a = array_removeundefined(var_751df20fceaee5.var_c9164736baf0694a);
        closest_player = get_array_of_closest(agent.origin, var_751df20fceaee5.var_c9164736baf0694a)[0];
        function_81adda380966c872(var_751df20fceaee5, agent, closest_player);
    } else {
        agent.var_751df20fceaee5 = var_751df20fceaee5;
        var_751df20fceaee5.var_ed2b93690e12fb86 = function_6d6af8144a5131f1(var_751df20fceaee5.var_ed2b93690e12fb86, agent);
    }
    agent callback::callback("on_exfil_ai_spawned");
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa715
// Size: 0x13d
function function_18710afbe1a02611(requestid, userdata) {
    var_751df20fceaee5 = userdata;
    if (getdvarint(@"hash_3d3a3936aa88a240", 0)) {
        if (var_751df20fceaee5 ent_flag("exfil_complete_timeout") || !istrue(var_751df20fceaee5.var_1326008dc390c510)) {
            if (getdvarint(@"hash_729c0e8d0666b374", 1)) {
                function_4ad7fe70ca08ef97(requestid);
                function_18790a3cb3f88db7(requestid);
            }
            return 1;
        }
        return 0;
    }
    if (function_a374bb164261c788(var_751df20fceaee5)) {
        function_4ad7fe70ca08ef97(requestid);
        return 1;
    }
    var_4c6df4049d754ba3 = function_dbae5347e2c01238(var_751df20fceaee5);
    if (var_4c6df4049d754ba3 >= var_751df20fceaee5.var_c9164736baf0694a.size * 0.75 || !istrue(var_751df20fceaee5.var_1326008dc390c510)) {
        function_4ad7fe70ca08ef97(requestid);
        return 1;
    }
    if (isdefined(var_751df20fceaee5.var_576f57af0204c38c) && var_751df20fceaee5.var_576f57af0204c38c ent_flag("landed") || var_751df20fceaee5 ent_flag("exfil_complete_kill_count") || var_751df20fceaee5 ent_flag("exfil_complete_timeout") || !istrue(var_751df20fceaee5.var_1326008dc390c510)) {
        var_751df20fceaee5.var_33f4e93d8420b61f = undefined;
        function_4ad7fe70ca08ef97(requestid);
        return 1;
    }
    return 0;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa85a
// Size: 0x119
function function_794c7399b3beaf40(requestid, userdata) {
    var_751df20fceaee5 = userdata;
    if (function_8d3b8265c47a2223()) {
        if (isdefined(var_751df20fceaee5.var_576f57af0204c38c) && istrue(var_751df20fceaee5.var_576f57af0204c38c.leaving) || var_751df20fceaee5 ent_flag("exfil_complete_timeout")) {
            var_751df20fceaee5.var_df1c932fb5f9cc0d = undefined;
            if (getdvarint(@"hash_729c0e8d0666b374", 1)) {
                function_18790a3cb3f88db7(requestid);
            }
            return 1;
        }
    } else {
        if (function_9621ef0d09be048d(var_751df20fceaee5) <= 0) {
            var_751df20fceaee5.var_df1c932fb5f9cc0d = undefined;
            if (getdvarint(@"hash_729c0e8d0666b374", 1)) {
                function_18790a3cb3f88db7(requestid);
            }
            return 1;
        }
        if (var_751df20fceaee5 ent_flag("exfil_complete_kill_count") || var_751df20fceaee5 ent_flag("exfil_complete_timeout") || !istrue(var_751df20fceaee5.var_1326008dc390c510)) {
            var_751df20fceaee5.var_df1c932fb5f9cc0d = undefined;
            if (getdvarint(@"hash_729c0e8d0666b374", 1)) {
                function_18790a3cb3f88db7(requestid);
            }
            return 1;
        }
    }
    return 0;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa97b
// Size: 0x95
function function_f7f5cf2d9974cd7c(requestid, userdata) {
    var_751df20fceaee5 = userdata;
    function_5cc7d5014c77d7b1(var_751df20fceaee5, requestid);
    if (getdvarint(@"hash_3d3a3936aa88a240", 0)) {
        return !istrue(var_751df20fceaee5 ent_flag("exfil_complete_timeout"));
    }
    if (function_9621ef0d09be048d(var_751df20fceaee5) <= 0) {
        return 0;
    }
    var_4c6df4049d754ba3 = function_dbae5347e2c01238(var_751df20fceaee5);
    if (var_4c6df4049d754ba3 >= var_751df20fceaee5.var_c9164736baf0694a.size * 0.5 || !istrue(var_751df20fceaee5.var_1326008dc390c510)) {
        return 0;
    }
    return 1;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa18
// Size: 0x6f
function function_5a36abe36ba8758b(requestid, userdata) {
    var_751df20fceaee5 = userdata;
    function_5cc7d5014c77d7b1(var_751df20fceaee5, requestid);
    if (function_8d3b8265c47a2223()) {
        if (gettime() - var_751df20fceaee5.var_4a86a90d72981109 > 30000 && !istrue(var_751df20fceaee5.var_1326008dc390c510)) {
            return 0;
        }
    } else if (function_9621ef0d09be048d(var_751df20fceaee5) <= 0) {
        return 0;
    }
    return 1;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa8f
// Size: 0x174
function function_5cc7d5014c77d7b1(var_751df20fceaee5, requestid) {
    if (isdefined(var_751df20fceaee5) && isarray(var_751df20fceaee5.var_ed2b93690e12fb86)) {
        var_d5e75f8a4471a7f8 = 0;
        var_8bfa7f3c950e3f58 = 0;
        var_751df20fceaee5.var_ed2b93690e12fb86 = array_removedead_or_dying(var_751df20fceaee5.var_ed2b93690e12fb86);
        foreach (ai in var_751df20fceaee5.var_ed2b93690e12fb86) {
            if (isdefined(ai.aicategory)) {
                switch (ai.aicategory) {
                case #"hash_8c089e813083e510":
                    var_d5e75f8a4471a7f8++;
                    break;
                case #"hash_7b0e2f2ed84f34":
                    var_8bfa7f3c950e3f58++;
                    break;
                }
            }
        }
        if (isdefined(var_751df20fceaee5.var_1d39d0784b73d713) && var_d5e75f8a4471a7f8 >= var_751df20fceaee5.var_1d39d0784b73d713) {
            function_d37068aac7785c04(requestid, "exfil_bucket_zombie_special", 0);
        } else {
            function_d37068aac7785c04(requestid, "exfil_bucket_zombie_special", 1);
        }
        if (isdefined(var_751df20fceaee5.var_2744fe7a1690ec17) && var_8bfa7f3c950e3f58 >= var_751df20fceaee5.var_2744fe7a1690ec17) {
            function_d37068aac7785c04(requestid, "exfil_bucket_zombie_elite", 0);
        } else {
            function_d37068aac7785c04(requestid, "exfil_bucket_zombie_elite", 1);
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac0a
// Size: 0x7a
function function_53350420745f6c60(var_751df20fceaee5) {
    var_751df20fceaee5 notify("endon_start_exfil_spawns_at_destination");
    var_751df20fceaee5 endon("endon_start_exfil_spawns_at_destination");
    var_751df20fceaee5 endon("exfil_complete_kill_count");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    var_751df20fceaee5.var_4a86a90d72981109 = gettime();
    if (function_8d3b8265c47a2223()) {
        var_751df20fceaee5 ent_flag_wait("player_reached_exfil");
        function_496ddd68d7c18405(var_751df20fceaee5);
        level thread function_3b7f6a9e23d14c41(var_751df20fceaee5);
    } else {
        var_751df20fceaee5 ent_flag_wait("player_reached_exfil");
        function_496ddd68d7c18405(var_751df20fceaee5);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac8b
// Size: 0x10a
function function_496ddd68d7c18405(var_751df20fceaee5) {
    if (function_4027f5445bb7c8fb(var_751df20fceaee5)) {
        return;
    }
    var_1d6b32b06fe04f23 = undefined;
    if (isdefined(level.var_35aa4c6db25e81ae)) {
        var_1d6b32b06fe04f23 = [[ level.var_35aa4c6db25e81ae ]](var_751df20fceaee5, 0);
    }
    if (isdefined(var_1d6b32b06fe04f23)) {
        var_751df20fceaee5.var_df1c932fb5f9cc0d = namespace_614554f86e52695c::function_54da428ad4a96f2e(var_1d6b32b06fe04f23, var_751df20fceaee5.var_55b9fdf7eacf9572.origin, 1500, 1, 0);
        if (isdefined(var_751df20fceaee5.var_df1c932fb5f9cc0d)) {
            if (getdvarint(@"hash_faf56f135b3692d6", 0)) {
                var_751df20fceaee5.var_b81951dbbe126712 = 1;
                function_606642b946a01237(var_751df20fceaee5.name, var_751df20fceaee5.origin, 1500, 1);
            }
            namespace_614554f86e52695c::function_bc5315dc37ae4cf(var_751df20fceaee5.var_df1c932fb5f9cc0d, &function_5a36abe36ba8758b, var_751df20fceaee5);
            namespace_614554f86e52695c::function_e4a67fe4ddca7ed5(var_751df20fceaee5.var_df1c932fb5f9cc0d, &function_e94ce448218abffe, var_751df20fceaee5);
            namespace_614554f86e52695c::function_73147cdf5c28d10c(var_751df20fceaee5.var_df1c932fb5f9cc0d, &function_794c7399b3beaf40, var_751df20fceaee5);
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad9c
// Size: 0x100
function function_a57106214e976a66(var_686b3d1d807eeac2) {
    var_d73168c1116bcbf6 = 1500;
    var_8903a8e260bffb4 = self.origin;
    if (istrue(self.var_ea2269fdafc7eac)) {
        var_8903a8e260bffb4 = var_686b3d1d807eeac2;
    } else {
        var_9c7c266b03516b12 = function_9590e02554440c3f();
        v_dir = vectornormalize(var_686b3d1d807eeac2 - self.origin);
        var_8903a8e260bffb4 = self.origin + v_dir * var_d73168c1116bcbf6;
    }
    min = 0;
    max = 250;
    while (1) {
        var_bcfec646853a95c1 = randomfloatrange(min, max) * namespace_3c37cb17ade254d::ter_op(cointoss(), 1, -1);
        var_bcfec546853a938e = randomfloatrange(min, max) * namespace_3c37cb17ade254d::ter_op(cointoss(), 1, -1);
        var_8903a8e260bffb4 = getclosestpointonnavmesh(var_8903a8e260bffb4 + (var_bcfec646853a95c1, var_bcfec546853a938e, 0));
        if (isdefined(var_8903a8e260bffb4)) {
            break;
        }
        waitframe();
    }
    return var_8903a8e260bffb4;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaea4
// Size: 0x24
function function_9590e02554440c3f() {
    velocity = self getvelocity();
    var_24ca020343141dde = 7;
    return velocity * var_24ca020343141dde;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaed0
// Size: 0x7a
function function_dbae5347e2c01238(var_751df20fceaee5) {
    var_4c6df4049d754ba3 = 0;
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        if (istrue(player.var_ea2269fdafc7eac)) {
            var_4c6df4049d754ba3++;
        }
    }
    return var_4c6df4049d754ba3;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf52
// Size: 0x196
function exfil_per_player_spawns(var_751df20fceaee5, var_686b3d1d807eeac2, var_573a69129fea9851, var_185669f0381856d6) {
    self notify("exfil_per_player_spawns");
    self endon("death");
    self endon("exfil_per_player_spawns");
    var_751df20fceaee5 endon("exfil_complete_kill_count");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    self.var_ed2b93690e12fb86 = function_53c4c53197386572(self.var_ed2b93690e12fb86, []);
    self.var_ed2b93690e12fb86 = array_removedead_or_dying(self.var_ed2b93690e12fb86);
    while (self.var_ed2b93690e12fb86.size < var_185669f0381856d6) {
        if (function_a374bb164261c788(var_751df20fceaee5) && function_e1a9c5d3a4c2a90b(var_751df20fceaee5) >= function_9621ef0d09be048d(var_751df20fceaee5)) {
            waitframe();
            continue;
        }
        var_8903a8e260bffb4 = function_a57106214e976a66(var_686b3d1d807eeac2);
        if (!isdefined(var_8903a8e260bffb4)) {
            waitframe();
            continue;
        }
        aitype = undefined;
        if (isdefined(level.var_9f9cd6f82b781bde)) {
            aitype = [[ level.var_9f9cd6f82b781bde ]]();
        } else if (isdefined(level.agent_definition) && level.agent_definition.size) {
            aitype = random(getarraykeys(level.agent_definition));
        }
        aitype = getdvar(@"hash_5254c3fbd200d7ee", aitype);
        if (!isdefined(aitype) || aitype == "") {
            /#
                println("<unknown string>");
            #/
            return;
        }
        agent = namespace_34f6a6adabfc542d::spawnnewagentaitype(aitype, var_8903a8e260bffb4, (0, 0, 0), var_573a69129fea9851);
        if (isdefined(agent)) {
            function_81adda380966c872(var_751df20fceaee5, agent, self);
            agent callback::callback("on_exfil_ai_spawned");
        }
        waitframe();
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0ef
// Size: 0x107
function function_81adda380966c872(var_751df20fceaee5, ai, player, var_cc6cfef7ac65a530) {
    var_751df20fceaee5 = function_53c4c53197386572(var_751df20fceaee5, level.var_980b9351a7816ae8);
    ai.var_751df20fceaee5 = var_751df20fceaee5;
    var_751df20fceaee5.var_ed2b93690e12fb86 = array_add(var_751df20fceaee5.var_ed2b93690e12fb86, ai);
    var_751df20fceaee5.var_ed2b93690e12fb86 = array_removedead_or_dying(var_751df20fceaee5.var_ed2b93690e12fb86);
    if (ai function_8db1b18eb8068fb9(var_751df20fceaee5) || istrue(var_cc6cfef7ac65a530)) {
        ai function_258e4a8a5807df8f(var_751df20fceaee5);
    }
    if (isplayer(player)) {
        player.var_ed2b93690e12fb86 = function_53c4c53197386572(player.var_ed2b93690e12fb86, []);
        player.var_ed2b93690e12fb86 = array_add(player.var_ed2b93690e12fb86, ai);
        player.var_ed2b93690e12fb86 = array_removedead_or_dying(player.var_ed2b93690e12fb86);
        ai.var_1ea57a99f5240da1 = player;
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1fd
// Size: 0x30
function function_258e4a8a5807df8f(var_751df20fceaee5) {
    if (!istrue(self.var_47993ccd09da9c11)) {
        self.var_47993ccd09da9c11 = 1;
        var_751df20fceaee5.var_6e5b4d39d36d4d34++;
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb234
// Size: 0x55
function function_303cb92b5afb6e87(var_751df20fceaee5) {
    var_751df20fceaee5.var_dd4749307484eec4 = 1;
    var_751df20fceaee5 ent_flag_set("exfil_complete_kill_count");
    var_751df20fceaee5.var_18da16a5ee3e8314 namespace_3ab0c2d9cd55890e::function_82a2f59593fe059e("exfil_kills_remaining", 0);
    level callback::callback("on_exfil_complete_kill_count", var_751df20fceaee5);
    function_62265a47b3eedbaa(var_751df20fceaee5);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb290
// Size: 0x391
function reset_exfil(var_751df20fceaee5) {
    if (istrue(var_751df20fceaee5.var_589c572c53eeeeb6)) {
        logstring("==CPMP Exfil: Exfil " + var_751df20fceaee5.name + " has resetting disabled");
        return;
    }
    logstring("==CPMP Exfil: Exfil " + var_751df20fceaee5.name + " is resetting");
    var_751df20fceaee5 ent_flag_clear("exfil_complete_kill_count");
    var_751df20fceaee5 ent_flag_clear("exfil_complete_timeout");
    var_751df20fceaee5 ent_flag_clear("player_reached_exfil");
    function_c068efdf0abd5258(var_751df20fceaee5.var_d182b8d3f3aaa93b);
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572)) {
        var_751df20fceaee5.var_55b9fdf7eacf9572.var_1326008dc390c510 = undefined;
        var_751df20fceaee5.var_55b9fdf7eacf9572 = undefined;
    }
    var_751df20fceaee5.var_953c0bb9dec80174 = [];
    var_751df20fceaee5.var_c9164736baf0694a = [];
    var_751df20fceaee5.var_ed2b93690e12fb86 = [];
    var_751df20fceaee5.var_fb43e2df572cabdf = [];
    var_751df20fceaee5.n_kills = 0;
    var_751df20fceaee5.var_6e5b4d39d36d4d34 = 0;
    var_751df20fceaee5.var_31b0d4be41550606 = undefined;
    var_751df20fceaee5.var_dd4749307484eec4 = undefined;
    var_751df20fceaee5.var_eeb8c244f1d18546 = undefined;
    var_751df20fceaee5.var_8d29349c076b7199 = undefined;
    var_751df20fceaee5.var_1326008dc390c510 = undefined;
    function_360cc0762c8f8dc6(0, var_751df20fceaee5);
    if (isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b) && isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b.interact)) {
        var_751df20fceaee5.var_d182b8d3f3aaa93b.interact function_555064e06fc5f4b3(1);
    } else {
        logstring("==CPMP Exfil: Exfil " + var_751df20fceaee5.name + " interact was somehow deleted. Respawning and reenabling it");
        function_5169ff9e47582e7a(var_751df20fceaee5);
        if (!isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b.interact)) {
            if (isent(var_751df20fceaee5.var_d182b8d3f3aaa93b) && !function_4027f5445bb7c8fb(var_751df20fceaee5)) {
                var_751df20fceaee5.var_d182b8d3f3aaa93b.interact = namespace_5775ad2badedbcaa::function_90472496b91b94b3(var_751df20fceaee5.var_d182b8d3f3aaa93b, var_751df20fceaee5.radius, &function_a1778cdfcc8373ae, function_53c4c53197386572(level.var_7cc298fa98ce0c7a, "SHARED_HINTSTRINGS/EXFIL_START_USE_GENERIC"));
                var_751df20fceaee5.var_d182b8d3f3aaa93b.interact sethintonobstruction("show");
            } else {
                var_751df20fceaee5.var_d182b8d3f3aaa93b.interact = namespace_5775ad2badedbcaa::function_32645103f7520635(var_751df20fceaee5.var_d182b8d3f3aaa93b, &function_a1778cdfcc8373ae);
            }
        }
        var_751df20fceaee5.var_d182b8d3f3aaa93b.interact function_555064e06fc5f4b3(1);
    }
    if (isdefined(var_751df20fceaee5.var_576f57af0204c38c)) {
        var_751df20fceaee5 notify("exfil_vehicle_gone");
        self notify("exfil_vehicle_gone");
        var_751df20fceaee5.var_576f57af0204c38c function_b7edf3fe42e320a6(var_751df20fceaee5);
    }
    if (function_8d3b8265c47a2223()) {
        function_9cf09a569caf1a26(var_751df20fceaee5);
        var_751df20fceaee5.var_55b9fdf7eacf9572 = random(var_751df20fceaee5.var_fb43e2df572cabdf);
        function_871ded736cf89cc4(var_751df20fceaee5);
        var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b setscriptablepartstate("cp_mp_exfil_smoke", "smoking");
        var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b setscriptablepartstate("cp_mp_exfil_icon", "default_icon");
        level thread namespace_9f6a961447bab709::function_53350420745f6c60(var_751df20fceaee5);
        var_751df20fceaee5 namespace_9f6a961447bab709::function_e3ba83b1bb428b8e();
    }
    level.var_44194c664b77bf1b[level.var_44194c664b77bf1b.size] = var_751df20fceaee5;
    level callback::callback("on_exfil_reset", var_751df20fceaee5);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb628
// Size: 0x148
function function_ae18d20050b99c2(var_751df20fceaee5) {
    level endon("game_ended");
    var_751df20fceaee5 = function_53c4c53197386572(var_751df20fceaee5, level.var_980b9351a7816ae8);
    if (isarray(var_751df20fceaee5.var_ed2b93690e12fb86)) {
        var_751df20fceaee5.var_ed2b93690e12fb86 = array_removedead_or_dying(var_751df20fceaee5.var_ed2b93690e12fb86);
        foreach (zombie in var_751df20fceaee5.var_ed2b93690e12fb86) {
            if (isalive(zombie)) {
                zombie dodamage(zombie.health + 990, zombie.origin);
            }
        }
    }
    var_a8b9200a741125a = function_368cc1002f8e3c9f(var_751df20fceaee5);
    foreach (zombie in var_a8b9200a741125a) {
        if (isalive(zombie)) {
            zombie dodamage(zombie.health + 990, zombie.origin);
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb777
// Size: 0x101
function function_748fd8b59180efd1(var_751df20fceaee5) {
    var_751df20fceaee5 endon("exfil_complete_timeout");
    var_b5c2ca133ea9e7a1 = 875;
    if (isdefined(var_751df20fceaee5.var_c9b6fe30b53a07f8)) {
        var_b5c2ca133ea9e7a1 = var_751df20fceaee5.var_c9b6fe30b53a07f8;
    }
    while (1) {
        if (isdefined(var_751df20fceaee5.var_576f57af0204c38c) && istrue(var_751df20fceaee5.var_576f57af0204c38c.leaving)) {
            break;
        }
        var_41860e6f820eae9b = get_array_of_closest(var_751df20fceaee5.var_55b9fdf7eacf9572.origin, level.players, var_751df20fceaee5.var_c9164736baf0694a, undefined, var_b5c2ca133ea9e7a1);
        foreach (player in var_41860e6f820eae9b) {
            player thread function_f4f52d20f1fb7650(var_751df20fceaee5);
        }
        wait(1);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb87f
// Size: 0x104
function function_f4f52d20f1fb7650(var_751df20fceaee5) {
    self endon("disconnect");
    if (!isalive(self) || is_equal(self.var_751df20fceaee5, var_751df20fceaee5) || !isdefined(var_751df20fceaee5.var_18da16a5ee3e8314) || istrue(self.var_92db26323808779f)) {
        return;
    }
    self.var_92db26323808779f = 1;
    function_f246f550360cbdbb();
    self.var_751df20fceaee5 = var_751df20fceaee5;
    namespace_d886885225a713a7::function_bbdcd857d0c2a65e(var_751df20fceaee5.var_18da16a5ee3e8314, self);
    if (!istrue(var_751df20fceaee5.var_1c13f1737dccef9a)) {
        thread namespace_44abc05161e2e2cb::showsplash("cp_mp_exfil_inbound");
    }
    callback::callback("on_exfil_player_joined", var_751df20fceaee5);
    function_d0b64b8228a4731(var_751df20fceaee5);
    thread function_689f5a3123aba709(var_751df20fceaee5);
    while (1) {
        var_fb29279929ca56c7 = n_time_remaining = level waittill("exfil_time_remaining");
        if (self.var_751df20fceaee5 == var_fb29279929ca56c7) {
            thread function_836e4857db4bf132(n_time_remaining, var_751df20fceaee5);
            self.var_92db26323808779f = undefined;
            break;
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb98a
// Size: 0xa2
function function_f246f550360cbdbb() {
    if (isdefined(self.var_751df20fceaee5) && isdefined(self.var_751df20fceaee5.var_18da16a5ee3e8314)) {
        var_e51ca3441c2d12c3 = self.var_751df20fceaee5;
        namespace_d886885225a713a7::function_91c9ad377a3c4725(var_e51ca3441c2d12c3.var_18da16a5ee3e8314, self);
        var_e51ca3441c2d12c3.var_c9164736baf0694a = utility::array_remove(var_e51ca3441c2d12c3.var_c9164736baf0694a, self);
        self.var_751df20fceaee5 = undefined;
        self notify("endon_exfil_defend_mode_timer");
        self notify("endon_exfil_timer_player_ui");
        self setclientomnvar("ui_match_start_countdown", -1);
        self setclientomnvar("ui_is_exfil_countdown", 0);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba33
// Size: 0xb4
function function_d0b64b8228a4731(var_751df20fceaee5) {
    n_player_count = var_751df20fceaee5.var_c9164736baf0694a.size;
    switch (n_player_count) {
    case 1:
        function_360cc0762c8f8dc6(35, var_751df20fceaee5);
        break;
    case 2:
        function_360cc0762c8f8dc6(int(46.9), var_751df20fceaee5);
        break;
    case 3:
        function_360cc0762c8f8dc6(int(59.5), var_751df20fceaee5);
        break;
    case 4:
    default:
        function_360cc0762c8f8dc6(int(71.4), var_751df20fceaee5);
        break;
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbaee
// Size: 0x18c
function function_368cc1002f8e3c9f(var_751df20fceaee5) {
    a_ai = getaiarray();
    var_5eb85cc70f4b70a0 = [];
    var_751df20fceaee5 ent_flag_clear("exfil_boss_alive");
    foreach (ai in a_ai) {
        if (isalive(ai) && ai.unittype == "zombie" && !isdefined(ai.var_941802a0997e0c42) && ai function_8db1b18eb8068fb9(var_751df20fceaee5)) {
            var_5eb85cc70f4b70a0 = function_6d6af8144a5131f1(var_5eb85cc70f4b70a0, ai);
            if (!isdefined(ai.var_751df20fceaee5)) {
                var_751df20fceaee5.var_c9164736baf0694a = array_removeundefined(var_751df20fceaee5.var_c9164736baf0694a);
                closest_player = get_array_of_closest(ai.origin, var_751df20fceaee5.var_c9164736baf0694a)[0];
                function_81adda380966c872(var_751df20fceaee5, ai, closest_player, 1);
                ai callback::callback("on_exfil_ai_spawned");
            }
            if (isdefined(ai.aicategory) && (ai.aicategory == "special" || ai.aicategory == "elite" || ai.aicategory == "boss")) {
                var_751df20fceaee5 ent_flag_set("exfil_boss_alive");
            }
        }
    }
    return var_5eb85cc70f4b70a0;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc82
// Size: 0x12b
function function_d006864bb66299cb(var_751df20fceaee5) {
    var_751df20fceaee5 endon("exfil_complete_kill_count");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    var_61cfb0316b4fd931 = 3000;
    n_cleanup_dist_sq = 1000000;
    var_69409d41a2d5a2dd = 1;
    var_751df20fceaee5.n_cleanups_processed_this_frame = function_53c4c53197386572(var_751df20fceaee5.n_cleanups_processed_this_frame, 0);
    n_next_eval = 0;
    while (1) {
        waitframe();
        n_time = gettime();
        if (n_time < n_next_eval) {
            continue;
        }
        n_next_eval = n_next_eval + var_61cfb0316b4fd931;
        a_ai_enemies = var_751df20fceaee5.var_ed2b93690e12fb86;
        foreach (ai_enemy in a_ai_enemies) {
            if (!isalive(ai_enemy)) {
                continue;
            }
            if (var_751df20fceaee5.n_cleanups_processed_this_frame >= var_69409d41a2d5a2dd) {
                var_751df20fceaee5.n_cleanups_processed_this_frame = 0;
                waitframe();
            }
            ai_enemy do_cleanup_check(var_751df20fceaee5, n_cleanup_dist_sq);
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdb4
// Size: 0x17b
function do_cleanup_check(var_751df20fceaee5, n_cleanup_dist_sq) {
    var_29fbeef6861b44a9 = 5000;
    if (!isalive(self)) {
        return;
    }
    if (istrue(self.var_9df083b474817260)) {
        return;
    }
    if (!isdefined(self.spawntime)) {
        return;
    }
    n_time_alive = gettime() - self.spawntime;
    if (n_time_alive < var_29fbeef6861b44a9) {
        return;
    }
    if (istrue(self.var_3966ab82314136d4)) {
        return;
    }
    var_b2aba8329033df3d = function_8db1b18eb8068fb9(var_751df20fceaee5);
    var_751df20fceaee5.n_cleanups_processed_this_frame++;
    if (!var_b2aba8329033df3d) {
        n_dist_sq_min = 10000000;
        players = var_751df20fceaee5.var_c9164736baf0694a;
        e_closest_player = players[0];
        foreach (player in players) {
            if (!isalive(player) || player.sessionstate == "spectator") {
                continue;
            }
            n_dist_sq = distancesquared(self.origin, player.origin);
            if (n_dist_sq < n_dist_sq_min) {
                n_dist_sq_min = n_dist_sq;
                e_closest_player = player;
            }
        }
        if (n_dist_sq_min >= n_cleanup_dist_sq) {
            thread function_3c4b268a77e183ed(var_751df20fceaee5);
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf36
// Size: 0x2e
function function_3c4b268a77e183ed(var_751df20fceaee5) {
    self.var_3966ab82314136d4 = 1;
    delete_zombie_noone_looking(var_751df20fceaee5);
    if (isdefined(self)) {
        self.var_3966ab82314136d4 = undefined;
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf6b
// Size: 0xaa
function delete_zombie_noone_looking(var_751df20fceaee5) {
    if (istrue(self.in_the_ground)) {
        return;
    }
    if (!self.takedamage) {
        return;
    }
    foreach (player in level.players) {
        if (!isalive(player) || player.sessionstate == "spectator") {
            continue;
        }
        if (namespace_7843e1029b5c80e::player_can_see_ai(player, self)) {
            return;
        }
    }
    cleanup_zombie(var_751df20fceaee5);
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc01c
// Size: 0xbc
function cleanup_zombie(var_751df20fceaee5) {
    if (!isalive(self)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    /#
    #/
    self.var_7a605ee6cf55d136 = 1;
    self.var_912527d7e0ebef7 = 1;
    self.allowdeath = 1;
    self.var_7e4b076a06c6df27 = 1;
    self.no_powerups = 1;
    var_751df20fceaee5.var_ed2b93690e12fb86 = array_remove(var_751df20fceaee5.var_ed2b93690e12fb86, self);
    if (istrue(self.var_47993ccd09da9c11)) {
        var_751df20fceaee5.var_6e5b4d39d36d4d34--;
    }
    self kill();
    waitframe();
    if (isdefined(self)) {
        if (isagent(self)) {
            namespace_14d36171baccf528::despawnagent();
        } else {
            self delete();
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0df
// Size: 0x53
function function_895c7e0e9911ff6e(var_751df20fceaee5, var_26650da51bc166c9, var_10d811cf638edb91) {
    a_players = self;
    if (!isarray(a_players)) {
        a_players = [0:a_players];
    }
    if (istrue(var_10d811cf638edb91)) {
        namespace_446fc987a980892f::function_c1c677ed7a1b1128(var_26650da51bc166c9, a_players);
    } else {
        namespace_446fc987a980892f::function_d87d5deb069bf8e5(var_26650da51bc166c9, a_players);
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc139
// Size: 0x28a
function function_4b5e408a00f4ddd8(var_751df20fceaee5, var_f7ed3fab43f58dc7) {
    if (!isdefined(var_751df20fceaee5) || istrue(var_751df20fceaee5.var_1326008dc390c510)) {
        return;
    }
    var_751df20fceaee5.b_disabled = 1;
    var_751df20fceaee5 notify("endon_start_exfil_spawns_at_destination");
    level.var_44194c664b77bf1b = array_remove(level.var_44194c664b77bf1b, var_751df20fceaee5);
    if (isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
        var_751df20fceaee5.var_d182b8d3f3aaa93b notify("end_exfil_interact_objective_distance");
        if (isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b.n_obj_id)) {
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(var_751df20fceaee5.var_d182b8d3f3aaa93b.n_obj_id);
            var_751df20fceaee5.var_d182b8d3f3aaa93b.n_obj_id = undefined;
        }
        if (isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b.interact)) {
            if (isent(var_751df20fceaee5.var_d182b8d3f3aaa93b.interact)) {
                if (var_751df20fceaee5.var_d182b8d3f3aaa93b.interact isusable()) {
                    var_751df20fceaee5.var_d182b8d3f3aaa93b.interact function_dfb78b3e724ad620(0);
                }
            } else {
                var_751df20fceaee5.var_d182b8d3f3aaa93b.interact setscriptablepartstate("cp_mp_exfil_icon", istrue(var_f7ed3fab43f58dc7) ? "empty_icon" : "disabled_icon");
                var_751df20fceaee5.var_d182b8d3f3aaa93b.interact setscriptablepartstate("cp_mp_exfil_site", "standby");
                var_751df20fceaee5.var_d182b8d3f3aaa93b.interact setscriptablepartstate("cp_mp_exfil_smoke", "stop");
            }
        }
    }
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572) && !is_equal(var_751df20fceaee5.var_d182b8d3f3aaa93b, var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b) && isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b)) {
        var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b function_dfb78b3e724ad620(0);
        if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b.n_obj_id)) {
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b.n_obj_id);
            var_751df20fceaee5.var_55b9fdf7eacf9572.var_cd49f3cec04f0e2b.n_obj_id = undefined;
        }
    }
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3ca
// Size: 0xc
function function_c51a46f4a60b13d5() {
    return level.var_2562ea48235e90b5;
}

// Namespace exfil/namespace_9f6a961447bab709
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3de
// Size: 0xc
function function_8e6454dd6d0cedd3() {
    return level.var_44194c664b77bf1b;
}
