#using scripts\common\utility;

#namespace namespace_90fe452303cd22fb;

// Namespace namespace_90fe452303cd22fb / namespace_90d5e1606f98a21b
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xbf
// Size: 0x9a
function private autoexec init()
{
    character = #"hash_3d3eb20a1f2123f7";
    
    if ( !isdefined( level.fncharacter ) )
    {
        level.fncharacter = [];
    }
    
    if ( !isdefined( level.var_7d97144daa7995cd ) )
    {
        level.var_7d97144daa7995cd = [];
    }
    
    if ( !isdefined( level.var_44bf7e31237b3073 ) )
    {
        level.var_44bf7e31237b3073 = [];
    }
    
    level.fncharacter[ character ] = &main;
    
    if ( issp() )
    {
        level.var_7d97144daa7995cd[ character ] = &precache_sp;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_90fe452303cd22fb / namespace_90d5e1606f98a21b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x161
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednationsfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_civ_london_female_9_2" );
    self attach( "head_sc_f_dizon_var_1", "", 1 );
    self.headmodel = "head_sc_f_dizon_var_1";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_90fe452303cd22fb / namespace_90d5e1606f98a21b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x223
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_90fe452303cd22fb / namespace_90d5e1606f98a21b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22d
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_civ_london_female_9_2" );
    precachemodel( "head_sc_f_dizon_var_1" );
}

// Namespace namespace_90fe452303cd22fb / namespace_90d5e1606f98a21b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x254
// Size: 0x9
function precache_cpmp()
{
    precache();
}

