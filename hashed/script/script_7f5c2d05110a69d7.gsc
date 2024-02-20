// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5d813d45c6b1b1be;

#namespace namespace_d453071709327eb4;

// Namespace namespace_d453071709327eb4/namespace_db605e7dcda0ea09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130
// Size: 0x140
function init(var_5179c48492d1d2c2) {
    function_efabc5ae0422de9e(var_5179c48492d1d2c2);
    var_41be7ebb45d8dd74 = getstruct(var_5179c48492d1d2c2.target, "targetname");
    var_5179c48492d1d2c2.var_c346a5e3fb384cb7 = namespace_8eedd8f6cf5d9f19::function_698513ab21b7913d(var_41be7ebb45d8dd74);
    start_struct = getstruct(var_41be7ebb45d8dd74.target, "targetname");
    var_5179c48492d1d2c2.start_trigger = namespace_8eedd8f6cf5d9f19::function_698513ab21b7913d(start_struct);
    var_cf17d26636794c7 = getstruct(start_struct.target, "targetname");
    var_8283ec5a812caf98 = getstruct(var_cf17d26636794c7.target, "targetname");
    var_6659a5f662c10265 = getstruct(var_8283ec5a812caf98.target, "targetname");
    var_887f2e6bea2d6c52 = getstruct(var_6659a5f662c10265.target, "targetname");
    var_5179c48492d1d2c2.var_2e87c4e6838df655 = namespace_8eedd8f6cf5d9f19::function_698513ab21b7913d(var_887f2e6bea2d6c52);
    var_5179c48492d1d2c2.reward_struct = getstruct(var_887f2e6bea2d6c52.target, "targetname");
    thread function_afc2853526e95132(var_5179c48492d1d2c2);
}

// Namespace namespace_d453071709327eb4/namespace_db605e7dcda0ea09
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x277
// Size: 0x63
function private function_afc2853526e95132(var_5179c48492d1d2c2) {
    var_5179c48492d1d2c2 endon("MRP_CARDIO_NOTIFY_SUCCESS");
    while (1) {
        data = var_5179c48492d1d2c2.start_trigger waittill("trigger");
        if (isplayer(data) && data isonground()) {
            /#
                iprintlnbold("<unknown string>");
            #/
            data childthread function_bb60e753f1d92392(var_5179c48492d1d2c2);
        }
    }
}

// Namespace namespace_d453071709327eb4/namespace_db605e7dcda0ea09
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e1
// Size: 0x6d
function private function_bb60e753f1d92392(var_5179c48492d1d2c2) {
    self notify("MRP_CARDIO_NOTIFY_COMPLETE_SINGLETON");
    self endon("MRP_CARDIO_NOTIFY_COMPLETE_SINGLETON");
    self endon("MRP_CARDIO_NOTIFY_FAILURE");
    childthread function_4fb766a044b83739(var_5179c48492d1d2c2);
    childthread function_62039698fe5ac26e(var_5179c48492d1d2c2);
    while (1) {
        data = var_5179c48492d1d2c2.var_c346a5e3fb384cb7 waittill("trigger");
        if (data == self) {
            self notify("MRP_CARDIO_NOTIFY_CONTINUE");
        }
        wait(2);
    }
}

// Namespace namespace_d453071709327eb4/namespace_db605e7dcda0ea09
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x355
// Size: 0x4c
function private function_4fb766a044b83739(var_5179c48492d1d2c2) {
    while (1) {
        result = waittill_any_timeout_1(3, "MRP_CARDIO_NOTIFY_CONTINUE");
        if (result == "timeout") {
            /#
                iprintlnbold("<unknown string>");
            #/
            self notify("MRP_CARDIO_NOTIFY_FAILURE");
        }
    }
}

// Namespace namespace_d453071709327eb4/namespace_db605e7dcda0ea09
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a8
// Size: 0x7b
function private function_62039698fe5ac26e(var_5179c48492d1d2c2) {
    while (1) {
        data = var_5179c48492d1d2c2.var_2e87c4e6838df655 waittill("trigger");
        if (data == self) {
            var_5179c48492d1d2c2.var_c346a5e3fb384cb7 delete();
            var_5179c48492d1d2c2.start_trigger delete();
            var_5179c48492d1d2c2.var_2e87c4e6838df655 delete();
            thread function_f2170158cdfd04ea(var_5179c48492d1d2c2);
            var_5179c48492d1d2c2 notify("MRP_CARDIO_NOTIFY_SUCCESS");
        }
    }
}

// Namespace namespace_d453071709327eb4/namespace_db605e7dcda0ea09
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x42a
// Size: 0x2d
function private function_f2170158cdfd04ea(var_5179c48492d1d2c2) {
    function_568b8a57e0fa955f(var_5179c48492d1d2c2, self);
    namespace_8eedd8f6cf5d9f19::function_a4dfabe55dd4a652(self, var_5179c48492d1d2c2.reward_struct, "ob_jup_items_activity_mrp_cardio");
}
