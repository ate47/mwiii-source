// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_3b64eb40368c1450;
#using scripts\engine\utility.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_2047cdbf5176ba0;
#using script_64351208cb856df9;
#using script_7e41e37180e554f;
#using script_8a9252a4a14729;
#using script_7cb0d28e8be0e9f7;
#using script_38622ac8d1042f47;
#using script_2ab52a62bf9e853b;
#using script_533e5a559ac874bb;
#using script_6ef639b99fbddff7;
#using script_565762e567ca9ac7;
#using script_752d972488e1bcf3;
#using script_1749d06ff1abde13;
#using script_71baa084f5c3e987;
#using script_4fa7e9e11630166c;
#using script_3ab210ea917601e7;
#using scripts\engine\math.gsc;
#using script_39d11000e476a42a;

#namespace namespace_7f07235e0f3535e;

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f8
// Size: 0x17d
function function_7582e8d13ed3c196(params) {
    if (function_b4aab17620ddfba8("a")) {
        function_447c6ab4bea16b52("contract", "REV_OB_ASSASSINATION", &namespace_4b05af9596de25bf::function_efc0b660430f0537, &namespace_ee0c44b2b5ce4eb7::function_fd69cf02ba4d90a2);
    }
    if (function_b4aab17620ddfba8("b")) {
        function_447c6ab4bea16b52("contract", "REV_OB_ASSASSINATION", &namespace_4b05af9596de25bf::function_efc0b660430f0537, &namespace_10eb89dbae3b9a07::function_fd69cf02ba4d90a2);
    }
    if (function_b4aab17620ddfba8("c")) {
        function_447c6ab4bea16b52("contract", "REV_OB_ASSASSINATION", &namespace_4b05af9596de25bf::function_efc0b660430f0537, &namespace_242c8d9da8f14ad3::function_fd69cf02ba4d90a2);
    }
    if (function_b4aab17620ddfba8("d")) {
        function_447c6ab4bea16b52("contract", "REV_OB_ASSASSINATION", &namespace_4b05af9596de25bf::function_efc0b660430f0537, &namespace_4ca22f138e73d273::function_fd69cf02ba4d90a2);
    }
    if (function_b4aab17620ddfba8("e")) {
        function_447c6ab4bea16b52("contract", "REV_OB_ASSASSINATION", &namespace_4b05af9596de25bf::function_efc0b660430f0537, &namespace_5ea9848627a81537::function_fd69cf02ba4d90a2);
    }
    if (function_b4aab17620ddfba8("f")) {
        function_447c6ab4bea16b52("contract", "REV_OB_ASSASSINATION", &namespace_4b05af9596de25bf::function_efc0b660430f0537, &namespace_640e7d8769ad71c7::function_fd69cf02ba4d90a2);
    }
    if (function_b4aab17620ddfba8("g")) {
        function_447c6ab4bea16b52("contract", "REV_OB_ASSASSINATION", &namespace_4b05af9596de25bf::function_efc0b660430f0537, &namespace_4e4453cc1e6ea85b::function_fd69cf02ba4d90a2);
    }
    if (function_b4aab17620ddfba8("h")) {
        function_447c6ab4bea16b52("contract", "REV_OB_ASSASSINATION", &namespace_4b05af9596de25bf::function_efc0b660430f0537, &namespace_31ceb7e15880023b::function_fd69cf02ba4d90a2);
    }
    if (function_b4aab17620ddfba8("i")) {
        function_447c6ab4bea16b52("contract", "REV_OB_ASSASSINATION", &namespace_4b05af9596de25bf::function_efc0b660430f0537, &namespace_297cce142f234407::function_fd69cf02ba4d90a2);
    }
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47c
// Size: 0x205
function function_efc0b660430f0537() {
    level.var_7e12f6eb4fcb4ea1 = spawnstruct();
    level.var_7e12f6eb4fcb4ea1.time = getdvarint(@"hash_72660fac527aaeb5", 300);
    level.var_7e12f6eb4fcb4ea1.minsearchradius = getdvarint(@"hash_6464566e8990a20", 5000);
    level.var_7e12f6eb4fcb4ea1.var_877e83278a9f2eac = getdvarint(@"hash_636d289d84f99e04", 30000);
    level.var_7e12f6eb4fcb4ea1.var_8718aeb5b6f8eb16 = getdvarint(@"hash_4ab47609d1497ece", 5000);
    level.var_7e12f6eb4fcb4ea1.var_2a708f42df785976 = getdvarint(@"hash_2edc6209fe22f4e1", 100);
    level.var_7e12f6eb4fcb4ea1.var_2a938142df9e8264 = getdvarint(@"hash_2f005409fe4b50cf", 1000);
    level.var_7e12f6eb4fcb4ea1.var_3bd4a66a02968ecc = getdvarint(@"hash_e2f1af059fbe1afb", 1500);
    level.var_7e12f6eb4fcb4ea1.var_5094b22fd45a3ef6 = getdvarint(@"hash_b4061ee6c7f796bb", 2000);
    level.var_7e12f6eb4fcb4ea1.var_a3487335038df794 = getdvarint(@"hash_42e7a23df0253c03", 3500);
    level.var_7e12f6eb4fcb4ea1.var_65dd392cafab8111 = getdvarint(@"hash_11732dc10bbd785e", 2500);
    level.var_7e12f6eb4fcb4ea1.var_a12a720226632b47 = getdvarint(@"hash_e39017944e7471a6", 5000);
    function_89384091f7a2dbd("REV_OB_ASSASSINATION", 0, &function_95bb73feb4a138ab);
    function_89384091f7a2dbd("REV_OB_ASSASSINATION", 1, &function_cd4eb7bbd337a6f3);
    function_89384091f7a2dbd("REV_OB_ASSASSINATION", 2, &function_68394fff4d44449b);
    function_89384091f7a2dbd("REV_OB_ASSASSINATION", 3, &function_6e628ff1a7e7eb75);
    function_89384091f7a2dbd("REV_OB_ASSASSINATION", 5, &function_4068fa9a397f767);
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x688
// Size: 0x19
function function_95bb73feb4a138ab() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a8
// Size: 0x185
function function_cd4eb7bbd337a6f3() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.targetteam = function_84f35f18bc171c4b(self.var_6c29f2fdb0054bbe[0]);
    if (isdefined(self.targetteam)) {
        self.hunterteam = self.var_6c29f2fdb0054bbe[0].team;
        level.var_aab4fba7a041b281 = array_combine(level.var_aab4fba7a041b281, getteamdata(self.targetteam, "players"));
        self.targetplayer = function_7509965d9b7b0783(self.targetteam);
        if (!isdefined(self.targetplayer)) {
            function_e730864bccf684a8(0, "noTarget");
            return;
        }
        function_6b6b6273f8180522("Assassination_Br");
        function_9ca12d228e28fc4e();
        function_e889ff375104a81a(1);
        namespace_262d6474998a2356::function_61cd287166c3f695("REV_OB_ASSASSINATION");
        namespace_262d6474998a2356::function_c661dba3e304266b(self.targetplayer getentitynumber());
        namespace_262d6474998a2356::function_474722293c221d5c(level.var_7e12f6eb4fcb4ea1.time);
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_assassination_begin");
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_assassination_target_begin", getteamdata(self.targetteam, "players"));
        thread function_11b1906c1ace5e9a(level.var_7e12f6eb4fcb4ea1.time);
        thread function_11347a2fac282ff1();
        thread function_580d66ea57c2bae4();
        thread function_3c7671eec6650e55();
        thread function_22d218a774d32f92();
    } else {
        function_e730864bccf684a8(0, "noTarget");
    }
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x834
// Size: 0x81
function function_68394fff4d44449b() {
    self endon("instance_destroyed");
    if (function_acaa75ca8754452e()) {
        function_af5604ce591768e1();
    }
    if (isdefined(self.targetteam)) {
        level.var_aab4fba7a041b281 = array_remove_array(level.var_aab4fba7a041b281, getteamdata(self.targetteam, "players"));
        function_48919e173bf3f70d(0);
        function_e889ff375104a81a(0);
        self.targetteam = undefined;
        self.hunterteam = undefined;
        self.targetplayer = undefined;
    }
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bc
// Size: 0xa
function function_6e628ff1a7e7eb75() {
    function_68394fff4d44449b();
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cd
// Size: 0x63
function function_9ca12d228e28fc4e() {
    foreach (player in getteamdata(self.hunterteam, "players")) {
        function_cfd53c8f6878014f(player);
    }
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x937
// Size: 0xa2
function function_e889ff375104a81a(visible) {
    value = ter_op(istrue(visible), gettime() + level.var_7e12f6eb4fcb4ea1.time * 1000, 0);
    foreach (player in getteamdata(self.targetteam, "players")) {
        player setclientomnvar("ui_br_assassination_target_timer", value);
    }
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e0
// Size: 0xc2
function function_48919e173bf3f70d(visible) {
    if (istrue(visible) && isdefined(self.threat_level)) {
        entitynumber = self.targetplayer getentitynumber();
        entitynumber = entitynumber + 1;
        value = self.threat_level << 8 | entitynumber;
    } else {
        value = 0;
    }
    foreach (player in getteamdata(self.targetteam, "players")) {
        player setclientomnvar("ui_br_assassination_target", value);
    }
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa9
// Size: 0x2a
function function_3c7671eec6650e55() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.targetplayer waittill("death_or_disconnect");
    function_e730864bccf684a8(1);
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xada
// Size: 0x3f
function function_11347a2fac282ff1() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (1) {
        function_7f15bee19d4fe7ad(self.targetplayer);
        function_98e4ffc78350980a();
        function_48919e173bf3f70d(1);
        wait(10);
    }
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb20
// Size: 0xbc
function function_22d218a774d32f92() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (1) {
        var_189592790ba8be47 = 1;
        foreach (teammate in getteamdata(self.hunterteam, "players")) {
            if (isreallyalive(teammate) || isdefined(level.var_fd15b9ad0f909a26) && !teammate [[ level.var_fd15b9ad0f909a26 ]]()) {
                var_189592790ba8be47 = 0;
                break;
            }
        }
        if (var_189592790ba8be47) {
            function_e730864bccf684a8(0);
            return;
        }
        wait(1);
    }
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe3
// Size: 0xb2
function function_f8b99a032bec8b6f(team) {
    teamsize = 0;
    var_880fb18d24527d89 = (0, 0, 0);
    foreach (teammate in getteamdata(team, "players")) {
        if (isreallyalive(teammate)) {
            teamsize++;
            var_880fb18d24527d89 = var_880fb18d24527d89 + teammate.origin;
        }
    }
    if (teamsize != 0) {
        var_880fb18d24527d89 = var_880fb18d24527d89 / teamsize;
    }
    return [0:var_880fb18d24527d89, 1:teamsize];
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9d
// Size: 0x136
function function_bd4dc62040a7da16(player, searchradius) {
    playerlist = [];
    hunterteam = player.team;
    var_64d072985f0a15a5 = undefined;
    var_ea7cd2b67d803bc4 = level.var_aab4fba7a041b281;
    var_ea7cd5b67d80425d = getteamdata(hunterteam, "players");
    excludedteams = array_combine(var_ea7cd2b67d803bc4, var_ea7cd5b67d80425d);
    if (isdefined(searchradius)) {
        var_64d072985f0a15a5 = get_array_of_closest(player.origin, level.players, excludedteams, undefined, searchradius, level.var_7e12f6eb4fcb4ea1.minsearchradius);
    } else {
        var_64d072985f0a15a5 = get_array_of_closest(player.origin, level.players, excludedteams, undefined, undefined, undefined);
    }
    foreach (potentialtarget in var_64d072985f0a15a5) {
        if (isreallyalive(potentialtarget)) {
            playerlist[playerlist.size] = potentialtarget;
        }
    }
    return playerlist;
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddb
// Size: 0x22e
function function_f289bd23237b0b42(playerlist, var_29f6d200784f77b3, var_90b91d6205fce07f) {
    var_3b8219d206004dfa = undefined;
    teamsize = 0;
    var_57722b90b0bb4da8 = [];
    foreach (potentialtarget in playerlist) {
        if (istrue(var_57722b90b0bb4da8[potentialtarget.team])) {
            continue;
        }
        var_57722b90b0bb4da8[potentialtarget.team] = 1;
        var_b54fea3b6f15223c = 0;
        foreach (teammate in getteamdata(potentialtarget.team, "players")) {
            if (isreallyalive(teammate)) {
                var_b54fea3b6f15223c++;
            }
        }
        if (var_b54fea3b6f15223c == 0) {
            continue;
        }
        if (!isdefined(var_3b8219d206004dfa)) {
            var_3b8219d206004dfa = potentialtarget.team;
            teamsize = var_b54fea3b6f15223c;
        } else {
            difference = abs(var_90b91d6205fce07f - teamsize);
            var_c31f7d1e1a05a27f = abs(var_90b91d6205fce07f - var_b54fea3b6f15223c);
            if (var_c31f7d1e1a05a27f < difference) {
                var_3b8219d206004dfa = potentialtarget.team;
                teamsize = var_b54fea3b6f15223c;
                continue;
            } else if (var_c31f7d1e1a05a27f > difference) {
                continue;
            }
            if (teamsize < var_b54fea3b6f15223c) {
                var_3b8219d206004dfa = potentialtarget.team;
                teamsize = var_b54fea3b6f15223c;
                continue;
            } else if (teamsize > var_b54fea3b6f15223c) {
                continue;
            }
            var_f3d86a52c80ad8a3 = function_f8b99a032bec8b6f(potentialtarget.team);
            var_b78e01e4ca8f50a = var_f3d86a52c80ad8a3[0];
            var_33bfcf6441a35eac = function_f8b99a032bec8b6f(var_3b8219d206004dfa);
            var_76e3e3800077282f = var_33bfcf6441a35eac[0];
            if (distance2d(var_29f6d200784f77b3, var_b78e01e4ca8f50a) < distance2d(var_29f6d200784f77b3, var_76e3e3800077282f)) {
                var_3b8219d206004dfa = potentialtarget.team;
                teamsize = var_b54fea3b6f15223c;
            }
        }
    }
    return var_3b8219d206004dfa;
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1011
// Size: 0xe5
function function_84f35f18bc171c4b(player) {
    playerlist = [];
    var_3b8219d206004dfa = undefined;
    searchradius = level.var_7e12f6eb4fcb4ea1.minsearchradius;
    var_fa2a5b4be85aefde = function_f8b99a032bec8b6f(player.team);
    var_29f6d200784f77b3 = var_fa2a5b4be85aefde[0];
    var_90b91d6205fce07f = var_fa2a5b4be85aefde[1];
    while (!isdefined(var_3b8219d206004dfa) && searchradius < level.var_7e12f6eb4fcb4ea1.var_877e83278a9f2eac) {
        playerlist = function_bd4dc62040a7da16(player, searchradius);
        var_3b8219d206004dfa = function_f289bd23237b0b42(playerlist, var_29f6d200784f77b3, var_90b91d6205fce07f);
        searchradius = searchradius + level.var_7e12f6eb4fcb4ea1.var_8718aeb5b6f8eb16;
    }
    if (!isdefined(var_3b8219d206004dfa)) {
        playerlist = function_bd4dc62040a7da16(player);
        var_3b8219d206004dfa = function_f289bd23237b0b42(playerlist, var_29f6d200784f77b3, var_90b91d6205fce07f);
    }
    return var_3b8219d206004dfa;
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10fe
// Size: 0xd7
function function_7509965d9b7b0783(targetteam) {
    targetplayer = undefined;
    var_1494fc5165320c85 = function_f8b99a032bec8b6f(targetteam);
    var_6eab422b60051e44 = var_1494fc5165320c85[0];
    foreach (player in getteamdata(targetteam, "players")) {
        if (!isreallyalive(player)) {
            continue;
        }
        if (!isdefined(targetplayer)) {
            targetplayer = player;
        } else if (distance2d(var_6eab422b60051e44, player.origin) < distance2d(var_6eab422b60051e44, targetplayer.origin)) {
            targetplayer = player;
        }
    }
    /#
        assert(isdefined(targetplayer));
    #/
    return targetplayer;
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11dd
// Size: 0x84
function function_7f15bee19d4fe7ad(targetplayer) {
    search_location = (targetplayer.origin[0], targetplayer.origin[1], level.var_7e12f6eb4fcb4ea1.var_5094b22fd45a3ef6);
    search_location = search_location + namespace_d3f3cb0a543667c1::random_vector_2d() * randomfloatrange(level.var_7e12f6eb4fcb4ea1.var_2a708f42df785976, level.var_7e12f6eb4fcb4ea1.var_2a938142df9e8264);
    function_6e148c8da2e4db13(search_location);
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1268
// Size: 0x1d2
function function_98e4ffc78350980a() {
    var_579ac64eafb44d97 = [];
    foreach (player in getteamdata(self.hunterteam, "players")) {
        if (isreallyalive(player)) {
            var_579ac64eafb44d97[var_579ac64eafb44d97.size] = player;
        }
    }
    if (var_579ac64eafb44d97.size == 0) {
        function_4584ad1c0e2c58ec(level.var_7e12f6eb4fcb4ea1.var_a3487335038df794);
        self.threat_level = 0;
        return;
    }
    closestdist = undefined;
    foreach (player in var_579ac64eafb44d97) {
        dist = distance2d(player.origin, self.targetplayer.origin);
        if (!isdefined(closestdist) || dist < closestdist) {
            closestdist = dist;
        }
    }
    if (closestdist > level.var_7e12f6eb4fcb4ea1.var_a12a720226632b47) {
        function_4584ad1c0e2c58ec(level.var_7e12f6eb4fcb4ea1.var_a3487335038df794);
        self.threat_level = 0;
    } else if (closestdist > level.var_7e12f6eb4fcb4ea1.var_65dd392cafab8111) {
        function_4584ad1c0e2c58ec(level.var_7e12f6eb4fcb4ea1.var_5094b22fd45a3ef6);
        self.threat_level = 1;
    } else {
        function_4584ad1c0e2c58ec(level.var_7e12f6eb4fcb4ea1.var_3bd4a66a02968ecc);
        self.threat_level = 2;
    }
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1441
// Size: 0x8a
function function_8002632f8d8eccde(var_c17ac30865717c64, reason) {
    if (var_c17ac30865717c64) {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_assassination_target_eliminated", getteamdata(self.targetteam, "players"));
    } else if (isdefined(reason) && reason == "noTarget") {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_assassination_warning");
    } else {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_assassination_failure");
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_assassination_target_survive", getteamdata(self.targetteam, "players"));
    }
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d2
// Size: 0x26
function function_e730864bccf684a8(var_c17ac30865717c64, reason) {
    function_8002632f8d8eccde(var_c17ac30865717c64, reason);
    function_612d18fdbc979c0b(self, var_c17ac30865717c64);
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ff
// Size: 0x3f
function function_4068fa9a397f767() {
    self endon("instance_destroyed");
    var_6c1956fd6ce84917 = 1;
    var_cc7aa96a854fd8ee = namespace_71ca15b739deab72::function_3ae7f99339b96499(self.var_6c29f2fdb0054bbe[0].origin, var_6c1956fd6ce84917);
    return var_cc7aa96a854fd8ee;
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1546
// Size: 0x24
function function_11b1906c1ace5e9a(time) {
    self endon("activity_ended");
    self endon("instance_destroyed");
    wait(time);
    function_e730864bccf684a8(0);
}

// Namespace namespace_7f07235e0f3535e/namespace_4b05af9596de25bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1571
// Size: 0x29
function function_580d66ea57c2bae4() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.targetplayer waittill("exfil_fully_completed");
    function_e730864bccf684a8(0);
}
