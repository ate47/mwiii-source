// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_24f248b33b79e48d;
#using script_3ab210ea917601e7;
#using script_638d701d263ee1ed;
#using scripts\mp\utility\player.gsc;

#namespace namespace_94e3188e9c550ef8;

// Namespace namespace_94e3188e9c550ef8/namespace_32e74fbed1406ca3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18b
// Size: 0x6
function function_b1466004f2cd38fe() {
    /#
    #/
}

// Namespace namespace_94e3188e9c550ef8/namespace_32e74fbed1406ca3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x198
// Size: 0x3e2
function function_5b4245d8e50d6cc3(dialogue, players, var_adf9b116d40668a0, var_49a8c885c448979f, var_40c2a85296f1abff, var_f8c64b655f66014c) {
    if (!isdefined(self.var_339fe154f7fde1c7)) {
        self.var_339fe154f7fde1c7 = 0;
    }
    if (!isdefined(var_f8c64b655f66014c) && isdefined(level.var_e45d4b8e1cc3925c)) {
        var_f8c64b655f66014c = level.var_e45d4b8e1cc3925c;
    }
    /#
        assert(!isdefined(var_f8c64b655f66014c) || var_f8c64b655f66014c >= 1, "Dialogue print max lines must be at least 1.");
    #/
    var_adf9b116d40668a0 = function_53c4c53197386572(var_adf9b116d40668a0, "distance");
    players = function_53c4c53197386572(players, level.players);
    if (!isarray(players)) {
        array = [];
        array[0] = players;
        players = array;
    }
    var_49a8c885c448979f = function_53c4c53197386572(var_49a8c885c448979f, 512);
    var_51f779a37e50954f = var_49a8c885c448979f * var_49a8c885c448979f;
    foreach (player in players) {
        if (istrue(var_40c2a85296f1abff) && isdefined(player.dialoguehud) || isdefined(var_f8c64b655f66014c) && isdefined(player.dialoguehud) && player.dialoguehud.size >= var_f8c64b655f66014c) {
            ob_dialogue_print_clear(players, 1, var_f8c64b655f66014c - 1);
        }
    }
    if (isplayer(self)) {
        color = "^3";
    } else if (isdefined(self.team)) {
        switch (self.team) {
        case #"hash_7c2d091e6337bf54":
            color = "^1";
            break;
        case #"hash_5f54b9bf7583687f":
            color = "^5";
            break;
        case #"hash_24b14065e10b1f8d":
            color = "^4";
            break;
        default:
            color = "^2";
            break;
        }
    } else {
        color = "^2";
    }
    var_cab6d58f65af5aa4 = "";
    if (isdefined(self.name)) {
        var_cab6d58f65af5aa4 = var_cab6d58f65af5aa4 + self.name;
    } else if (isplayer(self)) {
        var_cab6d58f65af5aa4 = var_cab6d58f65af5aa4 + "Player";
    } else if (isdefined(self.team)) {
        if (isdefined(level.var_76fed2ad3db8bb83) && isdefined(level.var_76fed2ad3db8bb83[self.team])) {
            var_cab6d58f65af5aa4 = var_cab6d58f65af5aa4 + level.var_76fed2ad3db8bb83[self.team];
        } else {
            switch (self.team) {
            case #"hash_7c2d091e6337bf54":
                var_cab6d58f65af5aa4 = var_cab6d58f65af5aa4 + "Enemy";
                break;
            case #"hash_24b14065e10b1f8d":
                var_cab6d58f65af5aa4 = var_cab6d58f65af5aa4 + "Team3";
                break;
            case #"hash_5f54b9bf7583687f":
                var_cab6d58f65af5aa4 = var_cab6d58f65af5aa4 + "Friendly";
                break;
            default:
                var_cab6d58f65af5aa4 = var_cab6d58f65af5aa4 + "Civ";
                break;
            }
        }
    }
    foreach (player in players) {
        if (var_adf9b116d40668a0 == "always") {
            var_cab6d58f65af5aa4 = var_cab6d58f65af5aa4 + " (radio)";
        } else if (isdefined(self.origin)) {
            playerdistsq = distancesquared(self.origin, player.origin);
            if (playerdistsq > var_51f779a37e50954f) {
                if (var_adf9b116d40668a0 == "never") {
                    continue;
                } else {
                    var_cab6d58f65af5aa4 = var_cab6d58f65af5aa4 + " (radio)";
                }
            }
        }
        if (var_cab6d58f65af5aa4 != "") {
            var_cab6d58f65af5aa4 = color + var_cab6d58f65af5aa4 + ": ^7";
        }
        var_cab6d58f65af5aa4 = var_cab6d58f65af5aa4 + dialogue;
        thread function_e232a099eb1f3824(var_cab6d58f65af5aa4, player);
    }
}

// Namespace namespace_94e3188e9c550ef8/namespace_32e74fbed1406ca3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x581
// Size: 0x5bb
function function_e232a099eb1f3824(string, player) {
    if (isdefined(self.var_339fe154f7fde1c7)) {
        self.var_339fe154f7fde1c7++;
    }
    var_b54520c420443a7c = int(4.9);
    var_ca02086954972024 = int(10);
    var_7794fdd4649e6d7f = int(2);
    if (isdefined(level.var_eecd069bb8d057c5)) {
        var_688f98559bf04f9d = level.var_eecd069bb8d057c5;
    } else {
        var_688f98559bf04f9d = 420;
    }
    width = int(clamp(string.size * var_b54520c420443a7c, 350, 630));
    var_ab9868b0589a6052 = wrap_text(string, int(630 / var_b54520c420443a7c));
    height = var_ca02086954972024 * var_ab9868b0589a6052.size + var_7794fdd4649e6d7f * 2;
    var_9a77f8c6fc5ac4a4 = [];
    foreach (i, string in var_ab9868b0589a6052) {
        text = newclienthudelem(player);
        text.alpha = 0;
        /#
            text setdevtext(string);
        #/
        text.fontscale = 1;
        text.row = i;
        var_9a77f8c6fc5ac4a4[var_9a77f8c6fc5ac4a4.size] = text;
    }
    bg = newclienthudelem(player);
    bg.alpha = 0;
    bg setshader("black", width, height);
    if (isdefined(player.dialoguehud)) {
        foreach (var_a42acacca10b911d in player.dialoguehud) {
            foreach (hud in var_a42acacca10b911d) {
                hud moveovertime(0.3);
                hud.y = hud.y - height + 5;
            }
        }
    } else {
        player.dialoguehud = [];
    }
    array = array_add(var_9a77f8c6fc5ac4a4, bg);
    array[0] endon("ob_dialogue_print_clear");
    player.dialoguehud[player.dialoguehud.size] = array;
    foreach (hud in array) {
        hud.alignx = "center";
        hud.aligny = "top";
        hud.x = 320;
        hud.y = height * -1;
        hud.sort = 5;
        if (isdefined(hud.row)) {
            hud.y = hud.y + hud.row * var_ca02086954972024 + var_7794fdd4649e6d7f;
        }
    }
    var_688f98559bf04f9d = var_688f98559bf04f9d - height;
    foreach (hud in array) {
        hud fadeovertime(0.3);
        if (isdefined(hud.row)) {
            hud.alpha = 1;
        } else {
            hud.alpha = 0.5;
        }
        hud moveovertime(0.3);
        if (isdefined(hud.row)) {
            hud.y = var_688f98559bf04f9d + hud.row * var_ca02086954972024 + var_7794fdd4649e6d7f;
        } else {
            hud.y = var_688f98559bf04f9d;
        }
    }
    wait(8.3);
    foreach (hud in array) {
        hud fadeovertime(2);
        hud.alpha = 0;
    }
    wait(2);
    if (isdefined(self.var_339fe154f7fde1c7)) {
        self.var_339fe154f7fde1c7--;
        if (self.var_339fe154f7fde1c7 < 0) {
            self.var_339fe154f7fde1c7 = 0;
        }
    }
    foreach (i, var_a42acacca10b911d in player.dialoguehud) {
        if (var_a42acacca10b911d[0] == array[0]) {
            player.dialoguehud = array_remove_index(player.dialoguehud, i, 0);
            break;
        }
    }
    if (!player.dialoguehud.size) {
        player.dialoguehud = undefined;
    }
    foreach (hud in array) {
        hud destroy();
    }
}

// Namespace namespace_94e3188e9c550ef8/namespace_32e74fbed1406ca3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb43
// Size: 0xaf
function ob_dialogue_print_clear(players, immediate, var_f8c64b655f66014c) {
    players = function_53c4c53197386572(players, level.players);
    if (!isarray(players)) {
        array = [];
        array[0] = players;
        players = array;
    }
    foreach (player in players) {
        if (!isdefined(player.dialoguehud)) {
            return;
        }
        thread function_52f5db5262924a8e(player, immediate, var_f8c64b655f66014c);
    }
}

// Namespace namespace_94e3188e9c550ef8/namespace_32e74fbed1406ca3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf9
// Size: 0x24c
function function_52f5db5262924a8e(player, immediate, var_f8c64b655f66014c) {
    if (!isdefined(var_f8c64b655f66014c)) {
        var_f8c64b655f66014c = 0;
    }
    var_ce7ac40904613a16 = [];
    var_a8fd9f4005a60d95 = player.dialoguehud.size;
    for (i = 0; i < var_a8fd9f4005a60d95 && var_a8fd9f4005a60d95 - var_ce7ac40904613a16.size > var_f8c64b655f66014c; i++) {
        player.dialoguehud[i][0] notify("ob_dialogue_print_clear");
        var_ce7ac40904613a16[var_ce7ac40904613a16.size] = player.dialoguehud[i];
        player.dialoguehud = array_remove_index(player.dialoguehud, i, 1);
    }
    player.dialoguehud = array_combine(player.dialoguehud);
    if (!istrue(immediate)) {
        foreach (var_a42acacca10b911d in var_ce7ac40904613a16) {
            foreach (hud in var_a42acacca10b911d) {
                if (hud.alpha > 0) {
                    hud fadeovertime(2);
                    hud.alpha = 0;
                }
            }
        }
        wait(2);
    }
    if (isdefined(player.dialoguehud) && !player.dialoguehud.size) {
        player.dialoguehud = undefined;
    }
    foreach (var_a42acacca10b911d in var_ce7ac40904613a16) {
        foreach (hud in var_a42acacca10b911d) {
            if (isdefined(hud)) {
                hud destroy();
            }
        }
    }
}

// Namespace namespace_94e3188e9c550ef8/namespace_32e74fbed1406ca3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe4c
// Size: 0x6
function function_fa26a1bcd7a2798() {
    /#
    #/
}

// Namespace namespace_94e3188e9c550ef8/namespace_32e74fbed1406ca3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe59
// Size: 0xfa
function function_5a6644a3e62d5303(str_message, position, endons) {
    self endon("activity_ended");
    if (isdefined(endons)) {
        foreach (str in endons) {
            self endon(str);
        }
    }
    var_526a88681bea0d2 = [];
    while (isdefined(position)) {
        wait(1);
        if (isvector(position)) {
            org = position;
        } else {
            org = position.origin;
        }
        players = function_bef306b5e7aefafc(org);
        if (players.size > 0 && var_526a88681bea0d2.size > 0) {
            players = array_remove_array(players, var_526a88681bea0d2);
        }
        if (players.size > 0) {
            function_1281c7fff9456e18(str_message, players);
            var_526a88681bea0d2 = array_combine(players, var_526a88681bea0d2);
        }
    }
}

// Namespace namespace_94e3188e9c550ef8/namespace_32e74fbed1406ca3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf5a
// Size: 0x43
function function_d23f4a621dca2786(str_message, position) {
    self endon("activity_ended");
    wait(1);
    players = function_bef306b5e7aefafc(position);
    if (players.size > 0) {
        function_1281c7fff9456e18(str_message, players);
    }
}

// Namespace namespace_94e3188e9c550ef8/namespace_32e74fbed1406ca3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa4
// Size: 0xcd
function function_bef306b5e7aefafc(position) {
    self endon("activity_ended");
    players = [];
    var_5ecbb1604d9e6025 = namespace_4df2ab39b0e96ec7::function_688103a7b4041bf8(position);
    foreach (player in level.players) {
        if (isdefined(player) && isalive(player)) {
            player_region = namespace_4df2ab39b0e96ec7::function_688103a7b4041bf8(player.origin);
            if (isdefined(player_region) && player_region == var_5ecbb1604d9e6025 && !istrue(function_d446389b3af72567(player))) {
                players = array_add(players, player);
            }
        }
    }
    return players;
}

// Namespace namespace_94e3188e9c550ef8/namespace_32e74fbed1406ca3
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1079
// Size: 0x11a
function function_77a5f408a4193b40(str_message, position, range, endons) {
    self endon("activity_ended");
    if (isdefined(endons)) {
        foreach (str in endons) {
            self endon(str);
        }
    }
    range = function_53c4c53197386572(range, 3072);
    var_526a88681bea0d2 = [];
    while (isdefined(position)) {
        wait(1);
        if (!isdefined(position)) {
            break;
        }
        if (isvector(position)) {
            org = position;
        } else {
            org = position.origin;
        }
        players = function_a0f48eb3578c88bd(org, range);
        if (players.size > 0 && var_526a88681bea0d2.size > 0) {
            players = array_remove_array(players, var_526a88681bea0d2);
        }
        if (players.size > 0) {
            function_1281c7fff9456e18(str_message, players);
            var_526a88681bea0d2 = array_combine(players, var_526a88681bea0d2);
        }
    }
}

// Namespace namespace_94e3188e9c550ef8/namespace_32e74fbed1406ca3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x119a
// Size: 0x7d
function function_9af7ccdced20e387(str_message, position, range) {
    self endon("activity_ended");
    range = function_53c4c53197386572(range, 3072);
    if (isvector(position)) {
        org = position;
    } else {
        org = position.origin;
    }
    wait(1);
    players = function_a0f48eb3578c88bd(org, range);
    if (players.size > 0) {
        function_1281c7fff9456e18(str_message, players);
    }
}

// Namespace namespace_94e3188e9c550ef8/namespace_32e74fbed1406ca3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121e
// Size: 0x9f
function function_a0f48eb3578c88bd(position, range) {
    self endon("activity_ended");
    players = namespace_7e17181d03156026::getplayersinradius(position, range);
    if (players.size > 0) {
        foreach (player in players) {
            if (istrue(function_4ab1cdfd84bbd3f2(self, player))) {
                continue;
            }
            if (istrue(function_d446389b3af72567(player))) {
                players = array_remove(players, player);
            }
        }
    }
    return players;
}
