// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3433ee6b63c7e243;
#using scripts\asm\asm_mp.gsc;
#using scripts\anim\face.gsc;
#using script_6fba7df440c493c4;
#using scripts\mp\mp_agent.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using script_371b4c2ab5861e62;

#namespace agent_init;

// Namespace agent_init/namespace_e8f3f30f2d3e4a89
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b
// Size: 0x70
function agent_init() {
    if (isdefined(anim.notfirsttime)) {
        return;
    }
    anim.notfirsttime = 1;
    initanimvars();
    function_a2b8f8b0891ee7fe();
    initmeleecharges();
    initwindowtraverse();
    setuprandomtable();
    init_squadmanager();
    setupgrenades();
    initanimcallbacks();
    function_5fa77e68e934eda2();
    initstealthfuncsmp();
    namespace_166dc34a2c7481df::initlevelface();
    namespace_68d1bc1bac7da538::vehicleaniminit();
}

// Namespace agent_init/namespace_e8f3f30f2d3e4a89
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d2
// Size: 0x2d
function setupgrenades() {
    function_b4ebe6632d7e8efe(undefined, "lethal", randomintrange(0, 20000));
    function_b4ebe6632d7e8efe(undefined, "tactical", randomintrange(0, 20000));
}

// Namespace agent_init/namespace_e8f3f30f2d3e4a89
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x206
// Size: 0x2f
function initanimcallbacks() {
    if (!isdefined(anim.callbacks)) {
        anim.callbacks = [];
    }
    anim.callbacks["PlaySoundAtViewHeight"] = &play_sound_at_viewheightmp;
}

// Namespace agent_init/namespace_e8f3f30f2d3e4a89
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c
// Size: 0x71
function function_5fa77e68e934eda2() {
    registersharedfunc("ai", "onHumanoidAgentKilledCommon_SharedFunc", &namespace_34f6a6adabfc542d::on_humanoid_agent_killed_common);
    registersharedfunc("ai", "spawnNewAIType_SharedFunc", &namespace_34f6a6adabfc542d::spawnnewagentaitype);
    registersharedfunc("ai", "Animscripted_SharedFunc", &namespace_aaebfc23308fe5e4::function_577d8abff6067c23);
    registersharedfunc("ai", "get_aitype_by_subclass_SharedFunc", &namespace_14d36171baccf528::function_3290e192ac188e2d);
    registersharedfunc("ai", "GetFreeAICount", &function_2df8a33395b87f);
}

// Namespace agent_init/namespace_e8f3f30f2d3e4a89
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b4
// Size: 0x8
function private function_2df8a33395b87f() {
    return getfreeagentcount();
}

// Namespace agent_init/namespace_e8f3f30f2d3e4a89
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c4
// Size: 0x48
function play_sound_at_viewheightmp(aliasname, var_b1a4e9fa39b3858a, var_a68adbd3eefe9282) {
    if (!isdefined(aliasname)) {
        return;
    }
    if (!soundexists(aliasname)) {
        return;
    }
    self playsoundatviewheight(aliasname);
    if (isdefined(var_b1a4e9fa39b3858a)) {
        wait(lookupsoundlength(aliasname) / 1000);
        self notify(var_b1a4e9fa39b3858a);
    }
}

// Namespace agent_init/namespace_e8f3f30f2d3e4a89
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x313
// Size: 0x11
function initstealthfuncsmp() {
    level.stealthinit = &initstealthmp;
}

// Namespace agent_init/namespace_e8f3f30f2d3e4a89
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32b
// Size: 0x4
function getcorpsearraymp() {
    return [];
}

// Namespace agent_init/namespace_e8f3f30f2d3e4a89
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x337
// Size: 0x3
function setcorpseremovetimerfuncmp() {
    
}

// Namespace agent_init/namespace_e8f3f30f2d3e4a89
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x341
// Size: 0x1f
function initstealthmp() {
    level.fngetcorpsearrayfunc = &getcorpsearraymp;
    level.fnsetcorpseremovetimerfunc = &setcorpseremovetimerfuncmp;
}
