#using script_71332a5b74214116;
#using script_531cb1be084314f7;
#using scripts\cp\loot_system.gsc;

#namespace namespace_caa7fcde280d1fbe;

// Namespace namespace_caa7fcde280d1fbe / namespace_cae8a9a25549b193
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeb
// Size: 0x1d
function main() {
    namespace_a3902e911697e714::registerinteraction("interact_armorsatchel", &function_7bf49b03aa95ddea, &function_b3c237b9f09304f6, &function_4d53102050b02de5);
}

// Namespace namespace_caa7fcde280d1fbe / namespace_cae8a9a25549b193
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x110
// Size: 0x2c
function function_7bf49b03aa95ddea(interaction, player) {
    if (player namespace_bc7b29dcc022d887::hasplatepouch()) {
        return %COOP_GAME_PLAY/ALREADY_HAVE_ARMOR_SATCHEL;
    }
    return %COOP_GAME_PLAY/ARMOR_SATCHEL;
}

// Namespace namespace_caa7fcde280d1fbe / namespace_cae8a9a25549b193
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x144
// Size: 0x31
function function_b3c237b9f09304f6(interaction, player) {
    scripts\cp\loot_system::function_46a2b7d2ad2bdc13(interaction, player);
    if (istrue(level.var_b17f3dc7c65b1860)) {
        namespace_a3902e911697e714::remove_from_current_interaction_list(interaction);
    }
}

// Namespace namespace_caa7fcde280d1fbe / namespace_cae8a9a25549b193
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17d
// Size: 0x37
function function_4d53102050b02de5(var_16037153c1704c7e) {
    for (i = 0; i < var_16037153c1704c7e.size; i++) {
        var_16037153c1704c7e[i].armor_satchel = "armor_satchel";
    }
}

