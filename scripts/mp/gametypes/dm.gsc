// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gametypes\gold_gun.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\class.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gamescore.gsc;

#namespace dm;

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x84c
// Size: 0x264
function main() {
    scripts/mp/globallogic::init();
    scripts/mp/globallogic::setupcallbacks();
    allowed[0] = getgametype();
    scripts/mp/gameobjects::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registertimelimitdvar(getgametype(), 600);
        registerscorelimitdvar(getgametype(), 30);
        registerwinlimitdvar(getgametype(), 1);
        registerroundlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    updategametypedvars();
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.modeonspawnplayer = &onspawnplayer;
    level.onnormaldeath = &onnormaldeath;
    level.onplayerscore = &onplayerscore;
    if (function_59bc1a507006dcb1()) {
        setoverridewatchdvar("scorelimit", 25);
        level.allowclasschoicefunc = &function_e048e0ef10222493;
        level.bypassclasschoicefunc = &function_f85a7539bef30847;
        level.onplayerkilled = &function_44d72e27a2afecf7;
        function_3de4b167d29ad5c2();
    }
    level.didhalfscorevoboost = 0;
    setteammode("ffa");
    if (istrue(level.aonrules)) {
        level.denyclasschoice = 1;
        scripts/mp/gametypes/common::addspecialistdialog();
        level.bypassclasschoicefunc = &scripts/mp/class::alwaysgamemodeclass;
        setspecialloadout();
        game["dialog"]["gametype"] = "gametype_aon";
    } else if (scripts/cp_mp/utility/game_utility::function_21322da268e71c19()) {
        game["dialog"]["gametype"] = "dx_mp_ffah_mode_t141_name";
    } else {
        game["dialog"]["gametype"] = "dx_mp_ffal_game_uktl_name";
    }
    game["dialog"]["ffa_lead_first"] = "dx_mp_ffal_game_uktl_ffp1";
    game["dialog"]["ffa_lead_second"] = "dx_mp_ffal_game_uktl_ffp2";
    game["dialog"]["ffa_lead_third"] = "dx_mp_ffal_game_uktl_ffp3";
    game["dialog"]["ffa_lead_last"] = "dx_mp_ffal_game_uktl_ffp3";
    game["dialog"]["offense_obj"] = "dx_mp_ffal_game_uktl_bost";
    game["dialog"]["defense_obj"] = "dx_mp_ffal_game_uktl_bost";
    /#
        thread function_aeefcd8920dc46e0();
    #/
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab7
// Size: 0xdf
function initializematchrules() {
    setcommonrulesfrommatchrulesdata(1);
    setdynamicdvar(@"hash_ccb8b9b501a1e460", getmatchrulesdata("dmData", "aonRules"));
    setdynamicdvar(@"hash_e7b601c3f8858884", getmatchrulesdata("dmData", "scoreOnTargetPlayer"));
    setdynamicdvar(@"hash_84488474c027d449", getmatchrulesdata("dmData", "targetPlayerCycle"));
    setdynamicdvar(@"hash_7baf2b035b5f6bd4", getmatchrulesdata("dmData", "showTargetTime"));
    setdynamicdvar(@"hash_85c3e7d7cf2f2af8", 1);
    registerwinlimitdvar("dm", 1);
    setdynamicdvar(@"hash_4cfd4f3e5a0eba56", 1);
    registerroundlimitdvar("dm", 1);
    setdynamicdvar(@"hash_eaf0f00090744c95", 0);
    registerhalftimedvar("dm", 0);
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb9d
// Size: 0x241
function onstartgametype() {
    setclientnamemode("auto_change");
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/DM");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/DM");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/DM_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/DM_HINT");
    }
    if (function_bff229a11ecd1e34()) {
        scripts/mp/spawnlogic::setactivespawnlogic(#"default");
    } else {
        scripts/mp/spawnlogic::setactivespawnlogic("FreeForAll", "Crit_Default");
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    spawnkey = "ffa";
    if (scripts/mp/spawnlogic::function_b17bf43316b9fb08(spawnkey)) {
        scripts/mp/spawnlogic::initspawnlist(spawnkey, 1, "start", "start");
        scripts/mp/spawnlogic::initspawnlist(spawnkey, 0, "spawn", "spawn");
        scripts/mp/spawnlogic::initspawnlist(spawnkey, 2, "fallback", "fallback", 1);
    } else {
        scripts/mp/spawnlogic::addstartspawnpoints("mp_dm_spawn_start", 1);
        scripts/mp/spawnlogic::addspawnpoints("allies", "mp_dm_spawn");
        scripts/mp/spawnlogic::addspawnpoints("allies", "mp_dm_spawn_secondary", 1, 1);
        scripts/mp/spawnlogic::addspawnpoints("axis", "mp_dm_spawn");
        scripts/mp/spawnlogic::addspawnpoints("axis", "mp_dm_spawn_secondary", 1, 1);
        spawns = scripts/mp/spawnlogic::getspawnpointarray("mp_dm_spawn");
        spawnssecondary = scripts/mp/spawnlogic::getspawnpointarray("mp_dm_spawn_secondary");
        scripts/mp/spawnlogic::registerspawnset("primary", spawns);
        scripts/mp/spawnlogic::registerspawnset("fallback", spawnssecondary);
    }
    level.mapcenter = scripts/mp/spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    level.quickmessagetoall = 1;
    if (function_59bc1a507006dcb1()) {
        level thread function_10cc8368e439ae59();
    }
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xde5
// Size: 0x16b
function updategametypedvars() {
    scripts/mp/gametypes/common::updatecommongametypedvars();
    level.aonrules = dvarintvalue("aonRules", 0, 0, 4);
    level.scoreontargetplayer = dvarintvalue("scoreOnTargetPlayer", 0, 0, 1);
    level.targetplayercycle = dvarintvalue("targetPlayerCycle", 0, 0, 1);
    level.showtargettime = dvarintvalue("showTargetTime", 1, 0, 6);
    switch (level.showtargettime) {
    case 0:
        level.objpingdelay = 60;
        break;
    case 1:
        level.objpingdelay = 0.05;
        break;
    case 2:
        level.objpingdelay = 1;
        break;
    case 3:
        level.objpingdelay = 1.5;
        break;
    case 4:
        level.objpingdelay = 2;
        break;
    case 5:
        level.objpingdelay = 3;
        break;
    case 6:
        level.objpingdelay = 4;
        break;
    }
    if (level.aonrules > 0) {
        level.blockweapondrops = 1;
        return;
    }
    level notify("cancel_loadweapons");
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf57
// Size: 0xb5
function getspawnpoint() {
    spawnpoint = undefined;
    if (level.ingraceperiod) {
        spawnpoints = scripts/mp/spawnlogic::getstartspawnpoints();
        if (!isdefined(level.requiresminstartspawns)) {
            /#
                assertex(spawnpoints.size != 0 || spawnpoints.size >= 8, "FFA requires at least " + 8 + " start spawns");
            #/
        }
        if (spawnpoints.size > 0) {
            spawnpoint = scripts/mp/spawnlogic::getspawnpoint_startspawn(spawnpoints, 1);
        }
        if (!isdefined(spawnpoint)) {
            spawnpoints = scripts/mp/spawnlogic::getteamspawnpoints(self.team);
            spawnpoint = scripts/mp/spawnscoring::getstartspawnpoint_freeforall(spawnpoints);
        }
    } else {
        spawnpoint = scripts/mp/spawnlogic::getspawnpoint(self, "none", "primary", "fallback");
        /#
            comparespawns(spawnpoint);
        #/
    }
    return spawnpoint;
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1014
// Size: 0x17c
function comparespawns(spawnpoint) {
    /#
        if (getdvarint(@"hash_b5ceec3e3cb419be") != 0) {
            spawnpoints = scripts/mp/spawnlogic::getteamspawnpoints(self.team);
            fallbackspawnpoints = [];
            scriptspawnpoint = scripts/mp/spawnscoring::getspawnpoint_legacy(spawnpoints, fallbackspawnpoints);
            if (!isdefined(level.var_3d292942d52b104a)) {
                level.var_3d292942d52b104a = 0;
                level.var_2dc7108159dc1da3 = 0;
                level.var_a065445ba781ddf6 = 0;
            }
            level.var_3d292942d52b104a++;
            println("FreeForAll" + scriptspawnpoint.index + "iw8_knife" + scriptspawnpoint.totalscore);
            if (scriptspawnpoint.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("loadoutSuper" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "game_ended" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("<unknown string>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "game_ended" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            }
            return scriptspawnpoint;
        }
    #/
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1197
// Size: 0xac
function onspawnplayer(revivespawn) {
    scripts/mp/hud_message::function_f004ef4606b9efdc("kill");
    if (level.aonrules > 0) {
        thread onspawnfinished();
    }
    if (level.scoreontargetplayer) {
        if (!isdefined(self.targetvictim)) {
            thread gettarget();
            thread newtargetmessage();
        }
    }
    if (function_59bc1a507006dcb1()) {
        if (istrue(self.perkscleared)) {
            self.perkscleared = undefined;
        }
        if (isdefined(self.loadoutperks) && !istrue(self.remove_perks)) {
            thread scripts/mp/gametypes/gold_gun::function_cfd132407d0f14b3();
        }
        self.remove_perks = 0;
    }
    level notify("spawned_player");
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x124a
// Size: 0x174
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    var_9570b6e76c7e14f9 = scripts/mp/gametypes/common::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    if (istrue(var_9570b6e76c7e14f9)) {
        return;
    }
    highestscore = 0;
    foreach (player in level.players) {
        if (isdefined(player.score) && player.score > highestscore) {
            highestscore = player.score;
        }
    }
    if (!level.didhalfscorevoboost) {
        if (attacker.score >= int(level.scorelimit * level.currentround - level.scorelimit / 2)) {
            thread dohalftimevo(attacker);
        }
    }
    if (attacker.score == level.scorelimit - 2) {
        level.kick_afk_check = 1;
    }
    streak = attacker getpersstat("killChains");
    if (isdefined(streak)) {
        attacker setextrascore1(streak);
    }
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x13c5
// Size: 0x19f
function onplayerscore(event, player, originalpoints, victim, eventinfo) {
    player incpersstat("gamemodeScore", originalpoints);
    newscore = int(player getpersstat("gamemodeScore"));
    player scripts/mp/persistence::statsetchild("round", "gamemodeScore", newscore);
    if (player.pers["cur_kill_streak"] > player getpersstat("killChains")) {
        player.pers["killChains"] = player.pers["cur_kill_streak"];
        player setextrascore1(player.pers["cur_kill_streak"]);
    }
    if (isdefined(eventinfo)) {
        if (istrue(eventinfo.var_3a13c58c2a354968)) {
            return 0;
        }
    }
    if (event == #"kill" || event == #"elimination_kill" || isdefined(eventinfo) && istrue(eventinfo.iskillstreakkill)) {
        if (level.scoreontargetplayer) {
            if (victim != player.targetvictim) {
                return 0;
            } else {
                player notify("target_eliminated");
                player.targetvictim = undefined;
                player thread gettarget();
                player thread newtargetmessage();
            }
        }
        adjustedscore = scripts/mp/rank::getscoreinfovalue(#"score_increment");
        /#
            assert(isdefined(adjustedscore));
        #/
        return adjustedscore;
    } else if (event == #"assist_ffa") {
        player bufferednotify("earned_score_buffered", originalpoints);
    }
    return 0;
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x156c
// Size: 0xa3
function dohalftimevo(attacker) {
    attacker scripts/mp/utility/dialog::leaderdialogonplayer("ffa_lead_first");
    newarray = array_sort_with_func(level.players, &compare_player_score);
    if (isdefined(newarray[1])) {
        newarray[1] scripts/mp/utility/dialog::leaderdialogonplayer("ffa_lead_second");
    }
    if (isdefined(newarray[2]) && newarray.size > 2) {
        newarray[2] scripts/mp/utility/dialog::leaderdialogonplayer("ffa_lead_third");
    }
    if (isdefined(newarray[newarray.size - 1]) && newarray.size > 3) {
        newarray[newarray.size - 1] scripts/mp/utility/dialog::leaderdialogonplayer("ffa_lead_last");
    }
    level.didhalfscorevoboost = 1;
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1616
// Size: 0x2b
function compare_player_score(left, right) {
    return left.score >= right.score;
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1649
// Size: 0x19
function onspawnfinished() {
    self endon("death_or_disconnect");
    self waittill("giveLoadout");
    runaonrules();
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1669
// Size: 0x3de
function setspecialloadout() {
    if (matchmakinggame()) {
        meleeweapon = ter_op(randomintrange(0, 99) > 50, "iw8_me_akimboblades", "iw8_knife");
        if (meleeweapon == "iw8_knife") {
            variantid = 11;
        } else {
            variantid = 0;
        }
        if (getdvarint(@"hash_13114be89d903dc0", 1) == 1) {
            var_15f8181003e5624c = randomintrange(0, 99);
            if (var_15f8181003e5624c > 75) {
                meleeweapon = "iw8_me_akimboblunt";
                variantid = 2;
            }
        }
    } else {
        switch (level.aonrules) {
        case 1:
            meleeweapon = "iw8_knife";
            variantid = 11;
            break;
        case 2:
            meleeweapon = "iw8_me_akimboblades";
            variantid = 0;
            break;
        case 3:
            meleeweapon = "iw8_me_akimboblunt";
            variantid = 2;
            break;
        default:
            meleeweapon = "iw8_knife";
            variantid = 11;
            break;
        }
    }
    level.aon_loadouts["allies"]["loadoutPrimary"] = meleeweapon;
    level.aon_loadouts["allies"]["loadoutPrimaryAttachment"] = "none";
    level.aon_loadouts["allies"]["loadoutPrimaryAttachment2"] = "none";
    level.aon_loadouts["allies"]["loadoutPrimaryCamo"] = "none";
    level.aon_loadouts["allies"]["loadoutPrimaryReticle"] = "none";
    level.aon_loadouts["allies"]["loadoutPrimaryVariantID"] = variantid;
    level.aon_loadouts["allies"]["loadoutSecondary"] = "iw8_pi_golf21";
    level.aon_loadouts["allies"]["loadoutSecondaryAttachment"] = "none";
    level.aon_loadouts["allies"]["loadoutSecondaryAttachment2"] = "none";
    level.aon_loadouts["allies"]["loadoutSecondaryCamo"] = "none";
    level.aon_loadouts["allies"]["loadoutSecondaryReticle"] = "none";
    level.aon_loadouts["allies"]["loadoutSecondaryVariantID"] = 1;
    level.aon_loadouts["allies"]["loadoutEquipmentPrimary"] = "equip_throwing_knife";
    level.aon_loadouts["allies"]["loadoutEquipmentSecondary"] = "none";
    level.aon_loadouts["allies"]["loadoutSuper"] = "none";
    level.aon_loadouts["allies"]["loadoutStreakType"] = "assault";
    level.aon_loadouts["allies"]["loadoutKillstreak1"] = "none";
    level.aon_loadouts["allies"]["loadoutKillstreak2"] = "none";
    level.aon_loadouts["allies"]["loadoutKillstreak3"] = "none";
    level.aon_loadouts["allies"]["loadoutUsingSpecialist"] = 1;
    level.aon_loadouts["allies"]["loadoutPerks"] = ["specialty_hustle", "specialty_hardline"];
    level.aon_loadouts["allies"]["loadoutExtraPerks"] = ["specialty_scavenger_plus", "specialty_huntmaster", "specialty_surveillance"];
    level.aon_loadouts["allies"]["loadoutGesture"] = "playerData";
    level.aon_loadouts["allies"]["loadoutFieldUpgrade1"] = "super_deadsilence";
    level.aon_loadouts["allies"]["loadoutFieldUpgrade2"] = "none";
    level.aon_loadouts["axis"] = level.aon_loadouts["allies"];
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a4e
// Size: 0x30
function runaonrules() {
    giveextraaonperks();
    knifeweapon = scripts/cp_mp/utility/weapon_utility::function_eeaa22f0cd1ff845("iw9_knifestab_mp");
    self giveweapon(knifeweapon);
    self assignweaponmeleeslot(knifeweapon);
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a85
// Size: 0x89
function giveextraaonperks() {
    extraperks = ["specialty_blindeye", "specialty_gpsjammer", "specialty_falldamage", "specialty_sharp_focus", "specialty_stalker"];
    foreach (perk in extraperks) {
        giveperk(perk);
    }
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b15
// Size: 0x6b
function onplayerconnect(player) {
    if (level.aonrules > 0) {
        if (level.allowkillstreaks) {
        }
        player scripts/mp/class::function_a16868d4dcd81a4b();
        player.pers["gamemodeLoadout"] = level.aon_loadouts["allies"];
        player loadweaponsforplayer(["iw8_pi_golf21_mp", "iw8_knife_mp"], 1);
    }
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b87
// Size: 0x26b
function gettarget() {
    level endon("game_ended");
    self notify("get_target");
    self endon("get_target");
    if (!scripts/mp/flags::gameflag("prematch_done")) {
        level waittill("prematch_done");
    }
    firsttime = 0;
    if (!isdefined(self.targetarray) || !level.targetplayercycle) {
        self.targetarray = [];
        self.targetindex = 0;
        firsttime = 1;
        foreach (p in level.players) {
            if (p == self) {
                continue;
            }
            self.targetarray[self.targetarray.size] = p;
        }
    }
    if (self.targetarray.size > 0) {
        if (!level.targetplayercycle) {
            self.targetindex = randomint(self.targetarray.size);
        } else {
            if (!firsttime) {
                self.targetindex++;
            }
            if (self.targetindex == self.targetarray.size) {
                self.targetindex = 0;
            }
        }
    }
    self.targetvictim = self.targetarray[self.targetindex];
    if (!isdefined(self.targetvictim)) {
        waitframe();
        thread gettarget();
        thread newtargetmessage();
        return;
    }
    waitframe();
    if (level.showtargettime != 0) {
        self.curorigin = self.origin;
        self.offset3d = (0, 0, 10);
        scripts/mp/gameobjects::requestid(1, 1);
        objid = self.objidnum;
        objective_setlabel(objid, "MP_INGAME_ONLY/OBJ_TARGET_CAPS");
        objective_setzoffset(objid, 90);
        objective_icon(objid, "hud_icon_targeted_player_cir");
        objective_setplayintro(objid, 1);
        scripts/mp/objidpoolmanager::objective_playermask_single(objid, self);
        objective_setbackground(objid, 2);
        objective_position(objid, self.curorigin);
        objective_state(objid, "current");
        scripts/mp/objidpoolmanager::update_objective_onentity(objid, self.targetvictim);
        objective_setownerclient(objid, self.targetvictim);
        if (level.showtargettime > 1) {
            thread updatetargetlocation();
        }
    }
    thread targetvictimdeathwatcher();
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1df9
// Size: 0x49
function targetvictimdeathwatcher() {
    level endon("game_ended");
    self waittill("target_eliminated");
    thread scripts/mp/hud_message::showsplash("target_eliminated", scripts/mp/rank::getscoreinfovalue(#"kill"));
    objective_state(self.objidnum, "done");
    scripts/mp/gameobjects::releaseid();
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e49
// Size: 0xa4
function updatetargetlocation() {
    level endon("game_ended");
    self.targetvictim endon("disconnect");
    self endon("target_eliminated");
    thread updatetargetcurorigin();
    objective_setpings(self.objidnum, 1);
    if (!isdefined(level.objpingdelay)) {
        level.objpingdelay = 3;
    }
    for (;;) {
        if (isdefined(self.targetvictim)) {
            scripts/mp/objidpoolmanager::update_objective_position(self.objidnum, self.curorigin + self.offset3d);
            objective_ping(self.objidnum);
            wait(level.objpingdelay);
            continue;
        }
        waitframe();
    }
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ef4
// Size: 0x60
function updatetargetcurorigin() {
    level endon("game_ended");
    self.targetvictim endon("disconnect");
    self endon("target_eliminated");
    while (true) {
        if (isdefined(self.targetvictim)) {
            self.curorigin = self.targetvictim.origin + (0, 0, 90);
        }
        waitframe();
    }
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f5b
// Size: 0x61
function newtargetmessage() {
    level endon("game_ended");
    self notify("endDeathWatcher");
    self endon("endDeathWatcher");
    if (!scripts/mp/flags::gameflag("prematch_done")) {
        level waittill("prematch_done");
    }
    wait(2.5);
    if (isdefined(self.targetvictim)) {
        self iprintlnbold("MP/DM_NEW_TARGET", self.targetvictim.name);
    }
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc3
// Size: 0x1c
function function_59bc1a507006dcb1() {
    return getdvar(@"hash_e65e9a96eb2ff62b", "dm") == "gold_gun";
}

// Namespace dm / scripts/mp/gametypes/dm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe7
// Size: 0x156
function function_aeefcd8920dc46e0() {
    /#
        self endon("<unknown string>");
        while (true) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0 || getdvarint(@"hash_86e14326e43c0115") != 0) {
                points = 0;
                var_ff962a1182d547dc = getdvarint(@"hash_46a6b424af6acbc2");
                var_f104804091b9dedf = getdvarint(@"hash_86e14326e43c0115");
                if (var_ff962a1182d547dc > 0) {
                    points = var_ff962a1182d547dc;
                }
                if (var_f104804091b9dedf > 0) {
                    points = var_f104804091b9dedf;
                }
                if (var_ff962a1182d547dc == -1 || var_f104804091b9dedf == -1) {
                    points = getdvarint(@"hash_dba1d87860792cd4") - 1;
                }
                foreach (player in level.players) {
                    for (i = 0; i < points; i++) {
                        player scripts/mp/gamescore::giveplayerscore(#"kill", 1);
                    }
                    waitframe();
                }
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_aeefcd8920dc46e0();
    #/
}

