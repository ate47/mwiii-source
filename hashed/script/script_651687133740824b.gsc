// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5d813d45c6b1b1be;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;

#namespace namespace_c9f64699b75aaf24;

// Namespace namespace_c9f64699b75aaf24/namespace_7e65c44dbe99b93d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b
// Size: 0x117
function init(var_5179c48492d1d2c2) {
    function_efabc5ae0422de9e(var_5179c48492d1d2c2, 1);
    var_5179c48492d1d2c2.var_47bd5f983ddc96b8 = getstruct(var_5179c48492d1d2c2.target, "targetname");
    start_struct = getstruct(var_5179c48492d1d2c2.var_47bd5f983ddc96b8.target, "targetname");
    var_5179c48492d1d2c2.start_trigger = namespace_8eedd8f6cf5d9f19::function_698513ab21b7913d(start_struct);
    var_887f2e6bea2d6c52 = getstruct(start_struct.target, "targetname");
    var_5179c48492d1d2c2.var_2e87c4e6838df655 = namespace_8eedd8f6cf5d9f19::function_698513ab21b7913d(var_887f2e6bea2d6c52);
    var_5179c48492d1d2c2.reward_struct = getstruct(var_887f2e6bea2d6c52.target, "targetname");
    var_1e916dfdc1857f94 = getstruct(var_5179c48492d1d2c2.reward_struct.target, "targetname");
    function_efabc5ae0422de9e(var_5179c48492d1d2c2, 1, var_1e916dfdc1857f94);
    thread function_391bf389129f4fa6(var_5179c48492d1d2c2, 1);
    thread function_391bf389129f4fa6(var_5179c48492d1d2c2, 0);
}

// Namespace namespace_c9f64699b75aaf24/namespace_7e65c44dbe99b93d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x269
// Size: 0x7f
function private function_391bf389129f4fa6(var_5179c48492d1d2c2, forward) {
    var_5179c48492d1d2c2 endon("MRP_SPEEDWAY_NOTIFY_SUCCESS");
    while (1) {
        if (forward) {
            data = var_5179c48492d1d2c2.start_trigger waittill("trigger");
        } else {
            data = var_5179c48492d1d2c2.var_2e87c4e6838df655 waittill("trigger");
        }
        if (data isvehicle()) {
            /#
                iprintlnbold("<unknown string>");
            #/
            data childthread function_5e45bd49c6bbe0e(var_5179c48492d1d2c2, forward);
        }
        waitframe();
    }
}

// Namespace namespace_c9f64699b75aaf24/namespace_7e65c44dbe99b93d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ef
// Size: 0x5f
function private function_5e45bd49c6bbe0e(var_5179c48492d1d2c2, forward) {
    touch = forward ? var_5179c48492d1d2c2.start_trigger : var_5179c48492d1d2c2.var_2e87c4e6838df655;
    if (self vehicle_getspeed(0.15) == 0) {
        childthread function_4611c9ab4aa45ea5(var_5179c48492d1d2c2, forward);
    } else {
        wait(0.5);
    }
}

// Namespace namespace_c9f64699b75aaf24/namespace_7e65c44dbe99b93d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x355
// Size: 0x101
function private function_4611c9ab4aa45ea5(var_5179c48492d1d2c2, forward) {
    self notify("MRP_SPEEDWAY_NOTIFY_COMPLETE_SINGLETON");
    self endon("MRP_SPEEDWAY_NOTIFY_COMPLETE_SINGLETON");
    self endon("MRP_SPEEDWAY_NOTIFY_FAILED");
    var_5179c48492d1d2c2 endon("MRP_SPEEDWAY_NOTIFY_SUCCESS");
    childthread function_11dd0af8e1e8199d(var_5179c48492d1d2c2);
    thread function_6b77686cf92420a6(var_5179c48492d1d2c2, forward);
    while (1) {
        if (forward) {
            data = var_5179c48492d1d2c2.var_2e87c4e6838df655 waittill("trigger");
        } else {
            data = var_5179c48492d1d2c2.start_trigger waittill("trigger");
        }
        if (data == self && isdefined(data.occupants["driver"])) {
            if (forward) {
                reward_struct = var_5179c48492d1d2c2.reward_struct;
            } else {
                reward_struct = var_5179c48492d1d2c2.var_47bd5f983ddc96b8;
            }
            thread function_f08bad8bfb75c7a1(var_5179c48492d1d2c2, data, reward_struct);
            var_5179c48492d1d2c2.start_trigger delete();
            var_5179c48492d1d2c2.var_2e87c4e6838df655 delete();
            var_5179c48492d1d2c2 notify("MRP_SPEEDWAY_NOTIFY_SUCCESS");
            return;
        }
        waitframe();
    }
}

// Namespace namespace_c9f64699b75aaf24/namespace_7e65c44dbe99b93d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x45d
// Size: 0x7f
function private function_6b77686cf92420a6(var_5179c48492d1d2c2, forward) {
    if (!isdefined(var_5179c48492d1d2c2.var_30d136133a9010e8) || gettime() - var_5179c48492d1d2c2.var_30d136133a9010e8 > 12000) {
        /#
            iprintlnbold("<unknown string>");
        #/
        var_5179c48492d1d2c2.var_30d136133a9010e8 = gettime();
        playsoundatpos(var_5179c48492d1d2c2.models[!forward].origin, "evt_ob_mrpeeks_stinger_speedway");
    }
}

// Namespace namespace_c9f64699b75aaf24/namespace_7e65c44dbe99b93d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e3
// Size: 0x51
function private function_f08bad8bfb75c7a1(var_5179c48492d1d2c2, data, reward_struct) {
    player = data.occupants["driver"];
    function_568b8a57e0fa955f(var_5179c48492d1d2c2, player, undefined, data);
    namespace_8eedd8f6cf5d9f19::function_a4dfabe55dd4a652(player, reward_struct, "ob_jup_items_activity_mrp_speedway");
}

// Namespace namespace_c9f64699b75aaf24/namespace_7e65c44dbe99b93d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x53b
// Size: 0x28
function private function_11dd0af8e1e8199d(var_5179c48492d1d2c2) {
    wait(15);
    /#
        iprintlnbold("<unknown string>");
    #/
    self notify("MRP_SPEEDWAY_NOTIFY_FAILED");
}
