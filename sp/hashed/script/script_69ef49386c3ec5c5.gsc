#using scripts\common\utility;

#namespace namespace_ef932e0cc825486f;

// Namespace namespace_ef932e0cc825486f / namespace_eec4707eff28794f
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc4
// Size: 0x9a
function private autoexec init() {
    character = #"hash_5fa0d721df24563";
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

// Namespace namespace_ef932e0cc825486f / namespace_eec4707eff28794f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x166
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_injured";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_civ_stpeterburg_male_5_1");
    self attach("head_sc_m_bruce", "", 1);
    self.headmodel = "head_sc_m_bruce";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_ef932e0cc825486f / namespace_eec4707eff28794f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x228
// Size: 0x2
function precache() {
    
}

// Namespace namespace_ef932e0cc825486f / namespace_eec4707eff28794f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x232
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_civ_stpeterburg_male_5_1");
    precachemodel("head_sc_m_bruce");
}

// Namespace namespace_ef932e0cc825486f / namespace_eec4707eff28794f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x259
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

