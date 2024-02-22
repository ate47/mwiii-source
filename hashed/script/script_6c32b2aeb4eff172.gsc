// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3b64eb40368c1450;

#namespace namespace_66f40cf77f13cbd1;

// Namespace namespace_66f40cf77f13cbd1/namespace_2361523b5e4b2d68
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0
// Size: 0x304
function function_7b25d1c42e7f75be(var_f76baeb1c3556fab) {
    /#
        assert(isdefined(var_f76baeb1c3556fab));
    #/
    if (!isdefined(level.var_bd62a26aba0d6ccf) || !isdefined(level.var_bd62a26aba0d6ccf[var_f76baeb1c3556fab])) {
        level.var_bd62a26aba0d6ccf = function_53c4c53197386572(level.var_bd62a26aba0d6ccf, []);
        level.var_bd62a26aba0d6ccf[var_f76baeb1c3556fab] = getscriptbundle(function_2ef675c13ca1c4af(%"hash_1971c5ddb7daaf2d", var_f76baeb1c3556fab));
    }
    settings = level.var_bd62a26aba0d6ccf[var_f76baeb1c3556fab];
    if (!isdefined(settings)) {
        return;
    }
    self.aisettings = settings;
    if (istrue(settings.var_90936cd2d6771517)) {
        self.radius = settings.radius;
        self.height = settings.height;
        self.goalradius = settings.goalradius;
        self.goalheight = settings.goalheight;
        self setbtgoalradius(0, self.goalradius);
        self setbtgoalheight(0, self.goalheight);
        self function_f5f3a2cbee59e221(function_53c4c53197386572(settings.var_6510edfacf0baeaf, -1));
    } else {
        self.radius = 15;
        self.height = 72;
    }
    if (istrue(settings.var_2b682716d65beee)) {
        self function_887b77fa34d6280c(settings.var_adc4590803bbea2a, settings.var_ae8ac1463fa941e7);
    }
    self.var_aaf0465944b061ed = settings.var_aaf0465944b061ed;
    if (istrue(settings.var_51a535c2510cde8a)) {
        self function_d493e7fe15e5eaf4(settings.var_4975344f645984a6);
    }
    if (isdefined(settings.footstepdetectdist)) {
        self.footstepdetectdist = settings.footstepdetectdist;
    }
    if (isdefined(settings.footstepdetectdistwalk)) {
        self.footstepdetectdistwalk = settings.footstepdetectdistwalk;
    }
    if (isdefined(settings.footstepdetectdistsprint)) {
        self.footstepdetectdistsprint = settings.footstepdetectdistsprint;
    }
    if (isdefined(settings.var_16c1b4215fff2552)) {
        self.var_2a3d62043c219dc4 = squared(settings.var_16c1b4215fff2552);
    }
    if (istrue(settings.disableexecutionvictim)) {
        val::set("aiSettings", "execution_victim", 0);
    }
    if (istrue(settings.var_f449a16a9fb2b3e3)) {
        self.var_1e0eb63ecb3f1e2 = 1;
    }
    if (istrue(settings.var_8cd1b076819080e9)) {
        self.var_9f009877c3bea958 = 1;
    }
    if (istrue(settings.var_19d949438b5d19)) {
        var_5d42346f7be30e5c = getdvarfloat(@"hash_82918fe00f512e83", -1);
        var_4b30f61de8daebc4 = settings.lookaheadtime;
        if (var_5d42346f7be30e5c >= 0) {
            var_4b30f61de8daebc4 = var_5d42346f7be30e5c;
        }
        self function_4956d2ecae01f73c(var_4b30f61de8daebc4);
    }
    self.var_83f781810081eef8 = istrue(settings.var_e4e004eb4bd09291);
    thread function_20a25f54c4f809ca();
}

// Namespace namespace_66f40cf77f13cbd1/namespace_2361523b5e4b2d68
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ab
// Size: 0x41
function private function_20a25f54c4f809ca() {
    self endon("death");
    waitframe();
    archetype = self getbasearchetype();
    flag_name = archetype + "_init";
    if (flag(flag_name)) {
        return;
    }
    flag_set(flag_name);
}

