// mwiii decomp prototype
#using scripts\mp\gametypes\br.gsc;

#namespace ftue_inventory;

// Namespace ftue_inventory / namespace_80da074a96524381
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1
// Size: 0x15
function function_59ded31f4834f8de(callback) {
    function_38202445901a52d4(callback, 0);
}

// Namespace ftue_inventory / namespace_80da074a96524381
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfd
// Size: 0x16
function function_7d664ce89c1009ca(callback) {
    function_38202445901a52d4(callback, 1);
}

// Namespace ftue_inventory / namespace_80da074a96524381
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11a
// Size: 0x1d
function function_85ddcac5eded3985(itemindex, callback) {
    function_6c2a61aa8ec80c16(itemindex, callback);
}

// Namespace ftue_inventory / namespace_80da074a96524381
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13e
// Size: 0x1d
function function_bd09b7d6832880c4(callback, itemtype) {
    function_13aee3d35bd71f6b(callback, itemtype);
}

// Namespace ftue_inventory / namespace_80da074a96524381
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x162
// Size: 0x5f
function private function_38202445901a52d4(callback, typeaction) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    while (true) {
        channel, action = self waittill("luinotifyserver");
        if (channel == "inventory_action") {
            if (action == typeaction) {
                self [[ callback ]]();
                return;
            }
        }
        waitframe();
    }
}

// Namespace ftue_inventory / namespace_80da074a96524381
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c8
// Size: 0x6b
function private function_6c2a61aa8ec80c16(item, callback) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    /#
        assert(isdefined(item));
    #/
    while (true) {
        channel, itemindex = self waittill("luinotifyserver");
        if (channel == "inventory_select_option") {
            if (item == itemindex) {
                self [[ callback ]](itemindex);
                return;
            }
        }
        waitframe();
    }
}

// Namespace ftue_inventory / namespace_80da074a96524381
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23a
// Size: 0xb7
function private function_13aee3d35bd71f6b(callback, itemtype) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    while (true) {
        channel, id = self waittill("luinotifyserver");
        if (channel != "drop_all_items" && channel != "drop_item") {
            continue;
        }
        dropall = channel == "drop_all_items";
        itemtypedropped = function_86081f65c04e8ebe(id);
        itemindexdropped = function_ab41acc7ac2f6642(id);
        if (isdefined(itemtype)) {
            if (itemtypedropped == itemtype) {
                self [[ callback ]](id, itemtypedropped, itemindexdropped, dropall);
            }
            return;
        }
        self [[ callback ]](id, itemtypedropped, itemindexdropped, dropall);
        return;
    }
}

