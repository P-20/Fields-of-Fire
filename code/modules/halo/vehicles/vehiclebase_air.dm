
/obj/vehicles/air
	name = "Dropship"
	desc = "A dropship."

	icon = 'code/modules/halo/shuttles/pelican.dmi'
	icon_state = "base"

	density = 1
	anchored = 1

	layer = ABOVE_HUMAN_LAYER
	plane = ABOVE_HUMAN_PLANE

	active = 0

	var/faction = null //The faction this vehicle belongs to. Setting this will restrict landing to faction-owned and civillian points only

	var/takeoff_overlay_icon_state
	var/takeoff_sound

/obj/vehicles/air/proc/takeoff_vehicle()
	active = 1
	change_elevation(2)
	visible_message("<span class = 'warning'>[name]'s engines activate, propelling them into the air.</span>")
	var/takeoff_overlay = image(icon,takeoff_overlay_icon_state)
	overlays += takeoff_overlay
	if(takeoff_sound)
		playsound(src,takeoff_sound,100,0)
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	block_entry_exit = 1

/obj/vehicles/air/proc/land_vehicle()
	active = 0
	change_elevation(-2)
	visible_message("<span class = 'warning'>[name]'s engines power down, slowly bringing them to the ground.</span>")
	if(takeoff_sound)
		playsound(src,takeoff_sound,100,0)
	pass_flags = 0
	block_entry_exit = 0
	overlays.Cut()

/obj/vehicles/air/verb/takeoff_land()
	set name = "Takeoff/Land"
	set desc = "Takeoff or land."
	set category = "Vehicle"
	set src in range(1)

	if(usr != driver)
		to_chat(usr,"<span class = 'notice'>You need to be the driver of [name] to do that!</span>")
		return
	if(active)
		land_vehicle()
	else
		takeoff_vehicle()

/obj/vehicles/air/proc/get_reachable_waypoints()
	return dropship_landing_controller.get_potential_landing_points(1,1,faction)

/obj/vehicles/air/proc/create_waypoint_list()
	var/list/landing_points_by_name = list()
	for(var/obj/O in get_reachable_waypoints())
		landing_points_by_name += O.name
	return landing_points_by_name

/obj/vehicles/air/proc/get_waypoint_from_name(var/wanted_name)
	for(var/obj/O in get_reachable_waypoints())
		if(O.name == wanted_name)
			return O
	return null

/obj/vehicles/air/proc/perform_move_sequence(var/obj/move_to_obj)
	if(isnull(move_to_obj))
		return
	var/move_to_loc = move_to_obj.loc
	loc = move_to_loc

/obj/vehicles/air/proc/proc_fly_to_waypoint()
	var/selected_landing_point = input("Choose a landing point.","Landing Point Selection","Cancel") in create_waypoint_list() + list("Cancel")
	if(selected_landing_point == "Cancel")
		return
	var/obj/selected_landing_point_obj = get_waypoint_from_name(selected_landing_point)
	perform_move_sequence(selected_landing_point_obj)

/obj/vehicles/air/verb/fly_to_waypoint()
	set name = "Fly to waypoint"
	set desc = "Fly to a waypoint. Used to traverse z-levels."
	set category = "Vehicle"
	set src in range(1)

	if(usr != driver)
		to_chat(usr,"<span class = 'notice'>You need to be the driver of [name] to do that!</span>")
		return
	if(!active)
		to_chat(usr,"<span class = 'notice'>You need to be in the air to do that!.</span>")
		return
	proc_fly_to_waypoint()