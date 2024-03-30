// mwiii decomp prototype
#using scripts\common\callbacks.gsc;
#using script_7b2517368c79e5bc;
#using script_3e2f8cc477d57433;
#using script_443d99fe707f1d9f;
#using script_2b264b25c7da0b12;

#namespace namespace_2bf4cd4dfd211422;

// Namespace namespace_2bf4cd4dfd211422 / namespace_c3e26060241fb8a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9
// Size: 0x3a
function function_2c48f8f076e75751() {
    function_900f562c61c6a5d6("revive", &use_revive, &function_1e669ec449acd66c, &function_1e669ec449acd66c, &function_42d4f1d48695f537, &function_13eca89b22129fbd);
    level callback::add("player_revived", &on_revived);
}

// Namespace namespace_2bf4cd4dfd211422 / namespace_c3e26060241fb8a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a
// Size: 0xe9
function on_revived(params) {
    if (isdefined(params.reviver) && self == params.reviver && inventory_isenabled()) {
        for (backpackindex = 0; backpackindex < function_1b35b10884bd8d67(); backpackindex++) {
            lootid = function_d870b2c45335bd88(backpackindex);
            quantity = function_5ce7fe3dca9c1a22(backpackindex);
            if (isdefined(lootid) && lootid > 0) {
                itembundlename = function_fc925a153c7fd55c(lootid);
                itembundle = getscriptbundle("itemspawnentry:" + itembundlename);
                if (itembundle.type == "revive") {
                    for (i = 0; i < quantity; i++) {
                        if (namespace_1d863a7bbc05fc52::function_85bcfa7d00b8bb6b()) {
                            function_777092be5abab355(backpackindex);
                        }
                    }
                }
            }
        }
    }
}

// Namespace namespace_2bf4cd4dfd211422 / namespace_c3e26060241fb8a2
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fa
// Size: 0x31
function function_1e669ec449acd66c(itembundle, item, autouse, allowswap) {
    if (namespace_1d863a7bbc05fc52::function_85bcfa7d00b8bb6b()) {
        return true;
    }
    return false;
}

// Namespace namespace_2bf4cd4dfd211422 / namespace_c3e26060241fb8a2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x233
// Size: 0x7c
function use_revive(itembundle, item, auto_use) {
    var_21db2712e6d4ecc7 = item.count;
    for (i = 0; i < item.count; i++) {
        if (namespace_1d863a7bbc05fc52::function_546201bb34cf36ce() < level.gametypebundle.var_4f29dbd56f01de57) {
            namespace_1d863a7bbc05fc52::function_7eba90a4d2ef6d6f();
            var_21db2712e6d4ecc7--;
        }
    }
    return var_21db2712e6d4ecc7;
}

// Namespace namespace_2bf4cd4dfd211422 / namespace_c3e26060241fb8a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b7
// Size: 0x57
function function_42d4f1d48695f537() {
    itembundle = undefined;
    quantity = 0;
    itembundlename = function_61d960957fcf3ca0("brloot_self_revive");
    if (isdefined(itembundlename)) {
        itembundle = getscriptbundle("itemspawnentry:" + itembundlename);
        quantity = namespace_1d863a7bbc05fc52::function_546201bb34cf36ce();
    }
    return [itembundle, quantity];
}

// Namespace namespace_2bf4cd4dfd211422 / namespace_c3e26060241fb8a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x316
// Size: 0xa
function function_13eca89b22129fbd() {
    namespace_1d863a7bbc05fc52::function_d7827c7865b2089b();
}

