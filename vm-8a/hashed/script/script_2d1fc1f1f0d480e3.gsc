#using scripts\engine\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_12668187dcf15b96;
#using script_6fc415ff6a905dc1;
#using script_2d9d24f7c63ac143;
#using script_600b944a95c3a7bf;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_2d1fc1f1f0d480e3;
#using script_1fefb5a9d58fa8bf;

#namespace namespace_83df3740e3ffc9d0;

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5a1
// Size: 0x2
function private function_4c16975cd4cf3b16() {
    
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5ab
// Size: 0x21
function private function_7c2b6cf6df98262a(index) {
    return self getplayerdata("jupiter_exgm", "lostGear", index, "lootID");
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5d5
// Size: 0x21
function private function_f850d7afacf0b030(index) {
    return self getplayerdata("jupiter_exgm", "lostGear", index, "quantity");
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x5ff
// Size: 0x2b
function private function_567d1c39005acb8e(index, lootid) {
    self setplayerdata("jupiter_exgm", "lostGear", index, "lootID", lootid);
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x632
// Size: 0x2b
function private function_1810d0b4cdf05ac(index, quantity) {
    self setplayerdata("jupiter_exgm", "lostGear", index, "quantity", quantity);
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x665
// Size: 0x2d
function private function_34ccfb334ace1f1c(index, lootid, quantity) {
    function_567d1c39005acb8e(index, lootid);
    function_1810d0b4cdf05ac(index, quantity);
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x69a
// Size: 0x5d
function private function_408c84311d22446a() {
    self setplayerdata("jupiter_exgm", "lostGearOrigin", 0, self.origin[0]);
    self setplayerdata("jupiter_exgm", "lostGearOrigin", 1, self.origin[1]);
    self setplayerdata("jupiter_exgm", "lostGearOrigin", 2, self.origin[2]);
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6ff
// Size: 0x5c
function private function_fb1296132a8ade2e() {
    x = self getplayerdata("jupiter_exgm", "lostGearOrigin", 0);
    y = self getplayerdata("jupiter_exgm", "lostGearOrigin", 1);
    z = self getplayerdata("jupiter_exgm", "lostGearOrigin", 2);
    return (x, y, z);
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x764
// Size: 0x2
function private function_93982614eb857c90() {
    
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x76e
// Size: 0x15
function function_5dcc10a8600d8e45(player) {
    return player function_7c2b6cf6df98262a(0) != 0;
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x78c
// Size: 0x17e
function function_c77b3c46fdc103a6(player) {
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory | Lost Gear (setLostGear): player '%s' BEGIN", player.name);
    function_b2addcd483da442f(player);
    gearsources = [];
    gearsources["loadout"] = player namespace_512200f0f9e6ebc9::snapshotinventory();
    gearsources["backpack"] = player namespace_aead94004cf4c147::snapshotbackpack();
    index = 0;
    foreach (itemsource, itemlist in gearsources) {
        foreach (item in itemlist) {
            var_d53771808585d4da = namespace_38b993c4618e76cd::getScriptableFromLootID(item.lootid);
            namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory | Lost Gear ( setLostGear ): player '%s' had %s of item '%s' (lootID = %s) in source '%s'", player.name, item.quantity, var_d53771808585d4da, item.lootid, itemsource);
            player function_34ccfb334ace1f1c(index, item.lootid, item.quantity);
            index++;
        }
    }
    player function_408c84311d22446a();
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory | Lost Gear ( setLostGear ): player '%s' END", player.name);
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x912
// Size: 0x86
function function_19b3d7d43b86499a(player) {
    items = [];
    for (lootid = player function_7c2b6cf6df98262a(items.size); lootid != 0; lootid = player function_7c2b6cf6df98262a(items.size)) {
        item = spawnstruct();
        item.lootid = lootid;
        item.quantity = player getplayerdata("jupiter_exgm", "lostGear", items.size, "quantity");
        items[items.size] = item;
    }
    return items;
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9a1
// Size: 0x62
function function_b2addcd483da442f(player) {
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory | Lost Gear (clearLostGearList): player '%s'", player.name);
    index = 0;
    for (lootid = player function_7c2b6cf6df98262a(index); lootid != 0; lootid = player function_7c2b6cf6df98262a(index)) {
        player function_34ccfb334ace1f1c(index, 0, 0);
        index++;
    }
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa0b
// Size: 0xcc
function onplayerspawn(player) {
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory | Lost Gear (onPlayerSpawn): player '%s' BEGIN", player.name);
    if (isdefined(level.exgm.lostGear)) {
        foreach (gearbag in level.exgm.lostGear.var_431febfef965dd95) {
            function_4f54ffb17a95419b(gearbag, player);
        }
    }
    if (function_5dcc10a8600d8e45(player)) {
        function_b4ffabaa2545fb41(player);
    }
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory | Lost Gear (onPlayerSpawn): player '%s' END", player.name);
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xadf
// Size: 0x2
function private function_76e911d798eded43() {
    
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xae9
// Size: 0x29c
function private function_b4ffabaa2545fb41(player) {
    loadoutcontents = [];
    lostGear = function_19b3d7d43b86499a(player);
    foreach (index, gearitem in lostGear) {
        loadoutcontents[index] = [];
        loadoutcontents[index]["lootID"] = gearitem.lootid;
        loadoutcontents[index]["quantity"] = gearitem.quantity;
    }
    if (!isdefined(loadoutcontents) || loadoutcontents.size <= 0) {
        namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory | Lost Gear (spawnLostGearBag): player '%s' no lost gear to spawn, aborting spawn", player.name);
        return;
    }
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    lostGearOrigin = player function_fb1296132a8ade2e();
    var_d1c4f239085ab290 = (0, 0, 0);
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, lostGearOrigin, var_d1c4f239085ab290);
    loadoutbackpack = scripts\mp\gametypes\br_pickups::spawnpickup("cache_duffel_bag_01", dropinfo, 1);
    loadoutbackpack setscriptablepartstate("body", "closed_usable");
    if (!isdefined(loadoutbackpack)) {
        namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory | Lost Gear (spawnLostGearBag): player '%s' failed to spawn pickup, aborting spawn", player.name);
        return;
    }
    icon = function_9af154ce15854e98(lostGearOrigin);
    if (!isdefined(icon)) {
        namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory | Lost Gear (spawnLostGearBag): player '%s' failed to create minimap icon, aborting spawn", player.name);
        return;
    }
    loadoutbackpack.contents = loadoutcontents;
    loadoutbackpack.containertype = 6;
    loadoutbackpack.owner = player;
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory | Lost Gear (spawnLostGearBag): player '%s' spawning lost gear at '%s'", player.name, lostGearOrigin);
    if (!isdefined(level.exgm.lostGear)) {
        level.exgm.lostGear = spawnstruct();
        level.exgm.lostGear.var_431febfef965dd95 = [];
    }
    gearbag = spawnstruct();
    gearbag.pickup = loadoutbackpack;
    gearbag.icon = icon;
    level.exgm.lostGear.var_431febfef965dd95[level.exgm.lostGear.var_431febfef965dd95.size] = gearbag;
    function_96618ef5de579f7(gearbag);
    level thread function_cae44ab552885092(gearbag);
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd8d
// Size: 0x69
function private function_96618ef5de579f7(gearbag) {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        function_4f54ffb17a95419b(gearbag, player);
    }
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xdfe
// Size: 0x10e
function private function_4f54ffb17a95419b(gearbag, player) {
    if (player.team == gearbag.pickup.owner.team) {
        namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory | Lost Gear (setLostGearBagRestrictionsForPlayer): lost gear for player '%s': showing minimap icon / enabling interaction for player '%s'", gearbag.pickup.owner.name, player.name);
        scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(gearbag.icon.objectiveiconid, player);
        gearbag.pickup enablescriptableplayeruse(player);
        return;
    }
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory | Lost Gear (setLostGearBagRestrictionsForPlayer): lost gear for player '%s': hiding minimap icon / disabling interaction for player '%s'", gearbag.pickup.owner.name, player.name);
    scripts\mp\objidpoolmanager::objective_playermask_hidefrom(gearbag.icon.objectiveiconid, player);
    gearbag.pickup disablescriptableplayeruse(player);
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xf14
// Size: 0x8d
function private function_9af154ce15854e98(origin) {
    priority = 0;
    objectiveiconid = scripts\mp\objidpoolmanager::requestobjectiveid(priority);
    if (objectiveiconid == -1) {
        return undefined;
    }
    icon = spawnstruct();
    icon.objectiveiconid = objectiveiconid;
    scripts\mp\objidpoolmanager::objective_add_objective(icon.objectiveiconid, "active", origin, "hud_icon_loot_duffle_bag");
    nobackground = 1;
    scripts\mp\objidpoolmanager::update_objective_setbackground(icon.objectiveiconid, nobackground);
    return icon;
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xfaa
// Size: 0x82
function private function_cae44ab552885092(gearbag) {
    level endon("game_ended");
    gearbag.pickup waittill("death");
    scripts\mp\objidpoolmanager::returnobjectiveid(gearbag.icon.objectiveiconid);
    level.exgm.lostGear.var_431febfef965dd95 = array_remove(level.exgm.lostGear.var_431febfef965dd95, gearbag);
}

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1034
// Size: 0x2
function private function_7d2c407c71fe805b() {
    
}

/#

    // Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x103e
    // Size: 0x17b
    function function_9eaf6bf92f55ed1b(player, var_2b465f51da1e8fcf, var_2b465e51da1e8d9c, var_6b92729cd2d4b6a6) {
        tabletitle = "<dev string:x1c>" + player.name;
        var_cd8110645a9a2632 = ["<dev string:x2b>", "<dev string:x32>", "<dev string:x3d>", "<dev string:x46>"];
        var_871bdbc7e5abb341 = [];
        var_2a9fa048040c6892 = namespace_354979ae5b15fe8f::function_19b3d7d43b86499a(player);
        foreach (item in var_2a9fa048040c6892) {
            var_d53771808585d4da = namespace_38b993c4618e76cd::getScriptableFromLootID(item.lootid);
            itemvalue = namespace_6499f2212dc52bbd::function_10440574d3361667(item.lootid);
            var_871bdbc7e5abb341[var_871bdbc7e5abb341.size] = [item.lootid, var_d53771808585d4da, item.quantity, itemvalue];
        }
        textcolor = (1, 0, 0);
        textscale = 1;
        return namespace_36be7f9eab6ca7bc::function_b1ea22d278623807(var_2b465f51da1e8fcf, var_2b465e51da1e8d9c, tabletitle, var_cd8110645a9a2632, var_871bdbc7e5abb341, textcolor, textscale, var_6b92729cd2d4b6a6);
    }

#/

// Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11c1
// Size: 0x2
function private function_c77d7050e6b8e9b() {
    
}

/#

    // Namespace namespace_83df3740e3ffc9d0 / namespace_354979ae5b15fe8f
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x11cb
    // Size: 0x4c
    function function_309fc74e41014bf3(player) {
        namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("<dev string:x4c>", player.name);
        function_c77b3c46fdc103a6(player);
        function_b4ffabaa2545fb41(player);
        namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("<dev string:x89>", player.name);
    }

#/