#using character\c_jup_sp_enemy_pmc_support_01;
#using character\c_jup_sp_enemy_pmc_support_02;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\anim\init;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\code\ai;
#using scripts\common\ai;

#namespace namespace_a9c0de75cd4fdf1a;

// Namespace namespace_a9c0de75cd4fdf1a / namespace_7b7330c767576f69
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23f
// Size: 0x1a4
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"hash_5b018920e6bae613" );
    self.grenadeweapon = makeweapon( "frag" );
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script( "" );
    self.sidearm = scripts\code\ai::create_weapon_in_script( "jup_cp24_pi_glima21_sp", "sidearm" );
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "lmg";
    self.weapon = scripts\code\ai::create_weapon_in_script( [ "iw9_lm_rkilo_sp", "jup_jp06_lm_pkilop_sp" ] );
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

// Namespace namespace_a9c0de75cd4fdf1a / namespace_7b7330c767576f69
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3eb
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

// Namespace namespace_a9c0de75cd4fdf1a / namespace_7b7330c767576f69
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x449
// Size: 0x57
function function_9ac26a51c94ccf52()
{
    assertex( isdefined( self.var_e2682e6f1838391e ), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code" );
    
    switch ( self.var_e2682e6f1838391e )
    {
        case 0:
            return character\c_jup_sp_enemy_pmc_support_01::main();
        case 1:
            return character\c_jup_sp_enemy_pmc_support_02::main();
    }
}

// Namespace namespace_a9c0de75cd4fdf1a / namespace_7b7330c767576f69
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a8
// Size: 0xe
function spawner()
{
    self setspawnerteam( "axis" );
}

// Namespace namespace_a9c0de75cd4fdf1a / namespace_7b7330c767576f69
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4be
// Size: 0x53
function precache( classname )
{
    character\c_jup_sp_enemy_pmc_support_01::precache_sp();
    character\c_jup_sp_enemy_pmc_support_02::precache_sp();
    precacheitem( "iw9_lm_rkilo_sp" );
    precacheitem( "jup_jp06_lm_pkilop_sp" );
    precacheitem( "jup_cp24_pi_glima21_sp" );
    precacheitem( "frag" );
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

