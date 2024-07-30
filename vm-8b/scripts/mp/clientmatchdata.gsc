#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace clientmatchdata;

// Namespace clientmatchdata / scripts\mp\clientmatchdata
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe7
// Size: 0x5d
function init() {
    if (getdvarint(@"hash_1bc373211683e0b6") != 0 && !isdefined(game["clientMatchDataDef"])) {
        game["clientMatchDataDef"] = "ddl/mp/clientmatchdata.ddl";
        setclientmatchdatadef(game["clientMatchDataDef"]);
        setclientmatchdata("map", level.script);
    }
    level.clientmatchdata_logplayerdeath = &logplayerdeath;
}

// Namespace clientmatchdata / scripts\mp\clientmatchdata
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14c
// Size: 0x4b
function canlogclient(client) {
    if (isagent(client)) {
        return false;
    }
    assertex(isplayer(client), "<dev string:x1c>" + client.code_classname);
    return client.clientid < level.maxlogclients;
}

// Namespace clientmatchdata / scripts\mp\clientmatchdata
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a0
// Size: 0x10
function canlogdeath(deathid) {
    return deathid < 300;
}

// Namespace clientmatchdata / scripts\mp\clientmatchdata
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b9
// Size: 0x93
function logplayerdeath(attacker) {
    if (getdvarint(@"hash_1bc373211683e0b6") == 0) {
        return;
    }
    deathid = getclientmatchdata("deathCount");
    if (!canlogclient(self) || !canlogdeath(deathid)) {
        return;
    }
    if (isplayer(attacker) && canlogclient(attacker)) {
        self logclientmatchdatadeath(deathid, self.clientid, attacker, attacker.clientid);
        return;
    }
    self logclientmatchdatadeath(deathid, self.clientid, undefined, undefined);
}
