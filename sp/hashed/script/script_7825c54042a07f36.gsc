#using scripts\common\utility.gsc;

#namespace namespace_86159b11d2b07bec;

// Namespace namespace_86159b11d2b07bec / namespace_9e5d2215f3ae56cc
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xce
// Size: 0x9a
function private autoexec init() {
    character = #"hash_8c3497a9a54c988";
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

// Namespace namespace_86159b11d2b07bec / namespace_9e5d2215f3ae56cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x170
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "riotshield";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_shield_03");
    self attach("head_c_jup_sp_enemy_pmc_shield_03", "", 1);
    self.headmodel = "head_c_jup_sp_enemy_pmc_shield_03";
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_86159b11d2b07bec / namespace_9e5d2215f3ae56cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x232
// Size: 0x2
function precache() {
    
}

// Namespace namespace_86159b11d2b07bec / namespace_9e5d2215f3ae56cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23c
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_shield_03");
    precachemodel("head_c_jup_sp_enemy_pmc_shield_03");
}

// Namespace namespace_86159b11d2b07bec / namespace_9e5d2215f3ae56cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x263
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}
