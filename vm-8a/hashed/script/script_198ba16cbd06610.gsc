#using script_247745a526421ba7;
#using script_43971bbeefd98f05;
#using script_7b2517368c79e5bc;
#using script_3e2f8cc477d57433;
#using script_5640d32580c6bc7d;
#using scripts\common\callbacks.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\poi.gsc;

#namespace dead_drop;

// Namespace dead_drop / namespace_a3da42c0149be2d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x184
// Size: 0x10f
function init_dead_drop() {
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("body_dead_drop", &function_cf1b1f86951a9209);
    scripts\engine\utility::flag_wait("scriptables_ready");
    level.deaddrops = [];
    foreach (deaddrop in getentitylessscriptablearray("scriptable_dmz_dead_drop", "classname")) {
        deaddrop callback::add("on_cache_closed", &function_a1cbb02f01a33768);
        deaddrop setscriptablepartstate("body_dead_drop", "closed_usable");
        deaddrop.var_6978a4b328fd33b3 = &function_2463f61a8c4d7772;
        deaddrop.noweaponslot = !getdvarint(@"hash_6ee9465e13d271e5", 0);
        deaddrop.var_532eac3c428e5b9b = 1;
        level.deaddrops[level.deaddrops.size] = deaddrop;
    }
    /#
        thread function_dd5b2fd6714dfcc5();
        thread function_81caaaceb9608436();
    #/
    scripts\engine\utility::flag_set("dead_drops_init");
}

// Namespace dead_drop / namespace_a3da42c0149be2d4
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x29b
// Size: 0x8b
function function_2463f61a8c4d7772(container, player, lootid, quantity, itemtype, itemindex) {
    noextract = undefined;
    backpackquantity = quantity;
    if (isdefined(itemtype) && itemtype == 10) {
        backpackquantity = function_8e5978971b5dcd16(player, itemindex);
    }
    if (!isdefined(itemtype)) {
        itemtype = 0;
    }
    if (!isdefined(itemindex)) {
        itemindex = 0;
    }
    player notify("item_added_to_cache", itemtype, itemindex, lootid, backpackquantity);
    return [lootid, noextract];
}

// Namespace dead_drop / namespace_a3da42c0149be2d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32f
// Size: 0x32c
function function_a1cbb02f01a33768(params) {
    opener = params.opener;
    container = self;
    container setscriptablepartstate("body_dead_drop", "partially_closing_unusable");
    foreach (player in container.playeropen) {
        var_e1cf43f3ae9d77e7 = container.contents;
        totalcash = 0;
        foreach (index, item in var_e1cf43f3ae9d77e7) {
            if (!isdefined(item.lootid) || item.lootid == 0) {
                continue;
            }
            bundlename = function_fc925a153c7fd55c(item.lootid);
            itembundle = getscriptbundle("itemspawnentry:" + bundlename);
            scriptablename = itembundle.scriptable;
            itemtype = itembundle.type;
            if (isdefined(itemtype) && !istrue(item.noextract)) {
                if (itemtype == "plunder") {
                    totalcash += item.quantity;
                }
            }
        }
        weaponitem = undefined;
        weaponslotid = player getclientomnvar("loot_container_weapon");
        if (istrue(weaponslotid)) {
            weaponitem = spawnstruct();
            weaponitem.lootid = weaponslotid;
            weaponitem.quantity = 1;
            var_e1cf43f3ae9d77e7[var_e1cf43f3ae9d77e7.size] = weaponitem;
        }
        if (!isdefined(container.poi)) {
            container.poi = scripts\mp\poi::function_6cc445c02b5effac(container.origin, 0, 1);
        }
        foreach (index, item in container.contents) {
            if (item.lootid == 0 || item.quantity == 0) {
                continue;
            }
            bundlename = function_fc925a153c7fd55c(item.lootid);
            itembundle = getscriptbundle("itemspawnentry:" + bundlename);
            scriptablename = itembundle.scriptable;
            itemtype = itembundle.type;
            if (!istrue(container.contents[index].noextract)) {
                container.contents[index].lootid = 0;
                container.contents[index].quantity = 0;
            }
        }
        cashlootid = function_2c836ad05e5f634c("cash");
    }
}

// Namespace dead_drop / namespace_a3da42c0149be2d4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x663
// Size: 0x1b
function function_160a29300ce1e14(totalcash, player, reductionmodifier) {
    
}

/#

    // Namespace dead_drop / namespace_a3da42c0149be2d4
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x686
    // Size: 0xf1
    function function_dd5b2fd6714dfcc5() {
        level endon("<dev string:x1c>");
        setdevdvar(@"hash_33a02069af06abbb", 0);
        level.var_c3e38887ceebe99c = [];
        while (true) {
            spawndrop = getdvarint(@"hash_33a02069af06abbb", 0);
            if (spawndrop) {
                setdevdvar(@"hash_33a02069af06abbb", 0);
                item = spawnscriptable("<dev string:x27>", level.players[0].origin, level.players[0].angles);
                item setscriptablepartstate("<dev string:x35>", "<dev string:x44>");
                item callback::add("<dev string:x52>", &function_a1cbb02f01a33768);
                item.noweaponslot = !getdvarint(@"hash_6ee9465e13d271e5", 0);
                level.var_c3e38887ceebe99c[level.var_c3e38887ceebe99c.size] = item;
            }
            waitframe();
        }
    }

    // Namespace dead_drop / namespace_a3da42c0149be2d4
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x77f
    // Size: 0x135
    function function_81caaaceb9608436() {
        level endon("<dev string:x1c>");
        setdevdvar(@"hash_1795f8de9b946d21", "<dev string:x62>");
        while (true) {
            var_19e1cb1a142bd70a = getdvar(@"hash_1795f8de9b946d21", "<dev string:x62>");
            if (var_19e1cb1a142bd70a != "<dev string:x62>") {
                setdevdvar(@"hash_1795f8de9b946d21", "<dev string:x62>");
                if (level.var_c3e38887ceebe99c.size == 0) {
                    continue;
                }
                foreach (deaddrop in level.var_c3e38887ceebe99c) {
                    itembundle = getscriptbundle("<dev string:x63>" + var_19e1cb1a142bd70a);
                    lootid = function_6d15e119c2779a93(itembundle);
                    weaponobj = undefined;
                    quantity = undefined;
                    quantity = 1;
                    if (!isdefined(lootid) || !isdefined(quantity)) {
                        continue;
                    }
                    function_4df3c8d739c4b460(level.players[0], deaddrop, lootid, quantity, weaponobj, 1, 1);
                }
            }
            waitframe();
        }
    }

#/
