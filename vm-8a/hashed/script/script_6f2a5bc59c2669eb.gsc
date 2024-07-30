#using scripts\asm\asm.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\values.gsc;
#using script_7edf952f8921aa6b;
#using script_2ece06910a5c572;
#using script_38c251115537f16e;
#using script_433375b6cbabfc47;
#using script_3b78d23dad7ec5be;
#using script_686729055b66c6e4;
#using script_371b4c2ab5861e62;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\mp\mp_agent.gsc;

#namespace namespace_e5049f73842ac360;

/#

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd8
    // Size: 0x321
    function function_1f7bc5dd1e86ee1f() {
        waitframe();
        function_6e7290c8ee4f558b("<dev string:x1c>");
        priority = 20;
        function_b23a59dfb4ca49a1("<dev string:x2d>", "<dev string:x52>" + priority, &function_6aca4fbb47b31a61);
        function_b23a59dfb4ca49a1("<dev string:x77>", "<dev string:x9a>" + priority, &function_6aca4fbb47b31a61);
        function_b23a59dfb4ca49a1("<dev string:xbd>", "<dev string:xdf>" + priority, &function_6aca4fbb47b31a61);
        function_b23a59dfb4ca49a1("<dev string:x101>", "<dev string:x126>" + priority, &function_6aca4fbb47b31a61);
        function_b23a59dfb4ca49a1("<dev string:x14b>", "<dev string:x176>" + priority, &function_6aca4fbb47b31a61);
        function_a9a864379a098ad6("<dev string:x1a1>", "<dev string:x1c9>", &function_79e6bc2cbae5a949);
        function_a9a864379a098ad6("<dev string:x1e0>", "<dev string:x200>", &function_1aaf94b6b4be4ec4);
        level.var_f6c271f9f2c0fd8 = namespace_14d36171baccf528::function_8ca4e221673e423c();
        var_a559014c9ce72754 = function_83dcd153ba762bfa();
        function_a9a864379a098ad6("<dev string:x218>", "<dev string:x235>", &function_233d42b214d5a6cd);
        foreach (subclass, aitypes in level.var_f6c271f9f2c0fd8) {
            spawn_name = default_to(var_a559014c9ce72754[subclass], subclass);
            if (issubstr(subclass, "<dev string:x253>")) {
                function_b23a59dfb4ca49a1("<dev string:x25a>" + spawn_name, "<dev string:x261>" + aitypes[0], &function_a252e2eb60d04623);
                continue;
            }
            function_b23a59dfb4ca49a1("<dev string:x26b>" + spawn_name, "<dev string:x261>" + aitypes[0], &function_a252e2eb60d04623);
        }
        function_b23a59dfb4ca49a1("<dev string:x27b>", "<dev string:x290>", &function_958e5c5cb15de054);
        function_b23a59dfb4ca49a1("<dev string:x29a>", "<dev string:x2b0>", &function_958e5c5cb15de054);
        function_a9a864379a098ad6("<dev string:x2ba>", "<dev string:x2db>", &function_cacc6088d6b42b34);
        function_a9a864379a098ad6("<dev string:x2f9>", "<dev string:x310>", &function_e4acd0ee95b2b171);
        function_a9a864379a098ad6("<dev string:x324>", "<dev string:x341>", &function_bb2c7a7d908691b3);
        function_a9a864379a098ad6("<dev string:x356>", "<dev string:x36a>", &ragdoll_all);
        function_b23a59dfb4ca49a1("<dev string:x376>", "<dev string:x392>", &function_168f04942cd64395);
        function_b23a59dfb4ca49a1("<dev string:x3b2>", "<dev string:x3cf>", &function_168f04942cd64395);
        function_b23a59dfb4ca49a1("<dev string:x3fc>", "<dev string:x417>", &function_168f04942cd64395);
        function_b23a59dfb4ca49a1("<dev string:x446>", "<dev string:x461>", &function_168f04942cd64395);
        function_a9a864379a098ad6("<dev string:x48f>", "<dev string:x4b1>", &function_7d5de5e77bc3e95d);
        function_b23a59dfb4ca49a1("<dev string:x4c4>", "<dev string:x4e0>", &function_b4ecf2809c2b8328);
        function_b23a59dfb4ca49a1("<dev string:x4ef>", "<dev string:x50b>", &function_b4ecf2809c2b8328);
        function_a9a864379a098ad6("<dev string:x51a>", "<dev string:x530>", &function_789810fa398850aa);
        function_a9a864379a098ad6("<dev string:x54d>", "<dev string:x561>", &function_db4932603c9f24eb);
        function_a9a864379a098ad6("<dev string:x57c>", "<dev string:x585>", &kill_all_zombies);
        function_b23a59dfb4ca49a1("<dev string:x596>", "<dev string:x5b2>", &function_5e521f045efe7ec2);
        function_fe953f000498048f();
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x401
    // Size: 0xaf
    function function_83dcd153ba762bfa() {
        arr = [];
        arr["<dev string:x5c3>"] = "<dev string:x5cf>";
        arr["<dev string:x5d6>"] = "<dev string:x5de>";
        arr["<dev string:x5e6>"] = "<dev string:x5ef>";
        arr["<dev string:x5f8>"] = "<dev string:x612>";
        arr["<dev string:x625>"] = "<dev string:x63f>";
        arr["<dev string:x652>"] = "<dev string:x663>";
        arr["<dev string:x66d>"] = "<dev string:x679>";
        arr["<dev string:x685>"] = "<dev string:x694>";
        arr["<dev string:x69c>"] = "<dev string:x6a9>";
        arr["<dev string:x6af>"] = "<dev string:x6bf>";
        arr["<dev string:x6c8>"] = "<dev string:x6d6>";
        arr["<dev string:x6dd>"] = "<dev string:x6ee>";
        return arr;
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4b8
    // Size: 0xeb
    function function_5e521f045efe7ec2(params) {
        if (!isdefined(params) || !isdefined(params[0])) {
            iprintlnbold("<dev string:x6f9>");
            return;
        }
        bb_variable = params[0];
        value = default_to(params[1], 1);
        value_type = default_to(params[2], "<dev string:x71b>");
        switch (value_type) {
        case #"hash_4730906c2f53f03e": 
            value = int(value);
            break;
        case #"hash_3e4a6f464c850b65": 
            value = float(value);
            break;
        case #"hash_2ac140ce3b5ea398": 
            value = string(value);
            break;
        }
        closest_ai = function_6d1fbda4b8524ef2(level.players[0].origin);
        if (!isdefined(closest_ai)) {
            return;
        }
        closest_ai function_3e89eb3d8e3f1811(bb_variable, value);
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x5ab
    // Size: 0xaa
    function private function_6aca4fbb47b31a61(params) {
        new_speed = params[0];
        id_name = params[1];
        priority = int(params[2]);
        zombies = getaispeciesarray("<dev string:x72c>", "<dev string:x731>");
        foreach (zombie in zombies) {
            zombie function_f1e5805da192a1ef(new_speed, id_name, priority);
        }
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x65d
    // Size: 0x79
    function private function_79e6bc2cbae5a949() {
        player = level.players[0];
        zombies = getaispeciesarray("<dev string:x72c>", "<dev string:x731>");
        closest_zombie = get_array_of_closest(player.origin, zombies)[0];
        var_fdec05e6675e0c8a = closest_zombie getclosestreachablepointonnavmesh(player.origin);
        closest_zombie setbtgoalpos(0, var_fdec05e6675e0c8a);
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x6de
    // Size: 0x90
    function private function_1aaf94b6b4be4ec4(params) {
        player = level.players[0];
        zombies = getaispeciesarray("<dev string:x72c>", "<dev string:x731>");
        closest_zombie = get_array_of_closest(player.origin, zombies)[0];
        if (istrue(closest_zombie.enablebite)) {
            closest_zombie request_bite(player);
            return;
        }
        if (istrue(closest_zombie.enablemelee)) {
            closest_zombie request_melee(player);
        }
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x776
    // Size: 0x164
    function private function_a252e2eb60d04623(params) {
        aitype = params[0];
        subclass = params[0];
        team = params[1];
        if (isdefined(level.var_f6c271f9f2c0fd8[subclass])) {
            aitype = level.var_f6c271f9f2c0fd8[subclass][0];
        }
        if (!string_starts_with(aitype, "<dev string:x735>")) {
            aitype = "<dev string:x735>" + aitype;
        }
        if (!isdefined(level.agent_definition[aitype])) {
            println("<dev string:x73c>" + aitype + "<dev string:x753>");
            return;
        }
        origin = function_9b4c82dba041b23d();
        if (isdefined(origin)) {
            player = level.players[0];
            team = default_to(team, "<dev string:x784>");
            ai = scripts\mp\mp_agent::spawnnewagentaitype(aitype, origin, (0, 0, 0), team);
            if (isdefined(ai) && getdvarint(@"hash_6c38ce1320bfb98f", 0)) {
                var_5bb577a0f2f9e0d3 = getdvar(@"hash_ad84b507251e9ec8", "<dev string:x795>");
                if (ai function_8fa69650e33c84ef(var_5bb577a0f2f9e0d3)) {
                    origin = getgroundposition(origin, 32, 720, 100);
                    ai thread function_577d8abff6067c23(var_5bb577a0f2f9e0d3, "<dev string:x79b>", origin, (0, 0, 0), "<dev string:x7a5>");
                }
            }
        }
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x8e2
    // Size: 0x25
    function private function_233d42b214d5a6cd() {
        iprintln("<dev string:x7b5>");
        function_2fb888667001fc39("<dev string:x7f3>", @"hash_6c38ce1320bfb98f");
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x90f
    // Size: 0x89
    function private function_958e5c5cb15de054(params) {
        duration = float(params[0]);
        zombies = getaispeciesarray("<dev string:x731>", "<dev string:x253>");
        foreach (zombie in zombies) {
            zombie function_2e4d3c67e63f83ac(duration);
        }
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x9a0
    // Size: 0x67
    function private function_cacc6088d6b42b34() {
        player = level.players[0];
        zombies = getaispeciesarray("<dev string:x731>", "<dev string:x253>");
        closest_zombie = get_array_of_closest(player.origin, zombies)[0];
        closest_zombie function_e96aac065abbec4e(player.origin);
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xa0f
    // Size: 0xb0
    function private function_e4acd0ee95b2b171() {
        player = level.players[0];
        zombies = getaispeciesarray("<dev string:x731>", "<dev string:x253>");
        zombies_sorted = get_array_of_closest(player.origin, zombies);
        foreach (zombie in zombies_sorted) {
            if (!zombie ent_flag("<dev string:x811>")) {
                zombie function_ca27630def7b7aad(player);
                return;
            }
        }
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xac7
    // Size: 0x10d
    function private function_bb2c7a7d908691b3() {
        player = level.players[0];
        all_ai = getaiarray();
        ai_sorted = get_array_of_closest(player.origin, all_ai);
        foreach (ai in ai_sorted) {
            if (isdefined(ai)) {
                asm_state = "<dev string:x818>";
                if (ai asmhasstate(ai.asmname, asm_state)) {
                    if (istrue(ai function_3c1b4ff1cb5f468d(player.origin, getdvarfloat(@"hash_dcef59d374174d79", 30000)))) {
                        return;
                    }
                    return;
                }
                asm_state = "<dev string:x827>";
                if (ai asmhasstate(ai.asmname, asm_state)) {
                    ai function_360874d9808f0724();
                    ai function_ac90fa5cc0a80298(asm_state);
                    return;
                }
            }
        }
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0xbdc
    // Size: 0xcc
    function private ragdoll_all(params) {
        player = level.players[0];
        all_ai = getaiarray();
        ai_sorted = get_array_of_closest(player.origin, all_ai);
        foreach (ai in ai_sorted) {
            if (isdefined(ai)) {
                ai kill();
                corpse = ai getcorpseentity();
                corpse startragdollfromimpact("<dev string:x839>", (0, 0, 100));
            }
        }
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0xcb0
    // Size: 0xfa
    function private function_168f04942cd64395(params) {
        player = level.players[0];
        all_ai = getaiarray();
        ai_sorted = get_array_of_closest(player.origin, all_ai);
        hitloc = params[0];
        bone = params[1];
        if (!isdefined(hitloc) || !isdefined(bone)) {
            return;
        }
        foreach (ai in ai_sorted) {
            if (isdefined(ai) && isalive(ai)) {
                ai kill();
                body = ai getcorpseentity();
                if (isdefined(body)) {
                    body thread function_bf2edfaccb048554(hitloc, bone);
                    return;
                }
            }
        }
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0xdb2
    // Size: 0x129
    function private function_bf2edfaccb048554(hitloc, bone) {
        self endon("<dev string:x845>");
        self startragdoll();
        waitframe();
        if (!isdefined(level.var_c73bfa3a0535c023)) {
            level.var_c73bfa3a0535c023 = [];
        }
        if (!isdefined(level.var_dd0a1e7ffd4586d5)) {
            level.var_dd0a1e7ffd4586d5 = [];
        }
        mover = spawn_tag_origin(self.origin + (0, 0, 64), self.angles);
        constraint = spawnragdollconstraint(self, hitloc, bone, (0, 0, 0), 0);
        constraint.origin = mover.origin;
        constraint.angles = mover.angles;
        constraint linkto(mover);
        level.var_c73bfa3a0535c023[level.var_c73bfa3a0535c023.size] = constraint;
        level.var_dd0a1e7ffd4586d5[level.var_dd0a1e7ffd4586d5.size] = mover;
        mover moveto(mover.origin + (0, 0, 16), 3);
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xee3
    // Size: 0xd1
    function private function_7d5de5e77bc3e95d() {
        if (isdefined(level.var_dd0a1e7ffd4586d5)) {
            foreach (mover in level.var_dd0a1e7ffd4586d5) {
                if (isdefined(mover)) {
                    mover delete();
                }
            }
        }
        if (isdefined(level.var_c73bfa3a0535c023)) {
            foreach (constraint in level.var_c73bfa3a0535c023) {
                if (isdefined(constraint)) {
                    constraint delete();
                }
            }
        }
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0xfbc
    // Size: 0x9a
    function private function_b4ecf2809c2b8328(params) {
        player_index = int(params[0]);
        zombies = getaispeciesarray("<dev string:x731>", "<dev string:x731>");
        foreach (zombie in zombies) {
            zombie function_a047f71d0256058b(level.players[player_index], "<dev string:x84b>", 1);
        }
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x105e
    // Size: 0x7e
    function private kill_all_zombies() {
        zombies = getaispeciesarray("<dev string:x731>", "<dev string:x253>");
        foreach (zombie in zombies) {
            if (!isdefined(zombie) || !isalive(zombie)) {
                continue;
            }
            zombie kill();
        }
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x10e4
    // Size: 0x10e
    function private function_789810fa398850aa() {
        function_2fb888667001fc39("<dev string:x857>", @"hash_d95010ddcdec6c36");
        zombies = getaispeciesarray("<dev string:x731>", "<dev string:x253>");
        foreach (zombie in zombies) {
            if (isalive(zombie) && getdvarint(@"hash_d95010ddcdec6c36", 0) <= 0) {
                zombie._blackboard.var_2ad5368672cc47ba = 0;
                zombie setbtgoalpos(0, zombie.origin);
                continue;
            }
            if (isalive(zombie) && getdvarint(@"hash_d95010ddcdec6c36", 0) <= 1) {
                zombie._blackboard.var_2ad5368672cc47ba = zombie.zombieaisettings.var_106f0eccad94d9fa;
            }
        }
    }

    // Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x11fa
    // Size: 0xbf
    function private function_db4932603c9f24eb() {
        function_2fb888667001fc39("<dev string:x86d>", @"hash_3e9837d038eef96f");
        zombies = getaispeciesarray("<dev string:x731>", "<dev string:x253>");
        foreach (zombie in zombies) {
            if (isalive(zombie) && getdvarint(@"hash_3e9837d038eef96f", 0) <= 0) {
                zombie val::set("<dev string:x881>", "<dev string:x893>", 0);
                continue;
            }
            zombie val::reset("<dev string:x881>", "<dev string:x893>");
        }
    }

#/