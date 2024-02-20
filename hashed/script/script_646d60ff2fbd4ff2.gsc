// mwiii decomp prototype
#using script_784aa75d4a32fa24;
#using scripts\cp_mp\utility\weapon_utility.gsc;

#namespace namespace_43fa28e17601014d;

// Namespace namespace_43fa28e17601014d/namespace_fd5db9939c683aa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x171
// Size: 0xd6
function function_6aa2e7131056a6a2(pos) {
    chopper = namespace_8c3daeeca6bd42c0::function_4c4df9aeb773709a(pos, "veh9_mil_air_heli_medium", "veh9_mil_air_heli_medium_weapons", level.var_d44040648e9624f, "dmz_patrol_heli");
    chopper.var_59bcc0ee54cdb593 = &function_2da0e1059066956f;
    chopper.funcs["strafe"] = &function_f1400b978167ad73;
    chopper.missileweapon = makeweapon("chopper_gunner_proj_dmz");
    var_50b058536fb23943 = chopper function_5ba2582ce376900c("tag_rocket_right");
    var_50b056536fb234dd = chopper function_5ba2582ce376900c("tag_rocket_left");
    chopper.turrets = [0:var_50b058536fb23943, 1:var_50b056536fb234dd];
    chopper.var_c8cc9e14cbc6c616 = 5;
    chopper.var_abeda157c03de022 = 40;
    return chopper;
}

// Namespace namespace_43fa28e17601014d/namespace_fd5db9939c683aa4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24f
// Size: 0xe3
function function_5ba2582ce376900c(tag) {
    turret = spawnturret("misc_turret", self gettagorigin(tag), "chopper_support_turret_mp");
    turret setmodel("veh9_mil_air_heli_hind_turret_mp");
    turret.owner = self.owner;
    turret.team = self.team;
    turret.angles = self.angles + (90, 0, 0);
    turret.originalangles = turret.angles;
    turret.disabled = 0;
    turret.targetstate = undefined;
    turret linkto(self, tag);
    turret setturretteam(self.team);
    turret setturretmodechangewait(0);
    turret setmode("manual");
    return turret;
}

// Namespace namespace_43fa28e17601014d/namespace_fd5db9939c683aa4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33a
// Size: 0xaa
function function_2da0e1059066956f(target) {
    self endon("death");
    self endon("crashing");
    self endon("state_change");
    var_40130bd790669c04 = target.origin;
    while (1) {
        self setlookatent(target);
        if (!namespace_8c3daeeca6bd42c0::function_9f656e924a854c1b(target, 5000, 8, randomint(360), 1000)) {
            namespace_8c3daeeca6bd42c0::function_3be784d69cc30a0(target, -500);
            namespace_8c3daeeca6bd42c0::function_7743aeff79a08975("idle");
        }
        if (distance2dsquared(var_40130bd790669c04, target.origin) > 100000000) {
            namespace_8c3daeeca6bd42c0::function_3be784d69cc30a0(target, -800);
            namespace_8c3daeeca6bd42c0::function_7743aeff79a08975("idle");
            return;
        }
    }
}

// Namespace namespace_43fa28e17601014d/namespace_fd5db9939c683aa4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3eb
// Size: 0x9a
function function_f1400b978167ad73(target) {
    wait(1);
    for (i = 0; i < self.var_abeda157c03de022; i++) {
        self.turrets[i % 2].angles = self.turrets[i % 2].originalangles + (randomint(10) - 5, randomint(10) - 5, randomint(10) - 5);
        self.turrets[i % 2] shootturret();
        wait(0.02);
    }
}

// Namespace namespace_43fa28e17601014d/namespace_fd5db9939c683aa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x48c
// Size: 0xcb
function function_eb5fec1420a757c2(target) {
    var_46da84e8ced274e2 = [0:"tag_rocket_right", 1:"tag_rocket_left"];
    wait(1);
    for (i = 0; i < self.var_c8cc9e14cbc6c616; i++) {
        var_429aae2e6e20f85 = self gettagorigin(var_46da84e8ced274e2[i % 2]) + anglestoforward(self.angles) * 200;
        var_85fa3cdcb19d2a9c = self gettagorigin(var_46da84e8ced274e2[i % 2]) + anglestoforward(self.angles) * 1000;
        missile = namespace_d325722f2754c2c4::_magicbullet(self.missileweapon, var_429aae2e6e20f85, var_85fa3cdcb19d2a9c, self.owner);
        wait(0.3);
    }
}
