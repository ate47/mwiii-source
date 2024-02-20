// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using script_3b64eb40368c1450;
#using script_4b87f2871b6b025c;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\entityheadicons.gsc;

#namespace oxygenmask;

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x361
// Size: 0x66
function function_234851f94416f178() {
    level.var_f6bad8618358a031 = spawnstruct();
    level.var_f6bad8618358a031.var_3d605bc71c5d48e3 = "iw9_oxygenmask";
    level.var_f6bad8618358a031.var_1df8739f84d611ae = 99;
    if (issharedfuncdefined("oxygenmask", "init")) {
        [[ getsharedfunc("oxygenmask", "init") ]]();
    }
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ce
// Size: 0x26
function give_oxygenmask() {
    if (istrue(self.var_23a6763562820c70) && iscp()) {
        return 0;
    }
    thread function_80143a61b671bdd3();
    return 1;
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fc
// Size: 0xd
function function_23a6763562820c70() {
    return istrue(self.var_23a6763562820c70);
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x411
// Size: 0xe2
function oxygenmask_tryShowHint() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self notify("oxygenmask_tryShowHint");
    self endon("oxygenmask_tryShowHint");
    if (!isdefined(level.var_f6bad8618358a031.var_4a80a7848a4968e2)) {
        level.var_f6bad8618358a031.var_4a80a7848a4968e2 = [];
    }
    var_afd4a4922443a15c = level.var_f6bad8618358a031.var_4a80a7848a4968e2;
    entnum = self getentitynumber();
    if (!isdefined(var_afd4a4922443a15c[entnum])) {
        var_afd4a4922443a15c[entnum] = 0;
    }
    var_d5a0474d01815168 = getdvarint(@"hash_cfa01cde7d01c1e2", 1);
    if (var_d5a0474d01815168 <= var_afd4a4922443a15c[entnum]) {
        return;
    } else {
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("rebreather_hint");
        wait(5);
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
        var_afd4a4922443a15c[entnum]++;
        level.var_f6bad8618358a031.var_4a80a7848a4968e2 = var_afd4a4922443a15c;
    }
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fa
// Size: 0x67
function function_8fc85383e9f1b6e6() {
    if (istrue(self.var_23a6763562820c70)) {
        /#
            announcement("ads");
        #/
        if (soundexists("cp_oxygenmask_hiss")) {
            playsoundatpos(self.origin, "cp_oxygenmask_hiss");
        }
        thread function_a51cb31233eacf9e();
        if (isdefined(self.var_72f72f6558f6a22a)) {
            self.var_72f72f6558f6a22a delete();
        }
        return 1;
    }
    return 0;
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x569
// Size: 0x1a0
function private function_80143a61b671bdd3() {
    self endon("disconnect");
    self endon("game_ended");
    self endon("drop_oxygenmask");
    self notify("give_oxygenmask");
    self endon("give_oxygenmask");
    currweapon = self getcurrentweapon();
    if (currweapon.basename != "none") {
        if (getdvarint(@"hash_44f86dd3c04fba8f", 0)) {
            if (namespace_448ccf1ca136fbbe::iscp()) {
                self forceplaygestureviewmodel("ges_magma_gas_mask_on");
            } else {
                self forceplaygestureviewmodel("ges_visor_down");
            }
        }
    }
    if (namespace_448ccf1ca136fbbe::iscp()) {
        namespace_1cd9f6896754adb0::set("oxygenmask", "weapon_switch", 0);
        namespace_1cd9f6896754adb0::set("oxygenmask", "melee", 0);
        namespace_1cd9f6896754adb0::set("oxygenmask", "equipment_primary", 0);
        namespace_1cd9f6896754adb0::set("oxygenmask", "equipment_secondary", 0);
        namespace_1cd9f6896754adb0::set("oxygenmask", "weapon_pickup", 0);
    }
    thread oxygenmask_tryShowHint();
    function_2f21b35828315a0(0);
    if (issharedfuncdefined("oxygenmask", "onGive")) {
        self [[ getsharedfunc("oxygenmask", "onGive") ]]();
    }
    self.var_23a6763562820c70 = 1;
    self.var_c0eb949c54277b2c = undefined;
    if (namespace_448ccf1ca136fbbe::iscp()) {
        namespace_8ade6bdb04213c12::function_a05de828303d4bed();
        childthread namespace_8ade6bdb04213c12::function_8c3428aeb7c8b1f4(10);
        function_c2ee77402d52be9(level.var_f6bad8618358a031.var_3d605bc71c5d48e3);
        wait(0.5);
    }
    thread oxygenmask_handle_death();
    if (issharedfuncdefined("oxygenmask", "onEquip")) {
        [[ getsharedfunc("oxygenmask", "onEquip") ]]();
    }
    function_7823f77f978a3360();
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x710
// Size: 0x169
function function_7823f77f978a3360() {
    self endon("disconnect");
    self endon("game_ended");
    self endon("drop_oxygenmask");
    self endon("give_oxygenmask");
    while (1) {
        wait(0.05);
        can_use = function_67506c2318ca4da2();
        trying = function_27e7b88ea18125f();
        var_d45ca71a300e2c90 = isdefined(self getcurrentweapon()) && is_equal(self getcurrentweapon().var_9d7facbe889e667c, %"iw9_oxygenmask");
        var_a7c6d05b37dcde8e = isdefined(self.vehicle) && namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(self.vehicle) == self || isusingremote();
        if (!var_d45ca71a300e2c90 && !var_a7c6d05b37dcde8e) {
            thread function_a51cb31233eacf9e();
        }
        if (trying && can_use) {
            function_44524a0826f0975a(1);
            function_eae1981ab021806b();
        } else if (trying && !can_use) {
            function_44524a0826f0975a(0);
            if (issharedfuncdefined("oxygenmask", "onUnusable")) {
                self thread [[ getsharedfunc("oxygenmask", "onUnusable") ]]();
            }
        } else if (can_use && !trying) {
            function_44524a0826f0975a(1);
            if (iscp()) {
                function_8b61dac63b58c6ce("Ready");
            }
        } else {
            function_44524a0826f0975a(0);
            if (iscp()) {
                function_8b61dac63b58c6ce("Not Usable");
            }
        }
    }
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x880
// Size: 0x9
function function_2e4cd4d627c30c24() {
    return give_oxygenmask();
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x891
// Size: 0x3
function private function_2c9c3bc278844056() {
    
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x89b
// Size: 0x59
function private function_44524a0826f0975a(toggle) {
    if (isdefined(self.var_9c26d9c1ec7fdc65) && self.var_9c26d9c1ec7fdc65 == toggle) {
        return;
    }
    self.var_9c26d9c1ec7fdc65 = toggle;
    if (istrue(toggle)) {
        namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("oxygenmask_canfire");
    } else {
        namespace_1cd9f6896754adb0::set("oxygenmask_canfire", "fire", 0);
    }
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8fb
// Size: 0x59
function private function_2f21b35828315a0(toggle) {
    if (isdefined(self.var_58a1bd2c2c9338ad) && self.var_58a1bd2c2c9338ad == toggle) {
        return;
    }
    self.var_58a1bd2c2c9338ad = toggle;
    if (istrue(toggle)) {
        namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("oxygenmask_canads");
    } else {
        namespace_1cd9f6896754adb0::set("oxygenmask_canads", "ads", 0);
    }
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x95b
// Size: 0x3c
function private function_c2ee77402d52be9(var_848e355a646647a0) {
    self.var_9a46747153a02d2f = self getcurrentweapon();
    var_4c31d0690f7e6d1d = makeweapon(var_848e355a646647a0);
    _giveweapon(var_4c31d0690f7e6d1d);
    self switchtoweaponimmediate(var_4c31d0690f7e6d1d);
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x99e
// Size: 0x57
function private function_581a506815c94633(deployweaponname) {
    self endon("death_or_disconnect");
    if (self isgestureplaying()) {
        self stopgestureviewmodel();
    }
    if (self isviewmodelanimplaying()) {
        self stopviewmodelanim();
    }
    objweapon = makeweapon(deployweaponname);
    result = function_f19f8b4cf085ecbd(objweapon);
    return result;
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fd
// Size: 0x2c
function function_8b61dac63b58c6ce(state) {
    if (self.var_fe2b9ee0479ad3cf != state) {
        self.var_fe2b9ee0479ad3cf = state;
        self notify("oxygenmask_changestate");
    }
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa30
// Size: 0x1f
function function_ddd53cc3c592bd02() {
    if (!isdefined(self.var_fe2b9ee0479ad3cf)) {
        return "";
    }
    return self.var_fe2b9ee0479ad3cf;
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa57
// Size: 0x61
function private oxygenmask_handle_death() {
    self endon("disconnect");
    self notify("oxygenmask_handle_death");
    self endon("oxygenmask_handle_death");
    self waittill("death");
    if (!istrue(self.var_23a6763562820c70)) {
        return;
    }
    if (iscp()) {
        self.var_72f72f6558f6a22a delete();
    }
    thread function_a51cb31233eacf9e();
    self waittill("spawned_player");
    wait(1);
    give_oxygenmask();
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabf
// Size: 0xd8
function function_a51cb31233eacf9e() {
    self notify("drop_oxygenmask");
    namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("oxygenmask");
    namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("oxygenmask_canfire");
    namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("oxygenmask_canads");
    if (issharedfuncdefined("oxygenmask", "onRemove")) {
        [[ getsharedfunc("oxygenmask", "onRemove") ]]();
    }
    self.var_23a6763562820c70 = undefined;
    self.var_a3bde3b734d04764 = undefined;
    self.var_58a1bd2c2c9338ad = undefined;
    self.var_9c26d9c1ec7fdc65 = undefined;
    currweapon = self getcurrentweapon();
    if (currweapon.basename != "none") {
        if (getdvarint(@"hash_44f86dd3c04fba8f", 0)) {
            if (namespace_448ccf1ca136fbbe::iscp()) {
                self forceplaygestureviewmodel("ges_magma_gas_mask_off");
            } else {
                self forceplaygestureviewmodel("ges_visor_up");
            }
        }
    }
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb9e
// Size: 0x37
function private function_27e7b88ea18125f() {
    if (self attackbuttonpressed() || self buttonpressed("MOUSE1") || istrue(self.var_af23415abf13e8fa) && function_988138367c74b1f5()) {
        return 1;
    }
    return 0;
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbdd
// Size: 0xd2
function private function_67506c2318ca4da2() {
    if (!_isalive()) {
        return 0;
    }
    if (istrue(self.inlaststand)) {
        return 0;
    }
    if (getdvarint(@"hash_73621d9d9f54e301", 0)) {
        return 1;
    }
    if (!self function_6f55d55ccff20d14()) {
        return 0;
    }
    if (self function_635e39fc16a64657()) {
        return 0;
    }
    if (self israisingweapon()) {
        return 0;
    }
    if (!isnullweapon(self getheldoffhand())) {
        return 0;
    }
    if (istrue(self.var_a3bde3b734d04764)) {
        return 0;
    }
    if (istrue(self.var_c0eb949c54277b2c)) {
        return 0;
    }
    if (istrue(level.var_ec0baa43406de34a)) {
        return 0;
    }
    if (istrue(self.var_8d47f4af9323f11e)) {
        return 0;
    }
    if (isdefined(self.var_984bd769a1e0201e)) {
        usetime = 4000;
        if (gettime() < self.var_984bd769a1e0201e + usetime) {
            return 0;
        }
    }
    return 1;
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcb7
// Size: 0x16
function private function_bc75520a8c4707ba() {
    return getdvarfloat(@"hash_c5320528e750d996", 0.75);
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcd5
// Size: 0x124
function private function_eae1981ab021806b() {
    self endon("death");
    self endon("oxygenmask_fail");
    function_2f21b35828315a0(1);
    if (issharedfuncdefined("oxygenmask", "onUse")) {
        [[ getsharedfunc("oxygenmask", "onUse") ]]();
    }
    self.var_a3bde3b734d04764 = 1;
    self.var_af23415abf13e8fa = undefined;
    self.var_984bd769a1e0201e = gettime();
    self playlocalsound("plr_breath_pain_init");
    thread function_1ab4e7e73ad0c18e();
    thread function_5ec8d8473d72b73();
    thread function_2c9c3bc278844056();
    self notify("used_oxygen_mask");
    level notify("used_oxygen_mask", self);
    var_110a8239b8d015bc = waittill_notify_or_timeout_return("weapon_fired", 4);
    if (var_110a8239b8d015bc == "weapon_fired") {
        thread function_95812dcc553470bd();
    }
    self notify("oxygenmask_fired");
    function_9ac10cec8e7b9d40();
    if (issharedfuncdefined("oxygenmask", "onUseComplete")) {
        self [[ getsharedfunc("oxygenmask", "onUseComplete") ]]();
    }
    if (getdvarint(@"hash_1280ac8ef0dd0e07", 0)) {
        self waittill("can_use_mask_now");
    }
    while (function_27e7b88ea18125f()) {
        wait(0.05);
    }
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe00
// Size: 0x2e
function function_1ab4e7e73ad0c18e() {
    self endon("oxygenmask_fail");
    self endon("drop_oxygenmask");
    self endon("death_or_disconnect");
    level endon("game_ended");
    wait(3.32);
    thread function_44524a0826f0975a(0);
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe35
// Size: 0x15
function function_9ac10cec8e7b9d40() {
    self.var_a3bde3b734d04764 = 0;
    function_2f21b35828315a0(0);
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe51
// Size: 0x3f
function private function_87a62a5519055b00() {
    self endon("death");
    delay = 1;
    if (istrue(self.var_d988fa5d07c2a5bd)) {
        delay = 0.1;
    }
    self.var_d988fa5d07c2a5bd = 1;
    wait(delay);
    self function_5c5c9cbae3114b0();
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xe97
// Size: 0xa9
function private function_64a40faf54efbdb0() {
    icon = "hud_icon_equipment_oxygen";
    offset = 16;
    var_b9352c16dbbdc298 = 1;
    var_1e440f4549d5e518 = [];
    if (level.players.size == 1) {
        return;
    }
    for (i = 0; i < level.players.size; i++) {
        if (level.players[i] != self) {
            var_1e440f4549d5e518[var_1e440f4549d5e518.size] = level.players[i];
        }
    }
    self.var_afd8a16fcba5b91 = namespace_7bdde15c3500a23f::setheadicon_singleimage(var_1e440f4549d5e518, icon, offset, 0, 512, 100, 0, 0, var_b9352c16dbbdc298, undefined, 1);
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf47
// Size: 0x2a
function private function_afbabc657353367f() {
    if (isdefined(self.var_afd8a16fcba5b91)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.var_afd8a16fcba5b91);
        self.var_afd8a16fcba5b91 = undefined;
    }
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf78
// Size: 0x7c
function private debug_allow_shoot_while_ufoing() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("drop_oxygenmask");
    currentstate = 0;
    while (1) {
        if (self isufo() && currentstate == 0) {
            currentstate = 1;
            namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("debug_allow_shoot_while_ufoing");
        } else if (!self isufo() && currentstate == 1) {
            currentstate = 0;
            namespace_1cd9f6896754adb0::set("debug_allow_shoot_while_ufoing", "fire", 0);
        }
        wait(0.05);
    }
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xffb
// Size: 0x51
function private function_95812dcc553470bd() {
    self endon("disconnect");
    level endon("game_ended");
    self endon("give_oxygenmask");
    var_96da5f505495f48a = getdvarint(@"hash_dbb8c128e4b02706", level.var_f6bad8618358a031.var_1df8739f84d611ae);
    namespace_8ade6bdb04213c12::function_8c3428aeb7c8b1f4(var_96da5f505495f48a, &function_bc75520a8c4707ba);
}

// Namespace oxygenmask/namespace_86d0d418da518a0e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1053
// Size: 0x44
function private function_5ec8d8473d72b73() {
    self endon("disconnect");
    level endon("game_ended");
    self function_9e7f47b1711dca62();
    if (iscp()) {
        childthread function_87a62a5519055b00();
    } else {
        waittill_any_2("oxygenmask_fail", "oxygenmask_fired");
        self function_5c5c9cbae3114b0();
    }
}
