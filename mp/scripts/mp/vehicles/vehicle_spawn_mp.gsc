#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;

#namespace namespace_bcf0caa0a00df979;

// Namespace namespace_bcf0caa0a00df979 / scripts\mp\vehicles\vehicle_spawn_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe5
// Size: 0x18
function vehicle_spawn_mp_init() {
    registersharedfunc("vehicle_spawn", "canSpawnVehicle", &vehicle_spawn_mp_canspawnvehicle);
}

// Namespace namespace_bcf0caa0a00df979 / scripts\mp\vehicles\vehicle_spawn_mp
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x105
// Size: 0x4e
function vehicle_spawn_mp_canspawnvehicle(vehicleref, owner, team) {
    if (!getmatchrulesdata("commonOption", "allowVehicles")) {
        return false;
    }
    if (getdvarint(hashcat(@"hash_e4fa5e1677f011e4", vehicleref), 1) == 0) {
        return false;
    }
    return true;
}
