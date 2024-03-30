// mwiii decomp prototype
#using script_39ebe40c5c0566e7;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\perks\perkpackage.gsc;

#namespace perk;

// Namespace perk / scripts/mp/utility/perk
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34f
// Size: 0xc
function perksenabled() {
    return level.allowperks;
}

// Namespace perk / scripts/mp/utility/perk
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x363
// Size: 0x13
function _hasperk(perkname) {
    return namespace_475c6252a691eb85::function_56ad1b98a0613f8a(perkname);
}

// Namespace perk / scripts/mp/utility/perk
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e
// Size: 0x56
function giveperk(perkname) {
    /#
        assertex(isdefined(perkname), "givePerk perkName not defined and should be");
    #/
    /#
        assertex(perkname != "specialty_null", "givePerk perkName shouldn't be specialty_null, use removePerk()");
    #/
    /#
        assertex(perkname != "none", "givePerk perkName shouldn't be none, use removePerk()");
    #/
    scripts/mp/perks/perks::_setperk(perkname);
    scripts/mp/perks/perks::_setextraperks(perkname);
}

// Namespace perk / scripts/mp/utility/perk
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3db
// Size: 0xa
function resetperkpackage() {
    scripts/mp/perks/perkpackage::perkpackage_reset();
}

// Namespace perk / scripts/mp/utility/perk
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ec
// Size: 0x6a
function removeperk(perkname) {
    if (istrue(level.gameended)) {
        return;
    }
    /#
        assertex(isdefined(perkname), "removePerk perkName not defined and should be");
    #/
    /#
        assertex(perkname != "specialty_null", "removePerk perkName shouldn't be specialty_null");
    #/
    /#
        assertex(perkname != "none", "removePerk perkName shouldn't be none");
    #/
    if (!isdefined(self)) {
        return;
    }
    scripts/mp/perks/perks::_unsetperk(perkname);
    scripts/mp/perks/perks::_unsetextraperks(perkname);
}

// Namespace perk / scripts/mp/utility/perk
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45d
// Size: 0x182
function blockperkfunction(perkname) {
    /#
        assertex(isdefined(perkname), "disablePerk perkName not defined and should be");
    #/
    /#
        assertex(perkname != "specialty_null", "disablePerk perkName shouldn't be specialty_null");
    #/
    /#
        assertex(perkname != "none", "disablePerk perkName shouldn't be none");
    #/
    if (!function_8641edd897d42547(perkname)) {
        self.perksblocked[perkname] = 1;
    } else {
        self.perksblocked[perkname]++;
    }
    if (self.perksblocked[perkname] == 1 && _hasperk(perkname)) {
        scripts/mp/perks/perks::_unsetperkinternal(perkname);
        foreach (perk, array in level.extraperkmap) {
            if (perkname == perk) {
                foreach (extraperk in array) {
                    if (!function_8641edd897d42547(perkname)) {
                        self.perksblocked[extraperk] = 1;
                    } else {
                        self.perksblocked[extraperk]++;
                    }
                    if (self.perksblocked[extraperk] == 1) {
                        scripts/mp/perks/perks::_unsetperkinternal(extraperk);
                    }
                }
                break;
            }
        }
    }
    /#
        level notify("<unknown string>");
    #/
}

// Namespace perk / scripts/mp/utility/perk
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e6
// Size: 0x1c9
function unblockperkfunction(perkname) {
    /#
        assertex(isdefined(perkname), "unblockPerkFunction perkName not defined and should be");
    #/
    /#
        assertex(perkname != "specialty_null", "unblockPerkFunction perkName shouldn't be specialty_null");
    #/
    /#
        assertex(perkname != "none", "unblockPerkFunction perkName shouldn't be none");
    #/
    /#
        assertex(function_8641edd897d42547(perkname) && istrue(self.perksblocked[perkname] > 0) || isdefined(level.perks_suppressasserts), "unblockPerkFunction called on perk that isn't disabled.");
    #/
    self.perksblocked[perkname]--;
    if (self.perksblocked[perkname] == 0) {
        self.perksblocked[perkname] = undefined;
        if (_hasperk(perkname)) {
            scripts/mp/perks/perks::_setperkinternal(perkname);
            foreach (perk, array in level.extraperkmap) {
                if (perkname == perk) {
                    foreach (extraperk in array) {
                        /#
                            assertex(function_8641edd897d42547(extraperk) && istrue(self.perksblocked[extraperk] > 0) || isdefined(level.perks_suppressasserts), "unblockPerkFunction found extra perk not disabled.");
                        #/
                        self.perksblocked[extraperk]--;
                        if (self.perksblocked[extraperk] == 0) {
                            scripts/mp/perks/perks::_setperkinternal(extraperk);
                            self.perksblocked[extraperk] = undefined;
                        }
                    }
                    break;
                }
            }
        }
    }
    /#
        level notify("<unknown string>");
    #/
}

// Namespace perk / scripts/mp/utility/perk
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b6
// Size: 0x29
function getbaseperkname(perkname) {
    if (isendstr(perkname, "_ks")) {
        perkname = getsubstr(perkname, 0, perkname.size - 3);
    }
    return perkname;
}

// Namespace perk / scripts/mp/utility/perk
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e7
// Size: 0x8
function lightweightscalar() {
    return 1.06;
}

// Namespace perk / scripts/mp/utility/perk
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f7
// Size: 0x2e
function function_8641edd897d42547(perkname) {
    if (!isdefined(perkname)) {
        return 0;
    }
    if (!isdefined(self.perksblocked)) {
        return 0;
    }
    return isdefined(self.perksblocked[perkname]);
}

// Namespace perk / scripts/mp/utility/perk
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82d
// Size: 0x49
function function_97cbc67b162a70f4() {
    if (getdvarint(@"hash_bd3e4943999de33b", 0)) {
        return 0;
    }
    if (isdefined(level.gamemodebundle)) {
        return istrue(level.gamemodebundle.var_ac36c9085edf4e44);
    }
    return getdvarint(@"hash_b01050da9b96d273", 1);
}

// Namespace perk / scripts/mp/utility/perk
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87e
// Size: 0x34
function function_ea4c5dc15c3bbdd9() {
    if (isdefined(level.gamemodebundle)) {
        return istrue(level.gamemodebundle.var_e12ed09bf2e43167);
    }
    return getdvarint(@"hash_7a1dc05c581af6f8", 0);
}

// Namespace perk / scripts/mp/utility/perk
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ba
// Size: 0x26
function function_d327b07e25d475e1() {
    if (isdefined(level.gamemodebundle)) {
        return istrue(level.gamemodebundle.var_9b88563ac5ace911);
    }
    return 0;
}

