#using script_196a1a67f48a5ade;
#using script_68de830f27d8e81d;
#using scripts\code\character;
#using scripts\common\utility;

#namespace namespace_81ce9a00408c19e9;

// Namespace namespace_81ce9a00408c19e9 / namespace_e0af639dc8acb8c9
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x119
// Size: 0xb3
function private autoexec init() {
    character = #"hash_939870e4cc53173d";
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
        level.var_44bf7e31237b3073[%"hash_204547f4a534590"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_81ce9a00408c19e9 / namespace_e0af639dc8acb8c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d4
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_loco";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("bodies_civilian_asm_male_2", namespace_ddb380a84491ba8c::main());
    scripts\code\character::attachhead("heads_civilian_asm_male_2", namespace_538e8185a32c1609::main());
    self setclothtype(#"cloth");
    self function_8abe5a968cc3c220(#"hash_6d85dda0ec52ec91");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_81ce9a00408c19e9 / namespace_e0af639dc8acb8c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28d
// Size: 0x2
function precache() {
    
}

// Namespace namespace_81ce9a00408c19e9 / namespace_e0af639dc8acb8c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x297
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_ddb380a84491ba8c::main());
    scripts\code\character::precachemodelarray(namespace_538e8185a32c1609::main());
}

// Namespace namespace_81ce9a00408c19e9 / namespace_e0af639dc8acb8c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c2
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_81ce9a00408c19e9 / namespace_e0af639dc8acb8c9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d3
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_7255fd41517a7110":
        return namespace_ddb380a84491ba8c::main();
    case #"hash_8262988ebe19d35d":
        return namespace_538e8185a32c1609::main();
    }
    assert(0, "character_civilian_ams_male_2 do not have any xmodelalias");
}

