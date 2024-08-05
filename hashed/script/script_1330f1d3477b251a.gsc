#using scripts\common\utility.gsc;

#namespace namespace_78dda5a74e946ece;

// Namespace namespace_78dda5a74e946ece / namespace_c14142e72817f8ee
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc3
// Size: 0x9a
function private autoexec init() {
    character = #"hash_5f79ee77a0b3212a";
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

// Namespace namespace_78dda5a74e946ece / namespace_c14142e72817f8ee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x165
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_villain_ivan_urban");
    self attach("c_jup_head_hero_ivan_urban", "", 1);
    self.headmodel = "c_jup_head_hero_ivan_urban";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_78dda5a74e946ece / namespace_c14142e72817f8ee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x227
// Size: 0x2
function precache() {
    
}

// Namespace namespace_78dda5a74e946ece / namespace_c14142e72817f8ee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x231
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_villain_ivan_urban");
    precachemodel("c_jup_head_hero_ivan_urban");
}

// Namespace namespace_78dda5a74e946ece / namespace_c14142e72817f8ee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x258
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}
