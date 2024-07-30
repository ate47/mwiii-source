#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\anim\notetracks_mp.gsc;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\execution.gsc;

#namespace namespace_657dc7e018dcfce9;

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ea
// Size: 0x168
function init() {
    setdvar(@"hash_1fc47d6f68e1faf", 1);
    setdvar(@"hash_633e1a62bb5ceeb2", 1);
    if (!isdefined(level.players)) {
        level.players = [];
    }
    level.var_19d38dec02a818ce = &scripts\engine\utility::issharedfuncdefined;
    level.var_49b393a31d0b0b95 = &scripts\engine\utility::getsharedfunc;
    anim_init();
    hud_init();
    killstreak_init();
    equipment_init();
    perk_init();
    player_init();
    vehicle_init();
    game_init();
    spawn_init();
    emp_init();
    execution_init();
    entity_init();
    weapons_init();
    damage_init();
    sound_init();
    flares_init();
    shellshock_init();
    fx_init();
    ai_init();
    bots_init();
    function_550bcd278c30275e();
    outline_init();
    game_utility_init();
    rank_init();
    supers_init();
    gamescore_init();
    pers_init();
    dlog_init();
    challenges_init();
    function_a92ed2f4c44e5ffa();
    stealth_init();
    gameskill_init();
    poi_init();
    function_c1199c7cd79918b3();
    function_1bc257700c3d014e();
    function_a30b248a8fc67a00();
    battlechatter_init();
    host_migration_init();
    function_f677f2d747d21482();
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75a
// Size: 0x2
function gameskill_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x764
// Size: 0x2
function poi_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76e
// Size: 0x2
function stealth_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x778
// Size: 0x44
function anim_init() {
    registersharedfunc("anim", "scriptModelPlayAnimDeltaMotion", &function_3ecab25ce099b78e);
    registersharedfunc("anim", "ASM_PlayFacialAnim", &asm_playfacialanim_mp);
    registersharedfunc("anim", "HandleNoteTrack", &handlenotetrack);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c4
// Size: 0x2
function hud_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ce
// Size: 0x1a4
function killstreak_init() {
    registersharedfunc("killstreak", "registerVisibilityOmnvarForKillstreak", &scripts\cp_mp\utility\killstreak_utility::registervisibilityomnvarforkillstreak);
    registersharedfunc("killstreak", "createStreakInfo", &scripts\cp_mp\utility\killstreak_utility::createstreakinfo);
    registersharedfunc("killstreak", "streakDeploy_doWeaponTabletDeploy", &scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweapontabletdeploy);
    registersharedfunc("killstreak", "getKillstreakAirStrikeHeightEnt", &scripts\cp_mp\utility\killstreak_utility::getkillstreakairstrikeheightent);
    registersharedfunc("killstreak", "playKillstreakOperatorDialog", &scripts\cp_mp\utility\killstreak_utility::playkillstreakoperatordialog);
    registersharedfunc("killstreak", "setVisibiilityOmnvarForKillstreak", &scripts\cp_mp\utility\killstreak_utility::_setvisibiilityomnvarforkillstreak);
    registersharedfunc("killstreak", "restoreKillstreakPlayerAngles", &scripts\cp_mp\utility\killstreak_utility::restorekillstreakplayerangles);
    registersharedfunc("killstreak", "recordKillstreakEndStats", &scripts\cp_mp\utility\killstreak_utility::recordkillstreakendstats);
    registersharedfunc("killstreak", "killstreak_setMainVision", &scripts\cp_mp\utility\killstreak_utility::killstreak_setMainVision);
    registersharedfunc("killstreak", "killstreak_setSubVision", &scripts\cp_mp\utility\killstreak_utility::killstreak_setSubVision);
    registersharedfunc("killstreak", "isKillstreakWeapon", &namespace_e0ee43ef2dddadaa::iskillstreakweapon);
    registersharedfunc("killstreak", "killstreak_registerMinimapInfo", &scripts\cp_mp\utility\killstreak_utility::killstreak_registerMinimapInfo);
    registersharedfunc("killstreak", "killstreak_setupVehicleDamageFunctionality", &scripts\cp_mp\utility\killstreak_utility::killstreak_setupVehicleDamageFunctionality);
    registersharedfunc("killstreak", "killstreak_updateDamageState", &scripts\cp_mp\utility\killstreak_utility::killstreak_updateDamageState);
    registersharedfunc("killstreak", "playerKillstreakGetOwnerLookAtIgnoreEnts", &scripts\cp_mp\utility\killstreak_utility::playerkillstreakgetownerlookatignoreents);
    registersharedfunc("killstreak", "killstreak_dangerNotifyPlayersInRange", &scripts\cp_mp\utility\killstreak_utility::killstreak_dangernotifyplayersinrange);
    registersharedfunc("killstreak", "streakDeploy_doWeaponFiredDeploy", &scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweaponfireddeploy);
    registersharedfunc("player", "isEnemy", &scripts\cp_mp\utility\player_utility::isenemy);
    registersharedfunc("challenges", "onHack", &scripts\cp_mp\challenges::onhack);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97a
// Size: 0x2
function equipment_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x984
// Size: 0x2
function entity_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98e
// Size: 0x2
function perk_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x998
// Size: 0x42
function player_init() {
    registersharedfunc("player", "_isAlive", &scripts\cp_mp\utility\player_utility::_isalive);
    registersharedfunc("player", "getSuperFaction", &scripts\cp_mp\utility\player_utility::getplayersuperfaction);
    registersharedfunc("player", "getExecutionPartner", &getexecutionpartner);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e2
// Size: 0x2
function host_migration_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ec
// Size: 0x9c
function vehicle_init() {
    registersharedfunc("vehicle", "vehicle_damage_setCanDamage", &scripts\cp_mp\vehicles\vehicle_damage::vehicle_damage_setcandamage);
    registersharedfunc("vehicle", "vehicle_spawn_setClearanceCheckMinRadius", &scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn_setclearancecheckminradius);
    registersharedfunc("vehicle", "vehicle_damage_clearVisuals", &scripts\cp_mp\vehicles\vehicle_damage::vehicle_damage_clearvisuals);
    registersharedfunc("vehicle", "vehicleCanFly", &scripts\cp_mp\vehicles\vehicle::vehiclecanfly);
    registersharedfunc("vehicle", "getVehicle", &scripts\cp_mp\utility\player_utility::getvehicle);
    registersharedfunc("vehicle", "vehicle_occupancy_getOccupantSeat", &scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getoccupantseat);
    registersharedfunc("vehicle", "vehicle_occupancy_exit", &scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_exit);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa90
// Size: 0x56
function game_init() {
    registersharedfunc("game", "ForceNetfieldHighLoD", &function_c7a3d9af98179e8e);
    registersharedfunc("game", "getProgressionData", &getProgressionData);
    registersharedfunc("game", "setProgressionData", &setProgressionData);
    registersharedfunc("game", "getTimePassed", &scripts\cp_mp\utility\game_utility::gettimepassed);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaee
// Size: 0x2
function spawn_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf8
// Size: 0x86
function emp_init() {
    registersharedfunc("emp", "clear_emp", &scripts\cp_mp\emp_debuff::clear_emp);
    registersharedfunc("emp", "allow_emp", &scripts\cp_mp\emp_debuff::allow_emp);
    registersharedfunc("emp", "emp_debuff_get_emp_count", &scripts\cp_mp\emp_debuff::emp_debuff_get_emp_count);
    registersharedfunc("emp", "is_empd", &scripts\cp_mp\emp_debuff::is_empd);
    registersharedfunc("emp", "play_scramble", &scripts\cp_mp\emp_debuff::play_scramble);
    registersharedfunc("emp", "stop_scramble", &scripts\cp_mp\emp_debuff::stop_scramble);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb86
// Size: 0x18
function execution_init() {
    registersharedfunc("executions", "is_in_takedown", &scripts\cp_mp\execution::is_in_takedown);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba6
// Size: 0x18
function weapons_init() {
    registersharedfunc("weapons", "setMissileMinimapVisible", &function_cee516993ce8a5f4);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc6
// Size: 0x2
function damage_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd0
// Size: 0x18
function sound_init() {
    registersharedfunc("sound", "playSoundToPlayer", &function_6bc1c74e258d55bc);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf0
// Size: 0x2
function flares_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfa
// Size: 0x2
function shellshock_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc04
// Size: 0x2e
function fx_init() {
    registersharedfunc("fx", "SpawnFXForClient", &function_8795a2cca25c0164);
    registersharedfunc("fx", "SetFXKillDefOnDelete", &function_3fc0d2ad4f715ea4);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3a
// Size: 0x42
function ai_init() {
    registersharedfunc("ai", "giveAIWeapon", &function_c77ea258b33422b0);
    registersharedfunc("ai", "onUsedArmorPlate", &function_b535fe740f1cf507);
    registersharedfunc("ai", "getCorpseEntity", &getcorpseentity);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc84
// Size: 0x2
function bots_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8e
// Size: 0x2
function function_550bcd278c30275e() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc98
// Size: 0x2
function outline_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca2
// Size: 0x2
function game_utility_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcac
// Size: 0x2
function rank_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb6
// Size: 0x2
function supers_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc0
// Size: 0x2
function gamescore_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcca
// Size: 0x2
function pers_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd4
// Size: 0x2
function dlog_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcde
// Size: 0x2
function challenges_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce8
// Size: 0x2
function function_a92ed2f4c44e5ffa() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf2
// Size: 0x2
function function_c1199c7cd79918b3() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfc
// Size: 0x2e
function function_1bc257700c3d014e() {
    registersharedfunc("cameras", "GetCameraThirdPerson", &function_d08336d8c0380c5e);
    registersharedfunc("cameras", "GetCameraThirdPersonOrigin", &function_85c5056c9011e1bc);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd32
// Size: 0x2
function function_a30b248a8fc67a00() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3c
// Size: 0x10
function battlechatter_init() {
    level.var_276311a22caaf5ac = &function_38dd76fb84086a72;
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd54
// Size: 0x2c
function function_38dd76fb84086a72(origin, maxdist) {
    maxdist = default_to(maxdist, level.var_587de0e7b537210a);
    return function_e3b3f0128f632da5(origin, maxdist);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd89
// Size: 0x11
function function_f677f2d747d21482() {
    create_func_ref("setsaveddvar", &setdvar);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xda2
// Size: 0x13
function private function_c7a3d9af98179e8e(set) {
    self forcenetfieldhighlod(set);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdbd
// Size: 0x25
function private function_6bc1c74e258d55bc(aliasname, player, srcentity) {
    self playsoundtoplayer(aliasname, player, srcentity);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdea
// Size: 0x35
function private function_8795a2cca25c0164(fxid, position, player, forward, up) {
    return spawnfxforclient(fxid, position, player, forward, up);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe28
// Size: 0x9
function private function_3fc0d2ad4f715ea4() {
    self setfxkilldefondelete();
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe39
// Size: 0x13
function private function_c77ea258b33422b0(weapname) {
    self giveweapon(weapname);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe54
// Size: 0x2e
function private function_3ecab25ce099b78e(animname, notifystring, var_d3a7686bdb2b1c76, blendtype) {
    self scriptmodelplayanimdeltamotion(animname, notifystring, var_d3a7686bdb2b1c76, blendtype);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe8a
// Size: 0x13
function private function_cee516993ce8a5f4(set) {
    self setmissileminimapvisible(set);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xea5
// Size: 0x8
function private function_d08336d8c0380c5e() {
    return self GetCameraThirdPerson();
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c3fdc5febda99c60
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeb6
// Size: 0x8
function private function_85c5056c9011e1bc() {
    return self GetCameraThirdPersonOrigin();
}
