#using scripts\common\utility.gsc;

#namespace namespace_7722657da912c849;

// Namespace namespace_7722657da912c849 / namespace_205dd2aec8aa3129
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc2
// Size: 0x9a
function private autoexec init() {
    character = #"hash_f6f07b812a957d75";
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

// Namespace namespace_7722657da912c849 / namespace_205dd2aec8aa3129
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x164
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"hash_dc89a318feb71e8d";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("c_jup_body_civ_western_boy_1_1");
    self attach("head_sc_m_love_child", "", 1);
    self.headmodel = "head_sc_m_love_child";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_7722657da912c849 / namespace_205dd2aec8aa3129
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x226
// Size: 0x2
function precache() {
    
}

// Namespace namespace_7722657da912c849 / namespace_205dd2aec8aa3129
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x230
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("c_jup_body_civ_western_boy_1_1");
    precachemodel("head_sc_m_love_child");
}

// Namespace namespace_7722657da912c849 / namespace_205dd2aec8aa3129
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x257
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}
