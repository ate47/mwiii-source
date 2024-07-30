#using scripts\common\utility.gsc;

#namespace namespace_de41a4e7c0568035;

// Namespace namespace_de41a4e7c0568035 / namespace_a02f4c5d421fe415
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd4
// Size: 0x9b
function private autoexec init() {
    character = #"hash_6ab583060b8d75a9";
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

// Namespace namespace_de41a4e7c0568035 / namespace_a02f4c5d421fe415
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x177
// Size: 0x99
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_disciple_pet";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_disciple";
    self setmodel("c_jup_zmb_disciple_body");
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_de41a4e7c0568035 / namespace_a02f4c5d421fe415
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x218
// Size: 0x2
function precache() {
    
}

// Namespace namespace_de41a4e7c0568035 / namespace_a02f4c5d421fe415
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x222
// Size: 0x14
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_disciple_body");
}

// Namespace namespace_de41a4e7c0568035 / namespace_a02f4c5d421fe415
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23e
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

