// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\challenges.gsc;

#namespace gestures;

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74c
// Size: 0x104
function init() {
    level.gestureinfo = [];
    level.gestureinfobyindex = [];
    val::register("gesture", 1, 0, "$self", &function_9e06fa9c92578f0d, "$value");
    for (row = 0; 1; row++) {
        ref = tablelookupbyrow("mp/gesturetable.csv", row, 0);
        if (!isdefined(ref) || ref == "") {
            break;
        }
        data = tablelookupbyrow("mp/gesturetable.csv", row, 1);
        if (!isdefined(data) || data == "") {
            break;
        }
        index = int(tablelookupbyrow("mp/gesturetable.csv", row, 8));
        if (isdefined(index)) {
            level.gestureinfobyindex[index] = data;
        }
        level.gestureinfo[ref] = data;
    }
    level.rockpaperscissors = [0:"ges_plyr_gesture043", 1:"ges_plyr_gesture114", 2:"ges_plyr_gesture115"];
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x857
// Size: 0x32
function getgesturedata(ref) {
    if (isbot(self) && ref == "devilhorns_mp") {
        ref = "gesture009";
    }
    return level.gestureinfo[ref];
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x891
// Size: 0x17
function getgesturedatabyindex(index) {
    return level.gestureinfobyindex[index];
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8b0
// Size: 0x6b
function private function_9e06fa9c92578f0d(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        if (is_player_gamepad_enabled()) {
            self setactionslot(1, "taunt");
        } else {
            self setactionslot(7, "taunt");
        }
    } else if (is_player_gamepad_enabled()) {
        self setactionslot(1, "");
    } else {
        self setactionslot(7, "");
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x922
// Size: 0x83
function cleargesture() {
    self notify("clearGesture");
    if (isdefined(self.gestureweapon) && self.gestureweapon != "none") {
        if (is_player_gamepad_enabled()) {
            self setactionslot(1, "");
        } else {
            self setactionslot(7, "");
        }
        if (self hasweapon(self.gestureweapon)) {
            _takeweapon(self.gestureweapon);
        }
        self.gestureweapon = "none";
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ac
// Size: 0x134
function givegesture(gestureweapon) {
    /#
        assertex(gestureweapon != "none", "giveGesture() passed gestureWeapon of "none"");
    #/
    /#
        assertex(!isdefined(self.gestureweapon) || self.gestureweapon == "none", "giveGesture() called on player with already set gesture");
    #/
    if (is_player_gamepad_enabled()) {
        self setactionslot(1, "taunt");
    } else {
        self setactionslot(7, "taunt");
    }
    _giveweapon(gestureweapon);
    self assignweaponoffhandtaunt(gestureweapon);
    self.gestureweapon = gestureweapon;
    if (issharedfuncdefined("game", "lpcFeatureGated")) {
        if (![[ getsharedfunc("game", "lpcFeatureGated") ]]()) {
            switch (gestureweapon) {
            case #"hash_e3d706263fb4a279":
                thread gesture_rockpaperscissorsthink();
                gestureweapon = gesture_pickrockpaperscissors();
                break;
            case #"hash_e3da89263fb7af49":
                var_8c3771f0b13ac9bc = ter_op(cointoss(), "ges_plyr_gesture050", "ges_plyr_gesture052");
                thread gesture_coinflipthink(var_8c3771f0b13ac9bc);
                gestureweapon = var_8c3771f0b13ac9bc;
                break;
            }
            if (!self isconsoleplayer()) {
                thread monitorgamepadswitch();
            }
            thread gesture_manage3rdperson();
        }
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae7
// Size: 0xa4
function monitorgamepadswitch() {
    self endon("clearGesture");
    self endon("disconnect");
    var_cca5d182ecca9e1a = is_player_gamepad_enabled();
    while (1) {
        if (isdefined(self.disabledgesture) && self.disabledgesture > 0) {
            waitframe();
            continue;
        }
        var_6ca54de3e40aec0c = is_player_gamepad_enabled();
        if (var_6ca54de3e40aec0c != var_cca5d182ecca9e1a) {
            if (var_cca5d182ecca9e1a) {
                self setactionslot(1, "");
                self setactionslot(7, "taunt");
            } else {
                self setactionslot(1, "taunt");
                self setactionslot(7, "");
            }
        }
        var_cca5d182ecca9e1a = var_6ca54de3e40aec0c;
        waitframe();
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb92
// Size: 0x25
function gesture_manage3rdperson() {
    self endon("disconnect");
    while (1) {
        objweapon = self waittill("offhand_pullback");
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbe
// Size: 0x1d
function gesture_pickrockpaperscissors() {
    return level.rockpaperscissors[randomintrange(0, level.rockpaperscissors.size)];
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe3
// Size: 0xb8
function gesture_rockpaperscissorsthink() {
    self endon("clearGesture");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self notify("gesture_rockPaperScissorsThink()");
    self endon("gesture_rockPaperScissorsThink()");
    while (1) {
        self waittill("used_cosmetic_gesture");
        var_bff1e3c9ba212857 = undefined;
        if (namespace_4b0406965e556711::gameflag("prematch_done") && getdvarint(@"hash_873992478b2f6deb", 0) == 0) {
            self [[ level.showerrormessagefunc ]]("MP_INGAME_ONLY/RPS_TOO_LATE");
            var_bff1e3c9ba212857 = 0;
        } else {
            self [[ level.showerrormessagefunc ]]("MP_INGAME_ONLY/RPS_START");
            var_bff1e3c9ba212857 = 1;
        }
        self waittill("offhand_fired");
        if (var_bff1e3c9ba212857) {
            thread gesture_playrockpaperscissors();
        }
        self waittill("offhand_end");
        thread gesture_resetrockpaperscissorsgesture();
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca2
// Size: 0x16
function gesture_resetrockpaperscissorsgesture() {
    cleargesture();
    givegesture("ges_plyr_gesture043");
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbf
// Size: 0x110
function gesture_playrockpaperscissors() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    self endon("rockPaperScissorsFinished");
    self notify("gesture_playRockPaperScissors()");
    self endon("gesture_playRockPaperScissors()");
    opponent = gesture_getrockpaperscissorsplayers();
    if (isdefined(opponent)) {
        winner = gesture_determinerockpaperscissorswinner(self, self.gestureweapon, opponent, opponent.rockpaperscissorschoice);
        if (isdefined(winner)) {
            winner [[ level.showerrormessagefunc ]]("MP_INGAME_ONLY/RPS_WIN");
            winner thread [[ level.var_97e29f66f7229f48 ]]("rock_paper_scissors_win");
            loser = ter_op(winner == self, opponent, self);
            loser [[ level.showerrormessagefunc ]]("MP_INGAME_ONLY/RPS_LOSE");
        } else {
            self [[ level.showerrormessagefunc ]]("MP_INGAME_ONLY/RPS_DRAW");
            opponent [[ level.showerrormessagefunc ]]("MP_INGAME_ONLY/RPS_DRAW");
        }
        opponent notify("rockPaperScissorsFinished");
        opponent.rockpaperscissorschoice = undefined;
        return;
    }
    self.rockpaperscissorschoice = self.gestureweapon;
    wait(3);
    self.rockpaperscissorschoice = undefined;
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd6
// Size: 0x130
function gesture_getrockpaperscissorsplayers() {
    forward = anglestoforward(self getplayerangles());
    var_ef269077a28646eb = utility::playersinsphere(self.origin, 500);
    foreach (otherplayer in var_ef269077a28646eb) {
        if (!isdefined(otherplayer) || otherplayer == self) {
            continue;
        }
        if (!isdefined(otherplayer.rockpaperscissorschoice)) {
            continue;
        }
        var_7a25ddb41e7358db = otherplayer.origin - self.origin;
        var_7a25ddb41e7358db = vectornormalize(var_7a25ddb41e7358db);
        var_4a0d170010397660 = vectordot(var_7a25ddb41e7358db, forward);
        if (var_4a0d170010397660 < 0.707107) {
            continue;
        }
        var_c1ff07becb2ad921 = anglestoforward(otherplayer getplayerangles());
        var_577d4bc399877ae4 = var_7a25ddb41e7358db * -1;
        var_a16efa238faeb70f = vectordot(var_577d4bc399877ae4, var_c1ff07becb2ad921);
        if (var_a16efa238faeb70f < 0.707107) {
            continue;
        }
        return otherplayer;
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0d
// Size: 0x89
function gesture_determinerockpaperscissorswinner(player1, var_ce0996d6bd90c7d4, player2, var_5f15c93009bbde89) {
    if (var_ce0996d6bd90c7d4 == var_5f15c93009bbde89) {
        return undefined;
    }
    switch (var_ce0996d6bd90c7d4) {
    case #"hash_e3d706263fb4a279":
        return ter_op(var_5f15c93009bbde89 == "ges_plyr_gesture114", player2, player1);
    case #"hash_eaeaf42643537972":
        return ter_op(var_5f15c93009bbde89 == "ges_plyr_gesture115", player2, player1);
    case #"hash_eaeaf52643537b05":
        return ter_op(var_5f15c93009bbde89 == "ges_plyr_gesture043", player2, player1);
        break;
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9d
// Size: 0x5e
function gesture_coinflipthink(gesture) {
    self endon("clearGesture");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self notify("gesture_coinFlipThink()");
    self endon("gesture_coinFlipThink()");
    while (1) {
        self waittill("used_cosmetic_gesture");
        while (1) {
            if (!self isgestureplaying(gesture)) {
                break;
            }
            waitframe();
        }
        thread gesture_resetcoinflipgesture();
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1002
// Size: 0x16
function gesture_resetcoinflipgesture() {
    cleargesture();
    givegesture("ges_plyr_gesture050");
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x101f
// Size: 0x3a
function haschangedarchetype() {
    if (isdefined(self.changedarchetypeinfo)) {
        if (!isdefined(self.lastarchetypeinfo)) {
            return 1;
        }
        if (self.changedarchetypeinfo != self.lastarchetypeinfo) {
            return 1;
        }
    }
    return 0;
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1061
// Size: 0x7e
function monitorcontextualcallout() {
    if (isai(self)) {
        return;
    }
    self endon("death_or_disconnect");
    level endon("game_ended");
    self endon("unsetLocationMarking");
    self notify("contextualCallout");
    self endon("contextualCallout");
    if (is_player_gamepad_enabled()) {
        self notifyonplayercommand("activateGesture", "+actionslot 1");
    } else {
        self notifyonplayercommand("activateGesture", "+actionslot 7");
    }
    waitframe();
    cleargesture();
    while (1) {
        self waittill("activateGesture");
        processcontext();
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e6
// Size: 0x312
function processcontext() {
    startpos = self geteye();
    viewangles = self getplayerangles();
    fwd = anglestoforward(viewangles);
    mindot = cos(10);
    bestdot = undefined;
    var_37088d8c2341bc50 = undefined;
    var_69035efa489d7aa8 = [];
    if (isdefined(self.engstructks)) {
        foreach (ent in self.engstructks.outlinedents) {
            var_69035efa489d7aa8[var_69035efa489d7aa8.size] = ent;
        }
    }
    if (isdefined(self.locationmarking_structveh)) {
        foreach (ent in self.locationmarking_structveh.outlinedents) {
            var_69035efa489d7aa8[var_69035efa489d7aa8.size] = ent;
        }
    }
    if (isdefined(self.locationmarking_structeqp)) {
        foreach (ent in self.locationmarking_structeqp.outlinedents) {
            var_69035efa489d7aa8[var_69035efa489d7aa8.size] = ent;
        }
    }
    foreach (ent in var_69035efa489d7aa8) {
        dot = vectordot(fwd, vectornormalize(ent.origin - startpos));
        if (!isdefined(bestdot) || bestdot < dot) {
            bestdot = dot;
            var_37088d8c2341bc50 = ent;
        }
    }
    if (isdefined(var_37088d8c2341bc50) && bestdot > mindot) {
        if (isdefined(var_37088d8c2341bc50.vehicle)) {
            var_37088d8c2341bc50 = var_37088d8c2341bc50.vehicle;
        }
        thread applyoutlinecalloutsource(var_37088d8c2341bc50);
    } else {
        if (isdefined(level.gamemodegesturecalloutassign) && self thread [[ level.gamemodegesturecalloutassign ]]()) {
            goto LOC_00000310;
        }
        content = [0:"physicscontents_clipshot", 1:"physicscontents_missileclip", 2:"physicscontents_vehicle", 3:"physicscontents_characterproxy", 4:"physicscontents_glass", 5:"physicscontents_itemclip"];
        contentoverride = physics_createcontents(content);
        endpos = startpos + fwd * 10000;
        trace = namespace_2a184fc4902783dc::sphere_trace(startpos, endpos, 0.1, self, contentoverride, 0);
        if (trace["fraction"] < 0.99) {
            thread markworldposition(trace["position"]);
        LOC_00000310:
        }
    LOC_00000310:
    }
LOC_00000310:
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ff
// Size: 0x12b
function markworldposition(org) {
    self.worldmarkerpos = org;
    if (!isdefined(self.worldmarkerid)) {
        self.worldmarkerid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
        if (self.worldmarkerid != -1) {
            namespace_5a22b6f3a56f7e9b::objective_add_objective(self.worldmarkerid, "invisible", org, "icon_waypoint_marker");
            namespace_5a22b6f3a56f7e9b::objective_teammask_single(self.worldmarkerid, self.team);
            namespace_5a22b6f3a56f7e9b::update_objective_setbackground(self.worldmarkerid, 1);
            namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.worldmarkerid, 0);
            namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.worldmarkerid, 0);
        } else {
            self.worldmarkerid = undefined;
            return;
        }
    } else {
        namespace_5a22b6f3a56f7e9b::update_objective_position(self.worldmarkerid, org);
    }
    objid = self.worldmarkerid;
    self notify("markWorldPosition");
    self endon("markWorldPosition");
    namespace_5a22b6f3a56f7e9b::objective_set_pulsate(objid, 1);
    wait(3);
    namespace_5a22b6f3a56f7e9b::objective_set_pulsate(objid, 0);
    wait(5);
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(objid);
    self.worldmarkerid = undefined;
    self.worldmarkerpos = undefined;
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1531
// Size: 0x239
function applyoutlinecalloutsource(ent) {
    if (!isdefined(ent.outlinecalloutsource)) {
        ent.outlinecalloutsource = [];
    }
    foreach (player in ent.outlinecalloutsource) {
        if (player == self) {
            return;
        }
    }
    event = "assist_ping";
    points = 0;
    if (issharedfuncdefined("rank", "getScoreInfoValue")) {
        points = [[ getsharedfunc("rank", "getScoreInfoValue") ]](event);
    }
    if (issharedfuncdefined("rank", "giveRankXP")) {
        self thread [[ getsharedfunc("rank", "giveRankXP") ]](event, points);
    }
    if (issharedfuncdefined("supers", "giveSuperPoints")) {
        self thread [[ getsharedfunc("supers", "giveSuperPoints") ]](points);
    }
    if (issharedfuncdefined("rank", "scoreEventPopup")) {
        self thread [[ getsharedfunc("rank", "scoreEventPopup") ]](event);
    }
    outlines = [];
    id = undefined;
    if (issharedfuncdefined("outline", "outlineEnableForTeam")) {
        id = [[ getsharedfunc("outline", "outlineEnableForTeam") ]](ent, self.team, "outline_nodepth_red", "perk_superior");
    }
    ent.outlinecalloutsource[ent.outlinecalloutsource.size] = self;
    outlines[id] = ent;
    var_c09f31c1c604eaef = 0;
    if (isdefined(ent.turret)) {
        id = undefined;
        if (issharedfuncdefined("outline", "outlineEnableForTeam")) {
            id = [[ getsharedfunc("outline", "outlineEnableForTeam") ]](ent.turret, self.team, "outline_nodepth_red", "perk_superior");
        }
        outlines[id] = ent.turret;
        var_c09f31c1c604eaef = 1;
    }
    if (var_c09f31c1c604eaef) {
        ent thread processtimeout(self, outlines);
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1771
// Size: 0xdf
function processtimeout(attacker, outlines) {
    attacker endon("disconnect");
    self endon("death");
    timeout = 30;
    wait(timeout);
    for (i = 0; i < self.outlinecalloutsource.size; i++) {
        if (self.outlinecalloutsource[i] == attacker) {
            self.outlinecalloutsource[i] = undefined;
        }
    }
    foreach (id, ent in outlines) {
        if (issharedfuncdefined("outline", "outlineDisable")) {
            [[ getsharedfunc("outline", "outlineDisable") ]](id, ent);
        }
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1857
// Size: 0x1e1
function processcalloutdeath(ent, attacker) {
    if (!isdefined(ent) || !isdefined(attacker)) {
        return;
    }
    if (!isdefined(ent.outlinecalloutsource)) {
        return;
    }
    foreach (player in ent.outlinecalloutsource) {
        if (!isdefined(player)) {
            continue;
        }
        if (player == attacker) {
            continue;
        }
        if (istrue(namespace_f8065cafc523dba5::playersareenemies(player, attacker))) {
            continue;
        }
        scoreevent = "assist_marked";
        points = 0;
        if (issharedfuncdefined("rank", "getScoreInfoValue")) {
            points = [[ getsharedfunc("rank", "getScoreInfoValue") ]](scoreevent);
        }
        if (issharedfuncdefined("rank", "giveRankXP")) {
            player thread [[ getsharedfunc("rank", "giveRankXP") ]](scoreevent, points);
        }
        if (issharedfuncdefined("supers", "giveSuperPoints")) {
            player thread [[ getsharedfunc("supers", "giveSuperPoints") ]](points);
        }
        if (issharedfuncdefined("rank", "scoreEventPopup")) {
            player thread [[ getsharedfunc("rank", "scoreEventPopup") ]](scoreevent);
        }
        points = 25;
        if (issharedfuncdefined("rank", "giveRankXP")) {
            attacker thread [[ getsharedfunc("rank", "giveRankXP") ]](scoreevent, points);
        }
        if (issharedfuncdefined("supers", "giveSuperPoints")) {
            attacker thread [[ getsharedfunc("supers", "giveSuperPoints") ]](points);
        }
        if (issharedfuncdefined("rank", "scoreEventPopup")) {
            attacker thread [[ getsharedfunc("rank", "scoreEventPopup") ]](scoreevent);
        }
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3f
// Size: 0x28b
function applygamemodecallout(ent, msg, event) {
    self endon("disconnect");
    if (isdefined(self.gamemodecalloutent)) {
        if (self.gamemodecalloutent == ent) {
            return;
        }
        self notify("gamemode_callout_replaced");
    } else {
        scoreevent = "assist_ping";
        points = 0;
        if (issharedfuncdefined("rank", "getScoreInfoValue")) {
            points = [[ getsharedfunc("rank", "getScoreInfoValue") ]](scoreevent);
        }
        if (issharedfuncdefined("rank", "giveRankXP")) {
            self thread [[ getsharedfunc("rank", "giveRankXP") ]](scoreevent, points);
        }
        if (issharedfuncdefined("supers", "giveSuperPoints")) {
            self thread [[ getsharedfunc("supers", "giveSuperPoints") ]](points);
        }
        if (issharedfuncdefined("rank", "scoreEventPopup")) {
            self thread [[ getsharedfunc("rank", "scoreEventPopup") ]](scoreevent);
        }
    }
    self.gamemodecallouttime = gettime();
    self.gamemodecalloutent = ent;
    id = undefined;
    if (isdefined(ent.outlineent)) {
        id = undefined;
        if (issharedfuncdefined("outline", "outlineEnableForTeam")) {
            id = [[ getsharedfunc("outline", "outlineEnableForTeam") ]](ent.outlineent, self.team, "outline_nodepth_red", "perk_superior");
        }
    }
    foreach (player in level.players) {
        if (player.team != self.team) {
            continue;
        }
        player iprintlnbold(msg);
    }
    thread waittillobjectiveevent(id, ent, event);
    thread waittillobjectivereplaced(id, ent, event);
    timeout = 30;
    waittill_notify_or_timeout("callout_processed_" + event, timeout);
    self notify("callout_timeout_" + event);
    if (isdefined(ent.outlineent)) {
        if (issharedfuncdefined("outline", "outlineDisable")) {
            [[ getsharedfunc("outline", "outlineDisable") ]](id, ent.outlineent);
        }
    }
    self.gamemodecalloutent = undefined;
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd1
// Size: 0x21b
function waittillobjectiveevent(id, ent, event) {
    self endon("callout_timeout_" + event);
    self endon("gamemode_callout_replaced");
    self endon("disconnect");
    team = self.team;
    while (1) {
        player = ent waittill(event);
        var_98da853291a33610 = 0;
        if (isdefined(level.gamemodegesturecalloutverify)) {
            var_98da853291a33610 = self [[ level.gamemodegesturecalloutverify ]](event, player);
        }
        if (var_98da853291a33610) {
            scoreevent = "assist_marked";
            points = 0;
            if (issharedfuncdefined("rank", "getScoreInfoValue")) {
                points = [[ getsharedfunc("rank", "getScoreInfoValue") ]](scoreevent);
            }
            if (issharedfuncdefined("rank", "giveRankXP")) {
                self thread [[ getsharedfunc("rank", "giveRankXP") ]](scoreevent, points);
            }
            if (issharedfuncdefined("supers", "giveSuperPoints")) {
                self thread [[ getsharedfunc("supers", "giveSuperPoints") ]](points);
            }
            if (issharedfuncdefined("rank", "scoreEventPopup")) {
                self thread [[ getsharedfunc("rank", "scoreEventPopup") ]](scoreevent);
            }
            points = 25;
            if (issharedfuncdefined("rank", "giveRankXP")) {
                player thread [[ getsharedfunc("rank", "giveRankXP") ]](scoreevent, points);
            }
            if (issharedfuncdefined("supers", "giveSuperPoints")) {
                player thread [[ getsharedfunc("supers", "giveSuperPoints") ]](points);
            }
            if (issharedfuncdefined("rank", "scoreEventPopup")) {
                player thread [[ getsharedfunc("rank", "scoreEventPopup") ]](scoreevent);
            }
            if (isdefined(ent.outlineent)) {
                if (issharedfuncdefined("outline", "outlineDisable")) {
                    [[ getsharedfunc("outline", "outlineDisable") ]](id, ent.outlineent);
                }
            }
            self notify("callout_processed_" + event);
            break;
        }
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef3
// Size: 0x7e
function waittillobjectivereplaced(id, ent, event) {
    self endon("callout_timeout_" + event);
    self endon("callout_processed_" + event);
    self endon("disconnect");
    self waittill("gamemode_callout_replaced");
    if (isdefined(ent.outlineent)) {
        if (issharedfuncdefined("outline", "outlineDisable")) {
            [[ getsharedfunc("outline", "outlineDisable") ]](id, ent.outlineent);
        }
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f78
// Size: 0x8e
function startholowatchvfx() {
    if (level.mapname == "mp_hackney_yard" || level.mapname == "mp_spear_pm" || level.mapname == "mp_runner_pm" || level.mapname == "mp_cave") {
        self setscriptablepartstate("watchVFXPlayer", "holoWatchOnNight");
        self setclientomnvar("ui_pet_watch_state", 1);
    } else {
        self setscriptablepartstate("watchVFXPlayer", "holoWatchOn");
        self setclientomnvar("ui_pet_watch_state", 0);
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200d
// Size: 0x4f
function startbluntwatchvfx() {
    if (istrue(self.var_74e82e1456d96cad)) {
        return;
    }
    self setscriptablepartstate("watchVFXPlayer", "bluntWatchOn");
    self setclientomnvar("ui_pet_watch_state", 0);
    self setwristwatchtime(4, 20, 1);
    self.var_74e82e1456d96cad = 1;
    thread function_a4f0da4979f60824();
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2063
// Size: 0x46
function function_a4f0da4979f60824() {
    self endon("disconnect");
    self endon("game_ended");
    wait(4.2);
    self.var_74e82e1456d96cad = undefined;
    self setscriptablepartstate("watchVFXPlayer", "off");
    if (isdefined(self.accessorylogic)) {
        self clearwristwatchtime();
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b0
// Size: 0x8f
function tryreenablescriptablevfx() {
    self endon("death_or_disconnect");
    self setscriptablepartstate("watchVFXPlayer", "off");
    var_c0b92b6128568c20 = isdefined(self.accessorylogic) && self.accessorylogic == "holo";
    if (var_c0b92b6128568c20) {
        wait(0.2);
        var_602111b3819425b2 = self hasweapon("iw8_acc_weapon_watch_2+iw8_acc_attach_face_digital_ag");
        if (var_602111b3819425b2 && (!isdefined(self.smartwatchinteract) || istrue(self.smartwatchinteract))) {
            if (var_602111b3819425b2) {
                startholowatchvfx();
            }
        }
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2146
// Size: 0x206
function watchradialgestureactivation(var_d608d01a055671c9, gestureindex) {
    if ((namespace_36f464722d326bbe::isBRStyleGameType() || level.gametype == "dmz" || level.gametype == "exgm" || level.gametype == "plunder") && self hasweapon("iw9_armor_plate_deploy_mp")) {
        return;
    }
    if (var_d608d01a055671c9 == "radial_menu_selection_gesture") {
        var_3967a9dc0290fc08 = getgesturedatabyindex(gestureindex);
        if (isdefined(var_3967a9dc0290fc08)) {
            if (var_3967a9dc0290fc08 == "iw8_ges_plyr_gesture024") {
                if (!isdefined(self.smartwatchinteract)) {
                    self.smartwatchinteract = 0;
                }
                self.smartwatchinteract = !self.smartwatchinteract;
                self setclientomnvar("ui_smart_watch_interact", self.smartwatchinteract);
                if (isdefined(self.accessorylogic)) {
                    if (self.accessorylogic == "holo") {
                        if (!self.smartwatchinteract) {
                            startholowatchvfx();
                        } else {
                            self setscriptablepartstate("watchVFXPlayer", "off");
                        }
                    }
                }
            } else if (var_3967a9dc0290fc08 == "iw8_ges_plyr_gesture023") {
                if (!isdefined(self.watchcheck)) {
                    self.watchcheck = 0;
                }
                self.watchcheck = !self.watchcheck;
                self setclientomnvar("ui_smart_watch_check", self.watchcheck);
                if (isdefined(self.accessorylogic)) {
                    if (self.accessorylogic == "blunt") {
                        startbluntwatchvfx();
                    }
                }
            }
            objweapon = makeweapon(var_3967a9dc0290fc08);
            if (isdefined(objweapon) && !isnullweapon(objweapon)) {
                watchradialgesture(objweapon);
            }
        }
    } else if (var_d608d01a055671c9 == "radial_menu_selection_spray") {
        objweapon = makeweapon("iw8_ges_plyr_spray");
        if (isdefined(objweapon) && !isnullweapon(objweapon)) {
            thread watchspraygesturedosprayevent(gestureindex);
            watchradialgesture(objweapon);
        } else {
            /#
                println("offhand_fired" + "supers" + "holoWatchOn");
            #/
        }
    }
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2353
// Size: 0x76
function watchspraygesturedosprayevent(var_fb7362e3e2706612) {
    self endon("death");
    self endon("disconnect");
    self notify("watchSprayGestureDoSprayEvent");
    self endon("watchSprayGestureDoSprayEvent");
    endtime = gettime() + 200;
    while (gettime() < endtime) {
        waitframe();
        if (self isgestureplaying("iw8_ges_plyr_spray")) {
            self sprayevent(var_fb7362e3e2706612);
            namespace_aad14af462a74d08::onspray();
            return;
        }
    }
    /#
        println("<unknown string>");
    #/
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23d0
// Size: 0x71
function watchradialgesture(objweapon) {
    self giveandfireoffhand(objweapon);
    endtime = gettime() + 5000;
    while (gettime() < endtime) {
        if (!self hasweapon(objweapon)) {
            break;
        }
        waitframe();
    }
    if (self hasweapon(objweapon)) {
        _takeweapon(objweapon);
    }
    cleargesture();
    waitframe();
    self.gestureweapon = objweapon.basename;
}

// Namespace gestures/namespace_46e9069d8502773a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2448
// Size: 0x24
function function_199e645a5bbf82a7() {
    /#
        wait(2);
        self iprintlnbold("<unknown string>");
        self notify("<unknown string>", "<unknown string>");
    #/
}
