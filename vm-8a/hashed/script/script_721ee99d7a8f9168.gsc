#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\common\anim.gsc;

#namespace namespace_66c684fea143fbfd;

// Namespace namespace_66c684fea143fbfd / namespace_801fa17f47560d76
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c
// Size: 0x2f
function function_ccdcf48542c8a5b7(vehicleref) {
    vehicledata = function_29b4292c92443328(vehicleref);
    return isdefined(vehicledata) && isdefined(vehicledata.airdrop);
}

// Namespace namespace_66c684fea143fbfd / namespace_801fa17f47560d76
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184
// Size: 0x482
function function_66c684fea143fbfd(vehicleref, spawndata, faildata) {
    vehicledata = function_29b4292c92443328(vehicleref);
    airdropdata = vehicledata.airdrop;
    if (!isdefined(spawndata.spawnmethod)) {
        spawndata.spawnmethod = "airdrop_at_position";
    }
    if (!isdefined(spawndata.angles)) {
        spawndata.angles = (0, 0, 0);
    }
    if (!isdefined(airdropdata)) {
        assertmsg("Tried to airdrop a vehicle which doesn't support it");
        if (scripts\engine\utility::issharedfuncdefined(vehicleref, "spawnPostAirdrop")) {
            return [[ scripts\engine\utility::getsharedfunc(vehicleref, "spawnPostAirdrop") ]](spawndata, faildata);
        }
        return vehicle_spawn(vehicleref, spawndata, faildata);
    }
    var_c374a91971cb3bfa = drop_to_ground(spawndata.origin);
    if (var_c374a91971cb3bfa[2] > spawndata.origin[2]) {
        spawndata.origin = var_c374a91971cb3bfa;
    }
    scenenode = spawn("script_model", spawndata.origin);
    scenenode.angles = spawndata.angles;
    scenenode setmodel("tag_origin");
    parachute = spawn("script_model", spawndata.origin);
    parachute.angles = spawndata.angles;
    parachute.animname = "parachute";
    parachute setmodel(airdropdata.parachutemodel);
    parachute scripts\common\anim::setanimtree();
    parachute forcenetfieldhighlod(1);
    parachute hide();
    carrier = spawn("script_model", spawndata.origin);
    carrier.angles = spawndata.angles;
    carrier.animname = "ac130";
    carrier setmodel(airdropdata.planemodel);
    carrier scripts\common\anim::setanimtree();
    carrier hide();
    fakevehicle = spawn("script_model", spawndata.origin);
    fakevehicle.angles = spawndata.angles;
    fakevehicle.animname = vehicleref;
    model = vehicledata.model;
    if (isdefined(spawndata.var_14cde247ac3313a4)) {
        model = spawndata.var_14cde247ac3313a4 + "::" + model;
    }
    fakevehicle setmodel(model);
    fakevehicle scripts\common\anim::setanimtree();
    fakevehicle hide();
    scenenode.vehicle = fakevehicle;
    scenenode.parachute = parachute;
    scenenode.carrier = carrier;
    scenenode.starttime = gettime() + level.frameduration;
    scenenode.endtime = gettime();
    scenenode.vehicleendtime = scenenode.starttime + getanimlength(level.scr_anim[vehicleref][airdropdata.scenename]) * 1000;
    if (scenenode.vehicleendtime > scenenode.endtime) {
        scenenode.endtime = scenenode.vehicleendtime;
    }
    scenenode.parachuteendtime = scenenode.starttime + getanimlength(level.scr_anim["parachute"][airdropdata.scenename]) * 1000;
    if (scenenode.parachuteendtime > scenenode.endtime) {
        scenenode.endtime = scenenode.parachuteendtime;
    }
    scenenode.carrierendtime = scenenode.starttime + getanimlength(level.scr_anim["ac130"][airdropdata.scenename]) * 1000;
    if (scenenode.carrierendtime > scenenode.endtime) {
        scenenode.endtime = scenenode.carrierendtime;
    }
    scenenode thread function_c4f85850fb179639(vehicleref, spawndata, faildata, airdropdata);
    vehicle = spawndata waittill("spawn");
    return vehicle;
}

// Namespace namespace_66c684fea143fbfd / namespace_801fa17f47560d76
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x60f
// Size: 0x2a5
function private function_c4f85850fb179639(vehicleref, spawndata, faildata, airdropdata) {
    scripts\common\anim::anim_first_frame_solo(self.vehicle, airdropdata.scenename);
    scripts\common\anim::anim_first_frame_solo(self.parachute, airdropdata.scenename);
    scripts\common\anim::anim_first_frame_solo(self.carrier, airdropdata.scenename);
    waitframe();
    if (isdefined(self.vehicle)) {
        self.vehicle show();
        thread scripts\common\anim::anim_single_solo(self.vehicle, airdropdata.scenename);
    }
    if (isdefined(self.parachute)) {
        self.parachute show();
        thread scripts\common\anim::anim_single_solo(self.parachute, airdropdata.scenename);
    }
    if (isdefined(self.carrier)) {
        self.carrier show();
        self.carrier playloopsound(airdropdata.planesound);
        foreach (part in airdropdata.planeparts) {
            self.carrier setscriptablepartstate(part.var_8a46c62f0a756dd3, "on", 0);
        }
        thread scripts\common\anim::anim_single_solo(self.carrier, airdropdata.scenename);
    }
    while (gettime() <= self.endtime) {
        if (!isdefined(self.vehicle) || gettime() >= self.vehicleendtime) {
            thread function_b708213b1c5dc2a8(vehicleref, self.vehicle, spawndata, faildata, airdropdata);
        }
        if (isdefined(self.parachute) && gettime() >= self.parachuteendtime) {
            self.parachute delete();
        }
        if (isdefined(self.carrier) && gettime() >= self.carrierendtime) {
            self.carrier delete();
        }
        waitframe();
    }
    function_b708213b1c5dc2a8(vehicleref, self.vehicle, spawndata, faildata, airdropdata);
    if (isdefined(self.parachute)) {
        self.parachute delete();
    }
    if (isdefined(self.carrier)) {
        self.carrier delete();
    }
    self delete();
}

// Namespace namespace_66c684fea143fbfd / namespace_801fa17f47560d76
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8bc
// Size: 0x1ae
function private function_b708213b1c5dc2a8(vehicleref, fakevehicle, spawndata, faildata, airdropdata) {
    self.vehicle = undefined;
    if (!isdefined(fakevehicle)) {
        return;
    }
    originalorigin = spawndata.origin;
    originalangles = spawndata.angles;
    spawndata.origin = fakevehicle.origin;
    spawndata.angles = fakevehicle.angles;
    fakevehicle delete();
    if (scripts\engine\utility::issharedfuncdefined(vehicleref, "spawnPostAirdrop")) {
        vehicle = [[ scripts\engine\utility::getsharedfunc(vehicleref, "spawnPostAirdrop") ]](spawndata, faildata);
    } else {
        vehicle = vehicle_spawn(vehicleref, spawndata, faildata);
    }
    spawndata.origin = originalorigin;
    spawndata.angles = originalangles;
    spawndata notify("spawn", vehicle);
    if (isdefined(airdropdata.var_150b11a4da8461bc)) {
        endtime = gettime() + getanimlength(level.scr_anim[vehicleref][airdropdata.var_150b11a4da8461bc]) * 1000;
        if (endtime > self.endtime) {
            self.endtime = endtime;
        }
        vehicle.var_9882cd795c6bfaa = 1;
        vehicle.animname = vehicleref;
        vehicle vehphys_forcekeyframedmotion();
        thread scripts\common\anim::anim_single_solo(vehicle, airdropdata.var_150b11a4da8461bc);
        while (gettime() <= endtime) {
            waitframe();
        }
        vehicle vehphys_setdefaultmotion();
    }
    vehicle thread function_f694f53c094603a(airdropdata);
}

// Namespace namespace_66c684fea143fbfd / namespace_801fa17f47560d76
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa72
// Size: 0xb7
function private function_f694f53c094603a(airdropdata) {
    self endon("death");
    self notify("freefall");
    self.var_9882cd795c6bfaa = 1;
    playsoundatpos(self.origin, airdropdata.var_98cf00a549d2c206);
    waitframe();
    endtime = gettime() + 3000;
    while (gettime() < endtime && !self vehicle_isonground()) {
        waitframe();
    }
    origin = self.origin;
    if (self tagexists("tag_origin_static")) {
        origin = self gettagorigin("tag_origin_static");
    }
    airdrop_land(airdropdata, origin, self.angles);
    self.var_9882cd795c6bfaa = undefined;
}

// Namespace namespace_66c684fea143fbfd / namespace_801fa17f47560d76
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb31
// Size: 0xbd
function private airdrop_land(airdropdata, position, angles) {
    playfx(airdropdata.effect, position, anglestoforward(angles));
    playsoundatpos(position, airdropdata.var_5c73f15ed471884d);
    earthquake(airdropdata.earthquakescale, airdropdata.earthquakeduration, position, airdropdata.earthquakeradius);
    playrumbleonposition("grenade_rumble", position);
    physicsexplosionsphere(position, airdropdata.physicsouterradius, airdropdata.physicsinnerradius, airdropdata.physicsscale);
    self function_65aa053c077c003a(1);
    self.landed = 1;
    self notify("landed");
}
