#using scripts\common\callbacks.gsc;
#using scripts\common\debug.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_2583ee5680cf4736;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using script_6981400abfcd765c;
#using script_32d93a194074fa6a;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;

#namespace namespace_752486b4ea44c4b0;

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x8de
// Size: 0x13
function autoexec main() {
    br_publicevents::function_dbc8f6cb3760cd82("roguesignal", &init);
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f9
// Size: 0x457
function init(config) {
    if (!getdvarint(@"hash_89b60b73bfd9d3d0", 1)) {
        return;
    }
    event_info = spawnstruct();
    event_info.validatefunc = &event_validate;
    event_info.waitfunc = &event_wait;
    event_info.activatefunc = &function_dce158cd5558c35d;
    event_info.postinitfunc = &function_de40a46baab733f5;
    event_info.deactivatefunc = &event_deactivate;
    event_info.weight = config.weight;
    event_info.var_d72a1842c5b57d1d = config.maxtimes;
    event_info.circleeventweights = br_publicevents::function_8fc51a5af06412cf(config.circleweights);
    event_info.var_b9b56551e1acfee2 = namespace_b354cc7ab3b869b0::function_8be9bae8228a91f7("roguesignal");
    br_publicevents::function_5b7d8ca93f8705f1(event_info, "roguesignal");
    br_publicevents::registerpublicevent(20, event_info);
    if (!isdefined(level.var_7576c890644a91ad)) {
        level.var_7576c890644a91ad = spawnstruct();
    }
    level.var_7576c890644a91ad.currenteventtype = 0;
    level.var_7576c890644a91ad.scoreboard = [];
    level.var_7576c890644a91ad.eventlength = int(getdvarint(@"hash_e21294ff91f57b89", 90) * getmatchrulesdata("brData", "circleTimeScale"));
    level.var_7576c890644a91ad.eventtypes = [1, 2, 3, 4, 5];
    level.var_7576c890644a91ad.overrideeventtype = getdvarint(@"hash_c6da18effb6c4994", 0);
    level.var_7576c890644a91ad.var_7d124e61bf50e2c = getdvar(@"hash_861d51c9341fe8f9", "");
    if (level.var_7576c890644a91ad.var_7d124e61bf50e2c.size > 0) {
        types = strtok(level.var_7576c890644a91ad.var_7d124e61bf50e2c, " ");
        foreach (type in types) {
            level.var_7576c890644a91ad.eventtypes = arrayremove(level.var_7576c890644a91ad.eventtypes, int(type));
        }
    }
    if (scripts\cp_mp\utility\game_utility::function_eb4bce9b222e36ac()) {
        level.var_7576c890644a91ad.caches = getunusedlootcachepoints((0, 0, 0), 150000, 0, 1);
    } else {
        level.var_7576c890644a91ad.caches = utility::getstructarray("br_pe_roguesignal_caches", "script_noteworthy");
    }
    level.var_7576c890644a91ad.reward_cache = getdvar(@"hash_876e11a369398181", "br_loot_cache_roguesignal");
    level.var_7576c890644a91ad.var_2009d74909f46277 = getdvarint(@"hash_f88e4c4cbda6bc29", 30);
    level.var_7576c890644a91ad.var_dd1f19ff96690a99 = getdvarint(@"hash_f32e42c626fbdc2b", 1);
    level.var_7576c890644a91ad.var_920fe5b859fcf7ac = getdvarint(@"hash_50a6b11ae660d67a", 125);
    level.var_7576c890644a91ad.var_61cded027799ebae = getdvarint(@"hash_ff3f8dd3d8aa4cec", 0);
    level.var_7576c890644a91ad.start_buffer = getdvarfloat(@"hash_7aaccb68b2e12714", 4.5);
    level.var_7576c890644a91ad.var_6b034b3f45f2eaa5 = getdvarint(@"hash_6c52f2d632e0f977", 1) == 1;
    if (!isdefined(level.var_91104c01620d26b0)) {
        level.var_91104c01620d26b0 = [];
    }
    level.var_91104c01620d26b0 = utility::array_add(level.var_91104c01620d26b0, &function_1e66b4ffb3e558c);
    register_dialog();
    /#
        initdebug();
    #/
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd58
// Size: 0x76
function function_de40a46baab733f5() {
    foreach (cache in level.var_7576c890644a91ad.caches) {
        cache.var_527a7b84d978e792 = namespace_553788426d0f4133::function_60951b84c58915ab(cache.origin);
    }
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd6
// Size: 0x4
function event_validate() {
    return true;
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde3
// Size: 0x2
function event_wait() {
    
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xded
// Size: 0x16a
function function_dce158cd5558c35d() {
    event = utility::array_random(level.var_7576c890644a91ad.eventtypes);
    if (isdefined(level.var_7576c890644a91ad.overrideeventtype) && level.var_7576c890644a91ad.overrideeventtype > 0) {
        event = level.var_7576c890644a91ad.overrideeventtype;
    }
    dialog = undefined;
    switch (event) {
    case 1: 
        dialog = "rogue_signal_" + "event_type_cash";
        break;
    case 3: 
        dialog = "rogue_signal_" + "event_type_damage";
        break;
    case 2: 
        dialog = "rogue_signal_" + "event_type_kills";
        break;
    case 4: 
        dialog = "rogue_signal_" + "event_type_caches";
        break;
    case 5: 
        dialog = "rogue_signal_" + "event_type_powerups";
        break;
    }
    if (isdefined(dialog)) {
        br_public::brleaderdialog(dialog, 1, undefined, undefined, level.var_7576c890644a91ad.start_buffer, undefined, "dx_br_smis_");
    }
    br_public::brleaderdialog("rogue_signal_" + "event_starting", 1, undefined, undefined, 0.5, undefined, "dx_br_smis_");
    startevent(event);
    level thread br_publicevents::function_2907d01a7d692108(20);
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5f
// Size: 0x42c
function startevent(eventtype) {
    level endon("event_deactivated");
    level endon("game_ended");
    var_2f442216bf3e05d7 = (isdefined(level.br_circle.circleindex) ? level.br_circle.circleindex : 0) + 1;
    valid_caches = [];
    foreach (cache in level.var_7576c890644a91ad.caches) {
        if (cache.var_527a7b84d978e792[1].circleindex >= var_2f442216bf3e05d7) {
            valid_caches = utility::array_add(valid_caches, cache);
        }
    }
    level.var_7576c890644a91ad.valid_caches = valid_caches;
    event_ref = "";
    switch (eventtype) {
    case 1: 
        event_ref = "plunder";
        level callback::add("plunder_pickup", &function_1db6f2da4e798b82);
        break;
    case 3: 
        event_ref = "damage";
        level callback::add("player_damaged", &on_player_damaged);
        break;
    case 2: 
        event_ref = "kills";
        level callback::add("player_death", &on_player_killed);
        break;
    case 4: 
        event_ref = "loot";
        level callback::add("cache_opened", &function_82dd024933a0589b);
        break;
    case 5: 
        event_ref = "powerups";
        level callback::add(#"player_powerup", &function_2d1d43c029c51bbf);
        break;
    }
    level callback::add("on_squad_eliminated", &on_squad_eliminated);
    if (istrue(level.usegulag)) {
        level callback::add(#"hash_c15c682d6a5dcae0", &function_6f8fb9835eea1e2e);
        level callback::add(#"hash_2bdabaeb3b833ac", &function_fb0c55ff9c9c67db);
    }
    level.var_7576c890644a91ad.scoreboard = [];
    level.var_7576c890644a91ad.currenteventtype = eventtype;
    foreach (team in level.teamnamelist) {
        if (teams::getteamcount(team) == 0) {
            continue;
        }
        function_6a2c3bf56d02b683(team, 0);
    }
    function_f6f98d0b64ac42b4();
    setomnvarforallclients("ui_br_roguesignal_active", eventtype);
    br_publicevents::showsplashtoall("br_pe_roguesignal_start_" + event_ref, "splash_list_br_pe_roguesignal");
    timer = gettime() + level.var_7576c890644a91ad.eventlength * 1000;
    setomnvar("ui_minimap_pulse", 1);
    setomnvar("ui_publicevent_timer_type", 14);
    setomnvar("ui_publicevent_timer", timer);
    if (eventtype == 3 || eventtype == 1) {
        level thread function_2535e8d31a4bf0c();
    }
    if (namespace_493bf119b3b0c251::function_94b952789d039abb()) {
        foreach (player in level.players) {
            if (isalive(player)) {
                player thread ftue_play(eventtype);
            }
        }
    }
    level thread function_651abe7893b1347f();
    timer_offset = 5;
    wait level.var_7576c890644a91ad.eventlength - timer_offset;
    clockobject = utility::spawn_script_origin();
    level.var_7576c890644a91ad.clock = clockobject;
    while (timer_offset > 0) {
        clockobject playsound("ui_mp_fire_sale_timer");
        wait 1;
        timer_offset--;
    }
    clockobject delete();
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1393
// Size: 0x9
function event_deactivate() {
    function_c32ed6d14f08bd09();
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a4
// Size: 0x472
function function_c32ed6d14f08bd09() {
    level notify("disable_scoreboard_update");
    switch (level.var_7576c890644a91ad.currenteventtype) {
    case 1: 
        level callback::remove("plunder_pickup", &function_1db6f2da4e798b82);
        break;
    case 3: 
        level callback::remove("player_damaged", &on_player_damaged);
        break;
    case 2: 
        level callback::remove("player_death", &on_player_killed);
        break;
    case 4: 
        level callback::remove("cache_opened", &function_82dd024933a0589b);
        break;
    case 5: 
        level callback::remove(#"player_powerup", &function_2d1d43c029c51bbf);
        break;
    }
    level callback::remove("on_squad_eliminated", &on_squad_eliminated);
    level.var_7576c890644a91ad.currenteventtype = 0;
    level.var_7576c890644a91ad.scoreboard = array_sort_with_func(level.var_7576c890644a91ad.scoreboard, &sortbyscore);
    winners = [];
    for (i = 0; i < level.var_7576c890644a91ad.scoreboard.size; i++) {
        if (!isdefined(level.var_7576c890644a91ad.scoreboard[i]) || !isdefined(level.var_7576c890644a91ad.scoreboard[i].teamid) || level.var_7576c890644a91ad.scoreboard[i].score <= 0) {
            continue;
        }
        winners = utility::array_add(winners, level.var_7576c890644a91ad.scoreboard[i].teamid);
        if (winners.size == 3) {
            break;
        }
    }
    foreach (index, team in winners) {
        dialog = index == 0 ? "event_completion_top_squad" : "event_completion_top_three";
        br_public::brleaderdialogteam("rogue_signal_" + dialog, team, 1, 0.5, undefined, "dx_br_smis_");
    }
    if (winners.size > 0) {
        level function_b78eb63b1da9329f(winners, 1, 1);
    }
    foreach (player in level.players) {
        iswinner = utility::array_contains(winners, player.team);
        if (!iswinner && !level.var_7576c890644a91ad.var_6b034b3f45f2eaa5) {
            continue;
        }
        splashname = iswinner ? "br_pe_roguesignal_success" : "br_pe_roguesignal_fail";
        player hud_message::showsplash(splashname, undefined, undefined, undefined, undefined, "splash_list_br_pe_roguesignal");
    }
    foreach (idx, team in winners) {
        foreach (player in teams::getteamdata(team, "players")) {
            player points::doScoreEvent(#"br_pe_roguesignal_success");
            player br_plunder::playerplunderpickup(level.var_7576c890644a91ad.var_920fe5b859fcf7ac * (3 - idx), undefined, undefined, 1);
        }
    }
    setomnvarforallclients("ui_br_roguesignal_active", 0);
    setomnvar("ui_minimap_pulse", 0);
    setomnvar("ui_publicevent_timer_type", 0);
    function_ba9ba8eb661af8f1();
    /#
        if (isdefined(level.var_7576c890644a91ad.clock)) {
            level.var_7576c890644a91ad.clock delete();
        }
    #/
    level notify("event_deactivated");
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181e
// Size: 0x2be
function function_b78eb63b1da9329f(team_list, is_locked, valid_caches) {
    if (!isdefined(is_locked)) {
        is_locked = 0;
    }
    if (!isdefined(valid_caches)) {
        valid_caches = 1;
    }
    caches = valid_caches ? level.var_7576c890644a91ad.valid_caches : level.var_7576c890644a91ad.caches;
    location = utility::array_random(caches);
    if (valid_caches) {
        location.inuse = 1;
        level.var_7576c890644a91ad.valid_caches = utility::array_remove(caches, location);
    } else {
        level.var_7576c890644a91ad.caches = utility::array_remove(caches, location);
    }
    cache = spawnscriptable(level.var_7576c890644a91ad.reward_cache, location.origin, location.angles);
    if (is_locked && level.var_7576c890644a91ad.var_2009d74909f46277 > 0) {
        cache.is_unlocked = 0;
        cache thread function_23812764e79c036e(team_list, level.var_7576c890644a91ad.var_2009d74909f46277, 5);
    } else {
        cache setscriptablepartstate("body", "closed_usable");
        cache.is_unlocked = 1;
    }
    cache.var_534e0cf170a981b7 = &function_724769eeddf32c63;
    cache.team_list = team_list;
    cache.var_e757352d31655db9 = level.var_7576c890644a91ad.var_dd1f19ff96690a99;
    cache.var_ee75ebf2a3dc9eb0 = 1;
    cache.spawn_time = gettime();
    if (level.var_7576c890644a91ad.var_61cded027799ebae) {
        cache game_utility::function_6b6b6273f8180522("RogueSignal_Br", cache.origin, 512);
        foreach (team in team_list) {
            foreach (player in teams::getteamdata(team, "players")) {
                cache game_utility::function_cfd53c8f6878014f(player);
            }
        }
    }
    level.var_7576c890644a91ad.cache = cache;
    return cache;
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae5
// Size: 0x12e
function function_3aa223d058a74fdc(team_list, progress) {
    objid = namespace_6c8a837ec98fe0b8::requestobjectiveid(99);
    self.objidnum = objid;
    namespace_6c8a837ec98fe0b8::objective_add_objective(objid, "current", self.origin + (0, 0, 64), "hud_icon_objective_roguesignal", "icon_regular");
    namespace_6c8a837ec98fe0b8::function_d7e3c4a08682c1b9(objid, 0);
    namespace_6c8a837ec98fe0b8::objective_set_play_intro(objid, 1);
    namespace_6c8a837ec98fe0b8::update_objective_setbackground(objid, 1);
    namespace_6c8a837ec98fe0b8::function_2946e9eb07acb3f1(objid, %MP_BR_INGAME/LOOT_CACHE_ROGUESIGNAL);
    foreach (team in team_list) {
        foreach (player in teams::getteamdata(team, "players")) {
            namespace_6c8a837ec98fe0b8::objective_playermask_addshowplayer(objid, player);
        }
    }
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c1b
// Size: 0x261
function function_23812764e79c036e(team_list, time, buffer) {
    if (!isdefined(buffer)) {
        buffer = level.framedurationseconds;
    }
    level endon("game_ended");
    interact = interaction::register_interact(self.origin + (0, 0, 24), 64, &function_a077537746482e54);
    interact.cache = self;
    interact function_dfb78b3e724ad620(1);
    interact interaction::function_e6c63f16f2258b80(&function_43cb953ab1404232);
    function_3aa223d058a74fdc(team_list, 1);
    wait buffer;
    foreach (team in team_list) {
        foreach (player in teams::getteamdata(team, "alivePlayers")) {
            if (player br_public::isplayerinorgoingtogulag()) {
                continue;
            }
            player calloutmarkerping::calloutmarkerping_createcallout(11, self.origin, self.objidnum);
            break;
        }
    }
    namespace_6c8a837ec98fe0b8::objective_set_progress(self.objidnum, 0);
    namespace_6c8a837ec98fe0b8::objective_show_progress(self.objidnum, 1);
    current_time = gettime();
    start_time = current_time;
    end_time = start_time + utility::function_a5b14435e3229bed(time);
    completion_rate = 0;
    playsoundatpos(self.origin, "dx_br_smis_rspe_rfcv_rsln");
    while (completion_rate < 1) {
        elapsed_time = (gettime() - start_time) / 1000;
        completion_rate = clamp(elapsed_time / time, 0, 1);
        self.completion_rate = completion_rate;
        if (isdefined(self.objidnum)) {
            namespace_6c8a837ec98fe0b8::objective_set_progress(self.objidnum, completion_rate);
        }
        wait 0.1;
    }
    if (isdefined(self.objidnum)) {
        namespace_6c8a837ec98fe0b8::objective_show_progress(self.objidnum, 0);
    }
    interact delete();
    function_9c876f98fad72467();
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e84
// Size: 0xde
function function_43cb953ab1404232(interact, player) {
    cache = interact.cache;
    if (!istrue(cache.is_unlocked)) {
        time_in_s = int(ceil(level.var_7576c890644a91ad.var_2009d74909f46277 * (1 - (isdefined(cache.completion_rate) ? cache.completion_rate : 0))));
        if (time_in_s > 0) {
            return {#params:[%MP_BR_INGAME/LOOT_CACHE_ROGUESIGNAL, time_in_s], #string:%MP_BR_INGAME/CACHE_UNLOCKED_IN_X, #type:"HINT_BUTTON"};
        }
    }
    return {#string:%, #type:"HINT_NOICON"};
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f6b
// Size: 0x46
function function_9c876f98fad72467() {
    playsoundatpos(self.origin, "br_loot_cache_chest_recharge_beep_full");
    playsoundatpos(self.origin, "dx_br_smis_rspe_rfcv_rscu");
    self.is_unlocked = 1;
    self setscriptablepartstate("body", "closed_usable");
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb9
// Size: 0xa0
function function_1e66b4ffb3e558c(items, instance) {
    if (istrue(instance.var_ee75ebf2a3dc9eb0)) {
        if (utility::issharedfuncdefined("roguesignal", "cache_reward")) {
            items = instance utility::function_f3bb4f4911a1beb2("roguesignal", "cache_reward", items);
            assertex(isarray(items) && items.size > 0, "br_publicevent_roguesignal::reward_cache_adjust_items" + " didn't return an array of items from the reward func!");
        } else {
            weapon_str = "jup_pi_raygun_mp";
            add_items = [weapon_utility::function_eeaa22f0cd1ff845(weapon_str)];
            items = utility::array_combine(items, add_items);
        }
    }
    return items;
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2062
// Size: 0x166
function function_724769eeddf32c63(instance, player) {
    if (!instance.var_e757352d31655db9 && !utility::array_contains(instance.team_list, player.team)) {
        playsoundatpos(instance.origin, "dx_br_smis_rspe_rfcv_rsct");
        player hud_message::showerrormessage("MP_BR_INGAME/UNAUTHORIZED_ACCESS");
        return 0;
    }
    if (!istrue(instance.is_unlocked)) {
        playsoundatpos(instance.origin, "dx_br_smis_rspe_rfcv_rsct");
        player hud_message::showerrormessage("MP_DMZ_MISSIONS/GEIGER_SEARCH_GC_CACHE_ERR");
        return 0;
    }
    if (level.var_7576c890644a91ad.var_61cded027799ebae) {
        instance game_utility::function_af5604ce591768e1();
    }
    namespace_6c8a837ec98fe0b8::returnobjectiveid(instance.objidnum);
    if (istrue(level.usegulag)) {
        level callback::remove(#"hash_c15c682d6a5dcae0", &function_6f8fb9835eea1e2e);
        level callback::remove(#"hash_2bdabaeb3b833ac", &function_fb0c55ff9c9c67db);
    }
    instance function_75033550b2c672be("opened", player);
    var_9a6c1b85896a116e = {#opened_by_winner:arraycontains(instance.team_list, player.team), #time_since_spawn_ms:gettime() - instance.spawn_time};
    level thread function_6e0d478e2fb36607(var_9a6c1b85896a116e);
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21d0
// Size: 0x80
function function_a077537746482e54(player) {
    if (isdefined(self.var_7435ab99d1de8eee) && self.var_7435ab99d1de8eee > gettime()) {
        return;
    }
    self.var_7435ab99d1de8eee = gettime() + 3000;
    player hud_message::showerrormessage("MP_BR_INGAME/UNAUTHORIZED_ACCESS");
    if (isdefined(self.completion_rate) && self.completion_rate >= 0.85) {
        return;
    }
    playsoundatpos(self.origin, "dx_br_smis_rspe_rfcv_rsct");
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2258
// Size: 0x29
function function_2535e8d31a4bf0c() {
    level endon("event_deactivated");
    level endon("disable_scoreboard_update");
    level endon("game_ended");
    while (true) {
        wait 2;
        function_f6f98d0b64ac42b4();
    }
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2289
// Size: 0x2b0
function function_f6f98d0b64ac42b4() {
    level.var_7576c890644a91ad.scoreboard = array_sort_with_func(level.var_7576c890644a91ad.scoreboard, &sortbyscore);
    for (i = 0; i < level.var_7576c890644a91ad.scoreboard.size; i++) {
        foreach (player in teams::getteamdata(level.var_7576c890644a91ad.scoreboard[i].teamid, "players")) {
            player setclientomnvar("ui_br_roguesignal_progress", level.var_7576c890644a91ad.scoreboard[i].score);
            player setclientomnvar("ui_br_roguesignal_position", i);
            if (level.var_7576c890644a91ad.scoreboard.size == 1) {
                continue;
            } else if (level.var_7576c890644a91ad.scoreboard.size == 2) {
                player setclientomnvar("ui_br_roguesignal_progress_enemy1", level.var_7576c890644a91ad.scoreboard[ter_op(i == 0, 1, 0)].score);
                continue;
            }
            if (i == 0) {
                player setclientomnvar("ui_br_roguesignal_progress_enemy1", level.var_7576c890644a91ad.scoreboard[1].score);
                player setclientomnvar("ui_br_roguesignal_progress_enemy2", level.var_7576c890644a91ad.scoreboard[2].score);
                continue;
            }
            if (i == level.var_7576c890644a91ad.scoreboard.size - 1) {
                player setclientomnvar("ui_br_roguesignal_progress_enemy1", level.var_7576c890644a91ad.scoreboard[i - 2].score);
                player setclientomnvar("ui_br_roguesignal_progress_enemy2", level.var_7576c890644a91ad.scoreboard[i - 1].score);
                continue;
            }
            player setclientomnvar("ui_br_roguesignal_progress_enemy1", level.var_7576c890644a91ad.scoreboard[i - 1].score);
            player setclientomnvar("ui_br_roguesignal_progress_enemy2", level.var_7576c890644a91ad.scoreboard[i + 1].score);
        }
    }
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2541
// Size: 0x2a
function sortbyscore(lhs, rhs) {
    return lhs.score >= rhs.score;
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2574
// Size: 0x48
function function_1db6f2da4e798b82(params) {
    amount = (isdefined(params.amount) ? params.amount : 0) * 10;
    function_6a2c3bf56d02b683(self.team, amount);
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c4
// Size: 0x3a
function on_player_killed(deathdata) {
    if (function_2536f6802979033b(deathdata)) {
        function_6a2c3bf56d02b683(deathdata.attacker.team, 1);
        function_f6f98d0b64ac42b4();
    }
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2606
// Size: 0xa7
function on_player_damaged(damagedata) {
    if (function_2536f6802979033b(damagedata)) {
        total_damage = damagedata.idamage + damagedata.var_1da1a66b5c6a06a7;
        if (isdefined(damagedata.smeansofdeath) && damagedata.smeansofdeath == "MOD_EXECUTION") {
            victim = damagedata.victim;
            total_damage = victim.maxarmorhealth + victim.maxhealth;
        }
        function_6a2c3bf56d02b683(damagedata.eattacker.team, total_damage);
    }
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26b5
// Size: 0xc5
function function_82dd024933a0589b(cachedata) {
    score = 1;
    switch (cachedata.instance.type) {
    case #"hash_417c605750c7baa5": 
        score = 1;
        break;
    case #"hash_4ca1dc2e1b0de0d3": 
        score = 2;
        break;
    case #"hash_19ba8d41970911ad": 
        score = 3;
        break;
    default: 
        /#
            iprintln("<dev string:x1c>" + cachedata.instance.type);
        #/
        break;
    }
    function_6a2c3bf56d02b683(cachedata.player.team, score);
    function_f6f98d0b64ac42b4();
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2782
// Size: 0x30
function function_2d1d43c029c51bbf(params) {
    function_6a2c3bf56d02b683(params.player.team, 1);
    function_f6f98d0b64ac42b4();
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27ba
// Size: 0x38
function on_squad_eliminated(params) {
    function_6a2c3bf56d02b683(params.team, function_d4475734232b2734(params.team) * -1);
    function_f6f98d0b64ac42b4();
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27fa
// Size: 0x88
function function_6f8fb9835eea1e2e(params) {
    if (!isdefined(level.var_7576c890644a91ad.cache)) {
        return;
    }
    player = params.player;
    cache = level.var_7576c890644a91ad.cache;
    if (arraycontains(cache.team_list, player.team)) {
        namespace_6c8a837ec98fe0b8::objective_playermask_hidefrom(cache.objidnum, player);
    }
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x288a
// Size: 0x88
function function_fb0c55ff9c9c67db(params) {
    if (!isdefined(level.var_7576c890644a91ad.cache)) {
        return;
    }
    player = params.player;
    cache = level.var_7576c890644a91ad.cache;
    if (arraycontains(cache.team_list, player.team)) {
        namespace_6c8a837ec98fe0b8::objective_playermask_addshowplayer(cache.objidnum, player);
    }
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x291a
// Size: 0xe8
function function_6a2c3bf56d02b683(teamid, delta) {
    foreach (entry in level.var_7576c890644a91ad.scoreboard) {
        if (entry.teamid == teamid) {
            entry.score += delta;
            return;
        }
    }
    newteamentry = spawnstruct();
    newteamentry.teamid = teamid;
    newteamentry.score = delta;
    level.var_7576c890644a91ad.scoreboard[level.var_7576c890644a91ad.scoreboard.size] = newteamentry;
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a0a
// Size: 0x7f
function function_d4475734232b2734(teamid) {
    foreach (entry in level.var_7576c890644a91ad.scoreboard) {
        if (entry.teamid == teamid) {
            return entry.score;
        }
    }
    return 0;
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a92
// Size: 0x25e
function function_2536f6802979033b(data) {
    attacker = undefined;
    if (isdefined(data.attacker)) {
        attacker = data.attacker;
    } else if (isdefined(data.eattacker)) {
        attacker = data.eattacker;
    }
    if (!isdefined(attacker) || !isdefined(data.victim)) {
        return false;
    }
    victim = data.victim;
    if (attacker vehicle::isvehicle()) {
        driver = vehicle_occupancy::vehicle_occupancy_getdriver(attacker);
        if (isdefined(driver) && isplayer(driver)) {
            attacker = driver;
        } else if (isdefined(attacker.owners) && attacker.owners > 0) {
            owners = utility::array_removeundefined(attacker.owners);
            if (owners.size > 0) {
                attacker = owners[0];
            }
        }
        if (attacker vehicle::isvehicle()) {
            occupants = vehicle_occupancy::vehicle_occupancy_getalloccupants(attacker, 0);
            if (isdefined(occupants) && isarray(occupants) && occupants.size > 0) {
                attacker = occupants[getarraykeys(occupants)[0]];
            }
        }
        if (isdefined(data.attacker)) {
            data.attacker = attacker;
        } else if (isdefined(data.eattacker)) {
            data.eattacker = attacker;
        }
        if (level.var_7576c890644a91ad.currenteventtype == 3) {
            data.idamage = int(min(data.idamage, victim.maxhealth));
        }
    }
    if (level.var_7576c890644a91ad.currenteventtype == 3 && data.idamage + data.var_1da1a66b5c6a06a7 == 0) {
        return false;
    }
    if (!isplayer(attacker) || !isplayer(victim)) {
        return false;
    }
    if (attacker == victim) {
        return false;
    }
    if (attacker.team == victim.team) {
        return false;
    }
    if (level.var_7576c890644a91ad.currenteventtype == 3 && player::isinlaststand(victim) && !player::function_d7afe062ef51bd77(victim)) {
        return false;
    }
    return true;
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2cf9
// Size: 0xff
function private ftue_play(index) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    switch (index) {
    case 1: 
        tip = #"hash_7897bc53f469c480";
        break;
    case 3: 
        tip = #"hash_41a7153e86ce40d7";
        break;
    case 2: 
        tip = #"hash_8a2bd5204f22de87";
        break;
    case 4: 
        tip = #"hash_64d8773f0e129724";
        break;
    case 5: 
        tip = #"hash_22d6d30fd6e9cfd7";
        break;
    default: 
        assertmsg("Unknown FTUE for event type: " + index);
        return;
    }
    ftue_tip::function_9e0151baa208fe9e(tip);
    wait 10;
    params = {#duration:10};
    ftue_tip::function_f339c5c73d11ea20(tip, 1, params);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e00
// Size: 0x57
function function_6e0d478e2fb36607(params) {
    eventparams = [];
    eventparams[eventparams.size] = "time_since_spawn_ms";
    eventparams[eventparams.size] = params.time_since_spawn_ms;
    eventparams[eventparams.size] = "opened_by_winner";
    eventparams[eventparams.size] = params.opened_by_winner;
    dlog_recordevent("dlog_event_br_pe_rogue_signal_crate_opened", eventparams);
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e5f
// Size: 0xb3
function function_ba9ba8eb661af8f1() {
    top_scores = [];
    for (i = 0; i < 5; i++) {
        if (isdefined(level.var_7576c890644a91ad.scoreboard[i])) {
            top_scores[top_scores.size] = level.var_7576c890644a91ad.scoreboard[i].score;
            continue;
        }
        top_scores[top_scores.size] = 0;
    }
    eventparams = ["event_type", level.var_7576c890644a91ad.currenteventtype, "top_scores", top_scores];
    dlog_recordevent("dlog_event_br_pe_rogue_signal_complete", eventparams);
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f1a
// Size: 0x18a
function register_dialog() {
    assert(isdefined(game["dialog"]));
    game["dialog"]["rogue_signal_" + "event_starting"] = "rspe_grav_rses";
    game["dialog"]["rogue_signal_" + "event_type_kills"] = "rspe_grav_rsek";
    game["dialog"]["rogue_signal_" + "event_type_damage"] = "rspe_grav_rsed";
    game["dialog"]["rogue_signal_" + "event_type_caches"] = "rspe_grav_rset";
    game["dialog"]["rogue_signal_" + "event_type_powerups"] = "rspe_grav_rsep";
    game["dialog"]["rogue_signal_" + "event_type_cash"] = "rspe_grav_rsec";
    game["dialog"]["rogue_signal_" + "event_completion_top_squad"] = "rspe_grav_sect";
    game["dialog"]["rogue_signal_" + "event_completion_top_three"] = "rspe_grav_resq";
    game["dialog"]["rogue_signal_" + "event_failure"] = "rspe_grav_rsef";
    game["dialog"]["rogue_signal_" + "timer_nag_lead"] = "rspe_grav_rstn";
    game["dialog"]["rogue_signal_" + "timer_nag_top"] = "rspe_grav_rstg";
    game["dialog"]["rogue_signal_" + "performance_nag"] = "rspe_grav_rspn";
    game["dialog"]["rogue_signal_" + "crate_claim_friendly"] = "rspe_grav_rscs";
    game["dialog"]["rogue_signal_" + "crate_claim_enemy"] = "rspe_grav_rsce";
    game["dialog"]["rogue_signal_" + "crate_claim_gas"] = "rspe_grav_rscg";
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30ac
// Size: 0x112
function function_651abe7893b1347f() {
    level endon("event_deactivated");
    level endon("game_ended");
    if (level.var_7576c890644a91ad.eventlength > 45) {
        var_a6dcacd55a72c91 = level.var_7576c890644a91ad.eventlength - 45;
        wait var_a6dcacd55a72c91;
        for (i = 0; i < level.var_7576c890644a91ad.scoreboard.size; i++) {
            entry = level.var_7576c890644a91ad.scoreboard[i];
            team = entry.teamid;
            score = entry.score;
            dialog = "performance_nag";
            if (i < 3 && score > 0) {
                dialog = i == 0 ? "timer_nag_lead" : "timer_nag_top";
            }
            br_public::brleaderdialogteam("rogue_signal_" + dialog, team, 1, 0.5, undefined, "dx_br_smis_");
        }
    }
}

// Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31c6
// Size: 0x170
function function_75033550b2c672be(type, player) {
    if (isdefined(player) && type == "opened") {
        if (arraycontains(self.team_list, player.team)) {
            br_public::brleaderdialogteam("rogue_signal_" + "crate_claim_friendly", player.team, 1, 0.5, undefined, "dx_br_smis_");
        }
        opposite_teams = arrayremove(self.team_list, player.team);
        foreach (team in opposite_teams) {
            br_public::brleaderdialogteam("rogue_signal_" + "crate_claim_enemy", team, 1, 0.5, undefined, "dx_br_smis_");
        }
        return;
    }
    if (type == "gas") {
        foreach (team in self.team_list) {
            br_public::brleaderdialogteam("rogue_signal_" + "crate_claim_gas", player.team, 1, 0.5, undefined, "dx_br_smis_");
        }
    }
}

/#

    // Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x333e
    // Size: 0xe
    function initdebug() {
        level thread setup_devgui();
    }

    // Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3354
    // Size: 0x178
    function setup_devgui() {
        devgui::function_6e7290c8ee4f558b("<dev string:x38>");
        devgui::function_b23a59dfb4ca49a1("<dev string:x5a>", "<dev string:x6d>", &function_cf63c7be326bd2b9);
        devgui::function_b23a59dfb4ca49a1("<dev string:x78>", "<dev string:x8c>", &function_cf63c7be326bd2b9);
        devgui::function_b23a59dfb4ca49a1("<dev string:x97>", "<dev string:xac>", &function_cf63c7be326bd2b9);
        devgui::function_b23a59dfb4ca49a1("<dev string:xb7>", "<dev string:xcc>", &function_cf63c7be326bd2b9);
        devgui::function_b23a59dfb4ca49a1("<dev string:xd7>", "<dev string:xee>", &function_cf63c7be326bd2b9);
        devgui::function_b23a59dfb4ca49a1("<dev string:xf9>", "<dev string:x103>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<dev string:x10c>", "<dev string:x11e>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<dev string:x127>", "<dev string:x13d>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<dev string:x146>", "<dev string:x160>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<dev string:x169>", "<dev string:x181>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<dev string:x18a>", "<dev string:x1a6>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<dev string:x1af>", "<dev string:x1ce>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<dev string:x1d7>", "<dev string:x1f4>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<dev string:x1fd>", "<dev string:x214>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<dev string:x21d>", "<dev string:x230>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<dev string:x239>", "<dev string:x24f>", &function_ba6d67317370830a);
        devgui::function_fe953f000498048f();
    }

    // Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x34d4
    // Size: 0x35
    function function_cf63c7be326bd2b9(params) {
        level.var_7576c890644a91ad.overrideeventtype = int(params[0]);
        level thread br_publicevents::function_e37ee072d95a7c98(20);
    }

    // Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3511
    // Size: 0x28f
    function function_ba6d67317370830a(params) {
        player = level.player;
        switch (int(params[0])) {
        case 0: 
            level thread br_publicevents::function_2907d01a7d692108(20);
            break;
        case 1: 
            function_52c67898af722766(player);
            break;
        case 2: 
            tracestart = player geteye();
            forward = anglestoforward(player getplayerangles());
            traceend = tracestart + forward * 5000;
            traceresults = trace::ray_trace(tracestart, traceend, player);
            if (isdefined(traceresults["<dev string:x259>"]) && isplayer(traceresults["<dev string:x259>"]) && isbot(traceresults["<dev string:x259>"])) {
                player = traceresults["<dev string:x259>"];
                function_52c67898af722766(player);
            }
            break;
        case 3: 
            function_6a2c3bf56d02b683(player.team, 100000);
            level thread br_publicevents::function_2907d01a7d692108(20);
            break;
        case 4: 
            function_6a2c3bf56d02b683("<dev string:x260>", 100000);
            level thread br_publicevents::function_2907d01a7d692108(20);
            break;
        case 5: 
            cache = function_b78eb63b1da9329f([player.team], 0, 0);
            player setorigin(cache.origin + (0, 0, 24));
            break;
        case 6: 
            cache = function_b78eb63b1da9329f(["<dev string:x260>"], 1, 0);
            player setorigin(cache.origin + (0, 0, 24));
            break;
        case 7: 
            level thread function_dfd27b3e2ea43440(level.var_7576c890644a91ad.valid_caches);
            break;
        case 8: 
            level thread function_dfd27b3e2ea43440(level.var_7576c890644a91ad.caches);
            break;
        case 9: 
            player hud_message::showsplash("<dev string:x265>", undefined, undefined, undefined, undefined, "<dev string:x27c>");
            break;
        case 10: 
            player hud_message::showsplash("<dev string:x29a>", undefined, undefined, undefined, undefined, "<dev string:x27c>");
            break;
        }
    }

    // Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x37a8
    // Size: 0xc0
    function function_52c67898af722766(player) {
        switch (level.var_7576c890644a91ad.currenteventtype) {
        case 1: 
            function_6a2c3bf56d02b683(player.team, 750);
            function_f6f98d0b64ac42b4();
            break;
        case 3: 
            function_6a2c3bf56d02b683(player.team, 150);
            function_f6f98d0b64ac42b4();
            break;
        case 2:
        case 4:
        case 5: 
            function_6a2c3bf56d02b683(player.team, 1);
            function_f6f98d0b64ac42b4();
            break;
        }
    }

    // Namespace namespace_752486b4ea44c4b0 / namespace_3022bf42f4c9f813
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3870
    // Size: 0x109
    function function_dfd27b3e2ea43440(caches) {
        level notify("<dev string:x2b4>");
        level endon("<dev string:x2b4>");
        if (!isdefined(caches)) {
            return;
        }
        foreach (cache in caches) {
            debug::debug_line(cache.origin, cache.origin + (0, 0, 4096), (0, 1, 1), 30, "<dev string:x2b4>", undefined, undefined);
            debug::debug_print3d(cache.origin + (0, 0, 4096), "<dev string:x2f6>" + cache.var_527a7b84d978e792[1].circleindex + 1, (1, 1, 1), 30, "<dev string:x2b4>", undefined, 1, 15);
        }
    }

#/