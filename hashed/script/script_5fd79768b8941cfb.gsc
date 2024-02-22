// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using script_67cc94c07ab18d3a;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_collision.gsc;
#using scripts\engine\math.gsc;

#namespace namespace_eef7baa06e67a550;

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x166
// Size: 0x12f
function function_b585808f22e26aa6(var_9b9f1075db564acd, var_cb1cd0599c50f0e9) {
    var_d6c04a6d8c7b7693 = [];
    foreach (loot in var_9b9f1075db564acd.var_a679c918818fa808) {
        type = loot.targetname;
        switch (type) {
        case #"hash_735d8d8888878a53":
            scriptable = function_863b4187f0955e66(loot);
            break;
        case #"hash_48c2dbc1e832de89":
            scriptable = function_5efffd6ea06bab7b(loot);
            break;
        case #"hash_417c605750c7baa5":
            if (isdefined(var_9b9f1075db564acd.var_fd5b04de8603c8a6)) {
                scriptable = [[ var_9b9f1075db564acd.var_fd5b04de8603c8a6 ]](var_9b9f1075db564acd, loot, type);
            } else {
                scriptable = function_e3f46ad7bac518e8(loot, type);
            }
            break;
        default:
            scriptable = undefined;
            break;
        }
        if (isdefined(scriptable)) {
            var_d6c04a6d8c7b7693[var_d6c04a6d8c7b7693.size] = scriptable;
        }
    }
    thread function_b6875112271fac46(var_9b9f1075db564acd, var_d6c04a6d8c7b7693, var_cb1cd0599c50f0e9);
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c
// Size: 0x30
function function_863b4187f0955e66(loot) {
    scriptable = namespace_a4b43c1cf86c6fe5::function_7cb54f604c35be8c(loot);
    scriptable setscriptablepartstate("br_plunder_box", "hidden");
    return scriptable;
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d4
// Size: 0x53
function function_5efffd6ea06bab7b(loot) {
    if (namespace_dbfbff3eb10fab94::function_19598c1ea1487b84()) {
        scriptable = spawnscriptable("br_workbench", loot.origin, loot.angles);
        scriptable setscriptablepartstate("br_workbench", "visible");
        return scriptable;
    }
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e
// Size: 0x45
function function_e3f46ad7bac518e8(loot, type) {
    scriptable = spawnscriptable(type, loot.origin, loot.angles);
    thread function_7a553db47dd1d2b5(scriptable);
    return scriptable;
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37b
// Size: 0x7d
function function_7a553db47dd1d2b5(var_cb2499e4e9d175a2) {
    level waittill("prematch_fade_done");
    if (var_cb2499e4e9d175a2 getscriptablehaspart("body") && var_cb2499e4e9d175a2 getscriptableparthasstate("body", "closed_usable_no_collision")) {
        var_cb2499e4e9d175a2 setscriptablepartstate("body", "closed_usable_no_collision");
    } else if (var_cb2499e4e9d175a2 getscriptablehaspart("body") && var_cb2499e4e9d175a2 getscriptableparthasstate("body", "closed_usable")) {
        var_cb2499e4e9d175a2 setscriptablepartstate("body", "closed_usable");
    }
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ff
// Size: 0x93
function function_b6875112271fac46(var_9b9f1075db564acd, var_d6c04a6d8c7b7693, var_cb1cd0599c50f0e9) {
    level waittill("prematch_fade_done");
    foreach (scriptable in var_d6c04a6d8c7b7693) {
        offset = function_9d12545308a35fd2(scriptable, var_9b9f1075db564acd);
        scriptable thread function_c8f65416ce71277a(var_cb1cd0599c50f0e9, offset, scriptable.angles);
    }
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x499
// Size: 0x37
function function_9d12545308a35fd2(loot, var_9b9f1075db564acd) {
    var_c35e1c74aefb4992 = loot.origin - var_9b9f1075db564acd.var_ff2a1edcd931ba3;
    return var_c35e1c74aefb4992;
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d8
// Size: 0x38
function function_c8f65416ce71277a(scriptmodel, offset, angles) {
    level endon("game_ended");
    waitframe();
    utility::function_6e506f39f121ea8a(scriptmodel, offset, angles);
    self.parent = scriptmodel;
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x517
// Size: 0xa1
function function_702ee23aca4d2485(var_b2a3f9abcee9d071, var_e26f44acad48ddd1, var_fe1033cae51778cc, var_b3e01b11d76e1db6, time) {
    acceleration = ter_op(var_b3e01b11d76e1db6 >= var_fe1033cae51778cc, 1, -1);
    minvalue = ter_op(acceleration >= 0, var_fe1033cae51778cc, var_b3e01b11d76e1db6);
    maxvalue = ter_op(acceleration >= 0, var_b3e01b11d76e1db6, var_fe1033cae51778cc);
    var_60278bcb8ac1212b = (maxvalue - minvalue) / time;
    while (var_fe1033cae51778cc != var_b3e01b11d76e1db6) {
        var_fe1033cae51778cc = function_dbf72252b51c25af(var_b2a3f9abcee9d071, var_e26f44acad48ddd1, acceleration, var_60278bcb8ac1212b, var_fe1033cae51778cc, var_b3e01b11d76e1db6);
        waitframe();
    }
    return var_fe1033cae51778cc;
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c0
// Size: 0x27
function function_bc6bbd377f04b278(var_fe1033cae51778cc, var_b3e01b11d76e1db6, time) {
    return 0.5 * (var_fe1033cae51778cc + var_b3e01b11d76e1db6) * time;
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ef
// Size: 0x83
function function_dbf72252b51c25af(var_b2a3f9abcee9d071, var_e26f44acad48ddd1, acceleration, var_60278bcb8ac1212b, var_fe1033cae51778cc, var_b3e01b11d76e1db6) {
    var_58beabc1e8b6397f = var_fe1033cae51778cc + acceleration * level.framedurationseconds * var_60278bcb8ac1212b;
    if (acceleration == 1 && var_58beabc1e8b6397f >= var_b3e01b11d76e1db6 || acceleration == -1 && var_58beabc1e8b6397f <= var_b3e01b11d76e1db6) {
        var_58beabc1e8b6397f = var_b3e01b11d76e1db6;
    }
    if (var_58beabc1e8b6397f != var_fe1033cae51778cc) {
        var_fe1033cae51778cc = var_58beabc1e8b6397f;
        function_ee6ac63a2f326fe8(var_b2a3f9abcee9d071, var_e26f44acad48ddd1, var_fe1033cae51778cc);
    }
    return var_fe1033cae51778cc;
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67a
// Size: 0x45
function function_ee6ac63a2f326fe8(var_b2a3f9abcee9d071, var_e26f44acad48ddd1, var_58beabc1e8b6397f) {
    var_b2a3f9abcee9d071 setanimrate(var_e26f44acad48ddd1, var_58beabc1e8b6397f);
    if (isdefined(var_b2a3f9abcee9d071.var_f5ab71e8bf7a604b)) {
        [[ var_b2a3f9abcee9d071.var_f5ab71e8bf7a604b ]](var_b2a3f9abcee9d071, var_e26f44acad48ddd1, var_58beabc1e8b6397f);
    }
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6c6
// Size: 0x3a
function function_ffd9b2fe58c97f7c(var_776bae99312943ae, var_e26f44acad48ddd1) {
    var_dfb7ff3bef234b0e = var_776bae99312943ae getanimtime(var_e26f44acad48ddd1);
    var_cdd725f8f73b94 = getanimlength(var_e26f44acad48ddd1) * var_dfb7ff3bef234b0e;
    return var_cdd725f8f73b94;
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x708
// Size: 0x69
function function_e549e7bb5a16c3bc() {
    level endon("game_ended");
    self endon("death");
    self.velocity = (0, 0, 0);
    while (1) {
        self.lastorigin = self.origin;
        wait(0.05);
        self.velocity = (self.origin - self.lastorigin) / 0.05;
    }
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x778
// Size: 0x34c
function function_84114acff04cfccb(var_c975fcdffce9c9a6, var_c975fbdffce9c773, vehicleref, var_57e49972a041777e, var_c4e36a338fa34f19) {
    if (var_c975fcdffce9c9a6 namespace_1f188a13f7e79610::function_d93ec4635290febd() == vehicleref) {
        var_a2731e6d9af15254 = var_c975fcdffce9c9a6;
        vehicle = var_c975fbdffce9c773;
    } else {
        var_a2731e6d9af15254 = var_c975fbdffce9c773;
        vehicle = var_c975fcdffce9c9a6;
    }
    if (namespace_f3f7309ba50e9927::function_d88aed99025a81e4(vehicle, var_a2731e6d9af15254)) {
        return;
    }
    if (!isdefined(vehicle) || !isdefined(vehicle.health)) {
        return;
    }
    var_dc494b3df72d32cf = undefined;
    var_b671dda1c1164ec4 = vehicle vehicle_getvelocity();
    if (isdefined(var_a2731e6d9af15254.velocity)) {
        var_dc494b3df72d32cf = var_a2731e6d9af15254.velocity;
    } else if (isdefined(var_a2731e6d9af15254 getlinkedchildren())) {
        velocity = undefined;
        children = var_a2731e6d9af15254 getlinkedchildren();
        foreach (child in children) {
            if (isdefined(child.velocity)) {
                var_dc494b3df72d32cf = child.velocity;
                break;
            }
        }
    }
    var_4277b8e82ed3e5c = 1;
    var_e560b75818b74794 = 1;
    var_818ac4c7f82e5ca5 = 1;
    var_6d4fc1af18b13a8b = 1;
    var_baf692851ee3418d = 20;
    var_e0c9cbab4ab671f3 = 0.5;
    var_d768b2ab879aaf25 = 30;
    var_45dfde7180341dd5 = length(var_b671dda1c1164ec4);
    var_4277b8e82ed3e5c = namespace_d3f3cb0a543667c1::remap(var_45dfde7180341dd5, 0, 600, var_6d4fc1af18b13a8b, var_baf692851ee3418d);
    var_4ef87be7f0367144 = namespace_d3f3cb0a543667c1::anglebetweenvectorsunit(vectornormalize(var_b671dda1c1164ec4), vectornormalize(var_dc494b3df72d32cf));
    var_e560b75818b74794 = namespace_d3f3cb0a543667c1::remap(var_4ef87be7f0367144, 0, 180, var_e0c9cbab4ab671f3, var_d768b2ab879aaf25);
    if (getdvarfloat(@"hash_c243128198440f06", -1) != -1) {
        var_818ac4c7f82e5ca5 = getdvarfloat(@"hash_c243128198440f06", -1);
    }
    health = vehicle.health;
    mindamage = health / 10;
    damage = mindamage * var_e560b75818b74794 * var_4277b8e82ed3e5c * var_818ac4c7f82e5ca5;
    isvehicledestroyed = damage >= health;
    if (isvehicledestroyed) {
        vehicle.var_a8f4bb03b366aa80 = 1;
    }
    vehicle dodamage(damage, var_a2731e6d9af15254.origin, var_a2731e6d9af15254, var_a2731e6d9af15254, "MOD_CRUSH");
    if (vehicle vehicle_isphysveh()) {
        var_b16f8aad32bd1e89 = ter_op(isdefined(var_c4e36a338fa34f19), var_c4e36a338fa34f19, 250);
        vehicle function_e0201404a8b6f664(vehicle.origin - var_a2731e6d9af15254.origin + (0, 0, 200), var_b16f8aad32bd1e89, 1);
    }
    if (vehicle.health < health) {
        level thread namespace_f3f7309ba50e9927::vehicle_collision_ignorefutureevent(vehicle, var_a2731e6d9af15254, var_57e49972a041777e);
    }
    var_3cbf5ec3e372f1f2 = spawnstruct();
    var_3cbf5ec3e372f1f2.var_a2731e6d9af15254 = var_a2731e6d9af15254;
    var_3cbf5ec3e372f1f2.vehicle = vehicle;
    var_3cbf5ec3e372f1f2.isvehicledestroyed = isvehicledestroyed;
    return var_3cbf5ec3e372f1f2;
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacc
// Size: 0x6a
function function_80c06497397ed757(scriptable, model_name) {
    collider = spawn("script_model", scriptable.origin);
    collider setmodel(model_name);
    collider markkeyframedmover();
    collider forcenetfieldhighlod(1);
    collider setmoveroptimized(1);
    collider setmoverantilagged(1);
    level thread function_17565402222f8072(scriptable, collider);
    return collider;
}

// Namespace namespace_eef7baa06e67a550/namespace_67eb9cdced4f7767
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb3e
// Size: 0x77
function private function_17565402222f8072(scriptable, collider) {
    level endon("game_ended");
    collider endon("death");
    while (!isdefined(scriptable.var_bf8e5f003146af44)) {
        wait(1);
    }
    collider.origin = scriptable.origin;
    collider.angles = scriptable.angles;
    collider linkto(scriptable.var_bf8e5f003146af44);
}

