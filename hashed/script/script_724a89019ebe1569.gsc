#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\spawnlogic.gsc;
#using script_71377694f2ad3445;
#using script_345063fd82f0759e;
#using script_62f8d390888e967a;
#using script_45021122541efa90;
#using scripts\mp\load.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\common\create_script_utility.gsc;
#using scripts\mp\gametypes\arm.gsc;
#using scripts\mp\compass.gsc;
#using script_5dd2399ee4334524;
#using scripts\mp\gametypes\wm_objectives.gsc;
#using script_261f1b574c15eab1;
#using script_3a535b44f9ecc6df;
#using script_2d3fead1b9e1d7e5;
#using script_69a61780e1cc21a9;
#using script_49314540c657d352;
#using script_36967ce8ee2ea745;
#using script_66e0e331f9783820;
#using script_7abaa04d5f9fc22e;
#using script_1d1428a3b7b402b0;
#using script_248ec5040062d3ce;
#using script_2d4b9c58ed0e3d91;
#using script_255133686f2d76c0;
#using script_eb4f4ce0838a5d9;

#namespace mp_jup_gw_fallout;

// Namespace mp_jup_gw_fallout / namespace_749852576d4edced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba
// Size: 0x17c
function main() {
    namespace_56ae7976ec67bdf3::main();
    namespace_40e0e1c29e46db8a::main();
    namespace_bce91ecf98352a58::main();
    namespace_78065fe0e46d6966::main();
    initvehicles();
    scripts\mp\load::main();
    scripts\cp_mp\utility\game_utility::registerlargemap();
    scripts\common\create_script_utility::initialize_create_script();
    if (getgametype() == "arm" || isgroundwarcoremode()) {
        if (!isdefined(level.localeid)) {
            setdvar(@"scr_localeID", 999);
        }
        scripts\mp\gametypes\arm::arm_initoutofbounds();
    } else {
        level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
        level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    }
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_gw_fallout");
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    scripts\common\create_script_utility::initialize_create_script();
    level thread namespace_26cb40d0737f75b0::main();
    if (getgametype() == "wm") {
        scripts\mp\gametypes\wm_objectives::function_333f4c66e6305891(1, "_a", "zone_1", "jup_dam_wb_capture_zone_a");
        scripts\mp\gametypes\wm_objectives::function_333f4c66e6305891(1, "_b", "zone_2", "jup_dam_wb_capture_zone_b");
        scripts\mp\gametypes\wm_objectives::function_333f4c66e6305891(1, "_c", "zone_3", "jup_dam_wb_capture_zone_c");
    }
}

// Namespace mp_jup_gw_fallout / namespace_749852576d4edced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43e
// Size: 0x68
function initvehicles() {
    level.var_1b4da6b781c9dfbd = 1;
    namespace_8db7d778efdc3d65::main();
    namespace_15896d40cab0d429::main();
    namespace_a8c01726524388f5::main();
    namespace_d8c2d739478db8bb::main();
    namespace_a8b2611e1c2c0f9c::main();
    namespace_65ad5249b19d5d41::main();
    namespace_9972b4aee3d673ca::main();
    namespace_a5c3c313b4f6886a::main();
    namespace_3568ab3cfd523b38::main();
    namespace_405c71940c7ec9ea::main();
    namespace_8624e3257d13b029::main();
    namespace_e0be878fcf65a96c::main();
    namespace_9ceb27f81903c8ef::main();
}

