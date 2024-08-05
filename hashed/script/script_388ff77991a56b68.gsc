#using scripts\common\utility.gsc;

#namespace namespace_26eb0a90d15b9b1a;

// Namespace namespace_26eb0a90d15b9b1a / namespace_35a6f974a23fdf3a
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc5
// Size: 0x9a
function private autoexec init() {
    character = #"hash_3e7c404dadd1653e";
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

// Namespace namespace_26eb0a90d15b9b1a / namespace_35a6f974a23fdf3a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x167
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"hash_928ba19f6f7fdeba";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_villain_nolan_urban");
    self attach("c_jup_head_hero_nolan_urban", "", 1);
    self.headmodel = "c_jup_head_hero_nolan_urban";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_26eb0a90d15b9b1a / namespace_35a6f974a23fdf3a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22a
// Size: 0x2
function precache() {
    
}

// Namespace namespace_26eb0a90d15b9b1a / namespace_35a6f974a23fdf3a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x234
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_villain_nolan_urban");
    precachemodel("c_jup_head_hero_nolan_urban");
}

// Namespace namespace_26eb0a90d15b9b1a / namespace_35a6f974a23fdf3a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25b
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

