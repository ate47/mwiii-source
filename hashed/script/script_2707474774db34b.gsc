// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_54f6d121e91434f8;
#using script_41387eecc35b88bf;
#using script_220d0eb95a8fab7d;
#using script_185660037b9236c1;
#using script_7956d56c4922bd1;
#using script_4fdefae8b7bcdf73;
#using script_3ab210ea917601e7;
#using script_3ac7886f9e4eceef;
#using script_24f248b33b79e48d;
#using script_58be75c518bf0d40;
#using script_76cc264b397db9cb;
#using scripts\mp\utility\teams.gsc;

#namespace namespace_553c3c813ee2de54;

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34d
// Size: 0x91
function function_c993d376e8f10816(var_d3f89f07fe3fa0ab) {
    function_84ac3d5c82b5ba3c();
    callback::add("player_connect", &function_e5594507f84bc271);
    callback::add("player_death", &function_f0ab0b7c533f4200);
    var_d3f89f07fe3fa0ab.var_ee5a705921acf056 = spawnstruct();
    var_d3f89f07fe3fa0ab.var_ee5a705921acf056 function_a1f71337a6844055();
    function_45945c0e6cfb54cd(var_d3f89f07fe3fa0ab.var_ee5a705921acf056, &function_935c3f2efd9c2a4a, []);
    function_45945c0e6cfb54cd(var_d3f89f07fe3fa0ab.var_ee5a705921acf056, &function_2febe1d03af425f7, []);
    level thread function_dfae5859962924f2();
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e5
// Size: 0x28
function function_1f99e5a11b5e285b(player) {
    if (!function_6152021549f1836b(player)) {
        player.var_83abcb9b3a5dbe24 = function_fb0ef9f4034927f8();
    }
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x414
// Size: 0x18
function function_6152021549f1836b(player) {
    return isdefined(player.var_83abcb9b3a5dbe24);
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x434
// Size: 0x29
function function_5cc2fd3d10cbab56(player) {
    if (!function_6152021549f1836b(player)) {
        function_1f99e5a11b5e285b(player);
    }
    return player.var_83abcb9b3a5dbe24;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x465
// Size: 0xaa
function function_dfae5859962924f2() {
    level endon("game_ended");
    var_84136076a28f85b4 = spawnstruct();
    var_186eafd5a207b951 = function_a5424c44da084d6e();
    var_84136076a28f85b4.var_186eafd5a207b951 = var_186eafd5a207b951;
    while (!isdefined(level.players) && !isarray(level.players)) {
        waitframe();
    }
    while (1) {
        var_be685114ee68c2f3 = gettime();
        var_84136076a28f85b4 function_ec65095e6f342856(level.players, &function_512997cf3f5c2f8a, &function_ef2b4cd10b36a1ae, undefined, 2, 0);
        var_de12597002155e64 = gettime();
        if (var_be685114ee68c2f3 == var_de12597002155e64) {
            waitframe();
        }
    }
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x516
// Size: 0xdc
function function_dacf6dd70b828aad(player) {
    var_d7ad79a8e4f34d8d = undefined;
    closestdistance = undefined;
    var_32a6f9b3d487152d = function_553a690e1064cf0b(player);
    foreach (var_fb5fdfafc29f4513, var_d13c18af4084bdfd in var_32a6f9b3d487152d) {
        var_e6013eac45290cab = function_1f3e343912ae15c5(var_fb5fdfafc29f4513);
        var_569be6523b311f57 = distancesquared(player.origin, namespace_68dc261109a9503f::function_8988a4c89289d7f4(self));
        if (!isdefined(var_d7ad79a8e4f34d8d) || !isdefined(closestdistance) || var_569be6523b311f57 < closestdistance) {
            closestdistance = var_569be6523b311f57;
            var_d7ad79a8e4f34d8d = var_fb5fdfafc29f4513;
        }
    }
    if (isdefined(var_d7ad79a8e4f34d8d)) {
        return function_1f3e343912ae15c5(var_d7ad79a8e4f34d8d);
    }
    return undefined;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fa
// Size: 0x120
function function_51c944aa48d1ce48(player, var_4224a1fc6427bcc7) {
    if (function_2a1e9879f71ab677(@"hash_15cad8df54bccf1e")) {
        var_9aa1dc750ab65865 = function_deb5a4d2a7bda5e9(player);
        if (isdefined(var_9aa1dc750ab65865)) {
            var_7e76b70b5d53db36 = "Player Switched their Focus away from: " + function_68e0a0bea0dd792c(var_9aa1dc750ab65865) + " and onto: " + function_68e0a0bea0dd792c(var_4224a1fc6427bcc7);
            function_c662924b60a37407(var_7e76b70b5d53db36, @"hash_15cad8df54bccf1e", undefined, [0:player]);
        }
    }
    function_7a68246baec59148(player);
    var_871df5c434cefb0a = function_f0f498aed6f8fa5d(var_4224a1fc6427bcc7);
    var_32a6f9b3d487152d = function_553a690e1064cf0b(player);
    var_a5e113e92237f95a = var_32a6f9b3d487152d[var_871df5c434cefb0a];
    var_f06fa9ff431c0089 = istrue(var_a5e113e92237f95a.var_ab4cdd1bcafb1dff);
    player function_6fefd7e95fdfcc89(var_4224a1fc6427bcc7);
    if (var_f06fa9ff431c0089) {
        var_6f8af5eb76deac21 = spawnstruct();
        var_6f8af5eb76deac21.playerlist = [0:player];
        function_735ee8e9d0f1b00b(var_4224a1fc6427bcc7, "PlayerRefocusedOnActivity", var_6f8af5eb76deac21);
    }
    function_261533bdcfe64be0(player, var_4224a1fc6427bcc7);
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x721
// Size: 0x5d
function function_d10ee44b55e7d8d4(player) {
    var_21fe41e9dbb5c0fb = function_71e9ad7d057fc10d(player);
    if (isdefined(var_21fe41e9dbb5c0fb)) {
        var_3c214072a74a856c = function_f0f498aed6f8fa5d(var_21fe41e9dbb5c0fb);
        var_69605a92b368f137 = player function_b9a4c528a6fd77cf();
        if (!isdefined(var_69605a92b368f137) || var_3c214072a74a856c != var_69605a92b368f137) {
            function_51c944aa48d1ce48(player, var_21fe41e9dbb5c0fb);
        }
    }
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x785
// Size: 0x20
function function_3e82ebe92b9fa877(player) {
    var_1c69f70de3a758f1 = player function_b9a4c528a6fd77cf();
    return isdefined(var_1c69f70de3a758f1);
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ad
// Size: 0x41
function function_9a5bdd69b1e544f9(player, var_e6013eac45290cab) {
    var_1c69f70de3a758f1 = player function_b9a4c528a6fd77cf();
    if (!isdefined(var_1c69f70de3a758f1) || var_1c69f70de3a758f1 != var_e6013eac45290cab.id) {
        return 0;
    }
    return 1;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f6
// Size: 0x53
function function_bfda021631854371(player, var_af0662d6485d5d58) {
    var_69605a92b368f137 = player function_b9a4c528a6fd77cf();
    if (isdefined(var_69605a92b368f137)) {
        var_2d25d18d189a363a = function_1f3e343912ae15c5(var_69605a92b368f137);
        if (isdefined(var_2d25d18d189a363a) && function_de53ed8e35d0ed7a(var_2d25d18d189a363a) == var_af0662d6485d5d58) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x851
// Size: 0x35
function function_7a68246baec59148(player) {
    var_a0a8cc91d4f7cb2d = function_deb5a4d2a7bda5e9(player);
    if (isdefined(var_a0a8cc91d4f7cb2d)) {
        function_575933e868e5c6e8(player, var_a0a8cc91d4f7cb2d);
    }
    player function_69f5f64b2f31e8c3(undefined);
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88d
// Size: 0x3c
function function_47e109e0d8027d54(player, var_e6013eac45290cab) {
    if (function_71d38726159c3f12(6)) {
        return function_f541e4e4edaa8e99(6, [0:var_e6013eac45290cab, 1:player], 0);
    }
    return function_ff52316e5fb7e838(player, var_e6013eac45290cab);
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d1
// Size: 0x34
function function_575933e868e5c6e8(player, var_e6013eac45290cab) {
    var_e6013eac45290cab function_2d38888e45d6a28a(player);
    var_e6013eac45290cab function_94050b71cb4ef1ca([0:player]);
    function_4f871ff9eb56f17(player, var_e6013eac45290cab);
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90c
// Size: 0x34
function function_261533bdcfe64be0(player, var_e6013eac45290cab) {
    var_e6013eac45290cab function_947973be56e0dbb2([0:player]);
    var_e6013eac45290cab function_451ffc1b7133042f(player);
    function_39cdb60af8e36365(player, var_e6013eac45290cab);
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x947
// Size: 0x29
function function_1c121cfcda39970d(player) {
    var_3900d8bea91376b4 = function_5cc2fd3d10cbab56(player);
    return var_3900d8bea91376b4.var_3fa28f1ee9e5c83;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x978
// Size: 0x2c
function function_deb5a4d2a7bda5e9(player) {
    var_6346961d07f668fe = player function_b9a4c528a6fd77cf();
    if (isdefined(var_6346961d07f668fe)) {
        return function_1f3e343912ae15c5(var_6346961d07f668fe);
    }
    return undefined;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ac
// Size: 0x89
function function_1015815db0b598c2(player, var_e6013eac45290cab) {
    var_70f3847419563c37 = spawnstruct();
    var_3900d8bea91376b4 = function_5cc2fd3d10cbab56(player);
    var_3900d8bea91376b4.var_3fa28f1ee9e5c83[var_3900d8bea91376b4.var_3fa28f1ee9e5c83.size] = var_70f3847419563c37;
    var_70f3847419563c37.success = function_bdd22095c4312f34(var_e6013eac45290cab);
    var_70f3847419563c37.var_af0662d6485d5d58 = function_de53ed8e35d0ed7a(var_e6013eac45290cab);
    var_70f3847419563c37.var_626b45032e1892da = function_a4748b32a824c79c(var_e6013eac45290cab);
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa3c
// Size: 0x51
function function_973730f0a5275485(player, params) {
    /#
        assertex(params.size == 1 && isdefined(params[0]), "The first parameter for this broadcastInstance conditional function should be an Activity Instance");
    #/
    var_e6013eac45290cab = params[0];
    var_1206ca5d90319311 = function_9a5bdd69b1e544f9(player, var_e6013eac45290cab);
    return var_1206ca5d90319311;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa95
// Size: 0x69
function function_d49dc10646971d24(player, params) {
    /#
        assertex(params.size == 1 && isdefined(params[0]), "The first parameter for this broadcastInstance conditional function should be an Activity Instance");
    #/
    var_e6013eac45290cab = params[0];
    var_1206ca5d90319311 = function_9a5bdd69b1e544f9(player, var_e6013eac45290cab);
    var_2cfbf3c881517abf = isdefined(player function_b9a4c528a6fd77cf());
    return var_1206ca5d90319311 || !var_2cfbf3c881517abf;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb06
// Size: 0x3d
function function_2febe1d03af425f7(player, params) {
    var_3c2942567059c7bb = player function_1622a54acd6019d6();
    var_5529eb88d67ca2df = !isdefined(var_3c2942567059c7bb) || var_3c2942567059c7bb > 10;
    return var_5529eb88d67ca2df;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4b
// Size: 0x2d
function function_3b6f0ac301030549(player, params) {
    var_1eeab92b9ab50bde = isdefined(player.var_2fa5b49969def47);
    return !var_1eeab92b9ab50bde;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb80
// Size: 0x20
function function_388f018d407adc40(player, params) {
    return isdefined(player) && isplayer(player);
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba8
// Size: 0x12c
function function_bc33f8483c604d9b(player, params) {
    /#
        assertex(params.size == 2 && isdefined(params[0]) && isdefined(params[1]), "The first parameter for this broadcastInstance conditional function should be an Activity Instance");
    #/
    var_21a51c1826b9a6aa = params[0];
    var_e6013eac45290cab = params[1];
    if (!isdefined(var_21a51c1826b9a6aa.var_ec75cb30b9c76451)) {
        return 1;
    }
    var_a84449a9bd492279 = namespace_c47da9d4c2db4f0d::function_c24185c47d989c1a(var_21a51c1826b9a6aa.var_ec75cb30b9c76451);
    if (var_a84449a9bd492279 != "PlayerJoin") {
        return 1;
    }
    lastassimedplayer = undefined;
    if (namespace_ca7b90256548aa40::issquadmode() && namespace_9bb409deb69fb31d::function_be6ce63a202791c5(player.team, player.var_ff97225579de16a, "lastAssimedPlayer")) {
        lastassimedplayer = namespace_9bb409deb69fb31d::function_2026e82470c5c89f(player.team, player.var_ff97225579de16a, "lastAssimedPlayer");
    } else if (namespace_54d20dd0dd79277f::function_ef7cf07ba921200e(player.team, "lastAssimedPlayer")) {
        lastassimedplayer = namespace_54d20dd0dd79277f::getteamdata(player.team, "lastAssimedPlayer");
    }
    if (!isdefined(lastassimedplayer)) {
        return 1;
    }
    return player == lastassimedplayer;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdc
// Size: 0x59
function function_7b4d0a8fdbbf4193(player, var_e6013eac45290cab) {
    var_fb5fdfafc29f4513 = function_f0f498aed6f8fa5d(var_e6013eac45290cab);
    var_32a6f9b3d487152d = function_553a690e1064cf0b(player);
    var_d13c18af4084bdfd = var_32a6f9b3d487152d[var_fb5fdfafc29f4513];
    if (isdefined(var_d13c18af4084bdfd)) {
        return istrue(var_d13c18af4084bdfd.var_2cbce2fd25a1eac2);
    }
    return 0;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3d
// Size: 0x59
function function_d5c655d706be5a5a(player, var_e6013eac45290cab) {
    var_fb5fdfafc29f4513 = function_f0f498aed6f8fa5d(var_e6013eac45290cab);
    var_32a6f9b3d487152d = function_553a690e1064cf0b(player);
    var_d13c18af4084bdfd = var_32a6f9b3d487152d[var_fb5fdfafc29f4513];
    if (isdefined(var_d13c18af4084bdfd)) {
        var_d13c18af4084bdfd.var_2cbce2fd25a1eac2 = 1;
    }
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9d
// Size: 0x58
function function_15b9cdad6fea7395(player, var_e6013eac45290cab) {
    var_fb5fdfafc29f4513 = function_f0f498aed6f8fa5d(var_e6013eac45290cab);
    var_32a6f9b3d487152d = function_553a690e1064cf0b(player);
    var_d13c18af4084bdfd = var_32a6f9b3d487152d[var_fb5fdfafc29f4513];
    if (isdefined(var_d13c18af4084bdfd)) {
        var_d13c18af4084bdfd.var_2cbce2fd25a1eac2 = 0;
    }
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfc
// Size: 0xae
function function_5ce919b476495152(players, var_e6013eac45290cab, omnvar, value, var_6040010016e75d95) {
    if (!isdefined(value)) {
        function_c662924b60a37407("Could not set given value for Omnvar: " + omnvar + " because it was undefined.", @"hash_22e4e38cab273e93", var_e6013eac45290cab, players);
        return;
    }
    foreach (player in players) {
        player setclientomnvar(omnvar, value);
    }
    function_26857d3de8354d4e(var_e6013eac45290cab, omnvar, value, var_6040010016e75d95);
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xeb1
// Size: 0x6a
function function_94b6d84e134ecb15(player, var_e6013eac45290cab, omnvar, value, var_6040010016e75d95) {
    if (!isdefined(value)) {
        function_c662924b60a37407("Could not set given value for Omnvar: " + omnvar + " because it was undefined.", @"hash_22e4e38cab273e93", var_e6013eac45290cab, [0:player]);
        return;
    }
    player setclientomnvar(omnvar, value);
    function_26857d3de8354d4e(var_e6013eac45290cab, omnvar, value, var_6040010016e75d95);
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf22
// Size: 0x88
function function_39cdb60af8e36365(player, var_e6013eac45290cab) {
    var_14a8920a25d8a7a1 = function_b1e0c431ac8df0ed(var_e6013eac45290cab);
    foreach (var_3b070ee0304422a8 in var_14a8920a25d8a7a1) {
        var_43da99ac87368416 = function_297dc42ebf4f3b04(var_e6013eac45290cab, var_3b070ee0304422a8);
        player setclientomnvar(var_3b070ee0304422a8, var_43da99ac87368416);
    }
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb1
// Size: 0x8d
function function_4f871ff9eb56f17(player, var_e6013eac45290cab) {
    var_14a8920a25d8a7a1 = function_b1e0c431ac8df0ed(var_e6013eac45290cab);
    foreach (var_3b070ee0304422a8 in var_14a8920a25d8a7a1) {
        var_40f26b8193ffeb5d = function_402e97e252bb33ff(var_e6013eac45290cab, var_3b070ee0304422a8);
        if (isdefined(var_40f26b8193ffeb5d)) {
            player setclientomnvar(var_3b070ee0304422a8, var_40f26b8193ffeb5d);
        }
    }
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1045
// Size: 0xd7
function function_34e215db7fc6d16a(player, params) {
    /#
        assertex(isdefined(params) && params.size == 1, "This conditional container function expects the parameter argument list to contain one argument. This function requires an Activity Instance to be passed in.");
    #/
    var_e6013eac45290cab = params[0];
    var_1284782798be0bef = function_511be8bcaede8b52(var_e6013eac45290cab);
    var_32a6f9b3d487152d = namespace_d886885225a713a7::function_553a690e1064cf0b(player);
    foreach (var_fb5fdfafc29f4513, var_b2941d08f576eb6c in var_32a6f9b3d487152d) {
        var_33571bfdb08594f7 = function_1f3e343912ae15c5(var_fb5fdfafc29f4513);
        var_4c8d9ff06133bc6b = function_511be8bcaede8b52(var_33571bfdb08594f7);
        if (var_4c8d9ff06133bc6b == var_1284782798be0bef) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1124
// Size: 0x44
function private function_fb0ef9f4034927f8() {
    var_6ce82a9d4850ae31 = spawnstruct();
    var_6ce82a9d4850ae31.var_6ff9941006fb29cd = [];
    var_6ce82a9d4850ae31.var_3fa28f1ee9e5c83 = [];
    var_6ce82a9d4850ae31.var_6346961d07f668fe = undefined;
    var_6ce82a9d4850ae31.var_45bef2a1bc42602b = undefined;
    return var_6ce82a9d4850ae31;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1170
// Size: 0x36
function private function_e5594507f84bc271(params) {
    function_1f99e5a11b5e285b(self);
    callback::add("player_spawned", &function_570004e5d3b3c330);
    callback::add("player_disconnect", &function_db04e6dd6940b0a5);
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11ad
// Size: 0xf8
function private function_f0ab0b7c533f4200(params) {
    player = self;
    var_adf3a5b0b6c98506 = [];
    var_9d0a2cc88b985e38 = function_553a690e1064cf0b(player);
    foreach (var_fb5fdfafc29f4513, var_b71e9b133c89cc7b in var_9d0a2cc88b985e38) {
        var_e6013eac45290cab = function_1f3e343912ae15c5(var_fb5fdfafc29f4513);
        if (isdefined(var_e6013eac45290cab)) {
            var_e6013eac45290cab notify("activity_player_died", player);
            if (function_b5ec1b2b98c9a315(var_e6013eac45290cab)) {
                var_adf3a5b0b6c98506[var_adf3a5b0b6c98506.size] = var_e6013eac45290cab;
            }
        }
    }
    foreach (var_e6013eac45290cab in var_adf3a5b0b6c98506) {
        function_1c93e1762d4bf23f(var_e6013eac45290cab, player, 1);
    }
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12ac
// Size: 0x34
function private function_570004e5d3b3c330(params) {
    player = self;
    if (function_71d38726159c3f12(5)) {
        function_f541e4e4edaa8e99(5, [0:player], 1);
    }
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12e7
// Size: 0x109
function private function_db04e6dd6940b0a5(params) {
    player = self;
    if (!isdefined(player)) {
        foreach (instance in level.var_83abcb9b3a5dbe24.instances) {
            instance.var_6c29f2fdb0054bbe = array_removeundefined(instance.var_6c29f2fdb0054bbe);
        }
    } else {
        var_32a6f9b3d487152d = function_553a690e1064cf0b(player);
        foreach (var_fb5fdfafc29f4513, var_d13c18af4084bdfd in var_32a6f9b3d487152d) {
            var_e6013eac45290cab = function_1f3e343912ae15c5(var_fb5fdfafc29f4513);
            function_91c9ad377a3c4725(var_e6013eac45290cab, player);
        }
    }
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13f7
// Size: 0x20
function private function_b9a4c528a6fd77cf() {
    var_3900d8bea91376b4 = function_5cc2fd3d10cbab56(self);
    return var_3900d8bea91376b4.var_6346961d07f668fe;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x141f
// Size: 0x47
function private function_1622a54acd6019d6() {
    var_3900d8bea91376b4 = function_5cc2fd3d10cbab56(self);
    if (!isdefined(var_3900d8bea91376b4.var_45bef2a1bc42602b)) {
        return undefined;
    }
    var_539b19549cfa5c91 = gettime() / 1000;
    return var_539b19549cfa5c91 - var_3900d8bea91376b4.var_45bef2a1bc42602b;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x146e
// Size: 0x66
function private function_6fefd7e95fdfcc89(var_e6013eac45290cab) {
    player = self;
    var_fb5fdfafc29f4513 = function_f0f498aed6f8fa5d(var_e6013eac45290cab);
    player function_69f5f64b2f31e8c3(var_fb5fdfafc29f4513);
    var_32a6f9b3d487152d = function_553a690e1064cf0b(player);
    var_657cdfed8a024fa6 = var_32a6f9b3d487152d[var_fb5fdfafc29f4513];
    if (isdefined(var_657cdfed8a024fa6)) {
        var_657cdfed8a024fa6.var_ab4cdd1bcafb1dff = 1;
    }
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14db
// Size: 0x40
function private function_69f5f64b2f31e8c3(id) {
    var_3900d8bea91376b4 = function_5cc2fd3d10cbab56(self);
    var_3900d8bea91376b4.var_6346961d07f668fe = id;
    var_3900d8bea91376b4.var_45bef2a1bc42602b = gettime() / 1000;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1522
// Size: 0x103
function private function_71e9ad7d057fc10d(player) {
    var_df6a30597937d862 = -1;
    var_37fc436c2767d2b5 = [];
    var_32a6f9b3d487152d = function_553a690e1064cf0b(player);
    foreach (var_fb5fdfafc29f4513, var_d13c18af4084bdfd in var_32a6f9b3d487152d) {
        var_73ed98ca917d666e = function_1f3e343912ae15c5(var_fb5fdfafc29f4513);
        var_a80610c132c32138 = function_47e109e0d8027d54(player, var_73ed98ca917d666e);
        if (var_a80610c132c32138 > var_df6a30597937d862) {
            var_df6a30597937d862 = var_a80610c132c32138;
            var_37fc436c2767d2b5 = [0:var_73ed98ca917d666e];
        } else if (var_a80610c132c32138 == var_df6a30597937d862) {
            var_37fc436c2767d2b5[var_37fc436c2767d2b5.size] = var_73ed98ca917d666e;
        }
    }
    var_e0814ddbe2fc8bca = undefined;
    if (var_37fc436c2767d2b5.size == 1) {
        var_e0814ddbe2fc8bca = var_37fc436c2767d2b5[0];
    } else if (var_37fc436c2767d2b5.size > 1) {
        var_e0814ddbe2fc8bca = function_8ba4c11453487949(player.origin, var_37fc436c2767d2b5);
    }
    return var_e0814ddbe2fc8bca;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x162d
// Size: 0x10d
function private function_ff52316e5fb7e838(player, var_e6013eac45290cab) {
    var_2327fcafae4f8a11 = 10;
    var_80ec1eb113d8b75c = 1;
    var_21072c8308b3cf6f = 0;
    var_7f2ac638edd9ec8e = function_be6214edfe52a31(var_e6013eac45290cab);
    var_21072c8308b3cf6f = var_21072c8308b3cf6f + var_7f2ac638edd9ec8e * var_2327fcafae4f8a11;
    var_88d02cafbb45b3f2 = function_f0f498aed6f8fa5d(var_e6013eac45290cab);
    var_32a6f9b3d487152d = function_553a690e1064cf0b(player);
    var_ae40dfab935a458e = 0;
    var_12124d18c675f4aa = var_32a6f9b3d487152d[var_88d02cafbb45b3f2];
    if (isdefined(var_12124d18c675f4aa)) {
        var_b494ea8c4b70490 = var_12124d18c675f4aa.var_97ebad77fdbb25c9;
        if (var_b494ea8c4b70490 == "PlayerJoinedInteract" || var_b494ea8c4b70490 == "PlayerJoinedOther") {
            var_ae40dfab935a458e = 10;
        } else if (var_b494ea8c4b70490 == "PlayerJoinedDamage" || var_b494ea8c4b70490 == "PlayerJoinedSquad") {
            var_ae40dfab935a458e = 6;
        } else if (var_b494ea8c4b70490 == "PlayerJoinedProximity") {
            var_ae40dfab935a458e = 4;
        } else {
            var_ae40dfab935a458e = 5;
        }
    }
    var_21072c8308b3cf6f = var_21072c8308b3cf6f + var_ae40dfab935a458e * var_80ec1eb113d8b75c;
    return var_21072c8308b3cf6f;
}

// Namespace namespace_553c3c813ee2de54/namespace_cde84ab88f41f1a5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1742
// Size: 0x35
function private function_512997cf3f5c2f8a(player) {
    var_84136076a28f85b4 = self;
    if (function_93587d5ba6247f36(var_84136076a28f85b4.var_186eafd5a207b951, player)) {
        function_d10ee44b55e7d8d4(player);
    }
}

