// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using script_4aae0a9e6e7e02d8;
#using scripts\code\character.gsc;
#using script_3c2fe6ffbb9a3e52;

#namespace namespace_67e292a194f8d3fd;

// Namespace namespace_67e292a194f8d3fd/namespace_2f8e97c93a9e191d
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x134
// Size: 0xb4
function private autoexec init() {
    character = #"hash_ac69046634566f21";
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
        level.var_44bf7e31237b3073[%"hash_5ac6c58ea19acf36"] = &function_ecf17a96e49ab67;
    } else {
        level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
    }
}

// Namespace namespace_67e292a194f8d3fd/namespace_2f8e97c93a9e191d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef
// Size: 0xb2
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"hash_97b066d92d35c738";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self function_6b0082dec4510b24("c_jup_zmb_zombie_base_male_long_shirt_body_yz", namespace_3647807ab2e9d06c::main());
    namespace_ac7e8770abb7eb1::attachhead("c_jup_zmb_zombie_base_long_shirt_head_yz", namespace_779dcd7346828a34::main());
    self setclothtype(#"hash_d0ef9b6cfe3097be");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_67e292a194f8d3fd/namespace_2f8e97c93a9e191d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a8
// Size: 0x3
function precache() {
    
}

// Namespace namespace_67e292a194f8d3fd/namespace_2f8e97c93a9e191d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b2
// Size: 0x24
function function_430419022a9c3ffe() {
    precache();
    namespace_ac7e8770abb7eb1::precachemodelarray(namespace_3647807ab2e9d06c::main());
    namespace_ac7e8770abb7eb1::precachemodelarray(namespace_779dcd7346828a34::main());
}

// Namespace namespace_67e292a194f8d3fd/namespace_2f8e97c93a9e191d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_67e292a194f8d3fd/namespace_2f8e97c93a9e191d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee
// Size: 0x4a
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_485891bb076e14f0":
        return namespace_3647807ab2e9d06c::main();
    case #"hash_b9da372d17774d90":
        return namespace_779dcd7346828a34::main();
        break;
    }
    /#
        assert(0, "character_jup_zombie_base_male_long_shirt_yz do not have any xmodelalias");
    #/
}
