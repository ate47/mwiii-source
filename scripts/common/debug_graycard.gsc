// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace debug_graycard;

// Namespace debug_graycard / scripts/common/debug_graycard
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x78
// Size: 0xe2
function init_graycard(handleplayerconnect) {
    /#
        setdevdvarifuninitialized(@"hash_a6381f8c58314102", "<unknown string>");
        setdevdvarifuninitialized(@"hash_1dfb6641a37c41f1", "<unknown string>");
        precachemodel("<unknown string>");
        precachemodel("<unknown string>");
        precachemodel("<unknown string>");
        precachemodel("<unknown string>");
        precachemodel("<unknown string>");
        precachemodel("<unknown string>");
        precachemodel("<unknown string>");
        precachemodel("<unknown string>");
        precachemodel("<unknown string>");
        if (!isdefined(level.debug)) {
            level.debug = spawnstruct();
        }
        level.debug.graycard = 0;
        if (isdefined(handleplayerconnect)) {
            thread onplayerconnect();
            return;
        }
        thread spplayerconnect();
    #/
}

// Namespace debug_graycard / scripts/common/debug_graycard
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x161
// Size: 0x2c
function spplayerconnect() {
    /#
        while (!isdefined(level.player)) {
            waitframe();
        }
        level.player add_frame_event(&debug_gray_card);
    #/
}

// Namespace debug_graycard / scripts/common/debug_graycard
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x194
// Size: 0x46
function onplayerconnect() {
    if (isdefined(level.func_run_lean_threads) && [[ level.func_run_lean_threads ]]()) {
        return;
    }
    /#
        for (;;) {
            player = level waittill("<unknown string>");
            player scripts/engine/utility::add_frame_event(&debug_gray_card_mp);
        }
    #/
}

// Namespace debug_graycard / scripts/common/debug_graycard
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e1
// Size: 0xf
function debug_gray_card_mp() {
    /#
        debug_gray_card(1);
    #/
}

// Namespace debug_graycard / scripts/common/debug_graycard
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f7
// Size: 0x1bf
function debug_gray_card(ismp) {
    /#
        if (!isdefined(ismp)) {
            ismp = 0;
        }
        if (getdvar(@"hash_a6381f8c58314102") == "<unknown string>") {
            if (level.debug.graycard != 1) {
                remove_graycard_objects();
                create_graycard_object();
                level.debug.graycard = 1;
            }
            debug_graycard_buttons(ismp);
        } else if (getdvar(@"hash_a6381f8c58314102") == "<unknown string>" && level.debug.graycard != 0) {
            remove_graycard_objects();
            level.debug.graycard = 0;
        }
        switch (getdvar(@"hash_1dfb6641a37c41f1")) {
        case #"hash_311010bc01bd3a0f":
            set_debug_models("<unknown string>");
            break;
        case #"hash_31100fbc01bd387c":
            set_debug_models("<unknown string>");
            break;
        case #"hash_311012bc01bd3d35":
            set_debug_models("<unknown string>");
            break;
        case #"hash_311011bc01bd3ba2":
            set_debug_models("<unknown string>");
            break;
        case #"hash_31100cbc01bd33c3":
            set_debug_models("<unknown string>");
            break;
        case #"hash_31100bbc01bd3230":
            set_debug_models("<unknown string>");
            break;
        case #"hash_31100ebc01bd36e9":
            set_debug_models("<unknown string>");
            break;
        case #"hash_31100dbc01bd3556":
            set_debug_models("<unknown string>");
            break;
        default:
            break;
        }
    #/
}

// Namespace debug_graycard / scripts/common/debug_graycard
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bd
// Size: 0xa2
function set_debug_models(model) {
    /#
        if (isdefined(level.debug.var_286073a8108cd67f)) {
            foreach (ent in level.debug.var_286073a8108cd67f) {
                ent setmodel(model);
            }
        }
        if (isdefined(self.var_56868152de824f45)) {
            self.var_56868152de824f45 setmodel(model);
        }
    #/
}

// Namespace debug_graycard / scripts/common/debug_graycard
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x466
// Size: 0xaa
function remove_graycard_objects() {
    /#
        if (isdefined(level.debug.var_286073a8108cd67f)) {
            foreach (ent in level.debug.var_286073a8108cd67f) {
                ent delete();
            }
            level.debug.var_286073a8108cd67f = undefined;
        }
        if (isdefined(self.var_56868152de824f45)) {
            self.var_56868152de824f45 delete();
        }
    #/
}

// Namespace debug_graycard / scripts/common/debug_graycard
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x517
// Size: 0x75
function create_graycard_object() {
    /#
        self.var_56868152de824f45 = spawn_graycard();
        object = self.var_56868152de824f45;
        object.offset = 100;
        object.lastoffset = object.offset;
        object.copy_released = 1;
        object.offsetangles = (0, 0, 0);
    #/
}

// Namespace debug_graycard / scripts/common/debug_graycard
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x593
// Size: 0x32
function spawn_graycard() {
    /#
        model = spawn("<unknown string>", self.origin);
        model setmodel("<unknown string>");
        return model;
    #/
}

// Namespace debug_graycard / scripts/common/debug_graycard
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5cc
// Size: 0x27e
function debug_graycard_buttons(ismp) {
    /#
        if (!isdefined(self.var_56868152de824f45)) {
            return;
        }
        object = self.var_56868152de824f45;
        if (self buttonpressed("<unknown string>")) {
            object.offset = object.offset + 5;
        }
        if (self buttonpressed("<unknown string>")) {
            object.offset = object.offset - 5;
        }
        if (self buttonpressed("<unknown string>")) {
            object.offsetangles = object.offsetangles + (0, 6, 0);
        }
        if (self buttonpressed("<unknown string>")) {
            object.offsetangles = object.offsetangles + (0, -6, 0);
        }
        if (self buttonpressed("<unknown string>")) {
            object.offsetangles = object.offsetangles + (6, 0, 0);
        }
        if (self buttonpressed("<unknown string>")) {
            object.offsetangles = object.offsetangles + (-6, 0, 0);
        }
        if (self buttonpressed("<unknown string>")) {
            object.offsetangles = (0, 0, 0);
        }
        if (object.copy_released) {
            if (self buttonpressed("<unknown string>")) {
                create_copy(object);
                object.copy_released = 0;
            }
        } else if (!self buttonpressed("<unknown string>")) {
            object.copy_released = 1;
        }
        if (object.offset > 1000) {
            object.offset = 1000;
        }
        if (object.offset < 16) {
            object.offset = 16;
        }
        if (!ismp) {
            object unlink();
        }
        object.origin = self geteye() + anglestoforward(self getplayerangles()) * object.offset;
        object.angles = combineangles(self getplayerangles(), object.offsetangles);
        object.lastoffset = object.offset;
        if (!ismp) {
            object linkto(self);
        }
    #/
}

// Namespace debug_graycard / scripts/common/debug_graycard
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x851
// Size: 0x10e
function create_copy(object) {
    /#
        copyobject = spawn_graycard();
        copyobject.origin = object.origin;
        copyobject.angles = object.angles;
        if (!isdefined(level.debug.var_286073a8108cd67f)) {
            level.debug.var_286073a8108cd67f = [copyobject];
            return;
        }
        if (level.debug.var_286073a8108cd67f.size > 50) {
            level.debug.var_286073a8108cd67f[0] delete();
            level.debug.var_286073a8108cd67f = array_removeundefined(level.debug.var_286073a8108cd67f);
        }
        level.debug.var_286073a8108cd67f[level.debug.var_286073a8108cd67f.size] = copyobject;
    #/
}

