// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_5def7af2a9f04234;
#using scripts\mp\flags.gsc;
#using script_48814951e916af89;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_4bac13d511590220;
#using script_1c47017ba325709a;
#using script_1174abedbefe9ada;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using script_24e4405cf93f20ed;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;

#namespace namespace_9e3d69dfe999c1f;

// Namespace namespace_9e3d69dfe999c1f/namespace_d2c35aa0ab3fe2d2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de
// Size: 0xbd
function function_a9e26388b8dc22b3() {
    /#
        assert(!isdefined(level.var_ad58c9c70a5db5bb));
    #/
    level.var_ad58c9c70a5db5bb = [];
    namespace_4b0406965e556711::gameflaginit("vehicle_patrol_paths_selected", 0);
    level.var_5731a15ecc971a53 = getdvarint(@"hash_71a6a8a8255b301f", 30);
    for (var_e8f728e3350d6b62 = 1; 1; var_e8f728e3350d6b62++) {
        pathnodes = getstructarray("vehiclePatrol_" + var_e8f728e3350d6b62, "script_noteworthy");
        if (pathnodes.size == 0) {
            break;
        }
        level.var_ad58c9c70a5db5bb[level.var_ad58c9c70a5db5bb.size] = namespace_bfef6903bca5845d::function_9edcf99159abb0b(pathnodes[0], 1);
    }
    /#
        if (0) {
            level thread function_5ae87677f3f767f0();
        }
    #/
    function_7bb5daf93766fb3d();
}

// Namespace namespace_9e3d69dfe999c1f/namespace_d2c35aa0ab3fe2d2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a2
// Size: 0x298
function function_7bb5daf93766fb3d() {
    /#
        assert(isdefined(level.var_ad58c9c70a5db5bb));
    #/
    level.var_f2c3218ec87ba30f = [];
    switch (level.mapname) {
    case #"hash_57eba45b7ddbdcd6":
    case #"hash_63326ac3e12f8da0":
        groups = [0:[0:0], 1:[0:1], 2:[0:2, 1:3, 2:4], 3:[0:5, 1:6, 2:7], 4:[0:5, 1:8, 2:9], 5:[0:10]];
        foreach (group in groups) {
            var_a82af88aa7f18b2c = 0;
            foreach (member in group) {
                if (isdefined(level.var_f2c3218ec87ba30f[member])) {
                    var_a82af88aa7f18b2c = 1;
                    break;
                }
            }
            if (var_a82af88aa7f18b2c) {
                continue;
            }
            spawnindex = random(group);
            if (isdefined(level.var_ad58c9c70a5db5bb[spawnindex])) {
                level.var_f2c3218ec87ba30f[spawnindex] = 1;
            }
        }
        break;
    default:
        foreach (var_e8f728e3350d6b62, pathdata in level.var_ad58c9c70a5db5bb) {
            level.var_f2c3218ec87ba30f[var_e8f728e3350d6b62] = 1;
        }
        break;
    }
    level.var_9e7adb59a0cb3e3d = [];
    foreach (i, pathstruct in level.var_ad58c9c70a5db5bb) {
        if (!isdefined(level.var_f2c3218ec87ba30f[i])) {
            level.var_9e7adb59a0cb3e3d[level.var_9e7adb59a0cb3e3d.size] = pathstruct;
        }
    }
    namespace_4b0406965e556711::gameflagset("vehicle_patrol_paths_selected");
}

// Namespace namespace_9e3d69dfe999c1f/namespace_d2c35aa0ab3fe2d2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x541
// Size: 0xec
function function_cbae2bd62d2e7086() {
    foreach (var_e8f728e3350d6b62, value in level.var_f2c3218ec87ba30f) {
        function_8263f9488230c012(level.var_ad58c9c70a5db5bb[var_e8f728e3350d6b62], var_e8f728e3350d6b62, "veh9_techo_rebel_armor");
    }
    var_f228e29ae46b2fe6 = 0;
    /#
        if (0) {
            var_f228e29ae46b2fe6 = 1;
        }
    #/
    if (!var_f228e29ae46b2fe6) {
        level.var_ad58c9c70a5db5bb = undefined;
    } else {
        foreach (var_e8f728e3350d6b62, pathdata in level.var_ad58c9c70a5db5bb) {
            pathdata.spawned = isdefined(level.var_f2c3218ec87ba30f[var_e8f728e3350d6b62]);
        }
    }
}

// Namespace namespace_9e3d69dfe999c1f/namespace_d2c35aa0ab3fe2d2
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x634
// Size: 0x2cd
function private function_8263f9488230c012(pathdata, var_e8f728e3350d6b62, vehicletype) {
    if (!namespace_1f188a13f7e79610::function_fa537f1ab52a76d1(vehicletype)) {
        return;
    }
    pathdata.direction = cointoss() * 2 - 1;
    pathdata.index = randomint(pathdata.path.size);
    var_82cd8d2bc3998d62 = pathdata.path[pathdata.index];
    if (isdefined(level.var_a22353e84020888d)) {
        for (i = 0; i < pathdata.path.size - 1; i++) {
            pathdata.index = (pathdata.index + 1) % pathdata.path.size;
            var_82cd8d2bc3998d62 = pathdata.path[pathdata.index];
            var_67e2c244a6e8d0bf = sortbydistance(level.var_a22353e84020888d, var_82cd8d2bc3998d62.origin)[0];
            if (distance(var_67e2c244a6e8d0bf.origin, var_82cd8d2bc3998d62.origin) > 4000) {
                break;
            }
        }
    }
    var_c5e7fce963586ec0 = var_82cd8d2bc3998d62.origin;
    vehicle = function_3bdd3d9028bada3f(var_c5e7fce963586ec0, var_82cd8d2bc3998d62.angles, pathdata.direction, vehicletype, var_e8f728e3350d6b62);
    if (!isdefined(vehicle)) {
        return;
    }
    if (namespace_bfef6903bca5845d::function_8b178e05801f2daf(pathdata.path)) {
        foreach (rider in vehicle.riders) {
            namespace_bfef6903bca5845d::function_c9b9fe3f7f739586(rider);
        }
    }
    if (!isdefined(level.var_a22353e84020888d)) {
        level.var_a22353e84020888d = [];
    }
    level.var_a22353e84020888d[level.var_a22353e84020888d.size] = var_82cd8d2bc3998d62;
    vehicle namespace_9246f10206f50768::function_1da2c31423c2676a(level.var_5731a15ecc971a53);
    vehicle function_77320e794d35465a("p2p", "brakeAtGoal", 0);
    vehicle function_77320e794d35465a("p2p", "goalThreshold", level.var_5731a15ecc971a53 * 4);
    vehicle function_77320e794d35465a("p2p", "steeringMultiplier", 2.5);
    vehicle function_77320e794d35465a("p2p", "stuckTime", 4);
    vehicle.pathdata = pathdata;
    vehicle thread namespace_9246f10206f50768::function_c3889abf5cd6abbf(pathdata, level.var_5731a15ecc971a53, &function_8667ff5c61e579ed);
    vehicle thread function_205a864c4dddc0ea(pathdata);
    /#
        if (0) {
            vehicle thread function_1c78f4e319f7100e();
        }
    #/
}

// Namespace namespace_9e3d69dfe999c1f/namespace_d2c35aa0ab3fe2d2
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x908
// Size: 0x211
function private function_3bdd3d9028bada3f(origin, angles, direction, vehicletype, var_e8f728e3350d6b62) {
    var_171f90b9c4c76d44 = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(origin);
    if (!namespace_37f0fb6355a4618a::function_faa6481e65f14ade(var_171f90b9c4c76d44)) {
        return;
    }
    var_b4d3f717373af2bb = namespace_43bf74a2ee9234c0::function_236a093e8a0ec040(vehicletype);
    spawners = namespace_43bf74a2ee9234c0::function_f260b1cef943f1ab(vehicletype, 5, var_b4d3f717373af2bb, origin, var_171f90b9c4c76d44, "medium");
    riders = namespace_43bf74a2ee9234c0::function_4ad6c25d6754f697(spawners, 5, undefined, "medium", "vehiclePatrol", "patrol_" + var_e8f728e3350d6b62, "team_hundred_ninety_five", undefined, vehicletype);
    if (!isdefined(riders) || riders.size == 0) {
        return;
    }
    foreach (rider in riders) {
        rider.var_c7845d939c783cef = 1;
    }
    spawndata = spawnstruct();
    spawndata.origin = origin;
    spawndata.angles = ter_op(direction > 0, angles, angles + (0, 180, 0));
    spawndata.spawntype = "GAME_MODE";
    spawndata.team = "team_hundred_ninety_five";
    spawndata.showheadicon = 1;
    spawndata.var_f16652e1462a3739 = 1;
    var_ee8da5624236dc89 = spawnstruct();
    vehicle = namespace_1f188a13f7e79610::vehicle_spawn(vehicletype, spawndata, var_ee8da5624236dc89);
    if (!isdefined(vehicle)) {
        return;
    }
    vehicle.var_eb504fc7e1cfeb4c = getdvarint(@"hash_9e4fff9024bd3a06", 1);
    waitframe();
    vehicle namespace_1f188a13f7e79610::function_f92faaaf5c5077c6(riders, 1, 1);
    if (isdefined(level.var_6e5ff6cae14c4081)) {
        level.var_6e5ff6cae14c4081[level.var_6e5ff6cae14c4081.size] = vehicle;
    }
    return vehicle;
}

// Namespace namespace_9e3d69dfe999c1f/namespace_d2c35aa0ab3fe2d2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb21
// Size: 0x240
function private function_205a864c4dddc0ea(pathdata) {
    self endon("death");
    while (!isdefined(self.var_fe321e008e65c319)) {
        waitframe();
    }
    self.var_d833f36f7bb5bf66 = self.origin;
    self.var_84fb7053ab953427 = gettime();
    self.var_3d3dbb75643cce31 = 1;
    var_1f328b9bebd73213 = gettime();
    lasthealth = self.health;
    foreach (rider in self.riders) {
        thread function_9ec2524e968c9eb2(rider, rider == self.var_fe321e008e65c319);
    }
    while (!istrue(self.var_5b28eb17c0b5497)) {
        if (isdefined(self.var_3d3dbb75643cce31) && self.var_3d3dbb75643cce31 <= 0 || lasthealth - self.health > 25) {
            /#
                if (0) {
                    print3d(self.origin + (0, 0, 100), "<unknown string>", (1, 1, 1), 1, 4, 100000);
                }
            #/
            thread function_ab0ee2215eb51dd5("combat");
            return;
        }
        if (gettime() - var_1f328b9bebd73213 > 3000) {
            var_1f328b9bebd73213 = gettime();
            lasthealth = self.health;
        }
        if (distancesquared(self.origin, self.var_d833f36f7bb5bf66) > 22500) {
            self.var_84fb7053ab953427 = gettime();
            self.var_d833f36f7bb5bf66 = self.origin;
        } else if (gettime() - self.var_84fb7053ab953427 > 12000 || isdefined(self.goalpoint) && namespace_7789f919216d38a2::radiation_isInRadiation(self.goalpoint)) {
            /#
                if (0) {
                    print3d(self.origin + (0, 0, 100), "<unknown string>", (1, 1, 1), 1, 4, 100000);
                }
            #/
            function_8667ff5c61e579ed();
        }
        waitframe();
    }
}

// Namespace namespace_9e3d69dfe999c1f/namespace_d2c35aa0ab3fe2d2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd68
// Size: 0x5d
function private function_9ec2524e968c9eb2(rider, var_17915db3de174953) {
    self endon("death");
    self endon("unloaded");
    rider waittill("death");
    if (!isdefined(self) || !isdefined(self.var_3d3dbb75643cce31)) {
        return;
    }
    self.var_3d3dbb75643cce31 = self.var_3d3dbb75643cce31 - ter_op(var_17915db3de174953, 2, 1);
}

// Namespace namespace_9e3d69dfe999c1f/namespace_d2c35aa0ab3fe2d2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcc
// Size: 0xf6
function function_8667ff5c61e579ed() {
    if (isdefined(self.var_9c986f0fa4fce8ea) && gettime() - self.var_9c986f0fa4fce8ea > 10000) {
        /#
            if (0) {
                print3d(self.origin + (0, 0, 100), "<unknown string>", (1, 1, 1), 1, 4, 100000);
            }
        #/
        thread function_ab0ee2215eb51dd5();
        return;
    }
    self.var_9c986f0fa4fce8ea = gettime();
    self.var_84fb7053ab953427 = gettime();
    self.var_d833f36f7bb5bf66 = self.origin;
    self.pathdata.direction = self.pathdata.direction * -1;
    namespace_9246f10206f50768::function_e8730cc0c5eac096(self.pathdata);
    thread namespace_9246f10206f50768::function_c3889abf5cd6abbf(self.pathdata, level.var_5731a15ecc971a53, &function_8667ff5c61e579ed);
}

// Namespace namespace_9e3d69dfe999c1f/namespace_d2c35aa0ab3fe2d2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xec9
// Size: 0x23
function private function_865676e356a22103() {
    return distancesquared(self.origin, getclosestpointonnavmesh(self.origin)) < 10000;
}

// Namespace namespace_9e3d69dfe999c1f/namespace_d2c35aa0ab3fe2d2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef4
// Size: 0x92
function function_ab0ee2215eb51dd5(exittype) {
    self.var_9c986f0fa4fce8ea = undefined;
    self.var_84fb7053ab953427 = undefined;
    self.var_d833f36f7bb5bf66 = undefined;
    self.pathdata = undefined;
    self.var_3d3dbb75643cce31 = undefined;
    self.var_5b28eb17c0b5497 = 1;
    self notify("newFollowPath");
    if (!function_865676e356a22103()) {
        self.burndowntime = 4;
        namespace_dace9d390bc4a290::function_357783d7c1d96273();
        return;
    }
    self endon("death");
    namespace_cbe993018617a21d::function_7d8f81a94dc08a15(1, exittype);
    namespace_1fbd40990ee60ede::function_887b4e2cbe3ab92c();
    namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(self, "neutral");
}

// Namespace namespace_9e3d69dfe999c1f/namespace_d2c35aa0ab3fe2d2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf8d
// Size: 0xa2
function function_6994a068636ec457() {
    /#
        setdvar(@"hash_708c27714785445c", 0);
        while (1) {
            wait(1);
            if (getdvarint(@"hash_708c27714785445c", 0) == 1) {
                setdvar(@"hash_708c27714785445c", 0);
                angles = level.players[0].angles;
                origin = level.players[0].origin + anglestoforward(angles) * 400;
                function_3bdd3d9028bada3f(origin, angles, -1, "<unknown string>", 0);
            }
        }
    #/
}

// Namespace namespace_9e3d69dfe999c1f/namespace_d2c35aa0ab3fe2d2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1036
// Size: 0x246
function private function_5ae87677f3f767f0() {
    /#
        wait(20);
        if (!isdefined(level.var_ad58c9c70a5db5bb)) {
            return;
        }
        foreach (pathdata in level.var_ad58c9c70a5db5bb) {
            for (i = 0; i < pathdata.path.size; i++) {
                startnode = pathdata.path[i];
                endnode = pathdata.path[(i + 1) % pathdata.path.size];
                line(startnode.origin, endnode.origin, ter_op(istrue(pathdata.spawned), (0, 1, 0), (0, 0, 1)), 1, 0, 100000);
            }
        }
        while (isdefined(level.var_ad58c9c70a5db5bb)) {
            foreach (var_e8f728e3350d6b62, pathdata in level.var_ad58c9c70a5db5bb) {
                foreach (node in pathdata.path) {
                    if (isdefined(level.players[0]) && isdefined(level.players[0].origin) && distancesquared(node.origin, level.players[0].origin) < 9000000) {
                        print3d(node.origin + (0, 0, 10 * var_e8f728e3350d6b62), "<unknown string>" + var_e8f728e3350d6b62, (1, 1, 1));
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_9e3d69dfe999c1f/namespace_d2c35aa0ab3fe2d2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1283
// Size: 0x16a
function private function_1c78f4e319f7100e() {
    /#
        self endon("<unknown string>");
        start = self.origin + (0, 0, 50);
        end = self.origin + anglestoforward(self.angles) * 400 + (0, 0, 50);
        prevpos = self.origin;
        while (1) {
            wait(1);
            line(start, end, (1, 1, 1), 1, 0, 20);
            sphere(start, 100, (1, 1, 1), 0, 20);
            line(self.origin + (0, 0, 200), self.origin + (0, 0, 800), (1, 0, 0), 1, 0, 20);
            line(self.origin, prevpos, (1, 0, 1), 1, 0, 10000);
            if (isdefined(self.goalpoint)) {
                line(self.origin, self.goalpoint, (0, 1, 0), 1, 0, 20);
            }
            prevpos = self.origin;
        }
    #/
}
