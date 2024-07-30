#using scripts\common\utility.gsc;

#namespace namespace_f1e87f631587bb5b;

// Namespace namespace_f1e87f631587bb5b / namespace_e48cebc8a33291fb
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xcd
// Size: 0x9a
function private autoexec init() {
    character = #"hash_e5934c0176fd1537";
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

// Namespace namespace_f1e87f631587bb5b / namespace_e48cebc8a33291fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_charred_male_body");
    self attach("c_jup_zmb_zombie_base_charred_male_head", "", 1);
    self.headmodel = "c_jup_zmb_zombie_base_charred_male_head";
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_f1e87f631587bb5b / namespace_e48cebc8a33291fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x231
// Size: 0x2
function precache() {
    
}

// Namespace namespace_f1e87f631587bb5b / namespace_e48cebc8a33291fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23b
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_charred_male_body");
    precachemodel("c_jup_zmb_zombie_base_charred_male_head");
}

// Namespace namespace_f1e87f631587bb5b / namespace_e48cebc8a33291fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x262
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}
