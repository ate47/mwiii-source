#using scripts\common\utility;

#namespace namespace_93c9c3038be4c03b;

// Namespace namespace_93c9c3038be4c03b / namespace_a3c5b42dfa33719b
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xe2
// Size: 0x9b
function private autoexec init() {
    character = #"hash_edbe337a805a3fd7";
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

// Namespace namespace_93c9c3038be4c03b / namespace_a3c5b42dfa33719b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x185
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"shadowcompany";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_sp_ally_mex_sf_c");
    self attach("head_sp_ally_mex_sf_c", "", 1);
    self.headmodel = "head_sp_ally_mex_sf_c";
    self setclothtype(#"nylon");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_93c9c3038be4c03b / namespace_a3c5b42dfa33719b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x248
// Size: 0x2
function precache() {
    
}

// Namespace namespace_93c9c3038be4c03b / namespace_a3c5b42dfa33719b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x252
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_sp_ally_mex_sf_c");
    precachemodel("head_sp_ally_mex_sf_c");
}

// Namespace namespace_93c9c3038be4c03b / namespace_a3c5b42dfa33719b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x279
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

