#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\bodies_civilian_asm_female_1;
#using xmodelalias\heads_civilian_asm_female_1;

#namespace namespace_a239acc4a3e34a6;

// Namespace namespace_a239acc4a3e34a6 / namespace_9d12fb931bb289c6
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x127
// Size: 0xb3
function private autoexec init()
{
    character = #"hash_c97b2373937bb9c2";
    
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
        level.var_44bf7e31237b3073[ %"hash_43e29eaf81e8206f" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_a239acc4a3e34a6 / namespace_9d12fb931bb289c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e2
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_loco";
    self.voice = #"unitednationsfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "bodies_civilian_asm_female_1", xmodelalias\bodies_civilian_asm_female_1::main() );
    scripts\code\character::attachhead( "heads_civilian_asm_female_1", xmodelalias\heads_civilian_asm_female_1::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_a239acc4a3e34a6 / namespace_9d12fb931bb289c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29b
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_a239acc4a3e34a6 / namespace_9d12fb931bb289c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a5
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\bodies_civilian_asm_female_1::main() );
    scripts\code\character::precachemodelarray( xmodelalias\heads_civilian_asm_female_1::main() );
}

// Namespace namespace_a239acc4a3e34a6 / namespace_9d12fb931bb289c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d0
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_a239acc4a3e34a6 / namespace_9d12fb931bb289c6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e1
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_331b1d4a38c318b8":
            return xmodelalias\bodies_civilian_asm_female_1::main();
        case #"hash_c28e27e15f6e919":
            return xmodelalias\heads_civilian_asm_female_1::main();
    }
    
    assert( 0, "character_civilian_ams_female_1_sitting do not have any xmodelalias" );
}

