// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_dd9f5176ac770c17;

// Namespace namespace_dd9f5176ac770c17/namespace_2cd996856f5e777
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xce
// Size: 0x9b
function private autoexec init() {
    character = #"hash_90de1cda107234f3";
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

// Namespace namespace_dd9f5176ac770c17/namespace_2cd996856f5e777
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x170
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "riotshield";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_shield_04");
    self attach("head_c_jup_sp_enemy_pmc_shield_04", "", 1);
    self.headmodel = "head_c_jup_sp_enemy_pmc_shield_04";
    self setclothtype(#"hash_c5ead6e06f06025d");
    self function_8abe5a968cc3c220(#"hash_1db29aba7a7a7ffd");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_dd9f5176ac770c17/namespace_2cd996856f5e777
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232
// Size: 0x3
function precache() {
    
}

// Namespace namespace_dd9f5176ac770c17/namespace_2cd996856f5e777
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c
// Size: 0x20
function function_430419022a9c3ffe() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_shield_04");
    precachemodel("head_c_jup_sp_enemy_pmc_shield_04");
}

// Namespace namespace_dd9f5176ac770c17/namespace_2cd996856f5e777
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x263
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}
