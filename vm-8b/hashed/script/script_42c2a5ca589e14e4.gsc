#using scripts\common\utility.gsc;

#namespace namespace_41a36392d8027c3a;

// Namespace namespace_41a36392d8027c3a / namespace_9c005341e2d2d05a
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xfb
// Size: 0x9b
function private autoexec init() {
    character = #"hash_638fce85fa8b5356";
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

// Namespace namespace_41a36392d8027c3a / namespace_9c005341e2d2d05a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19e
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_grunt_05");
    self attach("head_c_jup_sp_enemy_pmc_grunt_05_02", "", 1);
    self.headmodel = "head_c_jup_sp_enemy_pmc_grunt_05_02";
    self setclothtype(#"nylon");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_41a36392d8027c3a / namespace_9c005341e2d2d05a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x260
// Size: 0x2
function precache() {
    
}

// Namespace namespace_41a36392d8027c3a / namespace_9c005341e2d2d05a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26a
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_grunt_05");
    precachemodel("head_c_jup_sp_enemy_pmc_grunt_05_02");
}

// Namespace namespace_41a36392d8027c3a / namespace_9c005341e2d2d05a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x291
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

