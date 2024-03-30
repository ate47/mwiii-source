// mwiii decomp prototype
#using script_7b2517368c79e5bc;
#using script_639bf783929acf9b;

#namespace namespace_f9e8a327d793c098;

// Namespace namespace_f9e8a327d793c098 / namespace_3bb9f9a385df1918
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0
// Size: 0x3a
function function_b60c68caa2f279ab() {
    if (isdefined(level.var_27475bb0d1b06044)) {
        [[ level.var_27475bb0d1b06044 ]]();
        return;
    }
    function_900f562c61c6a5d6("currency", &use_currency, &function_794ffcdb7828ea7a, &function_794ffcdb7828ea7a);
}

// Namespace namespace_f9e8a327d793c098 / namespace_3bb9f9a385df1918
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131
// Size: 0x26
function function_794ffcdb7828ea7a(itembundle, item, auto_use, var_18fc734ec7194ede) {
    return true;
}

// Namespace namespace_f9e8a327d793c098 / namespace_3bb9f9a385df1918
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f
// Size: 0xc2
function use_currency(itembundle, item, auto_use) {
    currencytype = itembundle.subtype;
    var_3d7ffadeef043c6 = function_b8bfea9514c89a77(item.count);
    if (!isdefined(currencytype) || currencytype == "") {
        itembundlename = function_2cdc55ba39d97d70(item.type);
        /#
            assertmsg("CommonItemERROR: Attempted to pick up currency item [" + itembundlename + "] with undefined currency type (bundle.subtype)");
        #/
        return false;
    }
    if (currencytype == "essence" && isdefined(self.zombie_point_scalar)) {
        var_3d7ffadeef043c6 = var_3d7ffadeef043c6 * self.zombie_point_scalar;
    }
    namespace_7dfc6454a70f3f39::function_3036cef61495210f(currencytype, var_3d7ffadeef043c6);
    return false;
}

