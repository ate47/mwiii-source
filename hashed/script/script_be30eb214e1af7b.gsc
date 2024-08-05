#using scripts\engine\utility.gsc;
#using script_be30eb214e1af7b;
#using script_5af9038262d22c96;
#using scripts\stealth\player.gsc;
#using scripts\cp\utility.gsc;
#using scripts\cp\utility\player.gsc;
#using script_519bed5012f1c015;
#using scripts\stealth\utility.gsc;

#namespace namespace_a77e4402541124ae;

// Namespace namespace_a77e4402541124ae / namespace_dbc09aedfbfae91f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x137
// Size: 0x54
function init() {
    level.var_6ccee8e6c00f06e6 = &namespace_dbc09aedfbfae91f::init_player;
    setdvarifuninitialized(@"hash_50363b4004713d67", 1);
    if (getdvarint(@"hash_50363b4004713d67")) {
        level.stealth.fnsixthsense = &sixthsense_init;
        level thread namespace_4d62562249d2171e::function_a5ff5e1965faf40e();
    }
}

// Namespace namespace_a77e4402541124ae / namespace_dbc09aedfbfae91f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x193
// Size: 0x43
function init_player() {
    flag_wait("introscreen_over");
    thread scripts\stealth\player::stealthhints_thread();
    if (isdefined(level.stealth.fnsixthsense)) {
        [[ level.stealth.fnsixthsense ]]();
    }
}

// Namespace namespace_a77e4402541124ae / namespace_dbc09aedfbfae91f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1de
// Size: 0x4c
function sixthsense_init() {
    self endon("death");
    self.sixthsense = spawnstruct();
    self.sixthsense.active = 1;
    /#
        setdvarifuninitialized(@"hash_3a87475a75de0350", 0);
    #/
    scripts\cp\utility::giveperk("specialty_sixth_sense");
}

// Namespace namespace_a77e4402541124ae / namespace_dbc09aedfbfae91f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x232
// Size: 0x2a
function dropaiaccuracy() {
    assertex(isplayer(self), " This function needs to be called on a Player entity ");
    namespace_4d62562249d2171e::function_f9dd1250ea99d251(0.1);
    childthread function_20704b3608e508dc();
}

// Namespace namespace_a77e4402541124ae / namespace_dbc09aedfbfae91f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x264
// Size: 0x23
function function_20704b3608e508dc() {
    self endon("disconnect");
    self waittill("lost_sight_of_player");
    self.var_77f9fbfdbac2529c = 1;
    scripts\cp\utility\player::_enableignoreme();
}

// Namespace namespace_a77e4402541124ae / namespace_dbc09aedfbfae91f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28f
// Size: 0x3d
function revertaiaccuracy() {
    assertex(isplayer(self), " This function needs to be called on a Player entity ");
    namespace_4d62562249d2171e::function_f9dd1250ea99d251(1);
    if (istrue(self.var_77f9fbfdbac2529c)) {
        self.var_77f9fbfdbac2529c = undefined;
        scripts\cp\utility\player::_disableignoreme();
    }
}

// Namespace namespace_a77e4402541124ae / namespace_dbc09aedfbfae91f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d4
// Size: 0xac
function function_5af9997f0eefb9a2(bspotted) {
    if (getdvarint(@"hash_f328bd7db3329d5e", 0) != 0) {
        if (istrue(bspotted)) {
            if (!isdefined(self.var_19ae4118816007e7)) {
                namespace_8235b93197138d09::function_36d589dc5c4191f6("default");
            }
        } else {
            self notify("lost_sight_of_player");
            if (!isdefined(self.var_19ae4118816007e7)) {
                namespace_8235b93197138d09::function_36d589dc5c4191f6("cqb");
            }
        }
    }
    if (istrue(bspotted)) {
        drone = scripts\stealth\utility::get_player_drone();
        if (isdefined(drone)) {
            return;
        }
        if (isdefined(level.var_ef796ac0b0326726) && isfunction(level.var_ef796ac0b0326726)) {
            level thread [[ level.var_ef796ac0b0326726 ]](undefined, bspotted);
        }
    }
}

