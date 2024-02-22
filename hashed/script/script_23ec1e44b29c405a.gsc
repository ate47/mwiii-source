// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using script_3d1a9c6507312327;
#using scripts\code\character.gsc;
#using script_390d2972d74616f1;

#namespace namespace_f214ddb248cddd98;

// Namespace namespace_f214ddb248cddd98/namespace_e27e9255e64c7fb8
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x13a
// Size: 0xb4
function private autoexec init() {
    character = #"hash_65cb7a17a97fd31c";
    if (!isdefined(level.var_586887bc5dc30f34)) {
        level.var_586887bc5dc30f34 = [];
    }
    if (!isdefined(level.var_7d97144daa7995cd)) {
        level.var_7d97144daa7995cd = [];
    }
    if (!isdefined(level.var_44bf7e31237b3073)) {
        level.var_44bf7e31237b3073 = [];
    }
    level.var_586887bc5dc30f34[character] = &main;
    if (issp()) {
        level.var_7d97144daa7995cd[character] = &function_430419022a9c3ffe;
        level.var_44bf7e31237b3073[%"hash_4bec6e52eed85af3"] = &function_ecf17a96e49ab67;
    } else {
        level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
    }
}

// Namespace namespace_f214ddb248cddd98/namespace_e27e9255e64c7fb8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f5
// Size: 0xb2
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self function_6b0082dec4510b24("c_jup_zmb_zombie_base_male_track_jacket_body_yz", namespace_509d3fc9a7725177::main());
    namespace_ac7e8770abb7eb1::attachhead("c_jup_zmb_zombie_base_track_jacket_head_yz", namespace_72b179595e0d9773::main());
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_f214ddb248cddd98/namespace_e27e9255e64c7fb8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ae
// Size: 0x3
function precache() {
    
}

// Namespace namespace_f214ddb248cddd98/namespace_e27e9255e64c7fb8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b8
// Size: 0x24
function function_430419022a9c3ffe() {
    precache();
    namespace_ac7e8770abb7eb1::precachemodelarray(namespace_509d3fc9a7725177::main());
    namespace_ac7e8770abb7eb1::precachemodelarray(namespace_72b179595e0d9773::main());
}

// Namespace namespace_f214ddb248cddd98/namespace_e27e9255e64c7fb8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e3
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_f214ddb248cddd98/namespace_e27e9255e64c7fb8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f4
// Size: 0x4a
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_42087e218eeb04db":
        return namespace_509d3fc9a7725177::main();
    case #"hash_d0cfad0b4b2bfbdf":
        return namespace_72b179595e0d9773::main();
        break;
    }
    /#
        assert(0, "character_jup_zombie_base_male_track_jacket_yz do not have any xmodelalias");
    #/
}

