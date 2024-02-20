// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3214e6fcdce468a7;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_3b64eb40368c1450;
#using script_3a4480ba1c5664d0;
#using script_639bf783929acf9b;
#using script_638d701d263ee1ed;
#using script_860bfdfe82326e3;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using script_2583ee5680cf4736;
#using script_6bffae1b97f70547;
#using script_2669878cf5a1b6bc;

#namespace pack_a_punch;

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54a
// Size: 0x127
function init_pap(var_74cdac95bea43e20) {
    /#
        level thread function_3749f024c16fcc43();
    #/
    level.var_28967913115d1fa3 = [];
    level.var_74cdac95bea43e20 = [];
    namespace_4164bc931714b00b::function_72f3dd0512f43c96("pack_a_punch", &function_b7481f7bce6ae192);
    level callback::add("player_connect", &function_4fea0f8d04cd5a9f);
    /#
        callback::add("SHARED_HINTSTRINGS/PAP_USE", &function_ac138c84c0432491);
    #/
    callback::add("player_weapon_change", &function_9978ad7acc70bbd0);
    level.var_999ad4260faef0e = [0:"", 1:"_pack", 2:"_pack", 3:"_pack"];
    level.var_b4d422cd8fbde1ad = 1;
    if (!istrue(level.var_1a2b600a06ec21f4.var_7746f48b0ed07126)) {
        level thread function_f2d3dc064699b591();
    } else {
        callback::add("ob_content_process_create_script", &function_f2d3dc064699b591);
    }
    level thread function_4aa535a603fcb16a(var_74cdac95bea43e20);
    registersharedfunc("zombie", "get_pap_level", &get_pap_level);
    level.var_41b1ceff53cc7e4d = throttle::function_e4c99b0f178ffb98("pap_disable_camo");
    level callback::add("ob_content_process_create_script", &function_5b6d2196b317fd35);
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x678
// Size: 0x1a2
function function_5b6d2196b317fd35(params) {
    if (isdefined(level.var_c383b967aa7e551b)) {
        var_81a0a69befe256bd = [];
        var_3c3122af5c02bd7 = getstructarray("content_struct", "variantname");
        foreach (struct in var_3c3122af5c02bd7) {
            if (isdefined(struct.content_key) && struct.content_key == "pap_spawn") {
                var_81a0a69befe256bd = array_add(var_81a0a69befe256bd, struct);
            }
        }
        var_647e08da9152309b = [];
        var_81a0a69befe256bd = array_randomize(var_81a0a69befe256bd);
        foreach (s_pap in var_81a0a69befe256bd) {
            region = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(s_pap.origin);
            if (!isdefined(region)) {
                continue;
            }
            var_73069b4add1e8094 = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(region);
            if (var_73069b4add1e8094 == "difficulty_hard" || var_73069b4add1e8094 == "difficulty_darkaether") {
                function_d76a5a37bdc449e3(s_pap);
                var_647e08da9152309b[var_647e08da9152309b.size] = s_pap;
                break;
            }
        }
        var_81a0a69befe256bd = [[ level.var_c383b967aa7e551b ]]("pap", var_81a0a69befe256bd, &function_d76a5a37bdc449e3, var_647e08da9152309b);
        level.var_28967913115d1fa3 = array_combine_unique(level.var_28967913115d1fa3, var_81a0a69befe256bd);
    }
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x821
// Size: 0x14
function private function_d76a5a37bdc449e3(var_cf7a501ac4f86500) {
    var_cf7a501ac4f86500 function_e9a23532607e421b();
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83c
// Size: 0x16
function function_4fea0f8d04cd5a9f(params) {
    self.var_7a6ac8a30c8eef4c = [];
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x859
// Size: 0x16c
function function_ac138c84c0432491(params) {
    /#
        self endon("death_or_disconnect");
        wait(3);
        if (level.var_b4d422cd8fbde1ad) {
            function_6e7290c8ee4f558b("weapon_level_changed" + self.name + "<unknown string>");
            foreach (s_pap in level.var_28967913115d1fa3) {
                function_b23a59dfb4ca49a1(s_pap.name, "<unknown string>" + s_pap.name + "<unknown string>" + self.name, &function_d1ffd6e50972869b);
            }
            function_fe953f000498048f();
            function_6e7290c8ee4f558b("<unknown string>" + self.name + "<unknown string>");
            foreach (s_pap in level.var_28967913115d1fa3) {
                function_b23a59dfb4ca49a1(s_pap.name, "<unknown string>" + s_pap.name + "<unknown string>" + self.name, &function_5b1246d4c3b2bae8);
            }
            function_fe953f000498048f();
        }
    #/
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cc
// Size: 0x15b
function function_f46640f2061fa40e() {
    level.var_389f96815631487 = [];
    var_3bdc59ecfc03a38d = function_127acf3af63de42e();
    level.var_389f96815631487["hintstring_only"] = spawnstruct();
    level.var_389f96815631487["hintstring_only"].var_f3201c9531e84083 = var_3bdc59ecfc03a38d.var_b310d95a43d51411;
    level.var_389f96815631487["hintstring_only"].var_40c5fe63017a0028 = var_3bdc59ecfc03a38d.var_b174fd304230ba35;
    level.var_389f96815631487["hintstring_only"].var_f3201d9531e842b6 = var_3bdc59ecfc03a38d.var_b310d65a43d50d78;
    level.var_389f96815631487["hintstring_only"].var_d9a16a76860e6fb5 = var_3bdc59ecfc03a38d.var_3a327e1fbf019eb6;
    level.var_389f96815631487["hintstring_only"].var_f3201e9531e844e9 = var_3bdc59ecfc03a38d.var_b310d75a43d50fab;
    level.var_389f96815631487["hintstring_only"].var_7a6ad8de7cb26202 = var_3bdc59ecfc03a38d.var_1dac12541578526b;
    level.var_389f96815631487["hintstring_only"].var_546f21bbff45af2f = var_3bdc59ecfc03a38d.var_741fb5ba0af7dbec;
    level.var_389f96815631487["hintstring_only"].var_e532cc181ecbb197 = var_3bdc59ecfc03a38d.var_34a3243d4dbe42f2;
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2e
// Size: 0x45
function function_8ffd6120b9e72251(v_pos) {
    if (isdefined(level.var_780248e36eabf6ef)) {
        var_2fcb35d230365682 = [[ level.var_780248e36eabf6ef ]](v_pos);
    } else {
        var_2fcb35d230365682 = namespace_7bf99ef58659a6f1::function_cfd0e1fb13d7e080(#"pap");
    }
    return var_2fcb35d230365682;
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb7b
// Size: 0xb2
function function_3749f024c16fcc43() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_48d69eea9b7ed244, 1);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_310eb57e9f489403);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_6301b4b9186189ec);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_9b340159cdb06093);
        function_fe953f000498048f();
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_6301b4b9186189ec);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_9b340159cdb06093);
        function_fe953f000498048f();
    #/
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc34
// Size: 0xfa
function private function_d1ffd6e50972869b(params) {
    /#
        s_pap = undefined;
        foreach (s_pap in level.var_28967913115d1fa3) {
            if (s_pap.name == params[0]) {
                foreach (player in level.players) {
                    if (player.name == params[1]) {
                        player.var_5070f05815274d88 = undefined;
                        s_pap.var_7eac685a52c75852.interact function_c1b2d811be564958(player);
                        return;
                    }
                }
            }
        }
    #/
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd35
// Size: 0xef
function private function_5b1246d4c3b2bae8(params) {
    /#
        s_pap = undefined;
        foreach (s_pap in level.var_28967913115d1fa3) {
            if (s_pap.name == params[0]) {
                foreach (player in level.players) {
                    if (player.name == params[1]) {
                        if (isdefined(player.var_a8b98c96e3cb2086)) {
                            player.var_5070f05815274d88 = 1;
                        }
                        return;
                    }
                }
            }
        }
    #/
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xe2b
// Size: 0x8c
function private function_6301b4b9186189ec() {
    /#
        foreach (player in level.players) {
            currentweapon = player getcurrentweapon();
            if (player function_251fcd097206e347(currentweapon)) {
                var_5476695cf42091ed = player get_pap_level(currentweapon);
                player pap_weapon(currentweapon, var_5476695cf42091ed);
            }
        }
    #/
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xebe
// Size: 0x61
function private function_9b340159cdb06093() {
    /#
        foreach (player in level.players) {
            player function_8a514af6a4020(player getcurrentweapon());
        }
    #/
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf26
// Size: 0x5b
function private function_310eb57e9f489403() {
    /#
        foreach (var_429a9d29cea7b27d in level.var_28967913115d1fa3) {
            var_429a9d29cea7b27d function_59e0fa513ce8100c();
        }
    #/
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf88
// Size: 0x98
function function_f2d3dc064699b591(params) {
    level endon("game_ended");
    function_f46640f2061fa40e();
    function_4fc54a99a17b78cb();
    waittillframeend();
    var_89a48fee7588a0ac = getstructarray("content_destination", "variantname");
    foreach (destination in var_89a48fee7588a0ac) {
        level thread function_e89cb00407326ff5(destination);
    }
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&function_7555b4c311cdf27c);
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1027
// Size: 0xd3
function function_e89cb00407326ff5(destination) {
    foreach (location in destination.locations) {
        var_acf916d23f5d36e4 = location.instances["pack_a_punch"];
        if (isdefined(var_acf916d23f5d36e4)) {
            foreach (instance in var_acf916d23f5d36e4.var_67b2b78e28eaa758) {
                namespace_4164bc931714b00b::function_7e2984b7610f3616(instance);
            }
        }
    }
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1101
// Size: 0xb6
function private function_b7481f7bce6ae192(instance) {
    level.var_28967913115d1fa3 = array_combine_unique(level.var_28967913115d1fa3, instance.var_305e36cbb51f88ce["pap_spawn"]);
    foreach (var_429a9d29cea7b27d in level.var_28967913115d1fa3) {
        var_429a9d29cea7b27d.str_destination = instance.location.destination.targetname;
        var_429a9d29cea7b27d function_e9a23532607e421b(instance);
    }
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11be
// Size: 0x9d
function function_4aa535a603fcb16a(var_74cdac95bea43e20) {
    if (isdefined(level.var_96c4059aa2eabfb8)) {
        var_74cdac95bea43e20 = [];
        foreach (str_weapon_name, s_weapon in level.var_96c4059aa2eabfb8) {
            if (istrue(s_weapon.var_7e7d6ac53ed5ca82)) {
                var_74cdac95bea43e20[str_weapon_name] = str_weapon_name;
            }
        }
    }
    /#
        if (!isdefined(var_74cdac95bea43e20)) {
            /#
                assertmsg("<unknown string>");
            #/
        }
    #/
    level.var_74cdac95bea43e20 = var_74cdac95bea43e20;
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1262
// Size: 0x5e
function function_127acf3af63de42e() {
    /#
        assertex(isdefined(level.var_1a2b600a06ec21f4.var_6f464c2be3ad4821), "Create a packapunch bundle asset to use in this gamemode and add to gamemodebundle");
    #/
    var_d8f161c6e98cdfa1 = function_53c4c53197386572(level.var_ae30f5b886731a98, level.var_1a2b600a06ec21f4.var_6f464c2be3ad4821);
    return getscriptbundle("packapunch:" + var_d8f161c6e98cdfa1);
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c8
// Size: 0x28
function function_4fc54a99a17b78cb() {
    s_bundle = function_127acf3af63de42e();
    level.var_3e7cdbf4c20a7f90 = s_bundle.var_6650ebf6fcafaf01;
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f7
// Size: 0x3c
function function_5e8f96f1bc95aacd() {
    s_bundle = function_127acf3af63de42e();
    if (isdefined(s_bundle.scriptable) && s_bundle.scriptable != "") {
        return 1;
    }
    return 0;
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133b
// Size: 0x36f
function function_e9a23532607e421b(instance) {
    if (isdefined(self.var_7eac685a52c75852)) {
        return;
    }
    s_bundle = function_127acf3af63de42e();
    self.var_2217ae64fad1e = s_bundle.model;
    self.radius = function_53c4c53197386572(self.radius, 64);
    level.var_47ea54565556fd68 = function_53c4c53197386572(level.var_47ea54565556fd68, 0);
    self.name = function_53c4c53197386572(self.targetname, "PAP_" + level.var_47ea54565556fd68);
    level.var_47ea54565556fd68++;
    if (function_5e8f96f1bc95aacd()) {
        var_e89a9a6a3475bd0a = function_127acf3af63de42e().scriptable;
        self.var_7eac685a52c75852 = spawnscriptable(var_e89a9a6a3475bd0a, self.origin, self.angles);
        self.var_7eac685a52c75852.interact = namespace_5775ad2badedbcaa::function_32645103f7520635(self.var_7eac685a52c75852, &function_c1b2d811be564958);
        self.var_7eac685a52c75852.s_pap = self;
        self.var_7eac685a52c75852.var_2fcb35d230365682 = function_8ffd6120b9e72251(self.var_7eac685a52c75852.origin);
        thread function_89884a03ad5f622c();
        if (!istrue(s_bundle.var_69e6100b657f07a6)) {
            self.var_7eac685a52c75852.interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_3b2684b76c1ab98e);
        }
    } else {
        self.var_7eac685a52c75852 = namespace_4164bc931714b00b::spawn_script_model(self, self.var_2217ae64fad1e, 1, 1);
        /#
            assertex(self.var_7eac685a52c75852 isscriptable(), "PAP Machine Xmodel needs to point to a valid scriptable!");
        #/
        self.var_7eac685a52c75852.var_2fcb35d230365682 = function_8ffd6120b9e72251(self.var_7eac685a52c75852.origin);
        self.var_7eac685a52c75852.var_f18bb191dfec8db9 = createnavobstaclebyent(self.var_7eac685a52c75852);
    }
    if (!function_5e8f96f1bc95aacd()) {
        if (istrue(s_bundle.var_69e6100b657f07a6)) {
            self.var_7eac685a52c75852.interact = namespace_5775ad2badedbcaa::function_90472496b91b94b3(self.var_7eac685a52c75852, self.radius, &function_c1b2d811be564958);
            self.var_7eac685a52c75852.interact namespace_5775ad2badedbcaa::function_9a0883b5a0999dac();
            self.var_7eac685a52c75852.interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_4572d5e97616f34c);
        } else {
            self.var_7eac685a52c75852.interact = namespace_5775ad2badedbcaa::function_90472496b91b94b3(self.var_7eac685a52c75852, self.radius, &function_c1b2d811be564958);
            self.var_7eac685a52c75852.interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_3b2684b76c1ab98e);
        }
        if (self.var_7eac685a52c75852.interact tagexists("tag_hint")) {
            self.var_7eac685a52c75852.interact sethinttag("tag_hint");
        }
        self.var_7eac685a52c75852.interact.s_pap = self;
    }
    if (istrue(self.script_start)) {
        function_59e0fa513ce8100c(1);
    } else {
        disable_pap(1);
        thread function_d0c65b564a1ac22();
    }
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16b1
// Size: 0x7c
function private function_89884a03ad5f622c() {
    if (isdefined(self.var_7eac685a52c75852.var_2fcb35d230365682.var_6c3d26c5e933dcfd)) {
        b_success = self.var_7eac685a52c75852 utility::function_3677f2be30fdd581("region_color", "off");
        waitframe();
        b_success = self.var_7eac685a52c75852 utility::function_3677f2be30fdd581("region_color", self.var_7eac685a52c75852.var_2fcb35d230365682.var_6c3d26c5e933dcfd);
    }
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1734
// Size: 0x3cf
function private function_3b2684b76c1ab98e(usable, player) {
    if (isdefined(player) && istrue(player.interactions_disabled)) {
        return {string:"", type:"HINT_NOICON"};
    }
    w_current = player getcurrentweapon();
    var_29a8ba8c9dd43fd2 = player get_pap_level(w_current);
    if (!player function_251fcd097206e347(w_current)) {
        return {string:level.var_389f96815631487["hintstring_only"].var_546f21bbff45af2f, type:"HINT_NOBUTTON"};
    }
    str_weapon = w_current.displayname;
    var_2fcb35d230365682 = function_8ffd6120b9e72251(usable.origin);
    if (isdefined(var_2fcb35d230365682)) {
        item = namespace_7bf99ef58659a6f1::function_904f24ea774b8f6f(var_2fcb35d230365682.ref, var_29a8ba8c9dd43fd2);
        if (isdefined(item)) {
            cost = item.cost;
            currency = item.currency;
        } else {
            return {string:level.var_389f96815631487["hintstring_only"].var_e532cc181ecbb197, type:"HINT_NOBUTTON"};
        }
    } else {
        return {string:level.var_389f96815631487["hintstring_only"].var_e532cc181ecbb197, type:"HINT_NOBUTTON"};
    }
    switch (var_29a8ba8c9dd43fd2) {
    case 0:
        if (player namespace_7dfc6454a70f3f39::function_bcc79745d547a99c(currency, cost)) {
            return {params:[0:str_weapon, 1:cost], string:level.var_389f96815631487["hintstring_only"].var_f3201c9531e84083, type:"HINT_BUTTON"};
            goto LOC_0000023d;
        }
        return {params:[0:str_weapon, 1:cost], string:level.var_389f96815631487["hintstring_only"].var_40c5fe63017a0028, type:"HINT_BUTTON"};
    case 1:
    LOC_0000023d:
        if (player namespace_7dfc6454a70f3f39::function_bcc79745d547a99c(currency, cost)) {
            return {params:[0:str_weapon, 1:cost], string:level.var_389f96815631487["hintstring_only"].var_f3201d9531e842b6, type:"HINT_BUTTON"};
            goto LOC_000002d9;
        }
        return {params:[0:str_weapon, 1:cost], string:level.var_389f96815631487["hintstring_only"].var_d9a16a76860e6fb5, type:"HINT_BUTTON"};
    case 2:
    LOC_000002d9:
        if (player namespace_7dfc6454a70f3f39::function_bcc79745d547a99c(currency, cost)) {
            return {params:[0:str_weapon, 1:cost], string:level.var_389f96815631487["hintstring_only"].var_f3201e9531e844e9, type:"HINT_BUTTON"};
        } else {
            return {params:[0:str_weapon, 1:cost], string:level.var_389f96815631487["hintstring_only"].var_7a6ad8de7cb26202, type:"HINT_BUTTON"};
        }
        break;
    }
    return {string:level.var_389f96815631487["hintstring_only"].var_e532cc181ecbb197, type:"HINT_NOBUTTON"};
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b0b
// Size: 0x87
function private function_4572d5e97616f34c(usable, player) {
    if (isdefined(player) && isdefined(usable)) {
        if (istrue(player.interactions_disabled)) {
            return {string:"", type:"HINT_NOICON"};
        }
        return {string:"SHARED_HINTSTRINGS/PAP_USE", type:"HINT_BUTTON"};
    }
    return {string:"", type:"HINT_NOICON"};
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b9a
// Size: 0x28
function function_d0c65b564a1ac22() {
    if (isdefined(self.var_14364fdc7626f464)) {
        flag_wait(self.var_14364fdc7626f464);
    }
    thread function_59e0fa513ce8100c();
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bc9
// Size: 0xc8
function disable_pap(b_immediate) {
    if (isdefined(self.var_7eac685a52c75852)) {
        if (function_5e8f96f1bc95aacd()) {
            self.var_7eac685a52c75852 utility::function_3677f2be30fdd581("usable", "off");
            foreach (player in level.players) {
                self.var_7eac685a52c75852 disablescriptableplayeruse(player);
            }
        } else {
            self.var_7eac685a52c75852.interact function_dfb78b3e724ad620(0);
        }
        self.var_cd756b37f6f0e181 = undefined;
        self notify("disable_pap");
    }
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c98
// Size: 0x8c
function function_59e0fa513ce8100c(b_immediate) {
    if (isdefined(self.var_7eac685a52c75852)) {
        self.var_cd756b37f6f0e181 = 1;
        if (istrue(b_immediate)) {
            self.var_7eac685a52c75852 utility::function_3677f2be30fdd581("base", "pap_idle");
            function_450b2eac4388db55();
        } else {
            var_59e5f52828bb5ed = 4.1;
            self.var_7eac685a52c75852 utility::function_3677f2be30fdd581("base", "pap_activate");
            delaythread(var_59e5f52828bb5ed, &function_450b2eac4388db55);
        }
        thread function_5441576d06b2a361();
    }
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1d2b
// Size: 0x7f
function function_666c0ed7301de9f3(e_linkto, str_tag, v_origin_offset, var_ef082039f7c502cc) {
    if (!isdefined(v_origin_offset)) {
        v_origin_offset = (0, 0, 0);
    }
    if (!isdefined(var_ef082039f7c502cc)) {
        var_ef082039f7c502cc = (0, 0, 0);
    }
    if (isent(self)) {
        if (isdefined(str_tag)) {
            self linkto(e_linkto, str_tag, v_origin_offset, var_ef082039f7c502cc);
        } else {
            self linkto(e_linkto);
        }
    } else {
        self scriptablesetparententity(e_linkto, v_origin_offset, var_ef082039f7c502cc);
    }
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db1
// Size: 0x51
function function_a90b4bc92d126cd1(player) {
    if (!isplayer(player)) {
        return 0;
    }
    weapon = player getcurrentweapon();
    if (!isdefined(level.var_74cdac95bea43e20[weapon.var_9d7facbe889e667c]) && !namespace_dc2e59577d3a271f::function_6a22621172a35366(weapon)) {
        return 0;
    }
    return 1;
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e0a
// Size: 0x70
function function_c1b2d811be564958(player) {
    if (!function_a90b4bc92d126cd1(player)) {
        player playsoundtoplayer("ui_zm_core_purchase_deny", player);
        return;
    }
    if (istrue(player.interactions_disabled)) {
        return;
    }
    self.s_pap.var_c80acd5b1945a70f = player;
    player.var_a8b98c96e3cb2086 = self.s_pap;
    player thread function_9662c40edf345173(self.s_pap);
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e81
// Size: 0xa1
function function_450b2eac4388db55() {
    if (function_5e8f96f1bc95aacd()) {
        self.var_7eac685a52c75852 utility::function_3677f2be30fdd581("usable", "on");
        foreach (player in level.players) {
            self.var_7eac685a52c75852 enablescriptableplayeruse(player);
        }
    } else {
        self.var_7eac685a52c75852.interact function_dfb78b3e724ad620(1);
    }
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f29
// Size: 0x22c
function function_7555b4c311cdf27c(channel, var_441c8eadb8f193ab) {
    if (isdefined(var_441c8eadb8f193ab)) {
        var_441c8eadb8f193ab = var_441c8eadb8f193ab - 1;
        if (channel == "pap_weaponupgrade_purchase") {
            var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
            if (!isdefined(var_2fcb35d230365682)) {
                return;
            }
            currentweapon = self getcurrentweapon();
            var_3cf65499b595d11b = get_pap_level(currentweapon);
            item = namespace_7bf99ef58659a6f1::function_904f24ea774b8f6f(var_2fcb35d230365682.ref, var_441c8eadb8f193ab);
            if (!isdefined(item) || var_3cf65499b595d11b != item.tier) {
                self setclientomnvar(var_2fcb35d230365682.var_8b8931f97eef184, 4);
                self setclientomnvar(var_2fcb35d230365682.var_fd0ea8a834fa0398, gettime());
                return;
            }
            if (!istrue(function_6cea50c31fdfd0b9(var_441c8eadb8f193ab))) {
                self setclientomnvar(var_2fcb35d230365682.var_8b8931f97eef184, 3);
                self setclientomnvar(var_2fcb35d230365682.var_fd0ea8a834fa0398, gettime());
                return;
            }
            if (function_251fcd097206e347(currentweapon)) {
                function_ac4575f20a9ea183(self.var_a8b98c96e3cb2086, var_3cf65499b595d11b, currentweapon, item);
            }
        } else if (channel == "pap_ammomod_purchase") {
            var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
            if (!isdefined(var_2fcb35d230365682)) {
                return;
            }
            currentweapon = self getcurrentweapon();
            var_c8f3faec06777d2c = function_d4897d4fc2a76e56(currentweapon);
            item = namespace_7bf99ef58659a6f1::function_904f24ea774b8f6f(var_2fcb35d230365682.ref, var_441c8eadb8f193ab);
            if (!isdefined(item) || var_c8f3faec06777d2c == item.var_cb325ddb4a764623) {
                self setclientomnvar(var_2fcb35d230365682.var_8b8931f97eef184, 4);
                self setclientomnvar(var_2fcb35d230365682.var_fd0ea8a834fa0398, gettime());
                return;
            }
            if (!istrue(function_6cea50c31fdfd0b9(var_441c8eadb8f193ab))) {
                self setclientomnvar(var_2fcb35d230365682.var_8b8931f97eef184, 3);
                self setclientomnvar(var_2fcb35d230365682.var_fd0ea8a834fa0398, gettime());
                return;
            }
            if (namespace_dc2e59577d3a271f::function_6a22621172a35366(currentweapon)) {
                function_29fecb7dd1dd0df2(self.var_a8b98c96e3cb2086, currentweapon, item);
            }
        } else if (namespace_7bf99ef58659a6f1::function_5c9b6f1c3c67dd97(#"pap", channel)) {
            self.var_5070f05815274d88 = 1;
        }
    }
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x215c
// Size: 0x34
function function_54241c8e78e3cd50(weapon) {
    if (!isplayer(self)) {
        return int(0);
    }
    if (namespace_dc2e59577d3a271f::has_ammo_mod(weapon)) {
        return namespace_dc2e59577d3a271f::function_10839073a33f4feb(weapon);
    }
    return int(0);
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2198
// Size: 0x32
function function_d4897d4fc2a76e56(weapon) {
    if (!isplayer(self)) {
        return "";
    }
    if (namespace_dc2e59577d3a271f::has_ammo_mod(weapon)) {
        return namespace_dc2e59577d3a271f::get_ammo_mod_name(weapon);
    }
    return "";
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21d2
// Size: 0xa8
function get_pap_level(weapon) {
    if (!isplayer(self) || !isdefined(self.var_7a6ac8a30c8eef4c) || !isdefined(weapon)) {
        return int(0);
    }
    weapon = weapon getnoaltweapon();
    foreach (var_ce82d09b52c5f237 in self.var_7a6ac8a30c8eef4c) {
        if (weapon == var_ce82d09b52c5f237.weapon) {
            return var_ce82d09b52c5f237.n_level;
        }
    }
    return int(0);
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2282
// Size: 0x13
function private function_9978ad7acc70bbd0(params) {
    function_2f370e45d49b5a9d();
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x229c
// Size: 0x3a
function private function_2f370e45d49b5a9d(weapon) {
    weapon = function_53c4c53197386572(weapon, self getcurrentweapon());
    var_29a8ba8c9dd43fd2 = get_pap_level(weapon);
    self setclientomnvar("ui_pap_current_level", var_29a8ba8c9dd43fd2);
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22dd
// Size: 0x131
function function_29fecb7dd1dd0df2(s_pap, currentweapon, item) {
    s_pap.var_7eac685a52c75852 utility::function_3677f2be30fdd581("base", "pap_activate");
    self playsoundtoplayer("ui_zm_core_purchase_success", self);
    var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
    cost = 0;
    currency = "essence";
    if (isdefined(item)) {
        cost = item.cost;
        currency = item.currency;
    }
    if (isdefined(level.var_cfd619492cf55b20)) {
        cost = [[ level.var_cfd619492cf55b20 ]]();
    }
    namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(currentweapon, item.var_cb325ddb4a764623);
    self setclientomnvar("ui_pap_current_ammomod", item.itemid);
    namespace_7dfc6454a70f3f39::function_301addb53c1df990(currency, cost, 1, undefined, #"ammomod", item.var_cb325ddb4a764623);
    self setclientomnvar(var_2fcb35d230365682.var_8b8931f97eef184, 1);
    self setclientomnvar(var_2fcb35d230365682.var_fd0ea8a834fa0398, gettime());
    level notify("pap_machine_activated");
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2415
// Size: 0x10c
function function_2756cd1449650568(weapon, n_level) {
    var_f4d601b2527b35cf = 0;
    weapon = weapon getnoaltweapon();
    foreach (i, var_ce82d09b52c5f237 in self.var_7a6ac8a30c8eef4c) {
        if (var_ce82d09b52c5f237.weapon == weapon) {
            var_f4d601b2527b35cf = 1;
            var_ce82d09b52c5f237.n_level = n_level;
            if (!isdefined(n_level)) {
                self.var_7a6ac8a30c8eef4c[i] = undefined;
                self.var_7a6ac8a30c8eef4c = array_remove_index(self.var_7a6ac8a30c8eef4c, i);
            }
        }
    }
    if (!var_f4d601b2527b35cf && isdefined(n_level)) {
        var_ce82d09b52c5f237 = spawnstruct();
        var_ce82d09b52c5f237.weapon = weapon;
        var_ce82d09b52c5f237.n_level = n_level;
        self.var_7a6ac8a30c8eef4c = array_add(self.var_7a6ac8a30c8eef4c, var_ce82d09b52c5f237);
    }
    function_2f370e45d49b5a9d(weapon);
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2528
// Size: 0x1cc
function function_9662c40edf345173(s_pap) {
    self endon("death_or_disconnect");
    self endon("end_open_pap_menu");
    var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
    var_57c182cc0f81b65b = function_127acf3af63de42e().var_69e6100b657f07a6;
    if (istrue(var_57c182cc0f81b65b)) {
        /#
            iprintlnbold(self.name + "<unknown string>" + s_pap.name + "<unknown string>");
        #/
        w_current = self getcurrentweapon();
        var_3cf65499b595d11b = get_pap_level(w_current);
        var_f8dabd5cffe4bfa2 = function_54241c8e78e3cd50(w_current);
        var_28b67a6edc18367e = var_2fcb35d230365682.ref;
        var_bf1eb50af72af = function_53c4c53197386572(var_2fcb35d230365682.id, -1);
        self setclientomnvar("ui_pap_current_level", var_3cf65499b595d11b);
        self setclientomnvar("ui_pap_current_ammomod", var_f8dabd5cffe4bfa2);
        self setclientomnvar("ui_purchasemenu_id", var_bf1eb50af72af);
        self setclientomnvar(var_2fcb35d230365682.var_c7ffb2549ca8ab4b, gettime());
        function_997e20f4d9f30586(1);
        thread function_e1fa842581ec1de5(s_pap);
    } else {
        currentweapon = self getcurrentweapon();
        var_3cf65499b595d11b = get_pap_level(currentweapon);
        var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
        item = namespace_7bf99ef58659a6f1::function_904f24ea774b8f6f(var_2fcb35d230365682.ref, var_3cf65499b595d11b);
        if (!isdefined(item)) {
            return;
        }
        if (!function_6cea50c31fdfd0b9(var_3cf65499b595d11b) || self ismeleeing()) {
            self playsoundtoplayer("ui_zm_core_purchase_deny", self);
            return;
        }
        if (function_251fcd097206e347(currentweapon)) {
            function_ac4575f20a9ea183(self.var_a8b98c96e3cb2086, var_3cf65499b595d11b, currentweapon, item);
        }
    }
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26fb
// Size: 0x1d8
function function_ac4575f20a9ea183(s_pap, var_5476695cf42091ed, currentweapon, item) {
    var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
    var_ab757fcef92af3cb = var_5476695cf42091ed + 1;
    b_success = s_pap.var_7eac685a52c75852 utility::function_3677f2be30fdd581("base", "pap_activate_" + var_ab757fcef92af3cb);
    if (b_success) {
        s_pap thread function_95cc8bee3147df44("pap_activate_" + var_ab757fcef92af3cb);
    } else {
        s_pap.var_7eac685a52c75852 utility::function_3677f2be30fdd581("base", "pap_activate");
        s_pap thread function_95cc8bee3147df44("pap_activate");
    }
    if (isdefined(level.var_f932763b261a721f)) {
        if (![[ level.var_f932763b261a721f ]](self)) {
            self playsoundtoplayer("ui_zm_core_purchase_success", self);
        }
    } else {
        self playsoundtoplayer("ui_zm_core_purchase_success", self);
    }
    cost = 0;
    currency = "essence";
    if (isdefined(item)) {
        cost = item.cost;
        currency = item.currency;
    }
    if (isdefined(level.var_cfd619492cf55b20)) {
        cost = [[ level.var_cfd619492cf55b20 ]]();
    }
    pap_weapon(currentweapon, var_5476695cf42091ed, cost);
    namespace_7dfc6454a70f3f39::function_301addb53c1df990(currency, cost, 1, undefined, #"packapunch");
    params = {var_29a8ba8c9dd43fd2:var_5476695cf42091ed + 1, cost:cost, weapon:currentweapon};
    callback::callback("on_pap_machine_purchase", params);
    self setclientomnvar(var_2fcb35d230365682.var_8b8931f97eef184, 1);
    self setclientomnvar(var_2fcb35d230365682.var_fd0ea8a834fa0398, gettime());
    level notify("pap_machine_activated");
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28da
// Size: 0x3f
function function_95cc8bee3147df44(var_b806709d552b38f7) {
    self.var_7eac685a52c75852 endon("death");
    while (self.var_7eac685a52c75852 utility::function_35c178c80fa19cbd("base", var_b806709d552b38f7)) {
        waitframe();
    }
    thread function_89884a03ad5f622c();
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2920
// Size: 0xd4
function get_pap_camo(currentweapon, var_edb83b75350cc305) {
    var_79073cc80d139243 = undefined;
    var_cdc27fec07c02e7d = currentweapon.basename;
    var_57383025a4257b70 = var_edb83b75350cc305 - 1;
    if (isarray(level.var_87233c2c2faa12cb) && array_contains(level.var_87233c2c2faa12cb, var_cdc27fec07c02e7d)) {
        var_79073cc80d139243 = undefined;
    } else if (isarray(level.var_3e7cdbf4c20a7f90) && isdefined(level.var_3e7cdbf4c20a7f90[var_57383025a4257b70]) && var_57383025a4257b70 < level.var_3e7cdbf4c20a7f90.size) {
        var_79073cc80d139243 = level.var_3e7cdbf4c20a7f90[var_57383025a4257b70].camo;
    }
    if (!isdefined(var_79073cc80d139243) || istrue(self.var_f7d4ae1ceae3077d)) {
        return getweaponcamoname(currentweapon);
    }
    return var_79073cc80d139243;
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29fc
// Size: 0x238
function function_5441576d06b2a361() {
    if (!isdefined(self.var_7eac685a52c75852)) {
        return;
    }
    self endon("disable_pap");
    self.var_7eac685a52c75852 endon("death");
    var_be315f6c9827b6da = 48;
    while (1) {
        throttle::function_f632348cbb773537(level.var_41b1ceff53cc7e4d, self);
        var_727b1c6120940fca = function_143526130b12b2b6(self.origin, var_be315f6c9827b6da);
        if (var_727b1c6120940fca.size == 0) {
            throttle::function_f632348cbb773537(level.var_41b1ceff53cc7e4d, self);
            continue;
        }
        a_players = [];
        foreach (ent in var_727b1c6120940fca) {
            if (isplayer(ent) && isalive(ent)) {
                a_players[a_players.size] = ent;
            }
        }
        var_8ead1b5013893ee7 = 0;
        foreach (player in a_players) {
            if (player ismeleeing() && !istrue(player.var_69103c55b4319619) && namespace_3c37cb17ade254d::within_fov(player.origin, player.angles, self.origin, cos(70))) {
                player thread function_b8b51ba0ac848253();
                if (istrue(player.var_f7d4ae1ceae3077d)) {
                    player.var_f7d4ae1ceae3077d = undefined;
                    /#
                        iprintlnbold("<unknown string>" + player.name);
                    #/
                } else {
                    player.var_f7d4ae1ceae3077d = 1;
                    /#
                        iprintlnbold("<unknown string>" + player.name);
                    #/
                }
                var_8ead1b5013893ee7 = 1;
            }
        }
        if (var_8ead1b5013893ee7) {
            self.var_7eac685a52c75852 utility::function_3677f2be30fdd581("base", "pap_static");
            wait(0.5);
            self.var_7eac685a52c75852 utility::function_3677f2be30fdd581("base", "pap_activate");
        }
    }
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c3b
// Size: 0x22
function function_b8b51ba0ac848253() {
    self endon("disconnect");
    self.var_69103c55b4319619 = 1;
    wait(3);
    self.var_69103c55b4319619 = undefined;
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c64
// Size: 0x27d
function pap_weapon(currentweapon, var_5476695cf42091ed, cost, var_4d10547837384577) {
    var_1de7c3eef64bb0bb = var_5476695cf42091ed + 1;
    w_take = currentweapon getnoaltweapon();
    w_new = function_a0537467c5341047(w_take, var_1de7c3eef64bb0bb);
    var_7d014f270bcc9853 = undefined;
    if (w_take != currentweapon) {
        var_7d014f270bcc9853 = w_new getaltweapon();
    }
    var_3a56a10345d2e89a = w_new.var_9d7facbe889e667c;
    if (isdefined(self.var_2e04133215e83a48[var_3a56a10345d2e89a])) {
        self.var_2e04133215e83a48[var_3a56a10345d2e89a].weaponobj = w_new;
    }
    if (var_5476695cf42091ed == 0 || istrue(var_4d10547837384577)) {
        if (!isdefined(self.var_c37e65eb7cc773eb)) {
            self.var_c37e65eb7cc773eb = [];
        }
        self.var_c37e65eb7cc773eb[var_3a56a10345d2e89a] = w_take.camo;
    }
    level notify("pap_used", self);
    var_97a72f931ea6d96b = 0;
    if (getdvarint(@"hash_c4ccc540649a56f0", 0) && istrue(w_take.hasalternate)) {
        var_75a36fc4b9ce8086 = w_take getaltweapon();
        var_97a72f931ea6d96b = self getweaponammoclip(var_75a36fc4b9ce8086);
    }
    params = spawnstruct();
    params.w_new = w_new;
    params.w_take = w_take;
    params.var_7d014f270bcc9853 = var_7d014f270bcc9853;
    params.var_29a8ba8c9dd43fd2 = var_5476695cf42091ed + 1;
    params.cost = cost;
    callback::callback("zm_packed_weapon", params);
    self takeweapon(w_take);
    self giveweapon(w_new);
    self switchtoweapon(function_53c4c53197386572(var_7d014f270bcc9853, w_new));
    self givemaxammo(w_new);
    if (getdvarint(@"hash_c4ccc540649a56f0", 0) && istrue(w_new.hasalternate)) {
        var_941519edf56b651d = w_new getaltweapon();
        if (isdefined(var_941519edf56b651d.underbarrel) && var_941519edf56b651d.underbarrel == "jup_ub_flame_01") {
            if (isdefined(var_941519edf56b651d.underbarrel) && var_941519edf56b651d.underbarrel == "jup_ub_flame_01") {
                self setweaponammoclip(var_941519edf56b651d, var_97a72f931ea6d96b);
            }
        }
    }
    function_2756cd1449650568(w_new, var_1de7c3eef64bb0bb);
    self notify("weapon_level_changed");
    self setclientomnvar("ui_pap_current_level", var_1de7c3eef64bb0bb);
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee8
// Size: 0x1a5
function function_a0537467c5341047(currentweapon, var_5476695cf42091ed) {
    var_362a3a0a1e485bf6 = function_d4897d4fc2a76e56(currentweapon);
    camo = get_pap_camo(currentweapon, var_5476695cf42091ed);
    reticle = getweaponreticlename(currentweapon);
    if (issubstr(reticle, "scope")) {
        reticle = int(function_95c6391212a25f7c(reticle, "scope"));
        if (reticle == 0) {
            reticle = undefined;
        }
    } else if (!isdefined(namespace_e0ee43ef2dddadaa::getreticleindex(reticle))) {
        reticle = undefined;
    }
    variantid = getweaponvariantindex(currentweapon);
    stickers = [0:currentweapon.stickerslot0, 1:currentweapon.stickerslot1, 2:currentweapon.stickerslot2, 3:currentweapon.stickerslot3, 4:function_53c4c53197386572(currentweapon.var_b39ac546cc8621f8, "none")];
    var_dfaf5dd7fb4c5238 = currentweapon.attachments;
    var_261e95dabfb8d55f = currentweapon.attachmentvarindices;
    var_c0173c6249a46538 = function_5672811f81d28777(currentweapon, var_dfaf5dd7fb4c5238, var_261e95dabfb8d55f, var_5476695cf42091ed);
    var_e27c23a69f06105a = var_c0173c6249a46538[1];
    var_503110dc18b08ab9 = var_c0173c6249a46538[0];
    w_new = namespace_e0ee43ef2dddadaa::buildweapon(currentweapon.basename, var_503110dc18b08ab9, camo, reticle, variantid, var_e27c23a69f06105a, undefined, stickers);
    if (isdefined(var_362a3a0a1e485bf6) && var_362a3a0a1e485bf6 != "") {
        namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(w_new, var_362a3a0a1e485bf6);
    }
    return w_new;
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3095
// Size: 0x128
function function_5672811f81d28777(weapon, attachments, var_f3464d71f01f614e, var_2e336d84d7ede14a) {
    str_weapon_name = weapon.var_9d7facbe889e667c;
    if (isdefined(level.var_96c4059aa2eabfb8) && isdefined(level.var_96c4059aa2eabfb8[str_weapon_name])) {
        var_be53b174c615d624 = level.var_96c4059aa2eabfb8[str_weapon_name].var_60cd7d2641a6671b;
        var_c2d75e1eaa5db67a = level.var_96c4059aa2eabfb8[str_weapon_name].var_9e1e9ec0fd561685;
        /#
            assertex(isdefined(var_be53b174c615d624) && isdefined(var_c2d75e1eaa5db67a), "Define a Base and PAP attachment for the weaponmetadata asset for this mode");
        #/
        if (!array_contains(attachments, var_c2d75e1eaa5db67a) && weapon canuseattachment(var_c2d75e1eaa5db67a)) {
            attachments = array_remove(attachments, var_be53b174c615d624);
            attachments = array_add(attachments, var_c2d75e1eaa5db67a);
            var_f3464d71f01f614e[var_c2d75e1eaa5db67a] = 0;
        }
        if (var_2e336d84d7ede14a > 1) {
            var_c6813356cbede5a1 = var_c2d75e1eaa5db67a + var_2e336d84d7ede14a;
            if (weapon canuseattachment(var_c6813356cbede5a1)) {
                attachments = array_remove(attachments, var_c2d75e1eaa5db67a);
                attachments = array_add(attachments, var_c6813356cbede5a1);
                var_f3464d71f01f614e[var_c6813356cbede5a1] = 0;
            }
        }
    }
    return [0:attachments, 1:var_f3464d71f01f614e];
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31c5
// Size: 0x205
function function_8a514af6a4020(weapon) {
    new_weapon = undefined;
    if (isdefined(level.var_96c4059aa2eabfb8) && isdefined(weapon.var_9d7facbe889e667c) && isdefined(level.var_96c4059aa2eabfb8[weapon.var_9d7facbe889e667c]) && isdefined(level.var_96c4059aa2eabfb8[weapon.var_9d7facbe889e667c].var_9e1e9ec0fd561685)) {
        var_60616b825c1aaaec = level.var_96c4059aa2eabfb8[weapon.var_9d7facbe889e667c].var_9e1e9ec0fd561685;
        if (weapon hasattachment(var_60616b825c1aaaec)) {
            new_weapon = weapon withoutattachment(var_60616b825c1aaaec);
        }
    }
    if (isdefined(level.var_3e7cdbf4c20a7f90) && isdefined(weapon.camo) && weapon.camo != "none") {
        foreach (var_a5404513129c0ee0 in level.var_3e7cdbf4c20a7f90) {
            if (weapon.camo == var_a5404513129c0ee0.camo) {
                if (isdefined(new_weapon)) {
                    new_weapon = new_weapon withoutcamo();
                } else {
                    new_weapon = weapon withoutcamo();
                }
                break;
            }
        }
    }
    if (isdefined(self.var_c37e65eb7cc773eb)) {
        var_2912941440454da4 = self.var_c37e65eb7cc773eb[weapon.var_9d7facbe889e667c];
        if (isdefined(var_2912941440454da4)) {
            if (isdefined(new_weapon)) {
                new_weapon = new_weapon withcamo(var_2912941440454da4);
            } else {
                new_weapon = weapon withcamo(var_2912941440454da4);
            }
            self.var_c37e65eb7cc773eb[weapon.var_9d7facbe889e667c] = undefined;
        }
    }
    if (isdefined(new_weapon)) {
        self takeweapon(weapon);
        self giveweapon(new_weapon);
        self switchtoweapon(new_weapon);
        function_2756cd1449650568(new_weapon, undefined);
        self notify("weapon_level_changed");
        self setclientomnvar("ui_pap_current_level", 0);
    }
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33d1
// Size: 0x51
function function_251fcd097206e347(weapon) {
    if (!isdefined(weapon)) {
        weapon = self getcurrentweapon();
    }
    if (!isdefined(level.var_74cdac95bea43e20[weapon.var_9d7facbe889e667c])) {
        return 0;
    }
    var_3cf65499b595d11b = get_pap_level(weapon);
    if (var_3cf65499b595d11b < 3) {
        return 1;
    }
    return 0;
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x342a
// Size: 0x86
function function_6cea50c31fdfd0b9(var_441c8eadb8f193ab) {
    var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
    item = namespace_7bf99ef58659a6f1::function_904f24ea774b8f6f(var_2fcb35d230365682.ref, var_441c8eadb8f193ab);
    cost = 0;
    currency = "essence";
    if (isdefined(item)) {
        cost = item.cost;
        currency = item.currency;
    }
    return namespace_7dfc6454a70f3f39::function_bcc79745d547a99c(currency, cost);
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34b8
// Size: 0x1b3
function function_e1fa842581ec1de5(s_pap) {
    self notify("opened_pap_menu");
    self endon("opened_pap_menu");
    self endon("disconnect");
    var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
    machine = s_pap.var_7eac685a52c75852;
    wait(0.75);
    var_cad20162f5a22ba4 = distance2d(machine.origin, self.origin);
    v_start = self.origin;
    var_85e549a4bd66c511 = utility::function_2e9e02e8bda61ef2();
    var_a8b5d0f96d82b5b3 = utility::function_2e9e02e8bda61ef2();
    var_4e92a6b7c0ecead5 = isdefined(var_85e549a4bd66c511) && isdefined(var_a8b5d0f96d82b5b3);
    while (isdefined(machine) && isalive(self) && !istrue(self.inlaststand) && !istrue(namespace_e0ee43ef2dddadaa::iskillstreakweapon(self getcurrentweapon()))) {
        if (!isdefined(machine) || self stancebuttonpressed()) {
            break;
        }
        if (!var_4e92a6b7c0ecead5) {
            if (!(distance2d(machine.origin, self.origin) <= var_cad20162f5a22ba4 || distance2d(self.origin, machine.origin) < 64)) {
                break;
            }
        }
        if (istrue(self.var_5070f05815274d88)) {
            break;
        }
        waitframe();
    }
    if (isdefined(self)) {
        self.var_5070f05815274d88 = undefined;
        self setclientomnvar(var_2fcb35d230365682.var_8b8931f97eef184, 2);
        self setclientomnvar(var_2fcb35d230365682.var_fd0ea8a834fa0398, gettime());
        function_997e20f4d9f30586(0);
        self.var_a8b98c96e3cb2086 = undefined;
        self notify("end_open_pap_menu");
    }
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3672
// Size: 0xaf
function private function_997e20f4d9f30586(var_87026d0546b5bf78) {
    if (var_87026d0546b5bf78) {
        val::set("using_pap", "melee", 0);
        val::set("using_pap", "killstreaks", 0);
        val::set("using_pap", "crate_use", 0);
        val::set("using_pap", "equipment_primary", 0);
        val::set("using_pap", "equipment_secondary", 0);
        val::set("using_pap", "offhand_weapons", 0);
        val::set("using_pap", "offhand_throwback", 0);
        val::set("using_pap", "weapon_switch", 0);
    } else {
        val::function_c9d0b43701bdba00("using_pap");
    }
}

// Namespace pack_a_punch/namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3728
// Size: 0x32f
function private function_48d69eea9b7ed244() {
    /#
        var_39239d1f90650b = (0, 0, 4);
        var_e33953429ed350f = 0.25;
        while (1) {
            foreach (s_pap in level.var_28967913115d1fa3) {
                if (!isdefined(s_pap.var_7eac685a52c75852)) {
                    continue;
                }
                if (!isdefined(s_pap.s_destination)) {
                    if (isdefined(s_pap.str_destination)) {
                        s_pap.s_destination = getstruct(s_pap.str_destination, "<unknown string>");
                    } else {
                        s_pap.str_destination = s_pap.name;
                        s_pap.s_destination = s_pap;
                    }
                }
                v_position = s_pap.var_7eac685a52c75852.origin;
                line(v_position, s_pap.s_destination.origin, (0, 1, 0));
                draw_circle(v_position, 100, (0, 0, 1), 1, 0, 1);
                print3d(s_pap.s_destination.origin, "<unknown string>" + s_pap.str_destination, (0, 1, 0), 1, 0.25);
                print3d(v_position - var_39239d1f90650b * 1, "<unknown string>" + s_pap.name, (0, 1, 0), 1, 0.25);
                print3d(v_position - var_39239d1f90650b * 2, "<unknown string>" + function_53c4c53197386572(s_pap.var_14364fdc7626f464, "<unknown string>"), (0, 1, 0), 1, 0.25);
                print3d(v_position - var_39239d1f90650b * 3, "<unknown string>" + ter_op(istrue(s_pap.var_cd756b37f6f0e181), "<unknown string>", "<unknown string>"), (0, 1, 0), 1, 0.25);
                print3d(v_position - var_39239d1f90650b * 4, "<unknown string>" + s_pap.str_destination, (0, 1, 0), 1, 0.25);
                foreach (player in level.players) {
                    if (isdefined(player.var_a8b98c96e3cb2086)) {
                        print3d(player.origin, player.name + "<unknown string>" + player.var_a8b98c96e3cb2086.name, (0, 1, 0), 1, 0.25);
                    }
                }
            }
            waitframe();
        }
    #/
}
