// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_b4a777df1439f346;

// Namespace namespace_b4a777df1439f346 / namespace_f14ed9739ed41d26
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xb1
// Size: 0x9b
function private autoexec init() {
    character = #"hash_f07993dc95ab63b2";
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

// Namespace namespace_b4a777df1439f346 / namespace_f14ed9739ed41d26
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x153
// Size: 0x9a
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_abom_mega";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_abom";
    self setmodel("c_jup_zmb_abomination_megabomb_body");
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_b4a777df1439f346 / namespace_f14ed9739ed41d26
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f4
// Size: 0x3
function precache() {
    
}

// Namespace namespace_b4a777df1439f346 / namespace_f14ed9739ed41d26
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe
// Size: 0x15
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_abomination_megabomb_body");
}

// Namespace namespace_b4a777df1439f346 / namespace_f14ed9739ed41d26
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21a
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

