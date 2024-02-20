// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_24e4405cf93f20ed;
#using scripts\common\vehicle_aianim.gsc;
#using scripts\vehicle\vehicle_common.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;

#namespace namespace_a1044864694a4aae;

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a2
// Size: 0x31
function function_7dcad89b9c0264a6() {
    if (!isdefined(level.var_6e5ff6cae14c4081)) {
        level.var_6e5ff6cae14c4081 = [];
    }
    if (!isdefined(level.var_a8dc22c62ba69b88)) {
        level.var_a8dc22c62ba69b88 = [];
    }
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da
// Size: 0xb4
function function_28991b23dba743d8(var_bc36c55f86568c40) {
    if (!isdefined(self.var_324836dc0d03f0a4) || self.var_324836dc0d03f0a4 < 5) {
        if (distancesquared(self.origin, var_bc36c55f86568c40) < squared(750)) {
            if (!isdefined(self.var_ed5b42425e687d18)) {
                self.var_ed5b42425e687d18 = 0;
                self.var_324836dc0d03f0a4 = 0;
            }
            if (gettime() > self.var_ed5b42425e687d18) {
                if (soundexists("veh_horn_mid_random")) {
                    self playsoundonmovingent("veh_horn_mid_random");
                }
                self.var_324836dc0d03f0a4++;
                self.var_ed5b42425e687d18 = gettime() + randomintrange(200, 1000);
            }
        }
    }
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x395
// Size: 0x128
function function_c3889abf5cd6abbf(pathdata, speed, var_5b69959df7b5f457, var_eefdc14dd5275fd0) {
    self endon("death");
    self endon("unloaded");
    self notify("newFollowPath");
    self endon("newFollowPath");
    while (!isdefined(level.var_2814a8f25a392eaa)) {
        waitframe();
    }
    while (1) {
        function_e8730cc0c5eac096(pathdata);
        function_28991b23dba743d8(pathdata.path[pathdata.index].origin);
        var_1f25fd6dac8f357e = function_1d917ec593f5d37(pathdata.path[pathdata.index], speed);
        if (var_1f25fd6dac8f357e != speed) {
            self function_77320e794d35465a("p2p", "goalThreshold", var_1f25fd6dac8f357e * 4);
        }
        result = function_8f40a2c8678f8304(self.origin, pathdata.path[pathdata.index].origin, var_1f25fd6dac8f357e, undefined, undefined, var_eefdc14dd5275fd0);
        if (isdefined(var_5b69959df7b5f457) && isdefined(result) && result == "path_blocked") {
            [[ var_5b69959df7b5f457 ]]();
        }
        waitframe();
    }
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c4
// Size: 0x75
function function_1d917ec593f5d37(node, speed) {
    if (!isdefined(node.var_e8a3ae8cfc0a5ec)) {
        return speed;
    }
    if (node.var_e8a3ae8cfc0a5ec == "slow") {
        return 20;
    } else if (node.var_e8a3ae8cfc0a5ec == "fast") {
        return 80;
    } else if (node.var_e8a3ae8cfc0a5ec == "furious") {
        return 128;
    } else {
        return speed;
    }
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x540
// Size: 0x70
function function_e8730cc0c5eac096(pathdata) {
    pathdata.index = (pathdata.index + pathdata.direction) % pathdata.path.size;
    if (pathdata.index < 0) {
        pathdata.index = pathdata.index + pathdata.path.size;
    }
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5b7
// Size: 0x1a4
function function_26e9e22860c819ce(start_point, end_point, speed, var_91b19cfb0a78c588) {
    /#
        assert(isdefined(level.var_2814a8f25a392eaa), "scriptscp_mpvehiclesvehicle::vehicle_findNavmeshLayer must find a navmesh layer before this function is called. Or maybe this level has no navmesh?");
    #/
    if (isdefined(var_91b19cfb0a78c588)) {
        newpath = findpathcustom(start_point, getclosestpointonnavmesh(var_91b19cfb0a78c588, level.var_2814a8f25a392eaa), 0, 1, level.var_2814a8f25a392eaa);
        end_point = function_c06bd2ea8930eebf(end_point, newpath);
    } else {
        newpath = findpathcustom(start_point, getclosestpointonnavmesh(end_point, level.var_2814a8f25a392eaa), 0, 1, level.var_2814a8f25a392eaa);
    }
    /#
        if (getdvar(@"hash_5932a654e8efe1fa") != "<unknown string>") {
            foreach (index, node in newpath) {
                sphere(node, 16, (1, 1, 1), 0, 10000);
                if (isdefined(newpath[index + 1])) {
                    line(node, newpath[index + 1], (0, 1, 0), 1, 0, 10000);
                }
            }
        }
        if (getdvar(@"hash_ec592c9ed8224d75") != "<unknown string>") {
            sphere(end_point, 16, (1, 1, 1), 0, 2);
        }
    #/
    if (newpath.size) {
        thread function_69695f8c7ed9c3f6(newpath, speed);
    } else {
        self function_77320e794d35465a("p2p", "goalPoint", self.origin);
    }
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x762
// Size: 0x14c
function function_69695f8c7ed9c3f6(newpath, speed) {
    self endon("death");
    self notify("path_updated");
    self endon("path_updated");
    foreach (point in newpath) {
        while (istrue(self.pausing)) {
            wait(0.05);
        }
        if (isstruct(point)) {
            point = point.origin;
        }
        self function_77320e794d35465a("p2p", "goalPoint", point);
        dist = distancesquared(self.origin, point);
        time = undefined;
        if (dist > 0) {
            time = function_cbc170d40c70cddf(self.origin, point, speed);
        }
        key = function_906e53c2fb9d3f9c("p2p", "targetTime");
        if (isdefined(time)) {
            self function_77320e794d35465a(key, time);
        } else {
            self function_77320e794d35465a(key, 0.2);
        }
        while (distancesquared(self.origin, point) > squared(200)) {
            waitframe();
        }
    }
    self notify("path_finished");
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b5
// Size: 0x50
function function_df5d237db38291ac(hittype) {
    if (hittype == "hitveharmorbreak") {
        level notify("armorplate_broken", self);
    }
    if (isplayer(self)) {
        if (issharedfuncdefined("damage", "updateDamageFeedback")) {
            self [[ getsharedfunc("damage", "updateDamageFeedback") ]](hittype);
        }
    }
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90c
// Size: 0x193
function function_6a0b2a08499a9842() {
    if (isdefined(self.var_fe321e008e65c319)) {
        self.var_fe321e008e65c319.var_71c1911e983f326d = undefined;
    }
    origin = self.origin + (0, 0, 40);
    foreach (rider in self.riders) {
        if (!isalive(rider)) {
            continue;
        }
        rider.do_immediate_ragdoll = 1;
        rider.ragdoll_immediate = 1;
        if (!istrue(rider._blackboard.var_3d633e73bbcdc23d)) {
            anim_pos = namespace_4ff41449ab14a3a0::anim_pos(self, rider.vehicle_position);
            rider namespace_fbfdc656dd3cbd79::requestentervehicle(self, 0, rider.vehicle_position, anim_pos);
        }
        if (isdefined(rider._blackboard) && isdefined(rider._blackboard.chosenvehicleanimpos)) {
            if (istrue(rider._blackboard.var_41c9f8c7891f19da)) {
                rider._blackboard.var_80912ec8ade08716 = 1;
            }
        }
        rider dodamage(rider.health + 100, self.origin + (0, 0, -100), undefined, undefined, "MOD_EXPLOSIVE");
    }
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xaa6
// Size: 0x118
function function_6a9574988f246f34(vehicle, var_7f2253bd1b8cfa5e, var_90a4404fceed797f, endnotify) {
    vehicle endon("death");
    level endon("game_ended");
    vehicle endon("stop_chasing");
    if (isdefined(endnotify)) {
        vehicle endon(endnotify);
    }
    var_6ef53048a884f4e0 = 0;
    endtime = undefined;
    var_4f951428959d4d04 = cos(91);
    while (1) {
        dot = anglestoup(vehicle.angles)[2];
        if (dot <= var_4f951428959d4d04) {
            if (isdefined(var_7f2253bd1b8cfa5e)) {
                thread [[ var_7f2253bd1b8cfa5e ]](vehicle);
            }
            timedout = 0;
            endtime = gettime() + 3000;
            while (1) {
                if (vectordot(anglestoup(vehicle.angles), (0, 0, 1)) > var_4f951428959d4d04) {
                    break;
                }
                if (gettime() >= endtime) {
                    timedout = 1;
                    break;
                }
                waitframe();
            }
            endtime = undefined;
            if (isdefined(var_90a4404fceed797f)) {
                thread [[ var_90a4404fceed797f ]](vehicle, timedout);
            }
        }
        wait(1);
    }
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc5
// Size: 0x222
function function_a3775811155639ea() {
    self endon("death");
    self endon("stop_chasing");
    var_94348dd22d1c22e0 = cos(25);
    while (1) {
        wait(0.05);
        var_d4f1557b16691afb = [];
        foreach (vehicle in level.var_6e5ff6cae14c4081) {
            if (!isalive(vehicle)) {
                continue;
            }
            if (vehicle == self) {
                continue;
            }
            if (istrue(vehicle.pausing)) {
                continue;
            }
            if (distancesquared(self.origin, vehicle.origin) < squared(128)) {
                self.pausing = 1;
                self vehicle_setspeedimmediate(20, 150, 150);
                /#
                    if (getdvar(@"hash_ec592c9ed8224d75") != "<unknown string>") {
                        print3d(self.origin + (0, 0, 40), "<unknown string>", (1, 1, 1), 1, 1, 20, 1);
                    }
                #/
                wait(2);
                self.pausing = undefined;
                self resumespeed(150);
            } else if (distancesquared(self.origin, vehicle.origin) < squared(250) && within_fov(self.origin, self.angles, vehicle.origin, var_94348dd22d1c22e0)) {
                self.pausing = 1;
                self vehicle_setspeedimmediate(20, 150, 150);
                /#
                    if (getdvar(@"hash_ec592c9ed8224d75") != "<unknown string>") {
                        print3d(self.origin + (0, 0, 40), "<unknown string>", (1, 1, 1), 1, 1, 20, 1);
                    }
                #/
                wait(2);
                self.pausing = undefined;
                self resumespeed(150);
            }
        }
    }
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdee
// Size: 0x5e
function function_be6d24ea93bcadf7(vehicle) {
    newpath = function_3a2f47ea8b6a51b3(vehicle.origin, 16, 1024);
    while (isdefined(vehicle) && vehicle vehicle_getspeed() < 2) {
        thread function_69695f8c7ed9c3f6(newpath, 300);
        self waittill("path_finished");
    }
    self notify("path_updated");
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe53
// Size: 0x3c
function function_cba4ff426a2f58ab(pos, delay) {
    self endon("death");
    if (isdefined(delay)) {
        wait(delay);
    } else {
        wait(2);
    }
    self.vehicle_position = pos;
    self.script_startingposition = pos;
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe96
// Size: 0x4e
function function_1da2c31423c2676a(veh_speed) {
    if (!isdefined(self.riders)) {
        self.riders = [];
    }
    if (!isdefined(self.unloadque)) {
        self.unloadque = [];
    }
    self function_d2e41c7603ba7697("p2p");
    thread function_4808177c29f56fb9();
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeeb
// Size: 0x1db
function function_8f40a2c8678f8304(start_point, end_point, speed, var_f388271f11f8deda, var_a967646668185a6d, var_eefdc14dd5275fd0) {
    var_eefdc14dd5275fd0 = function_53c4c53197386572(var_eefdc14dd5275fd0, level.var_2814a8f25a392eaa);
    /#
        assert(isdefined(level.var_2814a8f25a392eaa), "scriptscp_mpvehiclesvehicle::vehicle_findNavmeshLayer must find a navmesh layer before this function is called. Or maybe this level has no navmesh?");
    #/
    var_acb8205b4eae2fa0 = undefined;
    if (!isdefined(var_f388271f11f8deda)) {
        var_f388271f11f8deda = 1;
    }
    if (!isdefined(var_a967646668185a6d)) {
        var_a967646668185a6d = 0;
    }
    if (distancesquared(start_point, end_point) < 62500) {
        var_acb8205b4eae2fa0 = [0:getclosestpointonnavmesh(end_point, var_eefdc14dd5275fd0)];
    } else {
        var_acb8205b4eae2fa0 = findpathcustom(start_point, getclosestpointonnavmesh(end_point, var_eefdc14dd5275fd0), 1, 1, var_eefdc14dd5275fd0);
        if (isdefined(self.var_240dc8d5c31629d2) && var_acb8205b4eae2fa0.size >= 3) {
            pathindex = 0;
            while (pathindex < var_acb8205b4eae2fa0.size - 1) {
                if (distance2dsquared(var_acb8205b4eae2fa0[pathindex], var_acb8205b4eae2fa0[pathindex + 1]) < self.var_240dc8d5c31629d2 * self.var_240dc8d5c31629d2) {
                    var_acb8205b4eae2fa0 = array_remove_index(var_acb8205b4eae2fa0, pathindex + 1, 0);
                } else {
                    pathindex++;
                }
            }
        }
        var_acb8205b4eae2fa0[0] = undefined;
        /#
            foreach (index, node in var_acb8205b4eae2fa0) {
                thread namespace_f2ffc0540883e1ad::drawsphere(node, 16, 10, (1, 1, 1));
                if (isdefined(var_acb8205b4eae2fa0[index + 1])) {
                    thread namespace_f2ffc0540883e1ad::drawline(node, var_acb8205b4eae2fa0[index + 1], 10, (0, 1, 0));
                }
            }
            sphere(end_point, 16, (1, 1, 1), 0, 2);
        #/
    }
    if (var_acb8205b4eae2fa0.size >= 1) {
        return function_aa85eb39828a4d80(var_acb8205b4eae2fa0, speed, var_f388271f11f8deda, var_a967646668185a6d);
    }
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10cd
// Size: 0x21f
function function_aa85eb39828a4d80(var_acb8205b4eae2fa0, speed, var_f388271f11f8deda, var_a967646668185a6d) {
    self notify("path_updated");
    self endon("path_updated");
    self endon("kill_thread_since_spotted");
    self endon("death");
    self endon("unloaded");
    if (!isdefined(speed) && !isdefined(self.var_5bbf95f73f01706e)) {
        /#
            assertmsg("vehicleP2P_gotoPath - No speed defined, and no AUTO_* Config Key detected!");
        #/
        return "path_blocked";
    }
    if (istrue(var_f388271f11f8deda) && isdefined(speed)) {
        function_b3b7d0915dc445c7(speed);
    }
    last_point = undefined;
    if (istrue(var_a967646668185a6d)) {
        last_point = namespace_3c37cb17ade254d::function_350e192b13bea45c(var_acb8205b4eae2fa0);
    }
    foreach (point in var_acb8205b4eae2fa0) {
        var_8ffa366ec68f0c8b = 62500;
        if (isdefined(self.var_8ffa366ec68f0c8b)) {
            var_8ffa366ec68f0c8b = self.var_8ffa366ec68f0c8b;
        }
        if (distancesquared(self.origin, point) < var_8ffa366ec68f0c8b) {
            continue;
        }
        self function_77320e794d35465a("p2p", "goalPoint", point);
        if (istrue(var_a967646668185a6d) && point == last_point) {
            self function_77320e794d35465a("p2p", "brakeAtGoal", 1);
        }
        self.goalpoint = point;
        if (!istrue(var_f388271f11f8deda) && isdefined(speed)) {
            dist = distance(self.origin, point);
            time = undefined;
            if (dist > 0) {
                time = function_cbc170d40c70cddf(self.origin, point, speed);
            }
            key = function_906e53c2fb9d3f9c("p2p", "targetTime");
            if (isdefined(time)) {
                self function_77320e794d35465a(key, time);
            } else {
                self function_77320e794d35465a(key, 0.2);
            }
        }
        result = waittill_any_return_2("near_goal", "path_blocked");
        if (result == "path_blocked") {
            return "path_blocked";
        }
    }
    return "near_goal";
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f4
// Size: 0x35
function function_b3b7d0915dc445c7(speed) {
    manualspeed = function_906e53c2fb9d3f9c("p2p", "manualSpeed");
    self function_77320e794d35465a(manualspeed, namespace_3c37cb17ade254d::mph_to_ips(speed));
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1330
// Size: 0x14c
function function_9804c82501de981b(newpath, speed) {
    self endon("death");
    self notify("path_updated");
    self endon("path_updated");
    foreach (point in newpath) {
        while (istrue(self.pausing)) {
            wait(0.05);
        }
        if (isstruct(point)) {
            point = point.origin;
        }
        self function_77320e794d35465a("p2p", "goalPoint", point);
        dist = distancesquared(self.origin, point);
        time = undefined;
        if (dist > 0) {
            time = get_duration_between_points(self.origin, point, speed);
        }
        key = function_906e53c2fb9d3f9c("p2p", "targetTime");
        if (isdefined(time)) {
            self function_77320e794d35465a(key, time);
        } else {
            self function_77320e794d35465a(key, 0.2);
        }
        while (distancesquared(self.origin, point) > squared(200)) {
            waitframe();
        }
    }
    self notify("path_finished");
}

// Namespace namespace_a1044864694a4aae/namespace_9246f10206f50768
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1483
// Size: 0x64
function get_duration_between_points(startpos, endpos, speed, convert) {
    dist = distance(startpos, endpos);
    if (istrue(convert)) {
        dist = dist * 0.0568182;
    }
    var_58824a41b5315792 = dist / speed;
    if (var_58824a41b5315792 < 0.05) {
        var_58824a41b5315792 = 0.05;
    }
    return var_58824a41b5315792;
}
