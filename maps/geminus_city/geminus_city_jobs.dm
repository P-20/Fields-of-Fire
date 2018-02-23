
/datum/map/geminus_city
	allowed_jobs = list(/datum/job/tester)
	allowed_spawns = list("Colony Arrival Shuttle")

	default_spawn = "Colony Arrival Shuttle"

/datum/job/colonist
	title = "Colonist"
	total_positions = 20
	selection_color = "#000000"

	supervisors = " the Colony Mayor"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/colonist

	latejoin_at_spawnpoints = FALSE

/datum/job/innie_sympathiser
	title = "Colonist - Insurrectionist Sympathiser"
	total_positions = 5
	selection_color = "#000000"

	supervisors = " the Colony Mayor and your local insurrection contact"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/colonist/innie_sympathiser

	latejoin_at_spawnpoints = FALSE

/datum/job/insurrectionist_recruiter
	title = "Colonist - Insurrectionist Recruiter"
	total_positions = 1
	head_position = 1
	selection_color = "#000000"

	supervisors = " the Insurrection"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/colonist/innie_sympathiser

	latejoin_at_spawnpoints = FALSE

/datum/job/colonist_mayor
	title = "Mayor"
	total_positions = 1
	head_position = 1
	selection_color = "#000000"

	supervisors = " your citizens"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/mayor

	latejoin_at_spawnpoints = FALSE

/datum/job/marine
	title = "Marine"
	total_positions = 20
	selection_color = "#000000"

	supervisors = "the Marine Squad Leader"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/marine

	latejoin_at_spawnpoints = FALSE

/datum/job/marine_leader
	title = "Marine - Squad Leader"
	head_position = 1
	total_positions = 1
	selection_color = "#000000"

	supervisors = "UNSC Highcom"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/marine/leader

	latejoin_at_spawnpoints = FALSE

/datum/job/tester
	title = "Tester"
	total_positions = 20
	selection_color = "#000000"

	supervisors = "god"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/tester

	latejoin_at_spawnpoints = TRUE