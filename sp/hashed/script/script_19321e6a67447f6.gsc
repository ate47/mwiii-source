#using scripts\common\utility.gsc;

#namespace namespace_b4e2cf8d679fc964;

// Namespace namespace_b4e2cf8d679fc964 / namespace_e588bf567cc8dd84
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc7
// Size: 0x9a
function private autoexec init() {
    character = #"hash_f41d6c90cd320ae0";
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

// Namespace namespace_b4e2cf8d679fc964 / namespace_e588bf567cc8dd84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x169
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "riotshield";
    self.voice = #"russian";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_police_kastovia_02");
    self attach("head_c_jup_sc_m_allen", "", 1);
    self.headmodel = "head_c_jup_sc_m_allen";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_b4e2cf8d679fc964 / namespace_e588bf567cc8dd84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22c
// Size: 0x2
function precache() {
    
}

// Namespace namespace_b4e2cf8d679fc964 / namespace_e588bf567cc8dd84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x236
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_police_kastovia_02");
    precachemodel("head_c_jup_sc_m_allen");
}

// Namespace namespace_b4e2cf8d679fc964 / namespace_e588bf567cc8dd84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25d
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}
