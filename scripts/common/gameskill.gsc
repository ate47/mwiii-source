// mwiii decomp prototype
#using scripts\anim\utility_common.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace gameskill;

// Namespace gameskill/namespace_2f36c2cc5a44d845
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc
// Size: 0x30
function get_skill_from_index(index) {
    if (utility::issp() || utility::iscp()) {
        index = index + 1;
    }
    return level.difficultytype[index];
}

// Namespace gameskill/namespace_2f36c2cc5a44d845
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104
// Size: 0x56
function apply_difficulty_settings_shared(var_64e5d13011016a93) {
    /#
        assert(isplayer(self));
    #/
    self.var_da4b6392c1bec6a1 = get_difficultysetting_frac("missTimeConstant", var_64e5d13011016a93);
    self.var_cef700ed012e8981 = get_difficultysetting_frac("missTimeDistanceFactor", var_64e5d13011016a93);
    function_38ae83992c7eb8a5(get_difficultysetting("double_grenades_allowed"));
}

// Namespace gameskill/namespace_2f36c2cc5a44d845
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161
// Size: 0x1d
function get_difficultysetting_frac(setting, frac) {
    return get_difficultysetting(setting) * frac;
}

// Namespace gameskill/namespace_2f36c2cc5a44d845
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186
// Size: 0x37
function get_difficultysetting(setting, gameskill) {
    if (!isdefined(gameskill)) {
        gameskill = self.gameskill;
    }
    return level.difficultysettings[setting][get_skill_from_index(gameskill)];
}

// Namespace gameskill/namespace_2f36c2cc5a44d845
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5
// Size: 0x27
function get_difficultysetting_global(setting) {
    return level.difficultysettings[setting][get_skill_from_index(level.gameskill)];
}

// Namespace gameskill/namespace_2f36c2cc5a44d845
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f4
// Size: 0x4
function always_pain() {
    return 0;
}

// Namespace gameskill/namespace_2f36c2cc5a44d845
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200
// Size: 0x18
function pain_protection() {
    if (!pain_protection_check()) {
        return 0;
    }
    return randomint(100) > 25;
}

// Namespace gameskill/namespace_2f36c2cc5a44d845
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x220
// Size: 0xa3
function pain_protection_check() {
    if (!isalive(self.enemy)) {
        return 0;
    }
    if (!isplayer(self.enemy)) {
        return 0;
    }
    if (!isalive(level.painai) || level.painai.script != "pain") {
        level.painai = self;
    }
    if (self == level.painai) {
        return 0;
    }
    objweapon = self.damageweapon;
    if (!isnullweapon(objweapon) && objweapon.isbolt) {
        return 0;
    }
    return 1;
}

// Namespace gameskill/namespace_2f36c2cc5a44d845
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cb
// Size: 0xa4
function set_accuracy_based_on_situation() {
    if (self function_e8ca4080d02a0bb4() && isalive(self.enemy)) {
        self function_73ef2fe03a776cd7();
        return;
    }
    if (isplayer(self.enemy)) {
        resetmissdebouncetime();
        if (self.misstime > gettime()) {
            self.accuracy = 0;
            return;
        }
    }
    self.accuracy = self.baseaccuracy;
    if (isdefined(self.isrambo) && isdefined(self.ramboaccuracymult)) {
        self.accuracy = self.accuracy * self.ramboaccuracymult;
    }
}

// Namespace gameskill/namespace_2f36c2cc5a44d845
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x376
// Size: 0xd
function didsomethingotherthanshooting() {
    self.misstimedebounce = 0;
}

// Namespace gameskill/namespace_2f36c2cc5a44d845
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38a
// Size: 0x15
function resetmissdebouncetime() {
    self.misstimedebounce = gettime() + 3000;
}

// Namespace gameskill/namespace_2f36c2cc5a44d845
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a6
// Size: 0x5a
function default_door_node_flashbang_frequency() {
    if (self.team == "allies") {
        self.doorflashchance = 0.6;
    }
    if (self isbadguy()) {
        if (level.gameskill >= 2) {
            self.doorflashchance = 0.8;
        } else {
            self.doorflashchance = 0.6;
        }
    }
}

// Namespace gameskill/namespace_2f36c2cc5a44d845
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x407
// Size: 0x54
function grenadeawareness() {
    if (self.team == "allies") {
        self.grenadeawareness = 0.9;
        self.grenadereturnthrowchance = 0.9;
        return;
    }
    if (self isbadguy()) {
        self.grenadeawareness = 1;
        self.grenadereturnthrowchance = 0.2;
    }
}

// Namespace gameskill/namespace_2f36c2cc5a44d845
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x462
// Size: 0x4d
function map_is_early_in_the_game() {
    if (!isdefined(level.early_level)) {
        /#
            print("<unknown string>");
        #/
        return 1;
    }
    if (isdefined(level.early_level[level.script])) {
        return level.early_level[level.script];
    }
    return 0;
}

// Namespace gameskill/namespace_2f36c2cc5a44d845
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b7
// Size: 0xd
function set_early_level() {
    level.early_level = [];
}

