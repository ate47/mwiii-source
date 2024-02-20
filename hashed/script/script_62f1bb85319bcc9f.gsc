// mwiii decomp prototype
#using script_6c32b2aeb4eff172;
#using scripts\code\character.gsc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_56f4cd8ce811283;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace jup_ob_enemy_specialist_captain;

// Namespace jup_ob_enemy_specialist_captain/namespace_2bf620b70e54efb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x291
// Size: 0x213
function main() {
    self.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"jup_ob_enemy_specialist_captain");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_630e176a672235b5");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_jup_ob";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_aggressive";
    self.asmasset = "soldier";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_soldier_base_ob");
    switch (namespace_ac7e8770abb7eb1::get_random_weapon(2)) {
    case 0:
        var_fea750d6814b803d = "jup_cp08_br_xmike5, [ jup_hybridtherm01, jup_comp_br_04, jup_ammo_277f_ap ], none, none";
        self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
        break;
    case 1:
        var_fea750d6814b803d = "iw9_br_ngsierra, [ hybrid05, comp_br_05, ammo_277f_ap ], none, none";
        self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
        break;
    }
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    var_a68442ebadb66eb1 = "thermobaric_grenade_jup";
    self.grenadeweapon = level.var_67b54180a55f70e1[var_a68442ebadb66eb1];
    self.grenadeammo = 5;
    setup_model();
    /#
        assert(isscriptedagent(self));
    #/
    /#
        assert(isdefined(self.behaviortreeasset));
    #/
    /#
        assert(isdefined(self.asmasset));
    #/
    self.var_a942dd31d55102c9 = self.asmasset;
    self.a = spawnstruct();
    namespace_bf5a1761a8d1bb07::asm_init_blackboard();
    namespace_f08e04b63067d27f::bt_init();
    namespace_28d7bb9fcf17949d::asm_init(self.asmasset, self.animationarchetype);
    namespace_6205bc7c5e394598::ai_init();
}

// Namespace jup_ob_enemy_specialist_captain/namespace_2bf620b70e54efb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ab
// Size: 0x57
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        function_9ac26a51c94ccf52();
        break;
    }
}

// Namespace jup_ob_enemy_specialist_captain/namespace_2bf620b70e54efb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x509
// Size: 0x9
function function_9ac26a51c94ccf52() {
    return namespace_210c1f455fa262c5::main();
}

// Namespace jup_ob_enemy_specialist_captain/namespace_2bf620b70e54efb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51a
// Size: 0xcf
function precache() {
    agent_type = "actor_jup_ob_enemy_specialist_captain";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_630e176a672235b5");
        namespace_210c1f455fa262c5::function_8168fbf6282d398b();
    }
    namespace_e8f3f30f2d3e4a89::agent_init();
    namespace_f08e04b63067d27f::init();
    namespace_8bef0f00d6d36a69::soldier();
    thread function_e8cf870298e36bdc();
}

// Namespace jup_ob_enemy_specialist_captain/namespace_2bf620b70e54efb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f0
// Size: 0x118
function function_e8cf870298e36bdc() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_5576d3be590a9a64 = "jup_cp08_br_xmike5, [ jup_hybridtherm01, jup_comp_br_04, jup_ammo_277f_ap ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d3be590a9a64])) {
        level.var_67b54180a55f70e1[var_5576d3be590a9a64] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("jup_cp08_br_xmike5", [0:"jup_hybridtherm01", 1:"jup_comp_br_04", 2:"jup_ammo_277f_ap"], "none", "none");
    }
    var_5576d6be590aa0fd = "iw9_br_ngsierra, [ hybrid05, comp_br_05, ammo_277f_ap ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d6be590aa0fd])) {
        level.var_67b54180a55f70e1[var_5576d6be590aa0fd] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("iw9_br_ngsierra", [0:"hybrid05", 1:"comp_br_05", 2:"ammo_277f_ap"], "none", "none");
    }
    var_a68442ebadb66eb1 = "thermobaric_grenade_jup";
    if (!isdefined(level.var_67b54180a55f70e1[var_a68442ebadb66eb1])) {
        level.var_67b54180a55f70e1[var_a68442ebadb66eb1] = makeweapon("thermobaric_grenade_jup");
    }
}

