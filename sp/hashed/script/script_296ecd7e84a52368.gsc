#using scripts\common\utility.gsc;

#namespace namespace_9ef8eabe75a79e30;

// Namespace namespace_9ef8eabe75a79e30 / namespace_71acf078f477f010
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xcd
// Size: 0x9a
function private autoexec init() {
    character = #"hash_28c65a4d055d3eb4";
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

// Namespace namespace_9ef8eabe75a79e30 / namespace_71acf078f477f010
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_spforce_02");
    self attach("head_c_jup_sp_enemy_pmc_spforce_02", "", 1);
    self.headmodel = "head_c_jup_sp_enemy_pmc_spforce_02";
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_9ef8eabe75a79e30 / namespace_71acf078f477f010
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x231
// Size: 0x2
function precache() {
    
}

// Namespace namespace_9ef8eabe75a79e30 / namespace_71acf078f477f010
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23b
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_spforce_02");
    precachemodel("head_c_jup_sp_enemy_pmc_spforce_02");
}

// Namespace namespace_9ef8eabe75a79e30 / namespace_71acf078f477f010
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x262
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}
