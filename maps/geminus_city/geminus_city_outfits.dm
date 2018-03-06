/*
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
*/

/decl/hierarchy/outfit/job/tester/brit
	name = "British Tester"

	uniform = /obj/item/clothing/under/wwi/brit
	shoes = /obj/item/clothing/shoes/british
	id_type = /obj/item/weapon/card/id/wwi/brittin
	l_pocket = /obj/item/weapon/storage/box/letter/brit
	l_ear = null
	belt = null
	pda_slot = null

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
	name = "German Knight Tester"

	uniform = /obj/item/clothing/under/wwi/german
	shoes = /obj/item/clothing/shoes/germanarmor
	suit = /obj/item/clothing/suit/storage/wwi/germanarmor
	id_type = /obj/item/weapon/card/id/wwi/germantin
	l_pocket = /obj/item/weapon/storage/box/letter/german
	l_ear = null
	belt = null
	head = /obj/item/clothing/head/helmet/germanarmor
	gloves = /obj/item/clothing/gloves/thick/germanarmor

	flags = 0

/decl/hierarchy/outfit/job/tester/germ/equip_id(mob/living/carbon/human/H)
	var/obj/item/weapon/card/id/wwi/germantin/C = ..()
	C.assignment = "German Knight Tester"
	H.set_id_info(C)