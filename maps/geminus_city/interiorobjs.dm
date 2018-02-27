// Contains:
// Gavel Hammer
// Gavel Block

/obj/item/weapon/gavelhammer
	name = "gavel hammer"
	desc = "Order, order! No bombs in my courthouse."
	icon = 'maps/geminus_city/citymap_icons/items.dmi'
	icon_state = "gavelhammer"
	force = 5
	throwforce = 6
	w_class = 2
	attack_verb = list("bashed", "battered", "judged", "whacked")
//	burn_state = 0 //Burnable



/obj/item/weapon/gavelblock
	name = "gavel block"
	desc = "Smack it with a gavel hammer when the civilians get rowdy."
	icon = 'maps/geminus_city/citymap_icons/items.dmi'
	icon_state = "gavelblock"
	force = 2
	throwforce = 2
	w_class = 1
//	burn_state = 0 //Burnable

/obj/item/weapon/gavelblock/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weapon/gavelhammer))
		playsound(loc, 'maps/geminus_city/citymap_sounds/gavel.ogg', 100, 1)
		user.visible_message("<span class='warning'>[user] strikes \the [src] with \the [I].</span>")

	else
		return


/obj/item/weapon/deskbell
	name = "desk bell"
	desc = "An annoying bell. Ring for service."
	icon = 'maps/geminus_city/citymap_icons/objects.dmi'
	icon_state = "deskbell"
	force = 2
	throwforce = 2
	w_class = 2.0
	attack_verb = list("annoyed")


/obj/item/weapon/deskbell/attack(mob/target as mob, mob/living/user as mob)
	playsound(loc, 'maps/geminus_city/citymap_sounds/deskbell.ogg', 100, 1, -1)
	..()

/obj/item/weapon/deskbell/attack_hand(mob/user as mob)
	if (ishuman(user))
		var/mob/living/carbon/human/H = user
		var/obj/item/organ/external/temp = H.organs_by_name["r_hand"]
		if (H.hand)
			temp = H.organs_by_name["l_hand"]
		if(temp && !temp.is_usable())
			to_chat(H,"<span class='notice'>You try to move your [temp.name], but cannot!</span>")
			return

	if(user.a_intent == "hurt")
		playsound(user.loc, 'maps/geminus_city/citymap_sounds/deskbell_rude.ogg', 50, 1)
	else
		playsound(user.loc, 'maps/geminus_city/citymap_sounds/deskbell.ogg', 50, 1)

	add_fingerprint(user)
	return


/obj/item/weapon/deskbell/attackby(obj/item/i as obj, mob/user as mob, params)
	if(!istype(i))
		return
	playsound(user.loc, 'maps/geminus_city/citymap_sounds/deskbell.ogg', 50, 1)

/obj/structure/closet/wardrobe/police
	name = "GCPD locker"
	icon_state = "black"
	icon_closed = "black"

/obj/structure/closet/wardrobe/police/New()
	..()
	new /obj/item/clothing/head/soft/sec/corp(src)
	new /obj/item/clothing/under/police(src)
	new /obj/item/clothing/suit/armor/vest/police(src)
	new /obj/item/weapon/storage/belt/security(src)
	new /obj/item/clothing/shoes/dutyboots(src)
	new /obj/item/clothing/gloves/guards(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/device/flash(src)
	new /obj/item/weapon/grenade/chem_grenade/teargas(src)
	new /obj/item/weapon/grenade/flashbang(src)
	new /obj/item/weapon/melee/telebaton(src)
	new /obj/item/taperoll/police(src)
	new /obj/item/device/holowarrant(src)
	new /obj/item/ammo_box/shotgun/beanbag(src)
	new /obj/item/ammo_box/shotgun/flash(src)
	new /obj/item/clothing/accessory/badge/security(src)
	new /obj/item/device/flashlight/glowstick/yellow(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/ammo_magazine/m127_saphp(src)
	new /obj/item/weapon/gun/projectile/m6c_magnum_s(src)
	new /obj/item/clothing/accessory/holster/thigh(src)
	return

/obj/item/weapon/coin/req
	icon = 'icons/FoF/misc.dmi'
	name = "Requisition Receipt"
	desc = "Insert this voucher into the dispenser to recieve a loadout."
	icon_state = "paper_words"

/obj/item/wwi/transit
	icon = 'icons/FoF/misc.dmi'
	icon_state = "lettercase_f"
	name = "Transportation Receipt"
	desc = "A voucher used to board the train and go to war. Make sure you have everything before using this."
	w_class = ITEM_SIZE_TINY
	var/teleport
	var/turf/teleport_spot

/obj/item/wwi/transit/proc/search_compatible_points()
	var/list/valid_points = list()
	for(var/obj/effect/landmark/wakeup/t in world)
		valid_points += t
	teleport_spot = pick(valid_points)

/obj/item/wwi/transit/proc/calculate_point()
	var/list/valid_points = list()
	if(!teleport_spot)
		search_compatible_points()
	for(var/turf/t in view(teleport_spot,2))
		if(istype(t,/turf/simulated/floor))
			valid_points += t
		if(istype(t,/turf/unsimulated/floor))
			valid_points += t
	if(isnull(valid_points))
		return
	return pick(valid_points)

/obj/item/wwi/transit/attack_self(mob/user as mob)
	teleport_spot = calculate_point()
	teleport = 1
	if(teleport)
		user.forceMove(teleport_spot)
	qdel(src)

/obj/item/wwi/transit/brit

/obj/item/wwi/transit/brit/search_compatible_points()
	var/list/valid_points = list()
	for(var/obj/effect/landmark/wakeup/brit/t in world)
		valid_points += t
	teleport_spot = pick(valid_points)

/obj/item/wwi/transit/german

/obj/item/wwi/transit/german/search_compatible_points()
	var/list/valid_points = list()
	for(var/obj/effect/landmark/wakeup/german/t in world)
		valid_points += t
	teleport_spot = pick(valid_points)

/obj/effect/landmark/wakeup
	name = "Wake Up Point"
	invisibility = 101

/obj/effect/landmark/wakeup/german

/obj/effect/landmark/wakeup/brit

/obj/item/device/whistle
	name = "whistle"
	desc = "Used by officers to send their soldiers into yet another reckless assault. Tell your chaplain to prepare coffins before using this."
	icon_state = "whistle"
	item_state = "flashbang"	//looks exactly like a flash (and nothing like a flashbang)
	w_class = 1.0
	flags = CONDUCT

	var/spamcheck = 0

obj/item/device/whistle/attack_self(mob/living/carbon/user as mob)
	if (spamcheck)
		return

	playsound(get_turf(src), 'sound/weapons/whistle.ogg', 100, 1, vary = 0)
	user.audible_message("<span class='warning'>[user] whistles into his [name]! OVER THE TOP, BOYS!</span>")
	spamcheck = 1
	spawn(50)
		spamcheck = 0