#using scripts\common\utility;
#using scripts\cp_mp\vehicles\vehicle_compass;
#using scripts\engine\utility;

#namespace vehicle_compass_cp;

// Namespace vehicle_compass_cp / scripts\cp\vehicles\vehicle_compass_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa8
// Size: 0x18
function vehicle_compass_cp_init()
{
    registersharedfunc( "vehicle_compass", "shouldBeVisibleToPlayer", &vehicle_compass_cp_shouldbevisibletoplayer );
}

// Namespace vehicle_compass_cp / scripts\cp\vehicles\vehicle_compass_cp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc8
// Size: 0x47
function vehicle_compass_cp_shouldbevisibletoplayer( vehicle, player )
{
    if ( function_a2a780464918dc3a() && getdvarint( @"hash_b7d46b36430341a5", 0 ) )
    {
        if ( isdefined( vehicle ) )
        {
            return player function_80f8ad4df1927d77( vehicle.origin );
        }
    }
    
    return 1;
}

