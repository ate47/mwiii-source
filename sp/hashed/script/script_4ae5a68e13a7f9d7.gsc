#using scripts\common\utility;

#namespace namespace_7519007d7f208157;

// Namespace namespace_7519007d7f208157 / namespace_e3c8c06cff733db7
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xbe
// Size: 0x9a
function private autoexec init() {
    character = #"hash_bd5c1aa0288f6bb";
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

// Namespace namespace_7519007d7f208157 / namespace_e3c8c06cff733db7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x160
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian";
    self.voice = #"fsafemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_civ_plane_child");
    self attach("head_c_jup_civ_plane_child", "", 1);
    self.headmodel = "head_c_jup_civ_plane_child";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_7519007d7f208157 / namespace_e3c8c06cff733db7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x222
// Size: 0x2
function precache() {
    
}

// Namespace namespace_7519007d7f208157 / namespace_e3c8c06cff733db7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22c
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_civ_plane_child");
    precachemodel("head_c_jup_civ_plane_child");
}

// Namespace namespace_7519007d7f208157 / namespace_e3c8c06cff733db7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x253
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

