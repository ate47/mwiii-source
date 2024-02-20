// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;

#namespace namespace_969918091e5d9483;

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x274
// Size: 0x3f
function function_5281975e60eac3a(var_127743befe53da2e) {
    if (!isdefined(self.var_a8f9789edd592f29)) {
        self.var_a8f9789edd592f29 = [];
    }
    if (!isdefined(self.var_a8f9789edd592f29[var_127743befe53da2e])) {
        self.var_a8f9789edd592f29[var_127743befe53da2e] = 0;
    }
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ba
// Size: 0x67
function function_cc33f4ece5dca487(var_127743befe53da2e, index) {
    if (!isdefined(self.var_a8f9789edd592f29)) {
        self.var_a8f9789edd592f29 = [];
    }
    if (!isdefined(self.var_a8f9789edd592f29[var_127743befe53da2e])) {
        self.var_a8f9789edd592f29[var_127743befe53da2e] = [];
    }
    if (!isdefined(self.var_a8f9789edd592f29[var_127743befe53da2e][index])) {
        self.var_a8f9789edd592f29[var_127743befe53da2e][index] = 0;
    }
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x328
// Size: 0x3f
function function_b899bce95b7d6a94(var_cf76a3550b35080c) {
    if (!isdefined(self.var_e41d482461d4594f)) {
        self.var_e41d482461d4594f = [];
    }
    if (!isdefined(self.var_e41d482461d4594f[var_cf76a3550b35080c])) {
        self.var_e41d482461d4594f[var_cf76a3550b35080c] = 0;
    }
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36e
// Size: 0x48
function function_d16498b27251da56(var_127743befe53da2e, increment) {
    function_5281975e60eac3a(var_127743befe53da2e);
    self.var_a8f9789edd592f29[var_127743befe53da2e] = self.var_a8f9789edd592f29[var_127743befe53da2e] + increment;
    function_7ee466e81b1afc12(var_127743befe53da2e, self.var_a8f9789edd592f29[var_127743befe53da2e]);
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bd
// Size: 0x31
function function_48544e365f4f5648(var_cf76a3550b35080c, increment) {
    function_b899bce95b7d6a94(var_cf76a3550b35080c);
    function_f8b808cd6473e6cc(var_cf76a3550b35080c, self.var_e41d482461d4594f[var_cf76a3550b35080c] + increment);
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f5
// Size: 0x3c
function function_7ee466e81b1afc12(var_127743befe53da2e, value) {
    if (!isplayer(self)) {
        return;
    }
    function_5281975e60eac3a(var_127743befe53da2e);
    self.var_a8f9789edd592f29[var_127743befe53da2e] = value;
    self function_ac1512504ba75f25(var_127743befe53da2e, value);
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x438
// Size: 0x48
function function_6807ed320b73be7f(var_127743befe53da2e, index, value) {
    if (!isplayer(self)) {
        return;
    }
    function_cc33f4ece5dca487(var_127743befe53da2e, index);
    self.var_a8f9789edd592f29[var_127743befe53da2e][index] = value;
    self function_ac1512504ba75f25(var_127743befe53da2e, value, index);
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x487
// Size: 0x4c
function function_f8b808cd6473e6cc(var_cf76a3550b35080c, value) {
    if (!isplayer(self)) {
        return;
    }
    function_b899bce95b7d6a94(var_cf76a3550b35080c);
    if (self.var_e41d482461d4594f[var_cf76a3550b35080c] != value) {
        self.var_e41d482461d4594f[var_cf76a3550b35080c] = value;
        self function_d743ebe29c5a6e7f(var_cf76a3550b35080c, value);
    }
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4da
// Size: 0x1f
function function_815fee43d577e1b6(var_127743befe53da2e) {
    function_5281975e60eac3a(var_127743befe53da2e);
    return self.var_a8f9789edd592f29[var_127743befe53da2e];
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x501
// Size: 0x1f
function function_a08fea26a49145a8(var_cf76a3550b35080c) {
    function_b899bce95b7d6a94(var_cf76a3550b35080c);
    return self.var_e41d482461d4594f[var_cf76a3550b35080c];
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x528
// Size: 0x3f
function function_aef8a28143d1f9ad(var_9138ab59ff517f7b) {
    if (!isdefined(self.var_1a34ed8eb5c6e9c)) {
        self.var_1a34ed8eb5c6e9c = [];
    }
    if (!isdefined(self.var_1a34ed8eb5c6e9c[var_9138ab59ff517f7b])) {
        self.var_1a34ed8eb5c6e9c[var_9138ab59ff517f7b] = 0;
    }
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56e
// Size: 0x48
function function_1882f80b14421089(var_9138ab59ff517f7b, increment) {
    function_aef8a28143d1f9ad(var_9138ab59ff517f7b);
    self.var_1a34ed8eb5c6e9c[var_9138ab59ff517f7b] = self.var_1a34ed8eb5c6e9c[var_9138ab59ff517f7b] + increment;
    function_5a82c337b996baa5(var_9138ab59ff517f7b, self.var_1a34ed8eb5c6e9c[var_9138ab59ff517f7b]);
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bd
// Size: 0x3b
function function_5a82c337b996baa5(var_9138ab59ff517f7b, value) {
    if (!isplayer(self)) {
        return;
    }
    function_aef8a28143d1f9ad(var_9138ab59ff517f7b);
    self.var_1a34ed8eb5c6e9c[var_9138ab59ff517f7b] = value;
    function_ad829fab97971b4b(var_9138ab59ff517f7b);
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ff
// Size: 0x1f
function function_e42724fbfacff469(var_9138ab59ff517f7b) {
    function_aef8a28143d1f9ad(var_9138ab59ff517f7b);
    return self.var_1a34ed8eb5c6e9c[var_9138ab59ff517f7b];
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x626
// Size: 0x126
function function_ad829fab97971b4b(var_9138ab59ff517f7b) {
    if (var_9138ab59ff517f7b == 0 || var_9138ab59ff517f7b == 1) {
        function_7ee466e81b1afc12(0, function_1b32a33893becbcf());
        return;
    }
    if (var_9138ab59ff517f7b == 6) {
        consecutiveKills = self.var_1a34ed8eb5c6e9c[6];
        function_7ee466e81b1afc12(6, consecutiveKills);
        var_51538fe8520e4052 = function_815fee43d577e1b6(7);
        if (consecutiveKills > var_51538fe8520e4052) {
            function_7ee466e81b1afc12(7, consecutiveKills);
        }
        return;
    }
    if (var_9138ab59ff517f7b == 3) {
        var_128ce76c9c22e1bc = self.var_1a34ed8eb5c6e9c[3];
        function_f8b808cd6473e6cc(13, function_d1f982e1e54336ec(var_128ce76c9c22e1bc));
        function_f8b808cd6473e6cc(14, function_d6a8339d07d64d73(var_128ce76c9c22e1bc));
        function_f8b808cd6473e6cc(1, function_9d923691177ce2a7(function_a08fea26a49145a8(0), var_128ce76c9c22e1bc));
        return;
    }
    if (var_9138ab59ff517f7b == 4) {
        var_b39bb65d413613b6 = self.var_1a34ed8eb5c6e9c[4];
        function_f8b808cd6473e6cc(5, function_d1f982e1e54336ec(var_b39bb65d413613b6));
        function_f8b808cd6473e6cc(6, function_d6a8339d07d64d73(var_b39bb65d413613b6));
        return;
    }
    if (var_9138ab59ff517f7b == 5) {
        if (function_726f071c1f349dd4()) {
            function_48544e365f4f5648(12, 1);
        }
        return;
    }
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x753
// Size: 0x2a
function function_726f071c1f349dd4() {
    function_b899bce95b7d6a94(12);
    return floor(self.var_1a34ed8eb5c6e9c[5]) > self.var_e41d482461d4594f[12];
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x785
// Size: 0x74
function function_1b32a33893becbcf() {
    if (!isdefined(self.var_1a34ed8eb5c6e9c) || !isdefined(self.var_1a34ed8eb5c6e9c[0]) || !isdefined(self.var_1a34ed8eb5c6e9c[1])) {
        return 0;
    }
    shots = self.var_1a34ed8eb5c6e9c[0];
    if (shots <= 0) {
        return 0;
    }
    hits = self.var_1a34ed8eb5c6e9c[1];
    return hits / shots;
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x801
// Size: 0x22
function function_d1f982e1e54336ec(var_3436f757aee9ef90) {
    return function_9d923691177ce2a7(self.pers["kills"], var_3436f757aee9ef90);
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82b
// Size: 0x1b
function function_d6a8339d07d64d73(var_3436f757aee9ef90) {
    return function_9d923691177ce2a7(function_815fee43d577e1b6(1), var_3436f757aee9ef90);
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84e
// Size: 0x30
function function_9d923691177ce2a7(stat, denominator) {
    if (!isdefined(stat) || !isdefined(denominator) || denominator <= 0) {
        return 0;
    }
    return stat / denominator;
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x886
// Size: 0x2ee
function function_2e28105e6500a144(player) {
    if (!isdefined(player)) {
        return;
    }
    logstring(player.name + ": ");
    debugstring = "		codcasterClientStats: ";
    if (isdefined(player.var_a8f9789edd592f29)) {
        foreach (index, value in player.var_a8f9789edd592f29) {
            if (!isarray(value)) {
                debugstring = debugstring + value + "~ [" + index + "]" + " / ";
            } else {
                foreach (i, var_9f08102ff8f6a887 in value) {
                    debugstring = debugstring + var_9f08102ff8f6a887 + ",";
                }
                debugstring = debugstring + "~ [" + index + "]" + " / ";
            }
        }
    }
    logstring(debugstring);
    debugstring = "		localCodcasterClientStat: ";
    if (isdefined(player.var_1a34ed8eb5c6e9c)) {
        foreach (index, value in player.var_1a34ed8eb5c6e9c) {
            if (!isarray(value)) {
                debugstring = debugstring + value + "~ [" + index + "]" + " / ";
            } else {
                foreach (i, var_9f08102ff8f6a887 in value) {
                    debugstring = debugstring + var_9f08102ff8f6a887 + ",";
                }
                debugstring = debugstring + "~ [" + index + "]" + " / ";
            }
        }
    }
    logstring(debugstring);
    debugstring = "		codcasterGametypeClientStats: ";
    if (isdefined(player.var_e41d482461d4594f)) {
        foreach (index, value in player.var_e41d482461d4594f) {
            if (!isarray(value)) {
                debugstring = debugstring + value + "~ [" + index + "]" + " / ";
            } else {
                foreach (var_9f08102ff8f6a887 in value) {
                    debugstring = debugstring + var_9f08102ff8f6a887 + ",";
                }
                debugstring = debugstring + "~ [" + index + "]" + " / ";
            }
        }
    }
    logstring(debugstring);
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7b
// Size: 0xe5
function function_edba1ee7c2375a5() {
    game["codcasterClientStatsSaveBetweenRounds"] = [];
    game["localCodcasterClientStatsSaveBetweenRounds"] = [];
    game["codcasterGametypeClientStatsSaveBetweenRounds"] = [];
    foreach (player in level.players) {
        if (getdvarint(@"hash_b0b065fcee59b58d", 0) == 1) {
            function_2e28105e6500a144(player);
        }
        game["codcasterClientStatsSaveBetweenRounds"][player.guid] = player.var_a8f9789edd592f29;
        game["localCodcasterClientStatsSaveBetweenRounds"][player.guid] = player.var_1a34ed8eb5c6e9c;
        game["codcasterGametypeClientStatsSaveBetweenRounds"][player.guid] = player.var_e41d482461d4594f;
    }
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc67
// Size: 0x210
function function_9b229b18b0750bad() {
    if (!isplayer(self)) {
        return;
    }
    if (!isdefined(game["codcasterClientStatsSaveBetweenRounds"]) || !isdefined(game["localCodcasterClientStatsSaveBetweenRounds"])) {
        return;
    }
    if (isdefined(game["codcasterClientStatsSaveBetweenRounds"][self.guid])) {
        self.var_a8f9789edd592f29 = game["codcasterClientStatsSaveBetweenRounds"][self.guid];
    } else {
        self.var_a8f9789edd592f29 = [];
    }
    if (isdefined(game["localCodcasterClientStatsSaveBetweenRounds"][self.guid])) {
        self.var_1a34ed8eb5c6e9c = game["localCodcasterClientStatsSaveBetweenRounds"][self.guid];
    } else {
        self.var_1a34ed8eb5c6e9c = [];
    }
    if (isdefined(game["codcasterGametypeClientStatsSaveBetweenRounds"][self.guid])) {
        self.var_e41d482461d4594f = game["codcasterGametypeClientStatsSaveBetweenRounds"][self.guid];
    } else {
        self.var_e41d482461d4594f = [];
    }
    if (getdvarint(@"hash_b0b065fcee59b58d", 0) == 1) {
        logstring("=========================== retrieveCodcasterClientStats ==============================");
        function_2e28105e6500a144(self);
    }
    foreach (var_c1b9eea971d8e69e, statvalue in self.var_a8f9789edd592f29) {
        if (!isarray(self.var_a8f9789edd592f29[var_c1b9eea971d8e69e])) {
            function_7ee466e81b1afc12(var_c1b9eea971d8e69e, statvalue);
        } else {
            foreach (index, value in self.var_a8f9789edd592f29[var_c1b9eea971d8e69e]) {
                function_6807ed320b73be7f(var_c1b9eea971d8e69e, index, value);
            }
        }
    }
    foreach (var_c1b9eea971d8e69e, statvalue in self.var_e41d482461d4594f) {
        self function_d743ebe29c5a6e7f(var_c1b9eea971d8e69e, statvalue);
    }
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7e
// Size: 0x39a
function function_ee3acf6a8baa2ff8(killtime, attacker, victim) {
    if (!isdefined(level.var_b33b6a18519b1bbe)) {
        level.var_b33b6a18519b1bbe = [];
    }
    if (isdefined(victim) && isdefined(attacker)) {
        if (attacker.team != victim.team) {
            var_c7169d94937c6c29 = 0;
            var_51e466d7b408895d = namespace_54d20dd0dd79277f::getteamdata(victim.team, "livesCount");
            switch (level.gametype) {
            case #"hash_a1313b745c17c07e":
                var_c7169d94937c6c29 = namespace_54d20dd0dd79277f::getteamdata(victim.team, "livesCount") == 0 && namespace_54d20dd0dd79277f::getfriendlyplayers(victim.team, 1).size == 0;
                break;
            case #"hash_aac44b0b52bacb8e":
            case #"hash_fa50b0f6bd82e972":
                var_c7169d94937c6c29 = namespace_54d20dd0dd79277f::getteamdata(victim.team, "aliveCount") == 0;
                break;
            default:
                var_c7169d94937c6c29 = 0;
                break;
            }
            if (var_c7169d94937c6c29) {
                if (isdefined(attacker.pers["inapplicableTradedKills"]) && isdefined(victim.pers["inapplicableTradedDeaths"])) {
                    attacker namespace_3c5a4254f2b957ea::incpersstat("inapplicableTradedKills", 1);
                    victim namespace_3c5a4254f2b957ea::incpersstat("inapplicableTradedDeaths", 1);
                }
            } else {
                if (isdefined(victim.pers["untradedDeaths"])) {
                    victim namespace_3c5a4254f2b957ea::incpersstat("untradedDeaths", 1);
                }
                attacker function_d16498b27251da56(5, 1);
            }
            newentry = [];
            newentry["killtime"] = killtime;
            newentry["attacker"] = attacker;
            newentry["victim"] = victim;
            while (self.var_b33b6a18519b1bbe.size > 0 && killtime - self.var_b33b6a18519b1bbe[0]["killtime"] > 5000) {
                self.var_b33b6a18519b1bbe = array_remove_index(self.var_b33b6a18519b1bbe, 0, 0);
            }
            for (entryindex = self.var_b33b6a18519b1bbe.size - 1; entryindex >= 0; entryindex--) {
                entry = self.var_b33b6a18519b1bbe[entryindex];
                if (isdefined(entry) && isdefined(entry["attacker"]) && isdefined(entry["victim"])) {
                    if (entry["attacker"] == victim) {
                        if (victim.lastkilledplayer == entry["victim"]) {
                            if (isdefined(entry["attacker"].pers["tradedKills"]) && isdefined(entry["victim"].pers["untradedDeaths"]) && isdefined(entry["victim"].pers["tradedDeaths"])) {
                                entry["attacker"] function_d16498b27251da56(5, -1);
                                entry["victim"] function_d16498b27251da56(9, 1);
                                entry["attacker"] namespace_3c5a4254f2b957ea::incpersstat("tradedKills", 1);
                                entry["victim"] namespace_3c5a4254f2b957ea::incpersstat("untradedDeaths", -1);
                                entry["victim"] namespace_3c5a4254f2b957ea::incpersstat("tradedDeaths", 1);
                            }
                        }
                        self.var_b33b6a18519b1bbe = array_remove_index(self.var_b33b6a18519b1bbe, entryindex, 0);
                    }
                }
            }
            self.var_b33b6a18519b1bbe[self.var_b33b6a18519b1bbe.size] = newentry;
        } else if (isdefined(victim.pers["untradedDeaths"])) {
            victim namespace_3c5a4254f2b957ea::incpersstat("untradedDeaths", 1);
        }
    }
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121f
// Size: 0x23
function function_6f792f70ffe4cd4d(attacker, victim) {
    level function_ee3acf6a8baa2ff8(gettime(), attacker, victim);
}

// Namespace namespace_969918091e5d9483/namespace_b919c4be206d3c80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1249
// Size: 0x99
function function_94c8f3722d550646() {
    if (isdefined(level.var_bb581bb447e5a6a6)) {
        return;
    }
    var_56eb566f7ae12fa3 = isroundbased();
    foreach (player in level.players) {
        if (var_56eb566f7ae12fa3) {
            player namespace_b919c4be206d3c80::function_1882f80b14421089(4, 1);
        } else {
            player namespace_b919c4be206d3c80::function_1882f80b14421089(3, 1);
        }
    }
    level.var_bb581bb447e5a6a6 = 1;
}

