// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace lightbar;

// Namespace lightbar / scripts/mp/lightbar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x170
// Size: 0x3
function init() {
    
}

// Namespace lightbar / scripts/mp/lightbar
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x17a
// Size: 0x264
function add_to_lightbar_stack(lbcolor, pulsetime, priority, endondeath, time, endonnotification) {
    if (!isdefined(priority)) {
        priority = 0;
    }
    if (time == 0) {
        time = undefined;
    }
    if (!isdefined(self.lightbarstructs) || self.lightbarstructs.size == 0) {
        lightbarstructs = [];
        lightbarstructs[0] = spawnstruct();
        self.lightbarstructs = lightbarstructs;
    } else {
        tempstructs = array_removeundefined(self.lightbarstructs);
        self.lightbarstructs = tempstructs;
        self.lightbarstructs[self.lightbarstructs.size] = spawnstruct();
    }
    self.lightbarstructs[self.lightbarstructs.size - 1].lbcolor = lbcolor;
    self.lightbarstructs[self.lightbarstructs.size - 1].pulsetime = pulsetime;
    self.lightbarstructs[self.lightbarstructs.size - 1].priority = priority;
    self.lightbarstructs[self.lightbarstructs.size - 1].endondeath = endondeath;
    self.lightbarstructs[self.lightbarstructs.size - 1].timeplacedinstack = gettime();
    self.lightbarstructs[self.lightbarstructs.size - 1].executing = 0;
    self.lightbarstructs[self.lightbarstructs.size - 1].endonnotification = endonnotification;
    if (isdefined(time)) {
        self.lightbarstructs[self.lightbarstructs.size - 1].time = time * 1000;
    } else {
        self.lightbarstructs[self.lightbarstructs.size - 1].time = undefined;
    }
    if (isdefined(endondeath) && endondeath) {
        thread endinactiveinstructionondeath(self.lightbarstructs[self.lightbarstructs.size - 1]);
    }
    if (isdefined(endonnotification)) {
        thread endinstructiononnotification(endonnotification, self.lightbarstructs[self.lightbarstructs.size - 1]);
    }
    thread managelightbarstack();
}

// Namespace lightbar / scripts/mp/lightbar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e5
// Size: 0x212
function managelightbarstack() {
    self notify("manageLightBarStack");
    self endon("manageLightBarStack");
    self endon("disconnect");
    for (;;) {
        wait(0.05);
        if (self.lightbarstructs.size > 1) {
            var_26f6ffd6e2ec128f = removetimedoutinstructions(self.lightbarstructs);
            var_43e4767d6281a8cd = array_sort_with_func(var_26f6ffd6e2ec128f, &is_higher_priority);
        } else {
            var_43e4767d6281a8cd = self.lightbarstructs;
        }
        if (var_43e4767d6281a8cd.size == 0) {
            return;
        }
        self.lightbarstructs = var_43e4767d6281a8cd;
        var_a50968c75b047599 = var_43e4767d6281a8cd[0];
        if (var_a50968c75b047599.executing) {
            continue;
        }
        infinitetime = !isdefined(self.lightbarstructs[self.lightbarstructs.size - 1].time);
        timeleft = 0;
        if (!infinitetime) {
            timesinceplaced = gettime() - var_a50968c75b047599.timeplacedinstack;
            timeleft = var_a50968c75b047599.time - timesinceplaced;
            timeleft = timeleft / 1000;
            if (timeleft <= 0) {
                self.lightbarstructs[0] notify("removed");
                self.lightbarstructs[0] = undefined;
                cleanlbarray();
                managelightbarstack();
            }
        }
        if (infinitetime) {
            if (var_a50968c75b047599.endondeath) {
                var_a50968c75b047599 notify("executing");
                var_a50968c75b047599.executing = 1;
                thread set_lightbar_perm_endon_death(var_a50968c75b047599.lbcolor, var_a50968c75b047599.pulsetime);
            } else {
                thread set_lightbar_perm(var_a50968c75b047599.lbcolor, var_a50968c75b047599.pulsetime);
            }
            continue;
        }
        if (var_a50968c75b047599.endondeath) {
            var_a50968c75b047599 notify("executing");
            var_a50968c75b047599.executing = 1;
            thread set_lightbar_for_time_endon_death(var_a50968c75b047599.lbcolor, var_a50968c75b047599.pulsetime, timeleft);
            continue;
        }
        thread set_lightbar_for_time(var_a50968c75b047599.lbcolor, var_a50968c75b047599.pulsetime, timeleft);
    }
}

// Namespace lightbar / scripts/mp/lightbar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5fe
// Size: 0x27
function cleanlbarray() {
    var_9b4ba2e4466f114b = array_removeundefined(self.lightbarstructs);
    self.lightbarstructs = var_9b4ba2e4466f114b;
}

// Namespace lightbar / scripts/mp/lightbar
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x62c
// Size: 0xbe
function removetimedoutinstructions(structarray) {
    temparray = [];
    foreach (instruction in structarray) {
        if (!isdefined(instruction.time)) {
            temparray[temparray.size] = instruction;
            continue;
        }
        timesinceplaced = gettime() - instruction.timeplacedinstack;
        timeleft = instruction.time - timesinceplaced;
        timeleft = timeleft / 1000;
        if (timeleft > 0) {
            temparray[temparray.size] = instruction;
        }
    }
    return temparray;
}

// Namespace lightbar / scripts/mp/lightbar
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6f2
// Size: 0x2b
function is_higher_priority(a, b) {
    return a.priority > b.priority;
}

// Namespace lightbar / scripts/mp/lightbar
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x725
// Size: 0x2b
function set_lightbar(lbcolor, pulsetime) {
    set_lightbar_pulse_time(pulsetime);
    set_lightbar_color(lbcolor);
    set_lightbar_on();
}

// Namespace lightbar / scripts/mp/lightbar
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x757
// Size: 0x62
function set_lightbar_for_time(lbcolor, pulsetime, time) {
    self notify("set_lightbar_for_time");
    self endon("set_lightbar_for_time");
    set_lightbar_pulse_time(pulsetime);
    set_lightbar_color(lbcolor);
    set_lightbar_on();
    wait(time);
    if (!isdefined(self)) {
        return;
    }
    set_lightbar_off();
    self.lightbarstructs = undefined;
    cleanlbarray();
}

// Namespace lightbar / scripts/mp/lightbar
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7c0
// Size: 0x3a
function set_lightbar_perm(lbcolor, pulsetime) {
    self notify("set_lightbar");
    self endon("set_lightbar");
    set_lightbar_pulse_time(pulsetime);
    set_lightbar_color(lbcolor);
    set_lightbar_on();
}

// Namespace lightbar / scripts/mp/lightbar
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x801
// Size: 0x33
function set_lightbar_endon_death(lbcolor, pulsetime) {
    set_lightbar_pulse_time(pulsetime);
    set_lightbar_color(lbcolor);
    set_lightbar_on();
    thread turn_off_light_bar_on_death();
}

// Namespace lightbar / scripts/mp/lightbar
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x83b
// Size: 0x7d
function set_lightbar_for_time_endon_death(lbcolor, pulsetime, time) {
    self notify("set_lightbar_for_time_endon_death");
    self endon("set_lightbar_for_time_endon_death");
    set_lightbar_pulse_time(pulsetime);
    set_lightbar_color(lbcolor);
    set_lightbar_on();
    thread turn_off_light_bar_on_death();
    wait(time);
    if (!isdefined(self)) {
        return;
    }
    set_lightbar_off();
    self.lightbarstructs[0] notify("removed");
    self.lightbarstructs[0] = undefined;
    cleanlbarray();
}

// Namespace lightbar / scripts/mp/lightbar
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8bf
// Size: 0x42
function set_lightbar_perm_endon_death(lbcolor, pulsetime) {
    self notify("set_lightbar_endon_death");
    self endon("set_lightbar_endon_death");
    set_lightbar_pulse_time(pulsetime);
    set_lightbar_color(lbcolor);
    set_lightbar_on();
    thread turn_off_light_bar_on_death();
}

// Namespace lightbar / scripts/mp/lightbar
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x908
// Size: 0x64
function endinactiveinstructionondeath(var_bbfd8d645f3d6f98) {
    self notify("endInactiveInstructionOnDeath");
    self endon("endInactiveInstructionOnDeath");
    var_bbfd8d645f3d6f98 endon("executing");
    self waittill("death");
    if (!isdefined(self)) {
        return;
    }
    if (self.lightbarstructs.size == 0) {
        return;
    }
    self.lightbarstructs[0] notify("removed");
    self.lightbarstructs[0] = undefined;
    cleanlbarray();
}

// Namespace lightbar / scripts/mp/lightbar
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x973
// Size: 0x9c
function endinstructiononnotification(endonnotification, var_bbfd8d645f3d6f98) {
    var_bbfd8d645f3d6f98 endon("removed");
    if (isarray(endonnotification)) {
        notificationreturned = waittill_any_in_array_return(endonnotification);
    } else {
        self waittill(endonnotification);
    }
    if (!isdefined(self)) {
        return;
    }
    for (i = 0; i < self.lightbarstructs.size; i++) {
        if (var_bbfd8d645f3d6f98 == self.lightbarstructs[i]) {
            if (var_bbfd8d645f3d6f98.executing) {
                set_lightbar_off();
            }
            self.lightbarstructs[i] = undefined;
            cleanlbarray();
            return;
        }
    }
}

// Namespace lightbar / scripts/mp/lightbar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa16
// Size: 0x5b
function turn_off_light_bar_on_death() {
    self notify("turn_Off_Light_Bar_On_Death");
    self endon("turn_Off_Light_Bar_On_Death");
    self waittill("death");
    if (!isdefined(self)) {
        return;
    }
    if (self.lightbarstructs.size == 0) {
        return;
    }
    set_lightbar_off();
    self.lightbarstructs[0] notify("removed");
    self.lightbarstructs[0] = undefined;
    cleanlbarray();
}

// Namespace lightbar / scripts/mp/lightbar
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa78
// Size: 0x19
function set_lightbar_color(lbcolor) {
    self setclientomnvar("lb_color", lbcolor);
}

// Namespace lightbar / scripts/mp/lightbar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa98
// Size: 0x11
function set_lightbar_on() {
    self setclientomnvar("lb_gsc_controlled", 1);
}

// Namespace lightbar / scripts/mp/lightbar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab0
// Size: 0x10
function set_lightbar_off() {
    self setclientomnvar("lb_gsc_controlled", 0);
}

// Namespace lightbar / scripts/mp/lightbar
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xac7
// Size: 0x19
function set_lightbar_pulse_time(pulsetime) {
    self setclientomnvar("lb_pulse_time", pulsetime);
}

