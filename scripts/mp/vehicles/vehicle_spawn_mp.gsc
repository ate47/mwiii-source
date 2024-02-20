// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;

#namespace namespace_bcf0caa0a00df979;

// Namespace namespace_bcf0caa0a00df979/namespace_cff1154e5f566ff4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9
// Size: 0x19
function vehicle_spawn_mp_init() {
    registersharedfunc("vehicle_spawn", "canSpawnVehicle", &vehicle_spawn_mp_canspawnvehicle);
}

// Namespace namespace_bcf0caa0a00df979/namespace_cff1154e5f566ff4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9
// Size: 0x4f
function vehicle_spawn_mp_canspawnvehicle(var_7731adef63e19b0c, owner, team) {
    if (!getmatchrulesdata("commonOption", "allowVehicles")) {
        return 0;
    }
    if (getdvarint(function_2ef675c13ca1c4af(@"hash_e4fa5e1677f011e4", var_7731adef63e19b0c), 1) == 0) {
        return 0;
    }
    return 1;
}
