#using scripts\cp\utility.gsc;
#using script_3a8f9ace195c9da9;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp\gestures_cp.gsc;
#using script_66122a002aff5d57;
#using scripts\cp\cp_hud_message.gsc;
#using script_7ef95bba57dc4b82;
#using script_600b944a95c3a7bf;

#namespace offhand_box;

// Namespace offhand_box / namespace_50ac30ec16b231ac
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48d
// Size: 0x282
function offhand_box_setup() {
    flag_wait("level_ready_for_script");
    level.offhand_boxes = getstructarray("offhand_box", "targetname");
    level.var_d4f94560dc218123 = getstructarray("offhand_bag", "targetname");
    if (!istrue(1)) {
        if (isdefined(level.offhand_boxes)) {
            foreach (offhand_box in level.offhand_boxes) {
                offhand_box delete();
            }
        }
        return;
    }
    foreach (offhand_box in level.offhand_boxes) {
        if (isdefined(offhand_box.angles)) {
            offhand_box.scriptable = spawnscriptable("cp_offhand_box", offhand_box.origin, offhand_box.angles);
        } else {
            offhand_box.scriptable = spawnscriptable("cp_offhand_box", offhand_box.origin);
        }
        offhand_box.scriptable.item_type = offhand_box.script_noteworthy;
    }
    foreach (offhand_bag in level.var_d4f94560dc218123) {
        if (isdefined(offhand_bag.angles)) {
            offhand_bag.scriptable = spawnscriptable("cp_offhand_bag", offhand_bag.origin, offhand_bag.angles);
        } else {
            offhand_bag.scriptable = spawnscriptable("cp_offhand_bag", offhand_bag.origin);
        }
        offhand_bag.scriptable.item_type = offhand_bag.script_noteworthy;
    }
    flag_wait("player_spawned_with_loadout");
    array_thread(level.offhand_boxes, &offhand_box_think, level.player);
    array_thread(level.var_d4f94560dc218123, &offhand_box_think, level.player);
    flag_set("cp_offhand_boxes_spawned");
}

// Namespace offhand_box / namespace_50ac30ec16b231ac
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x717
// Size: 0x15d
function offhand_box_think(player) {
    if (isdefined(self.target)) {
        self.item_pos_array = getstructarray(self.target, "targetname");
    } else {
        self.item_pos_array = [];
    }
    self.item_count = self.item_pos_array.size;
    if (isdefined(self.script_count)) {
        if (self.script_count == -1) {
            self.infinite = 1;
        } else {
            self.item_count = min(self.item_count, self.script_count);
        }
    } else if (isdefined(self.script_count_min) && isdefined(self.script_count_max)) {
        self.item_count = min(self.item_count, randomintrange(self.script_count_min, self.script_count_max));
    }
    if (isfloat(self.item_count)) {
        self.item_count = int(self.item_count);
    }
    self.item_models = [];
    thread update_offhand_box_item_models(player);
    if (!isdefined(self.script_noteworthy)) {
        thread function_863bc5d68813ee8a(player, 360);
        return;
    }
    self.item_type = self.script_noteworthy;
    thread function_250357933f00dc3(player);
}

// Namespace offhand_box / namespace_50ac30ec16b231ac
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x87c
// Size: 0x32c
function private function_250357933f00dc3(player) {
    self endon("death");
    self endon("entitydeleted");
    assert(isdefined(self.item_type));
    self notify("update_models");
    while (true) {
        result = waittill_offhand_box_accessed(player);
        if (isdefined(result)) {
            if (result == "offhand_box_update") {
                foreach (var_81901e47ba7d056c in self.item_models) {
                    var_81901e47ba7d056c delete();
                }
                waitframe();
                self notify("update_models");
                continue;
            }
            if (function_a4482d0d3055db9a()) {
                if (self.item_type == "ammo") {
                    var_57ac4dc40b2e376 = namespace_6250b14b3f614101::giveammo(player);
                    var_d6a57b95fc473441 = var_57ac4dc40b2e376[1];
                    var_bf00bd1d7da56c26 = var_57ac4dc40b2e376[0];
                    var_6e10774fa3fb048e = namespace_6250b14b3f614101::function_a95732425992ae46(player);
                    if ((var_bf00bd1d7da56c26 || var_6e10774fa3fb048e) && !istrue(self.infinite)) {
                        self.item_count = 0;
                        self.scriptable setscriptablepartstate("cp_offhand_box", "visible_no_outline");
                    } else {
                        waitframe();
                        player scripts\cp\cp_hud_message::showerrormessage("MP_INGAME_ONLY/AMMO_RESTOCK_STOCK_FULL");
                        continue;
                    }
                } else if (isgrenade(self.item_type)) {
                    var_ec7d122be30d4834 = refillequipment(player, self.item_type);
                    if (!var_ec7d122be30d4834) {
                        waitframe();
                        player scripts\cp\cp_hud_message::showerrormessage("MP/BR_EQUIP_DENY_NO_ROOM");
                        continue;
                    }
                } else if (self.item_type == "armorplate") {
                    var_ec7d122be30d4834 = refillequipment(player, self.item_type);
                    if (!var_ec7d122be30d4834) {
                        player scripts\cp\cp_hud_message::showerrormessage("MP_INGAME_ONLY/ARMOR_RESTOCK_STOCK_FULL");
                        continue;
                    }
                } else if (issharedfuncdefined("offhandBox", "_onUse", 0)) {
                    player [[ getsharedfunc("offhandBox", "_onUse") ]](self);
                }
                self.interact.cursor_hint_ent delaycall(0.2, &playsound, "loot_pickup_offhand");
            } else {
                waitframe();
            }
            self notify("update_models");
            level notify("offhand_box_used");
            self notify("offhand_box_used");
            player player_gesture_force("iw9_ges_pickup");
            wait 0.3;
            if (self.item_count == 0 && !istrue(self.infinite)) {
                self notify("offhand_box_kill");
                if (isdefined(self.scriptable)) {
                    self.scriptable notify("offhand_box_kill");
                }
                waitframe();
                if (isdefined(self.item_models)) {
                    foreach (var_81901e47ba7d056c in self.item_models) {
                        if (isdefined(var_81901e47ba7d056c)) {
                            var_81901e47ba7d056c delete();
                        }
                    }
                }
                self notify("update_models");
                return;
            }
            wait 1.75;
        } else {
            waitframe();
        }
        self notify("update_models");
    }
}

// Namespace offhand_box / namespace_50ac30ec16b231ac
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xbb0
// Size: 0x216
function private refillequipment(player, equipname) {
    primaryequip = player namespace_4fb9dddfb8c1a67a::getcurrentequipment("primary");
    secondaryequip = player namespace_4fb9dddfb8c1a67a::getcurrentequipment("secondary");
    var_41dee29e66a53e05 = player namespace_4fb9dddfb8c1a67a::getcurrentequipment("health");
    equipname = "equip_" + equipname;
    equiptype = undefined;
    var_25ea1f27ebc304e6 = undefined;
    var_cf0ebcdd1e835602 = 0;
    if (namespace_4fb9dddfb8c1a67a::isequipmentlethal(equipname)) {
        equiptype = "primary";
        var_25ea1f27ebc304e6 = primaryequip;
    } else if (namespace_4fb9dddfb8c1a67a::isequipmenttactical(equipname)) {
        equiptype = "secondary";
        var_25ea1f27ebc304e6 = secondaryequip;
    } else if (equipname == "equip_armorplate") {
        equiptype = "health";
        var_25ea1f27ebc304e6 = var_41dee29e66a53e05;
    }
    if (!isdefined(var_25ea1f27ebc304e6) || player namespace_4fb9dddfb8c1a67a::getequipmentammo(var_25ea1f27ebc304e6) == 0) {
        player namespace_4fb9dddfb8c1a67a::giveequipment(equipname, equiptype);
        player namespace_4fb9dddfb8c1a67a::setequipmentammo(equipname, 0);
        var_cf0ebcdd1e835602 = function_a459d0f605bf523f(player, equipname);
        player function_c33f5b700efef63b(equiptype, equipname);
    } else if (var_25ea1f27ebc304e6 == equipname) {
        var_cf0ebcdd1e835602 = function_a459d0f605bf523f(player, equipname);
    } else if (getdvarint(@"hash_3d3e000ab3fdf69e", 0) == 1) {
        lootid = namespace_38b993c4618e76cd::getlootidfromref(var_25ea1f27ebc304e6);
        player namespace_6250b14b3f614101::function_276e0e89c09af369(equiptype, lootid, player namespace_4fb9dddfb8c1a67a::getequipmentammo(var_25ea1f27ebc304e6));
        player namespace_4fb9dddfb8c1a67a::giveequipment(equipname, equiptype);
        player namespace_4fb9dddfb8c1a67a::setequipmentammo(equipname, 0);
        var_cf0ebcdd1e835602 = function_a459d0f605bf523f(player, equipname);
        player function_c33f5b700efef63b(equiptype, equipname);
    }
    if (level.noinventory) {
        return var_cf0ebcdd1e835602;
    }
    remaining = player namespace_6250b14b3f614101::addItemToBackpackByRef(equipname, "equipment", self.item_count, 1);
    if (self.item_count == remaining) {
        return var_cf0ebcdd1e835602;
    } else {
        self.item_count = remaining;
        if (self.item_count == 0) {
            self.scriptable setscriptablepartstate("cp_offhand_box", "visible_no_outline");
        }
    }
    return 1;
}

// Namespace offhand_box / namespace_50ac30ec16b231ac
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xdce
// Size: 0xc3
function private function_a459d0f605bf523f(player, equipname) {
    var_2fe1b5d970061237 = player namespace_4fb9dddfb8c1a67a::getequipmentammo(equipname);
    var_2f3d47425b9a0f5a = player namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(equipname);
    if (var_2fe1b5d970061237 != var_2f3d47425b9a0f5a) {
        var_5400e215ebf1b67a = 0;
        if (self.item_count + var_2fe1b5d970061237 < var_2f3d47425b9a0f5a) {
            var_5400e215ebf1b67a = self.item_count + var_2fe1b5d970061237;
            self.item_count = 0;
        } else {
            self.item_count -= var_2f3d47425b9a0f5a - var_2fe1b5d970061237;
            var_5400e215ebf1b67a = var_2f3d47425b9a0f5a;
        }
        player namespace_4fb9dddfb8c1a67a::setequipmentammo(equipname, var_5400e215ebf1b67a);
        if (self.item_count == 0) {
            self.scriptable setscriptablepartstate("cp_offhand_box", "visible_no_outline");
        }
        return true;
    }
    return false;
}

// Namespace offhand_box / namespace_50ac30ec16b231ac
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xe9a
// Size: 0x3e
function private isgrenade(typename) {
    if (typename == "frag" || typename == "flash" || typename == "semtex" || typename == "c4") {
        return 1;
    }
    return 0;
}

// Namespace offhand_box / namespace_50ac30ec16b231ac
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xee0
// Size: 0x7b
function private function_863bc5d68813ee8a(player, radius) {
    self endon("death");
    self endon("entitydeleted");
    self endon("offhand_box_kill");
    radiussq = squared(radius);
    while (isdefined(self)) {
        wait randomfloatrange(0.5, 1);
        if (!isdefined(self)) {
            return;
        }
        if (distancesquared(player.origin, self.origin) < radiussq) {
            return "trigger";
        }
    }
}

// Namespace offhand_box / namespace_50ac30ec16b231ac
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf63
// Size: 0x3e
function function_a4482d0d3055db9a() {
    if (self.item_type == "ammo" || isgrenade(self.item_type) || self.item_type == "armorplate") {
        return true;
    }
    return false;
}

// Namespace offhand_box / namespace_50ac30ec16b231ac
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfaa
// Size: 0x2fd
function waittill_offhand_box_accessed(player) {
    result = undefined;
    if (function_a4482d0d3055db9a()) {
        var_3f09b9a4149cc197 = 1;
    } else {
        var_3f09b9a4149cc197 = 0;
        if (issharedfuncdefined("offhandBox", "_allowUse", 0)) {
            var_3f09b9a4149cc197 = player [[ getsharedfunc("offhandBox", "_allowUse") ]](self);
        }
    }
    if (var_3f09b9a4149cc197) {
        var_9c85d90245c105ba = 256;
        if (isdefined(self.radius)) {
            var_9c85d90245c105ba = int(self.radius);
        }
        var_b4f2e5026eb0a11f = get_offhand_item_pickup_hint(player, self.item_type == "ammo" || isgrenade(self.item_type));
        var_828f4d4b39d42b57 = (0, 0, 10);
        if (self.item_type == "ammo") {
            var_828f4d4b39d42b57 = (0, 0, 12);
        }
        if (isdefined(self.model)) {
            if (self.model == "un_military_backpack_open_01") {
                var_828f4d4b39d42b57 = (10, 7, 10);
            } else if (self.model == "un_military_storage_container_small_open_01") {
                var_828f4d4b39d42b57 = (12, 7, 17);
            } else if (self.model == "un_military_storage_container_02_open") {
                var_828f4d4b39d42b57 = (14, 8, 25);
            }
        }
        if (self.item_type == "armorplate") {
            return function_863bc5d68813ee8a(player, 100);
        }
        if (!isdefined(self.interact)) {
            self.interact = spawnstruct();
            self.interact.origin = self.origin;
            self.interact.angles = isdefined(self.angles) ? self.angles : (0, 0, 0);
        }
        if (isdefined(self.interact.cursor_hint_ent)) {
            while (isdefined(self.interact.cursor_hint_ent)) {
                waitframe();
            }
        }
        var_3ddfbf3264817453 = player usinggamepad() && (player getcurrentusereloadconfig() == 0 || player getcurrentusereloadconfig() == 3);
        var_2e3e86610aa87c44 = !player usinggamepad() && istrue(player getuseholdkbmprofile());
        var_ad8472207b13c639 = ter_op(var_3ddfbf3264817453 || var_2e3e86610aa87c44, "duration_short", "duration_none");
        self.interact create_cursor_hint(undefined, var_828f4d4b39d42b57, var_b4f2e5026eb0a11f, 360, var_9c85d90245c105ba, 90, 0, undefined, undefined, self.icon, var_ad8472207b13c639, undefined, undefined, 45);
        result = player waittill_any_ents_return(self.interact, "trigger", self.interact, "offhand_box_update", player);
    }
    level notify("offhand_box_used", self);
    return result;
}

// Namespace offhand_box / namespace_50ac30ec16b231ac
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12b0
// Size: 0x1c8
function update_offhand_box_item_models(player) {
    self endon("death");
    self endon("entitydeleted");
    self endon("offhand_box_kill");
    while (true) {
        self.item_models = array_removeundefined(self.item_models);
        var_dd53030b256aa23b = get_offhand_item_model();
        while (self.item_models.size != self.item_count) {
            if (self.item_count > self.item_models.size && isdefined(var_dd53030b256aa23b)) {
                var_8acc266afda40d29 = get_offhand_box_item_slot_struct();
                scriptable = spawnscriptable(var_dd53030b256aa23b, var_8acc266afda40d29.origin, var_8acc266afda40d29.angles);
                scriptable setscriptablepartstate(var_dd53030b256aa23b, "visible_no_use");
                scriptable disablescriptableplayeruse(player);
                scriptable.var_be6b0f71bd991349 = 1;
                var_8acc266afda40d29.item = scriptable;
                self.item_models[self.item_models.size] = scriptable;
            } else if (isdefined(self.item_models[0])) {
                foreach (var_d7b44cb498fdacdb in self.item_pos_array) {
                    if (isdefined(var_d7b44cb498fdacdb.item) && var_d7b44cb498fdacdb.item == self.item_models[0]) {
                        var_d7b44cb498fdacdb.item = undefined;
                    }
                }
                self.item_models[0] freescriptable();
            }
            self.item_models = array_removeundefined(self.item_models);
        }
        self waittill("update_models");
    }
}

// Namespace offhand_box / namespace_50ac30ec16b231ac
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1480
// Size: 0x63
function get_offhand_box_item_slot_struct() {
    foreach (var_d7b44cb498fdacdb in self.item_pos_array) {
        if (isdefined(var_d7b44cb498fdacdb) && !isdefined(var_d7b44cb498fdacdb.item)) {
            return var_d7b44cb498fdacdb;
        }
    }
    return undefined;
}

// Namespace offhand_box / namespace_50ac30ec16b231ac
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14ec
// Size: 0xff
function get_offhand_item_pickup_hint(player, var_7d101a473fc7e1f4) {
    var_b4f2e5026eb0a11f = %;
    if (self.item_type == "ammo") {
        var_b4f2e5026eb0a11f = %EQUIPMENT_HINTS/OFFHAND_AMMO_BOX_USE;
    } else if (self.item_type == "armorplate") {
        var_b4f2e5026eb0a11f = %EQUIPMENT_HINTS/ARMOR_BOX_USE;
    } else if (isgrenade(self.item_type)) {
        if (self.item_type == "c4") {
            var_b4f2e5026eb0a11f = %EQUIPMENT_HINTS/REFILL_C4;
        } else if (self.item_type == "flash") {
            var_b4f2e5026eb0a11f = %EQUIPMENT_HINTS/REFILL_FLASH;
        } else if (self.item_type == "semtex") {
            var_b4f2e5026eb0a11f = %EQUIPMENT_HINTS/REFILL_SEMTEX;
        } else if (self.item_type == "frag") {
            var_b4f2e5026eb0a11f = %EQUIPMENT_HINTS/REFILL_FRAG;
        }
    }
    self.icon = undefined;
    if (!isdefined(var_7d101a473fc7e1f4)) {
        var_7d101a473fc7e1f4 = 0;
    }
    if (!var_7d101a473fc7e1f4) {
        var_7d101a473fc7e1f4 = player getoffhandprimaryclass() == "none";
    }
    return var_b4f2e5026eb0a11f;
}

// Namespace offhand_box / namespace_50ac30ec16b231ac
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15f4
// Size: 0xaf
function get_offhand_item_model() {
    if (isdefined(self.script_noteworthy)) {
        if (self.script_noteworthy == "ammo") {
            return "brloot_ammo_box_small";
        } else if (self.script_noteworthy == "frag") {
            return "brloot_offhand_frag";
        } else if (self.script_noteworthy == "flash") {
            return "brloot_offhand_flash";
        } else if (self.script_noteworthy == "semtex") {
            return "brloot_offhand_semtex";
        } else if (self.script_noteworthy == "armorplate") {
            return "brloot_armor_plate";
        } else if (self.script_noteworthy == "c4") {
            return "brloot_offhand_c4";
        }
    }
    return undefined;
}
