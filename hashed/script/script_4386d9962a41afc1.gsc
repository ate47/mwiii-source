// mwiii decomp prototype
#using scripts\common\devgui.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_41387eecc35b88bf;
#using script_2707474774db34b;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using scripts\mp\utility\teams.gsc;

#namespace namespace_9fe96b983bb4b476;

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d2
// Size: 0x5b
function function_60a8777312cc62d7(player) {
    if (!isdefined(player)) {
        /#
            assertmsg("Attempting to abandon focused activity for an Undefined player.");
        #/
        return;
    }
    focusedactivity = function_deb5a4d2a7bda5e9(player);
    if (!isdefined(focusedactivity)) {
        /#
            println("<unknown string>" + "<unknown string>" + "<unknown string>");
        #/
        return;
    }
    function_90edaba623c87c34(focusedactivity, player);
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x334
// Size: 0x71
function function_90edaba623c87c34(activityinstance, player) {
    if (!function_6ebc53f792333cf5(activityinstance, player)) {
        return;
    }
    function_6a99c0e5fb21729c(activityinstance);
    if (function_e9433db9d33e1279(activityinstance, player)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    function_abaa57eec7d4c532(activityinstance, player);
    var_606f34fc1ead5c7a = function_16e0486e6ff0b40f(activityinstance, player);
    function_ddc88c261e9b3637(activityinstance, player, var_606f34fc1ead5c7a);
    function_55038a5fbb28f66c(activityinstance, player);
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac
// Size: 0x50
function function_c9afc8e2fd64917(activityinstance, player) {
    if (!function_6ebc53f792333cf5(activityinstance, player)) {
        return;
    }
    function_6a99c0e5fb21729c(activityinstance);
    if (function_a10d5774bdcd3b0a(activityinstance, player)) {
        function_23516e860dddbf1b(activityinstance, player);
        function_abaa57eec7d4c532(activityinstance, player);
        function_55038a5fbb28f66c(activityinstance, player, 1);
    }
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x403
// Size: 0x3c
function function_df7f1a29325af528(activityinstance, player) {
    if (!function_6ebc53f792333cf5(activityinstance, player)) {
        return;
    }
    function_6a99c0e5fb21729c(activityinstance);
    if (function_a10d5774bdcd3b0a(activityinstance, player)) {
        function_30b211b56a55ca0b(activityinstance, player);
    }
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x446
// Size: 0x3f
function function_2086dfaf421ea734(activityinstance, player) {
    if (!isdefined(activityinstance)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    function_a68f6703c78f0051(activityinstance, player);
    function_bbbdd2dc3be2f04d(activityinstance, player, "ActivityVoteResult_Cancelled");
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48c
// Size: 0x3a
function function_a10d5774bdcd3b0a(activityinstance, player) {
    if (!isdefined(activityinstance) || !isdefined(activityinstance.var_ced013ef63e76a7b)) {
        return false;
    }
    return function_2a87b98d1f58ddbc(activityinstance, player) == "ActivityVoteResult_InProgress";
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ce
// Size: 0x3b
function function_5a840337aed72780(activityinstance, var_6128c35fcd588a91) {
    var_6f8af5eb76deac21 = spawnstruct();
    var_6f8af5eb76deac21.var_6128c35fcd588a91 = var_6128c35fcd588a91;
    return function_104adc18c0d699c3(activityinstance, 8, var_6f8af5eb76deac21);
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x511
// Size: 0x27
function function_2d4b61447e3a46b0(var_6f8af5eb76deac21) {
    /#
        assertex(isdefined(var_6f8af5eb76deac21), "DefaultGetVotesNeededToAbandon requires relevantInfoStruct with votingPoolSize parameter.");
    #/
    return var_6f8af5eb76deac21.var_6128c35fcd588a91;
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x540
// Size: 0x86
function private function_ddc88c261e9b3637(activityinstance, player, var_606f34fc1ead5c7a) {
    votename = "ActivityVoteName_SquadAbandonVote";
    votes = function_f90897ff85a28f1a(activityinstance, player);
    var_9cc718b114d4f1f = function_37ffb7a5350616ca(player);
    var_7f59d74a1e866246 = function_355cd23c6cbf8dda(activityinstance, votename, votes, var_9cc718b114d4f1f, player, var_606f34fc1ead5c7a);
    function_735ee8e9d0f1b00b(activityinstance, "VoteCast", var_7f59d74a1e866246);
    /#
        function_26b72cfbd71e82f(activityinstance, player);
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5cd
// Size: 0x85
function private function_bbbdd2dc3be2f04d(activityinstance, player, voteresult) {
    votename = "ActivityVoteName_SquadAbandonVote";
    votes = function_f90897ff85a28f1a(activityinstance, player);
    var_9cc718b114d4f1f = function_37ffb7a5350616ca(player);
    var_7570a1bf222e764 = function_53a3019fd9a570ee(activityinstance, votename, votes, var_9cc718b114d4f1f, voteresult);
    function_735ee8e9d0f1b00b(activityinstance, "VoteEnd", var_7570a1bf222e764);
    /#
        function_fc57b4e33ab348a4(activityinstance, player);
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x659
// Size: 0x79
function private function_23516e860dddbf1b(activityinstance, player) {
    votename = "ActivityVoteName_SquadAbandonVote";
    votes = function_f90897ff85a28f1a(activityinstance, player);
    var_9cc718b114d4f1f = function_37ffb7a5350616ca(player);
    var_67254a043c6e16a2 = function_7bd0928341049890(activityinstance, votename, votes, var_9cc718b114d4f1f, player);
    function_735ee8e9d0f1b00b(activityinstance, "VoterLeft", var_67254a043c6e16a2);
    /#
        function_a03ac72779102a0d(activityinstance, player);
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6d9
// Size: 0x79
function private function_30b211b56a55ca0b(activityinstance, player) {
    votename = "ActivityVoteName_SquadAbandonVote";
    votes = function_f90897ff85a28f1a(activityinstance, player);
    var_9cc718b114d4f1f = function_37ffb7a5350616ca(player);
    var_4cde85e68dd32e22 = function_8873bece95ecf770(activityinstance, votename, votes, var_9cc718b114d4f1f, player);
    function_735ee8e9d0f1b00b(activityinstance, "VoterJoined", var_4cde85e68dd32e22);
    /#
        function_3408f40ca8f1c14d(activityinstance, player);
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x759
// Size: 0x5b
function private function_6ebc53f792333cf5(activityinstance, player) {
    if (!isdefined(activityinstance)) {
        /#
            println("<unknown string>");
        #/
        return false;
    }
    if (!isdefined(player)) {
        /#
            assertmsg("Cannot abandon activity for undefined player.");
        #/
        return false;
    }
    if (!isdefined(function_2ff949964e3aa834(player))) {
        /#
            assertmsg("Cannot cast vote for player with undefined sessionsquadid! The player must belong to a squad to cast a vote.");
        #/
        return false;
    }
    return true;
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7bc
// Size: 0x2e
function private function_6a99c0e5fb21729c(activityinstance) {
    if (isdefined(activityinstance) && !isdefined(activityinstance.var_ced013ef63e76a7b)) {
        activityinstance.var_ced013ef63e76a7b = [];
    }
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7f1
// Size: 0x4f
function private function_abaa57eec7d4c532(activityinstance, player) {
    squadid = function_2ff949964e3aa834(player);
    var_4dedd7975d526b67 = function_f90897ff85a28f1a(activityinstance, player);
    activityinstance.var_ced013ef63e76a7b[squadid] = function_8f9a51144ea9439(var_4dedd7975d526b67, player);
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x847
// Size: 0x7a
function private function_55038a5fbb28f66c(activityinstance, player, var_cd43ff40860c9198) {
    if (!isdefined(var_cd43ff40860c9198)) {
        var_cd43ff40860c9198 = 0;
    }
    voteresult = function_2a87b98d1f58ddbc(activityinstance, player, var_cd43ff40860c9198);
    if (voteresult == "ActivityVoteResult_Success") {
        function_bbbdd2dc3be2f04d(activityinstance, player, "ActivityVoteResult_Success");
        function_a68f6703c78f0051(activityinstance, player);
        function_cfc0a56c1b2b3bd8(activityinstance, player);
    } else if (voteresult == "ActivityVoteResult_Cancelled") {
        function_2086dfaf421ea734(activityinstance, player);
    }
    return voteresult;
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8c9
// Size: 0x54
function private function_2a87b98d1f58ddbc(activityinstance, player, var_cd43ff40860c9198) {
    if (!isdefined(var_cd43ff40860c9198)) {
        var_cd43ff40860c9198 = 0;
    }
    if (function_16e0486e6ff0b40f(activityinstance, player)) {
        return "ActivityVoteResult_Success";
    }
    if (function_effade86a709128b(activityinstance, player, var_cd43ff40860c9198)) {
        return "ActivityVoteResult_Cancelled";
    }
    return "ActivityVoteResult_InProgress";
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x924
// Size: 0x3a
function private function_f90897ff85a28f1a(activityinstance, player) {
    squadid = function_2ff949964e3aa834(player);
    return default_to(activityinstance.var_ced013ef63e76a7b[squadid], []);
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x966
// Size: 0x4a
function private function_a68f6703c78f0051(activityinstance, player) {
    if (!isdefined(activityinstance.var_ced013ef63e76a7b)) {
        function_6a99c0e5fb21729c(activityinstance);
    }
    squadid = function_2ff949964e3aa834(player);
    activityinstance.var_ced013ef63e76a7b[squadid] = undefined;
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9b7
// Size: 0x2f
function private function_e9433db9d33e1279(activityinstance, player) {
    var_685116b63258d4a8 = function_f90897ff85a28f1a(activityinstance, player);
    return array_contains(var_685116b63258d4a8, player);
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9ee
// Size: 0x50
function private function_16e0486e6ff0b40f(activityinstance, player) {
    var_a2464c9946830d54 = function_287b76a301747f8b(activityinstance, player);
    squadmates = function_37ffb7a5350616ca(player);
    var_be9b3cf0ecae71c3 = function_5a840337aed72780(activityinstance, squadmates.size);
    return var_a2464c9946830d54 >= var_be9b3cf0ecae71c3;
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa46
// Size: 0x4a
function private function_effade86a709128b(activityinstance, player, var_cd43ff40860c9198) {
    if (!isdefined(var_cd43ff40860c9198)) {
        var_cd43ff40860c9198 = 0;
    }
    votes = function_1b00dbbd01a915b0(activityinstance, player);
    if (var_cd43ff40860c9198) {
        votes = array_remove(votes, player);
    }
    return votes.size == 0;
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa98
// Size: 0x1d
function private function_287b76a301747f8b(activityinstance, player) {
    return function_1b00dbbd01a915b0(activityinstance, player).size;
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xabd
// Size: 0x41
function private function_1b00dbbd01a915b0(activityinstance, player) {
    var_a106a7879b77cf82 = function_f90897ff85a28f1a(activityinstance, player);
    squadmates = function_37ffb7a5350616ca(player);
    return function_50eabc100130bc0d(var_a106a7879b77cf82, squadmates);
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb06
// Size: 0x66
function private function_37ffb7a5350616ca(player) {
    /#
        if (isdefined(level.var_6acae859049cee46)) {
            return level.var_6acae859049cee46[player.team][player.sessionsquadid].players;
        }
    #/
    return scripts/mp/utility/teams::getsquadmates(player.team, player.sessionsquadid, 1);
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb74
// Size: 0x17
function private function_2ff949964e3aa834(player) {
    return player.sessionsquadid;
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb93
// Size: 0x1c
function private function_8f9a51144ea9439(votes, voter) {
    return function_6d6af8144a5131f1(votes, voter);
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbb7
// Size: 0x46
function private function_50eabc100130bc0d(votes, var_9cc718b114d4f1f) {
    if (!isdefined(votes)) {
        /#
            assertmsg("Cannot get valid votes, votes undefined!");
        #/
        return [];
    }
    if (!isdefined(var_9cc718b114d4f1f)) {
        /#
            assertmsg("Cannot get valid votes, voterPool undefined!");
        #/
        return [];
    }
    return array_intersection(votes, var_9cc718b114d4f1f);
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xc05
// Size: 0x1d
function private function_2161d9e590b59c26(votes, var_9cc718b114d4f1f) {
    return function_50eabc100130bc0d(votes, var_9cc718b114d4f1f).size;
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc2a
// Size: 0x85
function private function_d573f6bacfd88ce1(activityinstance, votename, votes, var_9cc718b114d4f1f) {
    var_829045d6a6fb2398 = spawnstruct();
    var_829045d6a6fb2398.activityinstance = default_to(activityinstance, undefined);
    var_829045d6a6fb2398.votename = default_to(votename, undefined);
    var_829045d6a6fb2398.votes = function_50eabc100130bc0d(votes, var_9cc718b114d4f1f);
    var_829045d6a6fb2398.var_9cc718b114d4f1f = default_to(var_9cc718b114d4f1f, []);
    return var_829045d6a6fb2398;
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcb7
// Size: 0x73
function private function_355cd23c6cbf8dda(activityinstance, votename, votes, var_9cc718b114d4f1f, voter, var_606f34fc1ead5c7a) {
    var_8a524fffb1608986 = function_d573f6bacfd88ce1(activityinstance, votename, votes, var_9cc718b114d4f1f);
    var_8a524fffb1608986.voter = default_to(voter, undefined);
    var_8a524fffb1608986.var_606f34fc1ead5c7a = default_to(var_606f34fc1ead5c7a, undefined);
    return var_8a524fffb1608986;
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd32
// Size: 0x56
function private function_53a3019fd9a570ee(activityinstance, votename, votes, var_9cc718b114d4f1f, voteresult) {
    var_1b80ce1214a34892 = function_d573f6bacfd88ce1(activityinstance, votename, votes, var_9cc718b114d4f1f);
    var_1b80ce1214a34892.voteresult = default_to(voteresult, undefined);
    return var_1b80ce1214a34892;
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd90
// Size: 0x4f
function private function_7bd0928341049890(activityinstance, votename, votes, var_9cc718b114d4f1f, var_221836e6a7cb1ba2) {
    var_77b0135065515fcc = function_d573f6bacfd88ce1(activityinstance, votename, votes, var_9cc718b114d4f1f);
    var_77b0135065515fcc.var_221836e6a7cb1ba2 = var_221836e6a7cb1ba2;
    return var_77b0135065515fcc;
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xde7
// Size: 0x4f
function private function_8873bece95ecf770(activityinstance, votename, votes, var_9cc718b114d4f1f, var_335006ae8b51467a) {
    var_21e6bf5f655206fc = function_d573f6bacfd88ce1(activityinstance, votename, votes, var_9cc718b114d4f1f);
    var_21e6bf5f655206fc.var_335006ae8b51467a = var_335006ae8b51467a;
    return var_21e6bf5f655206fc;
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xe3e
// Size: 0x7a
function private function_26b72cfbd71e82f(activityinstance, player) {
    /#
        squadmates = function_37ffb7a5350616ca(player);
        var_45a14dd1749cb60c = function_287b76a301747f8b(activityinstance, player);
        println("<unknown string>" + "<unknown string>" + function_de53ed8e35d0ed7a(activityinstance) + "<unknown string>" + function_a4748b32a824c79c(activityinstance) + "<unknown string>" + var_45a14dd1749cb60c + "<unknown string>" + squadmates.size + "<unknown string>");
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xebf
// Size: 0x56
function private function_fc57b4e33ab348a4(activityinstance, player) {
    /#
        println("<unknown string>" + "<unknown string>" + function_de53ed8e35d0ed7a(activityinstance) + "<unknown string>" + function_a4748b32a824c79c(activityinstance) + "<unknown string>" + player.sessionsquadid + "<unknown string>");
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xf1c
// Size: 0x7a
function private function_a03ac72779102a0d(activityinstance, player) {
    /#
        squadmates = function_37ffb7a5350616ca(player);
        var_45a14dd1749cb60c = function_287b76a301747f8b(activityinstance, player);
        println("<unknown string>" + "<unknown string>" + function_de53ed8e35d0ed7a(activityinstance) + "<unknown string>" + function_a4748b32a824c79c(activityinstance) + "<unknown string>" + var_45a14dd1749cb60c + "<unknown string>" + squadmates.size + "<unknown string>");
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xf9d
// Size: 0x7a
function private function_3408f40ca8f1c14d(activityinstance, player) {
    /#
        squadmates = function_37ffb7a5350616ca(player);
        var_45a14dd1749cb60c = function_287b76a301747f8b(activityinstance, player);
        println("<unknown string>" + "<unknown string>" + function_de53ed8e35d0ed7a(activityinstance) + "<unknown string>" + function_a4748b32a824c79c(activityinstance) + "<unknown string>" + var_45a14dd1749cb60c + "<unknown string>" + squadmates.size + "<unknown string>");
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x101e
// Size: 0x1b5
function function_781d567ca3db5852() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_5f5e9bf7fe8e6eaf);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_6017dcd09f997b8);
        function_fe953f000498048f();
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_d822738c9392a3a4);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_5f5e9bf7fe8e6eaf);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_20715510ce25c247);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_20715610ce25c47a);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_20715710ce25c6ad);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_3f8bf4c34fe29837);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_3f8bf5c34fe29a6a);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_3f8bf6c34fe29c9d);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_602310868171d271);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_e30f9ce33ee435dc);
        function_fe953f000498048f();
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &_info);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_5f5e9bf7fe8e6eaf);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_da02cb35301e149c);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_da02ce35301e1b35);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_da02cd35301e1902);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11da
// Size: 0x7
function private _info() {
    /#
        return;
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11e8
// Size: 0x2e
function private function_5f5e9bf7fe8e6eaf() {
    /#
        hostplayer = gethostplayer();
        if (isdefined(hostplayer) && isplayer(hostplayer)) {
            function_60a8777312cc62d7(hostplayer);
        }
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x121d
// Size: 0x4e
function private function_da02cb35301e149c() {
    /#
        player = level.players[1];
        if (isdefined(player)) {
            hostplayer = gethostplayer();
            var_9a57b22168b90b20 = function_deb5a4d2a7bda5e9(hostplayer);
            function_90edaba623c87c34(var_9a57b22168b90b20, player);
        }
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1272
// Size: 0x4e
function private function_da02ce35301e1b35() {
    /#
        player = level.players[2];
        if (isdefined(player)) {
            hostplayer = gethostplayer();
            var_9a57b22168b90b20 = function_deb5a4d2a7bda5e9(hostplayer);
            function_90edaba623c87c34(var_9a57b22168b90b20, player);
        }
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x12c7
// Size: 0x4e
function private function_da02cd35301e1902() {
    /#
        player = level.players[3];
        if (isdefined(player)) {
            hostplayer = gethostplayer();
            var_9a57b22168b90b20 = function_deb5a4d2a7bda5e9(hostplayer);
            function_90edaba623c87c34(var_9a57b22168b90b20, player);
        }
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x131c
// Size: 0x4c
function private function_6017dcd09f997b8() {
    /#
        hostplayer = gethostplayer();
        if (isdefined(hostplayer) && isplayer(hostplayer)) {
            var_9a57b22168b90b20 = function_deb5a4d2a7bda5e9(hostplayer);
            function_2086dfaf421ea734(var_9a57b22168b90b20, hostplayer);
            iprintlnbold("<unknown string>");
        }
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x136f
// Size: 0x4e
function private function_d822738c9392a3a4() {
    /#
        function_d03304e5566c46d(1);
        var_15aaab03bcacac6b = 3;
        for (i = 0; i < var_15aaab03bcacac6b; i++) {
            function_ad8674854251fb51();
        }
        iprintlnbold("<unknown string>" + var_15aaab03bcacac6b + "<unknown string>");
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x13c4
// Size: 0xb7
function private function_d03304e5566c46d(force) {
    /#
        if (!isdefined(force)) {
            force = 0;
        }
        if (!force || isdefined(level.var_6acae859049cee46)) {
            return;
        }
        hostplayer = gethostplayer();
        level.var_6acae859049cee46 = [];
        level.var_6acae859049cee46[hostplayer.team] = [];
        level.var_6acae859049cee46[hostplayer.team][hostplayer.sessionsquadid] = spawnstruct();
        level.var_6acae859049cee46[hostplayer.team][hostplayer.sessionsquadid].players = [hostplayer];
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1482
// Size: 0xfa
function private function_ad8674854251fb51() {
    /#
        level.var_4f695def88a58b60 = default_to(level.var_4f695def88a58b60, 1);
        hostplayer = gethostplayer();
        fakeplayer = spawnstruct();
        fakeplayer.sessionsquadid = hostplayer.sessionsquadid;
        fakeplayer.team = hostplayer.team;
        fakeplayer.fakeid = level.var_4f695def88a58b60;
        players = level.var_6acae859049cee46[hostplayer.team][hostplayer.sessionsquadid].players;
        level.var_6acae859049cee46[hostplayer.team][hostplayer.sessionsquadid].players = array_add(players, fakeplayer);
        level.var_4f695def88a58b60++;
        return fakeplayer;
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1583
// Size: 0x4a
function private function_602310868171d271() {
    /#
        function_d03304e5566c46d();
        hostplayer = gethostplayer();
        fakeplayer = function_ad8674854251fb51();
        var_9a57b22168b90b20 = function_deb5a4d2a7bda5e9(hostplayer);
        function_df7f1a29325af528(var_9a57b22168b90b20, fakeplayer);
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x15d4
// Size: 0x8d
function private function_43f82d766b25b7b(var_254c3eaf98cbc328) {
    /#
        if (!isdefined(level.var_6acae859049cee46)) {
            return;
        }
        hostplayer = gethostplayer();
        if (!isdefined(hostplayer)) {
            return;
        }
        squadmember = level.var_6acae859049cee46[hostplayer.team][hostplayer.sessionsquadid].players[var_254c3eaf98cbc328];
        if (!isdefined(squadmember)) {
            return;
        }
        var_9a57b22168b90b20 = function_deb5a4d2a7bda5e9(hostplayer);
        function_90edaba623c87c34(var_9a57b22168b90b20, squadmember);
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1668
// Size: 0xf
function private function_20715510ce25c247() {
    /#
        function_43f82d766b25b7b(1);
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x167e
// Size: 0xf
function private function_20715610ce25c47a() {
    /#
        function_43f82d766b25b7b(2);
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1694
// Size: 0xf
function private function_20715710ce25c6ad() {
    /#
        function_43f82d766b25b7b(3);
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x16aa
// Size: 0x137
function private function_e30f9ce33ee435dc(var_254c3eaf98cbc328) {
    /#
        if (!isdefined(level.var_6acae859049cee46)) {
            return;
        }
        hostplayer = gethostplayer();
        if (!isdefined(hostplayer)) {
            return;
        }
        var_254c3eaf98cbc328 = default_to(var_254c3eaf98cbc328, level.var_6acae859049cee46[hostplayer.team][hostplayer.sessionsquadid].players.size - 1);
        squadmember = level.var_6acae859049cee46[hostplayer.team][hostplayer.sessionsquadid].players[var_254c3eaf98cbc328];
        if (!isdefined(squadmember) || squadmember == hostplayer) {
            return;
        }
        var_9a57b22168b90b20 = function_deb5a4d2a7bda5e9(hostplayer);
        function_c9afc8e2fd64917(var_9a57b22168b90b20, squadmember);
        players = level.var_6acae859049cee46[hostplayer.team][hostplayer.sessionsquadid].players;
        level.var_6acae859049cee46[hostplayer.team][hostplayer.sessionsquadid].players = array_remove(players, squadmember);
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x17e8
// Size: 0xf
function private function_3f8bf4c34fe29837() {
    /#
        function_e30f9ce33ee435dc(1);
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x17fe
// Size: 0xf
function private function_3f8bf5c34fe29a6a() {
    /#
        function_e30f9ce33ee435dc(2);
    #/
}

// Namespace namespace_9fe96b983bb4b476 / namespace_6854ffbed339ca49
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1814
// Size: 0xf
function private function_3f8bf6c34fe29c9d() {
    /#
        function_e30f9ce33ee435dc(3);
    #/
}

