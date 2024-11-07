#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\hud_util.gsc;

#namespace namespace_3c21c55350cb346;

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a5
// Size: 0xcb
function main() {
    precachestring(%SCRIPT/INTELLIGENCE_OF_EIGHTEEN);
    precachestring(%SCRIPT/RORKEFILE_PREV_FOUND);
    precachestring(%SCRIPT/RORKEFILE_PICKUP);
    precachestring(%SCRIPT/INTELLIGENCE_PERCENT);
    precachestring(%SCRIPT/INTELLIGENCE_UPLOADING);
    /#
        setdevdvarifuninitialized(@"hash_69724876b38df066", 0);
    #/
    level.intel_items = create_array_of_intel_items();
    println("<dev string:x1c>", level.intel_items.size);
    setdvar(@"hash_6ca72b22ba2fd9ea", level.intel_items.size);
    level.intel_counter = 0;
    setdvar(@"hash_b80696ed82642848", level.intel_counter);
    level.table_origins = create_array_of_origins_from_table();
    initialize_intel();
    intel_think();
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x378
// Size: 0x62
function remove_all_intel() {
    foreach (trigger in level.intel_items) {
        if (!isdefined(trigger.removed)) {
            trigger remove_intel_item();
        }
    }
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e2
// Size: 0x74
function remove_intel_item() {
    self.removed = 1;
    self.item hide();
    self.item notsolid();
    trigger_off();
    level.intel_counter++;
    setdvar(@"hash_b80696ed82642848", level.intel_counter);
    println("<dev string:x4e>" + self.num);
    self notify("end_trigger_thread");
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45e
// Size: 0x74
function initialize_intel() {
    foreach (trigger in level.intel_items) {
        origin = trigger.origin;
        trigger.num = get_nums_from_origins(origin);
    }
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4da
// Size: 0x72
function intel_think() {
    foreach (trigger in level.intel_items) {
        if (trigger check_item_found()) {
            trigger remove_intel_item();
            continue;
        }
        trigger thread wait_for_pickup();
        trigger thread poll_for_found();
    }
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x554
// Size: 0x3b
function poll_for_found() {
    self endon("end_loop_thread");
    if (isdefined(self)) {
        if (check_item_found()) {
            remove_intel_item();
        }
    } else {
        return;
    }
    while (!check_item_found()) {
        wait 0.05;
    }
    remove_intel_item();
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x597
// Size: 0x61
function check_item_found() {
    foreach (player in level.players) {
        if (!player getplayerintelisfound(self.num)) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x601
// Size: 0x80
function create_array_of_intel_items() {
    var_464187c644b1053d = getentarray("intelligence_item", "targetname");
    for (i = 0; i < var_464187c644b1053d.size; i++) {
        println(var_464187c644b1053d[i].origin);
        var_464187c644b1053d[i].item = getent(var_464187c644b1053d[i].target, "targetname");
        var_464187c644b1053d[i].found = 0;
    }
    return var_464187c644b1053d;
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68a
// Size: 0xbe
function create_array_of_origins_from_table() {
    var_b9f8504d39e0fbb5 = 20;
    origins = [];
    for (num = 1; num <= var_b9f8504d39e0fbb5; num++) {
        location = tablelookup("sp/intel_items.csv", 0, num, 4);
        if (isdefined(location) && location != "undefined") {
            var_47a3a239c6b7196a = strtok(location, ",");
            assert(var_47a3a239c6b7196a.size == 3);
            for (i = 0; i < var_47a3a239c6b7196a.size; i++) {
                var_47a3a239c6b7196a[i] = int(var_47a3a239c6b7196a[i]);
            }
            origins[num] = (var_47a3a239c6b7196a[0], var_47a3a239c6b7196a[1], var_47a3a239c6b7196a[2]);
            continue;
        }
        origins[num] = undefined;
    }
    return origins;
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x751
// Size: 0x17
function award_intel() {
    save_intel_for_all_players();
    updategamerprofileall();
    waittillframeend();
    remove_intel_item();
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x770
// Size: 0x6a
function wait_for_pickup() {
    self endon("end_trigger_thread");
    /#
        thread function_555949ca6ee3ad37();
    #/
    if (self.classname == "trigger_use") {
        self sethintstring(%SCRIPT/RORKEFILE_PICKUP);
        self usetriggerrequirelookat(1);
    }
    thread upload_hold();
    self waittill("hold_complete");
    self notify("end_loop_thread");
    intel_feedback(level.player);
    award_intel();
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e2
// Size: 0xec
function upload_hold() {
    level.player.hold_count = 0;
    while (level.player.hold_count < 30 && isdefined(self)) {
        level.player.hold_count = 0;
        self stoploopsound("intelligence_pickup_loop");
        self waittill("trigger", player);
        self playloopsound("intelligence_pickup_loop");
        setdvar(@"ui_securing", "intel");
        setdvar(@"ui_securing_progress", 0);
        thread progress_bar();
        hold_count_check();
    }
    self notify("hold_complete");
    self stoploopsound("intelligence_pickup_loop");
    setdvar(@"ui_securing_progress", 1);
    setdvar(@"ui_securing", "");
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8d6
// Size: 0xeb
function hold_count_check() {
    self endon("stopped_pressing");
    while (isdefined(self) && isdefined(level.player)) {
        if (level.player usebuttonpressed() && distance(level.player.origin, self.origin) < 128 && isalive(level.player)) {
            level.player.hold_count++;
        } else {
            setdvar(@"ui_securing", "");
            self stoploopsound("intelligence_pickup_loop");
            self notify("stopped_pressing");
        }
        if (level.player.hold_count >= 30) {
            setdvar(@"ui_securing", "");
            self notify("stopped_pressing");
            self stoploopsound("intelligence_pickup_loop");
        }
        waitframe();
    }
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c9
// Size: 0x5e
function progress_bar() {
    self endon("stopped_pressing");
    var_e10d2077ef53fe8a = 30;
    var_b326ac4d10d79c52 = 8;
    for (i = 0; i < var_e10d2077ef53fe8a; i++) {
        setdvar(@"ui_securing_progress", getdvarfloat(@"ui_securing_progress") + 1 / var_e10d2077ef53fe8a);
        waitframe();
    }
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa2f
// Size: 0xd5
function intel_upload_text(text, text2) {
    self endon("stopped_pressing");
    var_e10d2077ef53fe8a = 30;
    var_f014d1434e653347 = 10;
    current_time = 0;
    for (i = 0; i < var_e10d2077ef53fe8a; i++) {
        if (current_time > var_f014d1434e653347) {
            current_time = 0;
        }
        if (current_time < var_f014d1434e653347 / 2) {
            text settext(%SCRIPT/INTELLIGENCE_UPLOADING);
        } else {
            text settext("");
        }
        text2.label = int(i / var_e10d2077ef53fe8a * 100);
        text2 settext(%SCRIPT/INTELLIGENCE_PERCENT);
        current_time++;
        waitframe();
    }
    text settext(%SCRIPT/INTELLIGENCE_UPLOADING);
    text2.label = "100";
    text2 settext(%SCRIPT/INTELLIGENCE_PERCENT);
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb0c
// Size: 0xa3
function save_intel_for_all_players() {
    assert(!check_item_found());
    foreach (player in level.players) {
        if (player getplayerintelisfound(self.num)) {
            continue;
        }
        player setplayerintelfound(self.num);
    }
    logstring("found intel item " + self.num);
    println("<dev string:x60>");
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbb7
// Size: 0x28
function give_point() {
    curvalue = self getplayerprogression("cheatPoints");
    self setplayerprogression("cheatPoints", curvalue + 1);
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbe7
// Size: 0x1cb
function intel_feedback(var_80d5e26dc21fb13b) {
    self.item hide();
    self.item notsolid();
    playsoundatpos(self.item.origin, "intelligence_pickup");
    display_time = 3000;
    fade_time = 700;
    var_adf0b02efe0bfe92 = display_time + fade_time / 1000;
    foreach (player in level.players) {
        if (var_80d5e26dc21fb13b != player && player getplayerintelisfound(self.num)) {
            continue;
        }
        var_988b782eabfded57 = player createclientfontstring("objective", 1.5);
        var_988b782eabfded57.glowcolor = (0.7, 0.7, 0.3);
        var_988b782eabfded57.glowalpha = 1;
        var_988b782eabfded57 setup_hud_elem();
        var_988b782eabfded57.y = -50;
        var_988b782eabfded57 setpulsefx(60, display_time, fade_time);
        var_324a6e68a953d960 = 0;
        if (var_80d5e26dc21fb13b == player && player getplayerintelisfound(self.num)) {
            var_988b782eabfded57.label = %SCRIPT/RORKEFILE_PREV_FOUND;
        } else {
            var_988b782eabfded57.label = %SCRIPT/INTELLIGENCE_OF_EIGHTEEN;
            player give_point();
            var_324a6e68a953d960 = player getplayerprogression("cheatPoints");
            var_988b782eabfded57 setvalue(var_324a6e68a953d960);
        }
        if (var_324a6e68a953d960 == 18) {
            player scripts\sp\utility::player_giveachievement_wrapper("EXT_1");
        }
        var_988b782eabfded57 delaycall(var_adf0b02efe0bfe92, &destroy);
    }
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdba
// Size: 0x70
function setup_hud_elem() {
    self.color = (1, 1, 1);
    self.alpha = 1;
    self.x = 0;
    self.alignx = "center";
    self.aligny = "middle";
    self.horzalign = "center";
    self.vertalign = "middle";
    self.foreground = 1;
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe32
// Size: 0x109
function assert_if_identical_origins() {
    origins = [];
    for (i = 1; i < 65; i++) {
        location = tablelookup("sp/intel_items.csv", 0, i, 4);
        var_47a3a239c6b7196a = strtok(location, ",");
        for (i = 0; i < var_47a3a239c6b7196a.size; i++) {
            var_47a3a239c6b7196a[i] = int(var_47a3a239c6b7196a[i]);
        }
        origins[i] = (var_47a3a239c6b7196a[0], var_47a3a239c6b7196a[1], var_47a3a239c6b7196a[2]);
    }
    for (i = 0; i < origins.size; i++) {
        if (!isdefined(origins[i])) {
            continue;
        }
        if (origins[i] == "undefined") {
            continue;
        }
        for (j = 0; j < origins.size; j++) {
            if (!isdefined(origins[j])) {
                continue;
            }
            if (origins[j] == "undefined") {
                continue;
            }
            if (i == j) {
                continue;
            }
            if (origins[i] == origins[j]) {
                assertmsg("intel items in sp/intel_items.csv with identical origins (" + origins[i] + ") ");
            }
        }
    }
}

// Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf43
// Size: 0x76
function get_nums_from_origins(origin) {
    for (i = 1; i < level.table_origins.size + 1; i++) {
        if (!isdefined(level.table_origins[i])) {
            continue;
        }
        if (distancesquared(origin, level.table_origins[i]) < squared(75)) {
            return i;
        }
    }
    assertmsg("Add the origin of this intel item ( " + origin + " ) to sp/intel_items.csv file");
}

/#

    // Namespace namespace_3c21c55350cb346 / scripts\sp\intelligence
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xfc1
    // Size: 0x34
    function function_555949ca6ee3ad37() {
        while (true) {
            if (getdvarint(@"hash_69724876b38df066")) {
                award_intel();
                self notify("<dev string:x94>");
                return;
            }
            wait 0.05;
        }
    }

#/