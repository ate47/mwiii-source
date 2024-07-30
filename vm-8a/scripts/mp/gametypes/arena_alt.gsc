#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\gametypes\arena.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\utility\points.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\weapons.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gamescore.gsc;

#namespace arena_alt;

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f1b
// Size: 0xb78
function main() {
    setdvar(@"hash_704afe6f6c582ee0", 10);
    /#
        setdevdvarifuninitialized(@"hash_52b2904136c93f2b", -1);
        if (!isdefined(game["<dev string:x1c>"])) {
            game["<dev string:x1c>"] = -1;
        }
        level thread bootcampmodewatcher();
    #/
    level.bots_gametype_handles_class_choice = 1;
    if (!isdefined(game["launchChunkRuleSet"])) {
        game["launchChunkWinner"] = 0;
        game["launchChunkRuleSet"] = 0;
        game["prevLaunchChunkRuleSet"] = 0;
        game["wasHostAliveAtRoundEnd"] = 1;
        game["matchStartRequiresInput"] = 1;
    } else if (game["launchChunkWinner"] == 1) {
        game["launchChunkWinner"] = 0;
        game["prevLaunchChunkRuleSet"] = game["launchChunkRuleSet"];
        game["launchChunkRuleSet"]++;
        level.resetstats = 1;
        game["matchStartRequiresInput"] = 1;
    }
    /#
        if (game["<dev string:x1c>"] != -1) {
            game["<dev string:x2d>"] = 0;
            game["<dev string:x3f>"] = int(clamp(game["<dev string:x1c>"] - 1, 0, 3));
            game["<dev string:x56>"] = game["<dev string:x1c>"];
            level.resetstats = 1;
            game["<dev string:x69>"] = 1;
        }
    #/
    if (game["launchChunkRuleSet"] > 3) {
        game["launchChunkRuleSet"] = 0;
    }
    registerroundswitchdvar(getgametype(), 0, 0, 9);
    registertimelimitdvar(getgametype(), 30);
    registerscorelimitdvar(getgametype(), 75);
    registerroundlimitdvar(getgametype(), 19);
    registerwinlimitdvar(getgametype(), 10);
    registernumlivesdvar(getgametype(), 0);
    registerhalftimedvar(getgametype(), 0);
    registerwinbytwoenableddvar(getgametype(), 1);
    registerwinbytwomaxroundsdvar(getgametype(), 4);
    setdvar(@"hash_4871f220778a4649", 0);
    if (!isdefined(level.tweakablesinitialized)) {
        scripts\mp\tweakables::init();
    }
    thread launchchunkbotspawning();
    level.setinitialbotdifficulties = 1;
    switch (game["launchChunkRuleSet"]) {
    case 0: 
        if (!isdefined(game["lc_intro_zero"])) {
            game["lc_intro_zero"] = 1;
            game["dialog"]["lc_intro"] = "lc_ffa_first";
        } else if (game["lc_intro_zero"] == 1) {
            game["lc_intro_zero"] = 2;
            game["dialog"]["lc_intro"] = "lc_ffa_second";
        } else {
            game["dialog"]["lc_intro"] = "lc_ffa_third";
        }
        setomnvar("ui_round_hint_override_attackers", 1);
        setomnvar("ui_round_hint_override_defenders", 1);
        setoverridewatchdvar("timelimit", 180);
        setoverridewatchdvar("numlives", 0);
        setoverridewatchdvar("roundlimit", 1);
        setoverridewatchdvar("winlimit", 1);
        setoverridewatchdvar("scorelimit", 15);
        waitthensethealthregentweakable(6);
        setdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKill"), 1);
        setdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_dogtags"), 0);
        setdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_lethalDelay"), 0);
        level.scoreconfirm = 0;
        level.scoredeny = 0;
        break;
    case 1: 
        if (!isdefined(game["lc_intro_one"])) {
            game["lc_intro_one"] = 1;
            game["dialog"]["lc_intro"] = "lc_arena_first";
        } else if (game["lc_intro_one"] == 1) {
            game["lc_intro_one"] = 2;
            game["dialog"]["lc_intro"] = "lc_arena_second";
        } else {
            game["dialog"]["lc_intro"] = "lc_arena_third";
        }
        setomnvar("ui_round_hint_override_attackers", 0);
        setomnvar("ui_round_hint_override_defenders", 0);
        setoverridewatchdvar("timelimit", 40);
        setoverridewatchdvar("numlives", 1);
        setoverridewatchdvar("roundlimit", 0);
        setoverridewatchdvar("winlimit", 6);
        setoverridewatchdvar("scorelimit", 6);
        waitthensethealthregentweakable(0);
        setdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKill"), 0);
        setdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_dogtags"), 0);
        setdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_lethalDelay"), 5);
        level.overridetimelimitclock = 10;
        level.setinitialbotdifficulties = 0;
        break;
    case 2: 
        if (!isdefined(game["lc_intro_two"])) {
            game["lc_intro_two"] = 1;
            game["dialog"]["lc_intro"] = "lc_pos_first";
        } else if (game["lc_intro_two"] == 1) {
            game["lc_intro_two"] = 2;
            game["dialog"]["lc_intro"] = "lc_pos_second";
        } else {
            game["dialog"]["lc_intro"] = "lc_pos_third";
        }
        setomnvar("ui_round_hint_override_attackers", 0);
        setomnvar("ui_round_hint_override_defenders", 0);
        setoverridewatchdvar("timelimit", 40);
        setoverridewatchdvar("numlives", 1);
        setoverridewatchdvar("roundlimit", 0);
        setoverridewatchdvar("winlimit", 6);
        setoverridewatchdvar("scorelimit", 6);
        waitthensethealthregentweakable(0);
        setdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKill"), 0);
        setdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_dogtags"), 0);
        setdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_lethalDelay"), 5);
        level.overridetimelimitclock = 10;
        level.setinitialbotdifficulties = 0;
        break;
    case 3: 
        if (!isdefined(game["lc_intro_three"])) {
            game["lc_intro_three"] = 1;
            game["dialog"]["lc_intro"] = "lc_conf_first";
        } else if (game["lc_intro_three"] == 1) {
            game["lc_intro_three"] = 2;
            game["dialog"]["lc_intro"] = "lc_conf_second";
        } else {
            game["dialog"]["lc_intro"] = "lc_conf_third";
        }
        setomnvar("ui_round_hint_override_attackers", 2);
        setomnvar("ui_round_hint_override_defenders", 2);
        setoverridewatchdvar("timelimit", 180);
        setoverridewatchdvar("numlives", 0);
        setoverridewatchdvar("roundlimit", 1);
        setoverridewatchdvar("winlimit", 1);
        setoverridewatchdvar("scorelimit", 20);
        waitthensethealthregentweakable(6);
        setdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKill"), 0);
        setdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_dogtags"), 1);
        setdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_lethalDelay"), 0);
        level.scoreconfirm = 1;
        level.scoredeny = 0;
        break;
    default: 
        break;
    }
    updategametypedvars();
    if (israndompreviewloadouts()) {
        level.ispreviewbuild = 1;
        level.previewbuildfirstallies = 1;
        level.previewbuildfirstaxis = 1;
    }
    setdvar(@"hash_818c699a5caaee4f", 4);
    level.teambased = 1;
    level.objectivebased = 1;
    level.ontimelimit = &ontimelimit;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerdamaged = &onplayerdamaged;
    level.onnormaldeath = &onnormaldeath;
    level.onplayerkilled = &onplayerkilled;
    level.modeonspawnplayer = &onspawnplayer;
    level.ondeadevent = &ondeadevent;
    level.ontimelimitot = &ontimelimitot;
    level.droplaunchchunkbots = &droplaunchchunkbots;
    level.modifyplayerdamage = &scripts\mp\damage::gamemodemodifyplayerdamage;
    level.allowlatecomers = 0;
    if (!iswinbytworulegametype()) {
        level.skipdefendersadvantage = 1;
    }
    level.disablecopycatloadout = 1;
    setomnvar("ui_killcam_copycat", 0);
    level.bypassclasschoicefunc = &scripts\mp\class::alwaysgamemodeclass;
    game["dialog"]["gametype"] = "iw9_gnft_mode_uktl_gfnm";
    if (ispickuploadouts() && !isdefined(game["roundsPlayed"])) {
        game["dialog"]["offense_obj"] = "boost_arena_pickups";
        game["dialog"]["defense_obj"] = "boost_arena_pickups";
    } else if (level.objmodifier == 1 && !isdefined(game["roundsPlayed"])) {
        game["dialog"]["offense_obj"] = "boost_arena_objective";
        game["dialog"]["defense_obj"] = "boost_arena_objective";
    } else {
        game["dialog"]["offense_obj"] = "iw9_gnft_mode_uktl_gfbo";
        game["dialog"]["defense_obj"] = "iw9_gnft_mode_uktl_gfbo";
    }
    game["dialog"]["obj_indepth"] = "boost_arena_indepth";
    game["dialog"]["securing_a"] = "iw9_gnft_mode_uktl_gfsg";
    game["dialog"]["secured_a"] = "iw9_gnft_mode_uktl_gfsd";
    game["dialog"]["losing_a"] = "iw9_gnft_mode_uktl_gflg";
    game["dialog"]["lost_a"] = "iw9_gnft_mode_uktl_gflt";
    game["dialog"]["round_success"] = "round_win";
    game["dialog"]["round_failure"] = "round_lose";
    game["dialog"]["mission_success"] = "gamestate_win";
    game["dialog"]["mission_failure"] = "gamestate_lost";
    level.allieshealth = 0;
    level.alliesmaxhealth = 0;
    level.axishealth = 0;
    level.axismaxhealth = 0;
    level.usedspawnposone = 0;
    level.usedspawnpostwo = 0;
    level.usedspawnposthree = 0;
    setomnvar("ui_arena_allies_health", 0);
    setomnvar("ui_arena_axis_health", 0);
    setomnvar("ui_arena_allies_health_max", 100);
    setomnvar("ui_arena_axis_health_max", 100);
    setomnvar("ui_arena_primaryVariantID", -1);
    setomnvar("ui_arena_secondaryVariantID", -1);
    if (game["launchChunkRuleSet"] == 0) {
        game["dialog"]["gametype"] = "gametype_ffa";
        game["dialog"]["boost"] = "boost_tdm";
        game["dialog"]["offense_obj"] = "boost_tdm";
        game["dialog"]["defense_obj"] = "boost_tdm";
        return;
    }
    if (game["launchChunkRuleSet"] == 3) {
        game["dialog"]["gametype"] = "gametype_killconfirmed";
        game["dialog"]["boost"] = "boost_killconfirmed";
        game["dialog"]["offense_obj"] = "boost_killconfirmed";
        game["dialog"]["defense_obj"] = "boost_killconfirmed";
        game["dialog"]["kill_confirmed"] = "kill_confirmed";
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a9b
// Size: 0x2f
function waitthensethealthregentweakable(healthregendelay) {
    scripts\mp\tweakables::settweakablevalue("player", "healthregentime", healthregendelay);
    scripts\mp\tweakables::settweakablelastvalue("player", "healthregentime", healthregendelay);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ad2
// Size: 0x8f
function launchchunkbotspawning() {
    level waittill("spawned_player");
    switch (game["launchChunkRuleSet"]) {
    case 0: 
        level.launchchunkfreespawn = 0;
        break;
    case 1: 
        level.launchchunkfreespawn = 1;
        break;
    case 2: 
        level.launchchunkfreespawn = 1;
        break;
    case 3: 
        level.launchchunkfreespawn = 1;
        break;
    default: 
        break;
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b69
// Size: 0x261
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_f3cb432a241a7ea3", getmatchrulesdata("arenaData", "arenaLoadouts"));
    setdynamicdvar(@"hash_b2d6a287c0521607", getmatchrulesdata("arenaData", "loadoutChangeRound"));
    setdynamicdvar(@"hash_9555be126d6bdcab", getmatchrulesdata("arenaData", "switchSpawns"));
    setdynamicdvar(@"hash_a4a7060aad657090", getmatchrulesdata("arenaData", "winCondition"));
    setdynamicdvar(@"hash_1b3b0369b76395a5", getmatchrulesdata("arenaData", "objModifier"));
    setdynamicdvar(@"hash_92027746d0937564", getmatchrulesdata("arenaData", "spawnFlag"));
    setdynamicdvar(@"hash_385f68623c04c6dc", getmatchrulesdata("domData", "flagCaptureTime"));
    setdynamicdvar(@"hash_f86716e8c7f46afd", getmatchrulesdata("arenaData", "tacticalTimeMod"));
    setdynamicdvar(@"hash_44fc747f238c17da", getmatchrulesdata("arenaData", "blastShieldMod"));
    setdynamicdvar(@"hash_4dcb3bff6478bb0d", getmatchrulesdata("arenaData", "blastShieldClamp"));
    setdynamicdvar(@"hash_84ab96fa2f04c271", getmatchrulesdata("arenaData", "startWeapon"));
    setdynamicdvar(@"hash_54f31afe6345346a", getmatchrulesdata("arenaData", "weaponTier1"));
    setdynamicdvar(@"hash_54f319fe63453237", getmatchrulesdata("arenaData", "weaponTier2"));
    setdynamicdvar(@"hash_54f318fe63453004", getmatchrulesdata("arenaData", "weaponTier3"));
    setdynamicdvar(@"hash_54f317fe63452dd1", getmatchrulesdata("arenaData", "weaponTier4"));
    setdynamicdvar(@"hash_54f316fe63452b9e", getmatchrulesdata("arenaData", "weaponTier5"));
    setdynamicdvar(@"hash_54f315fe6345296b", getmatchrulesdata("arenaData", "weaponTier6"));
    setdynamicdvar(@"hash_54f314fe63452738", getmatchrulesdata("arenaData", "weaponTier7"));
    setdynamicdvar(@"hash_54f313fe63452505", getmatchrulesdata("arenaData", "weaponTier8"));
    setdynamicdvar(@"hash_c110a01fb151da3", 0);
    registerhalftimedvar(getgametype(), 0);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd2
// Size: 0x2da
function onstartgametype() {
    setclientnamemode("auto_change");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, %OBJECTIVES/WAR);
        if (level.splitscreen) {
            setobjectivescoretext(entry, %OBJECTIVES/WAR);
        } else {
            setobjectivescoretext(entry, %OBJECTIVES/WAR_SCORE);
        }
        setobjectivehinttext(entry, %OBJECTIVES/WAR_HINT);
    }
    initspawns();
    thread adjustroundendtimer();
    thread waittooverridegraceperiod();
    if (israndomloadouts() || israndompreviewloadouts() || israndomalphaloadouts()) {
        thread updaterandomloadout();
    } else if (ispickuploadouts()) {
        level.lethaldelay = 0;
        defineplayerloadout();
        initweaponmap();
        thread setupweapons();
    } else if (isgungameloadouts()) {
        level.blockweapondrops = 1;
        thread scripts\mp\gametypes\arena::updatearenagungameloadout(0);
    } else if (isrvsgungameloadouts()) {
        level.blockweapondrops = 1;
        thread scripts\mp\gametypes\arena::updatearenagungameloadout(1);
    }
    buildloadoutsforweaponstreaming();
    setupwaypointicons();
    seticonnames();
    if (level.objmodifier == 1) {
        level setupendzones();
    }
    ispreview = 0;
    switch (game["launchChunkRuleSet"]) {
    case 0: 
        break;
    case 1: 
        if (!scripts\mp\flags::gameflag("prematch_done") && game["roundsPlayed"] == 0) {
            ispreview = 1;
        }
        break;
    case 2: 
        break;
    case 3: 
        break;
    default: 
        break;
    }
    level thread scripts\mp\gametypes\arena::spawngameendflagzone();
    updatetournamentroundtime(scripts\mp\gamelogic::gettimeremaining(), 0);
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        if (game["roundsPlayed"] == 0) {
            if (game["launchChunkRuleSet"] == 0 && game["prevLaunchChunkRuleSet"] != 3) {
                level thread outlineenemyplayerslaunchchunk();
            } else {
                level thread outlineenemyplayers();
                level thread removeenemyoutlines();
            }
        }
    }
    if (game["roundsPlayed"] == 0) {
        level thread setroundwinstreakarray();
    }
    setdvar(@"hash_52994f8fc649c87a", 1);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30b4
// Size: 0x32
function droplaunchchunkbots() {
    if (istrue(game["chunkBotsSpawned"])) {
        game["chunkBotsSpawned"] = 0;
        scripts\mp\bots\bots::drop_bots(1, "allies");
        scripts\mp\bots\bots::drop_bots(1, "axis");
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30ee
// Size: 0x50
function tryspawnlaunchchunkbots() {
    if (istrue(game["chunkBotsSpawned"])) {
        return;
    }
    level thread scripts\mp\bots\bots::spawn_bots(1, "allies", undefined, undefined, "spawned_allies", "recruit");
    level thread scripts\mp\bots\bots::spawn_bots(1, "axis", undefined, undefined, "spawned_enemies", "recruit");
    game["chunkBotsSpawned"] = 1;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3146
// Size: 0x24
function waittooverridegraceperiod() {
    scripts\mp\flags::gameflagwait("prematch_done");
    level.overrideingraceperiod = 1;
    level.ingraceperiod = 5;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3172
// Size: 0x13
function adjustroundendtimer() {
    wait 1;
    level.roundenddelay = 4;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x318d
// Size: 0x67b
function updategametypedvars() {
    updatecommongametypedvars();
    if (game["launchChunkRuleSet"] == 3) {
        level.dogtagallyonusecb = &dogtagallyonusecbconf;
        level.dogtagenemyonusecb = &dogtagenemyonusecbconf;
    } else if (level.dogtagsenabled) {
        level.dogtagallyonusecb = &dogtagallyonusecb;
        level.dogtagenemyonusecb = &dogtagenemyonusecb;
    }
    level.arenaloadouts = 2;
    level.loadoutchangeround = dvarintvalue("loadoutChangeRound", 3, 0, 5);
    level.switchspawns = dvarintvalue("switchSpawns", 1, 0, 1);
    level.wincondition = dvarintvalue("winCondition", 1, 0, 2);
    setomnvar("ui_arena_loadout_type", level.arenaloadouts);
    setomnvar("ui_wincondition", level.wincondition);
    level.objmodifier = dvarintvalue("objModifier", 0, 0, 1);
    level.spawnflag = dvarintvalue("spawnFlag", 0, 0, 1);
    if (game["launchChunkRuleSet"] != 1 && game["launchChunkRuleSet"] != 2) {
        level.spawnflag = 0;
    } else if (level.spawnflag) {
        level.ontimelimitgraceperiod = 10;
        level.currenttimelimitdelay = 0;
        level.canprocessot = 1;
    }
    level.tacticaltimemod = dvarfloatvalue("tacticalTimeMod", 2.5, 0.5, 5);
    level.startweapon = getdvar(@"hash_84ab96fa2f04c271", "none");
    level.arenaweapont1 = getdvar(@"hash_54f31afe6345346a", "iw8_pi_golf21_mp");
    level.arenaweapont2 = getdvar(@"hash_54f319fe63453237", "iw8_sh_dpapa12_mp");
    level.arenaweapont3 = getdvar(@"hash_54f318fe63453004", "iw8_sm_mpapa5_mp");
    level.arenaweapont4 = getdvar(@"hash_54f317fe63452dd1", "iw8_ar_mike4_mp");
    level.arenaweapont5 = getdvar(@"hash_54f316fe63452b9e", "iw8_sn_alpha50_mp");
    level.arenaweapont6 = getdvar(@"hash_54f315fe6345296b", "equip_frag");
    level.arenaweapont7 = getdvar(@"hash_54f314fe63452738", "equip_concussion");
    level.arenaweapont8 = getdvar(@"hash_54f313fe63452505", "equip_adrenaline");
    if (game["launchChunkRuleSet"] == 2) {
        level.arenaloadouts = 3;
        level.loadoutchangeround = 3;
        level.startweapon = "none";
        level.arenaweapont1 = "rand_pistol";
        level.arenaweapont2 = "random";
        level.arenaweapont3 = "rand_smg";
        level.arenaweapont4 = "rand_assault";
        level.arenaweapont5 = "rand_sniper";
        level.arenaweapont6 = "rand_lethal";
        level.arenaweapont7 = "rand_tactical";
        level.arenaweapont8 = "random";
        level thread botpickuphack();
    }
    if (ispickuploadouts()) {
        function_e427e359bb108351();
        if (!isdefined(game["roundsPlayed"]) || isdefined(game["roundsPlayed"]) && game["roundsPlayed"] == 0) {
            level.startweapon = getrandomweaponforweapontier(level.startweapon);
            level.arenaweapont1 = getrandomweaponforweapontier(level.arenaweapont1);
            level.arenaweapont2 = getrandomweaponforweapontier(level.arenaweapont2);
            level.arenaweapont3 = getrandomweaponforweapontier(level.arenaweapont3);
            level.arenaweapont4 = getrandomweaponforweapontier(level.arenaweapont4);
            level.arenaweapont5 = getrandomweaponforweapontier(level.arenaweapont5);
            level.arenaweapont6 = getrandomweaponforweapontier(level.arenaweapont6);
            level.arenaweapont7 = getrandomweaponforweapontier(level.arenaweapont7);
            level.arenaweapont8 = getrandomweaponforweapontier(level.arenaweapont8);
        } else if (level.loadoutchangeround == 0 || game["roundsPlayed"] % level.loadoutchangeround != 0) {
            level.startweapon = game["startWeapon"];
            level.arenaweapont1 = game["arenaWeaponT1"];
            level.arenaweapont2 = game["arenaWeaponT2"];
            level.arenaweapont3 = game["arenaWeaponT3"];
            level.arenaweapont4 = game["arenaWeaponT4"];
            level.arenaweapont5 = game["arenaWeaponT5"];
            level.arenaweapont6 = game["arenaWeaponT6"];
            level.arenaweapont7 = game["arenaWeaponT7"];
            level.arenaweapont8 = game["arenaWeaponT8"];
        } else if (game["roundsPlayed"] % level.loadoutchangeround == 0) {
            level.startweapon = getrandomweaponforweapontier(level.startweapon);
            level.arenaweapont1 = getrandomweaponforweapontier(level.arenaweapont1);
            level.arenaweapont2 = getrandomweaponforweapontier(level.arenaweapont2);
            level.arenaweapont3 = getrandomweaponforweapontier(level.arenaweapont3);
            level.arenaweapont4 = getrandomweaponforweapontier(level.arenaweapont4);
            level.arenaweapont5 = getrandomweaponforweapontier(level.arenaweapont5);
            level.arenaweapont6 = getrandomweaponforweapontier(level.arenaweapont6);
            level.arenaweapont7 = getrandomweaponforweapontier(level.arenaweapont7);
            level.arenaweapont8 = getrandomweaponforweapontier(level.arenaweapont8);
        }
        game["startWeapon"] = level.startweapon;
        game["arenaWeaponT1"] = level.arenaweapont1;
        game["arenaWeaponT2"] = level.arenaweapont2;
        game["arenaWeaponT3"] = level.arenaweapont3;
        game["arenaWeaponT4"] = level.arenaweapont4;
        game["arenaWeaponT5"] = level.arenaweapont5;
        game["arenaWeaponT6"] = level.arenaweapont6;
        game["arenaWeaponT7"] = level.arenaweapont7;
        game["arenaWeaponT8"] = level.arenaweapont8;
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3810
// Size: 0x38
function getrandomweaponforweapontier(weapontier) {
    if (issubstr(weapontier, "rand")) {
        if (weapontier == "random") {
            weapontier = getrandomspawnweapon();
        } else {
            weapontier = function_fbc569a8b64fe92b(weapontier);
        }
    }
    return weapontier;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3851
// Size: 0x244
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        scripts\mp\spawnlogic::setactivespawnlogic("default", "default");
    } else {
        scripts\mp\spawnlogic::setactivespawnlogic("LaunchChunk", "Crit_Default");
    }
    var_1cf8be03fb3c42de = scripts\mp\spawnlogic::getspawnpointarray("mp_arena_spawn_allies_start");
    var_68c73806e24ff493 = scripts\mp\spawnlogic::getspawnpointarray("mp_arena_spawn_axis_start");
    arenaspawns = scripts\mp\spawnlogic::getspawnpointarray("mp_arena_spawn");
    if (var_1cf8be03fb3c42de.size > 0 || var_68c73806e24ff493.size > 0) {
        scripts\mp\spawnlogic::addstartspawnpoints("mp_arena_spawn_allies_start");
        scripts\mp\spawnlogic::addstartspawnpoints("mp_arena_spawn_axis_start");
        level.alliesstartspawn = "mp_arena_spawn_allies_start";
        level.axisstartspawn = "mp_arena_spawn_axis_start";
        /#
            validatespawns("<dev string:x81>");
            validatespawns("<dev string:x9d>");
        #/
    } else {
        scripts\mp\spawnlogic::addstartspawnpoints("mp_sd_spawn_attacker");
        scripts\mp\spawnlogic::addstartspawnpoints("mp_sd_spawn_defender");
        level.alliesstartspawn = "mp_sd_spawn_attacker";
        level.axisstartspawn = "mp_sd_spawn_defender";
        /#
            validatespawns("<dev string:xb7>");
            validatespawns("<dev string:xcc>");
        #/
    }
    if (arenaspawns.size > 0) {
        scripts\mp\spawnlogic::addspawnpoints("allies", "mp_arena_spawn");
        scripts\mp\spawnlogic::addspawnpoints("axis", "mp_arena_spawn");
        level.spawntype = "mp_arena_spawn";
    } else {
        arenaspawns = scripts\mp\spawnlogic::getspawnpointarray("mp_tdm_spawn");
        if (arenaspawns.size > 0) {
            scripts\mp\spawnlogic::addspawnpoints("allies", "mp_tdm_spawn");
            scripts\mp\spawnlogic::addspawnpoints("axis", "mp_tdm_spawn");
            level.spawntype = "mp_tdm_spawn";
        } else {
            level.alwaysusestartspawns = 1;
        }
    }
    if (!istrue(level.alwaysusestartspawns)) {
        scripts\mp\spawnlogic::registerspawnset("normal", level.spawntype);
        scripts\mp\spawnlogic::registerspawnset("fallback", level.spawntype);
    }
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a9d
// Size: 0x1be
function validatespawns(spawnpointname) {
    found_1 = 0;
    found_2 = 0;
    found_3 = 0;
    assign_noteworthy = 0;
    spawnpoints = scripts\mp\spawnlogic::getspawnpointarray(spawnpointname);
    foreach (s in spawnpoints) {
        if (isdefined(s.script_noteworthy)) {
            if (!found_1) {
                found_1 = s.script_noteworthy == "1";
            } else {
                assertex(s.script_noteworthy != "1", "Found two spawn points with the same script_noteworthy of \"1\"");
            }
            if (!found_2) {
                found_2 = s.script_noteworthy == "2";
            } else {
                assertex(s.script_noteworthy != "2", "Found two spawn points with the same script_noteworthy of \"2\"");
            }
            if (!found_3) {
                found_3 = s.script_noteworthy == "3";
                level.hasthreespawns = 1;
            } else {
                assertex(s.script_noteworthy != "3", "Found two spawn points with the same script_noteworthy of \"3\"");
            }
            continue;
        }
        if (assign_noteworthy == 0) {
            s.script_noteworthy = "1";
            assign_noteworthy++;
            continue;
        }
        if (assign_noteworthy == 1) {
            s.script_noteworthy = "2";
            assign_noteworthy++;
            continue;
        }
        if (assign_noteworthy == 2) {
            s.script_noteworthy = "3";
            assign_noteworthy++;
            level.hasthreespawns = 1;
        }
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c63
// Size: 0x546
function getspawnpoint() {
    spawnpoint = undefined;
    spawnpointname = level.axisstartspawn;
    var_d8f6b733865965fd = 0;
    var_aa57738edf8a8169 = 0;
    if (self.pers["team"] == game["attackers"]) {
        spawnpointname = level.alliesstartspawn;
    }
    if (scripts\mp\spawnlogic::shoulduseteamstartspawn() || istrue(level.alwaysusestartspawns) || isintournament()) {
        spawnpoints = scripts\mp\spawnlogic::getspawnpointarray(spawnpointname);
        assert(spawnpoints.size);
        if (istrue(level.switchspawns) && game["roundsPlayed"] > 0) {
            var_49ed3f681faf7163 = getteamcount(self.pers["team"]);
            if (var_49ed3f681faf7163 > 3) {
                foreach (player in getteamdata(self.pers["team"], "players")) {
                    if (isdefined(player.pers["arena_spawn_pos"])) {
                        player.pers["arena_spawn_pos"] = "0";
                    }
                }
                var_aa57738edf8a8169 = 1;
            }
        }
        if (istrue(level.switchspawns) && game["roundsPlayed"] > 0 && !var_aa57738edf8a8169) {
            if (self.pers["arena_spawn_pos"] == "1") {
                self.pers["arena_spawn_pos"] = "2";
            } else if (getteamcount(self.pers["team"], 0) == 3 && istrue(level.hasthreespawns) && self.pers["arena_spawn_pos"] == "2") {
                self.pers["arena_spawn_pos"] = "3";
            } else if (self.pers["arena_spawn_pos"] == "3") {
                self.pers["arena_spawn_pos"] = "1";
            } else {
                self.pers["arena_spawn_pos"] = "1";
            }
            spawnpoint = getswitchside_spawnpoint(spawnpoints, self.pers["arena_spawn_pos"]);
        }
        if (!isdefined(spawnpoint)) {
            if (istrue(self.switching_teams_arena) && isdefined(self.pers["arena_spawn_pos"])) {
                cleanupspawn_scriptnoteworthy();
                spawnpoint = getspawnpoint_startspawn(spawnpoints);
                self.switching_teams_arena = undefined;
            } else {
                spawnpoint = getspawnpoint_startspawn(spawnpoints);
            }
            if (!isdefined(spawnpoint)) {
                var_49ed3f681faf7163 = getteamcount(self.pers["team"]);
                if (var_49ed3f681faf7163 > 3) {
                    buddyspawnplayer = undefined;
                    foreach (player in getteamdata(self.pers["team"], "players")) {
                        if (isdefined(player.pers["arena_spawn_pos"])) {
                            if (level.usedspawnposone == 1 && level.usedspawnposone == 1 && level.usedspawnposthree == 1) {
                                level.usedspawnposone = 0;
                                level.usedspawnpostwo = 0;
                                level.usedspawnposthree = 0;
                            }
                            if (player.pers["arena_spawn_pos"] == "1" && level.usedspawnposone == 0) {
                                level.usedspawnposone++;
                                buddyspawnplayer = player;
                                break;
                            }
                            if (player.pers["arena_spawn_pos"] == "2" && level.usedspawnpostwo == 0) {
                                level.usedspawnpostwo++;
                                buddyspawnplayer = player;
                                break;
                            }
                            if (player.pers["arena_spawn_pos"] == "3" && level.usedspawnposthree == 0) {
                                level.usedspawnposthree++;
                                buddyspawnplayer = player;
                                break;
                            }
                            level.usedspawnposone++;
                            buddyspawnplayer = player;
                            break;
                        }
                    }
                    if (isdefined(buddyspawnplayer)) {
                        spawnpoint = scripts\mp\spawnscoring::findteammatebuddyspawn(buddyspawnplayer);
                        var_d8f6b733865965fd = 1;
                    }
                }
            }
            if (istrue(level.switchspawns) && game["roundsPlayed"] == 0 && !var_d8f6b733865965fd) {
                assertex(isdefined(spawnpoint.script_noteworthy) && (spawnpoint.script_noteworthy == "1" || spawnpoint.script_noteworthy == "2" || spawnpoint.script_noteworthy == "3"));
                self.pers["arena_spawn_pos"] = spawnpoint.script_noteworthy;
            }
        }
    } else {
        scripts\mp\spawnlogic::activatespawnset("normal");
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, self.pers["team"], "normal", "fallback");
    }
    return spawnpoint;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41b2
// Size: 0x1fd
function cleanupspawn_scriptnoteworthy() {
    otherteam = getotherteam(self.pers["team"])[0];
    if (otherteam == game["attackers"]) {
        spawnpointname = level.alliesstartspawn;
        var_55af954984fc6a2a = level.axisstartspawn;
    } else {
        spawnpointname = level.axisstartspawn;
        var_55af954984fc6a2a = level.alliesstartspawn;
    }
    var_cb5363ab35b26aea = scripts\mp\spawnlogic::getspawnpointarray(spawnpointname);
    assert(var_cb5363ab35b26aea.size);
    foreach (s in var_cb5363ab35b26aea) {
        if (s.script_noteworthy == self.pers["arena_spawn_pos"]) {
            s.selected = 0;
        }
    }
    var_cb5363ab35b26aea = scripts\mp\spawnlogic::getspawnpointarray(var_55af954984fc6a2a);
    assert(var_cb5363ab35b26aea.size);
    foreach (s in var_cb5363ab35b26aea) {
        foreach (player in getteamdata(self.pers["team"], "players")) {
            if (player != self && isdefined(player.pers["arena_spawn_pos"]) && s.script_noteworthy != player.pers["arena_spawn_pos"]) {
                s.selected = 0;
            }
        }
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x43b7
// Size: 0xe5
function getspawnpoint_startspawn(spawnpoints, onlyunselected) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    bestspawn = undefined;
    spawnpoints = scripts\mp\spawnscoring::checkdynamicspawns(spawnpoints);
    foreach (spawnpoint in spawnpoints) {
        if (!isdefined(spawnpoint.selected)) {
            continue;
        }
        if (spawnpoint.selected) {
            continue;
        }
        if (spawnpoint.script_noteworthy == "1") {
            bestspawn = spawnpoint;
            break;
        } else if (spawnpoint.script_noteworthy == "2") {
            bestspawn = spawnpoint;
            break;
        }
        bestspawn = spawnpoint;
    }
    if (isdefined(bestspawn)) {
        bestspawn.selected = 1;
    }
    return bestspawn;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x44a5
// Size: 0xb4
function getswitchside_spawnpoint(spawnpoints, spawnnoteworthy) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    var_cee9d4c5101c6ead = 0;
    foreach (spawnpoint in spawnpoints) {
        if (spawnpoint.script_noteworthy == spawnnoteworthy) {
            if (istrue(spawnpoint.selected)) {
                var_cee9d4c5101c6ead = 1;
                continue;
            }
            spawnpoint.selected = 1;
            return spawnpoint;
        }
    }
    assertex(var_cee9d4c5101c6ead == 1, "Spawns don't have a script_noteworthy to support spawn switches! There should be a \"1\" or a \"2\"");
    return undefined;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4562
// Size: 0x170
function onplayerconnect(player) {
    level.bots_gametype_handles_class_choice = 1;
    if (istrue(level.resetstats)) {
        player resetpersstats();
    }
    player.arenadamage = 0;
    player setextrascore0(0);
    if (isdefined(player.pers["damage"])) {
        player setextrascore0(player.pers["damage"]);
    }
    player scripts\mp\class::function_a16868d4dcd81a4b();
    player setclientomnvar("ui_launch_chunk_phase", 0);
    if (!istrue(game["chunkFirstAssigned"])) {
        player.pers["gamemodeLoadout"] = level.chunkloadouts[3];
        game["chunkFirstAssigned"] = 1;
    } else if (israndomloadouts() || israndompreviewloadouts() || israndomalphaloadouts()) {
        player.pers["gamemodeLoadout"] = game["arenaRandomLoadout"][game["arenaRandomLoadoutIndex"]];
    } else if (ispickuploadouts()) {
        player.pers["gamemodeLoadout"] = level.arena_loadouts["axis"];
    }
    if (istrue(level.switchspawns) && !isdefined(player.pers["arena_spawn_pos"])) {
        player.pers["arena_spawn_pos"] = "0";
    }
    player thread onjoinedteam();
    player updatehighpriorityweapons();
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46da
// Size: 0x136
function resetpersstats() {
    self.pers["score"] = 0;
    self.pers["kills"] = 0;
    self.pers["deaths"] = 0;
    self.pers["suicides"] = 0;
    self.pers["headshots"] = 0;
    self.pers["assists"] = 0;
    self.pers["captures"] = 0;
    self.pers["confirmed"] = 0;
    self.pers["denied"] = 0;
    self.pers["extrascore0"] = 0;
    self.pers["extrascore1"] = 0;
    self.pers["extrascore2"] = 0;
    self.pers["damage"] = 0;
    self.pers["gamemodeScore"] = 0;
    self.score = 0;
    self.kills = 0;
    self.deaths = 0;
    self.assists = 0;
    self.extrascore0 = 0;
    self.extrascore1 = 0;
    self.extrascore2 = 0;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4818
// Size: 0x281
function onjoinedteam() {
    level endon("game_ended");
    for (;;) {
        waittill_any_2("joined_team", "joined_spectators");
        var_586dc9dc0cf668ad = getdvarint(@"hash_b1d561f9a9241e09", 100);
        if (isbot(self)) {
            wait 0.1;
        }
        alliesplayers = getteamdata("allies", "teamCount");
        if (alliesplayers) {
            level.alliesmaxhealth = getteamdata("allies", "teamCount") * var_586dc9dc0cf668ad;
            setomnvar("ui_arena_allies_health_max", level.alliesmaxhealth);
            if (!isreallyalive(self) && scripts\mp\playerlogic::mayspawn()) {
                self waittill("spawned_player");
            }
            allieshealth = 0;
            foreach (player in getteamdata("allies", "players")) {
                allieshealth += player.health;
            }
            level.allieshealth = allieshealth;
            if (level.allieshealth < 0) {
                level.allieshealth = 0;
            }
            setomnvar("ui_arena_allies_health", level.allieshealth);
        } else {
            setomnvar("ui_arena_allies_health", 0);
        }
        axisplayers = getteamdata("axis", "teamCount");
        if (axisplayers) {
            level.axismaxhealth = getteamdata("axis", "teamCount") * var_586dc9dc0cf668ad;
            setomnvar("ui_arena_axis_health_max", level.axismaxhealth);
            if (!isreallyalive(self) && scripts\mp\playerlogic::mayspawn()) {
                self waittill("spawned_player");
            }
            axishealth = 0;
            foreach (player in getteamdata("axis", "players")) {
                axishealth += player.health;
            }
            level.axishealth = axishealth;
            if (level.axishealth < 0) {
                level.axishealth = 0;
            }
            setomnvar("ui_arena_axis_health", level.axishealth);
            continue;
        }
        setomnvar("ui_arena_axis_health", 0);
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4aa1
// Size: 0x23
function onspawnplayer(revivespawn) {
    thread onspawnfinished();
    level notify("spawned_player");
    thread updatematchstatushintonspawn();
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4acc
// Size: 0x2c
function hackthread() {
    self notifyonplayercommand("hack_notify", "+gostand");
    self notifyonplayercommand("hack_notify", "+usereload");
    thread hackwatcher();
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b00
// Size: 0x60
function hackwatcher() {
    level endon("game_ended");
    self waittill("hack_notify");
    self notify("luinotifyserver", "class_select", 2);
    level notify("pressToStartMatch");
    self setclientomnvar("ui_launch_chunk_phase", 0);
    game["matchStartRequiresInput"] = 0;
    self notifyonplayercommandremove("hack_notify", "+gostand");
    self notifyonplayercommandremove("hack_notify", "+usereload");
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b68
// Size: 0x3c2
function onspawnfinished() {
    self endon("death_or_disconnect");
    /#
        if (getdvarint(@"hash_d657640801ffcf07", 0) == 1) {
            game["<dev string:x69>"] = 0;
            level notify("<dev string:xe1>");
        }
    #/
    if (game["matchStartRequiresInput"] && !isbot(self)) {
        foreach (entry in level.teamnamelist) {
            level.requiredplayercount[entry] = 0;
        }
        self setclientomnvar("ui_launch_chunk_phase", game["launchChunkRuleSet"] + 1);
        self setclientomnvar("ui_options_menu", 3);
        wait 2;
        self setclientomnvar("ui_launch_chunk_phase", 5);
        thread hackthread();
        while (true) {
            msg, value = self waittill("luinotifyserver");
            if (msg == "class_select") {
                break;
            }
        }
        level notify("pressToStartMatch");
        self setclientomnvar("ui_launch_chunk_phase", 0);
        game["matchStartRequiresInput"] = 0;
        scripts\mp\utility\dialog::leaderdialogonplayer("lc_intro", "lc_intro");
    }
    thread damagewatcher();
    self waittill("giveLoadout");
    runarenaloadoutrulesonplayer();
    thread modifyblastshieldperk();
    wait 0.1;
    self.hasarenaspawned = 1;
    if (isbot(self)) {
        if (!isdefined(game["chunkBotsDifficulty"])) {
            botpersonality = "camper";
            game["chunkBotsDifficulty"] = "recruit";
        } else {
            var_c22f59e21c234d66 = randomint(3);
            switch (var_c22f59e21c234d66) {
            case 0:
            default: 
                botpersonality = "camper";
                break;
            case 1: 
                botpersonality = "run_and_gun";
                break;
            case 2: 
                botpersonality = "cqb";
                break;
            }
            difficulties = ["recruit", "regular", "hardened", "veteran"];
            difficultyindex = 0;
            if (isdefined(game["chunkBotsDifficulty"])) {
                for (i = 0; i < difficulties.size; i++) {
                    if (game["chunkBotsDifficulty"] == difficulties[i]) {
                        difficultyindex = i;
                        break;
                    }
                }
                if (!level.setinitialbotdifficulties && (game["launchChunkRuleSet"] == 1 || game["launchChunkRuleSet"] == 2)) {
                    if (!isbot(self)) {
                        if (game["previousWinningTeam"] == self.team && game["wasHostAliveAtRoundEnd"]) {
                            if (difficultyindex < difficulties.size - 1) {
                                difficultyindex++;
                            }
                        } else if (difficultyindex > 0) {
                            difficultyindex--;
                        }
                    }
                    game["chunkBotsDifficulty"] = difficulties[difficultyindex];
                    level.setinitialbotdifficulties = 1;
                }
            }
        }
        /#
            iprintlnbold("<dev string:xf3>" + game["<dev string:x104>"]);
        #/
        self botsetdifficulty(game["chunkBotsDifficulty"]);
        scripts\mp\bots\bots_util::bot_set_personality(botpersonality);
    }
    wait 0.15;
    if (!scripts\mp\flags::gameflag("prematch_done") && game["roundsPlayed"] == 0) {
        if (level.spawnflag && isdefined(level.matchcountdowntime) && level.matchcountdowntime > 5) {
            if (!self issplitscreenplayer() || self issplitscreenplayerprimary()) {
                scripts\mp\utility\dialog::leaderdialogonplayer("obj_indepth", "introboost");
            }
        }
        level waittill_any_2("prematch_done", "removeArenaOutlines");
    }
    self setclientomnvar("ui_player_notify_loadout", gettime());
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f32
// Size: 0x59
function modifyblastshieldperk() {
    blastshieldmod = dvarintvalue("blastShieldMod", 0.65, 0, 1);
    if (isbot(self)) {
        if (blastshieldmod == 0 || game["launchChunkRuleSet"] == 0 || game["launchChunkRuleSet"] == 3) {
            removeperk("specialty_blastshield");
        }
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 14, eflags: 0x0
// Checksum 0x0, Offset: 0x4f93
// Size: 0xf1
function onplayerdamaged(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, var_fcdf19e3cdd29669, vpoint, vdir, shitloc, psoffsettime, modelindex, partname) {
    if (isdefined(eattacker) && eattacker != victim && isplayer(eattacker)) {
        if (idamage >= var_fcdf19e3cdd29669) {
            idamage = var_fcdf19e3cdd29669;
        }
        eattacker.arenadamage += idamage;
        eattacker scripts\mp\persistence::statsetchild("round", "damage", eattacker.pers["damage"]);
        eattacker setextrascore0(eattacker.pers["damage"]);
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x508c
// Size: 0x2b1
function damagewatcher() {
    self notify("startDamageWatcher");
    self endon("startDamageWatcher");
    level endon("game_ended");
    self endon("disconnect");
    self.totaldamagetaken = 0;
    while (true) {
        waittill_any_7("damage", "force_regeneration", "removeAdrenaline", "healed", "naturalHealthRegen", "vampirism", "spawned_player");
        if (self.team == "allies") {
            allieshealth = 0;
            foreach (player in getteamdata("allies", "players")) {
                allieshealth += player.health;
            }
            level.allieshealth = allieshealth;
            if (level.allieshealth < 0) {
                level.allieshealth = 0;
            }
            setomnvar("ui_arena_allies_health", level.allieshealth);
        } else {
            axishealth = 0;
            foreach (player in getteamdata("axis", "players")) {
                axishealth += player.health;
            }
            level.axishealth = axishealth;
            if (level.axishealth < 0) {
                level.axishealth = 0;
            }
            setomnvar("ui_arena_axis_health", level.axishealth);
        }
        if (istrue(self.iscapturing)) {
            objflag = undefined;
            if (level.objmodifier == 1) {
                if (self.team == game["defenders"]) {
                    level.attackerendzone.curprogress = 50;
                    level.attackerendzone.teamprogress[self.team] = 50;
                    objflag = level.attackerendzone;
                } else if (self.team == game["attackers"]) {
                    level.defenderendzone.curprogress = 50;
                    level.defenderendzone.teamprogress[self.team] = 50;
                    objflag = level.defenderendzone;
                }
                scripts\mp\objidpoolmanager::objective_set_progress(objflag.objidnum, objflag.curprogress / objflag.usetime);
            }
        }
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5345
// Size: 0x35e
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    if (isbot(victim)) {
        victim.classcallback = "gamemode";
    }
    if (game["state"] == "postgame") {
        attacker.finalkill = 1;
    }
    if (game["launchChunkRuleSet"] == 0 || game["launchChunkRuleSet"] == 3) {
        if (isbot(attacker)) {
            if (attacker.kills % 4 == 0 || !isbot(victim)) {
                difficulties = ["recruit", "regular", "hardened", "veteran"];
                difficultyindex = 0;
                difficulty = attacker botgetdifficulty();
                if (difficulty == "recruit") {
                    difficultyindex = 0;
                } else if (difficulty == "regular") {
                    difficultyindex = 0;
                } else if (difficulty == "hardened") {
                    difficultyindex = 1;
                } else if (difficulty == "veteran") {
                    difficultyindex = 2;
                }
                attacker botsetdifficulty(difficulties[difficultyindex]);
                game["chunkBotsDifficulty"] = difficulties[difficultyindex];
                /#
                    iprintlnbold("<dev string:xf3>" + attacker.name + "<dev string:x118>" + difficulties[difficultyindex]);
                #/
            }
        }
        if (isbot(victim)) {
            if (victim.deaths % 2 == 0) {
                difficulties = ["recruit", "regular", "hardened", "veteran"];
                difficultyindex = 0;
                difficulty = victim botgetdifficulty();
                if (difficulty == "recruit") {
                    difficultyindex = 1;
                } else if (difficulty == "regular") {
                    difficultyindex = 2;
                } else if (difficulty == "hardened") {
                    difficultyindex = 3;
                } else if (difficulty == "veteran") {
                    difficultyindex = 3;
                }
                victim botsetdifficulty(difficulties[difficultyindex]);
                game["chunkBotsDifficulty"] = difficulties[difficultyindex];
                /#
                    iprintlnbold("<dev string:xf3>" + victim.name + "<dev string:x128>" + difficulties[difficultyindex]);
                #/
            }
        }
        if (victim.deaths % 3 == 0) {
            game["arenaRandomLoadoutIndex"]++;
            if (game["arenaRandomLoadoutIndex"] == game["arenaRandomLoadout"].size) {
                game["arenaRandomLoadoutIndex"] = 0;
            }
            victim.pers["gamemodeLoadout"] = game["arenaRandomLoadout"][game["arenaRandomLoadoutIndex"]];
        }
        return;
    }
    if (!isbot(victim)) {
        timeremaining = scripts\mp\gamelogic::gettimeremaining();
        if (timeremaining > 35000) {
            difficulties = ["recruit", "regular", "hardened", "veteran"];
            difficultyindex = 0;
            difficulty = game["chunkBotsDifficulty"];
            if (difficulty == "recruit") {
                difficultyindex = 0;
            } else if (difficulty == "regular") {
                difficultyindex = 0;
            } else if (difficulty == "hardened") {
                difficultyindex = 1;
            } else if (difficulty == "veteran") {
                difficultyindex = 1;
            }
            game["chunkBotsDifficulty"] = difficulties[difficultyindex];
            /#
                iprintlnbold("<dev string:x138>" + difficulties[difficultyindex]);
            #/
        }
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x56ab
// Size: 0x72
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid) {
    if (isbot(self)) {
        self.classcallback = "gamemode";
    }
    thread checkallowspectating();
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5725
// Size: 0x88
function checkallowspectating() {
    waitframe();
    update = 0;
    if (!getteamdata(game["attackers"], "aliveCount")) {
        level.spectateoverride[game["attackers"]].allowenemyspectate = 1;
        update = 1;
    }
    if (!getteamdata(game["defenders"], "aliveCount")) {
        level.spectateoverride[game["defenders"]].allowenemyspectate = 1;
        update = 1;
    }
    if (update) {
        scripts\mp\spectating::updatespectatesettings();
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57b5
// Size: 0x82
function ontimelimit() {
    updatetournamentroundtime(scripts\mp\gamelogic::gettimeremaining(), 3);
    if (game["launchChunkRuleSet"] == 0 || game["launchChunkRuleSet"] == 3) {
        scripts\mp\gamelogic::default_ontimelimit();
    } else if (level.wincondition == 1) {
        checkliveswinner();
    } else if (level.wincondition == 2) {
        checkhealthwinner();
    } else {
        checkhealthwinner();
    }
    if (game["launchChunkRuleSet"] != 3) {
        level tryspawnlaunchchunkbots();
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x583f
// Size: 0x38
function ontimelimitot() {
    updatetournamentroundtime(scripts\mp\gamelogic::gettimeremaining(), 1);
    runovertime = 1;
    if (getgametypenumlives() == 0) {
        runovertime = 0;
    }
    if (runovertime) {
        level thread startotmechanics();
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x587f
// Size: 0xf1
function checkliveswinner() {
    if (getteamdata("allies", "aliveCount") > getteamdata("axis", "aliveCount")) {
        game["dialog"]["round_success"] = "gamestate_win_health";
        game["dialog"]["round_failure"] = "gamestate_lost_health";
        thread arena_endgame("allies", game["end_reason"]["arena_time_lives_win"], game["end_reason"]["arena_time_lives_loss"]);
        return;
    }
    if (getteamdata("axis", "aliveCount") > getteamdata("allies", "aliveCount")) {
        game["dialog"]["round_success"] = "gamestate_win_health";
        game["dialog"]["round_failure"] = "gamestate_lost_health";
        thread arena_endgame("axis", game["end_reason"]["arena_time_lives_win"], game["end_reason"]["arena_time_lives_loss"]);
        return;
    }
    checkhealthwinner();
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5978
// Size: 0x11b
function checkhealthwinner() {
    if (level.axishealth < level.allieshealth) {
        game["dialog"]["round_success"] = "gamestate_win_health";
        game["dialog"]["round_failure"] = "gamestate_lost_health";
        thread arena_endgame("allies", game["end_reason"]["arena_time_health_win"], game["end_reason"]["arena_time_health_loss"]);
        return;
    }
    if (level.allieshealth < level.axishealth) {
        game["dialog"]["round_success"] = "gamestate_win_health";
        game["dialog"]["round_failure"] = "gamestate_lost_health";
        thread arena_endgame("axis", game["end_reason"]["arena_time_health_win"], game["end_reason"]["arena_time_health_loss"]);
        return;
    }
    if (matchmakinggame()) {
        betterteam = scripts\mp\gamelogic::getbetterteam();
        thread scripts\mp\gamelogic::endgame(betterteam, game["end_reason"]["time_limit_reached"]);
        return;
    }
    thread arena_endgame("tie", game["end_reason"]["time_limit_reached"]);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a9b
// Size: 0x7e
function ondeadevent(team) {
    if (team == game["attackers"]) {
        level thread arena_endgame(game["defenders"], game["end_reason"][tolower(game[game["attackers"]]) + "_eliminated"]);
        return;
    }
    if (team == game["defenders"]) {
        level thread arena_endgame(game["attackers"], game["end_reason"][tolower(game[game["defenders"]]) + "_eliminated"]);
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b21
// Size: 0xb
function ontimelimitdeadevent(team) {
    
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x5b34
// Size: 0x2a1
function arena_endgame(winningteam, endreasontext, endreasontextloss, nukedetonated, var_8e4a26ed257a393b) {
    if (isgungameloadouts() || isrvsgungameloadouts()) {
        level setenemyloadoutomnvarsatmatchend(winningteam);
    }
    if (winningteam != "tie") {
        game["previousWinningTeam"] = winningteam;
        foreach (entry in level.teamnamelist) {
            if (entry == winningteam) {
                game["roundWinStreak"][winningteam]++;
                continue;
            }
            game["roundWinStreak"][entry] = 0;
        }
        switch (game["roundWinStreak"][winningteam]) {
        case 2: 
            game["dialog"]["round_success"] = "round_win_streak_2";
            break;
        case 3: 
            game["dialog"]["round_success"] = "round_win_streak_3";
            break;
        case 4: 
            game["dialog"]["round_success"] = "round_win_streak_4";
            break;
        case 5: 
            roundswon = getroundswon(winningteam);
            winlimit = getwatcheddvar("winlimit");
            if (winlimit == 6 && roundswon != winlimit - 1) {
                game["dialog"]["round_success"] = "round_win_streak_5";
            }
            break;
        default: 
            break;
        }
        if (game["finalRound"] == 1) {
            if (game["roundWinStreak"][winningteam] > 3) {
                game["dialog"]["mission_success"] = "gamestate_win_comeback";
            }
        }
    } else {
        game["previousWinningTeam"] = "";
    }
    hostplayer = undefined;
    foreach (player in level.players) {
        if (!isbot(player)) {
            hostplayer = player;
        }
    }
    if (isdefined(hostplayer) && !isalive(hostplayer)) {
        game["wasHostAliveAtRoundEnd"] = 0;
    } else {
        game["wasHostAliveAtRoundEnd"] = 1;
    }
    thread scripts\mp\gamelogic::endgame(winningteam, endreasontext, endreasontextloss, nukedetonated, var_8e4a26ed257a393b);
    if (game["launchChunkRuleSet"] != 3) {
        level thread tryspawnlaunchchunkbots();
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ddd
// Size: 0x5d
function setroundwinstreakarray() {
    wait 1;
    foreach (entry in level.teamnamelist) {
        game["roundWinStreak"][entry] = 0;
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e42
// Size: 0xda
function runarenaloadoutrulesonplayer() {
    if (israndomloadouts() || israndompreviewloadouts() || israndomalphaloadouts()) {
        if (israndompreviewloadouts() || israndomalphaloadouts()) {
            if (self.pers["gamemodeLoadout"]["loadoutSecondary"] == "none") {
                _takeweapon("iw9_me_fists_mp");
            }
        }
        return;
    }
    if (ispickuploadouts()) {
        self.equipment = [];
        if (game["roundsPlayed"] == 0) {
            wait 0.1;
        } else {
            wait 0.25;
        }
        if (issubstr(level.startweapon, "equip")) {
            scripts\mp\equipment::giveequipment(level.startweapon, scripts\mp\equipment::getdefaultslot(level.startweapon));
        }
        if (level.takefists) {
            _takeweapon("iw9_me_fists_mp");
        }
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f24
// Size: 0x247
function buildloadoutsforweaponstreaming() {
    level.loadweapons = [];
    level.takefists = 0;
    if (ispickuploadouts()) {
        if (level.startweapon == "none") {
            newweapon = "iw9_me_fists_mp";
            newweaponobj = makeweapon(newweapon);
            newweapon = getcompleteweaponname(newweaponobj);
        } else if (issubstr(level.startweapon, "equip")) {
            newweapon = "iw9_me_fists_mp";
            newweaponobj = makeweapon(newweapon);
            newweapon = getcompleteweaponname(newweaponobj);
        } else {
            rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(level.startweapon);
            attachments = [];
            newweaponobj = namespace_e0ee43ef2dddadaa::buildweapon(rootname, attachments, "none", "none", -1);
            newweapon = getcompleteweaponname(newweaponobj);
            level.takefists = 1;
        }
        level.newweaponname = newweapon;
        level.loadweapons[level.loadweapons.size] = newweaponobj;
        return;
    }
    primaries = [];
    var_2aee5a9b1a165f09 = [];
    loadout = game["arenaRandomLoadout"][game["arenaRandomLoadoutIndex"]];
    primary = loadout["loadoutPrimary"];
    secondary = loadout["loadoutSecondary"];
    if (primary != "none") {
        primaries[primaries.size] = buildprimaries(primary, loadout);
    }
    if (secondary != "none") {
        var_2aee5a9b1a165f09[var_2aee5a9b1a165f09.size] = buildsecondaries(secondary, loadout);
    }
    if (level.loadoutchangeround != 0) {
        nextloadoutindex = game["arenaRandomLoadoutIndex"] + 1;
        if (game["arenaRandomLoadoutIndex"] == game["arenaRandomLoadout"].size - 1) {
            nextloadoutindex = 0;
        }
        nextloadout = game["arenaRandomLoadout"][nextloadoutindex];
        nextprimary = nextloadout["loadoutPrimary"];
        nextsecondary = nextloadout["loadoutSecondary"];
        if (nextprimary != "none") {
            primaries[primaries.size] = buildprimaries(nextprimary, nextloadout);
        }
        if (nextsecondary != "none") {
            var_2aee5a9b1a165f09[var_2aee5a9b1a165f09.size] = buildsecondaries(nextsecondary, nextloadout);
        }
    }
    level.loadweapons = array_combine(primaries, var_2aee5a9b1a165f09);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6173
// Size: 0xd7
function buildprimaries(primary, loadout) {
    var_ac82e189f4d06152 = [];
    for (i = 1; i < 6; i++) {
        concat = i;
        if (i == 1) {
            concat = "";
        }
        attachment = loadout["loadoutPrimaryAttachment" + concat];
        if (attachment != "none") {
            var_ac82e189f4d06152[var_ac82e189f4d06152.size] = attachment;
        }
    }
    rootname = getweaponrootname(primary);
    camoname = "none";
    reticleindex = "none";
    newweaponobject = namespace_e0ee43ef2dddadaa::buildweapon(rootname, var_ac82e189f4d06152, camoname, reticleindex);
    newweapon = getcompleteweaponname(newweaponobject);
    return newweapon;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6253
// Size: 0xd7
function buildsecondaries(secondary, loadout) {
    var_ac82e189f4d06152 = [];
    for (i = 1; i < 5; i++) {
        concat = i;
        if (i == 1) {
            concat = "";
        }
        attachment = loadout["loadoutSecondaryAttachment" + concat];
        if (attachment != "none") {
            var_ac82e189f4d06152[var_ac82e189f4d06152.size] = attachment;
        }
    }
    camoname = "none";
    reticleindex = "none";
    rootname = getweaponrootname(secondary);
    newweaponobject = namespace_e0ee43ef2dddadaa::buildweapon(rootname, var_ac82e189f4d06152, camoname, reticleindex);
    newweapon = getcompleteweaponname(newweaponobject);
    return newweapon;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6333
// Size: 0x2ee
function defineplayerloadout() {
    if (isdefined(level.startweapon) && level.startweapon != "none" && !issubstr(level.startweapon, "equip")) {
        primary = namespace_e0ee43ef2dddadaa::getweaponrootname(level.startweapon);
    } else {
        primary = "none";
    }
    level.arena_loadouts["default"]["loadoutArchetype"] = "archetype_assault";
    level.arena_loadouts["default"]["loadoutPrimary"] = primary;
    level.arena_loadouts["default"]["loadoutPrimaryAttachment"] = "none";
    level.arena_loadouts["default"]["loadoutPrimaryAttachment2"] = "none";
    level.arena_loadouts["default"]["loadoutPrimaryCamo"] = "none";
    level.arena_loadouts["default"]["loadoutPrimaryReticle"] = "none";
    level.arena_loadouts["default"]["loadoutSecondary"] = "none";
    level.arena_loadouts["default"]["loadoutSecondaryAttachment"] = "none";
    level.arena_loadouts["default"]["loadoutSecondaryAttachment2"] = "none";
    level.arena_loadouts["default"]["loadoutSecondaryCamo"] = "none";
    level.arena_loadouts["default"]["loadoutSecondaryReticle"] = "none";
    level.arena_loadouts["default"]["loadoutMeleeSlot"] = "iw9_me_fists_mp_ls";
    level.arena_loadouts["default"]["loadoutEquipmentPrimary"] = "none";
    level.arena_loadouts["default"]["loadoutEquipmentSecondary"] = "none";
    level.arena_loadouts["default"]["loadoutStreakType"] = "assault";
    level.arena_loadouts["default"]["loadoutKillstreak1"] = "none";
    level.arena_loadouts["default"]["loadoutKillstreak2"] = "none";
    level.arena_loadouts["default"]["loadoutKillstreak3"] = "none";
    level.arena_loadouts["default"]["loadoutSuper"] = "none";
    level.arena_loadouts["default"]["loadoutPerks"] = ["specialty_blastshield"];
    level.arena_loadouts["default"]["loadoutGesture"] = "playerData";
    level.arena_loadouts["default"]["loadoutExecution"] = "playerData";
    level.arena_loadouts["allies"] = level.arena_loadouts["default"];
    level.arena_loadouts["axis"] = level.arena_loadouts["default"];
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6629
// Size: 0xe3
function updaterandomloadout() {
    if (israndomloadouts() || israndompreviewloadouts() || israndomalphaloadouts()) {
        /#
            if (getdvarint(@"hash_b665ceb14dabc0ed", 0) != 0) {
                cacherandomloadouts();
                game["<dev string:x157>"] = 0;
                return;
            }
        #/
        if (game["roundsPlayed"] == 0) {
            if (istrue(game["practiceRound"])) {
                cacherandomloadouts();
                game["arenaRandomLoadoutIndex"] = 0;
            } else if (!isdefined(game["practiceRound"])) {
                cacherandomloadouts();
                game["arenaRandomLoadoutIndex"] = 0;
            }
            return;
        }
        if (level.loadoutchangeround != 0) {
            if (game["roundsPlayed"] % level.loadoutchangeround == 0) {
                game["arenaRandomLoadoutIndex"]++;
            }
            if (game["arenaRandomLoadoutIndex"] == game["arenaRandomLoadout"].size) {
                game["arenaRandomLoadoutIndex"] = 0;
            }
            return;
        }
        game["arenaRandomLoadoutIndex"] = 0;
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6714
// Size: 0x10f
function cacherandomloadouts() {
    game["arenaRandomLoadout"] = [];
    level.chunkloadouts = [];
    classtables = scripts\mp\gametypes\arena::function_3187496929140714(["arena_alt_class_table"]);
    foreach (classtable in classtables) {
        foreach (loadout in classtable.classlist) {
            level.chunkloadouts[level.chunkloadouts.size] = scripts\mp\gametypes\arena::function_37f8be8199814f97(loadout);
        }
    }
    loadouts = level.chunkloadouts;
    loadouts = arenaloadouts_select(loadouts, 99);
    game["arenaRandomLoadout"] = array_randomize(loadouts);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x682b
// Size: 0x1bd
function updateloadoutarray(table, classindex) {
    var_e698df1ec0933ce4 = [];
    var_e698df1ec0933ce4["loadoutPrimary"] = scripts\mp\class::table_getweapon(table, classindex, 0);
    for (attachmentindex = 0; attachmentindex < scripts\mp\class::getmaxprimaryattachments(); attachmentindex++) {
        attachstring = scripts\mp\class::getattachmentloadoutstring(attachmentindex, #"primary");
        var_e698df1ec0933ce4[attachstring] = scripts\mp\class::table_getweaponattachment(table, classindex, 0, attachmentindex);
    }
    var_e698df1ec0933ce4["loadoutPrimaryCamo"] = scripts\mp\class::table_getweaponcamo(table, classindex, 0);
    var_e698df1ec0933ce4["loadoutPrimaryReticle"] = scripts\mp\class::table_getweaponreticle(table, classindex, 0);
    var_e698df1ec0933ce4["loadoutSecondary"] = scripts\mp\class::table_getweapon(table, classindex, 1);
    for (attachmentindex = 0; attachmentindex < scripts\mp\class::getmaxsecondaryattachments(); attachmentindex++) {
        attachstring = scripts\mp\class::getattachmentloadoutstring(attachmentindex, #"secondary");
        var_e698df1ec0933ce4[attachstring] = scripts\mp\class::table_getweaponattachment(table, classindex, 1, attachmentindex);
    }
    var_e698df1ec0933ce4["loadoutSecondaryCamo"] = scripts\mp\class::table_getweaponcamo(table, classindex, 1);
    var_e698df1ec0933ce4["loadoutSecondaryReticle"] = scripts\mp\class::table_getweaponreticle(table, classindex, 1);
    var_e698df1ec0933ce4["loadoutEquipmentPrimary"] = scripts\mp\class::table_getequipmentprimary(table, classindex);
    var_e698df1ec0933ce4["loadoutExtraEquipmentPrimary"] = scripts\mp\class::table_getextraequipmentprimary(table, classindex);
    var_e698df1ec0933ce4["loadoutEquipmentSecondary"] = scripts\mp\class::table_getequipmentsecondary(table, classindex);
    var_e698df1ec0933ce4["loadoutExtraEquipmentSecondary"] = scripts\mp\class::table_getextraequipmentsecondary(table, classindex);
    var_e698df1ec0933ce4["loadoutPerks"] = [];
    for (i = 0; i < 3; i++) {
        perk = scripts\mp\class::table_getperk(table, classindex, i);
        if (perk != "specialty_null") {
            var_e698df1ec0933ce4["loadoutPerks"][var_e698df1ec0933ce4["loadoutPerks"].size] = perk;
        }
    }
    var_e698df1ec0933ce4["loadoutGesture"] = "playerData";
    var_e698df1ec0933ce4["loadoutExecution"] = "playerData";
    return var_e698df1ec0933ce4;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x69f1
// Size: 0x7c
function arenaloadouts_select(loadouts, count) {
    classes = [];
    selectedloadouts = [];
    for (num = 0; num < count && loadouts.size > 0; num++) {
        selectedloadouts[selectedloadouts.size] = loadouts[randomint(loadouts.size)];
        var_acfe7336f59b3d76 = selectedloadouts[selectedloadouts.size - 1]["loadoutPrimary"];
        loadouts = arenaloadouts_removeclass(loadouts, var_acfe7336f59b3d76);
    }
    return selectedloadouts;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6a76
// Size: 0x9d
function arenaloadouts_removeclass(loadouts, var_acfe7336f59b3d76) {
    filtered = [];
    group = arenaloadouts_getweapongroup(var_acfe7336f59b3d76);
    foreach (loadout in loadouts) {
        currgroup = arenaloadouts_getweapongroup(loadout["loadoutPrimary"]);
        if (group != currgroup) {
            filtered[filtered.size] = loadout;
        }
    }
    return filtered;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6b1c
// Size: 0x40
function arenaloadouts_getweapongroup(rootweapon) {
    group = "none";
    if (rootweapon != "none") {
        group = scripts\mp\utility\weapon::getweapongroup(rootweapon);
        if (group == "weapon_dmr") {
            group = "weapon_sniper";
        }
    }
    return group;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b65
// Size: 0xc6
function function_e427e359bb108351() {
    level.weaponcategories = [];
    level.allweapons = [];
    for (row = 0; true; row++) {
        tablename = "mp/arenaGGWeapons_alt.csv";
        categoryname = tablelookupbyrow(tablename, row, 4);
        if (categoryname == "") {
            break;
        }
        if (!isdefined(level.weaponcategories[categoryname])) {
            level.weaponcategories[categoryname] = [];
        }
        data = [];
        data["weapon"] = tablelookupbyrow(tablename, row, 0);
        level.weaponcategories[categoryname][level.weaponcategories[categoryname].size] = data;
        level.allweapons[level.allweapons.size] = data;
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c33
// Size: 0x113
function function_fbc569a8b64fe92b(categoryname) {
    weaponlist = level.weaponcategories[categoryname];
    if (isdefined(weaponlist) && weaponlist.size > 0) {
        newweapon = "";
        data = undefined;
        for (loopcount = 0; true; loopcount++) {
            index = randomintrange(0, weaponlist.size);
            data = weaponlist[index];
            rootname = getweaponrootname(data["weapon"]);
            if (loopcount > weaponlist.size) {
                level.selectedweapons[rootname] = 1;
                newweapon = data["weapon"];
                for (i = 0; i < level.weaponcategories[categoryname].size; i++) {
                    if (level.weaponcategories[categoryname][i]["weapon"] == newweapon) {
                        break;
                    }
                }
                break;
            }
        }
        return newweapon;
    }
    assertmsg("Unknown weapon category name " + categoryname);
    return "none";
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d4e
// Size: 0xba
function initweaponmap() {
    level.baseraritymap = [];
    level.baseraritymap[level.arenaweapont1] = 0;
    level.baseraritymap[level.arenaweapont2] = 1;
    level.baseraritymap[level.arenaweapont3] = 2;
    level.baseraritymap[level.arenaweapont4] = 3;
    level.baseraritymap[level.arenaweapont5] = 4;
    level.baseraritymap[level.arenaweapont6] = 5;
    level.baseraritymap[level.arenaweapont7] = 6;
    level.baseraritymap[level.arenaweapont8] = 0;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e10
// Size: 0x1b1
function setupweapons() {
    locs = getstructarray("weapon_pickup", "targetname");
    assertex(locs.size > 0, "Arena loadouts set to 'none' but weapon pickup spawn locations are not placed in the level!");
    foreach (loc in locs) {
        if (loc.script_label == "1") {
            spawnweapon(loc, level.arenaweapont1);
            continue;
        }
        if (loc.script_label == "2") {
            spawnweapon(loc, level.arenaweapont2);
            continue;
        }
        if (loc.script_label == "3") {
            spawnweapon(loc, level.arenaweapont3);
            continue;
        }
        if (loc.script_label == "4") {
            spawnweapon(loc, level.arenaweapont4);
            continue;
        }
        if (loc.script_label == "5") {
            spawnweapon(loc, level.arenaweapont5);
            continue;
        }
        if (loc.script_label == "6") {
            spawnweapon(loc, level.arenaweapont6);
            continue;
        }
        if (loc.script_label == "7") {
            spawnweapon(loc, level.arenaweapont7);
            continue;
        }
        if (loc.script_label == "8") {
            spawnweapon(loc, level.arenaweapont8);
        }
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fc9
// Size: 0x11e
function getrandomspawnweapon() {
    weaponlist = level.allweapons;
    if (isdefined(weaponlist) && weaponlist.size > 0) {
        newweapon = "";
        data = undefined;
        for (loopcount = 0; true; loopcount++) {
            index = randomintrange(0, weaponlist.size);
            data = weaponlist[index];
            if (!issubstr(data["weapon"], "equip")) {
                rootname = getweaponrootname(data["weapon"]);
            } else {
                rootname = data["weapon"];
            }
            if (loopcount > weaponlist.size) {
                level.selectedweapons[rootname] = 1;
                newweapon = data["weapon"];
                for (i = 0; i < level.allweapons.size; i++) {
                    if (level.allweapons[i]["weapon"] == newweapon) {
                        break;
                    }
                }
                break;
            }
        }
        return newweapon;
    }
    assertmsg("Unknown weapon list");
    return "none";
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x70ef
// Size: 0x42e
function spawnweapon(loc, weapontier) {
    if (weapontier == "none") {
        return;
    }
    tracestart = loc.origin + (0, 0, 32);
    traceend = loc.origin + (0, 0, -32);
    trace = scripts\engine\trace::ray_trace(tracestart, traceend, undefined, scripts\engine\trace::create_default_contents(1));
    snappos = fixuppickuporigin(loc);
    if (trace["fraction"] < 1) {
        snappos = trace["position"] + (0, 0, 2);
    }
    equipmentmodel = getequipmentmodel(weapontier);
    if (equipmentmodel != "") {
        equipment = spawn("script_model", snappos);
        equipment setmodel(equipmentmodel);
        if (isdefined(loc.angles)) {
            if (weapontier == "equip_claymore" || weapontier == "equip_at_mine" || weapontier == "equip_trophy") {
                if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "wall") {
                    equipment.angles = (270, loc.angles[1], 90);
                } else {
                    equipment.angles = (0, loc.angles[1], 0);
                }
            } else if (weapontier == "equip_c4") {
                if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "wall") {
                    equipment.angles = (180, loc.angles[1], 180);
                } else {
                    equipment.angles = (0, loc.angles[1], 90);
                }
            } else {
                equipment.angles = (0, 90, 0);
                equipment.origin += (0, 0, 2);
            }
        } else {
            equipment.angles = (0, 0, 90);
        }
        userange = 128;
        equipmenthintstring = equipment getequipmenthintstring(weapontier);
        var_36e496cdbc979837 = equipment getequipmenthinticon(weapontier);
        equipment.equipment = weapontier;
        equipment makeusable();
        equipment sethinttag("tag_origin");
        equipment setcursorhint("HINT_BUTTON");
        equipment sethinticon(var_36e496cdbc979837);
        equipment setuseholdduration("duration_none");
        equipment setusehideprogressbar(1);
        equipment sethintstring(equipmenthintstring);
        equipment setusepriority(0);
        equipment sethintdisplayrange(userange);
        equipment sethintdisplayfov(120);
        equipment setuserange(userange);
        equipment setusefov(360);
        equipment sethintonobstruction("hide");
        equipment thread outlineequipmentwatchplayerprox(equipmentmodel, weapontier);
        equipment thread watchequipmentpickup();
        return;
    }
    rootname = undefined;
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapontier);
    attachments = [];
    userange = 128;
    objweapon = namespace_e0ee43ef2dddadaa::buildweapon(rootname, attachments, "none", "none", -1);
    weaponname = getcompleteweaponname(objweapon);
    weapon = spawn("weapon_" + weaponname, snappos, 17);
    weapon sethintdisplayrange(userange);
    weapon setuserange(userange);
    manageweaponstartingammo(weapon, weaponname);
    if (isdefined(loc.angles)) {
        weapon.angles = loc.angles;
    } else {
        weapon.angles = (0, 0, 90);
    }
    weapon thread outlinewatchplayerprox();
    weapon thread watchpickup();
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7525
// Size: 0xdb
function fixuppickuporigin(loc) {
    if (isdefined(loc.script_label) && loc.script_label == "3" && distance(loc.origin, (-488.2, -399.9, 54.25)) < 10) {
        loc.origin = (-488.2, -409.9, 54.25);
    } else if (isdefined(loc.script_label) && loc.script_label == "5" && distance(loc.origin, (657.3, 644.6, 56)) < 10) {
        loc.origin = (665.3, 644.6, 56);
    }
    return loc.origin;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7609
// Size: 0x134
function getequipmentmodel(weapon) {
    switch (weapon) {
    case #"hash_8c7819f0a3fbd1e0": 
        return "offhand_wm_grenade_mike67";
    case #"hash_f0907f858c134cb4": 
        return "offhand_wm_grenade_semtex";
    case #"hash_4320d77f90725183": 
        return "offhand_wm_c4";
    case #"hash_2354208d9af64220": 
        return "offhand_wm_claymore_held";
    case #"hash_3995658e01f4fac1": 
        return "offhand_wm_at_mine";
    case #"hash_9ba0a6ff6081954e": 
        return "weapon_wm_me_soscar_knife_offhand_thrown";
    case #"hash_142a787e36d7d7ce": 
        return "offhand_wm_molotov";
    case #"hash_de4641ddbc44a7ba": 
        return "offhand_wm_grenade_semtex";
    case #"hash_5a562592c930b7d6": 
        return "offhand_wm_grenade_flash";
    case #"hash_4f62b5fa00ecd075": 
        return "offhand_wm_grenade_snapshot_mp";
    case #"hash_fb6b649176cec75d": 
        return "offhand_wm_grenade_smoke";
    case #"hash_5fca4943a78ace9c": 
        return "offhand_wm_grenade_concussion";
    case #"hash_c848458cca24d656": 
        return "offhand_wm_trophy_system";
    case #"hash_15d06a7d7efafe8": 
        return "offhand_wm_grenade_decoy";
    case #"hash_25ac81b822cf0c9f": 
        return "offhand_wm_stim";
    default: 
        return "";
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7745
// Size: 0x206
function getequipmenthintstring(weapon) {
    switch (weapon) {
    case #"hash_8c7819f0a3fbd1e0": 
        self.equiptype = "primary";
        return %MP_INGAME_ONLY/PICKUP_FRAG;
    case #"hash_f0907f858c134cb4": 
        self.equiptype = "primary";
        return %MP_INGAME_ONLY/PICKUP_SEMTEX;
    case #"hash_4320d77f90725183": 
        self.equiptype = "primary";
        return %MP_INGAME_ONLY/PICKUP_C4;
    case #"hash_2354208d9af64220": 
        self.equiptype = "primary";
        return %MP_INGAME_ONLY/PICKUP_CLAYMORE;
    case #"hash_3995658e01f4fac1": 
        self.equiptype = "primary";
        return %MP_INGAME_ONLY/PICKUP_ATMINE;
    case #"hash_9ba0a6ff6081954e": 
        self.equiptype = "primary";
        return %MP_INGAME_ONLY/PICKUP_TKNIFE;
    case #"hash_142a787e36d7d7ce": 
        self.equiptype = "primary";
        return %MP_INGAME_ONLY/PICKUP_MOLOTOV;
    case #"hash_de4641ddbc44a7ba": 
        self.equiptype = "primary";
        return %MP_INGAME_ONLY/PICKUP_THERMITE;
    case #"hash_5a562592c930b7d6": 
        self.equiptype = "secondary";
        return %MP_INGAME_ONLY/PICKUP_FLASH;
    case #"hash_4f62b5fa00ecd075": 
        self.equiptype = "secondary";
        return %MP_INGAME_ONLY/PICKUP_SNAPSHOT;
    case #"hash_fb6b649176cec75d": 
        self.equiptype = "secondary";
        return %MP_INGAME_ONLY/PICKUP_SMOKE;
    case #"hash_5fca4943a78ace9c": 
        self.equiptype = "secondary";
        return %MP_INGAME_ONLY/PICKUP_STUN;
    case #"hash_c848458cca24d656": 
        self.equiptype = "secondary";
        return %MP_INGAME_ONLY/PICKUP_TROPHY_SYSTEM;
    case #"hash_15d06a7d7efafe8": 
        self.equiptype = "secondary";
        return %MP_INGAME_ONLY/PICKUP_DECOY;
    case #"hash_25ac81b822cf0c9f": 
        self.equiptype = "secondary";
        return %MP_INGAME_ONLY/PICKUP_STIM;
    default: 
        return "";
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7953
// Size: 0x31
function getequipmenthinticon(weapon) {
    table = "mp/arenaGGWeapons.csv";
    icon = tablelookup(table, 0, weapon, 3);
    return icon;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x798d
// Size: 0xa0
function manageweaponstartingammo(weapon, weaponname) {
    mag = weaponclipsize(weaponname);
    var_6f592a5fb739460 = 0;
    if (level.magcount != 3) {
        noammo = !level.magcount;
        if (noammo) {
            mag = 0;
            var_6f592a5fb739460 = 0;
        } else {
            var_6f592a5fb739460 = level.magcount - 1;
        }
        if (level.magcount == 7) {
            var_6f592a5fb739460 = weaponmaxammo(weaponname);
        } else {
            var_6f592a5fb739460 = mag * var_6f592a5fb739460;
        }
    } else {
        var_6f592a5fb739460 = mag * 2;
    }
    weapon itemweaponsetammo(mag, var_6f592a5fb739460);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a35
// Size: 0x13b
function watchequipmentpickup() {
    self endon("death");
    player, droppeditem = self waittill("trigger");
    hasmaxammo = 0;
    var_f23035e6f6b69f91 = checkissameequip(player);
    equipammo = checkpickupequiptypeammocount(player);
    var_8b9ab3abae98d973 = player scripts\mp\equipment::getequipmentmaxammo(self.equipment);
    var_b64209459da65860 = checkcurrentequiptypeammocount(player);
    if (var_f23035e6f6b69f91) {
        if (equipammo == var_8b9ab3abae98d973) {
            hasmaxammo = 1;
        }
    }
    if (var_f23035e6f6b69f91 && !hasmaxammo) {
        player scripts\mp\equipment::incrementequipmentammo(self.equipment, 1);
    } else if (var_b64209459da65860 && !var_f23035e6f6b69f91) {
        player dropoldequipinplace(player scripts\mp\equipment::getcurrentequipment(self.equiptype));
    }
    if (!var_f23035e6f6b69f91) {
        player scripts\mp\equipment::giveequipment(self.equipment, self.equiptype);
    }
    if (var_f23035e6f6b69f91 && hasmaxammo) {
        player iprintlnbold(%MP_INGAME_ONLY/EQUIPMENT_MAXED);
        thread watchequipmentpickup();
        return;
    }
    player playlocalsound("scavenger_pack_pickup");
    clearweaponoutlines();
    self makeunusable();
    self delete();
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b78
// Size: 0x1b
function checkpickupequiptypeammocount(player) {
    return player scripts\mp\equipment::getequipmentammo(self.equipment);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b9c
// Size: 0x39
function checkcurrentequiptypeammocount(player) {
    equipref = player scripts\mp\equipment::getcurrentequipment(self.equiptype);
    if (isdefined(equipref)) {
        return player scripts\mp\equipment::getequipmentammo(equipref);
    }
    return 0;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7bdd
// Size: 0x3c
function checkissameequip(player) {
    equipref = player scripts\mp\equipment::getcurrentequipment(self.equiptype);
    if (isdefined(equipref)) {
        return (self.equipment == equipref);
    }
    return 0;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7c21
// Size: 0x14
function dropoldequipinplace(equipment) {
    spawnweapon(self, equipment);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c3d
// Size: 0x45
function watchpickup() {
    self endon("death");
    player, droppeditem = self waittill("trigger");
    clearweaponoutlines();
    if (isdefined(droppeditem)) {
        droppeditem thread outlinewatchplayerprox();
        droppeditem thread watchpickup();
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c8a
// Size: 0x1f7
function setenemyloadoutomnvars() {
    enemyplayer = undefined;
    if (!isdefined(self.pers["team"])) {
        otherteam = "allies";
    } else {
        otherteam = getotherteam(self.pers["team"])[0];
    }
    foreach (player in level.players) {
        if (player.team == otherteam) {
            enemyplayer = player;
            break;
        }
    }
    if (!isdefined(enemyplayer)) {
        enemyplayer = self;
    }
    table = "mp/arenaGGWeapons.csv";
    self setclientomnvar("ui_arena_en_primary", -1);
    self setclientomnvar("ui_arena_en_secondary", -1);
    self setclientomnvar("ui_arena_en_lethal", -1);
    self setclientomnvar("ui_arena_en_tactical", -1);
    primary = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutPrimary"], 1));
    self setclientomnvar("ui_arena_en_primary", primary);
    secondary = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutSecondary"], 1));
    self setclientomnvar("ui_arena_en_secondary", secondary);
    lethal = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutEquipmentPrimary"], 1));
    self setclientomnvar("ui_arena_en_lethal", lethal);
    tactical = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutEquipmentSecondary"], 1));
    self setclientomnvar("ui_arena_en_tactical", tactical);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e89
// Size: 0x74
function getgungameloadoutindex(player) {
    playerloadoutindex = 0;
    if (game["roundsPlayed"] == 0) {
        playerloadoutindex = 0;
    } else if (isgungameloadouts()) {
        playerloadoutindex = game["roundsWon"][player.pers["team"]];
    } else {
        playerloadoutindex = game["roundsWon"][getotherteam(player.pers["team"])[0]];
    }
    return playerloadoutindex;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7f06
// Size: 0xb6
function getgungameloadoutomnvarindex(player, winningteam) {
    playerloadoutindex = 0;
    if (isgungameloadouts()) {
        playerloadoutindex = game["roundsWon"][player.pers["team"]];
        if (isdefined(winningteam) && winningteam == player.pers["team"]) {
            playerloadoutindex += 1;
        }
    } else {
        playerloadoutindex = game["roundsWon"][getotherteam(player.pers["team"])[0]];
        if (isdefined(winningteam) && winningteam == getotherteam(player.pers["team"])[0]) {
            playerloadoutindex += 1;
        }
    }
    return playerloadoutindex;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7fc5
// Size: 0x27e
function setenemyloadoutomnvarsatmatchend(winningteam) {
    foreach (player in level.players) {
        enemyplayer = undefined;
        if (!isdefined(player.pers["team"])) {
            otherteam = "allies";
        } else {
            otherteam = getotherteam(player.pers["team"])[0];
        }
        foreach (p in level.players) {
            if (p.team == otherteam) {
                enemyplayer = p;
                break;
            }
        }
        if (!isdefined(enemyplayer)) {
            enemyplayer = player;
        }
        enemyplayer.pers["gamemodeLoadout"] = game["arenaRandomLoadout"][getgungameloadoutomnvarindex(enemyplayer, winningteam)];
        table = "mp/arenaGGWeapons.csv";
        player setclientomnvar("ui_arena_en_primary", -1);
        player setclientomnvar("ui_arena_en_secondary", -1);
        player setclientomnvar("ui_arena_en_lethal", -1);
        player setclientomnvar("ui_arena_en_tactical", -1);
        primary = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutPrimary"], 1));
        player setclientomnvar("ui_arena_en_primary", primary);
        secondary = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutSecondary"], 1));
        player setclientomnvar("ui_arena_en_secondary", secondary);
        lethal = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutEquipmentPrimary"], 1));
        player setclientomnvar("ui_arena_en_lethal", lethal);
        tactical = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutEquipmentSecondary"], 1));
        player setclientomnvar("ui_arena_en_tactical", tactical);
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x824b
// Size: 0x22f
function spawngameendflagzone() {
    arenaflag = getentarray("flag_arena", "targetname");
    if (!isdefined(arenaflag[0])) {
        assertmsg("^1No Arena Flag found in level!");
        return;
    }
    level.arenaflag = arenaflag[0];
    trigger = arenaflag[0];
    if (isdefined(trigger.target)) {
        visuals[0] = getent(trigger.target, "targetname");
    } else {
        visuals[0] = spawn("script_model", trigger.origin);
        visuals[0].angles = trigger.angles;
    }
    trigger.objectivekey = "_a";
    trigger.iconname = "_a";
    arenaflag = scripts\mp\gametypes\obj_dom::setupobjective(trigger, "neutral", undefined, 1);
    arenaflag.onuse = &arenaflag_onuse;
    arenaflag.onbeginuse = &arenaflag_onusebegin;
    arenaflag.onenduse = &arenaflag_onuseend;
    arenaflag.onuseupdate = &arenaflag_onuseupdate;
    arenaflag.oncontested = &arenaflag_oncontested;
    arenaflag.isarena = 1;
    arenaflag scripts\mp\gameobjects::pinobjiconontriggertouch();
    arenaflag.id = "domFlag";
    arenaflag.scriptable delete();
    arenaflag scripts\mp\gameobjects::setcapturebehavior("persistent");
    arenaflag.ignorestomp = 1;
    level.objectives[arenaflag.objectivekey] = arenaflag;
    level.arenaflag = arenaflag;
    waitframe();
    level.arenaflag scripts\mp\gameobjects::requestid(1, 1, undefined, 0, 0);
    level.arenaflag.visibleteam = "any";
    level.arenaflag scripts\mp\gameobjects::setobjectivestatusicons("icon_waypoint_ot");
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level.arenaflag thread scripts\mp\gametypes\arena::deleteotpreview();
        level thread scripts\mp\gametypes\arena::showflagoutline();
        return;
    }
    level.arenaflag scripts\mp\gametypes\arena::disableotflag();
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8482
// Size: 0x72
function showflagoutline() {
    waitframe();
    if (isdefined(level.arenaflag) && isdefined(level.arenaflag.flagmodel)) {
        level.arenaflag.flagmodel.outlinedid = outlineenableforall(level.arenaflag.flagmodel, "outline_nodepth_orange", "level_script");
    }
    level thread removeflagoutlineongameend();
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84fc
// Size: 0x129
function arenaflag_onusebegin(player) {
    player.iscapturing = 1;
    level.canprocessot = 0;
    ownerteam = scripts\mp\gameobjects::getownerteam();
    if (ownerteam == "neutral") {
        player setclientomnvar("ui_objective_pinned_text_param", 1);
    }
    self.neutralizing = istrue(level.flagneutralization) && ownerteam != "neutral";
    if (!istrue(self.neutralized)) {
        self.didstatusnotify = 0;
    }
    usetime = ter_op(istrue(level.flagneutralization), level.flagcapturetime * 0.5, level.flagcapturetime);
    scripts\mp\gameobjects::setusetime(usetime);
    if (istrue(level.capturedecay)) {
        thread scripts\mp\gameobjects::useobjectdecay(player.team);
    }
    if (usetime > 0) {
        self.prevownerteam = getotherteam(player.team)[0];
        scripts\mp\gametypes\obj_dom::updateflagcapturestate(player.team);
        scripts\mp\gameobjects::setobjectivestatusicons(level.icontaking, level.iconlosing);
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x862d
// Size: 0xfc
function arenaflag_onuseupdate(team, progress, change, capplayer) {
    ownerteam = scripts\mp\gameobjects::getownerteam();
    if (progress > 0.05 && change && !self.didstatusnotify) {
        if (ownerteam == "neutral") {
            if (level.flagcapturetime > 0.05) {
                scripts\mp\utility\dialog::statusdialog("securing" + self.objectivekey, team);
                otherteam = getotherteam(team)[0];
                scripts\mp\utility\dialog::statusdialog("losing" + self.objectivekey, otherteam);
            }
        } else if (level.flagcapturetime > 0.05) {
            scripts\mp\utility\dialog::statusdialog("losing" + self.objectivekey, ownerteam);
            scripts\mp\utility\dialog::statusdialog("securing" + self.objectivekey, team);
        }
        self.didstatusnotify = 1;
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8731
// Size: 0xd5
function arenaflag_onuseend(team, player, success) {
    level.canprocessot = 1;
    self.didstatusnotify = 0;
    if (success) {
        scripts\mp\objidpoolmanager::objective_show_progress(self.objidnum, 0);
    }
    if (isplayer(player)) {
        player.iscapturing = 0;
        player setclientomnvar("ui_objective_pinned_text_param", 0);
    }
    ownerteam = scripts\mp\gameobjects::getownerteam();
    if (ownerteam == "neutral") {
        scripts\mp\gameobjects::setobjectivestatusicons(level.iconneutral);
        thread scripts\mp\gametypes\obj_dom::updateflagstate("idle", 0);
    } else {
        scripts\mp\gameobjects::setobjectivestatusicons(level.icondefend, level.iconcapture);
        thread scripts\mp\gametypes\obj_dom::updateflagstate(ownerteam, 0);
    }
    if (!success) {
        self.neutralized = 0;
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x880e
// Size: 0x14c
function arenaflag_onuse(credit_player) {
    level.canprocessot = 1;
    team = credit_player.team;
    oldteam = scripts\mp\gameobjects::getownerteam();
    otherteam = getotherteam(team)[0];
    self.capturetime = gettime();
    self.neutralized = 0;
    scripts\mp\utility\dialog::statusdialog("lost" + self.objectivekey, otherteam);
    scripts\mp\utility\dialog::statusdialog("secured" + self.objectivekey, team);
    thread printandsoundoneveryone(team, otherteam, undefined, undefined, "mp_dom_flag_captured", "mp_dom_flag_lost", credit_player);
    scripts\mp\gametypes\obj_dom::dompoint_setcaptured(team, credit_player);
    if (!self.neutralized) {
        if (isdefined(level.onobjectivecomplete)) {
            [[ level.onobjectivecomplete ]]("dompoint", self.objectivekey, credit_player, team, oldteam, self);
        }
        self.firstcapture = 0;
    }
    game["dialog"]["round_success"] = "gamestate_win_capture";
    game["dialog"]["round_failure"] = "gamestate_lost_capture";
    level thread arena_endgame(credit_player.team, game["end_reason"]["arena_otflag_completed"], game["end_reason"]["arena_otflag_failed"]);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8962
// Size: 0x3a
function arenaflag_oncontested() {
    scripts\mp\gameobjects::setobjectivestatusicons(level.iconcontested);
    scripts\mp\objidpoolmanager::objective_set_progress_team(self.objidnum, undefined);
    thread scripts\mp\gametypes\obj_dom::updateflagstate("contested", 0);
    level thread forcegameendcontesttimeout();
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x89a4
// Size: 0x73
function forcegameendcontesttimeout() {
    level notify("start_overtime_timeout");
    level endon("start_overtime_timeout");
    level endon("game_ended");
    if (!isdefined(level.ottimecontested)) {
        level.ottimecontested = 0;
    }
    while (level.ottimecontested < 5000) {
        wait level.framedurationseconds;
        level.ottimecontested += level.frameduration;
    }
    level.canprocessot = 1;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a1f
// Size: 0x40
function disableotflag() {
    scripts\mp\gameobjects::allowuse("none");
    scripts\mp\gameobjects::disableobject();
    if (isdefined(self.scriptable)) {
        self.scriptable delete();
    }
    self.flagmodel hide();
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a67
// Size: 0x70
function removeflagoutlineongameend() {
    level waittill("game_ended");
    if (isdefined(level.arenaflag) && isdefined(level.arenaflag.flagmodel.outlinedid)) {
        outlinedisable(level.arenaflag.flagmodel.outlinedid, level.arenaflag.flagmodel);
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8adf
// Size: 0x1b
function deleteotpreview() {
    level waittill_any_2("prematch_done", "start_mode_setup");
    disableotflag();
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b02
// Size: 0xba
function setupendzones() {
    level.attackerendzone = getentarray("flag_goal_attacker", "targetname");
    level.defenderendzone = getentarray("flag_goal_defender", "targetname");
    level.attackerendzone = level.attackerendzone[0] createendzone(game["attackers"]);
    level.defenderendzone = level.defenderendzone[0] createendzone(game["defenders"]);
    level.objectives = [];
    level.objectives[level.objectives.size] = level.attackerendzone;
    level.objectives[level.objectives.size] = level.defenderendzone;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8bc4
// Size: 0x4b9
function createendzone(team) {
    if (isdefined(self.target)) {
        visuals[0] = getent(self.target, "targetname");
    } else {
        visuals[0] = spawn("script_model", self.origin);
        visuals[0].angles = self.angles;
    }
    level.flagcapturetime = dvarfloatvalue("flagCaptureTime", 10, 0, 30);
    if (isdefined(self.objectivekey)) {
        objectivekey = self.objectivekey;
    } else {
        objectivekey = self.script_label;
    }
    if (isdefined(self.iconname)) {
        iconname = self.iconname;
    } else {
        iconname = self.script_label;
    }
    endzone = scripts\mp\gameobjects::createuseobject(team, self, visuals, (0, 0, 100));
    endzone.team = team;
    endzone.ownerteam = team;
    endzone scripts\mp\gameobjects::setobjectivestatusicons(level.icondefendendzone, level.iconcaptureendzone);
    endzone scripts\mp\gameobjects::allowuse("enemy");
    endzone scripts\mp\gameobjects::cancontestclaim(1);
    endzone scripts\mp\gameobjects::setusetime(level.flagcapturetime);
    endzone.onuse = &endzone_onuse;
    endzone.onbeginuse = &endzone_onusebegin;
    endzone.onenduse = &endzone_onuseend;
    endzone.oncontested = &endzone_oncontested;
    endzone.onuncontested = &endzone_onuncontested;
    endzone.isarena = 1;
    endzone scripts\mp\gameobjects::pinobjiconontriggertouch();
    endzone.id = "domFlag";
    if (isdefined(level.capturetype)) {
        endzone scripts\mp\gameobjects::setcapturebehavior(getcapturetype());
    }
    endzone.objectivekey = objectivekey;
    endzone.iconname = iconname;
    endzone scripts\mp\gameobjects::setvisibleteam("any");
    endzone.stompprogressreward = &endzone_stompprogressreward;
    endzone.nousebar = 1;
    endzone.claimgracetime = level.flagcapturetime * 1000;
    tracestart = visuals[0].origin + (0, 0, 32);
    traceend = visuals[0].origin + (0, 0, -32);
    contentoverride = scripts\engine\trace::create_contents(1, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    trace = scripts\engine\trace::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    endzone.baseeffectpos = trace["position"];
    upangles = vectortoangles(trace["normal"]);
    endzone.baseeffectforward = anglestoforward(upangles);
    scriptable = spawn("script_model", endzone.baseeffectpos);
    scriptable setmodel("dom_flag_scriptable");
    scriptable.angles = generateaxisanglesfromforwardvector(endzone.baseeffectforward, scriptable.angles);
    endzone.scriptable = scriptable;
    endzone.vfxnamemod = "";
    if (isdefined(endzone.trigger.radius)) {
        if (endzone.trigger.radius == 160) {
            endzone.vfxnamemod = "_160";
        } else if (endzone.trigger.radius == 90) {
            endzone.vfxnamemod = "_90";
        } else if (endzone.trigger.radius == 315) {
            endzone.vfxnamemod = "_300";
        } else if (endzone.trigger.radius != 120) {
            endzone.noscriptable = 1;
        }
    }
    endzone.flagmodel = spawn("script_model", endzone.baseeffectpos);
    endzone.flagmodel setmodel("military_dom_flag_neutral");
    endzone.outlineent = endzone.flagmodel;
    return endzone;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9086
// Size: 0x129
function endzone_onusebegin(player) {
    player.iscapturing = 1;
    level.canprocessot = 0;
    ownerteam = scripts\mp\gameobjects::getownerteam();
    if (ownerteam == "neutral") {
        player setclientomnvar("ui_objective_pinned_text_param", 1);
    }
    self.neutralizing = istrue(level.flagneutralization) && ownerteam != "neutral";
    if (!istrue(self.neutralized)) {
        self.didstatusnotify = 0;
    }
    usetime = ter_op(istrue(level.flagneutralization), level.flagcapturetime * 0.5, level.flagcapturetime);
    scripts\mp\gameobjects::setusetime(usetime);
    if (istrue(level.capturedecay)) {
        thread scripts\mp\gameobjects::useobjectdecay(player.team);
    }
    if (usetime > 0) {
        self.prevownerteam = getotherteam(player.team)[0];
        scripts\mp\gametypes\obj_dom::updateflagcapturestate(player.team);
        scripts\mp\gameobjects::setobjectivestatusicons(level.icontakingendzone, level.iconlosingendzone);
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x91b7
// Size: 0x96
function endzone_onuseend(team, player, success) {
    level.canprocessot = 1;
    if (success) {
        scripts\mp\objidpoolmanager::objective_show_progress(self.objidnum, 0);
    }
    if (isplayer(player)) {
        player.iscapturing = 0;
        player setclientomnvar("ui_objective_pinned_text_param", 0);
    }
    ownerteam = scripts\mp\gameobjects::getownerteam();
    scripts\mp\gameobjects::setobjectivestatusicons(level.icondefendendzone, level.iconcaptureendzone);
    if (!success) {
        self.neutralized = 0;
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9255
// Size: 0xe5
function endzone_onuse(credit_player) {
    level.canprocessot = 1;
    team = credit_player.team;
    oldteam = scripts\mp\gameobjects::getownerteam();
    otherteam = getotherteam(team)[0];
    self.capturetime = gettime();
    self.neutralized = 0;
    thread printandsoundoneveryone(team, otherteam, undefined, undefined, "mp_dom_flag_captured", "mp_dom_flag_lost", credit_player);
    endzone_setcaptured(team, credit_player);
    if (!self.neutralized) {
        if (isdefined(level.onobjectivecomplete)) {
            [[ level.onobjectivecomplete ]]("dompoint", self.objectivekey, credit_player, team, oldteam, self);
        }
    }
    level thread arena_endgame(credit_player.team, game["end_reason"]["objective_completed"], undefined, 0, 2);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9342
// Size: 0x23
function endzone_oncontested() {
    scripts\mp\gameobjects::setobjectivestatusicons(level.iconcontestendzone);
    scripts\mp\objidpoolmanager::objective_set_progress_team(self.objidnum, undefined);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x936d
// Size: 0x40
function endzone_onuncontested(lastclaimteam) {
    ownerteam = scripts\mp\gameobjects::getownerteam();
    scripts\mp\gameobjects::setobjectivestatusicons(level.icondefendendzone, level.iconcaptureendzone);
    self.processot = 1;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x93b5
// Size: 0x12f
function endzone_setcaptured(team, credit_player) {
    scripts\mp\gameobjects::setownerteam(team);
    self notify("capture", credit_player);
    self notify("assault", credit_player);
    scripts\mp\gameobjects::setobjectivestatusicons(level.icondefendendzone, level.iconcaptureendzone);
    self.neutralized = 0;
    if (self.touchlist[team].size == 0) {
        self.touchlist = self.oldtouchlist;
    }
    thread giveflagcapturexp(self.touchlist[team], credit_player);
    if (isdefined(level.matchrecording_logevent)) {
        [[ level.matchrecording_logevent ]](self.logid, undefined, self.logeventflag, self.visuals[0].origin[0], self.visuals[0].origin[1], gettime(), ter_op(team == "allies", 1, 2));
    }
    scripts\mp\analyticslog::logevent_gameobject(self.analyticslogtype, self.analyticslogid, self.visuals[0].origin, -1, "captured_" + team);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x94ec
// Size: 0x1d
function endzone_stompprogressreward(player) {
    player thread scripts\mp\utility\points::doScoreEvent(#"hash_2d96ced878338cd2");
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9511
// Size: 0x42
function getcapturetype() {
    capturetype = "normal";
    if (level.capturetype == 2) {
        capturetype = "neutralize";
    } else if (level.capturetype == 3) {
        capturetype = "persistent";
    }
    return capturetype;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x955c
// Size: 0x171
function giveflagcapturexp(touchlist, credit_player) {
    level endon("game_ended");
    first_player = credit_player;
    if (isdefined(first_player.owner)) {
        first_player = first_player.owner;
    }
    level.lastcaptime = gettime();
    if (isplayer(first_player)) {
        level thread teamplayercardsplash("callout_securedposition", first_player);
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = first_player;
        var_7e2c53b0bcf117d9.eventname = "capture";
        var_7e2c53b0bcf117d9.position = first_player.origin;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
    }
    players_touching = getarraykeys(touchlist);
    for (index = 0; index < players_touching.size; index++) {
        player = touchlist[players_touching[index]].player;
        if (isdefined(player.owner)) {
            player = player.owner;
        }
        if (!isplayer(player)) {
            continue;
        }
        player incpersstat("captures", 1);
        player scripts\mp\persistence::statsetchild("round", "captures", player.pers["captures"]);
        player thread scripts\mp\utility\points::doScoreEvent(#"hash_5a7b15a24e10a93b");
        wait 0.05;
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x96d5
// Size: 0x1ac
function startotmechanics() {
    if (level.objmodifier == 1) {
        foreach (objective in level.objectives) {
            objective deleteendzone();
        }
    }
    level.canprocessot = 1;
    if (!isdefined(level.arenaflag.objidnum)) {
        level.arenaflag scripts\mp\gameobjects::requestid(1, 1, undefined, 0, 0);
    }
    level.arenaflag scripts\mp\gameobjects::setobjectivestatusicons(level.iconneutral);
    level.arenaflag scripts\mp\gameobjects::enableobject();
    level.arenaflag scripts\mp\gameobjects::allowuse("enemy");
    level.arenaflag.flagmodel show();
    if (level.spawnflag) {
        game["dialog"]["overtime"] = "gamestate_overtime_flagspawn";
    }
    foreach (player in level.players) {
        if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
            continue;
        }
        player scripts\mp\utility\dialog::leaderdialogonplayer("overtime");
    }
    level.arenaflag.flagmodel playsound("flag_spawned");
    level thread showflagoutline();
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9889
// Size: 0x6c
function deleteendzone() {
    scripts\mp\gameobjects::allowuse("none");
    scripts\mp\gameobjects::setvisibleteam("none");
    scripts\mp\gameobjects::releaseid();
    self.trigger = undefined;
    self notify("deleted");
    self.visibleteam = "none";
    if (isdefined(self.scriptable)) {
        self.scriptable delete();
    }
    self.flagmodel delete();
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x98fd
// Size: 0xb
function dogtagallyonusecb(player) {
    
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9910
// Size: 0x2a
function dogtagenemyonusecb(player) {
    player.health = player.maxhealth;
    player notify("healed");
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9942
// Size: 0x172
function outlineenemyplayers() {
    level endon("prematch_done");
    level endon("removeArenaOutlines");
    while (true) {
        level waittill("spawned_player");
        waitframe();
        foreach (player in level.players) {
            entnum = player getentitynumber();
            if (!isdefined(player.outlinedenemies)) {
                if (!isdefined(level.activeoutlines)) {
                    level.activeoutlines = 1;
                } else {
                    level.activeoutlines++;
                }
            }
            foreach (p in level.players) {
                if (p != player && p.team != player.team) {
                    if (isdefined(player.outlinedenemies)) {
                        outlinedisable(player.outlinedenemies, player);
                    }
                    player.outlinedenemies = outlineenableforteam(player, p.team, "outline_nodepth_orange", "level_script");
                    break;
                }
            }
        }
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9abc
// Size: 0x172
function outlineenemyplayerslaunchchunk() {
    level endon("game_ended");
    level endon("removeArenaOutlines");
    while (true) {
        level waittill("spawned_player");
        waitframe();
        foreach (player in level.players) {
            entnum = player getentitynumber();
            if (!isdefined(player.outlinedenemies)) {
                if (!isdefined(level.activeoutlines)) {
                    level.activeoutlines = 1;
                } else {
                    level.activeoutlines++;
                }
            }
            foreach (p in level.players) {
                if (p != player && p.team != player.team) {
                    if (isdefined(player.outlinedenemies)) {
                        outlinedisable(player.outlinedenemies, player);
                    }
                    player.outlinedenemies = outlineenableforteam(player, p.team, "outline_nodepth_orange", "level_script");
                    break;
                }
            }
        }
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c36
// Size: 0xb1
function removeenemyoutlines() {
    thread notifyremoveoutlines();
    level waittill_any_2("prematch_done", "removeArenaOutlines");
    foreach (player in level.players) {
        entnum = player getentitynumber();
        if (isdefined(player.outlinedenemies)) {
            level.activeoutlines--;
            outlinedisable(player.outlinedenemies, player);
            player.outlinedenemies = undefined;
        }
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9cef
// Size: 0x6a
function notifyremoveoutlines() {
    level endon("prematch_done");
    level waittill("match_start_real_countdown");
    if (level.prematchperiodend > 5) {
        time = int(max(level.prematchperiodend - 5, 5));
    } else {
        time = int(max(level.prematchperiodend - 2, 2));
    }
    wait time;
    level notify("removeArenaOutlines");
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9d61
// Size: 0x181
function outlineequipmentwatchplayerprox(equipmentmodel, equipname) {
    self endon("death");
    self endon("trigger");
    self.outlinedplayers = [];
    basescore = level.baseraritymap[equipname];
    var_4430b08d5a2d47bf = getoutlineasset(basescore);
    while (true) {
        foreach (player in level.players) {
            if (isdefined(player.hasarenaspawned)) {
                dist = distance2dsquared(self.origin, player.origin);
                entnum = player getentitynumber();
                if (dist < 490000) {
                    if (!isdefined(self.outlinedplayers[entnum])) {
                        if (!isdefined(level.activeoutlines)) {
                            level.activeoutlines = 1;
                        } else {
                            level.activeoutlines++;
                        }
                        self.outlinedplayers[entnum] = outlineenableforplayer(self, player, var_4430b08d5a2d47bf, "level_script");
                    }
                    continue;
                }
                if (isdefined(self.outlinedplayers[entnum])) {
                    level.activeoutlines--;
                    outlinedisable(self.outlinedplayers[entnum], self);
                    self.outlinedplayers[entnum] = undefined;
                }
            }
        }
        waitframe();
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9eea
// Size: 0x19a
function outlinewatchplayerprox() {
    self endon("death");
    self endon("trigger");
    self.outlinedplayers = [];
    weapname = scripts\mp\weapons::getitemweaponname();
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapname);
    basescore = level.baseraritymap[rootname + "_mp"];
    var_4430b08d5a2d47bf = getoutlineasset(basescore);
    while (true) {
        foreach (player in level.players) {
            if (isdefined(player.hasarenaspawned)) {
                dist = distance2dsquared(self.origin, player.origin);
                entnum = player getentitynumber();
                if (dist < 490000) {
                    if (!isdefined(self.outlinedplayers[entnum])) {
                        if (!isdefined(level.activeoutlines)) {
                            level.activeoutlines = 1;
                        } else {
                            level.activeoutlines++;
                        }
                        self.outlinedplayers[entnum] = outlineenableforplayer(self, player, var_4430b08d5a2d47bf, "level_script");
                    }
                    continue;
                }
                if (isdefined(self.outlinedplayers[entnum])) {
                    level.activeoutlines--;
                    outlinedisable(self.outlinedplayers[entnum], self);
                    self.outlinedplayers[entnum] = undefined;
                }
            }
        }
        waitframe();
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa08c
// Size: 0x10b
function getoutlineasset(basescore) {
    if (!isdefined(basescore)) {
        basescore = 0;
    }
    var_4430b08d5a2d47bf = "white";
    score = int(min(basescore, 8));
    switch (score) {
    case 0: 
        var_4430b08d5a2d47bf = "outline_depth_white";
        break;
    case 1: 
        var_4430b08d5a2d47bf = "outline_depth_green";
        break;
    case 2: 
        var_4430b08d5a2d47bf = "outline_depth_cyan";
        break;
    case 3: 
        var_4430b08d5a2d47bf = "outline_depth_red";
        break;
    case 4: 
        var_4430b08d5a2d47bf = "outline_depth_orange";
        break;
    case 5: 
        var_4430b08d5a2d47bf = "outline_depth_yellow";
        break;
    case 6: 
        var_4430b08d5a2d47bf = "outline_depth_blue";
        break;
    case 7: 
        var_4430b08d5a2d47bf = "outline_depth_green";
        break;
    case 8: 
        var_4430b08d5a2d47bf = "outline_depth_red";
        break;
    }
    return var_4430b08d5a2d47bf;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1a0
// Size: 0x65
function clearweaponoutlines() {
    foreach (value in self.outlinedplayers) {
        level.activeoutlines--;
        outlinedisable(value, self);
        value = undefined;
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa20d
// Size: 0x245
function selflookatfriendly() {
    level endon("prematch_ended");
    teammate = undefined;
    startlook = 0;
    while (isdefined(level.matchcountdowntime) && level.matchcountdowntime > 5) {
        alive = getfriendlyplayers(self.team, 1);
        if (alive.size > 1) {
            startlook = 1;
            break;
        }
        waitframe();
    }
    if (startlook) {
        var_5bcf8dfeafe8ace2 = self.angles;
        count = 0;
        teammates = getteamdata(self.team, "players");
        foreach (t in teammates) {
            if (t != self) {
                teammate = t;
            }
        }
        teammatedir = teammate.origin - self.origin;
        selfdir = self.origin - teammate.origin;
        var_bbea66c71351983f = anglestoright(self.angles);
        selfdot = vectordot(var_bbea66c71351983f, teammatedir);
        lookleft = 0;
        lookright = 0;
        if (selfdot < 0) {
            var_dd4bad131228ea4 = 85;
            lookleft = 1;
        } else {
            var_dd4bad131228ea4 = -90;
            lookright = 1;
        }
        if (isdefined(teammate)) {
            if (lookleft) {
                if (!isbot(self)) {
                    wait 0.5;
                    if (self.currentweapon.basename != "none") {
                        self forceplaygestureviewmodel("ges_crush_turnleft");
                    }
                }
            } else if (!isbot(self)) {
                wait 0.5;
                if (self.currentweapon.basename != "none") {
                    self forceplaygestureviewmodel("ges_crush_turnright");
                }
            }
            wait 3;
            _freezecontrols(0);
        } else {
            _freezecontrols(0);
        }
        return;
    }
    _freezecontrols(0);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa45a
// Size: 0x15
function updatematchstatushintonspawn() {
    level endon("game_ended");
    scripts\mp\hud_message::function_f004ef4606b9efdc("kill");
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa477
// Size: 0x9c
function seticonnames() {
    level.iconcaptureendzone = "waypoint_capture_endzone";
    level.icondefendendzone = "waypoint_defend_endzone";
    level.iconcontestendzone = "waypoint_contesting_endzone";
    level.icontakingendzone = "waypoint_taking_endzone";
    level.iconlosingendzone = "waypoint_losing_endzone";
    level.iconneutral = "waypoint_captureneutral";
    level.iconcapture = "waypoint_capture";
    level.icondefend = "waypoint_defend";
    level.iconcontested = "waypoint_contested";
    level.icontaking = "waypoint_taking";
    level.iconlosing = "waypoint_losing";
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa51b
// Size: 0x24b
function setupwaypointicons() {
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_taking_endzone", 0, "contest", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_flag", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_losing_endzone", 0, "contest", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_flag", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_contesting_endzone", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_flag", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_capture_endzone", 0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_flag", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_defend_endzone", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_flag", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("icon_waypoint_dom_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_overtime", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_taking_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_overtime", 1);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_capture_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_overtime", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_defend_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_overtime", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_defending_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_overtime", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_blocking_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_overtime", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_blocked_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_overtime", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_losing_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_overtime", 1);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_captureneutral_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_overtime", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_contested_a", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_overtime", 1);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_dom_target_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_overtime", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("icon_waypoint_target_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_overtime", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("icon_waypoint_ot_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_OTFLAGLOC_CAPS", "icon_waypoint_overtime", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_dogtags", 1, "enemy", "", "hud_icon_minimap_misc_dog_tag", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_dogtags_friendly", 1, "friendly", "", "hud_icon_minimap_misc_dog_tag", 0);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa76e
// Size: 0xe
function israndomloadouts() {
    return level.arenaloadouts == 2;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa785
// Size: 0xe
function ispickuploadouts() {
    return level.arenaloadouts == 3;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa79c
// Size: 0xe
function isgungameloadouts() {
    return level.arenaloadouts == 4;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa7b3
// Size: 0xe
function isrvsgungameloadouts() {
    return level.arenaloadouts == 5;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa7ca
// Size: 0xe
function israndompreviewloadouts() {
    return level.arenaloadouts == 6;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa7e1
// Size: 0xe
function israndomalphaoneloadouts() {
    return level.arenaloadouts == 7;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa7f8
// Size: 0xe
function israndomalphatwoloadouts() {
    return level.arenaloadouts == 8;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa80f
// Size: 0xe
function israndomalphathreeloadouts() {
    return level.arenaloadouts == 9;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa826
// Size: 0xe
function israndomalphafourloadouts() {
    return level.arenaloadouts == 10;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa83d
// Size: 0xe
function israndomalphafiveloadouts() {
    return level.arenaloadouts == 11;
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa854
// Size: 0x60
function israndomalphaloadouts() {
    switch (level.arenaloadouts) {
    case 7:
    case 8:
    case 9:
    case 10:
    case 11: 
        return 1;
    default: 
        return 0;
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa8bc
// Size: 0x37
function dogtagallyonusecbconf(player) {
    if (isplayer(player)) {
        player scripts\mp\gamescore::giveteamscoreforobjective(player.pers["team"], level.scoredeny, 0);
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa8fb
// Size: 0x49
function dogtagenemyonusecbconf(player) {
    if (isplayer(player)) {
        player scripts\mp\utility\dialog::leaderdialogonplayer("kill_confirmed", undefined, undefined, undefined, 4);
    }
    player scripts\mp\gamescore::giveteamscoreforobjective(player.pers["team"], level.scoreconfirm, 0);
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa94c
// Size: 0x13f
function botpickuphack() {
    level endon("game_ended");
    wait 1;
    scripts\mp\flags::gameflagwait("prematch_done");
    wait 1;
    while (true) {
        foreach (player in level.players) {
            if (isbot(player)) {
                rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(level.arenaweapont1);
                attachments = [];
                newweaponobj = namespace_e0ee43ef2dddadaa::buildweapon(rootname, attachments, "none", "none", -1);
                newweapon = getcompleteweaponname(newweaponobj);
                player _giveweapon(newweapon);
                player _switchtoweapon(newweaponobj);
            }
        }
        break;
    }
    foreach (player in level.players) {
        if (isbot(player)) {
            player thread fakepickups();
        }
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa93
// Size: 0xea
function fakepickups() {
    while (true) {
        wait 1;
        if (self.currentprimaryweapon.basename != "iw8_pi_decho_mp" && self.currentprimaryweapon.basename != "iw8_pi_mike1911_mp" && self.currentprimaryweapon.basename != "iw9_me_fists_mp" && self.currentprimaryweapon.basename != "none") {
            wait 3;
        }
        if (!self attackbuttonpressed() && !self isreloading() && !self usebuttonpressed()) {
            self botpressbutton("use", 0.5);
            continue;
        }
        wait 0.5;
        if (!self attackbuttonpressed() && !self isreloading() && !self usebuttonpressed()) {
            self botpressbutton("use", 0.5);
        }
    }
}

// Namespace arena_alt / scripts\mp\gametypes\arena_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab85
// Size: 0xbf
function bootcampmodewatcher() {
    level endon("game_ended");
    while (true) {
        modevalue = getdvarint(@"hash_52b2904136c93f2b");
        if (modevalue != -1) {
            timelimit = 3;
            level.starttime = gettime();
            gamemode = hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_timelimit");
            level.watchdvars[gamemode].value = timelimit;
            level.overridewatchdvars[gamemode] = timelimit;
            /#
                setdevdvar(gamemode, timelimit);
            #/
            game["bootCampOverride"] = modevalue;
            /#
                setdevdvar(@"hash_52b2904136c93f2b", -1);
            #/
        }
        wait 1;
    }
}

