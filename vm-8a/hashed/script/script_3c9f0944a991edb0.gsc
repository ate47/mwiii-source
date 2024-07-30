#using scripts\engine\utility.gsc;
#using script_4b87f2871b6b025c;
#using script_1b4114093cd44368;

#namespace oxygenmask_mp;

// Namespace oxygenmask_mp / namespace_1919d42246c620fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193
// Size: 0x73
function init() {
    scripts\engine\utility::registersharedfunc("oxygenmask", "onUnusable", &function_afb7a317198d0688);
    scripts\engine\utility::registersharedfunc("oxygenmask", "onEquip", &function_5320a46c0e139cb5);
    scripts\engine\utility::registersharedfunc("oxygenmask", "onUse", &function_c6f7c3926e6e4522);
    scripts\engine\utility::registersharedfunc("oxygenmask", "onUseComplete", &function_cad73059babfbe29);
    level.var_f6bad8618358a031.holdweaponname = "iw9_oxygenmask_mp";
}

// Namespace oxygenmask_mp / namespace_1919d42246c620fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e
// Size: 0x7a
function function_afb7a317198d0688() {
    self endon("death_or_disconnect");
    msg = undefined;
    if (istrue(self function_635e39fc16a64657())) {
        msg = "MP/DISABLED_WHILE_SWIM_SPRINT";
    } else if (!istrue(self isswimunderwater())) {
        msg = "MP/DISABLED_WHILE_NOT_SWIMMING";
    }
    if (isdefined(msg) && function_a387d51c1bace19(msg)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]](msg);
            function_c3adccf5abf65331(msg);
        }
    }
}

// Namespace oxygenmask_mp / namespace_1919d42246c620fa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x290
// Size: 0x43
function function_c3adccf5abf65331(errorref) {
    superinfo = self.super;
    if (!isdefined(superinfo)) {
        return;
    }
    superinfo.omstarttime = gettime();
    superinfo.var_65f670fb7cc70326 = errorref;
}

// Namespace oxygenmask_mp / namespace_1919d42246c620fa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2db
// Size: 0x83
function function_a387d51c1bace19(var_b5bf99952e022dbe) {
    superinfo = self.super;
    if (!isdefined(superinfo)) {
        return 0;
    }
    if (isdefined(superinfo.var_65f670fb7cc70326) && superinfo.var_65f670fb7cc70326 == var_b5bf99952e022dbe) {
        if (!isdefined(superinfo.omstarttime)) {
            return 1;
        } else if (gettime() > superinfo.omstarttime + 1500) {
            return 1;
        } else {
            return 0;
        }
        return;
    }
    return 1;
}

// Namespace oxygenmask_mp / namespace_1919d42246c620fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x366
// Size: 0xa
function function_5320a46c0e139cb5() {
    childthread function_824af6d3bd562a89();
}

// Namespace oxygenmask_mp / namespace_1919d42246c620fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378
// Size: 0x84
function function_824af6d3bd562a89() {
    while (true) {
        self waittill("weapon_fired");
        currentweapon = self getcurrentweapon();
        if (isdefined(currentweapon.basename) && currentweapon.basename != level.var_f6bad8618358a031.holdweaponname) {
            return;
        }
        stockammo = self getweaponammostock(currentweapon);
        if (stockammo > 0) {
            self setweaponammoclip(currentweapon, 1);
            self setweaponammostock(currentweapon, stockammo - 1);
        }
    }
}

// Namespace oxygenmask_mp / namespace_1919d42246c620fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x404
// Size: 0x3a
function function_c6f7c3926e6e4522() {
    namespace_8ade6bdb04213c12::function_9368fff2b3156346(1);
    thread function_58611da8ae346833();
    thread function_5a7760580acb149c("death");
    thread function_5a7760580acb149c("weapon_change");
    thread function_5a7760580acb149c("offhand_pullback");
}

// Namespace oxygenmask_mp / namespace_1919d42246c620fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x446
// Size: 0x2e
function function_58611da8ae346833() {
    self endon("disconnect");
    level endon("game_ended");
    self endon("weapon_fired");
    self waittill("oxygenmask_fail");
    namespace_86d0d418da518a0e::function_9ac10cec8e7b9d40();
    namespace_8ade6bdb04213c12::function_9368fff2b3156346(0);
}

// Namespace oxygenmask_mp / namespace_1919d42246c620fa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47c
// Size: 0x33
function function_5a7760580acb149c(failnotify) {
    self endon("disconnect");
    self endon("oxygenmask_fired");
    self endon("oxygenmask_fail");
    level endon("game_ended");
    self waittill(failnotify);
    self notify("oxygenmask_fail");
}

// Namespace oxygenmask_mp / namespace_1919d42246c620fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b7
// Size: 0xa
function function_cad73059babfbe29() {
    namespace_8ade6bdb04213c12::function_9368fff2b3156346(0);
}

