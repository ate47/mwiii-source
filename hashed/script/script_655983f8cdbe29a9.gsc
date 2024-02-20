// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_41387eecc35b88bf;
#using script_4386d9962a41afc1;
#using script_2707474774db34b;
#using script_64351208cb856df9;
#using script_3ab210ea917601e7;
#using script_413d0426f154bd91;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using script_2342b8aad723994e;
#using script_185660037b9236c1;

#namespace namespace_2554c2c2cdfe946a;

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26f
// Size: 0x72
function function_6a7daea470efc1d9() {
    function_8b5b2a3392fc7e2a("VoteCast", &function_eb603ecd0264ebff);
    function_8b5b2a3392fc7e2a("VoteEnd", &function_67cfb9f49c173a55);
    function_8b5b2a3392fc7e2a("VoterLeft", &function_fc0c08e86e69f523);
    function_8b5b2a3392fc7e2a("VoterJoined", &function_a04e24f1e02f64a3);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_364921384956c883);
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_74463513226ae6d8);
    level thread function_926d53d0ef3b934f();
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e8
// Size: 0x1c
function private function_926d53d0ef3b934f() {
    waittillframeend();
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&function_f13d5e60313341a2);
    namespace_c31609f90efcf2ca::function_a99987c7bf114da4(&function_c6c8135d5098c8bd);
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b
// Size: 0x45
function function_f13d5e60313341a2(notification, value) {
    var_a358a73419e73edc = self;
    if (isdefined(notification)) {
        switch (notification) {
        case #"hash_9fd64c8b171158f":
            function_60a8777312cc62d7(var_a358a73419e73edc);
            break;
        }
    }
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x357
// Size: 0x3a
function function_83d789bbe0f2a395(var_6f8af5eb76deac21) {
    /#
        assertex(isdefined(var_6f8af5eb76deac21), "OB_GetVotesNeededToAbandon requires relevantInfoStruct with votingPoolSize parameter.");
    #/
    return int(floor(var_6f8af5eb76deac21.var_6128c35fcd588a91 / 2)) + 1;
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x399
// Size: 0x9b
function function_eb603ecd0264ebff(var_119d717380769cab) {
    var_695864fa3eb4ad7a = var_119d717380769cab.var_695864fa3eb4ad7a;
    var_e6013eac45290cab = var_119d717380769cab.var_e6013eac45290cab;
    if (var_695864fa3eb4ad7a == "ActivityVoteName_SquadAbandonVote") {
        var_c8992e431d7ba2c8 = namespace_68dc261109a9503f::function_511be8bcaede8b52(var_e6013eac45290cab);
        if (var_c8992e431d7ba2c8 == "Contract") {
            function_cfe3ee6afa35b1ed(var_119d717380769cab);
        } else {
            /#
                println("<unknown string>");
            #/
        }
    } else {
        /#
            assertmsg("Activity Vote Name " + function_53c4c53197386572(var_695864fa3eb4ad7a, "undefined") + " not recognized!");
        #/
    }
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43b
// Size: 0xab
function function_67cfb9f49c173a55(var_e3debb20afae825d) {
    var_695864fa3eb4ad7a = var_e3debb20afae825d.var_695864fa3eb4ad7a;
    var_e6013eac45290cab = var_e3debb20afae825d.var_e6013eac45290cab;
    /#
        println("<unknown string>" + var_695864fa3eb4ad7a);
    #/
    var_c8992e431d7ba2c8 = namespace_68dc261109a9503f::function_511be8bcaede8b52(var_e6013eac45290cab);
    if (var_695864fa3eb4ad7a == "ActivityVoteName_SquadAbandonVote") {
        if (var_c8992e431d7ba2c8 == "Contract") {
            function_35b527a921bdf073(var_e3debb20afae825d);
        } else {
            /#
                println("<unknown string>");
            #/
        }
    } else {
        /#
            assertmsg("Activity Vote Name " + function_53c4c53197386572(var_695864fa3eb4ad7a, "undefined") + " not recognized!");
        #/
    }
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ed
// Size: 0x9b
function function_fc0c08e86e69f523(var_ddfe971f6eba42f7) {
    var_695864fa3eb4ad7a = var_ddfe971f6eba42f7.var_695864fa3eb4ad7a;
    var_e6013eac45290cab = var_ddfe971f6eba42f7.var_e6013eac45290cab;
    var_c8992e431d7ba2c8 = namespace_68dc261109a9503f::function_511be8bcaede8b52(var_e6013eac45290cab);
    if (var_695864fa3eb4ad7a == "ActivityVoteName_SquadAbandonVote") {
        if (var_c8992e431d7ba2c8 == "Contract") {
            function_eb665b5004d1fee1(var_ddfe971f6eba42f7);
        } else {
            /#
                println("<unknown string>");
            #/
        }
    } else {
        /#
            assertmsg("Activity Vote Name " + function_53c4c53197386572(var_695864fa3eb4ad7a, "undefined") + " not recognized!");
        #/
    }
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58f
// Size: 0x9b
function function_a04e24f1e02f64a3(var_d07fa562a0968e77) {
    var_695864fa3eb4ad7a = var_d07fa562a0968e77.var_695864fa3eb4ad7a;
    var_e6013eac45290cab = var_d07fa562a0968e77.var_e6013eac45290cab;
    var_c8992e431d7ba2c8 = namespace_68dc261109a9503f::function_511be8bcaede8b52(var_e6013eac45290cab);
    if (var_695864fa3eb4ad7a == "ActivityVoteName_SquadAbandonVote") {
        if (var_c8992e431d7ba2c8 == "Contract") {
            function_ac52181dfb097d61(var_d07fa562a0968e77);
        } else {
            /#
                println("<unknown string>");
            #/
        }
    } else {
        /#
            assertmsg("Activity Vote Name " + function_53c4c53197386572(var_695864fa3eb4ad7a, "undefined") + " not recognized!");
        #/
    }
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x631
// Size: 0xc4
function function_cfe3ee6afa35b1ed(var_119d717380769cab) {
    var_a106a7879b77cf82 = var_119d717380769cab.votes;
    var_607da387f3617ed1 = var_119d717380769cab.var_9cc718b114d4f1f;
    var_606f34fc1ead5c7a = var_119d717380769cab.var_606f34fc1ead5c7a;
    var_e6013eac45290cab = var_119d717380769cab.var_e6013eac45290cab;
    if (var_606f34fc1ead5c7a) {
        return;
    }
    var_ebbf760b3a1c31c8 = function_6cd86b4ad51f706f(var_607da387f3617ed1);
    var_981d063c4d4f4efd = array_difference(var_ebbf760b3a1c31c8, var_a106a7879b77cf82);
    var_be9b3cf0ecae71c3 = function_5a840337aed72780(var_e6013eac45290cab, var_607da387f3617ed1.size);
    function_bc0f3d487294cad5(var_981d063c4d4f4efd, var_e6013eac45290cab);
    function_c31a48687806ff04(var_ebbf760b3a1c31c8, var_e6013eac45290cab, var_a106a7879b77cf82.size, var_be9b3cf0ecae71c3);
    function_b80a437fe56905e(var_ebbf760b3a1c31c8, var_a106a7879b77cf82, var_be9b3cf0ecae71c3);
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fc
// Size: 0x77
function function_35b527a921bdf073(var_e3debb20afae825d) {
    var_607da387f3617ed1 = var_e3debb20afae825d.var_9cc718b114d4f1f;
    var_2961e86b864ec2b0 = var_e3debb20afae825d.var_2961e86b864ec2b0;
    var_ebbf760b3a1c31c8 = function_6cd86b4ad51f706f(var_607da387f3617ed1);
    function_dfbfdbfaf2d22009(var_ebbf760b3a1c31c8);
    if (var_2961e86b864ec2b0 == "ActivityVoteResult_Success") {
        goto LOC_00000075;
    }
    if (var_2961e86b864ec2b0 == "ActivityVoteResult_Cancelled") {
        /#
            println("<unknown string>");
        LOC_00000075:
        #/
    LOC_00000075:
    }
LOC_00000075:
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77a
// Size: 0xaf
function function_eb665b5004d1fee1(var_ddfe971f6eba42f7) {
    var_a106a7879b77cf82 = var_ddfe971f6eba42f7.votes;
    var_607da387f3617ed1 = var_ddfe971f6eba42f7.var_9cc718b114d4f1f;
    var_221836e6a7cb1ba2 = var_ddfe971f6eba42f7.var_221836e6a7cb1ba2;
    var_f1a1a53b821f7add = array_remove(var_a106a7879b77cf82, var_221836e6a7cb1ba2);
    var_8dd686fbe6c35ee8 = array_remove(var_607da387f3617ed1, var_221836e6a7cb1ba2);
    var_21a979337d190aff = function_6cd86b4ad51f706f(var_8dd686fbe6c35ee8);
    var_be9b3cf0ecae71c3 = function_5a840337aed72780(var_ddfe971f6eba42f7.var_e6013eac45290cab, var_8dd686fbe6c35ee8.size);
    function_b80a437fe56905e(var_21a979337d190aff, var_f1a1a53b821f7add, var_be9b3cf0ecae71c3);
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x830
// Size: 0x9b
function function_ac52181dfb097d61(var_d07fa562a0968e77) {
    var_a106a7879b77cf82 = var_d07fa562a0968e77.votes;
    var_607da387f3617ed1 = var_d07fa562a0968e77.var_9cc718b114d4f1f;
    var_335006ae8b51467a = var_d07fa562a0968e77.var_335006ae8b51467a;
    var_5016114507a764ee = function_6d6af8144a5131f1(var_607da387f3617ed1, var_335006ae8b51467a);
    var_e012c70db5c8944b = function_6cd86b4ad51f706f(var_5016114507a764ee);
    var_be9b3cf0ecae71c3 = function_5a840337aed72780(var_d07fa562a0968e77.var_e6013eac45290cab, var_5016114507a764ee.size);
    function_b80a437fe56905e(var_e012c70db5c8944b, var_a106a7879b77cf82, var_be9b3cf0ecae71c3);
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d2
// Size: 0x51
function function_c31a48687806ff04(players, var_e6013eac45290cab, votecount, var_3cfd3771899bec37) {
    var_d9505959b1887327 = votecount | var_3cfd3771899bec37 << 3;
    function_9e5dd3840e95f4a3(var_e6013eac45290cab, "abandon_vote_pending_cancellation_state", var_d9505959b1887327);
    var_e6013eac45290cab namespace_a93e7904fe28c5c4::function_1281c7fff9456e18("abandon_vote_pending_splash", players);
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92a
// Size: 0x22
function function_bc0f3d487294cad5(players, var_e6013eac45290cab) {
    var_e6013eac45290cab namespace_a93e7904fe28c5c4::function_1281c7fff9456e18("abandon_vote_pending_vo", players);
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x953
// Size: 0xfa
function function_b80a437fe56905e(players, var_26cd054804fea35b, var_3cfd3771899bec37) {
    var_d9505959b1887327 = var_26cd054804fea35b.size | var_3cfd3771899bec37 << 3;
    foreach (player in players) {
        var_9aa013e99f8613fa = var_d9505959b1887327;
        foreach (var_3851e2de41e0caa9 in var_26cd054804fea35b) {
            if (player.clientid == var_3851e2de41e0caa9.clientid) {
                var_9aa013e99f8613fa = var_9aa013e99f8613fa | 64;
                break;
            }
        }
        player setclientomnvar("ui_br_contract_cancellation_state", var_9aa013e99f8613fa);
    }
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa54
// Size: 0x5e
function function_dfbfdbfaf2d22009(players) {
    foreach (player in players) {
        player setclientomnvar("ui_br_contract_cancellation_state", 0);
    }
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab9
// Size: 0x27
function private function_c6c8135d5098c8bd(player) {
    var_c6efd502b05276b3 = function_deb5a4d2a7bda5e9(player);
    function_c9afc8e2fd64917(var_c6efd502b05276b3, player);
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xae7
// Size: 0x64
function private function_74463513226ae6d8(var_6f8af5eb76deac21) {
    foreach (player in var_6f8af5eb76deac21.playerlist) {
        function_c9afc8e2fd64917(self, player);
    }
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb52
// Size: 0x64
function private function_364921384956c883(var_6f8af5eb76deac21) {
    foreach (player in var_6f8af5eb76deac21.playerlist) {
        function_df7f1a29325af528(self, player);
    }
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbbd
// Size: 0x3e
function private function_9e5dd3840e95f4a3(var_e6013eac45290cab, var_6c8dd7ef593a9ecc, var_f08069d89a19f82) {
    if (var_e6013eac45290cab namespace_4e0147999438b62::function_6a26856f16c6a207(var_6c8dd7ef593a9ecc)) {
        var_e6013eac45290cab namespace_4e0147999438b62::function_db95dd6225b6add8(var_6c8dd7ef593a9ecc, var_f08069d89a19f82);
    } else {
        var_e6013eac45290cab namespace_4e0147999438b62::function_b584ae8dddb33821(var_6c8dd7ef593a9ecc, var_f08069d89a19f82);
    }
}

// Namespace namespace_2554c2c2cdfe946a/namespace_b4d282b6f16e6a67
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc02
// Size: 0x77
function private function_6cd86b4ad51f706f(var_607da387f3617ed1) {
    var_ebbf760b3a1c31c8 = [];
    foreach (var_8f7040e569ec9e98 in var_607da387f3617ed1) {
        if (isplayer(var_8f7040e569ec9e98) && !isbot(var_8f7040e569ec9e98)) {
            var_ebbf760b3a1c31c8[var_ebbf760b3a1c31c8.size] = var_8f7040e569ec9e98;
        }
    }
    return var_ebbf760b3a1c31c8;
}
