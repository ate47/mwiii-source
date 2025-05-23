#namespace dvars;

// Namespace dvars / scripts\mp\utility\dvars
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x92
// Size: 0x8f
function dvarintvalue( dvar, defval, minval, maxval )
{
    dvar = hashcat( @"scr_", level.gametype, "_", dvar );
    
    if ( getdvar( dvar ) == "" )
    {
        setdvar( dvar, defval );
        return defval;
    }
    
    value = getdvarint( dvar );
    
    if ( value > maxval )
    {
        value = maxval;
    }
    else if ( value < minval )
    {
        value = minval;
    }
    else
    {
        return value;
    }
    
    setdvar( dvar, value );
    return value;
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x12a
// Size: 0x8f
function dvarfloatvalue( dvar, defval, minval, maxval )
{
    dvar = hashcat( @"scr_", level.gametype, "_", dvar );
    
    if ( getdvar( dvar ) == "" )
    {
        setdvar( dvar, defval );
        return defval;
    }
    
    value = getdvarfloat( dvar );
    
    if ( value > maxval )
    {
        value = maxval;
    }
    else if ( value < minval )
    {
        value = minval;
    }
    else
    {
        return value;
    }
    
    setdvar( dvar, value );
    return value;
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c2
// Size: 0xb7
function registerwatchdvarint( namestring, defaultvalue )
{
    dvarstring = hashcat( @"scr_", level.gametype, "_", namestring );
    
    if ( getdvarint( dvarstring, -1 ) == -1 )
    {
        setdvar( dvarstring, defaultvalue );
    }
    
    level.watchdvars[ dvarstring ] = spawnstruct();
    level.watchdvars[ dvarstring ].value = getdvarint( dvarstring, defaultvalue );
    level.watchdvars[ dvarstring ].type = "int";
    level.watchdvars[ dvarstring ].notifystring = "update_" + namestring;
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x281
// Size: 0xb7
function registerwatchdvarfloat( namestring, defaultvalue )
{
    dvarstring = hashcat( @"scr_", level.gametype, "_", namestring );
    
    if ( getdvarfloat( dvarstring, -1 ) == -1 )
    {
        setdvar( dvarstring, defaultvalue );
    }
    
    level.watchdvars[ dvarstring ] = spawnstruct();
    level.watchdvars[ dvarstring ].value = getdvarfloat( dvarstring, defaultvalue );
    level.watchdvars[ dvarstring ].type = "float";
    level.watchdvars[ dvarstring ].notifystring = "update_" + namestring;
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x340
// Size: 0xbd
function registerwatchdvar( namestring, defaultvalue )
{
    dvarstring = hashcat( @"scr_", level.gametype, "_", namestring );
    
    if ( getdvar( dvarstring, "" ) == "" )
    {
        setdvar( dvarstring, defaultvalue );
    }
    
    level.watchdvars[ dvarstring ] = spawnstruct();
    level.watchdvars[ dvarstring ].value = getdvar( dvarstring, defaultvalue );
    level.watchdvars[ dvarstring ].type = "string";
    level.watchdvars[ dvarstring ].notifystring = "update_" + namestring;
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x405
// Size: 0x48
function setoverridewatchdvar( dvarstring, value )
{
    dvarhash = hashcat( @"scr_", level.gametype, "_", dvarstring );
    level.overridewatchdvars[ dvarhash ] = value;
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x455
// Size: 0x9b
function getwatcheddvar( dvarstring )
{
    dvarhash = function_3514ae5d09f47ed2( dvarstring );
    
    if ( isdefined( level.overridewatchdvars ) && isdefined( level.overridewatchdvars[ dvarhash ] ) )
    {
        return level.overridewatchdvars[ dvarhash ];
    }
    
    if ( isdefined( level.watchdvars ) && isdefined( level.watchdvars[ dvarhash ] ) && isdefined( level.watchdvars[ dvarhash ].value ) )
    {
        return level.watchdvars[ dvarhash ].value;
    }
    
    return undefined;
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f8
// Size: 0x28
function function_3514ae5d09f47ed2( dvarstring )
{
    return hashcat( @"scr_", level.gametype, "_", dvarstring );
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x529
// Size: 0x14b
function updatewatcheddvarsexecute()
{
    watchdvars = getarraykeys( level.watchdvars );
    
    foreach ( dvarstring in watchdvars )
    {
        if ( level.watchdvars[ dvarstring ].type == "string" )
        {
            dvarvalue = getproperty( dvarstring, level.watchdvars[ dvarstring ].value );
        }
        else if ( level.watchdvars[ dvarstring ].type == "float" )
        {
            dvarvalue = getfloatproperty( dvarstring, level.watchdvars[ dvarstring ].value );
        }
        else
        {
            dvarvalue = getintproperty( dvarstring, level.watchdvars[ dvarstring ].value );
        }
        
        if ( dvarvalue != level.watchdvars[ dvarstring ].value )
        {
            level.watchdvars[ dvarstring ].value = dvarvalue;
            level notify( level.watchdvars[ dvarstring ].notifystring, dvarvalue );
        }
    }
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x67c
// Size: 0x22
function updatewatcheddvars()
{
    while ( game[ "state" ] == "playing" )
    {
        updatewatcheddvarsexecute();
        wait 1;
    }
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6a6
// Size: 0x34
function getproperty( dvar, defvalue )
{
    value = defvalue;
    
    /#
        setdevdvarifuninitialized( dvar, defvalue );
    #/
    
    value = getdvar( dvar, defvalue );
    return value;
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6e3
// Size: 0x34
function getintproperty( dvar, defvalue )
{
    value = defvalue;
    
    /#
        setdevdvarifuninitialized( dvar, defvalue );
    #/
    
    value = getdvarint( dvar, defvalue );
    return value;
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x720
// Size: 0x34
function getfloatproperty( dvar, defvalue )
{
    value = defvalue;
    
    /#
        setdevdvarifuninitialized( dvar, defvalue );
    #/
    
    value = getdvarfloat( dvar, defvalue );
    return value;
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x75d
// Size: 0x1f
function getoverridedvarintexceptmatchrulesvalues( override, fallback )
{
    return getdvarint( override, getdvarint( fallback ) );
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x785
// Size: 0x1f
function getoverridedvarfloatexceptmatchrulesvalues( override, fallback )
{
    return getdvarfloat( override, getdvarfloat( fallback ) );
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7ad
// Size: 0x1f
function getoverridedvarexceptmatchrulesvalues( override, fallback )
{
    return getdvar( override, getdvar( fallback ) );
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7d5
// Size: 0x88
function function_18581799c48cc262( class, member )
{
    assert( isusingmatchrulesdata() );
    var_671cacea46ac6a97 = 0;
    
    /#
        var_671cacea46ac6a97 = 1;
    #/
    
    dvar = hashcat( @"scr_", level.gametype, "_", member );
    data = getmatchrulesdata( class, member );
    
    if ( !var_671cacea46ac6a97 )
    {
        setdynamicdvar( dvar, data );
        return;
    }
    
    /#
        setdevdvarifuninitialized( dvar, data );
    #/
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x865
// Size: 0x42
function function_29227adb79acc568( member, defvalue )
{
    dvar = hashcat( @"scr_", level.gametype, "_", member );
    return getdvarint( dvar, defvalue );
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8b0
// Size: 0x42
function function_ef4d323f56385843( member, defvalue )
{
    dvar = hashcat( @"scr_", level.gametype, "_", member );
    return getdvarfloat( dvar, defvalue );
}

// Namespace dvars / scripts\mp\utility\dvars
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8fb
// Size: 0x42
function function_36fd7e50e2a25847( member, defvalue )
{
    dvar = hashcat( @"scr_", level.gametype, "_", member );
    return getdvar( dvar, defvalue );
}

/#

    // Namespace dvars / scripts\mp\utility\dvars
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x946
    // Size: 0x9a, Type: dev
    function function_a972e013c8f2f2d4()
    {
        level notify( "<dev string:x1c>" );
        level endon( "<dev string:x1c>" );
        
        while ( true )
        {
            level waittill( "<dev string:x3c>" );
            setdevdvarifuninitialized( @"hash_7ae9abc841dc9c4b", 15 );
            setdevdvarifuninitialized( @"hash_fe0a46289ab091e1", level.radarviewtime );
            setdevdvarifuninitialized( @"hash_5bded6d7c75e5248", "<dev string:x51>" );
            setdevdvarifuninitialized( @"hash_b1f216df6049c46a", -1 );
            setdevdvarifuninitialized( @"hash_681596f27a5e0f7a", 30 );
            setdevdvarifuninitialized( @"hash_9d27a693c0c7d81b", 60 );
        }
    }

#/
