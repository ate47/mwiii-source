#using scripts\common\string;
#using scripts\common\utility;
#using scripts\cp_mp\operator;
#using scripts\cp_mp\utility\game_utility;
#using scripts\engine\utility;

#namespace seasonalevents;

// Namespace seasonalevents / scripts\cp_mp\seasonalevents
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x262
// Size: 0x28
function private getdvarhash( dvarfieldname, dvarsuffix )
{
    return hashcat( @"hash_4489457facd70c28", dvarfieldname, "_", dvarsuffix );
}

// Namespace seasonalevents / scripts\cp_mp\seasonalevents
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x293
// Size: 0xf
function private oneindexed( i )
{
    return i + 1;
}

// Namespace seasonalevents / scripts\cp_mp\seasonalevents
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2ab
// Size: 0x25, Type: bool
function private function_b0de9e7b2bc4b4d5( currenttime, starttime, endtime )
{
    return currenttime >= starttime && currenttime < endtime;
}

// Namespace seasonalevents / scripts\cp_mp\seasonalevents
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2d9
// Size: 0xb3
function private getcurrenttime()
{
    systemtime = getsystemtime();
    currenttime = systemtime;
    
    if ( level.var_c5f55642efa61b9c )
    {
        foreach ( player in level.players )
        {
            timewarpoffsetseconds = player getplayerdata( level.var_5d69837cf4db0407, "timeWarpOffsetSeconds" );
            
            if ( !isdefined( timewarpoffsetseconds ) )
            {
                timewarpoffsetseconds = 0;
            }
            
            playercurrenttime = systemtime + timewarpoffsetseconds;
            
            if ( playercurrenttime > currenttime )
            {
                currenttime = playercurrenttime;
            }
        }
    }
    
    return currenttime;
}

// Namespace seasonalevents / scripts\cp_mp\seasonalevents
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x395
// Size: 0x53, Type: bool
function private isinwinbackdoublexpperiod()
{
    var_4824d03fad5b5dcf = string_split( getdvar( @"hash_b89d4a150e09a96b", "" ), "|" );
    
    if ( var_4824d03fad5b5dcf.size != 2 )
    {
        return false;
    }
    
    return function_b0de9e7b2bc4b4d5( getcurrenttime(), int( var_4824d03fad5b5dcf[ 0 ] ), int( var_4824d03fad5b5dcf[ 1 ] ) );
}

// Namespace seasonalevents / scripts\cp_mp\seasonalevents
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3f1
// Size: 0x4f3
function private loadeventdata()
{
    if ( isdefined( level.seasonalevents ) )
    {
        return;
    }
    
    level.var_c5f55642efa61b9c = getdvarint( @"hash_dec5cd614ac064d", 0 ) && !istrue( level.var_ec2fb549b15ad827 ) && !istrue( level.var_77907d733abe8b63 );
    seasonalevents = [];
    var_fe50eb1b16b6a9dd = undefined;
    
    if ( getdvarint( @"hash_75ee328744735d6a", 0 ) )
    {
        var_fe50eb1b16b6a9dd = getscriptbundle( %"hash_3d06516d47cafe56" );
    }
    else
    {
        var_fe50eb1b16b6a9dd = getscriptbundle( %"hash_1e670630bf9f818" );
    }
    
    if ( isdefined( var_fe50eb1b16b6a9dd ) )
    {
        foreach ( assetref in var_fe50eb1b16b6a9dd.events )
        {
            if ( !isdefined( assetref.eventdata ) )
            {
                continue;
            }
            
            bundlename = hashcat( %"hash_380349b348ddab0c", assetref.eventdata );
            bundledata = getscriptbundle( bundlename );
            
            if ( !isdefined( bundledata ) )
            {
                continue;
            }
            
            eventdisabled = getdvarint( getdvarhash( "eventDisabled", bundledata.dvarsuffix ) );
            
            if ( istrue( eventdisabled ) )
            {
                continue;
            }
            
            starttime = getdvar( getdvarhash( "startTime", bundledata.dvarsuffix ), bundledata.starttime );
            endtime = getdvar( getdvarhash( "endTime", bundledata.dvarsuffix ), bundledata.endtime );
            starttime = ter_op( !string::function_46b9c00bb0535aa3( starttime ), int( starttime ), 0 );
            endtime = ter_op( !string::function_46b9c00bb0535aa3( endtime ), int( endtime ), 1800000000 );
            eventactive = function_b0de9e7b2bc4b4d5( getsystemtime(), starttime, endtime );
            featuredlootbonus = bundledata.featuredlootbonus;
            var_4ac7c4e9c961770f = getdvarhash( "featuredLootBonus", bundledata.dvarsuffix );
            
            if ( isdvardefined( var_4ac7c4e9c961770f ) )
            {
                featuredlootbonus = getdvarint( var_4ac7c4e9c961770f );
            }
            
            var_56651c25de2e68b5 = [];
            
            for (i = 0; i < bundledata.featuredloot.size; i++) {
                featuredlootid = bundledata.featuredloot[ i ].featureditemlootid;
                featuredlootid = getdvar( getdvarhash( "featuredItemLootID_" + oneindexed( i ), bundledata.dvarsuffix ), featuredlootid );
                featuredlootid = ter_op( !string::function_46b9c00bb0535aa3( featuredlootid ), int( featuredlootid ), 0 );
                var_56651c25de2e68b5[ var_56651c25de2e68b5.size ] = featuredlootid;
            }
            
            pointscategories = [];
            
            for (i = 0; i < bundledata.var_5e42ba3bc94d58ff.var_c1d8c1d953c02016.pointscategories.size; i++) {
                key = bundledata.var_5e42ba3bc94d58ff.var_c1d8c1d953c02016.pointscategories[ i ].key;
                key = getdvar( getdvarhash( "pointsCategoryKey_" + oneindexed( i ), bundledata.dvarsuffix ), key );
                pointscategories[ pointscategories.size ] = key;
            }
            
            var_9301e90474add74a = istrue( bundledata.template == "POINTS" );
            var_a60ed65bd4c825b7 = istrue( bundledata.var_a60ed65bd4c825b7 );
            var_479fdb4d11a5e990 = [];
            var_a3d09160ba37a87b = 0;
            
            if ( var_9301e90474add74a || var_a60ed65bd4c825b7 )
            {
                var_a3d09160ba37a87b = 1;
                operatorskindisabled = getdvarint( getdvarhash( "operatorSkinDisabled", bundledata.dvarsuffix ) );
                
                if ( !istrue( operatorskindisabled ) )
                {
                    if ( var_56651c25de2e68b5.size >= 1 )
                    {
                        var_479fdb4d11a5e990 = var_56651c25de2e68b5;
                    }
                }
            }
            
            eventdata = spawnstruct();
            eventdata.template = bundledata.template;
            eventdata.dvarsuffix = bundledata.dvarsuffix;
            eventdata.starttime = starttime;
            eventdata.endtime = endtime;
            eventdata.eventactive = eventactive;
            eventdata.var_56651c25de2e68b5 = var_56651c25de2e68b5;
            eventdata.pointscategories = pointscategories;
            eventdata.var_9301e90474add74a = var_9301e90474add74a;
            eventdata.var_a60ed65bd4c825b7 = var_a60ed65bd4c825b7;
            eventdata.var_a3d09160ba37a87b = var_a3d09160ba37a87b;
            eventdata.var_479fdb4d11a5e990 = var_479fdb4d11a5e990;
            eventdata.featuredlootbonus = featuredlootbonus;
            seasonalevents[ seasonalevents.size ] = eventdata;
        }
    }
    
    level.seasonalevents = seasonalevents;
}

// Namespace seasonalevents / scripts\cp_mp\seasonalevents
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8ec
// Size: 0xf1
function private function_7d7f33f970281be5()
{
    assert( isdefined( level.seasonalevents ) );
    
    if ( isdefined( level.currentevent ) )
    {
        return;
    }
    
    currentevent = spawnstruct();
    currentevent.eventactive = 0;
    
    foreach ( event in level.seasonalevents )
    {
        if ( event.var_a3d09160ba37a87b && event.eventactive )
        {
            currentevent.eventactive = 1;
            currentevent.var_9301e90474add74a = event.var_9301e90474add74a;
            currentevent.featuredlootbonus = event.featuredlootbonus;
            break;
        }
    }
    
    level.currentevent = currentevent;
}

// Namespace seasonalevents / scripts\cp_mp\seasonalevents
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x9e5
// Size: 0x86
function autoexec function_b9ac0d0975647ba()
{
    registersharedfunc( "seasonalevents", "init", &init );
    registersharedfunc( "seasonalevents", "getFeaturedLootEventActive", &getfeaturedlooteventactive );
    registersharedfunc( "seasonalevents", "hasFeaturedOperatorSkinEquipped", &hasfeaturedoperatorskinequipped );
    registersharedfunc( "seasonalevents", "getFeaturedLootEventBonus", &getfeaturedlooteventbonus );
    registersharedfunc( "seasonalevents", "featuredLootEventIsFieldRep", &featuredlooteventisfieldrep );
    registersharedfunc( "seasonalevents", "isInWinbackDoubleXpPeriod", &isinwinbackdoublexpperiod );
}

// Namespace seasonalevents / scripts\cp_mp\seasonalevents
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa73
// Size: 0x10
function private init()
{
    loadeventdata();
    function_7d7f33f970281be5();
}

// Namespace seasonalevents / scripts\cp_mp\seasonalevents
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa8b
// Size: 0xd6
function private getfeaturedlooteventactive()
{
    assert( isdefined( level.currentevent ) );
    assert( isdefined( level.seasonalevents ) );
    
    if ( level.var_c5f55642efa61b9c )
    {
        currenttime = getcurrenttime();
        
        foreach ( event in level.seasonalevents )
        {
            if ( event.var_a3d09160ba37a87b )
            {
                if ( function_b0de9e7b2bc4b4d5( currenttime, event.starttime, event.endtime ) )
                {
                    return 1;
                }
            }
        }
        
        return 0;
    }
    
    return level.currentevent.eventactive;
}

// Namespace seasonalevents / scripts\cp_mp\seasonalevents
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb6a
// Size: 0xb8, Type: bool
function private featuredlooteventisfieldrep()
{
    assert( isdefined( level.currentevent ) );
    assert( isdefined( level.seasonalevents ) );
    
    if ( level.var_c5f55642efa61b9c )
    {
        currenttime = getcurrenttime();
        
        foreach ( event in level.seasonalevents )
        {
            if ( istrue( event.var_9301e90474add74a ) )
            {
                return true;
            }
        }
        
        return false;
    }
    
    return istrue( level.currentevent.var_9301e90474add74a );
}

// Namespace seasonalevents / scripts\cp_mp\seasonalevents
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc2b
// Size: 0xdf
function private getfeaturedlooteventbonus()
{
    assert( isdefined( level.currentevent ) );
    assert( isdefined( level.seasonalevents ) );
    
    if ( level.var_c5f55642efa61b9c )
    {
        currenttime = getcurrenttime();
        
        foreach ( event in level.seasonalevents )
        {
            if ( event.var_a3d09160ba37a87b )
            {
                if ( function_b0de9e7b2bc4b4d5( currenttime, event.starttime, event.endtime ) )
                {
                    return event.featuredlootbonus;
                }
            }
        }
        
        return 0;
    }
    
    return level.currentevent.featuredlootbonus;
}

// Namespace seasonalevents / scripts\cp_mp\seasonalevents
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd13
// Size: 0x297, Type: bool
function private hasfeaturedoperatorskinequipped()
{
    assert( isdefined( level.seasonalevents ) );
    assert( isdefined( self ) && isplayer( self ) );
    player = self;
    var_650b47766000d829 = undefined;
    var_48c6afe9d308416c = undefined;
    var_1c6922a7d061f276 = undefined;
    
    if ( isdefined( player.operatorcustomization ) && isdefined( player.operatorcustomization.skinlootid ) )
    {
        var_650b47766000d829 = player.operatorcustomization.skinlootid;
    }
    
    var_fd476bda738b0d05 = scripts\common\utility::ismp() && !isbrstylegametype() && getgametype() != "ob";
    
    if ( var_fd476bda738b0d05 )
    {
        var_f5cf62a90611b64d = player getplayerdata( level.loadoutsgroup, "customizationSetup", "operators", 0 );
        
        if ( !string::function_46b9c00bb0535aa3( var_f5cf62a90611b64d ) && scripts\cp_mp\operator::function_54240a5fc41f6590( var_f5cf62a90611b64d ) )
        {
            var_48c6afe9d308416c = player getplayerdata( level.loadoutsgroup, "customizationSetup", "operatorCustomization", var_f5cf62a90611b64d, "skin" );
        }
        
        var_d36f855c0bf1a4f7 = player getplayerdata( level.loadoutsgroup, "customizationSetup", "operators", 1 );
        
        if ( !string::function_46b9c00bb0535aa3( var_d36f855c0bf1a4f7 ) && scripts\cp_mp\operator::function_54240a5fc41f6590( var_d36f855c0bf1a4f7 ) )
        {
            var_1c6922a7d061f276 = player getplayerdata( level.loadoutsgroup, "customizationSetup", "operatorCustomization", var_d36f855c0bf1a4f7, "skin" );
        }
    }
    
    currenttime = getcurrenttime();
    
    foreach ( event in level.seasonalevents )
    {
        if ( event.var_a3d09160ba37a87b )
        {
            if ( function_b0de9e7b2bc4b4d5( currenttime, event.starttime, event.endtime ) )
            {
                foreach ( operatorskinlootid in event.var_479fdb4d11a5e990 )
                {
                    if ( operatorskinlootid != 0 )
                    {
                        if ( isdefined( var_650b47766000d829 ) && var_650b47766000d829 == operatorskinlootid )
                        {
                            return true;
                        }
                        
                        if ( isdefined( var_48c6afe9d308416c ) && var_48c6afe9d308416c == operatorskinlootid )
                        {
                            return true;
                        }
                        
                        if ( isdefined( var_1c6922a7d061f276 ) && var_1c6922a7d061f276 == operatorskinlootid )
                        {
                            return true;
                        }
                    }
                }
            }
        }
    }
    
    return false;
}

