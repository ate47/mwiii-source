// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_975e473cb4c64b03;

// Namespace namespace_975e473cb4c64b03 / namespace_7d3b12eaf52e5063
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc9
// Size: 0x9b
function private autoexec init() {
    character = #"hash_66541c37523e69ef";
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
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_975e473cb4c64b03 / namespace_7d3b12eaf52e5063
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_grunt_05");
    self attach("head_c_jup_sp_enemy_pmc_grunt_05", "", 1);
    self.headmodel = "head_c_jup_sp_enemy_pmc_grunt_05";
    self setclothtype(#"nylon");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_975e473cb4c64b03 / namespace_7d3b12eaf52e5063
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d
// Size: 0x3
function precache() {
    
}

// Namespace namespace_975e473cb4c64b03 / namespace_7d3b12eaf52e5063
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x237
// Size: 0x20
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_grunt_05");
    precachemodel("head_c_jup_sp_enemy_pmc_grunt_05");
}

// Namespace namespace_975e473cb4c64b03 / namespace_7d3b12eaf52e5063
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25e
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

