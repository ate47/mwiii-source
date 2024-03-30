// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\scriptable.gsc;
#using script_7534b1d3ac3ea47a;

#namespace ob_seismic_refractor;

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x172
// Size: 0x6
function function_8086d05fcf37c41e() {
    /#
    #/
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f
// Size: 0x17b
function spawn_refractor(spawn_struct, var_cd74e8066ff626a6, var_c974765ba1e28e93) {
    if (!isdefined(var_cd74e8066ff626a6)) {
        var_cd74e8066ff626a6 = "ob_seismic_refractor";
    }
    if (!isdefined(var_c974765ba1e28e93)) {
        var_c974765ba1e28e93 = "jup_hacking_device_ob";
    }
    if (!isdefined(level.scriptable_notify_callback_funcs["refractor_activated"]) || !array_contains(level.scriptable_notify_callback_funcs["refractor_activated"], &function_aa84440f79224493)) {
        scripts/engine/scriptable::scriptable_addnotifycallback("refractor_activated", &function_aa84440f79224493);
    }
    if (!isdefined(level.scriptable_notify_callback_funcs["refractor_hammer"]) || !array_contains(level.scriptable_notify_callback_funcs["refractor_hammer"], &function_81edae2f148e254e)) {
        scripts/engine/scriptable::scriptable_addnotifycallback("refractor_hammer", &function_81edae2f148e254e);
    }
    refractor = spawnscriptable(var_cd74e8066ff626a6, spawn_struct.origin, spawn_struct.angles);
    refractor.hammer = spawnscriptable("ob_seismic_refractor_hammer", spawn_struct.origin, spawn_struct.angles);
    refractor setscriptablepartstate("model", "unusable", 0);
    refractor.var_aa599c358ec2ad3e = [];
    refractor.var_19cb4df4192822ca = [];
    refractor.var_fb285d0793a4040c = [];
    refractor.var_8b222c47a4c5bc24 = [];
    refractor.var_f9b8a1126400b110 = [];
    namespace_29b5250e9959ea::function_3cec1b2981075936(var_c974765ba1e28e93, refractor, &function_7192fa51a97ee5e9, &function_cbbab99365ff243f, &function_d62d4fe8da417ddd);
    return refractor;
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x302
// Size: 0x2b
function function_d5c87e3695f5b16(callback) {
    if (isfunction(callback)) {
        self.var_aa599c358ec2ad3e[self.var_aa599c358ec2ad3e.size] = callback;
    }
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x334
// Size: 0x2b
function function_d290ab656c9cd6e2(callback) {
    if (isfunction(callback)) {
        self.var_19cb4df4192822ca[self.var_19cb4df4192822ca.size] = callback;
    }
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x366
// Size: 0x2b
function function_3c5ad201440cf164(callback) {
    if (isfunction(callback)) {
        self.var_fb285d0793a4040c[self.var_fb285d0793a4040c.size] = callback;
    }
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x398
// Size: 0x2b
function function_9cdaad2239acc1fc(callback) {
    if (isfunction(callback)) {
        self.var_8b222c47a4c5bc24[self.var_8b222c47a4c5bc24.size] = callback;
    }
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ca
// Size: 0x2b
function function_938ec5691a0782f8(callback) {
    if (isfunction(callback)) {
        self.var_f9b8a1126400b110[self.var_f9b8a1126400b110.size] = callback;
    }
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fc
// Size: 0x6
function function_c31851330ac22c3c() {
    /#
    #/
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x409
// Size: 0x60
function private function_cbbab99365ff243f(player) {
    foreach (func in self.var_fb285d0793a4040c) {
        self thread [[ func ]](player);
    }
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x470
// Size: 0x69
function private function_d62d4fe8da417ddd(player) {
    thread function_f083c5f7558264f4(player);
    foreach (func in self.var_8b222c47a4c5bc24) {
        self thread [[ func ]](player);
    }
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e0
// Size: 0x94
function private function_f083c5f7558264f4(player) {
    player endon("interaction_complete");
    self setscriptablepartstate("flipbook", "activating", 0);
    player waittill("cancel");
    waitframe();
    self setscriptablepartstate("flipbook", "idle", 0);
    foreach (func in self.var_f9b8a1126400b110) {
        self thread [[ func ]](player);
    }
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x57b
// Size: 0xa1
function private function_7192fa51a97ee5e9(player) {
    if (isdefined(self.var_db4f5c48c8cb9a3c)) {
        self thread [[ self.var_db4f5c48c8cb9a3c ]](player);
        return;
    }
    self setscriptablepartstate("model", "just_used", 0);
    self setscriptablepartstate("effects", "Initial", 0);
    foreach (func in self.var_19cb4df4192822ca) {
        self thread [[ func ]](player);
    }
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x623
// Size: 0x16
function private function_cf139bdff2bdcaad(func) {
    self.var_db4f5c48c8cb9a3c = func;
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x640
// Size: 0x26
function function_e23f7699eb3f384e() {
    if (isdefined(self.hammer)) {
        self.hammer freescriptable();
    }
    self freescriptable();
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66d
// Size: 0x6
function function_8a76744810afe9be() {
    /#
    #/
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x67a
// Size: 0x7f
function private function_aa84440f79224493(instance, notif, param, var_535d9c3fdddab5a9) {
    foreach (func in instance.var_aa599c358ec2ad3e) {
        instance thread [[ func ]](instance, notif, param, var_535d9c3fdddab5a9);
    }
}

// Namespace ob_seismic_refractor / namespace_75f95b427df8560e
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x700
// Size: 0x114
function private function_81edae2f148e254e(instance, notif, params, var_535d9c3fdddab5a9) {
    if (!isdefined(instance.hammer)) {
        return;
    }
    switch (params) {
    case 0:
        instance.hammer setscriptablepartstate("model", "Hidden", 0);
        break;
    case 1:
        instance.hammer setscriptablepartstate("model", "static", 0);
        break;
    case 2:
        instance.hammer setscriptablepartstate("model", "initial", 0);
        break;
    case 3:
        instance.hammer setscriptablepartstate("model", "drop", 0);
        break;
    case 4:
        instance.hammer setscriptablepartstate("model", "rise", 0);
        break;
    }
}

