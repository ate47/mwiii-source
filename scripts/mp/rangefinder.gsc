// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;

#namespace rangefinder;

// Namespace rangefinder/namespace_197c8e5ab3ec5977
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b
// Size: 0x94
function runmprangefinder() {
    precachemodel("mw_scale_soldier");
    precachemodel("mw_test_soldier");
    precachemodel("mw_dist_soldier");
    wait(5);
    while (1) {
        if (getdvarint(@"hash_6d54ab37bfc60400", 0) == 1) {
            node = createcamnode();
            thread addmodeltoplayer(node);
            while (getdvarint(@"hash_6d54ab37bfc60400", 0) == 1) {
                wait(0.01);
            }
            node delete();
            level notify("rangeFinder_end");
        }
        wait(0.01);
    }
}

// Namespace rangefinder/namespace_197c8e5ab3ec5977
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c6
// Size: 0x40
function createcamnode() {
    cam = spawn("script_origin", level.players[0].origin);
    cam thread monitorplacement();
    cam thread managelink();
    return cam;
}

// Namespace rangefinder/namespace_197c8e5ab3ec5977
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e
// Size: 0xa6
function monitorplacement() {
    level endon("game_ended");
    level endon("rangeFinder_end");
    self.placementmode = "player";
    while (1) {
        if (getdvarint(@"hash_6d54ab37bfc60400", 0) == 1) {
            if (level.players[0] usebuttonpressed()) {
                self.placementmode = ter_op(self.placementmode == "player", "stationary", "player");
                level.players[0] notify("changed_placementMode");
                while (level.players[0] usebuttonpressed()) {
                    waitframe();
                }
            }
        }
        wait(0.01);
    }
}

// Namespace rangefinder/namespace_197c8e5ab3ec5977
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb
// Size: 0x6c
function managelink() {
    level endon("game_ended");
    level endon("rangeFinder_end");
    thread softlink();
    while (1) {
        level.players[0] waittill("changed_placementMode");
        if (self.placementmode == "player") {
            iprintlnbold("LINKED MODE");
            thread softlink();
        } else {
            iprintlnbold("STATIONARY MODE");
        }
        wait(0.01);
    }
}

// Namespace rangefinder/namespace_197c8e5ab3ec5977
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e
// Size: 0x98
function softlink() {
    level.players[0] endon("changed_placementMode");
    level endon("rangeFinder_end");
    while (1) {
        self.angles = (0, 90 + level.players[0].angles[1], 0);
        offset = anglestoforward(level.players[0].angles) * 40;
        self.origin = level.players[0].origin - offset;
        wait(0.01);
    }
}

// Namespace rangefinder/namespace_197c8e5ab3ec5977
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd
// Size: 0x60
function addmodeltoplayer(node) {
    rangefinder = spawn("script_model", node.origin);
    rangefinder.angles = node.angles;
    rangefinder setmodel("mw_dist_soldier");
    rangefinder linkto(node);
    rangefinder thread watchrangefinderend();
}

// Namespace rangefinder/namespace_197c8e5ab3ec5977
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x434
// Size: 0x12
function watchrangefinderend() {
    level waittill("rangeFinder_end");
    self delete();
}

