/datum/map/geminus_city
	base_turf_by_z = list("1" = /turf/simulated/floor/planet/dirt)

/turf/simulated/floor/pavement
	name = "Pavement"
	desc = "It's a pavement" //I think I need a better description.
	icon = 'maps/geminus_city/citymap_icons/pavement.dmi'
	icon_state = "pavement"

/turf/simulated/floor/pavement/empty
	icon_state = "pave_empty"
	dir = 2

/turf/simulated/floor/pavement/corner
	icon_state = "pave_corner"

/turf/simulated/floor/pavement/corner_invert
	icon_state = "pave_invert_corner"

/turf/simulated/floor/asteroid/planet
	initial_gas = list("oxygen" = MOLES_O2STANDARD, "nitrogen" = MOLES_N2STANDARD)
	temperature = 293.15

//Tech Floors

/turf/simulated/floor/tech
	icon = 'maps/geminus_city/citymap_icons/floors.dmi'
	icon_state = "techfloor_grid"

/turf/simulated/floor/tech/white
	icon_state = "techfloor_white"

/turf/simulated/floor/tech/orange
	icon_state = "techfloor_orangefulltwogrid"

/turf/simulated/floor/tech/gray
	icon_state = "techfloor_gray"


/turf/simulated/floor/light/tech_neon
	icon = 'maps/geminus_city/citymap_icons/floors.dmi'
	icon_state = "techfloor_neon"
	luminosity = 2
	New()
		..()
		update_icon()

/turf/simulated/floor/light/tech_neon/tech_white
	icon_state = "techfloor_neonwhte"

/turf/simulated/floor/light/tech_neon/side
	icon_state = "techfloor_lightedcorner"

/turf/simulated/floor/light/tech_neon/side_grid
	icon_state = "techfloor_lightedcorner_grid"





//| Stairs
	// - default is South, in terms of being at the top of the stairs looking down.
/turf/simulated/floor/stairs/
	name = "stairs"
	icon = 'maps/geminus_city/citymap_icons/ramps.dmi'
	icon_state = "ramptop"
/turf/simulated/floor/stairs/north
	dir = 1
	icon_state = "ramptop"
/turf/simulated/floor/stairs/east
	dir = 4
	icon_state = "ramptop"
/turf/simulated/floor/stairs/west
	dir = 8
	icon_state = "ramptop"

/turf/simulated/floor/stairs/stairsdark/
	icon_state = "rampbottom"
/turf/simulated/floor/stairs/stairsdark/north
	dir = 1
	icon_state = "rampbottom"
/turf/simulated/floor/stairs/stairsdark/east
	dir = 4
	icon_state = "rampbottom"
/turf/simulated/floor/stairs/stairsdark/west
	dir = 8
	icon_state = "rampbottom"

/turf/simulated/floor/road
	name = "Road"
	desc = "It's a road"
	icon = 'maps/geminus_city/citymap_icons/roads.dmi'
	icon_state = "road"

/turf/simulated/floor/road/empty
	icon_state = "road_empty"

/turf/simulated/floor/road/corner
	icon_state = "road_corner"

/turf/simulated/floor/road/markings
	icon_state = "road_marking"

//Disco Lights

/turf/simulated/floor/light
	name = "Light floor"
	light_range = 4
	icon = 'maps/geminus_city/citymap_icons/floorlights.dmi'
	icon_state = "light_on"



//|| Pre-set colored lights for easier mapping
/turf/simulated/floor/light/white
	icon_state = "light_on-w"

/turf/simulated/floor/light/red
	icon_state = "light_on-r"
	light_color = "#feebeb"

/turf/simulated/floor/light/green
	icon_state = "light_on-g"
	light_color = "#ebfeec"

/turf/simulated/floor/light/yellow
	icon_state = "light_on-y"
	light_color = "#fefbeb"

/turf/simulated/floor/light/blue
	icon_state = "light_on-b"
	light_color = "#ebf7fe"

/turf/simulated/floor/light/purple
	icon_state = "light_on-p"
	light_color = "#fcebfe"

// Floors: Can easily merge this into regular floor and add icon states into your main file later.

/turf/simulated/floor/decor
	name = "floor"
	icon = 'maps/geminus_city/citymap_icons/floors.dmi'

/turf/simulated/floor/planet/dirt
	name = "dirt"
	icon_state = "dirt"
	base_desc = "Soft moist, crumbly dirt... was the word moist just used?"
	icon = 'maps/geminus_city/citymap_icons/floors.dmi'

// Walls
/material/chrome
	name = "chrome"
	display_name = "Chrome"
	icon_base = "hospital"
	..()

/material/blackchrome
	name = "blackchrome"
	display_name = "Black Chrome"
	icon_base = "tech"
	..()

/turf/simulated/wall/chrome
	icon = 'maps/geminus_city/citymap_icons/walls.dmi'
	icon_state = "hospital"

/turf/simulated/wall/chrome/New(var/newloc)
	..(newloc,"chrome")


/turf/simulated/wall/tech
	icon = 'maps/geminus_city/citymap_icons/walls.dmi'
	icon_state = "tech"

/turf/simulated/wall/tech/New(var/newloc)
	..(newloc,"blackchrome")

turf/simulated/wall/wwi
	icon = 'icons/FoF/oldconcrete.dmi'
	name = "conrete wall"
	desc = "Nothing like the warm embrace of poured concrete."
	density = 1

turf/simulated/wall/wwi/bunker/toprightcorner
	icon_state = "concretecorner1"
turf/simulated/wall/wwi/bunker/topleftcorner
	icon_state = "concretecorner3"
turf/simulated/wall/wwi/bunker/bottomrightcorner
	icon_state = "concretecorner2"
turf/simulated/wall/wwi/bunker/bottomleftcorner
	icon_state = "concretecorner4"
turf/simulated/wall/wwi/bunker/intersectiondown
	icon_state = "concreteintersection1"
turf/simulated/wall/wwi/bunker/intersectionup
	icon_state = "concreteintersection2"
turf/simulated/wall/wwi/bunker/intersectionleft
	icon_state = "concreteintersection3"
turf/simulated/wall/wwi/bunker/intersectionright
	icon_state = "concreteintersection4"
turf/simulated/wall/wwi/bunker/plus
	icon_state = "concreteplus"
turf/simulated/wall/wwi/bunker/horizontal
	icon_state = "concretesegment1"
turf/simulated/wall/wwi/bunker/vertical
	icon_state = "concretesegment2"
turf/simulated/wall/wwi/bunker/rightend
	icon_state = "concreteend2"
turf/simulated/wall/wwi/bunker/leftend
	icon_state = "concreteend1"
turf/simulated/wall/wwi/bunker/topend
	icon_state = "concreteend4"
turf/simulated/wall/wwi/bunker/bottomend
	icon_state = "concreteend3"