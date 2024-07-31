#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using script_7c00e7cc2e603682;
#using script_412466c4c791e73a;
#using script_4809767c1c6f3a50;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\mp\spawnlogic.gsc;

#namespace namespace_50ef81a97b4ab1ba;

// Namespace namespace_50ef81a97b4ab1ba / namespace_a3ef6f74c4e98be5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2be
// Size: 0xa7
function main() {
    namespace_c633f7d3363094a6::main();
    namespace_aaa6a7b2aa2cec40::main();
    namespace_1215d9c86f1fca0e::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_favela");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    thread function_2679bbd8edcd273a();
}

// Namespace namespace_50ef81a97b4ab1ba / namespace_a3ef6f74c4e98be5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36d
// Size: 0x215
function function_2679bbd8edcd273a() {
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
        break;
    case #"hash_6efb0f59a62300fb":
    case #"hash_fa34c5f6bd6d4432": 
        level.modifiedspawnpoints["323 2474"]["mp_koth_spawn"]["remove"] = 1;
        level.modifiedspawnpoints["115 2374"]["mp_koth_spawn"]["remove"] = 1;
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (440, 2512, 320), (0, 270, 0), undefined, "2");
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", (7.17, 2398.81, 306.666), (0, 204, 0), undefined, "3");
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
        break;
    }
    if (spawns.size > 0) {
        scripts\mp\spawnlogic::addscriptedspawnpoints(spawns);
    }
}
