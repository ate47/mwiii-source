#using script_657b7e6f27cb96d0;
#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_jup_paris\mp_jup_paris_fx;
#using scripts\mp\maps\mp_jup_paris\mp_jup_paris_lighting;

#namespace mp_jup_paris;

// Namespace mp_jup_paris / scripts\mp\maps\mp_jup_paris\mp_jup_paris
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x161
// Size: 0x87
function main() {
    namespace_653a5ceb3b4eefd4::main();
    scripts\mp\maps\mp_jup_paris\mp_jup_paris_fx::main();
    scripts\mp\maps\mp_jup_paris\mp_jup_paris_lighting::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_paris");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
}
