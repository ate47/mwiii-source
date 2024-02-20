// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_48814951e916af89;
#using script_120270bd0a747a35;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using script_65df1ea6c7e0b8ce;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\calloutmarkerping_mp.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\mp\gametypes\obj_dogtag.gsc;
#using scripts\mp\flashpoint.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\cranked.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using script_293ba44c408fef1;
#using script_2d9d24f7c63ac143;
#using scripts\mp\class.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_53da3333b83b3527;
#using scripts\stealth\player.gsc;
#using scripts\mp\lightarmor.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using scripts\common\ui.gsc;
#using scripts\engine\trace.gsc;
#using script_600b944a95c3a7bf;
#using script_3f1b6713ca4c9c7;
#using scripts\mp\gametypes\br_plunder.gsc;
#using script_371b4c2ab5861e62;
#using scripts\mp\utility\print.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\cp_mp\killstreaks\airdrop_multiple.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\spawnselection.gsc;
#using script_451a1a9bd9613164;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\utility\stats.gsc;

#namespace common;

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1526
// Size: 0xc5
function setupcommoncallbacks() {
    level.onnormaldeath = &oncommonnormaldeath;
    level.onsuicidedeath = &oncommonsuicidedeath;
    level.onteamchangedeath = &oncommonteamchangedeath;
    addspecialistdialog();
    if (isusingmatchrulesdata()) {
        level.var_6b6ab19619b97010 = &function_6b6ab19619b97010;
        [[ level.var_6b6ab19619b97010 ]]();
    }
    function_9081e2d33d0b53f9();
    function_e9ad38af5a6bedcd();
    function_8d478840c4e44366();
    function_36532a1506f2c161();
    function_30dd74b21bfffe6();
    function_52343d5c1b190cf0();
    function_1513c3f71e935d73();
    level.spawnprotectionexception = undefined;
    namespace_1309ce202b9aa92b::registeronplayerjointeamcallback(&onplayerjointeamcommon);
    registerdogtagsenableddvar(getgametype(), 0);
    level._effect["cranked_explode"] = loadfx("vfx/iw9/dmz/bombsite/vfx_dmz_bombsite_expl.vfx");
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f2
// Size: 0x144
function function_6b6ab19619b97010() {
    setdynamicdvar(@"hash_8d99f31dd75fcf9c", getmatchrulesdata("commonOption", "aiSpawnOnDeath"));
    setdynamicdvar(@"hash_148266ea4825c4b0", getmatchrulesdata("commonOption", "aiSpawnOnDeath"));
    setdynamicdvar(@"hash_ba25fabade697401", getmatchrulesdata("commonOption", "buyMode"));
    setdynamicdvar(@"hash_4e33f79a5437aa5c", getmatchrulesdata("commonOption", "classForceLoadouts"));
    setdynamicdvar(@"hash_a88f1329561bc6e1", getmatchrulesdata("commonOption", "carePackageDropTime"));
    setdynamicdvar(@"hash_127490a7577f169f", getmatchrulesdata("commonOption", "tier1ModeEnabled"));
    setdynamicdvar(@"hash_a2c2c2007177185e", getmatchrulesdata("commonOption", "hardcoreModeOn"));
    setdynamicdvar(@"hash_58f6ddd5e5892406", getmatchrulesdata("commonOption", "allowCalloutMarkerPing"));
    setdynamicdvar(@"hash_d20b1b97fdefa92a", getmatchrulesdata("commonOption", "allowCalloutMarkerPing"));
    if (getdvarint(@"hash_969da081cdd3cead", 0)) {
        setdynamicdvar(@"hash_8d99f31dd75fcf9c", 1);
        setdynamicdvar(@"hash_148266ea4825c4b0", 0);
    }
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x173d
// Size: 0x14
function private function_1ad07a0f83834639(params) {
    namespace_f8d3520d3483c1::initarmor(0);
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1758
// Size: 0x5c
function function_3149b2e03ce13dd9() {
    level.usepingsystem = getdvarint(@"hash_58f6ddd5e5892406", 1);
    if (istrue(level.usepingsystem)) {
        namespace_65c7485efe2b8314::calloutmarkerping_init();
    }
    level callback::add("player_connect", &function_1ad07a0f83834639);
    level namespace_71eef510d7f364cf::registeronplayerspawncallback(&namespace_f8d3520d3483c1::givestartingarmor);
    level namespace_3846cfb60b2ef12f::registeronluieventcallback(&namespace_f8d3520d3483c1::function_13caa305c839a278);
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17bb
// Size: 0x83
function updatecommongametypedvars() {
    level.dogtagsenabled = dvarintvalue("dogtags", 0, 0, 1);
    if (level.dogtagsenabled) {
        namespace_ba880bc821ba2f06::init();
    }
    level.mtxKillThresholdStage1 = dvarintvalue("mtxKillThresholdStage1", 10, 1, 20);
    level.mtxKillThresholdStage2 = dvarintvalue("mtxKillThresholdStage2", 20, 1, 20);
    /#
        assertex(level.mtxKillThresholdStage1 < level.mtxKillThresholdStage2, "The mtx kill threshold for stage 1 must be less than stage 2");
    #/
}

// Namespace common/namespace_310ba947928891df
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1845
// Size: 0x4cf
function oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    score = 0;
    if (isbot(self) && isdefined(self.isbotmedicrole)) {
        self.isbotmedicrole = undefined;
    }
    if (istrue(level.flashpointactive) && isdefined(attacker) && isdefined(attacker.team)) {
        namespace_8af839578a30040a::flashpoint_processnewevent(attacker, victim, gettime(), "kill_by_" + attacker.team);
    }
    if (isdefined(attacker.var_acb55a437c3145c0) && isdefined(attacker.var_acb55a437c3145c0.objweapon) && attacker.var_acb55a437c3145c0.objweapon.basename == "iw9_racecar_mp") {
        return 1;
    }
    var_e67514ba22eec9cb = islaststandenabled() && istrue(victim.playergoingintols);
    if (!var_e67514ba22eec9cb && isdefined(attacker.team) && attacker.team != self.team) {
        var_605b9986ce6166a1 = level.scoremod["death"] * -1;
        if (var_605b9986ce6166a1 != 0) {
            if (level.teambased) {
                level namespace_e8a49b70d0769b66::giveteamscoreforobjective(victim.pers["team"], var_605b9986ce6166a1, 0);
            } else {
                attacker namespace_e8a49b70d0769b66::giveplayerscore(#"kill", var_605b9986ce6166a1);
            }
        }
        score = level.scoremod["kill"];
        if (istrue(iskillstreakweapon)) {
            score = score + level.scoremod["kskill"];
        }
        if (meansofdeath == "MOD_HEAD_SHOT") {
            score = score + level.scoremod["headshot"];
        }
        if (level.dogtagsenabled && gameflag("prematch_done")) {
            level thread namespace_ba880bc821ba2f06::spawndogtags(victim, attacker, "new_tag_spawned", meansofdeath);
        }
    }
    if (level.gametype != "havoc" && (function_f698bfd3efa33302() || function_e9f3a160bbefe208(attacker) || function_e9f3a160bbefe208(victim))) {
        if (matchmakinggame() && isdefined(attacker.cranked)) {
            if (!var_e67514ba22eec9cb && score != 0) {
                score = score + 1;
                attacker thread namespace_62c556437da28f50::scoreeventpopup(function_2ef675c13ca1c4af(#"hash_2c8bcbb02ec7ff9b", score));
            }
        }
        attacker namespace_58012cf453ba1014::oncranked(victim, attacker, lifeid);
    }
    if (function_c1cddd7ae3bc2698()) {
        ismeleeweapon = isriotshield(objweapon.basename);
        isknife = isknifeonly(objweapon.basename) || isakimbomeleeweapon(objweapon.basename) || isaxeweapon(objweapon.basename) || ismeleeoverrideweapon(objweapon);
        var_6a7de031c0d6ffa9 = isdefined(meansofdeath) && meansofdeath == "MOD_EXECUTION";
        if (meansofdeath == "MOD_FALLING" || attacker == self || meansofdeath == "MOD_MELEE" && isknife) {
            score = 0;
            var_f17d3f22c2a80dca = getteamscore(victim.pers["team"]);
            if (var_f17d3f22c2a80dca > 0 && !(var_f17d3f22c2a80dca % level.var_ff35df662c18a63d == 0)) {
                level namespace_e8a49b70d0769b66::giveteamscoreforobjective(victim.pers["team"], -1, 0);
            }
        }
    }
    if (score != 0) {
        if (level.teambased) {
            level namespace_e8a49b70d0769b66::giveteamscoreforobjective(attacker.pers["team"], score, 0);
        } else {
            attacker namespace_e8a49b70d0769b66::giveplayerscore(#"kill", score, victim);
        }
    }
    var_f4143542f608e034 = 1;
    if (isdefined(level.var_5df506226294aa65)) {
        level thread [[ level.var_5df506226294aa65 ]](victim, attacker);
    }
    if (istrue(level.dropArmorOnDeath)) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        victim namespace_cb965d2f71fefddc::dropbrhealthpack(dropstruct);
    }
    if (namespace_36f464722d326bbe::function_21322da268e71c19() && getdvarint(@"hash_6ce02fdc43b4f5cf", 0) != 0) {
        victim function_7bac8ee72285298e();
    }
    if (isplayer(attacker) && !namespace_36f464722d326bbe::isBRStyleGameType()) {
        var_4da4cb52d0bf5b05 = meansofdeath == "MOD_HEAD_SHOT";
        var_4da4cb52d0bf5b05 = var_4da4cb52d0bf5b05 + (level.scoremod["kill"] << 4);
        attacker function_417749e099f041f(var_4da4cb52d0bf5b05, victim getentitynumber());
    }
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d1b
// Size: 0x99
function oncommonsuicidedeath(victim) {
    if (function_f698bfd3efa33302() || function_e9f3a160bbefe208(victim)) {
        victim namespace_58012cf453ba1014::cleanupcrankedplayertimer();
    }
    if (isdefined(level.scoremod)) {
        var_605b9986ce6166a1 = level.scoremod["death"] * -1;
        if (var_605b9986ce6166a1 != 0) {
            if (level.teambased) {
                level namespace_e8a49b70d0769b66::giveteamscoreforobjective(victim.pers["team"], var_605b9986ce6166a1, 0);
            }
        }
    }
    if (isdefined(level.modeonsuicidedeath)) {
        [[ level.modeonsuicidedeath ]](victim);
    }
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dbb
// Size: 0x42
function oncommonteamchangedeath(victim) {
    if (function_f698bfd3efa33302() || function_e9f3a160bbefe208(victim)) {
        victim namespace_58012cf453ba1014::cleanupcrankedplayertimer();
    }
    if (isdefined(level.modeonteamchangedeath)) {
        [[ level.modeonteamchangedeath ]](victim);
    }
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e04
// Size: 0xc
function dogtagcommonallyonusecb(player) {
    
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e17
// Size: 0xc
function dogtagcommonenemyonusecb(player) {
    
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e2a
// Size: 0x178
function onspawnplayercommon(var_9156b53bcf7ce573) {
    if (istrue(game["inLiveLobby"])) {
        var_949548949727d77e = istrue(level.allowprematchdamage) && istrue(level.spawnprotectiontimer);
        thread managespawnprotection(var_949548949727d77e);
    } else if (istrue(level.spawnprotectiontimer) && !istrue(var_9156b53bcf7ce573)) {
        if (isdefined(level.spawnprotectionexception)) {
            if ([[ level.spawnprotectionexception ]]()) {
                thread managespawnprotection(1);
            }
        } else {
            thread managespawnprotection(1);
        }
    }
    if (isteamreviveenabled()) {
        thread namespace_7db13bdf599e41a6::updaterevivetriggerspawnposition();
    }
    if (istrue(level.disablesupersprint)) {
        self allowsupersprint(0);
    }
    if (istrue(level.disablemount)) {
        self allowmountside(0);
        self allowmounttop(0);
    }
    if (namespace_82dcd1d5ae30ff7::function_d327b07e25d475e1()) {
        namespace_44abc05161e2e2cb::showsplash("equipped_perks_mp");
    }
    if (isdefined(level.modeonspawnplayer)) {
        [[ level.modeonspawnplayer ]](var_9156b53bcf7ce573);
    } else {
        thread updatematchstatushintonspawncommon();
    }
    if (getgametypenumlives() != 0) {
        updatealiveomnvars();
    }
    if (istrue(game["practiceRound"])) {
        if (istrue(level.snowballfight)) {
            thread snowballfighthint();
        } else {
            self sethudtutorialmessage("MP_INGAME_ONLY/PRACTICE_ROUND", 1);
        }
    } else if (!isagent(self)) {
        self clearhudtutorialmessage();
    }
    if (isdefined(level.var_adb18014bbfc01a8)) {
        self [[ level.var_adb18014bbfc01a8 ]]();
    }
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fa9
// Size: 0xe9
function nvghintnotify(var_e9def77708d779b7) {
    self endon("disconnect");
    self notify("nvg_spawn_tutorial");
    self endon("nvg_spawn_tutorial");
    firstspawn = 1;
    if (!isdefined(var_e9def77708d779b7)) {
        var_e9def77708d779b7 = 0;
    }
    while (1) {
        if (firstspawn) {
            self waittill("giveLoadout");
        } else {
            self waittill("spawned");
        }
        if (var_e9def77708d779b7 < 2) {
            if (self usinggamepad()) {
                msg = "hint_use_nvg";
            } else {
                msg = "hint_use_nvg_kb";
            }
            if (gameflag("infil_will_run") && !gameflag("prematch_done")) {
                level waittill("prematch_done");
                wait(5);
                namespace_58fb4f2e73fd41a0::setlowermessageomnvar(msg);
                wait(5);
                namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
            } else {
                if (!var_e9def77708d779b7) {
                    wait(5);
                }
                namespace_58fb4f2e73fd41a0::setlowermessageomnvar(msg);
                wait(5);
                namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
            }
            var_e9def77708d779b7++;
        } else {
            break;
        }
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2099
// Size: 0x2f
function function_72646e9a09d68970() {
    if (self iscodcaster()) {
        return;
    }
    var_4b86a4e17c656399 = getdvarint(@"hash_7b6a932574c43db8", 0);
    self function_86af48e06c94360a(var_4b86a4e17c656399);
}

// Namespace common/namespace_310ba947928891df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20cf
// Size: 0x11c
function function_59a736fffddc7c05(var_4b86a4e17c656399, var_534bd24a37e5d78a) {
    var_cf4e298f83ea9b6f = getdvarint(@"hash_7b6a932574c43db8", 0);
    var_8cb91548ba73dd05 = getdvarint(@"hash_a82da6c4bfc1360a", 9000);
    if (var_4b86a4e17c656399 == var_cf4e298f83ea9b6f) {
        var_4ca632f1f2a8af51 = namespace_c8d5de7d515ce477::function_691880160b33d133("progress");
        progress = 0;
        for (index = 0; index < var_534bd24a37e5d78a.var_d0eca76a743a7085.size; index++) {
            var_5a55c21dfb8c9f92 = var_534bd24a37e5d78a.var_d0eca76a743a7085[index].var_5a55c21dfb8c9f92;
            if (var_4ca632f1f2a8af51 == var_5a55c21dfb8c9f92) {
                progress = var_534bd24a37e5d78a.var_d0eca76a743a7085[index].progress;
                break;
            }
        }
        /#
            println("MOD_MELEE" + self.name + "specialty_scavenger_plus" + var_4b86a4e17c656399 + "specialty_tune_up" + progress);
        #/
        if (progress >= var_8cb91548ba73dd05) {
            kick(self getentitynumber(), "EXE/PLAYERKICKED", 1);
        }
    }
}

// Namespace common/namespace_310ba947928891df
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f2
// Size: 0xde
function onplayerkilledcommon(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00, iskillstreakweapon) {
    if (getgametypenumlives() != 0) {
        updatealiveomnvars();
    }
    if (isdefined(level.onplayerkilled)) {
        [[ level.onplayerkilled ]](einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00);
    }
    if (isdefined(level.var_9abca503637351b3)) {
        [[ level.var_9abca503637351b3 ]](einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00);
    }
    if (function_2009718b681222c2()) {
        if (isbot(self)) {
            self.classcallback = "gamemode";
        }
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d7
// Size: 0x12a
function onplayerconnectcommon() {
    while (1) {
        player = level waittill("connected");
        if (isdefined(level.onplayerconnect)) {
            level thread [[ level.onplayerconnect ]](player);
        }
        if (istrue(level.dropArmorOnDeath)) {
            player.var_d2dbb2fa012e6d9c = [];
        }
        if (namespace_36f464722d326bbe::function_9cdaadfddeda4d7a()) {
            player thread function_9baeafa29fcf15f9();
        }
        if (namespace_36f464722d326bbe::function_d2d2b803a7b741a4() && !namespace_aead94004cf4c147::isBackpackInventoryEnabled()) {
            player thread nvghintnotify();
        }
        if (function_2009718b681222c2()) {
            level.denyclasschoice = 1;
            player namespace_d19129e4fa5d176::function_a16868d4dcd81a4b();
            player.pers["gamemodeLoadout"] = game["forceRandomLoadout"][game["forceRandomLoadoutIndex"]];
        }
        if (istrue(level.usepingsystem)) {
            player namespace_ede58c1e66c2c280::calloutmarkerping_initplayer();
        }
        if (isdefined(player) && utility::function_a10967d736dc56e5()) {
            level thread function_70c67fa95f4222c1(player);
        }
        if (!player function_1cb874dfc01de80d()) {
            if (getdvarint(@"hash_7b6a932574c43db8", 0) != 0) {
                /#
                    println("buystation_loc" + self.name);
                #/
                player function_72646e9a09d68970();
            }
        }
    }
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2408
// Size: 0x74
function function_70c67fa95f4222c1(player) {
    player endon("disconnect");
    if (!isdefined(level.difficultytype)) {
        level namespace_bfef6903bca5845d::function_c8393014dd7f8ab6();
    }
    player.gameskill = namespace_310bdaa3cf041c47::get_gameskill();
    player namespace_310bdaa3cf041c47::set_difficulty_from_locked_settings();
    player.owner = undefined;
    flag_wait("level_stealth_initialized");
    while (!isdefined(player.team)) {
        waitframe();
    }
    player namespace_975f381a5813b0fd::main();
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2483
// Size: 0x3b
function onplayerdisconnectcommon(player) {
    if (getgametypenumlives() != 0) {
        player updatealiveomnvars();
    }
    if (isdefined(level.onplayerdisconnect)) {
        player thread [[ level.onplayerdisconnect ]](player);
    }
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24c5
// Size: 0x4f
function onplayerjointeamcommon(player) {
    if (isdefined(level.onplayerjointeam)) {
        [[ level.onplayerjointeam ]](self);
    }
    if (istrue(level.dogtagsenabled)) {
        namespace_ba880bc821ba2f06::onplayerjoinedteam(player);
    }
    if (namespace_36f464722d326bbe::function_d2d2b803a7b741a4()) {
        player thread nvghintnotify(1);
    }
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x251b
// Size: 0x58
function managespawnprotection(var_ac20f98ea430a859) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("remove_spawn_protection");
    thread applyspawnprotection();
    if (!istrue(level.allowprematchdamage)) {
        gameflagwait("prematch_done");
    }
    if (var_ac20f98ea430a859) {
        wait(level.spawnprotectiontimer);
    }
    thread removespawnprotection();
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x257a
// Size: 0x38
function applyspawnprotection() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("remove_spawn_protection");
    self waittill("spawned_player");
    self.spawnprotection = 1;
    namespace_41cb45263e591751::setlightarmorvalue(self, 1000, undefined, 0);
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25b9
// Size: 0x29
function removespawnprotection() {
    self endon("disconnect");
    if (isdefined(self)) {
        self.spawnprotection = 0;
    }
    namespace_41cb45263e591751::lightarmor_unset(self);
    self notify("remove_spawn_protection");
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25e9
// Size: 0x13c
function updatealiveomnvars() {
    if (isdefined(level.updatealiveomnvars)) {
        self [[ level.updatealiveomnvars ]]();
        return;
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        totalalivecount = 0;
        totalplayers = 0;
        foreach (entry in level.teamnamelist) {
            totalalivecount = totalalivecount + getteamdata(entry, "aliveCount");
            totalplayers = totalplayers + getteamcount(entry);
        }
        setomnvar("ui_allies_alive", 0);
        setomnvar("ui_axis_alive", totalalivecount);
        setomnvar("ui_allies_team_size", 0);
        setomnvar("ui_axis_team_size", totalplayers);
    } else {
        setomnvar("ui_allies_alive", getteamdata("allies", "aliveCount"));
        setomnvar("ui_axis_alive", getteamdata("axis", "aliveCount"));
        setomnvar("ui_allies_team_size", getteamcount("allies"));
        setomnvar("ui_axis_team_size", getteamcount("axis"));
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x272c
// Size: 0x16
function updatematchstatushintonspawncommon() {
    level endon("game_ended");
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("kill");
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2749
// Size: 0x17
function ffmessageonspawn() {
    wait(1);
    if (isdefined(self)) {
        namespace_44abc05161e2e2cb::showerrormessage("MP/FRIENDLY_FIRE_WILL_NOT");
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2767
// Size: 0x159
function addspecialistdialog() {
    game["dialog"]["specialty_warhead"] = "perk_amped";
    game["dialog"]["specialty_tac_resist"] = "perk_amped";
    game["dialog"]["specialty_covert_ops"] = "perk_coldblooded";
    game["dialog"]["specialty_hustle"] = "perk_doubletime";
    game["dialog"]["specialty_eod"] = "perk_eod";
    game["dialog"]["specialty_guerrilla"] = "perk_ghost";
    game["dialog"]["specialty_surveillance"] = "perk_highalert";
    game["dialog"]["specialty_heavy_metal"] = "perk_killchain";
    game["dialog"]["specialty_munitions_2"] = "perk_overkill";
    game["dialog"]["specialty_strategist"] = "perk_pointman";
    game["dialog"]["specialty_quick_fix"] = "perk_quickfix";
    game["dialog"]["specialty_restock"] = "perk_restock";
    game["dialog"]["specialty_scavenger_plus"] = "perk_scavenger";
    game["dialog"]["specialty_extra_shrapnel"] = "perk_shrapnel";
    game["dialog"]["specialty_specialist_bonus"] = "perk_specialistbonus";
    game["dialog"]["specialty_tactical_recon"] = "perk_spotter";
    game["dialog"]["specialty_huntmaster"] = "perk_tracker";
    game["dialog"]["specialty_tune_up"] = "perk_tuneup";
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c7
// Size: 0x1f
function function_e9ad38af5a6bedcd() {
    if (getdvarint(@"hash_ba25fabade697401", 0) == 1) {
        function_88b47710bece931f();
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28ed
// Size: 0x10f
function function_88b47710bece931f() {
    function_fdc32b02a967aa99();
    setomnvar("ui_buy_mode", 1);
    level.var_9cdaadfddeda4d7a = 1;
    level.var_8ec1a1ca587a6487 = &function_8ec1a1ca587a6487;
    level.var_c59c301eaabc2e32 = 1;
    level.br_plunder_enabled = 1;
    level.var_1e17e3480b1d264d = 1;
    level.armoronweaponswitchlongpress = 1;
    setdvar(@"hash_ed6e4ffa933af621", 1);
    setdvar(@"hash_8a1945c94d5092c2", 1);
    /#
        setdvar(@"hash_a4d532f42d919827", 1);
    #/
    setdvar(@"hash_e38e16d9fbf3fc43", "mp/loot/br/default/loot_item_defs.csv");
    setdvar(@"hash_add02e4fff48882f", " mp/loot/core/risk/loot_table_zones.csv");
    setdvar(@"hash_ce882ca282c2f85e", 1);
    namespace_a4b43c1cf86c6fe5::function_b38f5ffe645943c3("core");
    if (level.var_1e17e3480b1d264d) {
        level.var_9c1e3c18b99409e9 = &function_9c1e3c18b99409e9;
    }
    level thread function_d05c9bf671a28d2d();
    level thread function_88822b4598ff1773();
    /#
        level thread function_697ba36fc0e3cde4();
    #/
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a03
// Size: 0x48
function function_d05c9bf671a28d2d() {
    waitframe();
    level namespace_61d0e47c5dff187c::lui_registercallback("buy_menu_open", &namespace_a4b43c1cf86c6fe5::armorykioskused);
    level namespace_61d0e47c5dff187c::lui_registercallback("buy_menu_close", &function_cd2db96ca42742e6);
    namespace_a4b43c1cf86c6fe5::init();
    level.var_8e9daba162280a8e = 1;
    level.var_6beff7b631ab7e18 = &function_6beff7b631ab7e18;
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a52
// Size: 0x14
function private function_cd2db96ca42742e6(value) {
    self notify("buy_menu_close");
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a6d
// Size: 0x1b4
function function_fdc32b02a967aa99() {
    var_4d43eb408252daa0 = [];
    var_4d43eb408252daa0[var_4d43eb408252daa0.size] = getent("cyber_empzone_axis", "targetname");
    var_4d43eb408252daa0[var_4d43eb408252daa0.size] = getent("cyber_empzone_allies", "targetname");
    var_58553518a66cebe9 = getentarray("cyber_emp_pickup_trig", "targetname");
    foreach (trig in var_58553518a66cebe9) {
        var_4d43eb408252daa0[var_4d43eb408252daa0.size] = trig;
    }
    if (var_4d43eb408252daa0.size == 0) {
        primaryflags = getentarray("flag_primary", "targetname");
        foreach (flag in primaryflags) {
            var_4d43eb408252daa0[var_4d43eb408252daa0.size] = flag;
            break;
        }
    }
    var_c9050c643d9fceac = [];
    foreach (temp in var_4d43eb408252daa0) {
        var_eaf4a038607a8c2f = spawnstruct();
        var_eaf4a038607a8c2f.origin = temp.origin;
        var_eaf4a038607a8c2f.angles = temp.angles;
        var_c9050c643d9fceac[var_c9050c643d9fceac.size] = var_eaf4a038607a8c2f;
    }
    level thread function_bdc6d23a3189ec1f(var_c9050c643d9fceac);
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c28
// Size: 0x198
function function_bdc6d23a3189ec1f(var_baaf67a759d54315) {
    waitframe();
    level.var_5b25e7620e424cb2 = [];
    var_eadbd277474bb8bd = getstructarray("buystation_loc", "targetname");
    foreach (loc in var_eadbd277474bb8bd) {
        var_eadbd277474bb8bd[var_eadbd277474bb8bd.size] = var_eadbd277474bb8bd;
    }
    if (var_eadbd277474bb8bd.size > 0) {
        var_baaf67a759d54315 = var_eadbd277474bb8bd;
    }
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_default_contents(1);
    foreach (loc in var_baaf67a759d54315) {
        if (var_eadbd277474bb8bd.size == 0) {
            groundorigin = drop_to_ground(loc.origin + anglestoforward(loc.angles) * 50, 50, -200, undefined, var_fbcabd62b8f66eb8);
            spawnangles = loc.angles;
        } else {
            groundorigin = loc.origin;
            spawnangles = loc.angles;
        }
        buystation = spawnscriptable("br_plunder_box", groundorigin, spawnangles);
        buystation setscriptablepartstate("br_plunder_box", "visible");
        buystation.var_5cfa621ebf61d8aa = 0;
        level.var_5b25e7620e424cb2[level.var_5b25e7620e424cb2.size] = buystation;
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dc7
// Size: 0x2b
function function_88822b4598ff1773() {
    level.var_68a1353068460d1 = &namespace_58012cf453ba1014::function_68a1353068460d1;
    waitframe();
    if (level.crankedbombtimer == 0) {
        level.crankedbombtimer = 30;
    }
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2df9
// Size: 0x5f
function function_d19636a80151b35d(squadindex) {
    player = self;
    player.br_squadindex = squadindex;
    var_573aa6be0b25acd9 = player.game_extrainfo & 65528;
    var_573aa6be0b25acd9 = var_573aa6be0b25acd9 | squadindex;
    player.game_extrainfo = var_573aa6be0b25acd9;
    player setclientomnvar("ui_client_squad_index", 1);
}

// Namespace common/namespace_310ba947928891df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e5f
// Size: 0x75
function function_6beff7b631ab7e18(instance, player) {
    if (isint(instance)) {
        instance = player;
        instance.var_5cfa621ebf61d8aa = 0;
        instance.objectivekey = "_a";
        goto LOC_0000003f;
    }
LOC_0000003f:
    if (istrue(instance.var_5cfa621ebf61d8aa) || istrue(level.var_8e9daba162280a8e)) {
        player setclientomnvar("ui_buystation_override", namespace_38b993c4618e76cd::function_54b046aa3ba2678a("core"));
    }
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2edb
// Size: 0xd2
function function_8ec1a1ca587a6487(var_cb325ddb4a764623) {
    switch (var_cb325ddb4a764623) {
    case #"hash_25789111b74943b4":
    case #"hash_43f2312fe01322cf":
        self.pers["armor_buy_plates"]++;
        break;
    case #"hash_a7a7446a3194cb49":
        if (isreallyalive(self)) {
            if (isdefined(self.armorhealth) && self.armorhealth < self.var_8790c077c95db752) {
                namespace_f8d3520d3483c1::setArmorHealth(int(clamp(self.armorhealth + level.var_4b78859bacc88808, 0, self.var_8790c077c95db752)));
            }
            goto LOC_0000009a;
        }
        self.pers["armor_buy_plates_instant"]++;
        thread namespace_f8d3520d3483c1::function_4f88731347251184();
    default:
    LOC_0000009a:
        break;
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fb4
// Size: 0x48
function function_9baeafa29fcf15f9() {
    namespace_14f37777effc564d::function_6da8b65579348d0b();
    function_d19636a80151b35d(1);
    if (!isdefined(self.pers["armor_buy_plates"])) {
        self.pers["armor_buy_plates"] = 0;
        self.pers["armor_buy_plates_instant"] = 0;
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3003
// Size: 0xac
function function_697ba36fc0e3cde4() {
    /#
        setdevdvarifuninitialized(@"hash_1ede0bb893291602", 0);
        while (1) {
            if (getdvarint(@"hash_1ede0bb893291602", 0) > 0) {
                foreach (player in level.players) {
                    player namespace_c6ccccd95254983f::playerplunderpickup(getdvarint(@"hash_1ede0bb893291602", 0), undefined, 1);
                }
            }
            setdevdvar(@"hash_1ede0bb893291602", 0);
            wait(1);
        }
    #/
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b6
// Size: 0x45
function function_8d478840c4e44366() {
    level.var_726494df62567093 = ter_op(getdvarint(@"hash_4e33f79a5437aa5c", 0) > 0, getdvarint(@"hash_4e33f79a5437aa5c", 0), undefined);
    if (function_2009718b681222c2()) {
        level thread function_5e789e0461bc3a69();
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3102
// Size: 0x1c
function function_2009718b681222c2() {
    return isdefined(level.var_726494df62567093) && level.var_726494df62567093 > 0;
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3126
// Size: 0x2c
function function_5e789e0461bc3a69() {
    level.bypassclasschoicefunc = &namespace_d19129e4fa5d176::alwaysgamemodeclass;
    level.bots_gametype_handles_class_choice = 1;
    waitframe();
    thread function_943a60c848e07e13();
    function_9ef19af8915ebb2();
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3159
// Size: 0x10e
function function_943a60c848e07e13() {
    /#
        if (getdvarint(@"hash_b665ceb14dabc0ed", -1) != -1) {
            function_be8c4476e2e599f();
            game["arenaData"] = 0;
            return;
        }
    #/
    if (!isdefined(game["roundsPlayed"])) {
        game["roundsPlayed"] = 0;
    }
    if (game["roundsPlayed"] == 0) {
        if (istrue(game["practiceRound"])) {
            function_be8c4476e2e599f();
            game["forceRandomLoadoutIndex"] = 0;
        } else if (!isdefined(game["practiceRound"]) || istrue(game["didSnowFight"])) {
            if (istrue(game["didSnowFight"])) {
                game["didSnowFight"] = undefined;
            }
            function_be8c4476e2e599f();
            game["forceRandomLoadoutIndex"] = 0;
        }
    } else {
        level.loadoutchangeround = level.var_726494df62567093;
        if (level.loadoutchangeround != 0) {
            if (game["roundsPlayed"] % level.loadoutchangeround == 0) {
                game["forceRandomLoadoutIndex"]++;
            }
            if (game["forceRandomLoadoutIndex"] == game["forceRandomLoadout"].size) {
                game["forceRandomLoadoutIndex"] = 0;
            }
        } else {
            game["forceRandomLoadoutIndex"] = 0;
        }
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x326e
// Size: 0x240
function function_be8c4476e2e599f() {
    game["forceRandomLoadout"] = [];
    loadouts = [];
    var_d6f262bbec7b0caa = 0;
    table = "classtable:classtable_force_loadouts";
    /#
        if (getdvarint(@"hash_b665ceb14dabc0ed", -1) != -1) {
            var_d6f262bbec7b0caa = getdvarint(@"hash_b665ceb14dabc0ed", 0);
            loadouts[loadouts.size] = function_e2302479ca960e45(table, var_d6f262bbec7b0caa);
            game["soccer_goal_them"] = array_randomize(loadouts);
            return;
        }
    #/
    var_a300fa75277719ee = namespace_d19129e4fa5d176::function_df2933f96d726d71(table);
    while (var_d6f262bbec7b0caa < var_a300fa75277719ee) {
        loadouts[loadouts.size] = function_e2302479ca960e45(table, var_d6f262bbec7b0caa);
        var_d6f262bbec7b0caa++;
    }
    var_b51c1b732564e22a = undefined;
    var_e08cb9bbd6f3241d = undefined;
    var_7ea3494e3da2fba5 = getdvar(@"hash_76bc70aac09a0054", "");
    var_8831b759b9f84be1 = getdvarfloat(@"hash_680f5c2690e8d15f", 0);
    if (var_7ea3494e3da2fba5 != "" && var_8831b759b9f84be1 > 0) {
        var_f684b277677b66eb = strtok(var_7ea3494e3da2fba5, ",");
        foreach (var_a6ed1602a5107749 in var_f684b277677b66eb) {
            var_94b8da0083dae53 = strtok(var_a6ed1602a5107749, "|");
            if (var_94b8da0083dae53.size == 2) {
                rootweapon = var_94b8da0083dae53[0];
                variantid = int(var_94b8da0083dae53[1]);
                var_3f57e7eddc8a4779 = weaponisvalid(rootweapon, variantid);
                /#
                    assertex(var_3f57e7eddc8a4779, "cacheRandomCommonForceLoadouts() found the following invalid or locked weapon variant: " + var_a6ed1602a5107749);
                #/
                if (var_3f57e7eddc8a4779) {
                    if (!isdefined(var_b51c1b732564e22a)) {
                        var_b51c1b732564e22a = [];
                        var_e08cb9bbd6f3241d = var_8831b759b9f84be1;
                    }
                    struct = spawnstruct();
                    struct.rootweapon = rootweapon;
                    struct.variantid = variantid;
                    var_b51c1b732564e22a[var_b51c1b732564e22a.size] = struct;
                }
            }
        }
    }
    loadouts = function_a8fc18df76d1aa2f(loadouts, 99, var_b51c1b732564e22a, var_e08cb9bbd6f3241d);
    game["forceRandomLoadout"] = array_randomize(loadouts);
}

// Namespace common/namespace_310ba947928891df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34b5
// Size: 0x23f
function function_e2302479ca960e45(table, classindex) {
    var_e698df1ec0933ce4 = [];
    var_e698df1ec0933ce4["loadoutArchetype"] = "archetype_assault";
    var_e698df1ec0933ce4["loadoutPrimaryAddBlueprintAttachments"] = namespace_d19129e4fa5d176::table_getaddblueprintattachments(table, classindex, 0);
    var_e698df1ec0933ce4["loadoutPrimary"] = namespace_d19129e4fa5d176::table_getweapon(table, classindex, 0);
    for (attachmentindex = 0; attachmentindex < namespace_d19129e4fa5d176::getmaxprimaryattachments(); attachmentindex++) {
        var_efbdcd88107af5f9 = namespace_d19129e4fa5d176::getattachmentloadoutstring(attachmentindex, #"primary");
        var_e698df1ec0933ce4[var_efbdcd88107af5f9] = namespace_d19129e4fa5d176::table_getweaponattachment(table, classindex, 0, attachmentindex);
    }
    var_e698df1ec0933ce4["loadoutPrimaryCamo"] = namespace_d19129e4fa5d176::table_getweaponcamo(table, classindex, 0);
    var_e698df1ec0933ce4["loadoutPrimaryReticle"] = namespace_d19129e4fa5d176::table_getweaponreticle(table, classindex, 0);
    var_e698df1ec0933ce4["loadoutPrimaryVariantID"] = 0;
    var_e698df1ec0933ce4["loadoutSecondaryAddBlueprintAttachments"] = namespace_d19129e4fa5d176::table_getaddblueprintattachments(table, classindex, 1);
    var_e698df1ec0933ce4["loadoutSecondary"] = namespace_d19129e4fa5d176::table_getweapon(table, classindex, 1);
    for (attachmentindex = 0; attachmentindex < namespace_d19129e4fa5d176::getmaxsecondaryattachments(); attachmentindex++) {
        var_efbdcd88107af5f9 = namespace_d19129e4fa5d176::getattachmentloadoutstring(attachmentindex, #"secondary");
        var_e698df1ec0933ce4[var_efbdcd88107af5f9] = namespace_d19129e4fa5d176::table_getweaponattachment(table, classindex, 1, attachmentindex);
    }
    if (istrue(level.specialdayloadouts)) {
        var_e698df1ec0933ce4["loadoutSecondaryCamo"] = namespace_d19129e4fa5d176::table_getweaponcamo(table, classindex, 1);
    } else {
        var_e698df1ec0933ce4["loadoutSecondaryCamo"] = namespace_d19129e4fa5d176::table_getweaponcamo(table, classindex, 1);
    }
    var_e698df1ec0933ce4["loadoutSecondaryReticle"] = namespace_d19129e4fa5d176::table_getweaponreticle(table, classindex, 1);
    var_e698df1ec0933ce4["loadoutSecondaryVariantID"] = 0;
    var_e698df1ec0933ce4["loadoutEquipmentPrimary"] = namespace_d19129e4fa5d176::table_getequipmentprimary(table, classindex);
    var_e698df1ec0933ce4["loadoutExtraEquipmentPrimary"] = namespace_d19129e4fa5d176::table_getextraequipmentprimary(table, classindex);
    var_e698df1ec0933ce4["loadoutEquipmentSecondary"] = namespace_d19129e4fa5d176::table_getequipmentsecondary(table, classindex);
    var_e698df1ec0933ce4["loadoutExtraEquipmentSecondary"] = namespace_d19129e4fa5d176::table_getextraequipmentsecondary(table, classindex);
    var_e698df1ec0933ce4["loadoutPerks"] = [];
    for (i = 0; i < 3; i++) {
        perk = namespace_d19129e4fa5d176::table_getperk(table, classindex, i);
        if (perk != "specialty_null") {
            var_e698df1ec0933ce4["loadoutPerks"][var_e698df1ec0933ce4["loadoutPerks"].size] = perk;
        }
    }
    var_e698df1ec0933ce4["loadoutGesture"] = "playerData";
    var_e698df1ec0933ce4["loadoutExecution"] = "playerData";
    var_e698df1ec0933ce4["loadoutFieldUpgrade1"] = "none";
    var_e698df1ec0933ce4["loadoutFieldUpgrade2"] = "none";
    return var_e698df1ec0933ce4;
}

// Namespace common/namespace_310ba947928891df
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36fc
// Size: 0x19d
function function_a8fc18df76d1aa2f(loadouts, count, var_b51c1b732564e22a, var_e08cb9bbd6f3241d) {
    classes = [];
    var_b0bc46f3ba5db389 = [];
    for (num = 0; num < count && loadouts.size > 0; num++) {
        loadout = loadouts[randomint(loadouts.size)];
        var_acfe7336f59b3d76 = loadout["loadoutPrimary"];
        if (isdefined(var_b51c1b732564e22a) && isdefined(var_e08cb9bbd6f3241d)) {
            var_53877f59f7445553 = function_1ac1e1c43d4cebc(var_acfe7336f59b3d76);
            var_208f46d708a99cc3 = function_828b81c9f2465841(var_b51c1b732564e22a, var_53877f59f7445553);
            if (var_208f46d708a99cc3.size > 0) {
                if (randomfloat(1) < var_e08cb9bbd6f3241d) {
                    var_920d33641e200bdb = randomint(var_208f46d708a99cc3.size);
                    var_4fc88dfdbd8ddb28 = var_208f46d708a99cc3[var_920d33641e200bdb];
                    var_b51c1b732564e22a = array_remove_index(var_b51c1b732564e22a, var_920d33641e200bdb);
                    loadout["loadoutPrimaryAddBlueprintAttachments"] = 1;
                    loadout["loadoutPrimary"] = var_4fc88dfdbd8ddb28.rootweapon;
                    loadout["loadoutPrimaryVariantID"] = var_4fc88dfdbd8ddb28.variantid;
                    loadout["loadoutPrimaryCamo"] = "none";
                    loadout["loadoutPrimaryReticle"] = "none";
                    for (attachmentindex = 0; attachmentindex < namespace_d19129e4fa5d176::getmaxprimaryattachments(); attachmentindex++) {
                        var_efbdcd88107af5f9 = namespace_d19129e4fa5d176::getattachmentloadoutstring(attachmentindex, #"primary");
                        loadout[var_efbdcd88107af5f9] = "none";
                    }
                }
            }
        }
        var_b0bc46f3ba5db389[var_b0bc46f3ba5db389.size] = loadout;
        loadouts = function_f76c0948f37c7855(loadouts, var_acfe7336f59b3d76);
    }
    return var_b0bc46f3ba5db389;
}

// Namespace common/namespace_310ba947928891df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38a1
// Size: 0x82
function function_828b81c9f2465841(var_855a91067674d651, var_53877f59f7445553) {
    var_7cb19f95dbc68942 = [];
    foreach (struct in var_855a91067674d651) {
        if (function_1ac1e1c43d4cebc(struct.rootweapon) == var_53877f59f7445553) {
            var_7cb19f95dbc68942[var_7cb19f95dbc68942.size] = struct;
        }
    }
    return var_7cb19f95dbc68942;
}

// Namespace common/namespace_310ba947928891df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x392b
// Size: 0x9e
function function_f76c0948f37c7855(loadouts, var_acfe7336f59b3d76) {
    var_7cb19f95dbc68942 = [];
    group = function_1ac1e1c43d4cebc(var_acfe7336f59b3d76);
    foreach (loadout in loadouts) {
        var_edcf839453192090 = function_1ac1e1c43d4cebc(loadout["loadoutPrimary"]);
        if (group != var_edcf839453192090) {
            var_7cb19f95dbc68942[var_7cb19f95dbc68942.size] = loadout;
        }
    }
    return var_7cb19f95dbc68942;
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39d1
// Size: 0x41
function function_1ac1e1c43d4cebc(rootweapon) {
    group = "none";
    if (rootweapon != "none") {
        group = getweapongroup(rootweapon);
        if (group == "weapon_dmr") {
            group = "weapon_sniper";
        }
    }
    return group;
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a1a
// Size: 0x15
function updatehighpriorityweapons() {
    self loadweaponsforplayer(level.loadweapons, 1);
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a36
// Size: 0x168
function function_9ef19af8915ebb2() {
    level.loadweapons = [];
    primaries = [];
    var_2aee5a9b1a165f09 = [];
    loadout = game["forceRandomLoadout"][game["forceRandomLoadoutIndex"]];
    primary = loadout["loadoutPrimary"];
    secondary = loadout["loadoutSecondary"];
    if (primary != "none") {
        primaries[primaries.size] = function_d08db0c19daacc9c(primary, loadout, 1);
    }
    if (secondary != "none") {
        var_2aee5a9b1a165f09[var_2aee5a9b1a165f09.size] = function_5c5f49069eb558ec(secondary, loadout, 1);
    }
    if (!isdefined(level.loadoutchangeround)) {
        level.loadoutchangeround = 1;
    }
    if (level.loadoutchangeround != 0) {
        var_a9c56228c41ecda0 = game["forceRandomLoadoutIndex"] + 1;
        if (game["forceRandomLoadoutIndex"] == game["forceRandomLoadout"].size - 1) {
            var_a9c56228c41ecda0 = 0;
        }
        var_c3d433af5f864e84 = game["forceRandomLoadout"][var_a9c56228c41ecda0];
        var_c03d6dd4bfb14c5a = var_c3d433af5f864e84["loadoutPrimary"];
        var_fccb1d1573e7f2a6 = var_c3d433af5f864e84["loadoutSecondary"];
        if (var_c03d6dd4bfb14c5a != "none") {
            primaries[primaries.size] = function_d08db0c19daacc9c(var_c03d6dd4bfb14c5a, var_c3d433af5f864e84);
        }
        if (var_fccb1d1573e7f2a6 != "none") {
            var_2aee5a9b1a165f09[var_2aee5a9b1a165f09.size] = function_5c5f49069eb558ec(var_fccb1d1573e7f2a6, var_c3d433af5f864e84);
        }
    }
    level.loadweapons = array_combine(primaries, var_2aee5a9b1a165f09);
}

// Namespace common/namespace_310ba947928891df
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ba5
// Size: 0x119
function function_d08db0c19daacc9c(primary, loadout, var_995dc1bb9ac37bf2) {
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
    variantid = undefined;
    var_f3464d71f01f614e = undefined;
    cosmeticattachment = undefined;
    stickers = undefined;
    var_2cf0771420522cb6 = namespace_e0ee43ef2dddadaa::buildweapon(rootname, var_ac82e189f4d06152, camoname, reticleindex, variantid, var_f3464d71f01f614e, cosmeticattachment, stickers);
    newweapon = getcompleteweaponname(var_2cf0771420522cb6);
    return newweapon;
}

// Namespace common/namespace_310ba947928891df
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cc6
// Size: 0x114
function function_5c5f49069eb558ec(secondary, loadout, var_995dc1bb9ac37bf2) {
    var_ac82e189f4d06152 = [];
    for (i = 1; i < 6; i++) {
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
    variantid = undefined;
    var_f3464d71f01f614e = undefined;
    cosmeticattachment = undefined;
    stickers = undefined;
    rootname = getweaponrootname(secondary);
    var_2cf0771420522cb6 = namespace_e0ee43ef2dddadaa::buildweapon(rootname, var_ac82e189f4d06152, camoname, reticleindex);
    newweapon = getcompleteweaponname(var_2cf0771420522cb6);
    return newweapon;
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3de2
// Size: 0x81
function function_9081e2d33d0b53f9() {
    if (getdvarint(@"hash_8d99f31dd75fcf9c", 0) == 1) {
        level.var_d0d511ba6517842a = 1;
        if (getdvarint(@"hash_148266ea4825c4b0", 0) == 1) {
            level.var_5df506226294aa65 = &function_5df506226294aa65;
            level.var_484f1a4bdb5cda1e = &function_484f1a4bdb5cda1e;
        }
        level thread function_7aba1069126eb717();
        flag_init("stealth_enabled");
        flag_init("level_stealth_initialized");
        flag_init("stealth_spotted");
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e6a
// Size: 0xcf
function function_7aba1069126eb717() {
    level.var_72e8a99508b7be1b = getdvarint(@"hash_742ec92f3f5c3b41", 12);
    namespace_bfef6903bca5845d::init();
    if (!isdefined(level.difficultytype)) {
        level namespace_bfef6903bca5845d::function_c8393014dd7f8ab6();
    }
    namespace_3c37cb17ade254d::registersharedfunc("ai", "dropLootOnAgentDeath", &dropLootOnAgentDeath);
    while (!isdefined(level.teamnamelist)) {
        waitframe();
    }
    foreach (team in level.teamnamelist) {
        var_b5b1784d5a1327c7 = team + "_agents";
        function_ba4022744dce59f6(var_b5b1784d5a1327c7, level.var_72e8a99508b7be1b);
    }
}

// Namespace common/namespace_310ba947928891df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f40
// Size: 0x277
function function_5df506226294aa65(victim, attacker) {
    if (victim.deaths % 5 == 0) {
        victim.var_8308e73a11dca140 = 1;
    }
    var_b5b1784d5a1327c7 = victim.team + "_agents";
    var_3d2e4b298e935c8d = function_9368fb9261e4cd0a(var_b5b1784d5a1327c7);
    var_644d90de7685f75 = level.var_72e8a99508b7be1b - var_3d2e4b298e935c8d;
    if (var_644d90de7685f75 <= 0) {
        return;
    }
    goalpos = undefined;
    spawnpoint = victim [[ level.getspawnpoint ]]();
    team = victim.team;
    wait(0.15);
    if (isdefined(spawnpoint)) {
        if (isdefined(attacker)) {
            goalpos = attacker.origin;
        } else {
            goalpos = spawnpoint.origin;
        }
        if (istrue(victim.var_8308e73a11dca140)) {
            var_40e875a042b82875 = getdvarint(@"hash_4ec508aa0002244", 1);
            if (var_40e875a042b82875 > 0) {
                for (i = 0; i < var_40e875a042b82875; i++) {
                    agent = ai_mp_requestSpawnAgent("enemy_mp_jugg_base", spawnpoint.origin, spawnpoint.angles, "absolute", var_b5b1784d5a1327c7, "jugg", var_b5b1784d5a1327c7, team);
                    if (isdefined(agent)) {
                        agent thread function_35c195df2ba46725(agent, team);
                        namespace_14d36171baccf528::function_1828f1e20e52b418(agent);
                        agent thread function_a5117518725da028(agent, goalpos);
                        agent.doavoidanceblocking = 0;
                    }
                }
            }
            victim.var_8308e73a11dca140 = undefined;
        } else {
            numagents = getdvarint(@"hash_65d94ddfef09716a", 1);
            if (numagents > 0) {
                for (i = 0; i < numagents; i++) {
                    aitype = function_d5bc07eabf352abb();
                    agent = ai_mp_requestSpawnAgent(aitype, spawnpoint.origin, spawnpoint.angles, "absolute", var_b5b1784d5a1327c7, "jugg", var_b5b1784d5a1327c7, team);
                    if (isdefined(agent)) {
                        agent thread function_35c195df2ba46725(agent, team);
                        agent thread function_a5117518725da028(agent, goalpos);
                        if (team == "allies") {
                            agent namespace_14d36171baccf528::function_c37c4f9d687074ff("body_mp_eastern_geist_1_1_lod1", "head_mp_eastern_bale_1_1");
                        } else {
                            agent namespace_14d36171baccf528::function_c37c4f9d687074ff("body_spetsnaz_cqc", "head_spetsnaz_cqc");
                        }
                        agent.doavoidanceblocking = 0;
                    }
                }
            }
        }
    }
}

// Namespace common/namespace_310ba947928891df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41be
// Size: 0x3f
function function_35c195df2ba46725(agent, team) {
    waitframe();
    agent.gameskill = namespace_310bdaa3cf041c47::get_gameskill();
    agent namespace_310bdaa3cf041c47::apply_difficulty_settings(1);
    namespace_14d36171baccf528::agentPers_setAgentPersData(agent, "team", team);
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4204
// Size: 0xc2
function function_df3e6ee36363e610(agent) {
    if (agent.team == "axis") {
        body = "body_spetsnaz_cqc";
        head = "head_spetsnaz_cqc";
    } else {
        body = "body_mp_eastern_geist_1_1_lod1";
        head = "head_mp_eastern_bale_1_1";
    }
    weapon = undefined;
    var_a664aad02ee98bd2 = namespace_14d36171baccf528::function_ba0801276542946b();
    grenadeammo = getdvarint(@"hash_ce85f7cc40b562f5", 0);
    armor = 0;
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(body, head, weapon, var_a664aad02ee98bd2, grenadeammo, armor);
    agent.baseaccuracy = getdvarfloat(@"hash_949a1d9903e71c7a", 0.4);
}

// Namespace common/namespace_310ba947928891df
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42cd
// Size: 0x78
function dropLootOnAgentDeath(agent, agenttype, groupname) {
    agent notify("endLootDropThread");
    agent endon("endLootDropThread");
    agent waittill("death");
    agent [[ level.weapondropfunction ]](ter_op(isdefined(self.attacker), self.attacker, undefined), ter_op(isdefined(self.damagemod), self.damagemod, "MOD_RIFLE_BULLET"));
}

// Namespace common/namespace_310ba947928891df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x434c
// Size: 0xd7
function function_484f1a4bdb5cda1e(attacker, victim) {
    score = level.scoremod["kill"];
    if (function_f698bfd3efa33302() || function_e9f3a160bbefe208(attacker) || function_e9f3a160bbefe208(victim)) {
        if (matchmakinggame() && isdefined(attacker.cranked)) {
            if (score != 0) {
                score = score + 1;
                attacker thread namespace_62c556437da28f50::scoreeventpopup(function_2ef675c13ca1c4af(#"hash_2c8bcbb02ec7ff9b", score));
            }
        }
        attacker namespace_58012cf453ba1014::oncranked(victim, attacker);
    }
    if (score != 0) {
        if (level.teambased) {
            level namespace_e8a49b70d0769b66::giveteamscoreforobjective(attacker.pers["team"], score, 0);
        } else {
            attacker namespace_e8a49b70d0769b66::giveplayerscore(#"kill", score, victim);
        }
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x442a
// Size: 0x1a9
function function_36532a1506f2c161() {
    var_ec3de47ac260ea33 = undefined;
    if (getdvar(@"hash_e65e9a96eb2ff62b") == "arena") {
        objmodifier = 0;
        if (isusingmatchrulesdata()) {
            objmodifier = getmatchrulesdata("arenaData", "objModifier");
        } else {
            objmodifier = dvarintvalue("objModifier", 0, 0, 3);
        }
        if (objmodifier == 3) {
            var_ec3de47ac260ea33 = 1;
        }
    }
    level.var_c3a5ecc6db827a75 = 0;
    matchmakingmatch = getdvarint(@"hash_962400405f9f3c0b") && !getdvarint(@"hash_485ef1ed1d39d3a3");
    if (matchmakingmatch) {
        level.var_c3a5ecc6db827a75 = getdvarint(@"hash_750e151e9a3727e7", 0);
    }
    /#
        level.var_c3a5ecc6db827a75 = getdvarint(@"hash_750e151e9a3727e7", 0);
    #/
    if (level.var_c3a5ecc6db827a75 || istrue(var_ec3de47ac260ea33)) {
        function_e55c6985b99a0d78();
        level.setupsoccerball = &setupsoccerball;
        level thread [[ level.setupsoccerball ]]();
        level thread global_physics_sound_monitor();
        if (getdvarint(@"hash_c8724ebc0f08ec3e", 1) == 1) {
            function_daed1651833fb1a2();
            level function_8f38b7a29dad82f();
            if (getdvarint(@"hash_71c708ca0182656b", 3) > 0) {
                if (!isdefined(game["multiBall"])) {
                    game["multiBall"] = 0;
                }
            }
        }
    } else {
        level.var_c3a5ecc6db827a75 = undefined;
    }
    if (getdvarint(@"hash_ce8358082dfab9e9", 0) == 1) {
        level.var_b6e1c0b3c715b0df["gos_fireworks"] = loadfx("vfx/iw8_mp/gamemode/vfx_gos_firework.vfx");
        level.var_dd7af80c3eb2c1e0 = 1;
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45da
// Size: 0x21e
function setupsoccerball() {
    level.var_1b6b55efa67ba7a8 = [];
    var_22ce7236b68b2334 = [];
    spawnpos = undefined;
    if (getgametype() == "arena") {
        arenaflag = getentarray("flag_arena", "targetname");
        spawnpos = arenaflag[0].origin + (0, 0, 30);
    } else {
        var_22ce7236b68b2334 = [];
        primaryflags = getentarray("flag_primary", "targetname");
        foreach (flag in primaryflags) {
            if (flag.script_label == "_b") {
                var_22ce7236b68b2334[var_22ce7236b68b2334.size] = flag.origin;
                break;
            }
        }
        if (var_22ce7236b68b2334.size == 0) {
            /#
                println("vfx/iw8_mp/gamemode/vfx_soccer_ball_burst.vfx");
            #/
            return;
        }
        var_22ce7236b68b2334 = array_randomize(var_22ce7236b68b2334);
        spawnpos = var_22ce7236b68b2334[0];
        if (getdvar(@"hash_ef237da69bb64ef6") == "mp_firingrange") {
            spawnpos = (-194, -858, 90);
        }
    }
    var_288d5564a47d230a = [];
    var_58553518a66cebe9 = getentarray("cyber_emp_pickup_trig", "targetname");
    foreach (trig in var_58553518a66cebe9) {
        var_288d5564a47d230a[var_288d5564a47d230a.size] = trig.origin;
    }
    level.var_288d5564a47d230a = var_288d5564a47d230a;
    var_2c677cecd807f43e = undefined;
    if (getdvarint(@"hash_23e676668434d769", 0) == 1 && var_288d5564a47d230a.size > 0) {
        var_2c677cecd807f43e = 1;
        var_22ce7236b68b2334 = array_combine(var_22ce7236b68b2334, var_288d5564a47d230a);
        var_22ce7236b68b2334 = array_randomize(var_22ce7236b68b2334);
        spawnpos = var_22ce7236b68b2334[0];
    }
    level thread function_ec48a99c32f94620(spawnpos, 1);
}

// Namespace common/namespace_310ba947928891df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47ff
// Size: 0x25e
function function_ec48a99c32f94620(spawnpos, waittime) {
    if (isdefined(waittime)) {
        wait(waittime);
    }
    tracestart = spawnpos + (0, 0, 64);
    traceend = spawnpos + (0, 0, -64);
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, undefined, namespace_2a184fc4902783dc::create_default_contents(1));
    spawnpos = trace["position"] + (0, 0, 30);
    var_5d055c219e88a1cb = spawnstruct();
    var_5d055c219e88a1cb.angles = (0, 0, 0);
    var_5d055c219e88a1cb.visuals = spawn("script_model", spawnpos);
    var_5d055c219e88a1cb.visuals setmodel("art_stadium_ball");
    var_5d055c219e88a1cb.visuals dontinterpolate();
    var_5d055c219e88a1cb.resetposition = spawnpos;
    var_5d055c219e88a1cb.var_2bbf24623e85009b = 1;
    var_5d055c219e88a1cb.onreset = &onsoccerballreset;
    var_5d055c219e88a1cb.var_7ab15a1be4cb821b = &function_7ab15a1be4cb821b;
    var_5d055c219e88a1cb.var_5c83a6b4c46d2ff5 = &function_ad9983f20f50cf14;
    angles = (0, 30, 0);
    up = anglestoup(angles);
    forward = anglestoforward(angles);
    if (getdvar(@"hash_ef237da69bb64ef6") == "mp_m_stadium") {
        force = up * 500 + (0, 0, 80);
    } else {
        force = up * 50 + (0, 0, 80);
    }
    waittillframeend();
    gameflagwait("prematch_done");
    var_5d055c219e88a1cb.visuals physicslaunchserver(var_5d055c219e88a1cb.visuals.origin, force);
    var_5d055c219e88a1cb thread outofboundswatcher();
    var_5d055c219e88a1cb thread function_5e8d33789dd33052();
    if (getdvarint(@"hash_c8724ebc0f08ec3e", 1) == 1) {
        var_5d055c219e88a1cb thread function_a21ad1174231d156();
    }
    if (isdefined(var_5d055c219e88a1cb.var_5c83a6b4c46d2ff5)) {
        var_5d055c219e88a1cb [[ var_5d055c219e88a1cb.var_5c83a6b4c46d2ff5 ]]();
    }
    level.var_1b6b55efa67ba7a8[level.var_1b6b55efa67ba7a8.size] = var_5d055c219e88a1cb;
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a64
// Size: 0x38
function function_ad9983f20f50cf14() {
    self.visuals thread register_physics_collisions();
    self.visuals physics_registerforcollisioncallback();
    register_physics_collision_func(self.visuals, &ball_impact_sounds);
}

// Namespace common/namespace_310ba947928891df
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4aa3
// Size: 0x147
function ball_impact_sounds(var_c92ef281c1d335fc, body0, body1, flag0, flag1, position, normal, impulse, var_b941baeebca428d) {
    var_212a44a5393c3b34 = var_c92ef281c1d335fc physics_getbodyid(0);
    vel = physics_getbodylinvel(var_212a44a5393c3b34);
    var_324845adc7297688 = length(vel);
    if (isdefined(var_c92ef281c1d335fc.playing_sound) || var_324845adc7297688 < 70) {
        return;
    }
    var_c92ef281c1d335fc endon("death");
    var_c92ef281c1d335fc.playing_sound = 1;
    surface = physics_getsurfacetypefromflags(flag1);
    surfacetype = getsubstr(surface["name"], 9);
    if (surfacetype == "user_terrain1") {
        var_c92ef281c1d335fc playsound("soc_ball_bounce_small");
    } else if (var_324845adc7297688 < 180) {
        var_c92ef281c1d335fc playsurfacesound("soc_ball_bounce_small", surfacetype);
    } else if (var_324845adc7297688 < 260) {
        var_c92ef281c1d335fc playsurfacesound("soc_ball_bounce_med", surfacetype);
    } else {
        var_c92ef281c1d335fc playsurfacesound("soc_ball_bounce_large", surfacetype);
    }
    /#
    #/
    wait(0.1);
    var_c92ef281c1d335fc.playing_sound = undefined;
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bf1
// Size: 0x195
function onsoccerballreset(var_8fa61d7d6ced991d) {
    self.ignorereset = 1;
    if (!istrue(var_8fa61d7d6ced991d)) {
        wait(0.5);
        self.visuals playsound("soc_ball_vanish");
        playfx(level.var_f851d61f84f9a7b9["vanish"], self.visuals.origin);
    } else {
        wait(0.1);
        playfx(level.var_f851d61f84f9a7b9["vanish"], self.visuals.origin);
    }
    self.visuals hide();
    wait(1);
    self.visuals.origin = self.resetposition;
    angles = (0, 30, 0);
    up = anglestoup(angles);
    forward = anglestoforward(angles);
    if (level.mapname == "mp_m_stadium") {
        force = up * 500 + (0, 0, 80);
    } else {
        force = up * 50 + (0, 0, 80);
    }
    self.visuals show();
    self.visuals physicslaunchserver(self.visuals.origin, force);
    self.ignorereset = 0;
    if (isdefined(self.var_5c83a6b4c46d2ff5)) {
        self [[ self.var_5c83a6b4c46d2ff5 ]]();
    }
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d8d
// Size: 0x4d0
function function_7ab15a1be4cb821b(goal) {
    if (istrue(self.ignorereset)) {
        self.ignorereset = 0;
        return;
    }
    if (game["switchedsides"]) {
        var_200a113a1e7807eb = getotherteam(goal.team)[0];
        if (var_200a113a1e7807eb == "allies") {
            game["axisGoals"]++;
            var_2724ea192f3e906d = "goal_1";
        } else {
            game["alliesGoals"]++;
            var_2724ea192f3e906d = "goal_2";
        }
    } else {
        var_200a113a1e7807eb = goal.team;
        if (var_200a113a1e7807eb == "allies") {
            game["alliesGoals"]++;
            var_2724ea192f3e906d = "goal_2";
        } else {
            game["axisGoals"]++;
            var_2724ea192f3e906d = "goal_1";
        }
    }
    if (isdefined(var_2724ea192f3e906d)) {
        exploder(var_2724ea192f3e906d);
    }
    var_cd96aff84bcc3247 = "tv_goal";
    if (isdefined(var_cd96aff84bcc3247)) {
        exploder(var_cd96aff84bcc3247);
    }
    goal.var_4f853e8e6740b229++;
    level function_2ceffef2d682c49e(goal);
    goal thread function_f0b4b85fd224bce2();
    if (getgametype() == "arena") {
        foreach (player in level.players) {
            if (player.team == var_200a113a1e7807eb) {
                if (player.team == "allies") {
                    player thread function_b6b6cab8242eb686("dx_mpa_rutl_" + "summer_game_goal" + random(level.var_17b1839ca513e9ba), "summer_game_goal", 2, "soccer_goal_them");
                } else {
                    player thread function_b6b6cab8242eb686("dx_mpa_uktl_" + "summer_game_goal" + random(level.var_17b1839ca513e9ba), "summer_game_goal", 2, "soccer_goal_them");
                }
            } else if (player.team == "allies") {
                player thread function_b6b6cab8242eb686("dx_mpa_uktl_" + "summer_game_goal" + random(level.var_17b1839ca513e9ba), "summer_game_goal", 2, "soccer_goal_us");
            } else {
                player thread function_b6b6cab8242eb686("dx_mpa_rutl_" + "summer_game_goal" + random(level.var_17b1839ca513e9ba), "summer_game_goal", 2, "soccer_goal_us");
            }
        }
    } else {
        foreach (player in level.players) {
            if (player.team == "allies") {
                player thread function_b6b6cab8242eb686("dx_mpa_uktl_" + "summer_game_goal" + random(level.var_17b1839ca513e9ba), "summer_game_goal", 2, "soccer_goal_us");
            } else {
                player thread function_b6b6cab8242eb686("dx_mpa_rutl_" + "summer_game_goal" + random(level.var_17b1839ca513e9ba), "summer_game_goal", 2, "soccer_goal_us");
            }
        }
    }
    self.visuals thread function_f0f8e34f2d693727();
    var_915e8fb432a95dfb = self.visuals getlinkedchildren();
    foreach (item in var_915e8fb432a95dfb) {
        if (isdefined(item)) {
            item unlink(1);
        }
    }
    if (isdefined(self.onreset)) {
        self thread [[ self.onreset ]](1);
    }
    if (goal.var_4f853e8e6740b229 >= 10 && isdefined(game["multiBall"]) && !game["multiBall"] || getdvarint(@"hash_9fc6cedb80cfd5f7", 0) == 1 && isdefined(game["multiBall"]) && !game["multiBall"]) {
        game["multiBall"] = 1;
        foreach (player in level.players) {
            player thread namespace_44abc05161e2e2cb::showsplash("soccer_multiball");
        }
        if (level.var_288d5564a47d230a.size > 0) {
            var_5523d1e44f1beb9c = getdvarint(@"hash_71c708ca0182656b", 3);
            for (i = 0; i < var_5523d1e44f1beb9c; i++) {
                function_ec48a99c32f94620(level.var_288d5564a47d230a[i]);
            }
        }
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5264
// Size: 0x21
function function_f0f8e34f2d693727() {
    self playsound("soc_ball_explode");
    wait(1.5);
    self playsound("soc_ball_goal_music");
}

// Namespace common/namespace_310ba947928891df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x528c
// Size: 0x1a6
function function_f0b4b85fd224bce2(var_578a7fa223becde2, waittime) {
    for (i = 0; i < min(self.var_4f853e8e6740b229, 10); i++) {
        playfx(level.var_b6e1c0b3c715b0df["gos_fireworks"], self.trigger.origin + (randomintrange(-100, 100), randomintrange(-100, 100), randomintrange(-25, 60)), anglestoforward(self.trigger.angles + (randomintrange(int(max(clamp(0 - i * 5, -19, 0), -20)), int(min(20, 1 + i * 5))), randomintrange(int(max(clamp(0 - i * 5, -19, 0), -20)), int(min(20, 1 + i * 5))), 0)), anglestoup(self.trigger.angles + (randomintrange(int(max(clamp(0 - i * 5, -19, 0), -20)), int(min(20, 1 + i * 5))), randomintrange(int(max(clamp(0 - i * 5, -19, 0), -20)), int(min(20, 1 + i * 5))), 0)));
        if (istrue(var_578a7fa223becde2)) {
            level thread function_2c3362a9f434fd8d(self.trigger.origin);
        }
        if (isdefined(waittime)) {
            wait(waittime);
        }
    }
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5439
// Size: 0xcf
function function_2ceffef2d682c49e(goal) {
    foreach (struct in level.var_8ba3a46d0f5089a4) {
        if (struct.var_a160eb484ac5e768 == goal.team) {
            if (goal.var_4f853e8e6740b229 >= 10) {
                struct.scriptable setscriptablepartstate("score", "10");
            } else {
                struct.scriptable setscriptablepartstate("score", "0" + string(goal.var_4f853e8e6740b229));
            }
        }
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x550f
// Size: 0x2bd
function outofboundswatcher() {
    level endon("game_ended");
    while (1) {
        wait(0.5);
        if (istrue(self.ignorereset)) {
            continue;
        }
        if (isdefined(self.resetnow)) {
            self.resetnow = undefined;
            if (isdefined(self.onreset)) {
                self thread [[ self.onreset ]]();
            }
            continue;
        }
        for (index = 0; index < level.radtriggers.size; index++) {
            if (!self.visuals istouching(level.radtriggers[index])) {
                continue;
            }
            if (isdefined(self.onreset)) {
                self thread [[ self.onreset ]]();
            }
            continue;
        }
        for (index = 0; index < level.minetriggers.size; index++) {
            if (!self.visuals istouching(level.minetriggers[index])) {
                continue;
            }
            if (isdefined(self.onreset)) {
                self thread [[ self.onreset ]]();
            }
            continue;
        }
        for (index = 0; index < level.hurttriggers.size; index++) {
            if (!self.visuals istouching(level.hurttriggers[index])) {
                continue;
            }
            if (isdefined(self.onreset)) {
                self thread [[ self.onreset ]]();
            }
            continue;
        }
        if (istrue(level.ballallowedtriggers.size)) {
            self.allowedintrigger = 0;
            foreach (trigger in level.ballallowedtriggers) {
                if (self.visuals istouching(trigger)) {
                    self.allowedintrigger = 1;
                    break;
                }
            }
        }
        if (isdefined(level.outofboundstriggers)) {
            foreach (trigger in level.outofboundstriggers) {
                if (istrue(self.allowedintrigger)) {
                    break;
                }
                if (!self.visuals istouching(trigger)) {
                    continue;
                }
                if (isdefined(self.onreset)) {
                    self thread [[ self.onreset ]]();
                }
                continue;
            }
        }
        if (isdefined(self.autoresettime)) {
            wait(self.autoresettime);
            if (!isdefined(self.carrier)) {
                if (isdefined(self.onreset)) {
                    self thread [[ self.onreset ]]();
                }
            }
        }
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57d3
// Size: 0x6d
function function_5e8d33789dd33052() {
    level endon("game_ended");
    while (1) {
        wait(0.25);
        if (istrue(self.ignorereset)) {
            continue;
        }
        if (distancesquared(self.visuals.origin, self.resetposition) > 9000000) {
            if (isdefined(self.onreset)) {
                self thread [[ self.onreset ]]();
            }
        }
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5847
// Size: 0x216
function function_8f38b7a29dad82f() {
    var_1d564be0354953b0 = getentarray("allies_goal", "targetname");
    var_9f9cbf678fd4238d = getentarray("axis_goal", "targetname");
    if (var_1d564be0354953b0.size > 0 && var_9f9cbf678fd4238d.size > 0) {
        level.var_758ea12adc8b098c = spawnstruct();
        level.var_758ea12adc8b098c.team = "allies";
        level.var_758ea12adc8b098c.trigger = var_1d564be0354953b0[0];
        level.var_758ea12adc8b098c.entsinside = [];
        level.var_fe3a223ce9f0dc43 = spawnstruct();
        level.var_fe3a223ce9f0dc43.team = "axis";
        level.var_fe3a223ce9f0dc43.trigger = var_9f9cbf678fd4238d[0];
        level.var_fe3a223ce9f0dc43.entsinside = [];
        level.var_fe3a223ce9f0dc43.var_4f853e8e6740b229 = 0;
        if (!isdefined(game["roundsPlayed"]) || isdefined(game["roundsPlayed"]) && game["roundsPlayed"] == 0) {
            game["alliesGoals"] = 0;
            level.var_758ea12adc8b098c.var_4f853e8e6740b229 = 0;
            game["axisGoals"] = 0;
            level.var_fe3a223ce9f0dc43.var_4f853e8e6740b229 = 0;
        } else if (game["switchedsides"]) {
            level.var_fe3a223ce9f0dc43.var_4f853e8e6740b229 = game["alliesGoals"];
            level.var_758ea12adc8b098c.var_4f853e8e6740b229 = game["axisGoals"];
        } else {
            level.var_758ea12adc8b098c.var_4f853e8e6740b229 = game["alliesGoals"];
            level.var_fe3a223ce9f0dc43.var_4f853e8e6740b229 = game["axisGoals"];
        }
        level.var_6ffd40b85f9bdc80 = [0:level.var_fe3a223ce9f0dc43, 1:level.var_758ea12adc8b098c];
        level thread function_c3de6082ad64dc54();
    } else {
        level notify("stop_soccer_goal");
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a64
// Size: 0x1de
function function_c3de6082ad64dc54() {
    wait(1);
    level.var_3ff95947a34d0317 = getstructarray("home", "targetname");
    level.var_f8c5a6f236996c7c = getstructarray("away", "targetname");
    level.var_8ba3a46d0f5089a4 = array_combine(level.var_3ff95947a34d0317, level.var_f8c5a6f236996c7c);
    foreach (struct in level.var_3ff95947a34d0317) {
        struct.scriptable = spawn("script_model", struct.origin);
        struct.scriptable.angles = struct.angles;
        struct.scriptable setmodel("vfx_stadium_scoreboard_scriptable");
        struct.var_a160eb484ac5e768 = "allies";
    }
    foreach (struct in level.var_f8c5a6f236996c7c) {
        struct.scriptable = spawn("script_model", struct.origin);
        struct.scriptable.angles = struct.angles;
        struct.scriptable setmodel("vfx_stadium_scoreboard_scriptable");
        struct.var_a160eb484ac5e768 = "axis";
    }
    level function_2ceffef2d682c49e(level.var_758ea12adc8b098c);
    level function_2ceffef2d682c49e(level.var_fe3a223ce9f0dc43);
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c49
// Size: 0x12a
function function_a21ad1174231d156(var_633ed0d009b54036) {
    level endon("game_ended");
    level endon("stop_soccer_goal");
    while (!isdefined(level.var_6ffd40b85f9bdc80)) {
        waitframe();
    }
    while (1) {
        wait(0.05);
        if (istrue(self.ignorereset)) {
            continue;
        }
        for (index = 0; index < level.var_6ffd40b85f9bdc80.size; index++) {
            if (!function_6a55687e0ac4a408(level.var_6ffd40b85f9bdc80[index], self.visuals)) {
                continue;
            }
            if (!function_4d41453b43a4e638(level.var_6ffd40b85f9bdc80[index], self.visuals)) {
                continue;
            }
            entnum = self.visuals getentitynumber();
            level.var_6ffd40b85f9bdc80[index].entsinside[entnum] = self.visuals;
            self.visuals.var_d98176db59cca89a = level.var_6ffd40b85f9bdc80[index];
            if (isdefined(self.var_7ab15a1be4cb821b)) {
                [[ self.var_7ab15a1be4cb821b ]](level.var_6ffd40b85f9bdc80[index]);
            }
            continue;
        }
    }
}

// Namespace common/namespace_310ba947928891df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d7a
// Size: 0x3a
function function_4d41453b43a4e638(var_633ed0d009b54036, ent) {
    entnum = ent getentitynumber();
    if (isdefined(var_633ed0d009b54036.entsinside[entnum])) {
        return 0;
    }
    return 1;
}

// Namespace common/namespace_310ba947928891df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dbc
// Size: 0x75
function function_6a55687e0ac4a408(var_633ed0d009b54036, ent) {
    if (!ent istouching(var_633ed0d009b54036.trigger)) {
        entnum = ent getentitynumber();
        var_633ed0d009b54036.entsinside[entnum] = undefined;
        if (isdefined(ent.var_d98176db59cca89a) && ent.var_d98176db59cca89a == var_633ed0d009b54036) {
            ent.var_d98176db59cca89a = undefined;
        }
        return 0;
    }
    return 1;
}

// Namespace common/namespace_310ba947928891df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e39
// Size: 0x55
function function_2c3362a9f434fd8d(origin) {
    sound = "gos_firework_scream_sfx";
    playsoundatpos(origin, sound);
    var_1499e7c2d69e0074 = lookupsoundlength(sound);
    wait(1.5);
    playsoundatpos(origin + (0, 0, 600), "gos_firework_explo_sfx");
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e95
// Size: 0x155
function function_e55c6985b99a0d78() {
    level.var_b6e1c0b3c715b0df["gos_fireworks"] = loadfx("vfx/iw8_mp/gamemode/vfx_gos_firework.vfx");
    level.var_f851d61f84f9a7b9["vanish"] = loadfx("vfx/iw8_mp/gamemode/vfx_soccer_ball_burst.vfx");
    level.var_f851d61f84f9a7b9["score_00"] = loadfx("vfx/iw8_mp/level/stadium/vfx_stad_score_00.vfx");
    level.var_f851d61f84f9a7b9["score_01"] = loadfx("vfx/iw8_mp/level/stadium/vfx_stad_score_01.vfx");
    level.var_f851d61f84f9a7b9["score_02"] = loadfx("vfx/iw8_mp/level/stadium/vfx_stad_score_02.vfx");
    level.var_f851d61f84f9a7b9["score_03"] = loadfx("vfx/iw8_mp/level/stadium/vfx_stad_score_03.vfx");
    level.var_f851d61f84f9a7b9["score_04"] = loadfx("vfx/iw8_mp/level/stadium/vfx_stad_score_04.vfx");
    level.var_f851d61f84f9a7b9["score_05"] = loadfx("vfx/iw8_mp/level/stadium/vfx_stad_score_05.vfx");
    level.var_f851d61f84f9a7b9["score_06"] = loadfx("vfx/iw8_mp/level/stadium/vfx_stad_score_06.vfx");
    level.var_f851d61f84f9a7b9["score_07"] = loadfx("vfx/iw8_mp/level/stadium/vfx_stad_score_07.vfx");
    level.var_f851d61f84f9a7b9["score_08"] = loadfx("vfx/iw8_mp/level/stadium/vfx_stad_score_08.vfx");
    level.var_f851d61f84f9a7b9["score_09"] = loadfx("vfx/iw8_mp/level/stadium/vfx_stad_score_09.vfx");
    level.var_f851d61f84f9a7b9["score_10"] = loadfx("vfx/iw8_mp/level/stadium/vfx_stad_score_10.vfx");
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ff1
// Size: 0x61
function function_daed1651833fb1a2() {
    game["dialog"]["summer_game_goal_1"] = "summer_game_goal_1";
    game["dialog"]["summer_game_goal_2"] = "summer_game_goal_2";
    game["dialog"]["summer_game_goal_3"] = "summer_game_goal_3";
    level.var_17b1839ca513e9ba = [0:"_1", 1:"_2", 2:"_3"];
}

// Namespace common/namespace_310ba947928891df
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6059
// Size: 0xa6
function function_b6b6cab8242eb686(dialog, var_d653377138d5eff2, time, splash) {
    self notify("goal_scored");
    self endon("goal_scored");
    if (!isdefined(level.lastteamstatustime["allies"][var_d653377138d5eff2])) {
        level.lastteamstatustime["allies"][var_d653377138d5eff2] = 0;
    }
    if (gettime() < level.lastteamstatustime["allies"][var_d653377138d5eff2] + time * 1000) {
        return;
    }
    self queuedialogforplayer(dialog, var_d653377138d5eff2, time);
    level.lastteamstatustime["allies"][var_d653377138d5eff2] = gettime();
    thread namespace_44abc05161e2e2cb::showsplash(splash);
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6106
// Size: 0x57
function snowballfighthint() {
    self endon("death");
    if (!gameflag("prematch_done")) {
        thread namespace_68747ec28caa9f9e::tutorialprint("MP_INGAME_ONLY/PRACTICE_ROUND", 5);
        wait(6);
        gameflagwait("prematch_done");
        thread namespace_68747ec28caa9f9e::tutorialprint("MP_INGAME_ONLY/SNOWBALL_FIGHT", 5);
    } else {
        thread namespace_68747ec28caa9f9e::tutorialprint("MP_INGAME_ONLY/SNOWBALL_FIGHT", 5);
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6164
// Size: 0x38
function function_30dd74b21bfffe6() {
    if (getdvarint(@"hash_a88f1329561bc6e1", 0) > 0) {
        level.var_8ce8010175fb9787 = getdvarint(@"hash_a88f1329561bc6e1", 0);
        level thread randomcarepackagedrops();
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61a3
// Size: 0x16d
function randomcarepackagedrops() {
    level endon("game_ended");
    level.var_e1619c97e3fd8a87 = [];
    level thread function_49e45907b10122e4();
    waitframe();
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    wait(level.var_8ce8010175fb9787);
    level.grnd_previouscratetypes = [];
    while (1) {
        owner = undefined;
        var_4440147083abaf0a = 1;
        if (currentactivevehiclecount() < maxvehiclesallowed() && level.fauxvehiclecount + var_4440147083abaf0a < maxvehiclesallowed() && namespace_6c578d6ef48f10ef::getnumdroppedcrates() < 8) {
            cratetype = getdropzonecratetype();
            position = function_43c1d665b215618();
            if (!isdefined(position)) {
                return;
            }
            if (cratetype == "mega") {
                streakinfo = spawnstruct();
                streakinfo.cratetype = undefined;
                streakinfo.numcrates = undefined;
                streakinfo.usephysics = undefined;
                streakinfo.streakname = "airdrop_multiple";
                namespace_80452e5c7b267d14::airdrop_multiple_dropcrates(owner, undefined, position, randomfloat(360), position, 1, streakinfo);
            } else {
                vehicleisreserved = namespace_f64231d5b7a2c3c4::reservevehicle();
                namespace_6c578d6ef48f10ef::dropkillstreakcratefromscriptedheli(owner, undefined, cratetype, position, randomfloat(360), position, vehicleisreserved);
            }
            waittime = level.var_8ce8010175fb9787;
        } else {
            waittime = 0.5;
        }
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(waittime);
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6317
// Size: 0xb6
function getdropzonecratetype() {
    cratetype = undefined;
    if (!isdefined(level.grnd_previouscratetypes["mega"]) && randomintrange(0, 100) < 5) {
        cratetype = "mega";
    } else {
        if (level.grnd_previouscratetypes.size) {
            for (var_2c28ba9a9a351dc6 = 200; var_2c28ba9a9a351dc6; var_2c28ba9a9a351dc6--) {
                cratetype = namespace_6c578d6ef48f10ef::getrandomkillstreak();
                if (isdefined(level.grnd_previouscratetypes[cratetype])) {
                    cratetype = undefined;
                } else {
                    break;
                }
            }
        }
        if (!isdefined(cratetype)) {
            cratetype = namespace_6c578d6ef48f10ef::getrandomkillstreak();
        }
    }
    level.grnd_previouscratetypes[cratetype] = 1;
    if (level.grnd_previouscratetypes.size == 15) {
        level.grnd_previouscratetypes = [];
    }
    return cratetype;
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63d5
// Size: 0x5d
function function_43c1d665b215618() {
    dropposition = level.var_e1619c97e3fd8a87[0];
    level.var_e1619c97e3fd8a87[level.var_e1619c97e3fd8a87.size] = level.var_e1619c97e3fd8a87[0];
    level.var_e1619c97e3fd8a87[0] = undefined;
    level.var_e1619c97e3fd8a87 = array_removeundefined(level.var_e1619c97e3fd8a87);
    return dropposition;
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x643a
// Size: 0x939
function function_49e45907b10122e4() {
    switch (level.mapname) {
    case #"hash_32eaa112f8caa7e4":
        level.var_e1619c97e3fd8a87 = [0:(21298, -15989, 1970), 1:(22131, -18582, 690), 2:(17264, -17920, 1066), 3:(16682, -23069, 230), 4:(21664, -23061, -108), 5:(16208, -13686, -158), 6:(19920, -18069, 157), 7:(25150, -17449, -150), 8:(27173, -14625, -200), 9:(22696, -12784, -158), 10:(22115, -12162, -106), 11:(22278, -10595, 1610), 12:(19963, -14131, 149), 13:(20019, -11243, -194), 14:(16711, -8999, -326), 15:(15772, -5966, -390), 16:(15501, -1873, -446), 17:(19760, -1172, -449), 18:(20464, -2047, -450), 19:(23814, -5888, -382), 20:(26210, -9404, -318), 21:(30288, -8981, -358), 22:(20781, -7208, -366), 23:(18773, -13037, 9), 24:(20091, -21421, -78), 25:(23574, -14769, -134)];
        break;
    case #"hash_7a28db3c5928c489":
        level.var_e1619c97e3fd8a87 = [0:(25008, 32313, 826), 1:(29171, 32156, 659), 2:(25021, 37011, 841), 3:(30305, 35572, 526), 4:(30779, 33427, 1009), 5:(28913, 38886, 888), 6:(25888, 40248, 1680), 7:(27533, 43285, 1792), 8:(31199, 37768, 722), 9:(33534, 35968, 1103), 10:(34872, 33255, 664), 11:(33704, 39718, 1395), 12:(35903, 39512, 879), 13:(32265, 46424, 1450), 14:(35084, 43008, 960), 15:(38700, 43064, 1087), 16:(36348, 44694, 481), 17:(34805, 48469, 1317), 18:(32313, 39712, 767)];
        break;
    case #"hash_50de71be6e7469ff":
    case #"hash_863773b8960b3944":
        level.var_e1619c97e3fd8a87 = [0:(51478, -24749, -55), 1:(50222, -21762, -335), 2:(46165, -20091, -409), 3:(49089, -18057, -359), 4:(54074, -16693, -307), 5:(52289, -14523, -335), 6:(48361, -13952, -1), 7:(43445, -16524, -405), 8:(43634, -13100, -51), 9:(47714, -14136, 141), 10:(50498, -12784, -199), 11:(53744, -11930, -510), 12:(52284, -7268, -672), 13:(49723, -7122, 438), 14:(47540, -10295, 266), 15:(48403, -7548, 291), 16:(53225, -3832, -456), 17:(49419, -4336, 141), 18:(49419, -4336, 141), 19:(47101, -1784, 116), 20:(43600, -3193, 340), 21:(42522, -6972, 30), 22:(45959, -5516, 328), 23:(46058, -8625, 136)];
        break;
    case #"hash_12f3765ef24b4037":
        level.var_e1619c97e3fd8a87 = [0:(40724, -13376, -58), 1:(37115, -14577, -152), 2:(35766, -19268, -508), 3:(38572, -18749, -508), 4:(42023, -19947, -500), 5:(40116, -25824, -247), 6:(38056, -23083, 240), 7:(35024, -24401, -508), 8:(36958, -26270, -112), 9:(36264, -28611, -36), 10:(38229, -28438, -452), 11:(38304, -30376, -172), 12:(33276, -26940, -116), 13:(30526, -27712, -508), 14:(29810, -29730, -508), 15:(33689, -28898, -507), 16:(36498, -33452, -508), 17:(37219, -37142, -506), 18:(34863, -34724, -318), 19:(34304, -36576, -506), 20:(31116, -35074, -508), 21:(32797, -32582, -372)];
        break;
    case #"hash_924a3fbe9fbe15c6":
        level.var_e1619c97e3fd8a87 = [0:(-28661, -17966, -177), 1:(-30406, -15324, -159), 2:(-26858, -14816, 3), 3:(-26567, -8261, 17), 4:(-23466, -14624, -12), 5:(-24687, -11527, 238), 6:(-24492, -10369, 148), 7:(-25965, -11096, 27), 8:(-29884, -12919, -43), 9:(-30458, -10020, -136), 10:(-28564, -9301, 248), 11:(-29994, -6709, -208), 12:(-28156, -5883, -119), 13:(-30522, -3889, -247), 14:(-28220, -3171, -255), 15:(-25333, -4300, -242), 16:(-28106, -1937, -255), 17:(-30823, -2351, -248), 18:(-29121, -11011, -61)];
        break;
    case #"hash_a8b272dba33a4aed":
        level.var_e1619c97e3fd8a87 = [0:(2716, -158, 708), 1:(8215, 874, 342), 2:(6524, 1561, 316), 3:(5827, -860, 357), 4:(4268, -47, 452), 5:(2305, -1994, 386), 6:(5172, 2587, 231), 7:(2691, 3096, 302), 8:(-910, 3497, 318), 9:(-3579, -544, 320), 10:(2591, 1659, 545), 11:(1033, -514, 447), 12:(-93, -2789, 169), 13:(-1301, 924, 315), 14:(-2843, 2779, 316)];
        break;
    default:
        level.var_e1619c97e3fd8a87 = getcoremapdropzones();
        break;
    }
    level.var_e1619c97e3fd8a87 = array_randomize(level.var_e1619c97e3fd8a87);
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d7a
// Size: 0x232
function getcoremapdropzones() {
    var_bc115bc1bac87a51 = [];
    trigs = getentarray("grnd", "targetname");
    if (level.mapname == "mp_shipment") {
        var_49e04f87f5702f8c = [];
        foreach (trig in trigs) {
            if (trig.script_label == "1" && distance(trig.origin, (-333, 1999, 119)) < 5) {
                var_49e04f87f5702f8c[var_49e04f87f5702f8c.size] = trig;
            } else if (trig.script_label == "2" && distance(trig.origin, (189, 1564, 75)) < 5) {
                var_49e04f87f5702f8c[var_49e04f87f5702f8c.size] = trig;
            } else if (trig.script_label == "3" && distance(trig.origin, (-751, 2416, 81)) < 5) {
                var_49e04f87f5702f8c[var_49e04f87f5702f8c.size] = trig;
            } else if (trig.script_label == "4" && distance(trig.origin, (165, 2420, 79)) < 5) {
                var_49e04f87f5702f8c[var_49e04f87f5702f8c.size] = trig;
            } else if (trig.script_label == "5" && distance(trig.origin, (-823, 1536, 68)) < 5) {
                var_49e04f87f5702f8c[var_49e04f87f5702f8c.size] = trig;
            }
        }
        trigs = array_remove_array(trigs, var_49e04f87f5702f8c);
    }
    if (trigs.size > 0) {
        foreach (trig in trigs) {
            var_bc115bc1bac87a51[var_bc115bc1bac87a51.size] = trig.origin;
        }
    }
    return var_bc115bc1bac87a51;
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fb4
// Size: 0x1c
function function_89d441b8cca6251d() {
    return isdefined(level.var_8ce8010175fb9787) && level.var_8ce8010175fb9787 > 0;
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fd8
// Size: 0x326
function function_52343d5c1b190cf0() {
    level.tier1ModeEnabled = getdvarint(@"hash_127490a7577f169f", 0);
    level.var_ee05489a095df4d1 = getdvarint(@"hash_509b01d1370107af", 0) == 1;
    level.var_11d8636343eae20c = getdvarint(@"hash_e05a6970966d8552", 0);
    level.var_accb27010daa82d = getdvarint(@"hash_4a592b7d1efa862d", 0);
    level.var_1921cb8dd51a8f73 = getdvarint(@"hash_4c748c9425636394", 0);
    level.testrandomrealismclients = getdvarint(@"hash_596700a25033a832", 0) == 1;
    setomnvar("ui_realism_mode", namespace_36f464722d326bbe::function_b2c4b42f9236924());
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
            level.modifyplayerdamage = &namespace_3e725f3cc58bddd3::gamemodemodifyplayerdamage;
        }
        setdvar(@"hash_3ab0313f7e723fa1", 1);
        setdvar(@"hash_50416df1cbb3c99a", 0);
        if (!namespace_8e28f8b325a83325::function_167619fe3d0cff00()) {
            level.disablespawncamera = 1;
        }
        if (istrue(level.var_1921cb8dd51a8f73)) {
            level.var_26109c02a53cea84 = [];
            level.var_26109c02a53cea84["rocketlauncher"] = getdvarfloat(@"hash_2b6ceef99f7c775", 0.75);
            level.var_26109c02a53cea84["sniper"] = getdvarfloat(@"hash_2b2aaef99f38272", 0.8);
            level.var_26109c02a53cea84["mg"] = getdvarfloat(@"hash_263c3ef999d0b4f", 0.85);
            level.var_26109c02a53cea84["rifle"] = getdvarfloat(@"hash_274c6ef99af1c44", 0.9);
            level.var_26109c02a53cea84["smg"] = getdvarfloat(@"hash_2b2a9ef99f3803f", 0.95);
            level.var_26109c02a53cea84["spread"] = getdvarfloat(@"hash_2b2b3ef99f3963d", 0.95);
            level.var_26109c02a53cea84["grenade"] = getdvarfloat(@"hash_27db6ef99b917c2", 1);
            level.var_26109c02a53cea84["melee"] = getdvarfloat(@"hash_263c5ef999d0fb5", 1);
            level.var_26109c02a53cea84["pistol"] = getdvarfloat(@"hash_2bfa5ef9a018bf8", 1);
        }
        /#
            setdevdvarifuninitialized(@"hash_74cf84c8f4c62dd0", 0);
            setdevdvarifuninitialized(@"hash_1a0e0937636134eb", 0);
        #/
        if (!isusingmatchrulesdata()) {
            setdvar(@"hash_2a4effcaf5954d38", 0);
            setdvar(@"hash_b1d561f9a9241e09", 50);
            setdvar(@"hash_e5a33d679c26221f", 4);
            setdvar(@"hash_399f13d1217738fe", 0);
            setdvar(@"hash_a4d532f42d919827", 0);
            setdvar(@"hash_d75d5638785f3b09", 0);
            setdvar(@"hash_8ad1ab9436bccca", 0);
            setdvar(@"hash_28d450f7f28644b7", 0);
            setdvar(@"hash_8a1945c94d5092c2", 0);
        }
        namespace_bc0abb78a303bb78::function_8ece37593311858a(&function_3708850eab3864c2);
        namespace_71eef510d7f364cf::registeronplayerspawncallback(&function_3708850eab3864c2);
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7305
// Size: 0x6e
function function_3708850eab3864c2() {
    if (istrue(level.testrandomrealismclients)) {
        if (!isdefined(self.isrealismenabled)) {
            if (cointoss()) {
                self setclientomnvar("ui_realism_hud", 1);
                self.isrealismenabled = 1;
            } else {
                self setclientomnvar("ui_realism_hud", 0);
                self.isrealismenabled = 0;
            }
        }
    } else {
        self setclientomnvar("ui_realism_hud", namespace_36f464722d326bbe::function_b2c4b42f9236924());
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x737a
// Size: 0x23a
function function_7bac8ee72285298e() {
    droplocation = self.origin;
    startpos = droplocation + (0, 0, 14);
    stance = self getstance();
    zoffset = 35;
    if (stance == "prone") {
        zoffset = 14;
    }
    if (stance == "crouch") {
        zoffset = 25;
    }
    var_9c19496ce8106e6b = droplocation + (0, 0, zoffset);
    randomangle = (0, randomfloat(360), 0);
    var_a76189155f382805 = anglestoforward(randomangle);
    var_a73587155f07bd39 = randomfloatrange(30, 150);
    testpos = startpos + var_a73587155f07bd39 * var_a76189155f382805;
    var_b809b8f732448a84 = playerphysicstrace(startpos, testpos);
    if (!isdefined(self.var_a25375a5ab23eacb)) {
        visuals = [];
        visuals[0] = spawn("script_model", var_9c19496ce8106e6b);
        visuals[0] setmodel("noglow::lm_heal_first_aid_kit_vfx");
        trigger = spawn("trigger_radius", var_9c19496ce8106e6b, 0, 32, 32);
        trigger namespace_3c37cb17ade254d::trigger_off();
        pickup = namespace_19b4203b51d56488::createuseobject("neutral", trigger, visuals, undefined, undefined, 1);
        pickup.onuse = &function_75c517d33cd52b54;
        pickup.usetime = 0;
        pickup namespace_19b4203b51d56488::allowuse("any");
        pickup.owner = self;
        self.var_a25375a5ab23eacb = pickup;
        self.var_a25375a5ab23eacb thread monitordisconnect();
    } else {
        self.var_a25375a5ab23eacb.curorigin = var_9c19496ce8106e6b;
        self.var_a25375a5ab23eacb.visuals[0].origin = var_9c19496ce8106e6b;
        self.var_a25375a5ab23eacb.trigger.origin = var_9c19496ce8106e6b;
    }
    self.var_a25375a5ab23eacb thread function_5c5358ef41543da6(var_9c19496ce8106e6b, var_b809b8f732448a84);
    if (level.var_accb27010daa82d > 0) {
        self.var_a25375a5ab23eacb thread monitortimeout();
    }
}

// Namespace common/namespace_310ba947928891df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75bb
// Size: 0xde
function function_5c5358ef41543da6(startpos, endpos) {
    self endon("death");
    var_c9dfc53c7cc5876a = (endpos - startpos) * 25;
    self.visuals[0] physicslaunchserver(self.visuals[0].origin, var_c9dfc53c7cc5876a);
    wait(1);
    if (isdefined(self.trigger) && isdefined(self.visuals[0])) {
        self.trigger.origin = self.visuals[0].origin;
        self.curorigin = self.visuals[0].origin;
        self.visuals[0] physicsstopserver();
        self.trigger namespace_3c37cb17ade254d::trigger_on();
    }
}

// Namespace common/namespace_310ba947928891df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76a0
// Size: 0xd8
function function_75c517d33cd52b54(player, team) {
    if (player.health <= 0 || player.health == player.maxhealth) {
        return;
    }
    if (player isjuggernaut()) {
        return;
    }
    player playsoundtoplayer("br_pickup_generic", player);
    player thread function_427b6f3adc1b7a7d();
    if (level.var_ee05489a095df4d1) {
        if (level.var_11d8636343eae20c == 0) {
            player.health = player.maxhealth;
        } else {
            player.health = min(player.health + level.var_11d8636343eae20c, player.maxhealth);
        }
    } else {
        player notify("force_regeneration");
    }
    function_5dc0c80460e6c6bb();
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x777f
// Size: 0x84
function function_427b6f3adc1b7a7d() {
    self endon("death_or_disconnect");
    var_ebec497ff8b18a45 = namespace_85d036cb78063c4a::getcurrentsuperref();
    var_f344626b0e399e64 = namespace_85d036cb78063c4a::issuperinuse() && isdefined(var_ebec497ff8b18a45) && var_ebec497ff8b18a45 == "super_deadsilence";
    if (!var_f344626b0e399e64) {
        self lerpfovbypreset("zombiedefault");
    }
    wait(0.5);
    var_ebec497ff8b18a45 = namespace_85d036cb78063c4a::getcurrentsuperref();
    var_f344626b0e399e64 = namespace_85d036cb78063c4a::issuperinuse() && isdefined(var_ebec497ff8b18a45) && var_ebec497ff8b18a45 == "super_deadsilence";
    if (!var_f344626b0e399e64) {
        self lerpfovbypreset("default_2seconds");
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x780a
// Size: 0x12
function monitordisconnect() {
    self waittill("disconnect");
    function_5dc0c80460e6c6bb();
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7823
// Size: 0x2a
function monitortimeout() {
    self endon("death");
    self notify("monitorTimeOut");
    self endon("monitorTimeOut");
    wait(level.var_accb27010daa82d);
    function_5dc0c80460e6c6bb();
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7854
// Size: 0x3b
function function_5dc0c80460e6c6bb() {
    if (isdefined(self.owner)) {
        self.owner.var_a25375a5ab23eacb = undefined;
    }
    self.visuals[0] delete();
    namespace_19b4203b51d56488::deleteuseobject();
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7896
// Size: 0x6f
function function_1513c3f71e935d73() {
    level.var_1af27f387b8d3369 = getdvarint(@"hash_a2c2c2007177185e", 0);
    if (!namespace_36f464722d326bbe::function_21322da268e71c19()) {
        return;
    }
    if (!isusingmatchrulesdata()) {
        setdvar(@"hash_399f13d1217738fe", 0);
        setdvar(@"hash_2922210021914dd7", 0);
        setdvar(@"hash_b1d561f9a9241e09", 30);
        setdvar(@"hash_e5a33d679c26221f", 4);
    }
}

// Namespace common/namespace_310ba947928891df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x790c
// Size: 0x94
function function_417749e099f041f(var_4da4cb52d0bf5b05, victimid) {
    struct = spawnstruct();
    struct.var_4da4cb52d0bf5b05 = var_4da4cb52d0bf5b05;
    struct.victimid = victimid;
    if (!isdefined(self.var_b35c5ea3127572d8)) {
        self.var_b35c5ea3127572d8 = function_79c374ab1ca30cc9(32);
    }
    self.var_b35c5ea3127572d8 = function_6cf786a6cf335cb9(self.var_b35c5ea3127572d8, struct);
    thread processKillEventFeed();
    if (getgametype() == "gwtdm") {
        thread awardBonusAfterTime();
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79a7
// Size: 0xb6
function processKillEventFeed() {
    self endon("disconnect");
    self notify("processKillEventFeed");
    self endon("processKillEventFeed");
    waittillframeend();
    while (isdefined(self.var_b35c5ea3127572d8) && self.var_b35c5ea3127572d8.array.size > 0) {
        struct = function_73d8a9394fc5eda2(self.var_b35c5ea3127572d8);
        self.var_b35c5ea3127572d8 = function_93def91a50927481(self.var_b35c5ea3127572d8);
        self setclientomnvar("ui_killfeed_victim_id", struct.victimid);
        self setclientomnvar("ui_killfeed_data", struct.var_4da4cb52d0bf5b05);
        self setclientomnvar("ui_killfeed_notify", gettime());
        waitframe();
    }
}

// Namespace common/namespace_310ba947928891df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a64
// Size: 0x1a9
function awardBonusAfterTime() {
    self endon("disconnect");
    self notify("awardBonusAfterTime");
    self endon("awardBonusAfterTime");
    if (!isdefined(self.var_a4dcda08906719e4)) {
        self.var_a4dcda08906719e4 = 0;
    }
    self.var_a4dcda08906719e4++;
    var_abee7f4dd68a47c = getdvarfloat(@"hash_a44760277d3fe8a5", 5);
    wait(var_abee7f4dd68a47c);
    var_24d22c13c6fece21 = 0;
    if (self.var_a4dcda08906719e4 > 15) {
        var_24d22c13c6fece21 = 15;
    } else if (self.var_a4dcda08906719e4 > 10) {
        var_24d22c13c6fece21 = 10;
    } else if (self.var_a4dcda08906719e4 > 7) {
        var_24d22c13c6fece21 = 5;
    } else if (self.var_a4dcda08906719e4 > 5) {
        var_24d22c13c6fece21 = 3;
    } else if (self.var_a4dcda08906719e4 > 3) {
        var_24d22c13c6fece21 = 1;
    }
    self.var_a4dcda08906719e4 = 0;
    if (var_24d22c13c6fece21 == 0) {
        return;
    }
    namespace_e8a49b70d0769b66::giveteamscoreforobjective(self.team, var_24d22c13c6fece21, 0);
    if (getdvarint(@"hash_2e405e2912dc4a44", 0) == 1) {
        thread namespace_62c556437da28f50::scoreeventpopup(function_2ef675c13ca1c4af(#"hash_2c8bcbb02ec7ff9b", var_24d22c13c6fece21));
    }
    namespace_3c5a4254f2b957ea::incpersstat("contribution", var_24d22c13c6fece21);
    namespace_3c5a4254f2b957ea::setextrascore0(self.pers["contribution"]);
    var_4da4cb52d0bf5b05 = 0;
    var_4da4cb52d0bf5b05 = var_4da4cb52d0bf5b05 + 6;
    var_4da4cb52d0bf5b05 = var_4da4cb52d0bf5b05 + (var_24d22c13c6fece21 << 4);
    struct = spawnstruct();
    struct.var_4da4cb52d0bf5b05 = var_4da4cb52d0bf5b05;
    struct.victimid = -1;
    self.var_b35c5ea3127572d8 = function_6cf786a6cf335cb9(self.var_b35c5ea3127572d8, struct);
    thread processKillEventFeed();
}
