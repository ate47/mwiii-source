// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_f25cefd62c156156;

// Namespace namespace_f25cefd62c156156 / namespace_474abc8d4fd3a876
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd1
// Size: 0x9b
function private autoexec init() {
    character = #"hash_9d45117d840e8572";
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

// Namespace namespace_f25cefd62c156156 / namespace_474abc8d4fd3a876
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
    self attach("head_c_jup_sp_enemy_pmc_grunt_05_tan_02", "", 1);
    self.headmodel = "head_c_jup_sp_enemy_pmc_grunt_05_tan_02";
    self setclothtype(#"nylon");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_f25cefd62c156156 / namespace_474abc8d4fd3a876
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x235
// Size: 0x3
function precache() {
    
}

// Namespace namespace_f25cefd62c156156 / namespace_474abc8d4fd3a876
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f
// Size: 0x20
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_grunt_tan");
    precachemodel("head_c_jup_sp_enemy_pmc_grunt_05_tan_02");
}

// Namespace namespace_f25cefd62c156156 / namespace_474abc8d4fd3a876
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x266
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

