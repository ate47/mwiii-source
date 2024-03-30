// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_6159d9fd44490f13;
#using scripts\cp_mp\equipment\throwing_knife.gsc;
#using script_52d91cb28006a5bd;
#using script_479e458f6f530f0d;
#using script_7c40fa80892a721;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_7ef95bba57dc4b82;
#using script_ec0f9ad939b29e0;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\killstreaks\emp_drone_targeted.gsc;
#using scripts\cp_mp\killstreaks\emp_drone.gsc;

#namespace equipment;

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb93
// Size: 0x17a
function init() {
    level.equipment = spawnstruct();
    inititems();
    if (isdefined(level.gamemodebundle) && isdefined(level.gamemodebundle.equipment_list)) {
        level.equipmenttable = "equipmentlist:" + level.gamemodebundle.equipment_list;
    } else if (getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        level.equipmenttable = "equipmentlist:equipment_list_t10_mp";
        /#
            utility::scriptbundlewarning(" ", level.equipmenttable);
        #/
    } else if (getdvarint(@"hash_39c3947a2e4f5f9e", 0) > 0) {
        level.equipmenttable = "equipmentlist:equipment_list_mgl_mp";
        /#
            utility::scriptbundlewarning(" ", level.equipmenttable);
        #/
    } else if (utility::iscp()) {
        level.equipmenttable = "equipmentlist:equipment_list_iw9_cp";
        /#
            utility::scriptbundlewarning(" ", level.equipmenttable);
        #/
    } else {
        level.equipmenttable = "equipmentlist:equipment_list_iw9_mp";
        /#
            utility::scriptbundlewarning(" ", level.equipmenttable);
        #/
    }
    function_29d51c2a86346a9c();
    initlethalmaxoffsetmap();
    function_f8d145900d997580();
    if (!isdefined(level.onplayerspawncallbacks)) {
        level.onplayerspawncallbacks = [];
    }
    level.onplayerspawncallbacks[level.onplayerspawncallbacks.size] = &equiponplayerspawned;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd14
// Size: 0x21b
function inititems() {
    level.equipment.callbacks = [];
    globals = level.equipment;
    namespace_eff8aaa83987a595::equipmentinteract_init();
    if (issharedfuncdefined("equipment", "equipment_init")) {
        globals = [[ getsharedfunc("equipment", "equipment_init") ]](globals);
    }
    scripts/cp_mp/equipment/throwing_knife::throwing_knife_init();
    namespace_9cff5695f11e1c45::function_12d7ca3ff609caba();
    globals.callbacks["equip_throwing_knife"]["onGive"] = &scripts/cp_mp/equipment/throwing_knife::throwing_knife_ongive;
    globals.callbacks["equip_throwing_knife"]["onTake"] = &scripts/cp_mp/equipment/throwing_knife::throwing_knife_ontake;
    globals.callbacks["equip_throwing_knife_fire"]["onGive"] = &scripts/cp_mp/equipment/throwing_knife::throwing_knife_ongive;
    globals.callbacks["equip_throwing_knife_fire"]["onTake"] = &scripts/cp_mp/equipment/throwing_knife::throwing_knife_ontake;
    globals.callbacks["equip_throwing_knife_electric"]["onGive"] = &scripts/cp_mp/equipment/throwing_knife::throwing_knife_ongive;
    globals.callbacks["equip_throwing_knife_electric"]["onTake"] = &scripts/cp_mp/equipment/throwing_knife::throwing_knife_ontake;
    globals.callbacks["equip_throwstar"]["onGive"] = &namespace_9cff5695f11e1c45::function_e7715ffb329c1b40;
    globals.callbacks["equip_throwstar"]["onTake"] = &namespace_9cff5695f11e1c45::function_92e126d1a5d3fb2;
    globals.callbacks["equip_geigercounter"]["onGive"] = &namespace_96abc792b7f61807::function_60cba38635fd35cb;
    globals.callbacks["equip_geigercounter"]["onTake"] = &namespace_96abc792b7f61807::function_bdd02627bcafe359;
    globals.callbacks["equip_rfid"]["onGive"] = &namespace_96abc792b7f61807::function_60cba38635fd35cb;
    globals.callbacks["equip_rfid"]["onTake"] = &namespace_96abc792b7f61807::function_bdd02627bcafe359;
    thread watchlethaldelay();
    if (issharedfuncdefined("game", "registerOnDisconnectEventCallback")) {
        [[ getsharedfunc("game", "registerOnDisconnectEventCallback") ]](&onownerdisconnect);
    }
    /#
        thread debughackequipment();
        thread debugemp();
        thread debugempdrone();
        thread debugdestroyempdrones();
    #/
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf36
// Size: 0x29
function private function_f8d145900d997580() {
    if (issharedfuncdefined("thermobaric_grenade", "thermobaric_grenade_init")) {
        [[ getsharedfunc("thermobaric_grenade", "thermobaric_grenade_init") ]]();
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf66
// Size: 0x46
function getcallback(ref, callback) {
    if (!isdefined(level.equipment.callbacks[ref])) {
        return undefined;
    }
    return level.equipment.callbacks[ref][callback];
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb4
// Size: 0x350
function loadtable() {
    level.equipment.table = [];
    level.var_415476758ec47760 = [];
    for (row = 1; true; row++) {
        ref = tablelookupbyrow(level.equipmenttable, row, 1);
        if (!isdefined(ref) || ref == "") {
            break;
        }
        lowerref = tolower(ref);
        struct = spawnstruct();
        struct.ref = lowerref;
        weaponname = tablelookupbyrow(level.equipmenttable, row, 6);
        /#
            assertex(isdefined(weaponname) && weaponname != "", "equipment_mp.csv error -  "" + lowerref + "" has no weapon");
        #/
        if (weaponname != "none") {
            attachname = tablelookupbyrow(level.equipmenttable, row, 19);
            attachments = undefined;
            if (attachname != "") {
                baseweapon = makeweapon(weaponname);
                if (!isnullweapon(baseweapon)) {
                    attachments = [attachname];
                }
            }
            struct.objweapon = makeweapon(weaponname, attachments);
            if (!isdefined(level.var_415476758ec47760[weaponname])) {
                level.var_415476758ec47760[weaponname] = lowerref;
            }
        }
        struct.id = row;
        struct.image = tablelookupbyrow(level.equipmenttable, row, 4);
        struct.defaultslot = ter_op(tablelookupbyrow(level.equipmenttable, row, 7) == "2", "secondary", "primary");
        struct.scavengerammo = int(tablelookupbyrow(level.equipmenttable, row, 10));
        struct.ispassive = tolower(tablelookupbyrow(level.equipmenttable, row, 11)) == "true";
        struct.isselectable = tablelookupbyrow(level.equipmenttable, row, 8) != "-1";
        struct.weaponname = weaponname;
        var_da24fa61707aa57f = tablelookupbyrow(level.equipmenttable, row, 12);
        if (var_da24fa61707aa57f == "none") {
        } else if (var_da24fa61707aa57f == "") {
            if (weaponname != "none") {
                struct.damageweaponnames = [weaponname];
            }
        } else {
            damageweaponnames = [];
            if (weaponname != "none") {
                damageweaponnames[damageweaponnames.size] = weaponname;
            }
            var_a2643f257ee064a3 = strtok(var_da24fa61707aa57f, " ");
            foreach (damageweaponname in var_a2643f257ee064a3) {
                damageweaponnames[damageweaponnames.size] = damageweaponname;
            }
            struct.damageweaponnames = damageweaponnames;
        }
        level.equipment.table[lowerref] = struct;
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130b
// Size: 0x410
function function_29d51c2a86346a9c() {
    level.equipment.table = [];
    level.equipmentblueprints = [];
    level.var_415476758ec47760 = [];
    var_9df9fe298aef6003 = getscriptbundle(level.equipmenttable);
    if (isdefined(var_9df9fe298aef6003)) {
        for (i = 0; i < var_9df9fe298aef6003.equipment_list.size; i++) {
            equipmentref = var_9df9fe298aef6003.equipment_list[i].ref;
            equipmentbundlename = var_9df9fe298aef6003.equipment_list[i].bundle;
            if (isdefined(equipmentbundlename)) {
                equipmentbundle = getscriptbundle("equipment:" + equipmentbundlename);
                if (isdefined(equipmentbundle)) {
                    struct = spawnstruct();
                    struct.ref = equipmentref;
                    weaponname = equipmentbundle.useweapon;
                    /#
                        assertex(isdefined(weaponname), level.equipmenttable + " error -  "" + equipmentref + "" has no weapon");
                    #/
                    if (weaponname != "none") {
                        attachments = undefined;
                        baseweapon = makeweapon(weaponname);
                        if (!isnullweapon(baseweapon)) {
                            attachments = function_6527364c1ecca6c6(weaponname);
                        }
                        struct.objweapon = makeweapon(weaponname, attachments);
                        blueprints = function_bb92a5000082832a(weaponname);
                        foreach (blueprint, id in blueprints) {
                            var_1092bc40c58c1c9a = weaponname + "|" + string(id);
                            level.equipmentblueprints[var_1092bc40c58c1c9a] = function_3211981142ec5aee(weaponname, blueprint);
                        }
                        if (!isdefined(level.var_415476758ec47760[weaponname])) {
                            level.var_415476758ec47760[weaponname] = equipmentref;
                        }
                    }
                    struct.id = i;
                    struct.image = equipmentbundle.image;
                    struct.defaultslot = ter_op(isdefined(equipmentbundle.uislot) && equipmentbundle.uislot == 2, "secondary", "primary");
                    struct.scavengerammo = ter_op(isdefined(equipmentbundle.scavengerammo), equipmentbundle.scavengerammo, 0);
                    struct.ispassive = isdefined(equipmentbundle.ispassive) && equipmentbundle.ispassive;
                    struct.isselectable = !isdefined(equipmentbundle.uiorder) || equipmentbundle.uiorder != -1;
                    struct.weaponname = weaponname;
                    struct.bundle = equipmentbundle;
                    var_da24fa61707aa57f = equipmentbundle.damageweapons;
                    if (!isdefined(var_da24fa61707aa57f)) {
                        if (weaponname != "none") {
                            struct.damageweaponnames = [weaponname];
                        }
                    } else if (var_da24fa61707aa57f == "none") {
                    } else {
                        damageweaponnames = [];
                        if (weaponname != "none") {
                            damageweaponnames[damageweaponnames.size] = weaponname;
                        }
                        var_a2643f257ee064a3 = strtok(var_da24fa61707aa57f, " ");
                        foreach (damageweaponname in var_a2643f257ee064a3) {
                            damageweaponnames[damageweaponnames.size] = damageweaponname;
                        }
                        struct.damageweaponnames = damageweaponnames;
                    }
                    level.equipment.table[equipmentref] = struct;
                }
            }
        }
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1722
// Size: 0x56
function getequipmenttableinfo(ref) {
    if (isdefined(ref) && !isdefined(level.equipment.table[ref])) {
        /#
            assertmsg("getEquipmentTableInfo was called fo equipment with a ref that wasn't initialized: " + ref + "!");
        #/
    }
    return level.equipment.table[ref];
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1780
// Size: 0xc5
function function_f4f687e4e1edb923(equipmentname) {
    tokens = strtok(equipmentname, "_");
    tokens = array_remove_index(tokens, tokens.size - 1);
    if (tokens[0] == "jup") {
        tokens = array_remove_index(tokens, 0);
    }
    equipmentroot = "";
    counter = 0;
    foreach (tok in tokens) {
        if (counter == 0) {
            equipmentroot = equipmentroot + tok;
            counter++;
            continue;
        }
        equipmentroot = equipmentroot + "_" + tok;
    }
    return equipmentroot;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184d
// Size: 0xcf
function buildequipment(weaponname, variantid) {
    if (!isdefined(weaponname)) {
        return undefined;
    }
    if (isdefined(variantid) && variantid > 0) {
        weapon = makeweapon(weaponname, [], undefined, undefined, variantid);
        var_1092bc40c58c1c9a = weaponname + "|" + string(variantid);
        attachments = level.equipmentblueprints[var_1092bc40c58c1c9a];
        foreach (attachment, variant in attachments) {
            weapon = weapon withattachment(attachment, variant);
        }
    } else {
        weapon = makeweapon(weaponname);
    }
    return weapon;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1924
// Size: 0x28e
function giveequipment(ref, slot, class, variantid) {
    /#
        assert(isdefined(ref));
    #/
    /#
        assert(isdefined(slot));
    #/
    if (!isdefined(self.equipment)) {
        self.equipment = [];
    }
    if (ref == "none") {
        return;
    }
    tableinfo = getequipmenttableinfo(ref);
    /#
        assertex(isdefined(tableinfo), "Attempting to give unknown equipment - "" + ref + """);
    #/
    if (!isdefined(tableinfo)) {
        return;
    }
    if (slot == "super") {
        supername = level.br_pickups.var_14bd11727c4b6629[level.br_pickups.br_equipnametoscriptable[ref]];
        if (issharedfuncdefined("supers", "getSuperID")) {
            tableinfo.id = [[ getsharedfunc("supers", "getSuperID") ]](supername);
        }
    }
    takeequipment(slot);
    weapon = undefined;
    if (isdefined(variantid)) {
        weapon = buildequipment(tableinfo.weaponname, variantid);
    } else {
        weapon = tableinfo.objweapon;
    }
    if (isdefined(weapon) && is_equipment_slot_allowed(slot) && !tableinfo.ispassive) {
        self giveweapon(weapon);
        if (slot == "primary") {
            self assignweaponoffhandprimary(weapon);
        } else if (slot == "secondary") {
            self assignweaponoffhandsecondary(weapon);
        } else if (slot == "super") {
            self assignweaponoffhandspecial(weapon);
        }
    }
    sethudslot(slot, tableinfo.id);
    self.equipment[slot] = ref;
    var_645972186625daee = getcallback(ref, "onGive");
    if (isdefined(var_645972186625daee)) {
        self thread [[ var_645972186625daee ]](ref, slot, variantid);
    }
    function_22bf78eca6578d7d(slot, class);
    isthrowing = ref == "equip_throwing_knife" || ref == "equip_throwing_knife_fire" || ref == "equip_throwing_knife_electric" || ref == "equip_shuriken" || ref == "equip_throwstar";
    if (issharedfuncdefined("game", "getGameType") && [[ getsharedfunc("game", "getGameType") ]]() == "arena" && isthrowing) {
    } else {
        thread watchlethaldelayplayer(ref, slot);
    }
    self notify("equipment_given", ref);
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb9
// Size: 0xf9
function takeequipment(slot) {
    /#
        assert(isdefined(slot));
    #/
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return;
    }
    tableinfo = getequipmenttableinfo(ref);
    if (isdefined(tableinfo.objweapon)) {
        if (self hasweapon(tableinfo.objweapon)) {
            _takeweapon(tableinfo.objweapon);
            if (slot == "primary") {
                self clearoffhandprimary();
            } else if (slot == "secondary") {
                self clearoffhandsecondary();
            } else if (slot == "super") {
                self clearoffhandspecial();
            }
        }
    }
    sethudslot(slot, 0);
    self.equipment[slot] = undefined;
    var_c96c25b8a1f6fe18 = getcallback(ref, "onTake");
    if (isdefined(var_c96c25b8a1f6fe18)) {
        self thread [[ var_c96c25b8a1f6fe18 ]](ref, slot);
    }
    function_22bf78eca6578d7d(slot);
    self notify("equipment_taken_" + ref);
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb9
// Size: 0x146
function equiponplayerdamaged(data) {
    weaponname = data.objweapon.basename;
    foreach (ref, tableinfo in level.equipment.table) {
        var_148e2d88d1deffd3 = getcallback(ref, "onPlayerDamaged");
        if (isdefined(var_148e2d88d1deffd3) && isdefined(tableinfo.damageweaponnames)) {
            foreach (damageweaponname in tableinfo.damageweaponnames) {
                if (damageweaponname == weaponname) {
                    callbackstarttime = gettime();
                    result = [[ var_148e2d88d1deffd3 ]](data);
                    /#
                        assertex(gettime() == callbackstarttime, "onPlayerDamagedCallback for " + ref + " cannot have waits.");
                    #/
                    return result;
                }
            }
        }
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e06
// Size: 0x96
function ondestroyedbytrophy() {
    if (isdefined(self.equipmentref)) {
        var_99115207769478ff = getcallback(self.equipmentref, "onDestroyedByTrophy");
        if (isdefined(var_99115207769478ff)) {
            self thread [[ var_99115207769478ff ]]();
            return true;
        } else if (issharedfuncdefined("equipment", "isPlantedEquipment") && [[ getsharedfunc("equipment", "isPlantedEquipment") ]](self)) {
            if (issharedfuncdefined("equipment", "deleteExplosive")) {
                self thread [[ getsharedfunc("equipment", "deleteExplosive") ]]();
                return true;
            }
        }
    }
    return false;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ea4
// Size: 0x54
function is_equipment_slot_allowed(slot) {
    switch (slot) {
    case #"hash_325cb2e66f67d5b9":
        return val::get("equipment_primary");
    case #"hash_511d3c24fcedcdb1":
        return val::get("equipment_secondary");
    default:
        return 1;
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eff
// Size: 0x5f
function sethudslot(slot, id) {
    if (slot != "super") {
        self setclientomnvar("ui_equipment_id_" + slot, id);
        return;
    }
    if (level.gametype == "dungeons") {
        self setclientomnvar("ui_field_upgrade_icon", id);
        return;
    }
    self setclientomnvar("ui_perk_package_super1", id);
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f65
// Size: 0x26
function getcurrentequipment(slot) {
    if (!isdefined(self.equipment)) {
        return undefined;
    }
    return self.equipment[slot];
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f93
// Size: 0x66
function clearallequipment() {
    if (!isdefined(self.equipment)) {
        return;
    }
    foreach (slot, ref in self.equipment) {
        takeequipment(slot);
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2000
// Size: 0x14
function function_f528e58424d9c3e3(classtype, isprimary) {
    
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x201b
// Size: 0xf3
function function_11a4d197e8db4f(classtype) {
    if (!isdefined(level.gamemodebundle) || !istrue(level.gamemodebundle.var_e12ed09bf2e43167)) {
        if (issharedfuncdefined("loadout", "getExtraEquipmentPrimary")) {
            return [[ getsharedfunc("loadout", "getExtraEquipmentPrimary") ]](self.class_num);
        }
    } else {
        switch (classtype) {
        case #"hash_44e999799ff10fce":
            if (issharedfuncdefined("loadout", "cac_getFlcExtraEquipmentPrimary")) {
                return [[ getsharedfunc("loadout", "cac_getFlcExtraEquipmentPrimary") ]](self.class_num);
            }
            break;
        default:
            if (issharedfuncdefined("loadout", "table_getFlcExtraEquipmentPrimary")) {
                return [[ getsharedfunc("loadout", "table_getFlcExtraEquipmentPrimary") ]](level.classtablename, self.class_num);
            }
            break;
        }
    }
    return 0;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2116
// Size: 0xf3
function function_58ea099b568dbfaf(classtype) {
    if (!isdefined(level.gamemodebundle) || !istrue(level.gamemodebundle.var_e12ed09bf2e43167)) {
        if (issharedfuncdefined("loadout", "getExtraEquipmentSecondary")) {
            return [[ getsharedfunc("loadout", "getExtraEquipmentSecondary") ]](self.class_num);
        }
    } else {
        switch (classtype) {
        case #"hash_44e999799ff10fce":
            if (issharedfuncdefined("loadout", "cac_getFlcExtraEquipmentSecondary")) {
                return [[ getsharedfunc("loadout", "cac_getFlcExtraEquipmentSecondary") ]](self.class_num);
            }
            break;
        default:
            if (issharedfuncdefined("loadout", "table_getFlcExtraEquipmentSecondary")) {
                return [[ getsharedfunc("loadout", "table_getFlcExtraEquipmentSecondary") ]](level.classtablename, self.class_num);
            }
            break;
        }
    }
    return 0;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2211
// Size: 0x3f2
function getequipmentmaxammo(ref, class) {
    tableinfo = getequipmenttableinfo(ref);
    if (!isdefined(tableinfo)) {
        return undefined;
    }
    if (!isdefined(tableinfo.objweapon)) {
        return 0;
    }
    if (isdefined(level.commonitem)) {
        if (ref == "equip_armorplate") {
            return namespace_f8d3520d3483c1::function_47320a25b8ee003();
        }
        maxammo = weaponmaxammo(tableinfo.objweapon);
    } else if (!scripts/cp_mp/utility/game_utility::isbrstylegametype()) {
        slot = findequipmentslot(ref);
        maxammo = undefined;
        if (isdefined(level.var_7ea1a9db4c78be14) && isdefined(slot) && (slot == "primary" || slot == "secondary")) {
            maxammo = self [[ level.var_7ea1a9db4c78be14 ]](ref, slot);
        }
        if (!isdefined(maxammo)) {
            if (ref == "equip_armorplate") {
                return namespace_f8d3520d3483c1::function_47320a25b8ee003();
            }
            if (issharedfuncdefined("perk", "hasPerk")) {
                var_3002827bca3dc613 = self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_extraoffhandammo");
            } else {
                var_3002827bca3dc613 = 0;
            }
            maxammo = weaponmaxammo(tableinfo.objweapon, var_3002827bca3dc613);
            switch (ref) {
            case #"hash_6d194c409057b2":
            case #"hash_48d3196b46b0ba61":
            case #"hash_4b4a6458f00d9319":
            case #"hash_8770d1da0d7395b9":
            case #"hash_aa60ec2aec479ec8":
                break;
            default:
                if (level.gametype != "missions" && level.gametype != "dungeons") {
                    maxammo--;
                }
                break;
            }
            isprimary = isdefined(slot) && slot == "primary" || isequipmentlethal(ref);
            issecondary = isdefined(slot) && slot == "secondary" || isequipmenttactical(ref);
            if (issharedfuncdefined("perk", "hasPerk")) {
                if (self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_extra_deadly") && isprimary) {
                    if (self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_ninja_vest")) {
                        if (issubstr(ref, "throwing_knife") || issubstr(ref, "throwstar") || issubstr(ref, "shuriken")) {
                            maxammo++;
                        }
                    } else {
                        maxammo++;
                    }
                }
                if (self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_extra_tactical") && issecondary) {
                    maxammo++;
                }
            }
            if (isdefined(class)) {
                classtype = undefined;
                if (issharedfuncdefined("loadout", "loadout_getClassType")) {
                    classtype = [[ getsharedfunc("loadout", "loadout_getClassType") ]](class);
                }
                var_1bc3bf54ae8e6ed7 = function_11a4d197e8db4f(classtype);
                var_20327dd6b8d19acf = function_58ea099b568dbfaf(classtype);
                if (var_1bc3bf54ae8e6ed7 && isprimary) {
                    maxammo++;
                }
                if (var_20327dd6b8d19acf && issecondary) {
                    maxammo++;
                }
            }
        }
    } else {
        equipmentname = level.br_pickups.br_equipnametoscriptable[tableinfo.ref];
        /#
            assertex(isdefined(level.br_pickups.maxcounts[equipmentname]), "Equipment " + equipmentname + " not found in level.br_pickups.maxCounts. Please add a stack size in the appropriate loot_item_defs table.");
        #/
        maxammo = level.br_pickups.maxcounts[equipmentname];
        if (!isdefined(maxammo)) {
            maxammo = 0;
        }
        if (ref == "equip_armorplate") {
            if (issharedfuncdefined("equipment", "hasPlatePouch")) {
                if (self [[ getsharedfunc("equipment", "hasPlatePouch") ]]()) {
                    maxammo = maxammo + getdvarint(@"hash_a5ab8ed6cc1b486a", 3);
                }
            }
        }
    }
    return maxammo;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x260b
// Size: 0x83
function getequipmentstartammo(ref) {
    tableinfo = getequipmenttableinfo(ref);
    if (!isdefined(tableinfo)) {
        return undefined;
    }
    if (!isdefined(tableinfo.objweapon)) {
        return 0;
    }
    if (issharedfuncdefined("perk", "hasPerk")) {
        var_3002827bca3dc613 = self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_extraoffhandammo");
    } else {
        var_3002827bca3dc613 = 0;
    }
    return weaponstartammo(tableinfo.objweapon, var_3002827bca3dc613);
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2696
// Size: 0x47
function getequipmentammo(ref) {
    tableinfo = getequipmenttableinfo(ref);
    if (!isdefined(tableinfo)) {
        return undefined;
    }
    if (!isdefined(tableinfo.objweapon)) {
        return 0;
    }
    return self getammocount(tableinfo.objweapon);
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e5
// Size: 0x144
function setequipmentammo(ref, amount) {
    tableinfo = getequipmenttableinfo(ref);
    if (!isdefined(tableinfo) || !isdefined(tableinfo.objweapon)) {
        return;
    }
    equipmentlist = self getweaponslistoffhands();
    foreach (equip in equipmentlist) {
        equipref = function_7f245729fcb6414d(equip.basename);
        if (isdefined(equipref) && equipref == ref) {
            variantid = undefined;
            weapon = undefined;
            if (isdefined(equip.variantid) && equip.variantid > 0) {
                variantid = equip.variantid;
                weapon = namespace_4fb9dddfb8c1a67a::buildequipment(equip.basename, variantid);
            } else {
                weapon = tableinfo.objweapon;
            }
            self setweaponammoclip(weapon, amount);
            break;
        }
    }
    function_22bf78eca6578d7d(findequipmentslot(ref));
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2830
// Size: 0x77
function function_1ab06e1478168800() {
    gaveprimary = 0;
    primary = getcurrentequipment("primary");
    if (isdefined(primary)) {
        gaveprimary = incrementequipmentammo(primary, getequipmentmaxammo(primary));
    }
    gavesecondary = 0;
    secondary = getcurrentequipment("secondary");
    if (isdefined(secondary)) {
        gavesecondary = incrementequipmentammo(secondary, getequipmentmaxammo(secondary));
    }
    return gaveprimary || gavesecondary;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28af
// Size: 0x69
function function_f1c136649b4207d6() {
    chargedprimary = 0;
    primary = getcurrentequipment("primary");
    if (isdefined(primary)) {
        chargedprimary = chargeequipment(primary);
    }
    chargedsecondary = 0;
    secondary = getcurrentequipment("secondary");
    if (isdefined(secondary)) {
        chargedsecondary = chargeequipment(secondary);
    }
    return chargedprimary || chargedsecondary;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2920
// Size: 0x69
function function_91bd2a98062313cb(slot, amount) {
    ref = getcurrentequipment(slot);
    tableinfo = getequipmenttableinfo(ref);
    if (!isdefined(tableinfo.objweapon)) {
        return;
    }
    self setweaponammoclip(tableinfo.objweapon, amount);
    function_22bf78eca6578d7d(findequipmentslot(ref));
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2990
// Size: 0x63
function incrementequipmentammo(ref, var_930290d7f474a0ae, class) {
    if (!isdefined(var_930290d7f474a0ae)) {
        var_930290d7f474a0ae = 1;
    }
    var_3dbc3b058135cbfb = getequipmentammo(ref);
    newammo = int(min(var_3dbc3b058135cbfb + var_930290d7f474a0ae, getequipmentmaxammo(ref, class)));
    setequipmentammo(ref, newammo);
    return var_3dbc3b058135cbfb != newammo;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x29fb
// Size: 0x74
function decrementequipmentammo(ref, var_7d2e0ea9107a4c02, class) {
    if (!isdefined(var_7d2e0ea9107a4c02)) {
        var_7d2e0ea9107a4c02 = 1;
    }
    var_3dbc3b058135cbfb = getequipmentammo(ref);
    var_7d2e0ea9107a4c02 = int(min(var_7d2e0ea9107a4c02, var_3dbc3b058135cbfb));
    if (var_7d2e0ea9107a4c02 > 0) {
        newammo = int(min(var_3dbc3b058135cbfb - var_7d2e0ea9107a4c02, getequipmentmaxammo(ref, class)));
        setequipmentammo(ref, newammo);
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a76
// Size: 0x70
function incrementequipmentslotammo(slot, var_930290d7f474a0ae) {
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return undefined;
    }
    if (!isdefined(var_930290d7f474a0ae)) {
        var_930290d7f474a0ae = 1;
    }
    var_3dbc3b058135cbfb = getequipmentammo(ref);
    newammo = int(min(var_3dbc3b058135cbfb + var_930290d7f474a0ae, getequipmentmaxammo(ref)));
    setequipmentammo(ref, newammo);
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2aed
// Size: 0x70
function decrementequipmentslotammo(slot, var_7d2e0ea9107a4c02) {
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return undefined;
    }
    if (!isdefined(var_7d2e0ea9107a4c02)) {
        var_7d2e0ea9107a4c02 = 1;
    }
    var_3dbc3b058135cbfb = getequipmentammo(ref);
    newammo = int(min(var_3dbc3b058135cbfb - var_7d2e0ea9107a4c02, getequipmentmaxammo(ref)));
    setequipmentammo(ref, newammo);
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b64
// Size: 0x2c
function getequipmentslotammo(slot) {
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return undefined;
    }
    return getequipmentammo(ref);
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b98
// Size: 0x35
function setequipmentslotammo(slot, count) {
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return undefined;
    }
    return setequipmentammo(ref, count);
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bd5
// Size: 0x36
function chargeequipment(ref) {
    switch (ref) {
    case #"hash_4b4a6458f00d9319":
        return namespace_8a392daf295e43f8::function_8803b12c07518865();
    default:
        return 0;
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c12
// Size: 0x1e
function function_7f245729fcb6414d(weaponname) {
    if (!isdefined(weaponname)) {
        return undefined;
    }
    return level.var_415476758ec47760[weaponname];
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c38
// Size: 0x97
function function_2113b6f7cb462692(weaponname) {
    if (!isdefined(weaponname)) {
        return undefined;
    }
    foreach (tableinfo in level.equipment.table) {
        if (isdefined(tableinfo.weaponname) && weaponname == tableinfo.weaponname) {
            return tableinfo.bundle;
        }
    }
    return undefined;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd7
// Size: 0x15a
function mapequipmentweaponforref(objweapon) {
    weaponname = undefined;
    switch (objweapon.basename) {
    case #"hash_34f28162f0f54c6e":
    case #"hash_53d34fb712dd4235":
        weaponname = "throwingknife_mp";
        break;
    case #"hash_5701898d598fdb27":
        weaponname = "claymore_mp";
        break;
    case #"hash_1608b7d163aaf95f":
        weaponname = "jup_claymore_ob";
        break;
    case #"hash_cce14c95e4764532":
        weaponname = "at_mine_mp";
        break;
    case #"hash_8fd6158eb96a1f15":
    case #"hash_b2a8e1829f433bd7":
        weaponname = "thermite_mp";
        break;
    case #"hash_6547ec525f1340da":
    case #"hash_a009d256608f52ce":
    case #"hash_c4b9b21ecac2ced4":
        weaponname = "bunkerbuster_mp";
        break;
    case #"hash_9276d33dcce198b0":
    case #"hash_a51366582cde195e":
    case #"hash_adeee012d2581c12":
        weaponname = "jup_bunkerbuster_ob";
        break;
    case #"hash_5e5b9bb1e397e30a":
        weaponname = "shock_stick_mp";
        break;
    case #"hash_fd386aff9acf671":
        weaponname = "butterfly_mine_mp";
        break;
    case #"hash_aee3b09360147621":
        weaponname = "tracker_grenade_mp";
        break;
    }
    if (isdefined(weaponname)) {
        return scripts/cp_mp/utility/weapon_utility::function_eeaa22f0cd1ff845(weaponname);
    }
    return objweapon;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e39
// Size: 0x2a
function getequipmentreffromweapon(objweapon) {
    objweapon = mapequipmentweaponforref(objweapon);
    return level.var_415476758ec47760[objweapon.basename];
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e6b
// Size: 0x3e
function getweaponfromequipmentref(equipref) {
    equip = level.equipment.table[equipref];
    if (isdefined(equip)) {
        return equip.objweapon;
    }
    return undefined;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2eb1
// Size: 0xe1
function hasequipment(ref) {
    if (!isdefined(self.equipment)) {
        if (iscp() && isdefined(self.powers)) {
            foreach (key, value in self.powers) {
                if (key == ref) {
                    return true;
                }
            }
        }
        return false;
    }
    foreach (equippedref in self.equipment) {
        if (equippedref == ref) {
            return true;
        }
    }
    return false;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f9a
// Size: 0x70
function findequipmentslot(ref) {
    if (!isdefined(self.equipment)) {
        return undefined;
    }
    foreach (slot, equippedref in self.equipment) {
        if (equippedref == ref) {
            return slot;
        }
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3011
// Size: 0x13
function isequipmentlethal(ref) {
    return isequipmentprimary(ref);
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x302c
// Size: 0x56
function isequipmentprimary(ref) {
    if (isdefined(ref) && isdefined(level.equipment.table[ref])) {
        return (level.equipment.table[ref].defaultslot == "primary");
    }
    return 0;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3089
// Size: 0x13
function isequipmenttactical(ref) {
    return isequipmentsecondary(ref);
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30a4
// Size: 0x56
function isequipmentsecondary(ref) {
    if (isdefined(ref) && isdefined(level.equipment.table[ref])) {
        return (level.equipment.table[ref].defaultslot == "secondary");
    }
    return 0;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3101
// Size: 0x52
function isequipmentselectable(ref) {
    if (!isdefined(ref)) {
        return 0;
    }
    if (isdefined(level.equipment.table[ref])) {
        return istrue(level.equipment.table[ref].isselectable);
    }
    return 0;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x315a
// Size: 0x114
function function_22bf78eca6578d7d(slot, class) {
    if (!isdefined(self.equipment) || self.equipment.size == 0) {
        return;
    }
    ammo = 0;
    maxammo = 0;
    ref = getcurrentequipment(slot);
    if (isdefined(ref)) {
        ammo = getequipmentslotammo(slot);
        maxammo = getequipmentmaxammo(ref, class);
    }
    if (slot == "primary") {
        self setclientomnvar("ui_power_num_charges", ammo);
        self setpowerammo("primary", ammo, maxammo);
        return;
    }
    if (slot == "secondary") {
        self setclientomnvar("ui_power_secondary_num_charges", ammo);
        self setpowerammo("secondary", ammo, maxammo);
        return;
    }
    if (slot == "health") {
        if (isdefined(self.pers["telemetry"].armor_collected)) {
            self.pers["telemetry"].armor_collected++;
        }
        self setclientomnvar("ui_equipment_id_health_numCharges", ammo, maxammo);
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3275
// Size: 0xb
function equiponplayerspawned() {
    thread watchoffhandfired();
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3287
// Size: 0xd
function resetequipment() {
    self.equipment = [];
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x329b
// Size: 0x21d
function executeoffhandfired(objweapon) {
    foreach (slot, ref in self.equipment) {
        tableinfo = getequipmenttableinfo(ref);
        if (isdefined(tableinfo.objweapon) && objweapon == tableinfo.objweapon) {
            if (issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]()) {
                if (issharedfuncdefined("dlog", "brAnalytics_equipmentUse")) {
                    item_type = "";
                    if (isdefined(tableinfo.bundle) && isdefined(tableinfo.bundle.equipmenttype)) {
                        item_type = tableinfo.bundle.equipmenttype;
                    }
                    [[ getsharedfunc("dlog", "brAnalytics_equipmentUse") ]](self, objweapon, item_type);
                }
            }
            if (issharedfuncdefined("equipment", "getEquipmentRefFromWeapon")) {
                weaponref = [[ getsharedfunc("equipment", "getEquipmentRefFromWeapon") ]](objweapon);
                if (issharedfuncdefined("damage", "combatRecordEquipmentUsed")) {
                    self [[ getsharedfunc("damage", "combatRecordEquipmentUsed") ]](weaponref);
                }
            }
            var_98806ef14e691ff7 = getcallback(ref, "onFired");
            if (isdefined(var_98806ef14e691ff7)) {
                self thread [[ var_98806ef14e691ff7 ]](ref, slot, objweapon);
            }
            ammo = 0;
            ref = getcurrentequipment(slot);
            if (isdefined(ref)) {
                ammo = getequipmentslotammo(slot);
            }
            if (ammo == 0 && isdefined(level.var_87a4731d4dce4c3f)) {
                success = self [[ level.var_87a4731d4dce4c3f ]](self, slot, ref);
                if (istrue(success)) {
                    break;
                }
            }
            function_22bf78eca6578d7d(slot);
            break;
        }
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34bf
// Size: 0x34
function watchoffhandfired() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    while (true) {
        objweapon = self waittill("offhand_fired");
        executeoffhandfired(objweapon);
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34fa
// Size: 0x85
function givescavengerammo() {
    foreach (ref in self.equipment) {
        tableinfo = getequipmenttableinfo(ref);
        if (tableinfo.scavengerammo > 0) {
            incrementequipmentammo(ref, tableinfo.scavengerammo);
        }
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3586
// Size: 0x30
function getdefaultslot(ref) {
    tableinfo = getequipmenttableinfo(ref);
    if (!isdefined(tableinfo)) {
        return undefined;
    }
    return tableinfo.defaultslot;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35be
// Size: 0x12b
function watchlethaldelay() {
    level endon("lethal_delay_end");
    level endon("round_end");
    level endon("game_ended");
    scripts/mp/flags::gameflagwait("prematch_done");
    currentgametypestopsclock = currentgametypestopsclock();
    if (currentgametypestopsclock) {
        level.lethaldelaystarttime = gettime();
    } else if (issharedfuncdefined("game", "getTimePassed")) {
        level.lethaldelaystarttime = [[ getsharedfunc("game", "getTimePassed") ]]();
    }
    if (level.lethaldelay == 0) {
        level.lethaldelayendtime = level.lethaldelaystarttime;
        level notify("lethal_delay_end");
    }
    level.lethaldelayendtime = level.lethaldelaystarttime + level.lethaldelay * 1000;
    level notify("lethal_delay_start");
    while (true) {
        currenttime = undefined;
        if (currentgametypestopsclock) {
            currenttime = gettime();
        } else if (issharedfuncdefined("game", "getTimePassed")) {
            currenttime = [[ getsharedfunc("game", "getTimePassed") ]]();
        }
        if (currenttime >= level.lethaldelayendtime) {
            break;
        }
        waitframe();
    }
    level notify("lethal_delay_end");
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36f0
// Size: 0x119
function watchlethaldelayplayer(equipmentref, slot) {
    self endon("death_or_disconnect");
    level endon("round_end");
    level endon("game_ended");
    if (lethaldelaypassed()) {
        return;
    }
    self notify("watchLethalDelayPlayer_" + slot);
    self endon("watchLethalDelayPlayer_" + slot);
    self endon("equipment_taken_" + equipmentref);
    if (!isdefined(self.lethaldelayallows) || !istrue(self.lethaldelayallows[slot])) {
        if (!isdefined(self.lethaldelayallows)) {
            self.lethaldelayallows = [];
        }
        self.lethaldelayallows[slot] = 1;
        if (slot == "primary ") {
            val::set("watchLethalDelayPlayer", "equipment_primary", 0);
        } else {
            val::set("watchLethalDelayPlayer", "equipment_secondary", 0);
        }
    }
    watchlethaldelayfeedbackplayer(self, slot);
    if (isdefined(self.lethaldelayallows) && istrue(self.lethaldelayallows[slot])) {
        self.lethaldelayallows[slot] = undefined;
        if (self.lethaldelayallows.size == 0) {
            self.lethaldelayallows = undefined;
        }
        val::reset_all("watchLethalDelayPlayer");
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3810
// Size: 0x129
function watchlethaldelayfeedbackplayer(player, slot) {
    level endon("lethal_delay_end");
    if (!istrue(scripts/mp/flags::gameflag("prematch_done"))) {
        level waittill("lethal_delay_start");
    }
    command = "+frag";
    if (slot != "primary") {
        command = "+smoke";
    }
    if (!isai(player)) {
        player notifyonplayercommand("lethal_attempt_" + slot, command);
    }
    currentgametypestopsclock = currentgametypestopsclock();
    while (true) {
        self waittill("lethal_attempt_" + slot);
        currenttime = undefined;
        if (currentgametypestopsclock) {
            currenttime = gettime();
        } else if (issharedfuncdefined("game", "getTimePassed")) {
            currenttime = [[ getsharedfunc("game", "getTimePassed") ]]();
        }
        n = (level.lethaldelayendtime - currenttime) / 1000;
        n = int(max(0, ceil(n)));
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            player [[ getsharedfunc("hud", "showErrorMessage") ]]("MP/LETHALS_UNAVAILABLE_FOR_N", n);
        }
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3940
// Size: 0x6f
function cancellethaldelay() {
    level.lethaldelay = 0;
    if (currentgametypestopsclock()) {
        level.lethaldelaystarttime = gettime();
    } else if (issharedfuncdefined("game", "getTimePassed")) {
        level.lethaldelaystarttime = [[ getsharedfunc("game", "getTimePassed") ]]();
    }
    level.lethaldelayendtime = level.lethaldelaystarttime;
    level notify("lethal_delay_end");
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39b6
// Size: 0x82
function lethaldelaypassed() {
    if (isdefined(level.lethaldelay) && level.lethaldelay == 0) {
        return true;
    }
    if (isdefined(level.lethaldelayendtime)) {
        currenttime = undefined;
        if (currentgametypestopsclock()) {
            currenttime = gettime();
        } else if (issharedfuncdefined("game", "getTimePassed")) {
            currenttime = [[ getsharedfunc("game", "getTimePassed") ]]();
        }
        return (currenttime > level.lethaldelayendtime);
    }
    return false;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a40
// Size: 0x57
function currentgametypestopsclock() {
    if (issharedfuncdefined("game", "getGameType")) {
        gametype = [[ getsharedfunc("game", "getGameType") ]]();
        if (gametype == "hq" || gametype == "grnd" || gametype == "koth") {
            return true;
        }
    }
    return false;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a9f
// Size: 0x8a
function onownerdisconnect(player) {
    if (issharedfuncdefined("equipment", "getAllEquip")) {
        allequip = player [[ getsharedfunc("equipment", "getAllEquip") ]]();
        foreach (equip in allequip) {
            equip notify("owner_disconnect");
        }
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b30
// Size: 0xe7
function hackequipment(hacker) {
    self.ishacked = 1;
    newowner = hacker;
    if (isdefined(hacker.owner) && hacker.equipmentref == "equip_capture_bot") {
        newowner = hacker.owner;
    }
    if (issharedfuncdefined("game", "setHasDoneCombat")) {
        newowner [[ getsharedfunc("game", "setHasDoneCombat") ]](newowner, 1);
    }
    hacker scripts/cp_mp/challenges::onhack(self.equipmentref);
    changeowner(newowner);
    if (level.teambased) {
        self filteroutplayermarks(newowner.team);
    } else {
        self filteroutplayermarks(newowner);
    }
    if (issharedfuncdefined("killstreak", "giveScoreForHack")) {
        newowner [[ getsharedfunc("killstreak", "giveScoreForHack") ]]();
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c1e
// Size: 0x3e
function function_24fce6c89fd2bee3(CaptureBot) {
    if (isdefined(CaptureBot)) {
        if (!isdefined(self.var_134d6db4538498ee)) {
            self.var_134d6db4538498ee = [];
        }
        self.var_134d6db4538498ee[self.var_134d6db4538498ee.size] = CaptureBot;
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c63
// Size: 0x76
function function_f5cbee8dfc1dc4f0(var_2c6dc87bb9f89da0) {
    if (isdefined(self.var_134d6db4538498ee)) {
        foreach (oldbot in self.var_134d6db4538498ee) {
            if (isdefined(var_2c6dc87bb9f89da0) && oldbot == var_2c6dc87bb9f89da0) {
                return false;
            }
        }
    }
    return true;
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ce1
// Size: 0xff
function changeowner(newowner) {
    oldowner = self.owner;
    if (!is_equal(self.turrettype, "sentry_turret")) {
        self setentityowner(newowner);
    }
    self.owner = newowner;
    self.team = newowner.team;
    self setotherent(newowner);
    if (issharedfuncdefined("equipment", "removeEquip")) {
        oldowner [[ getsharedfunc("equipment", "removeEquip") ]](self);
    }
    if (issharedfuncdefined("equipment", "updatePlantedArray")) {
        self.owner [[ getsharedfunc("equipment", "updatePlantedArray") ]](self);
    }
    onOwnerChanged = undefined;
    if (isdefined(self.equipmentref)) {
        onOwnerChanged = getcallback(self.equipmentref, "onOwnerChanged");
    }
    self notify("ownerChanged");
    if (isdefined(onOwnerChanged)) {
        self [[ onOwnerChanged ]](oldowner);
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3de7
// Size: 0x143
function debughackequipment() {
    /#
        setdevdvar(@"hash_aa4a28e418803dd5", 0);
        while (true) {
            if (getdvarint(@"hash_aa4a28e418803dd5") != 0) {
                setdevdvar(@"hash_aa4a28e418803dd5", 0);
                mainplayer = level.players[0];
                enemyplayer = undefined;
                for (i = 1; i < level.players.size; i++) {
                    if (issharedfuncdefined("table_getFlcExtraEquipmentSecondary", "specialty_ninja_vest") && mainplayer [[ getsharedfunc("table_getFlcExtraEquipmentSecondary", "specialty_ninja_vest") ]](level.players[i])) {
                        enemyplayer = level.players[i];
                        break;
                    }
                }
                if (!isdefined(enemyplayer)) {
                    iprintlnbold("hasPlatePouch");
                    continue;
                }
                if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                    allequip = mainplayer [[ getsharedfunc("<unknown string>", "<unknown string>") ]]();
                    equipment = undefined;
                    if (allequip.size > 0) {
                        equipment = allequip[0];
                    }
                    if (!isdefined(equipment)) {
                        iprintlnbold("<unknown string>");
                        continue;
                    }
                    equipment hackequipment(enemyplayer);
                }
            }
            waitframe();
        }
    #/
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f31
// Size: 0xc3
function debugemp() {
    /#
        setdevdvar(@"hash_d39ba2fefaffd043", 0);
        while (true) {
            if (getdvarint(@"hash_d39ba2fefaffd043") != 0) {
                setdevdvar(@"hash_d39ba2fefaffd043", 0);
                if (level.players.size < 2) {
                    iprintlnbold("<unknown string>");
                    continue;
                }
                secondplayer = level.players[1];
                if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                    secondplayer [[ getsharedfunc("<unknown string>", "<unknown string>") ]]("<unknown string>", (0, 0, 0), (0, 0, 0), 0.05, 0);
                }
            }
            waitframe();
        }
    #/
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ffb
// Size: 0x105
function debugempdrone() {
    /#
        setdevdvar(@"hash_a6ef3bcfa25b1aef", 0);
        while (true) {
            if (getdvarint(@"hash_a6ef3bcfa25b1aef") != 0) {
                setdevdvar(@"hash_a6ef3bcfa25b1aef", 0);
                if (level.players.size < 2) {
                    iprintlnbold("<unknown string>");
                    continue;
                }
                firstplayer = level.players[0];
                secondplayer = level.players[1];
                streakinfo = spawnstruct();
                streakinfo.streakname = "<unknown string>";
                streakinfo.owner = secondplayer;
                streakinfo.id = scripts/cp_mp/utility/killstreak_utility::getuniquekillstreakid(secondplayer);
                streakinfo.lifeid = 0;
                targetpos = firstplayer.origin;
                drone = secondplayer scripts/cp_mp/killstreaks/emp_drone_targeted::empdrone_createdrone(streakinfo, targetpos);
            }
            waitframe();
        }
    #/
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4107
// Size: 0xc5
function debugdestroyempdrones() {
    /#
        setdevdvar(@"hash_196b4febb9f4dd1f", 0);
        while (true) {
            if (getdvarint(@"hash_196b4febb9f4dd1f") != 0) {
                setdevdvar(@"hash_196b4febb9f4dd1f", 0);
                foreach (killstreak in level.activekillstreaks) {
                    if (isdefined(killstreak.streakinfo) && killstreak.streakinfo.streakname == "<unknown string>") {
                        killstreak scripts/cp_mp/killstreaks/emp_drone::empdrone_destroy();
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41d3
// Size: 0xc8
function initlethalmaxoffsetmap() {
    level.lethal_equipmentmaskoffsets = [];
    bitindex = 0;
    foreach (equipment in level.equipment.table) {
        if (!equipment.isselectable) {
            continue;
        }
        if (equipment.id <= 0) {
            continue;
        }
        if (equipment.defaultslot == "secondary") {
            continue;
        }
        level.lethal_equipmentmaskoffsets[equipment.ref] = 1 << bitindex;
        bitindex++;
    }
}

// Namespace equipment / namespace_4fb9dddfb8c1a67a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x42a2
// Size: 0xb0
function function_707926e6ce8ddc60(slot, var_317d7e8b927bd393) {
    if (slot == "primary") {
        primary_gren = getcurrentequipment(slot);
        tableinfo = getequipmenttableinfo(primary_gren);
        if (!isdefined(tableinfo)) {
            primary_gren = "equip_frag";
        }
        thread giveequipment(primary_gren, "primary");
        setequipmentammo(primary_gren, var_317d7e8b927bd393);
        return;
    }
    if (slot == "secondary") {
        secondary_gren = getcurrentequipment(slot);
        tableinfo = getequipmenttableinfo(secondary_gren);
        if (!isdefined(tableinfo)) {
            secondary_gren = "equip_flash";
        }
        thread giveequipment(secondary_gren, "secondary");
        setequipmentammo(secondary_gren, var_317d7e8b927bd393);
    }
}

