// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;

#namespace interactable;

// Namespace interactable / scripts/asm/soldier/interactable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x100
// Size: 0x14
function onlevelload() {
    registerinteractable("example", &run_example_interactable);
}

// Namespace interactable / scripts/asm/soldier/interactable
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x11b
// Size: 0x75
function run_example_interactable(asmname, statename, animationdata) {
    iprintlnbold("Example Interactable is Running.");
    covernode = scripts/asm/asm_bb::bb_getcovernode();
    /#
        assert(covernode);
    #/
    self aiclearanim(asm_getbodyknob(), 0.2);
    self setflaggedanimknobrestart(statename, animationdata, 1, 0.2, 1);
    asm_donotetracks(asmname, statename);
}

// Namespace interactable / scripts/asm/soldier/interactable
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x197
// Size: 0x38
function registerinteractable(interactable, func) {
    if (!isdefined(level.interactables)) {
        level.interactables = [];
    }
    level.interactables[interactable] = func;
}

// Namespace interactable / scripts/asm/soldier/interactable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d6
// Size: 0x2a
function disableinteractable() {
    /#
        assert(isnode(self));
    #/
    if (isdefined(self.interaction)) {
        self.disableinteraction = 1;
    }
}

// Namespace interactable / scripts/asm/soldier/interactable
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x207
// Size: 0x5e
function shouldplayinteractable(asmname, statename, tostatename, params) {
    covernode = scripts/asm/asm_bb::bb_getcovernode();
    if (isdefined(covernode) && isdefined(covernode.interactable) && !isdefined(covernode.disableinteraction)) {
        return true;
    }
    return false;
}

// Namespace interactable / scripts/asm/soldier/interactable
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x26d
// Size: 0x30
function interactablefinished(asmname, statename, tostatename, params) {
    return asm_eventfired(asmname, "interactable_finished");
}

// Namespace interactable / scripts/asm/soldier/interactable
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2a5
// Size: 0x5f
function chooseaniminteractable(asmname, statename, params) {
    covernode = scripts/asm/asm_bb::bb_getcovernode();
    /#
        assert(isdefined(covernode));
    #/
    /#
        assert(isdefined(covernode.interactable));
    #/
    return asm_lookupanimfromalias(statename, covernode.interactable);
}

// Namespace interactable / scripts/asm/soldier/interactable
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x30c
// Size: 0xd5
function playinteractable(asmname, statename, params) {
    self endon(statename + "_finished");
    animations = asm_getanim(asmname, statename);
    covernode = scripts/asm/asm_bb::bb_getcovernode();
    /#
        assert(isdefined(covernode));
    #/
    /#
        assert(isdefined(covernode.interactable));
    #/
    /#
        assertex(isdefined(level.interactables[covernode.interactable]), "Interactable " + covernode.interactable + " not registered!");
    #/
    covernode.disableinteraction = 1;
    [[ level.interactables[covernode.interactable] ]](asmname, statename, animations);
    asm_fireevent(asmname, "interactable_finished");
}

// Namespace interactable / scripts/asm/soldier/interactable
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3e8
// Size: 0x1c
function interactableterminate(asmname, statename, params) {
    
}

