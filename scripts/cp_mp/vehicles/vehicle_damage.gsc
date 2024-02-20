// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\engine\math.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\crossbow.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\pet_watch.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;

#namespace vehicle_damage;

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd5
// Size: 0xb6
function vehicle_damage_setcandamage(bool) {
    linkedents = self getlinkedchildren(1);
    if (isdefined(linkedents)) {
        foreach (linkedent in linkedents) {
            if (isdefined(linkedent.code_classname) && linkedent.code_classname == "misc_turret") {
                if (bool) {
                    linkedent thread vehicle_damage_keepturretalive(self);
                } else {
                    linkedent vehicle_damage_keepturretaliveend();
                }
            }
        }
    }
    self setcandamage(bool);
    vehicle_damage_cleareventlog(self);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1092
// Size: 0x14c
function vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c, create, var_6ecb77fd1f27c667) {
    if (istrue(create) && (!function_89dc39dc11f3988c(var_7731adef63e19b0c) || !isdefined(function_29b4292c92443328(var_7731adef63e19b0c).damage) || !isdefined(function_29b4292c92443328(var_7731adef63e19b0c).damage.class))) {
        data = undefined;
        if (!function_89dc39dc11f3988c(var_7731adef63e19b0c)) {
            data = spawnstruct();
        } else {
            data = function_29b4292c92443328(var_7731adef63e19b0c);
        }
        if (!isdefined(data.damage)) {
            data.damage = spawnstruct();
        }
        data.damage.damagestatedata = [];
        data.damage.class = "none";
        data.damage.visualpercents = [];
        data.damage.visualcallbacks = [];
        data.damage.visualclearcallbacks = [];
        level.var_a0b2c978ca57ffc5[var_7731adef63e19b0c] = data;
    }
    if (function_89dc39dc11f3988c(var_7731adef63e19b0c)) {
        return function_29b4292c92443328(var_7731adef63e19b0c).damage;
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e5
// Size: 0xbf
function vehicle_damage_getinstancedataforvehicle(vehicle, create, var_6ecb77fd1f27c667) {
    var_72141eab56fb408f = vehicle.damagedata;
    if (!isdefined(var_72141eab56fb408f)) {
        if (istrue(create)) {
            var_72141eab56fb408f = spawnstruct();
            vehicle.damagedata = var_72141eab56fb408f;
            var_72141eab56fb408f.destroyscoreevent = undefined;
            var_72141eab56fb408f.destroyscorelaunchonly = undefined;
            var_72141eab56fb408f.destroyaward = undefined;
            var_72141eab56fb408f.destroyawardlaunchonly = undefined;
            var_72141eab56fb408f.heavydamagescoreevent = undefined;
            var_72141eab56fb408f.heavydamagescorelaunchonly = undefined;
            var_72141eab56fb408f.heavydamageaward = undefined;
            var_72141eab56fb408f.heavydamageawardlaunchonly = undefined;
        } else if (!istrue(var_6ecb77fd1f27c667)) {
            /#
                assertmsg("vehicle_damage_getInstanceDataForVehicle called on a vehicle without damage instance data.");
            #/
        }
    }
    return var_72141eab56fb408f;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ac
// Size: 0x17
function vehicle_damage_deregisterinstance(vehicle) {
    vehicle.damagedata = undefined;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ca
// Size: 0xa8
function vehicle_damage_getleveldatafordamagestate(var_7731adef63e19b0c, var_cb322750051a892b, create, var_6ecb77fd1f27c667) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c, create, var_6ecb77fd1f27c667);
    var_d2e455d494f8d46e = var_e2818ad39a3341b4.damagestatedata[var_cb322750051a892b];
    if (!isdefined(var_d2e455d494f8d46e)) {
        if (istrue(create)) {
            var_d2e455d494f8d46e = spawnstruct();
            var_e2818ad39a3341b4.damagestatedata[var_cb322750051a892b] = var_d2e455d494f8d46e;
            var_d2e455d494f8d46e.maxhealth = undefined;
            var_d2e455d494f8d46e.onentercallback = undefined;
            var_d2e455d494f8d46e.onexitcallback = undefined;
        } else if (!istrue(var_6ecb77fd1f27c667)) {
            /#
                assertmsg("vehicle_damage_getLevelDataForDamageState called with an invalid stateRef.");
            #/
        }
    }
    return var_d2e455d494f8d46e;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137a
// Size: 0x94
function vehicle_damage_clearvisuals(data, changed, var_fcef8d217a441961) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(function_d93ec4635290febd(), 0, 1);
    if (isdefined(var_e2818ad39a3341b4)) {
        foreach (callback in var_e2818ad39a3341b4.visualclearcallbacks) {
            self thread [[ callback ]](data, changed, var_fcef8d217a441961);
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1415
// Size: 0x13
function function_b0662e99fcc0b8e0() {
    function_653b96ce8310763e(self.maxhealth);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x142f
// Size: 0x66
function function_653b96ce8310763e(var_ca12ff65fd9d113e) {
    self.health = int(min(self.health + var_ca12ff65fd9d113e, self.maxhealth));
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(function_d93ec4635290febd(), undefined, 1);
    if (!isdefined(var_e2818ad39a3341b4)) {
        return;
    }
    function_e1d544cb065687f0(undefined, 0, 1);
    namespace_84cff6185e39aa66::vehomn_updateomnvarsondamage(self);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x149c
// Size: 0x16c
function function_9cac3af67ee6b40a(vehicle, player, idamage, idflags, shitloc, smeansofdeath, eattacker, objweapon) {
    seatid = namespace_1fbd40990ee60ede::vehicle_occupancy_getoccupantseat(vehicle, player);
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(vehicle function_d93ec4635290febd());
    if (isdefined(seatid)) {
        seatdata = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldataforseat(vehicle function_d93ec4635290febd(), seatid);
        if (isdefined(var_e2818ad39a3341b4.var_b7b1ddcaaf4bf2db) && isdefined(var_e2818ad39a3341b4.var_b7b1ddcaaf4bf2db[seatid])) {
            idamage = idamage * var_e2818ad39a3341b4.var_b7b1ddcaaf4bf2db[seatid];
        }
        if (isdefined(var_e2818ad39a3341b4.var_8f793c5830904e92) && isdefined(var_e2818ad39a3341b4.var_8f793c5830904e92[seatid])) {
            idamage = clamp(idamage, 0, var_e2818ad39a3341b4.var_8f793c5830904e92[seatid]);
        }
        if (isdefined(seatdata) && isdefined(seatdata.var_dcfc487f4ef1103c) && isdefined(idflags) && idflags & 8 && !(idflags & 16384) && !player function_a7de57196f4b5d16() && !(isheadshot(shitloc, smeansofdeath, eattacker) && isdefined(objweapon) && weaponclass(objweapon) == "sniper")) {
            idamage = idamage * seatdata.var_dcfc487f4ef1103c;
        }
    }
    return idamage;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1610
// Size: 0x4ed
function function_f7123f6d38d50909() {
    self endon("death");
    function_a913d098054d5bce();
    castcontents = physics_createcontents([0:"physicscontents_missileclip", 1:"physicscontents_vehicle", 2:"physicscontents_glass", 3:"physicscontents_water", 4:"physicscontents_item"]);
    while (1) {
        if (!isdefined(self.var_b31f13a4e30b5aa5) || self.var_b31f13a4e30b5aa5.size == 0 || !isdefined(self.origin)) {
            break;
        }
        if (istrue(self.var_285a0756c95a7a5)) {
            waitframe();
            continue;
        }
        var_ac6ca28a64718193 = namespace_1fbd40990ee60ede::vehicle_occupancy_getteamfriendlyto(self);
        namespace_36f464722d326bbe::function_f5e8b13acc5b4e24();
        foreach (var_ac9fe0afffb8ef7 in level.var_715aa7f8de54c394 function_df633f460888a47(self.origin)) {
            foreach (projectile in var_ac9fe0afffb8ef7) {
                if (!isdefined(projectile) || !isdefined(projectile.origin)) {
                    continue;
                }
                if (distancesquared(projectile.origin, self.origin) > 160000) {
                    continue;
                }
                owner = projectile.owner;
                if (!isdefined(owner) && isdefined(projectile.weapon_name) && weaponclass(projectile.weapon_name) == "grenade") {
                    owner = getmissileowner(projectile);
                }
                var_f31940d93afc41db = 1;
                /#
                    if (getdvarint(@"hash_3c6c485214ca7673", 0) == 1) {
                        var_f31940d93afc41db = 0;
                    }
                #/
                if (var_f31940d93afc41db && isdefined(owner) && is_equal(var_ac6ca28a64718193, owner.team)) {
                    continue;
                }
                /#
                    if (getdvarint(@"hash_b16f847dc3049239")) {
                        sphere(projectile.origin, 15, (1, 0, 0));
                    }
                #/
                var_7133a9d4a8862078 = projectile.origin;
                foreach (tagname, data in self.var_b31f13a4e30b5aa5) {
                    tagorigin = self gettagorigin(tagname);
                    var_9814372c47655550 = var_7133a9d4a8862078 - tagorigin;
                    angle = math::anglebetweenvectors(var_9814372c47655550, anglestoforward(self gettagangles(tagname)));
                    if (angle > 30) {
                        continue;
                    }
                    var_e021c2744cc7ed68 = physics_raycast(tagorigin, var_7133a9d4a8862078, castcontents, [0:self, 1:projectile], 0, "physicsquery_closest");
                    if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
                        continue;
                    }
                    var_ed478e32f316bd8c = issubstr(tagname, "left");
                    var_eaba477d71b264e6 = undefined;
                    foreach (var_d51d85d97d08bfe7, data in array_randomize_objects(self.var_b31f13a4e30b5aa5)) {
                        if (var_d51d85d97d08bfe7 == tagname || issubstr(var_d51d85d97d08bfe7, "left") != var_ed478e32f316bd8c) {
                            continue;
                        }
                        var_eaba477d71b264e6 = var_d51d85d97d08bfe7;
                        break;
                    }
                    self.var_aab9695c92b0ed96[tagname].var_a776f097eb36e500 = 0;
                    function_77db32aa48a42a76(self, tagname, undefined, 1);
                    if (isdefined(var_eaba477d71b264e6)) {
                        self.var_aab9695c92b0ed96[var_eaba477d71b264e6].var_a776f097eb36e500 = 0;
                        function_77db32aa48a42a76(self, var_eaba477d71b264e6, undefined, 1);
                    }
                    function_577bb0f5a3fcc2bc(projectile);
                    break;
                }
            }
        }
        /#
            if (getdvarint(@"hash_b16f847dc3049239")) {
                sphere(self.origin, 400, (0, 0, 1));
                foreach (tagname, data in self.var_b31f13a4e30b5aa5) {
                    start = self gettagorigin(tagname);
                    end = start + anglestoforward(self gettagangles(tagname)) * 250;
                    line(start, end, (0, 0, 1));
                }
            }
        #/
        waitframe();
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b04
// Size: 0x191
function function_577bb0f5a3fcc2bc(target) {
    target setcandamage(0);
    target.exploding = 1;
    target stopsounds();
    if (!isdefined(target.owner)) {
        return;
    }
    if (isplayer(target.owner)) {
        target.owner namespace_e072c8407b2a861c::updatedamagefeedback("reactivearmorexplosion");
    }
    self.reactivearmorexplosion dontinterpolate();
    self.reactivearmorexplosion.origin = target.origin;
    up = target.origin - self.origin;
    right = up + (1, 0, 0);
    forward = vectorcross(up, right);
    right = vectorcross(forward, up);
    self.reactivearmorexplosion.angles = axistoangles(forward, right, up);
    if (istrue(self.explode1available)) {
        self.reactivearmorexplosion setscriptablepartstate("explode1", "activeDirectional", 0);
        self.explode1available = 0;
    } else {
        self.reactivearmorexplosion setscriptablepartstate("explode2", "activeDirectional", 0);
        self.explode1available = 1;
    }
    if (isdefined(target.streakname) && target.streakname == "cruise_predator") {
        target notify("trophy_blocked");
    } else {
        target delete();
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c9c
// Size: 0x42
function function_a913d098054d5bce() {
    explosion = spawn("script_model", self.origin);
    explosion setmodel("trophy_system_mp_explode");
    self.explode1available = 1;
    self.reactivearmorexplosion = explosion;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ce5
// Size: 0x1d
function function_870cbf6ca47076b6(var_7731adef63e19b0c) {
    return vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c).var_9d70f02394c136da;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d0a
// Size: 0x1d
function function_32b9b5d07bb56c31(var_7731adef63e19b0c) {
    return vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c).var_ccfde1208ef2964b;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d2f
// Size: 0x72
function function_bc320cf9a1b27cb5(var_7731adef63e19b0c, tagname, var_b4fccc158c681073, var_1c60586652067d4c) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    if (isdefined(var_b4fccc158c681073)) {
        var_e2818ad39a3341b4.var_aab9695c92b0ed96[tagname].var_b4fccc158c681073 = var_b4fccc158c681073;
    }
    if (isdefined(var_1c60586652067d4c)) {
        var_e2818ad39a3341b4.var_aab9695c92b0ed96[tagname].var_1c60586652067d4c = var_1c60586652067d4c;
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1da8
// Size: 0x33
function function_1f39191797c711b6(var_7731adef63e19b0c, var_8490f7216313a83) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    var_e2818ad39a3341b4.var_8490f7216313a83 = var_8490f7216313a83;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de2
// Size: 0x19d
function function_268e0e5863858dcf(vehicle, spawndata) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(vehicle function_d93ec4635290febd(), 0, 1);
    var_5e1984dbb5848080 = vehicle function_b7148a3bfc4defb2();
    tags = undefined;
    if (isdefined(spawndata.var_aab9695c92b0ed96)) {
        tags = spawndata.var_aab9695c92b0ed96;
    } else if (var_5e1984dbb5848080) {
        tags = var_e2818ad39a3341b4.var_ccfde1208ef2964b;
    } else {
        tags = var_e2818ad39a3341b4.var_9d70f02394c136da;
    }
    if (isdefined(tags)) {
        vehicle.var_aab9695c92b0ed96 = [];
        foreach (tagname, var_bafa22fcdefff511 in tags) {
            if (istrue(var_bafa22fcdefff511.inactive)) {
                continue;
            }
            var_1c09c3e40955f379 = spawnstruct();
            var_1c09c3e40955f379.var_a776f097eb36e500 = var_bafa22fcdefff511.var_a776f097eb36e500;
            var_1c09c3e40955f379.var_92894ef28e2b8800 = var_bafa22fcdefff511.var_92894ef28e2b8800;
            vehicle.var_aab9695c92b0ed96[tagname] = var_1c09c3e40955f379;
            if (istrue(var_bafa22fcdefff511.var_ea596cae0d362d35) && !var_5e1984dbb5848080) {
                if (!isdefined(vehicle.var_b31f13a4e30b5aa5)) {
                    vehicle.var_b31f13a4e30b5aa5 = [];
                }
                vehicle.var_b31f13a4e30b5aa5[tagname] = var_1c09c3e40955f379;
            }
        }
    }
    if (isdefined(vehicle.var_b31f13a4e30b5aa5)) {
        vehicle thread function_f7123f6d38d50909();
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f86
// Size: 0x205
function function_9b27177ad97bb8d8(vehicle) {
    if (!isdefined(vehicle) || !vehicle isvehicle() || vehicle function_b7148a3bfc4defb2()) {
        return;
    }
    data = function_29b4292c92443328(vehicle function_d93ec4635290febd());
    tags = data.damage.var_9d70f02394c136da;
    if (!isdefined(data) || !isdefined(data.interact) || !isdefined(data.interact.lights) || !isdefined(vehicle.var_aab9695c92b0ed96) || !isdefined(tags)) {
        return;
    }
    foreach (tag, light in data.interact.lights) {
        if (!isdefined(vehicle.var_aab9695c92b0ed96[tag]) || !function_853c0063f08b55e1(vehicle.var_aab9695c92b0ed96[tag])) {
            continue;
        }
        if (!isdefined(tags[tag])) {
            return;
        }
        vehicle.var_aab9695c92b0ed96[tag] = spawnstruct();
        vehicle.var_aab9695c92b0ed96[tag].var_a776f097eb36e500 = tags[tag].var_a776f097eb36e500;
        vehicle.var_aab9695c92b0ed96[tag].var_92894ef28e2b8800 = tags[tag].var_92894ef28e2b8800;
        state = "off";
        if (istrue(vehicle.var_6a73f11d95750b87)) {
            if (light.type == "engine_is_on_day_and_night") {
                state = "on";
            } else if (namespace_141c4634b6ea7b27::function_5519f4e75a7e2d2b() && light.type == "engine_is_on_at_night") {
                state = "on";
            }
        }
        vehicle setscriptablepartstate(tag, state);
        break;
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2192
// Size: 0xf0
function function_963f1cb109b9c186(vehicle, tag) {
    if (!isdefined(vehicle) || !isdefined(tag)) {
        return 0;
    }
    data = vehicle_damage_getleveldataforvehicle(vehicle function_d93ec4635290febd());
    tags = undefined;
    if (vehicle function_b7148a3bfc4defb2()) {
        tags = data.var_ccfde1208ef2964b;
    } else {
        tags = data.var_9d70f02394c136da;
    }
    if (!isdefined(tags[tag])) {
        return 0;
    }
    var_bafa22fcdefff511 = spawnstruct();
    var_bafa22fcdefff511.var_a776f097eb36e500 = tags[tag].var_a776f097eb36e500;
    var_bafa22fcdefff511.var_92894ef28e2b8800 = tags[tag].var_92894ef28e2b8800;
    if (!isdefined(vehicle.var_aab9695c92b0ed96)) {
        vehicle.var_aab9695c92b0ed96 = [];
    }
    vehicle.var_aab9695c92b0ed96[tag] = var_bafa22fcdefff511;
    vehicle setscriptablepartstate(tag, "default");
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2289
// Size: 0x318
function function_152437480e61a8a2(vehicle, damagedata, var_69cfd14b4398c458) {
    damagemultiplier = 1;
    var_f1a0290e8f712715 = function_786c7ec25aad5005(vehicle, damagedata);
    ref = vehicle function_d93ec4635290febd();
    vehicledata = vehicle_damage_getleveldataforvehicle(ref);
    /#
        if (getdvarint(@"hash_d6a84652bcb25596", 0) == 1 && var_f1a0290e8f712715.size > 0) {
            string = "pmc_missions";
            foreach (tag in var_f1a0290e8f712715) {
                string = string + tag + "row1_left";
            }
            string = string + "row2_right" + var_69cfd14b4398c458;
            iprintlnbold(string);
        }
    #/
    foreach (tagname in var_f1a0290e8f712715) {
        if (!function_6e87d9e8601d9029(vehicle, tagname, damagedata)) {
            continue;
        }
        var_fc00c9efa9cebdbc = vehicle.var_aab9695c92b0ed96[tagname].var_a776f097eb36e500;
        damage = max(0, var_69cfd14b4398c458 - function_c9f618f05861c2c5(ref, tagname));
        var_f943483e687a2247 = max(0, var_fc00c9efa9cebdbc - damage);
        vehicle.var_aab9695c92b0ed96[tagname].var_a776f097eb36e500 = var_f943483e687a2247;
        if (isdefined(damagedata) && isdefined(damagedata.objweapon) && iscrossbowdamage(damagedata.objweapon)) {
            if (function_ee1ff9eed64d1e5d(vehicle, tagname)) {
                vehicle.var_aab9695c92b0ed96[tagname].var_a776f097eb36e500 = 0;
            }
        }
        if (isexplosivedamagemod(damagedata.meansofdeath)) {
            var_858e06144ffaaf87 = vehicle.var_aab9695c92b0ed96[tagname].var_92894ef28e2b8800;
            var_9824258c4e398daa = var_858e06144ffaaf87 - var_69cfd14b4398c458;
            vehicle.var_aab9695c92b0ed96[tagname].var_92894ef28e2b8800 = max(0, var_9824258c4e398daa);
            if (istrue(vehicledata.var_aab9695c92b0ed96[tagname].var_c2436c09c1535a40)) {
                damagemultiplier = damagemultiplier * 0.33;
            }
        } else if (istrue(vehicledata.var_aab9695c92b0ed96[tagname].var_6b0cfebbbbb62b27)) {
            damagemultiplier = 0.0001;
        }
        if (function_853c0063f08b55e1(vehicle.var_aab9695c92b0ed96[tagname])) {
            function_77db32aa48a42a76(vehicle, tagname, damagedata);
        } else {
            var_cf8eaf8bc98090a6 = function_dde06c2157ec8895(ref, tagname);
            if (isdefined(var_cf8eaf8bc98090a6)) {
                vehicle thread [[ var_cf8eaf8bc98090a6 ]](vehicle, damagedata);
            }
        }
    }
    return damagemultiplier;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a9
// Size: 0x297
function function_9b1b715feb24f29f(vehicle, damagedata) {
    ref = vehicle function_d93ec4635290febd();
    if (!isdefined(ref)) {
        return;
    }
    vehicledata = vehicle_damage_getleveldataforvehicle(ref);
    if (!isdefined(vehicledata)) {
        return;
    }
    var_99137f3b2d0ec5f0 = vehicledata.var_aab9695c92b0ed96;
    if (!isdefined(var_99137f3b2d0ec5f0)) {
        return;
    }
    var_f1a0290e8f712715 = function_786c7ec25aad5005(vehicle, damagedata);
    /#
        if (getdvarint(@"hash_d6a84652bcb25596", 0) == 1 && var_f1a0290e8f712715.size > 0) {
            string = "pmc_missions";
            foreach (tag in var_f1a0290e8f712715) {
                string = string + tag + "row1_left";
            }
            iprintlnbold(string);
        }
    #/
    foreach (tagname in var_f1a0290e8f712715) {
        if (function_6e87d9e8601d9029(vehicle, tagname, damagedata)) {
            if (!isdefined(var_99137f3b2d0ec5f0[tagname]) || !isdefined(var_99137f3b2d0ec5f0[tagname].var_9eb2af3a3212b936)) {
                continue;
            }
            if (isexplosivedamagemod(damagedata.meansofdeath)) {
                var_9824258c4e398daa = vehicle.var_aab9695c92b0ed96[tagname].var_92894ef28e2b8800 - damagedata.damage;
                vehicle.var_aab9695c92b0ed96[tagname].var_92894ef28e2b8800 = max(0, var_9824258c4e398daa);
            } else {
                damage = max(0, damagedata.damage - function_c9f618f05861c2c5(ref, tagname));
                var_f943483e687a2247 = max(0, vehicle.var_aab9695c92b0ed96[tagname].var_a776f097eb36e500 - damage);
                vehicle.var_aab9695c92b0ed96[tagname].var_a776f097eb36e500 = var_f943483e687a2247;
            }
            if (function_853c0063f08b55e1(vehicle.var_aab9695c92b0ed96[tagname])) {
                function_77db32aa48a42a76(vehicle, tagname, damagedata);
            } else {
                var_cf8eaf8bc98090a6 = function_dde06c2157ec8895(ref, tagname);
                if (isdefined(var_cf8eaf8bc98090a6)) {
                    vehicle thread [[ var_cf8eaf8bc98090a6 ]](vehicle, damagedata);
                }
            }
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2847
// Size: 0x295
function function_77db32aa48a42a76(vehicle, tagname, damagedata, reactivearmorexplosion) {
    var_b3d6cabf18e8caf1 = function_82cad97b4499e421(vehicle, tagname, reactivearmorexplosion);
    vehicle setscriptablepartstate(tagname, var_b3d6cabf18e8caf1);
    var_b4fccc158c681073 = function_bad6c0e32ff1e092(vehicle function_d93ec4635290febd(), tagname);
    var_bafa22fcdefff511 = function_29b4292c92443328(vehicle function_d93ec4635290febd()).damage.var_aab9695c92b0ed96[tagname];
    if (isdefined(var_bafa22fcdefff511) && isdefined(var_bafa22fcdefff511.var_7cbffe9de982bcad)) {
        if (!isdefined(vehicle.var_f2b4d0e8470f108b)) {
            vehicle.var_f2b4d0e8470f108b = [];
        }
        vehicle.var_f2b4d0e8470f108b[tagname] = var_bafa22fcdefff511;
    }
    if (isdefined(var_bafa22fcdefff511) && isdefined(var_bafa22fcdefff511.var_9eb2af3a3212b936)) {
        vehicle function_f3bb4f4911a1beb2("pmc_missions", "onShatterWindow", damagedata);
    }
    if (isdefined(var_bafa22fcdefff511) && isdefined(var_bafa22fcdefff511.var_49cf4824f012bfea)) {
        if (!isdefined(vehicle.var_41e6777f1fa66044)) {
            vehicle.var_41e6777f1fa66044 = [];
        }
        vehicle.var_41e6777f1fa66044[var_bafa22fcdefff511.var_49cf4824f012bfea] = 1;
        if (vehicle function_452936099dcd1b94(var_bafa22fcdefff511.var_49cf4824f012bfea)) {
            vehicle function_14219d4c7d83499f(var_bafa22fcdefff511.var_49cf4824f012bfea);
        }
        occupant = namespace_1fbd40990ee60ede::vehicle_occupancy_getseatoccupant(vehicle, var_bafa22fcdefff511.var_49cf4824f012bfea);
        if (isdefined(occupant)) {
            occupant val::set("vehicle_occupant", "vehicle_lean_out", 0);
            namespace_84cff6185e39aa66::vehomn_setcurrentseat(vehicle, var_bafa22fcdefff511.var_49cf4824f012bfea, occupant);
        }
    }
    if (isdefined(var_bafa22fcdefff511) && istrue(var_bafa22fcdefff511.var_ea596cae0d362d35) && isdefined(vehicle.var_b31f13a4e30b5aa5)) {
        vehicle.var_b31f13a4e30b5aa5[tagname] = undefined;
    }
    if (isdefined(vehicle.var_aab9695c92b0ed96[tagname].var_673c6895d1418e1c)) {
        foreach (bolt in vehicle.var_aab9695c92b0ed96[tagname].var_673c6895d1418e1c) {
            if (isdefined(bolt) && istrue(bolt.iscrossbowbolt)) {
                bolt namespace_3544bf049e15c786::boltunlink();
            }
        }
    }
    if (isdefined(var_b4fccc158c681073)) {
        vehicle thread [[ var_b4fccc158c681073 ]](vehicle, damagedata);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ae3
// Size: 0x2d
function function_b9d5a379eb1aefc7(var_199b7eb356c9d5a9) {
    return !isdefined(self) || !isdefined(self.var_41e6777f1fa66044) || !istrue(self.var_41e6777f1fa66044[var_199b7eb356c9d5a9]);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b18
// Size: 0x86
function function_ec4b6f058d183338(vehicle, damagedata) {
    if (isdefined(vehicle.var_aab9695c92b0ed96)) {
        foreach (tagname, data in vehicle.var_aab9695c92b0ed96) {
            if (!function_853c0063f08b55e1(data)) {
                function_77db32aa48a42a76(vehicle, tagname, damagedata);
            }
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba5
// Size: 0x9c
function function_19953ff235374847(vehicle) {
    data = vehicle_damage_getleveldataforvehicle(vehicle function_d93ec4635290febd());
    tags = undefined;
    if (vehicle function_b7148a3bfc4defb2()) {
        tags = data.var_ccfde1208ef2964b;
    } else {
        tags = data.var_9d70f02394c136da;
    }
    foreach (tag, data in tags) {
        function_963f1cb109b9c186(vehicle, tag);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c48
// Size: 0x166
function function_9542eac6997b9060(vehicle) {
    if (isdefined(vehicle.var_aab9695c92b0ed96)) {
        var_bafa22fcdefff511 = function_2265b277a0dad0f1(vehicle function_d93ec4635290febd());
        if (!isdefined(vehicle.var_6d29ad415ac001b3)) {
            windows = [];
            foreach (tagname, data in vehicle.var_aab9695c92b0ed96) {
                if (isdefined(var_bafa22fcdefff511[tagname].var_9eb2af3a3212b936)) {
                    windows[tagname] = data;
                }
            }
            vehicle.var_6d29ad415ac001b3 = array_randomize_objects(windows);
        }
        foreach (tagname, data in vehicle.var_6d29ad415ac001b3) {
            if (!function_853c0063f08b55e1(data)) {
                data.var_a776f097eb36e500 = max(0, data.var_a776f097eb36e500 - randomintrange(50, 125));
                if (function_853c0063f08b55e1(data)) {
                    function_77db32aa48a42a76(vehicle, tagname);
                    vehicle.var_6d29ad415ac001b3[tagname] = undefined;
                }
                break;
            }
            vehicle.var_6d29ad415ac001b3[tagname] = undefined;
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2db5
// Size: 0x68
function function_66ac97eba6b35b4a(vehicle, tagname, damagedata) {
    var_da9f4cd603f44758 = function_f7df41d3ad15dca8(vehicle function_d93ec4635290febd(), tagname);
    vehicle setscriptablepartstate(var_da9f4cd603f44758, "hide");
    var_b4fccc158c681073 = function_bad6c0e32ff1e092(vehicle function_d93ec4635290febd(), tagname);
    if (isdefined(var_b4fccc158c681073)) {
        vehicle thread [[ var_b4fccc158c681073 ]](vehicle, damagedata);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e24
// Size: 0x1e
function function_4b3ef3d76f7e39b6(vehicle, damagedata) {
    function_7143b00f866ef1ec(vehicle, 0, damagedata);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e49
// Size: 0x1f
function function_d4c899afe6cbf533(vehicle, damagedata) {
    function_7143b00f866ef1ec(vehicle, 1, damagedata);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e6f
// Size: 0x1f
function function_1c35d2bee2c14d7b(vehicle, damagedata) {
    function_7143b00f866ef1ec(vehicle, 2, damagedata);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e95
// Size: 0x1f
function function_2e20b5a5d4f70228(vehicle, damagedata) {
    function_7143b00f866ef1ec(vehicle, 3, damagedata);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ebb
// Size: 0x1f
function function_79b9f63570444468(vehicle, damagedata) {
    function_7143b00f866ef1ec(vehicle, 4, damagedata);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee1
// Size: 0x1f
function function_4c7a8d0b6c6c16cd(vehicle, damagedata) {
    function_7143b00f866ef1ec(vehicle, 5, damagedata);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f07
// Size: 0x1f
function function_1cbe55c0515820b5(vehicle, damagedata) {
    function_7143b00f866ef1ec(vehicle, 6, damagedata);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f2d
// Size: 0x1f
function function_6469ea91038491e2(vehicle, damagedata) {
    function_7143b00f866ef1ec(vehicle, 7, damagedata);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f53
// Size: 0x2fd
function private function_7143b00f866ef1ec(vehicle, var_8e0f089d34ccbf55, damagedata) {
    if (vehicle vehicle_isphysveh() && vehicle function_76fa53e72547ff02()) {
        vehicle function_792b01bd9710f266(var_8e0f089d34ccbf55);
    }
    if (!isdefined(vehicle.var_58053eabd77a8c48)) {
        vehicle.var_58053eabd77a8c48 = 0;
    }
    vehicle.var_58053eabd77a8c48 = vehicle.var_58053eabd77a8c48 | 1 << var_8e0f089d34ccbf55;
    occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self, 0);
    if (isdefined(occupants)) {
        foreach (occupant in occupants) {
            function_eae2223216b7712c(vehicle, occupant);
        }
    }
    tagname = undefined;
    if (isdefined(damagedata) && isdefined(damagedata.partname) && isstring(damagedata.partname) && damagedata.partname != "") {
        tagname = damagedata.partname;
    } else if (isdefined(damagedata) && isdefined(damagedata.var_799f234362adb813) && isstring(damagedata.var_799f234362adb813) && damagedata.var_799f234362adb813 != "") {
        tagname = damagedata.var_799f234362adb813;
    }
    if (isdefined(vehicle) && isdefined(vehicle.origin) && isdefined(tagname) && vehicle vehicle_isphysveh()) {
        data = function_29b4292c92443328(vehicle function_d93ec4635290febd());
        speed = vehicle vehicle_getspeed();
        maxspeed = vehicle vehicle_gettopspeedforward();
        force = math::normalize_value(0, maxspeed / 2, speed);
        force = force * 0.8 + 0.2;
        force = force * data.damage.var_96f121d1edfdb0cb;
        self function_e0201404a8b6f664(vehicle.origin - vehicle gettagorigin(tagname) + (0, 0, 300), int(255 * force), 1);
    }
    if (!vehicle function_b7148a3bfc4defb2() && isdefined(damagedata) && isdefined(damagedata.attacker) && isplayer(damagedata.attacker)) {
        isenemy = namespace_1f188a13f7e79610::vehicle_isenemytoplayer(vehicle, damagedata.attacker);
        damagedata.givepointsandxp = isenemy;
        damagedata.attacker vehicle_damage_givescoreandxpatframeend(#"hash_5db50bf1147f0f52", undefined, damagedata, vehicle);
        vehicle function_f3bb4f4911a1beb2("pmc_missions", "onPopTire", damagedata.attacker, isenemy);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3257
// Size: 0xf
function private function_79a4d42ef833438a() {
    namespace_17c25f0877bfb620::scriptable_addusedcallback(&function_4b8d35d7af7fd960);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x326d
// Size: 0xd4
function function_4b8d35d7af7fd960(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(var_cc38472e36be1b61) || !isdefined(instance) || !isdefined(instance.entity) || !instance.entity isvehicle()) {
        return;
    }
    if (var_cc38472e36be1b61 == "row1_left" || var_cc38472e36be1b61 == "row1_right" || var_cc38472e36be1b61 == "row2_left" || var_cc38472e36be1b61 == "row2_right" || var_cc38472e36be1b61 == "row3_left" || var_cc38472e36be1b61 == "row3_right" || var_cc38472e36be1b61 == "row4_left" || var_cc38472e36be1b61 == "row4_right") {
        function_770f9f7300665(instance.entity, instance, part, var_cc38472e36be1b61, player, 0);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3348
// Size: 0x8c
function function_e6f68a61bffc259a(vehicle, var_c0d0511fe3faf573) {
    if (isdefined(vehicle.var_f2b4d0e8470f108b)) {
        foreach (part, data in vehicle.var_f2b4d0e8470f108b) {
            function_770f9f7300665(vehicle, vehicle, part, data.var_7cbffe9de982bcad, undefined, var_c0d0511fe3faf573);
            break;
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33db
// Size: 0x84
function function_9ae605ed3dc3bd1(vehicle) {
    if (isdefined(vehicle.var_f2b4d0e8470f108b)) {
        foreach (part, data in vehicle.var_f2b4d0e8470f108b) {
            vehicle thread function_770f9f7300665(vehicle, vehicle, part, data.var_7cbffe9de982bcad, undefined, 1);
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3466
// Size: 0x202
function private function_770f9f7300665(vehicle, scriptable, part, var_13223604b8fcea0c, player, var_c0d0511fe3faf573) {
    vehicle endon("death");
    if (isdefined(player)) {
        player thread function_3bde2944d834b090();
        player callback::callback("on_vehicle_tire_repaired");
    }
    scriptable setscriptablepartstate(part, "repaired");
    wait(0.1);
    var_8e0f089d34ccbf55 = function_948c6c379e1a9b52(var_13223604b8fcea0c);
    vehicle function_22a4a7e20bfe463b(var_8e0f089d34ccbf55);
    if (isdefined(vehicle.var_f2b4d0e8470f108b) && isdefined(vehicle.var_f2b4d0e8470f108b[part])) {
        vehicle.var_aab9695c92b0ed96[part].var_a776f097eb36e500 = vehicle.var_f2b4d0e8470f108b[part].var_a776f097eb36e500;
        vehicle.var_aab9695c92b0ed96[part].var_92894ef28e2b8800 = vehicle.var_f2b4d0e8470f108b[part].var_92894ef28e2b8800;
    }
    if (!isdefined(vehicle.var_58053eabd77a8c48)) {
        vehicle.var_58053eabd77a8c48 = 0;
    }
    vehicle.var_58053eabd77a8c48 = vehicle.var_58053eabd77a8c48 & ~(1 << var_8e0f089d34ccbf55);
    occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(vehicle, 0);
    if (isdefined(occupants)) {
        foreach (occupant in occupants) {
            function_eae2223216b7712c(vehicle, occupant);
            occupant callback::callback("on_vehicle_tire_repaired");
        }
    }
    if (isdefined(vehicle.var_f2b4d0e8470f108b)) {
        vehicle.var_f2b4d0e8470f108b[part] = undefined;
        if (vehicle.var_f2b4d0e8470f108b.size == 0) {
            vehicle.var_f2b4d0e8470f108b = undefined;
        }
    }
    function_c3da7bb5f5499152(vehicle, part, var_c0d0511fe3faf573);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x366f
// Size: 0x3f
function private function_3bde2944d834b090() {
    self endon("death_or_disconnect");
    var_a7408dbfed49f3f9 = makeweapon("iw8_ges_plyr_loot_pickup");
    self giveandfireoffhand(var_a7408dbfed49f3f9);
    wait(1.17);
    if (self hasweapon(var_a7408dbfed49f3f9)) {
        self takeweapon(var_a7408dbfed49f3f9);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x36b5
// Size: 0x51
function private function_c3da7bb5f5499152(vehicle, part, var_c0d0511fe3faf573) {
    var_5e2e7ec5e4fd55a0 = vehicle gettagorigin(part);
    var_313fe1d8b82f6df7 = "veh_repair_tire";
    if (var_c0d0511fe3faf573) {
        var_313fe1d8b82f6df7 = "veh_repair_tire_at_station";
    }
    playsoundatpos(var_5e2e7ec5e4fd55a0, var_313fe1d8b82f6df7);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x370d
// Size: 0xa6
function private function_948c6c379e1a9b52(var_13223604b8fcea0c) {
    switch (var_13223604b8fcea0c) {
    case #"hash_19baa7ca5b52f06a":
        return 0;
    case #"hash_60b26be014fd7337":
        return 1;
    case #"hash_67ed6be3637f19ed":
        return 2;
    case #"hash_227fe4df4167aa26":
        return 3;
    case #"hash_f0704f57a0dd2250":
        return 4;
    case #"hash_cbd67f63f80e6245":
        return 5;
    case #"hash_711797dce2a722a3":
        return 6;
    case #"hash_6ade103971ce6e2c":
        return 7;
    default:
        /#
            assert("vehicle_damage_tireNameToIndex Not given a valid tire name");
        #/
        break;
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37ba
// Size: 0x47
function function_eae2223216b7712c(vehicle, player) {
    if (!isdefined(vehicle.var_58053eabd77a8c48)) {
        vehicle.var_58053eabd77a8c48 = 0;
    }
    player setclientomnvar("ui_veh_flat_tire_mask", vehicle.var_58053eabd77a8c48);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3808
// Size: 0x76
function function_b9d933a7b78a67ad(data) {
    modifieddamage = data.damage;
    modifieddamage = function_1faeb1a037b3b515(data.inflictor, modifieddamage);
    if (issharedfuncdefined("vehicle_damage", "modifyVehicleDamage")) {
        modifieddamage = self [[ getsharedfunc("vehicle_damage", "modifyVehicleDamage") ]](data.inflictor, data.objweapon, modifieddamage);
    }
    return modifieddamage;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3886
// Size: 0xa5
function function_1faeb1a037b3b515(inflictor, damage) {
    if (!isdefined(inflictor) || !isagent(inflictor)) {
        return damage;
    }
    ref = function_d93ec4635290febd();
    if (!isdefined(ref) || !function_89dc39dc11f3988c(ref)) {
        return damage;
    }
    vehicledata = function_29b4292c92443328(ref);
    if (!isdefined(vehicledata) || !isdefined(vehicledata.damage) || !isdefined(vehicledata.damage.var_7f6ae564d3463c3c)) {
        return damage;
    }
    return damage * vehicledata.damage.var_7f6ae564d3463c3c;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3933
// Size: 0x1a7
function function_c5a55810ed63c87d(data) {
    if (!isdefined(data.point) || !isdefined(data.objweapon) || !isdefined(data.objweapon.damageradius)) {
        return 1;
    }
    ref = function_d93ec4635290febd();
    if (!isdefined(ref) || !function_89dc39dc11f3988c(ref)) {
        return 1;
    }
    vehicledata = function_29b4292c92443328(ref);
    if (!isdefined(vehicledata) || !isdefined(vehicledata.damage) || !isdefined(vehicledata.damage.var_c0d2f358f2e54245)) {
        return 1;
    }
    radius = data.objweapon.damageradius;
    bounds = vehicledata.damage.var_c0d2f358f2e54245;
    var_ea3b9640a6ad3c8e = coordtransformtranspose(data.point, self.origin, self.angles);
    return var_ea3b9640a6ad3c8e[0] > (bounds.back + radius) * -1 && var_ea3b9640a6ad3c8e[0] < bounds.front + radius && var_ea3b9640a6ad3c8e[1] > (bounds.left + radius) * -1 && var_ea3b9640a6ad3c8e[1] < bounds.right + radius && var_ea3b9640a6ad3c8e[2] > (bounds.bottom + radius) * -1 && var_ea3b9640a6ad3c8e[2] < bounds.top + radius;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ae2
// Size: 0x225
function vehicle_damage_init() {
    /#
        assertex(isdefined(level.vehicle), "vehicle_damage_init() called before vehicle_init().");
    #/
    /#
        assertex(!isdefined(level.vehicle.damage), "vehicle_damage_init() should only be called once.");
    #/
    var_962a30a9bb8c0f09 = spawnstruct();
    level.vehicle.damage = var_962a30a9bb8c0f09;
    level.var_ec75ca2494d74dab = getdvarint(@"hash_4421544b585f6be5", utility::ismp()) == 1;
    level.var_eca89e600e05e79e = getdvarint(@"hash_6fc86a5e3cedbd94", 0) == 1;
    var_962a30a9bb8c0f09.vehicledata = [];
    var_962a30a9bb8c0f09.heavystatehealthadd = getdvarint(@"hash_a3b9b8945213c089", 350);
    var_962a30a9bb8c0f09.mediumstatehealthratio = getdvarfloat(@"hash_4217d1e671e33953", 0.5);
    var_962a30a9bb8c0f09.burndowntime = getdvarfloat(@"hash_1021d59d6f0d99a0", 8);
    vehicle_damage_loadtable();
    vehicle_damage_initdebug();
    if (issharedfuncdefined("vehicle_damage", "init")) {
        [[ getsharedfunc("vehicle_damage", "init") ]]();
    }
    /#
        issharedfuncdefined("veh_repair_tire_at_station", "iw8_la_gromeo_mp", 1);
    #/
    /#
        issharedfuncdefined("veh_repair_tire_at_station", "nuke_mp", 1);
    #/
    /#
        issharedfuncdefined("veh_repair_tire_at_station", "rocket", 1);
    #/
    /#
        issharedfuncdefined("veh_repair_tire_at_station", "pristine", 1);
    #/
    /#
        issharedfuncdefined("veh_repair_tire_at_station", "rocketlauncher", 1);
    #/
    /#
        issharedfuncdefined("veh_repair_tire_at_station", "<unknown string>", 1);
    #/
    /#
        issharedfuncdefined("veh_repair_tire_at_station", "<unknown string>", 1);
    #/
    /#
        issharedfuncdefined("veh_repair_tire_at_station", "<unknown string>", 1);
    #/
    /#
        issharedfuncdefined("veh_repair_tire_at_station", "<unknown string>", 1);
    #/
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        vehicle_damage_inithitdamage_br();
    } else {
        vehicle_damage_inithitdamage();
    }
    vehicle_damage_initmoddamage();
    function_79a4d42ef833438a();
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d0e
// Size: 0x358
function vehicle_damage_loadtable() {
    var_962a30a9bb8c0f09 = vehicle_damage_getleveldata();
    table = spawnstruct();
    var_962a30a9bb8c0f09.table = table;
    table.modsforclass = [];
    table.modsforvehicle = [];
    table.hitsperattackforclass = [];
    table.hitsperattackforvehicle = [];
    table.skipburndownforclass = [];
    table.skipburndownforvehicle = [];
    var_b271a3d0c941cd5c = [];
    var_b271a3d0c941cd5c["class"] = [];
    var_b271a3d0c941cd5c["vehicle"] = [];
    var_870d49f076632bf2 = [];
    var_870d49f076632bf2["weaponMod"] = [];
    var_870d49f076632bf2["weaponHPA"] = [];
    var_870d49f076632bf2["weaponSkipBurnDown"] = [];
    if (getdvar(@"hash_6edebc535543f0bc", "") != "") {
        table = getdvar(@"hash_6edebc535543f0bc", "");
    } else {
        table = "mp_cp/vehicleDamageTable.csv";
    }
    var_206c9737e935cce1 = undefined;
    var_24c416453b6f670c = tablelookupgetnumcols(table);
    for (var_6722b84d6c5368b7 = 1; var_6722b84d6c5368b7 < var_24c416453b6f670c; var_6722b84d6c5368b7++) {
        var_b41f483278c9b1a0 = tablelookupbyrow(table, 0, var_6722b84d6c5368b7);
        if (isdefined(var_b41f483278c9b1a0) && var_b41f483278c9b1a0 != "") {
            if (getsubstr(var_b41f483278c9b1a0, 0, 1) == "*") {
                var_206c9737e935cce1 = getsubstr(var_b41f483278c9b1a0, 1, var_b41f483278c9b1a0.size);
            } else if (isdefined(var_b271a3d0c941cd5c[var_206c9737e935cce1])) {
                var_b271a3d0c941cd5c[var_206c9737e935cce1][var_b41f483278c9b1a0] = var_6722b84d6c5368b7;
            }
        }
    }
    var_e3ceec859e0df323 = undefined;
    var_8d626a4ccca80f2d = 0;
    numrows = tablelookupgetnumrows(table);
    for (var_8d626a4ccca80f2d = 0; var_8d626a4ccca80f2d < numrows; var_8d626a4ccca80f2d++) {
        var_929a919f782b1c96 = tablelookupbyrow(table, var_8d626a4ccca80f2d, 1);
        if (isdefined(var_929a919f782b1c96) && var_929a919f782b1c96 != "") {
            if (getsubstr(var_929a919f782b1c96, 0, 1) == "*") {
                var_e3ceec859e0df323 = getsubstr(var_929a919f782b1c96, 1, var_929a919f782b1c96.size);
            } else if (isdefined(var_870d49f076632bf2[var_e3ceec859e0df323])) {
                var_870d49f076632bf2[var_e3ceec859e0df323][var_929a919f782b1c96] = var_8d626a4ccca80f2d;
            }
        }
    }
    foreach (var_e3ceec859e0df323, var_247c537da346ffde in var_870d49f076632bf2) {
        foreach (var_929a919f782b1c96, rownum in var_247c537da346ffde) {
            foreach (var_206c9737e935cce1, var_2e078af567792360 in var_b271a3d0c941cd5c) {
                foreach (var_b41f483278c9b1a0, var_e78ec0335b297403 in var_2e078af567792360) {
                    var_f9430c437671aa54 = tablelookup(table, 0, rownum, var_e78ec0335b297403);
                    if (isdefined(var_f9430c437671aa54) && var_f9430c437671aa54 != "") {
                        vehicle_damage_loadtablecell(var_f9430c437671aa54, var_929a919f782b1c96, var_e3ceec859e0df323, var_b41f483278c9b1a0, var_206c9737e935cce1);
                    }
                }
            }
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x406d
// Size: 0x208
function vehicle_damage_loadtablecell(var_f9430c437671aa54, var_929a919f782b1c96, var_e3ceec859e0df323, var_b41f483278c9b1a0, var_206c9737e935cce1) {
    var_962a30a9bb8c0f09 = vehicle_damage_getleveldata();
    table = var_962a30a9bb8c0f09.table;
    if (var_e3ceec859e0df323 == "weaponMod") {
        var_2e70c59b43ca1e56 = float(var_f9430c437671aa54);
        if (var_206c9737e935cce1 == "class") {
            if (!isdefined(table.modsforclass[var_b41f483278c9b1a0])) {
                table.modsforclass[var_b41f483278c9b1a0] = [];
            }
            table.modsforclass[var_b41f483278c9b1a0][var_929a919f782b1c96] = var_2e70c59b43ca1e56;
        } else if (var_206c9737e935cce1 == "vehicle") {
            if (!isdefined(table.modsforvehicle[var_b41f483278c9b1a0])) {
                table.modsforvehicle[var_b41f483278c9b1a0] = [];
            }
            table.modsforvehicle[var_b41f483278c9b1a0][var_929a919f782b1c96] = var_2e70c59b43ca1e56;
        }
    }
    if (var_e3ceec859e0df323 == "weaponHPA") {
        var_2e70c59b43ca1e56 = int(var_f9430c437671aa54);
        if (var_206c9737e935cce1 == "class") {
            if (!isdefined(table.hitsperattackforclass[var_b41f483278c9b1a0])) {
                table.hitsperattackforclass[var_b41f483278c9b1a0] = [];
            }
            table.hitsperattackforclass[var_b41f483278c9b1a0][var_929a919f782b1c96] = var_2e70c59b43ca1e56;
        } else if (var_206c9737e935cce1 == "vehicle") {
            if (!isdefined(table.hitsperattackforvehicle[var_b41f483278c9b1a0])) {
                table.hitsperattackforvehicle[var_b41f483278c9b1a0] = [];
            }
            table.hitsperattackforvehicle[var_b41f483278c9b1a0][var_929a919f782b1c96] = var_2e70c59b43ca1e56;
        }
    }
    if (var_e3ceec859e0df323 == "weaponSkipBurnDown") {
        var_2e70c59b43ca1e56 = int(var_f9430c437671aa54) != 0;
        if (var_206c9737e935cce1 == "class") {
            if (!isdefined(table.skipburndownforclass[var_b41f483278c9b1a0])) {
                table.skipburndownforclass[var_b41f483278c9b1a0] = [];
            }
            table.skipburndownforclass[var_b41f483278c9b1a0][var_929a919f782b1c96] = var_2e70c59b43ca1e56;
        } else if (var_206c9737e935cce1 == "vehicle") {
            if (!isdefined(table.skipburndownforvehicle[var_b41f483278c9b1a0])) {
                table.skipburndownforvehicle[var_b41f483278c9b1a0] = [];
            }
            table.skipburndownforvehicle[var_b41f483278c9b1a0][var_929a919f782b1c96] = var_2e70c59b43ca1e56;
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x427c
// Size: 0x224
function vehicle_damage_applytabletovehicle(var_7731adef63e19b0c, var_6ecb77fd1f27c667) {
    var_962a30a9bb8c0f09 = vehicle_damage_getleveldata();
    table = var_962a30a9bb8c0f09.table;
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c, undefined, var_6ecb77fd1f27c667);
    if (!isdefined(var_e2818ad39a3341b4)) {
        return;
    }
    class = var_e2818ad39a3341b4.class;
    if (isdefined(table.modsforclass[class])) {
        foreach (weaponclass, mod in table.modsforclass[class]) {
            vehicle_damage_setweaponclassmoddamageforvehicle(weaponclass, mod, 0, var_7731adef63e19b0c);
        }
    }
    if (isdefined(table.modsforvehicle[var_7731adef63e19b0c])) {
        foreach (weaponclass, mod in table.modsforvehicle[var_7731adef63e19b0c]) {
            vehicle_damage_setweaponclassmoddamageforvehicle(weaponclass, mod, 0, var_7731adef63e19b0c);
        }
    }
    if (isdefined(table.hitsperattackforclass[class])) {
        foreach (weaponref, hitsperattack in table.hitsperattackforclass[class]) {
            vehicle_damage_setweaponhitdamagedataforvehicle(weaponref, hitsperattack, var_7731adef63e19b0c);
            vehicle_damage_setvehiclehitdamagedataforweapon(var_7731adef63e19b0c, 100, weaponref);
        }
    }
    if (isdefined(table.hitsperattackforvehicle[var_7731adef63e19b0c])) {
        foreach (weaponref, hitsperattack in table.hitsperattackforvehicle[var_7731adef63e19b0c]) {
            vehicle_damage_setweaponhitdamagedataforvehicle(weaponref, hitsperattack, var_7731adef63e19b0c);
            vehicle_damage_setvehiclehitdamagedataforweapon(var_7731adef63e19b0c, 100, weaponref);
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44a7
// Size: 0x26e
function vehicle_damage_inithitdamage() {
    vehicle_damage_setweaponhitdamagedata("iw8_la_gromeo_mp", 5);
    vehicle_damage_setweaponhitdamagedata("iw8_la_kgolf_mp", 5);
    vehicle_damage_setweaponhitdamagedata("iw8_la_rpapa7_mp", 5);
    vehicle_damage_setweaponhitdamagedata("iw8_la_juliet_mp", 6);
    vehicle_damage_setweaponhitdamagedata("iw8_la_gromeoks_mp", 4);
    vehicle_damage_setweaponhitdamagedata("iw8_la_mike32_mp", 3);
    vehicle_damage_setweaponhitdamagedata("iw8_ar_mike4_mp", 3);
    vehicle_damage_setweaponhitdamagedata("iw8_ar_akilo47_mp", 3);
    vehicle_damage_setweaponhitdamagedata("iw9_la_gromeo_mp", 5);
    vehicle_damage_setweaponhitdamagedata("iw9_la_juliet_mp", 6);
    vehicle_damage_setweaponhitdamagedata("jup_jp22_la_dromeo_mp", 1);
    vehicle_damage_setweaponhitdamagedata("frag_grenade_mp", 3);
    vehicle_damage_setweaponhitdamagedata("t10_frag_grenade_mp", 3);
    vehicle_damage_setweaponhitdamagedata("jup_frag_grenade_mp", 3);
    vehicle_damage_setweaponhitdamagedata("semtex_mp", 3);
    vehicle_damage_setweaponhitdamagedata("c4_mp", 3);
    vehicle_damage_setweaponhitdamagedata("at_mine_ap_mp", 3);
    vehicle_damage_setweaponhitdamagedata("at_mine_mp", 3);
    vehicle_damage_setweaponhitdamagedata("claymore_mp", 3);
    vehicle_damage_setweaponhitdamagedata("jup_claymore_mp", 3);
    vehicle_damage_setweaponhitdamagedata("jup_claymore_cp", 3);
    vehicle_damage_setweaponhitdamagedata("molotov_mp", 2);
    vehicle_damage_setweaponhitdamagedata("thermite_mp", 1);
    vehicle_damage_setweaponhitdamagedata("thermite_av_mp", 1);
    vehicle_damage_setweaponhitdamagedata("thermite_bolt_mp", 1);
    vehicle_damage_setweaponhitdamagedata("semtex_bolt_mp", 4);
    vehicle_damage_setweaponhitdamagedata("thermite_xmike109_mp", 0.5);
    vehicle_damage_setweaponhitdamagedata("semtex_xmike109_mp", 2);
    vehicle_damage_setweaponhitdamagedata("chopper_gunner_proj_mp", 3);
    vehicle_damage_setweaponhitdamagedata("missile_turret_proj_mp", 3);
    vehicle_damage_setweaponhitdamagedata("missile_turret_proj_jup_mp", 3);
    vehicle_damage_setweaponhitdamagedata("toma_proj_mp", 3);
    vehicle_damage_setweaponhitdamagedata("cruise_proj_mp", 15);
    vehicle_damage_setweaponhitdamagedata("artillery_mp", 3);
    vehicle_damage_setweaponhitdamagedata("nuke_mp", 15);
    vehicle_damage_setweaponhitdamagedata("gunship_hellfire_mp", 15);
    vehicle_damage_setweaponhitdamagedata("gunship_105mm_mp", 15);
    vehicle_damage_setweaponhitdamagedata("gunship_40mm_mp", 5);
    vehicle_damage_setweaponhitdamagedata("gunship_25mm_mp", 1);
    vehicle_damage_setweaponhitdamagedata("hover_jet_proj_mp", 3);
    vehicle_damage_setweaponhitdamagedata("chopper_gunner_turret_dmz", 40);
    vehicle_damage_setweaponhitdamagedata("loitering_munition_proj_mp", 3);
    vehicle_damage_setweaponhitdamagedata("emp_drone_non_player_mp", 3);
    vehicle_damage_setweaponhitdamagedata("emp_drone_non_player_direct_mp", 5);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x471c
// Size: 0x244
function vehicle_damage_inithitdamage_br() {
    vehicle_damage_setweaponhitdamagedata("iw8_la_gromeo_mp", 10);
    vehicle_damage_setweaponhitdamagedata("iw8_la_kgolf_mp", 10);
    vehicle_damage_setweaponhitdamagedata("iw8_la_rpapa7_mp", 10);
    vehicle_damage_setweaponhitdamagedata("iw8_la_juliet_mp", 20);
    vehicle_damage_setweaponhitdamagedata("iw8_la_gromeoks_mp", 10);
    vehicle_damage_setweaponhitdamagedata("iw8_la_mike32_mp", 6);
    vehicle_damage_setweaponhitdamagedata("iw8_ar_mike4_mp", 6);
    vehicle_damage_setweaponhitdamagedata("iw8_ar_akilo47_mp", 6);
    vehicle_damage_setweaponhitdamagedata("iw9_la_gromeo_mp", 10);
    vehicle_damage_setweaponhitdamagedata("iw9_la_juliet_mp", 20);
    vehicle_damage_setweaponhitdamagedata("c4_mp", 13);
    vehicle_damage_setweaponhitdamagedata("semtex_mp", 4);
    vehicle_damage_setweaponhitdamagedata("frag_grenade_mp", 4);
    vehicle_damage_setweaponhitdamagedata("t10_frag_grenade_mp", 4);
    vehicle_damage_setweaponhitdamagedata("jup_frag_grenade_mp", 4);
    vehicle_damage_setweaponhitdamagedata("pop_rocket_mp", 4);
    vehicle_damage_setweaponhitdamagedata("molotov_mp", 2);
    vehicle_damage_setweaponhitdamagedata("at_mine_ap_mp", 5);
    vehicle_damage_setweaponhitdamagedata("at_mine_mp", 13);
    vehicle_damage_setweaponhitdamagedata("thermite_mp", 1);
    vehicle_damage_setweaponhitdamagedata("thermite_av_mp", 1);
    vehicle_damage_setweaponhitdamagedata("emp_grenade_mp", 4);
    vehicle_damage_setweaponhitdamagedata("claymore_mp", 13);
    vehicle_damage_setweaponhitdamagedata("jup_claymore_mp", 13);
    vehicle_damage_setweaponhitdamagedata("jup_claymore_cp", 13);
    vehicle_damage_setweaponhitdamagedata("thermite_bolt_mp", 1);
    vehicle_damage_setweaponhitdamagedata("semtex_bolt_mp", 4);
    vehicle_damage_setweaponhitdamagedata("thermite_xmike109_mp", 0.5);
    vehicle_damage_setweaponhitdamagedata("semtex_xmike109_mp", 2);
    vehicle_damage_setweaponhitdamagedata("toma_proj_mp", 12);
    vehicle_damage_setweaponhitdamagedata("cruise_proj_mp", 15);
    vehicle_damage_setweaponhitdamagedata("artillery_mp", 10);
    vehicle_damage_setweaponhitdamagedata("nuke_mp", 20);
    vehicle_damage_setweaponhitdamagedata("gunship_hellfire_mp", 15);
    vehicle_damage_setweaponhitdamagedata("gunship_105mm_mp", 15);
    vehicle_damage_setweaponhitdamagedata("gunship_40mm_mp", 5);
    vehicle_damage_setweaponhitdamagedata("gunship_25mm_mp", 1);
    vehicle_damage_setweaponhitdamagedata("hover_jet_proj_mp", 3);
    vehicle_damage_setweaponhitdamagedata("loitering_munition_proj_mp", 3);
    vehicle_damage_setweaponhitdamagedata("emp_drone_non_player_mp", 3);
    vehicle_damage_setweaponhitdamagedata("emp_drone_non_player_direct_mp", 5);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4967
// Size: 0x4b
function vehicle_damage_initmoddamage() {
    vehicle_damage_setperkmoddamage("specialty_armorpiercing", 0.25, 0);
    vehicle_damage_setperkmoddamage("specialty_armorpiercingks", 0.75, 0);
    vehicle_damage_setperkmoddamage("specialty_incendiary", 0.55, 0);
    vehicle_damage_setperkmoddamage("specialty_explosivebullet", 0.75, 0);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49b9
// Size: 0x38
function vehicle_damage_getleveldata() {
    /#
        assertex(isdefined(level.vehicle.damage), "vehicle_damage_getLevelData() called before vehicle_damage_init().");
    #/
    return level.vehicle.damage;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x49f9
// Size: 0xf7
function vehicle_damage_isselfdamage(vehicle, data) {
    if (isdefined(data.inflictor)) {
        if (data.inflictor == vehicle) {
            return 1;
        }
        turrets = vehicle_getturrets(vehicle);
        foreach (turret in turrets) {
            if (data.inflictor == turret) {
                return 1;
            }
        }
        if (data.inflictor.classname == "rocket" && isdefined(data.inflictor.vehicle) && data.inflictor.vehicle == vehicle) {
            return 1;
        }
    }
    return 0;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4af8
// Size: 0x1a
function vehicle_damage_enableownerdamage(vehicle) {
    vehicle.ownerdamageenabled = 1;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b19
// Size: 0x18
function vehicle_damage_isownerdamageenabled(vehicle) {
    return istrue(vehicle.ownerdamageenabled);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b39
// Size: 0x11d
function vehicle_damage_logevent(vehicle, data) {
    if (!isdefined(vehicle.damageevents)) {
        vehicle.damageevents = [];
    }
    vehicle.damageevents[vehicle.damageevents.size] = data;
    if (isdefined(data.attacker) && isdefined(data.attacker.overridefieldupgrade1) && isdefined(data.attacker.super) && data.attacker.overridefieldupgrade1 == "super_suppression_rounds") {
        if (isdefined(data.attacker.super.var_db8424389dcbbe9b)) {
            data.attacker.super.var_db8424389dcbbe9b++;
        } else {
            data.attacker.super.var_db8424389dcbbe9b = 1;
        }
    }
    thread vehicle_damage_cleareventlogatframeend(vehicle);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c5d
// Size: 0x1f
function vehicle_damage_cleareventlog(vehicle) {
    vehicle notify("vehicle_damage_clearEventLog");
    vehicle.damageevents = undefined;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c83
// Size: 0x33
function vehicle_damage_cleareventlogatframeend(vehicle) {
    vehicle endon("death");
    vehicle endon("vehicle_damage_clearEventLog");
    vehicle notify("vehicle_damage_clearEventLogAtFrameEnd");
    vehicle endon("vehicle_damage_clearEventLogAtFrameEnd");
    waittillframeend();
    thread vehicle_damage_cleareventlog(vehicle);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cbd
// Size: 0x152
function vehicle_damage_referevent(vehicle, turret, data) {
    if (!isdefined(data.meansofdeath)) {
        return 0;
    }
    if (!isexplosivedamagemod(data.meansofdeath)) {
        return 0;
    }
    if (!isdefined(data.eventid)) {
        return 0;
    }
    if (isdefined(vehicle.damageevents)) {
        foreach (var_84dcd1ab2ae1dffa in vehicle.damageevents) {
            if (var_84dcd1ab2ae1dffa.eventid == data.eventid) {
                return 0;
            }
        }
    }
    if (!isdefined(data.inflictor)) {
        data.inflictor = undefined;
    }
    vehicle endon("death");
    vehicle endon("vehicle_damage_clearEventLog");
    vehicle dodamage(data.damage, data.point, data.attacker, data.inflictor, data.meansofdeath, data.objweapon, data.hitlocation);
    vehicle_damage_logevent(vehicle, data);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e16
// Size: 0x11f
function vehicle_damage_keepturretalive(vehicle) {
    self endon("death");
    self endon("vehicle_damage_keepTurretAliveEnd");
    self setcandamage(1);
    self.health = 2147483647;
    eventid = inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
    data = packdamagedata(attacker, self, damage, objweapon, meansofdeath, inflictor, point, direction_vec, modelname, partname, tagname, idflags, eventid);
    vehicle_damage_referevent(vehicle, self, data);
    self.health = 2147483647;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f3c
// Size: 0x1c
function vehicle_damage_keepturretaliveend(turret) {
    self notify("vehicle_damage_keepTurretAliveEnd");
    self setcandamage(0);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f5f
// Size: 0xe6
function vehicle_damage_visualwatchspeedchange(var_cb322750051a892b, data) {
    self notify("vehicle_damage_visualStopWatchingSpeedChange");
    self endon("vehicle_damage_visualStopWatchingSpeedChange");
    var_c4ba4a0be2ef63f6 = undefined;
    while (isdefined(self)) {
        var_8707d88b63f131d1 = undefined;
        speed = int(self vehicle_getspeed());
        canfly = istrue(namespace_1f188a13f7e79610::vehiclecanfly());
        if (canfly && self vehicle_isonground()) {
            var_8707d88b63f131d1 = 0;
        } else if (!canfly && speed <= 3) {
            var_8707d88b63f131d1 = 0;
        } else if (speed <= 25) {
            var_8707d88b63f131d1 = 1;
        } else {
            var_8707d88b63f131d1 = 2;
        }
        if (isdefined(var_c4ba4a0be2ef63f6) && var_8707d88b63f131d1 != var_c4ba4a0be2ef63f6) {
            var_d2e455d494f8d46e = vehicle_damage_getleveldatafordamagestate(function_d93ec4635290febd(), var_cb322750051a892b);
            self thread [[ var_d2e455d494f8d46e.onentercallback ]](var_cb322750051a892b, data);
            return;
        }
        var_c4ba4a0be2ef63f6 = var_8707d88b63f131d1;
        wait(0.1);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x504c
// Size: 0xb
function vehicle_damage_visualstopwatchingspeedchange() {
    self notify("vehicle_damage_visualStopWatchingSpeedChange");
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x505e
// Size: 0xc1
function vehicle_damage_lightvisualcallback(data, changed) {
    speed = int(self vehicle_getspeed());
    canfly = istrue(namespace_1f188a13f7e79610::vehiclecanfly());
    if (canfly && self vehicle_isonground()) {
        self setscriptablepartstate("damageLight", "stopped", 1);
    } else if (!canfly && speed <= 3) {
        self setscriptablepartstate("damageLight", "stopped", 1);
    } else if (speed <= 25) {
        self setscriptablepartstate("damageLight", "lowSpeed", 1);
    } else {
        self setscriptablepartstate("damageLight", "highSpeed", 1);
    }
    thread vehicle_damage_visualwatchspeedchange("light", data);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5126
// Size: 0x183
function vehicle_damage_lightvisualclearcallback(data, changed, var_fcef8d217a441961) {
    vehicle_damage_visualstopwatchingspeedchange();
    if (!self isscriptable()) {
        if (isdefined(self.vehiclename)) {
            ref = self.vehiclename;
        } else {
            ref = "undefined";
        }
        if (isdefined(self.vehicletype)) {
            type = self.vehicletype;
        } else {
            type = "undefined";
        }
        var_f580de06a1c1891c = "Vehicle is not a scriptable: ref: " + ref + " type: " + type == undefined;
        return;
    }
    if (!self getscriptablehaspart("damageLight")) {
        if (isdefined(self.vehiclename)) {
            ref = self.vehiclename;
        } else {
            ref = "undefined";
        }
        if (isdefined(self.vehicletype)) {
            type = self.vehicletype;
        } else {
            type = "undefined";
        }
        var_f580de06a1c1891c = "Vehicle does not have damageLight part: ref: " + ref + " type: " + type == undefined;
        return;
    }
    if (!self getscriptableparthasstate("damageLight", "off")) {
        if (isdefined(self.vehiclename)) {
            ref = self.vehiclename;
        } else {
            ref = "undefined";
        }
        if (isdefined(self.vehicletype)) {
            type = self.vehicletype;
        } else {
            type = "undefined";
        }
        var_f580de06a1c1891c = "Vehicle does not have part damageLight with state off: ref: " + ref + " type: " + type == undefined;
        return;
    }
    self setscriptablepartstate("damageLight", "off", 1);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52b0
// Size: 0xc1
function vehicle_damage_mediumvisualcallback(data, changed) {
    speed = int(self vehicle_getspeed());
    canfly = istrue(namespace_1f188a13f7e79610::vehiclecanfly());
    if (canfly && self vehicle_isonground()) {
        self setscriptablepartstate("damageMedium", "stopped", 1);
    } else if (!canfly && speed <= 3) {
        self setscriptablepartstate("damageMedium", "stopped", 1);
    } else if (speed <= 25) {
        self setscriptablepartstate("damageMedium", "lowSpeed", 1);
    } else {
        self setscriptablepartstate("damageMedium", "highSpeed", 1);
    }
    thread vehicle_damage_visualwatchspeedchange("medium", data);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5378
// Size: 0x36
function vehicle_damage_mediumvisualclearcallback(data, changed, var_fcef8d217a441961) {
    vehicle_damage_visualstopwatchingspeedchange();
    self setscriptablepartstate("damageMedium", "off", 1);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53b5
// Size: 0xc1
function vehicle_damage_heavyvisualcallback(data, changed) {
    speed = int(self vehicle_getspeed());
    canfly = istrue(namespace_1f188a13f7e79610::vehiclecanfly());
    if (canfly && self vehicle_isonground()) {
        self setscriptablepartstate("damageHeavy", "stopped", 1);
    } else if (!canfly && speed <= 3) {
        self setscriptablepartstate("damageHeavy", "stopped", 1);
    } else if (speed <= 25) {
        self setscriptablepartstate("damageHeavy", "lowSpeed", 1);
    } else {
        self setscriptablepartstate("damageHeavy", "highSpeed", 1);
    }
    thread vehicle_damage_visualwatchspeedchange("heavy", data);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x547d
// Size: 0x36
function vehicle_damage_heavyvisualclearcallback(data, changed, var_fcef8d217a441961) {
    vehicle_damage_visualstopwatchingspeedchange();
    self setscriptablepartstate("damageHeavy", "off", 1);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54ba
// Size: 0x38
function vehicle_damage_enginevisualcallback(data, changed) {
    self setscriptablepartstate("damageEngine", "explode", 1);
    if (!istrue(namespace_1f188a13f7e79610::vehiclecanfly())) {
        namespace_1fbd40990ee60ede::function_d0092c44c5588870();
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54f9
// Size: 0x2f
function vehicle_damage_enginevisualclearcallback(data, changed, var_fcef8d217a441961) {
    self setscriptablepartstate("damageEngine", "off", 1);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x552f
// Size: 0x1f
function vehicle_damage_getstate() {
    if (!isdefined(self.damagestateref)) {
        return "pristine";
    }
    return self.damagestateref;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5556
// Size: 0xca
function vehicle_damage_setstate(var_cb322750051a892b, var_1ae0aeb37c917298, data) {
    /#
        assert(isdefined(var_cb322750051a892b) && isdefined(var_1ae0aeb37c917298) && var_cb322750051a892b != var_1ae0aeb37c917298);
    #/
    self notify("damage_state_change");
    ref = function_d93ec4635290febd();
    if (var_1ae0aeb37c917298 != "pristine") {
        var_1f1b237868b2b611 = vehicle_damage_getleveldatafordamagestate(ref, var_1ae0aeb37c917298);
        if (isdefined(var_1f1b237868b2b611.onexitcallback)) {
            self thread [[ var_1f1b237868b2b611.onexitcallback ]](var_cb322750051a892b, data);
        }
    }
    if (var_cb322750051a892b != "pristine") {
        var_1f1b237868b2b611 = vehicle_damage_getleveldatafordamagestate(ref, var_cb322750051a892b);
        if (isdefined(var_1f1b237868b2b611.onentercallback)) {
            self thread [[ var_1f1b237868b2b611.onentercallback ]](var_1ae0aeb37c917298, data);
        }
    }
    self.damagestateref = var_cb322750051a892b;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5627
// Size: 0x53
function vehicle_damage_updatestate(data, var_fa10797979c24226, var_6ecb77fd1f27c667) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(function_d93ec4635290febd(), undefined, var_6ecb77fd1f27c667);
    if (!isdefined(var_e2818ad39a3341b4)) {
        return;
    }
    self.lasttimedamaged = gettime();
    function_e1d544cb065687f0(data, var_fa10797979c24226, var_6ecb77fd1f27c667);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5681
// Size: 0x25b
function function_e1d544cb065687f0(data, var_fa10797979c24226, var_6ecb77fd1f27c667) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(function_d93ec4635290febd(), undefined, var_6ecb77fd1f27c667);
    var_29f04596cc8cffa5 = self.health;
    if (isdefined(data) && isdefined(data.damage)) {
        var_29f04596cc8cffa5 = var_29f04596cc8cffa5 - int(data.damage);
    }
    var_416adca164c6f319 = "pristine";
    var_47073cf5d0921b2c = undefined;
    var_ad8ec7e8a1d06338 = undefined;
    foreach (var_cb322750051a892b, var_47bdb61121b1ec92 in var_e2818ad39a3341b4.damagestatedata) {
        /#
            assertex(istrue(var_6ecb77fd1f27c667) || var_cb322750051a892b != "pristine", "damageStateData cannot have a stateRef of " + "pristine" + ".");
        #/
        /#
            assertex(istrue(var_6ecb77fd1f27c667) || isdefined(var_47bdb61121b1ec92.maxhealth), "damageStateData for " + var_cb322750051a892b + " must define maxHealth.");
        #/
        if ((!isdefined(var_ad8ec7e8a1d06338) || var_47bdb61121b1ec92.maxhealth < var_ad8ec7e8a1d06338) && var_29f04596cc8cffa5 <= var_47bdb61121b1ec92.maxhealth && (!function_b7148a3bfc4defb2() || var_cb322750051a892b != "light" && var_cb322750051a892b != "medium")) {
            var_416adca164c6f319 = var_cb322750051a892b;
            var_47073cf5d0921b2c = var_47bdb61121b1ec92;
            var_ad8ec7e8a1d06338 = var_47bdb61121b1ec92.maxhealth;
        }
    }
    var_1ae0aeb37c917298 = vehicle_damage_getstate();
    if (var_416adca164c6f319 != var_1ae0aeb37c917298) {
        if (!istrue(var_fa10797979c24226)) {
            if (var_416adca164c6f319 == "heavy" && (!isdefined(var_1ae0aeb37c917298) || var_1ae0aeb37c917298 != "heavy")) {
                if (!istrue(self.disableheavystatedamagefloor)) {
                    var_4e49623dc4538a67 = namespace_5a0f3ca265d3a4c8::vehicle_damage_getheavystatemaxhealth(undefined, function_d93ec4635290febd());
                    if (isdefined(var_4e49623dc4538a67)) {
                        if (isdefined(data) && isdefined(data.damage) && data.damage != 0) {
                            self.health = int(max(self.health, var_4e49623dc4538a67 + data.damage));
                        }
                    }
                }
            }
        }
        vehicle_damage_setstate(var_416adca164c6f319, var_1ae0aeb37c917298, data);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58e3
// Size: 0x28
function vehicle_damage_disablestatedamagefloor(bool) {
    if (bool) {
        self.disableheavystatedamagefloor = 1;
    } else {
        self.disableheavystatedamagefloor = undefined;
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5912
// Size: 0x1e
function vehicle_damage_onenterstatelight(var_1ae0aeb37c917298, data) {
    vehicle_damage_lightvisualcallback(data, 1);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5937
// Size: 0x1e
function vehicle_damage_onexitstatelight(var_56182e19d2f0094f, data) {
    vehicle_damage_lightvisualclearcallback(data, 1);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x595c
// Size: 0x1e
function vehicle_damage_onenterstatemedium(var_1ae0aeb37c917298, data) {
    vehicle_damage_mediumvisualcallback(data, 1);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5981
// Size: 0x1e
function vehicle_damage_onexitstatemedium(var_56182e19d2f0094f, data) {
    vehicle_damage_mediumvisualclearcallback(data, 1);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59a6
// Size: 0x7b
function vehicle_damage_onenterstateheavy(var_1ae0aeb37c917298, data) {
    if (namespace_1f188a13f7e79610::function_b7148a3bfc4defb2()) {
        function_d06474f0bc53709d(data);
    } else {
        vehicle_damage_heavyvisualcallback(data, 1);
        vehicle_damage_enginevisualcallback(data, 1);
    }
    if (!isdefined(var_1ae0aeb37c917298) || var_1ae0aeb37c917298 != "heavy") {
        namespace_1fbd40990ee60ede::vehicle_occupancy_allowmovement(self, 0);
        if (function_734926fcdbad1fd4()) {
            vehicle_damage_onenterstateheavyscore(var_1ae0aeb37c917298, data);
        }
        if (!vehicle_damage_shouldskipburndown(data)) {
            thread vehicle_damage_beginburndown(data);
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a28
// Size: 0x67
function vehicle_damage_onexitstateheavy(var_56182e19d2f0094f, data) {
    if (function_b7148a3bfc4defb2()) {
        function_27ec7be8325efa3c(data);
    } else {
        vehicle_damage_heavyvisualclearcallback(data, 1);
        vehicle_damage_enginevisualclearcallback(data, 1);
    }
    if (!isdefined(var_56182e19d2f0094f) || var_56182e19d2f0094f != "heavy") {
        if (!function_b7148a3bfc4defb2()) {
            namespace_1fbd40990ee60ede::vehicle_occupancy_allowmovement(self, 1);
        }
        vehicle_damage_endburndown();
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a96
// Size: 0xc7
function vehicle_damage_registerdefaultstates(var_7731adef63e19b0c) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c, 1);
    var_d2e455d494f8d46e = vehicle_damage_getleveldatafordamagestate(var_7731adef63e19b0c, "light", 1);
    var_d2e455d494f8d46e.onentercallback = &vehicle_damage_onenterstatelight;
    var_d2e455d494f8d46e.onexitcallback = &vehicle_damage_onexitstatelight;
    var_d2e455d494f8d46e = vehicle_damage_getleveldatafordamagestate(var_7731adef63e19b0c, "medium", 1);
    var_d2e455d494f8d46e.onentercallback = &vehicle_damage_onenterstatemedium;
    var_d2e455d494f8d46e.onexitcallback = &vehicle_damage_onexitstatemedium;
    var_d2e455d494f8d46e = vehicle_damage_getleveldatafordamagestate(var_7731adef63e19b0c, "heavy", 1);
    var_d2e455d494f8d46e.onentercallback = &vehicle_damage_onenterstateheavy;
    var_d2e455d494f8d46e.onexitcallback = &vehicle_damage_onexitstateheavy;
    vehicle_damage_updatestatemaxhealthvalues(var_7731adef63e19b0c);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b64
// Size: 0x1f
function function_d06474f0bc53709d(data) {
    self setscriptablepartstate("damageHeavy", "on", 1);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b8a
// Size: 0x9c
function function_27ec7be8325efa3c(data) {
    self setscriptablepartstate("damageHeavy", "off", 1);
    var_78ebf58592491d35 = namespace_dace9d390bc4a290::function_89cda5ba9bfc8d56(self.var_5e7ed8e7a332998a);
    if (isdefined(var_78ebf58592491d35)) {
        foreach (struct in var_78ebf58592491d35) {
            self setscriptablepartstate(struct.var_1fb6b56a662df98, "off", 1);
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c2d
// Size: 0xb9
function vehicle_damage_getmaxhealth(vehicle, var_7731adef63e19b0c) {
    if (!isdefined(var_7731adef63e19b0c)) {
        var_7731adef63e19b0c = vehicle function_d93ec4635290febd();
    }
    var_962a30a9bb8c0f09 = vehicle_damage_getleveldata();
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c, 1);
    if (!isdefined(var_e2818ad39a3341b4)) {
        if (isdefined(vehicle)) {
            return vehicle.maxhealth;
        }
        return undefined;
    }
    if (!isdefined(var_e2818ad39a3341b4.health)) {
        if (isdefined(vehicle)) {
            return vehicle.maxhealth;
        }
        return undefined;
    }
    maxhealth = var_e2818ad39a3341b4.health;
    heavystatehealthadd = vehicle_damage_getheavystatehealthadd(var_7731adef63e19b0c);
    if (isdefined(heavystatehealthadd)) {
        maxhealth = maxhealth + heavystatehealthadd;
    }
    return int(maxhealth);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cee
// Size: 0xac
function vehicle_damage_getpristinestateminhealth(vehicle, var_7731adef63e19b0c) {
    if (!isdefined(var_7731adef63e19b0c)) {
        var_7731adef63e19b0c = vehicle function_d93ec4635290febd();
    }
    var_962a30a9bb8c0f09 = vehicle_damage_getleveldata();
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c, 1);
    if (!isdefined(var_e2818ad39a3341b4)) {
        return undefined;
    }
    if (!isdefined(var_e2818ad39a3341b4.health)) {
        return undefined;
    }
    var_6ad9ad03dc2fd0a0 = var_e2818ad39a3341b4.health * 0.9;
    heavystatehealthadd = vehicle_damage_getheavystatehealthadd(var_7731adef63e19b0c);
    if (isdefined(heavystatehealthadd)) {
        var_6ad9ad03dc2fd0a0 = var_6ad9ad03dc2fd0a0 + heavystatehealthadd;
    }
    if (!isdefined(var_6ad9ad03dc2fd0a0) || var_6ad9ad03dc2fd0a0 <= 0) {
        return undefined;
    }
    return int(var_6ad9ad03dc2fd0a0);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5da2
// Size: 0x84
function vehicle_damage_getheavystatemaxhealth(vehicle, var_7731adef63e19b0c) {
    if (!isdefined(var_7731adef63e19b0c)) {
        var_7731adef63e19b0c = vehicle function_d93ec4635290febd();
    }
    var_962a30a9bb8c0f09 = vehicle_damage_getleveldata();
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    if (!isdefined(var_e2818ad39a3341b4)) {
        return undefined;
    }
    if (!isdefined(var_e2818ad39a3341b4.health)) {
        return undefined;
    }
    heavystatehealthadd = vehicle_damage_getheavystatehealthadd(var_7731adef63e19b0c);
    if (!isdefined(heavystatehealthadd) || heavystatehealthadd <= 0) {
        return undefined;
    }
    return int(heavystatehealthadd);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e2e
// Size: 0x150
function vehicle_damage_updatestatemaxhealthvalues(var_7731adef63e19b0c) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    /#
        assertex(isdefined(var_e2818ad39a3341b4.health), "vehicle_damage_updateStateMaxHealthValues called on a vehicle whose level data has not assigned .health.");
    #/
    minhealth = undefined;
    maxhealth = undefined;
    foreach (var_cb322750051a892b, var_47bdb61121b1ec92 in var_e2818ad39a3341b4.damagestatedata) {
        if (var_cb322750051a892b == "light") {
            var_47bdb61121b1ec92.maxhealth = vehicle_damage_getpristinestateminhealth(undefined, var_7731adef63e19b0c);
            maxhealth = var_47bdb61121b1ec92.maxhealth;
        } else if (var_cb322750051a892b == "heavy") {
            var_47bdb61121b1ec92.maxhealth = vehicle_damage_getheavystatemaxhealth(undefined, var_7731adef63e19b0c);
            minhealth = var_47bdb61121b1ec92.maxhealth;
        }
    }
    var_47bdb61121b1ec92 = var_e2818ad39a3341b4.damagestatedata["medium"];
    if (isdefined(var_47bdb61121b1ec92)) {
        if (isdefined(minhealth) && isdefined(maxhealth)) {
            ratio = vehicle_damage_getmediumstatehealthratio(var_7731adef63e19b0c);
            if (isdefined(ratio)) {
                var_47bdb61121b1ec92.maxhealth = int(math::lerp(minhealth, maxhealth, ratio));
            }
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f85
// Size: 0x6c
function vehicle_damage_getheavystatehealthadd(var_7731adef63e19b0c) {
    var_962a30a9bb8c0f09 = vehicle_damage_getleveldata();
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    heavystatehealthadd = var_e2818ad39a3341b4.heavystatehealthadd;
    if (!isdefined(heavystatehealthadd)) {
        heavystatehealthadd = var_962a30a9bb8c0f09.heavystatehealthadd;
    }
    if (!isdefined(heavystatehealthadd) || heavystatehealthadd <= 0) {
        return undefined;
    }
    return int(heavystatehealthadd);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ff9
// Size: 0x6f
function vehicle_damage_getmediumstatehealthratio(var_7731adef63e19b0c) {
    var_962a30a9bb8c0f09 = vehicle_damage_getleveldata();
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    mediumstatehealthratio = var_e2818ad39a3341b4.mediumstatehealthratio;
    if (!isdefined(mediumstatehealthratio)) {
        mediumstatehealthratio = var_962a30a9bb8c0f09.mediumstatehealthratio;
    }
    if (!isdefined(mediumstatehealthratio) || mediumstatehealthratio <= 0 || mediumstatehealthratio > 1) {
        return undefined;
    }
    return mediumstatehealthratio;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6070
// Size: 0x1de
function function_1989bd346c21b68a(data) {
    if (isdefined(data.inflictor) && isdefined(data.inflictor.weapon_name) && data.inflictor.weapon_name == "gl") {
        return (isdefined(data.meansofdeath) && data.meansofdeath == "MOD_GRENADE");
    }
    if (isdefined(data.objweapon) && isdefined(data.objweapon.basename)) {
        switch (data.objweapon.basename) {
        case #"hash_708fb6e22f87a3a4":
        case #"hash_a622e958420b92a0":
            return (isdefined(data.meansofdeath) && (data.meansofdeath == "MOD_PROJECTILE" || data.meansofdeath == "MOD_RIFLE_BULLET"));
        case #"hash_13a265ac820ea0df":
        case #"hash_1717a0115ff7a1c4":
        case #"hash_3e782fd775b72022":
        case #"hash_5c272c0617caebf0":
        case #"hash_8c12df11df01f306":
        case #"hash_a86d4075406d2de4":
        case #"hash_fd9c279f85990dad":
            return (isdefined(data.meansofdeath) && data.meansofdeath == "MOD_PROJECTILE");
        case #"hash_c500a77b6bb7c5d0":
            return (isdefined(data.meansofdeath) && data.meansofdeath == "MOD_GRENADE");
        case #"hash_56ee829cc162271a":
            return (isdefined(data.meansofdeath) && data.meansofdeath == "MOD_EXPLOSIVE");
            break;
        }
    }
    return 0;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6256
// Size: 0x250
function function_6e87d9e8601d9029(vehicle, tagname, damagedata) {
    if (!isdefined(vehicle.var_aab9695c92b0ed96)) {
        return 0;
    }
    if (!isdefined(tagname)) {
        return 0;
    }
    if (!isdefined(vehicle.var_aab9695c92b0ed96[tagname])) {
        return 0;
    }
    if (function_853c0063f08b55e1(vehicle.var_aab9695c92b0ed96[tagname])) {
        return 0;
    }
    if (isdefined(damagedata) && isdefined(damagedata.objweapon) && (istrue(function_f3bb4f4911a1beb2("weapons", "isThrowingKnife", damagedata.objweapon)) || istrue(function_f3bb4f4911a1beb2("weapons", "isThrowStar", damagedata.objweapon)))) {
        var_bafa22fcdefff511 = function_2265b277a0dad0f1(vehicle function_d93ec4635290febd());
        if (!isdefined(var_bafa22fcdefff511[tagname].var_7cbffe9de982bcad)) {
            return 0;
        }
    }
    if (isdefined(damagedata) && isdefined(damagedata.objweapon) && isdefined(damagedata.meansofdeath) && damagedata.meansofdeath == "MOD_MELEE") {
        var_bafa22fcdefff511 = function_2265b277a0dad0f1(vehicle function_d93ec4635290febd());
        var_a3fee791925dcbb = namespace_d325722f2754c2c4::function_cfac6d60b7a14ab9(damagedata.objweapon);
        var_d5791473bec48061 = isdefined(var_bafa22fcdefff511[tagname].var_9eb2af3a3212b936);
        var_74224beb4580f9df = isdefined(var_bafa22fcdefff511[tagname].var_7cbffe9de982bcad);
        if (var_a3fee791925dcbb && !var_d5791473bec48061 && !var_74224beb4580f9df) {
            return 0;
        } else if (!var_a3fee791925dcbb && !var_d5791473bec48061) {
            return 0;
        }
    }
    if (isdefined(damagedata) && isdefined(damagedata.objweapon) && iscrossbowdamage(damagedata.objweapon)) {
        if (function_6065fce6cdcad(damagedata.objweapon) || function_d49206e61ac4f6de(damagedata.objweapon)) {
            return 0;
        }
        return function_ee1ff9eed64d1e5d(vehicle, tagname);
    }
    state = vehicle getscriptablepartstate(tagname, 1);
    if (isdefined(state) && state == "start_hidden") {
        return 0;
    }
    var_ecdff35842734458 = function_14cc373f72a021a8(vehicle function_d93ec4635290febd(), tagname);
    if (isdefined(var_ecdff35842734458)) {
        return [[ var_ecdff35842734458 ]](damagedata);
    }
    return 1;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64ae
// Size: 0xac
function function_452936099dcd1b94(seatid) {
    data = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldataforvehicle(function_d93ec4635290febd());
    return isdefined(data.seatdata[seatid]) && isdefined(data.seatdata[seatid].var_9a3db3c861da8d62) && isdefined(self.var_aab9695c92b0ed96) && isdefined(self.var_aab9695c92b0ed96[data.seatdata[seatid].var_9a3db3c861da8d62]) && !function_853c0063f08b55e1(self.var_aab9695c92b0ed96[data.seatdata[seatid].var_9a3db3c861da8d62]);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6562
// Size: 0x9c
function function_14219d4c7d83499f(seatid) {
    data = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldataforvehicle(function_d93ec4635290febd());
    if (isdefined(data.seatdata[seatid]) && isdefined(data.seatdata[seatid].var_9a3db3c861da8d62)) {
        self.var_aab9695c92b0ed96[data.seatdata[seatid].var_9a3db3c861da8d62].var_a776f097eb36e500 = 0;
        function_77db32aa48a42a76(self, data.seatdata[seatid].var_9a3db3c861da8d62);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6605
// Size: 0x47
function function_e6ec777562579771(vehicle, seatid) {
    self endon("death_or_disconnect");
    self endon("vehicle_seat_exit");
    waittill_any_2("vehicle_leanout_begin", "roof_exit");
    if (vehicle function_452936099dcd1b94(seatid)) {
        vehicle function_14219d4c7d83499f(seatid);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6653
// Size: 0x69
function function_14cc373f72a021a8(var_7731adef63e19b0c, tagname) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    var_cabb13caaf7baa1e = var_e2818ad39a3341b4.var_aab9695c92b0ed96[tagname].var_cabb13caaf7baa1e;
    if (isdefined(var_cabb13caaf7baa1e)) {
        switch (var_cabb13caaf7baa1e) {
        case #"hash_519952040ad478cb":
            return &function_43c057baaca777a5;
            break;
        }
    }
    return undefined;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66c4
// Size: 0x29
function function_2265b277a0dad0f1(var_7731adef63e19b0c) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    return var_e2818ad39a3341b4.var_aab9695c92b0ed96;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66f5
// Size: 0x3d
function function_f7df41d3ad15dca8(var_7731adef63e19b0c, tagname) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    return var_e2818ad39a3341b4.var_aab9695c92b0ed96[tagname].var_da9f4cd603f44758;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x673a
// Size: 0x3d
function function_bad6c0e32ff1e092(var_7731adef63e19b0c, tagname) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    return var_e2818ad39a3341b4.var_aab9695c92b0ed96[tagname].var_b4fccc158c681073;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x677f
// Size: 0x3d
function function_dde06c2157ec8895(var_7731adef63e19b0c, tagname) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    return var_e2818ad39a3341b4.var_aab9695c92b0ed96[tagname].var_1c60586652067d4c;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67c4
// Size: 0x45
function function_8a0e1b95abc01e56(var_7731adef63e19b0c, tagname) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    return function_53c4c53197386572(var_e2818ad39a3341b4.var_aab9695c92b0ed96[tagname].var_f0b290e6673ef286, 30);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6811
// Size: 0x3e
function function_3df56ded0597eb6e(var_7731adef63e19b0c, tagname) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    return istrue(var_e2818ad39a3341b4.var_aab9695c92b0ed96[tagname].var_9983055e997835be);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6857
// Size: 0x51
function function_c9f618f05861c2c5(var_7731adef63e19b0c, tagname) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    reduction = var_e2818ad39a3341b4.var_aab9695c92b0ed96[tagname].var_84872288b2e0ce95;
    if (!isdefined(reduction)) {
        reduction = 0;
    }
    return reduction;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68b0
// Size: 0xbe
function function_ee1ff9eed64d1e5d(vehicle, tagname, var_e691c80ba12c3da1) {
    if (!isdefined(var_e691c80ba12c3da1)) {
        var_e691c80ba12c3da1 = 1;
    }
    if (!isdefined(tagname)) {
        return 0;
    }
    if (!isdefined(vehicle.var_aab9695c92b0ed96)) {
        return 0;
    }
    if (!isdefined(vehicle.var_aab9695c92b0ed96[tagname])) {
        return 0;
    }
    var_bafa22fcdefff511 = function_2265b277a0dad0f1(vehicle function_d93ec4635290febd());
    var_d5791473bec48061 = isdefined(var_bafa22fcdefff511[tagname].var_9eb2af3a3212b936);
    var_74224beb4580f9df = isdefined(var_bafa22fcdefff511[tagname].var_7cbffe9de982bcad);
    if (var_74224beb4580f9df) {
        return 1;
    }
    if (var_e691c80ba12c3da1) {
        if (var_d5791473bec48061) {
            return 1;
        }
        if (issubstr(tagname, "tag_light")) {
            return 1;
        }
    }
    return 0;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6976
// Size: 0xb1
function function_82cad97b4499e421(vehicle, tagname, reactivearmorexplosion) {
    data = function_29b4292c92443328(vehicle function_d93ec4635290febd());
    var_bafa22fcdefff511 = data.damage.var_aab9695c92b0ed96[tagname];
    if (istrue(reactivearmorexplosion)) {
        return "reactive_armor_explosion";
    } else if (!vehicle function_b7148a3bfc4defb2() && isdefined(var_bafa22fcdefff511.var_7cbffe9de982bcad) && var_bafa22fcdefff511.var_7cbffe9de982bcad != "not_a_wheel" && istrue(level.var_ec75ca2494d74dab)) {
        return "death_usable";
    } else {
        return "death";
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a2e
// Size: 0x1ad
function function_9c23735bf7534afa(vehicle, damage, point, radius) {
    if (!isdefined(vehicle) || !isdefined(vehicle.var_aab9695c92b0ed96) || vehicle.var_aab9695c92b0ed96.size == 0) {
        return;
    }
    ref = vehicle function_d93ec4635290febd();
    var_8490f7216313a83 = function_90b374d856d14373(ref);
    var_bafa22fcdefff511 = function_2265b277a0dad0f1(ref);
    var_8fa87d2c8780e014 = radius * radius;
    var_1763b6cd86ff52f2 = undefined;
    var_6aaeea4a5b05a723 = undefined;
    var_21528cf722158315 = undefined;
    foreach (tagname, var_aedb57673cf38e2b in vehicle.var_aab9695c92b0ed96) {
        if (vehicle tagexists(tagname) && istrue(var_bafa22fcdefff511[tagname].var_30beabb585e60744)) {
            var_c88d34bee5a69c56 = distancesquared(point, vehicle gettagorigin(tagname));
            if (var_c88d34bee5a69c56 <= var_8fa87d2c8780e014 && function_6e87d9e8601d9029(vehicle, tagname) && (!isdefined(var_1763b6cd86ff52f2) || var_c88d34bee5a69c56 < var_1763b6cd86ff52f2)) {
                var_1763b6cd86ff52f2 = var_c88d34bee5a69c56;
                var_6aaeea4a5b05a723 = tagname;
                var_21528cf722158315 = var_aedb57673cf38e2b;
            }
        }
    }
    if (isdefined(var_6aaeea4a5b05a723) && isdefined(var_21528cf722158315)) {
        var_21528cf722158315.var_a776f097eb36e500 = max(0, var_21528cf722158315.var_a776f097eb36e500 - damage);
        if (function_853c0063f08b55e1(var_21528cf722158315)) {
            function_77db32aa48a42a76(vehicle, var_6aaeea4a5b05a723);
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6be2
// Size: 0x22d
function function_ecdf1217e332c7d7(vehicle, damage, point, var_5d5f540ec81c82a9) {
    if (!isdefined(vehicle) || !isdefined(vehicle.var_aab9695c92b0ed96) || vehicle.var_aab9695c92b0ed96.size == 0 || var_5d5f540ec81c82a9 == 0) {
        return;
    }
    ref = vehicle function_d93ec4635290febd();
    var_bafa22fcdefff511 = function_2265b277a0dad0f1(ref);
    wheels = [];
    foreach (tagname, var_aedb57673cf38e2b in vehicle.var_aab9695c92b0ed96) {
        if (!vehicle tagexists(tagname) || !isdefined(var_bafa22fcdefff511[tagname].var_7cbffe9de982bcad) || !isdefined(vehicle.var_aab9695c92b0ed96[tagname]) || function_853c0063f08b55e1(vehicle.var_aab9695c92b0ed96[tagname])) {
            continue;
        }
        var_f03d6aedc78419b8 = spawnstruct();
        var_f03d6aedc78419b8.origin = vehicle gettagorigin(tagname);
        var_f03d6aedc78419b8.tag = tagname;
        var_f03d6aedc78419b8.data = var_aedb57673cf38e2b;
        wheels[wheels.size] = var_f03d6aedc78419b8;
    }
    if (wheels.size == 0) {
        return;
    }
    foreach (wheel in sortbydistance(wheels, point)) {
        wheel.data.var_a776f097eb36e500 = max(0, wheel.data.var_a776f097eb36e500 - damage);
        if (function_853c0063f08b55e1(wheel.data)) {
            function_77db32aa48a42a76(vehicle, wheel.tag);
        }
        var_5d5f540ec81c82a9 = var_5d5f540ec81c82a9 - 1;
        if (var_5d5f540ec81c82a9 <= 0) {
            return;
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e16
// Size: 0x337
function function_786c7ec25aad5005(vehicle, damagedata) {
    var_f1a0290e8f712715 = [];
    var_32665adb2a4d8fc9 = [];
    if (isdefined(damagedata.partname) && isstring(damagedata.partname) && damagedata.partname != "" && vehicle tagexists(damagedata.partname)) {
        var_f1a0290e8f712715[damagedata.partname] = damagedata.partname;
    }
    if (isdefined(damagedata.var_799f234362adb813) && isstring(damagedata.var_799f234362adb813) && damagedata.var_799f234362adb813 != "" && vehicle tagexists(damagedata.var_799f234362adb813)) {
        var_f1a0290e8f712715[damagedata.var_799f234362adb813] = damagedata.var_799f234362adb813;
    }
    foreach (tag in var_f1a0290e8f712715) {
        var_32665adb2a4d8fc9[tag] = distancesquared(damagedata.point, vehicle gettagorigin(tag));
    }
    if (isdefined(vehicle.var_aab9695c92b0ed96) && vehicle.var_aab9695c92b0ed96.size > 0 && isexplosivedamagemod(damagedata.meansofdeath)) {
        data = vehicle_damage_getleveldataforvehicle(vehicle function_d93ec4635290febd());
        var_8490f7216313a83 = data.var_8490f7216313a83;
        var_2f51e76299064178 = data.var_3259f2f4faf8eaa8;
        foreach (tagname, var_a776f097eb36e500 in vehicle.var_aab9695c92b0ed96) {
            if (vehicle tagexists(tagname) && !function_853c0063f08b55e1(var_a776f097eb36e500) && !isdefined(var_f1a0290e8f712715[tagname])) {
                distancesq = distancesquared(damagedata.point, vehicle gettagorigin(tagname));
                if (distancesq <= var_8490f7216313a83) {
                    var_f1a0290e8f712715[tagname] = tagname;
                    var_32665adb2a4d8fc9[tagname] = distancesq;
                }
            }
        }
        if (isdefined(var_2f51e76299064178) && var_32665adb2a4d8fc9.size > var_2f51e76299064178) {
            var_592b7f1a155451e0 = [];
            for (i = 0; i < var_2f51e76299064178; i++) {
                closest = undefined;
                closestdistance = undefined;
                foreach (tagname, var_da8add1d7d930260 in var_32665adb2a4d8fc9) {
                    if (!isdefined(closestdistance) || var_da8add1d7d930260 < closestdistance) {
                        closestdistance = var_da8add1d7d930260;
                        closest = tagname;
                    }
                }
                if (isdefined(closest)) {
                    var_592b7f1a155451e0[i] = closest;
                    var_32665adb2a4d8fc9[closest] = undefined;
                } else {
                    return var_592b7f1a155451e0;
                }
            }
            return var_592b7f1a155451e0;
        }
    }
    return var_f1a0290e8f712715;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7155
// Size: 0xdf
function function_7a5070220fc8ce9e(var_7731adef63e19b0c, var_aab9695c92b0ed96) {
    var_3102ea0dd30bbf11 = function_32b9b5d07bb56c31(var_7731adef63e19b0c);
    var_dfdbcc779477d31c = [];
    foreach (tag, part in var_3102ea0dd30bbf11) {
        if (istrue(part.inactive)) {
            continue;
        }
        if (isdefined(var_aab9695c92b0ed96[tag])) {
            var_dfdbcc779477d31c[tag] = var_aab9695c92b0ed96[tag];
        } else {
            var_1c09c3e40955f379 = spawnstruct();
            var_1c09c3e40955f379.var_a776f097eb36e500 = part.var_a776f097eb36e500;
            var_1c09c3e40955f379.var_92894ef28e2b8800 = part.var_92894ef28e2b8800;
            var_dfdbcc779477d31c[tag] = var_1c09c3e40955f379;
        }
    }
    return var_dfdbcc779477d31c;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x723c
// Size: 0xa8
function function_cf63db12f07abf78(var_7731adef63e19b0c, var_aab9695c92b0ed96) {
    if (!isdefined(var_aab9695c92b0ed96)) {
        return;
    }
    foreach (tagname, var_1c09c3e40955f379 in var_aab9695c92b0ed96) {
        if (function_600ff5df9dbf294(var_7731adef63e19b0c, tagname, var_1c09c3e40955f379)) {
            var_1c09c3e40955f379.var_a776f097eb36e500 = 0;
            function_66ac97eba6b35b4a(self, tagname, undefined);
        } else if (function_e531ad775dcbca22(var_7731adef63e19b0c, tagname, var_1c09c3e40955f379)) {
            var_1c09c3e40955f379.var_a776f097eb36e500 = 0;
            function_77db32aa48a42a76(self, tagname, undefined);
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72eb
// Size: 0x38
function function_e531ad775dcbca22(var_7731adef63e19b0c, var_151b23f6c7d09cf8, var_8178911a49ba9be9) {
    var_65e4a4e3e5e2766f = function_8a0e1b95abc01e56(var_7731adef63e19b0c, var_151b23f6c7d09cf8);
    return randomint(100) < var_65e4a4e3e5e2766f;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x732b
// Size: 0x2f
function function_600ff5df9dbf294(var_7731adef63e19b0c, var_151b23f6c7d09cf8, var_8178911a49ba9be9) {
    return function_3df56ded0597eb6e(var_7731adef63e19b0c, var_151b23f6c7d09cf8) || function_853c0063f08b55e1(var_8178911a49ba9be9);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7362
// Size: 0x2a
function function_853c0063f08b55e1(var_1c09c3e40955f379) {
    return var_1c09c3e40955f379.var_a776f097eb36e500 == 0 || var_1c09c3e40955f379.var_92894ef28e2b8800 == 0;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7394
// Size: 0x29
function function_90b374d856d14373(var_7731adef63e19b0c) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    return var_e2818ad39a3341b4.var_8490f7216313a83;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73c5
// Size: 0x1c
function function_43c057baaca777a5(damagedata) {
    return isexplosivedamagemod(damagedata.meansofdeath);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73e9
// Size: 0x19d
function vehicle_damage_beginburndown(data) {
    self endon("death");
    self endon("end_burn_down");
    ref = function_d93ec4635290febd();
    if (!istrue(self.burningdown)) {
        var_e2818ad39a3341b4 = vehicle_getleveldataforvehicle(ref);
        burndowntime = vehicle_damage_getburndowntime(ref);
        if (isdefined(burndowntime)) {
            self.burningdown = 1;
            if (isdefined(data)) {
                if (isdefined(data.attacker)) {
                    self.var_9328ded553f15d2b = data.attacker;
                } else {
                    self.var_9328ded553f15d2b = undefined;
                }
                if (isdefined(data.objweapon)) {
                    self.var_3d917147266db534 = data.objweapon;
                } else {
                    self.var_3d917147266db534 = undefined;
                }
                /#
                    if (isdefined(data.attacker)) {
                        /#
                            assertex(isdefined(data.objweapon), "<unknown string>");
                        #/
                        /#
                            assertex(isdefined(data.objweapon) && isdefined(data.objweapon.basename), "<unknown string>");
                        #/
                    }
                #/
            }
            occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self, 0);
            if (isdefined(occupants)) {
                namespace_84cff6185e39aa66::vehomn_showwarning("burningDown", occupants, ref);
            }
            if (issharedfuncdefined(ref, "beginBurnDown")) {
                [[ getsharedfunc(ref, "beginBurnDown") ]]();
            }
            childthread function_43536e2e28cc20c0(data, burndowntime);
            wait(burndowntime);
            self.burningdown = undefined;
            namespace_74465391b3cf76b::checkcarpuncherprogressgeneric();
            thread function_ab08028468ab68f9(data, 0);
            return;
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x758d
// Size: 0xbf
function function_43536e2e28cc20c0(data, burndowntime) {
    remaininghealth = self.health;
    if (isdefined(data) && isdefined(data.damage)) {
        remaininghealth = self.health - data.damage;
    }
    var_ec2b154791158e97 = int(ceil(burndowntime / 1));
    var_76e563db5d11a0ea = int(ceil(remaininghealth / var_ec2b154791158e97 / 0.25));
    for (i = 0; i < var_ec2b154791158e97; i++) {
        wait(1);
        self dodamage(var_76e563db5d11a0ea, self.origin);
        function_9542eac6997b9060(self);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7653
// Size: 0x63
function vehicle_damage_endburndown(var_fcef8d217a441961) {
    if (!istrue(self.burningdown)) {
        return;
    }
    self notify("end_burn_down");
    namespace_74465391b3cf76b::checkcarpuncherprogressgeneric();
    if (!istrue(var_fcef8d217a441961)) {
        occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self, 0);
        if (isdefined(occupants)) {
            namespace_84cff6185e39aa66::vehomn_hidewarning("burningDown", occupants, function_d93ec4635290febd());
        }
    }
    self.burningdown = undefined;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76bd
// Size: 0xd
function vehicle_damage_isburningdown() {
    return istrue(self.burningdown);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76d2
// Size: 0x7e
function vehicle_damage_getburndowntime(var_7731adef63e19b0c) {
    if (isdefined(self.burndowntime)) {
        return self.burndowntime;
    }
    var_962a30a9bb8c0f09 = vehicle_damage_getleveldata();
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c);
    burndowntime = var_e2818ad39a3341b4.burndowntime;
    if (!isdefined(burndowntime)) {
        burndowntime = var_962a30a9bb8c0f09.burndowntime;
    }
    if (!isdefined(burndowntime) || burndowntime <= 0) {
        return undefined;
    }
    return burndowntime;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7758
// Size: 0x1e7
function vehicle_damage_shouldskipburndown(data) {
    vehiclename = function_d93ec4635290febd();
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(vehiclename, undefined, 1);
    if (isdefined(var_e2818ad39a3341b4)) {
        if (!function_b7148a3bfc4defb2() && istrue(var_e2818ad39a3341b4.skipburndown)) {
            return 1;
        }
    }
    if (!isdefined(data)) {
        return 0;
    }
    if (isdefined(data.meansofdeath)) {
        if (!isexplosivedamagemod(data.meansofdeath) && data.meansofdeath != "MOD_FIRE") {
            return 0;
        }
        if (data.meansofdeath == "MOD_CRUSH") {
            return 1;
        }
    }
    if (isdefined(data.objweapon) && !isnullweapon(data.objweapon) && isdefined(function_d93ec4635290febd())) {
        var_d6961ef4ab70843c = undefined;
        weaponname = data.objweapon.basename;
        var_962a30a9bb8c0f09 = vehicle_damage_getleveldata();
        table = var_962a30a9bb8c0f09.table;
        if (isdefined(var_962a30a9bb8c0f09.table.skipburndownforvehicle[vehiclename])) {
            var_d6961ef4ab70843c = var_962a30a9bb8c0f09.table.skipburndownforvehicle[vehiclename][weaponname];
        }
        if (isdefined(var_d6961ef4ab70843c)) {
            return var_d6961ef4ab70843c;
        }
        if (isdefined(var_e2818ad39a3341b4)) {
            classname = var_e2818ad39a3341b4.class;
            if (!isdefined(classname) || classname == "none") {
                return 1;
            }
            if (isdefined(var_962a30a9bb8c0f09.table.skipburndownforclass[classname])) {
                var_d6961ef4ab70843c = var_962a30a9bb8c0f09.table.skipburndownforclass[classname][weaponname];
            }
            if (isdefined(var_d6961ef4ab70843c)) {
                return var_d6961ef4ab70843c;
            }
        } else {
            return 1;
        }
    } else {
        return 1;
    }
    return 0;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7947
// Size: 0x1d
function function_7aaa7ae503292f43(var_7731adef63e19b0c) {
    return vehicle_getleveldataforvehicle(var_7731adef63e19b0c).weapon;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x796c
// Size: 0x5a
function function_6c17abf5c5d88ca(var_7731adef63e19b0c) {
    data = vehicle_getleveldataforvehicle(var_7731adef63e19b0c);
    return ter_op(isdefined(data.var_fb41d1ca75009bf0.weapon), data.var_fb41d1ca75009bf0.weapon, data.weapon);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79ce
// Size: 0x372
function function_d0df49de517ded03() {
    ref = function_d93ec4635290febd();
    data = function_29b4292c92443328(ref);
    var_5e1984dbb5848080 = function_b7148a3bfc4defb2();
    var_f48d20dfef6af564 = ter_op(var_5e1984dbb5848080 || istrue(self.var_a8f4bb03b366aa80) && isdefined(data.var_eb61d7c4087c9207), data.var_eb61d7c4087c9207, data.var_14090bc312dbf6c8);
    var_c094db262ce4dfa0 = ter_op(var_5e1984dbb5848080, function_6c17abf5c5d88ca(ref), function_7aaa7ae503292f43(ref));
    mtx = self.mtx;
    waittillframeend();
    /#
        assertex(isdefined(var_f48d20dfef6af564), "vehicle_damage_explode: Didn't find explosion data. Either vehicle_damage_initVehicle wasn't called or there's no data for this vehicle in vehicleexplosion.csv");
    #/
    var_240a4f3d560753ff = self gettagorigin(var_f48d20dfef6af564.tag);
    var_526fb1abff9d991f = var_240a4f3d560753ff;
    if (isdefined(var_f48d20dfef6af564.var_f66ddd6b1919c847)) {
        var_526fb1abff9d991f = var_526fb1abff9d991f + rotatevector((function_53c4c53197386572(var_f48d20dfef6af564.var_f66ddd6b1919c847.x, 0), function_53c4c53197386572(var_f48d20dfef6af564.var_f66ddd6b1919c847.y, 0), function_53c4c53197386572(var_f48d20dfef6af564.var_f66ddd6b1919c847.z, 0)), self.angles);
    }
    attacker = ter_op(isdefined(self.var_9328ded553f15d2b), self.var_9328ded553f15d2b, self);
    self radiusdamage(var_526fb1abff9d991f, var_f48d20dfef6af564.radius, var_f48d20dfef6af564.maxdamage, var_f48d20dfef6af564.mindamage, attacker, "MOD_EXPLOSIVE", var_c094db262ce4dfa0);
    fxname = self.vehiclename + "_explosion";
    if (fxexists(fxname)) {
        playfx(getfx(fxname), var_240a4f3d560753ff, anglestoforward(self.angles), anglestoup(self.angles));
    }
    if (isdefined(var_f48d20dfef6af564.sfx)) {
        playsoundatpos(var_240a4f3d560753ff, var_f48d20dfef6af564.sfx);
    }
    self stopsounds();
    if (isdefined(var_f48d20dfef6af564.scriptable)) {
        var_fd1b8efde6acaf63 = spawn("script_model", var_240a4f3d560753ff);
        var_fd1b8efde6acaf63 setmodel(var_f48d20dfef6af564.scriptable);
        if (isdefined(mtx) && isdefined(mtx.var_c3606975ab404c5c) && mtx.var_c3606975ab404c5c != "" && var_fd1b8efde6acaf63 getscriptableparthasstate("explosion", mtx.var_c3606975ab404c5c)) {
            var_fd1b8efde6acaf63 setscriptablepartstate("explosion", mtx.var_c3606975ab404c5c);
        } else {
            var_fd1b8efde6acaf63 setscriptablepartstate("explosion", "on");
        }
        var_fd1b8efde6acaf63.angles = self.angles;
        var_fd1b8efde6acaf63 thread function_7d040e8b44f42b5f();
    }
    if (isdefined(var_f48d20dfef6af564.earthquakescale) && var_f48d20dfef6af564.earthquakescale > 0) {
        earthquake(var_f48d20dfef6af564.earthquakescale, var_f48d20dfef6af564.var_bda0b1d6cce0914, var_240a4f3d560753ff, var_f48d20dfef6af564.earthquakeradius);
    }
    playrumbleonposition("grenade_rumble", var_240a4f3d560753ff);
    physicsexplosionsphere(var_240a4f3d560753ff, var_f48d20dfef6af564.var_a1939e49d568612b, var_f48d20dfef6af564.var_9ed85c24dbcf8da4, var_f48d20dfef6af564.var_fddf5fe707f47e54);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d47
// Size: 0xd
function function_7d040e8b44f42b5f() {
    wait(7);
    self delete();
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d5b
// Size: 0x14
function function_734926fcdbad1fd4() {
    if (namespace_1f188a13f7e79610::function_b7148a3bfc4defb2()) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d76
// Size: 0x24e
function vehicle_damage_onenterstateheavyscore(var_1ae0aeb37c917298, data) {
    if (isdefined(data) && isdefined(data.attacker)) {
        var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(function_d93ec4635290febd(), undefined, 1);
        if (isdefined(var_e2818ad39a3341b4)) {
            var_72141eab56fb408f = vehicle_damage_getinstancedataforvehicle(self, undefined, 1);
            scoreevent = undefined;
            var_8d930baa3b013616 = undefined;
            award = undefined;
            var_49134347b50c0b0f = undefined;
            if (isdefined(var_72141eab56fb408f)) {
                scoreevent = var_72141eab56fb408f.heavydamagescoreevent;
                var_8d930baa3b013616 = var_72141eab56fb408f.heavydamagescorelaunchonly;
                award = var_72141eab56fb408f.heavydamageaward;
                var_49134347b50c0b0f = var_72141eab56fb408f.heavydamageawardlaunchonly;
            }
            if (isdefined(var_e2818ad39a3341b4.class)) {
                if (!isdefined(scoreevent)) {
                    switch (var_e2818ad39a3341b4.class) {
                    case #"hash_d2a55c7ac538641b":
                    case #"hash_d582c3286e5c390f":
                        scoreevent = #"hash_f9162cf6b4695651";
                        break;
                    case #"hash_21622ca3ad06efb5":
                    case #"hash_53e0b558455f04c6":
                    case #"hash_c71b112fe04823d6":
                        scoreevent = #"hash_8d625b12eb84e958";
                        break;
                    case #"hash_2453c9ffec9f5c20":
                    case #"hash_e8ec392f4f2724e4":
                        scoreevent = #"hash_cf6baa13dac1910a";
                        break;
                    }
                }
                if (!isdefined(award)) {
                }
            }
            if (isdefined(scoreevent) && scoreevent == #"none") {
                scoreevent = undefined;
            }
            if (isdefined(award) && award == "none") {
                award = undefined;
            }
            if (!istrue(data.givepointsandxp) && isplayer(data.attacker)) {
                data.givepointsandxp = namespace_1f188a13f7e79610::vehicle_isenemytoplayer(self, data.attacker);
            }
            if (isdefined(data.objweapon) && weaponclass(data.objweapon.basename) != "rocketlauncher") {
                if (istrue(var_8d930baa3b013616)) {
                    data.scoreeventnoweaponxp = 1;
                }
                if (istrue(var_49134347b50c0b0f)) {
                    data.awardnoweaponxp = 1;
                }
            }
            data.attacker thread vehicle_damage_givescoreandxpatframeend(scoreevent, award, data, self);
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fcb
// Size: 0x330
function vehicle_damage_ondeathscore(data) {
    if (isdefined(data) && isdefined(data.attacker)) {
        var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(function_d93ec4635290febd(), undefined, 1);
        if (isdefined(var_e2818ad39a3341b4)) {
            var_72141eab56fb408f = vehicle_damage_getinstancedataforvehicle(self, undefined, 1);
            scoreevent = undefined;
            var_8d930baa3b013616 = undefined;
            award = undefined;
            var_49134347b50c0b0f = undefined;
            if (isdefined(var_72141eab56fb408f)) {
                scoreevent = var_72141eab56fb408f.destroyscoreevent;
                var_8d930baa3b013616 = var_72141eab56fb408f.destroyscorelaunchonly;
                award = var_72141eab56fb408f.destroyaward;
                var_49134347b50c0b0f = var_72141eab56fb408f.destroyawardlaunchonly;
            }
            if (isdefined(var_e2818ad39a3341b4.class)) {
                if (!isdefined(scoreevent)) {
                    switch (var_e2818ad39a3341b4.class) {
                    case #"hash_d2a55c7ac538641b":
                    case #"hash_d582c3286e5c390f":
                        scoreevent = #"hash_838cff6819237d00";
                        break;
                    case #"hash_21622ca3ad06efb5":
                    case #"hash_53e0b558455f04c6":
                    case #"hash_c71b112fe04823d6":
                        scoreevent = #"hash_f82e57f24f4a4993";
                        break;
                    case #"hash_2453c9ffec9f5c20":
                    case #"hash_e8ec392f4f2724e4":
                        scoreevent = #"hash_d4032a806beebc83";
                        break;
                    default:
                        scoreevent = #"none";
                        break;
                    }
                }
                if (!isdefined(award)) {
                }
            }
            if (isdefined(scoreevent) && scoreevent == #"none") {
                scoreevent = undefined;
            }
            if (isdefined(award) && award == "none") {
                award = undefined;
            }
            if (isplayer(data.attacker)) {
                if (!isdefined(data.givepointsandxp)) {
                    data.givepointsandxp = namespace_1f188a13f7e79610::vehicle_isenemytoplayer(self, data.attacker);
                } else if (data.givepointsandxp && namespace_1f188a13f7e79610::vehicle_isfriendlytoplayer(self, data.attacker)) {
                    data.givepointsandxp = 0;
                } else if (!data.givepointsandxp && namespace_1f188a13f7e79610::vehicle_isenemytoplayer(self, data.attacker)) {
                    data.givepointsandxp = 1;
                }
            } else {
                data.givepointsandxp = 0;
            }
            if (isdefined(data.objweapon) && weaponclass(data.objweapon.basename) != "rocketlauncher") {
                if (istrue(var_8d930baa3b013616)) {
                    data.scoreeventnoweaponxp = 1;
                }
                if (istrue(var_49134347b50c0b0f)) {
                    data.awardnoweaponxp = 1;
                }
            }
            if (issharedfuncdefined("challenges", "onVehicleKilled")) {
                data.attacker thread [[ getsharedfunc("challenges", "onVehicleKilled") ]](self, data.attacker, data.damage, data.objweapon);
            }
            data.attacker vehicle_damage_givescoreandxp(scoreevent, award, data, self getentitynumber());
        }
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8302
// Size: 0x52
function vehicle_damage_givescoreandxpatframeend(scoreevent, award, data, vehicle) {
    var_9d9017e622fdf70b = vehicle getentitynumber();
    self endon("disconnect");
    self endon("vehicle_damage_giveScoreAndXP" + var_9d9017e622fdf70b);
    waittillframeend();
    thread vehicle_damage_givescoreandxp(scoreevent, award, data, var_9d9017e622fdf70b);
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x835b
// Size: 0xef
function vehicle_damage_givescoreandxp(scoreevent, award, data, var_9d9017e622fdf70b) {
    self notify("vehicle_damage_giveScoreAndXP" + var_9d9017e622fdf70b);
    if (isdefined(scoreevent) && issharedfuncdefined("vehicle_damage", "giveScore")) {
        objweapon = ter_op(istrue(data.scoreeventnoweaponxp), undefined, data.objweapon);
        self [[ getsharedfunc("vehicle_damage", "giveScore") ]](scoreevent, objweapon, !istrue(data.givepointsandxp));
    }
    if (isdefined(award) && issharedfuncdefined("vehicle_damage", "giveAward")) {
        objweapon = ter_op(istrue(data.awardnoweaponxp), undefined, data.objweapon);
        self [[ getsharedfunc("vehicle_damage", "giveAward") ]](award, objweapon, !istrue(data.givepointsandxp));
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8451
// Size: 0x4e
function vehicle_damage_setweaponclassmoddamageforvehicle(weaponclass, mod, var_21e99fcec7e19345, var_7731adef63e19b0c) {
    if (issharedfuncdefined("vehicle_damage", "setWeaponClassModDamageForVehicle")) {
        [[ getsharedfunc("vehicle_damage", "setWeaponClassModDamageForVehicle") ]](weaponclass, mod, var_21e99fcec7e19345, var_7731adef63e19b0c);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84a6
// Size: 0x45
function vehicle_damage_setperkmoddamage(ref, mod, var_21e99fcec7e19345) {
    if (issharedfuncdefined("vehicle_damage", "setPerkModDamage")) {
        [[ getsharedfunc("vehicle_damage", "setPerkModDamage") ]](ref, mod, var_21e99fcec7e19345);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84f2
// Size: 0x3c
function vehicle_damage_setweaponhitdamagedata(weaponref, hitsperattack) {
    if (issharedfuncdefined("vehicle_damage", "setWeaponHitDamageData")) {
        [[ getsharedfunc("vehicle_damage", "setWeaponHitDamageData") ]](weaponref, hitsperattack);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8535
// Size: 0x3c
function vehicle_damage_setvehiclehitdamagedata(var_7731adef63e19b0c, hitstokill) {
    if (issharedfuncdefined("vehicle_damage", "setVehicleHitDamageData")) {
        [[ getsharedfunc("vehicle_damage", "setVehicleHitDamageData") ]](var_7731adef63e19b0c, hitstokill);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8578
// Size: 0x45
function vehicle_damage_setvehiclehitdamagedataforweapon(var_7731adef63e19b0c, hitstokill, weaponref) {
    if (issharedfuncdefined("vehicle_damage", "setVehicleHitDamageDataForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "setVehicleHitDamageDataForWeapon") ]](var_7731adef63e19b0c, hitstokill, weaponref);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85c4
// Size: 0x45
function vehicle_damage_setweaponhitdamagedataforvehicle(weaponref, hitsperattack, var_7731adef63e19b0c) {
    if (issharedfuncdefined("vehicle_damage", "setWeaponHitDamageDataForVehicle")) {
        [[ getsharedfunc("vehicle_damage", "setWeaponHitDamageDataForVehicle") ]](weaponref, hitsperattack, var_7731adef63e19b0c);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8610
// Size: 0x3c
function vehicle_damage_setpremoddamagecallback(var_7731adef63e19b0c, callback) {
    if (issharedfuncdefined("vehicle_damage", "setPreModDamageCallback")) {
        [[ getsharedfunc("vehicle_damage", "setPreModDamageCallback") ]](var_7731adef63e19b0c, callback);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8653
// Size: 0x3c
function vehicle_damage_setpostmoddamagecallback(var_7731adef63e19b0c, callback) {
    if (issharedfuncdefined("vehicle_damage", "setPostModDamageCallback")) {
        [[ getsharedfunc("vehicle_damage", "setPostModDamageCallback") ]](var_7731adef63e19b0c, callback);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8696
// Size: 0x3c
function vehicle_damage_setdeathcallback(var_7731adef63e19b0c, callback) {
    if (issharedfuncdefined("vehicle_damage", "setDeathCallback")) {
        [[ getsharedfunc("vehicle_damage", "setDeathCallback") ]](var_7731adef63e19b0c, callback);
    }
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x86d9
// Size: 0x5b
function function_e5cde837844c6112(var_7731adef63e19b0c, seatid, damagescale) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c, 1);
    if (!isdefined(var_e2818ad39a3341b4.var_b7b1ddcaaf4bf2db)) {
        var_e2818ad39a3341b4.var_b7b1ddcaaf4bf2db = [];
    }
    var_e2818ad39a3341b4.var_b7b1ddcaaf4bf2db[seatid] = damagescale;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x873b
// Size: 0x5b
function function_42b7542e79da627f(var_7731adef63e19b0c, seatid, var_512d1bc7add3eaa3) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(var_7731adef63e19b0c, 1);
    if (!isdefined(var_e2818ad39a3341b4.var_8f793c5830904e92)) {
        var_e2818ad39a3341b4.var_8f793c5830904e92 = [];
    }
    var_e2818ad39a3341b4.var_8f793c5830904e92[seatid] = var_512d1bc7add3eaa3;
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x879d
// Size: 0x2e
function vehicle_damage_initdebug() {
    setdvarifuninitialized(@"hash_32ee2ef39806b3b9", 0);
    setdvarifuninitialized(@"hash_4827ebae75561872", 0);
    /#
        thread function_cc07937f89e8a007();
    #/
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x87d2
// Size: 0x133
function function_cc07937f89e8a007() {
    /#
        level.vehiclegod = getdvarint(@"hash_32ee2ef39806b3b9", 0) > 0;
        while (1) {
            var_ba7314cd05f473b3 = getdvarint(@"hash_4827ebae75561872", 0);
            if (var_ba7314cd05f473b3 > 0) {
                vehicles = namespace_f64231d5b7a2c3c4::vehicle_tracking_getgameinstancesforall();
                if (vehicles.size > 0) {
                    iprintln("<unknown string>" + var_ba7314cd05f473b3 + "<unknown string>");
                }
                foreach (vehicle in vehicles) {
                    if (isdefined(vehicle) && !vehicle namespace_1f188a13f7e79610::isvehicledestroyed()) {
                        function_a4e5dc47d7128f1d(vehicle, var_ba7314cd05f473b3);
                    }
                }
                setdevdvar(@"hash_4827ebae75561872", 0);
            }
            vehiclegod = getdvarint(@"hash_32ee2ef39806b3b9", 0) > 0;
            if (level.vehiclegod != vehiclegod) {
                if (vehiclegod) {
                    iprintln("<unknown string>");
                } else {
                    iprintln("<unknown string>");
                }
                level.vehiclegod = vehiclegod;
            }
            waitframe();
        }
    #/
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x890c
// Size: 0xa6
function function_a4e5dc47d7128f1d(vehicle, percent) {
    /#
        damagedata = spawnstruct();
        attacker = level.players[0];
        percent = min(percent, 100) / 100;
        damage = int(min(vehicle.health, ceil(vehicle.maxhealth * percent)));
        thread function_28c5e9f1993854aa();
        vehicle dodamage(damage, vehicle.origin, attacker, undefined, "<unknown string>");
        thread function_a6106f4cf6a1233();
    #/
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x89b9
// Size: 0x49
function function_28c5e9f1993854aa() {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        if (!isdefined(level.var_b33ac1e06f0e735a)) {
            level.var_b33ac1e06f0e735a = istrue(level.vehiclefriendlydamage);
            level.vehiclefriendlydamage = 1;
        }
        waittillframeend();
        thread function_a6106f4cf6a1233();
    #/
}

// Namespace vehicle_damage/namespace_5a0f3ca265d3a4c8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a09
// Size: 0x37
function function_a6106f4cf6a1233() {
    /#
        level notify("<unknown string>");
        if (isdefined(level.var_b33ac1e06f0e735a)) {
            level.vehiclefriendlydamage = level.var_b33ac1e06f0e735a;
            level.var_b33ac1e06f0e735a = undefined;
        }
    #/
}
