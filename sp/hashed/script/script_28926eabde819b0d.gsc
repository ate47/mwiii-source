#using script_24e4405cf93f20ed;
#using script_4bac13d511590220;
#using scripts\cp\weapon;
#using scripts\engine\utility;

#namespace namespace_ee9f9173a98408f0;

// Namespace namespace_ee9f9173a98408f0 / namespace_608c9b2049619563
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88
// Size: 0x26
function function_3dd20ff8b99819a()
{
    self.var_9acfc0bd86b2e2c1 = &fn_damagefeedback;
    self.fn_death = &function_6a0b2a08499a9842;
    scripts\cp\weapon::add_to_special_lockon_target_list( self );
}

