#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7b2517368c79e5bc;
#using scripts\common\devgui.gsc;
#using scripts\common\callbacks.gsc;
#using script_16ea1b94f0f381b3;

#namespace namespace_6a37cb2f602c62bc;

// Namespace namespace_6a37cb2f602c62bc / namespace_8856bc1b2230283c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e7
// Size: 0x24
function function_fc61ac927e47d181() {
    common_item::function_900f562c61c6a5d6("lootkey", &function_189af61df49b7ea4, &function_272b7fbf2263f898);
    /#
        level thread function_ca829898e71230d5();
    #/
}

// Namespace namespace_6a37cb2f602c62bc / namespace_8856bc1b2230283c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x513
// Size: 0x19c
function function_189af61df49b7ea4(itembundle, item, auto_use) {
    if (istrue(item.var_5ae00139bc8a2d84)) {
        if (isdefined(item.owner) && !utility::is_equal(item.owner, self)) {
            return true;
        }
        item.root delete();
    }
    if (isdefined(self.var_597664e70e3c43a9)) {
        switch (self.var_597664e70e3c43a9) {
        case 0: 
            break;
        case 1: 
            function_119bf86e1d774c3("zmloot_lootkey_medium", self.origin);
            break;
        case 2: 
            function_119bf86e1d774c3("zmloot_lootkey_medium", self.origin);
            break;
        case 3: 
            function_119bf86e1d774c3("zmloot_lootkey_large", self.origin);
            break;
        case 4: 
            function_119bf86e1d774c3("zmloot_lootkey_legendary", self.origin);
            break;
        }
    }
    switch (itembundle.ref) {
    case #"hash_88bb911510381e82": 
        self.var_597664e70e3c43a9 = 1;
        break;
    case #"hash_575c8a32c31dc9dc": 
        self.var_597664e70e3c43a9 = 2;
        break;
    case #"hash_cd9fb59b07d07f3e": 
        self.var_597664e70e3c43a9 = 3;
        break;
    case #"hash_819584034e57bb98": 
        self.var_597664e70e3c43a9 = 4;
        break;
    }
    return false;
}

// Namespace namespace_6a37cb2f602c62bc / namespace_8856bc1b2230283c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b8
// Size: 0x25
function function_272b7fbf2263f898(itembundle, item, autouse, allowswap) {
    return true;
}

// Namespace namespace_6a37cb2f602c62bc / namespace_8856bc1b2230283c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e6
// Size: 0x14
function function_f6db46cf0b187f74() {
    level callback::add("on_zombie_ai_killed", &on_ai_killed);
}

// Namespace namespace_6a37cb2f602c62bc / namespace_8856bc1b2230283c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x702
// Size: 0x78
function on_ai_killed(params) {
    if (istrue(self.var_7a605ee6cf55d136) || istrue(self.var_7e4b076a06c6df27)) {
        return;
    }
    var_cde3aa266f27c24d = "zm_t10_items_lootkeys_all";
    if (!isstartstr(self.subclass, "zombie_base") && !isstartstr(self.subclass, "zombie_vermin")) {
        common_item::function_cd45408bd44fab07(var_cde3aa266f27c24d, 1, self.origin);
    }
}

// Namespace namespace_6a37cb2f602c62bc / namespace_8856bc1b2230283c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x782
// Size: 0x313
function function_246296cd6ad605a6() {
    switch (self.var_597664e70e3c43a9) {
    case 1: 
        if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 65) {
            return "zm_t10_items_lootkey_small_lv6_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 43) {
            return "zm_t10_items_lootkey_small_lv5_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 27) {
            return "zm_t10_items_lootkey_small_lv4_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 16) {
            return "zm_t10_items_lootkey_small_lv3_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 8) {
            return "zm_t10_items_lootkey_small_lv2_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 1) {
            return "zm_t10_items_lootkey_small_lv1_list";
        }
        break;
    case 2: 
        if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 65) {
            return "zm_t10_items_lootkey_medium_lv6_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 43) {
            return "zm_t10_items_lootkey_medium_lv5_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 27) {
            return "zm_t10_items_lootkey_medium_lv4_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 16) {
            return "zm_t10_items_lootkey_medium_lv3_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 8) {
            return "zm_t10_items_lootkey_medium_lv2_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 1) {
            return "zm_t10_items_lootkey_medium_lv1_list";
        }
        break;
    case 3: 
        if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 65) {
            return "zm_t10_items_lootkey_large_lv6_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 43) {
            return "zm_t10_items_lootkey_large_lv5_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 27) {
            return "zm_t10_items_lootkey_large_lv4_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 16) {
            return "zm_t10_items_lootkey_large_lv3_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 8) {
            return "zm_t10_items_lootkey_large_lv2_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 1) {
            return "zm_t10_items_lootkey_large_lv1_list";
        }
        break;
    case 4: 
        if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 65) {
            return "zm_t10_items_lootkey_legendary_lv6_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 43) {
            return "zm_t10_items_lootkey_legendary_lv5_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 27) {
            return "zm_t10_items_lootkey_legendary_lv4_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 16) {
            return "zm_t10_items_lootkey_legendary_lv3_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 8) {
            return "zm_t10_items_lootkey_legendary_lv2_list";
        } else if (namespace_2b1145f62aa835b8::function_560b2e700ce084a2(self.origin) >= 1) {
            return "zm_t10_items_lootkey_legendary_lv1_list";
        }
        break;
    }
}

/#

    // Namespace namespace_6a37cb2f602c62bc / namespace_8856bc1b2230283c
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xa9d
    // Size: 0x2e
    function private function_ca829898e71230d5() {
        devgui::function_6e7290c8ee4f558b("<dev string:x1c>");
        devgui::function_b23a59dfb4ca49a1("<dev string:x2e>", "<dev string:x2e>", &function_9a073c0de12dc4c0);
        devgui::function_fe953f000498048f();
    }

    // Namespace namespace_6a37cb2f602c62bc / namespace_8856bc1b2230283c
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xad3
    // Size: 0x31
    function function_9a073c0de12dc4c0(a_params) {
        common_item::function_cd45408bd44fab07("<dev string:x44>", 9, level.players[0].origin);
    }

#/
