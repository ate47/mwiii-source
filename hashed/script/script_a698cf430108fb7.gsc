// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\player.gsc;
#using script_3b64eb40368c1450;
#using script_104e3370b024f998;
#using scripts\engine\trace.gsc;

#namespace namespace_ba300dc864b9baf9;

// Namespace namespace_ba300dc864b9baf9/namespace_9f9a23de1f1dc7ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22c
// Size: 0x155
function function_cfb677b5f7d5e644() {
    if (!isalive(self) || self isparachuting() || self isskydiving() || self isonladder() || self function_9cc921a57ff4deb5() || self isinexecutionattack() || self isinexecutionvictim()) {
        return 0;
    }
    if (istrue(self.inlaststand) || isdefined(self.usingremote) || istrue(self.isdeploying) || istrue(self.usingascender) || namespace_f8065cafc523dba5::function_b7869f6d9d4242e3(self) || istrue(self.isjuggernaut) || istrue(self.var_859654e0445a36d9)) {
        return 0;
    }
    if (isdefined(self.vehicle)) {
        return 0;
    }
    thread namespace_44abc05161e2e2cb::showsplash("super_teleport_deploy" + "_activate", undefined, self, undefined, undefined, undefined, 1);
    self setclientomnvar("ui_field_upgrade_use", 0);
    giveperk("specialty_third_person");
    function_6caa4b447cb1ee5c(1);
    self.plotarmor = 1;
    thread function_49e5c6a221425b7();
    delaythread(getdvarfloat(@"hash_96dbd55b49ef1c2b", 0.1), &function_456da1486741f194, 1);
    delaythread(getdvarfloat(@"hash_81dbead1ca86d536", 0.2), &function_e2b829448c14c0f4, 1);
    thread function_4b2fa585273dbb8c();
    return 1;
}

// Namespace namespace_ba300dc864b9baf9/namespace_9f9a23de1f1dc7ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x389
// Size: 0x39
function function_e2b829448c14c0f4(shouldhide) {
    if (shouldhide) {
        function_a593971d75d82113();
        function_379bb555405c16bb("temp_v_teleport_superpower::superTeleport_hide()");
    } else {
        function_6fb380927695ee76();
        function_985b0973f29da4f8("temp_v_teleport_superpower::superTeleport_hide()");
    }
}

// Namespace namespace_ba300dc864b9baf9/namespace_9f9a23de1f1dc7ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c9
// Size: 0xa4
function function_6caa4b447cb1ee5c(var_9f7dff969c876c26) {
    if (var_9f7dff969c876c26) {
        var_6944da8624ccdf1d = [0:"ads", 1:"weapon_switch", 2:"weapon_pickup", 3:"weapon_switch_clip", 4:"reload", 5:"allow_jump", 6:"usability", 7:"vehicle_use", 8:"execution_attack", 9:"execution_victim"];
        namespace_7e17181d03156026::_freezecontrols(1);
        namespace_1cd9f6896754adb0::function_59c053b89257bc95("teleport_superpower", var_6944da8624ccdf1d, 0);
    } else {
        namespace_7e17181d03156026::_freezecontrols(0);
        namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("teleport_superpower");
    }
}

// Namespace namespace_ba300dc864b9baf9/namespace_9f9a23de1f1dc7ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x474
// Size: 0x9d
function function_4b2fa585273dbb8c() {
    var_3f1786887462af7d = getdvarfloat(@"hash_62c67df9c015a11b", 1);
    wait(var_3f1786887462af7d);
    fadetoblackforplayer(self, 1, 0.25);
    removeperk("specialty_third_person");
    self setorigin(function_3754ea1a27eecdd8());
    self skydive_beginfreefall();
    delaythread(0.15, &function_e2b829448c14c0f4, 0);
    delaythread(0.2, &function_456da1486741f194, 0);
    self.plotarmor = undefined;
    function_6caa4b447cb1ee5c(0);
    fadetoblackforplayer(self, 0, 0.25);
    namespace_416e533f6ed17708::function_269b97f3d86eb172();
}

// Namespace namespace_ba300dc864b9baf9/namespace_9f9a23de1f1dc7ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x518
// Size: 0x180
function function_3754ea1a27eecdd8() {
    var_b3c15d36553b30b5 = self.origin + (0, 0, getdvarint(@"hash_6607bd90c44f0838", 5000));
    caststart = var_b3c15d36553b30b5;
    var_fa13273fbff1ab7c = self.origin;
    var_f4fb3e42fc7eee67 = 1000;
    mapcenter = level.mapcenter;
    var_b8726efb17f1fe54 = 0;
    while (1) {
        if (var_b8726efb17f1fe54 > 20) {
            position = var_fa13273fbff1ab7c;
            break;
        }
        castend = caststart + (0, 0, -2000);
        trace = namespace_2a184fc4902783dc::ray_trace(caststart, castend, self, namespace_2a184fc4902783dc::create_default_contents(1));
        var_142adc6587364423 = 0;
        position = caststart;
        dist = distance(caststart, trace["position"]);
        if (dist >= 1000) {
            var_142adc6587364423 = 1;
        }
        if (canspawn(position)) {
            if (var_142adc6587364423) {
                break;
            } else {
                var_fa13273fbff1ab7c = position;
            }
        }
        dir = flatten_vector(vectornormalize(mapcenter - caststart));
        caststart = caststart + dir * randomintrange(250, 1000);
        if (!var_142adc6587364423) {
            caststart = (caststart.x, caststart.y, var_b3c15d36553b30b5.z);
            caststart = caststart + (0, 0, var_f4fb3e42fc7eee67 - dist);
        }
        waitframe();
    }
    return position;
}

// Namespace namespace_ba300dc864b9baf9/namespace_9f9a23de1f1dc7ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a0
// Size: 0x3f
function function_456da1486741f194(var_be6106930385bd5b) {
    if (var_be6106930385bd5b) {
        playfx(namespace_3c37cb17ade254d::getfx("superPower_teleportOut"), self.origin);
    } else {
        self setscriptablepartstate("superpowers", "teleportIn", 0);
    }
}

// Namespace namespace_ba300dc864b9baf9/namespace_9f9a23de1f1dc7ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e6
// Size: 0x65
function function_49e5c6a221425b7() {
    self setscriptablepartstate("superpowers", "teleportOut", 0);
    soundorigin = self.origin + (0, 0, 15);
    soundent = spawn("script_origin", soundorigin);
    soundent playsound("br_the_boys_teleport_out_npc", self, soundent);
    wait(2);
    soundent delete();
}
