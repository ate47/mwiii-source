#using scripts\common\utility;

#namespace namespace_ca2bf1867c24316c;

// Namespace namespace_ca2bf1867c24316c / namespace_5feb7a9a13647a8c
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc3
// Size: 0x9a
function private autoexec init() {
    character = #"hash_779a1107d7fc2450";
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

// Namespace namespace_ca2bf1867c24316c / namespace_5feb7a9a13647a8c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x165
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "farah";
    self.voice = #"unitedstatesfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_hero_laswell_bdu");
    self attach("head_c_jup_sp_hero_laswell_bdu", "", 1);
    self.headmodel = "head_c_jup_sp_hero_laswell_bdu";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_ca2bf1867c24316c / namespace_5feb7a9a13647a8c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x227
// Size: 0x2
function precache() {
    
}

// Namespace namespace_ca2bf1867c24316c / namespace_5feb7a9a13647a8c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x231
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_hero_laswell_bdu");
    precachemodel("head_c_jup_sp_hero_laswell_bdu");
}

// Namespace namespace_ca2bf1867c24316c / namespace_5feb7a9a13647a8c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x258
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

