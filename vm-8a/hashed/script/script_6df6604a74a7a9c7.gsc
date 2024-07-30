#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;

#namespace namespace_6c6964e55ab1bec8;

// Namespace namespace_6c6964e55ab1bec8 / namespace_8297ef197f3d67e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x90
// Size: 0x31
function get_linked_struct() {
    array = get_linked_structs();
    assert(array.size == 1);
    assert(isdefined(array[0]));
    return array[0];
}

// Namespace namespace_6c6964e55ab1bec8 / namespace_8297ef197f3d67e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xca
// Size: 0x31
function get_linked_vehicle_node() {
    array = get_linked_vehicle_nodes();
    assert(array.size == 1);
    assert(isdefined(array[0]));
    return array[0];
}

// Namespace namespace_6c6964e55ab1bec8 / namespace_8297ef197f3d67e1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104
// Size: 0x5a
function function_98123b667b8f7daa(value, key) {
    array = [];
    filtered_nodes = getvehiclenodearray(value, key);
    if (isdefined(self.script_linkto)) {
        linked_nodes = get_linked_vehicle_nodes();
        array = array_intersection(linked_nodes, filtered_nodes);
    }
    return array;
}

// Namespace namespace_6c6964e55ab1bec8 / namespace_8297ef197f3d67e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x167
// Size: 0x44
function function_90f7f7052df0614b(value, key) {
    array = function_98123b667b8f7daa(value, key);
    assert(array.size == 1);
    assert(isdefined(array[0]));
    return array[0];
}

// Namespace namespace_6c6964e55ab1bec8 / namespace_8297ef197f3d67e1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4
// Size: 0xa9
function function_954eb52ab4cdeb46(value, key) {
    array = [];
    filtered_structs = getstructarray(value, key);
    if (isdefined(self.script_linkto)) {
        linknames = get_links();
        for (i = 0; i < linknames.size; i++) {
            linked_structs = getstructarray(linknames[i], "script_linkname");
            structs = array_intersection(linked_structs, filtered_structs);
            if (structs.size > 0) {
                array = array_combine(array, structs);
            }
        }
    }
    return array;
}

// Namespace namespace_6c6964e55ab1bec8 / namespace_8297ef197f3d67e1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x266
// Size: 0x36
function function_98edf48d14333f3f(value, key) {
    array = function_954eb52ab4cdeb46(value, key);
    if (array.size > 0) {
        return array[0];
    }
    return undefined;
}

// Namespace namespace_6c6964e55ab1bec8 / namespace_8297ef197f3d67e1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a4
// Size: 0xa7
function function_2ccdcbc0a0056226(value, key) {
    array = [];
    filtered_ents = getentarray(value, key);
    if (isdefined(self.script_linkto)) {
        linknames = get_links();
        for (i = 0; i < linknames.size; i++) {
            linked_ents = getentarray(linknames[i], "script_linkname");
            ents = array_intersection(linked_ents, filtered_ents);
            if (ents.size > 0) {
                array = array_combine(array, ents);
            }
        }
    }
    return array;
}

// Namespace namespace_6c6964e55ab1bec8 / namespace_8297ef197f3d67e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x354
// Size: 0x44
function function_45c24888c616581f(value, key) {
    array = function_2ccdcbc0a0056226(value, key);
    assert(array.size == 1);
    assert(isdefined(array[0]));
    return array[0];
}

// Namespace namespace_6c6964e55ab1bec8 / namespace_8297ef197f3d67e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3a1
// Size: 0x44
function function_53b040ee753f26b1(value, key) {
    array = function_50b5e4fcc500bb90(value, key);
    assert(array.size == 1);
    assert(isdefined(array[0]));
    return array[0];
}

// Namespace namespace_6c6964e55ab1bec8 / namespace_8297ef197f3d67e1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ee
// Size: 0xf0
function function_50b5e4fcc500bb90(value, key) {
    array = [];
    var_8d08e5afdc964181 = [];
    var_a2e2c8edb4508f35 = getscriptablearray(value, key);
    var_7815a6f6f10f4cd4 = getentitylessscriptablearray(value, key);
    var_8d08e5afdc964181 = array_combine_unique(var_a2e2c8edb4508f35, var_7815a6f6f10f4cd4);
    if (isdefined(self.script_linkto)) {
        linknames = get_links();
        for (i = 0; i < linknames.size; i++) {
            var_3a6b6499601b4cfb = [];
            var_a2e2c8edb4508f35 = getscriptablearray(linknames[i], "script_linkname");
            var_7815a6f6f10f4cd4 = getentitylessscriptablearray(linknames[i], "script_linkname");
            var_3a6b6499601b4cfb = array_combine_unique(var_a2e2c8edb4508f35, var_7815a6f6f10f4cd4);
            scriptables = array_intersection(var_3a6b6499601b4cfb, var_8d08e5afdc964181);
            if (scriptables.size > 0) {
                array = array_combine(array, scriptables);
            }
        }
    }
    return array;
}

// Namespace namespace_6c6964e55ab1bec8 / namespace_8297ef197f3d67e1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e7
// Size: 0xa8
function function_a230870ff680af93(value, key) {
    array = [];
    filtered_volumes = function_f159c10d5cf8f0b4(value, key);
    if (isdefined(self.script_linkto)) {
        linknames = get_links();
        for (i = 0; i < linknames.size; i++) {
            for (j = 0; j < filtered_volumes.size; j++) {
                if (is_equal(linknames[i], filtered_volumes[j].script_linkname)) {
                    array = array_add(array, filtered_volumes[j]);
                }
            }
        }
    }
    return array;
}
