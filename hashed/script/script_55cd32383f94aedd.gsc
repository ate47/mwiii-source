// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_5d5e26f1181f6e77;

// Namespace namespace_5d5e26f1181f6e77/namespace_73a6cc0fc98dee97
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x99
// Size: 0x9b
function private autoexec init() {
    character = #"hash_54ebc2aa2d93488b";
    if (!isdefined(level.var_586887bc5dc30f34)) {
        level.var_586887bc5dc30f34 = [];
    }
    if (!isdefined(level.var_7d97144daa7995cd)) {
        level.var_7d97144daa7995cd = [];
    }
    if (!isdefined(level.var_44bf7e31237b3073)) {
        level.var_44bf7e31237b3073 = [];
    }
    level.var_586887bc5dc30f34[character] = &main;
    if (issp()) {
        level.var_7d97144daa7995cd[character] = &function_430419022a9c3ffe;
    } else {
        level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
    }
}

// Namespace namespace_5d5e26f1181f6e77/namespace_73a6cc0fc98dee97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b
// Size: 0x9a
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_hellhound";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_hellhound";
    self setmodel("c_jup_zmb_zod_hellhound");
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_5d5e26f1181f6e77/namespace_73a6cc0fc98dee97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc
// Size: 0x3
function precache() {
    
}

// Namespace namespace_5d5e26f1181f6e77/namespace_73a6cc0fc98dee97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e6
// Size: 0x15
function function_430419022a9c3ffe() {
    precache();
    precachemodel("c_jup_zmb_zod_hellhound");
}

// Namespace namespace_5d5e26f1181f6e77/namespace_73a6cc0fc98dee97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x202
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}
