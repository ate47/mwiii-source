// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\anim\utility_common.gsc;
#using script_7e4d332e911e1b90;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;

#namespace script_funcs;

// Namespace script_funcs / scripts/asm/gesture/script_funcs
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x98
// Size: 0x38
function ai_gesture_requested(asmname, statename, tostatename, params) {
    return istrue(self._blackboard.gesture_active);
}

// Namespace script_funcs / scripts/asm/gesture/script_funcs
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd8
// Size: 0x38
function ai_point_gesture_requested(asmname, statename, tostatename, params) {
    return istrue(self._blackboard.point_gesture_active);
}

// Namespace script_funcs / scripts/asm/gesture/script_funcs
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x118
// Size: 0xe
function ai_lookat_hold() {
    self.hold_lookat = 1;
}

// Namespace script_funcs / scripts/asm/gesture/script_funcs
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d
// Size: 0xd
function ai_lookat_release() {
    self.hold_lookat = undefined;
}

// Namespace script_funcs / scripts/asm/gesture/script_funcs
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x141
// Size: 0x18
function ai_can_lookat() {
    if (isdefined(self.hold_lookat)) {
        return 0;
    }
    return 1;
}

// Namespace script_funcs / scripts/asm/gesture/script_funcs
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x160
// Size: 0x39
function float_remap(value, from1, to1, from2, to2) {
    return (value - from1) / (to1 - from1) * (to2 - from2) + from2;
}

// Namespace script_funcs / scripts/asm/gesture/script_funcs
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a1
// Size: 0x23
function lerp_float(from, to, delta) {
    return from + delta * (to - from);
}

// Namespace script_funcs / scripts/asm/gesture/script_funcs
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc
// Size: 0x3f
function smoothstep(start, end, delta) {
    delta = clamp((delta - start) / (end - start), 0, 1);
    return delta * delta * (3 - 2 * delta);
}

