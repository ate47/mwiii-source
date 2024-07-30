#using scripts\common\callbacks.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\utility.gsc;

#namespace weapons_dev;

/#

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc0
    // Size: 0x96
    function function_b8a2a2faf79dc08e() {
        if (!isdefined(level.weapdev)) {
            level.weapdev = spawnstruct();
        }
        thread function_355de3fc37e0bd45();
        thread function_4770632c00748149();
        thread function_17cdeb7626afb432();
        level callback::add("<dev string:x1c>", &function_c7979dea29932f4e);
        level callback::add("<dev string:x2e>", &function_7973fcc15a7b9d52);
        level callback::add("<dev string:x43>", &function_51eab65eec69);
        setdevdvar(@"hash_588557f97f081a7e", "<dev string:x5b>");
        setdevdvarifuninitialized(@"hash_94cfa401914bb582", "<dev string:x5b>");
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x15e
    // Size: 0x130
    function function_71d0871062111cb8(group) {
        class = undefined;
        if (isdefined(group)) {
            class = "<dev string:x5f>";
            switch (group) {
            case #"hash_8af0086b038622b5": 
                class = "<dev string:x79>";
                break;
            case #"hash_dd616da0b395a0b0": 
                class = "<dev string:x9b>";
                break;
            case #"hash_47368bc0d2ef1565": 
                class = "<dev string:xb9>";
                break;
            case #"hash_bef5ec0b3e197ae": 
                class = "<dev string:xce>";
                break;
            case #"hash_86b11ac21f992552":
            case #"hash_a1f27f97be15d620": 
                class = "<dev string:xf6>";
                break;
            case #"hash_34340d457a63e7f1": 
                class = "<dev string:x110>";
                break;
            case #"hash_9d18adab1b65a661": 
                class = "<dev string:x12f>";
                break;
            case #"hash_16cf6289ab06bd30": 
                class = "<dev string:x14d>";
                break;
            case #"hash_ab10f9c080fe4faf": 
                class = "<dev string:x166>";
                break;
            case #"hash_c095d67337b1f5a1": 
                class = "<dev string:x17e>";
                break;
            case #"hash_2535634d8bb5c955": 
                class = "<dev string:x199>";
                break;
            }
        }
        return class;
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x296
    // Size: 0x103
    function function_355de3fc37e0bd45() {
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x1a3>" + "<dev string:x1ba>");
        key_weapons = getarraykeys(level.weaponmapdata);
        sorted_weapons = scripts\engine\utility::array_sort_with_func(key_weapons, &function_86b38dd39a0aea86);
        for (i = 0; i < sorted_weapons.size; i++) {
            data = level.weaponmapdata[sorted_weapons[i]];
            weaponclass = function_71d0871062111cb8(data.group);
            if (isdefined(weaponclass)) {
                scripts\common\devgui::function_a2fe753948998c89(weaponclass + "<dev string:x1c8>" + data.assetname, "<dev string:x1cd>" + data.assetname);
            }
        }
        scripts\common\devgui::function_fe953f000498048f();
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x1a3>" + "<dev string:x201>");
        scripts\common\devgui::function_a2fe753948998c89("<dev string:x215>", "<dev string:x22c>");
        scripts\common\devgui::function_a2fe753948998c89("<dev string:x251>", "<dev string:x26f>");
        scripts\common\devgui::function_fe953f000498048f();
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x3a1
    // Size: 0x2f
    function function_86b38dd39a0aea86(a, b) {
        if (!isdefined(a)) {
            return 0;
        }
        if (!isdefined(b)) {
            return 1;
        }
        return stricmp(a, b) < 0;
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x3d8
    // Size: 0xd5
    function function_7aa60ff4574743(dvar, defaultvalue, func, isthreaded, unarchived) {
        if (!isdefined(level.weapdev.dvars)) {
            level.weapdev.dvars = [];
        }
        setdvarifuninitialized(dvar, defaultvalue);
        struct = spawnstruct();
        struct.func = func;
        struct.dvar = dvar;
        struct.defaultvalue = defaultvalue;
        if (isdefined(isthreaded)) {
            struct.threaded = isthreaded;
        }
        if (isdefined(unarchived)) {
            struct.unarchived = unarchived;
        }
        level.weapdev.dvars[dvar] = struct;
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4b5
    // Size: 0x107
    function function_56f3108c7ef4ae1d() {
        if (!isdefined(level.weapdev.dvars)) {
            return;
        }
        for (;;) {
            foreach (dvarstr, data in level.weapdev.dvars) {
                dvarval = undefined;
                if (isdefined(data.unarchived)) {
                    dvarval = getunarchiveddebugdvar(dvarstr);
                } else {
                    dvarval = getdvar(dvarstr);
                }
                if (!isdefined(dvarval)) {
                    continue;
                }
                if (dvarval == data.defaultvalue) {
                    continue;
                }
                if (isdefined(data.threaded)) {
                    thread [[ data.func ]](dvarval);
                } else {
                    [[ data.func ]](dvarval);
                }
                setdvar(dvarstr, data.defaultvalue);
            }
            wait 0.2;
        }
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5c4
    // Size: 0xb5
    function function_4770632c00748149() {
        function_7aa60ff4574743(@"hash_5a6ac095cce29d6a", "<dev string:x29a>", &function_c8daabfa780ac4c6, 0, 0);
        function_7aa60ff4574743(@"hash_b8fb8e495524a25c", "<dev string:x29f>", &function_fbfe774dd8a2b0a6, 0, 0);
        function_7aa60ff4574743(@"hash_5d287f84a6f89b43", "<dev string:x29f>", &function_333a596bee56937d, 0, 0);
        function_7aa60ff4574743(@"hash_61d2d8e5a629ef89", "<dev string:x29a>", &function_d214bc8897a77197, 0, 0);
        function_7aa60ff4574743(@"hash_5e29683a6750ed67", "<dev string:x5b>", &function_9a2bcf3ce7449979, 0, 0);
        function_7aa60ff4574743(@"hash_c2957735560e95b2", "<dev string:x5b>", &function_dd9d05980fc62610, 0, 0);
        thread function_56f3108c7ef4ae1d();
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x681
    // Size: 0x10f
    function function_9a2bcf3ce7449979(weaponname) {
        weapnew = weaponname;
        variant = -1;
        toks = strtok(weaponname, "<dev string:x2a5>");
        if (toks.size > 1) {
            weapnew = toks[0];
            variant = int(toks[1]);
        }
        if (isdefined(weapnew)) {
            var_8c78fd98c6c91e0f = namespace_e0ee43ef2dddadaa::getweaponrootname(weapnew);
            playerarray = function_2d7fd129a52dd44b();
            foreach (player in playerarray) {
                var_11a1fa68aeb971c0 = istrue(level.nightmap);
                var_c88b10f789adf8eb = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(var_8c78fd98c6c91e0f, undefined, undefined, variant, undefined, undefined, var_11a1fa68aeb971c0);
                currentweapon = player.currentweapon;
                player function_71bd21b34346c599(currentweapon, var_c88b10f789adf8eb, 0);
            }
        }
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x798
    // Size: 0x160
    function function_dd9d05980fc62610(val) {
        if (isdefined(val)) {
            params = strtok(val, "<dev string:x2aa>");
            weaponobj = undefined;
            attachmentname = undefined;
            if (params.size > 1) {
                var_8c78fd98c6c91e0f = namespace_e0ee43ef2dddadaa::getweaponrootname(params[0]);
                var_11a1fa68aeb971c0 = istrue(level.nightmap);
                weaponobj = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(var_8c78fd98c6c91e0f, undefined, undefined, -1, undefined, undefined, var_11a1fa68aeb971c0);
                attachmentname = params[1];
            } else {
                attachmentname = params[0];
            }
            if (isdefined(attachmentname)) {
                playerarray = function_2d7fd129a52dd44b();
                foreach (player in playerarray) {
                    currentweapon = player.currentweapon;
                    if (!isdefined(weaponobj)) {
                        weaponobj = currentweapon;
                    }
                    var_c88b10f789adf8eb = function_f3cafbcac7b5f838(weaponobj, attachmentname);
                    if (!isdefined(var_c88b10f789adf8eb)) {
                        if (!isbot(player)) {
                            player iprintlnbold("<dev string:x2af>" + attachmentname + "<dev string:x2c7>" + weaponobj.basename + "<dev string:x2d9>");
                        }
                        continue;
                    }
                    player function_71bd21b34346c599(currentweapon, var_c88b10f789adf8eb, 1);
                }
            }
        }
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x900
    // Size: 0x2b7
    function function_f3cafbcac7b5f838(weaponobj, attachmentname) {
        var_b8ca516f1a797a1f = weaponobj getnoaltweapon();
        var_91bbf8d2294a656e = var_b8ca516f1a797a1f.attachmentvarindices;
        attachments = [];
        foreach (attachment, id in var_91bbf8d2294a656e) {
            attachments[attachments.size] = attachment;
        }
        failed = !var_b8ca516f1a797a1f canuseattachment(attachmentname);
        if (failed) {
            return undefined;
        }
        attachments = namespace_e0ee43ef2dddadaa::weaponattachremoveextraattachments(attachments);
        var_7809ad191e44fe6a = [];
        foreach (idx, attachment in attachments) {
            var_7809ad191e44fe6a[idx] = var_91bbf8d2294a656e[attachment];
        }
        camo = var_b8ca516f1a797a1f.camo;
        stickers = [];
        if (isdefined(var_b8ca516f1a797a1f.stickerslot0)) {
            stickers[stickers.size] = var_b8ca516f1a797a1f.stickerslot0;
        }
        if (isdefined(var_b8ca516f1a797a1f.stickerslot1)) {
            stickers[stickers.size] = var_b8ca516f1a797a1f.stickerslot1;
        }
        if (isdefined(var_b8ca516f1a797a1f.stickerslot2)) {
            stickers[stickers.size] = var_b8ca516f1a797a1f.stickerslot2;
        }
        if (isdefined(var_b8ca516f1a797a1f.stickerslot3)) {
            stickers[stickers.size] = var_b8ca516f1a797a1f.stickerslot3;
        }
        if (isdefined(var_b8ca516f1a797a1f.var_b39ac546cc8621f8)) {
            stickers[stickers.size] = var_b8ca516f1a797a1f.var_b39ac546cc8621f8;
        }
        var_11a1fa68aeb971c0 = istrue(level.nightmap);
        attachment1slot = function_4add228b999c26aa(var_b8ca516f1a797a1f, attachmentname);
        replaced = 0;
        foreach (idx, a in attachments) {
            attachment2slot = function_4add228b999c26aa(var_b8ca516f1a797a1f, attachments[idx]);
            if (attachment1slot == attachment2slot && attachment1slot != "<dev string:x2df>") {
                attachments[idx] = attachmentname;
                replaced = 1;
            }
        }
        if (!replaced) {
            attachments[attachments.size] = attachmentname;
            var_7809ad191e44fe6a[var_7809ad191e44fe6a.size] = 0;
        }
        variantid = getweaponvariantindex(weaponobj);
        var_1558cf422ec0ea75 = namespace_e0ee43ef2dddadaa::buildweapon(namespace_e0ee43ef2dddadaa::getweaponrootname(weaponobj), attachments, camo, "<dev string:x2e8>", variantid, var_7809ad191e44fe6a, undefined, stickers, var_11a1fa68aeb971c0);
        return var_1558cf422ec0ea75;
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0xbbf
    // Size: 0x7f
    function function_71bd21b34346c599(currentweapon, var_c88b10f789adf8eb, giveammo) {
        player = self;
        player dropitem(currentweapon);
        if (player hasweapon(var_c88b10f789adf8eb)) {
            player dropitem(var_c88b10f789adf8eb);
        }
        player giveweapon(var_c88b10f789adf8eb);
        if (giveammo) {
            player setweaponammoclip(var_c88b10f789adf8eb, weaponclipsize(var_c88b10f789adf8eb));
            player setweaponammostock(var_c88b10f789adf8eb, weaponmaxammo(var_c88b10f789adf8eb));
        }
        player scripts\cp_mp\utility\inventory_utility::_switchtoweaponimmediate(var_c88b10f789adf8eb);
        namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, var_c88b10f789adf8eb);
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xc46
    // Size: 0x44
    function function_c8daabfa780ac4c6(entnum) {
        host = function_3b6bb4498000be82();
        target = host function_ba794adeb36ca952();
        if (!isdefined(target)) {
            return;
        }
        function_fbfe774dd8a2b0a6(target getentitynumber());
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xc92
    // Size: 0xc5
    function function_fbfe774dd8a2b0a6(entnum) {
        entnum = int(entnum);
        if (!isdefined(level.players[entnum])) {
            iprintln("<dev string:x2f0>");
            return;
        }
        level.weapdev.var_3b3b12cc96932083 = spawnstruct();
        level.weapdev.var_3b3b12cc96932083.entnum = entnum;
        level.weapdev.var_3b3b12cc96932083.ent = level.players[entnum];
        iprintln("<dev string:x30a>" + level.weapdev.var_3b3b12cc96932083.ent.name);
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xd5f
    // Size: 0x77
    function function_333a596bee56937d(entnum) {
        entnum = int(entnum);
        level.weapdev.var_4dc56e3237d18ff5 = spawnstruct();
        level.weapdev.var_4dc56e3237d18ff5.entnum = entnum;
        level.weapdev.var_4dc56e3237d18ff5.ent = level.players[entnum];
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xdde
    // Size: 0x2c
    function function_d214bc8897a77197(dummy) {
        level.weapdev.var_3b3b12cc96932083 = undefined;
        iprintln("<dev string:x31d>");
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe12
    // Size: 0x14e
    function function_2d7fd129a52dd44b() {
        if (isdefined(level.weapdev.var_4dc56e3237d18ff5) && isdefined(level.weapdev.var_4dc56e3237d18ff5.ent)) {
            players = [level.weapdev.var_4dc56e3237d18ff5.ent];
            level.weapdev.var_4dc56e3237d18ff5 = undefined;
            return players;
        }
        if (getdvar(@"hash_13d8008e8edc58d5", "<dev string:x29f>") != "<dev string:x29f>") {
            entnum = int(getdvar(@"hash_13d8008e8edc58d5"));
            setdvar(@"hash_13d8008e8edc58d5", "<dev string:x29f>");
            return [level.players[entnum]];
        }
        if (isdefined(level.weapdev.var_3b3b12cc96932083) && isdefined(level.weapdev.var_3b3b12cc96932083.ent)) {
            return [level.weapdev.var_3b3b12cc96932083.ent];
        }
        return level.players;
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf68
    // Size: 0x77
    function function_3b6bb4498000be82() {
        hostplayer = level.players[0];
        foreach (player in level.players) {
            if (player ishost()) {
                hostplayer = player;
                break;
            }
        }
        return hostplayer;
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xfe7
    // Size: 0xb0
    function function_ba794adeb36ca952() {
        startpos = self geteye();
        viewangles = self getplayerangles();
        fwd = anglestoforward(viewangles);
        endpos = startpos + fwd * 10000;
        playercontent = ["<dev string:x337>"];
        var_30d537ea3164e799 = physics_createcontents(playercontent);
        playertrace = scripts\engine\trace::sphere_trace(startpos, endpos, 5, self, var_30d537ea3164e799, 0);
        traceent = playertrace["<dev string:x359>"];
        if (isdefined(traceent) && isplayer(traceent)) {
            return traceent;
        }
        return undefined;
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x109f
    // Size: 0xe
    function function_c7979dea29932f4e(params) {
        
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x10b5
    // Size: 0x28
    function function_7973fcc15a7b9d52(params) {
        entnum = self getentitynumber();
        function_61f7f6b3f6c5c082(entnum);
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x10e5
    // Size: 0x28
    function function_51eab65eec69(params) {
        entnum = self getentitynumber();
        function_61f7f6b3f6c5c082(entnum);
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1115
    // Size: 0x31
    function function_68e5f0be62d590ef() {
        if (!isdefined(level.weapdev.players)) {
            level.weapdev.players = [];
        }
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x114e
    // Size: 0x3ba
    function function_61f7f6b3f6c5c082(entnum) {
        player = self;
        if (isbot(player)) {
            return;
        }
        if (!isdefined(level.weapdev.players)) {
            level.weapdev.players = [];
        }
        var_9c51960a22deee7f = undefined;
        if (isdefined(level.weapdev.players[entnum]) && isdefined(level.weapdev.players[entnum].var_3fe49be7e53a9302)) {
            var_9c51960a22deee7f = level.weapdev.players[entnum].var_3fe49be7e53a9302;
        }
        level.weapdev.players[entnum] = undefined;
        if (!isdefined(player) || istrue(player.isdisconnecting)) {
            if (isdefined(var_9c51960a22deee7f)) {
                pathtoremove = "<dev string:x1a3>" + "<dev string:x363>" + var_9c51960a22deee7f;
                cmd = "<dev string:x375>" + pathtoremove + "<dev string:x388>";
                adddebugcommand(cmd + "<dev string:x38d>");
            }
            return;
        }
        var_3fe49be7e53a9302 = player.name;
        if (isdefined(var_9c51960a22deee7f) && var_3fe49be7e53a9302 != var_9c51960a22deee7f) {
            pathtoremove = "<dev string:x1a3>" + "<dev string:x363>" + var_9c51960a22deee7f;
            cmd = "<dev string:x375>" + pathtoremove + "<dev string:x388>";
            adddebugcommand(cmd + "<dev string:x38d>");
        }
        level.weapdev.players[entnum] = spawnstruct();
        level.weapdev.players[entnum].var_3fe49be7e53a9302 = var_3fe49be7e53a9302;
        var_84850b87803d306 = "<dev string:x1a3>" + "<dev string:x363>" + var_3fe49be7e53a9302 + "<dev string:x392>" + entnum + "<dev string:x1c8>";
        scripts\common\devgui::function_6e7290c8ee4f558b(var_84850b87803d306);
        if (!isnullweapon(player.currentweapon)) {
            var_dd9181eb18c4db69 = player.currentweapon getnoaltweapon();
            weaponpath = var_dd9181eb18c4db69.basename + "<dev string:x397>";
            path = weaponpath + "<dev string:x39e>";
            scripts\common\devgui::function_a2fe753948998c89(path, "<dev string:x3ad>" + entnum + "<dev string:x3ec>" + var_dd9181eb18c4db69.basename);
            foreach (slot in level.var_c7008cff883cd615) {
                if (slot == "<dev string:x40a>") {
                    continue;
                }
                attachments = function_75b035199842693d(var_dd9181eb18c4db69, slot);
                foreach (attachmentname in attachments) {
                    attachmentdataname = hashcat(%"hash_3c2c9813bb16552f", attachmentname);
                    category = getscriptbundlefieldvalue(attachmentdataname, #"category");
                    if (isdefined(category)) {
                        path = weaponpath + category + "<dev string:x1c8>" + attachmentname;
                    } else {
                        path = weaponpath + slot + "<dev string:x1c8>" + attachmentname;
                    }
                    scripts\common\devgui::function_a2fe753948998c89(path, "<dev string:x3ad>" + entnum + "<dev string:x414>" + var_dd9181eb18c4db69.basename + "<dev string:x2aa>" + attachmentname);
                }
            }
        }
        scripts\common\devgui::function_a2fe753948998c89("<dev string:x436>", "<dev string:x44b>" + entnum, 100);
        scripts\common\devgui::function_fe953f000498048f();
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1510
    // Size: 0xae
    function function_92cc0e279ea9f719(weaponobj, attachmentname) {
        var_b8ca516f1a797a1f = weaponobj getnoaltweapon();
        var_91bbf8d2294a656e = var_b8ca516f1a797a1f.attachmentvarindices;
        attachments = [];
        foreach (attachment, id in var_91bbf8d2294a656e) {
            attachments[attachments.size] = attachment;
        }
        hasattachment = 0;
        if (scripts\engine\utility::array_contains(attachments, attachmentname)) {
            hasattachment = 1;
        }
        return hasattachment;
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x15c6
    // Size: 0x6a
    function function_b263d5c9745dc016(entnum) {
        if (!isdefined(level.weapdev.var_3b3b12cc96932083)) {
            return 0;
        }
        if (!isdefined(level.weapdev.var_3b3b12cc96932083.entnum)) {
            return 0;
        }
        return entnum == level.weapdev.var_3b3b12cc96932083.entnum;
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1638
    // Size: 0x4a
    function function_17cdeb7626afb432() {
        for (;;) {
            if (getdvar(@"hash_588557f97f081a7e") != "<dev string:x5b>") {
                thread function_416220a2493c9ec();
            } else if (getdvar(@"hash_94cfa401914bb582") != "<dev string:x5b>") {
                thread function_72bdcbf68a00d590();
            }
            waitframe();
        }
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x168a
    // Size: 0x233
    function function_416220a2493c9ec() {
        variantid = 0;
        blueprintname = getdvar(@"hash_588557f97f081a7e");
        weapon = getweaponrootname(blueprintname);
        weaponasset = undefined;
        if (isdefined(level.weaponmapdata[weapon])) {
            weaponasset = level.weaponmapdata[weapon].assetname;
        }
        weaponblueprint = function_40fd49171fad19d3(blueprintname);
        if (isdefined(weaponasset)) {
            weaponvariants = function_bb92a5000082832a(weaponasset);
            foreach (variant, id in weaponvariants) {
                if (weaponblueprint == variant) {
                    foreach (player in level.players) {
                        variantid = id;
                        var_11a1fa68aeb971c0 = istrue(level.nightmap);
                        var_c88b10f789adf8eb = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(weapon, undefined, undefined, variantid, undefined, undefined, var_11a1fa68aeb971c0);
                        currentweapon = player.currentweapon;
                        player.droppeddeathweapon = undefined;
                        if (issharedfuncdefined("<dev string:x46d>", "<dev string:x478>")) {
                            player thread [[ getsharedfunc("<dev string:x46d>", "<dev string:x478>") ]](undefined, "<dev string:x5b>");
                        }
                        player.droppeddeathweapon = undefined;
                        if (player hasweapon(var_c88b10f789adf8eb)) {
                            player _takeweapon(var_c88b10f789adf8eb);
                        }
                        if (scripts\common\utility::iscp()) {
                            player scripts\cp_mp\utility\inventory_utility::_takeweapon(currentweapon);
                        }
                        var_c88b10f789adf8eb = var_c88b10f789adf8eb function_7e483d6e6b4b5688(id);
                        player giveweapon(var_c88b10f789adf8eb);
                        player setweaponammoclip(var_c88b10f789adf8eb, weaponclipsize(var_c88b10f789adf8eb));
                        player setweaponammostock(var_c88b10f789adf8eb, weaponmaxammo(var_c88b10f789adf8eb));
                        player _switchtoweaponimmediate(var_c88b10f789adf8eb);
                        namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, weapon);
                    }
                    break;
                }
            }
        }
        setdevdvar(@"hash_588557f97f081a7e", "<dev string:x5b>");
    }

    // Namespace weapons_dev / namespace_d891623ae9a314e3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18c5
    // Size: 0x180
    function function_72bdcbf68a00d590() {
        camo = getdvar(@"hash_94cfa401914bb582");
        if (isdefined(camo) && camo != "<dev string:x5b>") {
            camolist = [];
            camoref = "<dev string:x5b>";
            camoindex = int(camo);
            if (camoindex != 0) {
                for (rowindex = 0; tablelookupbyrow("<dev string:x48e>", rowindex, 1) != "<dev string:x5b>"; rowindex++) {
                    camolist[camolist.size] = tablelookupbyrow("<dev string:x48e>", rowindex, 1);
                }
                if (camoindex < camolist.size) {
                    camoref = camolist[camoindex];
                }
            } else {
                camoref = camo;
            }
            foreach (player in level.players) {
                weapon = player.currentweapon;
                player dropitem(weapon);
                weapon = weapon getnoaltweapon();
                if (camoref != "<dev string:x5b>") {
                    weapon = weapon withcamo(camoref);
                } else {
                    weapon = weapon withoutcamo();
                }
                player giveweapon(weapon);
                player setweaponammoclip(weapon, weaponclipsize(weapon));
                player setweaponammostock(weapon, weaponmaxammo(weapon));
                player _switchtoweaponimmediate(weapon);
            }
        }
        setdevdvar(@"hash_94cfa401914bb582", "<dev string:x5b>");
    }

#/