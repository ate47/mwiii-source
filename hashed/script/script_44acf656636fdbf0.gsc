// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_44acf656636fdbf0;
#using script_451a1a9bd9613164;
#using script_14183df6f9af8737;
#using scripts\mp\gametypes\br_gametypes.gsc;

#namespace namespace_8089669b072e0a9f;

// Namespace namespace_8089669b072e0a9f/namespace_bd2df931a45390c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd5
// Size: 0x24
function main() {
    level.var_cdc15ee14362fbf = &namespace_bd2df931a45390c::init;
    namespace_bc0abb78a303bb78::function_8ece37593311858a(&onplayerconnect);
    namespace_d20f8ef223912e12::main();
}

// Namespace namespace_8089669b072e0a9f/namespace_bd2df931a45390c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x100
// Size: 0x44
function init() {
    namespace_6176022cc9d5b3f::init();
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("getPlacementXPShareValues");
    namespace_71073fa38f11492::registerbrgametypefunc("getPlacementXPShareValues", &function_b0bb8889afbb0c83);
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("getBRBonusXPperMillisecond");
    namespace_71073fa38f11492::registerbrgametypefunc("getBRBonusXPperMillisecond", &function_843d05502816cbce);
}

// Namespace namespace_8089669b072e0a9f/namespace_bd2df931a45390c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14b
// Size: 0xa
function onplayerconnect() {
    function_d00f5e738d7fb50d();
}

// Namespace namespace_8089669b072e0a9f/namespace_bd2df931a45390c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15c
// Size: 0x3c
function function_d00f5e738d7fb50d() {
    endpos = getdvarvector(@"hash_d125978f792e63d0", (0, 0, 0));
    br::function_258c4f40dee8189a(endpos[0], endpos[1], 0.5);
}

// Namespace namespace_8089669b072e0a9f/namespace_bd2df931a45390c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19f
// Size: 0x3b
function function_b0bb8889afbb0c83() {
    var_e0f4d3685ff5c5bc = 50000;
    var_2121aa51c2c8132e = 80;
    var_409d356961c27474 = 15;
    return [0:var_e0f4d3685ff5c5bc, 1:var_2121aa51c2c8132e, 2:var_409d356961c27474];
}

// Namespace namespace_8089669b072e0a9f/namespace_bd2df931a45390c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e2
// Size: 0x8
function function_843d05502816cbce() {
    return 0.001;
}
