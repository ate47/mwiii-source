#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;

#namespace namespace_b5630838e70308f0;

// Namespace namespace_b5630838e70308f0 / namespace_d770a833d61aefa1
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x108
// Size: 0x17
function autoexec main() {
    scripts\mp\gametypes\br_publicevents::function_dbc8f6cb3760cd82(%"stronghold", &init);
}

// Namespace namespace_b5630838e70308f0 / namespace_d770a833d61aefa1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x127
// Size: 0x4f
function init(eventinfo) {
    eventinfo.validatefunc = &validatefunc;
    eventinfo.activatefunc = &activatefunc;
    eventinfo.waitfunc = &waitfunc;
    eventinfo.postinitfunc = &postinitfunc;
}

// Namespace namespace_b5630838e70308f0 / namespace_d770a833d61aefa1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17e
// Size: 0xb
function postinitfunc() {
    level thread function_1386247d217a2b2e();
}

// Namespace namespace_b5630838e70308f0 / namespace_d770a833d61aefa1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x191
// Size: 0x2d
function function_1386247d217a2b2e() {
    level endon("br_stronghold_pe_start");
    level waittill_any_2("br_pe_start", "br_pe_no_event");
    level.var_b098cf330b024cb9 = 0;
    level notify("br_stronghold_pe_start");
}

// Namespace namespace_b5630838e70308f0 / namespace_d770a833d61aefa1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c6
// Size: 0x4
function validatefunc() {
    return true;
}

// Namespace namespace_b5630838e70308f0 / namespace_d770a833d61aefa1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d3
// Size: 0x2d
function waitfunc() {
    level endon("game_ended");
    level endon("cancel_public_event");
    waittime = getdvarfloat(@"hash_ea37831ad1304a1c", 0);
    wait waittime;
}

// Namespace namespace_b5630838e70308f0 / namespace_d770a833d61aefa1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x208
// Size: 0x11
function activatefunc() {
    level endon("game_ended");
    level notify("br_stronghold_pe_start");
}
