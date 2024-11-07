#using scripts\common\utility.gsc;

#namespace namespace_60e278a5202171f6;

// Namespace namespace_60e278a5202171f6 / namespace_8530649a597ab656
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xca
// Size: 0x9a
function private autoexec init() {
    character = #"hash_1409c326fbcce37a";
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

// Namespace namespace_60e278a5202171f6 / namespace_8530649a597ab656
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16c
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"sas";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_hero_price_london_tactical");
    self attach("head_hero_price_nohat_lod", "", 1);
    self.headmodel = "head_hero_price_nohat_lod";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"hash_466ad932e56afc50");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_60e278a5202171f6 / namespace_8530649a597ab656
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22f
// Size: 0x2
function precache() {
    
}

// Namespace namespace_60e278a5202171f6 / namespace_8530649a597ab656
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x239
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_hero_price_london_tactical");
    precachemodel("head_hero_price_nohat_lod");
}

// Namespace namespace_60e278a5202171f6 / namespace_8530649a597ab656
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x260
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}
