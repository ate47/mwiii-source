#using scripts\common\utility;

#namespace namespace_36548f57eb49a487;

// Namespace namespace_36548f57eb49a487 / namespace_e47e09e6045629a7
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc2
// Size: 0x9a
function private autoexec init() {
    character = #"hash_fc474246a9cedc3";
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

// Namespace namespace_36548f57eb49a487 / namespace_e47e09e6045629a7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x164
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_civ_worker_04");
    self attach("head_c_jup_sc_m_alameer", "", 1);
    self.headmodel = "head_c_jup_sc_m_alameer";
    self setclothtype(#"nylon");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_36548f57eb49a487 / namespace_e47e09e6045629a7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x226
// Size: 0x2
function precache() {
    
}

// Namespace namespace_36548f57eb49a487 / namespace_e47e09e6045629a7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x230
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_civ_worker_04");
    precachemodel("head_c_jup_sc_m_alameer");
}

// Namespace namespace_36548f57eb49a487 / namespace_e47e09e6045629a7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x257
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

