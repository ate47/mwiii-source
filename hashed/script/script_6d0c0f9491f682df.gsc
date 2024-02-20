// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using scripts\engine\trace.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_a760465060d39d2e;

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa0
// Size: 0x97
function function_b8a2a2faf79dc08e() {
    /#
        if (!isdefined(level.var_8cbe6bf798d07ab)) {
            level.var_8cbe6bf798d07ab = spawnstruct();
        }
        thread function_355de3fc37e0bd45();
        thread function_4770632c00748149();
        thread function_17cdeb7626afb432();
        level callback::add("<unknown string>", &function_c7979dea29932f4e);
        level callback::add("<unknown string>", &function_7973fcc15a7b9d52);
        level callback::add("<unknown string>", &function_51eab65eec69);
        setdevdvar(@"hash_588557f97f081a7e", "<unknown string>");
        setdevdvarifuninitialized(@"hash_94cfa401914bb582", "<unknown string>");
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13e
// Size: 0x130
function function_71d0871062111cb8(group) {
    /#
        class = undefined;
        if (isdefined(group)) {
            class = "<unknown string>";
            switch (group) {
            case #"hash_8af0086b038622b5":
                class = "<unknown string>";
                break;
            case #"hash_dd616da0b395a0b0":
                class = "<unknown string>";
                break;
            case #"hash_47368bc0d2ef1565":
                class = "<unknown string>";
                break;
            case #"hash_bef5ec0b3e197ae":
                class = "<unknown string>";
                break;
            case #"hash_86b11ac21f992552":
            case #"hash_a1f27f97be15d620":
                class = "<unknown string>";
                break;
            case #"hash_34340d457a63e7f1":
                class = "<unknown string>";
                break;
            case #"hash_9d18adab1b65a661":
                class = "<unknown string>";
                break;
            case #"hash_16cf6289ab06bd30":
                class = "<unknown string>";
                break;
            case #"hash_ab10f9c080fe4faf":
                class = "<unknown string>";
                break;
            case #"hash_c095d67337b1f5a1":
                class = "<unknown string>";
                break;
            case #"hash_2535634d8bb5c955":
                class = "<unknown string>";
                break;
            }
        }
        return class;
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x275
// Size: 0x107
function function_355de3fc37e0bd45() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>" + "<unknown string>");
        var_7bf75938623b20d6 = getarraykeys(level.weaponmapdata);
        var_a37137405e8e50a = namespace_3c37cb17ade254d::array_sort_with_func(var_7bf75938623b20d6, &function_86b38dd39a0aea86);
        for (i = 0; i < var_a37137405e8e50a.size; i++) {
            data = level.weaponmapdata[var_a37137405e8e50a[i]];
            weaponclass = function_71d0871062111cb8(data.group);
            if (isdefined(weaponclass)) {
                namespace_b032b0cc17b10064::function_a2fe753948998c89(weaponclass + "<unknown string>" + data.assetname, "<unknown string>" + data.assetname);
            }
        }
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>" + "<unknown string>");
        namespace_b032b0cc17b10064::function_a2fe753948998c89("<unknown string>", "<unknown string>");
        namespace_b032b0cc17b10064::function_a2fe753948998c89("<unknown string>", "<unknown string>");
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x383
// Size: 0x30
function function_86b38dd39a0aea86(a, b) {
    /#
        if (!isdefined(a)) {
            return 0;
        }
        if (!isdefined(b)) {
            return 1;
        }
        return stricmp(a, b) < 0;
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3ba
// Size: 0xd5
function function_7aa60ff4574743(dvar, defaultvalue, func, var_98141672e15b254c, unarchived) {
    /#
        if (!isdefined(level.var_8cbe6bf798d07ab.var_9a8c945fe45c8e5)) {
            level.var_8cbe6bf798d07ab.var_9a8c945fe45c8e5 = [];
        }
        setdvarifuninitialized(dvar, defaultvalue);
        struct = spawnstruct();
        struct.func = func;
        struct.dvar = dvar;
        struct.defaultvalue = defaultvalue;
        if (isdefined(var_98141672e15b254c)) {
            struct.threaded = var_98141672e15b254c;
        }
        if (isdefined(unarchived)) {
            struct.unarchived = unarchived;
        }
        level.var_8cbe6bf798d07ab.var_9a8c945fe45c8e5[dvar] = struct;
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x496
// Size: 0x10a
function function_56f3108c7ef4ae1d() {
    /#
        if (!isdefined(level.var_8cbe6bf798d07ab.var_9a8c945fe45c8e5)) {
            return;
        }
        for (;;) {
            foreach (dvarstr, data in level.var_8cbe6bf798d07ab.var_9a8c945fe45c8e5) {
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
            wait(0.2);
        }
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a7
// Size: 0xb6
function function_4770632c00748149() {
    /#
        function_7aa60ff4574743(@"hash_5a6ac095cce29d6a", "<unknown string>", &function_c8daabfa780ac4c6, 0, 0);
        function_7aa60ff4574743(@"hash_b8fb8e495524a25c", "<unknown string>", &function_fbfe774dd8a2b0a6, 0, 0);
        function_7aa60ff4574743(@"hash_5d287f84a6f89b43", "<unknown string>", &function_333a596bee56937d, 0, 0);
        function_7aa60ff4574743(@"hash_61d2d8e5a629ef89", "<unknown string>", &function_d214bc8897a77197, 0, 0);
        function_7aa60ff4574743(@"hash_5e29683a6750ed67", "<unknown string>", &function_9a2bcf3ce7449979, 0, 0);
        function_7aa60ff4574743(@"hash_c2957735560e95b2", "<unknown string>", &function_dd9d05980fc62610, 0, 0);
        thread function_56f3108c7ef4ae1d();
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x664
// Size: 0x119
function function_9a2bcf3ce7449979(weaponname) {
    /#
        var_9adb6fbfe4faa5a2 = weaponname;
        variant = -1;
        toks = strtok(weaponname, "<unknown string>");
        if (toks.size > 1) {
            var_9adb6fbfe4faa5a2 = toks[0];
            variant = int(toks[1]);
        }
        if (isdefined(var_9adb6fbfe4faa5a2)) {
            var_8c78fd98c6c91e0f = namespace_e0ee43ef2dddadaa::getweaponrootname(var_9adb6fbfe4faa5a2);
            var_bab0d10e51188531 = function_2d7fd129a52dd44b();
            foreach (player in var_bab0d10e51188531) {
                var_11a1fa68aeb971c0 = istrue(level.nightmap);
                var_c88b10f789adf8eb = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(var_8c78fd98c6c91e0f, undefined, undefined, variant, undefined, undefined, var_11a1fa68aeb971c0);
                currentweapon = player.currentweapon;
                player function_71bd21b34346c599(currentweapon, var_c88b10f789adf8eb, 0);
            }
        }
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x784
// Size: 0x16a
function function_dd9d05980fc62610(val) {
    /#
        if (isdefined(val)) {
            params = strtok(val, "<unknown string>");
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
                var_bab0d10e51188531 = function_2d7fd129a52dd44b();
                foreach (player in var_bab0d10e51188531) {
                    currentweapon = player.currentweapon;
                    if (!isdefined(weaponobj)) {
                        weaponobj = currentweapon;
                    }
                    var_c88b10f789adf8eb = function_f3cafbcac7b5f838(weaponobj, attachmentname);
                    if (!isdefined(var_c88b10f789adf8eb)) {
                        if (!isbot(player)) {
                            player iprintlnbold("<unknown string>" + attachmentname + "<unknown string>" + weaponobj.basename + "<unknown string>");
                        }
                    } else {
                        player function_71bd21b34346c599(currentweapon, var_c88b10f789adf8eb, 1);
                    }
                }
            }
        }
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8f5
// Size: 0x2ca
function function_f3cafbcac7b5f838(weaponobj, attachmentname) {
    /#
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
        var_c1f45bf103f82583 = function_4add228b999c26aa(var_b8ca516f1a797a1f, attachmentname);
        var_e0ba8911e121a911 = 0;
        foreach (idx, a in attachments) {
            var_e571ecdd21ddcee6 = function_4add228b999c26aa(var_b8ca516f1a797a1f, attachments[idx]);
            if (var_c1f45bf103f82583 == var_e571ecdd21ddcee6 && var_c1f45bf103f82583 != "<unknown string>") {
                attachments[idx] = attachmentname;
                var_e0ba8911e121a911 = 1;
            }
        }
        if (!var_e0ba8911e121a911) {
            attachments[attachments.size] = attachmentname;
            var_7809ad191e44fe6a[var_7809ad191e44fe6a.size] = 0;
        }
        variantid = getweaponvariantindex(weaponobj);
        var_1558cf422ec0ea75 = namespace_e0ee43ef2dddadaa::buildweapon(namespace_e0ee43ef2dddadaa::getweaponrootname(weaponobj), attachments, camo, "<unknown string>", variantid, var_7809ad191e44fe6a, undefined, stickers, var_11a1fa68aeb971c0);
        return var_1558cf422ec0ea75;
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbc6
// Size: 0x7f
function function_71bd21b34346c599(currentweapon, var_c88b10f789adf8eb, giveammo) {
    /#
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
        player namespace_df5cfdbe6e2d3812::_switchtoweaponimmediate(var_c88b10f789adf8eb);
        namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, var_c88b10f789adf8eb);
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc4c
// Size: 0x45
function function_c8daabfa780ac4c6(entnum) {
    /#
        host = function_3b6bb4498000be82();
        target = host function_ba794adeb36ca952();
        if (!isdefined(target)) {
            return;
        }
        function_fbfe774dd8a2b0a6(target getentitynumber());
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc98
// Size: 0xc6
function function_fbfe774dd8a2b0a6(entnum) {
    /#
        entnum = int(entnum);
        if (!isdefined(level.players[entnum])) {
            iprintln("<unknown string>");
            return;
        }
        level.var_8cbe6bf798d07ab.var_3b3b12cc96932083 = spawnstruct();
        level.var_8cbe6bf798d07ab.var_3b3b12cc96932083.entnum = entnum;
        level.var_8cbe6bf798d07ab.var_3b3b12cc96932083.ent = level.players[entnum];
        iprintln("<unknown string>" + level.var_8cbe6bf798d07ab.var_3b3b12cc96932083.ent.name);
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd65
// Size: 0x78
function function_333a596bee56937d(entnum) {
    /#
        entnum = int(entnum);
        level.var_8cbe6bf798d07ab.var_4dc56e3237d18ff5 = spawnstruct();
        level.var_8cbe6bf798d07ab.var_4dc56e3237d18ff5.entnum = entnum;
        level.var_8cbe6bf798d07ab.var_4dc56e3237d18ff5.ent = level.players[entnum];
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xde4
// Size: 0x2d
function function_d214bc8897a77197(dummy) {
    /#
        level.var_8cbe6bf798d07ab.var_3b3b12cc96932083 = undefined;
        iprintln("<unknown string>");
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe18
// Size: 0x14f
function function_2d7fd129a52dd44b() {
    /#
        if (isdefined(level.var_8cbe6bf798d07ab.var_4dc56e3237d18ff5) && isdefined(level.var_8cbe6bf798d07ab.var_4dc56e3237d18ff5.ent)) {
            players = [0:level.var_8cbe6bf798d07ab.var_4dc56e3237d18ff5.ent];
            level.var_8cbe6bf798d07ab.var_4dc56e3237d18ff5 = undefined;
            return players;
        } else if (getdvar(@"hash_13d8008e8edc58d5", "<unknown string>") != "<unknown string>") {
            entnum = int(getdvar(@"hash_13d8008e8edc58d5"));
            setdvar(@"hash_13d8008e8edc58d5", "<unknown string>");
            return [0:level.players[entnum]];
        } else if (isdefined(level.var_8cbe6bf798d07ab.var_3b3b12cc96932083) && isdefined(level.var_8cbe6bf798d07ab.var_3b3b12cc96932083.ent)) {
            return [0:level.var_8cbe6bf798d07ab.var_3b3b12cc96932083.ent];
        } else {
            return level.players;
        }
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf6e
// Size: 0x7a
function function_3b6bb4498000be82() {
    /#
        hostplayer = level.players[0];
        foreach (player in level.players) {
            if (player ishost()) {
                hostplayer = player;
                break;
            }
        }
        return hostplayer;
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfef
// Size: 0xb7
function function_ba794adeb36ca952() {
    /#
        startpos = self geteye();
        viewangles = self getplayerangles();
        fwd = anglestoforward(viewangles);
        endpos = startpos + fwd * 10000;
        var_8d727bc70842a709 = [0:"<unknown string>"];
        var_30d537ea3164e799 = physics_createcontents(var_8d727bc70842a709);
        var_8c685a74e876c0fd = namespace_2a184fc4902783dc::sphere_trace(startpos, endpos, 5, self, var_30d537ea3164e799, 0);
        var_8b39d5984da1dc7f = var_8c685a74e876c0fd["<unknown string>"];
        if (isdefined(var_8b39d5984da1dc7f) && isplayer(var_8b39d5984da1dc7f)) {
            return var_8b39d5984da1dc7f;
        } else {
            return undefined;
        }
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10ad
// Size: 0xf
function function_c7979dea29932f4e(params) {
    /#
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10c3
// Size: 0x28
function function_7973fcc15a7b9d52(params) {
    /#
        entnum = self getentitynumber();
        function_61f7f6b3f6c5c082(entnum);
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10f2
// Size: 0x28
function function_51eab65eec69(params) {
    /#
        entnum = self getentitynumber();
        function_61f7f6b3f6c5c082(entnum);
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1121
// Size: 0x32
function function_68e5f0be62d590ef() {
    /#
        if (!isdefined(level.var_8cbe6bf798d07ab.players)) {
            level.var_8cbe6bf798d07ab.players = [];
        }
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x115a
// Size: 0x3cb
function function_61f7f6b3f6c5c082(entnum) {
    /#
        player = self;
        if (isbot(player)) {
            return;
        }
        if (!isdefined(level.var_8cbe6bf798d07ab.players)) {
            level.var_8cbe6bf798d07ab.players = [];
        }
        var_9c51960a22deee7f = undefined;
        if (isdefined(level.var_8cbe6bf798d07ab.players[entnum]) && isdefined(level.var_8cbe6bf798d07ab.players[entnum].var_3fe49be7e53a9302)) {
            var_9c51960a22deee7f = level.var_8cbe6bf798d07ab.players[entnum].var_3fe49be7e53a9302;
        }
        level.var_8cbe6bf798d07ab.players[entnum] = undefined;
        if (!isdefined(player) || istrue(player.isdisconnecting)) {
            if (isdefined(var_9c51960a22deee7f)) {
                var_2a708c56a3fe9a33 = "<unknown string>" + "<unknown string>" + var_9c51960a22deee7f;
                cmd = "<unknown string>" + var_2a708c56a3fe9a33 + "<unknown string>";
                adddebugcommand(cmd + "<unknown string>");
            }
            return;
        }
        var_3fe49be7e53a9302 = player.name;
        if (isdefined(var_9c51960a22deee7f) && var_3fe49be7e53a9302 != var_9c51960a22deee7f) {
            var_2a708c56a3fe9a33 = "<unknown string>" + "<unknown string>" + var_9c51960a22deee7f;
            cmd = "<unknown string>" + var_2a708c56a3fe9a33 + "<unknown string>";
            adddebugcommand(cmd + "<unknown string>");
        }
        level.var_8cbe6bf798d07ab.players[entnum] = spawnstruct();
        level.var_8cbe6bf798d07ab.players[entnum].var_3fe49be7e53a9302 = var_3fe49be7e53a9302;
        var_84850b87803d306 = "<unknown string>" + "<unknown string>" + var_3fe49be7e53a9302 + "<unknown string>" + entnum + "<unknown string>";
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b(var_84850b87803d306);
        if (!isnullweapon(player.currentweapon)) {
            var_dd9181eb18c4db69 = player.currentweapon getnoaltweapon();
            var_a7a5265c1f7bf7ce = var_dd9181eb18c4db69.basename + "<unknown string>";
            path = var_a7a5265c1f7bf7ce + "<unknown string>";
            namespace_b032b0cc17b10064::function_a2fe753948998c89(path, "<unknown string>" + entnum + "<unknown string>" + var_dd9181eb18c4db69.basename);
            foreach (slot in level.var_c7008cff883cd615) {
                if (slot == "<unknown string>") {
                    continue;
                }
                attachments = function_75b035199842693d(var_dd9181eb18c4db69, slot);
                foreach (attachmentname in attachments) {
                    var_9611314b3b5a5647 = function_2ef675c13ca1c4af(%"hash_3c2c9813bb16552f", attachmentname);
                    category = function_6a36b14e6b79459(var_9611314b3b5a5647, #"category");
                    if (isdefined(category)) {
                        path = var_a7a5265c1f7bf7ce + category + "<unknown string>" + attachmentname;
                    } else {
                        path = var_a7a5265c1f7bf7ce + slot + "<unknown string>" + attachmentname;
                    }
                    namespace_b032b0cc17b10064::function_a2fe753948998c89(path, "<unknown string>" + entnum + "<unknown string>" + var_dd9181eb18c4db69.basename + "<unknown string>" + attachmentname);
                }
            }
        }
        namespace_b032b0cc17b10064::function_a2fe753948998c89("<unknown string>", "<unknown string>" + entnum, 100);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x152c
// Size: 0xb4
function function_92cc0e279ea9f719(weaponobj, attachmentname) {
    /#
        var_b8ca516f1a797a1f = weaponobj getnoaltweapon();
        var_91bbf8d2294a656e = var_b8ca516f1a797a1f.attachmentvarindices;
        attachments = [];
        foreach (attachment, id in var_91bbf8d2294a656e) {
            attachments[attachments.size] = attachment;
        }
        hasattachment = 0;
        if (namespace_3c37cb17ade254d::array_contains(attachments, attachmentname)) {
            hasattachment = 1;
        }
        return hasattachment;
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15e7
// Size: 0x6b
function function_b263d5c9745dc016(entnum) {
    /#
        if (!isdefined(level.var_8cbe6bf798d07ab.var_3b3b12cc96932083)) {
            return 0;
        }
        if (!isdefined(level.var_8cbe6bf798d07ab.var_3b3b12cc96932083.entnum)) {
            return 0;
        }
        return entnum == level.var_8cbe6bf798d07ab.var_3b3b12cc96932083.entnum;
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1659
// Size: 0x4b
function function_17cdeb7626afb432() {
    /#
        for (;;) {
            for (;;) {
                if (getdvar(@"hash_588557f97f081a7e") != "<unknown string>") {
                    thread function_416220a2493c9ec();
                } else if (getdvar(@"hash_94cfa401914bb582") != "<unknown string>") {
                    thread function_72bdcbf68a00d590();
                }
            }
        }
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16ab
// Size: 0x241
function function_416220a2493c9ec() {
    /#
        variantid = 0;
        blueprintName = getdvar(@"hash_588557f97f081a7e");
        weapon = getweaponrootname(blueprintName);
        weaponasset = undefined;
        if (isdefined(level.weaponmapdata[weapon])) {
            weaponasset = level.weaponmapdata[weapon].assetname;
        }
        weaponblueprint = function_40fd49171fad19d3(blueprintName);
        if (isdefined(weaponasset)) {
            var_66b934a5d11560d7 = function_bb92a5000082832a(weaponasset);
            foreach (variant, id in var_66b934a5d11560d7) {
                if (weaponblueprint == variant) {
                    foreach (player in level.players) {
                        variantid = id;
                        var_11a1fa68aeb971c0 = istrue(level.nightmap);
                        var_c88b10f789adf8eb = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(weapon, undefined, undefined, variantid, undefined, undefined, var_11a1fa68aeb971c0);
                        currentweapon = player.currentweapon;
                        player.droppeddeathweapon = undefined;
                        if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                            player thread [[ getsharedfunc("<unknown string>", "<unknown string>") ]](undefined, "<unknown string>");
                        }
                        player.droppeddeathweapon = undefined;
                        if (player hasweapon(var_c88b10f789adf8eb)) {
                            player _takeweapon(var_c88b10f789adf8eb);
                        }
                        if (namespace_448ccf1ca136fbbe::iscp()) {
                            player namespace_df5cfdbe6e2d3812::_takeweapon(currentweapon);
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
        setdevdvar(@"hash_588557f97f081a7e", "<unknown string>");
    #/
}

// Namespace namespace_a760465060d39d2e/namespace_d891623ae9a314e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18f3
// Size: 0x188
function function_72bdcbf68a00d590() {
    /#
        camo = getdvar(@"hash_94cfa401914bb582");
        if (isdefined(camo) && camo != "<unknown string>") {
            var_6650ebf6fcafaf01 = [];
            var_5cff225355038142 = "<unknown string>";
            camoindex = int(camo);
            if (camoindex != 0) {
                for (rowindex = 0; tablelookupbyrow("<unknown string>", rowindex, 1) != "<unknown string>"; rowindex++) {
                    var_6650ebf6fcafaf01[var_6650ebf6fcafaf01.size] = tablelookupbyrow("<unknown string>", rowindex, 1);
                }
                if (camoindex < var_6650ebf6fcafaf01.size) {
                    var_5cff225355038142 = var_6650ebf6fcafaf01[camoindex];
                }
            } else {
                var_5cff225355038142 = camo;
            }
            foreach (player in level.players) {
                weapon = player.currentweapon;
                player dropitem(weapon);
                weapon = weapon getnoaltweapon();
                if (var_5cff225355038142 != "<unknown string>") {
                    weapon = weapon withcamo(var_5cff225355038142);
                } else {
                    weapon = weapon withoutcamo();
                }
                player giveweapon(weapon);
                player setweaponammoclip(weapon, weaponclipsize(weapon));
                player setweaponammostock(weapon, weaponmaxammo(weapon));
                player _switchtoweaponimmediate(weapon);
            }
        }
        setdevdvar(@"hash_94cfa401914bb582", "<unknown string>");
    #/
}
