#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\common\utility.gsc;

#namespace archassault;

// Namespace archassault / scripts\mp\archetypes\archassault
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b
// Size: 0x9
function applyarchetype() {
    equipextras();
}

// Namespace archassault / scripts\mp\archetypes\archassault
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c
// Size: 0x2
function equipextras() {
    
}

// Namespace archassault / scripts\mp\archetypes\archassault
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156
// Size: 0x2
function removearchetype() {
    
}

// Namespace archassault / scripts\mp\archetypes\archassault
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160
// Size: 0xb4
function auraquickswap_run() {
    self endon("death_or_disconnect");
    self endon("removeArchetype");
    self setclientomnvar("ui_aura_quickswap", 0);
    while (true) {
        self waittill("got_a_kill");
        auraplayers = utility::playersincylinder(self.origin, 384);
        foreach (player in auraplayers) {
            if (player.team != self.team) {
                continue;
            }
            player thread auraquickswap_bestowaura(self);
        }
    }
}

// Namespace archassault / scripts\mp\archetypes\archassault
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c
// Size: 0x96
function auraquickswap_bestowaura(player) {
    self endon("death_or_disconnect");
    self endon("giveLoadout_start");
    level endon("game_ended");
    if (self != player) {
        player thread doScoreEvent(#"buff_teammate");
    }
    self setclientomnvar("ui_aura_quickswap", 1);
    giveperk("specialty_fastreload");
    self playlocalsound("mp_overcharge_on");
    thread cleanupafterplayerdeath();
    wait 5;
    self playlocalsound("mp_overcharge_off");
    self notify("removeAuraQuickswap");
    removeperk("specialty_fastreload");
    self setclientomnvar("ui_aura_quickswap", 0);
}

// Namespace archassault / scripts\mp\archetypes\archassault
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ba
// Size: 0x25
function cleanupafterplayerdeath() {
    self endon("disconnect");
    level endon("game_ended");
    self waittill("death");
    self setclientomnvar("ui_aura_quickswap", 0);
}

