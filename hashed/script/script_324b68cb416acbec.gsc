#using scripts\cp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_d7008f2c77d25ce5;

// Namespace namespace_d7008f2c77d25ce5 / namespace_6d1c9cb20efeb350
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xff
// Size: 0x9
function main() {
    function_ca410274ca39d561();
}

// Namespace namespace_d7008f2c77d25ce5 / namespace_6d1c9cb20efeb350
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x110
// Size: 0x298
function function_ca410274ca39d561() {
    level.var_d7008f2c77d25ce5 = [];
    level.var_d7008f2c77d25ce5["ar"] = ["ar", "ar", "ar"];
    level.var_d7008f2c77d25ce5["smg"] = ["smg", "smg", "smg"];
    level.var_d7008f2c77d25ce5["shotgun"] = ["shotgun", "shotgun", "shotgun"];
    level.var_d7008f2c77d25ce5["lmg"] = ["lmg", "lmg", "lmg"];
    level.var_d7008f2c77d25ce5["ar_smg"] = ["smg", "ar_ak", "smg", "ar_ak"];
    level.var_d7008f2c77d25ce5["ar_shotgun"] = ["shotgun", "ar_ak", "shotgun", "ar_ak"];
    level.var_d7008f2c77d25ce5["ar_lmg"] = ["lmg", "ar_ak", "lmg", "ar_ak"];
    level.var_d7008f2c77d25ce5["smg_shotgun"] = ["smg", "shotgun", "smg", "shotgun"];
    level.var_d7008f2c77d25ce5["smg_lmg"] = ["lmg", "smg", "lmg", "smg"];
    level.var_d7008f2c77d25ce5["smg_ar_support"] = ["smg", "smg", "ar"];
    level.var_d7008f2c77d25ce5["sniper"] = ["sniper", "sniper", "sniper", "sniper"];
    level.var_d7008f2c77d25ce5["rpg"] = ["rpg", "rpg", "rpg"];
    level.var_d7008f2c77d25ce5["riot"] = ["riotshield", "smg", "ar"];
    level.var_d7008f2c77d25ce5["jug"] = ["juggernaut"];
}

// Namespace namespace_d7008f2c77d25ce5 / namespace_6d1c9cb20efeb350
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b0
// Size: 0x16
function function_de96b8a387dbe2a(var_516ff72cf3a5b67d) {
    return level.var_d7008f2c77d25ce5[var_516ff72cf3a5b67d];
}
