#using scripts\common\utility;

#namespace namespace_5a51621a8d5df346;

// Namespace namespace_5a51621a8d5df346 / namespace_ea38381a787e94a6
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc9
// Size: 0x9a
function private autoexec init()
{
    character = #"hash_d1cd85675b186662";
    
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

// Namespace namespace_5a51621a8d5df346 / namespace_ea38381a787e94a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16b
// Size: 0xbb
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"sas";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_enemy_pmc_grunt_02" );
    self attach( "head_c_jup_sp_enemy_pmc_grunt_02", "", 1 );
    self.headmodel = "head_c_jup_sp_enemy_pmc_grunt_02";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"milmedgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_5a51621a8d5df346 / namespace_ea38381a787e94a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22e
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_5a51621a8d5df346 / namespace_ea38381a787e94a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x238
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_enemy_pmc_grunt_02" );
    precachemodel( "head_c_jup_sp_enemy_pmc_grunt_02" );
}

// Namespace namespace_5a51621a8d5df346 / namespace_ea38381a787e94a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25f
// Size: 0x9
function precache_cpmp()
{
    precache();
}

