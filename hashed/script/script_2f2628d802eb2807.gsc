// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\math.gsc;
#using script_2ed63158b46a6d6f;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\mp\vehicles\damage.gsc;
#using script_79d4b1c751a51f03;
#using script_48814951e916af89;
#using scripts\common\vehicle_aianim.gsc;
#using scripts\vehicle\vehicle_common.gsc;
#using scripts\cp_mp\killstreaks\chopper_gunner.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\common\vehicle_code.gsc;

#namespace namespace_673092b35aa65d1c;

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd
// Size: 0x47
function function_e09936350b8d90fe() {
    data = spawnstruct();
    data.spawnheli = &function_2d905b603e7888c9;
    data.var_e0fd93cddc4b8912 = &function_595d4ebd73e6b933;
    data.flyaway = &function_5eb66c5c1382fed;
    return data;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41c
// Size: 0x9b
function function_2d905b603e7888c9(var_7e5a592e28788406) {
    heli = function_b232793fe47c01b9();
    heli.var_7e5a592e28788406 = var_7e5a592e28788406;
    heli.task = self;
    heli thread function_282ffb050875ade6(var_7e5a592e28788406);
    heli thread function_f21d965808c268bb();
    namespace_3bbb5a98b932c46f::function_e00b77a9cb4d8322(heli);
    heli.flaresreservecount = 1;
    heli.flareslive = [];
    if (namespace_3c37cb17ade254d::issharedfuncdefined("flares", "handleIncomingStinger")) {
        heli thread [[ namespace_3c37cb17ade254d::getsharedfunc("flares", "handleIncomingStinger") ]](&function_8fe1775245b13b6f);
    }
    return heli;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4bf
// Size: 0x1d5
function private function_b232793fe47c01b9() {
    node = getclosest((self.vehicle.origin + self.end.origin) * 0.5, level.var_77aa416377054823);
    var_c229d93c0bb4f8e8 = spawnstruct();
    var_c229d93c0bb4f8e8.origin = node.origin;
    var_c229d93c0bb4f8e8.angles = node.angles;
    var_c229d93c0bb4f8e8.vehicletype = "veh_apache_mp_phys";
    var_c229d93c0bb4f8e8.modelname = "veh9_mil_air_heli_ahotel64_mp";
    var_c229d93c0bb4f8e8.targetname = "boatdrive_apache";
    var_ee8da5624236dc89 = spawnstruct();
    heli = namespace_f64231d5b7a2c3c4::_spawnvehicle(var_c229d93c0bb4f8e8, var_ee8da5624236dc89);
    heli.vehiclename = "veh_apache_mp_phys";
    heli.maxhealth = getdvarint(@"hash_3e5661644a24771e", 10000);
    heli.health = heli.maxhealth;
    heli.team = "team_hundred_ninety_five";
    heli setvehicleteam("team_hundred_ninety_five");
    namespace_f64231d5b7a2c3c4::vehicle_tracking_registerinstance(heli, undefined, heli.team);
    heli namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage(1);
    heli.var_9882cd795c6bfaa = 1;
    heli namespace_ad22b9cf6a2b30d::set_pre_mod_damage_callback("veh_apache_mp_phys", &function_57314b27f4592824);
    heli namespace_ad22b9cf6a2b30d::set_post_mod_damage_callback("veh_apache_mp_phys", &function_499e02474dfc9171);
    heli namespace_ad22b9cf6a2b30d::set_death_callback("veh_apache_mp_phys", &function_e6cbc6847a8fb80b);
    heli function_247ad6a91f6a4ffe(1);
    heli.var_de315b064bb20d9 = node;
    if (getdvarint(@"hash_3061dc07aba9108", 1)) {
        heli thread namespace_7afff53e7b73476b::function_ff7b51833a73e61();
    }
    return heli;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x69c
// Size: 0x15e
function private function_7512e3d88c4083fa(heli, var_cdbb4a9588abef59) {
    origin = ter_op(isdefined(level.var_f0872e42daf6d4d5), level.var_f0872e42daf6d4d5, heli.origin);
    aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("ar");
    agent = namespace_bfef6903bca5845d::function_ea94a8bf24d3c5ef(aitype, origin, heli.angles, "absolute", "mission", "vehicleDriveHeliDriver", undefined, undefined, undefined, self.node.poi, 1, undefined, 0);
    if (!isdefined(agent)) {
        /#
            println("task_ended");
        #/
        return undefined;
    }
    var_b87e69df003b39f5 = heli namespace_4ff41449ab14a3a0::get_availablepositions();
    agent.script_startingposition = var_cdbb4a9588abef59;
    pos = heli namespace_4ff41449ab14a3a0::choose_vehicle_position(agent, var_b87e69df003b39f5, 0);
    agent namespace_fbfdc656dd3cbd79::entervehicle(heli, 1, pos, namespace_4ff41449ab14a3a0::anim_pos(heli, pos.vehicle_position));
    agent.vehicle_position = pos.vehicle_position;
    agent.goalradius = 10000;
    agent.maxsightdistsqrd = squared(10000);
    agent function_9215ce6fc83759b9(10000);
    agent.ignoreall = 1;
    return agent;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x802
// Size: 0x20
function function_c6366a8fc111f210(heli) {
    heli waittill("death");
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x829
// Size: 0x135
function function_1659089ce673c063() {
    turret = spawnturret("misc_turret", self gettagorigin("tag_turret"), "chopper_gunner_turret_ballistics_dmz");
    turret setmodel("veh9_mil_air_heli_ahotel64_turret");
    turret show();
    turret.angles = self.angles;
    turret.disabled = 0;
    turret.targetstate = undefined;
    turret linkto(self, "tag_turret");
    turret setturretmodechangewait(0);
    turret setmode("manual");
    turret setdefaultdroppitch(45);
    turret.team = self.team;
    turret.owner = self;
    turret setturretteam(self.team);
    turret setentityowner(self);
    turret.targetent = spawn("script_origin", turret.origin);
    turret settargetentity(turret.targetent);
    self.turret = turret;
    turret.heli = self;
    turret thread function_c6366a8fc111f210(self);
    turret.targetent thread function_c6366a8fc111f210(self);
    return turret;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x966
// Size: 0x79
function function_61650f275ef0266f(tag) {
    var_b8ee7ddd93755f86 = spawn("script_model", self gettagorigin(tag));
    var_b8ee7ddd93755f86 setmodel("ks_chopper_gunner_turret_mp");
    var_b8ee7ddd93755f86 show();
    var_b8ee7ddd93755f86.angles = self.angles;
    var_b8ee7ddd93755f86 linkto(self, tag);
    var_b8ee7ddd93755f86 setotherent(self);
    var_b8ee7ddd93755f86.heli = self;
    var_b8ee7ddd93755f86 thread function_c6366a8fc111f210(self);
    return var_b8ee7ddd93755f86;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e7
// Size: 0x84
function function_4e9fce9d930cb20b(origin) {
    forwarddot = vectordot(vectornormalize(origin - self.origin), anglestoforward(self.angles));
    var_36a24facde9cd6ec = vectordot(vectornormalize(origin - self.origin), -1 * anglestoup(self.angles));
    return forwarddot > 0.258819 && var_36a24facde9cd6ec > 0 || var_36a24facde9cd6ec > 0.95;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa73
// Size: 0x72
function function_126e0a76e7532527(origin) {
    forwarddot = vectordot(vectornormalize(origin - self.origin), anglestoforward(self.angles));
    var_36a24facde9cd6ec = vectordot(vectornormalize(origin - self.origin), -1 * anglestoup(self.angles));
    return forwarddot > 0.4;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaed
// Size: 0x34
function function_6034cfedc8242fd6() {
    dist = distance(self.var_7e5a592e28788406.origin, self.origin);
    return dist < 10000;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb29
// Size: 0x98e
function function_f21d965808c268bb() {
    self endon("death");
    self endon("flyaway");
    function_1659089ce673c063();
    self.var_bdec9a74b3b2a503 = function_61650f275ef0266f("tag_gun_l");
    self.var_2d5a32b6a40fda8c = function_61650f275ef0266f("tag_gun_r");
    firerate = 0.125;
    accumulatedtime = 0;
    totaltime = 0;
    var_3180e2519441f60a = 40;
    var_9456898cef04f9f8 = var_3180e2519441f60a * firerate;
    var_6faff8a055f809e8 = var_9456898cef04f9f8 / 3;
    var_f1963ad9c17c070f = var_9456898cef04f9f8 - var_6faff8a055f809e8;
    var_7272f3c81cad93a = self.var_bdec9a74b3b2a503;
    var_159fea52c5ffdd4b = getdvarfloat(@"hash_7301b4fb9b20523d", 375);
    var_4b795b1673603831 = getdvarfloat(@"hash_1e5806e5fc11f967", 1.33);
    while (self.health > 0) {
        if (!isdefined(self.var_7e5a592e28788406)) {
            return;
        }
        results = ray_trace(self.origin, self.var_7e5a592e28788406.origin, [0:self, 1:self.turret, 2:self.var_bdec9a74b3b2a503, 3:self.var_2d5a32b6a40fda8c, 4:self.var_7e5a592e28788406]);
        if (distance(results["position"], self.var_7e5a592e28788406.origin) < 500) {
            self setlookatent(self.var_7e5a592e28788406);
            var_b46da0e82ed99618 = function_4e9fce9d930cb20b(self.var_7e5a592e28788406.origin);
            var_7f424c65b880f8ee = function_126e0a76e7532527(self.var_7e5a592e28788406.origin);
            if (!var_b46da0e82ed99618 && !var_7f424c65b880f8ee) {
                waitframe();
                continue;
            }
            shootturret = undefined;
            if (var_b46da0e82ed99618 && !var_7f424c65b880f8ee) {
                shootturret = 1;
            } else if (!var_b46da0e82ed99618 && var_7f424c65b880f8ee) {
                shootturret = 0;
            } else {
                shootturret = randomfloat(1) > 0.25;
            }
            if (shootturret) {
                shots = 0;
                accumulatedtime = 0;
                totaltime = 0;
                self.turret.targetent.origin = self.var_7e5a592e28788406.origin;
                velocity = self.var_7e5a592e28788406 vehicle_getvelocity();
                var_e0570cd5d887cc29 = self.var_7e5a592e28788406.origin + velocity * 1.75;
                while (shots < var_3180e2519441f60a) {
                    if (!isdefined(self.var_7e5a592e28788406)) {
                        return;
                    }
                    if (totaltime > 5) {
                        break;
                    }
                    if (function_4e9fce9d930cb20b(self.var_7e5a592e28788406.origin)) {
                        results = ray_trace(self.origin, self.var_7e5a592e28788406.origin, [0:self, 1:self.turret, 2:self.var_bdec9a74b3b2a503, 3:self.var_2d5a32b6a40fda8c, 4:self.var_7e5a592e28788406]);
                        if (distance(results["position"], self.var_7e5a592e28788406.origin) < 800) {
                            if (totaltime < var_4b795b1673603831) {
                                self.turret.targetent.origin = var_e0570cd5d887cc29;
                            } else {
                                var_46f432042b3473d8 = min(distance(self.turret.targetent.origin, self.var_7e5a592e28788406.origin), var_159fea52c5ffdd4b * level.framedurationseconds);
                                diff = vectornormalize(self.var_7e5a592e28788406.origin - self.turret.targetent.origin) * var_46f432042b3473d8;
                                self.turret.targetent.origin = self.turret.targetent.origin + diff;
                            }
                            if (self.turret turretcantarget(self.turret.targetent.origin)) {
                                self.turret snaptotargetentity(self.turret.targetent);
                            }
                            accumulatedtime = accumulatedtime + level.framedurationseconds;
                            while (accumulatedtime > 0) {
                                accumulatedtime = accumulatedtime - firerate;
                                self.turret shootturret();
                                shots++;
                            }
                        }
                    }
                    totaltime = totaltime + level.framedurationseconds;
                    waitframe();
                }
                wait(3);
            } else {
                var_b8ee7ddd93755f86 = self.var_bdec9a74b3b2a503;
                if (var_7272f3c81cad93a == self.var_bdec9a74b3b2a503) {
                    self.missilefireside = "left";
                    self.var_bdec9a74b3b2a503 thread namespace_b1378d83bac67c85::choppergunner_firemissilefx(1);
                    var_b8ee7ddd93755f86 = self.var_bdec9a74b3b2a503;
                    var_7272f3c81cad93a = self.var_2d5a32b6a40fda8c;
                } else {
                    self.missilefireside = "right";
                    self.var_2d5a32b6a40fda8c thread namespace_b1378d83bac67c85::choppergunner_firemissilefx(2);
                    var_b8ee7ddd93755f86 = self.var_2d5a32b6a40fda8c;
                    var_7272f3c81cad93a = self.var_bdec9a74b3b2a503;
                }
                var_48c7944ad56a77ec = self.turret gettagorigin("tag_pivot");
                targetpos = self.var_7e5a592e28788406.origin - self.var_7e5a592e28788406 vehicle_getvelocity() * 0.45;
                var_a437f2b6d33146eb = vectornormalize(targetpos - var_48c7944ad56a77ec);
                var_b979f793dccb4061 = var_b8ee7ddd93755f86.origin * (1, 1, 0) + (0, 0, var_48c7944ad56a77ec[2]);
                var_429aae2e6e20f85 = var_b979f793dccb4061 + var_a437f2b6d33146eb * 100;
                var_85fa3cdcb19d2a9c = var_b979f793dccb4061 + var_a437f2b6d33146eb * 1000;
                var_ab7356fd109d3e8d = "chopper_gunner_proj_dmz";
                missile = namespace_d325722f2754c2c4::_magicbullet(makeweapon(var_ab7356fd109d3e8d), var_429aae2e6e20f85, var_85fa3cdcb19d2a9c);
                missile.owner = self;
                wait(0.25);
                if (isdefined(missile)) {
                    missile missile_settargetpos(targetpos);
                }
                wait(3);
            }
        } else {
            teammates = getteamdata(self.task.teams[0], "players");
            foreach (player in teammates) {
                if (namespace_7e17181d03156026::function_ad443bbcdcf37b85(player)) {
                    results = ray_trace(self.origin, player.origin, [0:self, 1:self.turret, 2:self.var_bdec9a74b3b2a503, 3:self.var_2d5a32b6a40fda8c, 4:self.var_7e5a592e28788406]);
                    if (distance(results["position"], player.origin) < 100) {
                        if (function_4e9fce9d930cb20b(player.origin)) {
                            shots = 0;
                            accumulatedtime = 0;
                            totaltime = 0;
                            self.turret.targetent.origin = player.origin;
                            while (shots < var_3180e2519441f60a && namespace_7e17181d03156026::function_ad443bbcdcf37b85(player)) {
                                if (totaltime > 5) {
                                    break;
                                }
                                if (self.health <= 0) {
                                    return;
                                }
                                self setlookatent(player);
                                if (function_4e9fce9d930cb20b(player.origin)) {
                                    results = ray_trace(self.origin, player.origin, [0:self, 1:self.turret, 2:self.var_bdec9a74b3b2a503, 3:self.var_2d5a32b6a40fda8c, 4:self.var_7e5a592e28788406]);
                                    if (distance(results["position"], player.origin) < 100) {
                                        self.turret.targetent.origin = player.origin;
                                        if (self.turret turretcantarget(self.turret.targetent.origin)) {
                                            self.turret snaptotargetentity(self.turret.targetent);
                                        }
                                        accumulatedtime = accumulatedtime + level.framedurationseconds;
                                        while (accumulatedtime > 0) {
                                            accumulatedtime = accumulatedtime - firerate;
                                            self.turret shootturret();
                                            shots++;
                                        }
                                    }
                                }
                                totaltime = totaltime + level.framedurationseconds;
                                waitframe();
                            }
                            wait(3);
                        }
                    }
                    break;
                }
            }
            waitframe();
        }
    }
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14be
// Size: 0xdd
function function_282ffb050875ade6(vehicle) {
    self endon("death");
    self endon("flyaway");
    self setmaxpitchroll(20, 20);
    self setneargoalnotifydist(150);
    var_8e95e5b8fd976f6 = 0;
    updaterate = 0.5;
    while (1) {
        wait(updaterate);
        if (!isdefined(vehicle)) {
            thread function_5eb66c5c1382fed();
            return;
        }
        veh_speed = vehicle vehicle_getspeed();
        var_8e95e5b8fd976f6 = 0;
        var_8c1d7e7ae38471bd = distance2dsquared(self.origin, vehicle.var_52a27c0888f8eab7);
        self vehicle_setspeed(120, 30, 60);
        thread function_a051d3cda138645(vehicle.previousposition + (0, 0, 1000), 1, vehicle);
        if (function_93b8918609703560()) {
            thread function_5eb66c5c1382fed();
            return;
        }
    }
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a2
// Size: 0x21a
function function_595d4ebd73e6b933() {
    self.vehicle endon("death");
    self endon("task_ended");
    self.vehicle.var_96cff7319bc0421a = [0:self.vehicle.origin, 1:self.vehicle.origin, 2:self.vehicle.origin, 3:self.vehicle.origin];
    maxindex = 3;
    var_b413a5de3aa90b12 = 17.6;
    self.vehicle.var_448456f634611aaf = 0;
    while (1) {
        speed = self.vehicle vehicle_getspeed();
        forward = vectornormalize(self.vehicle.origin - self.vehicle.var_96cff7319bc0421a[self.vehicle.var_448456f634611aaf]);
        self.vehicle.previousposition = self.vehicle.var_96cff7319bc0421a[self.vehicle.var_448456f634611aaf];
        self.vehicle.var_52a27c0888f8eab7 = self.vehicle.origin + forward * speed * var_b413a5de3aa90b12 * 6;
        self.vehicle.var_96cff7319bc0421a[self.vehicle.var_448456f634611aaf] = self.vehicle.origin;
        self.vehicle.var_448456f634611aaf = ter_op(self.vehicle.var_448456f634611aaf < maxindex, self.vehicle.var_448456f634611aaf + 1, 0);
        wait(1);
    }
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c3
// Size: 0x64
function function_57314b27f4592824(data) {
    attacker = data.attacker;
    if (isdefined(attacker) && isdefined(self.turret)) {
        if (isdefined(attacker.owner)) {
            if (attacker.owner == self) {
                return 0;
            }
        }
        return (attacker != self.turret);
    }
    return 1;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x182f
// Size: 0x2a
function function_499e02474dfc9171(data) {
    function_d98d121db25032b6(self.health - data.damage);
    return 1;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1861
// Size: 0x17
function function_e6cbc6847a8fb80b(data) {
    thread function_9f77f0a198fce7a3(data);
    return 1;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1880
// Size: 0x28
function function_9f77f0a198fce7a3(data) {
    function_6b85c01273c49f4d(150, data.objweapon);
    thread function_ce394773c84e2427();
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18af
// Size: 0x45
function function_d98d121db25032b6(health) {
    if (health < self.maxhealth) {
        if (health < 300) {
            function_53a0f26f479e5869();
        } else if (health > 600) {
            function_779eefb705b4f3d9();
        } else {
            function_8d8081e3b0352b3c();
        }
    }
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18fb
// Size: 0x14
function function_8d8081e3b0352b3c() {
    self setscriptablepartstate("body_damage_light", "on");
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1916
// Size: 0x14
function function_779eefb705b4f3d9() {
    self setscriptablepartstate("body_damage_medium", "on");
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1931
// Size: 0x14
function function_53a0f26f479e5869() {
    self setscriptablepartstate("body_damage_heavy", "on");
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x194c
// Size: 0xbd
function function_6b85c01273c49f4d(speed, var_11b83e21f9c87ff5) {
    self endon("explode");
    self clearlookatent();
    self notify("crashing");
    self setscriptablepartstate("engine_explosion", "on", 0);
    self setmaxpitchroll(10, 50);
    self vehicle_setspeed(speed, 20, 20);
    self setneargoalnotifydist(100);
    var_d3197eae18c8cc43 = "missile_damage";
    if (isdefined(var_11b83e21f9c87ff5) && namespace_d325722f2754c2c4::isbulletweapon(var_11b83e21f9c87ff5)) {
        var_d3197eae18c8cc43 = "bullet_damage";
    }
    self setscriptablepartstate("glass", var_d3197eae18c8cc43, 0);
    var_6847739e80fb4e81 = namespace_b1378d83bac67c85::choppergunner_findcrashposition(1250);
    if (!isdefined(var_6847739e80fb4e81)) {
        return;
    }
    self setvehgoalpos(var_6847739e80fb4e81, 0);
    thread namespace_b1378d83bac67c85::choppergunner_spinout(speed);
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a10
// Size: 0x73
function function_ce394773c84e2427() {
    self notify("explode");
    if (isdefined(self.owner)) {
        self radiusdamage(self.origin, 1000, 200, 200, self.owner, "MOD_EXPLOSIVE", "chopper_gunner_turret_mp");
    }
    self setscriptablepartstate("explode", "on", 0);
    self setscriptablepartstate("explode_smoke", "on", 0);
    wait(0.35);
    function_ac6c07614c22b935();
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8a
// Size: 0xf3
function function_8fe1775245b13b6f(player, var_82fd3ee8fbace30e, missiletarget, var_5991f0e5da9f9bd5) {
    self endon("death");
    while (1) {
        if (!isdefined(missiletarget)) {
            break;
        }
        center = missiletarget getpointinbounds(0, 0, 0);
        curdist = distance(self.origin, center);
        if (curdist < 4000 && missiletarget.flaresreservecount > 0) {
            missiletarget.flaresreservecount--;
            missiletarget thread function_c0afe8bb86f32d06(var_5991f0e5da9f9bd5);
            newtarget = undefined;
            if (issharedfuncdefined("flares", "deploy")) {
                newtarget = missiletarget [[ getsharedfunc("flares", "deploy") ]]();
            }
            self.var_afcd53cfa79abccf = 1;
            self missile_settargetent(newtarget);
            self notify("missile_pairedWithFlare");
            level notify("flares", player);
            return;
        }
        waitframe();
    }
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b84
// Size: 0x49
function function_c0afe8bb86f32d06(var_5991f0e5da9f9bd5) {
    var_23e275144756d0 = "tag_origin";
    if (isdefined(var_5991f0e5da9f9bd5)) {
        var_23e275144756d0 = var_5991f0e5da9f9bd5;
    }
    playsoundatpos(self gettagorigin(var_23e275144756d0), "ks_ac130_flares");
    playfxontag(getfx("gunship_flares"), self, var_23e275144756d0);
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd4
// Size: 0x63
function function_5eb66c5c1382fed() {
    self endon("death");
    if (istrue(self.var_c1e02d477104abd0)) {
        return;
    }
    self notify("flyaway");
    self.var_c1e02d477104abd0 = 1;
    self vehicle_setspeed(80, 25, 25);
    self setvehgoalpos(self.var_de315b064bb20d9.origin, 1);
    self waittill("near_goal");
    function_ac6c07614c22b935();
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c3e
// Size: 0xce
function function_ac6c07614c22b935() {
    namespace_b479ac682b93cd92::vehicle_deathcleanup();
    if (isdefined(self.turret)) {
        self.turret setentityowner(undefined);
        self.turret delete();
        if (isdefined(self.turret.firetarget)) {
            self.turret.firetarget delete();
        }
    }
    if (isdefined(self.var_bdec9a74b3b2a503)) {
        self.var_bdec9a74b3b2a503 setentityowner(undefined);
        self.var_bdec9a74b3b2a503 delete();
    }
    if (isdefined(self.var_2d5a32b6a40fda8c)) {
        self.var_2d5a32b6a40fda8c setentityowner(undefined);
        self.var_2d5a32b6a40fda8c delete();
    }
    namespace_f64231d5b7a2c3c4::vehicle_tracking_deregisterinstance(self);
    namespace_f64231d5b7a2c3c4::_deletevehicle(self);
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d13
// Size: 0x4
function private function_93b8918609703560() {
    return 0;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1d1f
// Size: 0x12a
function private function_3ab365a3526e539(point, numpositions, var_5619b7bbc3745888) {
    var_a1ae74a22938014d = 360 / numpositions;
    positions = [];
    fwd = (1, 0, 0);
    i = 0;
    while (i < 360) {
        altforward = fwd * var_5619b7bbc3745888;
        var_124d5f9c30b15673 = (cos(i) * altforward[0] - sin(i) * altforward[1], sin(i) * altforward[0] + cos(i) * altforward[1], altforward[2]);
        pos = point + var_124d5f9c30b15673;
        position = spawnstruct();
        position.origin = pos;
        z = position function_8c04a86613702b7d();
        position.origin = (position.origin[0], position.origin[1], z);
        positions[positions.size] = position;
        i = i + var_a1ae74a22938014d;
    }
    return positions;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e51
// Size: 0x36
function private function_8c04a86613702b7d() {
    heliheight = getgroundposition(self.origin, 128, 10000, 2000) + (0, 0, 1000);
    return heliheight[2];
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e8f
// Size: 0x11e
function private function_a051d3cda138645(goal_pos, stopatgoal, vehicle) {
    self endon("death");
    self endon("flyaway");
    self endon("circle");
    self notify("gotopos");
    self endon("gotopos");
    path = function_30401425c3d8874f(goal_pos, vehicle);
    foreach (index, node in path) {
        if (!isdefined(node) || !isdefined(vehicle)) {
            return;
        }
        if (index == path.size - 1) {
            self setvehgoalpos(node, stopatgoal);
        } else {
            self setvehgoalpos(node);
        }
        angle = (self.angles[0], vectortoangles(vehicle.origin - node)[1], self.angles[2]);
        self function_6d14d24a1888c646(angle, 0, 2, 0.5, 0.2, 2, 1);
        self waittill("near_goal");
    }
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fb4
// Size: 0x233
function private function_30401425c3d8874f(goal_pos, vehicle) {
    path = [];
    dir = vectortoangles(goal_pos - self.origin);
    fwd = anglestoforward(dir);
    dist = length(self.origin - goal_pos);
    currpos = self.origin;
    steps = max(dist / 250, 1);
    for (i = 0; i < steps; i++) {
        if (i > 3) {
            break;
        }
        var_6cb568fec1cf255a = 250;
        newpos = currpos + fwd * var_6cb568fec1cf255a;
        ignore = [0:self, 1:self.turret, 2:self.var_bdec9a74b3b2a503, 3:self.var_2d5a32b6a40fda8c];
        for (var_30bee8accdb898e4 = 0; var_30bee8accdb898e4 < 5; var_30bee8accdb898e4++) {
            trace = namespace_2a184fc4902783dc::sphere_get_closest_point(newpos, 400, 0, ignore);
            if (isdefined(trace["hittype"]) && trace["hittype"] != "hittype_none") {
                newpos = newpos + (0, 0, 125);
            } else {
                break;
            }
        }
        heliorigin = currpos;
        for (var_30bee8accdb898e4 = 0; var_30bee8accdb898e4 < 5; var_30bee8accdb898e4++) {
            trace = namespace_2a184fc4902783dc::sphere_get_closest_point(heliorigin, 400, 0, ignore);
            if (isdefined(trace["hittype"]) && trace["hittype"] != "hittype_none") {
                heliorigin = heliorigin + (0, 0, 125) + fwd * -50;
            } else {
                break;
            }
        }
        trace = namespace_2a184fc4902783dc::ray_trace(heliorigin, newpos, ignore, undefined, undefined, 1, 1);
        if (isdefined(trace["hittype"]) && trace["hittype"] != "hittype_none") {
            path[path.size] = heliorigin;
        } else {
            path[path.size] = heliorigin;
            path[path.size] = newpos;
        }
        currpos = path[path.size - 1];
    }
    path = function_521e6d5a9479e771(path);
    return path;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ef
// Size: 0x9b
function function_521e6d5a9479e771(path) {
    thresh = 100;
    foreach (index, node in path) {
        if (index == path.size - 1) {
            break;
        }
        diff = path[index + 1][2] - node[2];
        if (diff > thresh) {
            node = node + (0, 0, node[2] + diff / 2);
        }
    }
    return path;
}

// Namespace namespace_673092b35aa65d1c/namespace_d38b9642992c29b5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2292
// Size: 0x64
function function_57dd2a79f8ad4fee(pos) {
    if (!isdefined(level.var_6b278dce447d6034)) {
        return undefined;
    }
    closest = getclosest(pos, level.var_6b278dce447d6034);
    if (isdefined(closest) && distancesquared(closest.origin, pos) <= squared(closest.radius)) {
        return closest;
    }
    return undefined;
}

