#using scripts\engine\utility.gsc;
#using script_371b4c2ab5861e62;

#namespace namespace_5e75b5a54fb4603f;

// Namespace namespace_5e75b5a54fb4603f / namespace_8fb1124048da2603
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa7
// Size: 0x99
function function_a57e56c880e80cdd() {
    aitypes = function_3290e192ac188e2d("zombie_base");
    var_9f578d49d039394b = undefined;
    foreach (aitype in aitypes) {
        strlen = aitype.size;
        if (!isdefined(var_9f578d49d039394b) || var_9f578d49d039394b.size > strlen) {
            var_9f578d49d039394b = aitype;
        }
    }
    var_931e0bfccfc26fa5 = var_9f578d49d039394b;
    level.var_ec9d44662c92bb5c = var_931e0bfccfc26fa5;
}
