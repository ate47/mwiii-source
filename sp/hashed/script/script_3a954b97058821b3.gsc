#using scripts\common\utility;

#namespace namespace_e0274e37aaa962ed;

// Namespace namespace_e0274e37aaa962ed / namespace_3bbdf53e8d9edc4d
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xbe
// Size: 0x9a
function private autoexec init()
{
    character = #"hash_f7463efed058b719";
    
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

// Namespace namespace_e0274e37aaa962ed / namespace_3bbdf53e8d9edc4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x160
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"fsa";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "civ_amsterdam_male_3_1" );
    self attach( "head_sc_m_vozhyuk_bg_civ", "", 1 );
    self.headmodel = "head_sc_m_vozhyuk_bg_civ";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_e0274e37aaa962ed / namespace_3bbdf53e8d9edc4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x222
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_e0274e37aaa962ed / namespace_3bbdf53e8d9edc4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22c
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "civ_amsterdam_male_3_1" );
    precachemodel( "head_sc_m_vozhyuk_bg_civ" );
}

// Namespace namespace_e0274e37aaa962ed / namespace_3bbdf53e8d9edc4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x253
// Size: 0x9
function precache_cpmp()
{
    precache();
}

