// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_7ff3a914e6c698c5;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_36d7680b337b15b;
#using script_1260535c202c8074;
#using script_3397bed1b741f042;
#using script_193e3e231841082f;
#using script_51003dec974513a9;
#using script_15efdb5808058ab7;

#namespace zombie_deathworm;

// Namespace zombie_deathworm/namespace_c1cca3f9c437f745
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef
// Size: 0x24
function function_a53f4a78a75cbd41(params) {
    function_6e4961e4c0a38088(params);
    function_ccb525d44a15f2b9(params);
    function_72d358d261f676a3(params);
}

// Namespace zombie_deathworm/namespace_c1cca3f9c437f745
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11a
// Size: 0x22
function private function_b0fc1ad0235df745() {
    level.scr_anim[self.animname]["spawn"] = "spawn";
}

// Namespace zombie_deathworm/namespace_c1cca3f9c437f745
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x143
// Size: 0x5e
function function_5a38039db1b92712(asmname, statename, params) {
    function_a343ac31ca854535(&function_b0fc1ad0235df745);
    function_2dd162d826667677();
    function_14c91797faca36ea();
    function_d526daad5a463daf();
    function_d5a08a1079b6f4dd();
    function_f93080dca9cb5ee1();
    function_f847d21eaf2ae0ec();
    ent_flag_set("zombie_asm_init_finished");
}

