// mwiii decomp prototype
#using scripts\aitypes\bt_util.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\aitypes\combat.gsc;
#using scripts\anim\weaponlist.gsc;
#using scripts\engine\trace.gsc;

#namespace cover;

// Namespace cover/namespace_2c5796be89e7d85b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x114
// Size: 0x16
function getcoverstate() {
    return self._blackboard.coverstate;
}

// Namespace cover/namespace_2c5796be89e7d85b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x132
// Size: 0x30
function shouldlookforinitialcover(taskid) {
    if (isdefined(self.fnshouldlookforcover)) {
        return self [[ self.fnshouldlookforcover ]](taskid);
    }
    return anim.failure;
}

// Namespace cover/namespace_2c5796be89e7d85b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16a
// Size: 0x30
function lookforinitialcover(taskid) {
    if (isdefined(self.fnlookforcover)) {
        return self [[ self.fnlookforcover ]](taskid);
    }
    return anim.failure;
}

// Namespace cover/namespace_2c5796be89e7d85b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a2
// Size: 0xed
function lookforbettercover_internal(var_1fe63b952fe3ee08, var_30b84a9cb603754f, var_66fca63b388f049) {
    if (self.arriving) {
        return 0;
    }
    if (!isdefined(var_30b84a9cb603754f)) {
        var_30b84a9cb603754f = 0;
    }
    if (self.doingambush) {
        node = self ambushgetnextambushnode();
    } else {
        if (!isdefined(var_66fca63b388f049) && usingmg()) {
            var_66fca63b388f049 = %"cover_lmg";
        }
        node = self findbestcovernode(var_66fca63b388f049, var_30b84a9cb603754f);
    }
    if (isdefined(node)) {
        if (!isdefined(self.node) || node != self.node || isdefined(var_1fe63b952fe3ee08) && node != var_1fe63b952fe3ee08) {
            if (self usecovernodeifpossible(node)) {
                if (self.doingambush) {
                    if (self ambushcheckpath(node)) {
                        return 1;
                    } else {
                        self clearpath();
                        self.keepclaimednodeifvalid = 0;
                        self.keepclaimednode = 0;
                        return 0;
                    }
                }
                return 1;
            }
        }
    }
    return 0;
}

// Namespace cover/namespace_2c5796be89e7d85b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x297
// Size: 0x34
function update(task) {
    covernode = self.covernode;
    /#
        assert(isdefined(covernode));
    #/
    return anim.success;
}

// Namespace cover/namespace_2c5796be89e7d85b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d3
// Size: 0x15
function isdoingambush(task) {
    return self.doingambush;
}

// Namespace cover/namespace_2c5796be89e7d85b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f0
// Size: 0x23
function updatehide(task) {
    self setcoverstate("hide", 1);
    return anim.success;
}

// Namespace cover/namespace_2c5796be89e7d85b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31b
// Size: 0x52
function function_a7f24f5dd4325ccf() {
    /#
        var_8a31cf5f87747a = getdvarint(@"hash_cc4c9095ab9f206f", 0);
        var_d521ebb7eaf92fd7 = getdvarint(@"hash_932e9550632df2cb");
        return var_8a31cf5f87747a == 1 && (var_d521ebb7eaf92fd7 == -1 || var_d521ebb7eaf92fd7 == self getentitynumber());
    #/
}

// Namespace cover/namespace_2c5796be89e7d85b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x374
// Size: 0x22
function function_1155b804efae0b2a(reason) {
    /#
        if (function_a7f24f5dd4325ccf()) {
            self.var_1155b804efae0b2a = reason;
        }
    #/
}

// Namespace cover/namespace_2c5796be89e7d85b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x39d
// Size: 0x4f
function shouldreload(task, params) {
    /#
        assert(isdefined(params));
    #/
    if (self.bulletsinclip > weaponclipsize(self.weapon) * params) {
        return anim.failure;
    }
    return anim.success;
}

// Namespace cover/namespace_2c5796be89e7d85b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f4
// Size: 0xc
function terminatehide(task) {
    
}

// Namespace cover/namespace_2c5796be89e7d85b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x407
// Size: 0x14b
function shouldchangestanceforfun(task) {
    if (!isdefined(self.enemy)) {
        return anim.failure;
    }
    if (isdefined(self.rambochance) && self.currentpose == "stand") {
        return anim.failure;
    }
    if (self.node.type != "Cover Right" && self.node.type != "Cover Left") {
        return anim.failure;
    }
    if (isnodecover3d(self.node)) {
        return anim.failure;
    }
    if (self.currentpose == "stand" && !self.node doesnodeallowstance("crouch")) {
        return anim.failure;
    }
    if (self.currentpose == "crouch" && !self.node doesnodeallowstance("stand")) {
        return anim.failure;
    }
    if (!isdefined(self.var_58b37dad6411f81)) {
        setcoverchangestanceforfuntime();
    }
    if (gettime() < self.var_58b37dad6411f81) {
        return anim.failure;
    }
    return anim.success;
}

// Namespace cover/namespace_2c5796be89e7d85b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x55a
// Size: 0x1d
function setcoverchangestanceforfuntime() {
    self.var_58b37dad6411f81 = gettime() + randomintrange(5000, 20000);
}

// Namespace cover/namespace_2c5796be89e7d85b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x57e
// Size: 0xb3
function hasroomtofullexposecorner(node) {
    var_16f58e6bcebc24ca = 36;
    checkpos = node.origin;
    if (isnodecoverright(node)) {
        checkpos = checkpos + anglestoright(node.angles) * var_16f58e6bcebc24ca;
    } else {
        checkpos = checkpos + anglestoleft(node.angles) * var_16f58e6bcebc24ca;
    }
    if (!self maymovecheckfriendlyfire(checkpos)) {
        return 0;
    }
    if (!ispointonnavmesh(checkpos, self, 1)) {
        return 0;
    }
    if (!capsule_trace_passed(node.origin, checkpos, 15, 36, (0, 0, 0), self, create_character_contents())) {
        return 0;
    }
    return 1;
}

// Namespace cover/namespace_2c5796be89e7d85b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x639
// Size: 0x86
function updatealwayscoverexposed(taskid) {
    if (self.balwayscoverexposed) {
        if (self.health < self.maxhealth * 0.75) {
            self.balwayscoverexposed = 0;
        } else if (isdefined(self._blackboard.scriptableparts) && self._blackboard.scriptableparts.size >= 2) {
            self.balwayscoverexposed = 0;
        }
    }
    return anim.success;
}

// Namespace cover/namespace_2c5796be89e7d85b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c7
// Size: 0x173
function updatecovercroucharrivaltype(taskid) {
    if (!isdefined(self.node) || self.node.type != "Cover Crouch") {
        self._blackboard.croucharrivaltype = undefined;
        self._blackboard.croucharrivalnode = undefined;
        return anim.success;
    }
    if (!isdefined(self._blackboard.croucharrivaltype) || self._blackboard.croucharrivalnode != self.node) {
        pathdisttogoal = self pathdisttogoal();
        if (pathdisttogoal > 0 && pathdisttogoal < 512) {
            covertype = getdvar(@"hash_f72dde9792b94cc9");
            if (isdefined(self.node.covercrouchtype)) {
                covertype = self.node.covercrouchtype;
                if (covertype != "Cover Right Crouch" && covertype != "Cover Left Crouch" && covertype != "Cover Crouch") {
                    covertype = undefined;
                }
            } else if (covertype == "") {
                covertype = undefined;
            }
            self._blackboard.croucharrivalnode = self.node;
            self._blackboard.croucharrivaltype = covertype;
        }
    }
    return anim.success;
}
