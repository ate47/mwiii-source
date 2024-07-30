#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using script_6775ad452d13858;

#namespace execution;

// Namespace execution / scripts\cp_mp\execution
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c2
// Size: 0x36
function function_1ea3e44fd8a18d1() {
    if (!isdefined(self)) {
        return false;
    }
    if (isbot(self) && getdvarint(@"hash_eb038ca43332e718", 0) == 0) {
        return false;
    }
    if (istestclient(self)) {
        return false;
    }
    return true;
}

// Namespace execution / scripts\cp_mp\execution
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x301
// Size: 0x16f
function _giveexecution(ref, isfirstperson) {
    if (!function_1ea3e44fd8a18d1()) {
        return;
    }
    thread execution_monitor();
    if (function_3b6961b424a382f()) {
        var_25a38dfaf37fc298 = tolower(getdvar(@"hash_88ba4ca6e5ff9d5a", ""));
        if (isdefined(level.execution.table[var_25a38dfaf37fc298])) {
            ref = var_25a38dfaf37fc298;
        }
    }
    _clearexecution(istrue(isfirstperson));
    propweapon = execution_getpropweaponbyref(ref);
    if (ref == "execution_062" && self.operatorcustomization.operatorref == "inarius_western") {
        propweapon = level.execution.table[ref].propweapon2;
    }
    execution = execution_getexecutionbyref(ref);
    assertex(isdefined(execution), "<dev string:x1c>" + ref);
    if (!isdefined(execution)) {
        return;
    }
    if (isdefined(propweapon)) {
        self giveweapon(propweapon);
        self giveexecution(execution, propweapon, istrue(isfirstperson));
    } else {
        self giveexecution(execution, undefined, istrue(isfirstperson));
    }
    if (istrue(function_700277400dcb7857(ref))) {
        function_43a90e553f84c31c();
    }
    self.executionref = ref;
    if (issharedfuncdefined("game", "lpcFeatureGated") && ![[ getsharedfunc("game", "lpcFeatureGated") ]]()) {
        thread watchinexecution();
    }
}

// Namespace execution / scripts\cp_mp\execution
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x478
// Size: 0x93
function _clearexecution(isfirstperson) {
    if (isdefined(self.executionref)) {
        self clearexecution(istrue(isfirstperson));
        propweapon = execution_getpropweaponbyref(self.executionref);
        if (self.executionref == "execution_062" && self.operatorcustomization.operatorref == "inarius_western") {
            propweapon = "iw9_execution_spear_wings";
        }
        if (isdefined(propweapon) && self hasweapon(propweapon)) {
            self takeweapon(propweapon);
        }
        self.executionref = undefined;
    }
}

// Namespace execution / scripts\cp_mp\execution
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x513
// Size: 0xc
function hasexecution() {
    return isdefined(self.executionref);
}

// Namespace execution / scripts\cp_mp\execution
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x528
// Size: 0xc7
function execution_monitor() {
    self notify("exec_monitor_request");
    self endon("exec_monitor_request");
    while (true) {
        victiment = self waittill("execution_begin");
        if (isdefined(self.executionref) && isdefined(self.suit)) {
            aliasstring = "mus_" + self.suit + "_" + self.executionref;
            if (soundexists(aliasstring)) {
                self playlocalsound(aliasstring);
                victiment playlocalsound(aliasstring);
            }
        }
        if (isdefined(victiment)) {
            if (isdefined(victiment.basearchetype) && victiment.basearchetype == "zombie_base") {
                victiment setentitysoundcontext("gender", "zombie");
            }
        }
        wait 2;
    }
}

// Namespace execution / scripts\cp_mp\execution
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f7
// Size: 0x8e
function execution_init() {
    assertex(!isdefined(level.execution), "execution_init was called more than once.");
    level.execution = spawnstruct();
    level.enableexecutionattackfunc = &enableexecutionattackwrapper;
    level.disableexecutionattackfunc = &disableexecutionattackwrapper;
    level.enableexecutionvictimfunc = &enableexecutionvictimwrapper;
    level.disableexecutionvictimfunc = &disableexecutionvictimwrapper;
    execution_loadtable();
    if (issharedfuncdefined("execution", "init")) {
        [[ getsharedfunc("execution", "init") ]]();
    }
}

// Namespace execution / scripts\cp_mp\execution
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68d
// Size: 0x9
function enableexecutionattackwrapper() {
    self enableexecutionattack();
}

// Namespace execution / scripts\cp_mp\execution
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69e
// Size: 0x9
function disableexecutionattackwrapper() {
    self disableexecutionattack();
}

// Namespace execution / scripts\cp_mp\execution
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6af
// Size: 0x9
function enableexecutionvictimwrapper() {
    self enableexecutionvictim();
}

// Namespace execution / scripts\cp_mp\execution
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c0
// Size: 0x9
function disableexecutionvictimwrapper() {
    self disableexecutionvictim();
}

// Namespace execution / scripts\cp_mp\execution
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d1
// Size: 0x1a7
function execution_loadtable() {
    level.execution.table = [];
    foreach (executionref in namespace_465d40bb08a5337a::function_232a4826a2bd2bfd()) {
        struct = spawnstruct();
        struct.ref = executionref;
        id = namespace_465d40bb08a5337a::function_3daf6bb451cf826e(executionref);
        assertex(isdefined(id), "Executions error -  \"" + executionref + "\" has no id.");
        struct.id = int(id);
        execution = namespace_465d40bb08a5337a::function_75322d3c8f9c9ccb(executionref);
        assertex(isdefined(execution) && execution != "", "Executions error -  \"" + executionref + "\" has no execution.");
        if (execution != "none") {
            struct.execution = execution;
        }
        propweapon = namespace_465d40bb08a5337a::function_3bd82b573b8f64f3(executionref);
        assertex(isdefined(propweapon) && propweapon != "", "Executions error -  \"" + executionref + "\" has no prop weapon.");
        if (propweapon != "none") {
            struct.propweapon = makeweapon(propweapon);
            if (execution == "execution_062") {
                struct.propweapon2 = "iw9_execution_spear_wings";
            }
            if (isnullweapon(struct.propweapon)) {
                continue;
            }
        }
        level.execution.table[executionref] = struct;
    }
}

// Namespace execution / scripts\cp_mp\execution
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x880
// Size: 0x55
function execution_getexecutionbyref(ref) {
    assertex(isdefined(level.execution), "execution_getExecutionByRef called before execution_init.");
    struct = level.execution.table[ref];
    if (isdefined(struct)) {
        return struct.execution;
    }
    return undefined;
}

// Namespace execution / scripts\cp_mp\execution
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8de
// Size: 0x55
function execution_getpropweaponbyref(ref) {
    assertex(isdefined(level.execution), "execution_getPropWeaponByRef called before execution_init.");
    struct = level.execution.table[ref];
    if (isdefined(struct)) {
        return struct.propweapon;
    }
    return undefined;
}

// Namespace execution / scripts\cp_mp\execution
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93c
// Size: 0x16
function execution_getrefbyplayer(player) {
    return player.executionref;
}

// Namespace execution / scripts\cp_mp\execution
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95b
// Size: 0x54
function execution_getidbyref(ref) {
    assertex(isdefined(level.execution), "execution_getIDByRef called before execution_init.");
    struct = level.execution.table[ref];
    if (isdefined(struct)) {
        return struct.id;
    }
}

// Namespace execution / scripts\cp_mp\execution
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b7
// Size: 0x5c
function function_700277400dcb7857(ref) {
    assertex(isdefined(level.execution), "execution_getIDByRef called before execution_init.");
    if (!isdefined(ref)) {
        return 0;
    }
    struct = level.execution.table[ref];
    if (isdefined(struct)) {
        return istrue(struct.petenabled);
    }
}

// Namespace execution / scripts\cp_mp\execution
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1b
// Size: 0x15
function function_43a90e553f84c31c() {
    scripts\common\values::set("pet_execution", "hide_operator_backpack", 1);
}

// Namespace execution / scripts\cp_mp\execution
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa38
// Size: 0x6d
function execution_blockladders() {
    if (self isonladder()) {
        if (!istrue(self.ladderexecutionblocked)) {
            val::set("ladderExecution", "execution_attack", 0);
            val::set("ladderExecution", "execution_victim", 0);
            self.ladderexecutionblocked = 1;
        }
        return;
    }
    if (istrue(self.ladderexecutionblocked)) {
        val::reset_all("ladderExecution");
        self.ladderexecutionblocked = undefined;
    }
}

// Namespace execution / scripts\cp_mp\execution
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaad
// Size: 0x82
function watchinexecution() {
    self endon("disconnect");
    self notify("watchInExecution");
    self endon("watchInExecution");
    var_a9ee87cc06bd6b39 = 0;
    while (true) {
        inexecution = self isinexecutionattack() || self isinexecutionvictim();
        if (inexecution != var_a9ee87cc06bd6b39 && !scripts\common\utility::isusingremote()) {
            if (inexecution) {
                self enablephysicaldepthoffieldscripting();
                self setphysicaldepthoffield(2.5, 60, 20, 20);
            } else {
                self disablephysicaldepthoffieldscripting();
            }
        }
        var_a9ee87cc06bd6b39 = inexecution;
        waitframe();
    }
}

// Namespace execution / scripts\cp_mp\execution
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb37
// Size: 0x12
function is_in_takedown() {
    return self isinexecutionvictim() || self isinexecutionattack();
}
