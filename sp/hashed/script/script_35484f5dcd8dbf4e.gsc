#using scripts\common\utility;

#namespace namespace_4ce53ac8883e47a6;

// Namespace namespace_4ce53ac8883e47a6 / namespace_7de30195e3c90e86
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc8
// Size: 0x9a
function private autoexec init()
{
    character = #"hash_d6dceb13b89f3ed2";
    
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

// Namespace namespace_4ce53ac8883e47a6 / namespace_7de30195e3c90e86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16a
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "rebel";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_civ_prisoner_04_b_riot" );
    self attach( "head_c_jup_sc_m_utnehmer_cine", "", 1 );
    self.headmodel = "head_c_jup_sc_m_utnehmer_cine";
    self setclothtype( #"cloth" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_4ce53ac8883e47a6 / namespace_7de30195e3c90e86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22c
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_4ce53ac8883e47a6 / namespace_7de30195e3c90e86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x236
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_civ_prisoner_04_b_riot" );
    precachemodel( "head_c_jup_sc_m_utnehmer_cine" );
}

// Namespace namespace_4ce53ac8883e47a6 / namespace_7de30195e3c90e86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25d
// Size: 0x9
function precache_cpmp()
{
    precache();
}

