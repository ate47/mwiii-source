// mwiii decomp prototype
#using script_7e4d332e911e1b90;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_26a75045c9dd4bcb;

// Namespace namespace_26a75045c9dd4bcb/namespace_b8228ec48134f64
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a
// Size: 0xd2
function create_client_overlay(var_2193fde10bf4b43a, start_alpha, player) {
    if (isdefined(player)) {
        overlay = newclienthudelem(player);
    } else {
        overlay = newhudelem();
    }
    overlay.x = 0;
    overlay.y = 0;
    overlay setshader(var_2193fde10bf4b43a, 640, 480);
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.sort = 1;
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.alpha = start_alpha;
    overlay.foreground = 1;
    return overlay;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_b8228ec48134f64
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174
// Size: 0x63
function fade_in(time, shader) {
    if (istrue(level.missionfailed)) {
        return;
    }
    if (!isdefined(time)) {
        time = 0.3;
    }
    overlay = get_optional_overlay(shader);
    if (time > 0) {
        overlay fadeovertime(time);
    }
    overlay.alpha = 0;
    if (time > 0) {
        wait(time);
    }
}

// Namespace namespace_26a75045c9dd4bcb/namespace_b8228ec48134f64
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de
// Size: 0x1f
function get_optional_overlay(shader) {
    if (!isdefined(shader)) {
        shader = "black";
    }
    return get_overlay(shader);
}

// Namespace namespace_26a75045c9dd4bcb/namespace_b8228ec48134f64
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x205
// Size: 0x56
function fade_out(time, shader) {
    if (!isdefined(time)) {
        time = 0.3;
    }
    overlay = get_optional_overlay(shader);
    if (time > 0) {
        overlay fadeovertime(time);
    }
    overlay.alpha = 1;
    if (time > 0) {
        wait(time);
    }
}

// Namespace namespace_26a75045c9dd4bcb/namespace_b8228ec48134f64
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x262
// Size: 0xb3
function get_overlay(shader) {
    if (isplayer(self)) {
        guy = self;
    } else {
        guy = level.player;
    }
    if (!isdefined(guy.overlay)) {
        guy.overlay = [];
    }
    if (!isdefined(guy.overlay[shader])) {
        guy.overlay[shader] = create_client_overlay(shader, 0, guy);
    }
    guy.overlay[shader].sort = 0;
    guy.overlay[shader].foreground = 1;
    return guy.overlay[shader];
}

