// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_8ae0d8368506b48d;

// Namespace namespace_8ae0d8368506b48d/namespace_f7199de18b60472d
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xdb
// Size: 0x9b
function private autoexec init() {
    character = #"hash_9d7be683444b8d59";
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

// Namespace namespace_8ae0d8368506b48d/namespace_f7199de18b60472d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"hash_97b066d92d35c738";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_female_dress_blue_gz");
    self attach("c_jup_zmb_zombie_base_female_dress_head_02_blue_gz", "", 1);
    self.headmodel = "c_jup_zmb_zombie_base_female_dress_head_02_blue_gz";
    self setclothtype(#"hash_d0ef9b6cfe3097be");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_8ae0d8368506b48d/namespace_f7199de18b60472d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f
// Size: 0x3
function precache() {
    
}

// Namespace namespace_8ae0d8368506b48d/namespace_f7199de18b60472d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249
// Size: 0x20
function function_430419022a9c3ffe() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_female_dress_blue_gz");
    precachemodel("c_jup_zmb_zombie_base_female_dress_head_02_blue_gz");
}

// Namespace namespace_8ae0d8368506b48d/namespace_f7199de18b60472d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}
