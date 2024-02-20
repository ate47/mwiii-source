// mwiii decomp prototype
#using script_16ea1b94f0f381b3;
#using script_3f51a039c4a1a113;
#using scripts\engine\utility.gsc;
#using script_4f794fb0bc50676b;
#using script_669f1da0d61f1ffa;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_2d425a56b4025faa;

#namespace namespace_97a798e7cca1750b;

// Namespace namespace_97a798e7cca1750b/namespace_49687fb9a060bf03
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x120
// Size: 0x22
function private autoexec __init__system__() {
    system::register(#"hash_ea7a2affe351ac7", #"ww_setup", &function_ca54f37762600466, undefined);
}

// Namespace namespace_97a798e7cca1750b/namespace_49687fb9a060bf03
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x149
// Size: 0x19
function private function_ca54f37762600466() {
    utility::registersharedfunc("ww_setup", "init", &init);
}

// Namespace namespace_97a798e7cca1750b/namespace_49687fb9a060bf03
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x169
// Size: 0x312
function private init() {
    level.var_f1339ee09ea219d8 = [];
    level.var_f1339ee09ea219d8 = array_add(level.var_f1339ee09ea219d8, "jup_pi_raygun_mp");
    level.var_f1339ee09ea219d8 = array_add(level.var_f1339ee09ea219d8, "jup_ar_dg2_mp");
    level.var_c16493593d07b88f = [];
    level.var_c16493593d07b88f = array_add(level.var_c16493593d07b88f, "jup_pi_raygun_mp");
    level.var_c16493593d07b88f = array_add(level.var_c16493593d07b88f, "jup_ar_dg2_mp");
    level.var_517ae1797c9e1995 = &function_517ae1797c9e1995;
    level.var_99a0ddbdeb40f977 = [];
    level.var_99a0ddbdeb40f977["jup_pi_raygun_mp"] = &function_3d68d8ff8bafc637;
    level.var_5287f18049ad084 = [];
    level.var_5287f18049ad084[0] = spawnstruct();
    level.var_5287f18049ad084[0].impact_damage = 1000;
    level.var_5287f18049ad084[0].var_22cd43fdb2005800 = 300;
    level.var_5287f18049ad084[0].var_b819eb69b7bd32d5 = 1500;
    level.var_5287f18049ad084[0].var_812a118beadac588 = 1200;
    level.var_5287f18049ad084[0].damage_scalar = 1;
    level.var_5287f18049ad084[1] = spawnstruct();
    level.var_5287f18049ad084[1].impact_damage = 1500;
    level.var_5287f18049ad084[1].var_22cd43fdb2005800 = 600;
    level.var_5287f18049ad084[1].var_b819eb69b7bd32d5 = 2000;
    level.var_5287f18049ad084[1].var_812a118beadac588 = 1400;
    level.var_5287f18049ad084[1].damage_scalar = 1.5;
    level.var_5287f18049ad084[2] = spawnstruct();
    level.var_5287f18049ad084[2].impact_damage = 3000;
    level.var_5287f18049ad084[2].var_22cd43fdb2005800 = 1200;
    level.var_5287f18049ad084[2].var_b819eb69b7bd32d5 = 3000;
    level.var_5287f18049ad084[2].var_812a118beadac588 = 1800;
    level.var_5287f18049ad084[2].damage_scalar = 3;
    level.var_5287f18049ad084[3] = spawnstruct();
    level.var_5287f18049ad084[3].impact_damage = 5000;
    level.var_5287f18049ad084[3].var_22cd43fdb2005800 = 2400;
    level.var_5287f18049ad084[3].var_b819eb69b7bd32d5 = 5000;
    level.var_5287f18049ad084[3].var_812a118beadac588 = 2600;
    level.var_5287f18049ad084[3].damage_scalar = 5;
    namespace_f50b7a445cd149bc::init();
}

// Namespace namespace_97a798e7cca1750b/namespace_49687fb9a060bf03
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x482
// Size: 0x7e
function function_517ae1797c9e1995(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon) {
    if (isdefined(objweapon)) {
        if (objweapon.basename == "jup_pi_raygun_mp") {
            return 15;
        } else if (objweapon.basename == "monkey_bomb_mp") {
            return int(min(75, idamage));
        }
    }
    return idamage;
}

// Namespace namespace_97a798e7cca1750b/namespace_49687fb9a060bf03
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x508
// Size: 0x212
function function_3d68d8ff8bafc637(var_d74fc41b6b10ccf5) {
    if (is_equal(var_d74fc41b6b10ccf5.smeansofdeath, "MOD_MELEE")) {
        return var_d74fc41b6b10ccf5.idamage;
    }
    var_29a8ba8c9dd43fd2 = undefined;
    if (issharedfuncdefined("zombie", "get_pap_level") && isdefined(var_d74fc41b6b10ccf5.eattacker)) {
        var_29a8ba8c9dd43fd2 = var_d74fc41b6b10ccf5.eattacker function_af5127390d3221e9(var_d74fc41b6b10ccf5.objweapon);
    }
    if (!isdefined(var_29a8ba8c9dd43fd2) || var_29a8ba8c9dd43fd2 == 0) {
        return var_d74fc41b6b10ccf5.idamage;
    }
    if (is_equal(var_d74fc41b6b10ccf5.smeansofdeath, "MOD_PROJECTILE")) {
        var_ecb3c911cdc43f1e = var_d74fc41b6b10ccf5.idamage - level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].impact_damage;
        var_a007b35451d483b0 = (var_ecb3c911cdc43f1e / level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].damage_scalar - level.var_5287f18049ad084[0].var_22cd43fdb2005800) / level.var_5287f18049ad084[0].var_812a118beadac588 * level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].var_812a118beadac588 + level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].var_22cd43fdb2005800;
        return (var_a007b35451d483b0 + level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].impact_damage);
    } else if (is_equal(var_d74fc41b6b10ccf5.smeansofdeath, "MOD_PROJECTILE_SPLASH")) {
        var_a007b35451d483b0 = (var_d74fc41b6b10ccf5.idamage / level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].damage_scalar - level.var_5287f18049ad084[0].var_22cd43fdb2005800) / level.var_5287f18049ad084[0].var_812a118beadac588 * level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].var_812a118beadac588 + level.var_5287f18049ad084[var_29a8ba8c9dd43fd2].var_22cd43fdb2005800;
        return var_a007b35451d483b0;
    }
    return var_d74fc41b6b10ccf5.idamage;
}
