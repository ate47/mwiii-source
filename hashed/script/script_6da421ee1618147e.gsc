// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_20dec50e38b8ff24;

// Namespace namespace_20dec50e38b8ff24/namespace_cc98cc7678ab844
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd6
// Size: 0x9b
function private autoexec init() {
    character = #"hash_3e1c700d90810bc8";
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

// Namespace namespace_20dec50e38b8ff24/namespace_cc98cc7678ab844
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_soldier_05_alt");
    self attach("head_c_jup_sp_enemy_pmc_soldier_05_alt1", "", 1);
    self.headmodel = "head_c_jup_sp_enemy_pmc_soldier_05_alt1";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_20dec50e38b8ff24/namespace_cc98cc7678ab844
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23a
// Size: 0x3
function precache() {
    
}

// Namespace namespace_20dec50e38b8ff24/namespace_cc98cc7678ab844
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244
// Size: 0x20
function function_430419022a9c3ffe() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_soldier_05_alt");
    precachemodel("head_c_jup_sp_enemy_pmc_soldier_05_alt1");
}

// Namespace namespace_20dec50e38b8ff24/namespace_cc98cc7678ab844
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26b
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

