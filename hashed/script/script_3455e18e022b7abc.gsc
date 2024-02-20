// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_6df6604a74a7a9c7;
#using script_67055b3ff4918256;

#namespace namespace_9499d190be9a2ad3;

// Namespace namespace_9499d190be9a2ad3/namespace_26e60c953dc40f2c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x113
// Size: 0x7a
function init(door, index) {
    index = function_53c4c53197386572(index, 0);
    self.door = door;
    self.door namespace_b1453e6e8267c3ce::function_2cade2c182251141(self);
    if (isdefined(self.target)) {
        var_eef112353143e04a = getstruct(self.target, "targetname");
        var_eef112353143e04a init(self.door, index + 1);
    }
}

// Namespace namespace_9499d190be9a2ad3/namespace_26e60c953dc40f2c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x194
// Size: 0x2c
function function_e8fc44296f4c9482(var_a264a70d347ae9f6, index) {
    if (var_a264a70d347ae9f6) {
        thread function_937bd9da8994dd32(index);
    } else {
        thread function_509c42b9b664ad51();
    }
}

// Namespace namespace_9499d190be9a2ad3/namespace_26e60c953dc40f2c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c7
// Size: 0x10a
function function_937bd9da8994dd32(index) {
    var_cf8d34375a2ddb0a = function_6ab8997a6d33d00d(index);
    self.plate = spawn_model(function_c3e078f287496cf7(index), self.origin, self.angles + var_cf8d34375a2ddb0a);
    self.plate.index = index;
    forward = anglestoup(self.angles) * -1;
    self.scriptable = spawnscriptable("ob_combo_lock_entry", self.origin + forward * 1, self.plate.angles * -1);
    self.scriptable.var_600daf0fc22de176 = self;
    self.scriptable.door = self.door;
    self.plate.scriptable = self.scriptable;
    self.spawned = 1;
}

// Namespace namespace_9499d190be9a2ad3/namespace_26e60c953dc40f2c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d8
// Size: 0x8f
function function_f4e1863c3c57bcb(var_fa6377eb24ac48ef) {
    if (!isdefined(self.scriptable)) {
        return;
    }
    if (!istrue(var_fa6377eb24ac48ef)) {
        current_state = self.scriptable getscriptablepartstate("vfx", 0);
        if (current_state != "unlinked") {
            self.scriptable setscriptablepartstate("model", current_state);
        }
        self.scriptable setscriptablepartstate("vfx", "unlinked");
        self.scriptable setscriptablepartstate("health", "damageable");
    }
}

// Namespace namespace_9499d190be9a2ad3/namespace_26e60c953dc40f2c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36e
// Size: 0x45
function function_68950e640608ce20(var_dd4005eb0f452104) {
    if (var_dd4005eb0f452104) {
        self.scriptable setscriptablepartstate("health", "inactive");
    } else {
        self.scriptable setscriptablepartstate("health", "damageable");
    }
}

// Namespace namespace_9499d190be9a2ad3/namespace_26e60c953dc40f2c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ba
// Size: 0x8e
function function_509c42b9b664ad51() {
    if (!isdefined(self.scriptable)) {
        return;
    }
    self.scriptable setscriptablepartstate("model", "inactive");
    self.scriptable setscriptablepartstate("vfx", "unlinked");
    self.scriptable setscriptablepartstate("health", "inactive");
    self.scriptable freescriptable();
    self.plate setscriptablepartstate("model", "inactive");
    self.spawned = 0;
}

// Namespace namespace_9499d190be9a2ad3/namespace_26e60c953dc40f2c
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44f
// Size: 0xd8
function function_cdbec4722f88f614(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, var_8bf74071a142b64c, modelindex, partname) {
    if (!isdefined(instance) || instance.type != "ob_combo_lock_entry") {
        return;
    }
    if (einflictor.classname == "rocket" || einflictor.classname == "grenade") {
        if (distance(var_8bf74071a142b64c, einflictor.origin) > 2) {
            instance setscriptablepartstate("health", "damageable");
            return;
        }
    }
    instance thread function_d94f8bea6e21780d(instance);
}

// Namespace namespace_9499d190be9a2ad3/namespace_26e60c953dc40f2c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52e
// Size: 0x37
function function_d94f8bea6e21780d(instance) {
    state = instance getscriptablepartstate("model", 0);
    instance.door namespace_b1453e6e8267c3ce::function_3edb9b978dca8642(instance, state);
}

// Namespace namespace_9499d190be9a2ad3/namespace_26e60c953dc40f2c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56c
// Size: 0xae
function function_25da66b947454d11(instance, note, param, var_535d9c3fdddab5a9) {
    if (isdefined(instance)) {
        instance.entity.scriptable setscriptablepartstate("model", string(instance.entity.index));
        instance.entity.scriptable setscriptablepartstate("vfx", "unlinked");
        instance.entity.scriptable setscriptablepartstate("health", "damageable");
    }
}

// Namespace namespace_9499d190be9a2ad3/namespace_26e60c953dc40f2c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x621
// Size: 0x37
function function_d44e5d38e3b8fb2c(instance, note, param, var_535d9c3fdddab5a9) {
    thread function_8e0504fb64822985(instance.entity);
}

// Namespace namespace_9499d190be9a2ad3/namespace_26e60c953dc40f2c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65f
// Size: 0x14
function function_8e0504fb64822985(ent) {
    waitframe();
    ent delete();
}

// Namespace namespace_9499d190be9a2ad3/namespace_26e60c953dc40f2c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67a
// Size: 0x5d
function function_c3e078f287496cf7(index) {
    switch (index) {
    case 1:
    case 2:
    case 6:
    case 7:
        return "ee_rune_flagstone_02_scr";
    default:
        return "ee_rune_flagstone_scr";
        break;
    }
}

// Namespace namespace_9499d190be9a2ad3/namespace_26e60c953dc40f2c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6de
// Size: 0x19
function function_6ab8997a6d33d00d(index) {
    return (0, 0, 0);
}
