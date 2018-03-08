
/datum/map/geminus_city
	allowed_jobs = list(/datum/job/britsoldier,/datum/job/germknight,/datum/job/frenchsoldier,/datum/job/britknight)
	allowed_spawns = list("Colony Arrival Shuttle")

	default_spawn = "Colony Arrival Shuttle"

/datum/job/britsoldier
	title = "British Soldier"
	total_positions = -1
	selection_color = "#000000"

	supervisors = "god"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/britsoldier

	latejoin_at_spawnpoints = TRUE

/datum/job/germknight
	title = "German Knight"
	total_positions = 5
	selection_color = "#000000"

	supervisors = "god"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/germknight

	latejoin_at_spawnpoints = TRUE

/datum/job/frenchsoldier
	title = "French Soldier"
	total_positions = -1
	selection_color = "#000000"

	supervisors = "god"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/frenchsoldier

	latejoin_at_spawnpoints = TRUE

/datum/job/britknight
	title = "British Knight"
	total_positions = 5
	selection_color = "#000000"

	supervisors = "god"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/britknight

	latejoin_at_spawnpoints = TRUE