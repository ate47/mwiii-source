#using scripts\common\values.gsc;
#using script_2047cdbf5176ba0;
#using script_92b815b18f0ba61;
#using script_3fe26dc5c76ef6fd;
#using script_4e6e58ab5d96c2b0;
#using script_3eebdadae1029540;
#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\exploder.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\common\devgui.gsc;
#using script_6df6604a74a7a9c7;
#using script_100adcc1cc11d2fa;
#using script_16428d24c490aed3;
#using script_604384bb15a612ea;
#using script_1d306ffd8d10d8d0;
#using script_528320cb3630530d;
#using script_b55c9b179cfa126;
#using script_16a7cb806f08d342;
#using script_26ab050f00d2d52b;
#using script_73041f15e3d386a4;
#using script_7c0779b0e4778e4;
#using script_3d91fbc054526de1;
#using scripts\mp\gamelogic.gsc;
#using script_22f1701e151b9d12;
#using script_7c40fa80892a721;
#using script_2b264b25c7da0b12;
#using script_7b2517368c79e5bc;
#using script_64316dc775e91122;
#using script_6bffae1b97f70547;
#using script_398835140857d740;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\common\debug.gsc;

#namespace mp_jup_tower_ob;

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xf79
// Size: 0x10
function autoexec init() {
    level.var_9180efe6324031e6 = &main;
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf91
// Size: 0x238
function main() {
    setdvar(@"hash_2fe0283b419ff08a", 1);
    function_eb7f544259415a09("mp_jup_tower_ob");
    level.var_60af3227c0f55adf = 1;
    level.var_b017944f02bb5e97 = 1;
    level.outofboundstriggers = getentarray("OutOfBounds_ob", "targetname");
    level.var_db80981879714f15 = &namespace_b000de497fab9bf4::function_348e0a3041479e64;
    var_ba4f4b9b7988606f = spawn_tag_origin((0, 0, 5500));
    if (isdefined(var_ba4f4b9b7988606f)) {
        var_ba4f4b9b7988606f.targetname = "airstrikeheight";
        level.var_ba4f4b9b7988606f = var_ba4f4b9b7988606f;
    }
    function_899963e9fdcf0037();
    namespace_b000de497fab9bf4::function_c9eea6ea790d37bd();
    function_43983d74c830fa72("outbreak_riftrun");
    callback::add("player_spawned", &function_2dcca6d862cc31d5);
    callback::add("player_connect", &function_fa23f1ae81456c13);
    if (!getdvarint(@"hash_abc1d9ea495ec189", 0)) {
        callback::add("player_item_drop", &namespace_618dd2e6238edda3::on_item_drop);
    }
    namespace_4532218b4b50401c::main();
    scripts\engine\utility::flag_set("lockedspaces_create_script_initialized");
    thread namespace_78226fae3eeabe9a::main();
    thread function_135c08561081b6cf();
    thread function_8b3ac0a9093cca63();
    thread function_f881f5cb77a4ddb8();
    thread function_d588f8bc9eeb10dc();
    thread function_c3954aec42cc388e();
    level callback::add("register_features", &function_1120fe706b433694);
    level callback::add("register_activities", &function_acc57f1e237afdd6);
    if (getdvarint(@"ob_rift_run", 0)) {
        level callback::add("ob_dark_aether_exit_used", &function_61aea37385c298a9);
        level callback::add("register_objectives", &function_105fa8046007a4a7);
        level callback::add("on_zombie_ai_spawned", &function_9d13ff1a109b9164);
        level callback::add("outlast_phase_crystals_destroyed", &namespace_78226fae3eeabe9a::function_bfd6485208f4b621);
        namespace_d38a1af3e02dea2f::function_48e697a59457ec45();
        namespace_b72446b1c5d96ab2::main();
        namespace_be782c9f6f4b41fe::main();
        thread function_1bf53eccbaaa61d3();
        return;
    }
    if (getdvarint(@"hash_59607ab5ab54dddd", 0)) {
        scripts\engine\utility::registersharedfunc("obInfil", "customInfilSkipFlow", &function_e9d22563e1d95d65);
        namespace_d079df9ed8a52f::main();
        namespace_8eecc4aca22be002::main();
        namespace_966712bc5b6ec1aa::main();
        thread function_b8f0069de10ceb99();
        thread function_632bf331b85b85ac();
        level callback::add("on_zombie_ai_spawned", &function_9d13ff1a109b9164);
    }
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11d1
// Size: 0x18e
function function_e9d22563e1d95d65() {
    setdvar(@"hash_45ce1e830caba62a", 0.75);
    callback::add("player_connect", &namespace_d3f2c5e05b9c4573::on_connect);
    level.var_9b36be4fbd603ba7 = getdvarfloat(@"hash_39ea6191970eb227", 30);
    level.var_598d90c6bc821de7 = getdvarfloat(@"hash_d0703186b655c867", 9);
    level.var_4df4777277c281ff = 1;
    level.var_fd915e8bd20b6d09 = &namespace_d3f2c5e05b9c4573::function_93e3fe0e5693889b;
    foreach (team in level.teamnamelist) {
        level.requiredplayercount[team] = 0;
    }
    setdvar(@"hash_1b65b5ed4995fe92", 0);
    level.prematchperiod = getdvarint(@"hash_272183f590c7fe39", 30);
    /#
        start_str = getdvar(@"start");
        if (!is_equal(start_str, "<dev string:x1c>") && !is_equal(start_str, "<dev string:x20>")) {
            level.prematchperiod = 1;
        }
    #/
    level.matchcountdowntime = level.prematchperiod + getdvarint(@"hash_42da3545a0618ba9", 1);
    level.prematchperiodend = level.matchcountdowntime;
    thread scripts\mp\gamelogic::matchstarttimer("match_starting_in", level.prematchperiodend);
    level thread function_219ccd13654aeca0();
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1367
// Size: 0xdb
function function_b896c581d1a39b24(teamname, squadid) {
    if (!(isdefined(level.squaddata[teamname]) && isdefined(level.squaddata) && isdefined(squadid) && isdefined(teamname) && isdefined(level.squaddata[teamname][squadid]))) {
        return undefined;
    }
    players = level.squaddata[teamname][squadid].players;
    spawnpoint = function_67d9a8af368e98a0(teamname, squadid);
    if (!isdefined(spawnpoint)) {
        return undefined;
    }
    var_9bcca6aa56ca8e0c = getdvarint(@"hash_d04abc712354de2d");
    level thread namespace_d3f2c5e05b9c4573::function_f8e774228da7fd80(spawnpoint, teamname, var_9bcca6aa56ca8e0c);
    players = array_removeundefined(players);
    if (getdvarint(@"hash_7b68b0ae5369bbe4", 0) == 1) {
        players = array_randomize(players);
    }
    if (!players.size) {
        return undefined;
    }
    return players;
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x144b
// Size: 0x10f
function function_82b06dfd59cced40(player) {
    player endon("disconnect");
    var_f85ec083b500a1ca = getdvarfloat(@"hash_45ce1e830caba62a", 0.75);
    wait var_f85ec083b500a1ca;
    if (!isdefined(player)) {
        return;
    }
    player _freezelookcontrols(0, 1);
    player val::reset_all("ob_infil");
    player playershow(1);
    player lerpfovbypreset("default");
    player function_af4b9b0f0e7c6c42(0);
    player notify("screen_completely_black");
    player lerpfovscalefactor(1, 1);
    logstring("OB INFIL: Player " + player.name + " status of participating in cinematics after infil: [" + player function_3e2c0f85fe7ca957() + "] at time " + gettime());
    assertex(!player function_3e2c0f85fe7ca957(), "<dev string:x29>");
    println("<dev string:x86>" + player.name + "<dev string:x9b>" + gettime());
    logstring("OB INFIL: Player " + player.name + " done with custom infil at time " + gettime());
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1562
// Size: 0x164
function function_219ccd13654aeca0() {
    level endon("game_ended");
    scripts\mp\flags::gameflagset("infil_will_run");
    level waittill_any_2("match_start_real_countdown", "match_start_timer_skip");
    setomnvar("ui_mp_extended_load_screen", 0);
    setomnvar("ui_in_infil", -1);
    level thread function_f39906ad71bd2029();
    /#
        if (isdefined(level.var_2feb1fee386da049)) {
            println("<dev string:xbf>" + level.var_2feb1fee386da049);
        }
        if (isdefined(level.var_6cbb7e30776f280e)) {
            println("<dev string:xfb>" + level.var_6cbb7e30776f280e);
        }
    #/
    foreach (teamname, var_70643c8580524236 in level.squaddata) {
        foreach (squad in var_70643c8580524236) {
            if (squad.players.size > 0) {
                players = function_b896c581d1a39b24(teamname, squad.index);
                level thread function_7cec19ffa37cd482(players);
                waitframe();
            }
        }
    }
    level flag_set("ob_infil_squad_setup");
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16ce
// Size: 0x50
function function_f39906ad71bd2029() {
    level flag_wait_or_timeout("ob_infil_igc_start", level.prematchperiod);
    level notify("obInfil_countdownStart");
    scripts\mp\flags::gameflagwait("prematch_done");
    level.infilcompleted = 1;
    level flag_set("ob_infil_completed");
    callback::callback("on_ob_infil_complete");
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1726
// Size: 0x1a1
function function_67d9a8af368e98a0(teamname, squadid) {
    spawnpoint = undefined;
    if (!(isdefined(level.squaddata[teamname]) && isdefined(level.squaddata) && isdefined(squadid) && isdefined(teamname) && isdefined(level.squaddata[teamname][squadid]))) {
        return spawnpoint;
    }
    players = level.squaddata[teamname][squadid].players;
    if (isdefined(level.var_796ae5bb031f323d)) {
        var_c47fa8157a1a841e = [];
        foreach (player in players) {
            if (isdefined(player.var_87a91b2a8231f4f8)) {
                squad_spawn = player.var_87a91b2a8231f4f8;
            } else {
                squad_spawn = player [[ level.var_796ae5bb031f323d ]]();
            }
            var_c47fa8157a1a841e[var_c47fa8157a1a841e.size] = squad_spawn;
        }
        var_c4df5904366785de = var_c47fa8157a1a841e[0];
        foreach (squad_spawn in var_c47fa8157a1a841e) {
            if (squad_spawn.origin[2] > var_c4df5904366785de.origin[2]) {
                var_c4df5904366785de = squad_spawn;
            }
        }
        spawnpoint = var_c4df5904366785de;
    } else {
        spawnpoint = level.teamdata[teamname]["startPoint"];
    }
    return spawnpoint;
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18d0
// Size: 0x297
function function_7cec19ffa37cd482(players) {
    if (!isdefined(players)) {
        return;
    }
    foreach (player in players) {
        player thread namespace_d3f2c5e05b9c4573::function_ba66440ae6d60988("ob_infil_ava_jansen_spawned", "ob_infil_sergei_ravenov_spawned");
        player lerpfovscalefactor(0, 0);
        player.var_f4bb3d8522246fdc = undefined;
        player val::set("ob_infil", "show_hud", 1);
        player val::set("ob_infil", "freezecontrols", 0);
        player val::set("ob_infil", "weapon_switch", 0);
        player thread function_c42fe306277ca4fe();
        thread function_29fc786decbf9a1f(player);
        thread function_992f2393243ecd45(player);
        if (isdefined(level.var_2ada333c838a2316)) {
            end_angle = vectortoangles(level.var_2ada333c838a2316.origin - player geteye());
            player setplayerangles(end_angle);
        }
        var_e8067a3d33f14df6 = utility::getstruct("intro_clamp_struct", "targetname");
        end_angle = vectortoangles(var_e8067a3d33f14df6.origin - player geteye());
        var_8a255e18f4e97c7e = utility::spawn_script_origin(player.origin, end_angle);
        var_8a255e18f4e97c7e setmodel("tag_origin");
        player setplayerangles(end_angle);
        player playerlinktodelta(var_8a255e18f4e97c7e, "tag_origin", 0, 38, 38, 25, 20, 0);
    }
    scripts\mp\flags::gameflagset("infil_started");
    flag_wait("rift_run_infil_gate_collapse_triggered");
    level flag_wait("ob_infil_completed");
    thread function_5954f735dd26765c(players);
    players = array_removeundefined(players);
    foreach (player in players) {
        player notify("ob_playInfil");
        player clearsoundsubmix("jup_ob_prematch", 1);
        player.var_f4bb3d8522246fdc = undefined;
        println("<dev string:x135>" + player.name + "<dev string:x153>" + gettime());
        logstring("OB Rift Run Infil: Player " + player.name + " starting infil! at time " + gettime());
        thread function_82b06dfd59cced40(player);
        player val::set("ob_infil", "weapon_switch", 1);
    }
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b6f
// Size: 0x27
function function_992f2393243ecd45(player) {
    wait 1;
    if (soundexists("ob_s5_story_intro_portal_close")) {
        player playlocalsound("ob_s5_story_intro_portal_close");
    }
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1b9e
// Size: 0x227
function function_10c81ffffdb8d926(wait_time, fade_in_time, fade_out_time, var_a3ee1f9882c0c2e6) {
    self endon("death_or_disconnect");
    wait_time = default_to(wait_time, 1);
    fade_in_time = default_to(fade_in_time, 0.6);
    var_a3ee1f9882c0c2e6 = default_to(var_a3ee1f9882c0c2e6, 1);
    fade_out_time = default_to(fade_out_time, 3);
    if (!isdefined(self.var_ad173ac833a970d4)) {
        self.var_ad173ac833a970d4 = newclienthudelem(self);
        self.var_ad173ac833a970d4.x = 0;
        self.var_ad173ac833a970d4.y = 0;
        self.var_ad173ac833a970d4 setshader("white", 640, 480);
        self.var_ad173ac833a970d4.alignx = "left";
        self.var_ad173ac833a970d4.aligny = "top";
        self.var_ad173ac833a970d4.sort = 1;
        self.var_ad173ac833a970d4.horzalign = "fullscreen";
        self.var_ad173ac833a970d4.vertalign = "fullscreen";
        self.var_ad173ac833a970d4.alpha = 0;
        self.var_ad173ac833a970d4.foreground = 1;
        self.var_ad173ac833a970d4.archived = 0;
        self.var_ad173ac833a970d4.scramblerdisabled = 1;
    }
    var_52bee65a8171b558 = fade_in_time;
    n_target_alpha = var_a3ee1f9882c0c2e6;
    self.var_ad173ac833a970d4 fadeovertime(var_52bee65a8171b558);
    self.var_ad173ac833a970d4.alpha = n_target_alpha;
    wait wait_time;
    if (soundexists("evt_entity_arena_respawn_teleport_plr")) {
        self playlocalsound("evt_entity_arena_respawn_teleport_plr");
    }
    var_52bee65a8171b558 = fade_out_time;
    self.var_ad173ac833a970d4 fadeovertime(var_52bee65a8171b558);
    self.var_ad173ac833a970d4.alpha = 0;
    wait var_52bee65a8171b558;
    if (isdefined(self.var_ad173ac833a970d4)) {
        self.var_ad173ac833a970d4 destroy();
    }
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dcd
// Size: 0x137
function function_29fc786decbf9a1f(player) {
    player endon("disconnect");
    var_36fedcca9fa6b8bb = player getcurrentweapon();
    if (isnullweapon(var_36fedcca9fa6b8bb)) {
        foreach (weapon in player.primaryweapons) {
            if (!isnullweapon(weapon)) {
                var_36fedcca9fa6b8bb = weapon;
                break;
            }
        }
    }
    player takeweapon(var_36fedcca9fa6b8bb);
    msg = player utility::waittill_any_timeout_1(45, "ws_raise");
    player hidefromplayer(player);
    player setdemeanorviewmodel("normal");
    player takeweapon(var_36fedcca9fa6b8bb);
    player giveweapon(var_36fedcca9fa6b8bb);
    player switchtoweaponimmediate(var_36fedcca9fa6b8bb);
    player notify("end_ob_infil_monitor_third_person");
    setthirdperson = istrue(player.var_8789029d90c5e2de);
    player setcamerathirdperson(setthirdperson);
    player setclientomnvar("ui_toggle_third_person", setthirdperson);
    player setplayerdata("common", "mpProgression", "thirdPerson", setthirdperson);
    player.var_8789029d90c5e2de = undefined;
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f0c
// Size: 0x1a
function function_8b3ac0a9093cca63() {
    level flag_wait("ob_infil_completed");
    level.disableannouncer = 1;
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f2e
// Size: 0x3b
function function_fa23f1ae81456c13(sparams) {
    delaythread(0.5, &function_1b4c60d1baa7885f, "outbreak_riftrun");
    if (getdvarint(@"hash_59607ab5ab54dddd", 0)) {
        namespace_7cfbe143d5bda274::function_a3a8b481a6ec1565(sparams);
    }
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f71
// Size: 0x167
function function_f881f5cb77a4ddb8() {
    level flag_wait("ai_spawn_director_initialized");
    if (getdvarint(@"ob_rift_run", 0)) {
        function_9b8829ab4092a7d7("ob_rift_run", 1);
        function_9b8829ab4092a7d7("ob_rift_run_zombie_ambient", 1);
        function_9b8829ab4092a7d7("ob_zombie_ambient", 0);
        if (getdvarint(@"hash_73cfb77eb49c943", 0)) {
            function_9b8829ab4092a7d7("ob_rift_run_hard", 1);
        } else {
            function_9b8829ab4092a7d7("ob_rift_run_normal", 1);
        }
        setdvar(@"hash_f1d095735ac37f33", 1);
    } else {
        function_9b8829ab4092a7d7("ob_zombie_ambient", 0);
        function_9b8829ab4092a7d7("ob_rift_story", 1);
        setdvar(@"hash_f1d095735ac37f33", 0);
    }
    a_blockers = getstructarray("s_ambient_blocker", "targetname");
    s_blockers = getstructarray("s_ambient_blocker", "script_noteworthy");
    a_blockers = array_combine(a_blockers, s_blockers);
    foreach (pos in a_blockers) {
        if (isdefined(pos.radius)) {
            function_606642b946a01237("ambient_blocker", pos.origin, pos.radius, 1);
        }
    }
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20e0
// Size: 0x16
function function_135c08561081b6cf() {
    level flag_wait("ai_spawn_director_initialized");
    namespace_614554f86e52695c::function_b1fa4578ef08136f();
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20fe
// Size: 0x220
function function_632bf331b85b85ac() {
    level flag_wait("ob_infil_completed");
    var_aa44570d0ce3af7c = [];
    var_cd05af3824c52cde = getentitylessscriptablearray("s_outlast_fort", "target");
    foreach (prop_scriptable in var_cd05af3824c52cde) {
        if (is_equal(prop_scriptable.script_noteworthy, "outlast_phase_crystal")) {
            if (!isdefined(prop_scriptable.targetname)) {
                continue;
            }
            switch (prop_scriptable.targetname) {
            case #"hash_3fc1dec043e7c2ed":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_01");
                break;
            case #"hash_4f4b067cdd2a227d":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_02");
                break;
            case #"hash_fafe02a60e439165":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_03");
                break;
            case #"hash_9ceae540f6c4f91f":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_04");
                break;
            case #"hash_3e70bc44fce010a4":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_05");
                break;
            case #"hash_59ca4af302edd1d9":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_06");
                break;
            }
            continue;
        }
        if (is_equal(prop_scriptable.targetname, "outlast_aether_vfx_prop") && isdefined(prop_scriptable.script_noteworthy) && prop_scriptable getscriptableparthasstate("body", prop_scriptable.script_noteworthy)) {
            prop_scriptable setscriptablepartstate("body", prop_scriptable.script_noteworthy);
            continue;
        }
        if (prop_scriptable getscriptableparthasstate("body", "enabled")) {
            prop_scriptable setscriptablepartstate("body", "enabled");
            continue;
        }
        if (prop_scriptable getscriptableparthasstate("base", "enabled")) {
            prop_scriptable setscriptablepartstate("base", "enabled");
        }
    }
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2326
// Size: 0x24a
function function_b60de1b748c7230f() {
    ammo_mods = ["brainrot", "deadwire", "napalmburst", "cryofreeze", "shatterblast"];
    self.var_bed158a6dfac230d = 3;
    self.maxarmorhealth = self.var_bed158a6dfac230d * level.var_4b78859bacc88808;
    waitframe();
    namespace_f8d3520d3483c1::setArmorHealth(self.maxarmorhealth);
    waitframe();
    namespace_f8d3520d3483c1::function_9c6e9a6643b6c9a6(3);
    waitframe();
    namespace_1d863a7bbc05fc52::function_188085b8b8d431f2(1);
    waitframe();
    a_weapons = self getweaponslist("primary");
    foreach (weapon in a_weapons) {
        self takeweapon(weapon);
    }
    waitframe();
    fakeitem = spawnstruct();
    var_d7732d0238eae9ff = 50;
    item_entry = "ob_jup_item_weapon_ar_acharlie_blue";
    item_bundle = getscriptbundle("itemspawnentry:" + item_entry);
    item_scriptable = item_bundle.scriptable;
    fakeitem.count = namespace_2abc885019e1956::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
    namespace_2abc885019e1956::function_7f6f62ba8dfd0da0(item_bundle, fakeitem);
    fakeitem = spawnstruct();
    var_d7732d0238eae9ff = 50;
    item_entry = "ob_jup_item_weapon_sm_coscar635_blue";
    item_bundle = getscriptbundle("itemspawnentry:" + item_entry);
    item_scriptable = item_bundle.scriptable;
    fakeitem.count = namespace_2abc885019e1956::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
    namespace_2abc885019e1956::function_7f6f62ba8dfd0da0(item_bundle, fakeitem);
    wait 0.5;
    a_weapons = self getweaponslist("primary");
    for (i = 0; i < 2; i++) {
        currentweapon = a_weapons[i];
        if (namespace_a4ff02beedc1bce8::can_pap(currentweapon)) {
            namespace_a4ff02beedc1bce8::pap_weapon(currentweapon, 2);
        }
        waitframe();
        var_4bc27b790622bd85 = randomint(ammo_mods.size);
        namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(a_weapons[i], ammo_mods[var_4bc27b790622bd85]);
    }
    waitframe();
    namespace_876b4362ef613d7a::give_perk("specialty_juggernog", 0);
    namespace_876b4362ef613d7a::give_perk("specialty_speedcola", 0);
    namespace_876b4362ef613d7a::give_perk("specialty_quickrevive", 0);
    namespace_876b4362ef613d7a::give_perk("specialty_staminup", 0);
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2578
// Size: 0x289
function function_d588f8bc9eeb10dc() {
    flag_wait("ob_systems_init_complete");
    level._effect["floating_train_speedup"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_blast.vfx");
    level.var_1e22fb94d4a70d49 = [];
    level.var_b5b883ba4d0a8906 = [];
    level.var_b5b883ba4d0a8906["obj_oop_a"] = 0;
    level.var_b5b883ba4d0a8906["obj_oop_c"] = 0;
    level.var_2050f6176cd525cd = [];
    i = 0;
    for (var_932f9fc175fcb5fb = getent("train_car_model_" + i, "script_noteworthy"); isdefined(var_932f9fc175fcb5fb); var_932f9fc175fcb5fb = getent("train_car_model_" + i, "script_noteworthy")) {
        var_932f9fc175fcb5fb forcenetfieldhighlod(1);
        var_932f9fc175fcb5fb setmoverantilagged(1);
        var_932f9fc175fcb5fb function_7126c9ace48ce815(1);
        var_932f9fc175fcb5fb.moverdoesnotkill = 1;
        var_932f9fc175fcb5fb.var_280fff393f8fb869 = 1;
        var_8fab6ad839815d91 = getentarray("train_car_" + i, "script_noteworthy");
        var_5555f1516244de14 = getentarray("train_car_details_" + i, "script_noteworthy");
        if (!isdefined(var_932f9fc175fcb5fb)) {
            return;
        }
        foreach (var_7e58f69086b20558 in var_8fab6ad839815d91) {
            var_7e58f69086b20558 linkto(var_932f9fc175fcb5fb);
            var_7e58f69086b20558 forcenetfieldhighlod(1);
            var_7e58f69086b20558 setmoverantilagged(1);
            var_7e58f69086b20558.moverdoesnotkill = 1;
        }
        foreach (var_a4e6fa3d87ad5def in var_5555f1516244de14) {
            var_a4e6fa3d87ad5def linkto(var_932f9fc175fcb5fb);
            var_a4e6fa3d87ad5def.moverdoesnotkill = 1;
        }
        var_932f9fc175fcb5fb.clips = var_8fab6ad839815d91;
        var_932f9fc175fcb5fb.var_48547f0431a48b3 = i;
        var_932f9fc175fcb5fb.var_34ba1f083578211e = 0;
        var_932f9fc175fcb5fb.var_b29eb670220d7241 = 0;
        level.var_1e22fb94d4a70d49 = array_add(level.var_1e22fb94d4a70d49, var_932f9fc175fcb5fb);
        if (i < 11) {
            var_932f9fc175fcb5fb thread function_74846464eb0633f7("obj_oop_a");
        } else {
            var_932f9fc175fcb5fb thread function_74846464eb0633f7("obj_oop_c");
        }
        /#
            if (getdvarint(@"hash_47ef778afe626607", 0)) {
                level thread function_ca17670c2e892f7f(var_932f9fc175fcb5fb);
            }
        #/
        i++;
    }
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2809
// Size: 0xa17
function function_74846464eb0633f7(objname) {
    start_node = getstruct("trainstation_train_start_" + self.var_48547f0431a48b3, "script_noteworthy");
    if (!isdefined(start_node)) {
        return;
    }
    self moveto(start_node.origin, 0.05);
    self rotateto(start_node.angles, 0.05);
    wait 1;
    foreach (var_7e58f69086b20558 in self.clips) {
        if (var_7e58f69086b20558.spawnflags & 1) {
            var_7e58f69086b20558 disconnectpaths();
            var_7e58f69086b20558.path_blocked = 1;
        }
    }
    if (getdvarint(@"hash_f02ef7abbb934b68", 0)) {
        var_f940ab63500897ff = 8;
        utility::delaythread(var_f940ab63500897ff, &utility::flag_set, "flag_batch_cleansed_" + objname);
        utility::delaythread(var_f940ab63500897ff + 5, &utility::flag_set, "flag_batch_cleansed_5_" + objname);
        utility::delaythread(var_f940ab63500897ff + 10, &utility::flag_set, "flag_batch_cleansed_10_" + objname);
    } else if (!isdefined(start_node.script_label) || start_node.script_label != "do_float" && start_node.script_label != "move_on_spawn") {
        flag_wait("oop_scattered_or_skipped_" + objname);
        function_7662d42a580b8a9b();
    }
    if (isdefined(start_node.script_label) && start_node.script_label == "do_float") {
        current_node = start_node;
    } else if (isdefined(start_node.target)) {
        current_node = getstruct(start_node.target, "targetname");
    }
    start_time = gettime();
    if (getdvarint(@"hash_20497aa63a9273a0", 0)) {
        flag_set("flag_debug_speed_up_train_start");
    }
    while (isdefined(current_node)) {
        if (isdefined(self.script_maxdist) && !players_within_distance(self.script_maxdist) && !getdvarint(@"ob_s5_rift_run", 0)) {
            if (self.var_280fff393f8fb869) {
                self forcenetfieldhighlod(0);
                self setmoverantilagged(0);
                foreach (var_7e58f69086b20558 in self.clips) {
                    var_7e58f69086b20558 forcenetfieldhighlod(0);
                    var_7e58f69086b20558 setmoverantilagged(0);
                }
            }
            self.var_280fff393f8fb869 = 0;
            /#
                if (getdvarint(@"hash_3a5d91a174d0fb7f", 0)) {
                    level thread scripts\cp_mp\utility\debug_utility::drawsphere(self.origin, 200, 3, (1, 0, 0));
                }
            #/
            wait 3;
            continue;
        } else if (isdefined(self.script_maxdist) && !self.var_280fff393f8fb869) {
            self.var_280fff393f8fb869 = 1;
            self forcenetfieldhighlod(1);
            self setmoverantilagged(1);
            foreach (var_7e58f69086b20558 in self.clips) {
                var_7e58f69086b20558 forcenetfieldhighlod(1);
                var_7e58f69086b20558 setmoverantilagged(1);
            }
        }
        var_71a4d978bfff0607 = distance(current_node.origin, self.origin);
        if (var_71a4d978bfff0607 > 0) {
            foreach (var_7e58f69086b20558 in self.clips) {
                if (istrue(var_7e58f69086b20558.path_blocked)) {
                    var_7e58f69086b20558 connectpaths();
                    var_7e58f69086b20558.path_blocked = 0;
                }
            }
            var_b09536ae6db60bc9 = default_to(current_node.script_speed, 170);
            if (flag("flag_debug_speed_up_train_start") && !time_has_passed(start_time, 5)) {
                var_b09536ae6db60bc9 = 2000;
            } else if (function_c9d7bb23b0d9620e(objname)) {
                if (!istrue(self.var_209b1e8800e5086c)) {
                    self.var_209b1e8800e5086c = 1;
                    playfxontag(level._effect["floating_train_speedup"], self, "tag_origin");
                }
                var_f92edc4530286fd0 = (gettime() - level.var_6c74c58b7bf75f9e[objname]) / 1000;
                var_48e80fac640265d0 = 1 - var_f92edc4530286fd0 / 60;
                var_bf6d1fb08d0ac811 = 230 * var_48e80fac640265d0;
                var_b09536ae6db60bc9 += var_bf6d1fb08d0ac811;
            }
            if (flag("flag_enable_auto_spacing_" + objname)) {
                var_b09536ae6db60bc9 *= function_31e3b9daaadeeb03(current_node.targetname);
            } else {
                self.var_b29eb670220d7241 = 0;
            }
            self.var_34ba1f083578211e = var_b09536ae6db60bc9;
            travel_time = var_71a4d978bfff0607 / var_b09536ae6db60bc9;
            var_ab5ab532a8bf8a17 = default_to(current_node.script_decel, 0);
            var_9f79fdd192a7c0aa = default_to(current_node.script_accel, 0);
            if (var_ab5ab532a8bf8a17 >= 2) {
                var_ab5ab532a8bf8a17 = travel_time;
                var_9f79fdd192a7c0aa = 0;
            } else if (var_ab5ab532a8bf8a17 == 1) {
                var_ab5ab532a8bf8a17 = travel_time * 0.5;
                var_9f79fdd192a7c0aa = var_9f79fdd192a7c0aa ? travel_time * 0.5 : 0;
            } else {
                var_ab5ab532a8bf8a17 = 0;
                var_9f79fdd192a7c0aa = var_9f79fdd192a7c0aa ? travel_time * 0.5 : 0;
            }
            self moveto(current_node.origin, travel_time, var_9f79fdd192a7c0aa, var_ab5ab532a8bf8a17);
            self rotateto(function_ae3ca63c76bfeb12(current_node), travel_time, var_9f79fdd192a7c0aa, var_ab5ab532a8bf8a17);
            function_550aa1e3067dea98(current_node.targetname);
            if (!flag("flag_batch_cleansed_" + objname)) {
                flag_wait_or_timeout("flag_batch_cleansed_" + objname, travel_time);
                function_7662d42a580b8a9b();
                if (flag("flag_batch_cleansed_" + objname)) {
                    continue;
                }
            } else {
                wait travel_time;
            }
        }
        do_float = isdefined(current_node.script_label) && current_node.script_label == "do_float";
        if (isdefined(current_node.script_flag_set)) {
            flag_set(current_node.script_flag_set);
        }
        if (!isdefined(current_node.target) && !isdefined(current_node.script_linkto) && !do_float) {
            return;
        }
        if (do_float) {
            if (!isdefined(self.var_fafa04e766ba2e01)) {
                self.var_fafa04e766ba2e01 = self.origin;
                self.var_3527bee7b3a69a0f = self.angles;
            }
            var_3b486d3678455b83 = flag(current_node.script_parameters);
            if (var_3b486d3678455b83) {
                waitframe();
            } else {
                foreach (var_7e58f69086b20558 in self.clips) {
                    if (istrue(var_7e58f69086b20558.path_blocked)) {
                        var_7e58f69086b20558 connectpaths();
                        var_7e58f69086b20558.path_blocked = 0;
                    }
                }
                function_7b2ef4b3581fd44e(current_node);
                thread function_18954968a63cc736(current_node.script_parameters);
                function_25ec394f5469ed5b(current_node.script_parameters);
                if (istrue(self.var_8f752a52909d9bf7)) {
                    self.var_8f752a52909d9bf7 = 0;
                    function_43853dc94a133843();
                    function_40255988232fd87d();
                    self.clips[0] undockmovingplatform();
                    delaythread(1, &function_43853dc94a133843, self);
                    delaythread(2, &function_43853dc94a133843, self);
                }
                if (!self.var_280fff393f8fb869) {
                    self.var_280fff393f8fb869 = 1;
                    self forcenetfieldhighlod(1);
                    self setmoverantilagged(1);
                    foreach (var_7e58f69086b20558 in self.clips) {
                        var_7e58f69086b20558 forcenetfieldhighlod(1);
                        var_7e58f69086b20558 setmoverantilagged(1);
                    }
                }
            }
        }
        /#
            if (isdefined(current_node.script_linkto) && getdvarint(@"hash_47ef778afe626607", 0)) {
                color = function_f57e654f7b26045(objname) ? (0, 1, 0) : (1, 0, 0);
                level thread scripts\cp_mp\utility\debug_utility::drawsphere(current_node.origin, 200, 3, color);
                level thread scripts\common\debug::debug_print3d(self, self.script_noteworthy, color, 3, undefined, undefined, 1, 2);
            }
        #/
        var_a9bf55c3ae198726 = flag("flag_batch_cleansed_" + objname);
        var_efa980e522132221 = flag("flag_batch_cleansed_near_done_" + objname);
        var_64d37dda3f6c2d6a = flag("flag_descattered_" + objname);
        var_61a145ed00559230 = flag("oop_skipped_" + objname);
        if ((var_a9bf55c3ae198726 || function_52e74edcd157beb4(objname) && var_efa980e522132221 && (var_64d37dda3f6c2d6a || var_61a145ed00559230)) && isdefined(current_node.script_linkto)) {
            if (isdefined(current_node.script_delay)) {
                wait current_node.script_delay;
            }
            current_node = current_node get_linked_struct();
            level.var_b5b883ba4d0a8906[objname]++;
            function_7662d42a580b8a9b();
            continue;
        }
        if (isdefined(current_node.target)) {
            current_node = getstruct(current_node.target, "targetname");
        }
    }
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3228
// Size: 0x6c
function function_7662d42a580b8a9b() {
    if (gameflag("infil_will_run")) {
        scripts\mp\flags::function_1240434f4201ac9d("infil_started");
    }
    flag_wait("scriptables_ready");
    if (ent_flag("playing_moving_sfx")) {
        return;
    }
    ent_flag_set("playing_moving_sfx");
    if (self isscriptable() && self getscriptablehaspart("moving")) {
        self setscriptablepartstate("moving", "on");
    }
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x329c
// Size: 0x19
function function_52e74edcd157beb4(objname) {
    if (objname == "obj_oop_c") {
        return true;
    }
    return false;
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32be
// Size: 0x1b1
function function_7b2ef4b3581fd44e(var_767b23d06bc6be02) {
    if (isdefined(var_767b23d06bc6be02) && isdefined(var_767b23d06bc6be02.script_wtf)) {
        if (isdefined(self.clips) && isarray(self.clips) && self.clips.size > 0 && self.clips[0].spawnflags & 4) {
            self.clips[0] dockmovingplatform(undefined);
            self.var_8f752a52909d9bf7 = 1;
            var_4a12199ed90aa1c5 = randomintrange(0, 999999);
            var_f0704f5752623235 = randomintrange(0, 999999);
            self.var_a0e68a5f2e48b773 = [];
            var_c61e3c48a72dbcf3 = getstructarray(var_767b23d06bc6be02.script_wtf, "targetname");
            foreach (var_d497e112513c1a32 in var_c61e3c48a72dbcf3) {
                var_d2b8b71e8c6cf0a4 = getstruct(var_d497e112513c1a32.target, "targetname");
                if (isdefined(var_d2b8b71e8c6cf0a4)) {
                    createnavlink(var_d497e112513c1a32.targetname + "_" + var_4a12199ed90aa1c5, var_d497e112513c1a32.origin, var_d2b8b71e8c6cf0a4.origin, var_d497e112513c1a32.script_noteworthy, 4);
                    self.var_a0e68a5f2e48b773[self.var_a0e68a5f2e48b773.size] = var_d497e112513c1a32.targetname + "_" + var_f0704f5752623235 + var_4a12199ed90aa1c5;
                    var_4a12199ed90aa1c5++;
                }
            }
        }
    }
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3477
// Size: 0xcb
function function_40255988232fd87d() {
    foreach (var_f031a6536163b5b2 in self.var_a0e68a5f2e48b773) {
        destroynavlink(var_f031a6536163b5b2);
        waitframe();
    }
    self.var_a0e68a5f2e48b773 = undefined;
    var_42bef2b79361fa61 = getaiarrayinradius(self.origin, 1000);
    foreach (ai in var_42bef2b79361fa61) {
        ai clearpath();
    }
    wait 0.2;
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x354a
// Size: 0x101
function function_43853dc94a133843(var_39bc2a83bf33f904) {
    if (!isdefined(var_39bc2a83bf33f904)) {
        var_39bc2a83bf33f904 = self;
    }
    var_39bc2a83bf33f904 endon("death");
    var_42bef2b79361fa61 = getaiarrayinradius(var_39bc2a83bf33f904.origin, 1000);
    foreach (ai in var_42bef2b79361fa61) {
        if (isalive(ai) && ai.team != "allies") {
            groundent = ai getgroundentity();
            if (isdefined(groundent) && (var_39bc2a83bf33f904 == groundent || var_39bc2a83bf33f904.clips[0] == groundent)) {
                ai.var_7e4b076a06c6df27 = 1;
                if (isdefined(ai.var_7050024e5f8ca246)) {
                    ai [[ ai.var_7050024e5f8ca246 ]]();
                }
                ai kill();
                wait 0.2;
            }
        }
    }
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3653
// Size: 0xa2
function function_ae3ca63c76bfeb12(node) {
    if (isdefined(node.script_angle_max)) {
        if (int(node.script_angle_max) == 0) {
            return node.angles;
        } else {
            n_rotate = randomfloatrange(int(node.script_angle_max) * 0.334, int(node.script_angle_max));
        }
    } else {
        n_rotate = randomfloatrange(2, 5);
    }
    if (utility::cointoss()) {
        n_rotate *= -1;
    }
    return node.angles + (n_rotate, n_rotate, n_rotate);
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x36fe
// Size: 0x1c2
function function_550aa1e3067dea98(var_8e6cf502c8d52254) {
    if (!isdefined(var_8e6cf502c8d52254)) {
        return;
    }
    if (!isdefined(self.var_970f630bbb1a087c)) {
        self.var_970f630bbb1a087c = [];
    }
    if (self.var_970f630bbb1a087c.size != 0) {
        foreach (var_8d8a55772595ced7 in self.var_970f630bbb1a087c) {
            level.var_2050f6176cd525cd[var_8d8a55772595ced7.targetname] = level.var_2050f6176cd525cd[var_8d8a55772595ced7.targetname] - 1;
        }
        self.var_970f630bbb1a087c = [];
    }
    next_node = getstruct(var_8e6cf502c8d52254, "targetname");
    for (i = 0; i < 1; i++) {
        if (!isdefined(level.var_2050f6176cd525cd[next_node.targetname])) {
            level.var_2050f6176cd525cd[next_node.targetname] = 0;
            /#
                if (getdvarint(@"hash_47ef778afe626607", 0)) {
                    level thread function_c78a1c50096c178d(next_node.origin, next_node.targetname);
                }
            #/
        }
        level.var_2050f6176cd525cd[next_node.targetname] = level.var_2050f6176cd525cd[next_node.targetname] + 1;
        self.var_970f630bbb1a087c = array_add(self.var_970f630bbb1a087c, next_node);
        if (i != 0 && isdefined(next_node.target)) {
            next_node = getstruct(next_node.target, "targetname");
        }
    }
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38c8
// Size: 0xca
function function_31e3b9daaadeeb03(var_6ba7370057392ca1) {
    if (!isdefined(var_6ba7370057392ca1)) {
        self.var_b29eb670220d7241 = 0;
        return 1;
    }
    var_238502fd117b9ea1 = array_remove(level.var_1e22fb94d4a70d49, self);
    for (i = 0; i < 3; i++) {
        var_ab1dbeccbefd2667 = getstruct(var_6ba7370057392ca1, "targetname");
        var_fc6af356d8044fa8 = getclosest(var_ab1dbeccbefd2667.origin, var_238502fd117b9ea1, 800);
        if (isdefined(var_fc6af356d8044fa8)) {
            self.var_b29eb670220d7241 = 0;
            return 1;
        }
        if (isdefined(var_ab1dbeccbefd2667.target)) {
            var_6ba7370057392ca1 = var_ab1dbeccbefd2667.target;
        }
    }
    self.var_b29eb670220d7241 = 1;
    return 1.2;
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x399b
// Size: 0x193
function function_f57e654f7b26045(objname) {
    var_ce10601bbbf500a2 = 0;
    switch (self.script_noteworthy) {
    case #"hash_b7e573ce3743972f":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_b7e570ce37439276":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_b7e575ce37439a55":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_b7e572ce3743959c":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_b7e57cce3743a55a":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_b7e56fce374390e3":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_b7e56ece37438f50":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_c95df07b1cb906d9":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_c95def7b1cb90546":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_c95dee7b1cb903b3":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_c95ded7b1cb90220":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_c95df47b1cb90d25":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_c95df37b1cb90b92":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_c95df27b1cb909ff":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_c95df17b1cb9086c":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_c95df87b1cb91371":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_c95df77b1cb911de":
        var_ce10601bbbf500a2 = 1;
        break;
    case #"hash_b7e574ce374398c2":
        var_ce10601bbbf500a2 = 1;
        break;
    default:
        var_ce10601bbbf500a2 = 1;
        break;
    }
    return var_ce10601bbbf500a2;
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b37
// Size: 0x51
function function_c9d7bb23b0d9620e(objname) {
    if (getdvarint(@"ob_rift_run", 0)) {
        return false;
    }
    if (!function_ddb95b9613abab35(objname)) {
        return false;
    }
    return isdefined(level.var_6c74c58b7bf75f9e[objname]) && !time_has_passed(level.var_6c74c58b7bf75f9e[objname], 60);
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b91
// Size: 0xfd
function function_ddb95b9613abab35(objname) {
    var_4c8aea8e8b10782 = 0;
    switch (self.script_noteworthy) {
    case #"hash_b7e56ece37438f50":
    case #"hash_b7e56fce374390e3":
    case #"hash_b7e570ce37439276":
    case #"hash_b7e571ce37439409":
    case #"hash_b7e572ce3743959c":
    case #"hash_b7e573ce3743972f":
    case #"hash_b7e574ce374398c2":
    case #"hash_b7e575ce37439a55":
    case #"hash_b7e57cce3743a55a":
    case #"hash_c95ded7b1cb90220":
    case #"hash_c95dee7b1cb903b3":
    case #"hash_c95def7b1cb90546":
    case #"hash_c95df07b1cb906d9":
    case #"hash_c95df17b1cb9086c":
    case #"hash_c95df27b1cb909ff":
    case #"hash_c95df47b1cb90d25":
    case #"hash_c95df77b1cb911de":
        var_4c8aea8e8b10782 = 1;
        break;
    }
    return var_4c8aea8e8b10782;
}

/#

    // Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x3c97
    // Size: 0x91
    function function_c78a1c50096c178d(var_5cb33ab9a316a288, node_name) {
        if (!isdefined(var_5cb33ab9a316a288)) {
            return;
        }
        if (!isdefined(node_name)) {
            return;
        }
        var_2a4bf815d4aca960 = strtok(node_name, "<dev string:x170>")[1];
        while (true) {
            var_6dab10d8def3f13c = level.var_2050f6176cd525cd[node_name];
            var_6c222547c12f192f = 1;
            if (var_6dab10d8def3f13c == 0) {
                var_6c222547c12f192f = 0.6;
            }
            print3d(var_5cb33ab9a316a288, var_6dab10d8def3f13c + "<dev string:x177>" + var_2a4bf815d4aca960, undefined, var_6c222547c12f192f, 1, 5);
            wait 0.25;
        }
    }

    // Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3d30
    // Size: 0xae
    function function_ca17670c2e892f7f(var_932f9fc175fcb5fb) {
        var_932f9fc175fcb5fb endon("<dev string:x17e>");
        while (true) {
            label = "<dev string:x187>" + var_932f9fc175fcb5fb.var_48547f0431a48b3 + "<dev string:x18e>" + var_932f9fc175fcb5fb.var_34ba1f083578211e + "<dev string:x193>";
            color = (0.5, 0.5, 1);
            if (istrue(var_932f9fc175fcb5fb.var_b29eb670220d7241)) {
                color = (1, 0.25, 0.25);
            }
            print3d(var_932f9fc175fcb5fb.origin + (0, 0, 60), label, color, undefined, 1, 1);
            waitframe();
        }
    }

#/

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3de6
// Size: 0x49
function function_c3954aec42cc388e() {
    while (!isdefined(level.doorstrings)) {
        waitframe();
    }
    level.doorstrings["locked_no_key"]["tower_rr_worn_jup"] = %JUP_OB_S5/LOCKED_TOWER_SUPPLY_ROOM;
    level.doorstrings["locked_has_key"]["tower_rr_worn_jup"] = %JUP_OB_S5/UNLOCK_TOWER_SUPPLY_ROOM;
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e37
// Size: 0x29
function function_2e656805e9a5c512() {
    storm_clip = getent("storm_clip", "targetname");
    if (isdefined(storm_clip)) {
        storm_clip delete();
    }
}

// Namespace mp_jup_tower_ob / namespace_e66982003565a5bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e68
// Size: 0x15
function function_5954f735dd26765c(players) {
    level thread namespace_b3f32c8cb80b8124::function_aadc1c81b3fd1dd2(players);
}
