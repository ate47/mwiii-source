#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\gestures.gsc;
#using script_519bed5012f1c015;
#using scripts\cp\utility\lui_game_event_aggregator.gsc;
#using scripts\common\notetrack.gsc;

#namespace namespace_e90fa63cb71e2639;

// Namespace namespace_e90fa63cb71e2639 / scripts\cp\gestures_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x155
// Size: 0x15
function init_cp() {
    scripts\cp\utility\lui_game_event_aggregator::registeronluieventcallback(&watchradialgestureactivation);
    scripts\common\notetrack::function_11f8c6d6f5ba948();
}

// Namespace namespace_e90fa63cb71e2639 / scripts\cp\gestures_cp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x172
// Size: 0xad
function player_gesture_force(var_b03cfac5ee568943, lookatent) {
    self endon("death");
    var_447611fd38474e73 = 0;
    blendtime = undefined;
    var_689635fc115b1160 = 0;
    if (get_player_demeanor() == "safe") {
        blendtime = 0.2;
        var_689635fc115b1160 = 1;
    }
    if (isdefined(lookatent) && isent(lookatent)) {
        var_447611fd38474e73 = self forceplaygestureviewmodel(var_b03cfac5ee568943, lookatent, blendtime, undefined, undefined);
    } else {
        var_447611fd38474e73 = self forceplaygestureviewmodel(var_b03cfac5ee568943, undefined, blendtime, undefined, undefined);
    }
    if (var_447611fd38474e73) {
        thread player_gestures_input_disable(var_b03cfac5ee568943, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, undefined, "gesture");
    }
    return var_447611fd38474e73;
}

// Namespace namespace_e90fa63cb71e2639 / scripts\cp\gestures_cp
// Params 14, eflags: 0x0
// Checksum 0x0, Offset: 0x228
// Size: 0x587
function player_gestures_input_disable(var_b03cfac5ee568943, var_6c960bc6468bb7e4, mantle, sprint, fire, reload, weaponswitch, ads, wallrun, doublejump, meleeattack, var_8dad292b46b837c8, disabletime, tag) {
    self endon("death");
    if (!isdefined(tag)) {
        tag = "gesture";
    }
    if (!isdefined(self.gestures)) {
        self.gestures = spawnstruct();
    }
    if (isdefined(var_6c960bc6468bb7e4) && var_6c960bc6468bb7e4 == 1) {
        if (self getstance() == "prone") {
            val::set(tag + "_prone", "allow_movement", 0);
            thread player_gestures_prone_getup_think(var_b03cfac5ee568943, tag);
            if (!isdefined(self.gestures.restrictingpronespeed)) {
                self.gestures.restrictingpronespeed = 0;
            }
            self.gestures.restrictingpronespeed++;
        } else {
            if (!isdefined(self.gestures.restrictingpronestance)) {
                self.gestures.restrictingpronestance = 0;
            }
            self.gestures.restrictingpronestance++;
            val::set(tag, "prone", 0);
        }
        self.gestures.restrictingpronemovement = 1;
    }
    if (isdefined(mantle) && mantle == 1) {
        if (!isdefined(self.gestures.restrictingmantle)) {
            self.gestures.restrictingmantle = 0;
        }
        self.gestures.restrictingmantle++;
        val::set(tag, "mantle", 0);
    }
    if (isdefined(sprint) && sprint == 1) {
        if (!isdefined(self.gestures.restrictingsprint)) {
            self.gestures.restrictingsprint = 0;
        }
        self.gestures.restrictingsprint++;
        val::set(tag, "sprint", 0);
    }
    if (isdefined(fire) && fire == 1) {
        if (!isdefined(self.gestures.restrictingfire)) {
            self.gestures.restrictingfire = 0;
        }
        self.gestures.restrictingfire++;
        val::set(tag, "fire", 0);
    }
    if (isdefined(reload) && reload == 1) {
        if (!isdefined(self.gestures.restrictingreload)) {
            self.gestures.restrictingreload = 0;
        }
        self.gestures.restrictingreload++;
        val::set(tag, "reload", 0);
    }
    if (isdefined(weaponswitch) && weaponswitch == 1) {
        if (!isdefined(self.gestures.restrictingweaponswitch)) {
            self.gestures.restrictingweaponswitch = 0;
        }
        self.gestures.restrictingweaponswitch++;
        val::set(tag, "weapon_switch", 0);
    }
    if (isdefined(ads) && ads == 1) {
        if (!isdefined(self.gestures.restrictingads)) {
            self.gestures.restrictingads = 0;
        }
        self.gestures.restrictingads++;
        val::set(tag, "ads", 0);
    }
    if (isdefined(wallrun) && wallrun == 1) {
        if (!isdefined(self.gestures.restrictingwallrun)) {
            self.gestures.restrictingwallrun = 0;
        }
        self.gestures.restrictingwallrun++;
        val::set(tag, "wallrun", 0);
    }
    if (isdefined(doublejump) && doublejump == 1) {
        if (!isdefined(self.gestures.restrictingdoublejump)) {
            self.gestures.restrictingdoublejump = 0;
        }
        self.gestures.restrictingdoublejump++;
        val::set(tag, "doublejump", 0);
    }
    if (isdefined(meleeattack) && meleeattack == 1) {
        if (!isdefined(self.gestures.restrictingmeleeattack)) {
            self.gestures.restrictingmeleeattack = 0;
        }
        self.gestures.restrictingmeleeattack++;
        val::set(tag, "melee", 0);
    }
    if (isdefined(var_8dad292b46b837c8) && var_8dad292b46b837c8 == 1) {
        if (!isdefined(self.gestures.restrictingoffhandweapons)) {
            self.gestures.restrictingoffhandweapons = 0;
        }
        self.gestures.restrictingoffhandweapons++;
        val::set(tag, "offhand_weapons", 0);
    }
    if (isdefined(disabletime)) {
        wait disabletime;
    } else {
        self waittill("gesture_stopped", var_8f353b054812a006);
        if (var_8f353b054812a006 != var_b03cfac5ee568943) {
            while (true) {
                if (!self isgestureplaying(var_b03cfac5ee568943)) {
                    break;
                }
                wait 0.05;
            }
        }
    }
    self notify(var_b03cfac5ee568943 + "gesture_stopped_internal");
    player_gestures_input_enable(var_6c960bc6468bb7e4, mantle, sprint, fire, reload, weaponswitch, ads, wallrun, doublejump, meleeattack, var_8dad292b46b837c8, tag);
}

// Namespace namespace_e90fa63cb71e2639 / scripts\cp\gestures_cp
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0x7b7
// Size: 0x231
function player_gestures_input_enable(var_6c960bc6468bb7e4, mantle, sprint, fire, reload, weaponswitch, ads, wallrun, doublejump, meleeattack, var_8dad292b46b837c8, tag) {
    if (!isdefined(self.gestures)) {
        self.gestures = spawnstruct();
    }
    if (isdefined(var_6c960bc6468bb7e4) && var_6c960bc6468bb7e4 > 0) {
        if (isdefined(self.gestures.restrictingpronespeed) && self.gestures.restrictingpronespeed > 0) {
            self.gestures.restrictingpronespeed--;
            if (self.gestures.restrictingpronespeed <= 0) {
                val::set(tag + "_prone", "allow_movement", 1);
            }
        }
        if (isdefined(self.gestures.restrictingpronestance) && self.gestures.restrictingpronestance > 0) {
            self.gestures.restrictingpronestance--;
            val::reset_all(tag);
        }
    }
    if (isdefined(mantle) && mantle == 1) {
        val::reset_all(tag);
    }
    if (isdefined(sprint) && sprint == 1) {
        val::reset_all(tag);
    }
    if (isdefined(fire) && fire == 1) {
        val::reset_all(tag);
    }
    if (isdefined(reload) && reload == 1) {
        val::reset_all(tag);
    }
    if (isdefined(weaponswitch) && weaponswitch == 1) {
        val::reset_all(tag);
    }
    if (isdefined(ads) && ads == 1) {
        val::reset_all(tag);
    }
    if (isdefined(wallrun) && wallrun == 1) {
        val::set(tag, "wallrun", 0);
    }
    if (isdefined(doublejump) && doublejump == 1) {
        val::set(tag, "doublejump", 0);
    }
    if (isdefined(meleeattack) && meleeattack == 1) {
        val::reset_all(tag);
    }
    if (isdefined(var_8dad292b46b837c8) && var_8dad292b46b837c8 == 1) {
        val::reset_all(tag);
    }
}

// Namespace namespace_e90fa63cb71e2639 / scripts\cp\gestures_cp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9f0
// Size: 0xdf
function player_gestures_prone_getup_think(var_b03cfac5ee568943, tag) {
    self endon("death");
    self endon(var_b03cfac5ee568943 + "gesture_stopped_internal");
    var_90d39fd3f5a9895d = 1;
    while (var_90d39fd3f5a9895d) {
        if (self getstance() != "prone") {
            waittillframeend();
            self.gestures.restrictingpronespeed--;
            if (self.gestures.restrictingpronespeed <= 0) {
                val::set(tag + "_prone", "allow_movement", 1);
            }
            if (!isdefined(self.gestures.restrictingpronestance)) {
                self.gestures.restrictingpronestance = 0;
            }
            self.gestures.restrictingpronestance++;
            val::set(tag, "prone", 0);
            var_90d39fd3f5a9895d = 0;
        }
        wait 0.05;
    }
}

// Namespace namespace_e90fa63cb71e2639 / scripts\cp\gestures_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xad7
// Size: 0x8
function get_player_demeanor() {
    return self getdemeanorviewmodel();
}
