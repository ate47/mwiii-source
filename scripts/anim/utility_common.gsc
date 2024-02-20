// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_152f3860b54f75e5;

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea
// Size: 0x74
function print3dtime(timer, org, msg, color, alpha, scale) {
    newtime = timer / 0.05;
    for (i = 0; i < newtime; i++) {
        /#
            print3d(org, msg, color, alpha, scale);
        #/
        wait(0.05);
    }
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x265
// Size: 0x91
function print3drise(org, msg, color, alpha, scale) {
    newtime = 100;
    up = 0;
    org = org + randomvector(30);
    for (i = 0; i < newtime; i++) {
        up = up + 0.5;
        /#
            print3d(org + (0, 0, up), msg, color, alpha, scale);
        #/
        wait(0.05);
    }
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2fd
// Size: 0x27
function crossproduct(vec1, vec2) {
    return vec1[0] * vec2[1] - vec1[1] * vec2[0] > 0;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x32c
// Size: 0x2f
function safemod(a, b) {
    result = int(a) % b;
    result = result + b;
    return result % b;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x363
// Size: 0x102
function quadrantanimweights(yaw) {
    forwardweight = cos(yaw);
    leftweight = sin(yaw);
    result["front"] = 0;
    result["right"] = 0;
    result["back"] = 0;
    result["left"] = 0;
    if (isdefined(self.alwaysrunforward)) {
        /#
            assert(self.alwaysrunforward);
        #/
        result["front"] = 1;
        return result;
    }
    if (forwardweight > 0) {
        if (leftweight > forwardweight) {
            result["left"] = 1;
        } else if (leftweight < -1 * forwardweight) {
            result["right"] = 1;
        } else {
            result["front"] = 1;
        }
    } else {
        backweight = -1 * forwardweight;
        if (leftweight > backweight) {
            result["left"] = 1;
        } else if (leftweight < forwardweight) {
            result["right"] = 1;
        } else {
            result["back"] = 1;
        }
    }
    return result;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46d
// Size: 0x61
function getquadrant(angle) {
    angle = angleclamp(angle);
    if (angle < 45 || angle > 315) {
        quadrant = "front";
    } else if (angle < 135) {
        quadrant = "left";
    } else if (angle < 225) {
        quadrant = "back";
    } else {
        quadrant = "right";
    }
    return quadrant;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4d6
// Size: 0x3c
function isinset(input, set) {
    for (i = set.size - 1; i >= 0; i--) {
        if (input == set[i]) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51a
// Size: 0x2a
function weapon_genade_launcher() {
    return !isnullweapon(self.weapon) && weaponclass(self.weapon) == "grenade";
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54c
// Size: 0x3c
function weapon_pump_action_shotgun() {
    return !isnullweapon(self.weapon) && weaponisboltaction(self.weapon) && weaponclass(self.weapon) == "spread";
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x590
// Size: 0x18
function function_ad5cce92f62191eb(weapon) {
    return weaponclass(weapon) == "mg";
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b0
// Size: 0x18
function isshotgun(weapon) {
    return weaponclass(weapon) == "spread";
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d0
// Size: 0x18
function issniperrifle(weapon) {
    return weaponclass(weapon) == "sniper";
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f0
// Size: 0x12
function isshotgunai() {
    return isshotgun(self.primaryweapon);
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60a
// Size: 0x13
function islongrangeai() {
    return self function_e8ca4080d02a0bb4() || usingrocketlauncher();
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x625
// Size: 0x17
function usingpistol() {
    return weaponclass(self.weapon) == "pistol";
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x644
// Size: 0x17
function usingrocketlauncher() {
    return weaponclass(self.weapon) == "rocketlauncher";
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x663
// Size: 0x17
function usingmg() {
    return weaponclass(self.weapon) == "mg";
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x682
// Size: 0x17
function isusingshotgun() {
    return weaponclass(self.weapon) == "spread";
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a1
// Size: 0x65
function usingriflelikeweapon() {
    class = weaponclass(self.weapon);
    switch (class) {
    case #"hash_690c0d6a821b42e":
    case #"hash_6191aaef9f922f96":
    case #"hash_8cdaf2e4ecfe5b51":
    case #"hash_900cb96c552c5e8e":
    case #"hash_fa24dff6bd60a12d":
        return 1;
        break;
    }
    return 0;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x70e
// Size: 0xfa
function repeater_headshot_ammo_passive(objweapon, attacker, victim) {
    if (!isdefined(objweapon) || !isdefined(attacker) || !isdefined(victim)) {
        return;
    }
    if (!isplayer(attacker)) {
        return;
    }
    base_name = objweapon.basename;
    if (!isdefined(base_name) || base_name != "iw7_repeater") {
        return;
    }
    if (!isdefined(victim.damagelocation)) {
        return;
    }
    if (victim.damagelocation != "head" && victim.damagelocation != "helmet") {
        return;
    }
    var_a7be10e54a3a4b99 = weaponclipsize(objweapon);
    var_d7724e7657d45522 = var_a7be10e54a3a4b99 * 1;
    var_3dbc3b058135cbfb = attacker getweaponammoclip(objweapon);
    newammo = min(var_3dbc3b058135cbfb + var_d7724e7657d45522, var_a7be10e54a3a4b99);
    attacker setweaponammoclip(objweapon, int(newammo));
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80f
// Size: 0xbb
function needtoreload(var_2ff260c3c7de486e) {
    if (isnullweapon(self.weapon)) {
        return 0;
    }
    if (istrue(self.disablereload)) {
        if (self.bulletsinclip < weaponclipsize(self.weapon) * 0.5) {
            self.bulletsinclip = int(weaponclipsize(self.weapon) * 0.5);
        }
        if (self.bulletsinclip <= 0) {
            self.bulletsinclip = 0;
        }
        return 0;
    }
    if (self.bulletsinclip <= weaponclipsize(self.weapon) * var_2ff260c3c7de486e) {
        if (var_2ff260c3c7de486e == 0) {
            if (cheatammoifnecessary()) {
                return 0;
            }
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d2
// Size: 0x11e
function cheatammoifnecessary() {
    /#
        assert(!self.bulletsinclip);
    #/
    if (!isdefined(self.enemy)) {
        return 0;
    }
    if (self.team != "allies") {
        if (!isplayer(self.enemy)) {
            return 0;
        }
    }
    if (isusingsidearm() || usingrocketlauncher()) {
        return 0;
    }
    if (gettime() - self.ammocheattime < self.ammocheatinterval) {
        return 0;
    }
    if (!self cansee(self.enemy) && distancesquared(self.origin, self.enemy.origin) > 65536) {
        return 0;
    }
    self.bulletsinclip = int(weaponclipsize(self.weapon) / 2);
    if (self.bulletsinclip > weaponclipsize(self.weapon)) {
        self.bulletsinclip = weaponclipsize(self.weapon);
    }
    self.ammocheattime = gettime();
    return 1;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9f8
// Size: 0x28
function isusingprimary() {
    return self.weapon == self.primaryweapon && !isnullweapon(self.weapon);
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa28
// Size: 0x28
function isusingsecondary() {
    return self.weapon == self.secondaryweapon && !isnullweapon(self.weapon);
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa58
// Size: 0x28
function isusingsidearm() {
    return self.weapon == self.sidearm && !isnullweapon(self.weapon);
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa88
// Size: 0xc
function getclaimednode() {
    return self.node;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9c
// Size: 0x22
function shootenemywrapper(var_9bc9d0ee2a8a46f5) {
    if (!isdefined(var_9bc9d0ee2a8a46f5)) {
        var_9bc9d0ee2a8a46f5 = 1;
    }
    [[ anim.shootenemywrapper_func ]](var_9bc9d0ee2a8a46f5);
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xac5
// Size: 0x74
function getnodeyawtoorigin(pos) {
    /#
        assert(!actor_is3d());
    #/
    if (isdefined(self.node)) {
        yaw = self.node.angles[1] - getyaw(pos);
    } else {
        yaw = self.angles[1] - getyaw(pos);
    }
    yaw = angleclamp180(yaw);
    return yaw;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb41
// Size: 0xf2
function getnodeyawtoenemy() {
    /#
        assert(!actor_is3d());
    #/
    pos = undefined;
    if (isdefined(self.enemy)) {
        pos = self.enemy.origin;
    } else {
        if (isdefined(self.node)) {
            forward = anglestoforward(self.node.angles);
        } else {
            forward = anglestoforward(self.angles);
        }
        forward = forward * 150;
        pos = self.origin + forward;
    }
    if (isdefined(self.node)) {
        yaw = self.node.angles[1] - getyaw(pos);
    } else {
        yaw = self.angles[1] - getyaw(pos);
    }
    yaw = angleclamp180(yaw);
    return yaw;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3b
// Size: 0x98
function getyawtoenemy() {
    /#
        assert(!actor_is3d());
    #/
    pos = undefined;
    if (isdefined(self.enemy)) {
        pos = self.enemy.origin;
    } else {
        forward = anglestoforward(self.angles);
        forward = forward * 150;
        pos = self.origin + forward;
    }
    yaw = self.angles[1] - getyaw(pos);
    yaw = angleclamp180(yaw);
    return yaw;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdb
// Size: 0x53
function getyaw2d(org) {
    /#
        assert(!actor_is3d());
    #/
    angles = vectortoangles((org[0], org[1], 0) - (self.origin[0], self.origin[1], 0));
    return angles[1];
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd36
// Size: 0x6c
function absyawtoenemy() {
    /#
        assert(!actor_is3d());
    #/
    /#
        assert(isdefined(self.enemy));
    #/
    yaw = self.angles[1] - getyaw(self.enemy.origin);
    yaw = angleclamp180(yaw);
    if (yaw < 0) {
        yaw = -1 * yaw;
    }
    return yaw;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdaa
// Size: 0x6c
function absyawtoenemy2d() {
    /#
        assert(!actor_is3d());
    #/
    /#
        assert(isdefined(self.enemy));
    #/
    yaw = self.angles[1] - getyaw2d(self.enemy.origin);
    yaw = angleclamp180(yaw);
    if (yaw < 0) {
        yaw = -1 * yaw;
    }
    return yaw;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe1e
// Size: 0x50
function absyawtoorigin(org) {
    /#
        assert(!actor_is3d());
    #/
    yaw = self.angles[1] - getyaw(org);
    yaw = angleclamp180(yaw);
    if (yaw < 0) {
        yaw = -1 * yaw;
    }
    return yaw;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe76
// Size: 0x4a
function absyawtoangles(angles) {
    /#
        assert(!actor_is3d());
    #/
    yaw = self.angles[1] - angles;
    yaw = angleclamp180(yaw);
    if (yaw < 0) {
        yaw = -1 * yaw;
    }
    return yaw;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xec8
// Size: 0x3b
function getyawfromorigin(org, start) {
    /#
        assert(!actor_is3d());
    #/
    angles = vectortoangles(org - start);
    return angles[1];
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0b
// Size: 0x11
function getgrenademodel() {
    return getweaponmodel(self.grenadeweapon);
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf24
// Size: 0xf5
function getenemyeyepos(enemy) {
    if (!isdefined(enemy)) {
        enemy = self.enemy;
    }
    if (isdefined(enemy)) {
        self.a.lastenemypos = enemy getshootatpos();
        self.a.lastenemytime = gettime();
        return self.a.lastenemypos;
    } else if (isdefined(self.a.lastenemytime) && isdefined(self.a.lastenemypos) && self.a.lastenemytime + 3000 < gettime()) {
        return self.a.lastenemypos;
    } else {
        targetpos = self getshootatpos();
        targetpos = targetpos + 196 * self.lookforward;
        return targetpos;
    }
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1020
// Size: 0xa7
function gettruenodeangles(node) {
    if (!isdefined(node)) {
        return (0, 0, 0);
    }
    if (!isdefined(node.script_angles)) {
        return node.angles;
    }
    var_f4b64b2e64700883 = node.angles;
    var_5190f3ffc6e0ccde = angleclamp180(var_f4b64b2e64700883[0] + node.script_angles[0]);
    var_5190f4ffc6e0cf11 = var_f4b64b2e64700883[1];
    var_5190f1ffc6e0c878 = angleclamp180(var_f4b64b2e64700883[2] + node.script_angles[2]);
    return (var_5190f3ffc6e0ccde, var_5190f4ffc6e0cf11, var_5190f1ffc6e0c878);
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10cf
// Size: 0xc7
function getyawtoorigin(org) {
    /#
        assert(!actor_is3d());
    #/
    if (isdefined(self.type) && isnode3d(self)) {
        var_9cfe111ea9df5b56 = gettruenodeangles(self);
        forward = anglestoforward(var_9cfe111ea9df5b56);
        var_9288e19c8dd51644 = rotatepointaroundvector(forward, org - self.origin, var_9cfe111ea9df5b56[2] * -1);
        var_9288e19c8dd51644 = var_9288e19c8dd51644 + self.origin;
        yaw = getyaw(var_9288e19c8dd51644) - var_9cfe111ea9df5b56[1];
        yaw = angleclamp180(yaw);
        return yaw;
    }
    yaw = getyaw(org) - self.angles[1];
    yaw = angleclamp180(yaw);
    return yaw;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119e
// Size: 0x62
function canseepointfromexposedatcorner(point, node) {
    yaw = node getyawtoorigin(point);
    if (yaw > 60 || yaw < -60) {
        return 0;
    }
    if (isnodecoverleft(node) && yaw < -14) {
        return 0;
    }
    if (isnodecoverright(node) && yaw > 12) {
        return 0;
    }
    return 1;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1208
// Size: 0x2ba
function getnodeoffset(node) {
    if (isdefined(node.offset)) {
        return node.offset;
    }
    cover_left_crouch_offset = (-26, 0.4, 36);
    cover_left_stand_offset = (-32, 7, 63);
    cover_right_crouch_offset = (43.5, 11, 36);
    cover_right_stand_offset = (36, 8.3, 63);
    cover_crouch_offset = (3.5, -12.5, 45);
    cover_stand_offset = (-3.7, -22, 63);
    var_ed4a2a73f94d1ab5 = (0, 30, 13);
    cornernode = 0;
    nodeoffset = (0, 0, 0);
    axis = anglestoaxis(node.angles);
    right = axis["right"];
    forward = axis["forward"];
    up = axis["up"];
    nodetype = node.type;
    switch (nodetype) {
    case #"hash_e1d8e1adebed5a61":
        higheststance = node gethighestnodestance();
        if (!isdefined(higheststance) || higheststance == "crouch") {
            nodeoffset = calculatenodeoffset(right, forward, up, cover_left_crouch_offset);
        } else {
            nodeoffset = calculatenodeoffset(right, forward, up, cover_left_stand_offset);
        }
        break;
    case #"hash_cd3ffe799551db82":
        higheststance = node gethighestnodestance();
        if (!isdefined(higheststance) || higheststance == "crouch") {
            nodeoffset = calculatenodeoffset(right, forward, up, cover_right_crouch_offset);
        } else {
            nodeoffset = calculatenodeoffset(right, forward, up, cover_right_stand_offset);
        }
        break;
    case #"hash_410b602cd708b472":
    case #"hash_78b110033ccb68b0":
    case #"hash_805ed2ec27b468f7":
    case #"hash_bdacbb6eaaa538c7":
        nodeoffset = calculatenodeoffset(right, forward, up, cover_stand_offset);
        break;
    case #"hash_2c4ea8d9cb1d214":
    case #"hash_776752872754e5ee":
    case #"hash_c3b74422dec48736":
        nodeoffset = calculatenodeoffset(right, forward, up, cover_crouch_offset);
        break;
    case #"hash_b786e406d37a0dd7":
        nodeoffset = getcover3dnodeoffset(node);
        break;
    case #"hash_c051a32186a33cae":
        nodeoffset = calculatenodeoffset(right, forward, up, var_ed4a2a73f94d1ab5);
        break;
    }
    node.offset = nodeoffset;
    return node.offset;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ca
// Size: 0x11b
function getcover3dnodeoffset(node, var_55f2a89ea445dd80) {
    /#
        assert(isdefined(node) && node.type == "Cover 3D");
    #/
    var_d9091e7beb7128e8 = (2, -10, 35);
    var_6314194b648994a8 = (-19, -10, 32);
    var_4ca040109b9f8c1d = (16, -10, 32);
    right = anglestoright(node.angles);
    forward = anglestoforward(node.angles);
    up = anglestoup(node.angles);
    offset = var_d9091e7beb7128e8;
    if (isdefined(var_55f2a89ea445dd80)) {
        if (var_55f2a89ea445dd80 == "left") {
            offset = var_6314194b648994a8;
        } else if (var_55f2a89ea445dd80 == "right") {
            offset = var_4ca040109b9f8c1d;
        } else {
            /#
                assertmsg("unreachable");
            #/
        }
    }
    return calculatenodeoffset(right, forward, up, offset);
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ed
// Size: 0x37
function calculatenodeoffset(right, forward, up, baseoffset) {
    return right * baseoffset[0] + forward * baseoffset[1] + up * baseoffset[2];
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x162c
// Size: 0x4d
function persistentdebugline(start, end) {
    /#
        self endon("<unknown string>");
        level notify("<unknown string>");
        level endon("<unknown string>");
        for (;;) {
            line(start, end, (0.3, 1, 0), 1);
            wait(0.05);
        }
    #/
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1680
// Size: 0x114
function canseeenemyfromexposed() {
    now = gettime();
    node = self.node;
    enemy = self.enemy;
    var_a53e0a65b825db1d = !isdefined(self.var_c98e9008b1b17f09) || now >= self.var_c98e9008b1b17f09;
    if (var_a53e0a65b825db1d || !is_equal(self.var_c07e2ed36098c414, enemy) || !is_equal(self.var_1f088108efc5d0c4, node)) {
        self.canseeenemyfromexposed = function_e28d706f2d3f4c65(enemy, node);
        self.var_c98e9008b1b17f09 = now + 1000;
        self.var_1f088108efc5d0c4 = node;
        self.var_c07e2ed36098c414 = enemy;
    }
    result = self.canseeenemyfromexposed;
    if (!result) {
        /#
            if (self getentitynumber() == getdvarint(@"hash_c407a6f2012f4956")) {
                thread persistentdebugline(node.origin + getnodeoffset(node), getenemyeyepos());
            }
        #/
    }
    return result;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x179c
// Size: 0xad
function function_e28d706f2d3f4c65(enemy, node) {
    if (!isdefined(enemy)) {
        return 0;
    }
    if (!isdefined(node)) {
        result = self cansee(enemy);
    } else {
        enemyeye = undefined;
        if (function_67ff0340e1c92259(enemy)) {
            enemyeye = enemy getapproxeyepos();
        } else {
            enemyeye = getenemyeyepos(enemy);
        }
        if (actor_is3d() && isnode3d(node)) {
            result = function_a76836ca0f1172ab(enemy, enemyeye, node);
            if (!result) {
                enemyeye = (enemy.origin + enemyeye) / 2;
                result = function_a76836ca0f1172ab(enemy, enemyeye, node);
            }
        } else {
            result = function_a76836ca0f1172ab(enemy, enemyeye, node);
        }
    }
    return result;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1851
// Size: 0xb5
function function_a76836ca0f1172ab(enemy, point, node) {
    if (isnodecoverleft(node) || isnodecoverright(node)) {
        if (!canseepointfromexposedatcorner(point, node)) {
            return 0;
        }
    }
    nodeoffset = getnodeoffset(node);
    lookfrompoint = node.origin + nodeoffset;
    if (!checkpitchvisibility(lookfrompoint, point, node)) {
        return 0;
    }
    if (!sighttracepassed(lookfrompoint, point, 0, enemy)) {
        if (isnodecovercrouch(node)) {
            lookfrompoint = (0, 0, 64) + node.origin;
            return sighttracepassed(lookfrompoint, point, 0, enemy);
        }
        return 0;
    }
    return 1;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190e
// Size: 0xf8
function checkpitchvisibility(frompoint, topoint, atnode) {
    minpitch = self.upaimlimit - anim.aimpitchdifftolerance;
    maxpitch = self.downaimlimit + anim.aimpitchdifftolerance;
    var_cac6b8b7efddb0e4 = topoint - frompoint;
    if (actor_is3d()) {
        if (isdefined(atnode) && isnode3d(atnode)) {
            angles = atnode.angles;
        } else {
            angles = self.angles;
        }
        var_cac6b8b7efddb0e4 = rotatevectorinverted(var_cac6b8b7efddb0e4, angles);
    }
    pitch = angleclamp180(vectortopitch(var_cac6b8b7efddb0e4));
    if (pitch < minpitch) {
        return 0;
    }
    if (pitch > maxpitch) {
        if (isdefined(atnode) && !isnodecovercrouch(atnode)) {
            return 0;
        }
        if (pitch > anim.covercrouchleanpitch + maxpitch) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a0e
// Size: 0x11
function dontgiveuponsuppressionyet() {
    /#
        assertmsg("obsolete function. do not use. keeping around for script compile backward compatibility.");
    #/
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a26
// Size: 0x9d
function cansuppressenemy() {
    if (!hassuppressableenemy() || self.doingambush) {
        self.goodshootpos = undefined;
        return 0;
    }
    var_981e36835eec56c4 = istrue(self.var_51642e27c7e7d224);
    if (!isplayer(self.enemy)) {
        if (!var_981e36835eec56c4 || self.forcesuppressai) {
            return aisuppressai();
        }
    }
    if (var_981e36835eec56c4) {
        return 0;
    }
    if (!checkpitchvisibility(self geteye(), self.lastenemysightpos)) {
        return 0;
    }
    startoffset = self getapproxeyepos();
    return findgoodsuppressspot(startoffset);
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1acb
// Size: 0x48
function hassuppressableenemy() {
    if (!isdefined(self.enemy)) {
        return 0;
    }
    if (!isdefined(self.lastenemysightpos)) {
        return 0;
    }
    if (!self iscurrentenemyvalid()) {
        return 0;
    }
    if (!isdefined(self.goodshootpos) && !needrecalculatesuppressspot()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1b
// Size: 0xbf
function aisuppressai() {
    if (!self canattackenemynode() && !istrue(self.forcesuppressai)) {
        return 0;
    }
    shootpos = undefined;
    if (isdefined(self.enemy.covernode)) {
        nodeoffset = getnodeoffset(self.enemy.covernode);
        shootpos = self.enemy.covernode.origin + nodeoffset;
    } else {
        shootpos = self.enemy getshootatpos();
    }
    if (!self canshoot(shootpos) && !istrue(self.forcesuppressai)) {
        return 0;
    }
    self.goodshootpos = shootpos;
    return 1;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be2
// Size: 0x74
function canseeandshootpoint(point) {
    if (isdefined(self.a.weaponpos) && isundefinedweapon(self.a.weaponpos["right"])) {
        return 0;
    }
    if (!sighttracepassed(self getshootatpos(), point, 0, undefined)) {
        return 0;
    }
    var_528cdf0816c4001d = self getapproxeyepos();
    return sighttracepassed(var_528cdf0816c4001d, point, 0, undefined);
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5e
// Size: 0x6f
function needrecalculatesuppressspot() {
    if (isdefined(self.goodshootpos) && !canseeandshootpoint(self.goodshootpos)) {
        return 1;
    }
    return !isdefined(self.lastenemysightposold) || distancesquared(self.lastenemysightposold, self.lastenemysightpos) > 256 || distancesquared(self.lastenemysightposselforigin, self.origin) > 1024;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd5
// Size: 0x153
function findgoodsuppressspot(startoffset) {
    var_bc4d272afc4e79e6 = min(self.enemy.maxvisibledist, 1024);
    if (isdefined(self.enemy) && distancesquared(self.origin, self.enemy.origin) > squared(var_bc4d272afc4e79e6 + 768)) {
        self.goodshootpos = undefined;
        return 0;
    }
    if (needrecalculatesuppressspot()) {
        self.lastenemysightposselforigin = self.origin;
        self.lastenemysightposold = self.lastenemysightpos;
        if (istrue(self.suppress_uselastenemysightpos)) {
            self.goodshootpos = self.lastenemysightpos;
            return 1;
        }
        var_bdcf463e5b27a0b8 = getenemyeyepos();
        self.goodshootpos = self aicalcsuppressspot(startoffset, var_bdcf463e5b27a0b8, self.suppress_numgoodtracesneeded);
        return isdefined(self.goodshootpos);
    } else if (isdefined(self.goodshootpos) && isdefined(self.pathgoalpos) && distancesquared(self.origin, self.goodshootpos) < 1024) {
        self.goodshootpos = undefined;
    }
    return isdefined(self.goodshootpos);
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e30
// Size: 0x6a
function canseeenemy(var_e6749c0530f0d0f1) {
    if (!isdefined(self.enemy)) {
        return 0;
    }
    if (isdefined(var_e6749c0530f0d0f1) && self cansee(self.enemy, var_e6749c0530f0d0f1) || self cansee(self.enemy)) {
        if (!checkpitchvisibility(self geteye(), self.enemy getshootatpos())) {
            return 0;
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ea2
// Size: 0x37
function recentlysawenemy(time) {
    if (!isdefined(time)) {
        time = 5;
    }
    return isdefined(self.enemy) && self seerecently(self.enemy, time);
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ee1
// Size: 0x30
function issuppressedwrapper() {
    if (self.forcesuppression) {
        return 1;
    }
    if (self.suppressionmeter <= self.suppressionthreshold) {
        return 0;
    }
    return self issuppressed();
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f19
// Size: 0xd9
function enemyishiding() {
    if (!isdefined(self.enemy)) {
        return 0;
    }
    if (self.enemy isflashed()) {
        return 1;
    }
    if (isplayer(self.enemy)) {
        if (isdefined(self.enemy.health) && self.enemy.health < self.enemy.maxhealth) {
            return 1;
        }
    } else if (isai(self.enemy) && self.enemy issuppressedwrapper()) {
        return 1;
    }
    if (isdefined(self.enemy.isreloading) && self.enemy.isreloading) {
        return 1;
    }
    return 0;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ffa
// Size: 0x26
function shouldshootenemyent() {
    /#
        assert(isdefined(self));
    #/
    if (!canseeenemy()) {
        return 0;
    }
    if (!self canshootenemy()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2028
// Size: 0xd2
function sortandcullanimstructarray(var_d4876c861b3d6be) {
    var_28656d665cf2b0fa = [];
    foreach (animstruct in var_d4876c861b3d6be) {
        if (animstruct.weight <= 0) {
            continue;
        }
        for (i = 0; i < var_28656d665cf2b0fa.size; i++) {
            if (animstruct.weight < var_28656d665cf2b0fa[i].weight) {
                for (j = var_28656d665cf2b0fa.size; j > i; j--) {
                    var_28656d665cf2b0fa[j] = var_28656d665cf2b0fa[j - 1];
                }
                break;
            }
        }
        var_28656d665cf2b0fa[i] = animstruct;
    }
    return var_28656d665cf2b0fa;
}

// Namespace namespace_152f3860b54f75e5/namespace_7843e1029b5c80e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2102
// Size: 0x181
function player_can_see_ai(player, ai, latency) {
    currenttime = gettime();
    if (!isdefined(latency)) {
        latency = 0;
    }
    if (isdefined(ai.playerseesmetime) && ai.playerseesmetime + latency >= currenttime) {
        /#
            assert(isdefined(ai.playerseesme));
        #/
        return ai.playerseesme;
    }
    ai.playerseesmetime = currenttime;
    if (!within_fov(player.origin, player.angles, ai.origin, 0.766)) {
        ai.playerseesme = 0;
        return 0;
    }
    playereye = player geteye();
    var_8588ce8cb050baf3 = ai.origin;
    if (sighttracepassed(playereye, var_8588ce8cb050baf3, 1, player, ai)) {
        ai.playerseesme = 1;
        return 1;
    }
    eyeorigin = ai getapproxeyepos();
    if (sighttracepassed(playereye, eyeorigin, 1, player, ai)) {
        ai.playerseesme = 1;
        return 1;
    }
    var_59a0ba7c30f92d0b = (eyeorigin + var_8588ce8cb050baf3) * 0.5;
    if (sighttracepassed(playereye, var_59a0ba7c30f92d0b, 1, player, ai)) {
        ai.playerseesme = 1;
        return 1;
    }
    ai.playerseesme = 0;
    return 0;
}
