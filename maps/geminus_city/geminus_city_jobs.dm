
/datum/map/geminus_city
	allowed_jobs = list(/datum/job/tester/brit,/datum/job/tester/germ)
	allowed_spawns = list("Colony Arrival Shuttle")

	default_spawn = "Colony Arrival Shuttle"

/datum/job/tester/brit
	title = "British Tester"
	total_positions = 20
	selection_color = "#000000"

	supervisors = "god"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/tester/brit

	latejoin_at_spawnpoints = TRUE

/datum/job/tester/germ
	title = "German Tester"
	total_positions = 20
	selection_color = "#000000"

	supervisors = "god"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/tester/germ

	latejoin_at_spawnpoints = TRUE