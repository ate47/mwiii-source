// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_e7a51214e0453bdc;

// Namespace namespace_e7a51214e0453bdc/namespace_96ad37eb9957a97c
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd2
// Size: 0x9b
function private autoexec init() {
    character = #"hash_5c35d8c55f7db530";
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
    } else {
        level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
    }
}

// Namespace namespace_e7a51214e0453bdc/namespace_96ad37eb9957a97c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"hash_97b066d92d35c738";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_female_dress_tan");
    self attach("c_jup_zmb_zombie_base_female_dress_head_02_yz", "", 1);
    self.headmodel = "c_jup_zmb_zombie_base_female_dress_head_02_yz";
    self setclothtype(#"hash_d0ef9b6cfe3097be");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_e7a51214e0453bdc/namespace_96ad37eb9957a97c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x236
// Size: 0x3
function precache() {
    
}

// Namespace namespace_e7a51214e0453bdc/namespace_96ad37eb9957a97c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x240
// Size: 0x20
function function_430419022a9c3ffe() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_female_dress_tan");
    precachemodel("c_jup_zmb_zombie_base_female_dress_head_02_yz");
}

// Namespace namespace_e7a51214e0453bdc/namespace_96ad37eb9957a97c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x267
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

