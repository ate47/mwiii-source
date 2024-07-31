#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using script_296d214bc76efa52;
#using script_712fe2cf5c1f2c66;
#using script_1253596e7ea3b78c;
#using scripts\mp\gametypes\aon.gsc;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\mp\spawnlogic.gsc;

#namespace mp_jup_estate;

// Namespace mp_jup_estate / namespace_f2d0fb1f6fd98d51
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d5
// Size: 0xb5
function main() {
    namespace_c5030d878e3b7e9e::main();
    namespace_8fee258fbeaf4ef4::main();
    namespace_2fc4dce97ad9b282::main();
    level.var_2e458eba506fd230 = &scripts\mp\gametypes\aon::main;
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_estate");
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    thread function_8c33633d77d8244e();
}

// Namespace mp_jup_estate / namespace_f2d0fb1f6fd98d51
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x392
// Size: 0x209
function function_8c33633d77d8244e() {
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
        level.modifiedspawnpoints["204 3170"]["mp_tdm_spawn_secondary"]["remove"] = 1;
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_tdm_spawn_secondary", (400, 3176, 162.587), (0, 180, 0));
        break;
    case #"hash_6efb0f59a62300fb":
    case #"hash_fa34c5f6bd6d4432": 
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
        level.modifiedspawnpoints["229 3194"]["mp_dom_spawn"]["remove"] = 1;
        spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_dom_spawn", (392, 3184, 161.167), (0, 180, 0));
        break;
    }
    if (spawns.size > 0) {
        scripts\mp\spawnlogic::addscriptedspawnpoints(spawns);
    }
}

