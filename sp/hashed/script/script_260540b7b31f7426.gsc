#using character\c_jup_sp_enemy_pmc_hooded_neighbor;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\anim\init;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_82d5556d33ba14a7;

// Namespace namespace_82d5556d33ba14a7 / namespace_9c713664b674cd1c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x183
// Size: 0x17d
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"hash_2a4b8691bc8fb6b2" );
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    self.secondaryweapon = nullweapon();
    self.sidearm = nullweapon();
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon( "jup_cp24_pi_glima21_sp_3d" );
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

// Namespace namespace_82d5556d33ba14a7 / namespace_9c713664b674cd1c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x308
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

// Namespace namespace_82d5556d33ba14a7 / namespace_9c713664b674cd1c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x366
// Size: 0x8
function function_9ac26a51c94ccf52()
{
    return character\c_jup_sp_enemy_pmc_hooded_neighbor::main();
}

// Namespace namespace_82d5556d33ba14a7 / namespace_9c713664b674cd1c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x377
// Size: 0xe
function spawner()
{
    self setspawnerteam( "axis" );
}

// Namespace namespace_82d5556d33ba14a7 / namespace_9c713664b674cd1c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38d
// Size: 0x2b
function precache( classname )
{
    character\c_jup_sp_enemy_pmc_hooded_neighbor::precache_sp();
    precacheitem( "jup_cp24_pi_glima21_sp_3d" );
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

