#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_7b2517368c79e5bc;
#using scripts\engine\throttle.gsc;

#namespace ammopouch;

// Namespace ammopouch / namespace_f32fa72985e538cf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b3
// Size: 0x2cc
function function_ef91a8aa458ff9fd() {
    if (isdefined(level.var_51a717822d1c33ec)) {
        return;
    }
    ammopouchbundle = getscriptbundle("ammopouch:ob_ammopouch");
    if (!isdefined(ammopouchbundle)) {
        ammopouchbundle = spawnstruct();
    }
    if (!isdefined(ammopouchbundle.var_3b760769fcea9a1b)) {
        ammopouchbundle.var_3b760769fcea9a1b = 0;
    }
    if (!isdefined(ammopouchbundle.var_5b58d174043df880)) {
        ammopouchbundle.var_5b58d174043df880 = 0;
    }
    if (!isdefined(ammopouchbundle.var_35145aba819a27cf)) {
        ammopouchbundle.var_35145aba819a27cf = 0;
    }
    if (!isdefined(ammopouchbundle.var_9524b7441fcd67dd)) {
        ammopouchbundle.var_9524b7441fcd67dd = 0;
    }
    if (!isdefined(ammopouchbundle.despawntime)) {
        ammopouchbundle.despawntime = 0;
    }
    if (!isdefined(ammopouchbundle.var_7810776678df93b)) {
        ammopouchbundle.var_7810776678df93b = 0;
    }
    if (!isdefined(ammopouchbundle.var_8b2952cde702ebf0)) {
        ammopouchbundle.var_8b2952cde702ebf0 = 0;
    }
    level callback::add("on_zombie_ai_killed", &on_zombie_ai_killed);
    level callback::add("on_ai_killed", &function_1ebeccaabab5d730);
    level.var_51a717822d1c33ec = spawnstruct();
    level.var_51a717822d1c33ec.ammopouchitem = ammopouchbundle.ammopouchitem;
    level.var_51a717822d1c33ec.var_3b760769fcea9a1b = ammopouchbundle.var_3b760769fcea9a1b;
    level.var_51a717822d1c33ec.var_5b58d174043df880 = ammopouchbundle.var_5b58d174043df880;
    level.var_51a717822d1c33ec.var_35145aba819a27cf = ammopouchbundle.var_35145aba819a27cf;
    level.var_51a717822d1c33ec.var_9524b7441fcd67dd = ammopouchbundle.var_9524b7441fcd67dd;
    level.var_51a717822d1c33ec.despawntime = ammopouchbundle.despawntime;
    level.var_51a717822d1c33ec.var_7810776678df93b = ammopouchbundle.var_7810776678df93b;
    level.var_51a717822d1c33ec.var_8b2952cde702ebf0 = ammopouchbundle.var_8b2952cde702ebf0;
    level.var_51a717822d1c33ec.var_355ac76ecfc273ca = ammopouchbundle.var_355ac76ecfc273ca;
    level.var_51a717822d1c33ec.var_d670718214e1bf33 = ammopouchbundle.var_d670718214e1bf33;
    level.var_51a717822d1c33ec.lootid = function_6d15e119c2779a93(getscriptbundle("itemspawnentry:ob_jup_item_ammo"));
    level.var_1a5ebdebba7cebb7 = throttle_initialize("ammopouch_drop", 1, level.framedurationseconds);
    utility::registersharedfunc("ammo_item", "can_refill_ammo", &can_refill_ammo);
    utility::registersharedfunc("ammo_item", "refill_ammo", &refill_ammo);
}

// Namespace ammopouch / namespace_f32fa72985e538cf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x487
// Size: 0x1d
function function_3af8e1abc2693305() {
    function_900f562c61c6a5d6("ammo", &refill_ammo, &can_refill_ammo, &can_refill_ammo);
}

// Namespace ammopouch / namespace_f32fa72985e538cf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ac
// Size: 0x49
function on_zombie_ai_killed(sparams) {
    if (isplayer(sparams.eattacker) && !istrue(self.var_7e4b076a06c6df27)) {
        function_da6722b81ec7cdc4(sparams.smeansofdeath, sparams.eattacker);
    }
}

// Namespace ammopouch / namespace_f32fa72985e538cf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fd
// Size: 0x4d
function function_1ebeccaabab5d730(sparams) {
    if (isplayer(sparams.eattacker)) {
        if (self.unittype == "soldier") {
            function_da6722b81ec7cdc4(sparams.smeansofdeath, sparams.eattacker);
        }
    }
}

// Namespace ammopouch / namespace_f32fa72985e538cf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x552
// Size: 0x271
function function_da6722b81ec7cdc4(smeansofdeath, eattacker) {
    if (istrue(self.var_7e4b076a06c6df27) || istrue(self.var_a9cfabe3e558f7fa) || !getdvarint(@"hash_ab61a3c338b17bdf", 1)) {
        return;
    }
    if (!isdefined(level.var_51a717822d1c33ec.ammopouchitem)) {
        return;
    }
    unittype = self.unittype;
    origin = self.origin;
    angles = self.angles;
    drop_event = spawnstruct();
    function_f632348cbb773537(level.var_1a5ebdebba7cebb7, drop_event);
    percentchancedrop = 0;
    if (isdefined(smeansofdeath) && smeansofdeath == "MOD_EXECUTION") {
        if (unittype == "soldier") {
            percentchancedrop = level.var_51a717822d1c33ec.var_d670718214e1bf33;
        } else {
            percentchancedrop = level.var_51a717822d1c33ec.var_9524b7441fcd67dd;
        }
    } else if (unittype == "soldier") {
        percentchancedrop = level.var_51a717822d1c33ec.var_355ac76ecfc273ca;
    } else {
        percentchancedrop = level.var_51a717822d1c33ec.var_3b760769fcea9a1b;
        if (isfunction(level.var_8241e0d86017df29)) {
            regiondifficulty = [[ level.var_8241e0d86017df29 ]](origin);
            if (regiondifficulty == "difficulty_normal") {
                percentchancedrop = level.var_51a717822d1c33ec.var_5b58d174043df880;
            } else if (regiondifficulty == "difficulty_hard" || regiondifficulty == "difficulty_darkaether") {
                percentchancedrop = level.var_51a717822d1c33ec.var_35145aba819a27cf;
            }
        }
    }
    if (getdvarint(@"hash_c07d7234e05a5d98", 0)) {
        percentchancedrop = 100;
    }
    if (percent_chance(percentchancedrop)) {
        itembundle = getscriptbundle("itemspawnentry:" + level.var_51a717822d1c33ec.ammopouchitem);
        item = function_c465d27f3f6066b4(itembundle, origin, angles);
        params = {#itemname:level.var_51a717822d1c33ec.ammopouchitem, #itembundle:itembundle, #item:item, #eattacker:eattacker};
        callback::callback("on_ammo_pouch_drop", params);
    }
}

// Namespace ammopouch / namespace_f32fa72985e538cf
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cb
// Size: 0xbe
function can_refill_ammo(item_def, item, auto_pickup, var_d3c1dfe8dea4ec26) {
    if (!isplayer(self)) {
        return false;
    }
    var_12a372e8caa042bb = self getweaponslist("primary");
    foreach (var_1fec144a6ac99a70 in var_12a372e8caa042bb) {
        if (istrue(var_1fec144a6ac99a70.ismelee)) {
            continue;
        }
        if (istrue(iskillstreakweapon(var_1fec144a6ac99a70))) {
            continue;
        }
        if (self getweaponammostock(var_1fec144a6ac99a70) < weaponmaxammo(var_1fec144a6ac99a70)) {
            return true;
        }
    }
    return false;
}

// Namespace ammopouch / namespace_f32fa72985e538cf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x892
// Size: 0x16b
function refill_ammo(item_def, item) {
    if (!isplayer(self)) {
        return true;
    }
    var_12a372e8caa042bb = self getweaponslist("primary");
    foreach (var_1fec144a6ac99a70 in var_12a372e8caa042bb) {
        if (istrue(var_1fec144a6ac99a70.ismelee)) {
            continue;
        }
        if (istrue(iskillstreakweapon(var_1fec144a6ac99a70))) {
            continue;
        }
        maxstockammo = weaponmaxammo(var_1fec144a6ac99a70);
        currentstockammo = self getweaponammostock(var_1fec144a6ac99a70);
        normalpercent = level.var_51a717822d1c33ec.var_7810776678df93b / 100;
        wonderpercent = level.var_51a717822d1c33ec.var_8b2952cde702ebf0 / 100;
        var_4b69c8548dff97d6 = namespace_e0ee43ef2dddadaa::iswonderweapon(var_1fec144a6ac99a70);
        var_9c197a81c3a2c5c0 = 0;
        if (var_4b69c8548dff97d6) {
            var_9c197a81c3a2c5c0 = maxstockammo * wonderpercent;
        } else {
            var_9c197a81c3a2c5c0 = maxstockammo * normalpercent;
        }
        var_9c197a81c3a2c5c0 = max(var_9c197a81c3a2c5c0, 1);
        totalammo = currentstockammo + var_9c197a81c3a2c5c0;
        totalammo = clamp(totalammo, 0, maxstockammo);
        totalammo = int(totalammo);
        self setweaponammostock(var_1fec144a6ac99a70, totalammo);
    }
    return false;
}
