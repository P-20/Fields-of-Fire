/*
UNSC Insurrection roundtype
*/

datum/objective/insurrection
	explanation_text = "Capture the UNSC ship or destroy it with a nuclear device."

/datum/game_mode/insurrection
	name = "Insurrection"
	config_tag = "insurrection"
	required_players = 15
	required_players_secret = 25
	required_enemies = 4
	round_description = "A UNSC ship has been dispatched to eliminate a secret Insurrection base. The insurrectionists are far from defenceless however..."
	end_on_antag_death = 1
	var/nuke_off_station = 0 //Used for tracking if the innies actually haul the nuke to the ship
	var/syndies_didnt_escape = 0 //Used for tracking if the innies got the shuttle away from the ship
	antag_tags = list(MODE_MERCENARY)

	var/obj/effect/overmapobj/innie_base

//delete all nuke disks not on a station zlevel
/datum/game_mode/insurrection/proc/check_nuke_disks()
	for(var/obj/item/weapon/disk/nuclear/N in nuke_disks)
		if(isNotStationLevel(N.z)) qdel(N)

//checks if L has a nuke disk on their person
/datum/game_mode/insurrection/proc/check_mob(mob/living/L)
	for(var/obj/item/weapon/disk/nuclear/N in nuke_disks)
		if(N.storage_depth(L) >= 0)
			return 1
	return 0

/datum/game_mode/insurrection/pre_setup()
	//load Insurrection base zlevel
	innie_base = overmap_controller.load_precreated('innie_base.dmm')
	innie_base.name = "Insurrection Asteroid Base"
	innie_base.icon = 'sector_icons.dmi'
	innie_base.icon_state = "listening_post"

	return ..()

/datum/game_mode/insurrection/declare_completion()
	if(config.objectives_disabled)
		return
	/*
	var/disk_rescued = 1
	for(var/obj/item/weapon/disk/nuclear/D in world)
		var/disk_area = get_area(D)
		if(!is_type_in_list(disk_area, centcom_areas))
			disk_rescued = 0
			break
	var/crew_evacuated = (emergency_shuttle.returned())
	*/

	if(station_was_nuked)
		feedback_set_details("round_end_result","win - insurrectionist nuke")
		world << "<FONT size = 3><B>Insurrectionist Victory!</B></FONT>"
		world << "<B>[syndicate_name()] operatives have destroyed [station_name()]!</B>"
	else
		feedback_set_details("round_end_result","lose - UNSC survived")
		world << "<FONT size = 3><B>UNSC Victory!</B></FONT>"
		world << "<B>[station_name()] has survived the counterattack by [syndicate_name()]!</B>"

	/*
	if(!disk_rescued &&  station_was_nuked && !syndies_didnt_escape)
		feedback_set_details("round_end_result","win - syndicate nuke")
		world << "<FONT size = 3><B>Mercenary Major Victory!</B></FONT>"
		world << "<B>[syndicate_name()] operatives have destroyed [station_name()]!</B>"

	else if (!disk_rescued &&  station_was_nuked && syndies_didnt_escape)
		feedback_set_details("round_end_result","halfwin - syndicate nuke - did not evacuate in time")
		world << "<FONT size = 3><B>Total Annihilation</B></FONT>"
		world << "<B>[syndicate_name()] operatives destroyed [station_name()] but did not leave the area in time and got caught in the explosion.</B> Next time, don't lose the disk!"

	else if (!disk_rescued && !station_was_nuked &&  nuke_off_station && !syndies_didnt_escape)
		feedback_set_details("round_end_result","halfwin - blew wrong station")
		world << "<FONT size = 3><B>Crew Minor Victory</B></FONT>"
		world << "<B>[syndicate_name()] operatives secured the authentication disk but blew up something that wasn't [station_name()].</B> Next time, don't lose the disk!"

	else if (!disk_rescued && !station_was_nuked &&  nuke_off_station && syndies_didnt_escape)
		feedback_set_details("round_end_result","halfwin - blew wrong station - did not evacuate in time")
		world << "<FONT size = 3><B>[syndicate_name()] operatives have earned Darwin Award!</B></FONT>"
		world << "<B>[syndicate_name()] operatives blew up something that wasn't [station_name()] and got caught in the explosion.</B> Next time, don't lose the disk!"

	else if (disk_rescued && mercs.antags_are_dead())
		feedback_set_details("round_end_result","loss - evacuation - disk secured - syndi team dead")
		world << "<FONT size = 3><B>Crew Major Victory!</B></FONT>"
		world << "<B>The Research Staff has saved the disc and killed the [syndicate_name()] Operatives</B>"

	else if ( disk_rescued                                        )
		feedback_set_details("round_end_result","loss - evacuation - disk secured")
		world << "<FONT size = 3><B>Crew Major Victory</B></FONT>"
		world << "<B>The Research Staff has saved the disc and stopped the [syndicate_name()] Operatives!</B>"

	else if (!disk_rescued && mercs.antags_are_dead())
		feedback_set_details("round_end_result","loss - evacuation - disk not secured")
		world << "<FONT size = 3><B>Mercenary Minor Victory!</B></FONT>"
		world << "<B>The Research Staff failed to secure the authentication disk but did manage to kill most of the [syndicate_name()] Operatives!</B>"

	else if (!disk_rescued && crew_evacuated)
		feedback_set_details("round_end_result","halfwin - detonation averted")
		world << "<FONT size = 3><B>Mercenary Minor Victory!</B></FONT>"
		world << "<B>[syndicate_name()] operatives recovered the abandoned authentication disk but detonation of [station_name()] was averted.</B> Next time, don't lose the disk!"

	else if (!disk_rescued && !crew_evacuated)
		feedback_set_details("round_end_result","halfwin - interrupted")
		world << "<FONT size = 3><B>Neutral Victory</B></FONT>"
		world << "<B>Round was mysteriously interrupted!</B>"
	*/

	..()
	return