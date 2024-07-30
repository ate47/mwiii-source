#using scripts\engine\utility.gsc;

#namespace br_ai_encounters_util;

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e
// Size: 0x1fa
function get_ai_team() {
    if (isdefined(self.encounter.info.team)) {
        return self.encounter.info.team;
    }
    playercount = [];
    foreach (team in level.teamnamelist) {
        playercount[team] = 0;
    }
    foreach (player in level.players) {
        team = player.pers["team"];
        if (!isdefined(team) || team == "spectator") {
            continue;
        }
        playercount[team]++;
    }
    foreach (team, count in playercount) {
        if (count == 0) {
            self.encounter.info.team = team;
            break;
        }
    }
    if (!isdefined(self.encounter.info.team)) {
        println("<dev string:x1c>");
        self.encounter.info.team = random(level.teamnamelist);
    }
    return self.encounter.info.team;
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x411
// Size: 0x160
function get_targets() {
    targets = [];
    if (isdefined(self.target)) {
        structs = getstructarray(self.target, "targetname");
        foreach (struct in structs) {
            targets[targets.size] = struct;
        }
        ents = getentarray(self.target, "targetname");
        foreach (ent in ents) {
            targets[targets.size] = ent;
        }
        nodes = getnodearray(self.target, "targetname");
        foreach (node in nodes) {
            targets[targets.size] = node;
        }
    }
    return targets;
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57a
// Size: 0x11c
function getvartype(var) {
    if (!isdefined(var)) {
        return "undefined";
    } else if (isfunction(var)) {
        return "function";
    } else if (isbuiltinfunction(var)) {
        return "builtin function";
    } else if (isbuiltinmethod(var)) {
        return "builtin method";
    } else if (isanimation(var)) {
        return "animation";
    } else if (isarray(var)) {
        return "array";
    } else if (isstruct(var)) {
        str = "struct";
    } else if (isvector(var)) {
        str = "vector";
    } else if (isent(var)) {
        str = "entity";
    } else if (isnode(var)) {
        str = "node";
    } else if (isint(var)) {
        str = "int";
    } else if (isfloat(var)) {
        str = "float";
    } else if (isstring(var)) {
        str = "string";
    } else if (isistring(var)) {
        str = "istring";
    } else {
        str = "unknown";
    }
    return str;
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f
// Size: 0xcd
function vartostring(var) {
    type = getvartype(var);
    switch (type) {
    case #"hash_b38a5d117ade0306": 
        return _arraytostring(var);
    case #"hash_a08ace5b3c23c762": 
        return ("(" + var[0] + "," + var[1] + "," + var[2] + ")");
    case #"hash_3e4a6f464c850b65":
    case #"hash_4730906c2f53f03e": 
        return ("" + var);
    case #"hash_2ac140ce3b5ea398": 
        return var;
    case #"hash_83e3a4585099313a": 
        return ("$e" + var getentitynumber());
    default: 
        return ("<" + type + ">");
    }
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x774
// Size: 0x95
function _arraytostring(var) {
    str = "[ ";
    first = 1;
    foreach (value in var) {
        if (!first) {
            str += ",";
        } else {
            first = 0;
        }
        str += vartostring(value);
    }
    str += " ]";
    return str;
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x812
// Size: 0x1c
function encounterremovenavobstacle(obstacleid) {
    destroynavobstacle(obstacleid);
    self notify("nav_obstacle_destroy_" + obstacleid);
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x836
// Size: 0x24
function encounterremovenavobstacleonencounterend(obstacleid) {
    self endon("nav_obstacle_destroy_" + obstacleid);
    self waittill("encounter_end");
    encounterremovenavobstacle(obstacleid);
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x862
// Size: 0x2d
function encounterremovenavobstacledelay(obstacleid, delaysec) {
    self endon("nav_obstacle_destroy_" + obstacleid);
    self endon("encounter_end");
    wait delaysec;
    encounterremovenavobstacle(obstacleid);
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x897
// Size: 0x21
function encounterdeleteentonend(ent) {
    ent endon("death");
    self waittill("encounter_end");
    ent delete();
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c0
// Size: 0x60
function disablescriptableplayeruseall(rewardobject) {
    foreach (player in level.players) {
        rewardobject disablescriptableplayeruse(player);
    }
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x928
// Size: 0x60
function enablescriptableplayeruseall(rewardobject) {
    foreach (player in level.players) {
        rewardobject enablescriptableplayeruse(player);
    }
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x990
// Size: 0x17d
function waittill_dead(guys, num, timeoutlength) {
    /#
        allalive = 1;
        foreach (member in guys) {
            if (isalive(member)) {
                continue;
            }
            allalive = 0;
            break;
        }
        assertex(allalive, "<dev string:x67>");
        if (!allalive) {
            newarray = [];
            foreach (member in guys) {
                if (isalive(member)) {
                    newarray[newarray.size] = member;
                }
            }
            guys = newarray;
        }
    #/
    ent = spawnstruct();
    if (isdefined(timeoutlength)) {
        ent endon("thread_timed_out");
        ent thread waittill_dead_timeout(timeoutlength);
    }
    ent.count = guys.size;
    if (isdefined(num) && num < ent.count) {
        ent.count = num;
    }
    array_thread(guys, &waittill_dead_thread, ent);
    while (ent.count > 0) {
        ent waittill("waittill_dead guy died");
    }
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb15
// Size: 0x113
function waittill_dead_or_dying(guys, num, timeoutlength) {
    newarray = [];
    foreach (member in guys) {
        if (isalive(member) && !member.ignoreforfixednodesafecheck) {
            newarray[newarray.size] = member;
        }
    }
    guys = newarray;
    ent = spawnstruct();
    if (isdefined(timeoutlength)) {
        ent endon("thread_timed_out");
        ent thread waittill_dead_timeout(timeoutlength);
    }
    ent.count = guys.size;
    if (isdefined(num) && num < ent.count) {
        ent.count = num;
    }
    array_thread(guys, &waittill_dead_or_dying_thread, ent);
    while (ent.count > 0) {
        ent waittill("waittill_dead_guy_dead_or_dying");
    }
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc30
// Size: 0x24
function waittill_notetrack_or_damage(notetrack) {
    self endon("damage");
    self endon("death");
    self waittillmatch("single anim", notetrack);
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc5c
// Size: 0x51
function get_living_ai(name, type) {
    array = get_living_ai_array(name, type);
    if (array.size > 1) {
        assertmsg("get_living_ai used for more than one living ai of type " + type + " called " + name + ".");
        return undefined;
    }
    return array[0];
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb6
// Size: 0x136
function get_living_ai_array(name, type) {
    ai = getaispeciesarray("all", "all");
    array = [];
    foreach (actor in ai) {
        if (!isalive(actor)) {
            continue;
        }
        switch (type) {
        case #"hash_5a532485943b3d4b": 
            if (isdefined(actor.targetname) && actor.targetname == name) {
                array[array.size] = actor;
            }
            break;
        case #"hash_6d8a4db48060bf8": 
            if (isdefined(actor.script_noteworthy) && actor.script_noteworthy == name) {
                array[array.size] = actor;
            }
            break;
        case #"hash_a9ba80180b5bb733": 
            if (isdefined(actor.animname) && actor.animname == name) {
                array[array.size] = actor;
            }
            break;
        }
    }
    return array;
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf5
// Size: 0x27
function waittill_dead_thread(ent) {
    self waittill("death");
    ent.count--;
    ent notify("waittill_dead guy died");
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe24
// Size: 0x30
function waittill_dead_or_dying_thread(ent) {
    waittill_either("death", "long_death");
    ent.count--;
    ent notify("waittill_dead_guy_dead_or_dying");
}

// Namespace br_ai_encounters_util / scripts\mp\gametypes\br_ai_encounters_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5c
// Size: 0x15
function waittill_dead_timeout(timeoutlength) {
    wait timeoutlength;
    self notify("thread_timed_out");
}

