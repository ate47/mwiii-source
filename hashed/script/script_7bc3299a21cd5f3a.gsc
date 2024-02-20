// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_639bf783929acf9b;
#using script_38eb8f4be20d54f4;
#using script_398835140857d740;
#using scripts\mp\utility\dvars.gsc;

#namespace perk_death_perception;

// Namespace perk_death_perception/namespace_41c66c2a436d7e54
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160
// Size: 0x47
function function_3898a008fcd449e9(var_1df6de077e30f8c2, var_fe59c44529c721a0) {
    n_perk_cost = function_53c4c53197386572(var_fe59c44529c721a0, 2000);
    level thread function_f3a23df892bf82f6("specialty_death_perception", var_1df6de077e30f8c2, n_perk_cost, &function_b082d082ea19d61e, &function_548af41a7d702704, 1, 1);
}

// Namespace perk_death_perception/namespace_41c66c2a436d7e54
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae
// Size: 0x13
function function_b082d082ea19d61e() {
    self notify("end_death_perception");
    thread function_a3cd1789cdd98eb4();
}

// Namespace perk_death_perception/namespace_41c66c2a436d7e54
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8
// Size: 0x23b
function function_a3cd1789cdd98eb4() {
    level endon("game_ended");
    self endon("death");
    self endon("end_death_perception");
    var_6cc0e51421b0dfe6 = [];
    bundle = level.var_a1ad2758fcbd2f5e["specialty_death_perception"];
    radius = function_53c4c53197386572(bundle.var_9b6739d84c393132, 600);
    while (1) {
        var_209a236c75708db0 = getaiarrayinradius(self.origin, radius);
        foreach (ai in var_6cc0e51421b0dfe6) {
            if (!isdefined(ai) || array_contains(var_209a236c75708db0, ai)) {
                continue;
            }
            ai hudoutlinedisableforclient(self);
            var_6cc0e51421b0dfe6 = array_remove(var_6cc0e51421b0dfe6, ai);
        }
        var_6cc0e51421b0dfe6 = array_removeundefined(var_6cc0e51421b0dfe6);
        foreach (ai in var_209a236c75708db0) {
            if (ai.team == self.team || ai.team == "neutral") {
                ai hudoutlinedisableforclient(self);
                if (array_contains(var_6cc0e51421b0dfe6, ai)) {
                    var_6cc0e51421b0dfe6 = array_remove(var_6cc0e51421b0dfe6, ai);
                }
            } else if (ai ent_flag("spawn_animating") || self getclientomnvar("ui_hide_hud") == 1) {
                ai hudoutlinedisableforclient(self);
                if (array_contains(var_6cc0e51421b0dfe6, ai)) {
                    var_6cc0e51421b0dfe6 = array_remove(var_6cc0e51421b0dfe6, ai);
                }
            } else if (isdefined(ai) && !istrue(ai.var_54b7951c49363c15) && !array_contains(var_6cc0e51421b0dfe6, ai)) {
                var_9c1ef68ddf941661 = "jup_death_perception";
                if (isdefined(level.gametype) && level.gametype == "zm_rb") {
                    var_9c1ef68ddf941661 = "death_perception";
                }
                ai hudoutlineenableforclients([0:self], var_9c1ef68ddf941661);
                var_6cc0e51421b0dfe6 = array_add(var_6cc0e51421b0dfe6, ai);
            }
        }
        waitframe();
    }
}

// Namespace perk_death_perception/namespace_41c66c2a436d7e54
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40a
// Size: 0x176
function function_236b011a322933f() {
    level endon("game_ended");
    self endon("death");
    self endon("end_death_perception");
    var_592695d36ff6a0f9 = [];
    bundle = level.var_a1ad2758fcbd2f5e["specialty_death_perception"];
    radius = function_53c4c53197386572(bundle.var_9b6739d84c393132, 600);
    while (1) {
        var_f0c7f034eb6bac63 = getentarrayinradius(undefined, undefined, self.origin, radius);
        foreach (item in var_592695d36ff6a0f9) {
            if (!item function_86eebb20520a5e5d()) {
                continue;
            }
            if (array_contains(var_f0c7f034eb6bac63, item)) {
                continue;
            }
            item hudoutlinedisableforclient(self);
            var_592695d36ff6a0f9 = array_remove(var_592695d36ff6a0f9, item);
        }
        var_592695d36ff6a0f9 = array_removeundefined(var_592695d36ff6a0f9);
        foreach (item in var_f0c7f034eb6bac63) {
            if (!item function_86eebb20520a5e5d()) {
                continue;
            }
            if (array_contains(var_592695d36ff6a0f9, item)) {
                continue;
            }
            item hudoutlineenableforclients([0:self], "outline_nodepth_white");
            var_592695d36ff6a0f9 = array_add(var_592695d36ff6a0f9, item);
        }
        waitframe();
    }
}

// Namespace perk_death_perception/namespace_41c66c2a436d7e54
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x587
// Size: 0x15
function function_86eebb20520a5e5d() {
    return isdefined(self) && istrue(ent_flag("perk_death_perception_fx"));
}

// Namespace perk_death_perception/namespace_41c66c2a436d7e54
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a4
// Size: 0x159
function function_548af41a7d702704(b_pause, str_perk, str_result, n_slot) {
    self notify("end_death_perception");
    bundle = level.var_a1ad2758fcbd2f5e["specialty_death_perception"];
    radius = function_53c4c53197386572(bundle.var_9b6739d84c393132, 600);
    radius = radius * 1.5;
    var_209a236c75708db0 = getaiarrayinradius(self.origin, radius);
    foreach (ai in var_209a236c75708db0) {
        if (!isdefined(ai)) {
            continue;
        }
        ai hudoutlinedisableforclient(self);
    }
    var_f0c7f034eb6bac63 = getentarrayinradius(undefined, undefined, self.origin, radius);
    foreach (item in var_f0c7f034eb6bac63) {
        if (!item function_86eebb20520a5e5d()) {
            continue;
        }
        item hudoutlinedisableforclient(self);
    }
}
