#using scripts\common\utility.gsc;

#namespace namespace_d1f823093a164c84;

// Namespace namespace_d1f823093a164c84 / namespace_805893675e28fae4
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc8
// Size: 0x9a
function private autoexec init() {
    character = #"hash_c23343add7213b78";
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

// Namespace namespace_d1f823093a164c84 / namespace_805893675e28fae4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16a
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_civ_prisoner_05_a");
    self attach("head_c_jup_sc_m_arakelyan", "", 1);
    self.headmodel = "head_c_jup_sc_m_arakelyan";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_d1f823093a164c84 / namespace_805893675e28fae4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22c
// Size: 0x2
function precache() {
    
}

// Namespace namespace_d1f823093a164c84 / namespace_805893675e28fae4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x236
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_civ_prisoner_05_a");
    precachemodel("head_c_jup_sc_m_arakelyan");
}

// Namespace namespace_d1f823093a164c84 / namespace_805893675e28fae4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25d
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}
