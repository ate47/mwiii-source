// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\devgui.gsc;
#using script_3e34d236a84cfd96;
#using script_638d701d263ee1ed;

#namespace namespace_1cb5f1cc1f98b618;

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x90
// Size: 0x391
function function_79f6b9ffeb872713() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_50a8580a8b718b47);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_50a8580a8b718b47);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_42693079c84f5e6b, 1);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_1410eff963fa3b85, 1);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_1410eff963fa3b85, 1);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_1410eff963fa3b85, 1);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_1410eff963fa3b85, 1);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_1410eff963fa3b85, 1);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_5652d4212374479);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_607a7d6915ef8735, 1);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_607a7d6915ef8735, 1);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_607a7d6915ef8735, 1);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_607a7d6915ef8735, 1);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_607a7d6915ef8735, 1);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_ae3dd752642964cc, 1);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_ae3dd752642964cc, 1);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_ae3dd752642964cc, 1);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_ae3dd752642964cc, 1);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_ae3dd752642964cc, 1);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_ebf0cef1743090f7);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_6409c5ab460c85f);
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>" + 1800);
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_fe953f000498048f();
        level.var_2d70874069468dab = spawnstruct();
        level.var_2d70874069468dab.updateseconds = 1;
        level thread function_b350da246217907c();
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x428
// Size: 0xc8
function function_c5fe5d9ce72fa0bc(activityclass, activitytypename) {
    /#
        /#
            assert(isstring(activityclass));
        #/
        /#
            assert(isstring(activitytypename));
        #/
        function_6e7290c8ee4f558b("<unknown string>" + activityclass + "<unknown string>" + activitytypename + "<unknown string>");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + activitytypename, &toggle_activity);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + activitytypename, &toggle_activity);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + activityclass + "<unknown string>" + activitytypename, &function_f7739f5c2b91aac3);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + activityclass + "<unknown string>" + activitytypename, &function_f17b5e1e3d81ea1a);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4f7
// Size: 0x165
function private function_b350da246217907c() {
    /#
        waittillframeend();
        regions = [[ level.var_2d70874069468dab.var_fa51068d985cfd59 ]]();
        function_6e7290c8ee4f558b("<unknown string>");
        foreach (region in regions) {
            function_b23a59dfb4ca49a1("<unknown string>" + region + "<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>" + region, &function_8072c276f04a62c1, 1);
            function_b23a59dfb4ca49a1("<unknown string>" + region + "<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>" + region, &function_8072c276f04a62c1, 1);
            function_b23a59dfb4ca49a1("<unknown string>" + region + "<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>" + region, &function_8072c276f04a62c1, 1);
            function_b23a59dfb4ca49a1("<unknown string>" + region + "<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>" + region, &function_8072c276f04a62c1, 1);
            function_b23a59dfb4ca49a1("<unknown string>" + region + "<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>" + region, &function_8072c276f04a62c1, 1);
        }
        function_fe953f000498048f();
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x663
// Size: 0x35
function private function_6409c5ab460c85f() {
    /#
        setdvar(@"hash_f87b20273f0955f0", 2147483646);
        setdvar(@"hash_d431c6b00b5d6b2a", 2147483646);
        function_ba98175a5f6557f2();
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x69f
// Size: 0x49
function private function_50a8580a8b718b47(params) {
    /#
        switch (params[0]) {
        case #"hash_6caf06e2c9e6872e":
            function_d0ac7479e6ae2265(1);
            break;
        case #"hash_c1c88ef798270243":
            function_d0ac7479e6ae2265(0);
            break;
        }
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6ef
// Size: 0x7e
function private toggle_activity(params) {
    /#
        activitydvar = hashcat(@"hash_862d7d5538370d45", params[1]);
        value = int(getdvar(activitydvar, 1));
        switch (params[0]) {
        case #"hash_6caf06e2c9e6872e":
            setdvar(activitydvar, 1);
            break;
        case #"hash_c1c88ef798270243":
            setdvar(activitydvar, 0);
            break;
        }
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x774
// Size: 0xf
function private function_b5c16cdb0a8b261e(params) {
    /#
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x78a
// Size: 0x2ad
function private draw_activity(activityinstance, runninginstance) {
    /#
        duration = int(ceil(level.var_2d70874069468dab.updateseconds / level.framedurationseconds));
        var_1d86cbaeb48162b0 = [[ level.var_2d70874069468dab.var_aa4bf0d23a33bd92 ]](@"hash_176090f07a9fa6df", activityinstance.class, 1800);
        var_2f347303bf358337 = (0.3, 0.3, 1);
        for (index = 0; index < activityinstance.origins.size; index++) {
            origin = activityinstance.origins[index];
            radius = activityinstance.radii[index];
            print3d(origin + (0, 0, 50), "<unknown string>" + activityinstance.type + "<unknown string>" + activityinstance.name, (1, 1, 1), 1, 1, duration, 1);
            print3d(origin + (0, 0, 30), "<unknown string>" + activityinstance.region + "<unknown string>", (1, 1, 1), 1, 1, duration, 1);
            print3d(origin + (0, 0, 10), "<unknown string>" + radius, (1, 1, 1), 1, 1, duration, 1);
            color = (1, 0, 0);
            if (isdefined(runninginstance)) {
                color = (0, 1, 0);
            }
            sphere(origin, 30, color, 0, duration);
            cylinder(origin, origin + (0, 0, 10), radius, color, 0, duration);
            var_34beb429638ce846 = (1, 1, 1);
            if (activityinstance.origins.size > 1) {
                var_34beb429638ce846 = var_2f347303bf358337;
            }
            cylinder(origin, origin + (0, 0, 10), radius + var_1d86cbaeb48162b0, var_34beb429638ce846, 0, duration);
        }
        for (index = 1; index < activityinstance.origins.size; index++) {
            prevorigin = activityinstance.origins[index - 1];
            origin = activityinstance.origins[index];
            line(prevorigin, origin, (0.8, 0.8, 1), 1, 0, duration);
        }
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa3e
// Size: 0x35
function private function_ae3dd752642964cc(params) {
    /#
        if (params.size > 0) {
            setdvar(hashcat(@"hash_1f77ee2c5138ab84", "<unknown string>" + params[0]), 1);
        }
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa7a
// Size: 0x5d
function private function_ebf0cef1743090f7() {
    /#
        var_f06b0050d062caaf = [[ level.var_2d70874069468dab.var_1aeea1d49e49164b ]]("<unknown string>", undefined, level.players[0].origin);
        if (isdefined(var_f06b0050d062caaf)) {
            [[ level.var_2d70874069468dab.var_fe3181404203f4d7 ]](var_f06b0050d062caaf);
        }
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xade
// Size: 0x67
function private function_f7739f5c2b91aac3(params) {
    /#
        var_f06b0050d062caaf = [[ level.var_2d70874069468dab.var_1aeea1d49e49164b ]](params[0], params[1], level.players[0].origin);
        if (isdefined(var_f06b0050d062caaf)) {
            [[ level.var_2d70874069468dab.var_fe3181404203f4d7 ]](var_f06b0050d062caaf);
        }
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xb4c
// Size: 0x1be
function private function_825b28c7ebf6d228(type, runningonly, drawregion) {
    /#
        if (!isdefined(runningonly)) {
            runningonly = 0;
        }
        while (true) {
            foreach (region, instancetypes in level.var_5b7c4eafd38d35c.activityinstances[type]) {
                if (isdefined(drawregion) && drawregion != region) {
                    continue;
                }
                foreach (instancetype, instances in instancetypes) {
                    foreach (instancename, instance in instances) {
                        runninginstance = undefined;
                        if (isdefined(level.var_5b7c4eafd38d35c.runninginstances[type][region]) && isdefined(level.var_5b7c4eafd38d35c.runninginstances[type][region][instancetype][instancename])) {
                            runninginstance = level.var_5b7c4eafd38d35c.runninginstances[type][region][instancetype][instancename];
                        }
                        if (runningonly && !isdefined(runninginstance)) {
                            continue;
                        }
                        draw_activity(instance, runninginstance);
                    }
                }
            }
            wait(level.var_2d70874069468dab.updateseconds);
        }
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd11
// Size: 0xc69
function private function_42693079c84f5e6b() {
    /#
        while (true) {
            drawscale = getdvarfloat(@"hash_5b0a751f4964d0a0", 1);
            duration = int(ceil(level.var_2d70874069468dab.updateseconds / level.framedurationseconds));
            screenx = 500;
            screeny = 200;
            ydelta = 40 * drawscale;
            var_a91880e9ba5df15d = 35 * drawscale;
            color = (1, 1, 1);
            scale = 3 * drawscale;
            scalesmall = 2 * drawscale;
            printtoscreen2d(screenx, screeny, "<unknown string>", color, scale, duration);
            screeny = screeny + ydelta;
            regions = [];
            foreach (activityinstances in level.var_5b7c4eafd38d35c.activityinstances) {
                foreach (regionname, var_16608965b7f8614 in activityinstances) {
                    if (var_16608965b7f8614.size > 0) {
                        regions[regionname] = 1;
                    }
                }
            }
            printtoscreen2d(screenx, screeny, "<unknown string>" + regions.size, color, scale, duration);
            screeny = screeny + ydelta;
            globalcount = level.var_5b7c4eafd38d35c.activityinstances["<unknown string>"].size;
            activitycount = level.var_5b7c4eafd38d35c.activityinstances["<unknown string>"].size;
            contractcount = level.var_5b7c4eafd38d35c.activityinstances["<unknown string>"].size;
            objectivecount = level.var_5b7c4eafd38d35c.activityinstances["<unknown string>"].size;
            startupcount = level.var_5b7c4eafd38d35c.activityinstances["<unknown string>"].size;
            types = [];
            instances = [];
            regions = [[ level.var_2d70874069468dab.var_fa51068d985cfd59 ]]();
            var_a165f6980e3e577 = function_6a64df48ad4ce4f9();
            foreach (class in var_a165f6980e3e577) {
                types[class] = [];
                instances[class] = 0;
                foreach (region in regions) {
                    var_7d0882489e1ab140 = level.var_5b7c4eafd38d35c.activityinstances[class][region];
                    if (!isdefined(var_7d0882489e1ab140)) {
                        continue;
                    }
                    foreach (activitytype, activityinstances in var_7d0882489e1ab140) {
                        types[class][activitytype] = 1;
                        instances[class] = instances[class] + activityinstances.size;
                    }
                }
            }
            text = "<unknown string>" + types["<unknown string>"].size + "<unknown string>";
            text = text + "<unknown string>" + types["<unknown string>"].size + "<unknown string>";
            text = text + "<unknown string>" + types["<unknown string>"].size + "<unknown string>";
            text = text + "<unknown string>" + types["<unknown string>"].size + "<unknown string>";
            text = text + "<unknown string>" + types["<unknown string>"].size + "<unknown string>";
            printtoscreen2d(screenx, screeny, text, color, scale, duration);
            screeny = screeny + ydelta;
            text = "<unknown string>" + instances["<unknown string>"] + "<unknown string>";
            text = text + "<unknown string>" + instances["<unknown string>"] + "<unknown string>";
            text = text + "<unknown string>" + instances["<unknown string>"] + "<unknown string>";
            text = text + "<unknown string>" + instances["<unknown string>"] + "<unknown string>";
            text = text + "<unknown string>" + instances["<unknown string>"] + "<unknown string>";
            printtoscreen2d(screenx, screeny, text, color, scale, duration);
            screeny = screeny + ydelta;
            difficulties = ["<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>"];
            var_2bfe175508eba086 = [];
            foreach (class in var_a165f6980e3e577) {
                var_3a18cedb8717f4d1 = [];
                foreach (difficulty in difficulties) {
                    var_3a18cedb8717f4d1[difficulty] = [[ level.var_2d70874069468dab.var_a19c8c0604529f78 ]](class, difficulty);
                }
                var_2bfe175508eba086[class] = var_3a18cedb8717f4d1;
            }
            instances = [];
            var_a072fac9ece92308 = [];
            foreach (class in var_a165f6980e3e577) {
                instances[class] = 0;
                var_a072fac9ece92308[class] = [[ level.var_2d70874069468dab.var_c7aef763b2f3aa8 ]](class);
                foreach (region in regions) {
                    var_7d0882489e1ab140 = level.var_5b7c4eafd38d35c.runninginstances[class][region];
                    if (!isdefined(var_7d0882489e1ab140)) {
                        continue;
                    }
                    foreach (activitytype, activityinstances in var_7d0882489e1ab140) {
                        instances[class] = instances[class] + activityinstances.size;
                    }
                }
            }
            text = "<unknown string>" + instances["<unknown string>"] + "<unknown string>" + var_a072fac9ece92308["<unknown string>"] + "<unknown string>";
            text = text + "<unknown string>" + instances["<unknown string>"] + "<unknown string>" + var_a072fac9ece92308["<unknown string>"] + "<unknown string>";
            printtoscreen2d(screenx, screeny, text, color, scale, duration);
            screeny = screeny + ydelta;
            text = "<unknown string>" + instances["<unknown string>"] + "<unknown string>" + var_a072fac9ece92308["<unknown string>"] + "<unknown string>";
            text = text + "<unknown string>" + instances["<unknown string>"] + "<unknown string>" + var_a072fac9ece92308["<unknown string>"] + "<unknown string>";
            text = text + "<unknown string>" + instances["<unknown string>"] + "<unknown string>" + var_a072fac9ece92308["<unknown string>"] + "<unknown string>";
            printtoscreen2d(screenx, screeny, text, color, scale, duration);
            screeny = screeny + ydelta;
            text = "<unknown string>";
            printtoscreen2d(screenx, screeny, text, color, scale, duration);
            screeny = screeny + ydelta;
            foreach (class in var_a165f6980e3e577) {
                text = "<unknown string>" + class + "<unknown string>";
                printtoscreen2d(screenx, screeny, text, color, scalesmall, duration);
                var_3a18cedb8717f4d1 = var_2bfe175508eba086[class];
                var_ccd2bc8536f2f0f9 = [];
                var_ccd2bc8536f2f0f9["<unknown string>"] = 0;
                var_ccd2bc8536f2f0f9["<unknown string>"] = 0;
                var_ccd2bc8536f2f0f9["<unknown string>"] = 0;
                var_ccd2bc8536f2f0f9["<unknown string>"] = 0;
                foreach (region in regions) {
                    regiondifficulty = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(region);
                    if (!isdefined(var_ccd2bc8536f2f0f9[regiondifficulty])) {
                        continue;
                    }
                    var_7d0882489e1ab140 = level.var_5b7c4eafd38d35c.runninginstances[class][region];
                    foreach (activityinstances in var_7d0882489e1ab140) {
                        var_ccd2bc8536f2f0f9[regiondifficulty] = var_ccd2bc8536f2f0f9[regiondifficulty] + activityinstances.size;
                    }
                }
                text = "<unknown string>" + var_ccd2bc8536f2f0f9["<unknown string>"] + "<unknown string>" + var_3a18cedb8717f4d1["<unknown string>"] + "<unknown string>";
                text = text + "<unknown string>" + var_ccd2bc8536f2f0f9["<unknown string>"] + "<unknown string>" + var_3a18cedb8717f4d1["<unknown string>"] + "<unknown string>";
                text = text + "<unknown string>" + var_ccd2bc8536f2f0f9["<unknown string>"] + "<unknown string>" + var_3a18cedb8717f4d1["<unknown string>"] + "<unknown string>";
                text = text + "<unknown string>" + var_ccd2bc8536f2f0f9["<unknown string>"] + "<unknown string>" + var_3a18cedb8717f4d1["<unknown string>"] + "<unknown string>";
                printtoscreen2d(screenx + 500, screeny, text, color, scalesmall, duration);
                screeny = screeny + var_a91880e9ba5df15d;
            }
            screeny = screeny + ydelta / 2;
            printtoscreen2d(screenx, screeny, "<unknown string>", color, scale, duration);
            screeny = screeny + ydelta;
            foreach (region in regions) {
                runningcount = [];
                runningmax = [];
                foreach (class in var_a165f6980e3e577) {
                    runningcount[class] = 0;
                    var_7d0882489e1ab140 = level.var_5b7c4eafd38d35c.runninginstances[class][region];
                    if (!isdefined(var_7d0882489e1ab140)) {
                        continue;
                    }
                    foreach (activitytype, activityinstances in var_7d0882489e1ab140) {
                        runningcount[class] = runningcount[class] + activityinstances.size;
                    }
                    runningmax[class] = [[ level.var_2d70874069468dab.var_fb1eec0d33d8dc19 ]](class);
                }
                text = "<unknown string>" + region;
                printtoscreen2d(screenx, screeny, text, color, scalesmall, duration);
                text = "<unknown string>" + runningcount["<unknown string>"] + "<unknown string>" + runningmax["<unknown string>"] + "<unknown string>";
                text = text + "<unknown string>" + runningcount["<unknown string>"] + "<unknown string>" + runningmax["<unknown string>"] + "<unknown string>";
                text = text + "<unknown string>" + runningcount["<unknown string>"] + "<unknown string>" + runningmax["<unknown string>"] + "<unknown string>";
                printtoscreen2d(screenx + 500, screeny, text, color, scalesmall, duration);
                text = "<unknown string>" + runningcount["<unknown string>"] + "<unknown string>" + runningmax["<unknown string>"] + "<unknown string>";
                text = text + "<unknown string>" + runningcount["<unknown string>"] + "<unknown string>" + runningmax["<unknown string>"] + "<unknown string>";
                printtoscreen2d(screenx + 1330, screeny, text, color, scalesmall, duration);
                screeny = screeny + var_a91880e9ba5df15d;
            }
            wait(level.var_2d70874069468dab.updateseconds);
        }
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1981
// Size: 0x19
function private function_607a7d6915ef8735(params) {
    /#
        function_825b28c7ebf6d228(params[0]);
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x19a1
// Size: 0x1b
function private function_1410eff963fa3b85(params) {
    /#
        function_825b28c7ebf6d228(params[0], 1);
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x19c3
// Size: 0x1e
function private function_8072c276f04a62c1(params) {
    /#
        function_825b28c7ebf6d228(params[0], undefined, params[1]);
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x19e8
// Size: 0x23
function private function_44cc30417358da(name) {
    /#
        if (function_7ac3c4c1bce16dd2(name)) {
            toggle_thread(name, undefined, undefined);
        }
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1a12
// Size: 0x2a
function private function_5652d4212374479() {
    /#
        function_44cc30417358da("<unknown string>");
        function_44cc30417358da("<unknown string>");
        function_44cc30417358da("<unknown string>");
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1a43
// Size: 0x237
function private function_898ada7f773b1c5a(params) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        activityclass = params[0];
        activitytype = params[1];
        var_980df4613b316540 = activityclass + "<unknown string>" + activitytype;
        if (isdefined(level.var_2d70874069468dab.var_b0705e04df8f166a) && level.var_2d70874069468dab.var_b0705e04df8f166a == var_980df4613b316540) {
            level.var_2d70874069468dab.var_b0705e04df8f166a = undefined;
            return;
        }
        level.var_2d70874069468dab.var_b0705e04df8f166a = var_980df4613b316540;
        while (true) {
            regions = [[ level.var_2d70874069468dab.var_fa51068d985cfd59 ]]();
            foreach (region in regions) {
                if (!isdefined(level.var_5b7c4eafd38d35c.activityinstances[activityclass][region])) {
                    continue;
                }
                instances = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytype];
                if (!isdefined(instances)) {
                    continue;
                }
                foreach (instancename, instance in instances) {
                    runninginstance = undefined;
                    if (isdefined(level.var_5b7c4eafd38d35c.runninginstances[activityclass][region]) && isdefined(level.var_5b7c4eafd38d35c.runninginstances[activityclass][region][activitytype][instancename])) {
                        runninginstance = level.var_5b7c4eafd38d35c.runninginstances[activityclass][region][activitytype][instancename];
                    }
                    draw_activity(instance, runninginstance);
                }
            }
            wait(level.var_2d70874069468dab.updateseconds);
        }
    #/
}

// Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1c81
// Size: 0x19
function private function_f17b5e1e3d81ea1a(params) {
    /#
        level thread function_898ada7f773b1c5a(params);
    #/
}

