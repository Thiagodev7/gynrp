local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- 60309 hand ESQUERDA
-- 28422 hand DIREITA
-- 50 NÃO REPETE
-- 49 REPETE
-----------------------------------------------------------------------------------------------------------------------------------------
local fov_min = 5.0
local fov_max = 70.0
local binoculos = false
local camera = false
local fov = (fov_max+fov_min)*0.5
-----------------------------------------------------------------------------------------------------------------------------------------
local animacoes = {
	-------------------- ANIMAÇÕES DO BARONI --------------------------------------
	-------------------------------------------------------------------------------
	{ nome = "fpose1" , dict = "jb179_female@specialposes_1" , anim = "jbfemale_pose_c1" , andar = true , loop = true },
	{ nome = "fpose2" , dict = "jb179_female@specialposes_2" , anim = "jbfemale_pose_c2" , andar = true , loop = true },
	{ nome = "mpose1" , dict = "jb179_male@specialposes_1" , anim = "jbmale_pose_c1" , andar = true , loop = true },
	{ nome = "mpose2" , dict = "jb179_male@specialposes_2" , anim = "jbmale_pose_c2" , andar = true , loop = true },
	{ nome = "mpose3" , dict = "jb179_gangm@specialposes_1" , anim = "jbgangm_pose_c1" , andar = true , loop = true },
	-------------- BILÃO ---------------
	{ nome = "mpose4" , dict = "anim@tactical_highlow_high_leftlean" , anim = "high_leftlean_clip" , andar = true , loop = true },
	{ nome = "mpose5" , dict = "anim@tactical_highlow_low_leftlean" , anim = "low_leftlean_clip" , andar = true , loop = true },
	{ nome = "mpose6" , dict = "anim@tactical_kneel_walkie" , anim = "kneel_walkie_clip" , andar = true , loop = true },
	{ nome = "mpose7" , dict = "anim@tactical_kneel_aiming" , anim = "kneel_aiming_clip" , andar = true , loop = true },
	{ nome = "mpose8" , dict = "anim@male_tactical_collapsed_lowready" , anim = "collapsed_lowready_clip" , andar = true , loop = true },
	{ nome = "mpose9" , dict = "anim@male_tactical_highready_relaxed" , anim = "highready_relaxed_clip" , andar = true , loop = true },
	{ nome = "mpose10" , dict = "anim@fog_rifle_relaxed" , anim = "rifle_relaxed_clip" , andar = true , loop = true },
	{ nome = "mpose11" , dict = "anim@stack_pointman" , anim = "pointman_clip" , andar = true , loop = true },
	{ nome = "mpose12" , dict = "anim@stack_two_man" , anim = "two_man_clip" , andar = true , loop = true },
	{ nome = "mpose13" , dict = "anim@stack_three_man" , anim = "three_man_clip" , andar = true , loop = true },
	{ nome = "mpose14" , dict = "anim@highlow_low_lean" , anim = "low_lean_clip" , andar = true , loop = true },
	{ nome = "mpose15" , dict = "anim@highlow_high_lean" , anim = "high_lean_clip" , andar = true , loop = true },

	{nome = "bracop1", dict = "anim@veh@lowrider@std@ds@arm@base", anim = "sit_low_lowdoor", andar = true, loop = true },
    {nome ="bracop2", dict = "anim@veh@lowrider@std@ds@arm@base", anim = "steer_lean_left_low_lowdoor", andar = true, loop = true },
    {nome ="bracop3", dict = "missarmenian2", anim = "car_react_gang_ps", andar = true, loop = true },
    {nome = "bracop4", dict = "anim@veh@lowrider@low@front_ps@arm@base", anim = "sit", andar = true, loop = true },
--------------
	{ nome = "radio2" , prop = "prop_boombox_01" , flag = 50 , hand = 57005 , pos1 = 0.30 , pos2 = 0 , pos3 = 0 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "bolsa" , prop = "prop_ld_case_01" , flag = 50 , hand = 57005 , pos1 = 0.16 , pos2 = 0 , pos3 = 0 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "bolsa2" , prop = "prop_ld_case_01_s" , flag = 50 , hand = 57005 , pos1 = 0.16 , pos2 = 0 , pos3 = 0 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "bolsa3" , prop = "prop_security_case_01" , flag = 50 , hand = 57005 , pos1 = 0.16 , pos2 = 0 , pos3 = -0.01 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "bolsa4" , prop = "w_am_case" , flag = 50 , hand = 57005 , pos1 = 0.08 , pos2 = 0 , pos3 = 0 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "bolsa5" , prop = "prop_ld_suitcase_01" , flag = 50 , hand = 57005 , pos1 = 0.39 , pos2 = 0 , pos3 = 0 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "bolsa6" , prop = "xm_prop_x17_bag_med_01a" , flag = 50 , hand = 57005 , pos1 = 0.39 , pos2 = 0 , pos3 = 0 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "caixa2" , prop = "prop_tool_box_04" , flag = 50 , hand = 57005 , pos1 = 0.45 , pos2 = 0 , pos3 = 0.05 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "lixo" , prop = "prop_cs_rub_binbag_01" , flag = 50 , hand = 57005 , pos1 = 0.11 , pos2 = 0 , pos3 = 0.0 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "mic" , prop = "prop_microphone_02" , flag = 50 , hand = 60309 , pos1 = 0.08 , pos2 = 0.03 , pos3 = 0.0 , pos4 = 240.0 , pos5 = 0.0 , pos6 = 0.0 },
	{ nome = "mic2" , prop = "p_ing_microphonel_01" , flag = 50 , hand = 60309 , pos1 = 0.08 , pos2 = 0.03 , pos3 = 0.0 , pos4 = 240.0 , pos5 = 0.0 , pos6 = 0.0 },
	{ nome = "mic3" , dict = "missfra1" , anim = "mcs2_crew_idle_m_boom" , prop = "prop_v_bmike_01" , flag = 50 , hand = 28422 },
	{ nome = "buque" , prop = "prop_snow_flower_02" , flag = 50 , hand = 60309 , pos1 = 0.0 , pos2 = 0.0 , pos3 = 0.0 , pos4 = 300.0 , pos5 = 0.0 , pos6 = 0.0 },
	{ nome = "rosa" , prop = "prop_single_rose" , flag = 50 , hand = 60309 , pos1 = 0.055 , pos2 = 0.05 , pos3 = 0.0 , pos4 = 240.0 , pos5 = 0.0 , pos6 = 0.0 },
	{ nome = "prebeber" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "prop_fib_coffee" , flag = 49 , hand = 28422 },
	{ nome = "prebeber" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "prop_fib_coffee" , flag = 49 , hand = 28422 },
	{ nome = "prebeber2" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "prop_ld_flow_bottle" , flag = 49 , hand = 28422 },
	{ nome = "prebeber3" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "prop_cs_bs_cup" , flag = 49 , hand = 28422 },
	{ nome = "verificar" , dict = "amb@medic@standing@tendtodead@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "mexer" , dict = "amb@prop_human_parking_meter@female@idle_a" , anim = "idle_a_female" , andar = true , loop = true },
	{ nome = "cuidar" , dict = "mini@cpr@char_a@cpr_str" , anim = "cpr_pumpchest" , andar = true , loop = true },
	{ nome = "cuidar2" , dict = "mini@cpr@char_a@cpr_str" , anim = "cpr_kol" , andar = true , loop = true },
	{ nome = "cuidar3" , dict = "mini@cpr@char_a@cpr_str" , anim = "cpr_kol_idle" , andar = true , loop = true },
	{ nome = "cansado" , dict = "rcmbarry" , anim = "idle_d" , andar = false , loop = true },
	{ nome = "meleca" , dict = "anim@mp_player_intuppernose_pick" , anim = "idle_a" , andar = true , loop = true },
	{ nome = "bora" , dict = "missfam4" , anim = "say_hurry_up_a_trevor" , andar = true , loop = false },
	{ nome = "limpar" , dict = "missfbi3_camcrew" , anim = "final_loop_guy" , andar = true , loop = false },
	{ nome = "galinha" , dict = "random@peyote@chicken" , anim = "wakeup" , andar = true , loop = true },
	{ nome = "amem" , dict = "rcmepsilonism8" , anim = "worship_base" , andar = true , loop = true },
	{ nome = "nervoso" , dict = "rcmme_tracey1" , anim = "nervous_loop" , andar = true , loop = true },
	{ nome = "morrer" , dict = "misslamar1dead_body" , anim = "dead_idle" , andar = false , loop = true },
	{ nome = "ajoelhar" , dict = "amb@medic@standing@kneel@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "sinalizar" , dict = "amb@world_human_car_park_attendant@male@base" , anim = "base" , prop = "prop_parking_wand_01" , flag = 49 , hand = 28422 },
	{ nome = "placa" , dict = "amb@world_human_bum_freeway@male@base" , anim = "base" , prop = "prop_beggers_sign_01" , flag = 49 , hand = 28422 },
	{ nome = "placa2" , dict = "amb@world_human_bum_freeway@male@base" , anim = "base" , prop = "prop_beggers_sign_03" , flag = 49 , hand = 28422 },
	{ nome = "placa3" , dict = "amb@world_human_bum_freeway@male@base" , anim = "base" , prop = "prop_beggers_sign_04" , flag = 49 , hand = 28422 },
	{ nome = "abanar" , dict = "timetable@amanda@facemask@base" , anim = "base" , andar = true , loop = true },
	{ nome = "cocada" , dict = "mp_player_int_upperarse_pick" , anim = "mp_player_int_arse_pick" , andar = true , loop = true },
	{ nome = "cocada2" , dict = "mp_player_int_uppergrab_crotch" , anim = "mp_player_int_grab_crotch" , andar = true , loop = true },
	{ nome = "lero" , dict = "anim@mp_player_intselfiejazz_hands" , anim = "idle_a" , andar = true , loop = false },
	{ nome = "dj2" , dict = "anim@mp_player_intupperair_synth" , anim = "idle_a_fp" , andar = false , loop = true },
	{ nome = "beijo" , dict = "anim@mp_player_intselfieblow_kiss" , anim = "exit" , andar = true , loop = false },
	{ nome = "malicia" , dict = "anim@mp_player_intupperdock" , anim = "idle_a" , andar = true , loop = false },
	{ nome = "ligar" , dict = "cellphone@" , anim = "cellphone_call_in" , prop = "prop_amb_phone" , flag = 50 , hand = 28422 },
	{ nome = "radio" , dict = "cellphone@" , anim = "cellphone_call_in" , prop = "prop_cs_hand_radio" , flag = 50 , hand = 28422 },
	{ nome = "cafe" , dict = "amb@world_human_aa_coffee@base" , anim = "base" , prop = "prop_fib_coffee" , flag = 50 , hand = 28422 },
	{ nome = "cafe2" , dict = "amb@world_human_aa_coffee@idle_a" , anim = "idle_a" , prop = "prop_fib_coffee" , flag = 49 , hand = 28422 },
	{ nome = "caixa" , dict = "anim@heists@box_carry@" , anim = "idle" , prop = "hei_prop_heist_box" , flag = 50 , hand = 28422 },
	{ nome = "chuva" , dict = "amb@world_human_drinking@coffee@male@base" , anim = "base" , prop = "p_amb_brolly_01" , flag = 50 , hand = 28422 },
	{ nome = "chuva2" , dict = "amb@world_human_drinking@coffee@male@base" , anim = "base" , prop = "p_amb_brolly_01_s" , flag = 50 , hand = 28422 },
	{ nome = "comer" , dict = "amb@code_human_wander_eating_donut@male@idle_a" , anim = "idle_c" , prop = "prop_brigadeiro_01" , flag = 49 , hand = 28422 },
	{ nome = "comer2" , dict = "amb@code_human_wander_eating_donut@male@idle_a" , anim = "idle_c" , prop = "prop_cs_hotdog_01" , flag = 49 , hand = 28422 },
	{ nome = "comer3" , dict = "amb@code_human_wander_eating_donut@male@idle_a" , anim = "idle_c" , prop = "prop_amb_donut" , flag = 49 , hand = 28422 },	
	{ nome = "beber" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "prop_mug_03" , flag = 49 , hand = 28422 },
	{ nome = "beber2" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "prop_energy_drink" , flag = 49 , hand = 28422 },
	{ nome = "beber3" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "prop_amb_beer_bottle" , flag = 49 , hand = 28422 },
	{ nome = "beber4" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "p_whiskey_notop" , flag = 49 , hand = 28422 },
	{ nome = "beber5" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "prop_beer_logopen" , flag = 49 , hand = 28422 },
	{ nome = "beber6" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "prop_beer_blr" , flag = 49 , hand = 28422 },
	{ nome = "beber7" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "prop_ld_flow_bottle" , flag = 49 , hand = 28422 },
	{ nome = "digitar" , dict = "anim@heists@prison_heistig1_p1_guard_checks_bus" , anim = "loop" , andar = false , loop = true },

	--## FORTNITE ##--
	{ nome = "fortnite1" , dict = "custom@crossbounce" , anim = "crossbounce" , andar = false , loop = true },
	{ nome = "fortnite2" , dict = "custom@dont_start" , anim = "dont_start" , andar = false , loop = true },
	{ nome = "fortnite3" , dict = "custom@floss" , anim = "floss" , andar = false , loop = true },
	{ nome = "fortnite4" , dict = "custom@orangejustice" , anim = "orangejustice" , andar = false , loop = true },
	{ nome = "fortnite5" , dict = "custom@renegade" , anim = "renegade" , andar = false , loop = true },
	{ nome = "fortnite6" , dict = "custom@rickroll" , anim = "rickroll" , andar = false , loop = true },
	{ nome = "fortnite7" , dict = "custom@savage" , anim = "savage" , andar = false , loop = true },
	{ nome = "fortnite8" , dict = "custom@sayso" , anim = "sayso" , andar = false , loop = true },
	{ nome = "fortnite9" , dict = "custom@take_l" , anim = "take_l" , andar = false , loop = true },
	{ nome = "fortnite10" , dict = "custom@toosie_slide" , anim = "toosie_slide" , andar = false , loop = true },
	{ nome = "fortnite11" , dict = "custom@around_the_clock" , anim = "around_the_clock" , andar = false , loop = true },
	{ nome = "fortnite12" , dict = "custom@dancemoves" , anim = "dancemoves" , andar = false , loop = true },
	{ nome = "fortnite13" , dict = "custom@disco_dance" , anim = "disco_dance" , andar = false , loop = true },
	{ nome = "fortnite14" , dict = "custom@electroshuffle_original" , anim = "electroshuffle_original" , andar = false , loop = true },
	{ nome = "fortnite15" , dict = "custom@electroshuffle" , anim = "electroshuffle" , andar = false , loop = true },
	{ nome = "fortnite16" , dict = "custom@fresh_fortnite" , anim = "fresh_fortnite" , andar = false , loop = true },
	{ nome = "fortnite17" , dict = "custom@gylphic" , anim = "gylphic" , andar = false , loop = true },
	{ nome = "fortnite18" , dict = "custom@hitit" , anim = "hitit" , andar = false , loop = true },
	{ nome = "fortnite19" , dict = "custom@in_da_party" , anim = "in_da_party" , andar = false , loop = true },
	{ nome = "fortnite20" , dict = "custom@robotdance_fortnite" , anim = "robotdance_fortnite" , andar = false , loop = true },
	{ nome = "fortnite21" , dict = "custom@frightfunk" , anim = "frightfunk" , andar = false , loop = true },
	{ nome = "fortnite22" , dict = "custom@gloss" , anim = "gloss" , andar = false , loop = true },
	{ nome = "fortnite23" , dict = "custom@last_forever" , anim = "last_forever" , andar = false , loop = true },
	{ nome = "fortnite24" , dict = "custom@smooth_moves" , anim = "smooth_moves" , andar = false , loop = true },
	{ nome = "fortnite25" , dict = "custom@introducing" , anim = "introducing" , andar = false , loop = true },
	{ nome = "fortnite26" , dict = "custom@bellydance" , anim = "bellydance" , andar = false , loop = true },
	{ nome = "fortnite27" , dict = "custom@bellydance2" , anim = "bellydance2" , andar = false , loop = true },
	{ nome = "fortnite28" , dict = "custom@dab" , anim = "dab" , andar = false , loop = true },
	{ nome = "fortnite29" , dict = "custom@dragonballz" , anim = "dragonballz" , andar = false , loop = true },
	{ nome = "fortnite30" , dict = "custom@footwork" , anim = "footwork" , andar = false , loop = true },
	{ nome = "fortnite31" , dict = "custom@gangnamstyle" , anim = "gangnamstyle" , andar = false , loop = true },
	{ nome = "fortnite32" , dict = "custom@headspin" , anim = "headspin" , andar = false , loop = true },
	{ nome = "fortnite33" , dict = "custom@hiphop_pumpup" , anim = "hiphop_pumpup" , andar = false , loop = true },
	{ nome = "fortnite34" , dict = "custom@hiphop_slide" , anim = "hiphop_slide" , andar = false , loop = true },
	{ nome = "fortnite35" , dict = "custom@hiphop_yeah" , anim = "hiphop_yeah" , andar = false , loop = true },
	{ nome = "fortnite36" , dict = "custom@hiphop1" , anim = "hiphop1" , andar = false , loop = true },
	{ nome = "fortnite37" , dict = "custom@hiphop2" , anim = "hiphop2" , andar = false , loop = true },
	{ nome = "fortnite38" , dict = "custom@hiphop3" , anim = "hiphop3" , andar = false , loop = true },
	{ nome = "fortnite39" , dict = "custom@hiphop90s" , anim = "hiphop90s" , andar = false , loop = true },
	{ nome = "fortnite40" , dict = "custom@makarena" , anim = "makarena" , andar = false , loop = true },
	{ nome = "fortnite41" , dict = "custom@maraschino" , anim = "maraschino" , andar = false , loop = true },
	{ nome = "fortnite42" , dict = "custom@narutorun" , anim = "narutorun" , andar = false , loop = true },
	{ nome = "fortnite43" , dict = "custom@salsa" , anim = "salsa" , andar = false , loop = true },
	{ nome = "fortnite44" , dict = "custom@salsatime" , anim = "salsatime" , andar = false , loop = true },
	{ nome = "fortnite45" , dict = "custom@samba" , anim = "samba" , andar = false , loop = true },
	{ nome = "fortnite46" , dict = "export@breakdance" , anim = "breakdance" , andar = false , loop = true },

	--## CASAL ##--
	{ nome = "casalm" , dict = "timetable@trevor@ig_1" , anim = "ig_1_thedontknowwhy_trevor" , andar = false , loop = true },
    { nome = "casalf" , dict = "timetable@trevor@ig_1" , anim = "ig_1_thedontknowwhy_patricia" , andar = false , loop = true },
    { nome = "casalm2" , dict = "timetable@trevor@ig_1" , anim = "ig_1_thedesertissobeautiful_trevor" , andar = false , loop = true },
    { nome = "casalf2" , dict = "timetable@trevor@ig_1" , anim = "ig_1_thedesertissobeautiful_patricia" , andar = false , loop = true },

	{ nome = "casalm3" , dict = "mx@couplemale" , anim = "clipcouple_male" , andar = false , loop = true },
	{ nome = "casalf3" , dict = "mx@couplefemale" , anim = "clipcouple_female" , andar = false , loop = true },
	{ nome = "casalf4" , dict = "karxem@couple_f" , anim = "karxem_couple_f_clip" , andar = false , loop = true },
	{ nome = "casalm4" , dict = "karxem@couple_m" , anim = "karxem_couple_m_clip" , andar = false , loop = true },
	{ nome = "casalf5" , dict = "karxem@couple2_f" , anim = "karxem_coupel2_f_clip" , andar = false , loop = true },
	{ nome = "casalm5" , dict = "karxem@couple2_m" , anim = "karxem_couple2_m_clip" , andar = false , loop = true },
	{ nome = "casalf6" , dict = "karxem@couple3_f" , anim = "karxem_couple3_f_clip" , andar = false , loop = true },
	{ nome = "casalm6" , dict = "karxem@couple3_m" , anim = "karxem_couple3_m_clip" , andar = false , loop = true },

	{ nome = "casalm7" , dict = "holdhip@animation" , anim = "holdhip_clip" , andar = false , loop = true },
	{ nome = "casalf7" , dict = "holdhipb@animation" , anim = "holdhipb_clip" , andar = false , loop = true },
	{ nome = "casalm8" , dict = "holdass@animation" , anim = "holdass_clip" , andar = false , loop = true },
	{ nome = "casalf8" , dict = "holdassb@animation" , anim = "holdassb_clip" , andar = false , loop = true },
	{ nome = "casalm9" , dict = "coupleseat1@animation" , anim = "coupleseat1_clip" , andar = false , loop = true },
	{ nome = "casalf9" , dict = "coupleseat1b@animation" , anim = "coupleseat1b_clip" , andar = false , loop = true },

	{ nome = "casalm10" , dict = "bfflookback1@animation" , anim = "bfflookback1_clip" , andar = false , loop = true },
	{ nome = "casalf10" , dict = "bfflookback2@animation" , anim = "bfflookback2_clip" , andar = false , loop = true },
	{ nome = "casalm11" , dict = "bffcasualpose1@animation" , anim = "bffcasualpose1_clip" , andar = false , loop = true },
	{ nome = "casalf11" , dict = "bffcasualpose2@animation" , anim = "bffcasualpose2_clip" , andar = false , loop = true },
	{ nome = "casalm12" , dict = "bfffun1@animation" , anim = "bfffun1_clip" , andar = false , loop = true },
	{ nome = "casalf12" , dict = "bfffun2@animation" , anim = "bfffun2_clip" , andar = false , loop = true },
	{ nome = "casalm13" , dict = "bffhandhold1@animation" , anim = "bffhandhold1_clip" , andar = false , loop = true },
	{ nome = "casalf13" , dict = "bffhandhold2@animation" , anim = "bffhandhold2_clip" , andar = false , loop = true },

	{ nome = "casalm14" , dict = "mggypiggypair1@animation" , anim = "mggypiggypair1_clip" , andar = false , loop = true },
	{ nome = "casalf14" , dict = "mggypiggypair2@animation" , anim = "mggypiggypair2_clip" , andar = false , loop = true },

	{ nome = "continencia" , dict = "mp_player_int_uppersalute" , anim = "mp_player_int_salute" , andar = true , loop = true },
	{ nome = "naruto" , dict = "missfbi1" , anim = "ledge_loop" , andar = true , loop = true },
	{ nome = "naruto2" , dict = "missfam5_yoga" , anim = "a2_pose" , andar = true , loop = true },
	{ nome = "rebolar" , dict = "switch@trevor@mocks_lapdance" , anim = "001443_01_trvs_28_idle_stripper" , andar = false , loop = true },
	{ nome = "celebrar" , dict = "rcmfanatic1celebrate" , anim = "celebrate" , andar = false , loop = false },
	{ nome = "tablet" , dict = "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a" , anim = "idle_b" , prop = "prop_cs_tablet" , flag = 49 , hand = 60309 },
	{ nome = "gas" , dict = "anim@heists@box_carry@" , anim = "idle" , prop = "prop_gascyl_01a" , flag = 50 , mao = 28422 },
	{ nome = "atm" , dict = "amb@prop_human_atm@male@idle_a" , anim = "idle_a" , andar = false , loop = false },
	{ nome = "nao" , dict = "mp_player_int_upper_nod" , anim = "mp_player_int_nod_no" , andar = true , loop = true },
	{ nome = "palmas" , dict = "anim@mp_player_intcelebrationfemale@slow_clap" , anim = "slow_clap" , andar = true , loop = false },
	{ nome = "palmas2" , dict = "amb@world_human_cheering@male_b" , anim = "base" , andar = true , loop = true },
	{ nome = "palmas3" , dict = "amb@world_human_cheering@male_d" , anim = "base" , andar = true , loop = true },
	{ nome = "palmas4" , dict = "amb@world_human_cheering@male_e" , anim = "base" , andar = true , loop = true },
	{ nome = "palmas5" , dict = "anim@arena@celeb@flat@solo@no_props@" , anim = "angry_clap_a_player_a" , andar = false , loop = true },
	{ nome = "palmas6" , dict = "anim@mp_player_intupperslow_clap" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "postura" , dict = "anim@heists@prison_heiststation@cop_reactions" , anim = "cop_a_idle" , andar = true , loop = true },
	{ nome = "postura2" , dict = "amb@world_human_cop_idles@female@base" , anim = "base" , andar = true , loop = true },
	{ nome = "postura3" , dict = "mini@strip_club@idles@bouncer@base" , anim = "base" , andar = true , loop = true },
	{ nome = "dedos" , dict = "anim@mp_player_intupperfinger" , anim = "idle_a_fp" , andar = true , loop = true },
	{ nome = "varrer" , dict = "amb@world_human_janitor@male@idle_a" , anim = "idle_a" , prop = "prop_tool_broom" , flag = 49 , hand = 28422 },
	{ nome = "musica" , dict = "amb@world_human_musician@guitar@male@base" , anim = "base" , prop = "prop_el_guitar_01" , flag = 49 , hand = 60309 },
	{ nome = "musica2" , dict = "amb@world_human_musician@guitar@male@base" , anim = "base" , prop = "prop_el_guitar_02" , flag = 49 , hand = 60309 },
	{ nome = "musica3" , dict = "amb@world_human_musician@guitar@male@base" , anim = "base" , prop = "prop_el_guitar_03" , flag = 49 , hand = 60309 },
	{ nome = "musica4" , dict = "amb@world_human_musician@guitar@male@base" , anim = "base" , prop = "prop_acc_guitar_01" , flag = 49 , hand = 60309 },
	{ nome = "camera" , dict = "amb@world_human_paparazzi@male@base" , anim = "base" , prop = "prop_pap_camera_01" , flag = 49 , hand = 28422 },
	{ nome = "camera2" , dict = "missfinale_c2mcs_1" , anim = "fin_c2_mcs_1_camman" , prop = "prop_v_cam_01" , flag = 49 , hand = 28422 },
	{ nome = "prancheta" , dict = "amb@world_human_clipboard@male@base" , anim = "base" , prop = "p_amb_clipboard_01" , flag = 50 , hand = 60309 },
	{ nome = "mapa" , dict = "amb@world_human_clipboard@male@base" , anim = "base" , prop = "prop_tourist_map_01" , flag = 50 , hand = 60309 },
	{ nome = "anotar" , dict = "amb@medic@standing@timeofdeath@base" , anim = "base" , prop = "prop_notepad_01" , flag = 49 , hand = 60309 }, -- prop_police_phone
	{ nome = "anotar2" , dict = "cellphone@" , anim = "cellphone_text_in" , prop = "prop_police_phone" , flag = 50 , hand = 28422 }, -- prop_police_phone
	{ nome = "peace" , dict = "mp_player_int_upperpeace_sign" , anim = "mp_player_int_peace_sign" , andar = true , loop = true },
	{ nome = "peace2" , dict ="anim@mp_player_intupperpeace" , anim = "idle_a" , andar = true , loop = true },
	{ nome = "deitar" , dict = "anim@gangops@morgue@table@" , anim = "body_search" , andar = false , loop = true , extra = function()
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))
		for k,v in pairs(beds) do
			local object = GetClosestObjectOfType(x,y,z,0.9,v[1],0,0,0)
			if DoesEntityExist(object) then
				local x2,y2,z2 = table.unpack(GetEntityCoords(object))

				SetEntityCoords(ped,x2,y2,z2+v[2])
				SetEntityHeading(ped,GetEntityHeading(object)+v[3]-180.0)
			end
		end
	end },
	--[[ { nome = "tratamento" , dict = "anim@gangops@morgue@table@" , anim = "body_search" , andar = false , loop = true , extra = function()
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))
		for k,v in pairs(beds) do
			local object = GetClosestObjectOfType(x,y,z,0.9,v[1],0,0,0)
			if DoesEntityExist(object) then
				local health = GetEntityHealth(ped)
				local armour = GetPedArmour(ped)
				local x2,y2,z2 = table.unpack(GetEntityCoords(object))
				NetworkResurrectLocalPlayer(x2,y2,z2+v[2],GetEntityHeading(object),true,false)
				SetEntityHealth(ped,health) ]]
				--[[ SetPedArmour(ped,armour) ]]
				--[[ TriggerEvent("dkl12lm1ek12njk3n21j3nj21n3j12nj3n12jn",armour)

				TriggerEvent("vrp_hospital:macas")

				SetEntityCoords(ped,x2,y2,z2+v[2])
				SetEntityHeading(ped,GetEntityHeading(object)+v[3]-180.0)
			end
		end
	end }, ]]
	{ nome = "deitar2" , dict = "amb@world_human_sunbathe@female@front@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "deitar3" , dict = "amb@world_human_sunbathe@male@back@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "deitar4" , dict = "amb@world_human_sunbathe@male@front@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "deitar5" , dict = "mini@cpr@char_b@cpr_str" , anim = "cpr_kol_idle" , andar = false , loop = true },
	{ nome = "deitar6" , dict = "switch@trevor@scares_tramp" , anim = "trev_scares_tramp_idle_tramp" , andar = false , loop = true },
	{ nome = "deitar7" , dict = "switch@trevor@annoys_sunbathers" , anim = "trev_annoys_sunbathers_loop_girl" , andar = false , loop = true },		
	{ nome = "deitar8" , dict = "switch@trevor@annoys_sunbathers" , anim = "trev_annoys_sunbathers_loop_guy" , andar = false , loop = true },
	{ nome = "debrucar" , dict = "amb@prop_human_bum_shopping_cart@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "dancar" , dict = "rcmnigel1bnmt_1b" , anim = "dance_loop_tyler" , andar = false , loop = true },
	{ nome = "dancar2" , dict = "mp_safehouse" , anim = "lap_dance_girl" , andar = false , loop = true },
	{ nome = "dancar3" , dict = "misschinese2_crystalmazemcs1_cs" , anim = "dance_loop_tao" , andar = false , loop = true },
	{ nome = "dancar4" , dict = "mini@strip_club@private_dance@part1" , anim = "priv_dance_p1" , andar = false , loop = true },
	{ nome = "dancar5" , dict = "mini@strip_club@private_dance@part2" , anim = "priv_dance_p2" , andar = false , loop = true },
	{ nome = "dancar6" , dict = "mini@strip_club@private_dance@part3" , anim = "priv_dance_p3" , andar = false , loop = true },
	{ nome = "dancar7" , dict = "special_ped@mountain_dancer@monologue_2@monologue_2a" , anim = "mnt_dnc_angel" , andar = false , loop = true },
	{ nome = "dancar8" , dict = "special_ped@mountain_dancer@monologue_3@monologue_3a" , anim = "mnt_dnc_buttwag" , andar = false , loop = true },
	{ nome = "dancar9" , dict = "missfbi3_sniping" , anim = "dance_m_default" , andar = false , loop = true },
	{ nome = "dancar10" , dict = "anim@amb@nightclub@dancers@black_madonna_entourage@" , anim = "hi_dance_facedj_09_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar11" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar12" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar13" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar14" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar15" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar16" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar17" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar18" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar19" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar20" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar21" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar22" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar23" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar24" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar25" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^3" , andar = false , loop = true },
	{ nome ="dancar26" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar27" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar28" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar29" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar30" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^2" , andar = false , loop = true },
	{ nome ="dancar31" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar32" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar33" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar34" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar35" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar36" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar37" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar38" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar39" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar40" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar41" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar42" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar43" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar44" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar45" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar46" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar47" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar48" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar49" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar50" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar51" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar52" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar53" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar54" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar55" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar56" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar57" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar58" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar59" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar60" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar61" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar62" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar63" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar64" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar65" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar66" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar67" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar68" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar69" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar70" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar71" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar72" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar73" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar74" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar75" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar76" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar77" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar78" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar79" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar80" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar81" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar82" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar83" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar84" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar85" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar86" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar87" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar88" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar89" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar90" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar91" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar92" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar93" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar94" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar95" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar96" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar97" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar98" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar99" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar100" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar101" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar102" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar103" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar104" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar105" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar106" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar107" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar108" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar109" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar110" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar111" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar112" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar113" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar114" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar115" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar116" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar117" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar118" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar119" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar120" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar121" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar122" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar123" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar124" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar125" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar126" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar127" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar128" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar129" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar130" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar131" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar132" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar133" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar134" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar135" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar136" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar137" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar138" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar139" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar140" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar141" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar142" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar143" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar144" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar145" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar146" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar147" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar148" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar149" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar150" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar151" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar152" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar153" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar154" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar155" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar156" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar157" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar158" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar159" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar160" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar161" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar162" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar163" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar164" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar165" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar166" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar167" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar168" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar169" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar170" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar171" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar172" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar173" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar174" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar175" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar176" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar177" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar178" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar179" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar180" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar181" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar182" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar183" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar184" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar185" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar186" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar187" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar188" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar189" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar190" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar191" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar192" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar193" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar194" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar195" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar196" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar197" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar198" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar199" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar200" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar201" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar202" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar203" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar204" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar205" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar206" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar207" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar208" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar209" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar210" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar211" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar212" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar213" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar214" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar215" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar216" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar217" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar218" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar219" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar220" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar221" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar222" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar223" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar224" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar225" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar226" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar227" , dict = "anim@amb@nightclub@lazlow@hi_podium@" , anim = "danceidle_hi_11_buttwiggle_b_laz" , andar = false , loop = true },
	{ nome = "dancar228" , dict = "timetable@tracy@ig_5@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "dancar229" , dict = "anim@mp_player_intupperfind_the_fish" , anim = "idle_a" , andar = true , loop = true },
	{ nome = "dancar230" , dict = "anim@amb@nightclub@dancers@podium_dancers@" , anim = "hi_dance_facedj_17_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar231" , dict = "anim@amb@nightclub@dancers@solomun_entourage@" , anim = "mi_dance_facedj_17_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar232" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_center" , andar = false , loop = true },
	{ nome = "dancar233" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_center_down" , andar = false , loop = true },
	{ nome = "dancar234" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_center_up" , andar = false , loop = true },
	{ nome = "dancar235" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_left" , andar = false , loop = true },
	{ nome = "dancar236" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_left_down" , andar = false , loop = true },
	{ nome = "dancar237" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_left_up" , andar = false , loop = true },
	{ nome = "dancar238" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_right" , andar = false , loop = true },
	{ nome = "dancar239" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_right_down" , andar = false , loop = true },
	{ nome = "dancar240" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_right_up" , andar = false , loop = true },
	{ nome = "dancar241" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_center" , andar = false , loop = true },
	{ nome = "dancar242" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_center_down" , andar = false , loop = true },
	{ nome = "dancar243" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_center_up" , andar = false , loop = true },
	{ nome = "dancar244" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_left" , andar = false , loop = true },
	{ nome = "dancar245" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_left_down" , andar = false , loop = true },
	{ nome = "dancar246" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome = "dancar247" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_right" , andar = false , loop = true },
	{ nome = "dancar248" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_right_down" , andar = false , loop = true },
	{ nome = "dancar249" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_right_up" , andar = false , loop = true },
	{ nome = "dancar250" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_center" , andar = false , loop = true },
	{ nome = "dancar251" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_center_down" , andar = false , loop = true },
	{ nome = "dancar252" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_center_up" , andar = false , loop = true },
	{ nome = "dancar253" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_left" , andar = false , loop = true },
	{ nome = "dancar254" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_left_down" , andar = false , loop = true },
	{ nome = "dancar255" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_left_up" , andar = false , loop = true },
	{ nome = "dancar256" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_right" , andar = false , loop = true },
	{ nome = "dancar257" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_right_down" , andar = false , loop = true },
	{ nome = "dancar258" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_right_up" , andar = false , loop = true },
	{ nome = "dancar259" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_center" , andar = false , loop = true },
	{ nome = "dancar260" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_center_down" , andar = false , loop = true },
	{ nome = "dancar261" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_center_up" , andar = false , loop = true },
	{ nome = "dancar262" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_left" , andar = false , loop = true },
	{ nome = "dancar263" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_left_down" , andar = false , loop = true },
	{ nome = "dancar264" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_left_up" , andar = false , loop = true },
	{ nome = "dancar265" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_right" , andar = false , loop = true },
	{ nome = "dancar266" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_right_down" , andar = false , loop = true },
	{ nome = "dancar267" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_right_up" , andar = false , loop = true },
	{ nome = "dancar268" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_center" , andar = false , loop = true },
	{ nome = "dancar269" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_center_down" , andar = false , loop = true },
	{ nome = "dancar270" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_center_up" , andar = false , loop = true },
	{ nome = "dancar271" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_left" , andar = false , loop = true },
	{ nome = "dancar272" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_left_down" , andar = false , loop = true },
	{ nome = "dancar273" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome = "dancar274" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_right" , andar = false , loop = true },
	{ nome = "dancar275" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_right_down" , andar = false , loop = true },
	{ nome = "dancar276" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_right_up" , andar = false , loop = true },
	{ nome = "dancar277" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_center" , andar = false , loop = true },
	{ nome = "dancar278" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_center_down" , andar = false , loop = true },
	{ nome = "dancar279" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_center_up" , andar = false , loop = true },
	{ nome = "dancar280" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_left" , andar = false , loop = true },
	{ nome = "dancar281" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_left_down" , andar = false , loop = true },
	{ nome = "dancar282" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_left_up" , andar = false , loop = true },
	{ nome = "dancar283" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_right" , andar = false , loop = true },
	{ nome = "dancar284" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_right_down" , andar = false , loop = true },
	{ nome = "dancar285" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_right_up" , andar = false , loop = true },
	{ nome = "dancar286" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_center" , andar = false , loop = true },
	{ nome = "dancar287" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_center_down" , andar = false , loop = true },
	{ nome = "dancar288" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_center_up" , andar = false , loop = true },
	{ nome = "dancar289" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_left" , andar = false , loop = true },
	{ nome = "dancar290" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_left_down" , andar = false , loop = true },
	{ nome = "dancar291" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_left_up" , andar = false , loop = true },
	{ nome = "dancar292" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_right" , andar = false , loop = true },
	{ nome = "dancar293" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_right_down" , andar = false , loop = true },
	{ nome = "dancar294" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_right_up" , andar = false , loop = true },
	{ nome = "dancar295" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_center" , andar = false , loop = true },
	{ nome = "dancar296" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_center_down" , andar = false , loop = true },
	{ nome = "dancar297" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_center_up" , andar = false , loop = true },
	{ nome = "dancar298" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_left" , andar = false , loop = true },
	{ nome = "dancar299" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_left_down" , andar = false , loop = true },
	{ nome = "dancar300" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome = "dancar301" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_right" , andar = false , loop = true },
	{ nome = "dancar302" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_right_down" , andar = false , loop = true },
	{ nome = "dancar303" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_right_up" , andar = false , loop = true },
	{ nome = "dancar304" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_center" , andar = false , loop = true },
	{ nome = "dancar305" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_center_down" , andar = false , loop = true },
	{ nome = "dancar306" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_center_up" , andar = false , loop = true },
	{ nome = "dancar307" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_left" , andar = false , loop = true },
	{ nome = "dancar308" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_left_down" , andar = false , loop = true },
	{ nome = "dancar309" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_left_up" , andar = false , loop = true },
	{ nome = "dancar310" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_right" , andar = false , loop = true },
	{ nome = "dancar311" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_right_down" , andar = false , loop = true },
	{ nome = "dancar312" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_right_up" , andar = false , loop = true },
	
	{ nome = "dancar313" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_center" , andar = false , loop = true },
	{ nome = "dancar314" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_center_down" , andar = false , loop = true },
	{ nome = "dancar315" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_center_up" , andar = false , loop = true },
	{ nome = "dancar316" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_left" , andar = false , loop = true },
	{ nome = "dancar317" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_left_down" , andar = false , loop = true },
	{ nome = "dancar318" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_left_up" , andar = false , loop = true },
	{ nome = "dancar319" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_right" , andar = false , loop = true },
	{ nome = "dancar320" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_right_down" , andar = false , loop = true },
	{ nome = "dancar321" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_right_up" , andar = false , loop = true },
	{ nome = "dancar322" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_center" , andar = false , loop = true },
	{ nome = "dancar323" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_center_down" , andar = false , loop = true },
	{ nome = "dancar324" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_center_up" , andar = false , loop = true },
	{ nome = "dancar325" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_left" , andar = false , loop = true },
	{ nome = "dancar326" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_left_down" , andar = false , loop = true },
	{ nome = "dancar327" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome = "dancar328" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_right" , andar = false , loop = true },
	{ nome = "dancar329" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_right_down" , andar = false , loop = true },
	{ nome = "dancar330" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_right_up" , andar = false , loop = true },
	{ nome = "dancar331" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_center" , andar = false , loop = true },
	{ nome = "dancar332" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_center_down" , andar = false , loop = true },
	{ nome = "dancar333" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_center_up" , andar = false , loop = true },
	{ nome = "dancar334" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_left" , andar = false , loop = true },
	{ nome = "dancar335" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_left_down" , andar = false , loop = true },
	{ nome = "dancar336" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_left_up" , andar = false , loop = true },
	{ nome = "dancar337" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_right" , andar = false , loop = true },
	{ nome = "dancar338" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_right_down" , andar = false , loop = true },
	{ nome = "dancar339" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_right_up" , andar = false , loop = true },
	{ nome = "dancar340" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_center" , andar = false , loop = true },
	{ nome = "dancar341" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_center_down" , andar = false , loop = true },
	{ nome = "dancar342" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_center_up" , andar = false , loop = true },
	{ nome = "dancar343" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_left" , andar = false , loop = true },
	{ nome = "dancar344" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_left_down" , andar = false , loop = true },
	{ nome = "dancar345" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_left_up" , andar = false , loop = true },
	{ nome = "dancar346" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_right" , andar = false , loop = true },
	{ nome = "dancar347" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_right_down" , andar = false , loop = true },
	{ nome = "dancar348" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_right_up" , andar = false , loop = true },
	{ nome = "dancar349" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_center" , andar = false , loop = true },
	{ nome = "dancar350" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_center_down" , andar = false , loop = true },
	{ nome = "dancar351" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_center_up" , andar = false , loop = true },
	{ nome = "dancar352" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_left" , andar = false , loop = true },
	{ nome = "dancar353" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_left_down" , andar = false , loop = true },
	{ nome = "dancar354" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome = "dancar355" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_right" , andar = false , loop = true },
	{ nome = "dancar356" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_right_down" , andar = false , loop = true },
	{ nome = "dancar357" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_right_up" , andar = false , loop = true },
	{ nome = "dancar358" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_center" , andar = false , loop = true },
	{ nome = "dancar359" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_center_down" , andar = false , loop = true },
	{ nome = "dancar360" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_center_up" , andar = false , loop = true },
	{ nome = "dancar361" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_left" , andar = false , loop = true },
	{ nome = "dancar362" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_left_down" , andar = false , loop = true },
	{ nome = "dancar363" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_left_up" , andar = false , loop = true },
	{ nome = "dancar364" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_right" , andar = false , loop = true },
	{ nome = "dancar365" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_right_down" , andar = false , loop = true },
	{ nome = "dancar366" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_right_up" , andar = false , loop = true },
	{ nome = "dancar367" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_center" , andar = false , loop = true },	
	{ nome = "dancar368" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_center_down" , andar = false , loop = true },	
	{ nome = "dancar369" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_center_up" , andar = false , loop = true },	
	{ nome = "dancar370" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_left" , andar = false , loop = true },	
	{ nome = "dancar371" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_left_down" , andar = false , loop = true },	
	{ nome = "dancar372" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_left_up" , andar = false , loop = true },	
	{ nome = "dancar373" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_right" , andar = false , loop = true },	
	{ nome = "dancar374" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_right_down" , andar = false , loop = true },	
	{ nome = "dancar375" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_right_up" , andar = false , loop = true },	
	{ nome = "dancar376" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_center" , andar = false , loop = true },	
	{ nome = "dancar377" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_center_down" , andar = false , loop = true },	
	{ nome = "dancar378" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_center_up" , andar = false , loop = true },	
	{ nome = "dancar379" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_left" , andar = false , loop = true },	
	{ nome = "dancar380" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_left_down" , andar = false , loop = true },	
	{ nome = "dancar381" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_left_up" , andar = false , loop = true },	
	{ nome = "dancar382" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_right" , andar = false , loop = true },	
	{ nome = "dancar383" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_right_down" , andar = false , loop = true },	
	{ nome = "dancar384" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_right_up" , andar = false , loop = true },	
	{ nome = "dancar385" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_center" , andar = false , loop = true },	
	{ nome = "dancar386" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_center_down" , andar = false , loop = true },	
	{ nome = "dancar387" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_center_up" , andar = false , loop = true },	
	{ nome = "dancar388" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_left" , andar = false , loop = true },	
	{ nome = "dancar389" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_left_down" , andar = false , loop = true },	
	{ nome = "dancar390" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_left_up" , andar = false , loop = true },	
	{ nome = "dancar391" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_right" , andar = false , loop = true },	
	{ nome = "dancar392" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_right_down" , andar = false , loop = true },	
	{ nome = "dancar393" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_right_up" , andar = false , loop = true },	
	{ nome = "sexo" , dict = "rcmpaparazzo_2" , anim = "shag_loop_poppy" , andar = false , loop = true },
	{ nome = "sexo2" , dict = "rcmpaparazzo_2" , anim = "shag_loop_a" , andar = false , loop = true },
	{ nome = "sexo3" , dict = "anim@mp_player_intcelebrationfemale@air_shagging" , anim = "air_shagging" , andar = false , loop = true },
	{ nome = "sexo4" , dict = "oddjobs@towing" , anim = "m_blow_job_loop" , andar = false , loop = true , carros = true },
	{ nome = "sexo5" , dict = "oddjobs@towing" , anim = "f_blow_job_loop" , andar = false , loop = true , carros = true },
	{ nome = "sexo6" , dict = "mini@prostitutes@sexlow_veh" , anim = "low_car_sex_loop_female" , andar = false , loop = true , carros = true },
	--[[ { nome = "sentar" , anim = "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER" , extra = function()
        local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        for k,v in pairs(chairs) do
            local object = GetClosestObjectOfType(x,y,z,0.7,GetHashKey(v[1]),0,0,0)
            if DoesEntityExist(object) then
                local x2,y2,z2 = table.unpack(GetEntityCoords(object))
                FreezeEntityPosition(object,true)
                SetEntityCoords(ped,x2,y2,z2+v[2])
                SetEntityHeading(ped,GetEntityHeading(object)-180.0)
            end
        end
    end }, ]]
	{ nome = "sentar2" , dict = "amb@world_human_picnic@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar3" , dict = "anim@heists@fleeca_bank@ig_7_jetski_owner" , anim = "owner_idle" , andar = false , loop = true },
	{ nome = "sentar4" , dict = "amb@world_human_stupor@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar5" , dict = "amb@world_human_picnic@female@base" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar6" , dict = "anim@amb@nightclub@lazlow@lo_alone@" , anim = "lowalone_base_laz" , andar = false , loop = true },
	{ nome = "sentar7" , dict = "anim@amb@business@bgen@bgen_no_work@" , anim = "sit_phone_phoneputdown_idle_nowork" , andar = false , loop = true },
	{ nome = "sentar8" , dict = "rcm_barry3" , anim = "barry_3_sit_loop" , andar = false , loop = true },
	{ nome = "sentar9" , dict = "amb@world_human_picnic@male@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "sentar10" , dict = "amb@world_human_picnic@female@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "sentar11" , dict = "timetable@jimmy@mics3_ig_15@" , anim = "idle_a_jimmy" , andar = false , loop = true },
	{ nome = "sentar12" , dict = "timetable@jimmy@mics3_ig_15@" , anim = "mics3_15_base_jimmy" , andar = false , loop = true },
	{ nome = "sentar13" , dict = "amb@world_human_stupor@male@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "sentar14" , dict = "timetable@tracy@ig_14@" , anim = "ig_14_base_tracy" , andar = false , loop = true },
	{ nome = "sentar15" , dict = "anim@heists@ornate_bank@hostages@hit" , anim = "hit_loop_ped_b" , andar = false , loop = true },
	{ nome = "sentar16" , dict = "anim@heists@ornate_bank@hostages@ped_e@" , anim = "flinch_loop" , andar = false , loop = true },
	{ nome = "sentar17" , dict = "timetable@ron@ig_5_p3" , anim = "ig_5_p3_base" , andar = false , loop = true },
	{ nome = "sentar18" , dict = "timetable@reunited@ig_10" , anim = "base_amanda" , andar = false , loop = true },
	{ nome = "sentar19" , dict = "timetable@ron@ig_3_couch" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar20" , dict = "timetable@jimmy@mics3_ig_15@" , anim = "mics3_15_base_tracy" , andar = false , loop = true },
	{ nome = "sentar21" , dict = "timetable@maid@couch@" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar22" , dict = "timetable@ron@ron_ig_2_alt1" , anim = "ig_2_alt1_base" , andar = false , loop = true },
	{ nome = "sentar23" , dict = "timetable@reunited@ig_10" , anim ="shouldntyouguys_jimmy" , andar = false , loop = true },
    { nome = "sentar24" , dict = "timetable@tracy@ig_2@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar25" , dict = "anim@amb@office@boss@female@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar26" , dict = "anim@amb@casino@out_of_money@ped_female@01a@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar27" , dict = "anim@amb@casino@out_of_money@ped_female@01b@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar28" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_female@engaged@01a@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar29" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_male@regular@01b@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar30" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_male@regular@02a@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar31" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_male@regular@02b@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar32" , dict = "anim_casino_a@amb@casino@games@slots@ped_female@regular@02a@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar33" , dict = "anim_casino_b@amb@casino@games@blackjack@ped_male@engaged@01a@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar34" , dict = "misslester1aig_3main" , anim ="air_guitar_01_a" , andar = false , loop = true },
    { nome = "sentar35" , dict = "missheistdocks2aleadinoutlsdh_2a_int" , anim ="sitting_loop_wade" , andar = false , loop = true },
    { nome = "sentar36" , dict = "switch@franklin@stripclub2" , anim ="ig_16_base" , andar = false , loop = true },
    { nome = "sentar37" , dict = "switch@michael@restaurant" , anim ="001510_02_gc_mics3_ig_1_base_amanda" , andar = false , loop = true },
    { nome = "sentar38" , dict = "switch@michael@ronex_ig_5_p2" , anim ="base_michael" , andar = false , loop = true },
    { nome = "sentar39" , dict = "timetable@amanda@facemask@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar40" , dict = "timetable@reunited@ig_7" , anim ="amandabase_amanda" , andar = false , loop = true },
    { nome = "sentar41" , dict = "timetable@tracy@ig_2@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar42" , dict = "mini@strip_club@backroom@" , anim ="leadin_loop_idle_c_stripper_c" , andar = false , loop = true },
    { nome = "sentar43" , dict = "timetable@trevor@smoking_meth@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar44" , dict = "switch@michael@sitting_on_car_premiere" , anim ="sitting_on_car_premiere_loop_player" , andar = false , loop = true },
    { nome = "sentar45" , dict = "mp_am_stripper" , anim ="lap_dance_player" , andar = false , loop = true },
    { nome = "sentar46" , dict = "switch@michael@opens_door_for_ama" , anim ="001895_02_mics3_17_opens_door_for_ama_idle_ama" , andar = false , loop = true },
    { nome = "sentar47" , dict = "switch@michael@lounge_chairs" , anim ="001523_01_mics3_9_lounge_chairs_idle_mic" , andar = false , loop = true },
    { nome = "sentar48" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_female@engaged@01a@base_big_screen" , anim ="base_big_screen" , andar = false , loop = true },
    { nome = "sentar49" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_female@engaged@01b@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar50" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_female@engaged@01b@base_big_screen" , anim ="base_big_screen" , andar = false , loop = true },
    { nome = "sentar51" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_female@regular@01a@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar52" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_female@regular@01b@base_big_screen" , anim ="base_big_screen" , andar = false , loop = true },
    { nome = "sentar53" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_male@regular@02a@trans" , anim ="base_to_big_screen" , andar = false , loop = true },
    { nome = "sentar54" , dict = "switch@michael@parkbench_smoke_ranger" , anim ="parkbench_smoke_ranger_loop" , andar = false , loop = true },
    { nome = "sentar55" , dict = "switch@michael@lounge_chairs" , anim ="001523_01_mics3_9_lounge_chairs_idle_mic" , andar = false , loop = true },
    { nome = "sentar56" , dict = "anim@amb@business@cfm@cfm_machine_no_work@" , anim ="smokers_cough_v1_operator" , andar = false , loop = true },
    { nome = "sentar57" , dict = "rcmnigel1a_band_groupies" , anim ="bump_f1" , andar = false , loop = true },
    { nome = "sentar58" , dict = "anim@amb@nightclub@smoking@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar59" , dict = "amb@lo_res_idles@" , anim = "world_human_picnic_female_lo_res_base" , andar = false , loop = true },
    { nome = "sentar60" , dict = "missheistdocks2aleadinoutlsdh_2a_int" , anim ="massage_loop_2_trevor" , andar = false , loop = true },
    { nome = "sentar61" , dict = "anim_casino_b@amb@casino@games@blackjack@ped_female@no_heels@regular@02a@reacts@v01" , anim ="reaction_impartial_var03" , andar = false , loop = true },
    { nome = "sentar62" , dict = "anim@amb@clubhouse@boss@female@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar63" , dict = "timetable@denice@ig_4" , anim = "base" , andar = false , loop = true },
    { nome = "sentar64" , anim = "snort_coke_a_female" , dict  = "missfbi3_party" , andar = false , loop = true },
    { nome = "sentar65" , anim = "loop_amanda" , dict  = "switch@michael@cafe" , andar = false , loop = true },
	{ nome = "sentar66" , dict = "safe@michael@ig_3" , anim ="base_michael" , andar = false , loop = true },
	{ nome = "sentar67" , dict = "rcmnigel1a_band_groupies" , anim ="base_m1" , andar = false , loop = true },
	{ nome = "sentar68" , dict = "anim@heists@fleeca_bank@hostages@intro" , anim ="intro_loop_ped_a" , andar = false , loop = true },
	{ nome = "sentar69" , dict = "switch@michael@ronex_ig_5_p2" , anim ="base_michael" , andar = false , loop = true },
	{ nome = "sentar70" , dict = "timetable@reunited@ig_10" , anim = "shouldntyouguys_amanda" , andar = false , loop = true },
	{ nome = "sentar71" , dict = "bs_1_int-9" , anim = "player_one_dual-9" , andar = false , loop = true },
	{ nome = "sentar72" , dict = "anim@amb@office@boss@female@" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar73" , dict = "rcmnigel1a_band_groupies" , anim = "bump_f1" , andar = false , loop = true },
	{ nome = "sentar74" , dict= "missheistdocks2aleadinoutlsdh_2a_int" , anim = "sitting_loop_wade" , andar = false , loop = true },
	{ nome = "sentar75" , dict= "anim@amb@business@cfid@cfid_desk_no_work_bgen_chair_no_work@" , anim = "lookaround_phoneless_lazyworker" , andar = false , loop = true },
	{ nome = "sentar76" , dict= "switch@michael@restaurant" , anim = "001510_02_gc_mics3_ig_1_base_amanda" , andar = false , loop = true },
	{ nome = "sentar77" , dict= "timetable@reunited@ig_7" , anim = "amandabase_amanda" , andar = false , loop = true },
	{ nome = "sentar78" , dict= "mini@strip_club@backroom@" , anim = "leadin_loop_idle_c_stripper_c" , andar = false , loop = true },
	{ nome = "sentar79" , dict= "switch@michael@lounge_chairs" , anim = "001523_01_mics3_9_lounge_chairs_idle_mic" , andar = false , loop = true },
	{ nome = "sentar80" , dict= "anim_casino_a@amb@casino@games@insidetrack@ped_female@engaged@01b@base_big_screen" , anim = "base_big_screen" , andar = false , loop = true },
	{ nome = "sentar81" , dict= "anim_casino_a@amb@casino@games@insidetrack@ped_female@regular@01a@base" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar82" , dict= "missheistdocks2aleadinoutlsdh_2a_int" , anim = "massage_loop_2_trevor" , andar = false , loop = true },
	{ nome = "sentar83" , dict= "timetable@amanda@ig_7" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar84" , dict= "hs3_pln_int-0" , anim = "csb_huang_dual-0" , andar = false , loop = true },
	{ nome = "sentar85" , dict = "timetable@tracy@ig_14@" , anim ="ig_14_iwishall_a_tracy" , andar = false , loop = true },
    { nome = "sentar86" , dict = "mp_safehouselost_table@" , anim ="lost_table_idle_a" , andar = false , loop = true },
    { nome = "sentar87" , dict = "timetable@ron@ron_ig_2_alt1" , anim ="ig_2_alt1_base" , andar = false , loop = true },
    { nome = "sentar88" , dict = "anim@amb@office@boss@female@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar89" , dict = "rcmnigel1aig_1" , anim ="you_know_girl" , andar = false , loop = true },
    { nome = "sentar90" , dict = "anim@amb@clubhouse@boardroom@boss@female@base_r@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar91" , dict = "anim@amb@facility@briefing_room@seating@female@var_b@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar92" , dict = "switch@michael@ronex_ig_5_p2" , anim ="base_michael" , andar = false , loop = true },
    { nome = "sentar93" , dict = "switch@franklin@stripclub3" , anim ="ig_17_base" , andar = false , loop = true },
    { nome = "sentar94" , dict = "safe@franklin@ig_14" , anim ="base" , andar = false , loop = true },
    { nome = "sentar95" , dict = "rcmnigel1bnmt_1b" , anim ="base_girl" , andar = false , loop = true },
    { nome = "sentar96" , dict = "anim@amb@business@cfm@cfm_machine_no_work@" , anim ="hanging_out_operator" , andar = false , loop = true },
    { nome = "sentar97" , dict = "timetable@reunited@ig_10" , anim ="shouldntyouguys_tracy" , andar = false , loop = true },
    { nome = "sentar98" , dict = "missfbi3_party" , anim ="snort_coke_b_male5" , andar = false , loop = true },
    { nome = "sentar99" , dict = "missheistpaletoscoresetupleadin" , anim ="rbhs_mcs_1_leadin" , andar = false , loop = true },
    { nome = "sentar100" , dict = "misslester1aig_3exit" , anim ="air_guitar_01_exitloop_d" , andar = false , loop = true },
    { nome = "sentar101" , dict = "misslester1aig_3main" , anim ="air_guitar_01_b" , andar = false , loop = true },
    { nome = "sentar102" , dict = "misslester1aig_5intro" , anim ="boardroom_intro_f_c" , andar = false , loop = true },
    { nome = "sentar103" , dict = "misslester1b_crowd@m_" , anim ="001082_01_m_a" , andar = false , loop = true },
    { nome = "sentar104" , dict = "mp_am_stripper" , anim ="lap_dance_player" , andar = false , loop = true },
    { nome = "sentar105" , dict = "safe@franklin@ig_14" , anim ="base" , andar = false , loop = true },
    { nome = "sentar106" , dict = "switch@trevor@mocks_lapdance" , anim ="001443_01_trvs_28_idle_man" , andar = false , loop = true },
    { nome = "sentar107" , dict = "switch@trevor@rude_at_cafe" , anim ="001218_03_trvs_23_rude_at_cafe_idle_female" , andar = false , loop = true },
	{ nome = "sentar108" , dict = "amb@world_human_seat_steps@female@maos_by_sides@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar109" , dict = "amb@world_human_seat_wall@female@maos_by_sides@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar110" , dict = "timetable@trevor@trv_ig_2" , anim ="base_trevor" , andar = false , loop = true },
    { nome = "sentar111" , dict = "missdrfriedlanderdrf_idles" , anim ="drf_idle_drf" , andar = false , loop = true },
    { nome = "sentar112" , dict = "anim@amb@clubhouse@boss@female@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar113" , dict = "anim@amb@clubhouse@boardroom@crew@male@var_b@base_r@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar114" , dict = "anim@amb@office@seating@female@var_b@base@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar115" , dict = "anim@amb@office@seating@female@var_c@base@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar116" , dict = "amb@world_human_seat_steps@male@elbows_on_knees@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar117" , dict = "anim@amb@facility@briefing_room@seating@male@var_a@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar118" , dict = "anim@amb@clubhouse@boardroom@boss@female@base_r@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar119" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_a@base_r@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar120" , dict = "iaaj_ext-27" , anim ="csb_mp_agent14_dual-27" , andar = false , loop = true },
    { nome = "sentar121" , dict = "anim@amb@facility@briefing_room@seating@male@var_b@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar122" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_a@base_l@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar123" , dict = "missfam2_bikehire@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar124" , dict = "missarmenian2" , anim ="car_react_gang_ps" , andar = false , loop = true },
    { nome = "sentar125" , dict = "anim@amb@office@boardroom@boss@male@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar126" , dict = "anim@amb@office@seating@female@var_a@base@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar127" , dict = "anim@amb@office@seating@male@var_b@base@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar128" , dict = "anim@amb@office@seating@male@var_e@base@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar129" , dict = "anim@amb@office@boardroom@crew@male@var_b@base_r@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar130" , dict = "sub_int-38" , anim ="mp_m_freemode_01^1_dual-38" , andar = false , loop = true },
    { nome = "sentar131" , dict = "sil_int-28" , anim ="mp_m_freemode_01_dual-28" , andar = false , loop = true },
    { nome = "sentar132" , dict = "drf_mic_1_cs_1-15" , anim ="cs_drfriedlander_dual-15" , andar = false , loop = true },
    { nome = "sentar133" , dict = "drf_mic_1_cs_1-24" , anim ="cs_drfriedlander_dual-24" , andar = false , loop = true },
    { nome = "sentar134" , dict = "drf_mic_1_cs_1-30" , anim ="cs_drfriedlander_dual-30" , andar = false , loop = true },
    { nome = "sentar135" , dict = "amb@lo_res_idles@" , anim = "prop_human_deckchair_female_lo_res_base" , andar = false , loop = true },
    { nome = "sentar136" , dict = "anim@amb@office@boardroom@boss@male@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar137" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_a@base@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar138" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_a@base_l@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar139" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_a@base_r@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar140" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_b@base@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar141" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_b@base_r@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar142" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_c@base@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar143" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_c@base_l@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar144" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_c@base_r@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar145" , dict = "anim@amb@clubhouse@boardroom@crew@male@var_a@base@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar146" , dict = "anim@amb@clubhouse@boardroom@crew@male@var_a@base_l@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar147" , dict = "anim@amb@clubhouse@boardroom@crew@male@var_a@base_r@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar148" , dict = "anim@amb@clubhouse@boardroom@crew@male@var_b@base@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar149" , dict = "anim@amb@clubhouse@boardroom@crew@male@var_c@base@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar150" , dict = "amb@incar@male@smoking_van@enter" , anim = "enter" , andar = false , loop = true },
    { nome = "sentar151" , dict = "anim@amb@yacht@jacuzzi@seated@female@variation_05@" , anim = "idle_a" , andar = false , loop = true },
    { nome = "sentar152" , dict = "family_4_mcs_2-2" , anim = "csb_hugh_dual-2" , andar = false , loop = true },
	{ nome = "sentar153" , dict = "anim@amb@office@boardroom@crew@female@var_a@base_r@" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar154" , dict = "arm_1_mcs_2_concat-0" , anim = "cs_denise_dual-0" , andar = false , loop = true },
	{ nome = "sentar155" , dict= "anim@amb@facility@briefing_room@seating@male@var_a@" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar156" , dict= "anim@amb@office@seating@female@var_b@base@" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar157" , dict= "anim@amb@office@seating@female@var_c@base@" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar158" , dict= "anim@amb@clubhouse@boardroom@crew@female@var_a@base_r@" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar159" , dict= "missheist_jewelleadinout" , anim = "jh_int_outro_loop_d" , andar = false , loop = true },
	{ nome = "sentar160" , dict= "drf_mic_1_cs_1-15" , anim = "cs_drfriedlander_dual-15" , andar = false , loop = true },
	{ nome = "sentar161" , dict= "sol_3_int-9" , anim = "cs_molly_dual-9" , andar = false , loop = true },
	{ nome = "sentar162" , dict= "sil_int-29" , anim = "mp_m_freemode_01^3_dual-29" , andar = false , loop = true },
	{ nome = "beijar" , dict = "mp_ped_interaction" , anim = "kisses_guy_a" , andar = false , loop = false },
	{ nome = "striper" , dict = "mini@strip_club@idles@stripper" , anim = "stripper_idle_02" , andar = false , loop = true },
	{ nome = "escutar" , dict = "mini@safe_cracking" , anim = "idle_base" , andar = false , loop = true },
	{ nome = "alongar" , dict = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_e" , andar = false , loop = true },
	{ nome = "alongar2" , dict = "mini@triathlon" , anim = "idle_e" , andar = false , loop = true },
	{ nome = "alongar3" , dict = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_c" , andar = false , loop = false },
	{ nome = "alongar4" , dict = "mini@triathlon" , anim = "idle_f" , andar = false , loop = true },
	{ nome = "alongar5" , dict = "mini@triathlon" , anim = "idle_d" , andar = false , loop = true },
	{ nome = "alongar6" , dict = "rcmfanatic1maryann_stretchidle_b" , anim = "idle_e" , andar = false , loop = true },
	{ nome = "alongar7" , dict = "timetable@reunited@ig_2" , anim = "jimmy_getknocked" , andar = false , loop = true },
	{ nome = "dj" , dict = "anim@mp_player_intupperdj" , anim = "idle_a", andar = true , loop = true },
	{ nome = "dj2" , dict = "anim@mp_player_intupperair_synth" , anim = "idle_a_fp" , andar = false , loop = true },
	{ nome = "dj3" , dict = "anim@mp_player_intcelebrationfemale@air_synth" , anim = "air_synth" , andar = false , loop = false },
	{ nome = "rock" , dict = "anim@mp_player_intcelebrationmale@air_guitar" , anim = "air_guitar" , andar = false , loop = true },
	{ nome = "rock2" , dict = "mp_player_introck" , anim = "mp_player_int_rock" , andar = false , loop = false },
	{ nome = "abracar" , dict = "mp_ped_interaction" , anim = "hugs_guy_a" , andar = false , loop = false },
	{ nome = "abracar2" , dict = "mp_ped_interaction" , anim = "kisses_guy_b" , andar = false , loop = false },
	{ nome = "peitos" , dict = "mini@strip_club@backroom@" , anim = "stripper_b_backroom_idle_b" , andar = false , loop = false },
	{ nome = "espernear" , dict = "missfam4leadinoutmcs2" , anim = "tracy_loop" , andar = false , loop = true },
	{ nome = "arrumar" , dict = "anim@amb@business@coc@coc_packing_hi@" , anim = "full_cycle_v1_pressoperator" , andar = false , loop = true },
	{ nome = "coca" , dict = "anim@amb@business@coc@coc_packing_hi@" , anim = "full_cycle_v3_pressoperator" , andar = false , loop = true },
	{ nome = "bebado" , dict = "missfam5_blackout" , anim = "pass_out" , andar = false , loop = false },
	{ nome = "bebado2" , dict = "missheist_agency3astumble_getup" , anim = "stumble_getup" , andar = false , loop = false },
	{ nome = "bebado3" , dict = "missfam5_blackout" , anim = "vomit" , andar = false , loop = false },
	{ nome = "bebado4" , dict = "random@drunk_driver_1" , anim = "drunk_fall_over" , andar = false , loop = false },
	{ nome = "bebado5" , dict = "misscarsteal4@actor" , anim = "stumble" , andar = false , loop = false },
	{ nome = "yoga" , dict = "missfam5_yoga" , anim = "f_yogapose_a" , andar = false , loop = true },
	{ nome = "yoga2" , dict = "amb@world_human_yoga@male@base" , anim = "base_a" , andar = false , loop = true },
	{ nome = "abdominal" , dict = "amb@world_human_sit_ups@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "bixa" , anim = "WORLD_HUMAN_PROSTITUTE_LOW_CLASS" },
	{ nome = "britadeira" , dict = "amb@world_human_const_drill@male@drill@base" , anim = "base" , prop = "prop_tool_jackham" , flag = 15 , hand = 28422 },
	{ nome = "cerveja" , anim = "WORLD_HUMAN_PARTYING" },
	{ nome = "churrasco" , anim = "PROP_HUMAN_BBQ" },
	{ nome = "consertar" , anim = "WORLD_HUMAN_WELDING" },
	{ nome = "bracos" , dict = "anim@heists@heist_corona@single_team" , anim = "single_team_loop_boss" , andar = true , loop = true },
	{ nome = "dormir" , dict = "anim@heists@ornate_bank@hostages@hit" , anim = "hit_react_die_loop_ped_a" , andar = false , loop = true },
	{ nome = "dormir2" , dict = "anim@heists@ornate_bank@hostages@hit" , anim = "hit_react_die_loop_ped_e" , andar = false , loop = true },
	{ nome = "dormir3" , dict = "anim@heists@ornate_bank@hostages@hit" , anim = "hit_react_die_loop_ped_h" , andar = false , loop = true },
	{ nome = "dormir4" , dict = "mp_sleep" , anim = "sleep_loop" , andar = false , loop = true },
	{ nome = "dormir5" , dict = "missarmenian2" , anim = "drunk_loop" , andar = false , loop = true },
	{ nome = "encostar2" , dict = "bs_2a_mcs_10-0" , anim = "hc_gunman_dual-0" , andar = false , loop = true },
	{ nome = "encostar3" , dict = "misscarstealfinalecar_5_ig_1" , anim = "waitloop_lamar" , andar = false , loop = true },
	{ nome = "encostar4" , dict = "anim@amb@casino@out_of_money@ped_female@02b@base" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar5" , dict = "anim@amb@casino@hangout@ped_male@stand@03b@base" , anim = "base" , andar = true , loop = true },
	{ nome = "encostar6" , dict = "anim@amb@casino@hangout@ped_female@stand@02b@base" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar7" , dict = "anim@amb@casino@hangout@ped_female@stand@02a@base" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar8" , dict = "anim@amb@casino@hangout@ped_female@stand@01b@base" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar9" , dict = "anim@amb@clubhouse@bar@bartender@" , anim = "base_bartender" , andar = false , loop = true },
	{ nome = "encostar10" , dict = "missclothing" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "encostar11" , dict = "misscarstealfinale" , anim = "packer_idle_1_trevor" , andar = false , loop = true },
	{ nome = "encostar12" , dict = "missarmenian1leadinoutarm_1_ig_14_leadinout" , anim = "leadin_loop" , andar = false , loop = true },
	{ nome = "encostar13" , dict = "rcmjosh2" , anim ="josh_2_intp1_base" , andar = false , loop = true },
    { nome = "encostar14" , dict = "rcmjosh2" , anim ="josh_wait_loop" , andar = false , loop = true },
    { nome = "encostar15" , dict = "anim@amb@yacht@bow@male@variation_01@" , anim ="base" , andar = false , loop = true },
    { nome = "encostar16" , dict = "anim@heists@prison_heist" , anim ="ped_b_loop_a" , andar = false , loop = true },
    { nome = "encostar17" , dict = "anim@heists@prison_heiststation@cop_reactions" , anim ="drunk_idle" , andar = false , loop = true },
    { nome = "encostar18" , dict = "missarmenian1leadinoutarm_1_ig_14_leadinout" , anim ="leadin_loop" , andar = false , loop = true },
    { nome = "encostar19" , dict = "misscarsteal1car_1_ext_leadin" , anim ="base_driver1" , andar = false , loop = true },
    { nome = "encostar20" , dict = "missclothing" , anim ="idle_b" , andar = false , loop = true },
    { nome = "encostar21" , dict = "missfbi1ig_8" , anim ="outro1_pedb" , andar = false , loop = true },
    { nome = "encostar22" , dict = "missfbi1leadinout" , anim ="fbi_1_int_leadin_exit_loop_daven" , andar = false , loop = true },
    { nome = "encostar23" , dict = "misshair_shop@hair_dressers" , anim ="assistant_base" , andar = false , loop = true },
    { nome = "encostar24" , dict = "missheist_agency2aig_4" , anim ="look_plan_base_worker2" , andar = false , loop = true },
    { nome = "encostar26" , dict = "missheistdockssetup1ig_12@base" , anim ="talk_gantry_idle_base_worker4" , andar = false , loop = true },
    { nome = "encostar25" , dict = "missstrip_club_lean" , anim ="player_lean_rail_loop" , andar = false , loop = true },
    { nome = "encostar26" , dict = "mini@strip_club@leaning@base" , anim ="base" , andar = false , loop = true },
    { nome = "encostar27" , dict = "missheist_jewelleadinout" , anim ="jh_int_outro_loop_c" , andar = false , loop = true },
    { nome = "encostar28" , dict = "anim@amb@business@bgen@bgen_no_work@" , anim ="stand_phone_phoneputdown_fallasleep_nowork" , andar = false , loop = true },
    { nome = "encostar29" , dict = "anim@amb@business@bgen@bgen_no_work@" , anim ="stand_phone_phoneputdown_idle_nowork" , andar = false , loop = true },
    { nome = "encostar30" , dict = "anim@amb@business@bgen@bgen_no_work@" , anim ="stand_phone_phoneputdown_stretching_nowork" , andar = false , loop = true },
    { nome = "encostar31" , dict = "anim@amb@clubhouse@bar@bartender@" , anim ="greeting_c_bartender" , andar = false , loop = true },
    { nome = "encostar32" , dict = "anim@amb@clubhouse@bar@drink@base" , anim ="idle_a" , andar = false , loop = true },
    { nome = "encostar33" , dict = "misscarsteal4leadinout" , anim ="ig_1_base" , andar = false , loop = true },
    { nome = "encostar34" , dict = "missclothing" , anim ="base" , andar = false , loop = true },
    { nome = "encostar35" , dict = "missheistdockssetup1ig_5@base" , anim ="workers_talking_base_dockworker2" , andar = false , loop = true },
    { nome = "encostar36" , dict = "switch@michael@sitting_on_car_bonnet" , anim ="sitting_on_car_bonnet_loop" , andar = false , loop = true },
    { nome = "encostar37" , dict = "amb@world_human_leaning@male@wall@back@foot_up@react_shock" , anim ="front" , andar = false , loop = true },
    { nome = "encostar38" , dict = "anim@amb@world_human_valet@informal@idle_a@" , anim ="idle_a_a_m_y_vinewood_01" , andar = false , loop = true },
    { nome = "encostar39" , dict = "anim@amb@nightclub@dancers@club_ambientpeds@low-med_intensity" , anim ="li-mi_amb_club_06_base_female^1" , andar = false , loop = true },
    { nome = "encostar40" , dict = "ah_1_int-4" , anim ="cs_davenorton_dual-4" , andar = false , loop = true },
    { nome = "encostar41" , dict = "silj_int-8" , anim ="csb_mp_agent14_dual-8" , andar = false , loop = true },
    { nome = "encostar42" , dict = "anim@veh@btype@side_ds@base" , anim ="sit" , andar = false , loop = true },
    { nome = "encostar43" , dict = "anim@veh@btype@side_ps@base" , anim ="sit" , andar = false , loop = true },
    { nome = "encostar44" , dict = "timetable@michael@talk_phonebase" , anim = "talk_phone_base" , andar = false , loop = true },
    { nome = "encostar45" , dict = "anim@amb@clubhouse@bar@bartender@" , anim = "base_bartender" , andar = false , loop = true },
    { nome = "encostar46" , dict = "anim@amb@yacht@jacuzzi@standing@female@variation_02@" , anim = "base_b" , andar = false , loop = true },
    { nome = "encostar47" , anim = "assistant_idle_a" , dict  = "misshair_shop@hair_dressers" , andar = false , loop = true },
    { nome = "encostar48" , anim = "assistant_base" , dict  = "misshair_shop@hair_dressers" , andar = false , loop = true },
    { nome = "encostar49" , dict = "rcmjosh2" , anim = "josh_2_intp1_base" , andar = false , loop = true },
	{ nome = "encostar50" , dict = "anim@arena@prize_wheel@male" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar51" , dict = "hs3_arc_int-15" , anim = "csb_wendy_dual-15" , andar = false , loop = true },
	{ nome = "encostar52" , dict = "anim@amb@yacht@rail@seated@female@variant_02@" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar53" , dict = "anim@amb@yacht@rail@seated@male@variant_01@" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar54" , dict= "misscarsteal4leadinout" , anim = "ig_1_base" , andar = false , loop = true },
	{ nome = "encostar55" , dict= "missclothing" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar56" , dict= "missheistdockssetup1ig_5@base" , anim = "workers_talking_base_dockworker2" , andar = false , loop = true },
	{ nome = "encostar57" , dict= "fra_0_int-9" , anim = "player_one_dual-9" , andar = false , loop = true },
	{ nome = "encostar58" , dict= "fra_0_int-9" , anim = "player_one_dual-9" , andar = false , loop = true },
	{ nome = "encostar59" , dict= "missheistdocks2aleadinoutlsdh_2a_int" , anim = "massage_loop_floyd" , andar = false , loop = true },
	{ nome = "encostar60" , dict = "amb@lo_res_idles@" , anim = "world_human_lean_female_holding_elbow_lo_res_base" , andar = false , loop = true },
    { nome = "encostar61" , dict = "anim@amb@yacht@jacuzzi@standing@female@variation_01@" , anim ="base" , andar = false , loop = true },
    { nome = "encostar62" , dict = "anim@amb@yacht@jacuzzi@standing@female@variation_02@" , anim ="base" , andar = false , loop = true },
	{ nome = "encostar63" , dict = "anim@amb@yacht@jacuzzi@standing@male@variation_01@" , anim ="base" , andar = false , loop = true },
	{ nome = "encostar64" , dict = "anim@amb@yacht@jacuzzi@standing@male@variation_02@" , anim ="base" , andar = false , loop = true },
	{ nome = "encostar65" , dict = "switch@michael@pier" , anim ="pier_lean_toss_cigarette" , andar = false , loop = true },
    { nome = "encostar66" , dict = "missheistdockssetup1ig_10@idle_d" , anim ="talk_pipe_d_worker2" , andar = false , loop = true },
    { nome = "encostar67" , dict = "missheistdockssetup1ig_10@idle_a" , anim ="talk_pipe_a_worker2" , andar = false , loop = true },
    { nome = "encostar68" , dict = "amb@code_human_in_car_mp_actions@finger@std@rps@base" , anim ="idle_a" , andar = false , loop = true },
    { nome = "encostar69" , dict = "anim@amb@nightclub@dancers@club_ambientpeds@low-med_intensity" , anim ="li-mi_amb_club_10_v1_male^3" , andar = false , loop = true },
    { nome = "encostar70" , dict = "anim@amb@business@meth@meth_monitoring_no_work@" , anim ="turnaround_idle_v1_lazycook" , andar = false , loop = true },
    { nome = "encostar71" , dict = "sub_int-42" , anim ="a_m_y_busicas_01_dual-42" , andar = false , loop = true },
    { nome = "encostar72" , dict = "rcmnigel1a_band_groupies" , anim ="base_m2" , andar = false , loop = true },
	{ nome = "flexao" , dict = "amb@world_human_push_ups@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "fisico" , anim = "WORLD_HUMAN_MUSCLE_FLEX" },
	{ nome = "fumar" , anim = "WORLD_HUMAN_SMOKING" },
	{ nome = "fumar2" , anim = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS" },
	{ nome = "fumar3" , anim = "WORLD_HUMAN_AA_SMOKE" },
	{ nome = "fumar4" , anim = "WORLD_HUMAN_SMOKING_POT" },
	{ nome = "fumar5" , dict = "amb@world_human_aa_smoke@male@idle_a" , anim = "idle_c" , prop = "prop_cs_ciggy_01" , flag = 49 , hand = 28422 },
	{ nome = "fumar6" , dict = "amb@world_human_smoking@female@idle_a" , anim = "idle_b" , prop = "prop_cs_ciggy_01" , flag = 49 , hand = 28422 },
	{ nome = "malhar" , dict = "amb@world_human_muscle_free_weights@male@barbell@base" , anim = "base" , prop = "prop_curl_bar_01" , flag = 49 , hand = 28422 },
	{ nome = "malhar2" , dict = "amb@prop_human_muscle_chin_ups@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "martelo" , dict = "amb@world_human_hammering@male@base" , anim = "base" , prop = "prop_tool_hammer" , flag = 49 , hand = 28422 },
	{ nome = "pescar" , dict = "amb@world_human_stand_fishing@base" , anim = "base" , prop = "prop_fishing_rod_01" , flag = 49 , hand = 60309 },
	{ nome = "pescar2" , dict = "amb@world_human_stand_fishing@idle_a" , anim = "idle_c" , prop = "prop_fishing_rod_01" , flag = 49 , hand = 60309 },
	{ nome = "plantar" , dict = "amb@world_human_gardener_plant@female@base" , anim = "base_female" , andar = false , loop = true },
	{ nome = "plantar2" , dict = "amb@world_human_gardener_plant@female@idle_a" , anim = "idle_a_female" , andar = false , loop = true },
	{ nome = "procurar" , dict = "amb@world_human_bum_wash@male@high@base" , anim = "base" , andar = false , loop = true },
	{ nome = "soprador" , dict = "amb@code_human_wander_gardener_leaf_blower@base" , anim = "static" , prop = "prop_leaf_blower_01" , flag = 49 , hand = 28422 },
	{ nome = "soprador2" , dict = "amb@code_human_wander_gardener_leaf_blower@idle_a" , anim = "idle_a" , prop = "prop_leaf_blower_01" , flag = 49 , hand = 28422 },
	{ nome = "soprador3" , dict = "amb@code_human_wander_gardener_leaf_blower@idle_a" , anim = "idle_b" , prop = "prop_leaf_blower_01" , flag = 49 , hand = 28422 },
	{ nome = "tragar" , anim = "WORLD_HUMAN_DRUG_DEALER" },
	{ nome = "trotar" , dict = "amb@world_human_jog_standing@male@fitidle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "esquentar" , anim = "WORLD_HUMAN_STAND_FIRE" },
	{ nome = "selfie" , dict = "cellphone@self" , anim = "selfie_in_from_text" , prop = "prop_amb_phone" , flag = 50 , hand = 28422 },
	{ nome = "selfie2" , dict = "cellphone@" , anim = "cellphone_text_read_base_cover_low" , prop = "prop_amb_phone" , flag = 50 , hand = 28422 },
	{ nome = "mecanico" , dict = "amb@world_human_vehicle_mechanic@male@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "mecanico2" , dict = "mini@repair" , anim = "fixing_a_player" , andar = false , loop = true },
	{ nome = "mecanico3" , dict = "mini@repair" , anim = "fixing_a_ped" , andar = false , loop = true },
	{ nome = "pullover" , dict = "misscarsteal3pullover" , anim = "pull_over_right" , andar = false , loop = false },
	{ nome = "airguitar" , dict = "anim@mp_player_intcelebrationfemale@air_guitar" , anim = "air_guitar" , andar = false , loop = true },
	{ nome = "airsynth" , dict = "anim@mp_player_intcelebrationfemale@air_synth" , anim = "air_synth" , andar = false , loop = true },
	{ nome = "puto" , dict = "misscarsteal4@actor" , anim = "actor_berating_loop" , andar = true , loop = true },
	{ nome = "puto2" , dict = "oddjobs@assassinate@vice@hooker" , anim = "argue_a" , andar = true , loop = true },
	{ nome = "puto3" , dict = "mini@triathlon" , anim = "want_some_of_this" , andar = false , loop = false },
	{ nome = "unhas" , dict = "anim@amb@clubhouse@bar@drink@idle_a" , anim = "idle_a_bartender" , andar = true , loop = true },
	{ nome = "mandarbeijo" , dict = "anim@mp_player_intcelebrationfemale@blow_kiss" , anim = "blow_kiss" , andar = false , loop = false },
	{ nome = "mandarbeijo2" , dict = "anim@mp_player_intselfieblow_kiss" , anim = "exit" , andar = false , loop = false },
	{ nome = "bale" , dict = "anim@mp_player_intcelebrationpaired@f_f_sarcastic" , anim = "sarcastic_left" , andar = false , loop = true },
	{ nome = "bonzao" , dict = "misscommon@response" , anim = "bring_it_on" , andar = false , loop = false },
	{ nome = "cruzarbraco" , dict = "anim@amb@nightclub@peds@" , anim = "rcmme_amanda1_stand_loop_cop" , andar = true , loop = true },
	{ nome = "cruzarbraco2" , dict = "amb@world_human_hang_out_street@female_arms_crossed@idle_a" , anim = "idle_a" , andar = true , loop = true },
	{ nome = "wtf" , dict = "anim@mp_player_intcelebrationfemale@face_palm" , anim = "face_palm" , andar = true , loop = false },
	{ nome = "wtf2" , dict = "random@car_thief@agitated@idle_a" , anim = "agitated_idle_a" , andar = true , loop = false },
	{ nome = "wtf3" , dict = "missminuteman_1ig_2" , anim = "tasered_2" , andar = true , loop = false },
	{ nome = "wtf4" , dict = "anim@mp_player_intupperface_palm" , anim = "idle_a" , andar = true , loop = false },
	{ nome = "suicidio" , dict = "mp_suicide" , anim = "pistol" , andar = false , loop = false },
	{ nome = "suicidio2" , dict = "mp_suicide" , anim = "pill" , andar = false , loop = false },
	{ nome = "lutar" , dict = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_c" , andar = false , loop = false },
	{ nome = "lutar2" , dict = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_e" , andar = false , loop = false },
	{ nome = "dedo" , dict = "anim@mp_player_intselfiethe_bird" , anim = "idle_a" , andar = false , loop = false },
	{ nome = "dedo2" , dict = "anim@mp_player_intcelebrationfemale@finger" , anim = "finger" , andar = true , loop = false },
	{ nome = "dedo3" , dict = "anim@arena@celeb@podium@no_prop@" , anim = "flip_off_a_1st" , andar = false , loop = false },
	{ nome = "mochila" , dict = "move_m@hiking" , anim = "idle" , andar = true , loop = true },
	{ nome = "exercicios" , dict = "timetable@reunited@ig_2" , anim = "jimmy_getknocked" , andar = true , loop = true },
	{ nome = "escorar" , dict = "timetable@mime@01_gc" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "escorar2" , dict = "misscarstealfinale" , anim = "packer_idle_1_trevor" , andar = false , loop = true },
	{ nome = "escorar3" , dict = "misscarstealfinalecar_5_ig_1" , anim = "waitloop_lamar" , andar = false , loop = true },
	{ nome = "escorar4" , dict = "rcmjosh2" , anim = "josh_2_intp1_base" , andar = false , loop = true },
	--[[ { nome = "meditar" , dict = "rcmcollect_paperleadinout@" , anim = "meditiate_idle" , andar = false , loop = true }, ]]
	{ nome = "meditar2" , dict = "rcmepsilonism3" , anim = "ep_3_rcm_marnie_meditating" , andar = false , loop = true },
	{ nome = "meditar3" , dict = "rcmepsilonism3" , anim = "base_loop" , andar = false , loop = true },
	{ nome = "meleca2" , dict = "anim@mp_player_intcelebrationfemale@nose_pick" , anim = "nose_pick" , andar = false , loop = false },
	{ nome = "cortaessa" , dict = "gestures@m@standing@casual" , anim = "gesture_no_way" , andar = false , loop = false },
	{ nome = "meleca3" , dict = "move_p_m_two_idles@generic" , anim = "fidget_sniff_fingers" , andar = true , loop = false },
	{ nome = "joia" , dict = "anim@mp_player_intincarthumbs_uplow@ds@" , anim = "enter" , andar = false , loop = false },
	{ nome = "joia2" , dict = "anim@mp_player_intselfiethumbs_up" , anim = "idle_a" , andar = false , loop = false },
	{ nome = "yeah" , dict = "anim@mp_player_intupperair_shagging" , anim = "idle_a" , andar = false , loop = false },
	{ nome = "assobiar" , dict = "taxi_hail" , anim = "hail_taxi" , andar = false , loop = false },
	{ nome = "carona" , dict = "random@hitch_lift" , anim = "idle_f" , andar = true , loop = false },
	{ nome = "estatua" , dict = "amb@world_human_statue@base" , anim = "base" , andar = false , loop = true },
	{ nome = "estatua2" , dict = "fra_0_int-1" , anim = "cs_lamardavis_dual-1" , andar = false , loop = true },
	{ nome = "estatua3" , dict = "club_intro2-0" , anim = "csb_englishdave_dual-0" , andar = false , loop = true },
	{ nome = "tiltado" , dict = "anim@mp_player_intcelebrationfemale@freakout" , anim = "freakout" , andar = false , loop = false },
	{ nome = "colher" , dict = "creatures@rottweiler@tricks@" , anim = "petting_franklin" , andar = false , loop = false },
	{ nome = "rastejar" , dict = "move_injured_ground" , anim = "front_loop" , andar = false , loop = true },
	{ nome = "pirueta" , dict = "anim@arena@celeb@flat@solo@no_props@" , anim = "cap_a_player_a" , andar = false , loop = false },
	{ nome = "pirueta2" , dict = "anim@arena@celeb@flat@solo@no_props@" , anim = "flip_a_player_a" , andar = false , loop = false },
	{ nome = "escorregar" , dict = "anim@arena@celeb@flat@solo@no_props@" , anim = "slide_a_player_a" , andar = false , loop = false },
	{ nome = "escorregar2" , dict = "anim@arena@celeb@flat@solo@no_props@" , anim = "slide_c_player_a" , andar = false , loop = false },
	{ nome = "gang" , dict = "mp_player_int_uppergang_sign_a" , anim = "mp_player_int_gang_sign_a" , andar = true , loop = true },
	{ nome = "gang2" , dict = "mp_player_int_uppergang_sign_b" , anim = "mp_player_int_gang_sign_b" , andar = true , loop = true },
	{ nome = "fodase" , dict = "anim@arena@celeb@podium@no_prop@" , anim = "flip_off_a_1st" , andar = false , loop = false },
	{ nome = "taco" , dict = "anim@arena@celeb@flat@solo@no_props@" , anim = "slugger_a_player_a" , andar = false , loop = false },
	{ nome = "onda" , dict = "anim@mp_player_intupperfind_the_fish" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "lutar3" , dict = "rcmextreme2" , anim = "loop_punching" , andar = true , loop = true },
	{ nome = "heroi" , dict = "rcmbarry" , anim = "base" , andar = true , loop = true },
	{ nome = "boboalegre" , dict = "rcm_barry2" , anim = "clown_idle_0" , andar = false , loop = false },
	{ nome = "boboalegre2" , dict = "rcm_barry2" , anim = "clown_idle_1" , andar = false , loop = false },
	{ nome = "boboalegre3" , dict = "rcm_barry2" , anim = "clown_idle_2" , andar = false , loop = false },
	{ nome = "boboalegre4" , dict = "rcm_barry2" , anim = "clown_idle_3" , andar = false , loop = false },
	{ nome = "boboalegre5" , dict = "rcm_barry2" , anim = "clown_idle_6" , andar = false , loop = false },
	{ nome = "meditar4" , dict = "timetable@amanda@ig_4" , anim = "ig_4_base" , andar = false , loop = true },
	{ nome = "passa" , dict = "mini@strip_club@lap_dance@ld_girl_a_approach" , anim = "ld_girl_a_approach_f" , andar = false , loop = false },	
	{ nome = "passaro" , dict = "random@peyote@bird" , anim = "wakeup" , andar = false , loop = false },
	{ nome = "coelho1", dict = "random@peyote@rabbit", anim = "wakeup", andar = false, loop = true  },
	{ nome = "coelho2", dict = "random@peyote@rabbit", anim = "wakeup_loop", andar = false, loop = true  },
	{ nome = "cachorro" , dict = "random@peyote@dog" , anim = "wakeup" , andar = false , loop = false },
	{ nome = "karate" , dict = "anim@mp_player_intcelebrationfemale@karate_chops" , anim = "karate_chops" , andar = false , loop = false },
	{ nome = "karate2" , dict = "anim@mp_player_intcelebrationmale@karate_chops" , anim = "karate_chops" , andar = false , loop = false },
	{ nome = "ameacar" , dict = "anim@mp_player_intcelebrationmale@cut_throat" , anim = "cut_throat" , andar = false , loop = false },
	{ nome = "ameacar2" , dict = "anim@mp_player_intcelebrationfemale@cut_throat" , anim = "cut_throat" , andar = false , loop = false },
	{ nome = "boxe" , dict = "anim@mp_player_intcelebrationmale@shadow_boxing" , anim = "shadow_boxing" , andar = false , loop = false },
	{ nome = "boxe2" , dict = "anim@mp_player_intcelebrationfemale@shadow_boxing" , anim = "shadow_boxing" , andar = false , loop = false },
    { nome = "mamamia" , dict = "anim@mp_player_intcelebrationmale@finger_kiss" , anim = "finger_kiss" , andar = true , loop = false },
    { nome = "louco" , dict = "anim@mp_player_intincaryou_locobodhi@ds@" , anim = "idle_a" , andar = true , loop = true },
    { nome = "xiu" , dict = "anim@mp_player_intincarshushbodhi@ds@" , anim = "idle_a_fp" , andar = true , loop = true },
	{ nome = "cruzar" , dict = "amb@world_human_cop_idles@female@idle_b" , anim = "idle_e" , andar = true , loop = true },
	{ nome = "cruzar2" , dict = "anim@amb@casino@hangout@ped_male@stand@02b@idles" , anim = "idle_a" , andar = true , loop = true },
	{ nome = "cruzar3" , dict = "amb@world_human_hang_out_street@male_c@idle_a" , anim = "idle_b" , andar = true , loop = true },
	{ nome = "cruzar4" , dict = "random@street_race" , anim = "_car_b_lookout" , andar = true , loop = true },
	{ nome = "cruzar5" , dict = "random@shop_gunstore" , anim = "_idle" , andar = true , loop = true },
	{ nome = "cruzar6" , dict = "move_m@hiking" , anim = "idle" , andar = true , loop = true },
	{ nome = "cruzar7" , dict = "anim@amb@casino@valet_scenario@pose_d@" , anim = "base_a_m_y_vinewood_01" , andar = true , loop = true },
	{ nome = "cruzar8" , dict = "anim@amb@casino@shop@ped_female@01a@base" , anim = "base" , andar = true , loop = true },
	{ nome = "cruzar9" , dict = "anim@amb@casino@valet_scenario@pose_c@" , anim = "shuffle_feet_a_m_y_vinewood_01" , andar = true , loop = true },
	{ nome = "cruzar10" , dict = "anim@amb@casino@hangout@ped_male@stand@03a@idles_convo" , anim = "idle_a" , andar = true , loop = true },
	{ nome = "fera" , dict = "anim@mp_fm_event@intro" , anim = "beast_transform" , andar = true , loop = false },
	{ nome = "render" , dict = "random@mugging3", anim = "handsup_standing_base", andar = true, loop = true },
	{ nome = "render2" , dict = "random@arrests@busted", anim = "idle_a", andar = true, loop = true },
	{ nome = "aqc" , dict = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_a" , andar = false , loop = false },
	{ nome = "aqc2" , dict = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_d" , andar = false , loop = false },
	{ nome = "inspec" , dict = "anim@deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_b" , andar = false , loop = true },
	{ nome = "inspec2" , dict = "anim@deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_c" , andar = false , loop = false },
	{ nome = "inspec3" , dict = "anim@deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_d" , andar = false , loop = false },
	{ nome = "inspec4" , dict = "anim@deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_e" , andar = false , loop = false },
	{ nome = "inspec5" , dict = "mp_deathmatch_intros@1hmale" , anim = "intro_male_1h_a_michael" , andar = false , loop = false },
	{ nome = "inspec6" , dict = "mp_deathmatch_intros@melee@1h" , anim = "intro_male_melee_1h_a" , andar = false , loop = false },
	{ nome = "inspec7" , dict = "mp_deathmatch_intros@melee@1h" , anim = "intro_male_melee_1h_b" , andar = false , loop = false },
	{ nome = "inspec8" , dict = "mp_deathmatch_intros@melee@1h" , anim = "intro_male_melee_1h_c" , andar = false , loop = false },
	{ nome = "inspec9" , dict = "mp_deathmatch_intros@melee@1h" , anim = "intro_male_melee_1h_d" , andar = false , loop = false },
	{ nome = "inspec10" , dict = "mp_deathmatch_intros@melee@1h" , anim = "intro_male_melee_1h_e" , andar = false , loop = false },
	{ nome = "inspec11" , dict = "mp_deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_a" , andar = false , loop = false },
	{ nome = "inspec12" , dict = "mp_deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_b" , andar = false , loop = false },
	{ nome = "inspec13" , dict = "mp_deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_c" , andar = false , loop = false },
	{ nome = "inspec14" , dict = "mp_deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_d" , andar = false , loop = false },
	{ nome = "inspec15" , dict = "mp_deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_e" , andar = false , loop = false },
	{ nome = "inspec16" , dict = "anim@deathmatch_intros@1hmale" , anim = "intro_male_1h_d_michael" , andar = true , loop = false },

	{ nome = "swat" , dict = "swat" , anim = "come" , andar = true , loop = false },
	{ nome = "swat2" , dict = "swat" , anim = "freeze" , andar = true , loop = false },
	{ nome = "swat3" , dict = "swat" , anim = "go_fwd" , andar = true , loop = false },
	{ nome = "swat4" , dict = "swat" , anim = "rally_point" , andar = true , loop = false },
	{ nome = "swat5" , dict = "swat" , anim = "understood" , andar = true , loop = false },
	{ nome = "swat6" , dict = "swat" , anim = "you_back" , andar = true , loop = false },
	{ nome = "swat7" , dict = "swat" , anim = "you_fwd" , andar = true , loop = false },
	{ nome = "swat8" , dict = "swat" , anim = "you_left" , andar = true , loop = false },
	{ nome = "swat9" , dict = "swat" , anim = "you_right" , andar = true , loop = false },
	{ nome = "megaphone" , dict = "anim@random@shop_clothes@watches" , anim = "base" , prop = "prop_megaphone_01" , andar = true , loop = true , flag = 49 , mao = 60309 , pos1 = 0.10 , pos2 = 0.04 , pos3 = 0.012 , pos4 = -60.0 , pos5 = 100.0 , pos6 = -30.0 , propAnim = true },
	
	{ nome = "poledance" , dict = "mini@strip_club@pole_dance@pole_dance1" , anim = "pd_dance_01" , andar = false , loop = true },
	{ nome = "poledance2" , dict = "mini@strip_club@pole_dance@pole_dance2" , anim = "pd_dance_02" , andar = false , loop = true },
	{ nome = "poledance3" , dict = "mini@strip_club@pole_dance@pole_dance3" , anim = "pd_dance_03" , andar = false , loop = true },

	-- ## FOTO ## --

	{ nome = 'foto' , dict = 'amb@lo_res_idles@' , anim ='world_human_lean_male_hands_together_lo_res_base' , andar = false , loop = true },
	{ nome = 'foto1' , dict = 'amb@code_human_cross_road@female@base' , anim ='base' , andar = false , loop = true },
	{ nome = 'foto2' , dict = 'amb@code_human_in_car_mp_actions@tit_squeeze@bodhi@rps@base' , anim ='idle_a' , andar = false , loop = true },
	{ nome = 'foto3' , dict = 'amb@world_human_hang_out_street@female_arm_side@enter' , anim ='enter' , andar = false , loop = true },
	{ nome = 'foto4' , dict = 'amb@world_human_hang_out_street@female_arm_side@idle_a' , anim ='idle_b' , andar = false , loop = true },
	{ nome = 'foto5' , dict = 'amb@world_human_hang_out_street@female_arms_crossed@idle_a' , anim ='idle_b' , andar = false , loop = true },
	{ nome = 'foto6' , dict = 'friends@' , anim ='pickupwait' , andar = false , loop = true },
	{ nome = 'foto7' , dict = 'mini@hookers_sp' , anim ='idle_reject_loop_a' , andar = false , loop = true },
	{ nome = 'foto8' , dict = 'misscarsteal2' , anim ='sweep_high' , andar = false , loop = true },
	{ nome = 'foto9' , dict = 'missheist_agency3aig_23' , anim ='urinal_base' , andar = false , loop = true },
	{ nome = 'foto10' , dict = 'misstrevor2ron_basic_moves' , anim ='idle' , andar = false , loop = true },
	{ nome = 'foto11' , dict = 'oddjobs@basejump@' , anim ='ped_a_loop' , andar = false , loop = true },
	{ nome = 'foto12' , dict = 'rcmjosh1' , anim ='idle' , andar = false , loop = true },
	{ nome = 'foto13' , dict = 'switch@franklin@plays_w_dog' , anim ='001916_01_fras_v2_9_plays_w_dog_idle' , andar = false , loop = true },
	{ nome = 'foto14' , dict = 'timetable@amanda@ig_9' , anim ='ig_9_base_amanda' , andar = false , loop = true },
	{ nome = 'foto15' , dict = 'misscommon@response' , anim ='bring_it_on' , andar = false , loop = true },
	{ nome = 'foto16' , dict = 'cover@first_person@move@base@core' , anim ='low_idle_l_facecover' , andar = false , loop = true },
	{ nome = 'foto17' , dict = 'cover@weapon@core' , anim ='idle_turn_stop' , andar = false , loop = true },
	{ nome = 'foto18' , dict = 'anim@amb@casino@hangout@ped_female@stand@02b@base' , anim ='base' , andar = false , loop = true },
	{ nome = 'foto19' , dict = 'anim@amb@casino@hangout@ped_male@stand@01a@base' , anim ='base' , andar = false , loop = true },
	{ nome = 'foto20' , dict = 'anim@amb@casino@out_of_money@ped_male@01b@base' , anim ='base' , andar = false , loop = true },
	{ nome = 'foto21' , dict = 'anim@amb@casino@shop@ped_female@01a@base' , anim ='base' , andar = false , loop = true },
	{ nome = 'foto22' , dict = 'anim@mp_corona_idles@female_c@base' , anim ='base' , andar = false , loop = true },
	{ nome = 'foto23' , dict = 'anim@random@shop_clothes@watches' , anim ='base' , andar = false , loop = true },
	{ nome = 'foto24' , dict = 'iaa_int-11' , anim ='csb_avon_dual-11' , andar = false , loop = true },
	{ nome = 'foto25' , dict = 'mini@strip_club@lap_dance@ld_girl_a_approach' , anim ='ld_girl_a_approach_f' , andar = false , loop = true },
    { nome = 'foto26' , dict = 'amb@code_human_in_car_mp_actions@rock@bodhi@rps@base' , anim ='idle_a' , andar = false , loop = true },
	{ nome = 'foto27' , dict = 'mini@hookers_spcrackhead' , anim ='idle_reject_loop_c' , andar = false , loop = true },
	{ nome = 'foto28' , dict = 'anim@mp_player_intupperfinger' , anim ='idle_a' , andar = false , loop = true },
	{ nome = 'foto29' , dict = 'switch@franklin@lamar_tagging_wall' , anim ='lamar_tagging_wall_loop_franklin' , andar = false , loop = true },
	{ nome = 'foto30' , dict = 'mp_move@prostitute@m@cokehead' , anim ='idle' , andar = false , loop = true },
	{ nome = 'foto31' , dict = 'anim@amb@casino@valet_scenario@pose_c@' , anim ='base_a_m_y_vinewood_01' , andar = false , loop = true },
	{ nome = 'foto32' , dict = 'anim@amb@casino@valet_scenario@pose_d@' , anim ='look_ahead_l_a_m_y_vinewood_01' , andar = false , loop = true },
	{ nome = 'foto33' , dict = 'anim@special_peds@casino@beth@wheel@' , anim ='action10_beth' , andar = false , loop = true },
	{ nome = 'foto34' , dict = 'anim@special_peds@casino@beth@wheel@' , anim ='action2_beth' , andar = false , loop = true },
	{ nome = 'foto35' , dict = 'anim@mp_player_intcelebrationfemale@v_sign' , anim ='v_sign' , andar = false , loop = true },
	{ nome = 'foto36' , dict = 'mini@strip_club@idles@stripper' , anim ='stripper_idle_03' , andar = false , loop = true },
	{ nome = 'foto37' , dict = 'mini@strip_club@idles@stripper' , anim ='stripper_idle_04' , andar = false , loop = true },
	{ nome = 'foto38' , dict = 'anim_heist@arcade@fortune@female@' , anim ='reaction_pondering' , andar = false , loop = true },
	{ nome = 'foto39' , dict = 'anim@mp_player_intcelebrationfemale@peace' , anim ='peace' , andar = false , loop = true },
	{ nome = 'foto40' , dict = 'missfbi3_party_d' , anim ='stand_talk_loop_b_female' , andar = false , loop = true },
	{ nome = 'foto41' , dict = 'armenian_1_int-44' , anim ='a_m_y_musclbeac_01^1_dual-44' , andar = false , loop = true },
	{ nome = 'foto42' , dict = 'mp_clothing@female@trousers' , anim ='try_trousers_positive_a' , andar = false , loop = true },
	{ nome = 'foto43' , dict = 'silj_ext-19' , anim ='mp_m_freemode_01^3_dual-19' , andar = false , loop = true },
	{ nome = 'foto44' , dict = 'sdrm_mcs_2-0' , anim ='ig_bestmen^1-0' , andar = false , loop = true },
	{ nome = 'foto45' , dict = 'anim_heist@arcade_combined@' , anim ='ped_female@_stand@_02a@_idles_convo_idle_c' , andar = false , loop = true },
	{ nome = 'foto46' , dict = 'anim@arena@celeb@flat@solo@no_props@' , anim ='thumbs_down_a_player_a' , andar = false , loop = true },
	{ nome = 'foto47' , dict = 'guard_reactions' , anim ='1hand_aiming_cycle' , andar = false , loop = true },
	{ nome = 'foto48' , dict = 'anim@move_f@waitress' , anim ='idle' , andar = false , loop = true },
	{ nome = 'foto49' , dict = 'anim_heist@arcade_combined@' , anim ='ped_female@_stand_withdrink@_01b@_base_base' , andar = false , loop = true },
	{ nome = 'foto50' , dict = 'amb@lo_res_idles@' , anim ='world_human_security_shine_torch_lo_res_base' , andar = false , loop = true },
	{ nome = 'foto51' , dict = 'rcmjosh2' , anim ='stand_lean_back_beckon_a' , andar = false , loop = true },
    { nome = 'foto52' , dict = 'rcmjosh2' , anim ='stand_lean_back_beckon_b' , andar = false , loop = true },
	{ nome = 'foto53' , dict = 'pro_mcs_7_concat-1' , anim ='cs_priest_dual-1' , andar = false , loop = true },
	{ nome = 'foto54' , dict = 'clothingshirt' , anim ='try_shirt_base' , andar = false , loop = true },
	{ nome = 'foto55' , dict = 'special_ped@pamela@trevor_1@trevor_1a' , anim ='pamela_convo_trevor_im_trying_to_get_noticed_0' , andar = false , loop = true },
    { nome = 'foto56' , dict = 'special_ped@impotent_rage@intro' , anim ='idle_intro' , andar = false , loop = true },
	{ nome = 'foto57' , dict = 'random@escape_paparazzi@standing@' , anim ='idle' , andar = false , loop = true },
	{ nome = 'foto58' , dict = 'pro_mcs_7_concat-8' , anim ='player_two_dual-8' , andar = false , loop = true },
	{ nome = 'foto59' , dict = 'anim@heists@ornate_bank@thermal_charge' , anim ='cover_eyes_loop' , andar = false , loop = true },
	{ nome = 'foto60' , dict = 'low_fun_int-7' , anim ='cs_lamardavis_dual-7' , andar = false , loop = true },
    { nome = 'foto61' , dict = 'tale_intro-12' , anim ='a_f_y_genhot_01^2_dual-12' , andar = false , loop = true },
	{ nome = 'foto62' , dict = 'amb@code_human_police_investigate@base' , anim ='base' , andar = false , loop = true },
	{ nome = 'foto63' , dict = 'anim@mp_player_intincarpeacebodhi@ds@' , anim ='enter' , andar = false , loop = true },
	{ nome = 'foto64' , dict = 'anim@mp_corona_idles@female_c@idle_a' , anim ='idle_a' , andar = false , loop = true },
	{ nome = 'foto65' , dict = 'anim@miss@low@fin@vagos@' , anim ='idle_ped07' , andar = false , loop = true },
	{ nome = 'foto66' , dict = 'oddjobs@assassinate@multi@' , anim ='idle_a_pros' , andar = false , loop = true },
	{ nome = 'foto67' , dict = 'timetable@jimmy@ig_5@base' , anim ='base' , andar = false , loop = true },
	{ nome = 'foto68' , dict = 'rcmnigel1bnmt_1b' , anim ='base_tyler' , andar = false , loop = true },
	{ nome = 'foto69' , dict = 'mp_fm_intro_cut' , anim ='world_human_standing_male_01_idle_03' , andar = false , loop = true },
	{ nome = 'foto70' , dict = 'mic_4_int-0' , anim ='a_f_y_bevhills_04-0' , andar = false , loop = true },
	{ nome = 'foto71' , dict = 'mic_4_int-0' , anim ='cs_milton_dual-0' , andar = false , loop = true },
	{ nome = 'foto72' , dict = 'cellphone@self@franklin@' , anim ='west_coast' , andar = false , loop = true },
	{ nome = 'foto73' , dict = 'anim@random@shop_clothes@watches' , anim ='idle_d' , andar = false , loop = true },
	{ nome = 'foto74' , dict = 'amb@world_human_muscle_flex@arms_in_front@idle_a' , anim ='idle_b' , andar = false , loop = true },
	{ nome = 'foto75' , dict = 'amb@world_human_prostitute@crackhooker@idle_a' , anim ='idle_c' , andar = false , loop = true },
	{ nome = 'foto76' , dict = 'amb@world_human_prostitute@hooker@base' , anim ='base' , andar = false , loop = true },
	{ nome = 'foto77' , dict = 'anim@mp_player_intupperfinger' , anim ='idle_a' , andar = false , loop = true },
	{ nome = 'foto78' , dict = 'anim@mp_player_intcelebrationmale@blow_kiss' , anim ='blow_kiss' , andar = false , loop = true },
	{ nome = 'foto79' , dict = 'anim@mp_player_intcelebrationmale@knuckle_crunch' , anim ='knuckle_crunch' , andar = false , loop = true },
	{ nome = 'foto80' , dict = 'anim@mp_player_intupperthumbs_up' , anim ='idle_a_fp' , andar = false , loop = true },
	{ nome = 'foto81' , dict = 'switch@michael@prostitute' , anim ='exit_hooker' , andar = false , loop = true },
	{ nome = 'foto82' , dict = 'mp_player_int_upperbro_love' , anim ='mp_player_int_bro_love_fp' , andar = false , loop = true },
	{ nome = 'foto83' , dict = 'hs3_arc_int-9' , anim ='csb_georginacheng_dual-9' , andar = false , loop = true },
	{ nome = 'foto84' , dict = 'armenian_1_int-0' , anim ='a_f_y_beach_01_dual-0' , andar = false , loop = true },
	{ nome = 'foto85' , dict = 'armenian_1_int-0' , anim ='a_f_y_hipster_02^2-0' , andar = false , loop = true },
	{ nome = 'foto86' , dict = 'armenian_1_int-0' , anim ='a_f_y_tourist_01^2-0' , andar = false , loop = true },
	{ nome = 'foto87' , dict = 'armenian_1_int-0' , anim ='a_m_y_beach_03-0' , andar = false , loop = true },
	{ nome = 'foto88' , dict = 'special_ped@pamela@base' , anim ='base' , andar = false , loop = true },
	{ nome = 'foto89' , dict = 'mp_fm_intro_cut' , anim ='world_human_standing_male_01_idle_01' , andar = false , loop = true },
	{ nome = 'foto90' , dict = 'amb@world_human_leaning@female@smoke@base' , anim ='base' , andar = false , loop = true },
	{ nome = 'foto91' , dict = 'amb@world_human_leaning@female@wall@back@hand_up@base' , anim ='base' , andar = false , loop = true },
	{ nome = 'foto92' , dict = 'amb@code_human_cross_road@female@base' , anim = 'base' , andar = false , loop = true },
	{ nome = 'foto93' , dict = 'anim@heists@heist_corona@single_team' , anim = 'single_team_intro_boss' , andar = false , loop = true },
	{ nome = 'foto94' , dict = 'amb@incar@male@smoking@idle_a' , anim = 'idle_b' , andar = false , loop = true },
	{ nome = 'foto95' , anim = 'idle_a' , dict  = 'anim@amb@casino@hangout@ped_male@stand@02b@idles' , andar = false , loop = true },
	{ nome = 'foto96' , anim = 'rub_neck_a_m_y_vinewood_01' , dict  = 'anim@amb@casino@valet_scenario@pose_c@' , andar = false , loop = true },
	{ nome = 'foto97' , dict = 'anim@mp_player_intuppershush' , anim = 'idle_a_fp' , andar = false , loop = true },
	{ nome = 'foto98' , anim = '_car_a_flirt_girl' , dict  = 'random@street_race' , andar = false , loop = true },
	{ nome = 'foto99' , dict = 'misshair_shop@barbers' , anim = 'keeper_base' , andar = false , loop = true },
	{ nome = 'foto100' , dict = 'cellphone@self@franklin@' , anim = 'chest_bump' , andar = false , loop = true },
    { nome = 'foto101' , dict = 'amb@world_human_leaning@male@wall@back@foot_up@aggro_react' , anim = 'aggro_react_forward_enter', andar = false , loop = true },
    { nome = 'foto102' , dict = 'martin_1_int-0' , anim = 'cs_patricia_dual-0' , andar = false , loop = true },
    { nome = 'foto103' , dict = 'mini@strip_club@lap_dance_2g@ld_2g_decline' , anim = 'ld_2g_decline_h_s2' , andar = false , loop = true },
    { nome = 'foto104' , anim = 'stripper_idle_03' , dict  = 'mini@strip_club@idles@stripper' , andar = false , loop = true },
    { nome = 'foto105' , dict = 'amb@world_human_binoculars@male@base' , anim ='base' , andar = false , loop = true },
    { nome = 'foto106' , dict = 'amb@world_human_tourist_mobile@male@base' , anim ='base' , andar = false , loop = true },
    { nome = 'foto107' , dict = 'anim@amb@board_room@whiteboard@' , anim ='read_03_amy_skater_01' , andar = false , loop = true },
    { nome = 'foto108' , dict = 'anim@heists@team_respawn@variations@variation_b_rot' , anim ='respawn_b_ped_c' , andar = false , loop = true },
	{ nome = 'foto109' , anim = 'idle_d' , dict  = 'anim@amb@casino@hangout@ped_female@stand@01a@idles' , andar = false , loop = true },
	{ nome = 'foto110' , dict = 'amb@world_human_stand_guard@male@idle_a' , anim = 'idle_a' , andar = false , loop = true },
	{ nome = 'foto111' , dict = 'amb@world_human_tourist_mobile@male@base' , anim = 'base' , andar = false , loop = true },
	{ nome = 'foto112' , dict = 'switch@michael@pharmacy' , anim = 'mics1_ig_11_loop' , andar = false , loop = true },
	{ nome = 'foto113' , dict = 'weapons@first_person@aim_idle@p_m_one@unarmed@fidgets@c' , anim = 'fidget_low_loop' , andar = false , loop = true },
	{ nome = 'foto114' , dict = 'armenian_1_int-0' , anim = 'player_one_dual-0' , andar = false , loop = true },
	{ nome = 'foto115' , dict = 'amb@world_human_bum_wash@male@low@idle_a' , anim = 'idle_a' , andar = false , loop = true },
	{ nome = 'foto116' , dict = 'anim@amb@casino@hangout@ped_male@stand_withdrink@01b@base' , anim = 'base' , andar = false , loop = true },
	{ nome = 'foto117' , dict = 'anim@move_m@trash_rc' , anim = 'aim_high_loop' , andar = false , loop = true },
	{ nome = 'foto118' , dict = 'martin_1_int-10' , anim = 'cs_patricia_dual-10' , andar = false , loop = true },
	{ nome = 'foto119' , dict = 'club_open-30' , anim = 'ig_djsolmanager_dual-30' , andar = false , loop = true },
	{ nome = 'foto120' , dict= 'anim_heist@arcade_combined@' , anim = 'ped_female@_stand@_02a@_idles_convo_idle_d' , andar = false , loop = true },
	{ nome = 'foto121' , dict= 'amb@code_human_police_investigate@base' , anim = 'base' , andar = false , loop = true },
	{ nome = 'foto122' , dict= 'amb@world_human_golf_player@male@base' , anim = 'base' , andar = false , loop = true },
	{ nome = 'foto123' , dict= 'rcmnigel1a' , anim = 'base' , andar = false , loop = true },
	{ nome = 'foto124' , dict= 'timetable@ron@ig_1' , anim = 'ig_1_base' , andar = false , loop = true },
	{ nome = 'foto125' , dict= 'anim@amb@code_human_in_car_idles@arm@generic@ds@idle_j' , anim = 'idle_lowdoor' , andar = false , loop = true },
	{ nome = 'foto126' , dict= 'club_open-0' , anim = 'cs_lazlow_2_dual-0' , andar = false , loop = true },
	{ nome = 'foto127' , dict= 'armenian_1_int-33' , anim = 'a_m_y_runner_01-33' , andar = false , loop = true },
	{ nome = 'foto128' , dict= 'armenian_1_int-33' , anim = 'ig_lamardavis_dual-33' , andar = false , loop = true },
	{ nome = 'foto129' , dict= 'armenian_1_int-3' , anim = 'a_f_y_fitness_02^5-3' , andar = false , loop = true },
	{ nome = 'foto130' , dict= 'anim@sw_sit_chill' , anim = 'sit_chill_clip' , andar = false , loop = true },
	{ nome = 'foto131' , dict= 'anim@sw_chill_pose' , anim = 'chill_pose_clip' , andar = false , loop = true },
	{ nome = 'foto132' , dict= 'mx@pose1' , anim = 'mx_animclip1' , andar = false , loop = true },
	{ nome = 'foto133' , dict= 'mx@pose2' , anim = 'mx_clippose2' , andar = false , loop = true },
	{ nome = 'foto134' , dict= 'mx@pose3' , anim = 'mx_clippose3' , andar = false , loop = true },
	{ nome = 'foto135' , dict= 'mx@pose4' , anim = 'mx_clippose4' , andar = false , loop = true },
	
	{ nome = 'foto136' , dict= 'lunyx@random@v3@pose001' , anim = 'random@v3@pose001' , andar = true , loop = true },
	{ nome = 'foto137' , dict= 'lunyx@random@v3@pose002' , anim = 'random@v3@pose002' , andar = true , loop = true },
	{ nome = 'foto138' , dict= 'lunyx@random@v3@pose003' , anim = 'random@v3@pose003' , andar = false , loop = true },
	{ nome = 'foto139' , dict= 'lunyx@random@v3@pose004' , anim = 'random@v3@pose004' , andar = false , loop = true },
	{ nome = 'foto140' , dict= 'lunyx@random@v3@pose005' , anim = 'random@v3@pose005' , andar = false , loop = true },
	{ nome = 'foto141' , dict= 'lunyx@random@v3@pose006' , anim = 'random@v3@pose006' , andar = true , loop = true },
	{ nome = 'foto142' , dict= 'lunyx@random@v3@pose007' , anim = 'random@v3@pose007' , andar = true , loop = true },
	{ nome = 'foto143' , dict= 'lunyx@random@v3@pose008' , anim = 'random@v3@pose008' , andar = true , loop = true },
	{ nome = 'foto144' , dict= 'lunyx@random@v3@pose009' , anim = 'random@v3@pose009' , andar = true , loop = true },
	{ nome = 'foto145' , dict= 'lunyx@random@v3@pose010' , anim = 'random@v3@pose010' , andar = true , loop = true },
	{ nome = 'foto146' , dict= 'lunyx@random@v3@pose011' , anim = 'random@v3@pose011' , andar = true , loop = true },
	{ nome = 'foto147' , dict= 'lunyx@random@v3@pose012' , anim = 'random@v3@pose012' , andar = true , loop = true },
	{ nome = 'foto148' , dict= 'lunyx@random@v3@pose013' , anim = 'random@v3@pose013' , andar = true , loop = true },
	{ nome = 'foto149' , dict= 'lunyx@random@v3@pose014' , anim = 'random@v3@pose014' , andar = true , loop = true },
	{ nome = 'foto150' , dict= 'lunyx@random@v3@pose015' , anim = 'random@v3@pose015' , andar = false , loop = true },
	{ nome = 'foto151' , dict= 'lunyx@random@v3@pose016' , anim = 'random@v3@pose016' , andar = false , loop = true },
	{ nome = 'foto152' , dict= 'lunyx@random@v3@pose017' , anim = 'random@v3@pose017' , andar = true , loop = true },
	{ nome = 'foto153' , dict= 'lunyx@random@v3@pose018' , anim = 'random@v3@pose018' , andar = true , loop = true },
	{ nome = 'foto154' , dict= 'lunyx@random@v3@pose019' , anim = 'random@v3@pose019' , andar = true , loop = true },
	{ nome = 'foto155' , dict= 'lunyx@random@v3@pose020' , anim = 'random@v3@pose020' , andar = false , loop = true },

	{ nome = 'foto156' , dict= 'arron@simspose1' , anim = 'simspose1' , andar = false , loop = true },
	{ nome = 'foto157' , dict= 'arron@simspose2' , anim = 'simspose2' , andar = false , loop = true },
	{ nome = 'foto158' , dict= 'arron@simspose3' , anim = 'simspose3' , andar = false , loop = true },
	{ nome = 'foto159' , dict= 'arron@simspose4' , anim = 'simspose4' , andar = false , loop = true },
	{ nome = 'foto160' , dict= 'arron@simspose5' , anim = 'simspose5' , andar = false , loop = true },

	{ nome = 'foto161' , dict= 'mggyhang1@animation' , anim = 'mggyhang1_clip' , andar = false , loop = true },
	{ nome = 'foto162' , dict= 'mggyhang2@animation' , anim = 'mggyhang2_clip' , andar = false , loop = true },
	{ nome = 'foto163' , dict= 'mggyhang3@animation' , anim = 'mggyhang3_clip' , andar = false , loop = true },

	-- ## TIKTOK ## --

	{ nome = "cayo1" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_a_f02" , andar = false , loop = true },
	{ nome = "cayo2" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_a_m01" , andar = false , loop = true },
	{ nome = "cayo3" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_a_m02" , andar = false , loop = true },
	{ nome = "cayo4" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_a_m03" , andar = false , loop = true },
	{ nome = "cayo5" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_b_f01" , andar = false , loop = true },
	{ nome = "cayo6" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_b_f02" , andar = false , loop = true },
	{ nome = "cayo7" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_b_f03" , andar = false , loop = true },
	{ nome = "cayo8" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_b_m01" , andar = false , loop = true },
	{ nome = "cayo9" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_b_m02" , andar = false , loop = true },
	{ nome = "cayo10" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_b_m03" , andar = false , loop = true },
	{ nome = "cayo11" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_c_f01" , andar = false , loop = true },
	{ nome = "cayo12" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_c_f02" , andar = false , loop = true },
	{ nome = "cayo13" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_c_f03" , andar = false , loop = true },
	{ nome = "cayo14" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_c_m01" , andar = false , loop = true },
	{ nome = "cayo15" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_c_m02" , andar = false , loop = true },
	{ nome = "cayo16" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_c_m03" , andar = false , loop = true },
	{ nome = "cayo17" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_d_f01" , andar = false , loop = true },
	{ nome = "cayo18" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_d_f02" , andar = false , loop = true },
	{ nome = "cayo19" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_d_f03" , andar = false , loop = true },
	{ nome = "cayo20" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_d_m01" , andar = false , loop = true },
	{ nome = "cayo21" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_d_m02" , andar = false , loop = true },
	{ nome = "cayo22" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_d_m03" , andar = false , loop = true },
	{ nome = "cayo23" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_e_f02" , andar = false , loop = true },
	{ nome = "cayo24" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_f_f02" , andar = false , loop = true },
	{ nome = "cayo25" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_loop_f01" , andar = false , loop = true },
	{ nome = "cayo26" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_loop_f02" , andar = false , loop = true },
	{ nome = "cayo27" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_loop_f03" , andar = false , loop = true },
	{ nome = "cayo28" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_loop_m01" , andar = false , loop = true },
	{ nome = "cayo29" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_loop_m02" , andar = false , loop = true },
	{ nome = "cayo30" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_loop_m03" , andar = false , loop = true },
	{ nome = "cayo31" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_li_f01" , andar = false , loop = true },
	{ nome = "cayo32" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_li_f02" , andar = false , loop = true },
	{ nome = "cayo33" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_li_f03" , andar = false , loop = true },
	{ nome = "cayo34" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_li_m01" , andar = false , loop = true },
	{ nome = "cayo35" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_li_m02" , andar = false , loop = true },
	{ nome = "cayo36" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_li_m03" , andar = false , loop = true },
	{ nome = "cayo37" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_mi_f01" , andar = false , loop = true },
	{ nome = "cayo38" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_mi_f02" , andar = false , loop = true },
	{ nome = "cayo39" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_mi_f03" , andar = false , loop = true },
	{ nome = "cayo40" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_mi_m01" , andar = false , loop = true },
	{ nome = "cayo41" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_mi_m02" , andar = false , loop = true },
	{ nome = "cayo42" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_mi_m03" , andar = false , loop = true },
	{ nome = "cayo43" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_si_f01" , andar = false , loop = true },
	{ nome = "cayo44" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_ti_f01" , andar = false , loop = true },
	{ nome = "cayo45" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_ti_f02" , andar = false , loop = true },
	{ nome = "cayo46" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_ti_f03" , andar = false , loop = true },
	{ nome = "cayo47" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_a_f01" , andar = false , loop = true },
	
	
	{ nome = "tiktok" , dict= "custom@crossbounce" , anim = "crossbounce" , andar = false , loop = true },
	{ nome = "tiktok1" , dict= "custom@dont_start" , anim = "dont_start" , andar = false , loop = true },
	{ nome = "tiktok2" , dict= "custom@floss" , anim = "floss" , andar = false , loop = true },
	{ nome = "tiktok3" , dict= "custom@orangejustice" , anim = "orangejustice" , andar = false , loop = true },
	{ nome = "tiktok4" , dict= "custom@renegade" , anim = "renegade" , andar = false , loop = true },
	{ nome = "tiktok5" , dict= "custom@rickroll" , anim = "rickroll" , andar = false , loop = true },
	{ nome = "tiktok6" , dict= "custom@savage" , anim = "savage" , andar = false , loop = true },
	{ nome = "tiktok7" , dict= "custom@sayso" , anim = "sayso" , andar = false , loop = true },
	{ nome = "tiktok8" , dict= "custom@take_l" , anim = "take_l" , andar = false , loop = true },
	{ nome = "tiktok9" , dict= "custom@toosie_slide" , anim = "toosie_slide" , andar = false , loop = true },
	{ nome = "tiktok10" , dict= "custom@around_the_clock" , anim = "around_the_clock" , andar = false , loop = true },
	{ nome = "tiktok11" , dict= "custom@dancemoves" , anim = "dancemoves" , andar = false , loop = true },
	{ nome = "tiktok12" , dict= "custom@disco_dance" , anim = "disco_dance" , andar = false , loop = true },
	{ nome = "tiktok13" , dict= "custom@electroshuffle_original" , anim = "electroshuffle_original" , andar = false , loop = true },
	{ nome = "tiktok14" , dict= "custom@electroshuffle" , anim = "electroshuffle" , andar = false , loop = true },
	{ nome = "tiktok15" , dict= "custom@fresh_fortnite" , anim = "fresh_fortnite" , andar = false , loop = true },
	{ nome = "tiktok16" , dict= "custom@gylphic" , anim = "gylphic" , andar = false , loop = true },
	{ nome = "tiktok17" , dict= "custom@hitit" , anim = "hitit" , andar = false , loop = true },
	{ nome = "tiktok18" , dict= "custom@in_da_party" , anim = "in_da_party" , andar = false , loop = true },
	{ nome = "tiktok19" , dict= "custom@robotdance_fortnite" , anim = "robotdance_fortnite" , andar = false , loop = true },
	{ nome = "tiktok20" , dict= "custom@frightfunk" , anim = "frightfunk" , andar = false , loop = true },
	{ nome = "tiktok21" , dict= "custom@gloss" , anim = "gloss" , andar = false , loop = true },
	{ nome = "tiktok22" , dict= "custom@last_forever" , anim = "last_forever" , andar = false , loop = true },
	{ nome = "tiktok23" , dict= "custom@smooth_moves" , anim = "smooth_moves" , andar = false , loop = true },
	{ nome = "tiktok24" , dict= "custom@bellydance2" , anim = "bellydance2" , andar = false , loop = true },
	{ nome = "tiktok25" , dict= "custom@introducing" , anim = "introducing" , andar = false , loop = true },
	{ nome = "tiktok26" , dict= "custom@footwork" , anim = "footwork" , andar = false , loop = true },
	{ nome = "tiktok27" , dict= "custom@headspin" , anim = "headspin" , andar = false , loop = true },
	{ nome = "tiktok28" , dict= "custom@hiphop_pumpup" , anim = "hiphop_pumpup" , andar = false , loop = true },
	{ nome = "tiktok29" , dict= "custom@hiphop_yeah" , anim = "hiphop_yeah" , andar = false , loop = true },
	{ nome = "tiktok30" , dict= "custom@salsatime" , anim = "salsatime" , andar = false , loop = true },
	{ nome = "tiktok31" , dict= "custom@samba" , anim = "samba" , andar = false , loop = true },
	{ nome = "tiktok32" , dict= "custom@shockdance" , anim = "shockdance" , andar = false , loop = true },
	{ nome = "tiktok33" , dict= "custom@specialdance" , anim = "specialdance" , andar = false , loop = true },
	{ nome = "tiktok34" , dict= "custom@toetwist" , anim = "toetwist" , andar = false , loop = true },
	{ nome = "tiktok35" , dict= "custom@gangnamstyle" , anim = "gangnamstyle" , andar = false , loop = true },
	{ nome = "tiktok36" , dict= "custom@armswirl" , anim = "armswirl" , andar = false , loop = true },
	{ nome = "tiktok37" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_left_up" , andar = false , loop = true },    
    { nome = "tiktok38" , dict = "anim@amb@nightclub@mini@dance@dance_paired@dance_f@" , anim = "ped_a_dance_idle" , andar = false , loop = true },    
    { nome = "tiktok39" , dict = "anim@amb@nightclub@mini@dance@dance_paired@dance_f@" , anim = "ped_b_dance_idle" , andar = false , loop = true },    
    { nome = "tiktok40" , dict = "anim@amb@nightclub@mini@dance@dance_paired@dance_h@" , anim = "ped_a_dance_idle" , andar = false , loop = true },    
    { nome = "tiktok41" , dict = "anim@amb@nightclub@mini@dance@dance_paired@dance_h@" , anim = "ped_b_dance_idle" , andar = false , loop = true },    
    { nome = "tiktok42" , dict = "anim@amb@nightclub@mini@dance@dance_paired@dance_j@" , anim = "ped_a_dance_idle" , andar = false , loop = true },    
    { nome = "tiktok43" , dict = "anim@amb@nightclub@mini@dance@dance_paired@dance_m@" , anim = "ped_a_dance_idle" , andar = false , loop = true },    
    { nome = "tiktok44" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_a_f02" , andar = false , loop = true },    
    { nome = "tiktok45" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "mi_idle_b_f02" , andar = false , loop = true },    
    { nome = "tiktok46" , dict = "anim@mp_player_intcelebrationfemale@crowd_invitation" , anim = "crowd_invitation" , andar = false , loop = true },    
    { nome = "tiktok47" , dict = "anim@mp_player_intcelebrationfemale@driver" , anim = "driver" , andar = false , loop = true },    
    { nome = "tiktok48" , dict = "anim@mp_player_intcelebrationfemale@shooting" , anim = "shooting" , andar = false , loop = true },    
    { nome = "tiktok49" , dict = "anim@mp_player_intcelebrationmale@shooting" , anim = "shooting" , andar = false , loop = true },    
    { nome = "tiktok50" , dict = "anim@mp_player_intcelebrationmale@suck_it" , anim = "suck_it" , andar = false , loop = true },    
    { nome = "tiktok51" , dict = "anim@mp_player_intuppercrowd_invitation" , anim = "idle_a" , andar = false , loop = true },    
    { nome = "tiktok52" , dict = "anim@mp_player_intuppershooting" , anim = "idle_a" , andar = false , loop = true },    
    { nome = "tiktok53" , dict = "anim@mp_player_intuppersuck_it" , anim = "idle_a" , andar = false , loop = true },    
	


	{ nome = "abracocintura" , dict = "misscarsteal2chad_goodbye" , anim = "chad_armsaround_chad" , andar = false , loop = true },
    { nome = "abracocintura2" , dict = "misscarsteal2chad_goodbye" , anim = "chad_armsaround_chad" , andar = true , loop = true },
    { nome = "abracoombro" , dict = "misscarsteal2chad_goodbye" , anim = "chad_armsaround_girl" , andar = false , loop = true },
    { nome = "abracoombro2" , dict = "misscarsteal2chad_goodbye" , anim = "chad_armsaround_girl" , andar = true , loop = true },
	{ nome = "binoculos" , dict = "amb@world_human_binoculars@male@enter" , anim = "enter" , prop = "prop_binoc_01" , flag = 50 , hand = 28422 , extra = function()
		binoculos = true
	end },
	{ nome = "pano2" , dict = "timetable@maid@cleaning_surface@base" , anim = "base" , prop = "prop_rag_01" , flag = 49 , hand = 28422 , extra = function()
		local vehicle = vRP.getNearestVehicle(7)
		if IsEntityAVehicle(vehicle) then
			TriggerEvent("progress",15000,"limpando")
			SetTimeout(15000,function()
				TriggerServerEvent("tryclean",VehToNet(vehicle))
			end)
		end
	end },
	{ nome = "camera2" , dict = "missfinale_c2mcs_1" , anim = "fin_c2_mcs_1_camman" , prop = "prop_v_cam_01" , flag = 49 , hand = 28422 , extra = function() 
        camera = true
    end },
	{ nome = "pano" , dict = "timetable@maid@cleaning_window@base" , anim = "base" , prop = "prop_rag_01" , flag = 49 , hand = 28422 , extra = function()
		local vehicle = vRP.getNearestVehicle(7)
		if IsEntityAVehicle(vehicle) then
			TriggerEvent("progress",15000,"limpando")
			SetTimeout(15000,function()
				TriggerServerEvent("tryclean",VehToNet(vehicle))
			end)
		end
	end },	
	{ nome = "bong" , dict = "anim@safehouse@bong" , anim = "bong_stage1" , prop = "prop_bong_01" , flag = 50 , hand = 60309 , extra = function() 
		if not IsPedInAnyVehicle(PlayerPedId()) then
			TriggerEvent('cancelando',true)
			TriggerEvent("progress",9000,"fumando")
			TriggerEvent("vrp_sound:source",'bong',0.5)
			SetTimeout(8700,function()
				vRP._DeletarObjeto()
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE',0.5)
			end)
			SetTimeout(9000,function()
				vRP.loadAnimSet("MOVE_M@DRUNK@VERYDRUNK")
				SetTimecycleModifier("REDMIST_blend")
				ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE",1.0)
				StartScreenEffect("DMT_flight",30000,false)
				Wait(30000)
				TriggerEvent('cancelando',false)
				SetTimecycleModifier("")
				SetTransitionTimecycleModifier("")
				StopGameplayCamShaking()
				ResetPedMovementClipset(PlayerPedId())
			end)
		end
	end }
}

RegisterNetEvent('emotes')
AddEventHandler('emotes',function(nome)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 100 then
		vRP.DeletarObjeto()
		for _,emote in pairs(animacoes) do
			if not IsPedInAnyVehicle(ped) and not emote.carros then
				if nome == emote.nome then
					if emote.extra then emote.extra() end
					if emote.pos1 then
						vRP.CarregarObjeto("","",emote.prop,emote.flag,emote.hand,emote.pos1,emote.pos2,emote.pos3,emote.pos4,emote.pos5,emote.pos6)
					elseif emote.prop then
						vRP.CarregarObjeto(emote.dict,emote.anim,emote.prop,emote.flag,emote.hand)
					elseif emote.dict then
						vRP._playAnim(emote.andar,{{emote.dict,emote.anim}},emote.loop)
					else
						vRP._playAnim(false,{task=emote.anim},false)
					end
				end
			else
				if IsPedInAnyVehicle(ped) and emote.carros then
					local vehicle = GetVehiclePedIsIn(ped,false)
					if nome == emote.nome then
						if (GetPedInVehicleSeat(vehicle,-1) == ped or GetPedInVehicleSeat(vehicle,1) == ped) and emote.nome == "sexo4" then
							vRP._playAnim(emote.andar,{{emote.dict,emote.anim}},emote.loop)
						elseif (GetPedInVehicleSeat(vehicle,0) == ped or GetPedInVehicleSeat(vehicle,2) == ped) and (emote.nome == "sexo5" or emote.nome == "sexo6") then
							vRP._playAnim(emote.andar,{{emote.dict,emote.anim}},emote.loop)
						end
					end
				end
			end
		end
	end
end)
------------------------------------------------------------------------
-- SYNC
------------------------------------------------------------------------
RegisterNetEvent('syncanim')
AddEventHandler('syncanim',function(pos)
 	local pedInFront = GetPlayerPed(GetClosestPlayer())
    local heading = GetEntityHeading(pedInFront)
    local coords = GetOffsetFromEntityInWorldCoords(pedInFront,0.0,pos,0.0)
    SetEntityHeading(PlayerPedId(),heading-180.1)
    SetEntityCoordsNoOffset(PlayerPedId(),coords.x,coords.y,coords.z,0)
end)

RegisterNetEvent('dancalouca')
AddEventHandler('dancalouca',function()
	vRP._playAnim(false, {{"special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag"}}, false)
end)

RegisterNetEvent('yoga')
AddEventHandler('yoga',function()
	vRP._playAnim(false, {{"amb@world_human_yoga@male@base", "base_a"}}, false)
end)

RegisterNetEvent('beijar')
AddEventHandler('beijar',function()
	vRP._playAnim(false, {{"mp_ped_interaction", "kisses_guy_a"}}, false)
end)

RegisterNetEvent('abracar')
AddEventHandler('abracar',function()
	vRP._playAnim(false, {{"mp_ped_interaction", "hugs_guy_a"}}, false)
end)

RegisterNetEvent('abracar2')
AddEventHandler('abracar2',function()
	vRP._playAnim(false, {{"mp_ped_interaction", "kisses_guy_b"}}, false)
end)

function GetClosestPlayer()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

function GetPlayers()
    local players = {}

    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function PtfxThis(asset)
	while not HasNamedPtfxAssetLoaded(asset) do
	  RequestNamedPtfxAsset(asset)
	  Wait(10)
	end
	UseParticleFxAssetNextCall(asset)
  end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BINOCULOS E CAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        skips = 1000
        if binoculos then
			skips = 1
            local scaleform = RequestScaleformMovie("BINOCULARS")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(10)
            end
 
            local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA",true)
            AttachCamToEntity(cam,PlayerPedId(),0.0,0.0,1.0,true)
            SetCamRot(cam,0.0,0.0,GetEntityHeading(PlayerPedId()))
            SetCamFov(cam,fov)
            RenderScriptCams(true,false,0,1,0)
 
            while binoculos and true do
                Citizen.Wait(1)
                BlockWeaponWheelThisFrame()
                local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)
                CheckInputRotation(cam,zoomvalue)
                HandleZoom(cam)
                DrawScaleformMovieFullscreen(scaleform,255,255,255,255)
            end
 
            fov = (fov_max+fov_min)*0.5
            RenderScriptCams(false,false,0,1,0)
            SetScaleformMovieAsNoLongerNeeded(scaleform)
            DestroyCam(cam,false)
            SetNightvision(false)
            SetSeethrough(false)
        end
        --[[ if IsControlJustPressed(0,38) then
            if IsEntityPlayingAnim(PlayerPedId(),"missfinale_c2mcs_1","fin_c2_mcs_1_camman",3) then
                camera = true
            end
            if camera then
                local scaleform = RequestScaleformMovie("breaking_news")
                local scaleform2 = RequestScaleformMovie("security_camera")
                while not HasScaleformMovieLoaded(scaleform) do
                    Citizen.Wait(10)
                end
                while not HasScaleformMovieLoaded(scaleform2) do
                    Citizen.Wait(10)
                end
 
                local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA",true)
                AttachCamToEntity(cam,PlayerPedId(),0.0,0.0,1.0,true)
                SetCamRot(cam,0.0,0.0,GetEntityHeading(PlayerPedId()))
                SetCamFov(cam,fov)
                RenderScriptCams(true,false,0,1,0)
 
                while camera and true do
                    Citizen.Wait(1)
                    BlockWeaponWheelThisFrame()
                    local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)
                    CheckInputRotation(cam,zoomvalue)
                    HandleZoom(cam)
                    DrawScaleformMovieFullscreen(scaleform,255,255,255,255)
                    DrawScaleformMovieFullscreen(scaleform2,255,255,255,255)
                    --Breaking("DISNEYLANDIA NEWS")
                    if IsControlJustPressed(0,38) then
                        camera = false
                    end
                end
 
                fov = (fov_max+fov_min)*0.5
                RenderScriptCams(false,false,0,1,0)
                SetScaleformMovieAsNoLongerNeeded(scaleform)
                SetScaleformMovieAsNoLongerNeeded(scaleform2)
                DestroyCam(cam,false)
                SetNightvision(false)
                SetSeethrough(false)
            end
        end ]]

		Wait(skips)
    end
end)
RegisterCommand("carregar",function(source, args)
	if not carryingBackInProgress then
		carryingBackInProgress = true
		local player = PlayerPedId()	
		lib = 'missfinale_c2mcs_1'
		anim1 = 'fin_c2_mcs_1_camman'
		lib2 = 'nm'
		anim2 = 'firemans_carry'
		distans = 0.15
		distans2 = 0.27
		height = 0.63
		spin = 0.0		
		length = 100000
		controlFlagMe = 49
		controlFlagTarget = 33
		animFlagTarget = 1
		local closestPlayer = GetClosestPlayer(3)
		target = GetPlayerServerId(closestPlayer)
		if closestPlayer ~= nil then
			--print("triggering cmg2_animations:syncSCRIPTFODIDO")
			TriggerServerEvent('cmg2_animations:syncSCRIPTFODIDO', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
		else
			print("[CMG Anim] Nenhum jogador por perto")
		end
	else
		carryingBackInProgress = false
		ClearPedSecondaryTask(GetPlayerPed(-1))
		DetachEntity(GetPlayerPed(-1), true, false)
		local closestPlayer = GetClosestPlayer(3)
		target = GetPlayerServerId(closestPlayer)
		TriggerServerEvent("cmg2_animations:stopSCRIPTFODIDO",target)
	end
end,false)

RegisterNetEvent('cmg2_animations:syncTargetSCRIPTFODIDO')
AddEventHandler('cmg2_animations:syncTargetSCRIPTFODIDO', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	carryingBackInProgress = true
	--print("triggered cmg2_animations:syncTargetSCRIPTFODIDO")
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
end)

RegisterNetEvent('cmg2_animations:syncMeSCRIPTFODIDO')
AddEventHandler('cmg2_animations:syncMeSCRIPTFODIDO', function(animationLib, animation,length,controlFlag,animFlag)
	local playerPed = GetPlayerPed(-1)
	--print("triggered cmg2_animations:syncMeSCRIPTFODIDO")
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	Wait(500)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)

	Citizen.Wait(length)
end)

RegisterNetEvent('cmg2_animations:cl_stopSCRIPTFODIDO')
AddEventHandler('cmg2_animations:cl_stopSCRIPTFODIDO', function()
	carryingBackInProgress = false
	ClearPedSecondaryTask(GetPlayerPed(-1))
	DetachEntity(GetPlayerPed(-1), true, false)
end)

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer(radius)
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
	--print("jogador mais próximo é dist: " .. tostring(closestDistance))
	if closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end

------------------------------------------------------------------------------
-- CAVALINHO
--------------------------------------------------------------------------------
local piggyBackInProgress = false

RegisterCommand("cavalinho",function(source, args)
	if not piggyBackInProgress then
		piggyBackInProgress = true
		local player = PlayerPedId()	
		lib = 'anim@arena@celeb@flat@paired@no_props@'
		anim1 = 'piggyback_c_player_a'
		anim2 = 'piggyback_c_player_b'
		distans = -0.07
		distans2 = 0.0
		height = 0.45
		spin = 0.0		
		length = 100000
		controlFlagMe = 49
		controlFlagTarget = 33
		animFlagTarget = 1
		local closestPlayer = GetClosestPlayer(3)
		target = GetPlayerServerId(closestPlayer)
		if closestPlayer ~= nil then
			--print("triggering cmg2_animations:syncSCRIPTFODIDO")
			TriggerServerEvent('cmg2_animations:syncSCRIPTFODIDO_2', closestPlayer, lib, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
		else
			print("[CMG Anim] No player nearby")
		end
	else
		piggyBackInProgress = false
		ClearPedSecondaryTask(GetPlayerPed(-1))
		DetachEntity(GetPlayerPed(-1), true, false)
		local closestPlayer = GetClosestPlayer(3)
		target = GetPlayerServerId(closestPlayer)
		TriggerServerEvent("cmg2_animations:stopSCRIPTFODIDO",target)
	end
end,false)

RegisterNetEvent('cmg2_animations:syncTargetSCRIPTFODIDO')
AddEventHandler('cmg2_animations:syncTargetSCRIPTFODIDO', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	piggyBackInProgress = true
	--print("triggered cmg2_animations:syncTargetSCRIPTFODIDO")
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
end)

RegisterNetEvent('cmg2_animations:syncMeSCRIPTFODIDO')
AddEventHandler('cmg2_animations:syncMeSCRIPTFODIDO', function(animationLib, animation,length,controlFlag,animFlag)
	local playerPed = GetPlayerPed(-1)
	--print("triggered cmg2_animations:syncMeSCRIPTFODIDO")
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	Wait(500)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)

	Citizen.Wait(length)
end)

RegisterNetEvent('cmg2_animations:cl_stopSCRIPTFODIDO')
AddEventHandler('cmg2_animations:cl_stopSCRIPTFODIDO', function()
	piggyBackInProgress = false
	ClearPedSecondaryTask(GetPlayerPed(-1))
	DetachEntity(GetPlayerPed(-1), true, false)
end)

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer(radius)
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
	--print("closest player is dist: " .. tostring(closestDistance))
	if closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end
 
RegisterNetEvent('binoculos')
AddEventHandler('binoculos',function()
    if IsEntityPlayingAnim(PlayerPedId(),"amb@world_human_binoculars@male@enter","enter",3) then
        binoculos = true
        camera = true
    else
        binoculos = false
        camera = false
    end
end)
 
function CheckInputRotation(cam,zoomvalue)
    local rightAxisX = GetDisabledControlNormal(0,220)
    local rightAxisY = GetDisabledControlNormal(0,221)
    local rotation = GetCamRot(cam,2)
    if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
        new_z = rotation.z+rightAxisX*-1.0*(8.0)*(zoomvalue+0.1)
        new_x = math.max(math.min(20.0,rotation.x+rightAxisY*-1.0*(8.0)*(zoomvalue+0.1)),-89.5)
        SetCamRot(cam,new_x,0.0,new_z,2)
    end
end
 
function HandleZoom(cam)
    if IsControlJustPressed(0,241) then
        fov = math.max(fov-10.0,fov_min)
    end
 
    if IsControlJustPressed(0,242) then
        fov = math.min(fov+10.0,fov_max)
    end
 
    local current_fov = GetCamFov(cam)
    if math.abs(fov-current_fov) < 0.1 then
        fov = current_fov
    end
    SetCamFov(cam,current_fov+(fov-current_fov)*0.05)
end
 
function Breaking(text)
    SetTextColour(255,255,255,255)
    SetTextFont(8)
    SetTextScale(1.2,1.2)
    SetTextWrap(0.0,1.0)
    SetTextCentre(false)
    SetTextDropshadow(0,0,0,0,255)
    SetTextEdge(1,0,0,0,205)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.2,0.85)
end