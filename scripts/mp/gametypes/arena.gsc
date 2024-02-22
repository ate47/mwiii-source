// mwiii decomp prototype
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
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\arena_alt.gsc;
#using scripts\mp\class.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\arena.gsc;
#using script_3bdadfff7554ceba;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using script_76cc264b397db9cb;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\cp_mp\pet_watch.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\rank.gsc;
#using script_4a6760982b403bad;
#using script_548072087c9fd504;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\weapons.gsc;

#namespace arena;

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36a4
// Size: 0x75b
function main() {
    game["isLaunchChunk"] = getdvarint(@"hash_61939eb22f175afa", 0) != 0;
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    level.var_b5538188c80d8af6 = [];
    var_58553518a66cebe9 = getentarray("cyber_emp_pickup_trig", "targetname");
    foreach (trig in var_58553518a66cebe9) {
        level.var_b5538188c80d8af6[level.var_b5538188c80d8af6.size] = trig.origin;
    }
    level.var_ce291b847f8e2ab7 = (0, 0, 0);
    primaryflags = getentarray("flag_primary", "targetname");
    foreach (flag in primaryflags) {
        if (flag.script_label == "_b") {
            level.var_ce291b847f8e2ab7 = flag.origin;
            break;
        }
    }
    if (level.var_b5538188c80d8af6.size == 0) {
        level.var_b5538188c80d8af6[level.var_b5538188c80d8af6.size] = level.var_ce291b847f8e2ab7;
    }
    allowed[0] = getgametype();
    allowed[1] = "dom";
    namespace_19b4203b51d56488::main(allowed);
    if (game["isLaunchChunk"]) {
        namespace_d4479a4019bdeab1::main();
        return;
    }
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 24);
        registertimelimitdvar(getgametype(), 30);
        registerscorelimitdvar(getgametype(), 75);
        registerroundlimitdvar(getgametype(), 19);
        registerwinlimitdvar(getgametype(), 6);
        registernumlivesdvar(getgametype(), 1);
        registerhalftimedvar(getgametype(), 0);
        registerwinbytwoenableddvar(getgametype(), 0);
        registerwinbytwomaxroundsdvar(getgametype(), 4);
    }
    updategametypedvars();
    level.teambased = 1;
    level.objectivebased = 1;
    level.overridetimelimitclock = 10;
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
    level.snowballfight = getdvarint(@"hash_6c1b43f9065ddf4d", 0);
    level.allowlatecomers = 0;
    level.removekilleventsplash = 1;
    if (matchmakinggame()) {
        teamsize = getdvarint(@"hash_818c699a5caaee4f", 4) / 2;
        level.requiredplayercountoveride = 1;
        level.requiredplayercount["allies"] = teamsize;
        level.requiredplayercount["axis"] = teamsize;
    }
    if (!iswinbytworulegametype()) {
        level.skipdefendersadvantage = 1;
    }
    if (!isnormalloadouts()) {
        level.disablecopycatloadout = 1;
        setomnvar("ui_killcam_copycat", 0);
        level.bypassclasschoicefunc = &namespace_d19129e4fa5d176::alwaysgamemodeclass;
    } else {
        level.disablecopycatloadout = undefined;
    }
    level.arenaknivesout = getknivesoutsetting();
    if (level.arenaknivesout) {
        level.gamemodeoverridemeleeviewkickscale = 0.5;
        level.gamemodeoverriderestockrechargeperupdate = 0.05;
    }
    if (istrue(level.snowballfight)) {
        level.alwayssnowfight = getdvarint(@"hash_f9511aeb46157a2", 0);
        setdvarifuninitialized(@"hash_10d9bf7945521aa4", 1);
        setdvarifuninitialized(@"hash_525526c06343abd1", "loadscreenhintoverlay_snowball_gunfight");
        if (level.alwayssnowfight) {
            level.practiceround = 0;
        } else {
            level.practiceround = 1;
        }
    }
    if (istrue(level.teambased)) {
        setdvarifuninitialized(@"hash_525526c06343abd1", "loadscreenhintoverlay_teamgunfight");
    }
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "dx_mp_gunf_game_t141_gfnm";
    } else {
        game["dialog"]["gametype"] = "dx_mp_gunf_game_t141_gfnm";
    }
    if (ispickuploadouts() && !isdefined(game["roundsPlayed"])) {
        game["dialog"]["offense_obj"] = "dx_mp_gunf_game_t141_gfbo";
        game["dialog"]["defense_obj"] = "dx_mp_gunf_game_t141_gfbo";
    } else if (function_444e57e02c02bee6() && !isdefined(game["roundsPlayed"])) {
        game["dialog"]["offense_obj"] = "dx_mp_gunf_game_t141_gfbo";
        game["dialog"]["defense_obj"] = "dx_mp_gunf_game_t141_gfbo";
    } else {
        game["dialog"]["offense_obj"] = "dx_mp_gunf_game_t141_gfbo";
        game["dialog"]["defense_obj"] = "dx_mp_gunf_game_t141_gfbo";
    }
    game["dialog"]["obj_indepth"] = "boost_arena_indepth";
    game["dialog"]["securing_a"] = "dx_mp_gunf_game_t141_gfsg";
    game["dialog"]["secured_a"] = "dx_mp_gunf_game_t141_gfsd";
    game["dialog"]["losing_a"] = "dx_mp_gunf_game_t141_gflg";
    game["dialog"]["lost_a"] = "dx_mp_gunf_game_t141_gflt";
    game["dialog"]["round_success"] = "dx_mp_gmst_anno_t141_gsrs";
    game["dialog"]["round_failure"] = "dx_mp_gmst_anno_t141_gsrf";
    game["dialog"]["mission_success"] = "dx_mp_gmst_anno_t141_gsms";
    game["dialog"]["mission_failure"] = "dx_mp_gmst_anno_t141_gsmf";
    level.allieshealth = 0;
    level.alliesmaxhealth = 0;
    level.axishealth = 0;
    level.axismaxhealth = 0;
    level.usedspawnposone["allies"] = 0;
    level.usedspawnpostwo["allies"] = 0;
    level.usedspawnposthree["allies"] = 0;
    level.usedspawnposone["axis"] = 0;
    level.usedspawnpostwo["axis"] = 0;
    level.usedspawnposthree["axis"] = 0;
    setomnvar("ui_arena_allies_health", 0);
    setomnvar("ui_arena_axis_health", 0);
    setomnvar("ui_arena_allies_health_max", 100);
    setomnvar("ui_arena_axis_health_max", 100);
    setomnvar("ui_arena_primaryVariantID", -1);
    setomnvar("ui_arena_secondaryVariantID", -1);
    /#
        level thread namespace_47e715c4f9510479::function_ee47e658f5b6314e();
    #/
    if (!getdvarint(@"hash_2167cbfc86b6839", 0)) {
        namespace_2c19af30dc7a566c::function_4a18dd73a966821e(2);
    } else {
        namespace_2c19af30dc7a566c::function_4a18dd73a966821e(6);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e06
// Size: 0x89
function function_955eeef49ba8fef9() {
    locs = getstructarray("weapon_pickup", "targetname");
    foreach (loc in locs) {
        if (is_equal(loc.script_label, "pball")) {
            level.var_ace80cd98b8b31cc = loc;
            break;
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e96
// Size: 0x2da
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_f3cb432a241a7ea3", getmatchrulesdata("arenaData", "arenaLoadouts"));
    setdynamicdvar(@"hash_b2d6a287c0521607", getmatchrulesdata("arenaData", "loadoutChangeRound"));
    setdynamicdvar(@"hash_9555be126d6bdcab", getmatchrulesdata("arenaData", "switchSpawns"));
    setdynamicdvar(@"hash_a4a7060aad657090", getmatchrulesdata("arenaData", "winCondition"));
    setdynamicdvar(@"hash_1b3b0369b76395a5", getmatchrulesdata("arenaData", "objModifier"));
    setdynamicdvar(@"hash_c4dd1397da8407be", getmatchrulesdata("arenaData", "overtimeFlag"));
    setdynamicdvar(@"hash_385f68623c04c6dc", getmatchrulesdata("arenaData", "flagCaptureTime"));
    setdynamicdvar(@"hash_ca4cdfbc3778abed", getmatchrulesdata("arenaData", "flagHoldTimer"));
    setdynamicdvar(@"hash_bc7f17452d7d2bc4", getmatchrulesdata("arenaData", "flagActivationDelay"));
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
    setdynamicdvar(@"hash_ce087f3b0e67c668", getmatchrulesdata("arenaData", "arenaAttachments"));
    setdynamicdvar(@"hash_193cc5a02ee3d815", getmatchrulesdata("arenaData", "arenaSuper"));
    setdynamicdvar(@"hash_c110a01fb151da3", 0);
    registerhalftimedvar(getgametype(), 0);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4177
// Size: 0xee2
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
    if (game[game["attackers"]] == "SAS") {
        game["dialog"]["offense_obj"] = "iw9_gwtd_mode_uktl_gtbs";
    } else if (game[game["defenders"]] == "SAS") {
        game["dialog"]["defense_obj"] = "iw9_gwtd_mode_uktl_gtbs";
    }
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/WAR");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/WAR");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/WAR_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/WAR_HINT");
    }
    initspawns();
    namespace_47e715c4f9510479::function_10cea0880b71973a();
    namespace_47e715c4f9510479::function_b7c18ded2347456c();
    namespace_47e715c4f9510479::function_de46980d57f0c37a();
    if (game["roundsPlayed"] == 0) {
        level thread setroundwinstreakarray();
    }
    thread adjustroundendtimer();
    thread waittooverridegraceperiod();
    var_5abee6062a481f8c = 1;
    if (istrue(level.snowballfight)) {
        if (!level.alwayssnowfight && game["roundsPlayed"] == 0 && istrue(game["practiceRound"])) {
            level.extratime = 30;
            game["didSnowFight"] = 1;
            level.arenaloadouts = 3;
            var_5abee6062a481f8c = 0;
        } else if (level.alwayssnowfight) {
            level.arenaloadouts = 3;
            var_5abee6062a481f8c = 0;
        }
        level.snowfx["vanish"] = loadfx("vfx/core/impacts/small_snowhit");
        level.snowfx["screen"] = loadfx("vfx/iw8/weap/_impact/snowball/vfx_imp_snowball_scrn.vfx");
        snowballfight();
    }
    if (var_5abee6062a481f8c) {
        if (namespace_47e715c4f9510479::israndomloadouts()) {
            thread updaterandomloadout();
        } else if (ispickuploadouts()) {
            if (!isdefined(game["roundsPlayed"]) || isdefined(game["roundsPlayed"]) && game["roundsPlayed"] == 0) {
                level.startweapon.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.startweapon.weapon);
                level.arenaweapont1.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont1.weapon);
                level.arenaweapont2.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont2.weapon);
                level.arenaweapont3.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont3.weapon);
                level.arenaweapont4.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont4.weapon);
                level.arenaweapont5.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont5.weapon);
                level.arenaweapont6.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont6.weapon);
                level.arenaweapont7.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont7.weapon);
                level.arenaweapont8.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont8.weapon);
                level.startweapon.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.startweapon.weapon);
                level.arenaweapont1.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont1.weapon);
                level.arenaweapont2.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont2.weapon);
                level.arenaweapont3.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont3.weapon);
                level.arenaweapont4.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont4.weapon);
                level.arenaweapont5.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont5.weapon);
                level.arenaweapont6.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont6.weapon);
                level.arenaweapont7.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont7.weapon);
                level.arenaweapont8.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont8.weapon);
            } else if (level.loadoutchangeround == 0 || game["roundsPlayed"] % level.loadoutchangeround != 0) {
                level.startweapon.weapon = game["startWeapon"]["weapon"];
                level.arenaweapont1.weapon = game["arenaWeaponT1"]["weapon"];
                level.arenaweapont2.weapon = game["arenaWeaponT2"]["weapon"];
                level.arenaweapont3.weapon = game["arenaWeaponT3"]["weapon"];
                level.arenaweapont4.weapon = game["arenaWeaponT4"]["weapon"];
                level.arenaweapont5.weapon = game["arenaWeaponT5"]["weapon"];
                level.arenaweapont6.weapon = game["arenaWeaponT6"]["weapon"];
                level.arenaweapont7.weapon = game["arenaWeaponT7"]["weapon"];
                level.arenaweapont8.weapon = game["arenaWeaponT8"]["weapon"];
                level.startweapon.variantid = game["startWeapon"]["variantID"];
                level.arenaweapont1.variantid = game["arenaWeaponT1"]["variantID"];
                level.arenaweapont2.variantid = game["arenaWeaponT2"]["variantID"];
                level.arenaweapont3.variantid = game["arenaWeaponT3"]["variantID"];
                level.arenaweapont4.variantid = game["arenaWeaponT4"]["variantID"];
                level.arenaweapont5.variantid = game["arenaWeaponT5"]["variantID"];
                level.arenaweapont6.variantid = game["arenaWeaponT6"]["variantID"];
                level.arenaweapont7.variantid = game["arenaWeaponT7"]["variantID"];
                level.arenaweapont8.variantid = game["arenaWeaponT8"]["variantID"];
            } else if (game["roundsPlayed"] % level.loadoutchangeround == 0) {
                level.startweapon.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.startweapon.weapon);
                level.arenaweapont1.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont1.weapon);
                level.arenaweapont2.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont2.weapon);
                level.arenaweapont3.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont3.weapon);
                level.arenaweapont4.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont4.weapon);
                level.arenaweapont5.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont5.weapon);
                level.arenaweapont6.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont6.weapon);
                level.arenaweapont7.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont7.weapon);
                level.arenaweapont8.weapon = namespace_47e715c4f9510479::getrandomweaponforweapontier(level.arenaweapont8.weapon);
                level.startweapon.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.startweapon.weapon);
                level.arenaweapont1.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont1.weapon);
                level.arenaweapont2.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont2.weapon);
                level.arenaweapont3.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont3.weapon);
                level.arenaweapont4.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont4.weapon);
                level.arenaweapont5.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont5.weapon);
                level.arenaweapont6.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont6.weapon);
                level.arenaweapont7.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont7.weapon);
                level.arenaweapont8.variantid = namespace_47e715c4f9510479::function_11a6a3ec5c206652(level.arenaweapont8.weapon);
            }
            game["startWeapon"]["weapon"] = level.startweapon.weapon;
            game["arenaWeaponT1"]["weapon"] = level.arenaweapont1.weapon;
            game["arenaWeaponT2"]["weapon"] = level.arenaweapont2.weapon;
            game["arenaWeaponT3"]["weapon"] = level.arenaweapont3.weapon;
            game["arenaWeaponT4"]["weapon"] = level.arenaweapont4.weapon;
            game["arenaWeaponT5"]["weapon"] = level.arenaweapont5.weapon;
            game["arenaWeaponT6"]["weapon"] = level.arenaweapont6.weapon;
            game["arenaWeaponT7"]["weapon"] = level.arenaweapont7.weapon;
            game["arenaWeaponT8"]["weapon"] = level.arenaweapont8.weapon;
            game["startWeapon"]["variantID"] = level.startweapon.variantid;
            game["arenaWeaponT1"]["variantID"] = level.arenaweapont1.variantid;
            game["arenaWeaponT2"]["variantID"] = level.arenaweapont2.variantid;
            game["arenaWeaponT3"]["variantID"] = level.arenaweapont3.variantid;
            game["arenaWeaponT4"]["variantID"] = level.arenaweapont4.variantid;
            game["arenaWeaponT5"]["variantID"] = level.arenaweapont5.variantid;
            game["arenaWeaponT6"]["variantID"] = level.arenaweapont6.variantid;
            game["arenaWeaponT7"]["variantID"] = level.arenaweapont7.variantid;
            game["arenaWeaponT8"]["variantID"] = level.arenaweapont8.variantid;
            level.lethaldelay = 0;
            defineplayerloadout();
            if (!istrue(level.snowballfight)) {
                initweaponmap();
                thread setupweapons();
            }
        } else if (isgungameloadouts()) {
            level.blockweapondrops = 1;
            thread updatearenagungameloadout(0);
        } else if (isrvsgungameloadouts()) {
            level.blockweapondrops = 1;
            thread updatearenagungameloadout(1);
        }
    }
    if (!isnormalloadouts()) {
        buildloadoutsforweaponstreaming();
    }
    setupwaypointicons();
    seticonnames();
    switch (level.objmodifier) {
    case 1:
        level setupendzones();
        break;
    case 2:
        level function_5bba7f02dbb91b52();
        break;
    default:
        break;
    }
    if (level.overtimeflag > 0 && !function_2eda32f1d16ded2c()) {
        level thread namespace_47e715c4f9510479::spawngameendflagzone();
    }
    updatetournamentroundtime(namespace_d576b6dc7cef9c62::gettimeremaining(), 0);
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level thread outlineenemyplayers();
        level thread removeenemyoutlines();
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5060
// Size: 0x25
function waittooverridegraceperiod() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    level.overrideingraceperiod = 1;
    level.ingraceperiod = 5;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x508c
// Size: 0x14
function adjustroundendtimer() {
    wait(1);
    level.roundenddelay = 4;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50a7
// Size: 0x436
function updategametypedvars() {
    updatecommongametypedvars();
    if (level.dogtagsenabled) {
        level.dogtagallyonusecb = &dogtagallyonusecb;
        level.dogtagenemyonusecb = &dogtagenemyonusecb;
    }
    level.arenaloadouts = dvarintvalue("arenaLoadouts", 1, 1, 16);
    level.loadoutchangeround = dvarintvalue("loadoutChangeRound", 3, 0, 5);
    level.switchspawns = dvarintvalue("switchSpawns", 1, 0, 1);
    level.wincondition = dvarintvalue("winCondition", 1, 0, 2);
    level.var_56e1b10af8966681 = dvarintvalue("winStreakCamos", 0, 0, 1);
    setomnvar("ui_arena_loadout_type", level.arenaloadouts);
    setomnvar("ui_wincondition", level.wincondition);
    level.objmodifier = dvarintvalue("objModifier", 0, 0, 4);
    if (!function_2eda32f1d16ded2c()) {
        setomnvar("ui_single_flag_loc", -3);
    }
    level.overtimeflag = dvarfloatvalue("overtimeFlag", 10, 0, 30);
    if (level.overtimeflag > 0) {
        level.ontimelimitgraceperiod = level.overtimeflag;
        level.currenttimelimitdelay = 0;
        level.canprocessot = 1;
    }
    level.flagcapturetime = dvarfloatvalue("flagCaptureTime", 3, 0, 30);
    level.flagholdtimer = dvarfloatvalue("flagHoldTimer", 5, 0, 30);
    level.flagactivationdelay = dvarfloatvalue("flagActivationDelay", 15, 0, 30);
    level.tacticaltimemod = dvarfloatvalue("tacticalTimeMod", 2.5, 0.5, 5);
    level.startweapon = spawnstruct();
    level.arenaweapont1 = spawnstruct();
    level.arenaweapont2 = spawnstruct();
    level.arenaweapont3 = spawnstruct();
    level.arenaweapont4 = spawnstruct();
    level.arenaweapont5 = spawnstruct();
    level.arenaweapont6 = spawnstruct();
    level.arenaweapont7 = spawnstruct();
    level.arenaweapont8 = spawnstruct();
    level.startweapon.weapon = getdvar(@"hash_84ab96fa2f04c271", "none");
    level.arenaweapont1.weapon = getdvar(@"hash_54f31afe6345346a", "iw9_pi_golf17");
    level.arenaweapont2.weapon = getdvar(@"hash_54f319fe63453237", "iw9_sh_mike1014");
    level.arenaweapont3.weapon = getdvar(@"hash_54f318fe63453004", "iw9_sm_mpapa5");
    level.arenaweapont4.weapon = getdvar(@"hash_54f317fe63452dd1", "iw9_ar_mike4");
    level.arenaweapont5.weapon = getdvar(@"hash_54f316fe63452b9e", "iw9_sn_alpha50");
    level.arenaweapont6.weapon = getdvar(@"hash_54f315fe6345296b", "equip_frag");
    level.arenaweapont7.weapon = getdvar(@"hash_54f314fe63452738", "equip_concussion");
    level.arenaweapont8.weapon = getdvar(@"hash_54f313fe63452505", "equip_adrenaline");
    level.arenapickupattachments = getdvarint(@"hash_ce087f3b0e67c668", 0);
    if (level.arenaloadouts == 1) {
        setdvar(@"hash_3c357661cd222b4d", 1);
        level.allowperks = 1;
    }
    level.arenasuper = getdvar(@"hash_193cc5a02ee3d815", "none");
    if (level.arenasuper == "none") {
        setomnvar("ui_disable_fieldupgrades", 1);
    }
    level.var_320be3d1af4ef493 = getdvarint(@"hash_3f64b5787462cd52", 1);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54e4
// Size: 0x22e
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    var_1cf8be03fb3c42de = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_arena_spawn_allies_start");
    var_68c73806e24ff493 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_arena_spawn_axis_start");
    var_ebb5693ce8d3a200 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_arena_spawn");
    if (var_1cf8be03fb3c42de.size > 0 || var_68c73806e24ff493.size > 0) {
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_arena_spawn_allies_start");
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_arena_spawn_axis_start");
        level.alliesstartspawn = "mp_arena_spawn_allies_start";
        level.axisstartspawn = "mp_arena_spawn_axis_start";
        /#
            validatespawns("lost_a");
            validatespawns("blastShieldMod");
        #/
    } else {
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_sd_spawn_attacker");
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_sd_spawn_defender");
        level.alliesstartspawn = "mp_sd_spawn_attacker";
        level.axisstartspawn = "mp_sd_spawn_defender";
        /#
            validatespawns("vfx/iw8/weap/_impact/snowball/vfx_imp_snowball_scrn.vfx");
            validatespawns("iw9_ar_mike4");
        #/
    }
    if (var_ebb5693ce8d3a200.size > 0) {
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_arena_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_arena_spawn");
        level.spawntype = "mp_arena_spawn";
    } else {
        var_ebb5693ce8d3a200 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
        if (var_ebb5693ce8d3a200.size > 0) {
            namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
            namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
            level.spawntype = "mp_tdm_spawn";
        } else {
            level.alwaysusestartspawns = 1;
        }
    }
    primary = namespace_b2d5aa2baf2b5701::getspawnpointarray(level.spawntype);
    fallback = namespace_b2d5aa2baf2b5701::getspawnpointarray(level.spawntype);
    namespace_b2d5aa2baf2b5701::registerspawnset("normal", primary);
    namespace_b2d5aa2baf2b5701::registerspawnset("fallback", fallback);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5719
// Size: 0x1bf
function validatespawns(spawnpointname) {
    var_ecbe28103d8ba707 = 0;
    var_ecbe29103d8ba93a = 0;
    var_ecbe2a103d8bab6d = 0;
    var_e89636dadea5a56a = 0;
    spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray(spawnpointname);
    foreach (s in spawnpoints) {
        if (isdefined(s.script_noteworthy)) {
            if (!var_ecbe28103d8ba707) {
                var_ecbe28103d8ba707 = s.script_noteworthy == "1";
            } else {
                /#
                    assertex(s.script_noteworthy != "1", "Found two spawn points with the same script_noteworthy of "1"");
                #/
            }
            if (!var_ecbe29103d8ba93a) {
                var_ecbe29103d8ba93a = s.script_noteworthy == "2";
            } else {
                /#
                    assertex(s.script_noteworthy != "2", "Found two spawn points with the same script_noteworthy of "2"");
                #/
            }
            if (!var_ecbe2a103d8bab6d) {
                var_ecbe2a103d8bab6d = s.script_noteworthy == "3";
                level.hasthreespawns = 1;
            } else {
                /#
                    assertex(s.script_noteworthy != "3", "Found two spawn points with the same script_noteworthy of "3"");
                #/
            }
        } else if (var_e89636dadea5a56a == 0) {
            s.script_noteworthy = "1";
            var_e89636dadea5a56a++;
        } else if (var_e89636dadea5a56a == 1) {
            s.script_noteworthy = "2";
            var_e89636dadea5a56a++;
        } else if (var_e89636dadea5a56a == 2) {
            s.script_noteworthy = "3";
            var_e89636dadea5a56a++;
            level.hasthreespawns = 1;
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58df
// Size: 0x87a
function getspawnpoint() {
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Frontline");
    }
    spawnpoint = undefined;
    spawnpointname = level.axisstartspawn;
    var_aa57738edf8a8169 = 0;
    if (self.pers["team"] == game["attackers"]) {
        spawnpointname = level.alliesstartspawn;
    }
    if (getdvarint(@"hash_9684a3d8ce5dd398", 0) > 0) {
        if (function_bff229a11ecd1e34()) {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"start");
        } else {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic("StartSpawn", "Crit_Default");
        }
        spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray(spawnpointname);
        spawnpoint = function_e77a290b26c3e849(spawnpoints, string(getdvarint(@"hash_9684a3d8ce5dd398", 0)));
        /#
            thread function_403dca95ad44db03(spawnpoints);
        #/
    } else if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn() || istrue(level.alwaysusestartspawns) || isintournament()) {
        if (function_bff229a11ecd1e34()) {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"start");
        } else {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic("StartSpawn", "Crit_Default");
        }
        spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray(spawnpointname);
        /#
            assert(spawnpoints.size);
        #/
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
                if (isdefined(spawnpoint)) {
                    self.spawnpointangles = spawnpoint.angles;
                }
            } else {
                spawnpoint = getspawnpoint_startspawn(spawnpoints);
                if (isdefined(spawnpoint)) {
                    self.spawnpointangles = spawnpoint.angles;
                }
            }
            if (!isdefined(spawnpoint)) {
                var_49ed3f681faf7163 = getteamcount(self.pers["team"]);
                if (var_49ed3f681faf7163 > 3) {
                    buddyspawnplayer = undefined;
                    var_836289e1016f3c1b = 0;
                    foreach (player in getteamdata(self.pers["team"], "players")) {
                        if (istrue(player.buddyspawnplayer)) {
                            var_836289e1016f3c1b++;
                        } else {
                            break;
                        }
                    }
                    foreach (player in getteamdata(self.pers["team"], "players")) {
                        if (player == self) {
                            continue;
                        }
                        if (istrue(player.buddyspawnplayer)) {
                            continue;
                        }
                        if (!istrue(player.hasspawned)) {
                            continue;
                        }
                        if (isdefined(player.pers["arena_spawn_pos"])) {
                            if (level.usedspawnposone[self.pers["team"]] == 1 && level.usedspawnpostwo[self.pers["team"]] == 1 && level.usedspawnposthree[self.pers["team"]] == 1) {
                                level.usedspawnposone[self.pers["team"]] = 0;
                                level.usedspawnpostwo[self.pers["team"]] = 0;
                                level.usedspawnposthree[self.pers["team"]] = 0;
                            }
                            if (player.pers["arena_spawn_pos"] == "1" && level.usedspawnposone[self.pers["team"]] == 0) {
                                level.usedspawnposone[self.pers["team"]]++;
                                player.buddyspawnplayer = 1;
                                buddyspawnplayer = player;
                                break;
                            } else if (player.pers["arena_spawn_pos"] == "2" && level.usedspawnpostwo[self.pers["team"]] == 0) {
                                level.usedspawnpostwo[self.pers["team"]]++;
                                player.buddyspawnplayer = 1;
                                buddyspawnplayer = player;
                                break;
                            } else if (player.pers["arena_spawn_pos"] == "3" && level.usedspawnposthree[self.pers["team"]] == 0) {
                                level.usedspawnposthree[self.pers["team"]]++;
                                player.buddyspawnplayer = 1;
                                buddyspawnplayer = player;
                                break;
                            } else {
                                level.usedspawnposone[self.pers["team"]]++;
                                player.buddyspawnplayer = 1;
                                buddyspawnplayer = player;
                                break;
                            }
                        }
                    }
                    if (isdefined(buddyspawnplayer)) {
                        spawnpoint = namespace_90f75d3fdf89a43e::findteammatebuddyspawn(buddyspawnplayer);
                        if (isdefined(spawnpoint) && isdefined(buddyspawnplayer.spawnpointangles)) {
                            spawnpoint.angles = buddyspawnplayer.spawnpointangles;
                        }
                    }
                }
            }
            if (!isdefined(spawnpoint)) {
                namespace_b2d5aa2baf2b5701::activatespawnset("normal");
                spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, self.pers["team"], "normal", "fallback");
            }
            if (isdefined(spawnpoint.script_noteworthy) && spawnpoint.script_noteworthy != "" && istrue(level.switchspawns) && game["roundsPlayed"] == 0) {
                /#
                    assertex(spawnpoint.script_noteworthy == "1" || spawnpoint.script_noteworthy == "2" || spawnpoint.script_noteworthy == "3" || spawnpoint.script_noteworthy == "4");
                #/
                self.pers["arena_spawn_pos"] = spawnpoint.script_noteworthy;
            }
        }
    } else {
        namespace_b2d5aa2baf2b5701::activatespawnset("normal");
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, self.pers["team"], "normal", "fallback");
    }
    return spawnpoint;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6161
// Size: 0x1fe
function cleanupspawn_scriptnoteworthy() {
    otherteam = getotherteam(self.pers["team"])[0];
    if (otherteam == game["attackers"]) {
        spawnpointname = level.alliesstartspawn;
        var_55af954984fc6a2a = level.axisstartspawn;
    } else {
        spawnpointname = level.axisstartspawn;
        var_55af954984fc6a2a = level.alliesstartspawn;
    }
    var_cb5363ab35b26aea = namespace_b2d5aa2baf2b5701::getspawnpointarray(spawnpointname);
    /#
        assert(var_cb5363ab35b26aea.size);
    #/
    foreach (s in var_cb5363ab35b26aea) {
        if (s.script_noteworthy == self.pers["arena_spawn_pos"]) {
            s.selected = 0;
        }
    }
    var_cb5363ab35b26aea = namespace_b2d5aa2baf2b5701::getspawnpointarray(var_55af954984fc6a2a);
    /#
        assert(var_cb5363ab35b26aea.size);
    #/
    foreach (s in var_cb5363ab35b26aea) {
        foreach (player in getteamdata(self.pers["team"], "players")) {
            if (player != self && isdefined(player.pers["arena_spawn_pos"]) && s.script_noteworthy != player.pers["arena_spawn_pos"]) {
                s.selected = 0;
            }
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6366
// Size: 0xe6
function getspawnpoint_startspawn(spawnpoints, var_728d3544ba462895) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    bestspawn = undefined;
    spawnpoints = namespace_90f75d3fdf89a43e::checkdynamicspawns(spawnpoints);
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

// Namespace arena/namespace_47e715c4f9510479
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6454
// Size: 0xb5
function getswitchside_spawnpoint(spawnpoints, var_2b71cdd2f02eb67b) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    var_cee9d4c5101c6ead = 0;
    foreach (spawnpoint in spawnpoints) {
        if (spawnpoint.script_noteworthy == var_2b71cdd2f02eb67b) {
            if (istrue(spawnpoint.selected)) {
                var_cee9d4c5101c6ead = 1;
            } else {
                spawnpoint.selected = 1;
                return spawnpoint;
            }
        }
    }
    /#
        assertex(var_cee9d4c5101c6ead == 1, "Spawns don't have a script_noteworthy to support spawn switches! There should be a "1" or a "2"");
    #/
    return undefined;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6511
// Size: 0x7e
function function_e77a290b26c3e849(spawnpoints, var_2b71cdd2f02eb67b) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    var_cee9d4c5101c6ead = 0;
    foreach (spawnpoint in spawnpoints) {
        if (spawnpoint.script_noteworthy == var_2b71cdd2f02eb67b) {
            return spawnpoint;
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6596
// Size: 0x111
function function_403dca95ad44db03(spawnpoints) {
    color = (0, 0, 0);
    foreach (s in spawnpoints) {
        if (isdefined(s.script_noteworthy)) {
            if (s.script_noteworthy == "1") {
                color = (1, 0, 0);
            } else if (s.script_noteworthy == "2") {
                color = (0, 1, 0);
            } else if (s.script_noteworthy == "3") {
                color = (0, 0, 1);
            } else {
                color = (1, 1, 1);
            }
            thread namespace_f2ffc0540883e1ad::drawsphere(s.origin, 32, 20, color);
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x66ae
// Size: 0x17f
function onplayerconnect(player) {
    if (istrue(level.allowkillstreaks)) {
        level.allowkillstreaks = 0;
    }
    player.arenadamage = 0;
    player setextrascore0(0);
    if (isdefined(player.pers["damage"])) {
        player setextrascore0(player.pers["damage"]);
    }
    if (!isnormalloadouts()) {
        level.denyclasschoice = 1;
        player namespace_d19129e4fa5d176::function_a16868d4dcd81a4b();
        if (namespace_47e715c4f9510479::israndomloadouts()) {
            player.pers["gamemodeLoadout"] = game["arenaRandomLoadout"][game["arenaRandomLoadoutIndex"]];
        } else if (ispickuploadouts()) {
            player.pers["gamemodeLoadout"] = level.var_b128efae25ac7cc6;
        } else if (isgungameloadouts() || isrvsgungameloadouts()) {
            player.pers["gamemodeLoadout"] = game["arenaRandomLoadout"][getgungameloadoutindex(player)];
            if (game["roundsPlayed"] == 0) {
                player setenemyloadoutomnvars();
            }
        }
    }
    if (istrue(level.switchspawns) && !isdefined(player.pers["arena_spawn_pos"])) {
        player.pers["arena_spawn_pos"] = "0";
    }
    player thread namespace_47e715c4f9510479::onjoinedteam();
    if (!isnormalloadouts()) {
        player updatehighpriorityweapons();
    }
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6834
// Size: 0x15
function onplayerdisconnect(player) {
    setteamhealthhud(1);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6850
// Size: 0x25
function onjoinedteam() {
    level endon("game_ended");
    for (;;) {
        waittill_any_2("joined_team", "joined_spectators");
        setteamhealthhud();
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x687c
// Size: 0x62
function onspawnplayer(var_9156b53bcf7ce573) {
    thread onspawnfinished();
    level notify("spawned_player");
    thread updatematchstatushintonspawn();
    if (istrue(level.alwayssnowfight)) {
        perk::giveperk("specialty_fastoffhand");
        perk::giveperk("specialty_pitcher");
    }
    namespace_9bb409deb69fb31d::updatesquadomnvars(self.team, self.var_ff97225579de16a);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68e5
// Size: 0x11a
function onspawnfinished() {
    self endon("death_or_disconnect");
    if (istrue(game["practiceRound"]) || istrue(level.alwayssnowfight)) {
        thread snowballmeleewatcher();
    }
    thread damagewatcher();
    if (!isnormalloadouts()) {
        self waittill("giveLoadout");
        namespace_47e715c4f9510479::runarenaloadoutrulesonplayer(self);
    }
    thread modifyblastshieldperk();
    if (level.arenaknivesout) {
        giveperk("specialty_quickswap");
    }
    wait(0.1);
    self.hasarenaspawned = 1;
    wait(0.15);
    if (!namespace_4b0406965e556711::gameflag("prematch_done") && game["roundsPlayed"] == 0) {
        if (level.overtimeflag > 0 && isdefined(level.matchcountdowntime) && level.matchcountdowntime > 5) {
            if (!self issplitscreenplayer() || self issplitscreenplayerprimary()) {
                namespace_944ddf7b8df1b0e3::leaderdialogonplayer("obj_indepth", "introboost");
            }
        }
        level waittill_any_2("prematch_done", "removeArenaOutlines");
    }
    self setclientomnvar("ui_player_notify_loadout", gettime());
    function_8cbda65b25d7573c();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a06
// Size: 0x26f
function setteamhealthhud(var_51c0c03bb238c17) {
    var_586dc9dc0cf668ad = getdvarint(@"hash_b1d561f9a9241e09", 100);
    alliesplayers = getteamdata("allies", "teamCount");
    if (alliesplayers) {
        level.alliesmaxhealth = getteamdata("allies", "teamCount") * var_586dc9dc0cf668ad;
        setomnvar("ui_arena_allies_health_max", level.alliesmaxhealth);
        if (!istrue(var_51c0c03bb238c17) && !isreallyalive(self) && namespace_99ac021a7547cae3::mayspawn()) {
            self waittill("spawned_player");
        }
        allieshealth = 0;
        foreach (player in getteamdata("allies", "players")) {
            allieshealth = allieshealth + player.health;
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
        if (!istrue(var_51c0c03bb238c17) && !isreallyalive(self) && namespace_99ac021a7547cae3::mayspawn()) {
            self waittill("spawned_player");
        }
        axishealth = 0;
        foreach (player in getteamdata("axis", "players")) {
            axishealth = axishealth + player.health;
        }
        level.axishealth = axishealth;
        if (level.axishealth < 0) {
            level.axishealth = 0;
        }
        setomnvar("ui_arena_axis_health", level.axishealth);
    } else {
        setomnvar("ui_arena_axis_health", 0);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c7c
// Size: 0x44
function modifyblastshieldperk() {
    if (namespace_82dcd1d5ae30ff7::_hasperk("specialty_blastshield")) {
        blastshieldmod = dvarintvalue("blastShieldMod", 0.65, 0, 1);
        if (blastshieldmod == 0) {
            removeperk("specialty_blastshield");
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 15, eflags: 0x0
// Checksum 0x0, Offset: 0x6cc7
// Size: 0x14f
function onplayerdamaged(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, var_fcdf19e3cdd29669, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, var_1da1a66b5c6a06a7) {
    if (isdefined(eattacker) && eattacker != victim && isplayer(eattacker)) {
        if (istrue(level.snowballfight) && (objweapon.basename == "snowball_mp" || objweapon.basename == "pball_mp")) {
            playfxontagforclients(level.snowfx["screen"], victim, "tag_eye", victim);
        }
        if (idamage >= var_fcdf19e3cdd29669) {
            idamage = var_fcdf19e3cdd29669;
        }
        eattacker.arenadamage = eattacker.arenadamage + idamage;
        eattacker namespace_2685ec368e022695::statsetchild("round", "damage", eattacker.pers["damage"]);
        eattacker setextrascore0(eattacker.pers["damage"]);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e1d
// Size: 0x2ac
function damagewatcher() {
    self notify("startDamageWatcher");
    self endon("startDamageWatcher");
    level endon("game_ended");
    self endon("disconnect");
    self.totaldamagetaken = 0;
    while (1) {
        waittill_any_7("damage", "force_regeneration", "removeAdrenaline", "healed", "naturalHealthRegen", "vampirism", "spawned_player");
        if (self.team == "allies") {
            allieshealth = 0;
            foreach (player in getteamdata("allies", "players")) {
                allieshealth = allieshealth + player.health;
            }
            level.allieshealth = allieshealth;
            if (level.allieshealth < 0) {
                level.allieshealth = 0;
            }
            setomnvar("ui_arena_allies_health", level.allieshealth);
        } else {
            axishealth = 0;
            foreach (player in getteamdata("axis", "players")) {
                axishealth = axishealth + player.health;
            }
            level.axishealth = axishealth;
            if (level.axishealth < 0) {
                level.axishealth = 0;
            }
            setomnvar("ui_arena_axis_health", level.axishealth);
        }
        if (istrue(self.iscapturing)) {
            var_d3ae4cb68808aaa8 = undefined;
            if (function_444e57e02c02bee6()) {
                if (self.team == game["defenders"]) {
                    level.attackerendzone.curprogress = 50;
                    level.attackerendzone.teamprogress[self.team] = 50;
                    var_d3ae4cb68808aaa8 = level.attackerendzone;
                } else if (self.team == game["attackers"]) {
                    level.defenderendzone.curprogress = 50;
                    level.defenderendzone.teamprogress[self.team] = 50;
                    var_d3ae4cb68808aaa8 = level.defenderendzone;
                }
                namespace_5a22b6f3a56f7e9b::objective_set_progress(var_d3ae4cb68808aaa8.objidnum, var_d3ae4cb68808aaa8.curprogress / var_d3ae4cb68808aaa8.usetime);
            }
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x70d0
// Size: 0x82
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    if (!isnormalloadouts()) {
        if (isbot(victim)) {
            victim.classcallback = "gamemode";
        }
    }
    if (game["state"] == "postgame") {
        attacker.finalkill = 1;
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x7159
// Size: 0xd8
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    namespace_9bb409deb69fb31d::updatesquadomnvars(self.team, self.var_ff97225579de16a);
    if (!isnormalloadouts()) {
        if (isbot(self)) {
            self.classcallback = "gamemode";
        }
    }
    if (isdefined(attacker) && (objweapon.basename == "snowball_mp" || objweapon.basename == "pball_mp")) {
        attacker thread namespace_48a08c5037514e04::function_e3e3e81453fd788b(#"hash_1a706e2beeb19324");
    }
    thread checkallowspectating();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7238
// Size: 0x89
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
        namespace_5aeecefc462876::updatespectatesettings();
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x72c8
// Size: 0xdd
function ontimelimit() {
    if (level.gameended) {
        return;
    }
    updatetournamentroundtime(namespace_d576b6dc7cef9c62::gettimeremaining(), 3);
    if (function_2eda32f1d16ded2c()) {
        if (level.var_59a1f917fb3131a6 != "neutral") {
            level thread namespace_d576b6dc7cef9c62::endgame(level.var_59a1f917fb3131a6, game["end_reason"]["ko_flag_win"], game["end_reason"]["ko_flag_loss"]);
        } else if (level.wincondition == 1) {
            checkliveswinner();
        } else if (level.wincondition == 2) {
            checkhealthwinner();
        } else {
            checkhealthwinner();
        }
    } else if (level.wincondition == 1) {
        checkliveswinner();
    } else if (level.wincondition == 2) {
        checkhealthwinner();
    } else {
        checkhealthwinner();
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x73ac
// Size: 0x61
function ontimelimitot() {
    if (function_2eda32f1d16ded2c()) {
        if (level.var_59a1f917fb3131a6 != "neutral") {
            level thread namespace_d576b6dc7cef9c62::endgame(level.var_59a1f917fb3131a6, game["end_reason"]["ko_flag_win"], game["end_reason"]["ko_flag_loss"]);
        }
    }
    updatetournamentroundtime(namespace_d576b6dc7cef9c62::gettimeremaining(), 1);
    level thread startotmechanics();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7414
// Size: 0xf2
function checkliveswinner() {
    if (getteamdata("allies", "aliveCount") > getteamdata("axis", "aliveCount")) {
        game["dialog"]["round_success"] = "gamestate_win_health";
        game["dialog"]["round_failure"] = "gamestate_lost_health";
        thread arena_endgame("allies", game["end_reason"]["arena_time_lives_win"], game["end_reason"]["arena_time_lives_loss"]);
    } else if (getteamdata("axis", "aliveCount") > getteamdata("allies", "aliveCount")) {
        game["dialog"]["round_success"] = "gamestate_win_health";
        game["dialog"]["round_failure"] = "gamestate_lost_health";
        thread arena_endgame("axis", game["end_reason"]["arena_time_lives_win"], game["end_reason"]["arena_time_lives_loss"]);
    } else {
        checkhealthwinner();
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x750d
// Size: 0x22e
function checkhealthwinner() {
    if (level.axishealth < level.allieshealth) {
        game["dialog"]["round_success"] = "gamestate_win_health";
        game["dialog"]["round_failure"] = "gamestate_lost_health";
        thread arena_endgame("allies", game["end_reason"]["arena_time_health_win"], game["end_reason"]["arena_time_health_loss"]);
    } else if (level.allieshealth < level.axishealth) {
        game["dialog"]["round_success"] = "gamestate_win_health";
        game["dialog"]["round_failure"] = "gamestate_lost_health";
        thread arena_endgame("axis", game["end_reason"]["arena_time_health_win"], game["end_reason"]["arena_time_health_loss"]);
    } else if (matchmakinggame()) {
        if (isintournament()) {
            game["canScoreOnTie"] = 1;
            if (game["finalRound"] == 1) {
                game["canScoreOnTie"] = 0;
                if (!isdefined(game["roundsTied"])) {
                    game["roundsTied"] = 1;
                } else {
                    game["roundsTied"]++;
                }
                if (game["roundsTied"] >= 2) {
                    var_d1c52bd1768483b2 = namespace_d576b6dc7cef9c62::getbetterteam();
                    thread namespace_d576b6dc7cef9c62::endgame(var_d1c52bd1768483b2, game["end_reason"]["arena_tournament_tie_win"], game["end_reason"]["arena_tournament_tie_loss"]);
                } else {
                    thread arena_endgame("tie", game["end_reason"]["time_limit_reached"]);
                }
            } else {
                thread arena_endgame("tie", game["end_reason"]["cyber_tie"]);
            }
        } else {
            if (!isdefined(game["roundsTied"])) {
                game["roundsTied"] = 1;
            } else {
                game["roundsTied"]++;
            }
            game["canScoreOnTie"] = game["roundsTied"] >= 2;
            if (game["canScoreOnTie"]) {
                thread arena_endgame("tie", game["end_reason"]["cyber_tie"]);
            } else {
                thread arena_endgame("tie", game["end_reason"]["time_limit_reached"]);
            }
        }
    } else {
        thread arena_endgame("tie", game["end_reason"]["time_limit_reached"]);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7742
// Size: 0x8d
function ondeadevent(team) {
    if (istrue(level.ingraceperiod)) {
        return;
    }
    if (team == game["attackers"]) {
        level thread arena_endgame(game["defenders"], game["end_reason"][tolower(game[game["attackers"]]) + "_eliminated"]);
    } else if (team == game["defenders"]) {
        level thread arena_endgame(game["attackers"], game["end_reason"][tolower(game[game["defenders"]]) + "_eliminated"]);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x77d6
// Size: 0xc
function ontimelimitdeadevent(team) {
    
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x77e9
// Size: 0x435
function checkshouldallowtradekilltie(winningteam) {
    livescount = [];
    foreach (entry in level.teamnamelist) {
        livescount[entry] = 0;
    }
    foreach (player in level.players) {
        if (!istrue(player.hasspawned) || player.team == "spectator" || player.team == "codcaster") {
            continue;
        }
        livescount[player.team] = livescount[player.team] + player.pers["lives"];
    }
    var_4351d3695cbe4fd7 = 0;
    foreach (entry in level.teamnamelist) {
        if (getteamdata(entry, "aliveCount")) {
            var_4351d3695cbe4fd7 = 1;
            break;
        }
    }
    var_3ed276c562480671 = 0;
    foreach (count in livescount) {
        if (count) {
            var_3ed276c562480671 = 1;
            break;
        }
    }
    if (!var_4351d3695cbe4fd7 && !var_3ed276c562480671) {
        return "tie";
    }
    foreach (entry in level.teamnamelist) {
        /#
            println("Default" + entry + "0" + getteamdata(entry, "giveLoadout"));
        #/
        if (!getteamdata(entry, "aliveCount") && !livescount[entry]) {
            /#
                println("startDamageWatcher" + entry);
            #/
            if (level.multiteambased) {
                if (!getteamdata(entry, "deathEvent") && getteamdata(entry, "hasSpawned")) {
                    setteamdata(entry, "deathEvent", 1);
                    return winningteam;
                }
            } else {
                return winningteam;
            }
        }
    }
    foreach (entry in level.teamnamelist) {
        oneleft = getteamdata(entry, "aliveCount") == 1;
        if (oneleft) {
            var_91595db4ccf80384 = 0;
            var_43e4262d6ea97013 = undefined;
            players = getteamdata(entry, "players");
            foreach (player in players) {
                if (!isalive(player)) {
                    var_91595db4ccf80384 = var_91595db4ccf80384 + player.pers["lives"];
                }
            }
            if (var_91595db4ccf80384 == 0) {
                if (!getteamdata(entry, "oneLeft") && gettime() > getteamdata(entry, "oneLeftTime") + 5000) {
                    setteamdata(entry, "oneLeftTime", gettime());
                    setteamdata(entry, "oneLeft", 1);
                    if (players.size > 1) {
                        return winningteam;
                    }
                }
            }
        } else {
            setteamdata(entry, "oneLeft", 0);
        }
    }
    return winningteam;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x7c26
// Size: 0x246
function arena_endgame(winningteam, endreasontext, var_656b99fc50e799ae, nukedetonated, var_8e4a26ed257a393b) {
    if (winningteam != "tie") {
        if (istrue(level.nukeinfo.incoming)) {
            return;
        }
        waittillframeend();
        winningteam = checkshouldallowtradekilltie(winningteam);
    }
    if (isgungameloadouts() || isrvsgungameloadouts()) {
        level setenemyloadoutomnvarsatmatchend(winningteam);
    }
    if (winningteam != "tie") {
        game["roundsTied"] = 0;
        game["previousWinningTeam"] = winningteam;
        foreach (entry in level.teamnamelist) {
            if (entry == winningteam) {
                game["roundWinStreak"][winningteam]++;
            } else {
                game["roundWinStreak"][entry] = 0;
            }
        }
        if (!iswinbytworulegametype()) {
            switch (game["roundWinStreak"][winningteam]) {
            case 2:
                game["dialog"]["round_success"] = "dx_mp_gmst_anno_t141_gsrs";
                break;
            case 3:
                game["dialog"]["round_success"] = "dx_mp_gmst_anno_t141_gsrs";
                break;
            case 4:
                game["dialog"]["round_success"] = "dx_mp_gmst_anno_t141_gsrs";
                break;
            case 5:
                roundswon = getroundswon(winningteam);
                winlimit = getwatcheddvar("winlimit");
                if (winlimit == 6 && roundswon != winlimit - 1) {
                    game["dialog"]["round_success"] = "dx_mp_gmst_anno_t141_gsrs";
                }
                break;
            default:
                break;
            }
        }
        if (game["finalRound"] == 1) {
            if (game["roundWinStreak"][winningteam] > 3) {
                game["dialog"]["mission_success"] = "gamestate_win_comeback";
            }
        }
    } else {
        game["previousWinningTeam"] = "";
    }
    namespace_74465391b3cf76b::update2v2progress();
    thread namespace_d576b6dc7cef9c62::endgame(winningteam, endreasontext, var_656b99fc50e799ae, nukedetonated, var_8e4a26ed257a393b);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e73
// Size: 0x5b
function setroundwinstreakarray() {
    foreach (entry in level.teamnamelist) {
        game["roundWinStreak"][entry] = 0;
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ed5
// Size: 0x12b
function runarenaloadoutrulesonplayer(player) {
    swaploadout = 0;
    if (ispickuploadouts()) {
        if (game["roundsPlayed"] == 0) {
            wait(0.1);
        } else {
            wait(0.25);
        }
    } else if (israndomarloadouts() || israndomsmgloadouts() || israndompistolloadouts() || israndomshotgunloadouts() || israndomsniperloadouts() || israndomlmgloadouts()) {
        if (getdvarint(@"hash_cc279143b9185777", 0) == 0) {
            player.pers["gamemodeLoadout"]["loadoutSecondary"] = "none";
            swaploadout = 1;
        }
    }
    if (istrue(level.var_56e1b10af8966681)) {
        player.pers["gamemodeLoadout"]["loadoutPrimaryCamo"] = namespace_47e715c4f9510479::function_3dd5b16653c57b45(player.pers["team"]);
        player.pers["gamemodeLoadout"]["loadoutSecondaryCamo"] = namespace_47e715c4f9510479::function_3dd5b16653c57b45(player.pers["team"]);
        swaploadout = 1;
    }
    if (istrue(swaploadout)) {
        player namespace_d19129e4fa5d176::swaploadout();
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8007
// Size: 0x2ae
function buildloadoutsforweaponstreaming() {
    level.loadweapons = [];
    if (ispickuploadouts()) {
        if (level.startweapon.weapon == "none" || issubstr(level.startweapon.weapon, "equip")) {
            newweapon = "iw9_me_fists_mp";
            var_66b3db972ac1531e = makeweapon(newweapon);
            newweapon = getcompleteweaponname(var_66b3db972ac1531e);
        } else {
            rootname = getweaponrootname(level.startweapon.weapon);
            attachments = [];
            camoname = "none";
            reticleindex = "none";
            variantid = undefined;
            var_f3464d71f01f614e = undefined;
            cosmeticattachment = undefined;
            stickers = undefined;
            if (ispickupblueprintloadouts()) {
                var_66b3db972ac1531e = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(rootname, camoname, reticleindex, level.startweapon.variantid, var_f3464d71f01f614e, cosmeticattachment, stickers);
            } else {
                var_66b3db972ac1531e = namespace_e0ee43ef2dddadaa::buildweapon(rootname, attachments, camoname, reticleindex, variantid, var_f3464d71f01f614e, cosmeticattachment, stickers);
            }
            newweapon = getcompleteweaponname(var_66b3db972ac1531e);
        }
        level.loadweapons[level.loadweapons.size] = var_66b3db972ac1531e;
    } else {
        primaries = [];
        var_2aee5a9b1a165f09 = [];
        loadout = game["arenaRandomLoadout"][game["arenaRandomLoadoutIndex"]];
        primary = loadout["loadoutPrimary"];
        secondary = loadout["loadoutSecondary"];
        if (primary != "none") {
            primaries[primaries.size] = function_ceaf8a81ff311f20(primary, loadout);
        }
        if (secondary != "none") {
            var_2aee5a9b1a165f09[var_2aee5a9b1a165f09.size] = function_ceaf8a81ff311f20(secondary, loadout);
        }
        if (level.loadoutchangeround != 0) {
            var_a9c56228c41ecda0 = game["arenaRandomLoadoutIndex"] + 1;
            if (game["arenaRandomLoadoutIndex"] == game["arenaRandomLoadout"].size - 1) {
                var_a9c56228c41ecda0 = 0;
            }
            var_c3d433af5f864e84 = game["arenaRandomLoadout"][var_a9c56228c41ecda0];
            var_c03d6dd4bfb14c5a = var_c3d433af5f864e84["loadoutPrimary"];
            var_fccb1d1573e7f2a6 = var_c3d433af5f864e84["loadoutSecondary"];
            if (var_c03d6dd4bfb14c5a != "none") {
                primaries[primaries.size] = function_ceaf8a81ff311f20(var_c03d6dd4bfb14c5a, var_c3d433af5f864e84);
            }
            if (var_fccb1d1573e7f2a6 != "none") {
                var_2aee5a9b1a165f09[var_2aee5a9b1a165f09.size] = function_ceaf8a81ff311f20(var_fccb1d1573e7f2a6, var_c3d433af5f864e84);
            }
        }
        level.loadweapons = array_combine(primaries, var_2aee5a9b1a165f09);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x82bc
// Size: 0x15e
function private function_ceaf8a81ff311f20(weaponname, loadout) {
    var_e38b4e99059a1f48 = undefined;
    if (weaponname == loadout["loadoutPrimary"]) {
        var_e38b4e99059a1f48 = "loadoutPrimary";
    } else if (weaponname == loadout["loadoutSecondary"]) {
        var_e38b4e99059a1f48 = "loadoutSecondary";
    }
    /#
        assertex(isdefined(var_e38b4e99059a1f48), "The specified weapon '" + weaponname + "' does not match any weapon defined in the loadout.");
    #/
    rootname = getweaponrootname(loadout[var_e38b4e99059a1f48]);
    variantid = loadout[var_e38b4e99059a1f48 + "VariantID"];
    if (function_c0c1519b5cfb9bd5()) {
        weaponobject = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(rootname, undefined, undefined, variantid);
        return getcompleteweaponname(weaponobject);
    }
    attachments = [];
    for (i = 1; i <= 5; i++) {
        concat = i;
        if (i == 1) {
            concat = "";
        }
        attachment = loadout[var_e38b4e99059a1f48 + "Attachment" + concat];
        if (attachment != "none") {
            attachments[attachments.size] = attachment;
        }
    }
    camoname = loadout[var_e38b4e99059a1f48 + "Camo"];
    reticleindex = loadout[var_e38b4e99059a1f48 + "Reticle"];
    weaponobject = namespace_e0ee43ef2dddadaa::buildweapon(rootname, attachments, camoname, reticleindex, variantid);
    return getcompleteweaponname(weaponobject);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8422
// Size: 0xc3
function setupblueprintpickupweapons() {
    level.arenaweapont1 = buildblueprintpickupweapon(level.arenaweapont1);
    level.arenaweapont2 = buildblueprintpickupweapon(level.arenaweapont2);
    level.arenaweapont3 = buildblueprintpickupweapon(level.arenaweapont3);
    level.arenaweapont4 = buildblueprintpickupweapon(level.arenaweapont4);
    level.arenaweapont5 = buildblueprintpickupweapon(level.arenaweapont5);
    level.arenaweapont6 = buildblueprintpickupweapon(level.arenaweapont6);
    level.arenaweapont7 = buildblueprintpickupweapon(level.arenaweapont7);
    level.arenaweapont8 = buildblueprintpickupweapon(level.arenaweapont8);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84ec
// Size: 0x124
function buildblueprintpickupweapon(var_d44eb44714e9fb44) {
    var_d44eb44714e9fb44.weapon = var_d44eb44714e9fb44.weapon;
    if (!issubstr(var_d44eb44714e9fb44.weapon, "equip") && var_d44eb44714e9fb44.weapon != "none") {
        attachments = [];
        camoname = "none";
        reticleindex = "none";
        variantid = var_d44eb44714e9fb44.variantid;
        var_f3464d71f01f614e = undefined;
        cosmeticattachment = undefined;
        stickers = [];
        stickers[0] = "none";
        stickers[1] = "none";
        stickers[2] = "none";
        stickers[3] = "none";
        stickers[4] = "none";
        rootname = getweaponrootname(var_d44eb44714e9fb44.weapon);
        var_d44eb44714e9fb44.weaponobj = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(rootname, undefined, undefined, variantid, undefined, undefined, namespace_36f464722d326bbe::function_d2d2b803a7b741a4());
    }
    return var_d44eb44714e9fb44;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8618
// Size: 0xdb
function setupstartweaponsattachments() {
    level.startweapon = setupweaponattachmentoverrides(level.startweapon);
    level.arenaweapont1 = setupweaponattachmentoverrides(level.arenaweapont1);
    level.arenaweapont2 = setupweaponattachmentoverrides(level.arenaweapont2);
    level.arenaweapont3 = setupweaponattachmentoverrides(level.arenaweapont3);
    level.arenaweapont4 = setupweaponattachmentoverrides(level.arenaweapont4);
    level.arenaweapont5 = setupweaponattachmentoverrides(level.arenaweapont5);
    level.arenaweapont6 = setupweaponattachmentoverrides(level.arenaweapont6);
    level.arenaweapont7 = setupweaponattachmentoverrides(level.arenaweapont7);
    level.arenaweapont8 = setupweaponattachmentoverrides(level.arenaweapont8);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x86fa
// Size: 0xcc
function setupweaponattachmentoverrides(var_d44eb44714e9fb44) {
    var_d44eb44714e9fb44.weapon = var_d44eb44714e9fb44.weapon;
    if (!issubstr(var_d44eb44714e9fb44.weapon, "equip") && var_d44eb44714e9fb44.weapon != "none") {
        attachments = [];
        camoname = "none";
        reticleindex = "none";
        variantid = undefined;
        rootname = getweaponrootname(var_d44eb44714e9fb44.weapon);
        attachments = getarenapickupattachmentoverrides(rootname + "_mp");
        var_d44eb44714e9fb44.weaponobj = namespace_e0ee43ef2dddadaa::buildweapon(rootname, attachments, camoname, reticleindex, variantid);
    }
    return var_d44eb44714e9fb44;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x87ce
// Size: 0x39
function getattachmentoverride(weapon) {
    rootname = getweaponrootname(weapon);
    attachments = getarenapickupattachmentoverrides(rootname + "_mp");
    return attachments[0];
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x880f
// Size: 0x652
function defineplayerloadout() {
    attachments = [];
    attachments[0] = "none";
    attachments[1] = "none";
    attachments[2] = "none";
    attachments[3] = "none";
    attachments[4] = "none";
    camoname = "none";
    reticleindex = "none";
    variantid = 0;
    var_f3464d71f01f614e = undefined;
    cosmeticattachment = undefined;
    stickers = [];
    stickers[0] = "none";
    stickers[1] = "none";
    stickers[2] = "none";
    stickers[3] = "none";
    stickers[4] = "none";
    perks = [0:"specialty_blastshield"];
    var_bb7a7034f796af47 = "none";
    var_79a42e6a2f51cf87 = "none";
    if (isdefined(level.startweapon.weapon) && level.startweapon.weapon != "none" && !issubstr(level.startweapon.weapon, "equip")) {
        primary = getweaponrootname(level.startweapon.weapon);
        if (ispickupblueprintloadouts()) {
            variantid = level.startweapon.variantid;
        }
        if (level.arenapickupattachments > 0) {
            attachments[0] = getattachmentoverride(level.startweapon.weapon);
        }
    } else {
        primary = "none";
        if (issubstr(level.startweapon.weapon, "equip")) {
            if (isthrowingknifeequipment(level.startweapon.weapon)) {
                perks[perks.size] = "specialty_extra_deadly";
                if (level.arenaknivesout) {
                    perks[perks.size] = "specialty_restock";
                    if (level.arenaknivesout == 2) {
                        primary = "iw9_knife";
                    }
                }
            }
            slot = namespace_1a507865f681850e::getdefaultslot(level.startweapon.weapon);
            if (slot == "primary") {
                var_bb7a7034f796af47 = level.startweapon.weapon;
            } else {
                var_79a42e6a2f51cf87 = level.startweapon.weapon;
            }
        }
    }
    if (level.allowsupers) {
        mapname = namespace_36f464722d326bbe::getmapname();
        if (issubstr(mapname, "mp_m_") && mapname != "mp_m_speed") {
            level.arenasuper = fixupsupersandtacticalsforgunfightmaps();
        }
    } else {
        level.arenasuper = "none";
        setomnvar("ui_disable_fieldupgrades", 1);
    }
    level.var_b128efae25ac7cc6["loadoutArchetype"] = "archetype_assault";
    level.var_b128efae25ac7cc6["loadoutPrimary"] = primary;
    level.var_b128efae25ac7cc6["loadoutPrimaryAttachment"] = attachments[0];
    level.var_b128efae25ac7cc6["loadoutPrimaryAttachment2"] = attachments[1];
    level.var_b128efae25ac7cc6["loadoutPrimaryAttachment3"] = attachments[2];
    level.var_b128efae25ac7cc6["loadoutPrimaryAttachment4"] = attachments[3];
    level.var_b128efae25ac7cc6["loadoutPrimaryAttachment5"] = attachments[4];
    level.var_b128efae25ac7cc6["loadoutPrimaryCamo"] = camoname;
    level.var_b128efae25ac7cc6["loadoutPrimaryCosmeticAttachment"] = cosmeticattachment;
    level.var_b128efae25ac7cc6["loadoutPrimaryReticle"] = reticleindex;
    level.var_b128efae25ac7cc6["loadoutPrimarySticker2"] = stickers[2];
    level.var_b128efae25ac7cc6["loadoutPrimarySticker"] = stickers[0];
    level.var_b128efae25ac7cc6["loadoutPrimarySticker1"] = stickers[1];
    level.var_b128efae25ac7cc6["loadoutPrimarySticker3"] = stickers[3];
    level.var_b128efae25ac7cc6["loadoutPrimarySticker4"] = stickers[4];
    level.var_b128efae25ac7cc6["loadoutPrimaryVariantID"] = variantid;
    level.var_b128efae25ac7cc6["loadoutSecondary"] = "none";
    level.var_b128efae25ac7cc6["loadoutSecondaryAttachment"] = "none";
    level.var_b128efae25ac7cc6["loadoutSecondaryAttachment2"] = "none";
    level.var_b128efae25ac7cc6["loadoutSecondaryAttachment3"] = "none";
    level.var_b128efae25ac7cc6["loadoutSecondaryAttachment4"] = "none";
    level.var_b128efae25ac7cc6["loadoutSecondaryAttachment5"] = "none";
    level.var_b128efae25ac7cc6["loadoutSecondaryCamo"] = "none";
    level.var_b128efae25ac7cc6["loadoutSecondaryReticle"] = "none";
    level.var_b128efae25ac7cc6["loadoutSecondarySticker"] = "none";
    level.var_b128efae25ac7cc6["loadoutSecondarySticker1"] = "none";
    level.var_b128efae25ac7cc6["loadoutSecondarySticker2"] = "none";
    level.var_b128efae25ac7cc6["loadoutSecondarySticker3"] = "none";
    level.var_b128efae25ac7cc6["loadoutSecondarySticker4"] = "none";
    level.var_b128efae25ac7cc6["loadoutSecondaryVariantID"] = -1;
    level.var_b128efae25ac7cc6["loadoutMeleeSlot"] = "none";
    level.var_b128efae25ac7cc6["loadoutEquipmentPrimary"] = var_bb7a7034f796af47;
    level.var_b128efae25ac7cc6["loadoutEquipmentSecondary"] = var_79a42e6a2f51cf87;
    level.var_b128efae25ac7cc6["loadoutStreakType"] = "assault";
    level.var_b128efae25ac7cc6["loadoutKillstreak1"] = "none";
    level.var_b128efae25ac7cc6["loadoutKillstreak2"] = "none";
    level.var_b128efae25ac7cc6["loadoutKillstreak3"] = "none";
    level.var_b128efae25ac7cc6["loadoutSuper"] = "none";
    level.var_b128efae25ac7cc6["loadoutFieldUpgrade1"] = level.arenasuper;
    level.var_b128efae25ac7cc6["loadoutFieldUpgrade2"] = "none";
    level.var_b128efae25ac7cc6["loadoutPerks"] = perks;
    level.var_b128efae25ac7cc6["loadoutGesture"] = "playerData";
    level.var_b128efae25ac7cc6["loadoutExecution"] = "playerData";
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e68
// Size: 0x94e
function function_3dd5b16653c57b45(teamname) {
    camoname = "none";
    if (!isdefined(teamname) || teamname != "allies" && teamname != "axis") {
        return camoname;
    }
    camos = [0:"camo_a_01", 1:"camo_b_01", 2:"camo_c_01", 3:"camo_d_01", 4:"camo_e_01", 5:"camo_f_01", 6:"camo_g_01", 7:"camo_h_01", 8:"camo_i_01", 9:"camo_j_01", 10:"camo_k_01", 11:"camo_l_01", 12:"camo_m_01", 13:"camo_n_01", 14:"camo_o_01", 15:"camo_p_01", 16:"camo_r_01", 17:"camo_comp_01", 18:"camo_a_02", 19:"camo_b_02", 20:"camo_c_02", 21:"camo_d_02", 22:"camo_e_02", 23:"camo_f_02", 24:"camo_g_02", 25:"camo_h_02", 26:"camo_i_02", 27:"camo_j_02", 28:"camo_k_02", 29:"camo_l_02", 30:"camo_m_02", 31:"camo_n_02", 32:"camo_o_02", 33:"camo_p_02", 34:"camo_r_02", 35:"camo_comp_02", 36:"camo_a_03", 37:"camo_b_03", 38:"camo_c_03", 39:"camo_d_03", 40:"camo_e_03", 41:"camo_f_03", 42:"camo_g_03", 43:"camo_h_03", 44:"camo_i_03", 45:"camo_j_03", 46:"camo_k_03", 47:"camo_l_03", 48:"camo_m_03", 49:"camo_n_03", 50:"camo_o_03", 51:"camo_p_03", 52:"camo_comp_03", 53:"camo_a_04", 54:"camo_b_04", 55:"camo_c_04", 56:"camo_d_04", 57:"camo_e_04", 58:"camo_f_04", 59:"camo_g_04", 60:"camo_h_04", 61:"camo_i_04", 62:"camo_j_04", 63:"camo_k_04", 64:"camo_l_04", 65:"camo_m_04", 66:"camo_n_04", 67:"camo_o_04", 68:"camo_p_04", 69:"camo_comp_04", 70:"camo_a_05", 71:"camo_b_05", 72:"camo_c_05", 73:"camo_d_05", 74:"camo_e_05", 75:"camo_f_05", 76:"camo_g_05", 77:"camo_h_05", 78:"camo_i_05", 79:"camo_j_05", 80:"camo_k_05", 81:"camo_l_05", 82:"camo_m_05", 83:"camo_n_05", 84:"camo_o_05", 85:"camo_p_05", 86:"camo_a_06", 87:"camo_b_06", 88:"camo_c_06", 89:"camo_d_06", 90:"camo_e_06", 91:"camo_f_06", 92:"camo_g_06", 93:"camo_h_06", 94:"camo_i_06", 95:"camo_j_06", 96:"camo_k_06", 97:"camo_l_06", 98:"camo_m_06", 99:"camo_n_06", 100:"camo_o_06", 101:"camo_p_06", 102:"camo_a_07", 103:"camo_b_07", 104:"camo_c_07", 105:"camo_d_07", 106:"camo_e_07", 107:"camo_f_07", 108:"camo_g_07", 109:"camo_h_07", 110:"camo_i_07", 111:"camo_j_07", 112:"camo_k_07", 113:"camo_l_07", 114:"camo_m_07", 115:"camo_n_07", 116:"camo_o_07", 117:"camo_p_07", 118:"camo_a_08", 119:"camo_b_08", 120:"camo_c_08", 121:"camo_d_08", 122:"camo_e_08", 123:"camo_f_08", 124:"camo_g_08", 125:"camo_h_08", 126:"camo_i_08", 127:"camo_j_08", 128:"camo_k_08", 129:"camo_l_08", 130:"camo_m_08", 131:"camo_n_08", 132:"camo_o_08", 133:"camo_p_08", 134:"camo_a_09", 135:"camo_b_09", 136:"camo_c_09", 137:"camo_d_09", 138:"camo_e_09", 139:"camo_f_09", 140:"camo_g_09", 141:"camo_h_09", 142:"camo_i_09", 143:"camo_j_09", 144:"camo_k_09", 145:"camo_l_09", 146:"camo_m_09", 147:"camo_n_09", 148:"camo_o_09", 149:"camo_a_10", 150:"camo_b_10", 151:"camo_c_10", 152:"camo_d_10", 153:"camo_e_10", 154:"camo_f_10", 155:"camo_g_10", 156:"camo_h_10", 157:"camo_i_10", 158:"camo_j_10", 159:"camo_k_10", 160:"camo_l_10", 161:"camo_m_10", 162:"camo_n_10", 163:"camo_o_10", 164:"camo_a_11", 165:"camo_b_11", 166:"camo_c_11", 167:"camo_d_11", 168:"camo_e_11", 169:"camo_f_11", 170:"camo_g_11", 171:"camo_h_11", 172:"camo_i_11", 173:"camo_j_11", 174:"camo_k_11", 175:"camo_l_11", 176:"camo_m_11", 177:"camo_n_11", 178:"camo_o_11", 179:"camo_a_12", 180:"camo_b_12", 181:"camo_c_12", 182:"camo_d_12", 183:"camo_e_12", 184:"camo_f_12", 185:"camo_g_12", 186:"camo_h_12", 187:"camo_i_12", 188:"camo_j_12", 189:"camo_k_12", 190:"camo_l_12", 191:"camo_m_12", 192:"camo_n_12", 193:"camo_o_12", 194:"camo_a_13", 195:"camo_b_13", 196:"camo_c_13", 197:"camo_d_13", 198:"camo_e_13", 199:"camo_f_13", 200:"camo_g_13", 201:"camo_h_13", 202:"camo_i_13", 203:"camo_j_13", 204:"camo_k_13", 205:"camo_l_13", 206:"camo_m_13", 207:"camo_n_13", 208:"camo_o_13", 209:"camo_a_14", 210:"camo_b_14", 211:"camo_c_14", 212:"camo_d_14", 213:"camo_e_14", 214:"camo_f_14", 215:"camo_g_14", 216:"camo_h_14", 217:"camo_i_14", 218:"camo_j_14", 219:"camo_k_14", 220:"camo_l_14", 221:"camo_m_14", 222:"camo_n_14", 223:"camo_o_14", 224:"camo_a_15", 225:"camo_b_15", 226:"camo_c_15", 227:"camo_d_15", 228:"camo_e_15", 229:"camo_f_15", 230:"camo_g_15", 231:"camo_h_15", 232:"camo_i_15", 233:"camo_j_15", 234:"camo_k_15", 235:"camo_l_15", 236:"camo_m_15", 237:"camo_n_15"];
    if (game["roundWinStreak"][teamname] > 5) {
        camoname = "camo_comp_04";
    } else {
        switch (game["roundWinStreak"][teamname]) {
        case 1:
            camoname = random(camos);
            break;
        case 2:
            camoname = "camo_comp_01";
            break;
        case 3:
            camoname = "camo_comp_02";
            break;
        case 4:
            camoname = "camo_comp_03";
            break;
        case 5:
            camoname = "camo_comp_04";
            break;
        default:
            break;
        }
    }
    return camoname;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x97be
// Size: 0x11b
function updaterandomloadout() {
    if (namespace_47e715c4f9510479::israndomloadouts()) {
        /#
            if (getdvarint(@"hash_b665ceb14dabc0ed", -1) != -1) {
                game["loadoutPrimaryVariantID"] = array_randomize(game["loadoutKillstreak2"]);
                game["camo_f_01"] = 0;
                return;
            }
        #/
        if (game["roundsPlayed"] == 0) {
            if (istrue(game["practiceRound"])) {
                game["arenaRandomLoadout"] = array_randomize(game["arenaLoadouts"]);
                game["arenaRandomLoadoutIndex"] = 0;
            } else if (!isdefined(game["practiceRound"]) || istrue(game["didSnowFight"])) {
                if (istrue(game["didSnowFight"])) {
                    game["didSnowFight"] = undefined;
                }
                game["arenaRandomLoadout"] = array_randomize(game["arenaLoadouts"]);
                game["arenaRandomLoadoutIndex"] = 0;
            }
        } else if (level.loadoutchangeround != 0) {
            if (game["roundsPlayed"] % level.loadoutchangeround == 0) {
                game["arenaRandomLoadoutIndex"]++;
            }
            if (game["arenaRandomLoadoutIndex"] == game["arenaRandomLoadout"].size) {
                game["arenaRandomLoadoutIndex"] = 0;
            }
        } else {
            game["arenaRandomLoadoutIndex"] = 0;
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x98e0
// Size: 0x2e9
function function_3187496929140714(var_6caf1a8ca6008020, var_171342d97570f634, var_a049f07e0f11dc31) {
    var_57c2fbe37e0787ea = [];
    var_fddb8d504937a284 = ter_op(isdefined(var_6caf1a8ca6008020), var_6caf1a8ca6008020, []);
    var_7bb993caf9f54322 = ter_op(isdefined(var_171342d97570f634), var_171342d97570f634, []);
    var_61726fd00a4b456b = ter_op(isdefined(var_a049f07e0f11dc31), var_a049f07e0f11dc31, []);
    if (var_fddb8d504937a284.size == 0) {
        if (israndomblueprintsloadouts()) {
            var_fddb8d504937a284[var_fddb8d504937a284.size] = "arena_blueprints_class_table";
        } else if (namespace_36f464722d326bbe::function_2536e99eb6586f8f()) {
            var_fddb8d504937a284[var_fddb8d504937a284.size] = "arena_infect_class_table";
        } else {
            var_fddb8d504937a284[var_fddb8d504937a284.size] = "arena_class_table";
        }
    }
    if (var_7bb993caf9f54322.size == 0) {
        var_d63e7120d2b583fe = !israndomarloadouts() && !israndomsmgloadouts() && !israndomlmgloadouts() && !israndompistolloadouts() && !israndomshotgunloadouts() && !israndomsniperloadouts();
        if (var_d63e7120d2b583fe || israndomarloadouts()) {
            var_7bb993caf9f54322[var_7bb993caf9f54322.size] = "ar";
        }
        if (var_d63e7120d2b583fe || israndomsmgloadouts()) {
            var_7bb993caf9f54322[var_7bb993caf9f54322.size] = "smg";
        }
        if (var_d63e7120d2b583fe || israndomlmgloadouts()) {
            var_7bb993caf9f54322[var_7bb993caf9f54322.size] = "lmg";
        }
        if (var_d63e7120d2b583fe || israndompistolloadouts()) {
            var_7bb993caf9f54322[var_7bb993caf9f54322.size] = "pistol";
        }
        if (var_d63e7120d2b583fe || israndomshotgunloadouts()) {
            var_7bb993caf9f54322[var_7bb993caf9f54322.size] = "shotgun";
        }
        if (var_d63e7120d2b583fe || israndomsniperloadouts()) {
            var_7bb993caf9f54322[var_7bb993caf9f54322.size] = "sniper";
        }
    }
    if (var_61726fd00a4b456b.size == 0) {
        var_61726fd00a4b456b[var_61726fd00a4b456b.size] = "iw9_mp";
    }
    foreach (loadouttype in var_fddb8d504937a284) {
        foreach (weapontype in var_7bb993caf9f54322) {
            foreach (project in var_61726fd00a4b456b) {
                classtablename = namespace_3c37cb17ade254d::function_996b01cd49d0128d([0:loadouttype, 1:weapontype, 2:project], "_");
                classtablename = namespace_3c37cb17ade254d::function_996b01cd49d0128d([0:"classtable", 1:classtablename], ":");
                var_6ab15b7ea89d055d = getscriptbundle(classtablename);
                var_57c2fbe37e0787ea[var_57c2fbe37e0787ea.size] = var_6ab15b7ea89d055d;
                /#
                    assertex(isdefined(var_6ab15b7ea89d055d), "getClassTables: Failed to find script bundle for arena loadouts.");
                #/
            }
        }
    }
    return var_57c2fbe37e0787ea;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9bd1
// Size: 0x17e
function function_443c6629449aa6ed() {
    var_57c2fbe37e0787ea = [];
    var_d63e7120d2b583fe = isnormalloadouts() || israndomloadouts();
    var_7bb993caf9f54322[#"ar"] = israndomarloadouts();
    var_7bb993caf9f54322[#"smg"] = israndomsmgloadouts();
    var_7bb993caf9f54322[#"lmg"] = israndomlmgloadouts();
    var_7bb993caf9f54322[#"pistol"] = israndompistolloadouts();
    var_7bb993caf9f54322[#"shotgun"] = israndomshotgunloadouts();
    var_7bb993caf9f54322[#"sniper"] = israndomsniperloadouts();
    var_26df59236cef45ce = level.var_62f6f7640e4431e3.var_23180664a9429bdb;
    foreach (var_1c45a17241516ae1 in var_26df59236cef45ce) {
        if (!isdefined(var_1c45a17241516ae1.bundle)) {
            continue;
        }
        if (!istrue(var_7bb993caf9f54322[var_1c45a17241516ae1.weapon_type]) && !istrue(var_d63e7120d2b583fe)) {
            continue;
        }
        var_e84f572e5ccd786f = function_2ef675c13ca1c4af(%"classtable:", var_1c45a17241516ae1.bundle);
        var_6ab15b7ea89d055d = getscriptbundle(var_e84f572e5ccd786f);
        /#
            assertex(isdefined(var_6ab15b7ea89d055d), "getClassTables: Failed to find script bundle for arena loadouts.");
        #/
        var_57c2fbe37e0787ea[var_57c2fbe37e0787ea.size] = var_6ab15b7ea89d055d;
    }
    return var_57c2fbe37e0787ea;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9d57
// Size: 0x59d
function function_37f8be8199814f97(var_b45e94b269ae0a46) {
    var_51dd516e025fd78 = getscriptbundle("classtableentry:" + var_b45e94b269ae0a46.entry);
    loadout = [];
    loadout["loadoutPrimary"] = var_51dd516e025fd78.primaryweapon.weapon;
    loadout["loadoutPrimaryAttachment"] = ter_op(!israndomnoattachmentloadouts(), var_51dd516e025fd78.primaryweapon.attachment1, "none");
    loadout["loadoutPrimaryAttachment1"] = ter_op(!israndomnoattachmentloadouts(), var_51dd516e025fd78.primaryweapon.attachment2, "none");
    loadout["loadoutPrimaryAttachment2"] = ter_op(!israndomnoattachmentloadouts(), var_51dd516e025fd78.primaryweapon.attachment3, "none");
    loadout["loadoutPrimaryAttachment3"] = ter_op(!israndomnoattachmentloadouts(), var_51dd516e025fd78.primaryweapon.attachment4, "none");
    loadout["loadoutPrimaryAttachment4"] = ter_op(!israndomnoattachmentloadouts(), var_51dd516e025fd78.primaryweapon.attachment5, "none");
    loadout["loadoutPrimaryAttachment5"] = ter_op(!israndomnoattachmentloadouts(), var_51dd516e025fd78.primaryweapon.attachment6, "none");
    loadout["loadoutPrimaryCamo"] = var_51dd516e025fd78.primaryweapon.camo;
    loadout["loadoutPrimaryReticle"] = var_51dd516e025fd78.primaryweapon.reticle;
    loadout["loadoutPrimaryVariantID"] = ter_op(israndomblueprintsloadouts() || israndomcustomblueprintsloadouts(), var_51dd516e025fd78.primaryweapon.variantid, 0);
    loadout["loadoutPrimaryAddBlueprintAttachments"] = var_51dd516e025fd78.primaryweapon.var_8886d83d8d183347;
    loadout["loadoutSecondary"] = var_51dd516e025fd78.secondaryweapon.weapon;
    loadout["loadoutSecondaryAttachment"] = ter_op(!israndomnoattachmentloadouts(), var_51dd516e025fd78.secondaryweapon.attachment1, "none");
    loadout["loadoutSecondaryAttachment1"] = ter_op(!israndomnoattachmentloadouts(), var_51dd516e025fd78.secondaryweapon.attachment2, "none");
    loadout["loadoutSecondaryAttachment2"] = ter_op(!israndomnoattachmentloadouts(), var_51dd516e025fd78.secondaryweapon.attachment3, "none");
    loadout["loadoutSecondaryAttachment3"] = ter_op(!israndomnoattachmentloadouts(), var_51dd516e025fd78.secondaryweapon.attachment4, "none");
    loadout["loadoutSecondaryAttachment4"] = ter_op(!israndomnoattachmentloadouts(), var_51dd516e025fd78.secondaryweapon.attachment5, "none");
    loadout["loadoutSecondaryCamo"] = var_51dd516e025fd78.secondaryweapon.camo;
    loadout["loadoutSecondaryReticle"] = var_51dd516e025fd78.secondaryweapon.reticle;
    loadout["loadoutSecondaryVariantID"] = ter_op(israndomblueprintsloadouts() || israndomcustomblueprintsloadouts(), var_51dd516e025fd78.primaryweapon.variantid, 0);
    loadout["loadoutSecondaryAddBlueprintAttachments"] = var_51dd516e025fd78.secondaryweapon.var_8886d83d8d183347;
    loadout["loadoutEquipmentPrimary"] = var_51dd516e025fd78.equipment.primary;
    loadout["loadoutEquipmentSecondary"] = var_51dd516e025fd78.equipment.secondary;
    loadout["loadoutExtraEquipmentPrimary"] = var_51dd516e025fd78.var_ad6972268c86a2be.primary;
    loadout["loadoutExtraEquipmentSecondary"] = var_51dd516e025fd78.var_ad6972268c86a2be.secondary;
    if (level.allowsupers) {
        mapname = namespace_36f464722d326bbe::getmapname();
        if (issubstr(mapname, "mp_m_") && mapname != "mp_m_speed") {
            fixupsupersandtacticalsforgunfightmaps();
        }
    }
    loadout["loadoutFieldUpgrade1"] = level.arenasuper;
    loadout["loadoutFieldUpgrade2"] = "none";
    loadout["loadoutPerks"] = [];
    loadout["loadoutPerks"][0] = namespace_3c37cb17ade254d::ter_op(var_51dd516e025fd78.perks.perk1 != "specialty_null", var_51dd516e025fd78.perks.perk1, "none");
    loadout["loadoutPerks"][1] = namespace_3c37cb17ade254d::ter_op(var_51dd516e025fd78.perks.perk2 != "specialty_null", var_51dd516e025fd78.perks.perk2, "none");
    loadout["loadoutPerks"][2] = namespace_3c37cb17ade254d::ter_op(var_51dd516e025fd78.perks.perk3 != "specialty_null", var_51dd516e025fd78.perks.perk3, "none");
    loadout["loadoutGesture"] = "playerData";
    loadout["loadoutExecution"] = "playerData";
    if (getgametype() == "arena") {
        if (loadout["loadoutPrimaryVariantID"] != 0) {
            setomnvar("ui_arena_primaryVariantID", loadout["loadoutPrimaryVariantID"]);
        }
        if (loadout["loadoutSecondaryVariantID"] != 0) {
            setomnvar("ui_arena_secondaryVariantID", loadout["loadoutPrimaryVariantID"]);
        }
    }
    return loadout;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa2fc
// Size: 0x10b
function initweaponmap() {
    level.baseraritymap = [];
    level.baseraritymap[level.arenaweapont1.weapon] = 0;
    level.baseraritymap[level.arenaweapont2.weapon] = 1;
    level.baseraritymap[level.arenaweapont3.weapon] = 2;
    level.baseraritymap[level.arenaweapont4.weapon] = 3;
    level.baseraritymap[level.arenaweapont5.weapon] = 4;
    level.baseraritymap[level.arenaweapont6.weapon] = 5;
    level.baseraritymap[level.arenaweapont7.weapon] = 6;
    level.baseraritymap[level.arenaweapont8.weapon] = 0;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa40e
// Size: 0xce
function getblueprintforpickupweapon(weapon) {
    if (ispickupblueprintloadouts() && !issubstr(weapon, "equip") && weapon != "none") {
        table = "classtable:classtable_arena_blueprints";
        var_d6f262bbec7b0caa = 0;
        var_66a903fc1d9b6b64 = "";
        rootname = getweaponrootname(weapon);
        var_a300fa75277719ee = namespace_d19129e4fa5d176::function_df2933f96d726d71(table);
        while (var_d6f262bbec7b0caa < var_a300fa75277719ee) {
            var_66a903fc1d9b6b64 = namespace_d19129e4fa5d176::table_getweapon(table, var_d6f262bbec7b0caa, 0);
            if (rootname == var_66a903fc1d9b6b64) {
                break;
            }
            var_d6f262bbec7b0caa++;
        }
        if (rootname != "") {
            variantid = namespace_d19129e4fa5d176::table_getweaponvariantid("classtable:classtable_arena_blueprints", var_d6f262bbec7b0caa, 0, rootname);
            return variantid;
        }
        return 0;
    } else {
        return 0;
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa4e3
// Size: 0x23c
function setupweapons() {
    locs = getstructarray("weapon_pickup", "targetname");
    /#
        assertex(locs.size > 0, "Arena loadouts set to 'none' but weapon pickup spawn locations are not placed in the level!");
    #/
    if (level.arenapickupattachments != 0) {
        setupstartweaponsattachments();
    } else if (ispickupblueprintloadouts()) {
        setupblueprintpickupweapons();
    }
    foreach (loc in locs) {
        /#
            var_e3f267d17cfeb23 = getdvar(@"hash_e7ea6273ed7f950f", "camo_l_02");
            if (var_e3f267d17cfeb23 != "camo_l_02") {
                var_8f6a2537b224ce5a = spawnstruct();
                var_8f6a2537b224ce5a.weapon = var_e3f267d17cfeb23;
                var_8f6a2537b224ce5a.variantid = -1;
                spawnweapon(loc, var_8f6a2537b224ce5a);
                goto LOC_00000228;
            }
        #/
        if (loc.script_label == "1") {
            spawnweapon(loc, level.arenaweapont1);
        } else if (loc.script_label == "2") {
            spawnweapon(loc, level.arenaweapont2);
        } else if (loc.script_label == "3") {
            spawnweapon(loc, level.arenaweapont3);
        } else if (loc.script_label == "4") {
            spawnweapon(loc, level.arenaweapont4);
        } else if (loc.script_label == "5") {
            spawnweapon(loc, level.arenaweapont5);
        } else if (loc.script_label == "6") {
            spawnweapon(loc, level.arenaweapont6);
        } else if (loc.script_label == "7") {
            spawnweapon(loc, level.arenaweapont7);
        } else if (loc.script_label == "8") {
            spawnweapon(loc, level.arenaweapont8);
        LOC_00000228:
        }
    LOC_00000228:
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa726
// Size: 0xfb
function getrandomspawnweapon() {
    weaponlist = level.allweapons;
    if (isdefined(weaponlist) && weaponlist.size > 0) {
        newweapon = "";
        data = undefined;
        for (loopcount = 0; 1; loopcount++) {
            weapon = random(weaponlist);
            if (!issubstr(weapon, "equip")) {
                rootname = getweaponrootname(weapon);
            } else {
                rootname = weapon;
            }
            if (loopcount > weaponlist.size) {
                level.selectedweapons[rootname] = 1;
                newweapon = weapon;
                for (i = 0; i < level.allweapons.size; i++) {
                    if (level.allweapons[weapon] == newweapon) {
                        break;
                    }
                }
                break;
            }
        }
        return newweapon;
    } else {
        /#
            assertmsg("Unknown weapon list");
        #/
        return "none";
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa828
// Size: 0x62
function getarenapickupattachmentoverrides(weapon) {
    attachments = [];
    if (level.arenapickupattachments == 1) {
        if (weaponclass(weapon) == "sniper" || weaponclass(weapon) == "dmr") {
            attachments[attachments.size] = "scope";
        }
    }
    if (attachments.size == 0) {
        attachments[attachments.size] = "none";
    }
    return attachments;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa892
// Size: 0x632
function spawnweapon(loc, weaponstruct, var_5f3b26e2789a42c0) {
    if (isdefined(var_5f3b26e2789a42c0)) {
        var_63573dfb900dd221 = weaponstruct;
    } else {
        var_63573dfb900dd221 = weaponstruct.weapon;
    }
    if (var_63573dfb900dd221 == "none") {
        return;
    }
    loc = namespace_47e715c4f9510479::function_355f5b20c3c22114(loc);
    loc = namespace_47e715c4f9510479::function_c1d47107cd83fcaa(loc, var_63573dfb900dd221);
    if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "wall") {
        goto LOC_0000019a;
    }
    tracestart = loc.origin + (0, 0, 16);
    traceend = loc.origin + (0, 0, -16);
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, undefined, namespace_2a184fc4902783dc::create_default_contents(1));
    if (trace["fraction"] < 1) {
        var_1f9238ce81ea0d85 = trace["position"] + (0, 0, 2);
    LOC_0000019a:
    }
LOC_0000019a:
    var_9b83efba8bfecc3f = namespace_47e715c4f9510479::function_5a0a68144c7a97fd(var_63573dfb900dd221);
    if (isdefined(var_9b83efba8bfecc3f)) {
        if (istrue(level.snowballfight)) {
            var_ab5f95ba81a1a976 = "pyramid";
            if (!isplayer(loc)) {
                switch (loc.script_label) {
                case #"hash_66c094dee1aed032":
                    level.pickedpball = 1;
                    var_63573dfb900dd221 = "equip_pball";
                    var_ab5f95ba81a1a976 = "pball";
                    break;
                default:
                    var_ab5f95ba81a1a976 = "pyramid";
                    break;
                }
            }
            var_9b83efba8bfecc3f = namespace_47e715c4f9510479::function_5a0a68144c7a97fd(var_63573dfb900dd221);
            if (!isdefined(var_1f9238ce81ea0d85)) {
                var_1f9238ce81ea0d85 = loc.origin;
            } else {
                var_1f9238ce81ea0d85 = var_1f9238ce81ea0d85 + (0, 0, -1);
            }
            equipment = spawn("script_model", var_1f9238ce81ea0d85);
            equipment setmodel(var_9b83efba8bfecc3f.worldmodel);
            /#
                if (is_equal(var_63573dfb900dd221, "camo_m_02")) {
                    level thread function_a9b5870805221f3d(equipment);
                }
            #/
        } else {
            equipment = spawn("script_model", loc.origin);
            equipment setmodel(var_9b83efba8bfecc3f.worldmodel);
        }
        userange = 96;
        var_4afe4f5482b5a827 = 96;
        /#
            if (getdvarint(@"hash_16a5fe0ac78e7780", 0) == 1) {
                var_4afe4f5482b5a827 = 128;
            }
        #/
        var_36e496cdbc979837 = equipment getequipmenthinticon(var_63573dfb900dd221);
        equipment.equipment = var_63573dfb900dd221;
        equipment.equiptype = var_9b83efba8bfecc3f.equiptype;
        equipment.angles = loc.angles;
        if (istrue(level.snowballfight) && isdefined(var_ab5f95ba81a1a976) && var_ab5f95ba81a1a976 == "pyramid") {
            goto LOC_0000036b;
        }
        equipment.angles = equipment.angles + (0, 0, 90);
    LOC_0000036b:
        equipment makeusable();
        equipment sethinttag("tag_origin");
        equipment setcursorhint("HINT_BUTTON");
        equipment sethinticon(var_9b83efba8bfecc3f.icon);
        equipment setuseholdduration("duration_short");
        equipment setusehideprogressbar(1);
        equipment sethintstring(var_9b83efba8bfecc3f.pickupstring);
        equipment setusepriority(0);
        equipment sethintdisplayrange(var_4afe4f5482b5a827);
        equipment sethintdisplayfov(120);
        equipment setuserange(userange);
        equipment setusefov(210);
        equipment sethintonobstruction("hide");
        equipment thread outlineequipmentwatchplayerprox(var_63573dfb900dd221);
        equipment.proxtrigger = spawn("trigger_radius", equipment.origin, 0, 32, 32);
        if (istrue(level.snowballfight) && isdefined(var_ab5f95ba81a1a976)) {
            equipment thread watchsnowballpickup(loc, var_ab5f95ba81a1a976);
        } else {
            equipment thread itemproxtriggerthink();
            equipment thread watchequipmentpickup();
        }
        equipment.targetname = "dropped_equipment";
    } else {
        if (ispickupblueprintloadouts()) {
            objweapon = weaponstruct.weaponobj;
        } else {
            rootname = getweaponrootname(var_63573dfb900dd221);
            attachments = getarenapickupattachmentoverrides(rootname + "_mp");
            objweapon = namespace_e0ee43ef2dddadaa::buildweapon(rootname, attachments, "none", "none", -1);
        }
        weaponname = getcompleteweaponname(objweapon);
        weapon = spawn("weapon_" + weaponname, loc.origin, 17);
        weapon.targetname = "dropped_weapon";
        weapon.objweapon = objweapon;
        weapon.angles = loc.angles;
        weapon sethintdisplayrange(96);
        weapon setuserange(96);
        weapon setuseholdduration("duration_short");
        weapon setusefov(210);
        if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "wall") {
            forward = anglestoright(loc.angles);
            delta = vectornormalize(forward) * 30;
            tracestart = loc.origin + delta + (0, 0, 16);
            traceend = loc.origin + delta + (0, 0, -100);
            trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, undefined, namespace_2a184fc4902783dc::create_default_contents(1));
            tracepos = loc.origin;
            if (trace["fraction"] < 1) {
                tracepos = trace["position"];
            }
            weapon.bot_pickup_origin = tracepos;
        }
        manageweaponstartingammo(weapon, weaponname);
        weapon thread outlinewatchplayerprox();
        weapon thread watchpickup();
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaecb
// Size: 0x66
function function_a9b5870805221f3d(model) {
    /#
        model endon("camo_g_03");
        while (!isdefined(level.player)) {
            waitframe();
        }
        while (1) {
            line(model.origin, level.player.origin, (1, 1, 1), 1, 0, 1);
            waitframe();
        }
    #/
}

// Namespace arena/namespace_47e715c4f9510479
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xaf38
// Size: 0x54e
function private function_c1d47107cd83fcaa(loc, weaponname) {
    /#
        assert(isdefined(loc));
    #/
    /#
        assert(isdefined(weaponname) && weaponname != "");
    #/
    switch (weaponname) {
    case #"hash_25ac81b822cf0c9f":
        if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "wall" || isdefined(loc.var_3770f35956a8212c) && loc.var_3770f35956a8212c == "wall") {
            loc.angles = loc.angles + (0, 90, 0);
        } else {
            loc.angles = loc.angles + (90, 0, 0);
        }
        break;
    case #"hash_3995658e01f4fac1":
        if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "wall" || isdefined(loc.var_3770f35956a8212c) && loc.var_3770f35956a8212c == "wall") {
            loc.angles = loc.angles + (270, 0, 0);
        } else {
            loc.angles = loc.angles + (0, 0, 90);
        }
        break;
    case #"hash_4320d77f90725183":
        if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "wall" || isdefined(loc.var_3770f35956a8212c) && loc.var_3770f35956a8212c == "wall") {
            loc.angles = loc.angles + (0, 90, 0);
        } else {
            loc.angles = loc.angles + (180, 180, 0);
        }
        break;
    case #"hash_2354208d9af64220":
        if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "wall" || isdefined(loc.var_3770f35956a8212c) && loc.var_3770f35956a8212c == "wall") {
            loc.angles = loc.angles + (0, 180, 0);
        } else {
            loc.angles = loc.angles + (0, 0, 90);
        }
        break;
    case #"hash_4b4a6458f00d9319":
        if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "wall" || isdefined(loc.var_3770f35956a8212c) && loc.var_3770f35956a8212c == "wall") {
            loc.angles = loc.angles + (270, 270, 0);
        } else {
            loc.angles = loc.angles + (0, 0, 90);
        }
        break;
    case #"hash_9ba0a6ff6081954e":
        if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "wall" || isdefined(loc.var_3770f35956a8212c) && loc.var_3770f35956a8212c == "wall") {
            loc.angles = loc.angles + (0, 90, 0);
        }
        break;
    case #"hash_8d9ae5e5dd390b4b":
        if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "wall" || isdefined(loc.var_3770f35956a8212c) && loc.var_3770f35956a8212c == "wall") {
            loc.angles = loc.angles + (0, 0, 90);
        } else {
            loc.angles = loc.angles + (0, 0, 90);
        }
        break;
    case #"hash_f85c7f2de2371beb":
        if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "wall" || isdefined(loc.var_3770f35956a8212c) && loc.var_3770f35956a8212c == "wall") {
            loc.angles = loc.angles + (0, -90, 0);
        } else {
            loc.angles = loc.angles + (-90, 0, 0);
        }
        break;
    default:
        break;
    }
    return loc;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xb48e
// Size: 0x6ee
function private function_355f5b20c3c22114(loc) {
    /#
        assert(isdefined(loc));
    #/
    switch (level.mapname) {
    case #"hash_564958ec86b5937":
        if (loc.script_label == "1") {
            if (distance(loc.origin, (-11, -889, 32)) < 10) {
                loc.origin = loc.origin + (15, 0, 0);
            } else if (distance(loc.origin, (125, 1158, 49)) < 10) {
                loc.origin = loc.origin + (7, 0, 0);
            } else if (distance(loc.origin, (-181, 1159, 34)) < 10) {
                loc.origin = loc.origin + (7, 0, 0);
            } else if (distance(loc.origin, (545, 379, 53)) < 10) {
                loc.origin = loc.origin + (0, -0.5, 0);
            }
        } else if (loc.script_label == "2") {
            if (distance(loc.origin, (-412, -618, 52)) < 10) {
                loc.origin = loc.origin + (-10, 0, 1);
            }
        } else if (loc.script_label == "6" && distance(loc.origin, (-313.261, 486, 54.9829)) < 10) {
            loc.origin = loc.origin + (0, 0, -1);
        } else if (loc.script_label == "7") {
            if (distance(loc.origin, (-47, -637, 48)) < 10) {
                loc.angles = loc.angles + (0, 180, 0);
            } else if (distance(loc.origin, (112, -516, 63)) < 10) {
                loc.angles = loc.angles + (0, 90, 0);
            } else if (distance(loc.origin, (-89, -371, 56)) < 10) {
                loc.origin = loc.origin + (0, 0, -1);
            }
        } else if (loc.script_label == "8" && distance(loc.origin, (328, -1078, 52)) < 10) {
            loc.angles = loc.angles + (0, 270, 0);
        }
        break;
    case #"hash_61f7356a42e47c76":
        if (loc.script_label == "6") {
            if (distance(loc.origin, (-256, -1152, -62)) < 10) {
                loc.origin = loc.origin + (0, 0, -2);
            } else if (distance(loc.origin, (128, 128, -62)) < 10) {
                loc.origin = loc.origin + (0, 0, -2);
            }
        }
        break;
    case #"hash_f7a3e0a896bc04b":
        if (loc.script_label == "1") {
            if (distance(loc.origin, (-72, -737, -141.5)) < 10) {
                loc.origin = loc.origin + (10, 0, 1);
            } else if (distance(loc.origin, (-49, -715, -141.5)) < 10) {
                loc.origin = loc.origin + (-15, -5, 1);
            } else if (distance(loc.origin, (-894, 273, -141.5)) < 10) {
                loc.origin = loc.origin + (15, -25, -1);
            } else if (distance(loc.origin, (-911, 243, -141.5)) < 10) {
                loc.origin = loc.origin + (30, -20, -1);
            }
        } else if (loc.script_label == "6") {
            if (distance(loc.origin, (-223.5, -588, -145)) < 10) {
                loc.origin = loc.origin + (0, 0, 2);
            } else if (distance(loc.origin, (-606.5, 156, -145)) < 10) {
                loc.origin = loc.origin + (3, -25, -1);
            }
        } else if (loc.script_label == "7") {
            if (distance(loc.origin, (-229.5, 152, -145)) < 10) {
                loc.origin = loc.origin + (0, -5, -1);
            } else if (distance(loc.origin, (-740.5, -561, -147)) < 10) {
                loc.origin = loc.origin + (0, 0, 1);
            }
        }
        break;
    default:
        break;
    }
    return loc;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbb84
// Size: 0x32
function getequipmenthinticon(weapon) {
    table = "mp/arenaGGWeapons.csv";
    icon = tablelookup(table, 0, weapon, 3);
    return icon;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbbbe
// Size: 0xa1
function manageweaponstartingammo(weapon, weaponname) {
    mag = weaponclipsize(weaponname);
    var_6f592a5fb739460 = 0;
    if (level.magcount != 3) {
        var_640c8b74fc979400 = !level.magcount;
        if (var_640c8b74fc979400) {
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

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc66
// Size: 0x13c
function watchequipmentpickup() {
    self endon("death");
    droppeditem = player = self waittill("trigger");
    hasmaxammo = 0;
    var_f23035e6f6b69f91 = checkissameequip(player);
    var_c89f07da007ff0d = checkpickupequiptypeammocount(player);
    var_8b9ab3abae98d973 = player namespace_1a507865f681850e::getequipmentmaxammo(self.equipment);
    var_b64209459da65860 = checkcurrentequiptypeammocount(player);
    if (var_f23035e6f6b69f91) {
        if (var_c89f07da007ff0d == var_8b9ab3abae98d973) {
            hasmaxammo = 1;
        }
    }
    if (var_f23035e6f6b69f91 && !hasmaxammo) {
        player namespace_1a507865f681850e::incrementequipmentammo(self.equipment, 1);
    } else if (var_b64209459da65860 && !var_f23035e6f6b69f91) {
        player dropoldequipinplace(player namespace_1a507865f681850e::getcurrentequipment(self.equiptype));
    }
    if (!var_f23035e6f6b69f91) {
        player namespace_1a507865f681850e::giveequipment(self.equipment, self.equiptype);
    }
    if (var_f23035e6f6b69f91 && hasmaxammo) {
        player iprintlnbold("MP_INGAME_ONLY/EQUIPMENT_MAXED");
        thread watchequipmentpickup();
    } else {
        player playlocalsound("scavenger_pack_pickup");
        clearweaponoutlines();
        self makeunusable();
        self delete();
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbda9
// Size: 0x1c
function checkpickupequiptypeammocount(player) {
    return player namespace_1a507865f681850e::getequipmentammo(self.equipment);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbdcd
// Size: 0x3a
function checkcurrentequiptypeammocount(player) {
    var_1189bd7fbe2861f8 = player namespace_1a507865f681850e::getcurrentequipment(self.equiptype);
    if (isdefined(var_1189bd7fbe2861f8)) {
        return player namespace_1a507865f681850e::getequipmentammo(var_1189bd7fbe2861f8);
    } else {
        return 0;
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbe0e
// Size: 0x3d
function checkissameequip(player) {
    var_1189bd7fbe2861f8 = player namespace_1a507865f681850e::getcurrentequipment(self.equiptype);
    if (isdefined(var_1189bd7fbe2861f8)) {
        return (self.equipment == var_1189bd7fbe2861f8);
    } else {
        return 0;
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbe52
// Size: 0x17
function dropoldequipinplace(equipment) {
    spawnweapon(self, equipment, 1);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe70
// Size: 0x64
function watchpickup() {
    self endon("death");
    droppeditem = player = self waittill("trigger");
    clearweaponoutlines();
    if (isdefined(droppeditem)) {
        droppeditem sethintdisplayrange(96);
        droppeditem setuserange(96);
        droppeditem setuseholdduration("duration_short");
        droppeditem thread outlinewatchplayerprox();
        droppeditem thread watchpickup();
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbedb
// Size: 0x1c8
function itemproxtriggerthink() {
    level endon("game_ended");
    self endon("deleted");
    self endon("death");
    var_1189bd7fbe2861f8 = undefined;
    while (1) {
        wait(0.05);
        player = self.proxtrigger waittill("trigger");
        if (!isreallyalive(player)) {
            continue;
        }
        if (istrue(player.inlaststand)) {
            continue;
        }
        if (!isdefined(player.initialized_gameobject_vars)) {
            continue;
        }
        if (!namespace_19b4203b51d56488::proxtriggerlos(player)) {
            continue;
        }
        var_1189bd7fbe2861f8 = player namespace_1a507865f681850e::getcurrentequipment(self.equiptype);
        hasmaxammo = 0;
        var_f23035e6f6b69f91 = checkissameequip(player);
        var_b64209459da65860 = checkcurrentequiptypeammocount(player);
        var_1189bd7fbe2861f8 = player namespace_1a507865f681850e::getcurrentequipment(self.equiptype);
        if (isdefined(var_1189bd7fbe2861f8) && !var_f23035e6f6b69f91 && var_b64209459da65860 > 0) {
            continue;
        }
        var_c89f07da007ff0d = checkpickupequiptypeammocount(player);
        var_8b9ab3abae98d973 = player namespace_1a507865f681850e::getequipmentmaxammo(self.equipment);
        if (var_f23035e6f6b69f91) {
            if (var_c89f07da007ff0d == var_8b9ab3abae98d973) {
                hasmaxammo = 1;
            }
        }
        if (var_f23035e6f6b69f91 && !hasmaxammo) {
            player namespace_1a507865f681850e::incrementequipmentammo(self.equipment, 1);
        }
        if (var_f23035e6f6b69f91 && hasmaxammo) {
            continue;
        }
        if (!isdefined(var_1189bd7fbe2861f8) || isdefined(var_1189bd7fbe2861f8) && !var_f23035e6f6b69f91 && var_b64209459da65860 == 0) {
            player namespace_1a507865f681850e::giveequipment(self.equipment, self.equiptype);
        }
        if (istrue(level.snowballfight)) {
            player playlocalsound("weap_snowball_pickup");
        } else {
            player playlocalsound("scavenger_pack_pickup");
        }
        clearweaponoutlines();
        self makeunusable();
        self delete();
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc0aa
// Size: 0x29
function updatearenagungameloadout(var_2429cf7c00ac6e67) {
    if (game["roundsPlayed"] == 0) {
        cachearenagungameloadouts(var_2429cf7c00ac6e67);
        game["arenaRandomLoadoutIndex"] = 0;
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc0da
// Size: 0x10a
function cachearenagungameloadouts(var_2429cf7c00ac6e67) {
    loadouts = [];
    var_57c2fbe37e0787ea = [];
    if (istrue(level.var_62f6f7640e4431e3.var_535d5c90db8b1a9f)) {
        var_57c2fbe37e0787ea = function_443c6629449aa6ed();
    } else {
        var_57c2fbe37e0787ea = function_3187496929140714();
    }
    foreach (classtable in var_57c2fbe37e0787ea) {
        foreach (loadout in classtable.var_8d5460be7db831c3) {
            loadouts[loadouts.size] = function_37f8be8199814f97(loadout);
        }
    }
    game["arenaRandomLoadout"] = namespace_3c37cb17ade254d::ter_op(var_2429cf7c00ac6e67, namespace_3c37cb17ade254d::array_reverse(loadouts), loadouts);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc1eb
// Size: 0x1f8
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

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc3ea
// Size: 0x75
function getgungameloadoutindex(player) {
    var_627fa174d00ef780 = 0;
    if (game["roundsPlayed"] == 0) {
        var_627fa174d00ef780 = 0;
    } else if (isgungameloadouts()) {
        var_627fa174d00ef780 = game["roundsWon"][player.pers["team"]];
    } else {
        var_627fa174d00ef780 = game["roundsWon"][getotherteam(player.pers["team"])[0]];
    }
    return var_627fa174d00ef780;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc467
// Size: 0xb7
function getgungameloadoutomnvarindex(player, winningteam) {
    var_627fa174d00ef780 = 0;
    if (isgungameloadouts()) {
        var_627fa174d00ef780 = game["roundsWon"][player.pers["team"]];
        if (isdefined(winningteam) && winningteam == player.pers["team"]) {
            var_627fa174d00ef780 = var_627fa174d00ef780 + 1;
        }
    } else {
        var_627fa174d00ef780 = game["roundsWon"][getotherteam(player.pers["team"])[0]];
        if (isdefined(winningteam) && winningteam == getotherteam(player.pers["team"])[0]) {
            var_627fa174d00ef780 = var_627fa174d00ef780 + 1;
        }
    }
    return var_627fa174d00ef780;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc526
// Size: 0x27f
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

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc7ac
// Size: 0x264
function spawngameendflagzone() {
    arenaflag = getentarray("flag_arena", "targetname");
    if (!isdefined(arenaflag[0]) && getdvarint(@"hash_2e5cbfbbbbae7cc", 0)) {
        arenaflag = function_bc9d94a7417733df();
    }
    if (!isdefined(arenaflag[0])) {
        /#
            assertmsg("^1No Arena Flag found in level!");
        #/
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
    arenaflag = namespace_98b55913d2326ac8::setupobjective(trigger, "neutral", undefined, 1);
    arenaflag.onuse = &arenaflag_onuse;
    arenaflag.onbeginuse = &arenaflag_onusebegin;
    arenaflag.onenduse = &arenaflag_onuseend;
    arenaflag.onuseupdate = &arenaflag_onuseupdate;
    arenaflag.oncontested = &arenaflag_oncontested;
    arenaflag.onuncontested = &arenaflag_onuncontested;
    arenaflag.isarena = 1;
    arenaflag namespace_19b4203b51d56488::pinobjiconontriggertouch();
    arenaflag.id = "domFlag";
    arenaflag.scriptable delete();
    arenaflag namespace_19b4203b51d56488::setcapturebehavior("persistent");
    arenaflag.ignorestomp = 1;
    level.objectives[arenaflag.objectivekey] = arenaflag;
    level.arenaflag = arenaflag;
    waitframe();
    level.arenaflag namespace_19b4203b51d56488::requestid(1, 1, undefined, 0, 0);
    level.arenaflag.visibleteam = "any";
    level.arenaflag namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_ot");
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level.arenaflag thread namespace_47e715c4f9510479::deleteotpreview();
        level thread namespace_47e715c4f9510479::showflagoutline();
    } else {
        level.arenaflag namespace_47e715c4f9510479::disableotflag();
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xca17
// Size: 0x83
function function_bc9d94a7417733df() {
    var_fc925d42c61f2b4f = getentarray("flag_primary", "targetname");
    foreach (ent in var_fc925d42c61f2b4f) {
        if (is_equal(ent.script_label, "_b")) {
            return [0:ent];
        }
    }
    return undefined;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcaa2
// Size: 0x73
function showflagoutline() {
    waitframe();
    if (isdefined(level.arenaflag) && isdefined(level.arenaflag.flagmodel)) {
        level.arenaflag.flagmodel.outlinedid = outlineenableforall(level.arenaflag.flagmodel, "outline_nodepth_orange", "level_script");
    }
    level thread removeflagoutlineongameend();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcb1c
// Size: 0x15a
function arenaflag_onusebegin(player) {
    player.iscapturing = 1;
    level.canprocessot = 0;
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        if (namespace_19b4203b51d56488::function_21f4c6f630b17fc4(player)) {
            player.owner setclientomnvar("ui_objective_pinned_text_param", 1);
        } else {
            player setclientomnvar("ui_objective_pinned_text_param", 1);
        }
    }
    self.neutralizing = istrue(level.flagneutralization) && ownerteam != "neutral";
    self.playertouching = 1;
    if (!istrue(self.neutralized)) {
        self.didstatusnotify = 0;
    }
    usetime = ter_op(istrue(level.flagneutralization), level.flagcapturetime * 0.5, level.flagcapturetime);
    namespace_19b4203b51d56488::setusetime(usetime);
    if (istrue(level.capturedecay)) {
        thread namespace_19b4203b51d56488::useobjectdecay(player.team);
    }
    if (usetime > 0) {
        self.prevownerteam = getotherteam(player.team)[0];
        namespace_98b55913d2326ac8::updateflagcapturestate(player.team);
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icontaking, level.iconlosing);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xcc7d
// Size: 0x144
function arenaflag_onuseupdate(team, progress, change, var_4b22e50e504339fe) {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (progress > 0.05 && change && !self.didstatusnotify) {
        if (ownerteam == "neutral") {
            if (level.flagcapturetime > 0.05) {
                namespace_944ddf7b8df1b0e3::statusdialog("securing" + self.objectivekey, team);
                otherteam = getotherteam(team)[0];
                namespace_944ddf7b8df1b0e3::statusdialog("losing" + self.objectivekey, otherteam);
            }
        } else if (level.flagcapturetime > 0.05) {
            namespace_944ddf7b8df1b0e3::statusdialog("losing" + self.objectivekey, ownerteam);
            namespace_944ddf7b8df1b0e3::statusdialog("securing" + self.objectivekey, team);
        }
        self.didstatusnotify = 1;
    }
    if (!istrue(self.stalemate) && !istrue(self.var_3ba42e8c18b42c71) && progress < 1 && !level.gameended && !isanymlgmatch()) {
        function_57688e4a9f64765a(progress, team);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xcdc8
// Size: 0xd6
function arenaflag_onuseend(team, player, success) {
    level.canprocessot = 1;
    self.didstatusnotify = 0;
    if (success) {
        namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
    }
    if (isplayer(player)) {
        player.iscapturing = 0;
        player setclientomnvar("ui_objective_pinned_text_param", 0);
    }
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
        thread namespace_98b55913d2326ac8::updateflagstate("idle", 0);
    } else {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
        thread namespace_98b55913d2326ac8::updateflagstate(ownerteam, 0);
    }
    if (!success) {
        self.neutralized = 0;
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcea5
// Size: 0x16f
function arenaflag_onuse(var_22282e7d48ca3400) {
    level.canprocessot = 1;
    team = var_22282e7d48ca3400.team;
    oldteam = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(team)[0];
    namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
    self.capturetime = gettime();
    self.neutralized = 0;
    namespace_944ddf7b8df1b0e3::statusdialog("lost" + self.objectivekey, otherteam);
    namespace_944ddf7b8df1b0e3::statusdialog("secured" + self.objectivekey, team);
    thread printandsoundoneveryone(team, otherteam, undefined, undefined, "mp_dom_flag_captured", "mp_dom_flag_lost", var_22282e7d48ca3400);
    namespace_98b55913d2326ac8::dompoint_setcaptured(team, var_22282e7d48ca3400);
    if (!self.neutralized) {
        if (isdefined(level.onobjectivecomplete)) {
            [[ level.onobjectivecomplete ]]("dompoint", self.objectivekey, var_22282e7d48ca3400, team, oldteam, self);
        }
        self.firstcapture = 0;
    }
    game["dialog"]["round_success"] = "dx_mp_gunf_game_t141_gfsd";
    game["dialog"]["round_failure"] = "dx_mp_gunf_game_t141_gflt";
    level thread arena_endgame(var_22282e7d48ca3400.team, game["end_reason"]["arena_otflag_completed"], game["end_reason"]["arena_otflag_failed"]);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd01b
// Size: 0x70
function arenaflag_oncontested() {
    namespace_19b4203b51d56488::setobjectivestatusicons(level.iconcontested);
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, undefined);
    thread namespace_98b55913d2326ac8::updateflagstate("contested", 0);
    level thread forcegameendcontesttimeout();
    level.arenaflag thread function_da1f3979f22bb288(level.arenaflag.flagmodel.origin, "jup_shared_zone_contested", 3);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd092
// Size: 0x107
function arenaflag_onuncontested(lastclaimteam) {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        if (lastclaimteam != "none") {
            namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, lastclaimteam);
        } else if (isdefined(self.lastprogressteam)) {
            namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, self.lastprogressteam);
        }
    } else {
        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, getotherteam(ownerteam)[0]);
    }
    if (lastclaimteam == "none" || ownerteam == "neutral") {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
        self.didstatusnotify = 0;
    } else {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
    }
    level.arenaflag thread function_82b6a3e1bcda539b(level.arenaflag.flagmodel.origin, "jup_shared_zone_uncontested", 3);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd1a0
// Size: 0x74
function forcegameendcontesttimeout() {
    level notify("start_overtime_timeout");
    level endon("start_overtime_timeout");
    level endon("game_ended");
    if (!isdefined(level.ottimecontested)) {
        level.ottimecontested = 0;
    }
    while (level.ottimecontested < 5000) {
        wait(level.framedurationseconds);
        level.ottimecontested = level.ottimecontested + level.frameduration;
    }
    level.canprocessot = 1;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd21b
// Size: 0x41
function disableotflag() {
    namespace_19b4203b51d56488::allowuse("none");
    namespace_19b4203b51d56488::disableobject();
    if (isdefined(self.scriptable)) {
        self.scriptable delete();
    }
    self.flagmodel hide();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd263
// Size: 0x71
function removeflagoutlineongameend() {
    level waittill("game_ended");
    if (isdefined(level.arenaflag) && isdefined(level.arenaflag.flagmodel.outlinedid)) {
        outlinedisable(level.arenaflag.flagmodel.outlinedid, level.arenaflag.flagmodel);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd2db
// Size: 0x16
function deleteotpreview() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_47e715c4f9510479::disableotflag();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd2f8
// Size: 0xec
function setupendzones() {
    if (level.mapname == "mp_shipment") {
        level.attackerendzone = getentarray("flag_goal_defender", "targetname");
        level.defenderendzone = getentarray("flag_goal_attackers", "targetname");
    } else {
        level.attackerendzone = getentarray("flag_goal_attacker", "targetname");
        level.defenderendzone = getentarray("flag_goal_defender", "targetname");
    }
    level.attackerendzone = level.attackerendzone[0] createendzone(game["attackers"]);
    level.defenderendzone = level.defenderendzone[0] createendzone(game["defenders"]);
    level.objectives["_b"] = level.attackerendzone;
    level.objectives["_c"] = level.defenderendzone;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd3eb
// Size: 0x4a4
function createendzone(team) {
    if (isdefined(self.target)) {
        visuals[0] = getent(self.target, "targetname");
    } else {
        visuals[0] = spawn("script_model", self.origin);
        visuals[0].angles = self.angles;
    }
    if (isdefined(self.objectivekey)) {
        objectivekey = self.objectivekey;
    } else if (self.targetname == "flag_goal_attacker") {
        objectivekey = "_b";
    } else {
        objectivekey = "_c";
    }
    iconname = undefined;
    var_54b003ce5d016238 = namespace_19b4203b51d56488::createuseobject(team, self, visuals, (0, 0, 100));
    var_54b003ce5d016238.team = team;
    var_54b003ce5d016238.ownerteam = team;
    var_54b003ce5d016238 namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefendendzone, level.iconcaptureendzone);
    var_54b003ce5d016238 namespace_19b4203b51d56488::allowuse("enemy");
    var_54b003ce5d016238 namespace_19b4203b51d56488::cancontestclaim(1);
    var_54b003ce5d016238 namespace_19b4203b51d56488::setusetime(level.flagcapturetime);
    var_54b003ce5d016238.onuse = &endzone_onuse;
    var_54b003ce5d016238.onbeginuse = &endzone_onusebegin;
    var_54b003ce5d016238.onenduse = &endzone_onuseend;
    var_54b003ce5d016238.oncontested = &endzone_oncontested;
    var_54b003ce5d016238.onuncontested = &endzone_onuncontested;
    var_54b003ce5d016238.isarena = 1;
    var_54b003ce5d016238.firstcapture = 1;
    var_54b003ce5d016238 namespace_19b4203b51d56488::pinobjiconontriggertouch();
    var_54b003ce5d016238.id = "domFlag";
    if (isdefined(level.capturetype)) {
        var_54b003ce5d016238 namespace_19b4203b51d56488::setcapturebehavior(getcapturetype());
    }
    var_54b003ce5d016238.objectivekey = objectivekey;
    var_54b003ce5d016238.iconname = iconname;
    var_54b003ce5d016238 namespace_19b4203b51d56488::setvisibleteam("any");
    var_54b003ce5d016238.stompprogressreward = &endzone_stompprogressreward;
    var_54b003ce5d016238.nousebar = 1;
    var_54b003ce5d016238.claimgracetime = level.flagcapturetime * 1000;
    tracestart = visuals[0].origin + (0, 0, 32);
    traceend = visuals[0].origin + (0, 0, -32);
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    var_54b003ce5d016238.baseeffectpos = trace["position"];
    upangles = vectortoangles(trace["normal"]);
    var_54b003ce5d016238.baseeffectforward = anglestoforward(upangles);
    scriptable = spawn("script_model", var_54b003ce5d016238.baseeffectpos);
    scriptable setmodel("dom_flag_scriptable");
    scriptable.angles = generateaxisanglesfromforwardvector(var_54b003ce5d016238.baseeffectforward, scriptable.angles);
    var_54b003ce5d016238.scriptable = scriptable;
    var_54b003ce5d016238.vfxnamemod = "";
    if (isdefined(var_54b003ce5d016238.trigger.radius)) {
        if (var_54b003ce5d016238.trigger.radius == 160) {
            var_54b003ce5d016238.vfxnamemod = "_160";
        } else if (var_54b003ce5d016238.trigger.radius == 90) {
            var_54b003ce5d016238.vfxnamemod = "_90";
        } else if (var_54b003ce5d016238.trigger.radius == 315) {
            var_54b003ce5d016238.vfxnamemod = "_300";
        } else if (var_54b003ce5d016238.trigger.radius != 120) {
            var_54b003ce5d016238.noscriptable = 1;
        }
    }
    var_54b003ce5d016238.flagmodel = spawn("script_model", var_54b003ce5d016238.baseeffectpos);
    var_54b003ce5d016238.flagmodel setmodel("military_dom_flag_neutral");
    var_54b003ce5d016238.outlineent = var_54b003ce5d016238.flagmodel;
    return var_54b003ce5d016238;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd897
// Size: 0x12a
function endzone_onusebegin(player) {
    player.iscapturing = 1;
    level.canprocessot = 0;
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        player setclientomnvar("ui_objective_pinned_text_param", 1);
    }
    self.neutralizing = istrue(level.flagneutralization) && ownerteam != "neutral";
    if (!istrue(self.neutralized)) {
        self.didstatusnotify = 0;
    }
    usetime = ter_op(istrue(level.flagneutralization), level.flagcapturetime * 0.5, level.flagcapturetime);
    namespace_19b4203b51d56488::setusetime(usetime);
    if (istrue(level.capturedecay)) {
        thread namespace_19b4203b51d56488::useobjectdecay(player.team);
    }
    if (usetime > 0) {
        self.prevownerteam = getotherteam(player.team)[0];
        namespace_98b55913d2326ac8::updateflagcapturestate(player.team);
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconlosingendzone, level.icontakingendzone);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd9c8
// Size: 0x97
function endzone_onuseend(team, player, success) {
    level.canprocessot = 1;
    if (success) {
        namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
    }
    if (isplayer(player)) {
        player.iscapturing = 0;
        player setclientomnvar("ui_objective_pinned_text_param", 0);
    }
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefendendzone, level.iconcaptureendzone);
    if (!success) {
        self.neutralized = 0;
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xda66
// Size: 0x108
function endzone_onuse(var_22282e7d48ca3400) {
    level.canprocessot = 1;
    team = var_22282e7d48ca3400.team;
    oldteam = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(team)[0];
    namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
    self.capturetime = gettime();
    self.neutralized = 0;
    thread printandsoundoneveryone(team, otherteam, undefined, undefined, "mp_dom_flag_captured", "mp_dom_flag_lost", var_22282e7d48ca3400);
    endzone_setcaptured(team, var_22282e7d48ca3400);
    if (!self.neutralized) {
        if (isdefined(level.onobjectivecomplete)) {
            [[ level.onobjectivecomplete ]]("dompoint", self.objectivekey, var_22282e7d48ca3400, team, oldteam, self);
        }
    }
    level thread arena_endgame(var_22282e7d48ca3400.team, game["end_reason"]["objective_completed"], undefined, 0, 2);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdb75
// Size: 0x24
function endzone_oncontested() {
    namespace_19b4203b51d56488::setobjectivestatusicons(level.iconcontestendzone);
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, undefined);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdba0
// Size: 0x41
function endzone_onuncontested(lastclaimteam) {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefendendzone, level.iconcaptureendzone);
    self.processot = 1;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdbe8
// Size: 0x130
function endzone_setcaptured(team, var_22282e7d48ca3400) {
    namespace_19b4203b51d56488::setownerteam(team);
    self notify("capture", var_22282e7d48ca3400);
    self notify("assault", var_22282e7d48ca3400);
    namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefendendzone, level.iconcaptureendzone);
    self.neutralized = 0;
    if (self.touchlist[team].size == 0) {
        self.touchlist = self.oldtouchlist;
    }
    thread giveflagcapturexp(self.touchlist[team], var_22282e7d48ca3400);
    if (isdefined(level.matchrecording_logevent)) {
        [[ level.matchrecording_logevent ]](self.logid, undefined, self.logeventflag, self.visuals[0].origin[0], self.visuals[0].origin[1], gettime(), ter_op(team == "allies", 1, 2));
    }
    namespace_bd0162aedd8c8594::logevent_gameobject(self.analyticslogtype, self.analyticslogid, self.visuals[0].origin, -1, "captured_" + team);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdd1f
// Size: 0x30
function endzone_stompprogressreward(player) {
    player thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
    player thread namespace_48a08c5037514e04::doscoreevent(#"hash_2d96ced878338cd2");
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdd56
// Size: 0x43
function getcapturetype() {
    capturetype = "normal";
    if (level.capturetype == 2) {
        capturetype = "neutralize";
    } else if (level.capturetype == 3) {
        capturetype = "persistent";
    }
    return capturetype;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdda1
// Size: 0x184
function giveflagcapturexp(touchlist, var_22282e7d48ca3400) {
    level endon("game_ended");
    first_player = var_22282e7d48ca3400;
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
    var_59db5d0f4e3000a7 = getarraykeys(touchlist);
    for (index = 0; index < var_59db5d0f4e3000a7.size; index++) {
        player = touchlist[var_59db5d0f4e3000a7[index]].player;
        if (isdefined(player.owner)) {
            player = player.owner;
        }
        if (!isplayer(player)) {
            continue;
        }
        player incpersstat("captures", 1);
        player namespace_2685ec368e022695::statsetchild("round", "captures", player.pers["captures"]);
        player thread namespace_62c556437da28f50::scoreeventpopup(#"capture");
        player thread namespace_48a08c5037514e04::doscoreevent(#"hash_5a7b15a24e10a93b");
        wait(0.05);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdf2c
// Size: 0x23e
function startotmechanics() {
    if (function_444e57e02c02bee6()) {
        foreach (objective in level.objectives) {
            if (objective.objectivekey != "_a") {
                objective deleteendzone();
            }
        }
    }
    level.canprocessot = 1;
    if (isdefined(level.arenaflag)) {
        if (!isdefined(level.arenaflag.objidnum)) {
            level.arenaflag namespace_19b4203b51d56488::requestid(1, 1, undefined, 0, 0);
        }
        level.arenaflag namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
        level.arenaflag namespace_19b4203b51d56488::enableobject();
        level.arenaflag namespace_19b4203b51d56488::allowuse("enemy");
        level.arenaflag.flagmodel show();
        level thread showflagoutline();
        level.arenaflag.flagmodel playsound("flag_spawned");
    }
    if (level.overtimeflag > 0 && !function_2eda32f1d16ded2c()) {
        game["dialog"]["overtime"] = "gamestate_overtime_flagspawn";
    }
    level thread shouldplayerovertimedialog();
    namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(10, "free");
    if (istrue(level.snowballfight)) {
        foreach (player in level.players) {
            if (isalive(player)) {
                equipment = player namespace_1a507865f681850e::getcurrentequipment("primary");
                if (isdefined(equipment) && equipment == "equip_snowball") {
                    player namespace_1a507865f681850e::incrementequipmentammo("equip_snowball", 10);
                } else if (!isdefined(equipment)) {
                    player namespace_1a507865f681850e::giveequipment("equip_snowball", "primary");
                    player namespace_1a507865f681850e::incrementequipmentammo("equip_snowball", 10);
                }
            }
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe171
// Size: 0x9e
function shouldplayerovertimedialog() {
    wait(0.15);
    if (isdefined(level.arenaflag)) {
        if (istrue(level.arenaflag.playertouching)) {
            return;
        }
    }
    foreach (player in level.players) {
        if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
            continue;
        }
        player namespace_944ddf7b8df1b0e3::leaderdialogonplayer("overtime");
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe216
// Size: 0x75
function deleteendzone() {
    self notify("monitor_flag_control");
    namespace_19b4203b51d56488::allowuse("none");
    namespace_19b4203b51d56488::setvisibleteam("none");
    namespace_19b4203b51d56488::releaseid();
    self.trigger = undefined;
    self notify("deleted");
    self.visibleteam = "none";
    if (isdefined(self.scriptable)) {
        self.scriptable delete();
    }
    self.flagmodel delete();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe292
// Size: 0x96
function function_5bba7f02dbb91b52() {
    level.var_59a1f917fb3131a6 = "neutral";
    level.flagmodel["allies"] = "ctf_game_flag_west";
    level.flagbase["allies"] = "ctf_game_flag_base";
    level.carryflag["allies"] = "prop_ctf_game_flag_west";
    level.flagmodel["axis"] = "ctf_game_flag_east";
    level.flagbase["axis"] = "ctf_game_flag_base";
    level.carryflag["axis"] = "prop_ctf_game_flag_east";
    createflagstart();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe32f
// Size: 0xaf
function createflagstart() {
    level.var_b5538188c80d8af6 = array_randomize(level.var_b5538188c80d8af6);
    tracestart = level.var_b5538188c80d8af6[0] + (0, 0, 64);
    traceend = level.var_b5538188c80d8af6[0] + (0, 0, -64);
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, undefined, namespace_2a184fc4902783dc::create_default_contents(1));
    level.var_b5538188c80d8af6[0] = trace["position"];
    level.var_21997fbea8438765 = function_7077c9e2d480fab5("allies");
    level thread flaglockedtimer();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe3e5
// Size: 0x150
function flaglockedtimer() {
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level.var_50a07cda9851d4b8.objectiveicon namespace_19b4203b51d56488::setvisibleteam("none");
        level waittill_any_2("prematch_done", "start_mode_setup");
        level.var_50a07cda9851d4b8.objectiveicon namespace_19b4203b51d56488::setvisibleteam("any");
    }
    if (level.flagactivationdelay) {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
        level.var_50a07cda9851d4b8.objectiveicon thread namespace_19b4203b51d56488::function_d36dcacac1708708(level.flagactivationdelay);
        wait(level.flagactivationdelay);
        level.var_50a07cda9851d4b8.objectiveicon namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconcaptureflag, level.iconcaptureflag, level.mlgiconfullflag);
        level.var_21997fbea8438765.trigger namespace_3c37cb17ade254d::trigger_on();
        foreach (team in level.teamnamelist) {
            namespace_944ddf7b8df1b0e3::leaderdialog("obj_generic_capture", team);
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe53c
// Size: 0x450
function function_7077c9e2d480fab5(team) {
    level.pickuptime = 0;
    level.returntime = 0;
    radius = 32;
    trigger = spawn("trigger_radius", level.var_b5538188c80d8af6[0], 0, radius, 128);
    visuals = [];
    visuals[0] = spawn("script_model", level.var_b5538188c80d8af6[0]);
    visuals[0] setmodel(level.flagmodel[team]);
    visuals[0] setasgametypeobjective();
    visuals[0] setteaminhuddatafromteamname(team);
    var_4e86579dc7e39505 = "neutral";
    var_3bc2b88a59b6d062 = namespace_19b4203b51d56488::createcarryobject(var_4e86579dc7e39505, trigger, visuals, (0, 0, 85));
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::allowcarry("any");
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setteamusetime("friendly", level.pickuptime);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setteamusetime("enemy", level.returntime);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setvisibleteam("none");
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, level.mlgiconfullflag);
    var_3bc2b88a59b6d062 namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_3bc2b88a59b6d062.objidnum, 0);
    var_3bc2b88a59b6d062 namespace_5a22b6f3a56f7e9b::objective_set_play_outro(var_3bc2b88a59b6d062.objidnum, 0);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::registercarryobjectpickupcheck(&flagpickupchecks);
    var_3bc2b88a59b6d062.allowweapons = 1;
    var_3bc2b88a59b6d062.firstpickup = 1;
    var_3bc2b88a59b6d062.onpickup = &onpickup;
    var_3bc2b88a59b6d062.onpickupfailed = &onpickup;
    var_3bc2b88a59b6d062.ondrop = &ondrop;
    var_3bc2b88a59b6d062.onreset = &onreset;
    if (isdefined(level.showenemycarrier)) {
        switch (level.showenemycarrier) {
        case 0:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 60;
            break;
        case 1:
            var_3bc2b88a59b6d062.objidpingfriendly = 0;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 0.05;
            break;
        case 2:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 1;
            break;
        case 3:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 1.5;
            break;
        case 4:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 2;
            break;
        case 5:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 3;
            break;
        case 6:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 4;
            break;
        }
        var_220be32c83520117 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
        var_3bc2b88a59b6d062.pingobjidnum = var_220be32c83520117;
        namespace_5a22b6f3a56f7e9b::objective_add_objective(var_220be32c83520117, "done", var_3bc2b88a59b6d062.origin);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_220be32c83520117, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(var_220be32c83520117, 0);
        var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setvisibleteam("none", var_220be32c83520117);
        objective_setownerteam(var_220be32c83520117, team);
        var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, level.mlgiconfullflag, var_220be32c83520117);
    } else {
        var_3bc2b88a59b6d062.objidpingfriendly = 1;
        var_3bc2b88a59b6d062.objidpingenemy = 0;
        var_3bc2b88a59b6d062.objpingdelay = 3;
    }
    level.var_50a07cda9851d4b8 = function_8be5d726c39eced3(team, var_3bc2b88a59b6d062);
    return var_3bc2b88a59b6d062;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe994
// Size: 0x13e
function function_8be5d726c39eced3(team, var_3bc2b88a59b6d062) {
    var_d9ca1813b9de5e20 = var_3bc2b88a59b6d062.visuals[0].origin;
    var_fd8b4c619f5e9ff = spawn("script_model", var_d9ca1813b9de5e20);
    var_fd8b4c619f5e9ff setmodel(level.flagbase[team]);
    var_fd8b4c619f5e9ff.ownerteam = "neutral";
    var_fd8b4c619f5e9ff setasgametypeobjective();
    var_fd8b4c619f5e9ff setteaminhuddatafromteamname(team);
    var_fd8b4c619f5e9ff.objectiveicon = namespace_19b4203b51d56488::createobjidobject(var_d9ca1813b9de5e20, "neutral", (0, 0, 85), undefined, "any", 0);
    var_fd8b4c619f5e9ff.objectiveicon namespace_19b4203b51d56488::setvisibleteam("any");
    if (level.flagactivationdelay) {
        var_3bc2b88a59b6d062.trigger namespace_3c37cb17ade254d::trigger_off();
        var_fd8b4c619f5e9ff.objectiveicon namespace_19b4203b51d56488::setobjectivestatusallicons(level.icontarget, level.icontarget, level.mlgiconfullflag);
    } else {
        var_fd8b4c619f5e9ff.objectiveicon namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconcaptureflag, level.iconcaptureflag, level.mlgiconfullflag);
    }
    return var_fd8b4c619f5e9ff;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeada
// Size: 0x40
function setteaminhuddatafromteamname(teamname) {
    if (teamname == "axis") {
        self setteaminhuddata(1);
    } else if (teamname == "allies") {
        self setteaminhuddata(2);
    } else {
        self setteaminhuddata(0);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeb21
// Size: 0x14
function flagpickupchecks(player) {
    return !player namespace_f8065cafc523dba5::isinvehicle();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xeb3d
// Size: 0x343
function onpickup(player, var_5760e0f038d1baa3, defused) {
    self notify("picked_up");
    player notify("obj_picked_up");
    level.var_50a07cda9851d4b8.objectiveicon namespace_19b4203b51d56488::setvisibleteam("none");
    level.var_21997fbea8438765.currentcarrier = player;
    player thread awardobjtimeforcarrier();
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    namespace_19b4203b51d56488::setownerteam(player.team);
    team = player.pers["team"];
    level.var_59a1f917fb3131a6 = team;
    if (team == "allies") {
        otherteam = "axis";
    } else {
        otherteam = "allies";
    }
    player attachflag();
    player incpersstat("pickups", 1);
    if (self.ownerteam == "allies") {
        setomnvar("ui_single_flag_loc", player getentitynumber());
    } else {
        setomnvar("ui_single_flag_loc", player getentitynumber());
    }
    player setclientomnvar("ui_flag_player_hud_icon", 1);
    if (isdefined(level.showenemycarrier)) {
        if (level.showenemycarrier == 0) {
            namespace_19b4203b51d56488::setvisibleteam("none");
        } else {
            namespace_19b4203b51d56488::setvisibleteam("friendly");
            objective_state(self.pingobjidnum, "current");
            namespace_19b4203b51d56488::updatecompassicon("enemy", self.pingobjidnum);
            objective_icon(self.pingobjidnum, "icon_waypoint_kill");
            objective_setbackground(self.pingobjidnum, 2);
            namespace_5a22b6f3a56f7e9b::objective_hide_for_mlg_spectator(self.pingobjidnum, 1);
            namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(self.pingobjidnum, "MP_INGAME_ONLY/OBJ_DEFEND_CAPS");
            namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(self.pingobjidnum, "MP_INGAME_ONLY/OBJ_KILL_CAPS");
            objective_setownerteam(self.pingobjidnum, team);
        }
    }
    namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, level.mlgiconfullflag);
    printandsoundoneveryone(team, otherteam, undefined, undefined, "mp_obj_taken", "mp_enemy_obj_taken", player);
    if (!level.gameended) {
        namespace_944ddf7b8df1b0e3::leaderdialog("enemy_flag_taken", team);
        namespace_944ddf7b8df1b0e3::leaderdialog("flag_getback", otherteam);
    }
    thread teamplayercardsplash("callout_flagpickup", player);
    player thread namespace_44abc05161e2e2cb::showsplash("flagpickup");
    if (!isdefined(self.previouscarrier) || self.previouscarrier != player) {
        player thread namespace_48a08c5037514e04::doscoreevent(#"flag_grab");
    }
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.player = player;
    var_7e2c53b0bcf117d9.eventname = "pickup";
    var_7e2c53b0bcf117d9.position = player.origin;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
    self.previouscarrier = player;
    if (level.codcasterenabled) {
        player setgametypevip(1);
    }
    if (level.flagholdtimer > 0) {
        thread function_9962a01f46dd3b58(team);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xee87
// Size: 0xa
function returnflag() {
    namespace_19b4203b51d56488::returnhome();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xee98
// Size: 0x2b3
function ondrop(player) {
    if (isdefined(player.leaving_team)) {
        self.droppedteam = player.leaving_team;
        player.leaving_team = undefined;
    } else if (!isdefined(player)) {
        self.droppedteam = self.ownerteam;
    } else {
        self.droppedteam = player.team;
    }
    level.var_21997fbea8438765.currentcarrier = undefined;
    level.var_59a1f917fb3131a6 = "neutral";
    if (isdefined(player)) {
        player updatematchstatushintonnoflag();
    }
    namespace_19b4203b51d56488::setownerteam("neutral");
    team = self.droppedteam;
    otherteam = getotherteam(self.droppedteam)[0];
    namespace_19b4203b51d56488::allowcarry("any");
    namespace_19b4203b51d56488::setvisibleteam("any");
    objective_state(self.pingobjidnum, "done");
    if (level.returntime >= 0) {
        namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconreturnflag, level.iconreturnflag, level.mlgiconfullflag);
    } else {
        namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconreturnflag, level.iconreturnflag, level.mlgiconfullflag);
        namespace_5a22b6f3a56f7e9b::objective_hide_for_mlg_spectator(self.objidnum, 1);
    }
    if (self.ownerteam == "allies") {
        setomnvar("ui_single_flag_loc", -1);
    } else {
        setomnvar("ui_single_flag_loc", -1);
    }
    if (isdefined(player)) {
        player setclientomnvar("ui_flag_player_hud_icon", 0);
    }
    if (isdefined(player)) {
        if (!isreallyalive(player)) {
            player.carryobject.previouscarrier = undefined;
        }
        if (isdefined(player.carryflag)) {
            player detachflag();
        }
        printandsoundoneveryone(otherteam, "none", undefined, undefined, "iw9_mp_ui_objective_lost", "", player);
        if (level.codcasterenabled) {
            player setgametypevip(0);
        }
    } else {
        namespace_a34451ae3d453e::playsoundonplayers("iw9_mp_ui_objective_lost", otherteam);
    }
    if (!level.gameended) {
        namespace_944ddf7b8df1b0e3::leaderdialog("enemy_flag_dropped", getotherteam(self.droppedteam)[0], "status");
        namespace_944ddf7b8df1b0e3::leaderdialog("flag_dropped", self.droppedteam, "status");
    }
    if (level.idleresettime > 0) {
        thread returnaftertime();
    }
    if (level.flagholdtimer > 0) {
        setomnvar("ui_obj_timer_stopped", 1);
        setomnvar("ui_obj_timer", 0);
        setomnvar("ui_obj_progress", 0);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf152
// Size: 0xac
function returnaftertime() {
    self endon("picked_up");
    var_8e53d4ca3de8531a = 0;
    while (var_8e53d4ca3de8531a < level.idleresettime) {
        waitframe();
        if (self.claimteam == "none") {
            var_8e53d4ca3de8531a = var_8e53d4ca3de8531a + level.framedurationseconds;
        }
    }
    foreach (team in level.teamnamelist) {
        namespace_a34451ae3d453e::playsoundonplayers("iw9_mp_ui_objective_lost", team);
    }
    namespace_19b4203b51d56488::returnhome();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf205
// Size: 0x17c
function onreset() {
    level.var_21997fbea8438765.currentcarrier = undefined;
    if (isdefined(level.var_21997fbea8438765.portable_radar)) {
        level.var_21997fbea8438765.portable_radar clearportableradar();
        level.var_21997fbea8438765.portable_radar delete();
    }
    if (isdefined(self.droppedteam)) {
        namespace_19b4203b51d56488::setownerteam(self.droppedteam);
    }
    team = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(team)[0];
    namespace_19b4203b51d56488::allowcarry("any");
    namespace_19b4203b51d56488::setvisibleteam("none");
    namespace_19b4203b51d56488::setobjectivestatusicons(level.iconescort, level.iconkill);
    level.var_50a07cda9851d4b8.objectiveicon namespace_19b4203b51d56488::setvisibleteam("any");
    if (!level.gameended) {
        namespace_944ddf7b8df1b0e3::leaderdialog("enemy_flag_returned", getotherteam(self.droppedteam)[0], "status");
        namespace_944ddf7b8df1b0e3::leaderdialog("enemy_flag_returned", self.droppedteam, "status");
    }
    self.droppedteam = undefined;
    if (self.ownerteam == "allies") {
        setomnvar("ui_single_flag_loc", -2);
    } else {
        setomnvar("ui_single_flag_loc", -2);
    }
    self.previouscarrier = undefined;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf388
// Size: 0x59
function attachflag() {
    updatematchstatushintonhasflag();
    otherteam = getotherteam(self.pers["team"])[0];
    self attach(level.carryflag[otherteam], "tag_stowed_back3", 1);
    self.carryflag = level.carryflag[otherteam];
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf3e8
// Size: 0x22
function detachflag() {
    self detach(self.carryflag, "tag_stowed_back3");
    self.carryflag = undefined;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf411
// Size: 0xf
function updatematchstatushintonnoflag() {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("single_flag_cap");
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf427
// Size: 0xf
function updatematchstatushintonhasflag() {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("single_flag_cap");
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf43d
// Size: 0x12f
function awardobjtimeforcarrier(team) {
    level endon("game_ended");
    level.var_21997fbea8438765 endon("dropped");
    level.var_21997fbea8438765 endon("reset");
    level notify("objTimePointsRunning");
    level endon("objTimePointsRunning");
    while (!level.gameended) {
        wait(1);
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
        if (!level.gameended) {
            level.var_21997fbea8438765.carrier incpersstat("objTime", 1);
            level.var_21997fbea8438765.carrier namespace_2685ec368e022695::statsetchild("round", "objTime", level.var_21997fbea8438765.carrier.pers["objTime"]);
            level.var_21997fbea8438765.carrier setextrascore0(level.var_21997fbea8438765.carrier.pers["objTime"]);
            level.var_21997fbea8438765.carrier namespace_e8a49b70d0769b66::giveplayerscore(#"hash_98bfd8d29c56bc08", 10);
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf573
// Size: 0x81
function function_9962a01f46dd3b58(team) {
    flagholdtimer = int(gettime() + level.flagholdtimer * 1000);
    setomnvar("ui_obj_timer", flagholdtimer);
    setomnvar("ui_obj_progress", 1);
    setomnvar("ui_objective_timer_stopped", 0);
    level thread namespace_44abc05161e2e2cb::notifyteam("flag_force_hold_fr", "flag_force_hold_en", team);
    thread function_4d2db447ddf43e1(level.flagholdtimer);
    thread function_8028646f3cc80ac4();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf5fb
// Size: 0x5b
function function_4d2db447ddf43e1(flagholdtimer) {
    level.var_21997fbea8438765 endon("dropped");
    currentprogress = flagholdtimer;
    while (!level.gameended) {
        setomnvar("ui_obj_progress", currentprogress / flagholdtimer);
        currentprogress = currentprogress - level.framedurationseconds;
        wait(level.framedurationseconds);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf65d
// Size: 0x53
function function_8028646f3cc80ac4() {
    level endon("game_ended");
    self endon("dropped");
    namespace_e323c8674b44c8f4::waitlongdurationwithgameendtimeupdate(level.flagholdtimer);
    level thread namespace_d576b6dc7cef9c62::endgame(level.var_21997fbea8438765 namespace_19b4203b51d56488::getownerteam(), game["end_reason"]["ko_flag_hold_win"], game["end_reason"]["ko_flag_hold_loss"]);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf6b7
// Size: 0x2b
function dogtagallyonusecb(player) {
    player.health = player.maxhealth;
    player notify("healed");
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf6e9
// Size: 0x2b
function dogtagenemyonusecb(player) {
    player.health = player.maxhealth;
    player notify("healed");
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf71b
// Size: 0x173
function outlineenemyplayers() {
    level endon("prematch_done");
    level endon("removeArenaOutlines");
    while (1) {
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

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf895
// Size: 0xac
function removeenemyoutlines() {
    thread notifyremoveoutlines();
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    foreach (player in level.players) {
        entnum = player getentitynumber();
        if (isdefined(player.outlinedenemies)) {
            level.activeoutlines--;
            outlinedisable(player.outlinedenemies, player);
            player.outlinedenemies = undefined;
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf948
// Size: 0x6b
function notifyremoveoutlines() {
    level endon("prematch_done");
    level waittill("match_start_real_countdown");
    if (level.prematchperiodend > 5) {
        time = int(max(level.prematchperiodend - 5, 5));
    } else {
        time = int(max(level.prematchperiodend - 2, 2));
    }
    wait(time);
    level notify("removeArenaOutlines");
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf9ba
// Size: 0x17c
function outlineequipmentwatchplayerprox(equipname) {
    self endon("death");
    self endon("trigger");
    self.outlinedplayers = [];
    basescore = level.baseraritymap[equipname];
    var_4430b08d5a2d47bf = getoutlineasset(basescore, equipname);
    while (1) {
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
                } else if (isdefined(self.outlinedplayers[entnum])) {
                    level.activeoutlines--;
                    outlinedisable(self.outlinedplayers[entnum], self);
                    self.outlinedplayers[entnum] = undefined;
                }
            }
        }
        waitframe();
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb3d
// Size: 0x19b
function outlinewatchplayerprox() {
    self endon("death");
    self endon("trigger");
    self.outlinedplayers = [];
    weapname = namespace_3bbb5a98b932c46f::getitemweaponname();
    rootname = getweaponrootname(weapname);
    basescore = level.baseraritymap[rootname + "_mp"];
    var_4430b08d5a2d47bf = getoutlineasset(basescore);
    while (1) {
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
                } else if (isdefined(self.outlinedplayers[entnum])) {
                    level.activeoutlines--;
                    outlinedisable(self.outlinedplayers[entnum], self);
                    self.outlinedplayers[entnum] = undefined;
                }
            }
        }
        waitframe();
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfcdf
// Size: 0x139
function getoutlineasset(basescore, equipname) {
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
    if (istrue(level.snowballfight) && isdefined(equipname) && equipname == "equip_pball") {
        var_4430b08d5a2d47bf = "outline_depth_yellow";
    }
    return var_4430b08d5a2d47bf;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfe20
// Size: 0x66
function clearweaponoutlines() {
    foreach (value in self.outlinedplayers) {
        level.activeoutlines--;
        outlinedisable(value, self);
        value = undefined;
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfe8d
// Size: 0x16
function updatematchstatushintonspawn() {
    level endon("game_ended");
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("kill");
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfeaa
// Size: 0x11b
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
    level.icondefending = "waypoint_defending";
    level.iconescort = "waypoint_escort_flag";
    level.iconkill = "waypoint_ctf_kill";
    level.iconcaptureflag = "waypoint_take_flag";
    level.icondefendflag = "waypoint_defend_flag";
    level.iconreturnflag = "waypoint_recover_flag";
    level.mlgiconemptyflag = "waypoint_mlg_empty_flag";
    level.mlgiconfullflag = "waypoint_mlg_full_flag";
    level.icontarget = "waypoint_target";
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xffcc
// Size: 0x336
function setupwaypointicons() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_taking_endzone", 0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_losing_endzone", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_contesting_endzone", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture_endzone", 0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_endzone", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_dom_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_taking_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_overtime", 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defending_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_blocking_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_blocked_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_losing_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_overtime", 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_captureneutral_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_contested_a", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_overtime", 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_dom_target_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_target_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_ot_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_OTFLAGLOC_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_dogtags", 1, "enemy", "", "hud_icon_minimap_misc_dog_tag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_dogtags_friendly", 1, "friendly", "", "hud_icon_minimap_misc_dog_tag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_ctf_kill", 2, "enemy", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_kill", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_recover_flag", 0, "neutral", "MP_INGAME_ONLY/OBJ_RECOVER_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_escort_flag", 2, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_take_flag", 0, "neutral", "MP_INGAME_ONLY/OBJ_TAKE_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_target", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_mlg_empty_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "codcaster_icon_waypoint_ctf_empty", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_mlg_full_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "codcaster_icon_waypoint_ctf_full", 0);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10309
// Size: 0xf
function isnormalloadouts() {
    return level.arenaloadouts == 1;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10320
// Size: 0x69
function israndomloadouts() {
    return level.arenaloadouts == 2 || namespace_47e715c4f9510479::israndomarloadouts() || namespace_47e715c4f9510479::israndomsmgloadouts() || namespace_47e715c4f9510479::israndompistolloadouts() || namespace_47e715c4f9510479::israndomshotgunloadouts() || namespace_47e715c4f9510479::israndomsniperloadouts() || namespace_47e715c4f9510479::israndomlmgloadouts() || namespace_47e715c4f9510479::israndomblueprintsloadouts() || namespace_47e715c4f9510479::israndomcustomblueprintsloadouts() || namespace_47e715c4f9510479::israndomnoattachmentloadouts();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10391
// Size: 0x1f
function ispickuploadouts() {
    return level.arenaloadouts == 3 || level.arenaloadouts == 14;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x103b8
// Size: 0xf
function isgungameloadouts() {
    return level.arenaloadouts == 4;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x103cf
// Size: 0xf
function isrvsgungameloadouts() {
    return level.arenaloadouts == 5;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x103e6
// Size: 0xf
function israndomarloadouts() {
    return level.arenaloadouts == 7;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x103fd
// Size: 0xf
function israndomsmgloadouts() {
    return level.arenaloadouts == 8;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10414
// Size: 0xf
function israndompistolloadouts() {
    return level.arenaloadouts == 9;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1042b
// Size: 0xf
function israndomshotgunloadouts() {
    return level.arenaloadouts == 10;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10442
// Size: 0xf
function israndomsniperloadouts() {
    return level.arenaloadouts == 11;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10459
// Size: 0xf
function israndomlmgloadouts() {
    return level.arenaloadouts == 12;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10470
// Size: 0xf
function israndomblueprintsloadouts() {
    return level.arenaloadouts == 13;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10487
// Size: 0xf
function ispickupblueprintloadouts() {
    return level.arenaloadouts == 14;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1049e
// Size: 0xf
function israndomcustomblueprintsloadouts() {
    return level.arenaloadouts == 15;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x104b5
// Size: 0xf
function israndomnoattachmentloadouts() {
    return level.arenaloadouts == 16;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x104cc
// Size: 0x1d
function function_c0c1519b5cfb9bd5() {
    return namespace_47e715c4f9510479::israndomblueprintsloadouts() || namespace_47e715c4f9510479::ispickupblueprintloadouts() || namespace_47e715c4f9510479::israndomcustomblueprintsloadouts();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x104f1
// Size: 0xe
function function_46a9ae30a3b356a8() {
    return level.objmodifier == 0;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10507
// Size: 0xf
function function_444e57e02c02bee6() {
    return level.objmodifier == 1;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1051e
// Size: 0xf
function function_2eda32f1d16ded2c() {
    return level.objmodifier == 2;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10535
// Size: 0x3c
function snowballfight() {
    if (istrue(game["practiceRound"]) || istrue(level.alwayssnowfight)) {
        level.lethaldelay = 0;
        defineplayerloadout();
    }
    initweaponmap();
    thread setupsnowballs();
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10578
// Size: 0x2c8
function setupsnowballs() {
    level.arenaweapont1.weapon = "equip_snowball";
    if (!istrue(level.alwayssnowfight) && !istrue(game["practiceRound"])) {
        level.arenaweapont1.weapon = ter_op(cointoss(), level.arenaweapont1.weapon, "equip_snowball");
        level.arenaweapont2.weapon = ter_op(cointoss(), level.arenaweapont2.weapon, "equip_snowball");
        level.arenaweapont3.weapon = ter_op(cointoss(), level.arenaweapont3.weapon, "equip_snowball");
        level.arenaweapont4.weapon = ter_op(cointoss(), level.arenaweapont4.weapon, "equip_snowball");
        level.arenaweapont5.weapon = ter_op(cointoss(), level.arenaweapont5.weapon, "equip_snowball");
        level.arenaweapont6.weapon = ter_op(cointoss(), level.arenaweapont6.weapon, "equip_snowball");
        level.arenaweapont7.weapon = ter_op(cointoss(), level.arenaweapont7.weapon, "equip_snowball");
        level.arenaweapont8.weapon = ter_op(cointoss(), level.arenaweapont8.weapon, "equip_snowball");
    }
    level.pickedpball = 0;
    locs = getstructarray("weapon_pickup", "targetname");
    /#
        assertex(locs.size > 0, "Arena loadouts set to 'none' but weapon pickup spawn locations are not placed in the level!");
    #/
    foreach (loc in locs) {
        if (loc.script_label == "snowball" || loc.script_label == "pball" || istrue(game["practiceRound"]) || level.arenaloadouts != 3) {
            spawnweapon(loc, level.arenaweapont1);
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10847
// Size: 0x25a
function watchsnowballpickup(loc, var_ab5f95ba81a1a976) {
    self endon("death");
    droppeditem = player = self waittill("trigger");
    hasmaxammo = 0;
    var_f23035e6f6b69f91 = checkissameequip(player);
    var_c89f07da007ff0d = checkpickupequiptypeammocount(player);
    if (self.equipment == "equip_snowball") {
        var_8b9ab3abae98d973 = 9;
    } else {
        var_8b9ab3abae98d973 = 1;
    }
    var_b64209459da65860 = checkcurrentequiptypeammocount(player);
    var_d9f8a2bc44267f00 = 1;
    switch (var_ab5f95ba81a1a976) {
    case #"hash_8c759484936e9b6d":
        var_d9f8a2bc44267f00 = 10;
        break;
    case #"hash_b8a39a6acfe440c7":
        var_d9f8a2bc44267f00 = 5;
        break;
    case #"hash_66c094dee1aed032":
        var_d9f8a2bc44267f00 = 1;
        break;
    default:
        var_d9f8a2bc44267f00 = 1;
        break;
    }
    if (var_f23035e6f6b69f91) {
        if (var_c89f07da007ff0d == var_8b9ab3abae98d973) {
            hasmaxammo = 1;
        }
    }
    if (var_f23035e6f6b69f91 && !hasmaxammo) {
        player namespace_1a507865f681850e::incrementequipmentammo(self.equipment, var_d9f8a2bc44267f00);
    } else if (var_b64209459da65860 && !var_f23035e6f6b69f91 && !isplayer(loc)) {
        player dropoldequipinplace(player namespace_1a507865f681850e::getcurrentequipment(self.equiptype));
    }
    if (!var_f23035e6f6b69f91) {
        player namespace_1a507865f681850e::giveequipment(self.equipment, self.equiptype);
        if (self.equipment == "equip_snowball" && !hasmaxammo) {
            player namespace_1a507865f681850e::incrementequipmentammo(self.equipment, var_d9f8a2bc44267f00);
        } else if (self.equipment == "equip_pball") {
            player namespace_1a507865f681850e::setequipmentammo(self.equipment, var_d9f8a2bc44267f00);
        }
    }
    if (var_f23035e6f6b69f91 && hasmaxammo) {
        player iprintlnbold("MP_INGAME_ONLY/EQUIPMENT_MAXED");
        thread watchsnowballpickup(loc, var_ab5f95ba81a1a976);
    } else {
        player playlocalsound("weap_snowball_pickup");
        playfx(level.snowfx["vanish"], self.origin);
        clearweaponoutlines();
        if (!isplayer(loc) && var_ab5f95ba81a1a976 != "pball") {
            level thread waitthenrespawnsnowballs(loc);
        }
        self makeunusable();
        self delete();
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10aa8
// Size: 0x47
function waitthenrespawnsnowballs(loc) {
    level endon("game_ended");
    wait(15);
    playfx(level.snowfx["vanish"], loc.origin);
    spawnweapon(loc, level.arenaweapont1);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10af6
// Size: 0x1b
function snowballmeleewatcher() {
    level namespace_4b0406965e556711::gameflagwait("prematch_done");
    wait(1);
    self allowmelee(0);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b18
// Size: 0x12c
function getknivesoutsetting() {
    if (matchmakinggame()) {
        return getdvarint(@"hash_c4677c34d20593a7", 0);
    } else if (isthrowingknifeequipment(level.arenaweapont1.weapon) && isthrowingknifeequipment(level.arenaweapont2.weapon) && isthrowingknifeequipment(level.arenaweapont3.weapon) && isthrowingknifeequipment(level.arenaweapont4.weapon) && isthrowingknifeequipment(level.arenaweapont5.weapon) && isthrowingknifeequipment(level.arenaweapont6.weapon) && isthrowingknifeequipment(level.arenaweapont7.weapon) && isthrowingknifeequipment(level.arenaweapont8.weapon)) {
        if (isthrowingknifeequipment(level.startweapon.weapon)) {
            return 2;
        } else {
            return 1;
        }
    }
    return 0;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10c4c
// Size: 0x34
function isthrowingknifeequipment(weapon) {
    if (weapon == "equip_throwing_knife" || weapon == "equip_throwing_knife_fire" || weapon == "equip_throwing_knife_electric") {
        return 1;
    } else {
        return 0;
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c87
// Size: 0x6f
function fixupsupersandtacticalsforgunfightmaps() {
    switch (level.arenasuper) {
    case #"hash_699e6c3e460adde4":
    case #"hash_7266a252f51150e9":
    case #"hash_ac520bae8aaba66b":
        level.arenasuper = "super_ammo_drop";
        break;
    default:
        level.arenasuper = "none";
        break;
    }
    return level.arenasuper;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10cfe
// Size: 0x8f
function function_57688e4a9f64765a(progress, team) {
    if (!isdefined(self.lastsfxplayedtime)) {
        self.lastsfxplayedtime = gettime();
    }
    if (self.lastsfxplayedtime + 995 < gettime()) {
        self.lastsfxplayedtime = gettime();
        var_c3ddfb0eaa8f761c = "";
        progress = int(floor(progress * 10));
        var_c3ddfb0eaa8f761c = "mp_dom_capturing_tick_0" + progress;
        self.visuals[0] playsoundtoteam(var_c3ddfb0eaa8f761c, team);
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10d94
// Size: 0x2e
function function_8cbda65b25d7573c() {
    if (game["roundsPlayed"] > 0) {
        self playlocalsound("jup_mode_gunfight_newloadout_fade_in");
        wait(4);
        self playlocalsound("jup_mode_gunfight_newloadout_fade_out");
    } else {
        return;
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10dc9
// Size: 0x4c
function function_da1f3979f22bb288(var_ae88ea07db0620cf, alias, timer) {
    if (!isdefined(self.var_4efd1a215d3e63d6)) {
        playsoundatpos(var_ae88ea07db0620cf, alias);
        self.var_4efd1a215d3e63d6 = 1;
        wait(timer);
        self.var_4efd1a215d3e63d6 = undefined;
    } else {
        return;
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10e1c
// Size: 0x4c
function function_82b6a3e1bcda539b(var_ae88ea07db0620cf, alias, timer) {
    if (!isdefined(self.var_e264252f7f1f6def)) {
        playsoundatpos(var_ae88ea07db0620cf, alias);
        self.var_e264252f7f1f6def = 1;
        wait(timer);
        self.var_e264252f7f1f6def = undefined;
    } else {
        return;
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x10e6f
// Size: 0x718
function private function_5a0a68144c7a97fd(equipmentname) {
    if (isdefined(equipmentname)) {
        switch (equipmentname) {
        case #"hash_25ac81b822cf0c9f":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_STIM";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_stim";
            var_9b83efba8bfecc3f.worldmodel = "offhand_1h_wm_stim_v0";
            var_9b83efba8bfecc3f.equiptype = "secondary";
            return var_9b83efba8bfecc3f;
        case #"hash_3995658e01f4fac1":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_ATMINE";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_at_mine";
            var_9b83efba8bfecc3f.worldmodel = "offhand_2h_wm_proximity_mine_v0";
            var_9b83efba8bfecc3f.equiptype = "primary";
            return var_9b83efba8bfecc3f;
        case #"hash_e156752cb79526e8":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_BUNKERBUSTER";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_bunker_buster";
            var_9b83efba8bfecc3f.worldmodel = "offhand_2h_wm_bunker_buster_v0";
            var_9b83efba8bfecc3f.equiptype = "primary";
            return var_9b83efba8bfecc3f;
        case #"hash_4320d77f90725183":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_C4";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_c4";
            var_9b83efba8bfecc3f.worldmodel = "offhand_2h_wm_c4_v0";
            var_9b83efba8bfecc3f.equiptype = "primary";
            return var_9b83efba8bfecc3f;
        case #"hash_2354208d9af64220":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_CLAYMORE";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_claymore";
            var_9b83efba8bfecc3f.worldmodel = "offhand_2h_wm_claymore_v0";
            var_9b83efba8bfecc3f.equiptype = "primary";
            return var_9b83efba8bfecc3f;
        case #"hash_5fca4943a78ace9c":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_STUN";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_stun";
            var_9b83efba8bfecc3f.worldmodel = "offhand_1h_wm_grenade_concussion_v0";
            var_9b83efba8bfecc3f.equiptype = "secondary";
            return var_9b83efba8bfecc3f;
        case #"hash_15d06a7d7efafe8":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_DECOY";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_decoy";
            var_9b83efba8bfecc3f.worldmodel = "offhand_1h_wm_grenade_decoy_v0";
            var_9b83efba8bfecc3f.equiptype = "secondary";
            return var_9b83efba8bfecc3f;
        case #"hash_5a562592c930b7d6":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_FLASH";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_flash";
            var_9b83efba8bfecc3f.worldmodel = "offhand_1h_wm_grenade_flash_v0";
            var_9b83efba8bfecc3f.equiptype = "secondary";
            return var_9b83efba8bfecc3f;
        case #"hash_8c7819f0a3fbd1e0":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_FRAG";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_frag";
            var_9b83efba8bfecc3f.worldmodel = "offhand_2h_wm_grenade_frag_v0";
            var_9b83efba8bfecc3f.equiptype = "primary";
            return var_9b83efba8bfecc3f;
        case #"hash_4b4a6458f00d9319":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_HB_SENSOR";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_hb_sensor";
            var_9b83efba8bfecc3f.worldmodel = "offhand_1h_wm_tablet_v0";
            var_9b83efba8bfecc3f.equiptype = "secondary";
            return var_9b83efba8bfecc3f;
        case #"hash_142a787e36d7d7ce":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_MOLOTOV";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_molotov";
            var_9b83efba8bfecc3f.worldmodel = "offhand_2h_wm_molotov_v0";
            var_9b83efba8bfecc3f.equiptype = "primary";
            return var_9b83efba8bfecc3f;
        case #"hash_f0907f858c134cb4":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_SEMTEX";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_semtex";
            var_9b83efba8bfecc3f.worldmodel = "offhand_2h_wm_grenade_semtex_v0";
            var_9b83efba8bfecc3f.equiptype = "primary";
            return var_9b83efba8bfecc3f;
        case #"hash_8df9cfc147eb2d86":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_SHOCK_STICK";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_shock_stick";
            var_9b83efba8bfecc3f.worldmodel = "offhand_1h_wm_shock_stick_v0";
            var_9b83efba8bfecc3f.equiptype = "secondary";
            return var_9b83efba8bfecc3f;
        case #"hash_fb6b649176cec75d":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_SMOKE";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_smoke";
            var_9b83efba8bfecc3f.worldmodel = "offhand_1h_wm_grenade_smoke_v0";
            var_9b83efba8bfecc3f.equiptype = "secondary";
            return var_9b83efba8bfecc3f;
        case #"hash_4f62b5fa00ecd075":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_SNAPSHOT";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_snapshot";
            var_9b83efba8bfecc3f.worldmodel = "offhand_1h_wm_grenade_snapshot_v0";
            var_9b83efba8bfecc3f.equiptype = "secondary";
            return var_9b83efba8bfecc3f;
        case #"hash_de4641ddbc44a7ba":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_THERMITE";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_thermite";
            var_9b83efba8bfecc3f.worldmodel = "offhand_2h_wm_grenade_thermite_v0";
            var_9b83efba8bfecc3f.equiptype = "primary";
            return var_9b83efba8bfecc3f;
        case #"hash_9ba0a6ff6081954e":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_TKNIFE";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_throwing_knife";
            var_9b83efba8bfecc3f.worldmodel = "offhand_2h_wm_throwing_knife_v0";
            var_9b83efba8bfecc3f.equiptype = "primary";
            return var_9b83efba8bfecc3f;
        case #"hash_61206775eae1c854":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PICKUP_TSTAR";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_shuriken";
            var_9b83efba8bfecc3f.worldmodel = "offhand_2h_wm_throw_star_v0";
            var_9b83efba8bfecc3f.equiptype = "primary";
            return var_9b83efba8bfecc3f;
        case #"hash_3923e5c5f4d1f90a":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/SNOWBALL_PICKUP";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_snowball";
            var_9b83efba8bfecc3f.worldmodel = "decor_snowball_pyramid_01";
            var_9b83efba8bfecc3f.equiptype = "primary";
            return var_9b83efba8bfecc3f;
        case #"hash_3e0c07b5bc9dac1":
            var_9b83efba8bfecc3f = spawnstruct();
            var_9b83efba8bfecc3f.pickupstring = "MP_INGAME_ONLY/PBALL_PICKUP";
            var_9b83efba8bfecc3f.icon = "hud_icon_equipment_snowball_pball";
            var_9b83efba8bfecc3f.worldmodel = "weapon_wm_snowball_urine";
            var_9b83efba8bfecc3f.equiptype = "primary";
            return var_9b83efba8bfecc3f;
            break;
        }
    }
    return undefined;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1158f
// Size: 0x4c
function private function_bcfd6092fb52494f() {
    return [0:"ar", 1:"br", 2:"dm", 3:"lm", 4:"pi", 5:"sh", 6:"sm", 7:"sn"];
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x115e3
// Size: 0x12f
function private function_f8be37b178efc473(var_4930aed7df4f9479) {
    if (isdefined(var_4930aed7df4f9479)) {
        switch (var_4930aed7df4f9479) {
        case #"hash_d4f05e450448c3ec":
        case #"hash_fa18d2f6bd57925a":
            return "ar";
        case #"hash_747e7494f126391f":
        case #"hash_fa21c4f6bd5e3815":
            return "br";
        case #"hash_f4b0076c03d93738":
        case #"hash_fa0ed9f6bd4f4e9a":
            return "dm";
        case #"hash_339227cb650975db":
            return "lethal";
        case #"hash_2f2d546c2247838f":
        case #"hash_fa27b9f6bd62a3f2":
            return "lm";
        case #"hash_719417cb1de832b6":
        case #"hash_fa4dbdf6bd80bf52":
            return "pi";
        case #"hash_690c0d6a821b42e":
        case #"hash_fa50b4f6bd82efbe":
            return "sh";
        case #"hash_900cb96c552c5e8e":
        case #"hash_fa50b9f6bd82f79d":
            return "sm";
        case #"hash_6191aaef9f922f96":
        case #"hash_fa50b6f6bd82f2e4":
            return "sn";
        case #"hash_850999d7864fa3b4":
            return "tactical";
            break;
        }
    }
    return undefined;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1171a
// Size: 0xa3
function private getrandomweaponforweapontier(var_63573dfb900dd221) {
    if (issubstr(var_63573dfb900dd221, "rand")) {
        if (var_63573dfb900dd221 == "random") {
            return namespace_47e715c4f9510479::getrandomweapon();
        }
        tokens = strtok(var_63573dfb900dd221, "_", 1);
        /#
            assertex(isdefined(tokens) && tokens.size == 2 && tokens[0] == "rand", "Invalid random weapon specifier: " + var_63573dfb900dd221);
        #/
        var_4930aed7df4f9479 = namespace_47e715c4f9510479::function_f8be37b178efc473(tokens[1]);
        /#
            assertex(isdefined(var_4930aed7df4f9479), "Invalid random weapon category "" + var_4930aed7df4f9479 + "" in weapon specifier: " + var_63573dfb900dd221);
        #/
        return namespace_47e715c4f9510479::getrandomweaponfromcategory(var_4930aed7df4f9479);
    }
    return var_63573dfb900dd221;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x117c5
// Size: 0x21
function private getrandomweapon() {
    var_4930aed7df4f9479 = namespace_3c37cb17ade254d::function_7a2aaa4a09a4d250(namespace_47e715c4f9510479::function_bcfd6092fb52494f());
    return namespace_47e715c4f9510479::getrandomweaponfromcategory(var_4930aed7df4f9479);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x117ee
// Size: 0x50
function private getrandomweaponfromcategory(var_4930aed7df4f9479) {
    if (!isdefined(game["arenaWeaponCategories"])) {
        return "none";
    }
    if (!isdefined(game["arenaWeaponCategories"][var_4930aed7df4f9479]) || game["arenaWeaponCategories"][var_4930aed7df4f9479].size == 0) {
        return "none";
    }
    return namespace_3c37cb17ade254d::function_7a2aaa4a09a4d250(game["arenaWeaponCategories"][var_4930aed7df4f9479]);
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11846
// Size: 0x74
function function_11a6a3ec5c206652(weaponname) {
    if (!isdefined(game["arenaWeapons"]) || !isdefined(game["arenaWeapons"][weaponname])) {
        return -1;
    }
    if (game["arenaWeapons"][weaponname].blueprints.size > 0) {
        var_5f01a4f51a4fd8d1 = namespace_3c37cb17ade254d::function_7a2aaa4a09a4d250(game["arenaWeapons"][weaponname].blueprints);
        return var_5f01a4f51a4fd8d1.id;
    }
    return -1;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x118c2
// Size: 0x1aa
function private function_10cea0880b71973a() {
    if (!isdefined(game["arenaWeaponCategories"])) {
        game["arenaWeaponCategories"] = [];
    }
    game["arenaWeaponCategories"]["lethal"] = [];
    game["arenaWeaponCategories"]["tactical"] = [];
    var_4fb2a4f952c69478 = "arena_equipment_table_lethal_iw9_mp";
    var_ab30739970abc53 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_49799bd1f8bda011", var_4fb2a4f952c69478));
    /#
        assertex(isdefined(var_ab30739970abc53), "Unable to find script bundle associated with equipment table: " + var_4fb2a4f952c69478);
    #/
    if (isdefined(var_ab30739970abc53)) {
        foreach (equipment in var_ab30739970abc53.var_a1a3722fb9707783) {
            game["arenaWeaponCategories"]["lethal"][game["arenaWeaponCategories"]["lethal"].size] = equipment.equipmentname;
        }
    }
    var_8ef2530a2b79d56f = "arena_equipment_table_tactical_iw9_mp";
    var_5cec6ca6494b24 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_49799bd1f8bda011", var_8ef2530a2b79d56f));
    /#
        assertex(isdefined(var_5cec6ca6494b24), "Unable to find script bundle associated with equipment table: " + var_8ef2530a2b79d56f);
    #/
    if (isdefined(var_5cec6ca6494b24)) {
        foreach (equipment in var_5cec6ca6494b24.var_a1a3722fb9707783) {
            game["arenaWeaponCategories"]["tactical"][game["arenaWeaponCategories"]["tactical"].size] = equipment.equipmentname;
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11a73
// Size: 0x18d
function function_b7c18ded2347456c() {
    if (!isdefined(game["arenaWeaponCategories"])) {
        game["arenaWeaponCategories"] = [];
    }
    weaponcategories = namespace_47e715c4f9510479::function_bcfd6092fb52494f();
    var_ac35fe7145852ee1 = tolower(function_3cb5da19764baa3()) + "_mp";
    foreach (var_4930aed7df4f9479 in weaponcategories) {
        game["arenaWeaponCategories"][var_4930aed7df4f9479] = [];
        var_c67243a779c0e924 = namespace_3c37cb17ade254d::function_996b01cd49d0128d([0:"arena_weapon_table", 1:var_4930aed7df4f9479, 2:var_ac35fe7145852ee1], "_");
        var_e1898741919f6aaf = getscriptbundle(function_2ef675c13ca1c4af(%"hash_6946961762bbe55b", var_c67243a779c0e924));
        /#
            assertex(isdefined(var_e1898741919f6aaf), "Unable to find script bundle associated with weapon table: " + var_c67243a779c0e924);
        #/
        if (!isdefined(var_e1898741919f6aaf)) {
            continue;
        }
        foreach (weapon in var_e1898741919f6aaf.weaponlist) {
            var_49e6ef3edadd524e = namespace_47e715c4f9510479::function_d0fb12b63980c3a4(weapon.var_a5e6a8a5e3c7b581);
            if (isdefined(var_49e6ef3edadd524e) && var_49e6ef3edadd524e != "none") {
                game["arenaWeaponCategories"][var_4930aed7df4f9479][game["arenaWeaponCategories"][var_4930aed7df4f9479].size] = var_49e6ef3edadd524e;
            }
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11c07
// Size: 0x232
function private function_de46980d57f0c37a() {
    weaponcategories = [];
    var_6bbf329f0b15a970 = !namespace_47e715c4f9510479::israndomarloadouts() && !namespace_47e715c4f9510479::israndomsmgloadouts() && !namespace_47e715c4f9510479::israndomlmgloadouts() && !namespace_47e715c4f9510479::israndompistolloadouts() && !namespace_47e715c4f9510479::israndomshotgunloadouts() && !namespace_47e715c4f9510479::israndomsniperloadouts();
    if (istrue(var_6bbf329f0b15a970) || namespace_47e715c4f9510479::israndomarloadouts()) {
        weaponcategories[weaponcategories.size] = "ar";
        weaponcategories[weaponcategories.size] = "br";
    }
    if (istrue(var_6bbf329f0b15a970) || namespace_47e715c4f9510479::israndomsmgloadouts()) {
        weaponcategories[weaponcategories.size] = "sm";
    }
    if (istrue(var_6bbf329f0b15a970) || namespace_47e715c4f9510479::israndomlmgloadouts()) {
        weaponcategories[weaponcategories.size] = "lm";
    }
    if (istrue(var_6bbf329f0b15a970) || namespace_47e715c4f9510479::israndompistolloadouts()) {
        weaponcategories[weaponcategories.size] = "pi";
    }
    if (istrue(var_6bbf329f0b15a970) || namespace_47e715c4f9510479::israndomshotgunloadouts()) {
        weaponcategories[weaponcategories.size] = "sh";
    }
    if (istrue(var_6bbf329f0b15a970) || namespace_47e715c4f9510479::israndomsniperloadouts()) {
        weaponcategories[weaponcategories.size] = "sn";
        weaponcategories[weaponcategories.size] = "dm";
    }
    var_ac35fe7145852ee1 = tolower(function_3cb5da19764baa3()) + "_mp";
    foreach (var_4930aed7df4f9479 in weaponcategories) {
        classtablename = namespace_3c37cb17ade254d::function_996b01cd49d0128d([0:"arena_class_table", 1:var_4930aed7df4f9479, 2:var_ac35fe7145852ee1], "_");
        var_6ab15b7ea89d055d = getscriptbundle(function_2ef675c13ca1c4af(%"hash_2e0802494805f439", classtablename));
        /#
            assertex(isdefined(var_6ab15b7ea89d055d), "Unable to find script bundle associated with class table: " + classtablename);
        #/
        if (!isdefined(var_6ab15b7ea89d055d)) {
            continue;
        }
        foreach (class in var_6ab15b7ea89d055d.var_8d5460be7db831c3) {
            namespace_47e715c4f9510479::function_c20500181ea66dc8(class.var_5ff608a2cf5c041b);
        }
    }
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x11e40
// Size: 0x2b9
function private function_d0fb12b63980c3a4(var_a5e6a8a5e3c7b581) {
    /#
        assertex(isdefined(level.weaponmapdata), "Weapon map has not been initialized");
    #/
    if (!isdefined(level.weaponmapdata)) {
        return "none";
    }
    if (!isdefined(var_a5e6a8a5e3c7b581) || var_a5e6a8a5e3c7b581 == "") {
        return "none";
    }
    var_ad06b30a27981c99 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_318bec5c5fa0dd65", var_a5e6a8a5e3c7b581));
    /#
        assertex(isdefined(var_ad06b30a27981c99), "Unable to find script bundle associated with weapon table entry: " + var_a5e6a8a5e3c7b581);
    #/
    if (!isdefined(var_ad06b30a27981c99)) {
        return "none";
    }
    if (!isdefined(game["arenaWeapons"])) {
        game["arenaWeapons"] = [];
    } else if (isdefined(game["arenaWeapons"][var_ad06b30a27981c99.rootname])) {
        return var_ad06b30a27981c99.rootname;
    }
    game["arenaWeapons"][var_ad06b30a27981c99.rootname] = spawnstruct();
    game["arenaWeapons"][var_ad06b30a27981c99.rootname].rootname = var_ad06b30a27981c99.rootname;
    game["arenaWeapons"][var_ad06b30a27981c99.rootname].blueprints = [];
    if (namespace_47e715c4f9510479::function_c0c1519b5cfb9bd5()) {
        blueprints = function_bb92a5000082832a(level.weaponmapdata[var_ad06b30a27981c99.rootname].assetname);
        foreach (blueprintname, var_6cec5443c5a603c1 in blueprints) {
            foreach (var_89a1bfd436d69e12 in var_ad06b30a27981c99.var_e5d6e73468b763d4) {
                if (var_89a1bfd436d69e12.blueprintname == blueprintname) {
                    blueprintindex = game["arenaWeapons"][var_ad06b30a27981c99.rootname].blueprints.size;
                    game["arenaWeapons"][var_ad06b30a27981c99.rootname].blueprints[blueprintindex] = spawnstruct();
                    game["arenaWeapons"][var_ad06b30a27981c99.rootname].blueprints[blueprintindex].name = blueprintname;
                    game["arenaWeapons"][var_ad06b30a27981c99.rootname].blueprints[blueprintindex].id = var_6cec5443c5a603c1;
                }
            }
        }
    }
    return var_ad06b30a27981c99.rootname;
}

// Namespace arena/namespace_47e715c4f9510479
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x12101
// Size: 0x5da
function private function_c20500181ea66dc8(var_5ff608a2cf5c041b) {
    if (!isdefined(var_5ff608a2cf5c041b)) {
        return;
    }
    var_344c92bda1a2ddfb = getscriptbundle(function_2ef675c13ca1c4af(%"hash_7af4f547630fa97", var_5ff608a2cf5c041b));
    /#
        assertex(isdefined(var_344c92bda1a2ddfb), "Unable to find script bundle associated with class table entry: " + var_5ff608a2cf5c041b);
    #/
    if (!isdefined(var_344c92bda1a2ddfb)) {
        return;
    }
    var_28abc316a4b48e40 = !namespace_47e715c4f9510479::israndomnoattachmentloadouts();
    if (!isdefined(game["arenaLoadouts"])) {
        game["arenaLoadouts"] = [];
    }
    loadoutindex = game["arenaLoadouts"].size;
    var_cd5f58507f5977d2 = namespace_47e715c4f9510479::function_d0fb12b63980c3a4(var_344c92bda1a2ddfb.primaryweapon.var_a5e6a8a5e3c7b581);
    if (!isdefined(var_cd5f58507f5977d2) || var_cd5f58507f5977d2 == "none") {
        return;
    }
    var_31fa4bcdedee4712 = namespace_47e715c4f9510479::function_d0fb12b63980c3a4(var_344c92bda1a2ddfb.secondaryweapon.var_a5e6a8a5e3c7b581);
    if (!isdefined(var_31fa4bcdedee4712)) {
        return;
    }
    if (namespace_47e715c4f9510479::function_c0c1519b5cfb9bd5()) {
        if (!isdefined(game["arenaWeapons"][var_cd5f58507f5977d2].blueprints) || game["arenaWeapons"][var_cd5f58507f5977d2].blueprints.size == 0) {
            return;
        }
        if (var_31fa4bcdedee4712 != "none" && (!isdefined(game["arenaWeapons"][var_31fa4bcdedee4712].blueprints) || game["arenaWeapons"][var_31fa4bcdedee4712].blueprints.size == 0)) {
            return;
        }
    }
    game["arenaLoadouts"][loadoutindex]["loadoutPrimary"] = var_cd5f58507f5977d2;
    game["arenaLoadouts"][loadoutindex]["loadoutPrimaryAttachment"] = namespace_3c37cb17ade254d::ter_op(var_28abc316a4b48e40, var_344c92bda1a2ddfb.primaryweapon.attachment1, "none");
    game["arenaLoadouts"][loadoutindex]["loadoutPrimaryAttachment1"] = namespace_3c37cb17ade254d::ter_op(var_28abc316a4b48e40, var_344c92bda1a2ddfb.primaryweapon.attachment2, "none");
    game["arenaLoadouts"][loadoutindex]["loadoutPrimaryAttachment2"] = namespace_3c37cb17ade254d::ter_op(var_28abc316a4b48e40, var_344c92bda1a2ddfb.primaryweapon.attachment3, "none");
    game["arenaLoadouts"][loadoutindex]["loadoutPrimaryAttachment3"] = namespace_3c37cb17ade254d::ter_op(var_28abc316a4b48e40, var_344c92bda1a2ddfb.primaryweapon.attachment4, "none");
    game["arenaLoadouts"][loadoutindex]["loadoutPrimaryAttachment4"] = namespace_3c37cb17ade254d::ter_op(var_28abc316a4b48e40, var_344c92bda1a2ddfb.primaryweapon.attachment5, "none");
    game["arenaLoadouts"][loadoutindex]["loadoutPrimaryAttachment5"] = namespace_3c37cb17ade254d::ter_op(var_28abc316a4b48e40, var_344c92bda1a2ddfb.primaryweapon.attachment6, "none");
    game["arenaLoadouts"][loadoutindex]["loadoutPrimaryCamo"] = var_344c92bda1a2ddfb.primaryweapon.camo;
    game["arenaLoadouts"][loadoutindex]["loadoutPrimaryReticle"] = var_344c92bda1a2ddfb.primaryweapon.reticle;
    game["arenaLoadouts"][loadoutindex]["loadoutPrimaryVariantID"] = namespace_47e715c4f9510479::function_11a6a3ec5c206652(var_cd5f58507f5977d2);
    game["arenaLoadouts"][loadoutindex]["loadoutPrimaryAddBlueprintAttachments"] = function_c0c1519b5cfb9bd5();
    game["arenaLoadouts"][loadoutindex]["loadoutSecondary"] = var_31fa4bcdedee4712;
    game["arenaLoadouts"][loadoutindex]["loadoutSecondaryAttachment"] = namespace_3c37cb17ade254d::ter_op(var_28abc316a4b48e40, var_344c92bda1a2ddfb.secondaryweapon.attachment1, "none");
    game["arenaLoadouts"][loadoutindex]["loadoutSecondaryAttachment1"] = namespace_3c37cb17ade254d::ter_op(var_28abc316a4b48e40, var_344c92bda1a2ddfb.secondaryweapon.attachment2, "none");
    game["arenaLoadouts"][loadoutindex]["loadoutSecondaryAttachment2"] = namespace_3c37cb17ade254d::ter_op(var_28abc316a4b48e40, var_344c92bda1a2ddfb.secondaryweapon.attachment3, "none");
    game["arenaLoadouts"][loadoutindex]["loadoutSecondaryAttachment3"] = namespace_3c37cb17ade254d::ter_op(var_28abc316a4b48e40, var_344c92bda1a2ddfb.secondaryweapon.attachment4, "none");
    game["arenaLoadouts"][loadoutindex]["loadoutSecondaryAttachment4"] = namespace_3c37cb17ade254d::ter_op(var_28abc316a4b48e40, var_344c92bda1a2ddfb.secondaryweapon.attachment5, "none");
    game["arenaLoadouts"][loadoutindex]["loadoutSecondaryAttachment5"] = namespace_3c37cb17ade254d::ter_op(var_28abc316a4b48e40, var_344c92bda1a2ddfb.secondaryweapon.attachment6, "none");
    game["arenaLoadouts"][loadoutindex]["loadoutSecondaryCamo"] = var_344c92bda1a2ddfb.secondaryweapon.camo;
    game["arenaLoadouts"][loadoutindex]["loadoutSecondaryReticle"] = var_344c92bda1a2ddfb.secondaryweapon.reticle;
    game["arenaLoadouts"][loadoutindex]["loadoutSecondaryVariantID"] = namespace_47e715c4f9510479::function_11a6a3ec5c206652(var_31fa4bcdedee4712);
    game["arenaLoadouts"][loadoutindex]["loadoutSecondaryAddBlueprintAttachments"] = function_c0c1519b5cfb9bd5();
    game["arenaLoadouts"][loadoutindex]["loadoutEquipmentPrimary"] = var_344c92bda1a2ddfb.var_37241be71faf029e;
    game["arenaLoadouts"][loadoutindex]["loadoutEquipmentSecondary"] = var_344c92bda1a2ddfb.var_37241ae71faf006b;
    game["arenaLoadouts"][loadoutindex]["loadoutFieldUpgrade1"] = var_344c92bda1a2ddfb.var_7e397f4ce66bffd0;
    game["arenaLoadouts"][loadoutindex]["loadoutFieldUpgrade2"] = var_344c92bda1a2ddfb.var_7e39824ce66c0669;
    game["arenaLoadouts"][loadoutindex]["loadoutPerks"] = [];
    game["arenaLoadouts"][loadoutindex]["loadoutPerks"][0] = var_344c92bda1a2ddfb.perk1;
    game["arenaLoadouts"][loadoutindex]["loadoutPerks"][1] = var_344c92bda1a2ddfb.perk2;
    game["arenaLoadouts"][loadoutindex]["loadoutPerks"][2] = var_344c92bda1a2ddfb.perk3;
    game["arenaLoadouts"][loadoutindex]["loadoutPerks"][3] = var_344c92bda1a2ddfb.var_16680fbd1742cb4f;
    game["arenaLoadouts"][loadoutindex]["loadoutGesture"] = "playerdata";
    game["arenaLoadouts"][loadoutindex]["loadoutExecution"] = "playerdata";
}

// Namespace arena/namespace_47e715c4f9510479
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x126e2
// Size: 0x20f
function private function_ee47e658f5b6314e() {
    /#
        level endon("camo_d_04");
        setdvar(@"hash_886f8f08dbf3df5f", "camo_l_02");
        while (1) {
            waitframe();
            dvarvalue = getdvar(@"hash_886f8f08dbf3df5f");
            if (dvarvalue == "camo_l_02") {
                continue;
            }
            setdvar(@"hash_886f8f08dbf3df5f", "camo_l_02");
            tokens = strtok(dvarvalue, "camo_o_04");
            if (!isdefined(tokens) || tokens.size == 0) {
                continue;
            }
            command = tokens[0];
            arglist = namespace_3c37cb17ade254d::array_slice(tokens, 1);
            player = level.players[0];
            if (!isdefined(player)) {
                continue;
            }
            switch (command) {
            case #"hash_358fc11dad418a55":
                if (arglist.size == 0) {
                    player notify("camo_b_06");
                } else if (arglist.size < 1 || int(arglist[0]) < 1) {
                    iprintlnbold("camo_n_07");
                } else {
                    thread function_c452035f58a6ad0e(player, int(arglist[0]));
                }
                break;
            case #"hash_9d9755ce454b0010":
                if (arglist.size == 0) {
                    player notify("camo_b_12");
                    player notify("camo_f_14");
                } else if (arglist.size < 1 || int(arglist[0]) < 1) {
                    iprintlnbold("getClassTables: Failed to find script bundle for arena loadouts.");
                } else {
                    thread function_5dd6bdb4dfced5ba(player, int(arglist[0]));
                }
                break;
            case #"hash_4db5d4970492f541":
                if (arglist.size == 0) {
                    player notify("camo_f_14");
                } else if (arglist.size < 2 || arglist[0] == "camo_l_02" || int(arglist[1]) < 1) {
                    iprintlnbold("enemy");
                } else {
                    thread function_d70a085b24e94e4b(player, arglist[0], int(arglist[1]));
                }
                break;
            default:
                iprintlnbold("outline_depth_white" + command);
                break;
            }
        }
    #/
}

// Namespace arena/namespace_47e715c4f9510479
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x128f8
// Size: 0xdc
function private function_c452035f58a6ad0e(player, var_8dfc0a6a9058e951) {
    /#
        level endon("camo_d_04");
        player endon("waypoint_losing");
        player notify("camo_b_06");
        player endon("camo_b_06");
        if (!isdefined(game["loadoutKillstreak2"])) {
            error("waypoint_defend_a");
            return;
        }
        level.perks_suppressasserts = 1;
        thread function_bac839c909252aeb(player, "camo_b_06", player.pers["hud_icon_equipment_decoy"]);
        for (i = 0; i < game["loadoutKillstreak2"].size; i++) {
            player.pers["hud_icon_equipment_decoy"] = game["loadoutKillstreak2"][i];
            player namespace_d19129e4fa5d176::giveloadout(player.team, "offhand_2h_wm_grenade_semtex_v0");
            wait(var_8dfc0a6a9058e951);
        }
        player notify("camo_b_06");
        level.perks_suppressasserts = 0;
    #/
}

// Namespace arena/namespace_47e715c4f9510479
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x129db
// Size: 0xab
function private function_5dd6bdb4dfced5ba(player, var_8dfc0a6a9058e951) {
    /#
        level endon("camo_d_04");
        player endon("waypoint_losing");
        player notify("camo_b_12");
        player endon("camo_b_12");
        if (!isdefined(game["offhand_1h_wm_grenade_snapshot_v0"])) {
            error("MP_INGAME_ONLY/PBALL_PICKUP");
            return;
        }
        foreach (weapon in game["offhand_1h_wm_grenade_snapshot_v0"]) {
            function_d70a085b24e94e4b(player, weapon.rootname, var_8dfc0a6a9058e951);
        }
    #/
}

// Namespace arena/namespace_47e715c4f9510479
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x12a8d
// Size: 0x124
function private function_d70a085b24e94e4b(player, weaponname, var_8dfc0a6a9058e951) {
    /#
        level endon("camo_d_04");
        player endon("waypoint_losing");
        player notify("camo_f_14");
        player endon("camo_f_14");
        if (!isdefined(game["offhand_1h_wm_grenade_snapshot_v0"])) {
            error("<unknown string>");
            return;
        }
        weapon = game["offhand_1h_wm_grenade_snapshot_v0"][weaponname];
        if (!isdefined(weapon)) {
            error("<unknown string>");
            return;
        }
        var_9ef97db737b5030e = player.primaryweaponobj;
        player namespace_df5cfdbe6e2d3812::_takeweapon(var_9ef97db737b5030e);
        thread function_a554b9ddc3d15ec5(player, "camo_f_14", var_9ef97db737b5030e);
        for (i = 0; i < weapon.blueprints.size; i++) {
            weaponobject = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(weaponname, undefined, undefined, weapon.blueprints[i].id);
            player namespace_df5cfdbe6e2d3812::_giveweapon(weaponobject);
            player namespace_df5cfdbe6e2d3812::_switchtoweaponimmediate(weaponobject);
            wait(var_8dfc0a6a9058e951);
            player namespace_df5cfdbe6e2d3812::_takeweapon(weaponobject);
        }
        player notify("camo_f_14");
    #/
}

// Namespace arena/namespace_47e715c4f9510479
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x12bb8
// Size: 0x5c
function private function_bac839c909252aeb(player, notifystring, loadout) {
    /#
        level endon("camo_d_04");
        player endon("waypoint_losing");
        player waittill(notifystring);
        player.pers["hud_icon_equipment_decoy"] = loadout;
        player namespace_d19129e4fa5d176::giveloadout(player.team, "offhand_2h_wm_grenade_semtex_v0");
    #/
}

// Namespace arena/namespace_47e715c4f9510479
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x12c1b
// Size: 0x43
function private function_a554b9ddc3d15ec5(player, notifystring, weaponobject) {
    /#
        level endon("camo_d_04");
        player endon("waypoint_losing");
        player waittill(notifystring);
        player namespace_df5cfdbe6e2d3812::_giveweapon(weaponobject);
        player namespace_df5cfdbe6e2d3812::_switchtoweaponimmediate(weaponobject);
    #/
}

