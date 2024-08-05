#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\sp\anim.gsc;
#using scripts\common\anim.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\common\vehicle.gsc;
#using script_5d265b4fca61f070;
#using scripts\common\ai.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\values.gsc;
#using scripts\sp\spawner.gsc;
#using script_32876a523f324870;
#using script_4ab4bd3ef85fb34c;
#using script_467d2a8b854911b6;
#using scripts\sp\door.gsc;
#using scripts\sp\player\cursor_hint.gsc;
#using script_5d0aad069db3eeb8;
#using script_13d1c402f1421c35;
#using script_3433ee6b63c7e243;
#using script_a6f526f54ee52f7;

#namespace namespace_3345ab597fd83308;

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1618
// Size: 0xdf
function function_81253f168d083e9f() {
    namespace_47819225b08b445d::spawn_price();
    namespace_47819225b08b445d::function_350377b71c3dfd2e();
    level.player setorigin((26728, 5672, -24));
    level.player setplayerangles((0, 150, 0));
    thread namespace_fbd1c1b57d4f60c0::function_564579a7b113a217();
    level.var_b24651c26f3bc640 = {#angles:(0, 0, 0), #origin:(26657.5, 5637.36, -31.842)};
    function_88342a549599c562();
    foreach (transient in level.var_a67ce3c274f5544e) {
        settransientvisibility(transient, 1);
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16ff
// Size: 0x6c
function function_2f1b8471b511229b() {
    thread set_flag_on_targetname_trigger("trigger_penthouse_arrive");
    thread function_bcf2f4556bded557();
    thread function_7670ef60f2fb60eb();
    flag_wait_all("player_at_vip_floor", "concourse_stairs_top_open");
    level.player setsoundsubmix("sp_jup_flashback_concourse_upper", 3.5);
    delaythread(2, &activate_trigger_with_targetname, "trigger_color_penthouse_redshirt_stackup");
    thread namespace_fbd1c1b57d4f60c0::function_9d3a4a4d96ade79b();
    thread autosave_by_name();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1773
// Size: 0xe
function function_abb9cfecff7e47e0() {
    flag_set("concourse_stairs_top_vo_done");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1789
// Size: 0xcc
function function_bcf2f4556bded557() {
    flag_init("concourse_stairs_top_vo_done");
    flag_wait("concourse_stairs_vo_done");
    thread function_74e1219b55f0b644();
    flag_wait("concourse_stairs_price_at_door");
    if (flag("constairs_player_interacted_on_door")) {
        flag_wait("constairs_player_open_door_vo_done");
    }
    level.redshirt say_delayed(0.5, "dx_sp_flas_stcs_burn_executivelevelvipare");
    level.price say_delayed(0.2, "dx_sp_flas_stcs_pric_letsgetinthere");
    flag_wait("concourse_stairs_price_at_door");
    while (!level.player can_see_origin((26368, 5664, 32))) {
        waitframe();
    }
    level.player say("dx_sp_flas_penf_soap_clear");
    flag_set("concourse_stairs_top_vo_done");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x185d
// Size: 0x55
function function_74e1219b55f0b644() {
    level endon("price_reached_door");
    flag_wait("constairs_player_interacted_on_door");
    level.player say_delayed(0.2, "dx_sp_flas_stcs_soap_exitslocked");
    level.price say_delayed(0.2, "dx_sp_flas_stcs_pric_onit");
    flag_set("constairs_player_open_door_vo_done");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18ba
// Size: 0x115
function function_7670ef60f2fb60eb() {
    var_ee32376b13801f98 = getent("concourse_stairs_top_door", "targetname");
    var_ee32376b13801f98 assign_animtree("door");
    doorright = scripts\sp\door::get_interactive_door("door_concourse_stair_right");
    flag_init("constairs_player_interacted_on_door");
    thread function_75bb47009db73353();
    flag_wait("concourse_stairs_price_at_door");
    enemies = getaiarray("axis");
    array_call(enemies, &delete);
    namespace_47819225b08b445d::function_f1864fb398798ed6(0);
    level.price thread function_c5498dec1592e748();
    level.redshirt thread function_9ce131bd89ed767a();
    if (flag("constairs_player_animated_entrance")) {
        level.var_b24651c26f3bc640 anim_single_solo(level.price, "concourse_stairs_top_open");
    } else {
        level.var_b24651c26f3bc640 anim_single([var_ee32376b13801f98, level.price], "concourse_stairs_top_open");
    }
    namespace_47819225b08b445d::function_f1864fb398798ed6(1);
    flag_set("concourse_stairs_top_open");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19d7
// Size: 0x75
function function_c5498dec1592e748() {
    enable_ai_color();
    namespace_47819225b08b445d::function_264ea5c38c1ae771();
    level.price setgoalpos(level.price.origin, 32);
    while (distance2dsquared(self.origin, level.player.origin) > 19600) {
        waitframe();
    }
    set_movement_speed(120);
    activate_trigger_with_targetname("trigger_color_penthouse_price_stackup");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a54
// Size: 0x54
function function_9ce131bd89ed767a() {
    flag_wait("concourse_stairs_top_open");
    node = spawncovernode((26704, 5648, -16), (0, 150, 0), "Exposed");
    node.radius = 32;
    thread spawner::go_to_node(node);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab0
// Size: 0x3e0
function function_75bb47009db73353() {
    level.price thread function_1e6ea2b8e0a27e5b();
    level.redshirt thread function_fe078253e8419160();
    var_ee32376b13801f98 = getent("concourse_stairs_top_door", "targetname");
    doorright = scripts\sp\door::get_interactive_door("door_concourse_stair_right");
    doorright.no_bash = 1;
    doorright thread function_906345f2536d929e(0);
    result = waittill_any_ents_return(level, "price_reached_door", doorright, "trigger", doorright, "fake_bashed");
    level.price notify("stop_pathing_to_door");
    level.redshirt notify("stop_pathing_to_landing");
    doorright notify("stop_fake_bash");
    if (result == "fake_bashed") {
        flag_set("constairs_player_interacted_on_door");
        var_557e38b8880783a9 = getnode("struct_concourse_stairs_landing_redshirt", "targetname");
        level.redshirt forceteleport(var_557e38b8880783a9.origin, var_557e38b8880783a9.angles);
        level.var_b24651c26f3bc640 anim_first_frame_solo(level.price, "concourse_stairs_top_open");
    } else if (result == "trigger") {
        flag_set("constairs_player_interacted_on_door");
        direction = function_3ab5963c9bcc440b((26584, 5728, -16), (0, 135, 0), 90);
        if (direction == "left") {
            flag_set("constairs_player_animated_entrance");
            var_708036d3b83e94f4 = "concourse_stairs_top_open_left";
            level.player disableweapons();
            level.player_rig = spawn_anim_model("player_rig", (0, 0, 0));
            level.player_rig hide();
            level.player_rig dontinterpolate();
            animlength = getanimlength(level.player_rig getanim(var_708036d3b83e94f4));
            level.player delaycall(animlength, &unlink);
            level.player delaycall(animlength, &enableweapons);
            level.player_rig delaycall(animlength, &delete);
            level.var_b24651c26f3bc640 anim_first_frame_solo(var_ee32376b13801f98, "concourse_stairs_top_plr_open");
            level.var_b24651c26f3bc640 anim_first_frame_solo(level.player_rig, var_708036d3b83e94f4);
            waitframe();
            level.var_b24651c26f3bc640 thread anim_single_solo(level.player_rig, var_708036d3b83e94f4);
            level.var_b24651c26f3bc640 thread anim_single_solo(var_ee32376b13801f98, "concourse_stairs_top_plr_open");
            if (level.player getstance() != "stand") {
                level.player setstance("stand", 1, 0, 0);
                waitframe();
            }
            blendtime = 0.3;
            var_be589a16ae42c0cd = blendtime * 0.8;
            rightarc = 30;
            leftarc = 30;
            toparc = 30;
            bottomarc = 30;
            level.player playerlinktoblend(level.player_rig, "tag_player", blendtime, blendtime * 0.5, blendtime * 0.5);
            level.player delaycall(blendtime, &playerlinktodelta, level.player_rig, "tag_player", 1, 0, 0, 0, 0, 1);
            level.player delaycall(blendtime + 0.5, &lerpviewangleclamp, 1, 0.5, 0.5, rightarc, leftarc, toparc, bottomarc);
            level.player_rig delaycall(var_be589a16ae42c0cd, &show);
        }
    }
    flag_set("concourse_stairs_price_at_door");
    thread function_7d54441cf105253b();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e98
// Size: 0x2b
function function_1e6ea2b8e0a27e5b() {
    self endon("stop_pathing_to_door");
    level.var_b24651c26f3bc640 anim_reach_solo(self, "concourse_stairs_top_open");
    flag_set("price_reached_door");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ecb
// Size: 0x34
function function_fe078253e8419160() {
    self endon("stop_pathing_to_landing");
    node = getnode("struct_concourse_stairs_landing_redshirt", "targetname");
    thread spawner::go_to_node(node);
    self waittill("goal");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f07
// Size: 0xe6
function function_88342a549599c562() {
    var_85e72717148a9523 = getstruct("struct_concourse_stairs_price", "targetname");
    if (!level.player namespace_47819225b08b445d::function_e7c30095a6cdc3ef(var_85e72717148a9523.origin)) {
        level.price forceteleport(var_85e72717148a9523.origin, var_85e72717148a9523.angles);
    } else {
        level.price thread spawner::go_to_node(var_85e72717148a9523);
    }
    var_557e38b8880783a9 = getstruct("struct_concourse_stairs_redshirt", "targetname");
    if (!level.player namespace_47819225b08b445d::function_e7c30095a6cdc3ef(var_557e38b8880783a9.origin)) {
        level.redshirt forceteleport(var_557e38b8880783a9.origin, var_557e38b8880783a9.angles);
        return;
    }
    level.redshirt thread spawner::go_to_node(var_557e38b8880783a9);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ff5
// Size: 0x72
function function_7634214c5a6e0757() {
    namespace_47819225b08b445d::spawn_price();
    namespace_47819225b08b445d::function_350377b71c3dfd2e();
    set_start_location("struct_start_penthouse_floor", array_add(level.allies, level.player));
    activate_trigger_with_targetname("trigger_color_penthouse_price_stackup");
    activate_trigger_with_targetname("trigger_color_penthouse_redshirt_stackup");
    thread set_flag_on_targetname_trigger("trigger_penthouse_arrive");
    level.player setsoundsubmix("sp_jup_flashback_concourse_upper", 3.5);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x206f
// Size: 0xa1
function function_f31c22483c77b393() {
    level notify("stop_concourse_civ_logic");
    thread function_e099cbf58f010c0f();
    thread function_5a3fd2b18b03bed4();
    namespace_fbd1c1b57d4f60c0::function_a4d5dee1f16e5ad7();
    namespace_fbd1c1b57d4f60c0::function_af71e5d06fda8b30(0);
    flag_wait("trigger_penthouse_arrive");
    var_1385824410cbe0e2 = array_remove_array(level.var_4291dad1008f93e6, level.var_a67ce3c274f5544e);
    foreach (transient in var_1385824410cbe0e2) {
        settransientvisibility(transient, 0);
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2118
// Size: 0xe
function function_64b178abc1f05288() {
    flag_set("penthouse_floor_vo_done");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x212e
// Size: 0xa8
function function_fa1cebd2b668aa80() {
    namespace_47819225b08b445d::spawn_price();
    namespace_47819225b08b445d::function_350377b71c3dfd2e();
    thread function_5a3fd2b18b03bed4();
    set_start_location("struct_start_penthouse_arrive", array_add(level.allies, level.player));
    var_1385824410cbe0e2 = array_remove_array(level.var_4291dad1008f93e6, level.var_a67ce3c274f5544e);
    foreach (transient in var_1385824410cbe0e2) {
        settransientvisibility(transient, 0);
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21de
// Size: 0x111
function function_4d32f716029af98e() {
    foreach (ally in level.allies) {
        ally.var_6e761cfc7238974b = ally.grenadeawareness;
        ally.grenadeawareness = 0;
    }
    thread function_e93d15e50511b28();
    thread function_e23fa3095370783f();
    thread function_b094554913622b6a();
    flag_wait("penthouse_secure");
    level.redshirt allowedstances("stand");
    foreach (ally in level.allies) {
        ally.grenadeawareness = ally.var_6e761cfc7238974b;
        ally.var_6e761cfc7238974b = undefined;
    }
    thread autosave_by_name();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22f7
// Size: 0x65
function function_46f0a3fe07c4cfc7() {
    flag_set("penthouse_secure");
    flag_set("price_ready_for_penthouse_anim");
    flag_set("redshirt_ready_for_penthouse_anim");
    level.player notify("stop_warning_civ_deaths");
    var_d6830258d44366ed = getentarray("OutOfBounds_Deleteable_Penthouse", "script_noteworthy");
    if (isdefined(var_d6830258d44366ed) && var_d6830258d44366ed.size > 0) {
        array_delete(var_d6830258d44366ed);
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2364
// Size: 0x38
function function_b094554913622b6a() {
    var_261d5fdee9f7c760 = getent("OutOfBounds_concourse_stairs", "targetname");
    var_261d5fdee9f7c760 thread namespace_47819225b08b445d::function_8f2ebae90f61cb99();
    flag_wait("player_at_elevator_bottom");
    var_261d5fdee9f7c760 delete();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23a4
// Size: 0x13b
function function_b09ce984fb9372d3() {
    namespace_47819225b08b445d::spawn_price();
    namespace_47819225b08b445d::function_350377b71c3dfd2e();
    level.player setsoundsubmix("sp_jup_flashback_paramedics_room", 3.5);
    level.var_7631474af43da9b4 = spawnstruct();
    level.var_7631474af43da9b4.animnode = getstruct("animnode_panthouse_conflict", "targetname");
    function_a7b0ec5f85cf2c55();
    level.var_7631474af43da9b4.bomb_bag = spawn_anim_model("bomb_bag");
    assert(isdefined(level.var_7631474af43da9b4.bomb_bag));
    animnode = getstruct("animnode_panthouse_conflict", "targetname");
    var_c59a1bf410f24b79 = [level.var_7631474af43da9b4.bomb_bag, level.var_7631474af43da9b4.var_4949cff560c88be5];
    animnode anim_first_frame(var_c59a1bf410f24b79, "penthouse_bomb");
    level.player setorigin((26149, 5011, -8), 1);
    level.player setplayerangles((0, 284, 0));
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24e7
// Size: 0xca
function function_fdabe0101feb30cf() {
    level.var_651f982a9d8a2280 = {#targetname:"elevator_anim_node", #angles:(0, 0, 0), #origin:(25298, 4429, -17)};
    thread function_6985b854d7321482();
    delaythread(1, &function_1411467caac81168);
    thread function_c1da45b47c3d1fe6();
    var_d6830258d44366ed = getentarray("OutOfBounds_Deleteable_Penthouse", "script_noteworthy");
    if (var_d6830258d44366ed.size > 0) {
        array_delete(var_d6830258d44366ed);
    }
    flag_wait("penthouse_bomb_scene_done");
    level.price enable_ai_color();
    activate_trigger_with_targetname("trigger_color_penthouse_exit_hallway");
    level.price utility::demeanor_override("cqb");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25b9
// Size: 0x2
function function_cdd66098f777287c() {
    
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25c3
// Size: 0x5d
function function_1411467caac81168() {
    foreach (door in level.var_7631474af43da9b4.var_73d42ccddec3520) {
        door scripts\sp\door::reset_door();
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2628
// Size: 0xb8
function function_c1da45b47c3d1fe6() {
    flag_init("penthouse_bomb_scene_done");
    if (level.start_point == "penthouse_bomb") {
        wait 1;
    }
    thread function_34963ffe92eee864();
    animnode = getstruct("animnode_panthouse_conflict", "targetname");
    flag_wait_all("price_ready_for_penthouse_anim", "redshirt_ready_for_penthouse_anim");
    animnode thread anim_single([level.var_7631474af43da9b4.bomb_bag, level.var_7631474af43da9b4.var_4949cff560c88be5], "penthouse_bomb");
    level.price thread function_713886ce68135c9(animnode);
    level.redshirt thread function_cfa6beef79905a23(animnode);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26e8
// Size: 0x2d
function function_34963ffe92eee864() {
    flag_wait_all("price_ready_for_penthouse_anim", "redshirt_ready_for_penthouse_anim");
    battlechatter_off();
    flag_wait("penthouse_bomb_scene_done");
    battlechatter_on();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x271d
// Size: 0x35
function function_713886ce68135c9(animnode) {
    animnode anim_single_solo(self, "penthouse_bomb");
    utility::clear_movement_speed();
    namespace_47819225b08b445d::function_f1864fb398798ed6(1);
    flag_set("penthouse_bomb_scene_done");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x275a
// Size: 0x40
function function_cfa6beef79905a23(animnode) {
    level.redshirt.script_pushable = 0;
    animnode anim_single_solo(self, "penthouse_bomb");
    self setgoalpos(self.origin, 32);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27a2
// Size: 0x2b
function function_95771ce6161268ef() {
    var_5eb2cfd74e5fc61b = getent("trigger_penthouse_interior", "targetname");
    return level.player istouching(var_5eb2cfd74e5fc61b);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27d6
// Size: 0xc6
function function_262264ed43bd28f1() {
    thread function_6985b854d7321482();
    namespace_47819225b08b445d::spawn_price();
    set_start_location("struct_start_penthouse_elevator", array_add(level.allies, level.player));
    var_1385824410cbe0e2 = array_remove_array(level.var_4291dad1008f93e6, level.var_a67ce3c274f5544e);
    foreach (transient in var_1385824410cbe0e2) {
        settransientvisibility(transient, 0);
    }
    level.player setsoundsubmix("sp_jup_flashback_paramedics_room", 3.5);
    flag_set("trigger_color_penthouse_elevator");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28a4
// Size: 0xa4
function function_9102ea8393f24961() {
    flag_wait("trigger_color_penthouse_elevator");
    thread function_798a4318acbb7051();
    function_dbe51d0565e8e855();
    namespace_aa821a9218e60e7b::function_ce9fdd7fe834de65();
    foreach (transient in level.var_a67ce3c274f5544e) {
        settransientvisibility(transient, 0);
    }
    level.player notify("stop_warning_civ_deaths");
    remove_extra_autosave_check("prevent_save_on_field");
    remove_extra_autosave_check("player_oob");
    function_819657b33ca571ab();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2950
// Size: 0x17
function function_798a4318acbb7051() {
    function_42d71413c0c39620();
    function_df49b2ee807daf0b();
    function_bb79f064ce8a4216();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x296f
// Size: 0x55
function function_bb79f064ce8a4216() {
    if (flag("player_entered_elevator")) {
        return;
    }
    wait 8;
    array = ["dx_sp_flas_phlv_pric_downheresergeantther", "dx_sp_flas_phlv_pric_makarovisonthemoveso", "dx_sp_flas_phlv_pric_ineedyoudownhereserg"];
    level.price dialogue::nag_wait("player_entered_elevator", array, 11, 2);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29cc
// Size: 0xc9
function function_42d71413c0c39620() {
    elevator = (25295, 4435, -14);
    var_d09d33b1e445f3f2 = 40000;
    var_4c3ca90902817a60 = 22500;
    while (true) {
        if (distancesquared(level.price.origin, elevator) <= var_d09d33b1e445f3f2) {
            autosave_by_name();
            return;
        } else if (distancesquared(level.player.origin, elevator) <= var_4c3ca90902817a60 && utility::within_fov(level.player.origin, level.player.angles, elevator, 0.5)) {
            autosave_by_name();
            return;
        }
        wait 0.2;
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a9d
// Size: 0xdc
function function_df49b2ee807daf0b() {
    if (flag("elevator_scene_start")) {
        return;
    }
    level endon("elevator_scene_start");
    var_e687bba1d1cae639 = create_deck(["dx_sp_flas_phlv_pric_weremovingtothegarag", "dx_sp_flas_phlv_pric_theyllexfilmakarovth", "dx_sp_flas_phlv_pric_makarovhastoexitfrom"]);
    var_d8b5ec1d530687e0 = create_deck(["dx_sp_flas_phlv_pric_takethedoorletsgetit", "dx_sp_flas_phlv_pric_getonthedoor", "dx_sp_flas_phlv_pric_ineedyouonthatdoorse"]);
    elevator = (25295, 4435, -14);
    while (true) {
        wait 7;
        var_bb1f50a4748e192c = distancesquared(level.player.origin, elevator) < 62500 ? var_d8b5ec1d530687e0 : var_e687bba1d1cae639;
        level.price say_team(var_bb1f50a4748e192c utility::deck_draw());
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b81
// Size: 0x134
function function_6985b854d7321482() {
    if (!isdefined(level.var_651f982a9d8a2280)) {
        level.var_651f982a9d8a2280 = {#targetname:"elevator_anim_node", #angles:(0, 0, 0), #origin:(25298, 4429, -17)};
    }
    var_5c21586da6c1959c = getent("elevator_door_r", "targetname");
    var_5c214e6da6c17f9e = getent("elevator_door_l", "targetname");
    var_5c21586da6c1959c delete();
    var_5c214e6da6c17f9e delete();
    var_5185322fbda123d8 = spawn_anim_model("elevator_door_l", (0, 0, 0), (0, 0, 0));
    var_d4f45e8355364e9e = spawn_anim_model("elevator_door_r", (0, 0, 0), (0, 0, 0));
    level.var_651f982a9d8a2280.doors = [var_5185322fbda123d8, var_d4f45e8355364e9e];
    level.var_651f982a9d8a2280 anim_first_frame([var_5185322fbda123d8, var_d4f45e8355364e9e], "elevator_open");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cbd
// Size: 0x539
function function_dbe51d0565e8e855() {
    level thread function_a301281a66326099();
    level.player_rig = spawn_anim_model("player_rig", (0, 0, 0), (0, 0, 0));
    level.player_rig hide();
    level.var_651f982a9d8a2280 anim_first_frame_solo(level.player_rig, "elevator_open_enter");
    waitframe();
    var_dc1280b0e35763a7 = {#angles:(0, 0, 0), #origin:(25292, 4439, 36)};
    var_788f478911d428b = {#angles:(0, 0, 0), #origin:(25302, 4426, 33)};
    var_dc1280b0e35763a7 scripts\sp\player\cursor_hint::create_cursor_hint();
    var_dc1280b0e35763a7.cursor_hint_ent sethintonobstruction("show");
    var_dc1280b0e35763a7 waittill("trigger");
    function_6a85e32a9a2ada7c();
    namespace_84ed3a3872f22d68::function_e1669c4e37d61ff9();
    thread function_bb0d1b75fe9f566d();
    flag_set("elevator_scene_start");
    namespace_726729b14b4a7e1e::function_e672a8b815c0a7f0();
    thread namespace_47819225b08b445d::player_pov_animated(1);
    var_9859a37c0dfe3f62 = flag("price_at_elevator") == 1 ? "elevator_open_enter" : "elevator_open_enter_early";
    var_28bb2ef86b103314 = function_a39b20c9ff530e2();
    var_8f6eae3cb71b4ef = namespace_47819225b08b445d::function_fbca877c7dca5b38(level.var_651f982a9d8a2280, var_28bb2ef86b103314);
    level.scr_anim["player_rig"][var_9859a37c0dfe3f62] = var_8f6eae3cb71b4ef;
    level.var_651f982a9d8a2280 anim_first_frame_solo(level.player_rig, var_9859a37c0dfe3f62);
    waitframe();
    namespace_47819225b08b445d::function_8da3daaa6d7ab1a1({#rightarc:9, #leftarc:9, #bottomarc:5, #toparc:30});
    if (utility::flag("price_at_elevator") && !utility::flag("price_waiting_at_elevator")) {
        utility::flag_wait_or_timeout("price_waiting_at_elevator", 2.6);
        if (!utility::flag("price_waiting_at_elevator")) {
            flag_set("price_waiting_at_elevator");
        }
    }
    level.var_651f982a9d8a2280 notify("stop_loop");
    level.price notify("goal");
    level.var_651f982a9d8a2280 animation::anim_single([level.player_rig, level.price], var_9859a37c0dfe3f62);
    everyone = utility::array_combine(level.var_651f982a9d8a2280.doors, [level.price, level.player_rig]);
    level.var_651f982a9d8a2280 thread animation::anim_single(everyone, "elevator_open");
    level thread function_d0e353aa4dc7e6d7();
    level.player_rig waittillmatch("single anim", "end");
    thread namespace_47819225b08b445d::player_pov_animated(0);
    namespace_47819225b08b445d::unlink_player_from_rig();
    var_3abcf9d3931eb635 = getent("elevator_player_clip", "targetname");
    if (isdefined(var_3abcf9d3931eb635)) {
        var_3abcf9d3931eb635 delete();
    }
    thread function_6d13150407a6848c();
    autosave_by_name();
    thread function_2ce5fd21816e7f10();
    level.player_rig = spawn_anim_model("player_rig", (0, 0, 0), (0, 0, 0));
    level.player_rig hide();
    level.var_651f982a9d8a2280 anim_first_frame([level.player_rig], "elevator_rappel_enter");
    wait 1;
    rappel_interact();
    level.player setsoundsubmix("sp_jup_flashback_slide_down_elevator", 0.5);
    level.player delaycall(2, &clearsoundsubmix, "sp_jup_flashback_slide_down_elevator", 4);
    level.player delaycall(2, &clearsoundsubmix, "sp_jup_flashback_paramedics_room", 4);
    level.player delaycall(3, &setsoundsubmix, "sp_jup_flashback_lower_garage", 3);
    flag_set("player_entered_elevator");
    thread elevator_music();
    level.var_4b4aedbd7c100540 delete();
    thread namespace_47819225b08b445d::player_pov_animated(1);
    if (flag("player_jumped_to_elevator")) {
        thread function_cd683ece3990120();
    } else {
        namespace_47819225b08b445d::function_8da3daaa6d7ab1a1();
        level.var_651f982a9d8a2280 animation::anim_single_solo(level.player_rig, "elevator_rappel_enter");
    }
    if (!flag("price_at_elevator_bottom")) {
        level.price stopanimscripted();
    }
    level.price utility::delaythread(1, &utility::enable_ai_color);
    level.var_651f982a9d8a2280 animation::anim_single([level.player_rig, level.price], "elevator_go");
    thread namespace_47819225b08b445d::player_pov_animated(0);
    namespace_47819225b08b445d::unlink_player_from_rig();
    namespace_47819225b08b445d::function_f1864fb398798ed6(1);
    flag_set("player_at_elevator_bottom");
    level.player utility::set_player_demeanor("normal");
    autosave_by_name();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31fe
// Size: 0x28
function function_6d13150407a6848c() {
    wait 1;
    if (!flag("player_entered_elevator")) {
        level.player utility::set_player_demeanor("relaxed");
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x322e
// Size: 0x39
function function_ccaa179c6a8cd9e1() {
    temp = spawn_tag_origin();
    temp playsound("fbk_0400_clubhouse_elevator_interact2_plr_01");
    wait 1;
    temp scalevolume(0, 1.3);
    wait 3;
    temp delete();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x326f
// Size: 0x1cc
function function_cd683ece3990120() {
    waitframe();
    level.player_rig setanimtime(level.player_rig getanim("elevator_go"), 0.3);
    blendtime = 1;
    var_858203d3d31e76f2 = 0.1;
    rightarc = 30;
    leftarc = 30;
    toparc = 30;
    bottomarc = 30;
    if (level.player getstance() != "stand") {
        level.player setstance("stand", 1, 0, 0);
        waitframe();
    }
    level.player_rig.allows = ["weapon", "offhand_weapons", "melee", "sprint", "allow_jump", "mantle", "crouch", "prone"];
    level.player val::set_array("player_rig", level.player_rig.allows, 0);
    level.player playerlinktoblend(level.player_rig, "tag_player", blendtime, blendtime * 0.5, blendtime * 0.5);
    level.player delaycall(blendtime, &playerlinktodelta, level.player_rig, "tag_player", 1, 0, 0, 0, 0, 1);
    level.player delaycall(blendtime + 0.5, &lerpviewangleclamp, 1, 0.5, 0.5, rightarc, leftarc, toparc, bottomarc);
    level.player_rig delaycall(var_858203d3d31e76f2 + 0.5, &show);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3443
// Size: 0x3c
function function_2ce5fd21816e7f10() {
    level endon("player_entered_elevator");
    while (true) {
        if (level.player jumpbuttonpressed()) {
            level.player.var_d1e548a08ad3484c = gettime();
        }
        waitframe();
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3487
// Size: 0x165
function rappel_interact() {
    var_fde25a217e808bad = (25351, 4383, 60);
    var_bb4312b66e37c5f = (var_fde25a217e808bad[0], var_fde25a217e808bad[1], 0);
    var_8776b4bfef0709 = (var_fde25a217e808bad[0], var_fde25a217e808bad[1], -60);
    level.var_4b4aedbd7c100540 = spawn_tag_origin();
    level.var_4b4aedbd7c100540 scripts\sp\player\cursor_hint::create_cursor_hint("tag_origin", undefined, %SP_JUP_FLASHBACK/HINT_RAPPEL, 50, 160, 138);
    waitframe();
    level.var_4b4aedbd7c100540 sethintonobstruction("show");
    level.var_4b4aedbd7c100540 setuseholdduration("duration_none");
    level.var_4b4aedbd7c100540 endon("trigger");
    while (true) {
        start = level.player geteye();
        var_21230ad9e2e0959d = distance(start, var_bb4312b66e37c5f);
        end = start + anglestoforward(level.player getplayerangles()) * var_21230ad9e2e0959d;
        level.var_4b4aedbd7c100540.origin = pointonsegmentnearesttopoint(var_fde25a217e808bad, var_8776b4bfef0709, end);
        if (var_21230ad9e2e0959d < 110 && function_742ac1846e4c155f(level.var_4b4aedbd7c100540.origin)) {
            thread function_ccaa179c6a8cd9e1();
            flag_set("player_jumped_to_elevator");
            level.var_4b4aedbd7c100540 notify("trigger");
        }
        waitframe();
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35f4
// Size: 0x90
function function_742ac1846e4c155f(var_f208eb71426fc5f5) {
    if (istrue(level.player getnormalizedmovement()[0]) && !level.player isonground() && isdefined(level.player.var_d1e548a08ad3484c) && gettime() - level.player.var_d1e548a08ad3484c < 1000) {
        if (level.player math::is_point_in_front(var_f208eb71426fc5f5)) {
            return true;
        }
        if (namespace_47819225b08b445d::in_screen_center(var_f208eb71426fc5f5, 200)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x368d
// Size: 0xa2
function function_a301281a66326099() {
    level.var_651f982a9d8a2280 anim_reach_solo(level.price, "elevator_intro");
    utility::flag_set("price_at_elevator");
    namespace_47819225b08b445d::function_f1864fb398798ed6(0);
    if (flag("elevator_scene_start")) {
        return;
    }
    level thread utility::flag_set_delayed("price_waiting_at_elevator", 2.4);
    level.var_651f982a9d8a2280 anim_single_solo(level.price, "elevator_intro");
    if (flag("elevator_scene_start")) {
        return;
    }
    level.var_651f982a9d8a2280 thread anim_loop_solo(level.price, "elevator_idle");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3737
// Size: 0x4a
function function_d0e353aa4dc7e6d7() {
    level endon("player_entered_elevator");
    level.price waittillmatch("single anim", "end");
    flag_set("price_at_elevator_bottom");
    level.var_651f982a9d8a2280 anim_first_frame_solo(level.price, "elevator_go");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3789
// Size: 0x62
function function_bb0d1b75fe9f566d() {
    level endon("player_entered_elevator");
    var_44fa4900f2042017 = level.player.origin[2] - 60;
    while (true) {
        if (level.player.origin[2] <= var_44fa4900f2042017) {
            level.player die();
            return;
        }
        waitframe();
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37f3
// Size: 0xe
function function_e5430163f1ff288e() {
    flag_set("trigger_color_penthouse_elevator");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3809
// Size: 0xa4
function function_b005cce1bb38c3eb() {
    level endon("penthouse_door_interacted");
    if (level.start_point != "penthouse_arrive") {
        level.var_7631474af43da9b4.animnode anim_reach_solo(self, "fbk_0360_price_to_door");
        level.var_7631474af43da9b4.animnode anim_single_solo(self, "fbk_0360_price_to_door");
    } else {
        level.var_7631474af43da9b4.animnode anim_first_frame_solo(self, "fbk_0360_price_idle_door");
    }
    level.var_7631474af43da9b4.animnode childthread anim_loop_solo(self, "fbk_0360_price_idle_door", "stop_price_door_loop");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38b5
// Size: 0x59
function function_d05bf470721dc115() {
    level endon("penthouse_door_interacted");
    self.script_pushable = 0;
    wait 1;
    node = getnode("node_penthouse_stack_up_redshirt", "targetname");
    scripts\sp\spawner::go_to_node(node);
    level.var_7631474af43da9b4.animnode thread anim_reach_solo(self, "fbk_0360_intro");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3916
// Size: 0xa
function function_7b6bcd3f8ad3dba9() {
    thread function_8f42def5a63cb059();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3928
// Size: 0xe
function function_920bffe6b195b138() {
    exploder("penthouse_smoke");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x393e
// Size: 0x2c
function function_431e36c3d6a95d81() {
    self endon("death");
    self endon("behavior_normal_done");
    self waittill("doFlashBanged");
    self stopanimscripted();
    waitframe();
    namespace_ba1fcf33692e2fad::flashbangstart(1.5);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3972
// Size: 0x6ec
function function_e23fa3095370783f() {
    flag_wait("penthouse_scene_initialized");
    assertex(isdefined(level.var_7631474af43da9b4), "Trying to play penthouse scene without it being initialized yet!");
    disable_trigger_with_targetname("trigger_color_penthouse_elevator");
    level.price thread function_b005cce1bb38c3eb();
    level.redshirt thread function_d05bf470721dc115();
    thread function_b69a4e871476186e();
    var_4f16c4e4e84b9954 = level waittill("penthouse_door_interacted");
    var_2d7b5ccd309f3a6f = var_4f16c4e4e84b9954 == "fake_bashed";
    level.var_7631474af43da9b4.animnode notify("stop_price_door_loop");
    array_call(level.var_7631474af43da9b4.enemies, &visiblesolid);
    flag_set("player_in_penthouse");
    thread autosave_by_name();
    namespace_47819225b08b445d::function_f1864fb398798ed6(0);
    level.player setsoundsubmix("sp_jup_flashback_paramedics_room", 3.5);
    level.player clearsoundsubmix("sp_jup_flashback_concourse_upper", 3.5);
    level.var_7631474af43da9b4.enemy01 thread function_5883f56d225b4f89();
    level.var_7631474af43da9b4.enemy02 thread function_3e31d6d3a1099890();
    level.var_7631474af43da9b4.var_c758f5006b0cfc3a thread function_e88ca8840459e0b();
    level.var_7631474af43da9b4.var_c758f0006b0cf13b thread function_b322866f1a7f1f1a();
    level.var_7631474af43da9b4.var_c758ef006b0cef08 thread function_902f710ec4728cf5();
    array_thread(level.var_7631474af43da9b4.enemies, &function_431e36c3d6a95d81);
    level notify("visibilityTeamName", "neutral", level.var_7631474af43da9b4.enemies, 1);
    thread function_1c3cf12e079b48cc(var_2d7b5ccd309f3a6f);
    level.price thread function_8a4ba00f272a838f(var_2d7b5ccd309f3a6f);
    level.redshirt thread function_2b8e8d55bb12210d(var_2d7b5ccd309f3a6f);
    thread function_9db6e4648ce6b850();
    thread function_e96ed542357e45b1();
    thread function_1a4995da9ba1c914(var_2d7b5ccd309f3a6f);
    thread function_45944cac9c94ab3f();
    var_32eecc65bafeea0a = level waittill_any_return("intro_anims_done", "player_lured_to_ambush", "player_triggered_ambush");
    level notify("stop_combat_checks");
    /#
    #/
    thread function_7b6bcd3f8ad3dba9();
    thread function_920bffe6b195b138();
    foreach (enemy in level.var_7631474af43da9b4.enemies) {
        if (!is_dead_or_dying(enemy)) {
            if (enemy.animname != "enemy01") {
                enemy utility::function_1a479cad9c3adbb1(1);
            }
            enemy set_ignoreme(0);
            enemy setgoalpos(enemy.origin, 32);
            enemy actoraimassiston();
        }
    }
    if (var_32eecc65bafeea0a == "player_lured_to_ambush") {
        foreach (enemy in level.var_7631474af43da9b4.enemies) {
            if (!is_dead_or_dying(enemy)) {
                switch (enemy.animname) {
                case #"hash_b1814a65888b98f0": 
                    break;
                case #"hash_b1814d65888b9da9": 
                    enemy namespace_223959d3e5206cfb::forceuseweapon(make_weapon("iw9_pi_golf17_sp"), "primary");
                    break;
                default: 
                    enemy namespace_47819225b08b445d::function_17177a175dd8f243("iw9_sm_aviktor_sp");
                    break;
                }
            }
        }
        level.player thread function_3fa59ff4da1f2db7();
        level.player thread function_63273eb420810c49();
        level.player thread function_8fdd5ec3d6f3505e();
        array_thread(level.allies, &set_ignoreall, 1);
        var_ad6a00ddd81a5774 = spawnstruct();
        var_ad6a00ddd81a5774.animnode = level.var_7631474af43da9b4.animnode;
        var_ad6a00ddd81a5774.var_80a430288ed01864 = "lure_ambush";
        var_ad6a00ddd81a5774.var_298fc64ffe3d9320 = "stand";
        var_ad6a00ddd81a5774.var_a900ec49b62870fb = 0.55;
        direction = function_3ab5963c9bcc440b((26099, 5006.5, 12), (0, 175, 0), 63, 110);
        switch (direction) {
        case #"hash_bf1a695c21e57fe4":
        case #"hash_c9b3133a17a3b2d0": 
            var_ad6a00ddd81a5774.var_a779bb61fe7ea6b = "lure_ambush_enter_front";
            break;
        case #"hash_96815ce4f2a3dbc5": 
            var_ad6a00ddd81a5774.var_a779bb61fe7ea6b = "lure_ambush_enter_right";
            break;
        }
        thread function_c1de9e8d1524edce(var_ad6a00ddd81a5774);
        level.player thread function_52c52c2bebc39658();
        level.var_7631474af43da9b4.enemy02 notify("stop_react_logic");
        level.var_7631474af43da9b4.animnode thread anim_single_solo(level.var_7631474af43da9b4.enemy02, "lure_ambush_enter");
        var_e9260236a3382bf6 = level.var_7631474af43da9b4.enemies;
        var_e9260236a3382bf6 = array_add(var_e9260236a3382bf6, level.price);
        var_e9260236a3382bf6 = array_add(var_e9260236a3382bf6, level.redshirt);
        waitframe();
        level.player waittill("enter_blend_done");
        level.var_7631474af43da9b4.enemy01 thread namespace_47819225b08b445d::function_e0a9de6b0601ed23();
        level.var_7631474af43da9b4.enemy02 thread namespace_47819225b08b445d::function_e0a9de6b0601ed23();
        array_notify(var_e9260236a3382bf6, "stop_react_logic");
        level.var_7631474af43da9b4.animnode thread anim_single(var_e9260236a3382bf6, "lure_ambush");
        level.player waittill("blended_anim_done");
        array_thread(level.allies, &set_ignoreall, 0);
        level.price thread function_3035d61a7fc9452f();
        level.redshirt thread function_b71a8bf8942d4201();
        point = getclosestpointonnavmesh(level.player.origin);
        level.player setorigin(point);
    }
    flag_set("penthouse_combat", var_32eecc65bafeea0a);
    level notify("visibilityTeamName", "axis", level.var_7631474af43da9b4.enemies, 1);
    namespace_47819225b08b445d::function_5da13e5444950c67(level.var_7631474af43da9b4.enemies, "penthouse_secure");
    enable_trigger_with_targetname("trigger_color_penthouse_elevator");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4066
// Size: 0x46
function function_52c52c2bebc39658() {
    wait 0.5;
    self setstance("crouch", 1);
    while (self getstance() != "crouch") {
        waitframe();
    }
    function_c8e47b79550e4319(0);
    flag_wait("lure_ambush_weapons_raised");
    function_c8e47b79550e4319(1);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40b4
// Size: 0x11c
function function_3fa59ff4da1f2db7() {
    weapons = self getweaponslistprimaries();
    var_ed6cbaffb6ddf39f = undefined;
    foreach (weapon in weapons) {
        if (issubstr(weapon.basename, "_pi_")) {
            var_ed6cbaffb6ddf39f = weapon;
            break;
        }
    }
    if (!isdefined(var_ed6cbaffb6ddf39f)) {
        var_41083de5095f82cf = self getcurrentweapon();
        self disableweapons();
        while (true) {
            if (self getcurrentweapon() == nullweapon()) {
                break;
            }
            waitframe();
        }
        self takeweapon(var_41083de5095f82cf);
        function_536aa7cbedb60aea(var_41083de5095f82cf, (26136, 5008, -8));
        var_ed6cbaffb6ddf39f = make_weapon("iw9_pi_golf17_sp");
        give_weapon(var_ed6cbaffb6ddf39f, 0, 0, 0, 1);
        self setweaponammoclip(var_ed6cbaffb6ddf39f, weaponclipsize(var_ed6cbaffb6ddf39f) - 1);
    } else {
        flag_set("lure_ambush_player_had_pistol");
        self disableweapons();
    }
    self switchtoweapon(var_ed6cbaffb6ddf39f);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x41d8
// Size: 0x3d
function function_536aa7cbedb60aea(var_37f1c96156afa5b9, drop_origin) {
    flag_wait("lure_ambush_weapons_raised");
    utility::function_ec8a443fe8165fe4(var_37f1c96156afa5b9.basename, drop_origin, var_37f1c96156afa5b9.attachments);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x421d
// Size: 0xd
function function_8f42def5a63cb059() {
    setmusicstate("mx_flashback_paramedicfight");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4232
// Size: 0x8c
function function_8fdd5ec3d6f3505e() {
    flag_wait("nt_lure_ambush_grab_player");
    self playsound("scn_grab_pull");
    flag_wait("nt_lure_ambush_hit_player");
    level.var_7631474af43da9b4.enemy02 shoot();
    wait 0.1;
    self playsound("prj_bullet_large_flesh_torso_plr_armor");
    level.player setsoundsubmix("sp_jup_flashback_paramedics_shot_plr", 0.1);
    level.player delaycall(3, &clearsoundsubmix, "sp_jup_flashback_paramedics_shot_plr", 4);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42c6
// Size: 0x7f
function function_63273eb420810c49() {
    level endon("penthouse_secure");
    self waittill("death");
    foreach (ally in level.allies) {
        ally stop_magic_bullet_shield();
        namespace_7f81dff3bcaf7919::squib_head(ally);
        ally.diequietly = 1;
        ally kill();
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x434d
// Size: 0x12f
function function_b3fbc2d04553c6cc(animnode, anim_scene, var_4bf386b0f91a435f, var_2b24b3fcff178873, var_1a4db22aa5f90a11, var_c1934658d6661228) {
    if (!isdefined(var_4bf386b0f91a435f)) {
        var_4bf386b0f91a435f = 1;
    }
    if (!isdefined(var_2b24b3fcff178873)) {
        var_2b24b3fcff178873 = 1;
    }
    if (!isdefined(var_1a4db22aa5f90a11)) {
        var_1a4db22aa5f90a11 = "stand";
    }
    if (!isdefined(var_c1934658d6661228)) {
        var_c1934658d6661228 = 0.6;
    }
    if (var_4bf386b0f91a435f) {
        self disableweapons();
    }
    if (isdefined(level.player_rig)) {
        level.player_rig delete();
    }
    level.player_rig = spawn_anim_model("player_rig", (0, 0, 0), (0, 0, 0));
    level.player_rig hide();
    level.player_rig dontinterpolate();
    self dontinterpolate();
    level.player setstance(var_1a4db22aa5f90a11, 1);
    while (level.player getstance() != var_1a4db22aa5f90a11) {
        waitframe();
    }
    self freezecontrols(var_2b24b3fcff178873);
    animnode anim_first_frame_solo(level.player_rig, anim_scene);
    waitframe();
    function_e86b9ca948270886(var_c1934658d6661228);
    self notify("blended_to_igc_state");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4484
// Size: 0x47
function function_6c85278bd835d3ab(var_e17dc8df92787dda) {
    var_e17dc8df92787dda = default_to(var_e17dc8df92787dda, 1);
    if (var_e17dc8df92787dda) {
        self enableweapons();
    }
    self unlink();
    level.player_rig hide();
    self freezecontrols(0);
    self notify("disabled_igc_state");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x44d3
// Size: 0xcb
function function_e86b9ca948270886(blend_time) {
    if (!isdefined(blend_time)) {
        blend_time = 0.6;
    }
    assert(isdefined(level.player_rig));
    level.player playerlinktoblend(level.player_rig, "tag_player", blend_time, blend_time * 0.5, blend_time * 0.5);
    level.player delaycall(blend_time, &playerlinktodelta, level.player_rig, "tag_player", 1, 0, 0, 0, 0, 1);
    level.player delaycall(blend_time + 0.5, &lerpviewangleclamp, 1, 0.5, 0.5, 10, 10, 10, 10);
    level.player_rig delaycall(blend_time + 0.1, &show);
    wait blend_time;
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x45a6
// Size: 0x16c
function function_1c3cf12e079b48cc(var_2d7b5ccd309f3a6f) {
    if (var_2d7b5ccd309f3a6f) {
        return;
    }
    var_ad6a00ddd81a5774 = spawnstruct();
    var_ad6a00ddd81a5774.animnode = level.var_7631474af43da9b4.animnode;
    var_ad6a00ddd81a5774.var_80a430288ed01864 = "fbk_0360_intro";
    var_ad6a00ddd81a5774.var_298fc64ffe3d9320 = "stand";
    var_ad6a00ddd81a5774.var_a900ec49b62870fb = 0.5;
    direction = function_3ab5963c9bcc440b((26312, 5122, -16), (0, 224, 0));
    switch (direction) {
    case #"hash_bf1a695c21e57fe4": 
        var_ad6a00ddd81a5774.var_a779bb61fe7ea6b = "fbk_0360_intro_enter_front";
        break;
    case #"hash_c9b3133a17a3b2d0": 
        var_ad6a00ddd81a5774.var_a779bb61fe7ea6b = "fbk_0360_intro_enter_left";
        break;
    case #"hash_96815ce4f2a3dbc5": 
        var_ad6a00ddd81a5774.var_a779bb61fe7ea6b = "fbk_0360_intro_enter_right";
        break;
    }
    thread function_c1de9e8d1524edce(var_ad6a00ddd81a5774);
    level.player waittill("enter_blend_done");
    level.var_7631474af43da9b4.animnode thread anim_single_solo(level.var_7631474af43da9b4.var_29992e7c89906a8c, "fbk_0360_intro");
    level.var_7631474af43da9b4.var_29992e7c89906a8c namespace_47819225b08b445d::function_cd8107d772ca6582();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x471a
// Size: 0xf7
function function_3ab5963c9bcc440b(origin, angles, var_413274c2fbe6d9d8, var_186abf38478e3e49) {
    if (!isdefined(var_413274c2fbe6d9d8)) {
        var_413274c2fbe6d9d8 = 65;
    }
    if (!isdefined(var_186abf38478e3e49)) {
        var_186abf38478e3e49 = 93;
    }
    var_fa32dd676e1ff80b = anglestoforward((angles[0], angles[1] - 90, angles[2]));
    to_player = vectornormalize(level.player.origin - origin);
    dot = vectordot(var_fa32dd676e1ff80b, to_player);
    angle = acos(dot);
    var_2ca32849a4f7ec7a = distance2d(origin, level.player.origin);
    if (angle < var_186abf38478e3e49 && angle > var_413274c2fbe6d9d8) {
        return "center";
    }
    if (angle > var_186abf38478e3e49) {
        return "left";
    }
    if (angle < var_413274c2fbe6d9d8) {
        return "right";
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4819
// Size: 0x34f
function function_c1de9e8d1524edce(settings) {
    var_a900ec49b62870fb = 0.5;
    if (isdefined(settings)) {
        animnode = settings.animnode;
        var_80a430288ed01864 = settings.var_80a430288ed01864;
        var_a779bb61fe7ea6b = settings.var_a779bb61fe7ea6b;
        bodymodel = settings.var_1df5b199075babd6;
        var_298fc64ffe3d9320 = settings.var_298fc64ffe3d9320;
        var_a900ec49b62870fb = settings.var_a900ec49b62870fb;
    }
    level.player disableweapons();
    level.player disableoffhandweapons();
    level.player allowmelee(0);
    if (isdefined(var_298fc64ffe3d9320)) {
        level.player setstance(var_298fc64ffe3d9320, 1);
        while (level.player getstance() != var_298fc64ffe3d9320) {
            waitframe();
        }
    }
    if (isdefined(level.player_rig)) {
        level.player_rig delete();
    }
    level.player_rig = spawn_anim_model("player_rig", (0, 0, 0), (0, 0, 0));
    if (isdefined(bodymodel)) {
        level.player_rig setmodel(bodymodel);
    }
    level.player_rig hide();
    level.player_rig dontinterpolate();
    level.player dontinterpolate();
    var_c2e9164803e03be9 = getanimlength(level.player_rig getanim(var_a779bb61fe7ea6b));
    animnode anim_first_frame_solo(level.player_rig, var_a779bb61fe7ea6b);
    waitframe();
    animnode thread anim_single_solo(level.player_rig, var_a779bb61fe7ea6b);
    blendtime = var_c2e9164803e03be9;
    var_be589a16ae42c0cd = blendtime * var_a900ec49b62870fb;
    rightarc = 30;
    leftarc = 30;
    toparc = 30;
    bottomarc = 30;
    level.player playerlinktoblend(level.player_rig, "tag_player", blendtime, blendtime * 0.5, blendtime * 0.5);
    level.player delaycall(blendtime, &playerlinktodelta, level.player_rig, "tag_player", 1, 0, 0, 0, 0, 1);
    level.player delaycall(blendtime + 0.5, &lerpviewangleclamp, 1, 0.5, 0.5, rightarc, leftarc, toparc, bottomarc);
    level.player_rig delaycall(var_be589a16ae42c0cd, &show);
    wait blendtime;
    level.player notify("enter_blend_done");
    animnode anim_first_frame_solo(level.player_rig, var_80a430288ed01864);
    animnode anim_single_solo(level.player_rig, var_80a430288ed01864);
    level.player unlink();
    level.player_rig delete();
    level.player notify("blended_anim_done");
    level.player allowmelee(1);
    level.player enableweapons();
    level.player enableoffhandweapons();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b70
// Size: 0x1f8
function function_4c1f8dec3e3915d8() {
    level.player disableweapons();
    level.player_rig = spawn_anim_model("player_rig", (0, 0, 0), (0, 0, 0));
    level.player_rig hide();
    level.player_rig dontinterpolate();
    var_c2e9164803e03be9 = getanimlength(level.player_rig getanim("fbk_0360_intro_enter_front"));
    level.var_7631474af43da9b4.animnode anim_first_frame_solo(level.player_rig, "fbk_0360_intro_enter_front");
    level.var_7631474af43da9b4.animnode thread anim_single_solo(level.player_rig, "fbk_0360_intro_enter_front");
    blendtime = var_c2e9164803e03be9;
    rightarc = 30;
    leftarc = 30;
    toparc = 30;
    bottomarc = 30;
    level.player playerlinktoblend(level.player_rig, "tag_player", blendtime, blendtime * 0.5, blendtime * 0.5);
    level.player delaycall(blendtime, &playerlinktodelta, level.player_rig, "tag_player", 1, 0, 0, 0, 0, 1);
    level.player delaycall(blendtime + 0.5, &lerpviewangleclamp, 1, 0.5, 0.5, rightarc, leftarc, toparc, bottomarc);
    wait blendtime;
    level.player_rig show();
    level.var_7631474af43da9b4.animnode anim_single_solo(level.player_rig, "fbk_0360_intro");
    level.player enableweapons();
    level.player unlink();
    level.player_rig delete();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d70
// Size: 0x22
function function_8a4ba00f272a838f(var_2d7b5ccd309f3a6f) {
    self endon("stop_react_logic");
    childthread function_39d953db4052dc35();
    childthread function_c68f5069b0feaf58();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d9a
// Size: 0x84
function function_39d953db4052dc35() {
    level endon("penthouse_combat");
    level.var_7631474af43da9b4.animnode anim_first_frame_solo(self, "fbk_0360_intro");
    level.var_7631474af43da9b4.animnode thread anim_single_solo(level.var_7631474af43da9b4.var_de67db04493fd503, "fbk_0360_intro");
    level.var_7631474af43da9b4.animnode anim_single_solo(self, "fbk_0360_intro");
    level notify("intro_anims_done");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e26
// Size: 0x29
function function_c68f5069b0feaf58() {
    flag_wait("penthouse_combat");
    self stopanimscripted();
    anim_single_solo(self, "fbk_0360_react_dynamic");
    function_3035d61a7fc9452f();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e57
// Size: 0x37
function function_3035d61a7fc9452f() {
    set_movement_speed(90);
    level.var_7631474af43da9b4.animnode anim_reach_solo(self, "penthouse_bomb");
    flag_set("price_ready_for_penthouse_anim");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e96
// Size: 0x22
function function_2b8e8d55bb12210d(var_2d7b5ccd309f3a6f) {
    self endon("stop_react_logic");
    childthread function_7d97bc289555c653();
    childthread function_9e4024359e756f32();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ec0
// Size: 0x51
function function_7d97bc289555c653() {
    level endon("penthouse_combat");
    level.var_7631474af43da9b4.animnode anim_first_frame_solo(self, "fbk_0360_intro");
    level.var_7631474af43da9b4.animnode anim_single_solo(self, "fbk_0360_intro");
    level notify("intro_anims_done");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f19
// Size: 0x2d
function function_9e4024359e756f32() {
    var_32eecc65bafeea0a = level waittill_any_return("penthouse_combat", "intro_anims_done");
    self stopanimscripted();
    waitframe();
    function_b71a8bf8942d4201();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f4e
// Size: 0x4c
function function_b71a8bf8942d4201() {
    level.var_7631474af43da9b4.animnode anim_reach_solo(self, "penthouse_bomb");
    self setgoalpos(self.origin, 32);
    self allowedstances("crouch");
    flag_set("redshirt_ready_for_penthouse_anim");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fa2
// Size: 0x59
function function_9db6e4648ce6b850() {
    var_c59a1bf410f24b79 = array_merge(level.var_7631474af43da9b4.civs, level.var_7631474af43da9b4.var_1ddcee644bcf7b26);
    level.var_7631474af43da9b4.animnode anim_single(var_c59a1bf410f24b79, "fbk_0360_intro");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5003
// Size: 0x45
function function_5883f56d225b4f89() {
    self endon("death");
    self endon("stop_react_logic");
    childthread function_3242c3938ea0580f();
    flag_wait("penthouse_combat");
    self.health = 1;
    self.deathfunction = &animation::function_ce450b9957138bd5;
    childthread function_342303677755165e();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5050
// Size: 0x64
function function_342303677755165e() {
    self endon("death");
    thread function_ec985bcfd00c5bbf();
    animnode = {#angles:(0, 45, 0), #origin:self.origin};
    animnode anim_single_solo(self, "fbk_0360_react_dive_death");
    self.deathfunction = undefined;
    function_e2ca6c74c16376cc();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50bc
// Size: 0xe
function function_ec985bcfd00c5bbf() {
    self playsound("fbk_0360_clubhouse_conflict_react_enmy01_01_Script");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50d2
// Size: 0x67
function function_3242c3938ea0580f() {
    self endon("death");
    level endon("penthouse_combat");
    level.var_7631474af43da9b4.animnode anim_single_solo(self, "fbk_0360_intro");
    level notify("intro_anims_done");
    level.var_7631474af43da9b4.animnode anim_single_solo(self, "fbk_0360_react");
    self notify("behavior_normal_done");
    function_e2ca6c74c16376cc();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5141
// Size: 0x20
function function_3e31d6d3a1099890() {
    self endon("death");
    self endon("stop_react_logic");
    childthread function_80fac2be80e55ca();
    childthread function_244f6c9d5604a94f();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5169
// Size: 0x7e
function function_80fac2be80e55ca() {
    self endon("death");
    self endon("stop_behavior_normal");
    level.var_7631474af43da9b4.animnode anim_single_solo(self, "fbk_0360_intro");
    level notify("intro_anims_done");
    level.var_7631474af43da9b4.animnode thread anim_single_solo(self, "fbk_0360_react");
    self notify("behavior_normal_done");
    wait 0.5;
    namespace_223959d3e5206cfb::forceuseweapon(make_weapon("iw9_pi_golf17_sp"), "primary");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51ef
// Size: 0x5b
function function_244f6c9d5604a94f() {
    level endon("intro_anims_done");
    flag_wait("penthouse_combat");
    self notify("stop_behavior_normal");
    level.var_7631474af43da9b4.animnode thread anim_single_solo(self, "fbk_0360_react_crouch_pistol");
    wait 0.5;
    namespace_223959d3e5206cfb::forceuseweapon(make_weapon("iw9_pi_golf17_sp"), "primary");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5252
// Size: 0x31
function function_e88ca8840459e0b() {
    self endon("death");
    self endon("stop_react_logic");
    function_7ba88b2ee15a39a1("iw9_sm_aviktor_sp", "j_gun");
    childthread function_83f6650aebbd6401();
    childthread function_dd1f3fd8c2bcbb0();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x528b
// Size: 0x7e
function function_83f6650aebbd6401() {
    self endon("death");
    self endon("stop_behavior_normal");
    level.var_7631474af43da9b4.animnode anim_single_solo(self, "fbk_0360_intro");
    level notify("intro_anims_done");
    function_67e4cafd8e2ff2da();
    namespace_223959d3e5206cfb::forceuseweapon(make_weapon("iw9_sm_aviktor_sp"), "primary");
    level.var_7631474af43da9b4.animnode anim_single_solo(self, "fbk_0360_react_toss_ar_into_ar");
    self notify("behavior_normal_done");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5311
// Size: 0x57
function function_dd1f3fd8c2bcbb0() {
    self endon("death");
    level endon("intro_anims_done");
    flag_wait("penthouse_combat");
    self notify("stop_behavior_normal");
    function_c68144cb77976e2f(0);
    thread anim_single_solo(self, "fbk_0360_react_stand_pistol");
    wait 0.5;
    namespace_223959d3e5206cfb::forceuseweapon(make_weapon("iw9_pi_golf17_sp"), "primary");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5370
// Size: 0x31
function function_b322866f1a7f1f1a() {
    self endon("death");
    self endon("stop_react_logic");
    function_7ba88b2ee15a39a1("iw9_ar_akilo_sp", "j_gun");
    childthread function_559e45777ecdd47c();
    childthread function_96270100193d8d21();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53a9
// Size: 0x70
function function_559e45777ecdd47c() {
    self endon("death");
    self endon("stop_behavior_normal");
    level.var_7631474af43da9b4.animnode anim_single_solo(self, "fbk_0360_intro");
    level notify("intro_anims_done");
    thread function_228c332440741c42();
    thread function_aa0516799368e121();
    level.var_7631474af43da9b4.animnode anim_single_solo(self, "fbk_0360_react_toss_ar_into_ar");
    self notify("behavior_normal_done");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5421
// Size: 0x70
function function_96270100193d8d21() {
    self endon("death");
    level endon("intro_anims_done");
    var_32eecc65bafeea0a = level waittill("penthouse_combat");
    if (var_32eecc65bafeea0a == "player_lured_to_ambush") {
        return;
    }
    self notify("stop_behavior_normal");
    self stopanimscripted();
    function_c68144cb77976e2f(0);
    thread anim_single_solo(self, "fbk_0360_react_stand_pistol");
    wait 0.5;
    namespace_223959d3e5206cfb::forceuseweapon(make_weapon("iw9_pi_golf17_sp"), "primary");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5499
// Size: 0x120
function function_228c332440741c42() {
    level endon("nt_lure_ambush_gun_throw_end");
    self endon("death");
    self.var_613b026f2e54e7d9 linkto(self, "j_gun");
    self.var_613b026f2e54e7d9 setcandamage(1);
    flag_wait("nt_lure_ambush_gun_throw_start");
    dmg, attacker, dir, point, mod, modelname, tagname, full_partname, idflags, weapobj = self.var_613b026f2e54e7d9 waittill("damage");
    if (!is_equal(attacker, level.player)) {
        return;
    }
    scripts\sp\utility::giveachievement_wrapper("jup_sp_shotblocked");
    /#
    #/
    thread function_57932a67c0e35049(dir);
    self stopanimscripted();
    thread anim_single_solo(self, "fbk_0360_react_stand_pistol");
    wait 0.5;
    namespace_223959d3e5206cfb::forceuseweapon(make_weapon("iw9_pi_golf17_sp"), "primary");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x55c1
// Size: 0xac
function function_57932a67c0e35049(var_100e1379ae0effe5) {
    self.var_613b026f2e54e7d9 detachall();
    self.var_613b026f2e54e7d9 make_weapon_model("iw9_ar_akilo_sp", ["rec_akilo|17"]);
    self.var_613b026f2e54e7d9 unlink();
    self.var_613b026f2e54e7d9 physicslaunchserver(self.var_613b026f2e54e7d9.origin, var_100e1379ae0effe5 * (2000, 2000, 2000));
    var_613b026f2e54e7d9 = self.var_613b026f2e54e7d9;
    flag_wait("penthouse_secure");
    var_613b026f2e54e7d9 function_3eb3744aab74c231(0, ["rec_akilo|17"]);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5675
// Size: 0x3b
function function_aa0516799368e121() {
    self.var_613b026f2e54e7d9 endon("damage");
    flag_wait("nt_lure_ambush_gun_throw_end");
    function_67e4cafd8e2ff2da();
    namespace_223959d3e5206cfb::forceuseweapon(make_weapon("iw9_ar_akilo_sp"), "primary");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x56b8
// Size: 0x31
function function_902f710ec4728cf5() {
    self endon("death");
    self endon("stop_react_logic");
    function_7ba88b2ee15a39a1("iw9_sm_aviktor_sp", "j_gun");
    childthread function_a6c2cf599a11ebfb();
    childthread function_427d69d7e9aa7dfe();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x56f1
// Size: 0x7e
function function_a6c2cf599a11ebfb() {
    self endon("death");
    self endon("stop_behavior_normal");
    level.var_7631474af43da9b4.animnode anim_single_solo(self, "fbk_0360_intro");
    level notify("intro_anims_done");
    function_67e4cafd8e2ff2da();
    namespace_223959d3e5206cfb::forceuseweapon(make_weapon("iw9_sm_aviktor_sp"), "primary");
    level.var_7631474af43da9b4.animnode anim_single_solo(self, "fbk_0360_react");
    self notify("behavior_normal_done");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5777
// Size: 0x69
function function_427d69d7e9aa7dfe() {
    self endon("death");
    level endon("intro_anims_done");
    var_32eecc65bafeea0a = level waittill("penthouse_combat");
    if (var_32eecc65bafeea0a == "player_lured_to_ambush") {
        return;
    }
    self notify("stop_behavior_normal");
    function_c68144cb77976e2f(0);
    thread anim_single_solo(self, "fbk_0360_react_walk_pistol");
    wait 0.5;
    namespace_223959d3e5206cfb::forceuseweapon(make_weapon("iw9_pi_golf17_sp"), "primary");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x57e8
// Size: 0x78
function function_7ba88b2ee15a39a1(weaponname, tag) {
    self.var_613b026f2e54e7d9 = spawn("script_model", self gettagorigin(tag));
    self.var_613b026f2e54e7d9.angles = self gettagangles(tag);
    self.var_613b026f2e54e7d9 make_weapon_model(weaponname);
    self.spawn_tag = tag;
    self.var_613b026f2e54e7d9.weaponname = weaponname;
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5868
// Size: 0x81
function function_3eb3744aab74c231(var_45f92ce964dee8d7, weapon_attachments) {
    if (!isdefined(var_45f92ce964dee8d7)) {
        var_45f92ce964dee8d7 = 1;
    }
    var_68259f74021b3d40 = 1;
    if (!isdefined(weapon_attachments)) {
        weapon_attachments = [];
    }
    spawn_origin = self.origin;
    spawn_angles = self.angles;
    if (var_45f92ce964dee8d7) {
        var_68259f74021b3d40 = 0;
    }
    if (isdefined(self)) {
        utility::function_ec8a443fe8165fe4(self.weaponname, spawn_origin, weapon_attachments, spawn_angles, var_68259f74021b3d40);
        self delete();
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x58f1
// Size: 0x100
function function_c68144cb77976e2f(var_45f92ce964dee8d7, var_37667c11929f84ee, var_d8d96f683dc1e744, weapon_attachments) {
    if (!isdefined(var_45f92ce964dee8d7)) {
        var_45f92ce964dee8d7 = 1;
    }
    if (!isdefined(var_37667c11929f84ee)) {
        var_37667c11929f84ee = 1;
    }
    if (!isdefined(var_d8d96f683dc1e744)) {
        var_d8d96f683dc1e744 = 1;
    }
    var_68259f74021b3d40 = 1;
    if (!isdefined(weapon_attachments)) {
        weapon_attachments = [];
    }
    spawn_origin = ter_op(var_37667c11929f84ee, self gettagorigin(self.spawn_tag), self.var_613b026f2e54e7d9.origin);
    spawn_angles = ter_op(var_d8d96f683dc1e744, self gettagangles(self.spawn_tag), self.var_613b026f2e54e7d9.angles);
    if (var_45f92ce964dee8d7) {
        var_68259f74021b3d40 = 0;
    }
    if (isdefined(self.var_613b026f2e54e7d9)) {
        utility::function_ec8a443fe8165fe4(self.var_613b026f2e54e7d9.weaponname, spawn_origin, weapon_attachments, spawn_angles, var_68259f74021b3d40);
        self.var_613b026f2e54e7d9 delete();
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59f9
// Size: 0x1e
function function_67e4cafd8e2ff2da() {
    if (isdefined(self.var_613b026f2e54e7d9)) {
        self.var_613b026f2e54e7d9 delete();
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a1f
// Size: 0xbd
function function_1a4995da9ba1c914(var_2d7b5ccd309f3a6f) {
    level endon("stop_combat_checks");
    if (!var_2d7b5ccd309f3a6f) {
        var_f2b6a137b1d0b573 = level.player_rig getanim("fbk_0360_intro_enter_front");
        open_anim = level.player_rig getanim("fbk_0360_intro");
        wait getanimlength(var_f2b6a137b1d0b573) + getanimlength(open_anim);
    }
    ents = array_add(level.var_7631474af43da9b4.enemies, level.player);
    waittill_any_ents_array(ents, "death", "damage", "bulletwhizby", "grenade danger", "frag_pressed", "attack_pressed");
    level notify("player_triggered_ambush");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ae4
// Size: 0x30
function function_45944cac9c94ab3f() {
    level endon("stop_combat_checks");
    childthread trigger_wait_targetname("trig_player_start_ambush");
    level waittill_any("trig_player_start_ambush", "player_exited_room");
    level notify("player_triggered_ambush");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b1c
// Size: 0x63
function function_570bc16ef580d2a8() {
    level endon("stop_combat_checks");
    var_d60ee22ab0637266 = getstruct("struct_objective_penthouse_interior", "targetname");
    wait 3;
    while (true) {
        if (!function_95771ce6161268ef() && !level.player namespace_47819225b08b445d::function_e7c30095a6cdc3ef(var_d60ee22ab0637266.origin)) {
            break;
        }
        waitframe();
    }
    level notify("player_exited_room");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b87
// Size: 0x79
function function_e96ed542357e45b1() {
    level endon("stop_combat_checks");
    flag_wait("penthouse_lure_start");
    var_7a95ecadafe6b282 = {#angles:(0, 0, 0), #origin:(26091, 4994.5, 12)};
    var_7a95ecadafe6b282 scripts\sp\player\cursor_hint::create_cursor_hint(undefined, undefined, %SP_JUP_FLASHBACK/INTERACT_HELP, undefined, undefined, 80);
    var_7a95ecadafe6b282 thread function_133d406234b362b8();
    var_7a95ecadafe6b282 waittill("trigger");
    level notify("player_lured_to_ambush");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c08
// Size: 0x1d
function function_133d406234b362b8() {
    self endon("trigger");
    level waittill_any("penthouse_combat");
    scripts\sp\player\cursor_hint::remove_cursor_hint();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c2d
// Size: 0x10f
function function_906345f2536d929e(var_a8ab85e00a32f402) {
    if (!isdefined(var_a8ab85e00a32f402)) {
        var_a8ab85e00a32f402 = 1;
    }
    self endon("stop_fake_bash");
    while (true) {
        var_584c82b60d83b68a = scripts\sp\door::get_door_angles();
        var_fa32dd676e1ff80b = anglestoforward((var_584c82b60d83b68a[0], var_584c82b60d83b68a[1] - 90, var_584c82b60d83b68a[2]));
        player_forward = anglestoforward(level.player getplayerangles());
        dot = vectordot(var_fa32dd676e1ff80b, player_forward);
        var_2ca32849a4f7ec7a = distance2d(self.origin, level.player.origin);
        /#
        #/
        if (var_2ca32849a4f7ec7a <= 60 && dot > 0.87 && (level.player ismeleeing() || level.player issprinting())) {
            break;
        }
        waitframe();
    }
    self notify("fake_bashed");
    if (var_a8ab85e00a32f402) {
        thread scripts\sp\door::door_bash_open(level.player, 0.4);
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d44
// Size: 0x92
function function_cc509b516bc03b00() {
    level.var_7631474af43da9b4.var_29992e7c89906a8c.no_bash = 1;
    level.var_7631474af43da9b4.var_29992e7c89906a8c thread function_906345f2536d929e();
    result = level.var_7631474af43da9b4.var_29992e7c89906a8c waittill_any_return("trigger", "fake_bashed");
    level.var_7631474af43da9b4.var_29992e7c89906a8c notify("stop_fake_bash");
    flag_set("penthouse_door_interacted", result);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5dde
// Size: 0x60d
function function_5a3fd2b18b03bed4() {
    level.var_7631474af43da9b4 = spawnstruct();
    flag_init("penthouse_lure_start");
    flag_init("penthouse_combat");
    flag_init("penthouse_door_interacted");
    flag_init("penthouse_scene_initialized");
    function_a7b0ec5f85cf2c55();
    level.var_7631474af43da9b4.animnode = getstruct("animnode_panthouse_conflict", "targetname");
    level.var_7631474af43da9b4.bomb_bag = spawn_anim_model("bomb_bag");
    level.var_7631474af43da9b4.animnode anim_first_frame_solo(level.var_7631474af43da9b4.bomb_bag, "penthouse_bomb");
    thread function_cc509b516bc03b00();
    var_ef9a2a53f946c7d4 = getspawner("enemy_vip", "targetname");
    var_3158a237b2dd069a = getspawner("civ_vip", "targetname");
    var_ef9a2a53f946c7d4.count = 4;
    level.var_7631474af43da9b4.enemies = [];
    for (i = 1; i < 6; i++) {
        var_ef9a2a53f946c7d4.count = 1;
        enemy = spawn_aitype(var_ef9a2a53f946c7d4.classname, var_ef9a2a53f946c7d4.origin, var_ef9a2a53f946c7d4.angles, 1);
        assert(isdefined(enemy));
        enemy.animname = "enemy0" + i;
        enemy.script_noteworthy = enemy.animname;
        enemy.targetname = enemy.animname;
        level.var_7631474af43da9b4.enemies[level.var_7631474af43da9b4.enemies.size] = enemy;
        enemy set_allowdeath(1);
        enemy set_ignoreme(1);
        enemy utility::function_1a479cad9c3adbb1(0);
        enemy.var_69d917ef9321a40 = enemy.weapon;
        enemy putgunaway();
        enemy visiblenotsolid();
        enemy actoraimassistoff();
        switch (enemy.animname) {
        case #"hash_b1814a65888b98f0": 
            level.var_7631474af43da9b4.enemy01 = enemy;
            level.var_7631474af43da9b4.var_b7854da468b7f3b1 = enemy;
            enemy detach(enemy.headmodel);
            enemy.headmodel = "c_jup_head_sc_m_dunn";
            enemy attach(enemy.headmodel);
            break;
        case #"hash_b1814d65888b9da9": 
            level.var_7631474af43da9b4.enemy02 = enemy;
            level.var_7631474af43da9b4.var_f93e9d0d5db8bd1b = enemy;
            enemy detach(enemy.headmodel);
            enemy.headmodel = "head_c_jup_sc_m_sharipov_flashback";
            enemy attach(enemy.headmodel);
            break;
        case #"hash_b1814c65888b9c16": 
            level.var_7631474af43da9b4.var_c758f5006b0cfc3a = enemy;
            break;
        case #"hash_b1814f65888ba0cf": 
            level.var_7631474af43da9b4.var_c758f0006b0cf13b = enemy;
            break;
        case #"hash_b1814e65888b9f3c": 
            level.var_7631474af43da9b4.var_c758ef006b0cef08 = enemy;
            break;
        }
        /#
        #/
    }
    level.var_7631474af43da9b4.var_1ddcee644bcf7b26 = [];
    for (i = 1; i < 4; i++) {
        animname = "stretcher_" + i;
        var_382006ac0eaf6e31 = spawn_anim_model(animname);
        level.var_7631474af43da9b4.var_1ddcee644bcf7b26[level.var_7631474af43da9b4.var_1ddcee644bcf7b26.size] = var_382006ac0eaf6e31;
    }
    level.var_7631474af43da9b4.civs = [];
    for (i = 1; i < 5; i++) {
        body_model = "body_civ_embassy_ambassador";
        animname = "civ0" + i;
        spawner = getspawner("alpha_civ_spawner_male", "script_noteworthy");
        if (animname == "civ01") {
            body_model = "body_civ_embassy_office_worker_female_2_2";
            spawner = getspawner("alpha_civ_spawner_female", "script_noteworthy");
        }
        civ = bodyonlyspawn(spawner);
        civ.animname = animname;
        civ.script_noteworthy = animname;
        civ setmodel(body_model);
        civ notsolid();
        level.var_7631474af43da9b4.animnode anim_first_frame_solo(civ, "fbk_0360_intro");
        level.var_7631474af43da9b4.civs[level.var_7631474af43da9b4.civs.size] = civ;
    }
    level.var_7631474af43da9b4.var_c59a1bf410f24b79 = array_merge(level.var_7631474af43da9b4.civs, level.var_7631474af43da9b4.var_771081960d597a72);
    level.var_7631474af43da9b4.var_c59a1bf410f24b79 = array_merge(level.var_7631474af43da9b4.var_c59a1bf410f24b79, level.var_7631474af43da9b4.var_1ddcee644bcf7b26);
    level.var_7631474af43da9b4.var_c59a1bf410f24b79 = array_merge(level.var_7631474af43da9b4.var_c59a1bf410f24b79, level.var_7631474af43da9b4.enemies);
    level.var_7631474af43da9b4.animnode anim_first_frame(level.var_7631474af43da9b4.var_c59a1bf410f24b79, "fbk_0360_intro");
    flag_set("penthouse_scene_initialized");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x63f3
// Size: 0x2a5
function function_a7b0ec5f85cf2c55() {
    assert(isdefined(level.var_7631474af43da9b4));
    level.var_7631474af43da9b4.var_de67db04493fd503 = scripts\sp\door::get_interactive_door("penthouse_front_door_left");
    level.var_7631474af43da9b4.var_29992e7c89906a8c = scripts\sp\door::get_interactive_door("penthouse_front_door_right");
    level.var_7631474af43da9b4.var_de67db04493fd503 assign_animtree("penthouse_front_door_left");
    level.var_7631474af43da9b4.var_29992e7c89906a8c assign_animtree("penthouse_front_door_right");
    level.var_7631474af43da9b4.var_771081960d597a72 = [level.var_7631474af43da9b4.var_de67db04493fd503, level.var_7631474af43da9b4.var_29992e7c89906a8c];
    foreach (door in level.var_7631474af43da9b4.var_771081960d597a72) {
        animnode = getstruct("animnode_panthouse_conflict", "targetname");
        animnode anim_first_frame_solo(door, "fbk_0360_intro");
    }
    level.var_7631474af43da9b4.var_de67db04493fd503 namespace_47819225b08b445d::function_cd8107d772ca6582();
    level.var_7631474af43da9b4.var_29992e7c89906a8c.script_spawn_open_yaw = 0.01;
    level.var_7631474af43da9b4.var_4949cff560c88be5 = scripts\sp\door::get_interactive_door("penthouse_back_door_left");
    level.var_7631474af43da9b4.var_4899b7101cd5b7fe = scripts\sp\door::get_interactive_door("penthouse_back_door_right");
    level.var_7631474af43da9b4.var_4949cff560c88be5 assign_animtree("penthouse_back_door_left");
    level.var_7631474af43da9b4.var_73d42ccddec3520 = [level.var_7631474af43da9b4.var_4949cff560c88be5, level.var_7631474af43da9b4.var_4899b7101cd5b7fe];
    foreach (door in level.var_7631474af43da9b4.var_73d42ccddec3520) {
        door.script_forceyaw = 1;
        door.max_yaw_left = 95;
        door namespace_47819225b08b445d::function_cd8107d772ca6582();
        door scripts\sp\door::updatenavobstacle(1);
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66a0
// Size: 0x5b
function function_b5b2fd4d0f7abb3c() {
    level.var_7631474af43da9b4.enemies = array_remove(level.var_7631474af43da9b4.enemies, level.var_7631474af43da9b4.var_c758f2006b0cf5a1);
    level.var_7631474af43da9b4.var_c758f2006b0cf5a1 delete();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6703
// Size: 0x10
function function_6a85e32a9a2ada7c() {
    if (!isdefined(level.var_7631474af43da9b4)) {
        return;
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x671b
// Size: 0x5a
function function_819657b33ca571ab() {
    if (isdefined(level.ghost)) {
        level.ghost stop_magic_bullet_shield();
        level.ghost delete();
    }
    if (isdefined(level.redshirt)) {
        level.redshirt stop_magic_bullet_shield();
        level.redshirt delete();
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x677d
// Size: 0xd
function elevator_music() {
    setmusicstate("mx_flashback_elevator");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6792
// Size: 0x1a
function function_35ce8a71fb1d1a88(guy) {
    self waittill("movedone");
    guy unlink();
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x67b4
// Size: 0xed
function function_e099cbf58f010c0f() {
    thread set_flag_on_targetname_trigger("trigger_penthouse_arrive");
    flag_init("penthouse_floor_vo_done");
    flag_wait("concourse_stairs_vo_done");
    if (level.player can_see_origin((26216, 5376, 72))) {
        level.player say_delayed(0.2, "dx_sp_flas_penf_soap_eyesontheviparea");
    } else {
        level.price say_delayed(0.2, "dx_sp_flas_penf_pric_eyesontheviparea");
    }
    if (!flag("trigger_penthouse_arrive")) {
        nags = ["dx_sp_flas_penf_pric_weremovingupsergeant", "dx_sp_flas_penf_pric_goteyesonthevipareas", "dx_sp_flas_penf_pric_sergeantgetyourarseu"];
        level.price thread nagtill([level, "trigger_penthouse_arrive"], nags, 11);
    }
    flag_wait("trigger_penthouse_arrive");
    flag_set("penthouse_floor_vo_done");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68a9
// Size: 0xd
function function_7d54441cf105253b() {
    stopmusicstate("mx_flashback_combatstairs");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68be
// Size: 0x89
function function_e93d15e50511b28() {
    level endon("penthouse_door_interacted");
    flag_wait("penthouse_floor_vo_done");
    level.price say("dx_sp_flas_penf_pric_gotmovementinsidesta");
    level.price say("dx_sp_flas_penf_pric_onyousergeant");
    nags = ["dx_sp_flas_penf_pric_letsgetinthere", "dx_sp_flas_penf_pric_onyousergeant", "dx_sp_flas_penf_pric_ready"];
    level.price childthread nagtill([level, "penthouse_door_interacted"], nags, 11);
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x694f
// Size: 0x70
function function_b69a4e871476186e() {
    level endon("penthouse_combat");
    thread function_bfdddea701e82ab3();
    thread function_10af6c9023fff17f();
    thread function_8bb00b09c8521d04();
    var_4f16c4e4e84b9954 = flag_wait("penthouse_door_interacted");
    if (is_equal(var_4f16c4e4e84b9954, "fake_bashed")) {
        level.player function_fc0eb6b81c66c661(1, "dx_sp_flas_pena_soap_handsshowyourhands");
    }
    delaythread(10, &flag_set, "penthouse_lure_start");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x69c7
// Size: 0x18
function function_8bb00b09c8521d04() {
    level endon("penthouse_combat");
    wait 22;
    flag_set("price_enemy_warning");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x69e7
// Size: 0x81
function function_10af6c9023fff17f() {
    level endon("penthouse_stop_lure_vo");
    level waittill("player_lured_to_ambush");
    flag_wait("nt_lure_ambush_grab_player");
    function_54d3bd59bff7e908();
    flag_wait("penthouse_secure");
    wait 0.5;
    level.redshirt say("dx_sp_flas_pena_burn_secure");
    level.price say("dx_sp_flas_pena_pric_sergeantyoubroken");
    level.player say("dx_sp_flas_pena_soap_justtheplate");
    flag_set("penthouse_vo_done");
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a70
// Size: 0xa6
function function_bfdddea701e82ab3() {
    level endon("player_lured_to_ambush");
    var_32eecc65bafeea0a = level waittill("penthouse_combat");
    function_54d3bd59bff7e908();
    flag_wait("penthouse_secure");
    level.redshirt say("dx_sp_flas_pena_burn_secure");
    if (!flag("price_enemy_warning")) {
        switch (var_32eecc65bafeea0a) {
        case #"hash_803ae8da9cbe3c03":
        default: 
            wait 0.2;
            level.player say("dx_sp_flas_pena_soap_fuckerswereinnercirc");
            level.price say("dx_sp_flas_pena_pric_goodcallthen");
            break;
        }
    }
}

// Namespace namespace_3345ab597fd83308 / namespace_997789c5b521a997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b1e
// Size: 0x64
function function_a39b20c9ff530e2() {
    if (flag("price_at_elevator")) {
        array = [player%fbk_0400_clubhouse_elevator_open_enter_left_plr, player%fbk_0400_clubhouse_elevator_open_enter_front_plr];
    } else {
        array = [player%fbk_0400_clubhouse_elevator_plr_open_enter_left_plr, player%fbk_0400_clubhouse_elevator_plr_open_enter_right_plr, player%fbk_0400_clubhouse_elevator_plr_open_enter_front_plr];
    }
    return array;
}
