#using scripts\common\utility.gsc;
#using script_220e895007013c9b;
#using scripts\code\character.gsc;
#using script_4dd1006a98ef214;

#namespace namespace_81ce9700408c1350;

// Namespace namespace_81ce9700408c1350 / namespace_e0af609dc8acb230
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x119
// Size: 0xb3
function private autoexec init() {
    character = #"hash_93986de4cc531224";
    if (!isdefined(level.fncharacter)) {
        level.fncharacter = [];
    }
    if (!isdefined(level.var_7d97144daa7995cd)) {
        level.var_7d97144daa7995cd = [];
    }
    if (!isdefined(level.var_44bf7e31237b3073)) {
        level.var_44bf7e31237b3073 = [];
    }
    level.fncharacter[character] = &main;
    if (issp()) {
        level.var_7d97144daa7995cd[character] = &precache_sp;
        level.var_44bf7e31237b3073[%"hash_204577f4a534aa9"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_81ce9700408c1350 / namespace_e0af609dc8acb230
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d4
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_loco";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("bodies_civilian_asm_male_1", namespace_ddb383a84491c125::main());
    scripts\code\character::attachhead("heads_civilian_asm_male_1", namespace_538e7e85a32c0f70::main());
    self setclothtype(#"cloth");
    self function_8abe5a968cc3c220(#"hash_6d85dda0ec52ec91");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_81ce9700408c1350 / namespace_e0af609dc8acb230
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28d
// Size: 0x2
function precache() {
    
}

// Namespace namespace_81ce9700408c1350 / namespace_e0af609dc8acb230
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x297
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_ddb383a84491c125::main());
    scripts\code\character::precachemodelarray(namespace_538e7e85a32c0f70::main());
}

// Namespace namespace_81ce9700408c1350 / namespace_e0af609dc8acb230
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c2
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_81ce9700408c1350 / namespace_e0af609dc8acb230
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d3
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_72560041517a75c9": 
        return namespace_ddb383a84491c125::main();
    case #"hash_8262958ebe19cea4": 
        return namespace_538e7e85a32c0f70::main();
    }
    assert(0, "character_civilian_ams_male_1 do not have any xmodelalias");
}

