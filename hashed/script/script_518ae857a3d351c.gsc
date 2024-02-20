// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;

#namespace namespace_6582714a62ad086d;

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f3
// Size: 0x5b
function init() {
    if (!isdefined(level.var_cbe618f35b332990)) {
        level.var_cbe618f35b332990 = spawn("script_origin", (0, 0, 0));
    }
    load_laser_fx();
    initSentrySettings();
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("trap_defuse_object", &function_836cdac4b1d38941);
    /#
        level thread function_6e8b6dce68b1c1ea();
    #/
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x855
// Size: 0x16f
function load_laser_fx() {
    level._effect["vfx_laser_smoke"] = loadfx("vfx/iw8_cp/raid/vfx_cp_steampipe_exp.vfx");
    level._effect["vfx_laser_pointer"] = loadfx("vfx/iw8_cp/vfx_red_laser_cp.vfx");
    level._effect["vfx_laser_pointer_thermal"] = loadfx("vfx/iw8_cp/vfx_red_laser_cp_thermalonly.vfx");
    level._effect["vfx_laser_pointer_nvg"] = loadfx("vfx/iw9/cp/vfx_red_laser_cp_nvgonly.vfx");
    level._effect["vfx_laser_destroy"] = loadfx("vfx/iw8_cp/vfx_red_laser_cp_destroy.vfx");
    level._effect["vfx_laser_burn"] = loadfx("vfx/iw8_cp/raid/lava/vfx_raid_laser_burn.vfx");
    level._effect["vfx_turret_light"] = loadfx("vfx/iw9/cp/vfx_cp_turret_light.vfx");
    level._effect["vfx_c4_explode"] = loadfx("vfx/iw9/core/equipment/c4/vfx_equip_c4_gen_ch.vfx");
    level._effect["vfx_turret_light_5"] = loadfx("vfx/iw9/cp/vfx_cp_turret_light_0_5s.vfx");
    level._effect["vfx_turret_light_175"] = loadfx("vfx/iw9/cp/vfx_cp_turret_light_1_75s.vfx");
    level._effect["vfx_turret_light_2"] = loadfx("vfx/iw9/cp/vfx_cp_turret_light_2_0s.vfx");
    level._effect["vfx_turret_light_3"] = loadfx("vfx/iw9/cp/vfx_cp_turret_light_3_0s.vfx");
    level._effect["vfx_laser_destroy_nvg"] = loadfx("vfx/iw9/cp/vfx_red_laser_cp_nvgonly_die.vfx");
    level._effect["vfx_laser_destroy_end"] = loadfx("vfx/iw9/core/lasers/vfx_laser_nvg_end_die.vfx");
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cb
// Size: 0x5a8
function initSentrySettings() {
    level.sentrysettings["bs_laser"] = spawnstruct();
    level.sentrysettings["bs_laser"].health = 999999;
    level.sentrysettings["bs_laser"].maxhealth = 350;
    level.sentrysettings["bs_laser"].burstmin = 20;
    level.sentrysettings["bs_laser"].burstmax = 120;
    level.sentrysettings["bs_laser"].pausemin = 0.15;
    level.sentrysettings["bs_laser"].pausemax = 0.35;
    level.sentrysettings["bs_laser"].maxrange = 4000000;
    level.sentrysettings["bs_laser"].var_947af351ce904aa5 = 7562500;
    level.sentrysettings["bs_laser"].lockstrength = 2;
    level.sentrysettings["bs_laser"].sentrymodeon = "manual";
    level.sentrysettings["bs_laser"].sentrymodeoff = "sentry_offline";
    level.sentrysettings["bs_laser"].ammo = 200;
    level.sentrysettings["bs_laser"].timeout = 999999;
    level.sentrysettings["bs_laser"].spinuptime = 0.65;
    level.sentrysettings["bs_laser"].overheattime = 8;
    level.sentrysettings["bs_laser"].cooldowntime = 0.1;
    level.sentrysettings["bs_laser"].fxtime = 0.3;
    level.sentrysettings["bs_laser"].streakname = "sentry_gun";
    level.sentrysettings["bs_laser"].weaponinfo = "laser_trap_nvg";
    level.sentrysettings["bs_laser"].playerweaponinfo = "laser_trap_nvg";
    level.sentrysettings["bs_laser"].scriptable = "ks_sentry_turret_mp";
    level.sentrysettings["bs_laser"].modelbasecover = "electronics_ir_laser_device_assembly_nogeo";
    level.sentrysettings["bs_laser"].modelbaseground = "electronics_ir_laser_device_assembly_nogeo";
    level.sentrysettings["bs_laser"].modeldestroyedcover = "electronics_ir_laser_device_assembly_nogeo";
    level.sentrysettings["bs_laser"].modeldestroyedground = "electronics_ir_laser_device_assembly_nogeo";
    level.sentrysettings["bs_laser"].placementhintstring = "KILLSTREAKS_HINTS/SENTRY_GUN_PLACE";
    level.sentrysettings["bs_laser"].ownerusehintstring = "KILLSTREAKS_HINTS/SENTRY_USE";
    level.sentrysettings["bs_laser"].otherusehintstring = "KILLSTREAKS_HINTS/SENTRY_OTHER_USE";
    level.sentrysettings["bs_laser"].dismantlehintstring = "KILLSTREAKS_HINTS/SENTRY_DISMANTLE";
    level.sentrysettings["bs_laser"].headicon = 1;
    level.sentrysettings["bs_laser"].teamsplash = "used_sentry_gun";
    level.sentrysettings["bs_laser"].destroyedsplash = "callout_destroyed_sentry_gun";
    level.sentrysettings["bs_laser"].shouldsplash = 1;
    level.sentrysettings["bs_laser"].votimeout = "sentry_shock_timeout";
    level.sentrysettings["bs_laser"].vodestroyed = "sentry_shock_destroy";
    level.sentrysettings["bs_laser"].scorepopup = "destroyed_sentry";
    level.sentrysettings["bs_laser"].lightfxtag = "tag_fx";
    level.sentrysettings["bs_laser"].iskillstreak = 1;
    level.sentrysettings["bs_laser"].headiconoffset = (0, 0, 75);
    level.sentrysettings["bs_laser"].var_e9ca667d000cba6b = 0;
    level.sentrysettings["bs_laser"].var_b58e018f63b5d93b = 2;
    level.sentrysettings["bs_laser"].var_d2c4f86d437a5607 = 1;
    level.sentrysettings["bs_laser"].var_4ef7fd2cb922824f = 100;
    level.sentrysettings["bs_laser"].var_575f1abee219cbc9 = 200;
    level.sentrysettings["bs_laser"].var_bd106a486cdfd461 = 384;
    level.sentrysettings["bs_laser"].var_5e492375beb386e3 = "frag_grenade_mp";
    level.sentrysettings["bs_laser"].var_ba1320435407b241 = "MOD_EXPLOSIVE";
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7a
// Size: 0x202
function function_d1acadc2a0b9e115(config, struct, team, model, weapon) {
    turret = spawnturret("misc_turret", struct.origin, weapon);
    turret.team = team;
    turret setturretteam(team);
    turret.angles = struct.angles;
    turret.health = config.maxhealth;
    turret.maxhealth = config.maxhealth;
    turret.momentum = 0;
    turret.heatlevel = 0;
    turret.overheated = 0;
    turret.cooldownwaittime = 2;
    turret.maxrange = config.maxrange;
    turret.var_947af351ce904aa5 = config.var_947af351ce904aa5;
    if (isdefined(struct.radius)) {
        maxdistsq = struct.radius * struct.radius;
        turret.maxrange = int(maxdistsq - maxdistsq * 0.1);
        turret.var_947af351ce904aa5 = int(maxdistsq);
    }
    turret setmodel(model);
    turret makeunusable();
    turret setnodeploy(1);
    turret setdefaultdroppitch(0);
    turret setautorotationdelay(0.2);
    turret maketurretinoperable();
    turret setleftarc(180);
    turret setrightarc(180);
    turret setbottomarc(50);
    turret settoparc(60);
    turret setconvergencetime(0.6, "pitch");
    turret setconvergencetime(0.6, "yaw");
    turret setconvergenceheightpercent(0.65);
    turret setdefaultdroppitch(-89);
    turret setturretmodechangewait(1);
    return turret;
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1184
// Size: 0x1fc
function function_9c405ffa3bb2dcf0(var_804269875f5062f1, team, damage_type, var_76ba9e808a42f81, parent_struct, var_4fe5cdff2560e8c6) {
    sentrytype = "bs_laser";
    config = level.sentrysettings[sentrytype];
    if (!isdefined(var_4fe5cdff2560e8c6)) {
        var_4fe5cdff2560e8c6 = level.sentrysettings[sentrytype].weaponinfo;
    }
    if (!isdefined(team)) {
        team = "axis";
    }
    if (!isdefined(var_804269875f5062f1.angles)) {
        var_804269875f5062f1.angles = (0, 0, 0);
    }
    if (!isdefined(var_76ba9e808a42f81)) {
        var_76ba9e808a42f81 = "electronics_ir_laser_device_assembly_nogeo";
    }
    turret = function_d1acadc2a0b9e115(config, var_804269875f5062f1, team, var_76ba9e808a42f81, var_4fe5cdff2560e8c6);
    turret.sentrytype = sentrytype;
    turret.turrettype = sentrytype;
    turret.damage_type = damage_type;
    turret namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&sentryturret_empstarted);
    turret namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&sentryturret_empcleared);
    turret namespace_5a51aa78ea0b1b9f::allow_emp(0);
    var_804269875f5062f1.turret = turret;
    turret.var_779c916529c44b1a = var_804269875f5062f1;
    turret.parent_struct = parent_struct;
    if (!isdefined(level.killstreak_additional_targets)) {
        level.killstreak_additional_targets = [];
    }
    level.killstreak_additional_targets = array_add(level.killstreak_additional_targets, turret);
    if (!isdefined(level.var_ceef08cfb883a461)) {
        level.var_ceef08cfb883a461 = [];
    }
    level.var_ceef08cfb883a461 = array_add(level.var_ceef08cfb883a461, turret);
    turret setmode(level.sentrysettings[turret.turrettype].sentrymodeon);
    turret namespace_5a51aa78ea0b1b9f::allow_emp(1);
    turret sentryturret_empupdate();
    turret laseron();
    turret thread function_42929a0d4354a323();
    turret thread function_a9a8361dace89499();
    turret notify("lasers_started");
    return turret;
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1388
// Size: 0x71
function sentryturret_empstarted(data) {
    if (isdefined(data.attacker) && isplayer(data.attacker)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ namespace_3c37cb17ade254d::getsharedfunc("player", "doScoreEvent") ]](#"hash_7410841fd4c63028");
        }
    }
    sentryturret_empupdate();
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1400
// Size: 0x18
function sentryturret_empcleared(isdeath) {
    if (isdeath) {
        return;
    }
    sentryturret_empupdate();
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141f
// Size: 0x80
function sentryturret_empupdate() {
    if (namespace_5a51aa78ea0b1b9f::is_empd()) {
        self turretfiredisable();
        self setmode(level.sentrysettings[self.turrettype].sentrymodeoff);
        self laseroff();
    } else if (!istrue(self.killed)) {
        self turretfireenable();
        self setmode(level.sentrysettings[self.turrettype].sentrymodeon);
        self laseron();
    }
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a6
// Size: 0x3b
function sentryturret_setinactive(turret) {
    turret setdefaultdroppitch(30);
    turret setmode(level.sentrysettings[turret.turrettype].sentrymodeoff);
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e8
// Size: 0x3ef
function function_42929a0d4354a323() {
    self endon("death");
    self endon("exit_idle");
    self endon("stop_idle_movement");
    if (isdefined(self.state) && self.state == "idle") {
        return;
    }
    self stopfiring();
    self.state = "idle";
    self notify("enter_idle");
    self notify("stop_shooting");
    tag = "tag_laser";
    if (!hastag(self.model, tag)) {
        tag = "tag_turret";
    }
    self.var_c507394a92387e01 = self gettagorigin(tag) + anglestoforward(self gettagangles(tag)) * 3000;
    if (isdefined(self.var_71f08aa4e6a5186e)) {
        self [[ self.var_71f08aa4e6a5186e ]]();
        return;
    }
    var_1e536fc02ce7881d = self.var_779c916529c44b1a.origin;
    var_4d16d428538ff673 = self.var_779c916529c44b1a.angles;
    var_878bae61aca86fc5 = anglestoforward(var_4d16d428538ff673);
    var_a1b727d30fc62a0f = anglestoup(var_4d16d428538ff673);
    var_1b77e17a42e2545b = anglestoleft(var_4d16d428538ff673);
    var_6232855eba31163a = anglestoright(var_4d16d428538ff673);
    maxangle = 15;
    var_b716ed1e1043d49d = rotatepointaroundvector(var_a1b727d30fc62a0f, var_878bae61aca86fc5, maxangle);
    var_37acb3a5ef4e3396 = vectornormalize(vectorcross(var_b716ed1e1043d49d, var_a1b727d30fc62a0f));
    var_13b2c03f423eb4f1 = vectorcross(var_37acb3a5ef4e3396, var_b716ed1e1043d49d);
    var_5a8f11024e7733a5 = axistoangles(var_b716ed1e1043d49d, var_37acb3a5ef4e3396, var_13b2c03f423eb4f1);
    var_f4feef348ddcce80 = rotatepointaroundvector(var_a1b727d30fc62a0f, var_878bae61aca86fc5, maxangle * -1);
    var_28a104b41542054b = vectornormalize(vectorcross(var_f4feef348ddcce80, var_a1b727d30fc62a0f));
    var_71068ef94589e94a = vectorcross(var_28a104b41542054b, var_f4feef348ddcce80);
    var_6b5bd2eb86959740 = axistoangles(var_f4feef348ddcce80, var_28a104b41542054b, var_71068ef94589e94a);
    var_d5c157bf3efda129 = vectortoangles(var_a1b727d30fc62a0f);
    var_3c19d396e8243a45 = vectortoangles(var_878bae61aca86fc5);
    var_a0d15869f98efc85 = vectortoangles(var_1b77e17a42e2545b);
    var_10972f86bc3d391e = vectortoangles(var_6232855eba31163a);
    var_4a5d9d7667048bf3 = namespace_2a184fc4902783dc::create_world_contents();
    if (!self.var_779c916529c44b1a function_a0857113d8c32a2a()) {
        var_1e536fc02ce7881d = self gettagorigin(tag);
        newdir = anglestoforward(var_3c19d396e8243a45);
        newpos = var_1e536fc02ce7881d + newdir * 2000;
        trace = namespace_2a184fc4902783dc::ray_trace(var_1e536fc02ce7881d, newpos, self, var_4a5d9d7667048bf3);
        end = trace["position"];
        self.var_c507394a92387e01 = (newpos[0], newpos[1], var_1e536fc02ce7881d[2]);
        self function_83ea6f9ebc30c9a4(self.var_c507394a92387e01 - var_1e536fc02ce7881d);
        var_98c102bf3750c771 = (var_1e536fc02ce7881d + end) / 2;
        function_a890d51e917ad74(1, var_98c102bf3750c771);
        waitframe();
        while (1) {
            function_c2659db9dbffda55(var_5a8f11024e7733a5, 10, "left");
            function_c2659db9dbffda55(var_3c19d396e8243a45, 10, "fwd");
            function_c2659db9dbffda55(var_6b5bd2eb86959740, 10, "right");
            function_c2659db9dbffda55(var_3c19d396e8243a45, 10, "fwd");
        }
    } else {
        tag = "tag_laser";
        if (!hastag(self.model, tag)) {
            tag = "tag_turret";
        }
        var_1e536fc02ce7881d = self gettagorigin(tag);
        newdir = anglestoforward(var_3c19d396e8243a45);
        newpos = var_1e536fc02ce7881d + newdir * 2000;
        trace = namespace_2a184fc4902783dc::ray_trace(var_1e536fc02ce7881d, newpos, self, var_4a5d9d7667048bf3);
        end = trace["position"];
        self.var_c507394a92387e01 = (end[0], end[1], var_1e536fc02ce7881d[2]);
        self function_83ea6f9ebc30c9a4(self.var_c507394a92387e01 - var_1e536fc02ce7881d);
        var_98c102bf3750c771 = (var_1e536fc02ce7881d + end) / 2;
        thread function_a890d51e917ad74(undefined, var_98c102bf3750c771);
    }
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18de
// Size: 0x43
function vectortoanglessafe(forward, up) {
    right = vectorcross(forward, up);
    up = vectorcross(right, forward);
    angles = axistoangles(forward, right, up);
    return angles;
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1929
// Size: 0x18b
function function_c2659db9dbffda55(angles, var_91ae7188f4c06c96, debug_text) {
    if (!isdefined(var_91ae7188f4c06c96)) {
        var_91ae7188f4c06c96 = 4;
    }
    var_cad92bffbde8f755 = var_91ae7188f4c06c96 * 0.7;
    var_cd491403d3c67fd0 = var_91ae7188f4c06c96 - var_cad92bffbde8f755;
    tag = "tag_laser";
    if (!hastag(self.model, tag)) {
        tag = "tag_turret";
    }
    var_1e536fc02ce7881d = self gettagorigin(tag);
    newdir = anglestoforward(angles);
    newpos = var_1e536fc02ce7881d + newdir * 2000;
    var_1995dcccb8336733 = (newpos[0], newpos[1], var_1e536fc02ce7881d[2]);
    var_b7a91148551c964d = self.var_c507394a92387e01;
    timestart = gettime();
    var_f5da80d787f5c5b2 = var_cad92bffbde8f755 * 1000;
    while (1) {
        var_b6e159bf85a17541 = gettime() - timestart;
        if (var_b6e159bf85a17541 > var_f5da80d787f5c5b2) {
            break;
        }
        self.var_c507394a92387e01 = vectorlerp(var_b7a91148551c964d, var_1995dcccb8336733, var_b6e159bf85a17541 / var_f5da80d787f5c5b2);
        self function_83ea6f9ebc30c9a4(self.var_c507394a92387e01 - var_1e536fc02ce7881d);
        waitframe();
    }
    /#
        if (getdvarint(@"hash_69de6d4d9ba136d1", 0)) {
            if (isdefined(debug_text)) {
                announcement(debug_text);
            }
            level thread namespace_f2ffc0540883e1ad::drawline(self.origin, var_1995dcccb8336733, var_91ae7188f4c06c96, (1, 0, 0));
        }
    #/
    wait(var_cd491403d3c67fd0);
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1abb
// Size: 0x142
function function_2cc59ea2a67bd2f4(struct, turrets, var_54c186a6b8a2ae1) {
    scriptablename = function_53c4c53197386572(var_54c186a6b8a2ae1, "dmz_lasertrap");
    struct.defuseobj = spawnscriptable(scriptablename, struct.origin, struct.angles);
    struct.defuseobj.var_e40178ee59662442 = getstructarray(struct.target, "targetname");
    struct.defuseobj.parent_struct = struct;
    if (!isdefined(level.var_da28469a4f1d6123)) {
        level.var_da28469a4f1d6123 = [];
    }
    level.var_da28469a4f1d6123[level.var_da28469a4f1d6123.size] = struct;
    if (function_ee8a913e5baf0c5d()) {
        if (namespace_448ccf1ca136fbbe::iscp()) {
            wait(2);
        } else {
            namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
            waitframe();
        }
        foreach (turret in turrets) {
            turret thread function_62171a49e3430e0a(struct);
        }
    }
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c04
// Size: 0x1c
function function_ee8a913e5baf0c5d() {
    if (getdvarint(@"hash_7693c920bebdb71b", 1) != 0) {
        return 1;
    }
    return 0;
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c28
// Size: 0x28e
function function_836cdac4b1d38941(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (part == "trap_defuse_object") {
        instance setscriptablepartstate("trap_defuse_object", "off");
        var_adb161e045b9b602 = instance.parent_struct;
        dropfunc = namespace_3c37cb17ade254d::function_6a11999c562cf4ab("lasertrap", "createLootDropInfo");
        if (isdefined(dropfunc)) {
            var_cb4fad49263e20c4 = [[ dropfunc ]](var_adb161e045b9b602.origin, var_adb161e045b9b602.angles, undefined, 0, 0, undefined, 1);
            [[ namespace_3c37cb17ade254d::getsharedfunc("lasertrap", "spawnPickup") ]]("brloot_offhand_c4", var_cb4fad49263e20c4, 1, 1);
        }
        playsoundatpos(var_adb161e045b9b602.origin, "cp_laser_disable");
        foreach (turret in var_adb161e045b9b602.turrets) {
            sentryturret_setinactive(turret);
            playfx(level._effect["vfx_laser_destroy_nvg"], turret.origin);
            start = turret gettagorigin("tag_laser");
            trace = namespace_2a184fc4902783dc::ray_trace(start, turret.var_c507394a92387e01);
            end = trace["position"];
            playfx(level._effect["vfx_laser_destroy_end"], start);
            playfx(level._effect["vfx_laser_destroy_end"], end);
            turret setmode("sentry_offline");
            turret laseroff();
            if (function_ee8a913e5baf0c5d()) {
                turret thread function_571c0f2116929a45();
            }
            turret notify("stop_idle_movement");
            if (!turret.var_779c916529c44b1a function_a0857113d8c32a2a()) {
                turret function_d33f98412123374(1);
            } else {
                turret function_d33f98412123374();
            }
        }
        if (isdefined(player)) {
            var_e37a12ded171977e = namespace_3c37cb17ade254d::function_6a11999c562cf4ab("lasertrap", "customDefuseScoreEventFunc");
            if (isdefined(var_e37a12ded171977e)) {
                [[ var_e37a12ded171977e ]](player);
            } else if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "doScoreEvent")) {
                player thread [[ namespace_3c37cb17ade254d::getsharedfunc("player", "doScoreEvent") ]](#"hash_392cd4486f5ab82e");
            }
        }
    }
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ebd
// Size: 0xf6
function function_571c0f2116929a45() {
    if (isdefined(self.parent_struct.script_index)) {
        if (self.parent_struct.script_index == "0.5") {
            stopfxontag(level._effect["vfx_turret_light_5"], self, "tag_fx");
        }
        if (self.parent_struct.script_index == "1.75") {
            stopfxontag(level._effect["vfx_turret_light_175"], self, "tag_fx");
        }
        if (self.parent_struct.script_index == "2") {
            stopfxontag(level._effect["vfx_turret_light_2"], self, "tag_fx");
        }
        if (self.parent_struct.script_index == "3") {
            stopfxontag(level._effect["vfx_turret_light_3"], self, "tag_fx");
        }
    }
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fba
// Size: 0x5c3
function function_a9a8361dace89499() {
    level endon("game_ended");
    self endon("death");
    self endon("stop_idle_movement");
    if (namespace_448ccf1ca136fbbe::iscp()) {
        flag_wait("player_spawned_with_loadout");
    } else {
        namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    }
    var_7644d2741c9ab230 = level.sentrysettings["bs_laser"];
    delayseconds = var_7644d2741c9ab230.var_b58e018f63b5d93b;
    if (delayseconds > 0) {
        wait(delayseconds);
    }
    var_4a5d9d7667048bf3 = namespace_2a184fc4902783dc::create_character_contents();
    while (1) {
        if (namespace_5a51aa78ea0b1b9f::is_empd()) {
            waitframe();
            continue;
        }
        start = self gettagorigin("tag_laser");
        nearby_players = sortbydistancecullbyradius(level.players, start, 1024);
        if (nearby_players.size == 0) {
            waitframe();
            continue;
        }
        trace = namespace_2a184fc4902783dc::ray_trace(start, self.var_c507394a92387e01);
        end = trace["position"];
        /#
            if (getdvarint(@"hash_388b2c9297bbe819", 0) != 0) {
                line(start, end, (1, 0, 0), 1, 0, 1);
            }
        #/
        trace = namespace_2a184fc4902783dc::ray_trace(start, end, [], var_4a5d9d7667048bf3);
        if (isdefined(trace["entity"]) && trace["hittype"] == "hittype_entity") {
            if (isplayer(trace["entity"])) {
                player = trace["entity"];
                if (istrue(var_7644d2741c9ab230.var_e9ca667d000cba6b) && is_equal(player.pers["team"], self.team)) {
                    waitframe();
                    continue;
                }
                var_ff03ded389b65a7d = self.parent_struct;
                if (isdefined(player) && isplayer(player)) {
                    player.var_230a3287f9ad2965 = 1;
                    player.shouldskipdeathsshield = 1;
                }
                playsoundatpos(var_ff03ded389b65a7d.origin, "cp_laser_trigger");
                time = min(2, lookupsoundlength("cp_laser_trigger") * 0.001);
                wait(time);
                if (namespace_cd0b2d039510b38d::getgametype() == "wm") {
                    var_ca1c9242e75e271 = anglestoforward(var_ff03ded389b65a7d.angles);
                    if (var_ca1c9242e75e271[0] > 0) {
                        var_ca1c9242e75e271 = (1, var_ca1c9242e75e271[1], 0);
                    } else {
                        var_ca1c9242e75e271 = (-1, var_ca1c9242e75e271[1], 0);
                    }
                    if (var_ca1c9242e75e271[1] > 0) {
                        var_ca1c9242e75e271 = (var_ca1c9242e75e271[0], 1, 0);
                    } else {
                        var_ca1c9242e75e271 = (var_ca1c9242e75e271[0], -1, 0);
                    }
                    playsoundatpos(var_ff03ded389b65a7d.origin + (var_ca1c9242e75e271[0], var_ca1c9242e75e271[1], 0) * 10, "cp_laser_expl");
                } else {
                    playsoundatpos(var_ff03ded389b65a7d.origin, "cp_laser_expl");
                }
                mindamage = getdvarint(@"hash_ea6e58c378d245e5", var_7644d2741c9ab230.var_4ef7fd2cb922824f);
                maxdamage = getdvarint(@"hash_d5ff13fe4588f203", var_7644d2741c9ab230.var_575f1abee219cbc9);
                var_f48557f5d46f1623 = getdvarint(@"hash_db8f6fd15e9a7db6", var_7644d2741c9ab230.var_bd106a486cdfd461);
                meansofdeath = var_7644d2741c9ab230.var_ba1320435407b241;
                damageweapon = var_7644d2741c9ab230.var_5e492375beb386e3;
                foreach (var_96b5bef64547d4c2 in var_ff03ded389b65a7d.turrets) {
                    if (!var_96b5bef64547d4c2 namespace_5a51aa78ea0b1b9f::is_empd() && istrue(var_7644d2741c9ab230.var_d2c4f86d437a5607)) {
                        level.var_cbe618f35b332990 radiusdamage(var_96b5bef64547d4c2.var_4cf58793cc4f1ad6.origin, var_f48557f5d46f1623, maxdamage, mindamage, level.var_cbe618f35b332990, meansofdeath, damageweapon);
                    }
                }
                level.var_cbe618f35b332990 radiusdamage(var_ff03ded389b65a7d.origin, var_f48557f5d46f1623, maxdamage, mindamage, level.var_cbe618f35b332990, meansofdeath, damageweapon);
                playrumbleonposition("grenade_rumble", var_ff03ded389b65a7d.origin);
                earthquake(0.45, 0.7, var_ff03ded389b65a7d.origin, 800);
                level notify("trigger_reinforcements_if_applicable");
                playfx(level._effect["vfx_laser_destroy_nvg"], start);
                playfx(level._effect["vfx_laser_destroy_end"], start);
                playfx(level._effect["vfx_laser_destroy_nvg"], end);
                playfx(level._effect["vfx_laser_destroy_end"], end);
                foreach (turret in var_ff03ded389b65a7d.turrets) {
                    if (!turret.var_779c916529c44b1a function_a0857113d8c32a2a()) {
                        turret function_d33f98412123374(1);
                    } else {
                        turret function_d33f98412123374();
                    }
                    if (self != turret) {
                        thread function_277b35006fab38dd(turret);
                    }
                }
                if (isdefined(var_ff03ded389b65a7d.defuseobj)) {
                    var_ff03ded389b65a7d.defuseobj setscriptablepartstate("trap_defuse_object", "off");
                    playfx(level._effect["vfx_c4_explode"], var_ff03ded389b65a7d.defuseobj.origin);
                }
                thread function_277b35006fab38dd(self);
                return;
            }
        }
        waitframe();
    }
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2584
// Size: 0x4f
function function_277b35006fab38dd(turret) {
    turret playsound("recon_drone_explode");
    if (function_ee8a913e5baf0c5d()) {
        turret thread function_571c0f2116929a45();
    }
    sentryturret_setinactive(turret);
    turret.killed = 1;
    turret laseroff();
    turret notify("stop_idle_movement");
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25da
// Size: 0x27
function function_a0857113d8c32a2a() {
    if (isdefined(self.script_groupname) && self.script_groupname == "nomove") {
        return 1;
    }
    return 0;
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2609
// Size: 0xee
function function_62171a49e3430e0a(struct) {
    self endon("death");
    self endon("stop_idle_movement");
    if (isdefined(struct.script_index)) {
        if (struct.script_index == "0.5") {
            playfxontag(level._effect["vfx_turret_light_5"], self, "tag_fx");
        } else if (struct.script_index == "1.75") {
            playfxontag(level._effect["vfx_turret_light_175"], self, "tag_fx");
        } else if (struct.script_index == "2") {
            playfxontag(level._effect["vfx_turret_light_2"], self, "tag_fx");
        } else if (struct.script_index == "3") {
            playfxontag(level._effect["vfx_turret_light_3"], self, "tag_fx");
        }
    }
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26fe
// Size: 0xb7
function function_a890d51e917ad74(var_f095df44cb4d44c3, var_b1912d395068cf48) {
    self endon("death");
    if (isdefined(var_b1912d395068cf48) && isvector(var_b1912d395068cf48)) {
        self.var_4cf58793cc4f1ad6 = spawn("script_model", var_b1912d395068cf48);
    } else {
        self.var_4cf58793cc4f1ad6 = spawn("script_model", self.origin);
    }
    self.var_4cf58793cc4f1ad6 setmodel("tag_origin");
    waitframe();
    if (!istrue(var_f095df44cb4d44c3)) {
        self.var_4cf58793cc4f1ad6 playloopsound("cp_laser_idle");
    } else {
        self.var_4cf58793cc4f1ad6 linkto(self, "tag_aim_pivot");
        self.var_4cf58793cc4f1ad6 playloopsound("cp_laser_mvmt");
    }
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27bc
// Size: 0x4b
function function_d33f98412123374(var_f095df44cb4d44c3) {
    if (!istrue(var_f095df44cb4d44c3)) {
        self.var_4cf58793cc4f1ad6 stoploopsound("cp_laser_idle");
    } else {
        self.var_4cf58793cc4f1ad6 stoploopsound("cp_laser_mvmt");
    }
    self.var_4cf58793cc4f1ad6 delete();
}

// Namespace namespace_6582714a62ad086d/namespace_66ade5cda10fe3aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x280e
// Size: 0x1cb
function function_6e8b6dce68b1c1ea() {
    /#
        level endon("vfx/iw9/core/lasers/vfx_laser_nvg_end_die.vfx");
        setdevdvarifuninitialized(@"hash_388b2c9297bbe819", 0);
        while (1) {
            if (getdvarint(@"hash_388b2c9297bbe819", 0) != 0 && isdefined(level.var_da28469a4f1d6123)) {
                for (i = 0; i < level.var_da28469a4f1d6123.size; i++) {
                    trap = level.var_da28469a4f1d6123[i];
                    sphere(trap.origin, 32, (1, 0, 0), 0, 1);
                    text = "KILLSTREAKS_HINTS/SENTRY_OTHER_USE";
                    if (isdefined(trap.defuseobj)) {
                        text = "KILLSTREAKS_HINTS/SENTRY_DISMANTLE" + trap.defuseobj getscriptablepartstate("yaw");
                        turrets = ter_op(isdefined(trap.turrets), trap.turrets, trap.defuseobj.var_e40178ee59662442);
                        foreach (turret in turrets) {
                            if (isdefined(turret)) {
                                line(trap.origin, turret.origin, (1, 1, 0), 0.8, 0, 1);
                            }
                        }
                    } else {
                        text = "prematch_done";
                    }
                    print3d(trap.origin, text, (1, 0, 0), 1, 0.7, 1, 0);
                }
            }
            waitframe();
        }
    #/
}

