#using scripts\common\utility.gsc;
#using script_1de8374eb03feabd;
#using scripts\code\character.gsc;
#using script_771983dc5e9abf75;

#namespace namespace_7ffe79862593b2;

// Namespace namespace_7ffe79862593b2 / namespace_ae4e23ce8493b012
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x10e
// Size: 0xb4
function private autoexec init() {
    character = #"hash_56870dc3d696c906";
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
        level.var_44bf7e31237b3073[%"hash_e605c40016e0cf9"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_7ffe79862593b2 / namespace_ae4e23ce8493b012
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ca
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self function_6b0082dec4510b24("c_jup_zmb_zombie_base_male_hoodie_body_yz", namespace_5dc40af818d1d531::main());
    scripts\code\character::attachhead("c_jup_zmb_zombie_base_male_hoodie_head", namespace_c5c1bca5e72b80a7::main());
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_7ffe79862593b2 / namespace_ae4e23ce8493b012
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x283
// Size: 0x2
function precache() {
    
}

// Namespace namespace_7ffe79862593b2 / namespace_ae4e23ce8493b012
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28d
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_5dc40af818d1d531::main());
    scripts\code\character::precachemodelarray(namespace_c5c1bca5e72b80a7::main());
}

// Namespace namespace_7ffe79862593b2 / namespace_ae4e23ce8493b012
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b8
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_7ffe79862593b2 / namespace_ae4e23ce8493b012
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c9
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_482a5f44cc0dff85":
        return namespace_5dc40af818d1d531::main();
    case #"hash_a813d896007c958b":
        return namespace_c5c1bca5e72b80a7::main();
    }
    assert(0, "<dev string:x1c>");
}
