// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\game.gsc;
#using script_48814951e916af89;
#using scripts\mp\poi.gsc;
#using script_35de402efc5acfb3;
#using script_5d265b4fca61f070;
#using scripts\mp\ai_behavior.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\points.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace overseer;

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x856
// Size: 0x75
function function_495dec0762963abd() {
    waitframe();
    if (!function_47d356083884f913()) {
        return;
    }
    level.overseer = spawnstruct();
    function_72a66b9a0e0bc9c1();
    setdvarifuninitialized(@"hash_451b4b1e40b7b2ae", 2);
    setdvarifuninitialized(@"hash_c32b050cf4dbed9c", 5);
    function_5b8657687ecb9e05();
    level waittill("matchStartTimer_done");
    waitframe();
    function_61672dee45f8a3a4();
    level thread function_bdc80d6cbbc555b();
    level thread function_279f529842440558();
    function_368fb9a36d82922c();
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d2
// Size: 0x167
function function_72a66b9a0e0bc9c1() {
    level.overseer.poi = [];
    foreach (poiname, poi in level.poi) {
        level.overseer.poi[poiname] = spawnstruct();
        level.overseer.poi[poiname].var_5c3a2c7e48245ec9 = 0;
        level.overseer.poi[poiname].name = poiname;
        level.overseer.poi[poiname].var_4f0d82757e9e4e91 = [];
        level.overseer.poi[poiname].var_96766b0a5b7abb48 = 0;
        level.overseer.poi[poiname].var_86e45dbd699cc9fa = [];
        level.overseer.poi[poiname].var_560a32af852a939a = [];
        level.overseer.poi[poiname].eventwaittime = 0;
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa40
// Size: 0x139
function function_5b8657687ecb9e05() {
    level.eventgraph = [];
    foreach (poiname, poi in level.poi) {
        function_f06ad65298f474d6(poiname, 0, 1, 5, undefined);
        function_f06ad65298f474d6(poiname, 0, 2, 10, &function_6035acab211520a8);
        function_f06ad65298f474d6(poiname, 0, 4, 0, &function_5e713676ffab769b);
        function_f06ad65298f474d6(poiname, 0, 3, 0, &function_b9b723d97e9a9a7d);
        function_f06ad65298f474d6(poiname, 0, 5, 0, &function_ab3cc3354d465ba9);
        function_f06ad65298f474d6(poiname, 2, 1, 5, undefined);
        function_f06ad65298f474d6(poiname, 2, 2, 10, &function_6035acab211520a8);
        function_f06ad65298f474d6(poiname, 2, 4, 0, &function_5e713676ffab769b);
        function_f06ad65298f474d6(poiname, 2, 3, 0, &function_b9b723d97e9a9a7d);
        function_f06ad65298f474d6(poiname, 2, 5, 0, &function_ab3cc3354d465ba9);
        function_f06ad65298f474d6(poiname, 3, 1, 5, undefined);
        function_f06ad65298f474d6(poiname, 3, 2, 10, &function_6035acab211520a8);
        function_f06ad65298f474d6(poiname, 3, 5, 0, &function_ab3cc3354d465ba9);
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb80
// Size: 0x63
function function_368fb9a36d82922c() {
    foreach (var_dc1bfdf5c034420e in level.overseer.poi) {
        var_dc1bfdf5c034420e thread function_2f4609f4ec521515();
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbea
// Size: 0x114
function function_61672dee45f8a3a4() {
    foreach (player in level.players) {
        if (isbot(player)) {
            continue;
        }
        player.var_b17bf051e1d12378 = [];
        foreach (poiname, poi in level.poi) {
            player.var_b17bf051e1d12378[poiname] = spawnstruct();
            player.var_b17bf051e1d12378[poiname].var_9cc5be111b6fa65c = [];
            player.var_b17bf051e1d12378[poiname].var_4f0d82757e9e4e91 = [];
            player.var_b17bf051e1d12378[poiname].eventcooldowns = [];
        }
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd05
// Size: 0x11f
function function_f06ad65298f474d6(poiname, stateindex, eventindex, weight, eventcallback) {
    if (!isdefined(poiname) || !isdefined(stateindex) || !isdefined(eventindex) || !isdefined(weight)) {
        /#
            assertmsg("Parameter undefined in addOverseerEventToGraph in overseer.gsc");
        #/
        return;
    }
    if (!isdefined(level.eventgraph[poiname])) {
        level.eventgraph[poiname] = [];
    }
    if (!isdefined(level.eventgraph[poiname][stateindex])) {
        level.eventgraph[poiname][stateindex] = [];
    }
    level.eventgraph[poiname][stateindex][eventindex] = spawnstruct();
    level.eventgraph[poiname][stateindex][eventindex].weight = weight;
    level.eventgraph[poiname][stateindex][eventindex].event = eventcallback;
    if (!isdefined(level.eventgraph[poiname][stateindex][0])) {
        level.eventgraph[poiname][stateindex][0] = 0;
    }
    level.eventgraph[poiname][stateindex][0] = level.eventgraph[poiname][stateindex][0] + weight;
}

// Namespace overseer / scripts/mp/overseer
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2b
// Size: 0x14d
function function_a009c03abf1d0190(newweight, poiname, stateindex, eventindex) {
    if (!isdefined(poiname) || !isdefined(stateindex) || !isdefined(eventindex) || !isdefined(newweight)) {
        /#
            assertmsg("Parameter undefined in changeOverseerEventWeight in overseer.gsc");
        #/
        return;
    }
    if (!function_25e955b1fbb05fd2(poiname, stateindex, eventindex)) {
        /#
            assertmsg("Graph event undefined in changeOverseerEventWeight in overseer.gsc");
        #/
        return;
    }
    statearray = stateindex;
    if (!isarray(statearray)) {
        statearray = [];
        statearray[statearray.size] = stateindex;
    }
    foreach (state in statearray) {
        if (!isdefined(level.eventgraph[poiname][state])) {
            continue;
        }
        weightdifference = newweight - level.eventgraph[poiname][state][eventindex].weight;
        level.eventgraph[poiname][state][0] = level.eventgraph[poiname][state][0] + weightdifference;
        level.eventgraph[poiname][state][eventindex].weight = newweight;
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7f
// Size: 0xbc
function function_25e955b1fbb05fd2(poiname, stateindex, eventindex) {
    if (!isdefined(level.eventgraph[poiname])) {
        return false;
    }
    statearray = stateindex;
    if (!isarray(statearray)) {
        statearray = [];
        statearray[statearray.size] = stateindex;
    }
    foreach (state in statearray) {
        if (isdefined(level.eventgraph[poiname][state]) && isdefined(level.eventgraph[poiname][state][eventindex])) {
            return true;
        }
    }
    return false;
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1043
// Size: 0xd
function function_df475631e402735a() {
    return isdefined(level.overseer);
}

// Namespace overseer / scripts/mp/overseer
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1058
// Size: 0x55
function function_17a6fd602315c59b(cooldownname, poiname) {
    if (!isdefined(self.var_b17bf051e1d12378[poiname].eventcooldowns[cooldownname])) {
        return false;
    }
    if (self.var_b17bf051e1d12378[poiname].eventcooldowns[cooldownname] <= gettime()) {
        return false;
    }
    return true;
}

// Namespace overseer / scripts/mp/overseer
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b5
// Size: 0x5c
function function_edb852b69ff7126(eventname) {
    switch (eventname) {
    case #"hash_5df1a64e881789c7":
        return 1;
    case #"hash_86f811bb481e7344":
        return (self.var_fe5ebefa740c7106 != 3 && self.var_fe5ebefa740c7106 != 2);
    default:
        return 1;
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1118
// Size: 0x44
function function_d566bf9405d7d49a(cooldownname) {
    if (!isdefined(self.var_60a5413e150f62fd)) {
        return false;
    }
    if (!isdefined(cooldownname)) {
        return false;
    }
    if (!isdefined(self.var_60a5413e150f62fd[cooldownname])) {
        return false;
    }
    return self.var_60a5413e150f62fd[cooldownname] >= gettime();
}

// Namespace overseer / scripts/mp/overseer
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1164
// Size: 0x42
function function_dbae416bd663b441(cooldownname, cooldowntime) {
    if (!isdefined(self.var_60a5413e150f62fd)) {
        self.var_60a5413e150f62fd = [];
    }
    self.var_60a5413e150f62fd[cooldownname] = gettime() + cooldowntime * 1000;
}

// Namespace overseer / scripts/mp/overseer
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ad
// Size: 0x8e
function function_ba07b47fa2bc7c1e(var_646389193279e8ec, origin) {
    if (!isdefined(self.entitynumber)) {
        return false;
    }
    if (isdefined(var_646389193279e8ec[self.entitynumber])) {
        return false;
    }
    if (isdefined(self.var_b600c3754eb17f27) && self.var_b600c3754eb17f27 + 120000 <= gettime()) {
        return false;
    }
    if (!isdefined(self.origin) || !isdefined(origin)) {
        return false;
    }
    if (distancesquared(origin, self.origin) > 2250000) {
        return false;
    }
    return true;
}

// Namespace overseer / scripts/mp/overseer
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1243
// Size: 0x136
function function_251a5fbcd306ba20(origin, radius, var_646389193279e8ec, poiname) {
    var_7e07bdbda1b67800 = getplayersinradius(origin, radius, "team_hundred_ninety_five");
    var_7e07bdbda1b67800 = array_randomize(var_7e07bdbda1b67800);
    var_2a325306f9ebdd9d = getplayersinradius(origin, 2000, "team_hundred_ninety_five", var_7e07bdbda1b67800);
    var_2a325306f9ebdd9d = array_randomize(var_2a325306f9ebdd9d);
    var_4f0d82757e9e4e91 = [];
    foreach (agent in level.overseer.poi[poiname].var_4f0d82757e9e4e91) {
        if (agent function_ba07b47fa2bc7c1e(var_646389193279e8ec, origin)) {
            var_4f0d82757e9e4e91[agent.entitynumber] = agent;
        }
    }
    var_4f0d82757e9e4e91 = array_randomize(var_4f0d82757e9e4e91);
    splitindex = var_7e07bdbda1b67800.size;
    var_9cc5be111b6fa65c = array_combine(var_7e07bdbda1b67800, var_2a325306f9ebdd9d);
    return [var_9cc5be111b6fa65c, var_4f0d82757e9e4e91, splitindex];
}

// Namespace overseer / scripts/mp/overseer
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1381
// Size: 0x104
function function_63f2ed030151aa07(speakerorigin, cooldownname, cooldowntime, poiname) {
    players = getplayersinradius(speakerorigin, level.var_587de0e7b537210a);
    if (!isdefined(players)) {
        return;
    }
    if (!isarray(players) && !isai(players)) {
        players = [players];
    }
    foreach (player in players) {
        if (isai(player) || isbot(player) || !isdefined(player.var_b17bf051e1d12378) || !isdefined(player.var_b17bf051e1d12378[poiname])) {
            continue;
        }
        player.var_b17bf051e1d12378[poiname].eventcooldowns[cooldownname] = gettime() + cooldowntime * 1000;
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x148c
// Size: 0x7e
function function_3aacea8b6bb13d1a(poiname, newstate) {
    switch (newstate) {
    case 0:
    case 1:
        thread function_2f4609f4ec521515();
        break;
    case 2:
    case 3:
        thread function_1682cb99475b8428();
        break;
    case 4:
    default:
        break;
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1511
// Size: 0x2b
function function_32226d6944572ebd(poiname) {
    return level.overseer.poi[poiname].var_5c3a2c7e48245ec9;
}

// Namespace overseer / scripts/mp/overseer
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1544
// Size: 0x35
function function_b39e752ef737042b(poiname) {
    return level.overseer.poi[poiname].agentstates.var_fe5ebefa740c7106;
}

// Namespace overseer / scripts/mp/overseer
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1581
// Size: 0xcb
function function_acaf43595c74730b(state, var_cb7d9ed4fde5cb25, agentspeaker, var_acc07047ba207170) {
    /#
        assertex(isdefined(state), "State is not defined in overseerUtil_getCheckInSequenceForState in overseer.gsc");
    #/
    if (!isdefined(state)) {
        return undefined;
    }
    if (var_acc07047ba207170) {
        sequence = function_c5a3e4813279af45();
    }
    sequence = undefined;
    switch (state) {
    case 0:
    case 4:
        sequence = function_5175a8d4ab6f95f9(agentspeaker, var_cb7d9ed4fde5cb25);
        break;
    case 1:
    case 2:
        sequence = function_d65f7ec4946cb258();
        break;
    case 3:
        sequence = function_5533255fd4fbf6e3();
        break;
    default:
        break;
    }
    return sequence;
}

// Namespace overseer / scripts/mp/overseer
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1654
// Size: 0x1c8
function function_a79b8410bfcb03a(poiname, agentstate, eventname) {
    if (!isdefined(poiname) || !isdefined(agentstate) || !isdefined(eventname)) {
        return 0;
    }
    if (!isalive(self)) {
        return 0;
    }
    if (isbot(self)) {
        return 0;
    }
    if (!isdefined(self.var_b17bf051e1d12378)) {
        return 0;
    }
    if (!isdefined(self.var_b17bf051e1d12378[poiname])) {
        return 0;
    }
    switch (agentstate) {
    case #"hash_343f075aa0daffe6":
        if (!isdefined(self.var_b17bf051e1d12378[poiname].var_9cc5be111b6fa65c)) {
            return 0;
        }
        if (self.var_b17bf051e1d12378[poiname].var_9cc5be111b6fa65c.size == 0) {
            return 0;
        }
        foreach (agent in self.var_b17bf051e1d12378[poiname].var_9cc5be111b6fa65c) {
            if (agent function_edb852b69ff7126(eventname) && !agent function_d566bf9405d7d49a(eventname)) {
                return 1;
            }
        }
        return 0;
    case #"hash_cf14c509efeb3c87":
        return (isdefined(self.var_b17bf051e1d12378[poiname].var_4f0d82757e9e4e91) && self.var_b17bf051e1d12378[poiname].var_4f0d82757e9e4e91.size != 0);
    case #"hash_28fac2aca8cae4a5":
        return (isdefined(level.overseer.poi[poiname].var_86e45dbd699cc9fa) && level.overseer.poi[poiname].var_86e45dbd699cc9fa.size != 0);
    default:
        return 0;
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1823
// Size: 0x156
function function_555a2cdf4916950d(agentstate, poiname, eventname) {
    /#
        assertex(isdefined(agentstate), "agentState is undefined in overseerUtil_getAgentSpeaker in overseer.gsc");
    #/
    if (!isdefined(agentstate)) {
        return [undefined, 0];
    }
    agentarray = [];
    switch (agentstate) {
    case #"hash_343f075aa0daffe6":
        agentarray = self.var_b17bf051e1d12378[poiname].var_9cc5be111b6fa65c;
        break;
    case #"hash_cf14c509efeb3c87":
        agentarray = self.var_b17bf051e1d12378[poiname].var_4f0d82757e9e4e91;
    default:
        break;
    }
    foreach (index, agent in agentarray) {
        if (!agent function_d566bf9405d7d49a(eventname)) {
            if (agentstate == "alive" && !isalive(agent)) {
                continue;
            }
            if (index < self.var_b17bf051e1d12378[poiname].distanceindex) {
                return [agent, 0];
            }
            return [agent, 1];
        }
    }
    return [undefined, 0];
}

// Namespace overseer / scripts/mp/overseer
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1981
// Size: 0x6d
function function_f65532fc657a4301(agentradio) {
    level.overseer.poi[agentradio.poi].var_4f0d82757e9e4e91[agentradio.entitynumber] = agentradio;
    level.overseer.poi[agentradio.poi].var_96766b0a5b7abb48++;
}

// Namespace overseer / scripts/mp/overseer
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x19f5
// Size: 0x42
function function_30c7ac6784554174(sequence, waittime, priority) {
    self notify("oversser_chatter_quedued");
    self endon("oversser_chatter_quedued");
    self endon("death");
    wait(waittime);
    namespace_378f8281e2d12ced::function_d54e84a9513b0e45("investigate", sequence, priority);
}

// Namespace overseer / scripts/mp/overseer
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3e
// Size: 0x128
function function_1f276ca53768bfa9(event_string, variant) {
    char = "aqs" + string(variant) + "_";
    countryid = "aqs";
    segs = strtok(event_string, "_");
    alias = "";
    switch (segs.size) {
    case 3:
        alias = "dx_bc_" + tolower(countryid) + segs[0] + "_" + segs[1] + "_" + char + segs[2];
        break;
    case 2:
        alias = "dx_bc_" + tolower(countryid) + segs[0] + "_" + char + segs[1];
        break;
    case 1:
        alias = "dx_bc_" + tolower(countryid) + "_" + char + segs[0];
        break;
    default:
        /#
            assertmsg("Invalid battlechatter event '" + event_string + "'");
        #/
        break;
    }
    return alias;
}

// Namespace overseer / scripts/mp/overseer
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6e
// Size: 0x123
function function_67e64472be618168(event_string, variant) {
    char = "aqs1_";
    countryid = "aqld";
    segs = strtok(event_string, "_");
    alias = "";
    switch (segs.size) {
    case 3:
        alias = "dx_bc_" + tolower(countryid) + segs[0] + "_" + segs[1] + "_" + char + segs[2];
        break;
    case 2:
        alias = "dx_bc_" + tolower(countryid) + segs[0] + "_" + char + segs[1];
        break;
    case 1:
        alias = "dx_bc_" + tolower(countryid) + "_" + char + segs[0];
        break;
    default:
        /#
            assertmsg("Invalid battlechatter event '" + event_string + "'");
        #/
        break;
    }
    alias = namespace_71a239de73c38174::get_radio_alias(alias);
    return alias;
}

// Namespace overseer / scripts/mp/overseer
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c99
// Size: 0x1d
function function_92bacb96846cba62(alias, variant) {
    self playsoundonmovingent(alias);
    return undefined;
}

// Namespace overseer / scripts/mp/overseer
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1cbe
// Size: 0x1c
function function_ea67555d03337205(alias, variant) {
    self stopsounds();
    return undefined;
}

// Namespace overseer / scripts/mp/overseer
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ce2
// Size: 0xc8
function function_c26b1e049db4d841(sequence) {
    self notify("overseer_chatter");
    self endon("overseer_chatter");
    self endon("death");
    var_bd670c1e0f4290da = undefined;
    variant = randomintrange(1, 4);
    foreach (index, item in sequence) {
        if (isdefined(var_bd670c1e0f4290da)) {
            self thread [[ level.var_9a62261b5b534b06 ]](var_bd670c1e0f4290da);
            var_bd670c1e0f4290da = undefined;
            waitframe();
            self waittill("dialogue_done");
        }
        if (isnumber(item)) {
            wait(item);
        }
        if (isfunction(item)) {
            var_bd670c1e0f4290da = self [[ item ]](sequence[index + 1], variant);
        }
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db1
// Size: 0x14a
function function_2f4609f4ec521515() {
    self notify("changed_state");
    level endon("game_ended");
    self endon("changed_state");
    self.var_5c3a2c7e48245ec9 = 0;
    while (true) {
        totalweight = level.eventgraph[self.name][0][0];
        probability = randomint(totalweight) + 1;
        func = undefined;
        runningweight = 0;
        foreach (eventindex, data in level.eventgraph[self.name][0]) {
            if (eventindex == 0) {
                continue;
            }
            runningweight = runningweight + data.weight;
            if (runningweight >= probability) {
                func = data.event;
                break;
            }
        }
        if (isdefined(func) && isfunction(func)) {
            self [[ func ]](self.name);
        }
        wait(self.eventwaittime + randomintrange(getdvarint(@"hash_451b4b1e40b7b2ae"), getdvarint(@"hash_c32b050cf4dbed9c")));
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f02
// Size: 0x14d
function function_1682cb99475b8428() {
    self notify("changed_state");
    level endon("game_ended");
    self endon("changed_state");
    self.var_5c3a2c7e48245ec9 = 2;
    while (true) {
        totalweight = level.eventgraph[self.name][2][0];
        probability = randomint(totalweight) + 1;
        func = undefined;
        runningweight = 0;
        foreach (eventindex, data in level.eventgraph[self.name][2]) {
            if (eventindex == 0) {
                continue;
            }
            runningweight = runningweight + data.weight;
            if (runningweight >= probability) {
                func = data.event;
                break;
            }
        }
        if (isdefined(func) && isfunction(func)) {
            self [[ func ]](self.name);
        }
        wait(self.eventwaittime + randomintrange(getdvarint(@"hash_451b4b1e40b7b2ae"), getdvarint(@"hash_c32b050cf4dbed9c")));
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2056
// Size: 0x19e
function function_6035acab211520a8(poiname) {
    if (!isdefined(level.poi[poiname]["players"]) || level.poi[poiname]["players"].size == 0) {
        return;
    }
    playedevent = 0;
    foreach (player in level.poi[poiname]["players"]) {
        if (!player function_a79b8410bfcb03a(poiname, "alive", "check_in") || player function_17a6fd602315c59b("check_in", poiname)) {
            continue;
        }
        var_bffcbd62498724e1 = player function_555a2cdf4916950d("alive", poiname, "check_in");
        var_acc07047ba207170 = var_bffcbd62498724e1[1];
        agentspeaker = var_bffcbd62498724e1[0];
        if (!isdefined(agentspeaker) || !isdefined(var_acc07047ba207170)) {
            continue;
        }
        playedevent = 1;
        sequence = function_acaf43595c74730b(self.var_5c3a2c7e48245ec9, undefined, agentspeaker, var_acc07047ba207170);
        if (var_acc07047ba207170) {
            radiosound = function_ef9999b04345f5d4();
            agentspeaker playsoundonmovingent(radiosound);
        } else {
            agentspeaker thread function_c26b1e049db4d841(sequence);
        }
        function_63f2ed030151aa07(agentspeaker.origin, "check_in", 30, poiname);
        agentspeaker function_dbae416bd663b441("check_in", 120);
    }
    if (playedevent) {
        self.eventwaittime = 10;
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21fb
// Size: 0x2be
function function_b9b723d97e9a9a7d(poiname) {
    if (!isdefined(level.poi[poiname]["players"]) || level.poi[poiname]["players"].size == 0) {
        return;
    }
    playedevent = 0;
    agentignored = 1;
    var_ced51c14e5171ec4 = [];
    foreach (player in level.poi[poiname]["players"]) {
        if (!player function_a79b8410bfcb03a(poiname, "dead") || player function_17a6fd602315c59b("dead_agent_contacted", poiname)) {
            continue;
        }
        var_bffcc06249872b7a = player function_555a2cdf4916950d("dead", poiname, "check_in");
        var_acc07047ba207170 = var_bffcc06249872b7a[1];
        agentspeaker = var_bffcc06249872b7a[0];
        if (!isdefined(agentspeaker)) {
            continue;
        }
        playedevent = 1;
        probability = min(100, level.overseer.poi[poiname].var_96766b0a5b7abb48 * 10);
        ignore = percent_chance(probability);
        agentspeaker notify("radio_spam");
        var_ced51c14e5171ec4[var_ced51c14e5171ec4.size] = agentspeaker;
        if (!ignore) {
            level.overseer.poi[poiname].var_86e45dbd699cc9fa[agentspeaker.entitynumber] = undefined;
            function_3daefb936272829f(poiname, agentspeaker.origin);
            sequence = function_b19e15d68738642b();
            agentignored = 0;
        } else {
            sequence = function_e8391f9bf6b9aed();
        }
        agentspeaker thread function_c26b1e049db4d841(sequence);
        function_63f2ed030151aa07(agentspeaker.origin, "dead_agent_contacted", 120, poiname);
        agentspeaker function_dbae416bd663b441("check_in", 120);
    }
    if (playedevent) {
        if (!agentignored) {
            function_a009c03abf1d0190(0, poiname, [0, 2], 3);
            function_a009c03abf1d0190(10, poiname, [2], 4);
        }
        self.eventwaittime = 0;
        wait(20);
        foreach (agent in var_ced51c14e5171ec4) {
            thread function_fc9a15646315764c(agent);
        }
        if (!agentignored) {
            function_3aacea8b6bb13d1a(poiname, 2);
        }
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24c0
// Size: 0x360
function function_5e713676ffab769b(poiname) {
    if (!isdefined(level.poi[poiname]["players"]) || level.poi[poiname]["players"].size == 0) {
        return;
    }
    var_17fdc82450aab9e3 = [];
    playedevent = 0;
    foreach (player in level.poi[poiname]["players"]) {
        if (!player function_a79b8410bfcb03a(poiname, "alive", "reinforce_agent") || !player function_a79b8410bfcb03a(poiname, "dead_contacted") || player function_17a6fd602315c59b("reinforce_agent", poiname)) {
            continue;
        }
        var_c0013f62498c389e = player function_555a2cdf4916950d("alive", poiname, "reinforce_agent");
        var_acc07047ba207170 = var_c0013f62498c389e[1];
        agentspeaker = var_c0013f62498c389e[0];
        if (!isdefined(agentspeaker)) {
            continue;
        }
        playedevent = 1;
        sequence = function_e84132896f105965(agentspeaker, undefined);
        agentspeaker thread function_c26b1e049db4d841(sequence);
        var_17fdc82450aab9e3[agentspeaker getentitynumber()] = spawnstruct();
        var_17fdc82450aab9e3[agentspeaker getentitynumber()].deadagent = random(level.overseer.poi[poiname].var_86e45dbd699cc9fa);
        var_17fdc82450aab9e3[agentspeaker getentitynumber()].agent = agentspeaker;
        function_63f2ed030151aa07(agentspeaker.origin, "reinforce_agent", 120, poiname);
    }
    if (playedevent) {
        function_a009c03abf1d0190(0, poiname, 2, 4);
        self.eventwaittime = 0;
        wait(10);
        foreach (movedata in var_17fdc82450aab9e3) {
            origin = getclosestpointonnavmesh(movedata.deadagent.origin + (randomfloatrange(-256, 256), randomfloatrange(-256, 256), 0));
            movedata.agent thread scripts/mp/ai_behavior::function_a5117518725da028(movedata.agent, origin);
            level.overseer.poi[poiname].agentstates = movedata.agent;
            level.overseer.poi[poiname].var_86e45dbd699cc9fa[movedata.deadagent.entitynumber] = undefined;
            level.overseer.poi[poiname].var_96766b0a5b7abb48 = 0;
            level.overseer.poi[poiname].var_560a32af852a939a[movedata.deadagent.entitynumber] = movedata.deadagent;
        }
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2827
// Size: 0x184
function function_ab3cc3354d465ba9(poiname) {
    if (!isdefined(level.poi[poiname]["players"]) || level.poi[poiname]["players"].size == 0) {
        return;
    }
    playedevent = 0;
    foreach (player in level.poi[poiname]["players"]) {
        if (!player function_a79b8410bfcb03a(poiname, "alive", "outside_reinforce") || player function_17a6fd602315c59b("outside_reinforce", poiname)) {
            continue;
        }
        var_c0014262498c3f37 = player function_555a2cdf4916950d("alive", poiname, "outside_reinforce");
        var_acc07047ba207170 = var_c0014262498c3f37[1];
        agentspeaker = var_c0014262498c3f37[0];
        if (!isdefined(agentspeaker)) {
            continue;
        }
        playedevent = 1;
        sequence = function_1000f4a1c18a2766(agentspeaker);
        agentspeaker thread function_c26b1e049db4d841(sequence);
        function_63f2ed030151aa07(agentspeaker.origin, "outside_reinforce", 120, poiname);
        agentspeaker function_dbae416bd663b441("outside_reinforce", 120);
    }
    if (playedevent) {
        function_a009c03abf1d0190(0, poiname, [0, 2], 4);
        self.eventwaittime = 10;
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29b2
// Size: 0x21b
function function_bdc80d6cbbc555b() {
    level endon("game_ended");
    while (true) {
        foreach (poiname, poi in level.poi) {
            if (!isdefined(level.poi[poiname]["players"])) {
                continue;
            }
            foreach (player in level.poi[poiname]["players"]) {
                if (!isdefined(player.var_b17bf051e1d12378) || !isalive(player) || !isdefined(player.origin) || isbot(player)) {
                    continue;
                }
                var_646389193279e8ec = level.overseer.poi[poiname].var_560a32af852a939a;
                var_c0173e6249a4699e = function_251a5fbcd306ba20(player.origin, 1500, var_646389193279e8ec, poiname);
                distanceindex = var_c0173e6249a4699e[2];
                var_4f0d82757e9e4e91 = var_c0173e6249a4699e[1];
                var_9cc5be111b6fa65c = var_c0173e6249a4699e[0];
                player.var_b17bf051e1d12378[poiname].var_9cc5be111b6fa65c = var_9cc5be111b6fa65c;
                player.var_b17bf051e1d12378[poiname].distanceindex = distanceindex;
                player.var_b17bf051e1d12378[poiname].var_4f0d82757e9e4e91 = var_4f0d82757e9e4e91;
                if (player function_a79b8410bfcb03a(poiname, "dead")) {
                    function_a009c03abf1d0190(level.overseer.poi[poiname].var_96766b0a5b7abb48, poiname, [0, 2], 3);
                }
            }
        }
        wait(5);
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bd4
// Size: 0xcc
function function_279f529842440558() {
    level endon("game_ended");
    while (true) {
        foreach (var_dc1bfdf5c034420e in level.overseer.poi) {
            if (!isdefined(var_dc1bfdf5c034420e.agentstates)) {
                continue;
            }
            agentstate = function_b39e752ef737042b(var_dc1bfdf5c034420e.name);
            if (function_32226d6944572ebd(var_dc1bfdf5c034420e.name) != agentstate && agentstate != 4) {
                var_dc1bfdf5c034420e function_3aacea8b6bb13d1a(var_dc1bfdf5c034420e.name, agentstate);
            }
        }
        wait(1);
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ca7
// Size: 0xe8
function function_d2c0773f378a239a() {
    alias = [];
    alias[alias.size] = "s_idnm_safi";
    alias[alias.size] = "s_idnm_abbasi";
    alias[alias.size] = "s_idnm_kinan";
    alias[alias.size] = "s_idnm_hamed";
    alias[alias.size] = "s_idnm_hadi";
    alias[alias.size] = "s_idnm_waseem";
    alias[alias.size] = "s_idnm_abuelbaz";
    alias[alias.size] = "s_idnm_beshara";
    alias[alias.size] = "s_idnm_kamal";
    alias[alias.size] = "s_idnm_abujamil";
    alias[alias.size] = "s_idnm_jabour";
    alias[alias.size] = "s_idnm_yaser";
    alias[alias.size] = "s_idnm_fayad";
    alias[alias.size] = "s_idnm_daoud";
    alias[alias.size] = "s_idnm_laham";
    alias[alias.size] = "s_idnm_abunazar";
    alias[alias.size] = "s_idnm_abuodeh";
    alias[alias.size] = "s_idnm_amran";
    alias[alias.size] = "s_idnm_basr";
    alias[alias.size] = "s_idnm_karam";
    alias[alias.size] = "s_idnm_brother";
    return random(alias);
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d97
// Size: 0x48
function function_f2f1a8b4044ef6e9() {
    alias = [];
    alias[alias.size] = "s_idrr_nothinghere";
    alias[alias.size] = "s_idrr_allclear";
    alias[alias.size] = "s_idrr_weregoodbrother";
    alias[alias.size] = "s_idrr_goodhere";
    alias[alias.size] = "s_idrr_quietherebrother";
    return random(alias);
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2de7
// Size: 0x34
function function_473352d13a0abbd9() {
    alias = [];
    alias[alias.size] = "s_idlc_roger";
    alias[alias.size] = "s_idlc_copy";
    alias[alias.size] = "s_idlc_copythat";
    return random(alias);
}

// Namespace overseer / scripts/mp/overseer
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e23
// Size: 0x8a
function function_5175a8d4ab6f95f9(agentspeaker, var_cb7d9ed4fde5cb25) {
    firstline = function_d2c0773f378a239a();
    secondline = function_f2f1a8b4044ef6e9();
    lastline = function_473352d13a0abbd9();
    sequence = [&function_67e64472be618168, firstline, 2, &function_1f276ca53768bfa9, secondline, 2, &function_67e64472be618168, lastline];
    return sequence;
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb5
// Size: 0x3e
function function_6cab75076ec4334e() {
    alias = [];
    alias[alias.size] = "s_idli_areyouokaybrother";
    alias[alias.size] = "s_idli_areyouthere";
    alias[alias.size] = "s_idli_wheredyougo";
    alias[alias.size] = "s_idli_canyouhearme";
    return random(alias);
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2efb
// Size: 0x2a
function function_8ee10b8e4567c2a1() {
    alias = [];
    alias[alias.size] = "s_comm_ret0";
    alias[alias.size] = "s_comm_reo0";
    return random(alias);
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f2d
// Size: 0x2a
function function_7eb00c3f02c593d0() {
    alias = [];
    alias[alias.size] = "s_misc_con0";
    alias[alias.size] = "s_misc_con2";
    return random(alias);
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f5f
// Size: 0x79
function function_b19e15d68738642b() {
    firstline = function_d2c0773f378a239a();
    secondline = function_6cab75076ec4334e();
    lastline = function_8ee10b8e4567c2a1();
    sequence = [&function_67e64472be618168, firstline, 4, &function_67e64472be618168, secondline, 4, &function_67e64472be618168, lastline];
    return sequence;
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fe0
// Size: 0x79
function function_e8391f9bf6b9aed() {
    firstline = function_d2c0773f378a239a();
    secondline = function_6cab75076ec4334e();
    lastline = function_7eb00c3f02c593d0();
    sequence = [&function_67e64472be618168, firstline, 4, &function_67e64472be618168, secondline, 4, &function_67e64472be618168, lastline];
    return sequence;
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3061
// Size: 0x2a
function function_23dd8208f1ba025b() {
    alias = [];
    alias[alias.size] = "s_comm_rhy0";
    alias[alias.size] = "s_conf_cop0";
    return random(alias);
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3093
// Size: 0x34
function function_ce3abe01c9d8b928() {
    alias = [];
    alias[alias.size] = "s_seor_oft0";
    alias[alias.size] = "s_invt_ori0";
    alias[alias.size] = "s_geno_ocl1";
    return random(alias);
}

// Namespace overseer / scripts/mp/overseer
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30cf
// Size: 0xa8
function function_e84132896f105965(agentspeaker, var_cb7d9ed4fde5cb25) {
    firstline = function_d2c0773f378a239a();
    secondline = function_23dd8208f1ba025b();
    thirdline = "s_comm_alu0";
    fourthline = function_ce3abe01c9d8b928();
    sequence = [&function_67e64472be618168, firstline, 2, &function_1f276ca53768bfa9, secondline, 2, &function_67e64472be618168, thirdline, &function_67e64472be618168, fourthline];
    return sequence;
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x317f
// Size: 0x3e
function function_6b75c6c72cd1d5a8() {
    alias = [];
    alias[alias.size] = "s_seor_orb1";
    alias[alias.size] = "s_seor_orb0";
    alias[alias.size] = "s_seor_osa1";
    alias[alias.size] = "s_seor_osa1";
    return random(alias);
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31c5
// Size: 0x54
function function_d65f7ec4946cb258() {
    firstline = function_d2c0773f378a239a();
    secondline = function_6b75c6c72cd1d5a8();
    sequence = [&function_67e64472be618168, firstline, 2, &function_67e64472be618168, secondline];
    return sequence;
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3221
// Size: 0x54
function function_5533255fd4fbf6e3() {
    firstline = function_d2c0773f378a239a();
    secondline = function_6b75c6c72cd1d5a8();
    sequence = [&function_67e64472be618168, firstline, 2, &function_67e64472be618168, secondline];
    return sequence;
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x327d
// Size: 0x2a
function function_b35d0c3a9e1070e9() {
    alias = [];
    alias[alias.size] = "s_moac_moa0";
    alias[alias.size] = "s_moac_mot0";
    return random(alias);
}

// Namespace overseer / scripts/mp/overseer
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32af
// Size: 0x5c
function function_1000f4a1c18a2766(agentspeaker) {
    firstline = "s_comm_neb0";
    secondline = function_b35d0c3a9e1070e9();
    sequence = [&function_67e64472be618168, firstline, 2, &function_67e64472be618168, secondline];
    return sequence;
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3313
// Size: 0xc0
function function_ef9999b04345f5d4() {
    alias = [];
    alias[alias.size] = "st_radioburst_10";
    alias[alias.size] = "st_radioburst_11";
    alias[alias.size] = "st_radioburst_12";
    alias[alias.size] = "st_radioburst_13";
    alias[alias.size] = "st_radioburst_14";
    alias[alias.size] = "st_radioburst_15";
    alias[alias.size] = "st_radioburst_16";
    alias[alias.size] = "st_radioburst_17";
    alias[alias.size] = "st_radioburst_18";
    alias[alias.size] = "st_radioburst_19";
    alias[alias.size] = "st_radioburst_20";
    alias[alias.size] = "st_radioburst_21";
    alias[alias.size] = "st_radioburst_22";
    alias[alias.size] = "st_radioburst_23";
    alias[alias.size] = "st_radioburst_24";
    alias[alias.size] = "st_radioburst_25";
    alias[alias.size] = "st_radioburst_26";
    return random(alias);
}

// Namespace overseer / scripts/mp/overseer
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33db
// Size: 0x54
function function_c5a3e4813279af45() {
    firstline = function_ef9999b04345f5d4();
    secondline = function_ef9999b04345f5d4();
    sequence = [&function_92bacb96846cba62, firstline, 4, &function_92bacb96846cba62, secondline];
    return sequence;
}

// Namespace overseer / scripts/mp/overseer
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3437
// Size: 0x2b
function waitstopsounds(waittime) {
    self notify("radio_marked");
    self endon("death");
    self endon("radio_marked");
    wait(waittime);
    self stopsounds();
}

// Namespace overseer / scripts/mp/overseer
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3469
// Size: 0x105
function function_7289a8868bc4bc3a(agents, players) {
    level endon("game_ended");
    foreach (agent in agents) {
        if (isalive(agent)) {
            agent playsoundonmovingent("mp_dmz_overseer_radio_tag");
            agent thread waitstopsounds(0.75);
            if (isdefined(agent.var_665888749d290fdb)) {
                scripts/cp_mp/entityheadicons::setheadicon_deleteicon(agent.var_665888749d290fdb);
            }
            icon = agent thread scripts/cp_mp/entityheadicons::setheadicon_singleimage(players, "hud_icon_head_marked", 8, 1);
            agent.var_665888749d290fdb = icon;
            agent thread function_4ebc27baa42965cd(icon);
            agent thread function_b9b06db9105db58f(icon, getdvarfloat(@"hash_bb001ed900888502", 10));
            wait(randomfloatrange(0.25, 0.4));
        }
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3575
// Size: 0x1d9
function function_cd4716d7459f4e90(players, origin, team, agentteam) {
    level endon("game_ended");
    var_17b71f62deaf8f29 = 0;
    if (issharedfuncdefined("player", "showMiniMap")) {
        foreach (player in players) {
            player [[ getsharedfunc("player", "showMiniMap") ]]();
            if (issharedfuncdefined("perk", "hasPerk")) {
                if (player [[ getsharedfunc("perk", "hasPerk") ]]("specialty_pc_comms")) {
                    var_17b71f62deaf8f29 = 1;
                }
            }
        }
    }
    var_dd9afc233a67e2c = scripts/mp/utility/entity::function_d9ce8fb00f0e5fa1(origin, 2000, agentteam);
    var_dd9afc233a67e2c = sortbydistance(var_dd9afc233a67e2c, origin);
    level thread function_7289a8868bc4bc3a(var_dd9afc233a67e2c, players);
    thread function_3e61541e7c85f0dd(players, origin, 2000, 12);
    sweepcount = 0;
    var_9639f9fcaed0faf6 = 3 + ter_op(var_17b71f62deaf8f29, getdvarint(@"hash_1f416fc1d07d0b07", 2), 0);
    while (sweepcount < var_9639f9fcaed0faf6) {
        triggerportableradarpingteam(origin, team, 2000, int(2000));
        sweepcount++;
        wait(2);
    }
    if (issharedfuncdefined("player", "hideMiniMap")) {
        foreach (player in players) {
            if (isdefined(player)) {
                player [[ getsharedfunc("player", "hideMiniMap") ]]();
            }
        }
    }
}

// Namespace overseer / scripts/mp/overseer
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3755
// Size: 0xa3
function function_3e61541e7c85f0dd(players, origin, radius, time) {
    struct = spawnstruct();
    struct.players = players;
    struct.origin = origin;
    struct.radius = radius;
    if (!isdefined(level.var_a68dcd3b5a82712d)) {
        level.var_a68dcd3b5a82712d = [];
    }
    level.var_a68dcd3b5a82712d[level.var_a68dcd3b5a82712d.size] = struct;
    wait(time);
    level.var_a68dcd3b5a82712d = array_remove(level.var_a68dcd3b5a82712d, struct);
}

// Namespace overseer / scripts/mp/overseer
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37ff
// Size: 0x4b
function function_4ebc27baa42965cd(icon) {
    self notify("headicon_death_watch");
    self endon("overseer_headicon_deleted");
    self endon("headicon_death_watch");
    level endon("game_ended");
    self waittill("death");
    scripts/cp_mp/entityheadicons::setheadicon_deleteicon(icon);
    self.var_665888749d290fdb = undefined;
    self notify("overseer_headicon_deleted");
}

// Namespace overseer / scripts/mp/overseer
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3851
// Size: 0x4d
function function_b9b06db9105db58f(icon, waittime) {
    self notify("headicon_timeout");
    self endon("overseer_headicon_deleted");
    self endon("headicon_timeout");
    level endon("game_ended");
    wait(waittime);
    scripts/cp_mp/entityheadicons::setheadicon_deleteicon(icon);
    self.var_665888749d290fdb = undefined;
    self notify("overseer_headicon_deleted");
}

// Namespace overseer / scripts/mp/overseer
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38a5
// Size: 0x109
function function_4cc3562c55625e70(instance) {
    self notify("radio_activated");
    instance notify("radio_spam");
    level endon("game_ended");
    self endon("death");
    self endon("radio_activated");
    poiname = instance.poi;
    radiopos = instance.origin;
    instance setscriptablepartstate("brloot_dead_agent_radio", "pulse");
    playsoundatpos(radiopos, "mp_dmz_overseer_radio_sweep");
    players = scripts/mp/utility/teams::getteamdata(self.team, "players");
    thread scripts/mp/utility/points::doScoreEvent(#"hash_b029caf23fe6242c");
    namespace_8361bad7391de074::function_3d12fce128d424b1(self, instance);
    if (!isdefined(players)) {
        return;
    }
    agentteam = level.var_4b195d3dd0024b9c;
    if (isdefined(instance.droppedteam)) {
        agentteam = instance.droppedteam;
    }
    level thread function_cd4716d7459f4e90(players, radiopos, self.team, agentteam);
    wait(2);
    scripts/mp/gametypes/br_pickups::loothide(instance);
}

// Namespace overseer / scripts/mp/overseer
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39b5
// Size: 0x62
function function_fc9a15646315764c(agentradio) {
    if (!isdefined(agentradio)) {
        return;
    }
    agentradio notify("radio_spam");
    agentradio endon("radio_spam");
    wait(3);
    while (isdefined(agentradio) && isdefined(agentradio.origin)) {
        alias = function_ef9999b04345f5d4();
        playsoundatpos(agentradio.origin, alias);
        wait(4);
    }
}
