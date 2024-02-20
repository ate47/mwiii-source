// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\equipment.gsc;
#using script_5762ac2f22202ba2;

#namespace combataxe;

// Namespace combataxe/namespace_d8f7634b48937d6d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x177
// Size: 0x35
function function_d80165ad0154bb7e() {
    level.var_fb9ddef539dd3c58 = getdvarint(@"hash_a8688fbb87e97cc", 12);
    level.var_d276caa6c4731f4e = getdvarfloat(@"hash_12dae8a7bec5e630", 64);
}

// Namespace combataxe/namespace_d8f7634b48937d6d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b3
// Size: 0xd2
function function_81863480a8885799(grenade) {
    grenade endon("death");
    grenade makeunusable();
    stuckto = undefined;
    var_16a48d7056e5c472 = undefined;
    grenade_owner_name = self.name;
    grenade setscriptablepartstate("onThrow", "active", 0);
    grenade.owner = self;
    grenade thread function_b0e8a6840abe65ac();
    var_16a48d7056e5c472 = stuckto = grenade waittill("missile_stuck");
    level notify("grenade_exploded_during_stealth", grenade);
    grenade setscriptablepartstate("onThrow", "neutral", 0);
    grenade.headiconid = grenade namespace_7bdde15c3500a23f::setheadicon_singleimage(grenade.owner, "hud_icon_head_equipment_friendly", 2, 0, undefined, undefined, 0.1, 1);
    grenade function_7ca5b6259bcf48d2();
}

// Namespace combataxe/namespace_d8f7634b48937d6d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c
// Size: 0x10b
function function_7ca5b6259bcf48d2() {
    self makeunusable();
    trigger = spawn("trigger_radius", self.origin, 0, 80, 80);
    trigger.targetname = "dropped_combataxe";
    trigger enablelinkto();
    trigger linkto(self);
    self.var_a2f22ee61ebcd790 = trigger;
    if (!isdefined(level.var_9bc1f08544b3e758)) {
        level.var_9bc1f08544b3e758 = [];
    }
    var_5c397c9cf7a06802 = [0:self];
    foreach (combataxe in level.var_9bc1f08544b3e758) {
        if (isdefined(combataxe)) {
            if (var_5c397c9cf7a06802.size >= level.var_fb9ddef539dd3c58) {
                combataxe function_5514249d93b6d0b7();
            } else {
                var_5c397c9cf7a06802[var_5c397c9cf7a06802.size] = combataxe;
            }
        }
    }
    level.var_9bc1f08544b3e758 = var_5c397c9cf7a06802;
    thread function_e7c69cc4e25fc10f();
    thread function_deaa9c45d71fdf62();
}

// Namespace combataxe/namespace_d8f7634b48937d6d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39e
// Size: 0x21
function function_b0e8a6840abe65ac() {
    self endon("death");
    self.owner waittill("death");
    function_5514249d93b6d0b7();
}

// Namespace combataxe/namespace_d8f7634b48937d6d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c6
// Size: 0x99
function function_e7c69cc4e25fc10f() {
    self endon("death");
    while (1) {
        player = self.var_a2f22ee61ebcd790 waittill("trigger");
        if (!isplayer(player)) {
            continue;
        }
        if (!player _isalive()) {
            continue;
        }
        if (player != self.owner) {
            continue;
        }
        if (!player hasweapon(self.weapon_object)) {
            continue;
        }
        if (player function_337769e008716a08(self.equipmentref)) {
            self setscriptablepartstate("onPickup", "active", 0);
            thread function_5514249d93b6d0b7();
        }
    }
}

// Namespace combataxe/namespace_d8f7634b48937d6d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x466
// Size: 0x1c
function function_deaa9c45d71fdf62() {
    self endon("death");
    wait(level.var_d276caa6c4731f4e);
    thread function_5514249d93b6d0b7();
}

// Namespace combataxe/namespace_d8f7634b48937d6d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x489
// Size: 0x36
function function_5514249d93b6d0b7() {
    if (isdefined(self.var_a2f22ee61ebcd790)) {
        self.var_a2f22ee61ebcd790 delete();
    }
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    self delete();
}

// Namespace combataxe/namespace_d8f7634b48937d6d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c6
// Size: 0x3d
function function_337769e008716a08(equipmentref) {
    if (namespace_1a507865f681850e::hasequipment(equipmentref) && namespace_1a507865f681850e::getequipmentammo(equipmentref) < namespace_1a507865f681850e::getequipmentmaxammo(equipmentref)) {
        thread function_b24a7386b5a50e07();
        namespace_1a507865f681850e::incrementequipmentammo(equipmentref);
        return 1;
    }
    return 0;
}

// Namespace combataxe/namespace_d8f7634b48937d6d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50b
// Size: 0x28
function function_b24a7386b5a50e07() {
    self endon("disconnect");
    namespace_e072c8407b2a861c::hudicontype("combataxe");
    waitframe();
    self setclientomnvar("damage_feedback_other", "standard");
}

