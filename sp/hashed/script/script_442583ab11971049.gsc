#using script_676956d6d2c96670;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\anim\init;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_2b41877fba503170;

// Namespace namespace_2b41877fba503170 / namespace_4337a2c8d45e2bbb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21e
// Size: 0x188
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"hash_4d995a7477947381" );
    self.grenadeweapon = makeweapon( "frag" );
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = makeweapon( "jup_cp24_pi_glima21_sp" );
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "sniper";
    self.weapon = makeweapon( "iw9_sn_alpha50_notherm_sp" );
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

// Namespace namespace_2b41877fba503170 / namespace_4337a2c8d45e2bbb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ae
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

// Namespace namespace_2b41877fba503170 / namespace_4337a2c8d45e2bbb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40c
// Size: 0x41
function function_9ac26a51c94ccf52()
{
    assertex( isdefined( self.var_e2682e6f1838391e ), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code" );
    
    switch ( self.var_e2682e6f1838391e )
    {
        default:
            return namespace_748156c90ce875f8::main();
    }
}

// Namespace namespace_2b41877fba503170 / namespace_4337a2c8d45e2bbb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x455
// Size: 0xe
function spawner()
{
    self setspawnerteam( "axis" );
}

// Namespace namespace_2b41877fba503170 / namespace_4337a2c8d45e2bbb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46b
// Size: 0x41
function precache( classname )
{
    namespace_748156c90ce875f8::precache_sp();
    precacheitem( "iw9_sn_alpha50_notherm_sp" );
    precacheitem( "jup_cp24_pi_glima21_sp" );
    precacheitem( "frag" );
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

