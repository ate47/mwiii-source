// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_6ebd0d5f9b30a55a;

#namespace namespace_3e8924d2d52a5e37;

// Namespace namespace_3e8924d2d52a5e37/namespace_b294929e0e35387a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe
// Size: 0x68
function function_63555ee8e5fb64fc(var_43e69bd9380fe050) {
    /#
        assertex(var_43e69bd9380fe050 > 0, "The LRU cache size must be greater than zero");
    #/
    var_f9c88d9020c8956c = spawnstruct();
    var_f9c88d9020c8956c.var_43e69bd9380fe050 = var_43e69bd9380fe050;
    var_f9c88d9020c8956c.var_f4087a1ca01febee = function_e0143bb4b41a77c4();
    var_f9c88d9020c8956c.var_45d1c09db0997e7d = [];
    var_f9c88d9020c8956c.var_6331b84385d676bc = 1;
    return var_f9c88d9020c8956c;
}

// Namespace namespace_3e8924d2d52a5e37/namespace_b294929e0e35387a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16e
// Size: 0x24
function function_6331b84385d676bc(var_c41e3f9d7499501f) {
    return isstruct(var_c41e3f9d7499501f) && var_c41e3f9d7499501f.var_6331b84385d676bc == 1;
}

// Namespace namespace_3e8924d2d52a5e37/namespace_b294929e0e35387a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a
// Size: 0x16f
function function_cdc086fa4e95b951(datakey, var_451d16044705026f) {
    /#
        assertex(function_6331b84385d676bc(self), "This function requires that 'self' is a LRU struct as defined in 'lru_cache.gsc'");
    #/
    var_f9c88d9020c8956c = self;
    if (isdefined(var_f9c88d9020c8956c.var_45d1c09db0997e7d[datakey])) {
        var_aa6139aeacf146d0 = var_f9c88d9020c8956c.var_45d1c09db0997e7d[datakey];
        var_f9c88d9020c8956c.var_f4087a1ca01febee function_7f2de7f012dc412f(var_aa6139aeacf146d0);
    } else {
        var_aa6139aeacf146d0 = function_11a80ea7fe6ea9e0();
        var_aa6139aeacf146d0.contents = var_451d16044705026f;
        var_aa6139aeacf146d0.datakey = datakey;
        var_f9c88d9020c8956c.var_45d1c09db0997e7d[datakey] = var_aa6139aeacf146d0;
        var_f9c88d9020c8956c.var_f4087a1ca01febee function_ba05da019b3ecd4(var_aa6139aeacf146d0, 1);
        /#
            if (var_f9c88d9020c8956c function_63fe00fb459ea917()) {
                function_cb7caa09a0749df4("<unknown string>" + datakey + "<unknown string>");
            }
        #/
        if (var_f9c88d9020c8956c.var_f4087a1ca01febee function_c6439f53c39b5342() > var_f9c88d9020c8956c.var_43e69bd9380fe050) {
            var_3c81bd8cfe859fc3 = var_f9c88d9020c8956c.var_f4087a1ca01febee function_17a0e977331bf97c();
            var_f9c88d9020c8956c function_992d181b387ca849(var_3c81bd8cfe859fc3.datakey);
            /#
                if (var_f9c88d9020c8956c function_63fe00fb459ea917()) {
                    function_cb7caa09a0749df4("<unknown string>" + var_f9c88d9020c8956c.var_43e69bd9380fe050 + "<unknown string>" + datakey + "<unknown string>" + var_3c81bd8cfe859fc3.datakey + "<unknown string>");
                }
            #/
        }
    }
}

// Namespace namespace_3e8924d2d52a5e37/namespace_b294929e0e35387a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x310
// Size: 0x81
function function_992d181b387ca849(datakey) {
    /#
        assertex(function_6331b84385d676bc(self), "This function requires that 'self' is a LRU struct as defined in 'lru_cache.gsc'");
    #/
    var_f9c88d9020c8956c = self;
    if (isdefined(var_f9c88d9020c8956c.var_45d1c09db0997e7d[datakey])) {
        var_aa6139aeacf146d0 = var_f9c88d9020c8956c.var_45d1c09db0997e7d[datakey];
        var_f9c88d9020c8956c.var_f4087a1ca01febee function_5aa07df03575a9a9(var_aa6139aeacf146d0);
        var_aa6139aeacf146d0.contents = undefined;
        var_f9c88d9020c8956c.var_45d1c09db0997e7d[datakey] = undefined;
    }
}

// Namespace namespace_3e8924d2d52a5e37/namespace_b294929e0e35387a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x398
// Size: 0x76
function function_c908ab3353601192(datakey) {
    /#
        assertex(function_6331b84385d676bc(self), "This function requires that 'self' is a LRU struct as defined in 'lru_cache.gsc'");
    #/
    var_f9c88d9020c8956c = self;
    if (isdefined(var_f9c88d9020c8956c.var_45d1c09db0997e7d[datakey])) {
        var_aa6139aeacf146d0 = var_f9c88d9020c8956c.var_45d1c09db0997e7d[datakey];
        var_f9c88d9020c8956c.var_f4087a1ca01febee function_7f2de7f012dc412f(var_aa6139aeacf146d0);
        return var_aa6139aeacf146d0.contents;
    }
    return undefined;
}

// Namespace namespace_3e8924d2d52a5e37/namespace_b294929e0e35387a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x416
// Size: 0x6
function function_b070450a1a879374() {
    /#
    #/
}

// Namespace namespace_3e8924d2d52a5e37/namespace_b294929e0e35387a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x423
// Size: 0x21
function function_7f5414a2ec3af004() {
    /#
        var_e7bd49da3939ba59 = function_63555ee8e5fb64fc();
        var_e7bd49da3939ba59 function_e72dd453d0c738eb();
        return var_e7bd49da3939ba59;
    #/
}

// Namespace namespace_3e8924d2d52a5e37/namespace_b294929e0e35387a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x44b
// Size: 0x5a
function function_e72dd453d0c738eb(var_f6db2dc3ab7b9a12) {
    /#
        /#
            assertex(function_6331b84385d676bc(self), "<unknown string>");
        #/
        var_e7bd49da3939ba59 = self;
        var_e7bd49da3939ba59.var_1a19bd75a8860186 = 1;
        if (istrue(var_f6db2dc3ab7b9a12)) {
            var_e7bd49da3939ba59.var_f4087a1ca01febee function_3a28dcc9cc1b6ae3(&function_b96df1db6657354e);
        }
    #/
}

// Namespace namespace_3e8924d2d52a5e37/namespace_b294929e0e35387a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4ac
// Size: 0x34
function private function_63fe00fb459ea917() {
    /#
        /#
            assertex(function_6331b84385d676bc(self), "<unknown string>");
        #/
        var_f9c88d9020c8956c = self;
        return istrue(var_f9c88d9020c8956c.var_1a19bd75a8860186);
    #/
}

// Namespace namespace_3e8924d2d52a5e37/namespace_b294929e0e35387a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4e7
// Size: 0x27
function private function_b96df1db6657354e(var_6eed7906b60714b6) {
    /#
        function_cb7caa09a0749df4("<unknown string>" + var_6eed7906b60714b6.datakey);
    #/
}

// Namespace namespace_3e8924d2d52a5e37/namespace_b294929e0e35387a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x515
// Size: 0xc
function private function_c3b303ae9042d994() {
    /#
        return "<unknown string>";
    #/
}

// Namespace namespace_3e8924d2d52a5e37/namespace_b294929e0e35387a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x528
// Size: 0x1d
function private function_cb7caa09a0749df4(var_f0443bfaa4783689) {
    /#
        iprintln(function_c3b303ae9042d994() + var_f0443bfaa4783689);
    #/
}

