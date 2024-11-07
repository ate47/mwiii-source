#using scripts\common\utility.gsc;

#namespace namespace_452d3c5558dad492;

// Namespace namespace_452d3c5558dad492 / namespace_5dfef4474087d832
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc4
// Size: 0x9a
function private autoexec init() {
    character = #"hash_d30c0a2f57d38a1e";
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

// Namespace namespace_452d3c5558dad492 / namespace_5dfef4474087d832
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x166
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"sas";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_hero_ghost_tundra");
    self attach("c_jup_head_hero_ghost_tundra", "", 1);
    self.headmodel = "c_jup_head_hero_ghost_tundra";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_452d3c5558dad492 / namespace_5dfef4474087d832
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x229
// Size: 0x2
function precache() {
    
}

// Namespace namespace_452d3c5558dad492 / namespace_5dfef4474087d832
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x233
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_hero_ghost_tundra");
    precachemodel("c_jup_head_hero_ghost_tundra");
}

// Namespace namespace_452d3c5558dad492 / namespace_5dfef4474087d832
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25a
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}
