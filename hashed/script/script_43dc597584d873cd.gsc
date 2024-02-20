// mwiii decomp prototype
#using script_7edf952f8921aa6b;
#using script_4c770a9a4ad7659c;

#namespace namespace_4c529715eb90d593;

// Namespace namespace_4c529715eb90d593/namespace_3b7139f4d3d9513f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100
// Size: 0x13
function precache(params) {
    function_366ff0166111a095();
}

// Namespace namespace_4c529715eb90d593/namespace_3b7139f4d3d9513f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11a
// Size: 0x2e
function private function_366ff0166111a095() {
    if (isdefined(level.var_b0f7eeee086e2345)) {
        return;
    }
    level.var_b0f7eeee086e2345 = 1;
    level callback::add("set_region_difficulty_manager_speed", &function_f2e9708e3badc502);
}

// Namespace namespace_4c529715eb90d593/namespace_3b7139f4d3d9513f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14f
// Size: 0x123
function private function_f2e9708e3badc502(params) {
    ai = params.ai;
    if (!issubstr(ai.subclass, "zombie_hellhound")) {
        return;
    }
    var_eb8e0cb3f13faa74 = "run";
    archetype = ai getbasearchetype();
    var_2a1d46d92ea44a14 = isdefined(getanimspeedthreshold(archetype, "sprint"));
    if (var_2a1d46d92ea44a14) {
        switch (params.difficulty) {
        case #"hash_7bb2cd766703d463":
            var_eb8e0cb3f13faa74 = "run";
            break;
        case #"hash_af83e47edfa8900a":
            var_eb8e0cb3f13faa74 = "run";
            break;
        case #"hash_5343b465e56ec9a4":
            var_eb8e0cb3f13faa74 = "run";
            if (randomint(100) <= getdvarint(@"hash_46afd6b17cc032a9", 100)) {
                var_eb8e0cb3f13faa74 = "sprint";
            }
            break;
        case #"hash_651f76c0ad6741ec":
            var_eb8e0cb3f13faa74 = "sprint";
            break;
        }
    }
    ai function_f1e5805da192a1ef(var_eb8e0cb3f13faa74, params.id, params.priority);
}
