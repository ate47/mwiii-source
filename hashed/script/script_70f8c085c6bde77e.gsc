// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;

#namespace namespace_aedee6a379ec09b9;

// Namespace namespace_aedee6a379ec09b9/namespace_b08dd2d4e74abdfa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115
// Size: 0x16
function function_c238e4c6605e99f8() {
    /#
        setdevdvarifuninitialized(@"hash_ed5df81b887a95e2", 0);
    #/
}

// Namespace namespace_aedee6a379ec09b9/namespace_b08dd2d4e74abdfa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132
// Size: 0x21
function function_210b4d286feae145() {
    self endon("disconnect");
    level endon("game_ended");
    self waittill("br_spawned");
    thread function_82e6f3bac838a703();
}

// Namespace namespace_aedee6a379ec09b9/namespace_b08dd2d4e74abdfa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a
// Size: 0x1ac
function function_82e6f3bac838a703() {
    self endon("disconnect");
    level endon("game_ended");
    if (!isbot(self) && !isagent(self)) {
        self notifyonplayercommand("tac_map_toggle", "togglemap");
        self notifyonplayercommand("menu_escape", "pause");
    }
    var_9af1c847b28ae3f8 = 0;
    var_24d3ca04553de080 = makeweapon("tac_map_toggle_mp");
    while (1) {
        result = waittill_any_return_4("tac_map_toggle", "death", "last_stand_start", "menu_escape");
        var_f0dd765393870b60 = getdvarint(@"hash_ed5df81b887a95e2", 0);
        if (!var_f0dd765393870b60) {
            self setclientomnvar("ui_tac_map_type", 0);
            waitframe();
            continue;
        }
        if (!isreallyalive(self)) {
            continue;
        }
        var_f13a4cdb3e525cc5 = function_70722de16841911();
        var_c8ef56a28771bf53 = 1;
        if (result == "death" || result == "last_stand_start" || (result == "tac_map_toggle" || result == "menu_escape") && istrue(var_9af1c847b28ae3f8)) {
            if (self hasweapon(var_24d3ca04553de080)) {
                self takeweapon(var_24d3ca04553de080);
            }
            if (isdefined(level.thirdpersonmode) && level.thirdpersonmode) {
                self setcamerathirdperson(1);
            }
            var_9af1c847b28ae3f8 = 0;
        } else {
            if (!var_f13a4cdb3e525cc5) {
                var_c8ef56a28771bf53 = 0;
            }
            self setclientomnvar("ui_tac_map_type", var_c8ef56a28771bf53);
            if (var_f13a4cdb3e525cc5 && !self hasweapon(var_24d3ca04553de080)) {
                self giveandfireoffhand(var_24d3ca04553de080);
                if (isdefined(level.thirdpersonmode) && level.thirdpersonmode) {
                    self setcamerathirdperson(0);
                }
            }
            var_9af1c847b28ae3f8 = 1;
        }
    }
}

// Namespace namespace_aedee6a379ec09b9/namespace_b08dd2d4e74abdfa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30d
// Size: 0x4b
function function_39d8f11067a26610() {
    self endon("disconnect");
    level endon("game_ended");
    var_494b59f9f8644a6c = 0;
    while (1) {
        if (self isskydiving()) {
            if (!istrue(var_494b59f9f8644a6c)) {
                self notify("tac_map_toggle");
                var_494b59f9f8644a6c = 1;
            }
        } else if (istrue(var_494b59f9f8644a6c)) {
            var_494b59f9f8644a6c = 0;
        }
        waitframe();
    }
}

// Namespace namespace_aedee6a379ec09b9/namespace_b08dd2d4e74abdfa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35f
// Size: 0x68
function function_70722de16841911() {
    var_e55479ee6970b728 = 1;
    var_f9c35103d1dc33e7 = namespace_1fbd40990ee60ede::vehicle_occupancy_occupantisvehicledriver(self);
    var_494b59f9f8644a6c = self isskydiving();
    var_70e9109ccf3b3bc7 = istrue(self.plotarmor) && isdefined(self.c130);
    if (var_f9c35103d1dc33e7 || var_494b59f9f8644a6c || var_70e9109ccf3b3bc7) {
        var_e55479ee6970b728 = 0;
    }
    return var_e55479ee6970b728;
}
