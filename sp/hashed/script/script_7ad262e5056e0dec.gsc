#using scripts\common\utility;

#namespace namespace_676958f2d031ef1e;

// Namespace namespace_676958f2d031ef1e / namespace_9dc8ee1894fa55be
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc7
// Size: 0x9a
function private autoexec init()
{
    character = #"hash_d63cd1f3d39f73a";
    
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

// Namespace namespace_676958f2d031ef1e / namespace_9dc8ee1894fa55be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x169
// Size: 0xbb
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"unitedstates";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel( "body_mp_milsim_navy_frogman_1_1" );
    self attach( "head_mp_milsim_navy_frogman_1_1", "", 1 );
    self.headmodel = "head_mp_milsim_navy_frogman_1_1";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_676958f2d031ef1e / namespace_9dc8ee1894fa55be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22c
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_676958f2d031ef1e / namespace_9dc8ee1894fa55be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x236
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_mp_milsim_navy_frogman_1_1" );
    precachemodel( "head_mp_milsim_navy_frogman_1_1" );
}

// Namespace namespace_676958f2d031ef1e / namespace_9dc8ee1894fa55be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25d
// Size: 0x9
function precache_cpmp()
{
    precache();
}

