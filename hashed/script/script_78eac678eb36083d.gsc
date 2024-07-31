#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\common\exploder.gsc;
#using script_c82b5b3b0cb66e0;
#using script_6fb1bf3216da9e26;
#using script_674f760278c8f94c;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\animation_suite.gsc;
#using scripts\mp\equipment\tactical_cover.gsc;
#using scripts\mp\spawnlogic.gsc;

#namespace namespace_7c96c346f3f8d718;

// Namespace namespace_7c96c346f3f8d718 / namespace_f9727b4870766745
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x356
// Size: 0x113
function main() {
    namespace_ab284c27b0a64998::main();
    namespace_1b0170d3b4522e60::main();
    namespace_46ff9488c4c4962e::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_shipment_xmas");
    setdvar(@"r_umbraMinObjectContribution", 8);
    setdvar(@"r_umbraAccurateOcclusionThreshold", 384);
    scripts\cp_mp\utility\game_utility::registersmallmap();
    if (level.gametype == "arena") {
        scripts\cp_mp\utility\game_utility::registerarenamap();
    }
    if (getdvarint(@"hash_75c08b5d09e65c6c", 1) == 1) {
        level.var_e886c825dc0634c0 = 1;
    }
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    thread function_e182fb0acb8f13db();
    thread scripts\mp\animation_suite::animationsuite();
    thread function_31dc060e85f4a689();
    level function_3c37e8e4377aa2b3();
    level.var_5cd0b14f081d7d7a = 1;
    level.gethillspawnshutoffradius = &function_69fcdbec24a02352;
}

// Namespace namespace_7c96c346f3f8d718 / namespace_f9727b4870766745
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x471
// Size: 0x13
function function_69fcdbec24a02352() {
    return getdvarint(@"hash_c0cf50f594cc8ecc", 512);
}

// Namespace namespace_7c96c346f3f8d718 / namespace_f9727b4870766745
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48d
// Size: 0x14
function function_e182fb0acb8f13db() {
    wait 1;
    exploder("shipsplash_back_l");
}

// Namespace namespace_7c96c346f3f8d718 / namespace_f9727b4870766745
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a9
// Size: 0x9a
function function_3c37e8e4377aa2b3() {
    scripts\mp\equipment\tactical_cover::function_c5d3d6e10bd8c8ab((-356, -292, -184), 1);
    scripts\mp\equipment\tactical_cover::function_c5d3d6e10bd8c8ab((-348, -856, -184), 1);
    scripts\mp\equipment\tactical_cover::function_c5d3d6e10bd8c8ab((-1032, -356, -184), 1);
    scripts\mp\equipment\tactical_cover::function_c5d3d6e10bd8c8ab((-1100, -120, -184), 0);
    scripts\mp\equipment\tactical_cover::function_c5d3d6e10bd8c8ab((-596, 336, -184), 1);
    scripts\mp\equipment\tactical_cover::function_c5d3d6e10bd8c8ab((140, -112, -184), 1);
    scripts\mp\equipment\tactical_cover::function_c5d3d6e10bd8c8ab((80, -356, -184), 0);
}

// Namespace namespace_7c96c346f3f8d718 / namespace_f9727b4870766745
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54b
// Size: 0xbcd
function function_31dc060e85f4a689() {
    spawns = [];
    switch (getbasegametype()) {
    case #"hash_1a5d186c17c00d3c": 
        break;
    case #"hash_a1313b745c17c07e": 
        break;
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930": 
        break;
    case #"hash_2fcf99fb5dbdcffb":
    case #"hash_3a17de6e294210d2":
    case #"hash_515260130b210bff":
    case #"hash_7485fa6c474ec865":
    case #"hash_973d1db8b6644466":
    case #"hash_b0eb18371d980895":
    case #"hash_b9458959b10637f8":
    case #"hash_c3668076a0827ce0":
    case #"hash_dd5b900f435d3f36":
    case #"hash_ddd385f0a27d71bb":
    case #"hash_ea061d29bbd1f237":
    case #"hash_ec24570718a340f5": 
        level.modifiedspawnpoints["104 -220"]["mp_tdm_spawn_secondary"]["remove"] = 1;
        level.modifiedspawnpoints["104 -220 -168"]["mp_tdm_spawn_secondary"]["remove"] = 1;
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (110, -218, -168), (0, 65, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-1024, -870, -174), (0, 36, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-790, -496, -174), (0, 92, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-1126, -394, -174), (0, 296, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-1026, -380, -174), (0, 288, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-1014, -118, -174), (0, 90, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-1110, -72, -174), (0, 54, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-550, 352, -174), (0, 180, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (62, -94, -174), (0, 98, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (146, -78, -174), (0, 122, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (170, -332, -180), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (170, -390, -180), (0, 196, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-414, 340, -174), (0, 180, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (126, -164, -174), (0, 70, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (90, -294, -174), (0, 70, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-374, -490, -174), (0, 82, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-430, -870, -176), (0, 0, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-1056, -288, -174), (0, 286, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn", (-1140, -314, -174), (0, 278, 0), undefined, undefined);
        break;
    case #"hash_6efb0f59a62300fb":
    case #"hash_fa34c5f6bd6d4432": 
        level.modifiedspawnpoints["104 -220"]["mp_koth_spawn_secondary"]["remove"] = 1;
        level.modifiedspawnpoints["104 -220 -168"]["mp_koth_spawn_secondary"]["remove"] = 1;
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (110, -218, -168), (0, 65, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-1024, -870, -174), (0, 36, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-790, -496, -174), (0, 92, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-1126, -394, -174), (0, 296, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-1026, -380, -174), (0, 288, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-1014, -118, -174), (0, 90, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-1110, -72, -174), (0, 54, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-550, 352, -174), (0, 180, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (62, -94, -174), (0, 98, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (146, -78, -174), (0, 122, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (170, -332, -180), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (170, -390, -180), (0, 196, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-414, 340, -174), (0, 180, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (126, -164, -174), (0, 70, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (90, -294, -174), (0, 70, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-374, -490, -174), (0, 82, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-430, -870, -176), (0, 0, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-1056, -288, -174), (0, 286, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (-1140, -314, -174), (0, 278, 0), undefined, undefined);
        break;
    case #"hash_c51506c10984515":
    case #"hash_21eed743fb721f4a":
    case #"hash_31104ebc01bd9ba9":
    case #"hash_3696c16c262a0862":
    case #"hash_77eb1179a728005e":
    case #"hash_fa0ed9f6bd4f4e9a":
    case #"hash_fb5b5e6c07253005": 
        break;
    case #"hash_f4a9126c03d3385b": 
        level.modifiedspawnpoints["104 -220"]["mp_dom_spawn_secondary"]["remove"] = 1;
        level.modifiedspawnpoints["104 -220 -168"]["mp_dom_spawn_secondary"]["remove"] = 1;
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (110, -218, -168), (0, 65, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-1024, -870, -174), (0, 36, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-790, -496, -174), (0, 92, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-1126, -394, -174), (0, 296, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-1026, -380, -174), (0, 288, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-1014, -118, -174), (0, 90, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-1110, -72, -174), (0, 54, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-550, 352, -174), (0, 180, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (62, -94, -174), (0, 98, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (146, -78, -174), (0, 122, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (170, -332, -180), (0, 270, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (170, -390, -180), (0, 196, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-414, 340, -174), (0, 180, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (126, -164, -174), (0, 70, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (90, -294, -174), (0, 70, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-430, -870, -176), (0, 0, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-1056, -288, -174), (0, 286, 0), undefined, undefined);
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (-1140, -314, -174), (0, 278, 0), undefined, undefined);
        break;
    }
    if (spawns.size > 0) {
        scripts\mp\spawnlogic::addscriptedspawnpoints(spawns);
    }
}

