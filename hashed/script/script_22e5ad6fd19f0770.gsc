// mwiii decomp prototype
#using script_3b78d23dad7ec5be;
#using script_4c770a9a4ad7659c;
#using script_3b64eb40368c1450;
#using script_7edf952f8921aa6b;
#using scripts\engine\utility.gsc;
#using script_405d05c89e998922;

#namespace namespace_4a108cfc226ec7d6;

// Namespace namespace_4a108cfc226ec7d6/namespace_8d6af00582bd6cb4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3
// Size: 0x43
function function_976734974e28596e() {
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_zombie_ai_damaged", &on_damaged);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_is_crawling_changed", &on_is_crawling_changed);
}

// Namespace namespace_4a108cfc226ec7d6/namespace_8d6af00582bd6cb4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d
// Size: 0x1b
function function_bf2be6d286aa478() {
    self.var_99ec7e2fb7ae4d79 = self.health * 0.01;
}

// Namespace namespace_4a108cfc226ec7d6/namespace_8d6af00582bd6cb4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14f
// Size: 0x9d
function private on_damaged(params) {
    if (isexplosivedamagemod(params.smeansofdeath) && (!isdefined(params.einflictor) || !istrue(params.einflictor.var_ee4c6b12c2b086d6)) && !function_aa75c57142022473(params.sweapon)) {
        if (params.idamage > self.var_99ec7e2fb7ae4d79) {
            if (!function_e67a89537ae7d4b7()) {
                function_e96aac065abbec4e(params.vpoint);
            }
        }
    }
    return params.idamage;
}

// Namespace namespace_4a108cfc226ec7d6/namespace_8d6af00582bd6cb4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f4
// Size: 0x23
function private on_is_crawling_changed(params) {
    val::set("is_crawling", "disallow_knockdown", namespace_9e6ef02d993a7eba::is_crawling());
}

// Namespace namespace_4a108cfc226ec7d6/namespace_8d6af00582bd6cb4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21e
// Size: 0x51
function private function_aa75c57142022473(weapon_object) {
    if (isdefined(weapon_object) && isdefined(weapon_object.basename) && isdefined(level.var_c16493593d07b88f) && array_contains(level.var_c16493593d07b88f, weapon_object.basename)) {
        return 1;
    }
    return 0;
}
