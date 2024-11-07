#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\lighting.gsc;

#namespace namespace_2ac92c6753236e22;

// Namespace namespace_2ac92c6753236e22 / namespace_a8b32bf9395b6cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf6
// Size: 0x2
function main() {
    
}

// Namespace namespace_2ac92c6753236e22 / namespace_a8b32bf9395b6cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x100
// Size: 0xb3
function function_3d536453ebbe96e0() {
    var_93b2b1e909f931b1 = getentarray("gunsmith_ceiling_square_01", "targetname");
    foreach (light in var_93b2b1e909f931b1) {
        light.original_intensity = light getlightintensity();
    }
    foreach (light in var_93b2b1e909f931b1) {
        light setlightintensity(0);
    }
}

// Namespace namespace_2ac92c6753236e22 / namespace_a8b32bf9395b6cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bb
// Size: 0x80
function function_4e390c2c37cff5e() {
    var_93b2b1e909f931b1 = getentarray("gunsmith_ceiling_square_01", "targetname");
    foreach (light in var_93b2b1e909f931b1) {
        if (isdefined(light.original_intensity)) {
            light setlightintensity(light.original_intensity);
        }
    }
}

// Namespace namespace_2ac92c6753236e22 / namespace_a8b32bf9395b6cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x243
// Size: 0x46
function function_d99194cd0b2f101c() {
    setdvar(@"hash_5d66c2ef5a9612e0", 1);
    setdvar(@"hash_f9190cd77b0b2463", 4);
    setdvar(@"hash_dacffbfd52c2fdc5", 16);
    setdvar(@"hash_ea4c44a08cd23d5d", 3);
}

// Namespace namespace_2ac92c6753236e22 / namespace_a8b32bf9395b6cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x291
// Size: 0x45
function function_53438926fbd080b5() {
    setdvar(@"hash_5d66c2ef5a9612e0", 1);
    setdvar(@"hash_eca4b727b01fd254", 8);
    setdvar(@"hash_f9190cd77b0b2463", 0);
    setdvar(@"hash_dacffbfd52c2fdc5", 16);
}

// Namespace namespace_2ac92c6753236e22 / namespace_a8b32bf9395b6cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2de
// Size: 0x66
function function_7f5fee0f9a43c6aa() {
    setdvar(@"hash_5d66c2ef5a9612e0", 0);
    setdvar(@"hash_eca4b727b01fd254", 8);
    setdvar(@"hash_f9190cd77b0b2463", 0);
    setdvar(@"hash_dacffbfd52c2fdc5", 32);
    setdvar(@"hash_ea4c44a08cd23d5d", 1);
    setdvar(@"hash_e918bd4613339eeb", 2);
}

// Namespace namespace_2ac92c6753236e22 / namespace_a8b32bf9395b6cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34c
// Size: 0xb3
function function_b81b35afd5c271cf() {
    var_93b2b1e909f931b1 = getentarray("operator_ceiling_light", "targetname");
    foreach (light in var_93b2b1e909f931b1) {
        light.original_intensity = light getlightintensity();
    }
    foreach (light in var_93b2b1e909f931b1) {
        light setlightintensity(0);
    }
}

// Namespace namespace_2ac92c6753236e22 / namespace_a8b32bf9395b6cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x407
// Size: 0x80
function function_92097d6de58d5f2b() {
    var_93b2b1e909f931b1 = getentarray("operator_ceiling_light", "targetname");
    foreach (light in var_93b2b1e909f931b1) {
        if (isdefined(light.original_intensity)) {
            light setlightintensity(light.original_intensity);
        }
    }
}

// Namespace namespace_2ac92c6753236e22 / namespace_a8b32bf9395b6cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48f
// Size: 0x12
function function_5ba05843b262c3d7() {
    setdvar(@"hash_e918bd4613339eeb", 0);
}

// Namespace namespace_2ac92c6753236e22 / namespace_a8b32bf9395b6cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a9
// Size: 0x13
function function_7f5fef0f9a43c8dd() {
    setdvar(@"hash_e918bd4613339eeb", 2);
}

// Namespace namespace_2ac92c6753236e22 / namespace_a8b32bf9395b6cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c4
// Size: 0x13
function function_acf8b8703896231b() {
    setdvar(@"hash_1dde331a8e0153d8", 16);
}

// Namespace namespace_2ac92c6753236e22 / namespace_a8b32bf9395b6cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4df
// Size: 0x12
function function_886baf008b3c1850() {
    setdvar(@"hash_dab366f405822e6c", 0);
}

// Namespace namespace_2ac92c6753236e22 / namespace_a8b32bf9395b6cc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f9
// Size: 0x16
function function_41ede176398a67ae() {
    setdvar(@"hash_dab366f405822e6c", 0.3);
}
