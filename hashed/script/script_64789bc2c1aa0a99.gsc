#using scripts\common\utility.gsc;
#using script_69d108ea2642f37f;
#using scripts\code\character.gsc;
#using script_1945a8d1ca99972;

#namespace namespace_decb60e0cf6eb5f7;

// Namespace namespace_decb60e0cf6eb5f7 / namespace_5916ae1466888997
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x126
// Size: 0xb3
function private autoexec init() {
    character = #"hash_8f0ffb361f632a2b";
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
        level.var_44bf7e31237b3073[%"hash_1a9da5c20be48f70"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_decb60e0cf6eb5f7 / namespace_5916ae1466888997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e1
// Size: 0xb2
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"shadowcompany";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("bodies_jup_sp_enemy_pmc_surge_plain", namespace_24fc1755216077cb::main());
    scripts\code\character::attachhead("heads_jup_sp_enemy_pmc_surge_plain", namespace_c869eec25a8977a0::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"milmedgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_decb60e0cf6eb5f7 / namespace_5916ae1466888997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29b
// Size: 0x2
function precache() {
    
}

// Namespace namespace_decb60e0cf6eb5f7 / namespace_5916ae1466888997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a5
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_24fc1755216077cb::main());
    scripts\code\character::precachemodelarray(namespace_c869eec25a8977a0::main());
}

// Namespace namespace_decb60e0cf6eb5f7 / namespace_5916ae1466888997
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d0
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_decb60e0cf6eb5f7 / namespace_5916ae1466888997
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e1
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_1a0a88b103364d47": 
        return namespace_24fc1755216077cb::main();
    case #"hash_647c13a7bb70982c": 
        return namespace_c869eec25a8977a0::main();
    }
    assert(0, "c_jup_sp_enemy_pmc_grunt_surge_plain do not have any xmodelalias");
}

