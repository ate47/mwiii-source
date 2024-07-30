#using script_d74ae0b4aa21186;
#using scripts\engine\utility.gsc;
#using scripts\mp\gameobjects.gsc;

#namespace namespace_4b022bbde284cec1;

// Namespace namespace_4b022bbde284cec1 / namespace_45524b6bc7f1f3ac
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2
// Size: 0x65
function createevent() {
    event = function_c74368899713e7e6();
    event.result = [];
    eventstream = self.mind.eventstream;
    eventstream.var_c0f0c13703c22359 = event;
    eventstream.events[eventstream.events.size] = event;
}

// Namespace namespace_4b022bbde284cec1 / namespace_45524b6bc7f1f3ac
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f
// Size: 0x193
function getevent() {
    event = self.mind.eventstream.var_c0f0c13703c22359;
    if (!event.evaluated) {
        if (event.result.size > 0) {
            event.result = [];
        }
        if (!isdefined(level.objectives)) {
            return event.result;
        }
        foreach (obj in level.objectives) {
            switch (level.gametype) {
            case #"hash_ca6516c10db2c95":
            case #"hash_f4a9126c03d3385b": 
                if (self.team == obj scripts\mp\gameobjects::getownerteam()) {
                    continue;
                }
                break;
            case #"hash_6efb0f59a62300fb":
            case #"hash_ec72fd25bbbac99e": 
                if (!istrue(obj.active)) {
                    continue;
                }
                break;
            }
            event.result[event.result.size] = obj;
        }
        if (event.result.size > 1) {
            event.result = array_sort_with_func(event.result, &function_cb083b117c783af);
        }
        event.evaluated = 1;
    }
    return event.result;
}

// Namespace namespace_4b022bbde284cec1 / namespace_45524b6bc7f1f3ac
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb
// Size: 0x46
function function_cb083b117c783af(flaga, flagb) {
    return distancesquared(flaga.curorigin, self.origin) < distancesquared(flagb.curorigin, self.origin);
}

// Namespace namespace_4b022bbde284cec1 / namespace_45524b6bc7f1f3ac
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30a
// Size: 0x60
function function_b4e30a9548aa351b() {
    assert(level.gametype == "koth" || level.gametype == "koth_horde");
    nexthardpoint = level.prevzoneindex % level.objectives.size + 1;
    return level.objectives[string(nexthardpoint)];
}
