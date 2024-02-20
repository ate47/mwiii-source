// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_2669878cf5a1b6bc;
#using script_7ef95bba57dc4b82;

#namespace hb_sensor;

// Namespace hb_sensor/namespace_8a392daf295e43f8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac
// Size: 0x14f
function hb_sensor_used(grenade) {
    if (isdefined(self.equipment["secondary"]) && self.equipment["secondary"] != "equip_hb_sensor") {
        return;
    }
    flag_init("equipment_interact");
    self.var_d07d8acb673cb5c7 = undefined;
    if (isdefined(self.var_7653bd4be7dd5fdb)) {
        self.var_7653bd4be7dd5fdb = self.var_7653bd4be7dd5fdb - 0.1;
        if (self.var_7653bd4be7dd5fdb <= 0) {
            self.var_7653bd4be7dd5fdb = 0;
        }
        if (utility::iscp()) {
            var_721eb48c0deeb426 = getdvarint(@"hash_952c250389735fd7", 1200);
        } else if (function_91481b77c4164a5b("specialty_extra_tactical")) {
            var_721eb48c0deeb426 = getdvarint(@"hash_952c250389735fd7", 60);
        } else {
            var_721eb48c0deeb426 = getdvarint(@"hash_3d0928eec520c586", 60);
        }
        var_41286ce8e01ff0ff = int(ceil((var_721eb48c0deeb426 - self.var_7653bd4be7dd5fdb) * 100 / var_721eb48c0deeb426));
        self setclientomnvar("ui_hb_sensor_battery_percentage", var_41286ce8e01ff0ff);
    }
    waitframe();
    self function_3ac2d6250a4c3f42(0);
    if (isdefined(grenade)) {
        grenade delete();
    }
    if (istrue(function_91481b77c4164a5b("specialty_recharge_equipment"))) {
        thread function_83ed70de721aee0f();
    }
    self notify("hb_sensor_put_away");
}

// Namespace hb_sensor/namespace_8a392daf295e43f8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x302
// Size: 0x15a
function function_78ce4bfda3e762b3(equipmentref, slot, variantid) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("hb_sensor_take");
    self notify("hb_sensor_end_recharge");
    thread function_323286bf3aa11fbb();
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        self.var_7653bd4be7dd5fdb = 0;
        self.var_3dd6d94c7b926688 = function_db61876aca4e4cd3();
    }
    while (1) {
        objweapon = self waittill("grenade_pullback");
        flag_set("equipment_interact");
        if (!issubstr(objweapon.basename, "hb_sensor")) {
            continue;
        }
        self function_95f24fbb015ee513(0);
        var_41286ce8e01ff0ff = 100;
        if (isdefined(self.var_7653bd4be7dd5fdb)) {
            if (utility::iscp()) {
                var_721eb48c0deeb426 = getdvarint(@"hash_952c250389735fd7", 1200);
            } else if (function_91481b77c4164a5b("specialty_extra_tactical")) {
                var_721eb48c0deeb426 = getdvarint(@"hash_952c250389735fd7", 90);
            } else {
                var_721eb48c0deeb426 = getdvarint(@"hash_3d0928eec520c586", 60);
            }
            var_41286ce8e01ff0ff = int(ceil((var_721eb48c0deeb426 - self.var_7653bd4be7dd5fdb) * 100 / var_721eb48c0deeb426));
        }
        self setclientomnvar("ui_hb_sensor_battery_percentage", var_41286ce8e01ff0ff);
        wait(0.533);
        function_fc7e5d7d7f99703a();
    }
}

// Namespace hb_sensor/namespace_8a392daf295e43f8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x463
// Size: 0x23
function function_7f948b7f43448ea9(equipmentref, slot) {
    self notify("hb_sensor_take");
    function_3f703abc99c1bb80();
}

// Namespace hb_sensor/namespace_8a392daf295e43f8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48d
// Size: 0x20
function function_323286bf3aa11fbb() {
    level endon("game_ended");
    self endon("disconnect");
    self waittill("death");
    function_3f703abc99c1bb80();
}

// Namespace hb_sensor/namespace_8a392daf295e43f8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b4
// Size: 0x8e
function function_db61876aca4e4cd3() {
    if (utility::iscp()) {
        var_721eb48c0deeb426 = getdvarint(@"hash_952c250389735fd7", 1200);
    } else if (function_91481b77c4164a5b("specialty_extra_tactical")) {
        var_721eb48c0deeb426 = getdvarint(@"hash_952c250389735fd7", 90);
    } else {
        var_721eb48c0deeb426 = getdvarint(@"hash_3d0928eec520c586", 60);
    }
    var_1720642308a86fa7 = self.var_7653bd4be7dd5fdb;
    if (!isdefined(var_1720642308a86fa7)) {
        var_1720642308a86fa7 = 0;
    }
    return int(ceil((var_721eb48c0deeb426 - var_1720642308a86fa7) * 100 / var_721eb48c0deeb426));
}

// Namespace hb_sensor/namespace_8a392daf295e43f8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54a
// Size: 0x89
function function_30cd943d877dc29f(quantity) {
    self.var_3dd6d94c7b926688 = quantity;
    if (utility::iscp()) {
        var_721eb48c0deeb426 = getdvarint(@"hash_952c250389735fd7", 1200);
    } else if (function_91481b77c4164a5b("specialty_extra_tactical")) {
        var_721eb48c0deeb426 = getdvarint(@"hash_952c250389735fd7", 90);
    } else {
        var_721eb48c0deeb426 = getdvarint(@"hash_3d0928eec520c586", 60);
    }
    self.var_7653bd4be7dd5fdb = quantity * -1 * var_721eb48c0deeb426 / 100 + var_721eb48c0deeb426;
    return 1;
}

// Namespace hb_sensor/namespace_8a392daf295e43f8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5db
// Size: 0x43
function function_3f703abc99c1bb80() {
    self.var_d07d8acb673cb5c7 = undefined;
    self.var_7653bd4be7dd5fdb = undefined;
    self.var_3dd6d94c7b926688 = undefined;
    flag_clear("equipment_interact");
    self setclientomnvar("ui_hb_sensor_battery_percentage", 100);
    self function_3ac2d6250a4c3f42(0);
}

// Namespace hb_sensor/namespace_8a392daf295e43f8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x625
// Size: 0x140
function function_fc7e5d7d7f99703a() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self.var_d07d8acb673cb5c7 = 1;
    if (!isdefined(self.var_7653bd4be7dd5fdb)) {
        self.var_7653bd4be7dd5fdb = 0;
    }
    counter = 0;
    if (utility::iscp()) {
        var_721eb48c0deeb426 = getdvarint(@"hash_952c250389735fd7", 1200);
    } else if (function_91481b77c4164a5b("specialty_extra_tactical")) {
        var_721eb48c0deeb426 = getdvarint(@"hash_952c250389735fd7", 60);
    } else {
        var_721eb48c0deeb426 = getdvarint(@"hash_3d0928eec520c586", 60);
    }
    var_3c41d0b684e437f5 = var_721eb48c0deeb426 / 100;
    while (istrue(self.var_d07d8acb673cb5c7)) {
        self.var_3dd6d94c7b926688 = function_db61876aca4e4cd3();
        if (self.var_3dd6d94c7b926688 < 0) {
            self.var_3dd6d94c7b926688 = 0;
        }
        self setclientomnvar("ui_hb_sensor_battery_percentage", self.var_3dd6d94c7b926688);
        if (counter >= var_3c41d0b684e437f5) {
            self.var_7653bd4be7dd5fdb = self.var_7653bd4be7dd5fdb + counter;
            counter = 0;
        }
        if (self.var_3dd6d94c7b926688 <= 0) {
            thread function_83ef0926b5392999();
            break;
        }
        counter = counter + 0.05;
        wait(0.05);
    }
}

// Namespace hb_sensor/namespace_8a392daf295e43f8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76c
// Size: 0xaa
function function_83ef0926b5392999() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    flag_clear("equipment_interact");
    var_4b39e4e78b233f51 = namespace_e0ee43ef2dddadaa::getgrenadeinpullback();
    if (isdefined(var_4b39e4e78b233f51)) {
        result = namespace_3c37cb17ade254d::waittill_notify_or_timeout_return("hb_sensor_put_away", 1);
        if (result == "timeout") {
            self function_720152d5d95e2d86();
        }
        if (!istrue(function_91481b77c4164a5b("specialty_recharge_equipment"))) {
            ammo = namespace_4fb9dddfb8c1a67a::getequipmentammo("equip_hb_sensor");
            namespace_4fb9dddfb8c1a67a::setequipmentammo("equip_hb_sensor", ammo - 1);
        }
    }
    if (!istrue(function_91481b77c4164a5b("specialty_recharge_equipment"))) {
        function_3f703abc99c1bb80();
    }
}

// Namespace hb_sensor/namespace_8a392daf295e43f8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81d
// Size: 0x107
function function_83ed70de721aee0f() {
    if (!isdefined(level.var_aebbd8276f721d86)) {
        return;
    }
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("hb_sensor_end_recharge");
    while (!istrue(self.var_d07d8acb673cb5c7) && isdefined(self.var_7653bd4be7dd5fdb)) {
        self.var_7653bd4be7dd5fdb = self.var_7653bd4be7dd5fdb - level.var_aebbd8276f721d86 * level.framedurationseconds;
        if (function_91481b77c4164a5b("specialty_extra_tactical")) {
            var_721eb48c0deeb426 = getdvarint(@"hash_952c250389735fd7", 60);
        } else {
            var_721eb48c0deeb426 = getdvarint(@"hash_3d0928eec520c586", 60);
        }
        var_41286ce8e01ff0ff = int(clamp(ceil((var_721eb48c0deeb426 - self.var_7653bd4be7dd5fdb) * 100 / var_721eb48c0deeb426), 0, 100));
        self setclientomnvar("ui_hb_sensor_battery_percentage", var_41286ce8e01ff0ff);
        if (self.var_7653bd4be7dd5fdb <= 0) {
            self.var_7653bd4be7dd5fdb = 0;
            self notify("hb_sensor_end_recharge");
            break;
        }
        waitframe();
    }
}

// Namespace hb_sensor/namespace_8a392daf295e43f8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92b
// Size: 0x44
function function_8803b12c07518865() {
    if (!isdefined(self.var_7653bd4be7dd5fdb) || self.var_7653bd4be7dd5fdb <= 0) {
        return 0;
    }
    self setclientomnvar("ui_hb_sensor_battery_percentage", 100);
    self.var_7653bd4be7dd5fdb = 0;
    self notify("hb_sensor_end_recharge");
    return 1;
}

// Namespace hb_sensor/namespace_8a392daf295e43f8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x977
// Size: 0x20
function function_e27c4d2340d9d56b() {
    if (!istrue(self.var_d07d8acb673cb5c7)) {
        self notify("hb_sensor_end_recharge");
        thread function_83ed70de721aee0f();
    }
}

// Namespace hb_sensor/namespace_8a392daf295e43f8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99e
// Size: 0x35
function function_91481b77c4164a5b(perk) {
    if (issharedfuncdefined("perk", "hasPerk")) {
        return self [[ getsharedfunc("perk", "hasPerk") ]](perk);
    }
    return undefined;
}

// Namespace hb_sensor/namespace_8a392daf295e43f8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9db
// Size: 0x1d
function function_3efd622905908041(ref, var_3dbc3b058135cbfb) {
    function_30cd943d877dc29f(100);
}
