// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_6df6604a74a7a9c7;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using script_7b2517368c79e5bc;
#using script_62acfaf47f2b2183;
#using script_39d11000e476a42a;
#using script_2c0f726c7460dd7d;
#using script_514093b0b1bc6c7;
#using script_3532f3f421f0fb30;
#using script_4ec1f077d469d998;
#using script_7f5c2d05110a69d7;
#using script_651687133740824b;
#using script_5a224ab309675874;
#using script_743044ca6462db02;
#using script_482376d10f69832c;

#namespace namespace_8eedd8f6cf5d9f19;

// Namespace namespace_8eedd8f6cf5d9f19/namespace_d0c78bdaf71b04f6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x341
// Size: 0x1d5
function init() {
    wait(5);
    var_2159767bd47c8885 = [];
    level thread namespace_fcdac53e90589a14::function_de6fbb5c61ddf941();
    var_9de08ee3725b43 = function_f168c1066111dc6b("mrp_challenge");
    if (isdefined(var_9de08ee3725b43)) {
        n_max = min(4, var_9de08ee3725b43.size);
        foreach (mrp in var_9de08ee3725b43) {
            if (var_2159767bd47c8885.size >= n_max && !getdvarint(@"hash_b0de5de525b2f8c6", 0)) {
                break;
            }
            if (isdefined(mrp.script_noteworthy) && (!array_contains(var_2159767bd47c8885, mrp.script_noteworthy) || getdvarint(@"hash_b0de5de525b2f8c6", 1))) {
                var_2159767bd47c8885 = array_add(var_2159767bd47c8885, mrp.script_noteworthy);
                switch (mrp.script_noteworthy) {
                case #"hash_9c9718907c886967":
                    level thread namespace_ae612cf681deb69f::init(mrp);
                    break;
                case #"hash_c34ae2e2ec556275":
                    level thread namespace_634b04db85eaefa7::init(mrp);
                    break;
                case #"hash_f7acd68d93374a0":
                    level thread namespace_bc4759f7a32ebd96::init(mrp);
                    break;
                case #"hash_a03c0ff2acd7c9ae":
                    level thread namespace_e9b0ed286e0145cc::init(mrp);
                    break;
                case #"hash_2290532610b16f":
                    level thread namespace_db605e7dcda0ea09::init(mrp);
                    break;
                case #"hash_871e50221dfed5cb":
                    level thread namespace_7e65c44dbe99b93d::init(mrp);
                    break;
                case #"hash_757d227d3facbc6":
                    level thread namespace_9ea631c76b6bef2c::init(mrp);
                    break;
                case #"hash_7590c5e388808334":
                    level thread namespace_9b230bed5d2cbd7a::init(mrp);
                    break;
                }
            }
        }
    }
}

// Namespace namespace_8eedd8f6cf5d9f19/namespace_d0c78bdaf71b04f6
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x51d
// Size: 0xbd
function private function_d387ff09ed5d415(rewards, reward_struct) {
    /#
        assertex(isdefined(rewards), "No rewards defined for MRP Challenge!");
    #/
    /#
        assertex(isdefined(reward_struct), "No reward_struct defined for spawning rewards!");
    #/
    if (isdefined(rewards)) {
        foreach (reward in rewards) {
            var_9ec97bdad14a0a5b = function_61d960957fcf3ca0(reward);
            var_c1c3ecdd33dec5b7 = getscriptbundle("itemspawnentry:" + var_9ec97bdad14a0a5b);
            function_c465d27f3f6066b4(var_c1c3ecdd33dec5b7, reward_struct.origin);
        }
    }
}

// Namespace namespace_8eedd8f6cf5d9f19/namespace_d0c78bdaf71b04f6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e1
// Size: 0xa1
function function_a4dfabe55dd4a652(players, reward_struct, rewards, var_ecfd7797227a5ade) {
    var_2c06da1b550fc8fb = function_77e93c78c6c685c3(players);
    if (istrue(var_ecfd7797227a5ade)) {
        if (isarray(players)) {
            player = players[0];
        } else {
            player = players;
        }
        reward_struct = namespace_bd7428f3122be80f::function_3ae7f99339b96499(player.origin, 1);
    }
    var_ed118e6dd8c246 = spawnstruct();
    var_ed118e6dd8c246.rewards = rewards;
    namespace_e8853d3344e33cf6::function_863be9e39e19fe2f([0:var_2c06da1b550fc8fb], reward_struct, &function_6c8d574fc2049e38, var_ed118e6dd8c246);
}

// Namespace namespace_8eedd8f6cf5d9f19/namespace_d0c78bdaf71b04f6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x689
// Size: 0x8d
function private function_77e93c78c6c685c3(players) {
    /#
        assertex(isdefined(players), "No Players defined for MRP reward groups!");
    #/
    if (!isarray(players)) {
        return [0:players];
    } else {
        var_2c06da1b550fc8fb = [];
        foreach (player in players) {
            var_2c06da1b550fc8fb[var_2c06da1b550fc8fb.size] = [0:player];
        }
        return var_2c06da1b550fc8fb;
    }
}

// Namespace namespace_8eedd8f6cf5d9f19/namespace_d0c78bdaf71b04f6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x71d
// Size: 0x127
function private function_6c8d574fc2049e38(var_ed118e6dd8c246) {
    rewards = var_ed118e6dd8c246.rewards;
    /#
        assertex(isdefined(rewards), "No rewards defined for MRP Challenge!");
    #/
    contents = [];
    if (!isarray(rewards)) {
        rewards = namespace_2abc885019e1956::function_bc2f4857c90f5344(rewards, 1);
    }
    foreach (reward in rewards) {
        item = spawnstruct();
        itembundle = getscriptbundle("itemspawnentry:" + reward);
        if (isdefined(itembundle)) {
            item.lootid = function_6d15e119c2779a93(itembundle);
        } else {
            item.lootid = function_2c836ad05e5f634c(reward);
        }
        if (!isdefined(item.lootid)) {
            /#
                assertmsg(reward + " found no valid loot ID");
            #/
        } else {
            item.quantity = 1;
            contents[contents.size] = item;
        }
    }
    return contents;
}

// Namespace namespace_8eedd8f6cf5d9f19/namespace_d0c78bdaf71b04f6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x84c
// Size: 0x3f
function private function_f168c1066111dc6b(str_targetname) {
    var_9de08ee3725b43 = getstructarray(str_targetname, "targetname");
    /#
        assertex(isdefined(var_9de08ee3725b43), "No MRP challenge structs found with targetname: " + str_targetname);
    #/
    var_9de08ee3725b43 = array_randomize(var_9de08ee3725b43);
    return var_9de08ee3725b43;
}

// Namespace namespace_8eedd8f6cf5d9f19/namespace_d0c78bdaf71b04f6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x893
// Size: 0x4d
function function_441cb85860275371(str_targetname) {
    var_9de08ee3725b43 = getstructarray(str_targetname, "targetname");
    /#
        assertex(isdefined(var_9de08ee3725b43), "No MRP challenge structs found with targetname: " + str_targetname);
    #/
    var_9de08ee3725b43 = array_randomize(var_9de08ee3725b43);
    var_5179c48492d1d2c2 = var_9de08ee3725b43[0];
    return var_5179c48492d1d2c2;
}

// Namespace namespace_8eedd8f6cf5d9f19/namespace_d0c78bdaf71b04f6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e8
// Size: 0x114
function function_698513ab21b7913d(trigger_struct) {
    /#
        assertex(isdefined(trigger_struct), "No Trigger Struct to spawn trigger volume!");
    #/
    struct = trigger_struct;
    if (isdefined(struct.trigger_offset)) {
        offset = function_f1a89ba11a934119(struct.trigger_offset);
    }
    if (isdefined(struct.var_5aecf2b796ff4569)) {
        size = function_f1a89ba11a934119(struct.var_5aecf2b796ff4569);
    }
    offset = function_53c4c53197386572(offset, (0, 0, 0));
    size = function_53c4c53197386572(size, (100, 100, 100)) / 2;
    trigger_box = spawn("trigger_box", struct.origin + offset, 0, size, size + (1, 1, 1));
    if (isdefined(struct.angles)) {
        trigger_box.angles = trigger_struct.angles;
    }
    /#
        thread function_ca53007eead9ab91(trigger_box, size);
    #/
    return trigger_box;
}

// Namespace namespace_8eedd8f6cf5d9f19/namespace_d0c78bdaf71b04f6
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa04
// Size: 0x6c
function private function_ca53007eead9ab91(trigger_box, size) {
    while (isdefined(trigger_box)) {
        if (getdvar(@"hash_c5d685aed005b663", "0") == "1") {
            /#
                orientedbox(trigger_box.origin, size * 2, trigger_box.angles, (0, 0, 1), 0, 1);
            #/
        }
        waitframe();
    }
}

// Namespace namespace_8eedd8f6cf5d9f19/namespace_d0c78bdaf71b04f6
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa77
// Size: 0xac
function function_efabc5ae0422de9e(var_5179c48492d1d2c2, var_a26da51362334cba, var_cd091563de458dab, state, var_99f465b7b6dee8a3) {
    if (!isdefined(var_cd091563de458dab)) {
        var_cd091563de458dab = undefined;
    }
    if (!isdefined(var_99f465b7b6dee8a3)) {
        var_99f465b7b6dee8a3 = "ob_mrp";
    }
    if (!isdefined(var_5179c48492d1d2c2.models)) {
        var_5179c48492d1d2c2.models = [];
    }
    if (!isdefined(var_cd091563de458dab)) {
        var_cd091563de458dab = var_5179c48492d1d2c2;
    }
    var_302e67a0664597b8 = spawn_model(var_99f465b7b6dee8a3, var_cd091563de458dab.origin, var_cd091563de458dab.angles);
    var_5179c48492d1d2c2.models = array_add(var_5179c48492d1d2c2.models, var_302e67a0664597b8);
}

// Namespace namespace_8eedd8f6cf5d9f19/namespace_d0c78bdaf71b04f6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2a
// Size: 0x70
function function_568b8a57e0fa955f(var_5179c48492d1d2c2, players, var_e7b76f74b7e52f7a, var_ed61113e61cacb81) {
    var_e7b76f74b7e52f7a = function_53c4c53197386572(var_e7b76f74b7e52f7a, 1.5);
    if (isarray(players)) {
        player = players[0];
    } else {
        player = players;
    }
    if (!isdefined(var_ed61113e61cacb81)) {
        var_ed61113e61cacb81 = player;
    }
    player playsoundtoplayer("evt_ob_mrpeeks_stinger_activation", player, var_ed61113e61cacb81);
    wait(var_e7b76f74b7e52f7a);
    thread function_b45bf4286ea46388(var_5179c48492d1d2c2);
}

// Namespace namespace_8eedd8f6cf5d9f19/namespace_d0c78bdaf71b04f6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xba1
// Size: 0x129
function private function_b45bf4286ea46388(var_5179c48492d1d2c2) {
    var_49be397604490d05 = [];
    foreach (ent_model in var_5179c48492d1d2c2.models) {
        var_49be397604490d05[var_49be397604490d05.size] = spawnscriptable("ob_mrp_vanish", ent_model.origin);
    }
    wait(0.75);
    foreach (ent_model in var_5179c48492d1d2c2.models) {
        ent_model delete();
    }
    wait(0.5);
    foreach (scriptable in var_49be397604490d05) {
        scriptable freescriptable();
    }
}

// Namespace namespace_8eedd8f6cf5d9f19/namespace_d0c78bdaf71b04f6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd1
// Size: 0x68
function function_f1a89ba11a934119(string) {
    var_6b0f78d112f40eb9 = function_fafbb41e088ecb77(string, ",");
    if (var_6b0f78d112f40eb9.size != 3) {
        /#
            assertex(var_6b0f78d112f40eb9.size != 3, "Too few/many values to convert to vector3");
        #/
        return;
    }
    var_b483444ca727bad7 = function_996b01cd49d0128d(var_6b0f78d112f40eb9, " ");
    vector = stringtovec3(var_b483444ca727bad7);
    return vector;
}
