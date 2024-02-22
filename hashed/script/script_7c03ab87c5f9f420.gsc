// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\script.gsc;
#using script_67015c88c47ec4f8;
#using script_48814951e916af89;
#using script_6a8ec730b2bfa844;
#using scripts\cp_mp\execution.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\hud_message.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace disguise;

// Namespace disguise/namespace_c39580665208f0a4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e4
// Size: 0xb6
function function_83599506981c29cd() {
    level.var_8c0f3022529be75e = spawnstruct();
    function_38cf81cf267278dc();
    if (level.mapname == "mp_br_mechanics" && getdvarint(@"hash_8fa9d384348cb11b", 0)) {
        var_2779ed8bc9c5f43c = getent("player_conceal", "targetname");
        var_c37d0500f8c1c938 = spawn("script_model", (0, 0, 0));
        var_c37d0500f8c1c938.angles = (0, 0, 0);
        var_c37d0500f8c1c938 clonebrushmodeltoscriptmodel(var_2779ed8bc9c5f43c);
        var_c37d0500f8c1c938 dontinterpolate();
        level.var_8c0f3022529be75e.var_c37d0500f8c1c938 = var_c37d0500f8c1c938;
    }
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a1
// Size: 0xb9
function function_38cf81cf267278dc() {
    if (!isdefined(level.var_8c0f3022529be75e)) {
        return;
    }
    level.var_8c0f3022529be75e.var_53be2821da633fd7 = [];
    function_4981209c2c509828("alqatala", "body_dmz_disguised_al_qatala_iw9_1_1", "head_dmz_disguised_al_qatala_iw9_1_1", "mp_vm_opforce_al_qatala_elite_ar_1_1", "vestlight", "milhvygr");
    function_4981209c2c509828("shadowcompany", "body_dmz_disguised_shadow_company_iw9_1_1", "head_dmz_disguised_shadow_company_iw9_1_1", "mp_vm_opforce_shadow_company_elite_1_1", "nylon", "millghtgr");
    function_4981209c2c509828("konnig", "body_dmz_disguised_unidentified_iw9_1_1", "head_dmz_disguised_unidentified_iw9_1_1", "mp_vm_dmz_disguised_unidentified_iw9_1_1", "nylon", "millghtgr");
    if (issharedfuncdefined("disguise", "disguiseRegisterCustom")) {
        function_f3bb4f4911a1beb2("disguise", "disguiseRegisterCustom");
    }
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x661
// Size: 0x45
function function_eb1fe3a0083b03df(factionname) {
    /#
        assertex(isdefined(level.var_8c0f3022529be75e.var_53be2821da633fd7[factionname]), "You've specified a faction that there is no disguise for. Please try again :D");
    #/
    return level.var_8c0f3022529be75e.var_53be2821da633fd7[factionname];
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6ae
// Size: 0x4f
function function_291a4b6e765bfcc6(factionname) {
    /#
        assertex(isdefined(level.var_8c0f3022529be75e.var_53be2821da633fd7[factionname]), "You've specified a faction that there is no disguise for. Please try again :D");
    #/
    return level.var_8c0f3022529be75e.var_53be2821da633fd7[factionname].head;
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x705
// Size: 0x4f
function function_4d2ad5e5595384f0(factionname) {
    /#
        assertex(isdefined(level.var_8c0f3022529be75e.var_53be2821da633fd7[factionname]), "You've specified a faction that there is no disguise for. Please try again :D");
    #/
    return level.var_8c0f3022529be75e.var_53be2821da633fd7[factionname].body;
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x75c
// Size: 0x4f
function function_aba28cc8c36eeaf7(factionname) {
    /#
        assertex(isdefined(level.var_8c0f3022529be75e.var_53be2821da633fd7[factionname]), "You've specified a faction that there is no disguise for. Please try again :D");
    #/
    return level.var_8c0f3022529be75e.var_53be2821da633fd7[factionname].arms;
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b3
// Size: 0x9d
function function_4981209c2c509828(key, body, head, var_5b10cef5f2960853, cloth, gear) {
    var_4da14ba3163b540f = spawnstruct();
    var_4da14ba3163b540f.body = body;
    var_4da14ba3163b540f.head = head;
    var_4da14ba3163b540f.arms = var_5b10cef5f2960853;
    var_4da14ba3163b540f.cloth = cloth;
    var_4da14ba3163b540f.gear = gear;
    level.var_8c0f3022529be75e.var_53be2821da633fd7[key] = var_4da14ba3163b540f;
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x857
// Size: 0x57
function function_310843b56a04e24c() {
    subarea = namespace_bfef6903bca5845d::function_a44e168e8cced18(self.origin);
    nationality = namespace_bfef6903bca5845d::function_f851a2f41cffa860();
    if (isdefined(subarea.var_a42c3e0e1b2dc645)) {
        nationality = subarea.var_a42c3e0e1b2dc645;
    }
    return function_eb1fe3a0083b03df(function_466e5ad92c500882(nationality));
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b6
// Size: 0xa0
function function_466e5ad92c500882(nationality) {
    /#
        assertex(isdefined(nationality), "Disguise looked for a nationality but none was found.");
    #/
    if (issharedfuncdefined("disguise", "disguiseNationalityOverride")) {
        return function_f3bb4f4911a1beb2("disguise", "disguiseNationalityOverride");
    } else {
        switch (nationality) {
        case #"hash_916b14e9c168191":
        case #"hash_19b89634f50eeda4":
            return "shadowcompany";
        case #"hash_fa18d1f6bd5790c7":
            return "alqatala";
        case #"hash_fa53bdf6bd853c80":
            return "konnig";
        default:
            return "alqatala";
            break;
        }
    }
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95d
// Size: 0xf1
function function_67d03e329e13f612(itemslotindex, quantity) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (!isdefined(self.operatorcustomization)) {
        return;
    }
    function_7e30d4841d0abe41(1);
    self.disguised = 1;
    function_a1650ef824a7be56(1);
    function_a8cb3b8e739c633e(itemslotindex, quantity);
    self playsound("fly_dmz_disguise_on");
    namespace_8361bad7391de074::function_2d3c14faa38e2146(self);
    if (!istrue(self.var_859654e0445a36d9)) {
        self forceplaygestureviewmodel("iw9_vm_ges_disguise_on");
    }
    var_a78681b284f9ae0a = getdvarfloat(@"hash_62171a84e10129ab", 0.35);
    childthread function_9292cbe2dec7d826(var_a78681b284f9ae0a, 1);
    childthread function_b02057aaa6d29ba1(1, var_a78681b284f9ae0a);
    thread function_d8d7a08a9fd9a9f();
    if (issharedfuncdefined("disguise", "disguiseOnUsed")) {
        function_f3bb4f4911a1beb2("disguise", "disguiseOnUsed");
    }
    namespace_3c37cb17ade254d::delaythread(var_a78681b284f9ae0a, &function_7e30d4841d0abe41, 0);
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa55
// Size: 0xb0
function function_a8cb3b8e739c633e(itemslotindex, quantity) {
    if (!isdefined(quantity)) {
        quantity = 108;
    }
    var_62fff9b22e767d8e = spawnstruct();
    var_62fff9b22e767d8e.executionref = namespace_f446f6030ca8cff8::execution_getrefbyplayer(self);
    var_62fff9b22e767d8e.head = self.operatorcustomization.head;
    var_62fff9b22e767d8e.body = self.operatorcustomization.body;
    var_62fff9b22e767d8e.health = quantity;
    var_62fff9b22e767d8e.maxhealth = 108;
    var_62fff9b22e767d8e.backpackslot = itemslotindex;
    self.var_454034054e53bd79 = var_62fff9b22e767d8e;
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0c
// Size: 0x31
function function_9ee717001acd63a0(newindex) {
    var_8c0f3022529be75e = function_3275d6441a8e838a();
    if (!isdefined(var_8c0f3022529be75e)) {
        return 0;
    }
    var_8c0f3022529be75e.backpackslot = newindex;
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb44
// Size: 0x47
function function_8e1f9b3b6c83372d(index) {
    if (!istrue(self.disguised)) {
        return 0;
    }
    var_8c0f3022529be75e = function_3275d6441a8e838a();
    if (!isdefined(var_8c0f3022529be75e)) {
        return 0;
    }
    if (var_8c0f3022529be75e.backpackslot == index) {
        return 1;
    }
    return 0;
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb93
// Size: 0xd
function function_81475bb5a5a5c48f() {
    self.var_454034054e53bd79 = undefined;
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba7
// Size: 0x24
function function_3275d6441a8e838a() {
    /#
        assertex(isdefined(self.var_454034054e53bd79), "Tried to get disguise data when one isn't set");
    #/
    return self.var_454034054e53bd79;
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd3
// Size: 0x4c
function function_7e30d4841d0abe41(var_27c777ae907b9fa) {
    self.var_74642c7f377a42c5 = var_27c777ae907b9fa;
    if (var_27c777ae907b9fa) {
        array = [0:"offhand_weapons"];
        namespace_1cd9f6896754adb0::function_59c053b89257bc95("disguise", array, 0);
    } else {
        namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("disguise");
    }
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc26
// Size: 0xd
function function_65a78266ead29817() {
    return istrue(self.var_74642c7f377a42c5);
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3b
// Size: 0x50
function function_c2afddb38bd47f6f(itemslotindex, quantity) {
    if (istrue(self.var_ef8c89617046f3b7) || !function_43207ffc5e843003()) {
        namespace_44abc05161e2e2cb::showerrormessage("MP/CANNOT_USE_GENERIC");
    } else if (function_65a78266ead29817()) {
        return;
    } else {
        function_67d03e329e13f612(itemslotindex, quantity);
    }
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc92
// Size: 0x107
function function_9292cbe2dec7d826(delay, ison) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    wait(delay);
    if (ison) {
        function_8dd1c5e3042447b8(1);
        function_890834271f0a6fc5();
        var_d2f434df04eb7ede = function_310843b56a04e24c();
        self setcustomization(var_d2f434df04eb7ede.body, var_d2f434df04eb7ede.head);
        self setclothtype(var_d2f434df04eb7ede.cloth);
        self function_8abe5a968cc3c220(var_d2f434df04eb7ede.gear);
        thread namespace_e0526929a9f43046::function_8bfea85875208730();
        delaythread(1, &function_8dd1c5e3042447b8, 0);
    } else {
        namespace_f446f6030ca8cff8::_giveexecution(self.var_454034054e53bd79.executionref);
        self setscriptablepartstate("disguise", "off", 0);
        self setcustomization(self.operatorcustomization.body, self.operatorcustomization.head);
        function_81475bb5a5a5c48f();
    }
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda0
// Size: 0x36
function function_8dd1c5e3042447b8(ison) {
    state = ter_op(ison, "on", "off");
    self setscriptablepartstate("disguise", state, 0);
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddd
// Size: 0x18
function function_d3b190ee881c5ca7() {
    if (!istrue(self.disguised)) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfc
// Size: 0x3a
function function_3ede6b66136c0f93(var_8a127de2ec4f8b49) {
    if (!istrue(self.disguised) || function_65a78266ead29817() || !namespace_e0526929a9f43046::function_25e7a6883c64324c()) {
        return;
    } else {
        function_da46be98ff60908d(var_8a127de2ec4f8b49);
    }
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3d
// Size: 0x1cb
function function_da46be98ff60908d(var_575bccb498ed7f9e) {
    if (!istrue(self.disguised)) {
        return;
    }
    function_7e30d4841d0abe41(1);
    function_a1650ef824a7be56(0);
    self playsound("fly_dmz_disguise_off");
    currentweapon = self getcurrentweapon();
    if (!istrue(self.var_859654e0445a36d9) && isdefined(currentweapon) && !isnullweapon(currentweapon)) {
        self forceplaygestureviewmodel("iw9_vm_ges_disguise_off");
    }
    var_ba9eca80dd516cae = getdvarfloat(@"hash_307d1884bcaef28f", 0.45);
    childthread function_9292cbe2dec7d826(var_ba9eca80dd516cae, 0);
    childthread function_b02057aaa6d29ba1(0, var_ba9eca80dd516cae);
    self.disguised = undefined;
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.clothtype) && self.operatorcustomization.clothtype != "") {
        self setclothtype(self.operatorcustomization.clothtype);
    } else {
        self setclothtype("vestlight");
    }
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.var_400ef51562606e7a) && self.operatorcustomization.var_400ef51562606e7a != "") {
        self function_8abe5a968cc3c220(self.operatorcustomization.var_400ef51562606e7a);
    } else {
        self function_8abe5a968cc3c220("millghtgr");
    }
    self setclientomnvar("ui_dmz_disguise_sixth_sense_glow", 0);
    namespace_3c37cb17ade254d::delaythread(var_ba9eca80dd516cae, &function_7e30d4841d0abe41, 0);
    if (issharedfuncdefined("disguise", "disguiseOff")) {
        function_f3bb4f4911a1beb2("disguise", "disguiseOff");
    }
    self notify("disguise_ended");
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100f
// Size: 0x31
function function_b02057aaa6d29ba1(ison, delay) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    wait(delay);
    self setclientomnvar("ui_dmz_disguise_state", ison);
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1047
// Size: 0x11b
function function_a1650ef824a7be56(var_74fa01bd3626f0b7) {
    if (isdefined(level.var_8c0f3022529be75e.var_c37d0500f8c1c938)) {
        if (var_74fa01bd3626f0b7) {
            var_54a491b5dd59f575 = level.var_8c0f3022529be75e.var_c37d0500f8c1c938;
            var_54a491b5dd59f575.origin = self.origin;
            var_54a491b5dd59f575.angles = self.angles;
            var_54a491b5dd59f575.owner = self;
            var_54a491b5dd59f575 linkto(self);
            self.var_c8395b9bae721f6b.var_c37d0500f8c1c938 = var_54a491b5dd59f575;
        } else {
            self.var_c8395b9bae721f6b.var_c37d0500f8c1c938 unlink();
            self.var_c8395b9bae721f6b.var_c37d0500f8c1c938.origin = (0, 0, 0);
            self.var_c8395b9bae721f6b.var_c37d0500f8c1c938.owner = undefined;
            self.var_c8395b9bae721f6b.var_c37d0500f8c1c938 = undefined;
        }
    } else {
        function_ed9b1ddd2ec82dab(self, var_74fa01bd3626f0b7);
    }
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1169
// Size: 0x38
function function_d8d7a08a9fd9a9f() {
    self endon("death_or_disconnect");
    self endon("disguise_ended");
    if (getdvarint(@"hash_8303972c0cfbece0", 1) != 1) {
        return;
    }
    while (1) {
        function_d293a200fe5d81c1();
        waitframe();
    }
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a8
// Size: 0x6e
function function_bc96cf8a43c99435() {
    origin = self.origin;
    radius = getdvarfloat(@"hash_1ef2c1fad9dad02f", 1000);
    var_674daafffc0aacf3 = undefined;
    if (function_a794fcf9545f2062()) {
        var_674daafffc0aacf3 = function_b1eef70090b5b7b5(origin, radius, function_869ccb4e3451b8c6([0:"etype_ai"]), undefined, undefined);
    } else {
        var_674daafffc0aacf3 = getaiarrayinradius(origin, radius);
    }
    return var_674daafffc0aacf3;
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121e
// Size: 0x1a0
function function_d293a200fe5d81c1() {
    contents = namespace_2a184fc4902783dc::create_default_contents(1);
    debug = getdvarint(@"hash_c6b2b86fd34e0636", 0) == 1;
    process = 0;
    var_75abbf0830c5d3fa = 0;
    var_7a25ddb41e7358db = undefined;
    var_746071ab06f38fd = undefined;
    time = getsystemtimeinmicroseconds();
    if (!isdefined(self)) {
        return 0;
    }
    if (!istrue(self.disguised)) {
        return 0;
    }
    var_674daafffc0aacf3 = function_bc96cf8a43c99435();
    var_24f9b94a171cca52 = namespace_7e17181d03156026::getstancecenter();
    foreach (agent in var_674daafffc0aacf3) {
        if (process >= 25) {
            process = 0;
            waitframe();
        }
        if (!function_7e44e1aadd3ddf3a(agent)) {
            continue;
        }
        process++;
        var_c903a259216d97e0 = agent.origin;
        threatlevel = agent getthreatsight(self);
        if (threatlevel < 0.25) {
            continue;
        }
        var_75abbf0830c5d3fa = var_75abbf0830c5d3fa | function_8cd5129459f5cd9c(agent);
    }
    function_443abc2e017f4e40(var_75abbf0830c5d3fa);
    if (var_75abbf0830c5d3fa != 0) {
        if (!isdefined(self.var_db46ac7f2e05d19d) || (gettime() - self.var_db46ac7f2e05d19d) / 1000 >= 4) {
            self playlocalsound("iw9_mp_disguise_alert");
            self.var_db46ac7f2e05d19d = gettime();
        }
    }
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c5
// Size: 0x3c
function function_7e44e1aadd3ddf3a(agent) {
    if (!isdefined(self)) {
        return;
    }
    if (!namespace_f8065cafc523dba5::_isalive()) {
        return 0;
    }
    if (!isdefined(agent)) {
        return 0;
    }
    if (!isalive(agent)) {
        return 0;
    }
    if (namespace_448ccf1ca136fbbe::isusingremote()) {
        return 0;
    }
    return 1;
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1409
// Size: 0x10a
function function_8cd5129459f5cd9c(agent) {
    forward = vectornormalize(anglestoforward(self getplayerangles()));
    toenemy = vectornormalize(agent.origin - self.origin);
    dot = vectordot(forward, toenemy);
    if (dot >= 0.92388) {
        return 2;
    } else if (dot >= 0.707107) {
        return ter_op(utility::isleft2d(self.origin, forward, agent.origin), 4, 1);
    } else if (dot >= 0.5) {
        return ter_op(utility::isleft2d(self.origin, forward, agent.origin), 128, 64);
    } else if (dot >= -0.707107) {
        return ter_op(utility::isleft2d(self.origin, forward, agent.origin), 32, 8);
    } else {
        return 16;
    }
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151a
// Size: 0x19
function function_443abc2e017f4e40(var_75abbf0830c5d3fa) {
    self setclientomnvar("ui_dmz_disguise_sixth_sense_glow", var_75abbf0830c5d3fa);
}

// Namespace disguise/namespace_c39580665208f0a4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x153a
// Size: 0x61
function function_890834271f0a6fc5() {
    var_cb11f01bf67d6e03 = [0:"000", 1:"001", 2:"022", 3:"023"];
    var_7be710153f5d3671 = var_cb11f01bf67d6e03[randomint(var_cb11f01bf67d6e03.size)];
    var_ef173b498a2db825 = "execution_" + var_7be710153f5d3671;
    namespace_f446f6030ca8cff8::_giveexecution(var_ef173b498a2db825);
}

