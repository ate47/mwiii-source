#using script_5605739161b1abe1;
#using script_7f9409b703dad400;
#using scripts\mp\utility\teams.gsc;

#namespace ob_vote;

// Namespace ob_vote / namespace_6c57c664b4288f88
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7
// Size: 0x1c9
function function_93c8f90c3bd798c6(player, time_limit, success_callback) {
    level.var_5a107145d8e88c36 = zmvote::register();
    if (!isdefined(time_limit)) {
        time_limit = 60;
    }
    if (isdefined(success_callback)) {
        assert(isfunction(success_callback));
    }
    timer = namespace_26c5a699d7cb84a2::function_3eec8a169e8a0936(time_limit);
    player function_37a354eaca18f977();
    waitframe();
    vote_success = 0;
    var_3292a1fe7c25743d = 0;
    while (isdefined(player) && timer.progresscomplete != 1) {
        n_time_remaining = int(timer.var_621cb2c0d9b1cdae);
        var_26d5115774db834b = scripts\mp\utility\teams::getsquadmates(player.team, player.sessionsquadid, 1);
        foreach (voter in var_26d5115774db834b) {
            level.var_5a107145d8e88c36 zmvote::function_1ef9fa70a14ba51b(voter, n_time_remaining);
        }
        player function_71f5ca5c18a5f049();
        if (player function_5c26462346bcd200()) {
            vote_success = player function_5d49e814d8224111();
            if (vote_success) {
                level.var_5a107145d8e88c36 zmvote::function_ac275402bbe52c1b(player, 2);
                player thread function_8ce14e667ba9642d(5);
                var_3292a1fe7c25743d = 1;
                if (isdefined(success_callback)) {
                    self [[ success_callback ]](player);
                }
            } else {
                level.var_5a107145d8e88c36 zmvote::function_ac275402bbe52c1b(player, 3);
            }
            break;
        }
        wait 0.5;
    }
    timer.progresscomplete = 1;
    if (!var_3292a1fe7c25743d) {
        player thread function_8ce14e667ba9642d(0);
    }
    return vote_success;
}

// Namespace ob_vote / namespace_6c57c664b4288f88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a9
// Size: 0x54
function function_daaf62a5c884f34d(var_aa3a3c9a338ea9bc) {
    if (isdefined(var_aa3a3c9a338ea9bc.vote)) {
        newcount = var_aa3a3c9a338ea9bc.vote.yescount + 1;
        var_aa3a3c9a338ea9bc.vote.yescount = newcount;
    }
}

// Namespace ob_vote / namespace_6c57c664b4288f88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x305
// Size: 0x54
function function_89edd64ed9997ba7(var_aa3a3c9a338ea9bc) {
    if (isdefined(var_aa3a3c9a338ea9bc.vote)) {
        newcount = var_aa3a3c9a338ea9bc.vote.nocount + 1;
        var_aa3a3c9a338ea9bc.vote.nocount = newcount;
    }
}

// Namespace ob_vote / namespace_6c57c664b4288f88
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x361
// Size: 0x9b
function function_5dffe49ad4961546(playercount, var_89fa914f93f1284) {
    player = self;
    if (!isdefined(player.vote)) {
        player.vote = spawnstruct();
    }
    player.vote.yescount = 0;
    player.vote.nocount = 0;
    player.vote.playercount = playercount;
    player.vote.var_89fa914f93f1284 = var_89fa914f93f1284;
}

// Namespace ob_vote / namespace_6c57c664b4288f88
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x404
// Size: 0xb0
function function_5c26462346bcd200() {
    player = self;
    var_faa232f024c0838e = 0;
    if (isdefined(player.vote)) {
        var_d324c1705a394d66 = player.vote.yescount + player.vote.nocount;
        if (var_d324c1705a394d66 >= player.vote.playercount) {
            var_faa232f024c0838e = 1;
        }
        if (player.vote.yescount >= player.vote.var_89fa914f93f1284) {
            var_faa232f024c0838e = 1;
        }
    }
    return var_faa232f024c0838e;
}

// Namespace ob_vote / namespace_6c57c664b4288f88
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bd
// Size: 0x134
function function_71f5ca5c18a5f049() {
    player = self;
    if (isdefined(player) && isdefined(player.vote)) {
        a_squad = scripts\mp\utility\teams::getsquadmates(player.team, player.sessionsquadid, 1);
        var_3cfd3771899bec37 = player.vote.var_89fa914f93f1284 - player.vote.yescount;
        if (var_3cfd3771899bec37 > 0) {
            foreach (member in a_squad) {
                level.var_5a107145d8e88c36 zmvote::function_ab84ca85d11789c7(member, var_3cfd3771899bec37);
            }
            return;
        }
        foreach (member in a_squad) {
            level.var_5a107145d8e88c36 zmvote::function_ac275402bbe52c1b(member, 2);
        }
    }
}

// Namespace ob_vote / namespace_6c57c664b4288f88
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f9
// Size: 0x39
function function_5d49e814d8224111() {
    player = self;
    return player.vote.yescount >= player.vote.var_89fa914f93f1284;
}

// Namespace ob_vote / namespace_6c57c664b4288f88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63b
// Size: 0xbe
function function_829515bd62609e2c(var_aa3a3c9a338ea9bc) {
    player = self;
    player notify("zm_vote_ended");
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("zm_vote_submitted");
    player endon("zm_vote_ended");
    while (true) {
        channel, value = player waittill("luinotifyserver");
        if (channel == "zm_vote") {
            voteprocessed = 0;
            if (value == 1) {
                function_daaf62a5c884f34d(var_aa3a3c9a338ea9bc);
                voteprocessed = 1;
            } else if (value == 2) {
                function_89edd64ed9997ba7(var_aa3a3c9a338ea9bc);
                voteprocessed = 1;
            }
            if (voteprocessed) {
                level.var_5a107145d8e88c36 zmvote::function_314fcf75686668fe(player, value);
                player notify("zm_vote_submitted");
            }
        }
    }
}

// Namespace ob_vote / namespace_6c57c664b4288f88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x701
// Size: 0xf1
function function_3e2db14d74da95e7(a_players) {
    player = self;
    playercount = a_players.size;
    var_89fa914f93f1284 = floor(playercount / 2) + 1;
    player function_5dffe49ad4961546(playercount, var_89fa914f93f1284);
    foreach (squad_player in a_players) {
        if (!level.var_5a107145d8e88c36 zmvote::is_open(squad_player)) {
            squad_player thread function_829515bd62609e2c(player);
            level.var_5a107145d8e88c36 zmvote::open(squad_player);
            level.var_5a107145d8e88c36 zmvote::function_ab84ca85d11789c7(squad_player, var_89fa914f93f1284);
            level.var_5a107145d8e88c36 zmvote::function_ac275402bbe52c1b(squad_player, 1);
            level.var_5a107145d8e88c36 zmvote::function_314fcf75686668fe(squad_player, 0);
        }
    }
}

// Namespace ob_vote / namespace_6c57c664b4288f88
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fa
// Size: 0x44
function function_37a354eaca18f977() {
    player = self;
    if (isdefined(player)) {
        a_squad = scripts\mp\utility\teams::getsquadmates(player.team, player.sessionsquadid, 1);
        function_3e2db14d74da95e7(a_squad);
    }
}

// Namespace ob_vote / namespace_6c57c664b4288f88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x846
// Size: 0x8e
function function_47f6a44a599fa91d(a_players) {
    foreach (player in a_players) {
        if (level.var_5a107145d8e88c36 zmvote::is_open(player)) {
            level.var_5a107145d8e88c36 zmvote::function_ac275402bbe52c1b(player, 0);
            level.var_5a107145d8e88c36 zmvote::close(player);
            player notify("zm_vote_ended");
        }
    }
}

// Namespace ob_vote / namespace_6c57c664b4288f88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dc
// Size: 0x4f
function function_8ce14e667ba9642d(delay) {
    wait delay;
    player = self;
    if (isdefined(player)) {
        a_squad = scripts\mp\utility\teams::getsquadmates(player.team, player.sessionsquadid, 1);
        function_47f6a44a599fa91d(a_squad);
    }
}

