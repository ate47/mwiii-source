#using script_5d265b4fca61f070;
#using scripts\common\ai.gsc;
#using scripts\common\anim.gsc;
#using scripts\common\scene.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\sp\anim.gsc;
#using script_109cf9cc19f3d346;
#using scripts\sp\player_rig.gsc;
#using scripts\sp\utility.gsc;

#namespace namespace_9dac6446353f291e;

// Namespace namespace_9dac6446353f291e / namespace_1314e1b8f4d8b292
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52c
// Size: 0x153
function main() {
    level._effect["vfx_hij_bomblight"] = loadfx("vfx/jup/level/sp_jup_hijack/vfx_hij_bomblight.vfx");
    level._effect["vfx_hij_mask_door_01"] = loadfx("vfx/jup/level/sp_jup_hijack/vfx_hij_mask_door_01.vfx");
    level._effect["vfx_hij_grenade_glint"] = loadfx("vfx/jup/level/sp_jup_hijack/vfx_hij_grenade_glint.vfx");
    level._effect["vfx_hij_blood_pool_grow"] = loadfx("vfx/jup/level/sp_jup_hijack/vfx_hij_blood_pool_grow.vfx");
    level._effect["vfx_hij_flahbang_geotrail"] = loadfx("vfx/jup/level/sp_jup_hijack/vfx_hij_flahbang_geotrail.vfx");
    level._effect["vfx_chemical_infil_impact_dust"] = loadfx("vfx/jup/level/sp_jup_chemical/vfx_chemical_infil_impact_dust.vfx");
    level._effect["vfx_hij_headshot_01"] = loadfx("vfx/jup/level/sp_jup_hijack/vfx_hij_headshot_01.vfx");
    level._effect["vfx_muz_pis_m"] = loadfx("vfx/iw9/core/weapons/muzzleflash/pis/vfx_muz_pis_m.vfx");
    level._effect["vfx_hij_takedown_y_forward_01"] = loadfx("vfx/jup/level/sp_jup_hijack/vfx_hij_takedown_y_forward_01.vfx");
    level._effect["vfx_hij_phone_edge_glow_intro"] = loadfx("vfx/jup/level/sp_jup_hijack/vfx_hij_phone_edge_glow_intro.vfx");
    level._effect["vfx_hij_cam_explode"] = loadfx("vfx/jup/level/sp_jup_hijack/vfx_hij_cam_explode.vfx");
    level._effect["vfx_hij_camera_glint"] = loadfx("vfx/jup/level/sp_jup_hijack/vfx_hij_camera_glint.vfx");
    if (getdvarint(@"hash_e6afce2cf5cf7515")) {
    }
    thread function_2588ef226f849c6e();
}

// Namespace namespace_9dac6446353f291e / namespace_1314e1b8f4d8b292
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x687
// Size: 0xf5
function function_2588ef226f849c6e() {
    var_27ceb937e0fb383b = getentarray("right_mask_door", "script_noteworthy");
    var_a2c32e6abfe7f186 = getentarray("centre_mask_door", "script_noteworthy");
    var_92b83298e5786d52 = getentarray("left_mask_door", "script_noteworthy");
    flag_wait("flag_hide_o2_masks");
    flag_wait("lgt_mak_para_door_open");
    waitframe();
    showmayhem("vfx_mayh_oxy_mask_02");
    waitframe();
    playmayhem("vfx_mayh_oxy_mask_02");
    var_7b55fc55738227db = array_combine(var_27ceb937e0fb383b, var_a2c32e6abfe7f186, var_92b83298e5786d52);
    foreach (ent in var_7b55fc55738227db) {
        thread function_47160456e28a2e9(ent.origin);
    }
    flag_wait("flag_player_has_weapon_return_to_econ");
}

// Namespace namespace_9dac6446353f291e / namespace_1314e1b8f4d8b292
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x784
// Size: 0xbf
function function_c3336cb9cd5c7518(wait_time) {
    rotate_time = randomfloatrange(0.5, 1);
    var_8f84e76f5224a6bf = randomintrange(-95, -85);
    new_angles = (var_8f84e76f5224a6bf, 0, 0);
    if (self.script_noteworthy == "left_mask_door") {
        self rotateby((0, 0, 15), rotate_time, 0.3, 0.01);
    } else if (self.script_noteworthy == "right_mask_door") {
        self rotateby((0, 0, -15), rotate_time, 0.3, 0.01);
    }
    wait rotate_time;
    self rotateby(new_angles, rotate_time, 0.3, 0.01);
}

// Namespace namespace_9dac6446353f291e / namespace_1314e1b8f4d8b292
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84b
// Size: 0x21
function function_47160456e28a2e9(origin) {
    playfx(level._effect["vfx_hij_mask_door_01"], origin);
}
