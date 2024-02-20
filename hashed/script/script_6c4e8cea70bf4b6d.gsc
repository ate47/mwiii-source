// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\math.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_3314add7998ab13;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_b7a9ce0a2282b79;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_64acb6ce534155b7;

#namespace namespace_922b76892b73e7c6;

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x674
// Size: 0x5e
function function_5f6d9fd82bdd2d05(activity) {
    task = spawnstruct();
    task.teams = [];
    task.mission = activity;
    task.activity = activity;
    task.funcs = [];
    task.index = 0;
    return task;
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6da
// Size: 0xb4
function function_325390edb051cd5d(var_bfbe9638e9832d90, locations, size) {
    if (!isdefined(self.var_b0f4bf8621b96c0a)) {
        self.var_b0f4bf8621b96c0a = [];
    }
    foreach (location in locations) {
        index = self.var_b0f4bf8621b96c0a.size;
        self.var_b0f4bf8621b96c0a[index] = spawnstruct();
        self.var_b0f4bf8621b96c0a[index] function_6b6b6273f8180522(var_bfbe9638e9832d90, location, size);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x795
// Size: 0x6e
function function_8cd2ac82037f025c(var_bfbe9638e9832d90, location, size) {
    if (!isdefined(self.var_b0f4bf8621b96c0a)) {
        self.var_b0f4bf8621b96c0a = [];
    }
    index = self.var_b0f4bf8621b96c0a.size;
    self.var_b0f4bf8621b96c0a[index] = spawnstruct();
    self.var_b0f4bf8621b96c0a[index] function_6b6b6273f8180522(var_bfbe9638e9832d90, location, size);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80a
// Size: 0x74
function function_1851e9cfb7687f68(player) {
    if (isdefined(self.var_b0f4bf8621b96c0a)) {
        foreach (circle in self.var_b0f4bf8621b96c0a) {
            if (isdefined(circle)) {
                circle function_cfd53c8f6878014f(player);
            }
        }
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x885
// Size: 0x74
function function_556fb3a465f0e978(player) {
    if (isdefined(self.var_b0f4bf8621b96c0a)) {
        foreach (circle in self.var_b0f4bf8621b96c0a) {
            if (isdefined(circle)) {
                circle function_d7d113d56ef0ef5b(player);
            }
        }
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x900
// Size: 0x74
function function_e54df8560bf7dc64(team) {
    if (isdefined(self.var_b0f4bf8621b96c0a)) {
        foreach (circle in self.var_b0f4bf8621b96c0a) {
            if (isdefined(circle)) {
                circle function_739560269bc164cf(team);
            }
        }
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97b
// Size: 0x45
function function_89951899f85b3465(team, circleindex) {
    if (!isdefined(self.var_b0f4bf8621b96c0a)) {
        return;
    }
    if (!isdefined(self.var_b0f4bf8621b96c0a[circleindex])) {
        return;
    }
    self.var_b0f4bf8621b96c0a[circleindex] function_739560269bc164cf(team);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c7
// Size: 0x6a
function function_2476daefa3384c5e() {
    if (isdefined(self.var_b0f4bf8621b96c0a)) {
        foreach (circle in self.var_b0f4bf8621b96c0a) {
            if (isdefined(circle)) {
                circle function_af5604ce591768e1();
            }
        }
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa38
// Size: 0x36
function function_4e927bfe9b585059(index) {
    if (isdefined(self.var_b0f4bf8621b96c0a)) {
        self.var_b0f4bf8621b96c0a[index] function_af5604ce591768e1();
        self.var_b0f4bf8621b96c0a[index] = undefined;
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa75
// Size: 0x1e
function function_ab50f62a3a730400(origin, radius) {
    return origin + function_d553466cf817a4da() * radius;
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa9b
// Size: 0x9c
function function_e68b37e06549547e(neworigin, newradius, circleindex) {
    if (!isdefined(circleindex)) {
        circleindex = 0;
    }
    if (!isdefined(neworigin)) {
        neworigin = self.var_b0f4bf8621b96c0a[circleindex].mapcircle.origin;
    }
    if (!isdefined(newradius)) {
        newradius = self.var_b0f4bf8621b96c0a[circleindex].mapcircle.origin[2];
    }
    self.var_b0f4bf8621b96c0a[circleindex].mapcircle.origin = (neworigin[0], neworigin[1], newradius);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb3e
// Size: 0x16b
function function_a764b87cdf6d8ac4(points, height) {
    minx = points[0][0];
    maxx = points[0][0];
    miny = points[0][1];
    maxy = points[0][1];
    foreach (point in points) {
        if (minx > point[0]) {
            minx = point[0];
        }
        if (maxx < point[0]) {
            maxx = point[0];
        }
        if (miny > point[1]) {
            miny = point[1];
        }
        if (maxy < point[1]) {
            maxy = point[1];
        }
    }
    center = ((maxx + minx) / 2, (maxy + miny) / 2, height);
    radiussq = 0;
    foreach (point in points) {
        distsq = distance2dsquared(center, point);
        if (radiussq <= distsq) {
            radiussq = distsq;
        }
    }
    return [0:center, 1:sqrt(radiussq)];
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb1
// Size: 0x1a7
function function_9e357e07833a0d1a(team) {
    level endon("game_ended");
    self endon("task_ended");
    wait(3);
    while (1) {
        if (!isdefined(self.var_b0f4bf8621b96c0a) || self.var_b0f4bf8621b96c0a.size == 0 || !isdefined(self.icon)) {
            return;
        }
        players = getteamdata(team, "players");
        foreach (player in players) {
            showicon = 1;
            foreach (circle in self.var_b0f4bf8621b96c0a) {
                if (!isdefined(circle.mapcircle)) {
                    continue;
                }
                dist = distance2dsquared(player.origin, circle.mapcircle.origin);
                if (dist <= circle.mapcircle.origin[2] * circle.mapcircle.origin[2]) {
                    showicon = 0;
                    break;
                }
            }
            if (showicon) {
                function_fbf23ae15945ee5a(player);
            } else {
                function_401535e3fa9e171c(player);
            }
        }
        wait(1);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5f
// Size: 0x174
function function_995813ad75b83c53(team, circleindex) {
    level endon("game_ended");
    self endon("task_ended");
    wait(3);
    while (1) {
        if (!isdefined(self.var_b0f4bf8621b96c0a) || self.var_b0f4bf8621b96c0a.size == 0 || !isdefined(self.icon)) {
            return;
        }
        players = getteamdata(team, "players");
        foreach (player in players) {
            showicon = 1;
            circle = self.var_b0f4bf8621b96c0a[circleindex];
            if (isdefined(circle.mapcircle)) {
                dist = distance2dsquared(player.origin, circle.mapcircle.origin);
                if (dist <= circle.mapcircle.origin[2] * circle.mapcircle.origin[2]) {
                    showicon = 0;
                    break;
                }
            }
            if (showicon) {
                function_fbf23ae15945ee5a(player);
            } else {
                function_401535e3fa9e171c(player);
            }
        }
        wait(1);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfda
// Size: 0x95
function function_a9f8002e49a69313(dialog, teamname) {
    var_cb3339ece72dbdeb = game["dialog"][dialog];
    /#
        assertex(isdefined(var_cb3339ece72dbdeb), "dmzMission_playDialogForTeam: Not given dialogue defined in game["dialog"]" + dialog);
    #/
    foreach (teammember in getteamdata(teamname, "players")) {
        teammember queuedialogforplayer(var_cb3339ece72dbdeb, dialog, 2);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1076
// Size: 0x59
function function_4ed64ae8fc231a27(icon, teamname, location, zoffset, waittime, var_24c76fc549f7fd9) {
    level endon("game_ended");
    self endon("RemoveIcon");
    if (isdefined(waittime)) {
        wait(waittime);
    } else {
        waitframe();
    }
    function_e88784387008bd2(icon, teamname, location, zoffset, var_24c76fc549f7fd9);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x10d6
// Size: 0x69
function function_5a2f918c5578514(icon, teamname, entity, zoffset, var_24c76fc549f7fd9) {
    function_e88784387008bd2(icon, teamname, entity.origin, zoffset, var_24c76fc549f7fd9);
    update_objective_onentity(self.objidnum, entity);
    if (isdefined(zoffset)) {
        update_objective_setzoffset(self.objidnum, zoffset);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1146
// Size: 0xc2
function function_e88784387008bd2(icon, teamname, location, zoffset, var_24c76fc549f7fd9) {
    if (!isdefined(zoffset)) {
        zoffset = 0;
    }
    self.curorigin = location;
    self.offset3d = (0, 0, zoffset);
    namespace_19b4203b51d56488::requestid(1, 1, undefined, 1);
    update_objective_icon(self.objidnum, icon);
    if (isdefined(teamname)) {
        objective_teammask_single(self.objidnum, teamname);
    } else {
        objective_removeallfrommask(self.objidnum);
    }
    update_objective_state(self.objidnum, ter_op(isdefined(var_24c76fc549f7fd9), var_24c76fc549f7fd9, "invisible"));
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(self.objidnum, 4);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x120f
// Size: 0x27
function function_188bf2b5951a0060(newentity) {
    self.var_4f84f5e80ff9f3b = newentity;
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(self.objidnum, newentity);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123d
// Size: 0x30
function function_30c89ac91cfae119(teamname) {
    if (isdefined(teamname) && isdefined(self.objidnum)) {
        objective_teammask_single(self.objidnum, teamname);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1274
// Size: 0x3e
function function_e8d8df3da4392f0f(teamname) {
    if (isdefined(teamname) && isdefined(self.objidnum)) {
        objective_removeteamfrommask(self.objidnum, teamname);
        objective_showtoplayersinmask(self.objidnum);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b9
// Size: 0x25
function function_d062142f367ed7b2() {
    self notify("RemoveIcon");
    if (isdefined(self) && isdefined(self.objidnum)) {
        namespace_19b4203b51d56488::releaseid();
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12e5
// Size: 0x5c
function function_f76241db305fb78f(entity, zoffset) {
    if (!isdefined(zoffset)) {
        zoffset = 50;
    }
    function_c847bfd52c064289(entity.origin);
    if (isdefined(self.icon)) {
        objective_onentity(self.icon, entity);
        objective_setzoffset(self.icon, zoffset);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1348
// Size: 0x156
function function_c847bfd52c064289(origin, type) {
    if (!isdefined(type)) {
        type = self.activity.type;
    }
    self.icon = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    if (!isdefined(self.icon) || self.icon == -1) {
        self.icon = undefined;
        return;
    }
    self.var_7919c8f3a10feb86 = origin;
    objective_delete(self.icon);
    objective_icon(self.icon, function_56f8d3e2552878be(type));
    objective_setbackground(self.icon, 4);
    objective_position(self.icon, origin);
    objective_setplayintro(self.icon, 1);
    objective_setdescription(self.icon, "MP_DMZ_MISSIONS/CONTRACT_ICON_LABEL");
    objective_state(self.icon, "current");
    function_98ba077848896a3(self.icon, 0);
    objective_sethideelevation(self.icon, 1);
    function_9427cb5974c925d9(self.icon, 1);
    function_a13e72e0427ecad2(self.icon, function_58fb674a1dd27075());
    objective_addalltomask(self.icon);
    objective_hidefromplayersinmask(self.icon);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14a5
// Size: 0x198
function private function_56f8d3e2552878be(type) {
    icon = undefined;
    switch (type) {
    case #"hash_9e02cd4a0f3ca981":
        icon = "ui_map_icon_obj_assassin";
        break;
    case #"hash_9617cc9a55eccdd4":
        icon = "ui_map_icon_obj_scavenger";
        break;
    case #"hash_7e9cf92ed0a526f1":
        icon = "ui_map_icon_obj_sh_bomb_defuse";
        break;
    case #"hash_5f39d019572500bb":
        icon = "ui_map_icon_obj_recover";
        break;
    case #"hash_ec086b911c1011ec":
        icon = "ui_map_icon_obj_rescue";
        break;
    case #"hash_58f6d6cc1dc3e295":
        icon = "ui_map_icon_obj_bomb_collect";
        break;
    case #"hash_37bb23543c319104":
        icon = "ui_map_icon_obj_hunt";
        break;
    case #"hash_9db32d30f2603c35":
        icon = "ui_map_icon_obj_cargo_delivery";
        break;
    case #"hash_1e754eb11fa62651":
        icon = "ui_map_icon_obj_cargo_ship";
        break;
    case #"hash_2e6b7be09d7fd568":
        icon = "ui_map_icon_obj_geiger_search";
        break;
    case #"hash_bf5597954aaed3d7":
        icon = "ui_map_icon_obj_intel_dmz";
        break;
    case #"hash_82ea0e6e4f123b62":
        icon = "ui_map_icon_obj_trap";
        break;
    case #"hash_4f62da1c4ed6f790":
        icon = "ui_map_icon_obj_most_wanted";
        break;
    case #"hash_be386dc37be6968e":
        icon = "ui_map_icon_obj_dmz_supply";
        break;
    case #"hash_218ddcea32fa5fbc":
        icon = "ui_map_icon_obj_hacker";
        break;
    case #"hash_4aae0f3e58abb932":
        icon = "ui_map_icon_elite_geiger_search";
        break;
    default:
        icon = "ui_map_icon_obj_scavenger";
        break;
    }
    return icon;
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1645
// Size: 0x2a
function function_fbf23ae15945ee5a(player) {
    if (isdefined(self.icon)) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.icon, player);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1676
// Size: 0x72
function function_a92867e16c21da22(team) {
    if (!isdefined(self.icon)) {
        return;
    }
    foreach (player in getteamdata(team, "players")) {
        function_fbf23ae15945ee5a(player);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ef
// Size: 0x2a
function function_401535e3fa9e171c(player) {
    if (isdefined(self.icon)) {
        objective_playermask_hidefrom(self.icon, player);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1720
// Size: 0x64
function function_743033b2e6c2d930(team) {
    foreach (player in getteamdata(team, "players")) {
        function_401535e3fa9e171c(player);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178b
// Size: 0x2b
function function_629ed367d1393020() {
    if (isdefined(self.icon)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.icon);
        self.icon = -1;
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17bd
// Size: 0x33
function function_cef2ed613a8338be(location) {
    if (isdefined(self.icon)) {
        self.var_7919c8f3a10feb86 = location;
        objective_position(self.icon, location);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f7
// Size: 0x4f
function function_b3c1ba9fbd1dd01e(entity, zoffset) {
    if (!isdefined(zoffset)) {
        zoffset = 50;
    }
    if (isdefined(self.icon)) {
        objective_onentity(self.icon, entity);
        if (isdefined(zoffset)) {
            objective_setzoffset(self.icon, zoffset);
        }
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184d
// Size: 0x20c
function function_9be29ad72a155ee1(var_b37714a572b93f0e, var_9c40af0f61186602) {
    self endon("death");
    weaponname = "intel_pickup_phone";
    if (isdefined(var_b37714a572b93f0e)) {
        weaponname = var_b37714a572b93f0e;
    }
    if (istrue(self.insertingarmorplate)) {
        self notify("try_armor_cancel");
        while (isdefined(self.currentweapon) && isdefined(self.currentweapon.basename) && self.currentweapon.basename == "iw9_armor_plate_deploy_mp") {
            waitframe();
        }
        waitframe();
    }
    self notify("cancel_all_killstreak_deployments");
    while (namespace_9abe40d2af041eb2::iskillstreakdeployweapon(self getcurrentweapon())) {
        waitframe();
    }
    omnvar = function_32e9314deaf4c7be(weaponname);
    if (isdefined(var_9c40af0f61186602)) {
        omnvar = var_9c40af0f61186602;
    }
    val::set("show_intel", "weapon_switch", 0);
    val::set("show_intel", "mantle", 0);
    val::set("show_intel", "prone", 0);
    val::set("show_intel", "melee", 0);
    val::set("show_intel", "offhand_weapons", 0);
    val::set("show_intel", "weapon_pickup", 0);
    val::set("show_intel", "usability", 0);
    val::set("show_intel", "vehicle_use", 0);
    currentweapon = self getcurrentweapon();
    var_2faa2c4b7d9e16e4 = makeweapon(weaponname);
    namespace_df5cfdbe6e2d3812::_giveweapon(var_2faa2c4b7d9e16e4);
    self switchtoweapon(var_2faa2c4b7d9e16e4);
    self setclientomnvar("ui_tablet_usb", omnvar);
    thread function_1ef3aef709c7007c();
    wait(function_2d0d55d0d1148c4d(weaponname));
    self takeweapon(var_2faa2c4b7d9e16e4);
    if (istrue(self.inlaststand)) {
        if (isdefined(level.var_8b2457623e1802dc)) {
            currentweapon = self [[ level.var_8b2457623e1802dc ]]();
        } else {
            currentweapon = namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845("iw9_me_fists_mp");
        }
    }
    self switchtoweapon(currentweapon);
    val::function_c9d0b43701bdba00("show_intel");
    self setclientomnvar("ui_tablet_usb", 0);
    self notify("ui_tablet_reset");
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a60
// Size: 0x6b
function private function_32e9314deaf4c7be(weap_name) {
    switch (weap_name) {
    case #"hash_6971a5b6d5b4c43f":
    case #"hash_83bf32566065a90b":
        return 1;
    case #"hash_1f46dae464ca1c4f":
        return 2;
    case #"hash_c77f7e706b6640ab":
        return 3;
    case #"hash_52ebc6fd88a136a5":
        return 8;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ad2
// Size: 0x71
function private function_2d0d55d0d1148c4d(weap_name) {
    switch (weap_name) {
    case #"hash_6971a5b6d5b4c43f":
    case #"hash_83bf32566065a90b":
        return 4;
    case #"hash_1f46dae464ca1c4f":
        return 3;
    case #"hash_c77f7e706b6640ab":
        return 4.5;
    case #"hash_52ebc6fd88a136a5":
        return 4;
    case #"hash_280f1b82c041035a":
        return 8;
        break;
    }
    return 5;
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4b
// Size: 0x26
function function_1ef3aef709c7007c() {
    self endon("ui_tablet_reset");
    level endon("game_ended");
    self waittill("death_or_disconnect");
    self setclientomnvar("ui_tablet_usb", 0);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b78
// Size: 0x3f
function function_da38be107ae836ff(teammates, cash) {
    teamsize = float(getdvarint(@"hash_398b5abef8d572fa", teammates.size));
    return ter_op(teamsize, cash / teamsize, 0);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bbf
// Size: 0x47
function function_8c5476a01afab741(player, cash) {
    var_13d34a5606594fab = function_53c4c53197386572(namespace_a38a2e1fe7519183::getUpgradeCount(player, 19), 0);
    var_5e2bb202ae259b31 = 1 + 0.05 * var_13d34a5606594fab;
    return cash * var_5e2bb202ae259b31;
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c0e
// Size: 0xf0
function function_cd4f277cf0d6a560(teamname, cash) {
    teammates = getteamdata(teamname, "players");
    if (!isdefined(teammates) || !isarray(teammates) || teammates.size == 0) {
        return;
    }
    if (!isdefined(cash)) {
        cash = self.activity.var_723b8f7cb71ceb11;
    }
    var_dce14f374c0bcd61 = function_da38be107ae836ff(teammates, cash);
    foreach (player in teammates) {
        var_9f870ccae9510eab = function_8c5476a01afab741(player, var_dce14f374c0bcd61);
        var_c65df5ef44dd0aa1 = int(ceil(var_9f870ccae9510eab));
        player namespace_c6ccccd95254983f::playerplunderpickup(var_c65df5ef44dd0aa1);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d05
// Size: 0xea
function function_9c6ab63c4b6bd08b(teamname, cash) {
    var_bbac576aade31a1e = 0;
    teammates = getteamdata(teamname, "players");
    if (!isdefined(teammates) || !isarray(teammates) || teammates.size == 0) {
        return;
    }
    if (!isdefined(cash)) {
        cash = self.activity.var_723b8f7cb71ceb11;
    }
    var_dce14f374c0bcd61 = function_da38be107ae836ff(teammates, cash);
    foreach (player in teammates) {
        var_9f870ccae9510eab = function_8c5476a01afab741(player, var_dce14f374c0bcd61);
        var_bbac576aade31a1e = var_bbac576aade31a1e + var_9f870ccae9510eab;
    }
    return int(ceil(var_bbac576aade31a1e));
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df7
// Size: 0x97
function task_ended(var_5e671fc71e72d5e8, var_644a33d86d8514bf) {
    if (isdefined(var_5e671fc71e72d5e8)) {
        players = getteamdata(var_5e671fc71e72d5e8, "players");
        if (isdefined(players)) {
            foreach (player in players) {
                level thread namespace_d696adde758cbe79::function_1be19e52e991d817(player);
            }
        }
    }
    self.activity function_18d4e8025ec24a0(self, var_5e671fc71e72d5e8, var_644a33d86d8514bf);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e95
// Size: 0x73
function function_6f6f83ab76483811(instance, player) {
    if (!isdefined(instance) || !isdefined(instance.task)) {
        return;
    }
    task = instance.task;
    if (array_contains(task.teams, player.team)) {
        task task_ended(player.team);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f0f
// Size: 0x5c
function function_8158903a6e2f32fd(task, player) {
    return isdefined(task) && isdefined(task.teams) && isdefined(player) && isdefined(player.team) && array_contains(task.teams, player.team);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f73
// Size: 0x55
function function_65a2513d3692ea1a(teamname) {
    /#
        assert(isdefined(self.activity.type), "task_showGenericMissionAssignedSplash: Didn't have self.activity.type defined");
    #/
    function_1759acfd39bb5edf("dmz_generic_" + self.activity.type + "_mission_assigned", teamname);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fcf
// Size: 0x77
function function_a1738a95d7aa8094(splash, var_1bbeb265ef74bc60, var_723b8f7cb71ceb11, teamname) {
    var_d4fc3b4e84704775 = level.var_1b7407dffe81e6e8.var_b2f15037287a033a[var_1bbeb265ef74bc60].index;
    params = namespace_1eb3c4e0e28fac71::packsplashparambits(var_d4fc3b4e84704775, var_723b8f7cb71ceb11);
    namespace_d696adde758cbe79::showDMZSplash(splash, getteamdata(teamname, "players"), undefined, params);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x204d
// Size: 0x3b
function function_1759acfd39bb5edf(splash, teamname) {
    namespace_d696adde758cbe79::showDMZSplash(splash, getteamdata(teamname, "players"), self.node.poi);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x208f
// Size: 0x1d
function function_3a1b792c4eab210f(splash) {
    namespace_d696adde758cbe79::showDMZSplash(splash, level.players);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b3
// Size: 0x4a
function function_c9f97baa0d7f59bf(splash, teamname) {
    namespace_d696adde758cbe79::showDMZSplash(splash, array_remove_array(level.players, getteamdata(teamname, "players")), self.node.poi);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2104
// Size: 0x5d
function function_137d718c82ac0947(teamname) {
    if (!isdefined(level.radiation) || !istrue(level.radiation.var_9badbb469626f6)) {
        wait(5);
        if (!istrue(level.var_644a33d86d8514bf)) {
            namespace_d696adde758cbe79::showDMZSplash("dmz_contract_reminder", getteamdata(teamname, "players"));
        }
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2168
// Size: 0x5f
function function_1458f4e9320a8ae1(point) {
    radius = 0;
    if (point.spawnflags & 4) {
        radius = 256;
    } else if (point.spawnflags & 2) {
        radius = 128;
    } else if (point.spawnflags & 1) {
        radius = 168;
    }
    return radius;
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21cf
// Size: 0x2c
function function_70313f3b61e1aeef() {
    if (isdefined(level.var_fe29a5bf2f96b5d3) && level.var_fe29a5bf2f96b5d3.size > 1) {
        return level.var_fe29a5bf2f96b5d3;
    }
    return [];
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2203
// Size: 0x64
function function_739560269bc164cf(teamname) {
    foreach (player in getteamdata(teamname, "players")) {
        function_cfd53c8f6878014f(player);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x226e
// Size: 0x64
function function_9688f0dc7dfd3d53(teamname) {
    foreach (player in getteamdata(teamname, "players")) {
        function_d7d113d56ef0ef5b(player);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d9
// Size: 0x62
function function_42718c89b38e260b(objidnum, teams) {
    foreach (team in teams) {
        function_6dad7e4d170de4ba(objidnum, team);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2342
// Size: 0x76
function function_6dad7e4d170de4ba(objidnum, team) {
    foreach (player in getteamdata(team, "players")) {
        namespace_5a22b6f3a56f7e9b::objective_unpin_player(objidnum, player);
        namespace_5a22b6f3a56f7e9b::function_7299a742781a5030(0, player);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x23bf
// Size: 0x68
function function_83dd17f313ffdec0(var_7e05c139fbbd8374, var_5b9c864b21207ff6, task) {
    cache = spawnscriptable("br_loot_cache", var_7e05c139fbbd8374, var_5b9c864b21207ff6);
    cache setscriptablepartstate("body", "open_usable");
    function_c573d8a23f7faf06(cache, []);
    cache.task = task;
    task.cache = cache;
    return cache;
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x242f
// Size: 0xea
function function_c573d8a23f7faf06(cache, teams) {
    validplayers = [];
    foreach (team in teams) {
        validplayers = array_combine(validplayers, getteamdata(team, "players"));
    }
    foreach (player in level.players) {
        if (array_contains(validplayers, player)) {
            cache enablescriptableplayeruse(player);
        } else {
            cache disablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2520
// Size: 0x28
function function_f8cd22fb229f4138(cash) {
    if (!isdefined(cash) || cash == 0) {
        return 1;
    }
    return int(cash / 25 - 1);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2550
// Size: 0x1d
function function_b43e9536b7e60884(player, index) {
    player namespace_1eb3c4e0e28fac71::setquestindexomnvar(index);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2574
// Size: 0x87
function function_b7bbe29ed551ee90(index, tier, teamname) {
    foreach (player in getteamdata(teamname, "players")) {
        function_b43e9536b7e60884(player, index);
    }
    if (!isdefined(tier)) {
        tier = 1;
    }
    namespace_1eb3c4e0e28fac71::setquestrewardtier(teamname, tier);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2602
// Size: 0x15
function function_6d93be335873296e(player) {
    player namespace_1eb3c4e0e28fac71::setquestindexomnvar(0);
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x261e
// Size: 0x64
function function_83d7eb52598be0b3(teamname) {
    foreach (player in getteamdata(teamname, "players")) {
        function_6d93be335873296e(player);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2689
// Size: 0xce
function function_5314298e777e5688(ref) {
    self.ref = ref;
    self.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(self.ref);
    tier = 1;
    if (isdefined(self.activity)) {
        var_723b8f7cb71ceb11 = self.activity.var_723b8f7cb71ceb11;
        tier = function_f8cd22fb229f4138(var_723b8f7cb71ceb11);
    }
    foreach (team in self.teams) {
        function_b7bbe29ed551ee90(self.var_30e8a65cff941c7a, tier, team);
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x275e
// Size: 0x89
function function_dffcbce998c9ee50(teamname) {
    key = self.var_65513ad5397a67ef;
    players = getteamdata(teamname, "players");
    foreach (player in players) {
        player.var_65513ad5397a67ef = key;
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27ee
// Size: 0x78
function function_45bd3184ff146b46(teamname) {
    if (isdefined(teamname)) {
        players = getteamdata(teamname, "players");
        foreach (player in players) {
            player.var_65513ad5397a67ef = undefined;
        }
    }
}

// Namespace namespace_922b76892b73e7c6/namespace_f2c68794a1018c9d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x286d
// Size: 0x73
function function_d86771edadba8b4a(instance, task, player) {
    task endon("bomb_planted");
    task endon("bomb_defused");
    player endon("death_or_disconnect");
    player endon("last_stand_start");
    player endon("enter_live_ragdoll");
    player notifyonplayercommand("cancel", "+weapnext");
    instance.cancel = 0;
    player waittill("cancel");
    instance.cancel = 1;
}

