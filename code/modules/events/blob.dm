/datum/round_event_control/blob
	name = "Blob"
	typepath = /datum/round_event/blob
	weight = 5
	max_occurrences = 1
	minimal_players = 20

	earliest_start = 48000 // 1 hour 20 minutes

/datum/round_event/blob
	announceWhen	= 12
	endWhen			= 120
	var/new_rate = 2
	var/obj/effect/blob/core/Blob

/datum/round_event/blob/New(var/strength)
	..()
	if(strength)
		new_rate = strength

/datum/round_event/blob/announce()
	priority_announce("������������� ������� �������� �������� 7 �����&#255; ������������� ������, ��������� ���������� ���������� � ���������������.", "Biohazard Alert", 'sound/AI/outbreak5.ogg')


/datum/round_event/blob/start()
	var/turf/T = pick(blobstart)
	if(!T)
		return kill()
	Blob = new /obj/effect/blob/core(T, 200, null, new_rate)
	for(var/i = 1; i < rand(3, 6), i++)
		Blob.process()


/datum/round_event/blob/tick()
	if(!Blob)
		kill()
		return
	if(IsMultiple(activeFor, 3))
		Blob.process()
