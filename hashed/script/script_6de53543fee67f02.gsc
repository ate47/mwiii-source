// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace render_utility;

// Namespace render_utility / namespace_ff14d1780afedf10
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b
// Size: 0x86
function function_4f2c4138dacca16a(aberration, radius, strength, distortion) {
    /#
        assert(isdefined(self));
    #/
    /#
        assert(isplayer(self));
    #/
    if (isdefined(aberration)) {
        self setclientomnvar("chromatic_aberration_override", aberration);
    }
    if (isdefined(radius)) {
        self setclientomnvar("chromatic_aberration_radius_override", radius);
    }
    if (isdefined(strength)) {
        self setclientomnvar("chromatic_aberration_strength_override", strength);
    }
    if (isdefined(distortion)) {
        self setclientomnvar("chromatic_aberration_distortion_override", distortion);
    }
}

// Namespace render_utility / namespace_ff14d1780afedf10
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x198
// Size: 0x61
function function_e2eae50826e12247() {
    /#
        assert(isdefined(self));
    #/
    /#
        assert(isplayer(self));
    #/
    self setclientomnvar("chromatic_aberration_override", 0);
    self setclientomnvar("chromatic_aberration_radius_override", 0);
    self setclientomnvar("chromatic_aberration_strength_override", 0);
    self setclientomnvar("chromatic_aberration_distortion_override", 0);
}

