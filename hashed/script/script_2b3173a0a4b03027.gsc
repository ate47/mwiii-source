// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_f25ceed62c155f23;

// Namespace namespace_f25ceed62c155f23/namespace_474abb8d4fd3a643
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd1
// Size: 0x9b
function private autoexec init() {
    character = #"hash_9d45107d840e83bf";
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

// Namespace namespace_f25ceed62c155f23/namespace_474abb8d4fd3a643
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x173
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_grunt_tan");
    self attach("head_c_jup_sp_enemy_pmc_grunt_05_tan_01", "", 1);
    self.headmodel = "head_c_jup_sp_enemy_pmc_grunt_05_tan_01";
    self setclothtype(#"hash_46f0f4be27456e65");
    self function_8abe5a968cc3c220(#"hash_1db29aba7a7a7ffd");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_f25ceed62c155f23/namespace_474abb8d4fd3a643
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x235
// Size: 0x3
function precache() {
    
}

// Namespace namespace_f25ceed62c155f23/namespace_474abb8d4fd3a643
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f
// Size: 0x20
function function_430419022a9c3ffe() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_grunt_tan");
    precachemodel("head_c_jup_sp_enemy_pmc_grunt_05_tan_01");
}

// Namespace namespace_f25ceed62c155f23/namespace_474abb8d4fd3a643
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x266
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}
