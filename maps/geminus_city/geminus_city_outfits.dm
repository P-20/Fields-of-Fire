
/decl/hierarchy/outfit/job/marine
	name = "Marine"

	uniform = /obj/item/clothing/under/unsc/marine_fatigues
	suit = /obj/item/clothing/suit/storage/marine
	head = /obj/item/clothing/head/helmet/marine
	shoes = /obj/item/clothing/shoes/marine
	belt = /obj/item/weapon/storage/belt/marine_ammo
	l_pocket = /obj/item/device/encryptionkey/shipcom
	flags = 0

/decl/hierarchy/outfit/job/marine/leader
	name = "Marine - Squad Leader"

	head = /obj/item/clothing/head/helmet/marine/visor

	flags = 0

/decl/hierarchy/outfit/job/colonist
	name = "Colonist"

	head = null
	uniform = null
	belt = null
	shoes = /obj/item/clothing/shoes/brown
	pda_slot = slot_r_store

	flags = 0

/decl/hierarchy/outfit/job/colonist/equip_id(mob/living/carbon/human/H)
	var/obj/item/weapon/card/id/C = ..()
	C.assignment = "Colonist"
	H.set_id_info(C)

/decl/hierarchy/outfit/job/colonist/proc/equip_special(mob/living/carbon/human/H)
	if(prob(25))
		H.equip_to_slot_or_del(/obj/item/clothing/mask/innie/shemagh)
	if(prob(30))
		var/obj/item/weapon/gun/projectile/G = new /obj/item/weapon/gun/projectile/m6d_magnum
		G.ammo_magazine = new /obj/item/ammo_magazine/m127_saphp
		H.equip_to_slot_or_del(G,slot_belt)


/decl/hierarchy/outfit/job/colonist/equip_base(mob/living/carbon/human/H)

	var/random_uniform = pick(/obj/item/clothing/under/serviceoveralls,\
		/obj/item/clothing/under/frontier,\
		/obj/item/clothing/under/overalls)
	H.equip_to_slot_or_del(new random_uniform(H),slot_w_uniform)

	equip_special(H)

	. = ..()

/decl/hierarchy/outfit/job/colonist/innie_sympathiser
	name = "Insurrectionist Sympathiser"

	mask = /obj/item/clothing/mask/innie/shemagh

	l_pocket = /obj/item/ammo_magazine/m127_saphp
	l_ear = /obj/item/device/radio/headset/insurrection

/decl/hierarchy/outfit/job/colonist/innie_sympathiser/equip_special()
	return

/decl/hierarchy/outfit/job/colonist/innie_sympathiser/equip_base(mob/living/carbon/human/H)
	. = ..()

	var/obj/item/weapon/gun/projectile/G = new /obj/item/weapon/gun/projectile/m6d_magnum
	G.ammo_magazine = new /obj/item/ammo_magazine/m127_saphp
	H.equip_to_slot_or_del(G,slot_belt)

/decl/hierarchy/outfit/job/mayor
	name = "Mayor"

	uniform = /obj/item/clothing/under/blazer
	belt = /obj/item/weapon/gun/projectile/m6d_magnum
	shoes = /obj/item/clothing/shoes/black

	flags = 0

/decl/hierarchy/outfit/job/tester/brit
	name = "British Tester"

	uniform = /obj/item/clothing/under/wwi/brit
	shoes = /obj/item/clothing/shoes/british
	belt = /obj/item/weapon/gun/projectile/revolver/webley
	suit = /obj/item/clothing/suit/storage/wwi/britishcoat
	id_type = /obj/item/weapon/card/id/wwi/brittin
	l_pocket = /obj/item/weapon/storage/box/letter/brit
	l_ear = null

	flags = 0

/obj/item/clothing/suit/armor/vest/police
	name = "ballistic padding"
	desc = "GCPD shoulder and torso padding designed for bullet resistance."
	icon_state = "ertarmor_cmd"
	item_state = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 40, bullet = 35, laser = 15, energy = 15, bomb = 40, bio = 0, rad = 0)

/obj/item/clothing/under/police
	name = "police uniform"
	desc = "A black uniform worn by the GCPD."
	icon_state = "blackutility_com"
	worn_state = "blackutility_com"

/decl/hierarchy/outfit/job/tester/brit/equip_id(mob/living/carbon/human/H)
	var/obj/item/weapon/card/id/wwi/brittin/C = ..()
	C.assignment = "British Tester"
	H.set_id_info(C)

/decl/hierarchy/outfit/job/tester/germ
	name = "German Tester"

	uniform = /obj/item/clothing/under/wwi/german
	shoes = /obj/item/clothing/shoes/german
	belt = /obj/item/weapon/gun/projectile/wwi/p08
	suit = /obj/item/clothing/suit/storage/wwi/germancoat
	id_type = /obj/item/weapon/card/id/wwi/germantin
	l_pocket = /obj/item/weapon/storage/box/letter/german
	l_ear = null

	flags = 0

/decl/hierarchy/outfit/job/tester/germ/equip_id(mob/living/carbon/human/H)
	var/obj/item/weapon/card/id/wwi/germantin/C = ..()
	C.assignment = "German Tester"
	H.set_id_info(C)