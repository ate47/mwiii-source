#using character\c_jup_sp_enemy_pmc_cmdr_01;
#using character\c_jup_sp_enemy_pmc_cmdr_02;
#using character\c_jup_sp_enemy_pmc_grunt_01_winter;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\anim\init;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\code\ai;
#using scripts\common\ai;

#namespace namespace_62f58843f370d429;

// Namespace namespace_62f58843f370d429 / namespace_3298b8e1d9f2a39c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x238
// Size: 0x19b
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"hash_4c65b2d4e6ca3fc2" );
    self.grenadeweapon = makeweapon( "frag" );
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script( "" );
    self.sidearm = scripts\code\ai::create_weapon_in_script( "jup_cp24_pi_glima21_sp", "sidearm" );
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "shotgun";
    self.weapon = scripts\code\ai::create_weapon_in_script( [ "iw9_sh_mike1014_sp" ] );
    setup_model();
    scripts\anim\init::firstinit();
    self.a = spawnstruct();
    scripts\asm\asm::asm_init_blackboard();
    scripts\aitypes\bt_util::bt_init();
    assertex( isdefined( self.animationarchetype ) && self.animationarchetype != "", "Aitype " + self.classname + " does not have the animation archetype defined on the asset." );
    assertex( isdefined( self.asmasset ) && self.asmasset != "", "Aitype " + self.classname + " does not have the animation state machine defined on the asset." );
    self.defaultasm = self.asmasset;
    scripts\asm\asm_sp::asm_init( self.asmasset, self.animationarchetype );
    scripts\common\ai::ai_init();
}

// Namespace namespace_62f58843f370d429 / namespace_3298b8e1d9f2a39c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3db
// Size: 0x56
function setup_model()
{
    var_42e5c77b1d7fe6e7 = isdefined( self.var_42e5c77b1d7fe6e7 ) ? self.var_42e5c77b1d7fe6e7 : "default";
    
    switch ( var_42e5c77b1d7fe6e7 )
    {
        case #"hash_7038dec66d8275be":
        default:
            return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_62f58843f370d429 / namespace_3298b8e1d9f2a39c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x439
// Size: 0x6d
function function_9ac26a51c94ccf52()
{
    assertex( isdefined( self.var_e2682e6f1838391e ), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code" );
    
    switch ( self.var_e2682e6f1838391e )
    {
        case 0:
            return character\c_jup_sp_enemy_pmc_grunt_01_winter::main();
        case 1:
            return character\c_jup_sp_enemy_pmc_cmdr_01::main();
        case 2:
            return character\c_jup_sp_enemy_pmc_cmdr_02::main();
    }
}

// Namespace namespace_62f58843f370d429 / namespace_3298b8e1d9f2a39c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ae
// Size: 0xe
function spawner()
{
    self setspawnerteam( "axis" );
}

// Namespace namespace_62f58843f370d429 / namespace_3298b8e1d9f2a39c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c4
// Size: 0x4f
function precache( classname )
{
    character\c_jup_sp_enemy_pmc_grunt_01_winter::precache_sp();
    character\c_jup_sp_enemy_pmc_cmdr_01::precache_sp();
    character\c_jup_sp_enemy_pmc_cmdr_02::precache_sp();
    precacheitem( "iw9_sh_mike1014_sp" );
    precacheitem( "jup_cp24_pi_glima21_sp" );
    precacheitem( "frag" );
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

