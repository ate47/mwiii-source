// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace passives;

// Namespace passives/namespace_d42f0311f511b910
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94
// Size: 0x14
function init() {
    level.passivemap = [];
    passiveparsetable();
}

// Namespace passives/namespace_d42f0311f511b910
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf
// Size: 0x224
function passiveparsetable() {
    if (!isdefined(level.passivemap)) {
        level.passivemap = [];
    }
    for (row = 0; 1; row++) {
        id = tablelookupbyrow("mp/passivetable.csv", row, 0);
        if (id == "") {
            break;
        }
        var_9f77fa0224fd3b6b = tablelookupbyrow("mp/passivetable.csv", row, 1);
        attachmentref = tablelookupbyrow("mp/passivetable.csv", row, 12);
        perkref = tablelookupbyrow("mp/passivetable.csv", row, 13);
        messageref = tablelookupbyrow("mp/passivetable.csv", row, 14);
        struct = spawnstruct();
        struct.name = var_9f77fa0224fd3b6b;
        struct.weapontype = ter_op(tablelookupbyrow("mp/passivetable.csv", row, 8) == "", 0, 1);
        struct.killstreaktype = ter_op(tablelookupbyrow("mp/passivetable.csv", row, 9) == "", 0, 1);
        struct.lethaltype = ter_op(tablelookupbyrow("mp/passivetable.csv", row, 10) == "", 0, 1);
        struct.tacticaltype = ter_op(tablelookupbyrow("mp/passivetable.csv", row, 11) == "", 0, 1);
        if (attachmentref != "") {
            struct.attachmentref = attachmentref;
        }
        if (getdvar(@"hash_e65e9a96eb2ff62b") == "zombie") {
            var_4c1a232672db4b7f = tablelookupbyrow("mp/passivetable.csv", row, 22);
            if (var_4c1a232672db4b7f != "") {
                struct.attachmentref = var_4c1a232672db4b7f;
            }
        }
        if (perkref != "") {
            struct.perkref = perkref;
        }
        if (messageref != "") {
            struct.messageref = messageref;
        }
        if (!isdefined(level.passivemap[var_9f77fa0224fd3b6b])) {
            level.passivemap[var_9f77fa0224fd3b6b] = struct;
        }
    }
}

// Namespace passives/namespace_d42f0311f511b910
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da
// Size: 0x34
function getpassivestruct(passive) {
    if (!isdefined(level.passivemap[passive])) {
        return undefined;
    }
    struct = level.passivemap[passive];
    return struct;
}

// Namespace passives/namespace_d42f0311f511b910
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x316
// Size: 0x41
function getpassiveattachment(passive) {
    struct = getpassivestruct(passive);
    if (!isdefined(struct) || !isdefined(struct.attachmentref)) {
        return undefined;
    }
    return struct.attachmentref;
}

// Namespace passives/namespace_d42f0311f511b910
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35f
// Size: 0x41
function getpassiveperk(passive) {
    struct = getpassivestruct(passive);
    if (!isdefined(struct) || !isdefined(struct.perkref)) {
        return undefined;
    }
    return struct.perkref;
}

// Namespace passives/namespace_d42f0311f511b910
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a8
// Size: 0x41
function getpassivemessage(passive) {
    struct = getpassivestruct(passive);
    if (!isdefined(struct) || !isdefined(struct.messageref)) {
        return undefined;
    }
    return struct.messageref;
}

// Namespace passives/namespace_d42f0311f511b910
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f1
// Size: 0x7b
function getweapontypepassives() {
    passives = [];
    foreach (passive in level.passivemap) {
        if (passive.weapontype) {
            passives[passives.size] = passive.name;
        }
    }
    return passives;
}

// Namespace passives/namespace_d42f0311f511b910
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x474
// Size: 0x7b
function getkillstreaktypepassives() {
    passives = [];
    foreach (passive in level.passivemap) {
        if (passive.killstreaktype) {
            passives[passives.size] = passive.name;
        }
    }
    return passives;
}

// Namespace passives/namespace_d42f0311f511b910
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f7
// Size: 0x7b
function getlethaltypepassives() {
    passives = [];
    foreach (passive in level.passivemap) {
        if (passive.lethaltype) {
            passives[passives.size] = passive.name;
        }
    }
    return passives;
}

// Namespace passives/namespace_d42f0311f511b910
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57a
// Size: 0x7b
function gettacticaltypepassives() {
    passives = [];
    foreach (passive in level.passivemap) {
        if (passive.tacticaltype) {
            passives[passives.size] = passive.name;
        }
    }
    return passives;
}
