// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\anim\animselector.gsc;

#namespace asm;

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb7
// Size: 0x28
function function_c051a94f99bd65f1(asmname) {
    self asminstantiate(asmname);
    self.asmasset = undefined;
    self.animationarchetype = undefined;
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbe6
// Size: 0x63
function asm_getfunction(asmname, funcid) {
    /#
        assertex(isdefined(anim.asmfuncs[asmname]), "ASMRegister was not called on ASM " + asmname);
    #/
    /#
        assertex(isdefined(anim.asmfuncs[asmname][funcid]), "Unable to find asm func " + funcid + " in ASM " + asmname);
    #/
    return anim.asmfuncs[asmname][funcid];
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc51
// Size: 0x8
function asm_getgenerichandler() {
    return &asm_generichandler;
}

// Namespace asm / scripts/asm/asm
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc61
// Size: 0x42
function asm_setupaim(asmname, statename, blendtime, use_5) {
    if (isdefined(self.fnasm_setupaim)) {
        self [[ self.fnasm_setupaim ]](asmname, statename, blendtime, use_5);
    }
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcaa
// Size: 0x154
function asm_settransitionorientmode(orient_mode) {
    if (!isai(self)) {
        return;
    }
    switch (orient_mode) {
    case #"hash_96a6a25bd7beed30":
        var_8e1451b5845405b1 = 1024;
        if (actor_is3d()) {
            var_5e1cf0a9046f6f99 = self.angles;
            if (isdefined(self.node) && distancesquared(self.origin, self.node.origin) < var_8e1451b5845405b1) {
                var_5e1cf0a9046f6f99 = self function_f134f30c17faeaf(self.node);
            }
            self orientmode("face angle 3d", var_5e1cf0a9046f6f99);
        } else {
            yaw = self.angles[1];
            if (isdefined(self.node) && distancesquared(self.origin, self.node.origin) < var_8e1451b5845405b1) {
                yaw = getnodeforwardyaw(self.node);
            }
            self orientmode("face angle", yaw);
        }
        break;
    case #"hash_579a1f64b8b40d31":
        self orientmode("face angle 3d", self.angles);
        break;
    default:
        self orientmode(orient_mode);
        break;
    }
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe05
// Size: 0x31
function asm_settransitionanimmode(anim_mode) {
    if (isdefined(self.fnasm_setanimmode)) {
        self [[ self.fnasm_setanimmode ]](anim_mode);
        return;
    }
    self animmode(anim_mode, 0);
}

// Namespace asm / scripts/asm/asm
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3d
// Size: 0xe2
function asm_generichandler(handlername, asmname, param1, param2, param3) {
    switch (handlername) {
    case #"hash_fc8a71042f2cb15b":
        asm_setupaim(asmname, param1, 0.2, undefined);
        break;
    case #"hash_db521e4972a48a9d":
        customhandler = asm_getnotehandler(asmname, undefined);
        val = [[ self.fnasm_handlenotetrack ]](param2, param1, customhandler, undefined);
        if (!isdefined(val)) {
            val = asm_handlenewnotetracks(asmname, param2, param1);
        }
        if (isdefined(val) && !asm_eventfired(asmname, "end")) {
            asm_fireevent(asmname, "end");
        }
        break;
    default:
        /#
            assertmsg("unknown handler: " + handlername);
        #/
        break;
    }
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf26
// Size: 0x5a
function asm_setoverrideparams(asmname, params) {
    /#
        assert(isdefined(anim.asmparams));
    #/
    /#
        assert(isdefined(anim.asmparams[asmname]));
    #/
    var_c237adaa8f06b26b = 9999;
    anim.asmparams[asmname][var_c237adaa8f06b26b] = params;
    return var_c237adaa8f06b26b;
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf88
// Size: 0x1b
function asm_globalinit() {
    if (isdefined(anim.asm)) {
        return;
    }
    anim.asm = [];
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfaa
// Size: 0x26
function asm_fireephemeralevent(eventtarget, eventname, params) {
    self asmfireephemeralevent(eventtarget, eventname, params);
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd7
// Size: 0x35
function asm_init_blackboard() {
    if (isdefined(self._blackboard)) {
        return;
    }
    self._blackboard = self getaiblackboard();
    self._blackboard.bfire = 0;
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1013
// Size: 0x7f
function asm_terminateandreplace(var_f48b8938602f359b, var_388552599bfcb74) {
    self asmterminate();
    self clearaiblackboard();
    self._blackboard = undefined;
    self notify("asm_terminated");
    self.var_a709fbd9fea148f6 = undefined;
    if (!isdefined(var_388552599bfcb74)) {
        var_388552599bfcb74 = self.animsetname;
    }
    var_2a6dba1cf4fb4026 = tolower(var_f48b8938602f359b);
    asm_init_blackboard();
    self [[ self.fnasm_init ]](var_2a6dba1cf4fb4026, var_388552599bfcb74);
    self.var_a942dd31d55102c9 = var_2a6dba1cf4fb4026;
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1099
// Size: 0x4e
function asm_getnotehandler(asmname, statename) {
    noteid = self asmgetnotehandler(asmname);
    if (!isdefined(noteid)) {
        return undefined;
    }
    if (isint(noteid)) {
        if (noteid != -1) {
            return anim.asmfuncs[asmname][noteid];
        }
        return undefined;
    }
    return noteid;
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ef
// Size: 0x2c
function asm_currentstatehasflag(asmname, flagname) {
    if (istrue(self.var_15b9736ae2dde804)) {
        return 1;
    }
    return self asmcurrentstatehasflag(asmname, flagname);
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1123
// Size: 0x26
function asm_fireevent_internal(asmname, eventname, params) {
    self asmfireevent(asmname, eventname, params);
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1150
// Size: 0x4b
function asm_fireevent(asmname, eventname, params) {
    asm_fireevent_internal(asmname, eventname, params);
    if (eventname == "anim_will_finish" || eventname == "finish") {
        eventname = "end";
        asm_fireevent_internal(asmname, eventname);
    }
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a2
// Size: 0x37
function asm_ephemeraleventfired(eventtarget, eventname, var_bd6b21f67400a4) {
    bfired = self asmephemeraleventfired(eventtarget, eventname);
    if (bfired) {
        return true;
    }
    return false;
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e1
// Size: 0x1e
function asm_eventfiredrecently(asmname, eventname) {
    return self asmeventfiredwithin(asmname, eventname, 50);
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1207
// Size: 0x1c
function asm_geteventtime(asmname, eventname) {
    return self asmgeteventtime(asmname, eventname);
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x122b
// Size: 0x1c
function asm_geteventdata(asmname, eventname) {
    return self asmgeteventdata(asmname, eventname);
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124f
// Size: 0x1c
function asm_getephemeraleventdata(eventtarget, eventname) {
    return self asmgetephemeraleventdata(eventtarget, eventname);
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1273
// Size: 0xa
function asm_clearallephemeralevents() {
    self asmclearephemeralevents();
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1284
// Size: 0xa0
function asm_shouldpowerdown(asmname, currentstate) {
    if (!isdefined(self.bpowerdown) || !self.bpowerdown) {
        return false;
    }
    if (isdefined(self.asm.bpowereddown) && self.asm.bpowereddown) {
        return false;
    }
    if (!isalive(self)) {
        return false;
    }
    if (bb_isanimscripted()) {
        return false;
    }
    if (isdefined(self._blackboard.btraversing)) {
        return false;
    }
    if (self.in_melee) {
        return false;
    }
    return true;
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132c
// Size: 0x1c
function asm_eventfired(asmname, eventname) {
    return self asmeventfired(asmname, eventname);
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1350
// Size: 0x25
function asm_checktransitions(asmname, currentstatename, var_7bb056e0e335a770) {
    self asmtick(1);
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137c
// Size: 0x5f
function asm_setstate(tostatename, params) {
    if (self asmhasstate(self.asmname, tostatename)) {
        if (isdefined(anim.callbacks["StopAnimscripted"])) {
            self [[ anim.callbacks["StopAnimscripted"] ]]();
        }
        self asmsetstate(self.asmname, tostatename, params);
    }
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e2
// Size: 0x6b
function function_ac90fa5cc0a80298(state_name, params) {
    current = self asmgetcurrentstate(self.asmname);
    if (current != state_name) {
        if (isdefined(anim.callbacks["StopAnimscripted"])) {
            self [[ anim.callbacks["StopAnimscripted"] ]]();
        }
        self asmsetstate(self.asmname, state_name);
    }
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1454
// Size: 0x11
function asm_tick() {
    /#
        assertmsg("This ent is using the completely obsolete script-driven ASM!");
    #/
}

// Namespace asm / scripts/asm/asm
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x146c
// Size: 0x50
function highestallowedstance(asmname, statename, tostatename, stance) {
    /#
        assert(isdefined(stance));
    #/
    highestallowedstance = gethighestallowedstance();
    if (isdefined(highestallowedstance) && highestallowedstance != stance) {
        return false;
    }
    return true;
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c4
// Size: 0x16
function asm_getdemeanor() {
    return self._blackboard.movetype;
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e2
// Size: 0x3
function asm_updatefrantic() {
    
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ec
// Size: 0x4
function asm_isfrantic() {
    return false;
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14f8
// Size: 0x17
function asm_iscrawlmelee() {
    return isdefined(self.asm.crawlmelee);
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1517
// Size: 0x21
function asm_setcrawlmelee(val) {
    self.asm.crawlmelee = val;
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x153f
// Size: 0x35
function asm_setdemeanoranimoverride(demeanor, override, anime) {
    self.asm.animoverrides[demeanor][override] = anime;
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x157b
// Size: 0x36
function asm_cleardemeanoranimoverride(demeanor, override) {
    if (asm_hasdemeanoranimoverride(demeanor, override)) {
        self.asm.animoverrides[demeanor][override] = undefined;
    }
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b8
// Size: 0x46
function asm_hasdemeanoranimoverride(demeanor, override) {
    return isdefined(self.asm.animoverrides[demeanor]) && isdefined(self.asm.animoverrides[demeanor][override]);
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1606
// Size: 0x3c
function asm_getdemeanoranimoverride(demeanor, override) {
    /#
        assert(asm_hasdemeanoranimoverride(demeanor, override));
    #/
    return self.asm.animoverrides[demeanor][override];
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164a
// Size: 0x13
function asm_getcurrentstate(asmname) {
    return self asmgetcurrentstate(asmname);
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1665
// Size: 0x50
function asm_hasalias(statename, alias) {
    arcname = function_2285421dfc79c4d5();
    /#
        assertex(isdefined(arcname), "AI does not have archetype defined.");
    #/
    animresult = archetypegetrandomalias(arcname, statename, alias, asm_isfrantic());
    return isdefined(animresult);
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16bd
// Size: 0x91
function asm_getanim(asmname, statename, params) {
    if (isarray(params)) {
        if (params.size == 1) {
            return self asmgetanim(asmname, statename, params[0]);
        } else if (params.size == 2) {
            return self asmgetanim(asmname, statename, params[0], params[1]);
        } else if (params.size == 3) {
            return self asmgetanim(asmname, statename, params[0], params[1], params[2]);
        } else {
            /#
                assertmsg("what gsc needs is some varargs and array flatten functionality.");
            #/
        }
        return;
    }
    return self asmgetanim(asmname, statename, params);
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1755
// Size: 0x2e
function asm_getrandomanim(asmname, statename) {
    var_b6648a33085e43a = asm_getrandomalias(statename);
    return asm_lookupanimfromalias(statename, var_b6648a33085e43a);
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178b
// Size: 0x63
function asm_getrandomalias(statename) {
    aliases = archetypegetaliases(self.animsetname, statename);
    /#
        assertex(aliases.size > 0, "No aliases found in archetype state '" + self.animsetname + "->" + statename + "' for " + self.classname);
    #/
    return aliases[randomint(aliases.size)];
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f6
// Size: 0x52
function function_c1bf21c5e8625ea(statename, alias) {
    arcname = self.basearchetype;
    /#
        assertex(isdefined(arcname), "AI does not have base archetype defined.");
    #/
    animresult = archetypegetrandomalias(arcname, statename, alias, asm_isfrantic());
    return animresult;
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1850
// Size: 0x4f
function asm_lookupanimfromaliasifexists(statename, alias) {
    arcname = function_2285421dfc79c4d5();
    /#
        assertex(isdefined(arcname), "AI does not have archetype defined.");
    #/
    animresult = archetypegetrandomalias(arcname, statename, alias, asm_isfrantic());
    return animresult;
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a7
// Size: 0x92
function function_62d0bb5a77d09499(statename, alias) {
    arcname = self.basearchetype;
    /#
        assertex(isdefined(arcname), "AI does not have base archetype defined.");
    #/
    animresult = archetypegetrandomalias(arcname, statename, alias, asm_isfrantic());
    /#
        /#
            assertex(isdefined(animresult), "pass_right" + function_3c8848a3a11b2553(alias) + "head_fakeactor" + arcname + "iw7_sdfshotty" + statename + "gesture_on_me" + self.classname + "gesture_point_right");
        #/
    #/
    return animresult;
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1941
// Size: 0x8f
function asm_lookupanimfromalias(statename, alias) {
    arcname = function_2285421dfc79c4d5();
    /#
        assertex(isdefined(arcname), "AI does not have archetype defined.");
    #/
    animresult = archetypegetrandomalias(arcname, statename, alias, asm_isfrantic());
    /#
        /#
            assertex(isdefined(animresult), "pass_right" + function_3c8848a3a11b2553(alias) + "head_fakeactor" + arcname + "iw7_sdfshotty" + statename + "gesture_on_me" + self.classname + "gesture_point_right");
        #/
    #/
    return animresult;
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19d8
// Size: 0xe9
function asm_getallanimsforstate(statename) {
    /#
        assert(isdefined(self.animsetname));
    #/
    arc = self.animsetname;
    aliases = archetypegetaliases(arc, statename);
    anims = [];
    foreach (alias in aliases) {
        animdata = archetypegetalias(arc, statename, alias, 0);
        if (isarray(animdata.anims)) {
            anims = scripts/engine/utility::array_combine(anims, animdata.anims);
            continue;
        }
        anims[anims.size] = animdata.anims;
    }
    return anims;
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac9
// Size: 0x60
function asm_getallanimsforalias(archetype, statename, alias) {
    var_3a8e690b2371c6d2 = archetypegetalias(archetype, statename, alias, 1);
    if (!isdefined(var_3a8e690b2371c6d2)) {
        return undefined;
    }
    var_64c0e1b7d8039263 = var_3a8e690b2371c6d2.anims;
    if (!isarray(var_64c0e1b7d8039263)) {
        var_64c0e1b7d8039263 = [var_64c0e1b7d8039263];
    }
    return var_64c0e1b7d8039263;
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b31
// Size: 0x24
function asm_getallanimindicesforalias(statename, alias) {
    return animsetgetallanimindicesforalias(self.animsetname, statename, alias);
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5d
// Size: 0x89
function asm_playanimstate(asmname, statename, params) {
    self endon(statename + "_finished");
    animid = asm_getanim(asmname, statename);
    self aisetanim(statename, animid);
    asm_playfacialanim(asmname, statename, asm_getxanim(statename, animid));
    endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    if (endnote == "code_move") {
        endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    }
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1bed
// Size: 0x50
function function_74a66de812856ba(asmname, statename, params) {
    self endon(statename + "_finished");
    var_abe93f4471a03711 = float(params);
    thread asm_playanimstate(asmname, statename, params);
    wait(var_abe93f4471a03711);
    asm_fireevent(asmname, "end");
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c44
// Size: 0x31
function asm_hasknobs() {
    if (isagent(self) && !istrue(self.bsoldier) && self.unittype != "civilian") {
        return false;
    }
    return true;
}

// Namespace asm / scripts/asm/asm
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c7d
// Size: 0x267
function function_fb56c9527636713f(asmname, statename, playbackrate, ismovestate) {
    self endon(statename + "_finished");
    if (!isdefined(playbackrate)) {
        playbackrate = 1;
    }
    if (asm_hasknobs()) {
        bodyknob = asm_getbodyknob();
        if (isdefined(ismovestate) && ismovestate) {
            moveid = asm_lookupanimfromaliasifexists("knobs", "move");
            if (isdefined(moveid)) {
                moveknob = asm_getxanim("knobs", moveid);
                self setmoveanimknob(moveknob);
            }
        }
    }
    notehandler = asm_getnotehandler(asmname, statename);
    timestep = 0.2;
    bmovestate = isdefined(ismovestate) && ismovestate;
    brestart = 1;
    while (true) {
        loopanim = asm_getanim(asmname, statename);
        loopxanim = asm_getxanim(statename, loopanim);
        if (isdefined(ismovestate) && ismovestate) {
            playbackrate = asm_getmoveplaybackrate();
            self codemoveanimrate(playbackrate);
        }
        if (!bmovestate) {
            brestart = self aigetanimweight(loopxanim) == 0;
        }
        if (isnumber(loopanim)) {
            self aisetanim(statename, loopanim, playbackrate);
        } else {
            /#
                assertex(utility::issp(), "looped anims that are not in the animset (demeanor override?) is only supported by SP.");
            #/
            blankindex = asm_lookupanimfromalias(statename, "blank");
            self aisetanim(statename, blankindex);
            if (brestart) {
                self setflaggedanimrestart(statename, loopanim, 1, 0.2, playbackrate);
            } else {
                self setflaggedanim(statename, loopanim, 1, 0.2, playbackrate);
            }
        }
        if (bmovestate) {
            brestart = 0;
        }
        asm_playfacialanim(asmname, statename, loopxanim);
        animtime = getanimlength(loopxanim);
        if (animtime <= 0.05) {
            return;
        }
        lastnote = undefined;
        var_136f34daf1a3c277 = playbackrate;
        while (!isdefined(lastnote)) {
            lastnote = asm_donotetrackswithtimeout(asmname, statename, timestep, notehandler);
            if (!isdefined(lastnote) && bmovestate) {
                playbackrate = asm_getmoveplaybackrate();
                if (playbackrate != var_136f34daf1a3c277) {
                    self codemoveanimrate(playbackrate);
                    if (isnumber(loopanim)) {
                        self aisetanimrate(statename, loopanim, playbackrate);
                        continue;
                    }
                    self setanimrate(loopxanim, playbackrate);
                }
            }
        }
    }
}

// Namespace asm / scripts/asm/asm
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eeb
// Size: 0x102
function asm_lookupdirectionalfootanim(keypaddirection, asmname, statename, var_5217df91f13c7c48, optionalprefix) {
    prefix = "";
    if (isdefined(optionalprefix)) {
        prefix = optionalprefix;
    }
    if (var_5217df91f13c7c48) {
        if (asm_eventfiredrecently(asmname, "pass_left")) {
            prefixfoot = prefix + "left";
        } else if (asm_eventfiredrecently(asmname, "pass_right")) {
            prefixfoot = prefix + "right";
        } else if (self.asm.footsteps.foot == "right") {
            prefixfoot = prefix + "right";
        } else {
            prefixfoot = prefix + "left";
        }
    } else {
        prefixfoot = prefix;
    }
    animid = asm_lookupanimfromaliasifexists(statename, prefixfoot + keypaddirection);
    if (isdefined(animid)) {
        return animid;
    }
    if (prefix != prefixfoot) {
        animid = asm_lookupanimfromaliasifexists(statename, prefix + keypaddirection);
        if (isdefined(animid)) {
            return animid;
        }
    }
    return undefined;
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ff5
// Size: 0x16
function asm_setmoveplaybackrate(rate) {
    self.moveplaybackrate = rate;
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2012
// Size: 0xc
function asm_getmoveplaybackrate() {
    return self.moveplaybackrate;
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2026
// Size: 0x13
function asm_getcurrentstatename(asmname) {
    return self asmgetcurrentstate(asmname);
}

// Namespace asm / scripts/asm/asm
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2041
// Size: 0x11b
function asm_dosinglenotetrack(asmname, statename, customfunction, customparams, customflagname) {
    flagname = statename;
    if (isdefined(customflagname)) {
        flagname = customflagname;
    }
    notes = self waittill(flagname);
    if (!isdefined(notes)) {
        notes = ["undefined"];
    }
    if (!isarray(notes)) {
        notes = [notes];
    }
    /#
        assert(isdefined(self.fnasm_handlenotetrack));
    #/
    defined_val = undefined;
    foreach (note in notes) {
        asm_fireevent(asmname, note);
        val = [[ self.fnasm_handlenotetrack ]](note, flagname, customfunction, customparams);
        if (!isdefined(val)) {
            val = asm_handlenewnotetracks(asmname, note, statename);
        }
        if (isdefined(val)) {
            defined_val = val;
        }
    }
    return defined_val;
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2164
// Size: 0x8f
function asm_handlenewnotetracks(asmname, note, statename) {
    if (asm_tryhandledeathstatechangenotetrack(note)) {
        return;
    }
    switch (note) {
    case #"hash_3f80c02caeb2ec99":
        if (asm_currentstatehasflag(asmname, "notetrackAim")) {
            asm_setupaim(asmname, statename, 0.2);
        }
        break;
    case #"hash_9076111750d00173":
        self.var_5e9ef980ddc3f18e = 1;
        break;
    case #"hash_39f7ecb43786b597":
        self.var_5e9ef980ddc3f18e = 0;
        break;
    }
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21fa
// Size: 0x138
function asm_tryhandledeathstatechangenotetrack(notetrack) {
    if (!isstartstr(notetrack, "ds ")) {
        return false;
    }
    charindex = 3;
    /#
        assertex(notetrack[charindex] == "[", "Format for death state override notetrack should be 'ds [name] [param]'");
    #/
    self.asm.deathstateoverride = spawnstruct();
    charindex = charindex + 1;
    deathstate = "";
    while (charindex < notetrack.size && notetrack[charindex] != "]") {
        deathstate = deathstate + notetrack[charindex];
        charindex = charindex + 1;
    }
    self.asm.deathstateoverride.statename = deathstate;
    charindex = charindex + 1;
    if (charindex < notetrack.size) {
        /#
            assertex(notetrack[charindex] + notetrack[charindex + 1] == " [", "Format for death state override notetrack should be 'ds [name]' or 'ds [name] [param]'");
        #/
        charindex = charindex + 2;
        params = "";
        while (charindex < notetrack.size && notetrack[charindex] != "]") {
            params = params + notetrack[charindex];
            charindex = charindex + 1;
        }
        self.asm.deathstateoverride.params = params;
    }
    return true;
}

// Namespace asm / scripts/asm/asm
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x233a
// Size: 0x5e
function asm_donotetracksfortime(asmname, statename, time, customfunction, customparams) {
    var_24a91f52de25eb75 = statename + "_timeout";
    self endon(var_24a91f52de25eb75);
    childthread asm_donotetracksfortime_helper(var_24a91f52de25eb75, time);
    while (true) {
        asm_dosinglenotetrack(asmname, statename, customfunction, customparams);
    }
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239f
// Size: 0x25
function asm_donotetrackswithtimeout_helper(endonstring, notifystring, timeout) {
    self endon(endonstring);
    wait(timeout);
    self notify(notifystring);
}

// Namespace asm / scripts/asm/asm
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23cb
// Size: 0x7c
function asm_donotetrackswithtimeout(asmname, statename, timeout, customfunction, customparams) {
    var_24a91f52de25eb75 = statename + "_timeout";
    var_7386724c9bd1d65c = statename + "_endHelper";
    self endon(var_24a91f52de25eb75);
    childthread asm_donotetrackswithtimeout_helper(var_7386724c9bd1d65c, var_24a91f52de25eb75, timeout);
    retval = asm_donotetracks(asmname, statename, customfunction, customparams);
    self notify(var_7386724c9bd1d65c);
    return retval;
}

// Namespace asm / scripts/asm/asm
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244f
// Size: 0x81
function asm_donotetracks(asmname, statename, customfunction, customparams, customflagname, var_5c0d1cbfc351f2e1) {
    if (!isdefined(var_5c0d1cbfc351f2e1)) {
        var_5c0d1cbfc351f2e1 = 1;
    }
    for (;;) {
        val = asm_dosinglenotetrack(asmname, statename, customfunction, customparams, customflagname);
        if (isdefined(val)) {
            if (var_5c0d1cbfc351f2e1 && !asm_eventfired(asmname, "end")) {
                asm_fireevent(asmname, "end");
            }
            return val;
        }
    }
}

// Namespace asm / scripts/asm/asm
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d7
// Size: 0x153
function asm_donotetrackswithinterceptor(asmname, statename, interceptfunction, var_314a4fbce09143e7, customflagname) {
    /#
        assert(isdefined(interceptfunction));
    #/
    flagname = statename;
    if (isdefined(customflagname)) {
        flagname = customflagname;
    }
    for (;;) {
        notes = self waittill(flagname);
        if (!isdefined(notes)) {
            notes = ["undefined"];
        }
        if (!isarray(notes)) {
            notes = [notes];
        }
        defined_val = undefined;
        foreach (note in notes) {
            asm_fireevent(asmname, note);
            intercepted = [[ interceptfunction ]](statename, note, var_314a4fbce09143e7);
            if (isdefined(intercepted) && intercepted) {
                continue;
            }
            /#
                assert(isdefined(self.fnasm_handlenotetrack));
            #/
            val = [[ self.fnasm_handlenotetrack ]](note, statename, undefined, undefined);
            if (!isdefined(val)) {
                val = asm_handlenewnotetracks(asmname, note, statename);
            }
            if (isdefined(val)) {
                defined_val = val;
            }
        }
        if (isdefined(defined_val)) {
            return defined_val;
        }
    }
}

// Namespace asm / scripts/asm/asm
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2631
// Size: 0x8a
function asm_donotetrackssingleloop(asmname, statename, xanim, customfunction) {
    notifyname = statename + "_note_loop_end";
    self endon(notifyname);
    length = getanimlength(xanim);
    /#
        assertex(length > 0, "missing anim for state " + statename + " (anim " + xanim + " has length of 0)");
    #/
    thread asm_donotetrackssingleloop_waiter(notifyname, statename + "_finished", length);
    asm_donotetracks(asmname, statename, customfunction);
    self notify(notifyname);
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26c2
// Size: 0x36
function asm_donotetrackssingleloop_waiter(notifyname, endonname, time) {
    self endon("death");
    self endon("terminate_ai_threads");
    self endon(notifyname);
    self endon(endonname);
    wait(time);
    self notify(notifyname);
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26ff
// Size: 0x1a
function asm_donotetracksfortime_helper(notifystring, time) {
    wait(time);
    self notify(notifystring);
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2720
// Size: 0xbc
function asm_waitforaimnotetrack(asmname, statename, blendtime) {
    self endon(statename + "_finished");
    bdone = 0;
    while (!bdone) {
        notes = self waittill(statename);
        if (!isarray(notes)) {
            notes = [notes];
        }
        foreach (note in notes) {
            if (note == "start_aim") {
                asm_setupaim(asmname, statename, blendtime);
                bdone = 1;
                break;
            }
        }
    }
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e3
// Size: 0x1a5
function asm_lookuprandomalias(statename, optionalprefix, allownone) {
    /#
        assertex(isdefined(self.animsetname), "AI does not have archetype defined.");
    #/
    archetype = self.animsetname;
    aliases = archetypegetaliases(archetype, statename);
    possible = 0;
    chosen = undefined;
    prefixlen = -1;
    if (isdefined(optionalprefix)) {
        prefixlen = optionalprefix.size;
    }
    if (!isdefined(aliases)) {
        /#
            if (!istrue(allownone)) {
                msg = "gesture_point_down" + statename + "^1Warning: Unable to find matching negotiation_end_node for negotiation_start_node at " + archetype;
                if (isdefined(optionalprefix)) {
                    msg = msg + "animscript" + optionalprefix;
                }
                /#
                    assertmsg(msg);
                #/
            }
        #/
        return undefined;
    }
    foreach (aliasname in aliases) {
        if (prefixlen < 0 || getsubstr(aliasname, 0, prefixlen) == optionalprefix) {
            possible = possible + 1;
            chance = 1 / possible;
            if (randomfloat(1) <= chance) {
                chosen = aliasname;
            }
        }
    }
    /#
        if (!istrue(allownone) && !isdefined(chosen)) {
            msg = "gesture_point_down" + statename + "^1Warning: Unable to find matching negotiation_end_node for negotiation_start_node at " + archetype;
            if (isdefined(optionalprefix)) {
                msg = msg + "animscript" + optionalprefix;
            }
            /#
                assertmsg(msg);
            #/
        }
    #/
    return chosen;
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2990
// Size: 0xa7
function asm_chooseanim(asmname, statename, params) {
    if (!isdefined(params)) {
        var_b6648a33085e43a = asm_lookuprandomalias(statename);
        if (isdefined(var_b6648a33085e43a)) {
            return asm_lookupanimfromalias(statename, var_b6648a33085e43a);
        } else {
            /#
                assertmsg("ASM_ChooseAnim called with undefined alias and ASM_LookupRandomAlias failed to find an alias. ASM: " + asmname + " State: " + statename);
            #/
            return undefined;
        }
        return;
    }
    result = undefined;
    prefixstr = bb_getprefixstring(params);
    if (isdefined(prefixstr)) {
        var_b6648a33085e43a = asm_lookuprandomalias(statename, prefixstr);
        result = asm_lookupanimfromalias(statename, var_b6648a33085e43a);
    } else {
        result = asm_lookupanimfromalias(statename, params);
    }
    return result;
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a3e
// Size: 0x7c
function asm_clearfacialanim() {
    if (self.facialstate != "filler") {
        if (isai(self)) {
            self setfacialindex("none");
            return;
        }
        if (isdefined(self.var_5247d15da29e8539)) {
            facialknob = asm_lookupanimfromalias("knobs", "head_fakeactor");
            self clearanim(asm_getxanim("knobs", facialknob), 0.2);
            return;
        }
        setfacialindexfornonai("none");
    }
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ac1
// Size: 0x49
function asm_restorefacialanim() {
    asmname = self.asmname;
    statename = self asmgetcurrentstate(asmname);
    if (statename == "animscripted" || self function_e3dadb2823f1da8a(asmname)) {
        return;
    }
    asm_playfacialanim(asmname, statename, undefined);
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b11
// Size: 0x38
function asm_playfacialanim(asmname, statename, animname) {
    if (isdefined(self.fnasm_playfacialanim)) {
        [[ self.fnasm_playfacialanim ]](asmname, statename, animname);
    }
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b50
// Size: 0x5d
function asm_getroot() {
    /#
        assert(asm_hasknobs());
    #/
    animid = asm_lookupanimfromaliasifexists("knobs", "root");
    if (isdefined(animid)) {
        return asm_getxanim("knobs", animid);
    }
    animid = function_62d0bb5a77d09499("knobs", "root");
    return function_6aa159fc2f693af7("knobs", animid);
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb5
// Size: 0x4e
function asm_getbodyknob() {
    animid = asm_lookupanimfromaliasifexists("knobs", "body");
    if (isdefined(animid)) {
        return asm_getxanim("knobs", animid);
    }
    animid = function_62d0bb5a77d09499("knobs", "body");
    return function_6aa159fc2f693af7("knobs", animid);
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c0b
// Size: 0x5a
function asm_getinnerrootknob() {
    animid = asm_lookupanimfromaliasifexists("knobs", "inner_root");
    if (isdefined(animid)) {
        return asm_getxanim("knobs", animid);
    }
    animid = function_c1bf21c5e8625ea("knobs", "inner_root");
    if (isdefined(animid)) {
        return function_6aa159fc2f693af7("knobs", animid);
    }
    return asm_getbodyknob();
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c6d
// Size: 0x54
function asm_getfacialknob() {
    animid = asm_lookupanimfromaliasifexists("always_on", "facial");
    if (isdefined(animid)) {
        return asm_getxanim("always_on", animid);
    }
    animid = function_c1bf21c5e8625ea("always_on", "facial");
    if (isdefined(animid)) {
        return function_6aa159fc2f693af7("always_on", animid);
    }
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cc8
// Size: 0x54
function asm_getheadlookknobifexists() {
    animid = asm_lookupanimfromaliasifexists("knobs", "headlook");
    if (isdefined(animid)) {
        return asm_getxanim("knobs", animid);
    }
    animid = function_c1bf21c5e8625ea("knobs", "headlook");
    if (isdefined(animid)) {
        return function_6aa159fc2f693af7("knobs", animid);
    }
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d23
// Size: 0xac
function asm_isweaponoverride() {
    currentweapon = self.weapon;
    weapon = getweaponbasename(currentweapon);
    weapontypeoverrides = ["iw7_cheytac", "iw7_kbs", "iw7_m1", "iw7_m8", "iw7_mauler", "iw7_sdflmg", "iw7_ameli", "iw7_steeldragon", "iw7_sonic", "iw7_sdfshotty", "iw7_spas"];
    if (isdefined(weapon) && array_contains(weapontypeoverrides, weapon)) {
        return true;
    }
    return false;
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd7
// Size: 0x5c
function function_6aa159fc2f693af7(statename, animid) {
    /#
        assert(isdefined(statename));
    #/
    /#
        assertex(isdefined(animid), "Undefined animId passed in for state " + statename);
    #/
    if (isnumber(animid)) {
        archetype = self.basearchetype;
        return animsetgetanimfromindex(archetype, statename, animid);
    }
    return animid;
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e3a
// Size: 0x59
function asm_getxanim(statename, animid) {
    /#
        assert(isdefined(statename));
    #/
    /#
        assertex(isdefined(animid), "Undefined animId passed in for state " + statename);
    #/
    if (isnumber(animid)) {
        archetype = function_2285421dfc79c4d5();
        return animsetgetanimfromindex(archetype, statename, animid);
    }
    return animid;
}

// Namespace asm / scripts/asm/asm
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e9a
// Size: 0x95
function asm_playanimstatewithnotetrackinterceptor(asmname, statename, var_179213470e3d2f54, var_49bd3392cc4caeb2) {
    self endon(statename + "_finished");
    animid = asm_getanim(asmname, statename);
    self aisetanim(statename, animid);
    asm_playfacialanim(asmname, statename, asm_getxanim(statename, animid));
    endnote = asm_donotetrackswithinterceptor(asmname, statename, var_179213470e3d2f54, var_49bd3392cc4caeb2);
    if (endnote == "end") {
        if (!asm_eventfired(asmname, "end")) {
            asm_fireevent(asmname, "end");
        }
    }
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f36
// Size: 0x6d
function asm_playanimstatenotransition(asmname, statename, params) {
    self endon(statename + "_finished");
    animid = asm_getanim(asmname, statename);
    self aisetanim(statename, animid);
    asm_playfacialanim(asmname, statename, asm_getxanim(statename, animid));
    endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2faa
// Size: 0x80
function function_30df7eff2a4557a5(statename, aliasname) {
    self endon("death");
    scripts/asm/asm_bb::bb_setanimscripted();
    self asmsetstate(self.asmname, "animscripted");
    animindex = asm_lookupanimfromalias(statename, aliasname);
    self aisetanim(statename, animindex);
    xanim = asm_getxanim(statename, animindex);
    animlength = getanimlength(xanim);
    wait(animlength);
    scripts/asm/asm_bb::bb_clearanimscripted();
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3031
// Size: 0x3e
function asm_playadditiveanimloopstate(asmname, statename, params) {
    /#
        assert(isdefined(self.fnasm_playadditiveanimloopstate));
    #/
    [[ self.fnasm_playadditiveanimloopstate ]](asmname, statename, params);
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3076
// Size: 0x1c
function function_6e9cb6cd0535fe65() {
    normalizedtime = self function_9f1a3a76adea61f6();
    self function_d07a6cd6faca576d(normalizedtime);
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3099
// Size: 0x16
function function_8d1655ae223d862a(rate) {
    self.animplaybackratedefault = rate;
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b6
// Size: 0xc
function function_4bb232c0fca955f6() {
    return self.animplaybackratedefault;
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30ca
// Size: 0x52
function yawdiffto2468(diff) {
    if (diff < -135) {
        return "2";
    }
    if (diff < -45) {
        return "6";
    }
    if (diff > 135) {
        return "2";
    }
    if (diff > 45) {
        return "4";
    }
    return "8";
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3123
// Size: 0x25
function function_9de97eaaf31f9e35() {
    /#
        if (isdefined(level.var_9197bd66f91ccd30) && level.var_9197bd66f91ccd30) {
            return 1;
        }
        return 0;
    #/
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x314f
// Size: 0x4d
function function_3271c00e44d9636b() {
    /#
        dvar = getdvar(@"hash_9f9979f32e427f14");
        if (dvar == "<unknown string>") {
            return 0;
        }
        if (dvar == "<unknown string>") {
            return 1;
        }
        if (int(dvar) == self getentitynumber()) {
            return 1;
        }
        return 0;
    #/
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31a3
// Size: 0x20
function function_57bc598a3c0d7a1e(msg) {
    /#
        if (!function_3271c00e44d9636b()) {
            return;
        }
        println(msg);
    #/
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x31ca
// Size: 0x712
function asm_setupgesture(asmname, statename) {
    demeanor = asm_getdemeanor();
    var_59c51d94cf774c12 = asm_isfrantic();
    gestures = self.asm.gestures;
    arc = self.animsetname;
    gestures.gesture_moveup_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_move_up", var_59c51d94cf774c12));
    gestures.gesture_armup_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_armup", var_59c51d94cf774c12));
    gestures.gesture_onme_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_on_me", var_59c51d94cf774c12));
    gestures.gesture_hold_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_hold", var_59c51d94cf774c12));
    gestures.gesture_fallback_up_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_fallback_up", var_59c51d94cf774c12));
    gestures.gesture_fallback_down_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_fallback_down", var_59c51d94cf774c12));
    if (demeanor == "casual") {
        gestures.gesture_point_center = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_point_center", var_59c51d94cf774c12));
        gestures.gesture_point_left = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_point_left", var_59c51d94cf774c12));
        gestures.gesture_point_right = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_point_right", var_59c51d94cf774c12));
        gestures.gesture_point_up = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_point_up", var_59c51d94cf774c12));
        gestures.gesture_point_down = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_point_down", var_59c51d94cf774c12));
        gestures.gesture_shrug_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_shrug_anim", var_59c51d94cf774c12));
        gestures.gesture_cross_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_cross_anim", var_59c51d94cf774c12));
        gestures.gesture_nod_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_nod_anim", var_59c51d94cf774c12));
        gestures.gesture_shake_head_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_shake_head_anim", var_59c51d94cf774c12));
        gestures.gesture_salute_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_salute_anim", var_59c51d94cf774c12));
        gestures.gesture_wave_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_wave_anim", var_59c51d94cf774c12));
        gestures.gesture_wait_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_wait_anim", var_59c51d94cf774c12));
        return;
    }
    if (demeanor == "casual_gun") {
        gestures.gesture_point_center = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_casual_gun_point_center", var_59c51d94cf774c12));
        gestures.gesture_point_left = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_casual_gun_point_left", var_59c51d94cf774c12));
        gestures.gesture_point_right = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_casual_gun_point_right", var_59c51d94cf774c12));
        gestures.gesture_point_up = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_casual_gun_point_up", var_59c51d94cf774c12));
        gestures.gesture_point_down = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_casual_gun_point_down", var_59c51d94cf774c12));
        gestures.gesture_shrug_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_shrug_anim", var_59c51d94cf774c12));
        gestures.gesture_cross_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_cross_anim", var_59c51d94cf774c12));
        gestures.gesture_nod_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_nod_anim", var_59c51d94cf774c12));
        gestures.gesture_shake_head_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_shake_head_anim", var_59c51d94cf774c12));
        gestures.gesture_salute_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_salute_anim", var_59c51d94cf774c12));
        gestures.gesture_wave_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_wave_anim", var_59c51d94cf774c12));
        gestures.gesture_wait_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_wait_anim", var_59c51d94cf774c12));
        return;
    }
    gestures.gesture_point_center = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_gun_point_center", var_59c51d94cf774c12));
    gestures.gesture_point_left = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_gun_point_left", var_59c51d94cf774c12));
    gestures.gesture_point_right = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_gun_point_right", var_59c51d94cf774c12));
    gestures.gesture_point_up = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_gun_point_up", var_59c51d94cf774c12));
    gestures.gesture_point_down = asm_getxanim("gesture_point", archetypegetrandomalias(arc, "gesture_point", "gesture_gun_point_down", var_59c51d94cf774c12));
    gestures.gesture_shrug_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_shrug_anim", var_59c51d94cf774c12));
    gestures.gesture_cross_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_cross_anim", var_59c51d94cf774c12));
    gestures.gesture_nod_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_nod_anim", var_59c51d94cf774c12));
    gestures.gesture_shake_head_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_shake_head_anim", var_59c51d94cf774c12));
    gestures.gesture_salute_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_salute_anim", var_59c51d94cf774c12));
    gestures.gesture_wave_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_wave_anim", var_59c51d94cf774c12));
    gestures.gesture_wait_anim = asm_getxanim("gesture_old", archetypegetrandomalias(arc, "gesture_old", "gesture_gun_wait_anim", var_59c51d94cf774c12));
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38e3
// Size: 0xf4
function setup_level_ents() {
    level endon("game_ended");
    count = 0;
    foreach (t in getnodearray("traverse", "targetname")) {
        t traversethink();
        count++;
        if (count > 1000) {
            count = 0;
            waitframe();
        }
    }
    callback::callback("setup_all_traversals");
    /#
        foreach (t in getnodearray("<unknown string>", "<unknown string>")) {
            t thread function_f1e58f7103a22462();
        }
        level thread drawtraversaldata();
        level thread function_2bbb4d05ad09c81e();
    #/
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39de
// Size: 0x89
function function_35dd4cad0ca3fafc() {
    foreach (t in getallnodes()) {
        if (isdefined(t.type) && t.type == "Begin" && !isdefined(t.traverse_height)) {
            t function_ece7865eb2447554();
            waitframe();
        }
    }
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a6e
// Size: 0x58
function processdoublejumpmantletraversal(target) {
    /#
        assert(isdefined(target));
    #/
    self.doublejumpmantlepos = target.origin;
    self.startnodeoriginalangles = self.angles;
    if (isent(target)) {
        target delete();
        return;
    }
    deletestruct_ref(target);
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3acd
// Size: 0x4f2
function traversethink() {
    ent = getent(self.target, "targetname");
    if (!isdefined(ent)) {
        ent = getstruct(self.target, "targetname");
    }
    end_node = getnode(self.target, "targetname");
    if (!isdefined(end_node)) {
        if (level.script != "mp_jup_map" && level.script != "mp_jup_bigmap_wz2" && level.script != "mp_jup_bm_live_wz2" && level.script != "mp_jup_bm_wz2_s4") {
            /#
                assertex(isdefined(end_node), "Unable to find matching negotiation_end_node for negotiation_start_node at " + self.origin + " " + self.target);
            #/
        }
        logstring("^1Warning: Unable to find matching negotiation_end_node for negotiation_start_node at " + self.origin + " " + self.target);
        return;
    }
    if (self.animscript == "traverse_ground") {
        function_2121ee28acaa2765(ent, end_node);
        return;
    }
    if (!isdefined(ent)) {
        /#
            println("<unknown string>" + self.animscript + "<unknown string>");
        #/
        calculate_traverse_data(averagepoint([self.origin, end_node.origin]), end_node.origin);
        return;
    }
    switch (self.animscript) {
    case #"hash_8f681d217a32aef7":
        processwallruntraversal(ent);
        return;
    case #"hash_2517ba3af2f13858":
        function_af7d10bc22de3494(ent);
        return;
    case #"hash_6fc6878fd3fd1e7a":
    case #"hash_d14662a6eb371af5":
        /#
            if (getdvarint(@"hash_a838875af4383ca1", 0) != 0) {
                if (isdefined(self.target)) {
                    node = getnode(self.target, "<unknown string>");
                    if (isdefined(node)) {
                        self.var_2ec927a0b0085925 = node.origin;
                    }
                }
            }
        #/
        processdoublejumpmantletraversal(ent);
        return;
    case #"hash_5f054fa72e77b8dd":
        /#
            if (getdvarint(@"hash_a838875af4383ca1", 0) != 0) {
                if (isdefined(self.target)) {
                    node = getnode(self.target, "<unknown string>");
                    if (isdefined(node)) {
                        self.var_2ec927a0b0085925 = node.origin;
                    }
                }
            }
        #/
        self.startnodeoriginalangles = self.angles;
        self.jump_over_offset = ent.origin - self.origin;
        self.jump_over_ent_origin = ent.origin;
        break;
    case #"hash_3083e73248cdb399":
        self.startnodeoriginalangles = self.angles;
        /#
            if (getdvarint(@"hash_a838875af4383ca1", 0) != 0) {
                self.var_2ec927a0b0085925 = getnode(self.target, "<unknown string>").origin;
                self.var_5d8aff9e6ac666b5 = ent.origin;
            }
        #/
        break;
    default:
        break;
    }
    if (isdefined(ent.target) && (level.script != "mp_jup_bigmap" && level.script != "mp_jup_bigmap_wz2" && level.script != "mp_jup_bm_live_wz2" && level.script != "mp_jup_bm_wz2_s4" || !isendstr(ent.target, "auto12190374188911454432"))) {
        ent2 = getent(ent.target, "targetname");
        if (!isdefined(ent2)) {
            ent2 = getstruct(ent.target, "targetname");
        }
        /#
            assertex(isdefined(ent2), self.animscript + " traverse at " + self.origin + " has ent " + ent.targetname + " at " + ent.origin + " pointing to missing ent/struct " + ent.target);
        #/
        if (isdefined(ent2)) {
            calculate_traverse_data(ent.origin, end_node.origin, ent2.origin);
        } else {
            calculate_traverse_data(ent.origin, end_node.origin);
        }
    } else {
        calculate_traverse_data(ent.origin, end_node.origin);
    }
    if (isdefined(self.parentname)) {
        store_original_traverse_data();
    }
    if (isent(ent)) {
        ent delete();
        return;
    }
    deletestruct_ref(ent);
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fc6
// Size: 0xcd
function function_ece7865eb2447554() {
    apex_pos = undefined;
    end_node = getnode(self.target, "targetname");
    /#
        assertex(isdefined(end_node), "Unable to find matching negotiation_end_node for negotiation_start_node at " + self.origin + " " + self.target);
    #/
    apex_pos = function_fda6a76c32365675(self.origin, end_node.origin);
    if (!isdefined(apex_pos)) {
        /#
            assertmsg("Unable to calculate apex position for traversal starting at " + self.origin + ", using an average of the start and end points as a fallback");
        #/
        apex_pos = averagepoint([self.origin, end_node.origin]);
    }
    calculate_traverse_data(apex_pos, end_node.origin);
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x409a
// Size: 0x181
function store_original_traverse_data() {
    self.original_data = spawnstruct();
    self.original_data.origin = self.origin;
    self.original_data.angles = self.angles;
    self.original_data.traverse_height = self.traverse_height;
    self.original_data.traverse_height_delta = self.traverse_height_delta;
    self.original_data.traverse_drop_height_delta = self.traverse_drop_height_delta;
    self.original_data.apex_delta = self.apex_delta;
    self.original_data.apex_delta_local = rotatevectorinverted(self.apex_delta, self.angles);
    if (isdefined(self.across_delta)) {
        self.original_data.across_delta = self.across_delta;
        self.original_data.across_delta_local = rotatevectorinverted(self.across_delta, self.angles);
    }
    end_node = getnode(self.target, "targetname");
    if (isdefined(end_node)) {
        self.original_data.endnode_pos = end_node.origin;
    }
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4222
// Size: 0x125
function calculate_traverse_data(struct_pos, endnode_pos, var_83a69c989077feb7) {
    /#
        assert(self.type == "Begin");
    #/
    if (self.animscript == "ladder_up" || self.animscript == "ladder_down") {
        ladderend = isdefined(var_83a69c989077feb7) ? var_83a69c989077feb7 : isdefined(struct_pos) ? struct_pos : endnode_pos;
        self.traverse_height = ladderend[2];
        self.traverse_height_delta = ladderend[2] - self.origin[2];
        self.traverse_drop_height_delta = ladderend[2] - endnode_pos[2];
        self.apex_delta = ladderend - self.origin;
        return;
    }
    self.traverse_height = struct_pos[2];
    self.traverse_height_delta = struct_pos[2] - self.origin[2];
    self.traverse_drop_height_delta = struct_pos[2] - endnode_pos[2];
    self.apex_delta = struct_pos - self.origin;
    if (isdefined(var_83a69c989077feb7)) {
        self.across_delta = var_83a69c989077feb7 - struct_pos;
    }
}

// Namespace asm / scripts/asm/asm
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x434e
// Size: 0xd1
function re_calculate_traverse_data(ref_node, struct_pos, endnode_pos, var_83a69c989077feb7) {
    if (!isdefined(struct_pos)) {
        struct_pos = self.origin + rotatevector(ref_node.original_data.apex_delta_local, self.angles);
    }
    if (!isdefined(endnode_pos)) {
        endnode_pos = ref_node.original_data.endnode_pos;
    }
    if (!isdefined(var_83a69c989077feb7) && isdefined(ref_node.original_data.across_delta_local)) {
        var_f671cc4a667b804f = rotatevector(ref_node.original_data.across_delta_local, self.angles);
        var_83a69c989077feb7 = struct_pos + var_f671cc4a667b804f;
    }
    calculate_traverse_data(struct_pos, endnode_pos, var_83a69c989077feb7);
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4426
// Size: 0x637
function processwallruntraversal(target) {
    /#
        assert(isdefined(target));
    #/
    wallendnode = getent(target.target, "targetname");
    if (!isdefined(wallendnode)) {
        wallendnode = getstruct(target.target, "targetname");
    }
    /#
        assert(isdefined(wallendnode));
    #/
    /#
        dist = distance(self.origin, target.origin);
        if (dist > 400) {
            println("<unknown string>" + self.origin + "<unknown string>" + dist + "<unknown string>" + 400);
        }
    #/
    self.wall_info = spawnstruct();
    var_70d5f712a9e22e96 = target;
    numnodes = 0;
    self.wall_info.startnodeoriginalangles = self.angles;
    /#
        deltaz = var_70d5f712a9e22e96.origin[2] - self.origin[2];
        if (deltaz > 208) {
            println("<unknown string>" + var_70d5f712a9e22e96.origin + "<unknown string>" + deltaz + "<unknown string>" + 208);
        }
    #/
    walldir = undefined;
    while (isdefined(var_70d5f712a9e22e96)) {
        self.wall_info.nodeoffsets[numnodes] = var_70d5f712a9e22e96.origin - self.origin;
        numnodes++;
        var_d258406ada10ec0a = getstruct(var_70d5f712a9e22e96.target, "targetname");
        /#
            assert(isdefined(var_d258406ada10ec0a));
        #/
        /#
            dist = distance(var_70d5f712a9e22e96.origin, var_d258406ada10ec0a.origin);
            if (dist > 544) {
                println("<unknown string>" + var_70d5f712a9e22e96.origin + "<unknown string>" + dist + "<unknown string>" + 544);
            }
            walldir = vectornormalize(var_d258406ada10ec0a.origin - var_70d5f712a9e22e96.origin);
            var_13654841eca9f761 = var_70d5f712a9e22e96.origin - self.origin;
            var_13654841eca9f761 = (var_13654841eca9f761[0], var_13654841eca9f761[1], 0);
            var_13654841eca9f761 = vectornormalize(var_13654841eca9f761);
            dotprod = vectordot(walldir, var_13654841eca9f761);
            if (dotprod < 0) {
                println("<unknown string>" + self.origin + "<unknown string>");
            }
        #/
        deletestruct_ref(var_70d5f712a9e22e96);
        var_70d5f712a9e22e96 = var_d258406ada10ec0a;
        /#
            assert(isdefined(var_70d5f712a9e22e96));
        #/
        self.wall_info.nodeoffsets[numnodes] = var_70d5f712a9e22e96.origin - self.origin;
        numnodes++;
        if (isdefined(var_70d5f712a9e22e96.target)) {
            temp = getstruct(var_70d5f712a9e22e96.target, "targetname");
        } else {
            temp = undefined;
        }
        deletestruct_ref(var_70d5f712a9e22e96);
        var_70d5f712a9e22e96 = temp;
        /#
            if (!isdefined(var_70d5f712a9e22e96)) {
                traversalendnode = getnode(self.target, "<unknown string>");
                /#
                    assert(isdefined(traversalendnode));
                #/
                /#
                    assert(isdefined(walldir));
                #/
                var_66a49caa0a5f70ba = traversalendnode.origin - var_d258406ada10ec0a.origin;
                var_66a49caa0a5f70ba = (var_66a49caa0a5f70ba[0], var_66a49caa0a5f70ba[1], 0);
                var_66a49caa0a5f70ba = vectornormalize(var_66a49caa0a5f70ba);
                dotprod = vectordot(var_66a49caa0a5f70ba, walldir);
                if (dotprod < 0) {
                    println("<unknown string>" + self.origin + "<unknown string>");
                }
                dist = distance(var_d258406ada10ec0a.origin, traversalendnode.origin);
                if (dist > 512) {
                    println("<unknown string>" + self.origin + "<unknown string>" + dist + "<unknown string>" + 512);
                }
            }
        #/
        if (isdefined(var_70d5f712a9e22e96) && isdefined(var_70d5f712a9e22e96.script_wallrun_type)) {
            if (var_70d5f712a9e22e96.script_wallrun_type == "wallrun_mantle") {
                /#
                    dist = distance(var_d258406ada10ec0a.origin, var_70d5f712a9e22e96.origin);
                    deltaz = var_70d5f712a9e22e96.origin[2] - var_d258406ada10ec0a.origin[2];
                    if (deltaz > 0) {
                        if (dist > 420) {
                            println("<unknown string>" + var_70d5f712a9e22e96.origin + "<unknown string>" + dist + "<unknown string>" + 420);
                        }
                        if (deltaz > 200) {
                            println("<unknown string>" + var_70d5f712a9e22e96.origin + "<unknown string>" + deltaz + "<unknown string>" + 200);
                        }
                    } else if (dist > 512) {
                        println("<unknown string>" + var_70d5f712a9e22e96.origin + "<unknown string>" + dist + "<unknown string>" + 512);
                    }
                #/
                self.wall_info.mantleoffset = var_70d5f712a9e22e96.origin - self.origin;
                if (isdefined(var_70d5f712a9e22e96.angles)) {
                    self.wall_info.mantleangles = var_70d5f712a9e22e96.angles;
                }
                deletestruct_ref(var_70d5f712a9e22e96);
                break;
            }
            if (var_70d5f712a9e22e96.script_wallrun_type == "wallrun_vault") {
                self.wall_info.mantleoffset = var_70d5f712a9e22e96.origin - self.origin;
                self.wall_info.bvaultover = 1;
                /#
                    deltaz = var_70d5f712a9e22e96.origin[2] - var_d258406ada10ec0a.origin[2];
                    if (deltaz > 164) {
                        println("<unknown string>" + var_70d5f712a9e22e96.origin + "<unknown string>" + deltaz + "<unknown string>" + 164);
                    }
                #/
                deletestruct_ref(var_70d5f712a9e22e96);
                break;
            }
        }
    }
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a64
// Size: 0xd1
function function_2121ee28acaa2765(target, end_node) {
    /#
        assert(isdefined(end_node));
    #/
    self.walk_nodes = [];
    self.walk_nodes = array_add(self.walk_nodes, self.origin);
    for (currentgoal = target; isdefined(currentgoal); currentgoal = undefined) {
        self.walk_nodes = array_add(self.walk_nodes, currentgoal.origin);
        if (isdefined(currentgoal.target)) {
            currentgoal = getstruct(currentgoal.target, "targetname");
            continue;
        }
    }
    self.walk_nodes = array_add(self.walk_nodes, end_node.origin);
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b3c
// Size: 0x191
function function_af7d10bc22de3494(target) {
    /#
        assert(isdefined(target));
    #/
    self.wall_nodes = [];
    self.wall_rolls = [];
    currentgoal = target;
    while (isdefined(currentgoal)) {
        self.wall_nodes = array_add(self.wall_nodes, currentgoal.origin);
        self.wall_rolls = array_add(self.wall_rolls, currentgoal.angles[2]);
        oldgoal = currentgoal;
        if (isdefined(currentgoal.target)) {
            currentgoal = getstruct(currentgoal.target, "targetname");
        } else {
            currentgoal = undefined;
        }
        deletestruct_ref(oldgoal);
    }
    /#
        assert(self.wall_nodes.size >= 2);
    #/
    if (self.wall_nodes.size >= 2 && self.wall_rolls[0] == 0) {
        walldir = self.wall_nodes[1] - self.wall_nodes[0];
        wallright = vectorcross(walldir, (0, 0, 1));
        var_30501b8da540ea16 = self.wall_nodes[0] - self.origin;
        walldot = vectordot(wallright, var_30501b8da540ea16);
        self.var_143b20e77684b51 = vectordot(wallright, var_30501b8da540ea16) < 0;
    }
    self.traverse_height = 0;
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cd4
// Size: 0x316
function function_fda6a76c32365675(begin_pos, end_pos) {
    apex_pos = undefined;
    var_7533ff429b05d245 = begin_pos;
    var_f38af0b4e9fff9f1 = end_pos;
    var_a5d0297b89fc7ef4 = flatten_vector(end_pos - begin_pos);
    delta_z = abs(end_pos[2] - begin_pos[2]);
    start_z = min(begin_pos[2], end_pos[2]);
    current_z = max(begin_pos[2], end_pos[2]) + 1;
    begin_pos = (begin_pos[0], begin_pos[1], current_z);
    end_pos = (end_pos[0], end_pos[1], current_z);
    trace_end = physicstrace(begin_pos, end_pos);
    var_30d6320d769d3f2c = 0.01;
    if (distance2dsquared(trace_end, end_pos) < var_30d6320d769d3f2c) {
        if (var_7533ff429b05d245[2] < var_f38af0b4e9fff9f1[2]) {
            temp_pos = begin_pos;
            begin_pos = end_pos;
            end_pos = temp_pos;
        }
        iteration_limit = 3;
        cliff_pos = begin_pos;
        mid_point = undefined;
        var_a2d80e0c0cf75c95 = undefined;
        for (i = 0; i < iteration_limit; i++) {
            mid_point = averagepoint([begin_pos, end_pos]);
            pit_height = 20;
            var_a8da4fd8b61d7002 = mid_point - (0, 0, pit_height);
            trace_end = physicstrace(mid_point, var_a8da4fd8b61d7002);
            var_f49807d1d5831577 = vectordot(vectornormalize(begin_pos - trace_end), vectornormalize(end_pos - trace_end));
            if (trace_end == var_a8da4fd8b61d7002 || abs(var_f49807d1d5831577) > 0.2) {
                end_pos = mid_point;
                var_a2d80e0c0cf75c95 = mid_point;
                continue;
            }
            begin_pos = mid_point;
            cliff_pos = trace_end;
        }
        if (isdefined(var_a2d80e0c0cf75c95)) {
            var_8c522d40ce23da01 = (var_a2d80e0c0cf75c95[0], var_a2d80e0c0cf75c95[1], cliff_pos[2] - 1);
            apex_pos = physicstrace(var_8c522d40ce23da01, cliff_pos);
            apex_pos = (apex_pos[0], apex_pos[1], min(apex_pos[2], mid_point[2]));
        } else {
            apex_pos = (cliff_pos[0], cliff_pos[1], min(cliff_pos[2], mid_point[2]));
        }
    } else {
        found_top = 0;
        var_827921a3c3a33294 = trace_end;
        iteration_limit = 10;
        iteration_index = 0;
        var_bb3a6419e378030e = 15;
        while (!found_top && iteration_index < iteration_limit) {
            current_z = current_z + var_bb3a6419e378030e;
            begin_pos = (begin_pos[0], begin_pos[1], current_z);
            end_pos = (end_pos[0], end_pos[1], current_z);
            trace_end = physicstrace(begin_pos, end_pos);
            if (distance2dsquared(trace_end, end_pos) < var_30d6320d769d3f2c) {
                found_top = 1;
            } else {
                var_827921a3c3a33294 = trace_end;
            }
            iteration_index++;
        }
        if (istrue(found_top)) {
            above_top = var_827921a3c3a33294 + var_a5d0297b89fc7ef4 + (0, 0, var_bb3a6419e378030e);
            apex_pos = physicstrace(above_top, above_top - (0, 0, var_bb3a6419e378030e));
        }
        /#
            if (!isdefined(apex_pos)) {
                println("<unknown string>" + iteration_limit + "<unknown string>" + begin_pos);
            }
        #/
    }
    return apex_pos;
}

// Namespace asm / scripts/asm/asm
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4ff2
// Size: 0x30
function function_e722e0c504ced0ee(asmname, statename, params) {
    self notify("agent_scene_stop");
    self clearoverridearchetype("animscript");
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5029
// Size: 0x54
function function_f1e58f7103a22462() {
    /#
        wait(0.05);
        println("<unknown string>" + self.origin);
        if (getdvarint(@"hash_60bc1b675216e3d")) {
            while (true) {
                print3d(self.origin, "<unknown string>");
                wait(0.05);
            }
        }
    #/
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5084
// Size: 0x59
function validatetraverse(traverse) {
    /#
        return traverse == "<unknown string>" || traverse == "<unknown string>" || traverse == "<unknown string>" || traverse == "<unknown string>" || traverse == "<unknown string>" || traverse == "<unknown string>" || traverse == "<unknown string>";
    #/
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50e4
// Size: 0x208
function function_12534104fbe54e32() {
    /#
        println("<unknown string>");
        foreach (t in getnodearray("<unknown string>", "<unknown string>")) {
            if (!validatetraverse(t.animscript)) {
                continue;
            }
            for (s = 20; s < 280; s = s + 10) {
                for (yaw = -180; yaw <= 180; yaw = yaw + 15) {
                    var_e9db8fc3741a7e52 = [];
                    var_e9db8fc3741a7e52["<unknown string>"] = t.traverse_height_delta;
                    var_e9db8fc3741a7e52["<unknown string>"] = t.traverse_drop_height_delta;
                    var_e9db8fc3741a7e52["<unknown string>"] = yaw;
                    var_e9db8fc3741a7e52["<unknown string>"] = s;
                    if (t.animscript == "<unknown string>") {
                        var_e9db8fc3741a7e52["<unknown string>"] = length2d(t.across_delta);
                    }
                    alias = level scripts/anim/animselector::selectanim(t.animscript, var_e9db8fc3741a7e52, 0);
                    if (alias == "<unknown string>") {
                        nodestring = "<unknown string>";
                        nodestring = nodestring + "<unknown string>" + t.animscript;
                        nodestring = nodestring + "<unknown string>" + t.origin;
                        nodestring = nodestring + "<unknown string>" + t.traverse_height_delta;
                        nodestring = nodestring + "<unknown string>" + t.traverse_drop_height_delta;
                        nodestring = nodestring + "<unknown string>" + s;
                        nodestring = nodestring + "<unknown string>" + yaw;
                        if (t.animscript == "<unknown string>") {
                            nodestring = nodestring + "<unknown string>" + length2d(t.across_delta);
                        }
                        nodestring = nodestring + "<unknown string>";
                        println(nodestring);
                    }
                }
                waitframe();
            }
        }
    #/
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52f3
// Size: 0x114
function drawtraversaldata() {
    /#
        while (true) {
            waitframe();
            if (getdvarint(@"hash_c67513927ea56f3a", 0) <= 0) {
                continue;
            }
            recorder_enabled = getdvarint(@"hash_a83f59607205c9c0", 0) > 0;
            foreach (t in getallnodes()) {
                if (isdefined(t.type) && t.type == "<unknown string>" && isdefined(t.traverse_height)) {
                    apex_pos = t.origin + t.apex_delta;
                    if (recorder_enabled) {
                        recordsphere(apex_pos, 15, (0.2, 1, 0));
                        continue;
                    }
                    sphere(apex_pos, 15, (0.2, 1, 0));
                }
            }
        }
    #/
}

// Namespace asm / scripts/asm/asm
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x540e
// Size: 0x493
function private function_2bbb4d05ad09c81e() {
    /#
        level endon("<unknown string>");
        setdvarifuninitialized(@"hash_e42ac6b1ddb1188e", 0);
        while (true) {
            if (getdvarint(@"hash_e42ac6b1ddb1188e", 0) <= 0) {
                waitframe();
                continue;
            }
            break;
        }
        while (!isalive(level.players[0])) {
            waitframe();
        }
        var_c22f0f91887e7488 = spawnstruct();
        var_c22f0f91887e7488.room_nodes = [];
        var_c22f0f91887e7488.var_d1debc37b000d65d = [];
        level childthread function_25f6ff1e2f38d5a(var_c22f0f91887e7488);
        iprintlnbold("<unknown string>");
        room_index = 0;
        room_node = function_47ac2016d8dbf2c5(room_index);
        room_node = {origin:getclosestpointonnavmesh(room_node.origin)};
        var_c52c258b548af58d = 0;
        while (isdefined(room_node)) {
            var_4b5523fa148a15c9 = undefined;
            var_3bbd592cb0b58f64 = [];
            foreach (var_80847fa4c21ff44b in var_c22f0f91887e7488.room_nodes) {
                can_pathfind = 0;
                dist = distance(room_node.origin, var_80847fa4c21ff44b.origin);
                if (dist > 4000) {
                    continue;
                }
                if (is_equal(var_4b5523fa148a15c9, var_80847fa4c21ff44b.island_id)) {
                    can_pathfind = 1;
                } else if (!can_pathfind) {
                    path1 = findpathcustom(room_node.origin, var_80847fa4c21ff44b.origin);
                    can_pathfind = function_b391661c3185e255(path1, var_80847fa4c21ff44b.origin);
                    if (can_pathfind) {
                        path2 = findpathcustom(var_80847fa4c21ff44b.origin, room_node.origin);
                        can_pathfind = function_b391661c3185e255(path2, room_node.origin);
                    }
                }
                if (can_pathfind) {
                    var_4b5523fa148a15c9 = isdefined(var_4b5523fa148a15c9) ? var_4b5523fa148a15c9 : var_80847fa4c21ff44b.island_id;
                    var_4b5523fa148a15c9 = min(var_4b5523fa148a15c9, var_80847fa4c21ff44b.island_id);
                    var_3bbd592cb0b58f64[var_3bbd592cb0b58f64.size] = var_80847fa4c21ff44b;
                }
            }
            foreach (var_80847fa4c21ff44b in var_3bbd592cb0b58f64) {
                var_80847fa4c21ff44b.island_id = int(var_4b5523fa148a15c9);
            }
            var_c22f0f91887e7488.room_nodes[var_c22f0f91887e7488.room_nodes.size] = room_node;
            if (!isdefined(var_4b5523fa148a15c9)) {
                room_node.island_id = int(var_c52c258b548af58d);
                var_c52c258b548af58d++;
            } else {
                room_node.island_id = int(var_4b5523fa148a15c9);
            }
            room_index++;
            room_node = function_47ac2016d8dbf2c5(room_index);
            if (isdefined(room_node)) {
                room_node = {origin:getclosestpointonnavmesh(room_node.origin)};
            }
            if (room_index % 150 == 0) {
                waitframe();
            }
        }
        foreach (room_node in var_c22f0f91887e7488.room_nodes) {
            var_c22f0f91887e7488.var_d1debc37b000d65d[room_node.island_id] = isdefined(var_c22f0f91887e7488.var_d1debc37b000d65d[room_node.island_id]) ? var_c22f0f91887e7488.var_d1debc37b000d65d[room_node.island_id] : 0;
            var_c22f0f91887e7488.var_d1debc37b000d65d[room_node.island_id] = var_c22f0f91887e7488.var_d1debc37b000d65d[room_node.island_id] + 1;
        }
        waitframe();
        logstring("<unknown string>");
        foreach (room_node in var_c22f0f91887e7488.room_nodes) {
            if (is_equal(var_c22f0f91887e7488.var_d1debc37b000d65d[room_node.island_id], 1)) {
                logstring("<unknown string>" + room_node.origin);
            }
        }
        iprintlnbold("<unknown string>");
    #/
}

// Namespace asm / scripts/asm/asm
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x58a8
// Size: 0x43
function private function_b391661c3185e255(path, end_point) {
    /#
        if (isdefined(path) && path.size > 0) {
            dist = distance(path[path.size - 1], end_point);
            return (dist < 10);
        }
        return 0;
    #/
}

// Namespace asm / scripts/asm/asm
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x58f2
// Size: 0x234
function private function_25f6ff1e2f38d5a(var_c22f0f91887e7488) {
    /#
        var_9a3849d89286b99c = [];
        render_frames = int(ceil(1 / level.framedurationseconds));
        while (true) {
            if (getdvarint(@"hash_e42ac6b1ddb1188e", 0) <= 0) {
                waitframe();
                continue;
            }
            foreach (room_node in var_c22f0f91887e7488.room_nodes) {
                if (!isdefined(var_9a3849d89286b99c[room_node.island_id])) {
                    var_9a3849d89286b99c[room_node.island_id] = (randomfloat(1), randomfloat(1), randomfloat(1));
                }
                col = var_9a3849d89286b99c[room_node.island_id];
                alpha = 1;
                if (isdefined(var_c22f0f91887e7488.var_d1debc37b000d65d[room_node.island_id])) {
                    if (var_c22f0f91887e7488.var_d1debc37b000d65d[room_node.island_id] == 1) {
                        line(room_node.origin, room_node.origin + (0, 0, 4000), col, undefined, 0, render_frames);
                        sphere(room_node.origin + (0, 0, 4000), 500, col, 1, render_frames);
                    } else if (var_c22f0f91887e7488.var_d1debc37b000d65d[room_node.island_id] > 50) {
                        alpha = 0.5;
                        if (distance(room_node.origin, level.players[0].origin) > 2000) {
                            continue;
                        }
                    }
                }
                sphere(room_node.origin, 20, col, 0, render_frames);
                print3d(room_node.origin + (0, 0, 10), "<unknown string>" + room_node.island_id, col, alpha, undefined, render_frames);
            }
            wait(1);
        }
    #/
}

