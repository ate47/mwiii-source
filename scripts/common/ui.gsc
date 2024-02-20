// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace ui;

// Namespace ui/namespace_61d0e47c5dff187c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81
// Size: 0x93
function lui_registercallback(channel, callback) {
    if (!isdefined(level.lui_callbacks)) {
        level.lui_callbacks = [];
    }
    /#
        assert(isstring(channel) && channel != "" && isfunction(callback));
    #/
    if (!isdefined(level.lui_callbacks[channel]) || !array_contains(level.lui_callbacks[channel], callback)) {
        level.lui_callbacks[channel] = array_add_safe(level.lui_callbacks[channel], callback);
    }
}

// Namespace ui/namespace_61d0e47c5dff187c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b
// Size: 0xc1
function lui_notify_callback(channel, value, value2) {
    if (isdefined(self)) {
        if (isdefined(level.lui_callbacks) && isdefined(level.lui_callbacks[channel])) {
            foreach (callback in level.lui_callbacks[channel]) {
                if (isdefined(value2)) {
                    self thread [[ callback ]](value, value2);
                } else {
                    self thread [[ callback ]](value);
                }
            }
        }
        if (isdefined(value2)) {
            self notify("luinotifyserver", channel);
        } else {
            self notify("luinotifyserver", channel);
        }
    }
}
