#using scripts\common\utility;

#namespace namespace_19618770ea797a04;

// Namespace namespace_19618770ea797a04 / namespace_f6e904bdff535ba4
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xec
// Size: 0x9b
function private autoexec init() {
    character = #"hash_6ff7915d27301448";
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

// Namespace namespace_19618770ea797a04 / namespace_f6e904bdff535ba4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18f
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "warlord_chemist";
    self.voice = #"unitednationsfemale";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_ext_chemist");
    self attach("head_c_jup_ext_chemist", "", 1);
    self.headmodel = "head_c_jup_ext_chemist";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"milmedgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_19618770ea797a04 / namespace_f6e904bdff535ba4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x252
// Size: 0x2
function precache() {
    
}

// Namespace namespace_19618770ea797a04 / namespace_f6e904bdff535ba4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25c
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_ext_chemist");
    precachemodel("head_c_jup_ext_chemist");
}

// Namespace namespace_19618770ea797a04 / namespace_f6e904bdff535ba4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x283
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

