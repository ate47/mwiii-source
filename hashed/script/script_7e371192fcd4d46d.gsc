// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_dd1a9c5a715a2fef;

// Namespace namespace_dd1a9c5a715a2fef/namespace_1f5a670849f389cf
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xb7
// Size: 0x9b
function private autoexec init() {
    character = #"hash_84c9795797280f93";
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

// Namespace namespace_dd1a9c5a715a2fef/namespace_1f5a670849f389cf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x159
// Size: 0x9a
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base_abom_crawler";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_abomination_crawler_hvt");
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_dd1a9c5a715a2fef/namespace_1f5a670849f389cf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fa
// Size: 0x3
function precache() {
    
}

// Namespace namespace_dd1a9c5a715a2fef/namespace_1f5a670849f389cf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x204
// Size: 0x15
function function_430419022a9c3ffe() {
    precache();
    precachemodel("c_jup_zmb_abomination_crawler_hvt");
}

// Namespace namespace_dd1a9c5a715a2fef/namespace_1f5a670849f389cf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x220
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}
