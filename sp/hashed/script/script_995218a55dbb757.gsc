#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\civilian_london_female_heads_nohair;
#using xmodelalias\test_alias_civ_london_female_3_body;

#namespace namespace_da52cb1eb04dd4ad;

// Namespace namespace_da52cb1eb04dd4ad / namespace_9ad8309fcc42344d
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x12b
// Size: 0xb3
function private autoexec init()
{
    character = #"hash_ac5419feffc26081";
    
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
        level.var_44bf7e31237b3073[ %"hash_3555c2e6a8b57416" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_da52cb1eb04dd4ad / namespace_9ad8309fcc42344d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e6
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_female";
    self.voice = #"unitednationsfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "test_alias_civ_london_female_3_body", xmodelalias\test_alias_civ_london_female_3_body::main() );
    scripts\code\character::attachhead( "civilian_london_female_heads_nohair", xmodelalias\civilian_london_female_heads_nohair::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_da52cb1eb04dd4ad / namespace_9ad8309fcc42344d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29f
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_da52cb1eb04dd4ad / namespace_9ad8309fcc42344d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a9
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\test_alias_civ_london_female_3_body::main() );
    scripts\code\character::precachemodelarray( xmodelalias\civilian_london_female_heads_nohair::main() );
}

// Namespace namespace_da52cb1eb04dd4ad / namespace_9ad8309fcc42344d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d4
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_da52cb1eb04dd4ad / namespace_9ad8309fcc42344d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e5
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_b5da97720b51be66":
            return xmodelalias\test_alias_civ_london_female_3_body::main();
        case #"hash_4d42ed79d1742b42":
            return xmodelalias\civilian_london_female_heads_nohair::main();
    }
    
    assert( 0, "c_jup_civ_london_female_03 do not have any xmodelalias" );
}

