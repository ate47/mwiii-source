// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\engine\utility.gsc;

#namespace namespace_3cd8443b4650c886;

// Namespace namespace_3cd8443b4650c886/namespace_2a48aafa587c77be
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x80
// Size: 0x25
function function_6c5371915054a3f9(state_name) {
    /#
        assert(isstring(state_name));
    #/
    self.var_b0c4e11ab698f0d1 = state_name;
}

// Namespace namespace_3cd8443b4650c886/namespace_2a48aafa587c77be
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac
// Size: 0x37
function function_3ce3c307b88d4237() {
    if (istrue(self.var_4507177651176666)) {
        return;
    }
    self.var_4507177651176666 = 1;
    function_ac90fa5cc0a80298(function_53c4c53197386572(self.var_b0c4e11ab698f0d1, "bite_in"));
}
