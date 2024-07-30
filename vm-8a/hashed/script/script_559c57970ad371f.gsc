#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_65f58f3c394dcf9a;

#namespace namespace_aed319c762c2b87c;

/#

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 3, eflags: 0x4
    // Checksum 0x0, Offset: 0x80
    // Size: 0x57
    function private function_17495f409b110fff(text, total_length, pad_before) {
        pad_before = default_to(pad_before, 0);
        while (isstring(text) && text.size < total_length) {
            if (pad_before) {
                text = "<dev string:x1c>" + text;
                continue;
            }
            text += "<dev string:x1c>";
        }
        return text;
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xdf
    // Size: 0x5b
    function function_23e1b955d1a7c9a1(text) {
        if (isarray(text)) {
            return text;
        }
        if (isnumber(text)) {
            return ["<dev string:x1e>" + text];
        }
        if (isstring(text)) {
            if (issubstr(text, "<dev string:x1f>")) {
                return strtok(text, "<dev string:x1f>");
            }
            return [text];
        }
        return [];
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x142
    // Size: 0x146
    function private function_f034cfbc42d3956f(state) {
        state = default_to(state, "<dev string:x1e>");
        color = undefined;
        assertex(isstring(state), "<dev string:x21>");
        switch (state) {
        case #"hash_d2a4c56b6b9ff274":
        default: 
            color = (randomfloatrange(0.5, 1), randomfloatrange(0.5, 1), randomfloatrange(0.5, 1));
            break;
        case #"hash_1c39674e5b0de0f3":
        case #"hash_4d6a329017fe1bd0":
        case #"hash_9128327eb51e0b7b":
        case #"hash_c6076a90d1a76064": 
            color = (0.5, 1, 0.5);
            break;
        case #"hash_186d745a92c317d9":
        case #"hash_21c69ec47c409a66": 
            color = (1, 1, 0.333);
            break;
        case #"hash_2d1406e602f0875d":
        case #"hash_9e02cd4a0f3ca981": 
            color = (1, 0.5, 0.5);
            break;
        case #"hash_cf14c509efeb3c87": 
            color = (0.2, 0.2, 0.2);
            break;
        }
        return color;
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x290
    // Size: 0x10e
    function private function_6c0578d086f3d6b9(ent) {
        assertex(isent(ent), "<dev string:x8e>");
        var_592693dd118f7c52 = getdvarint(@"hash_f86fbee6ae5321ec", "<dev string:xb2>");
        if (istrue(var_592693dd118f7c52)) {
            var_e52f572dfadb149f = undefined;
            var_e23b09de2e27ed9 = undefined;
            if (isstruct(ent.bossinstance)) {
                var_e52f572dfadb149f = ent.bossinstance.var_56524c0776d62d8c;
                var_e23b09de2e27ed9 = ent.bossinstance.var_1910de7604c2d4a0;
            }
            return namespace_b1b96b070bb1349c::function_2d29365e60139df1(ent, var_e52f572dfadb149f, var_e23b09de2e27ed9);
        }
        if (isagent(ent) && isstring(ent.alertlevel)) {
            return ent.alertlevel;
        } else if (ent.classname == "<dev string:xb4>" && isstring(ent.currentstate)) {
            return ent.currentstate;
        }
        return "<dev string:x4f>";
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x3a6
    // Size: 0x61
    function private function_806b0eaacf7b76e9(bossinstance) {
        assertex(isstruct(bossinstance), "<dev string:xc3>");
        if (istrue(bossinstance.killed)) {
            return "<dev string:x89>";
        } else if (isdefined(bossinstance.boss)) {
            return function_6c0578d086f3d6b9(bossinstance.boss);
        }
        return "<dev string:x4f>";
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 5, eflags: 0x4
    // Checksum 0x0, Offset: 0x40f
    // Size: 0xb3
    function private function_6d8e5c7e9ef61fc2(x, y, text, color, scale) {
        color = default_to(color, (1, 1, 1));
        scale = default_to(scale, 1);
        text = function_23e1b955d1a7c9a1(text);
        yy = y;
        if (isarray(text)) {
            for (i = 0; i < text.size; i++) {
                yy = y + 16 * scale * i;
                text_line = text[i];
                printtoscreen2d(x, yy, text_line, color, scale, 1);
            }
        }
        return yy;
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x4ca
    // Size: 0xce
    function function_16b7675a3ef3d04f(origin, text, color, scale) {
        if (!isvector(origin)) {
            return;
        }
        color = default_to(color, (1, 1, 1));
        scale = default_to(scale, 1);
        text = function_23e1b955d1a7c9a1(text);
        if (isarray(text)) {
            for (i = 0; i < text.size; i++) {
                ii = text.size - 1 - i;
                text_origin = origin + (0, 0, 14 * scale * ii);
                text_line = text[i];
                print3d(text_origin, text_line, color, 1, scale, 1, 1);
            }
        }
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x5a0
    // Size: 0x91
    function function_d9799cc056122ed7(boss, name, state) {
        name = function_17495f409b110fff(default_to(name, "<dev string:x4f>"), 12, 1);
        health = function_17495f409b110fff(boss.health + "<dev string:xfa>", 10, 1);
        state = function_17495f409b110fff(default_to(state, "<dev string:x4f>"), 10, 0);
        text = name + "<dev string:xfe>" + health + "<dev string:x1c>" + state;
        return text;
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0x639
    // Size: 0x81
    function function_17d9f3785bf1042(x, y, text, color, scale, index) {
        scale = 1.25;
        index = default_to(index, 0);
        font_height = 16 * scale;
        xx = x;
        yy = y + font_height * index;
        function_6d8e5c7e9ef61fc2(xx, yy, text, color, scale);
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x6c2
    // Size: 0x1fa
    function function_ebd5555b105d2c99(bossdetails, bossinstance, x, y, index) {
        x = int(default_to(x, 360));
        y = int(default_to(y, 40));
        index = int(default_to(index, 0));
        if (isdefined(bossinstance) && isdefined(bossinstance.boss)) {
            boss = bossinstance.boss;
            state = function_806b0eaacf7b76e9(bossinstance);
            text = function_d9799cc056122ed7(boss, bossdetails.name, state);
            color = function_f034cfbc42d3956f(state);
            function_17d9f3785bf1042(x, y, text, color, 1, index);
            index += 1;
            if (isdefined(bossinstance.wheelson)) {
                wheelson = bossinstance.wheelson;
                state = function_6c0578d086f3d6b9(wheelson);
                text = function_d9799cc056122ed7(wheelson, "<dev string:x101>", state);
                color = function_f034cfbc42d3956f(state);
                function_17d9f3785bf1042(x, y, text, color, 1, index);
                index += 1;
            }
            if (isarray(boss.minions)) {
                foreach (minion in boss.minions) {
                    state = function_6c0578d086f3d6b9(minion);
                    text = function_d9799cc056122ed7(minion, minion.name, state);
                    color = function_f034cfbc42d3956f(state);
                    function_17d9f3785bf1042(x, y, text, color, 1, index);
                    index += 1;
                }
            }
        }
        return index;
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x8c4
    // Size: 0x73
    function function_d974aec0560c2d96(boss, name, state) {
        health = boss.health + "<dev string:xfa>";
        name = default_to(name, "<dev string:x4f>");
        state = default_to(state, "<dev string:x4f>");
        text = [name, health, state];
        return text;
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x93f
    // Size: 0xf0
    function function_d75ea89dee2f86f4(origin, text, color, height, radius) {
        if (!isvector(origin)) {
            return;
        }
        color = default_to(color, (0.5, 1, 0.5));
        height = default_to(height, 72);
        radius = default_to(radius, 24);
        cylinder_end = origin + (0, 0, 6);
        origin_hi = origin + (0, 0, height);
        var_273d881b2c3e0e0f = origin + (0, 0, height + 16);
        var_273d871b2c3e0bdc = origin + (0, 0, height + 32);
        cylinder(origin, cylinder_end, radius, color, 0, 1);
        line(origin, origin_hi, color, 1, 0, 1);
        function_16b7675a3ef3d04f(origin_hi, text, color, 1);
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0xa37
    // Size: 0xda
    function function_520b0777b699630b(origin, angles, text, color, radius, var_e9136a3ae00f9e47) {
        if (!isvector(origin)) {
            return;
        }
        color = default_to(color, (0.5, 1, 0.5));
        origin_hi = origin + (0, 0, 36);
        origin_body = origin + (0, 0, -60);
        radius = default_to(radius, 360);
        var_e9136a3ae00f9e47 = default_to(var_e9136a3ae00f9e47, (320, 80, 80));
        cylinder(origin, origin_hi, radius, color, 0, 1);
        orientedbox(origin_body, var_e9136a3ae00f9e47, angles, color, 0, 1);
        function_16b7675a3ef3d04f(origin_hi, text, color, 4);
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0xb19
    // Size: 0xe3
    function function_c9ef0d1abb4b9396(origin, angles, text, color, var_e9136a3ae00f9e47) {
        if (!isvector(origin)) {
            return;
        }
        var_e9136a3ae00f9e47 = default_to(var_e9136a3ae00f9e47, (192, 80, 80));
        color = default_to(color, (0.5, 1, 0.5));
        origin += (0, 0, -24);
        origin_hi = origin + (0, 0, 96);
        origin_body = origin + (0, 0, var_e9136a3ae00f9e47[2] * 0.5);
        orientedbox(origin_body, var_e9136a3ae00f9e47, angles, color, 0, 1);
        line(origin, origin_hi, color, 1, 0, 1);
        function_16b7675a3ef3d04f(origin_hi, text, color, 1);
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0xc04
    // Size: 0xe3
    function function_6cec87bd99735fe5(origin, angles, text, color, var_e9136a3ae00f9e47) {
        if (!isvector(origin)) {
            return;
        }
        var_e9136a3ae00f9e47 = default_to(var_e9136a3ae00f9e47, (64, 40, 26));
        color = default_to(color, (0.5, 1, 0.5));
        origin += (0, 0, 3);
        origin_hi = origin + (0, 0, 54);
        origin_body = origin + (0, 0, var_e9136a3ae00f9e47[2] * 0.5);
        orientedbox(origin_body, var_e9136a3ae00f9e47, angles, color, 0, 1);
        line(origin, origin_hi, color, 1, 0, 1);
        function_16b7675a3ef3d04f(origin_hi, text, color, 1);
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xcef
    // Size: 0x3b6
    function function_ebd16f5b10596ff0(bossdetails, bossinstance) {
        if (isdefined(bossinstance) && isdefined(bossinstance.boss)) {
            boss = bossinstance.boss;
            state = function_806b0eaacf7b76e9(bossinstance);
            if (isagent(boss)) {
                health = boss.health + "<dev string:xfa>";
                name = default_to(bossdetails.name, "<dev string:x4f>");
                text = function_d974aec0560c2d96(boss, bossdetails.name, state);
                color = function_f034cfbc42d3956f(state);
                function_d75ea89dee2f86f4(boss.origin, text, color);
            } else if (boss.classname == "<dev string:xb4>") {
                if (bossdetails.name == "<dev string:x10a>") {
                    health = boss.health + "<dev string:xfa>";
                    name = default_to(bossdetails.name, "<dev string:x4f>");
                    text = function_d974aec0560c2d96(boss, bossdetails.name, state);
                    color = function_f034cfbc42d3956f(state);
                    function_520b0777b699630b(boss.origin, boss.angles, text, color);
                } else if (bossdetails.name == "<dev string:x112>") {
                    health = boss.health + "<dev string:xfa>";
                    name = default_to(bossdetails.name, "<dev string:x4f>");
                    text = function_d974aec0560c2d96(boss, bossdetails.name, state);
                    color = function_f034cfbc42d3956f(state);
                    function_c9ef0d1abb4b9396(boss.origin, boss.angles, text, color);
                } else {
                    var_e9136a3ae00f9e47 = (72, 36, 36);
                    origin_body = boss.origin + (0, 0, var_e9136a3ae00f9e47[2] * 0.5);
                    text = function_d974aec0560c2d96(boss, bossdetails.name, state);
                    color = function_f034cfbc42d3956f(state);
                    orientedbox(origin_body, var_e9136a3ae00f9e47, boss.angles, color, 0, 1);
                }
            }
            if (isdefined(bossinstance.wheelson)) {
                wheelson = bossinstance.wheelson;
                state = function_6c0578d086f3d6b9(wheelson);
                name = "<dev string:x101>";
                text = function_d974aec0560c2d96(wheelson, name, state);
                color = function_f034cfbc42d3956f(state);
                function_6cec87bd99735fe5(wheelson.origin, wheelson.angles, text, color);
            }
            if (isarray(boss.minions)) {
                index = 0;
                foreach (minion in boss.minions) {
                    state = function_6c0578d086f3d6b9(minion);
                    text = function_d974aec0560c2d96(minion, minion.name, state);
                    color = function_f034cfbc42d3956f(state);
                    height = 88 + 16 * index;
                    function_d75ea89dee2f86f4(minion.origin, text, color, height);
                    index += 1;
                }
            }
        }
    }

    // Namespace namespace_aed319c762c2b87c / namespace_fbe0d13c598c2ab5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x10ad
    // Size: 0x1eb
    function function_b9d60dcb9d82b507() {
        bossdebug = getdvar(@"hash_a32ed8b3f923aa2d", "<dev string:xb2>");
        var_b78030b29a1c9dae = bossdebug != "<dev string:xb2>" && bossdebug != "<dev string:x1e>";
        var_6e5f901a7b46c1e8 = istrue(var_b78030b29a1c9dae) && bossdebug != "<dev string:x11a>" && bossdebug != "<dev string:x11c>" && bossdebug != "<dev string:x120>";
        if (isarray(level.bosses) && istrue(var_b78030b29a1c9dae)) {
            var_aaaa8a8df8f5c537 = getdvarint(@"hash_b7c9a158890bce5a", 1920);
            var_ab5696f7e031e1ba = getdvarint(@"hash_9139b4ad2f235c95", 1080);
            x = 360;
            y = 60;
            index = 0;
            foreach (boss in level.bosses) {
                if (isstruct(boss) && isarray(boss.instances)) {
                    var_c1a8c050f22b2f27 = var_6e5f901a7b46c1e8 && issubstr(boss.name, bossdebug);
                    if (!var_6e5f901a7b46c1e8 || var_c1a8c050f22b2f27) {
                        foreach (bossinstance in boss.instances) {
                            function_ebd16f5b10596ff0(boss, bossinstance);
                            index = function_ebd5555b105d2c99(boss, bossinstance, x, y, index);
                        }
                    }
                }
            }
        }
    }

#/