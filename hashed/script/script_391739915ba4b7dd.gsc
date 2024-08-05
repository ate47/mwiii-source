#using scripts\engine\utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\values.gsc;
#using script_6c1b22ea36b176be;
#using scripts\stealth\player.gsc;
#using scripts\cp\cp_compass.gsc;

#namespace namespace_fad6b63f0287902;

// Namespace namespace_fad6b63f0287902 / namespace_16d9c1530a364ee9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29a
// Size: 0x73
function init_script_triggers() {
    var_b65f27b4ba84b114 = get_load_trigger_classes();
    foreach (function in var_b65f27b4ba84b114) {
        triggers = getentarray(classname, "classname");
        array_levelthread(triggers, function);
    }
}

// Namespace namespace_fad6b63f0287902 / namespace_16d9c1530a364ee9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x315
// Size: 0x9e
function get_load_trigger_classes() {
    var_b65f27b4ba84b114 = [];
    var_b65f27b4ba84b114["trigger_multiple_stealth_shadow"] = &trigger_stealth_shadow;
    var_b65f27b4ba84b114["trigger_multiple_fx_fxzone"] = &trigger_flag_set_touching;
    var_b65f27b4ba84b114["trigger_multiple_flag_set"] = &trigger_flag_set;
    var_b65f27b4ba84b114["trigger_multiple_flag_set_touching"] = &trigger_flag_set_touching;
    var_b65f27b4ba84b114["trigger_multiple_flag_clear"] = &trigger_flag_clear;
    var_b65f27b4ba84b114["trigger_radius_flag_set"] = &trigger_flag_set;
    var_b65f27b4ba84b114["trigger_radius_flag_clear"] = &trigger_flag_clear;
    var_b65f27b4ba84b114["trigger_use_flag_set"] = &trigger_flag_set;
    var_b65f27b4ba84b114["trigger_use_flag_clear"] = &trigger_flag_clear;
    var_b65f27b4ba84b114["trigger_multiple_slide"] = &namespace_7b69f911b6d80230::trigger_slide;
    var_b65f27b4ba84b114["trigger_multiple_set_minimap_floor"] = &function_1dd1344e1eaa3ff1;
    return var_b65f27b4ba84b114;
}

// Namespace namespace_fad6b63f0287902 / namespace_16d9c1530a364ee9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bc
// Size: 0xa6
function trigger_stealth_shadow(trigger) {
    trigger endon("death");
    var_aa4265eeb046cbbf = "stealth_in_shadow";
    if (!isdefined(level.trigger_stealth_shadow)) {
        level.trigger_stealth_shadow = [];
    }
    level.trigger_stealth_shadow[level.trigger_stealth_shadow.size] = trigger;
    function_b0d778fb201fea8d(trigger);
    while (true) {
        other = trigger waittill("trigger");
        if (trigger function_5b4909bf3b589e4f(other)) {
            continue;
        }
        if (!other ent_flag_exist(var_aa4265eeb046cbbf)) {
            continue;
        }
        if (other ent_flag(var_aa4265eeb046cbbf)) {
            continue;
        }
        other thread in_shadow_thread(trigger, var_aa4265eeb046cbbf);
    }
}

// Namespace namespace_fad6b63f0287902 / namespace_16d9c1530a364ee9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x46a
// Size: 0x43
function in_shadow_thread(volume, var_aa4265eeb046cbbf) {
    self endon("death");
    scripts\stealth\player::function_e403865f115834a8(var_aa4265eeb046cbbf);
    while (isdefined(volume) && self istouching(volume)) {
        wait 0.05;
    }
    scripts\stealth\player::function_3718fc282393305(var_aa4265eeb046cbbf);
}

// Namespace namespace_fad6b63f0287902 / namespace_16d9c1530a364ee9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b5
// Size: 0x4f
function get_trigger_flag() {
    if (isdefined(self.script_flag)) {
        return self.script_flag;
    }
    if (isdefined(self.script_noteworthy)) {
        return self.script_noteworthy;
    }
    assertex(0, "Flag trigger at " + self.origin + " has no script_flag set.");
}

// Namespace namespace_fad6b63f0287902 / namespace_16d9c1530a364ee9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x50c
// Size: 0x118
function trigger_flag_set_touching(trigger) {
    flag = trigger get_trigger_flag();
    if (!isdefined(level.flag[flag])) {
        flag_init(flag);
    }
    var_b56bdde7369c625b = default_to(trigger.var_8b723ed1346786b3, 0.25);
    if (!isnumber(var_b56bdde7369c625b)) {
        var_b56bdde7369c625b = 0.25;
    }
    for (;;) {
        other = trigger waittill("trigger");
        if (trigger function_5b4909bf3b589e4f(other)) {
            continue;
        }
        if (trigger.classname == "trigger_multiple_fx_fxzone") {
            if (isdefined(other.connect_time) && gettime() - other.connect_time <= 50) {
                wait 2;
            }
        }
        trigger script_delay();
        if (isalive(other) && isdefined(trigger) && other istouching(trigger)) {
            flag_set(flag);
        }
        while (isalive(other) && isdefined(trigger) && other istouching(trigger)) {
            wait var_b56bdde7369c625b;
        }
        flag_clear(flag);
    }
}

// Namespace namespace_fad6b63f0287902 / namespace_16d9c1530a364ee9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x62c
// Size: 0xa0
function function_5b4909bf3b589e4f(other) {
    if (!isai(other)) {
        return false;
    }
    if (!isdefined(other.team)) {
        return false;
    }
    if (!(self.spawnflags & 1) && other.team == "axis") {
        return true;
    }
    if (!(self.spawnflags & 2) && other.team == "allies") {
        return true;
    }
    if (!(self.spawnflags & 4) && other.team == "neutral") {
        return true;
    }
    return false;
}

// Namespace namespace_fad6b63f0287902 / namespace_16d9c1530a364ee9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d5
// Size: 0x71
function trigger_flag_set(trigger) {
    flag = trigger get_trigger_flag();
    if (!isdefined(level.flag[flag])) {
        flag_init(flag);
    }
    for (;;) {
        other = trigger waittill("trigger");
        if (trigger function_5b4909bf3b589e4f(other)) {
            continue;
        }
        trigger script_delay();
        flag_set(flag, other);
        if (!isdefined(trigger)) {
            break;
        }
    }
}

// Namespace namespace_fad6b63f0287902 / namespace_16d9c1530a364ee9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x74e
// Size: 0x68
function trigger_flag_clear(trigger) {
    flag = trigger get_trigger_flag();
    if (!isdefined(level.flag[flag])) {
        flag_init(flag);
    }
    for (;;) {
        other = trigger waittill("trigger");
        if (trigger function_5b4909bf3b589e4f(other)) {
            continue;
        }
        trigger script_delay();
        flag_clear(flag);
    }
}

// Namespace namespace_fad6b63f0287902 / namespace_16d9c1530a364ee9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7be
// Size: 0x92
function function_1dd1344e1eaa3ff1(trigger) {
    var_edf806839bfa5a05 = trigger.var_85080a73a3121271;
    assertex(isdefined(var_edf806839bfa5a05), "trigger_multiple_set_minimap_floor has no floor number.");
    for (;;) {
        player = trigger waittill("trigger");
        if (!isdefined(player)) {
            continue;
        }
        if (!isplayer(player)) {
            continue;
        }
        if (!isdefined(player.var_7f574731fa72c7af) || player.var_7f574731fa72c7af != var_edf806839bfa5a05) {
            player scripts\cp\cp_compass::function_fb7bad834ce4b28c(var_edf806839bfa5a05);
            player.var_7f574731fa72c7af = var_edf806839bfa5a05;
        }
    }
}

// Namespace namespace_fad6b63f0287902 / namespace_16d9c1530a364ee9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x858
// Size: 0x5c
function trigger_wait(var_44541668ee276747, var_f70f72e84b51467b) {
    var_af79548fb29ebc00 = getent(var_44541668ee276747, var_f70f72e84b51467b);
    if (!isdefined(var_af79548fb29ebc00)) {
        assertmsg("trigger not found: " + var_44541668ee276747 + " key: " + var_f70f72e84b51467b);
        return;
    }
    var_4cd25328422b94ae = var_af79548fb29ebc00 waittill("trigger");
    level notify(var_44541668ee276747, var_4cd25328422b94ae);
    return var_4cd25328422b94ae;
}

// Namespace namespace_fad6b63f0287902 / namespace_16d9c1530a364ee9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8bd
// Size: 0x17
function trigger_wait_targetname(var_44541668ee276747) {
    return trigger_wait(var_44541668ee276747, "targetname");
}
