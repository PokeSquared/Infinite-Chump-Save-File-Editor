extends Node2D

var hands = [ ""
	,"Fingun", "Burst", "SMG", "Shotgun", "Missing Texture", 
	"Boulder", "Fireball", "Fiveshot", "Nails", "A Real Gun", 
	"Lightning Finger", "Beer", "Air Slasher", "Metal", "Fish", 
	"Flamethrower", "Hardbeam", "Cig", "Snowball", "Bow n Arrow", 
	"Blob", "Cheese", "Galaxy", "Collectors", "AutoShoot", 
	"Poison Spray", "Golden Hand", "Rocket", "Rocket Shotgun","Boomerang"
]

var hand_ids = [ ""
	,"c36954b0", "7c973ca5", "91a542cf", "d28d4410", "3058dd36", 
	"23f67ce6", "786fb0ba", "abc9074f", "f51de33c", "57aec0df", 
	"34578460", "d575ff8f", "6a022881", "8bab0a88", "b1456c3d", 
	"2d55fc58", "82344f2c", "4cffbcdc", "288830b8", "785f80e8", 
	"343f616d", "871191a4", "be664da2", "0d460d42", "27f7bb9b", 
	"0357e85c", "5e05904a", "564f4fcb", "550af349","448ec04b"
]

var ring_names = [ ""
	,"100% Accuracy", "+40% damage", "+25% ricochet", "+1 burst", 
	"25% chance to reload", "+20% crit damage", "Sets on fire", 
	"+40% explosion", "+30% reload speed", "Auto shoot", 
	"-30% mana cost", "+50% projectile home", "+15% freeze", 
	"Double projectile size", "+20% auto crit", "+2 splitshot", 
	"+200% projectile speed", "Projectile to hitscan", "+20% firerate", 
	"2x every 5th hit", "Shoot through enemies"
]

var ring_ids = [ ""
	,"c0532b41", "cd483636", "ad35af6b", "3e1d6b48", 
	"87ffdfe5", "5fd89d9c", "0998478a", "db8e77b1", 
	"a0a75506", "be96c7c2", "bcaece22", "446982cc", 
	"4faab3b1", "3bcd327a", "9e33112e", "bc9d541f", 
	"46722576", "714cf96d", "a1c1a6ec", "2fc7ca1a", 
    "36e896e1"
]

var perk_names = [
	"-0.5 cooldown", "+15% explosion size", "Crits +10% damage", 
	"+15% while sliding", "+25% fire damage", "Exploding Kicks", 
	"Ability Damage +25%", "+50% health orb rate", "+15% when > 15m", 
	"Double Heal on hit", "+20% mana regen", "Bad Smell", 
	"Extra Jump", "+1 Ability Charge", "+15% while < 7.5m", 
    "2nd explosion"
]

var perk_ids = [
	"7277e24e", "8d5b5598", "9cffc543", 
	"b303a82e", "c20ba510", "f1b31f26", 
	"c128c090", "47a87c23", "00f60e72", 
	"d5944965", "9b01a376", "4b118106", 
	"1302348c", "60e9888b", "", 
    "7e709520"
]

var stages = ["Starting","Forest","Desert","Supermarket","Dungeon"]

var base = '''{"Seed":%seed,"Health":250,"MaxHealth":250,"Hand1ID":"%hand1","Hand1IsRare":%dh1,"Hand2ID":"%hand2","Hand2IsRare":%dh2,"Hand3ID":"%hand3","Hand3IsRare":%dh3,"Hand4ID":"%hand4","Hand4IsRare":%dh4,"Hand1RingIDs":["%h1r1","%h1r2","%h1r3","%h1r4","%h1r5"],"Hand2RingIDs":["%h2r1","%h2r2","%h2r3","%h2r4","%h2r5"],"Hand3RingIDs":["%h3r1","%h3r2","%h3r3","%h3r4","%h3r5"],"Hand4RingIDs":["%h4r1","%h4r2","%h4r3","%h4r4","%h4r5"],"Scene":"%level Level","SoulCount":%souls,"PassiveItemIDs":%passive,"PlayerLevel":1,"PlayerXP":0,"PlayerXPTotal":0,"PlayerSpeed":%speed,"RunData":{"LevelCount":0,"KillCount":0,"CoinCount":0,"TotalTime":0,"TotalSpeedrunTime":0,"InfiniteRoundsCount":0,"AddedMeleeDamage":%melee,"AddedMeleeDamagePercent":0.0,"AddedAbilityDamagePercent":%ability,"ReducedReloadDurationPercent":%reload}}'''
var base_template = base

var filedir = ""

var perks = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var file = FileAccess.open("user://data.txt",FileAccess.READ)
	
	if file:
		filedir = file.get_as_text()
		file.close()
	else:
		print("File failed to Open or Create")
	
	if len(filedir) > 0:
		$"MAKE FILE".disabled = false
	
	$SEED.text = str(randi() - ((2**32) / 2))
	
	for x in hands:
		$"hand 1/HAND1".add_item(x)
		$"hand 2/HAND1".add_item(x)
		$"hand 3/HAND1".add_item(x)
		$"hand 4/HAND1".add_item(x)
		
	for x in ring_names:
		$"hand 1/H1R1".add_item(x)
		$"hand 1/H1R2".add_item(x)
		$"hand 1/H1R3".add_item(x)
		$"hand 1/H1R4".add_item(x)
		$"hand 1/H1R5".add_item(x)
		
		$"hand 2/H1R1".add_item(x)
		$"hand 2/H1R2".add_item(x)
		$"hand 2/H1R3".add_item(x)
		$"hand 2/H1R4".add_item(x)
		$"hand 2/H1R5".add_item(x)
		
		$"hand 3/H1R1".add_item(x)
		$"hand 3/H1R2".add_item(x)
		$"hand 3/H1R3".add_item(x)
		$"hand 3/H1R4".add_item(x)
		$"hand 3/H1R5".add_item(x)
		
		$"hand 4/H1R1".add_item(x)
		$"hand 4/H1R2".add_item(x)
		$"hand 4/H1R3".add_item(x)
		$"hand 4/H1R4".add_item(x)
		$"hand 4/H1R5".add_item(x)
		
	for x in perk_names:
		$UpgradeList.add_item(x)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_add_pressed() -> void:
	perks.append(perk_ids[$UpgradeList.selected])
	
	var label = Label.new()
	
	label.text = $UpgradeList.get_item_text($UpgradeList.selected)
	
	get_node("ScrollContainer/VBOX").add_child(label)


func _on_remove_pressed() -> void:
	perks.pop_back()
	
	if len(get_node("ScrollContainer/VBOX").get_children()) > 0:
		get_node("ScrollContainer/VBOX").get_child( get_node("ScrollContainer/VBOX").get_child_count() -1).queue_free()


func _on_random_pressed() -> void:
	$SEED.text = str(randi() - ((2**32) / 2))


func _on_make_file_pressed() -> void:
	base = base.replace("%seed",$SEED.text)
	base = base.replace("%level",stages[$STAGE.selected])
	
	if $PLAYERSPEED.text == "":
		base = base.replace("%speed",$PLAYERSPEED.placeholder_text)
	else:
		base = base.replace("%speed",$PLAYERSPEED.text)
	
	if $MELEE.text == "":
		base = base.replace("%melee",$MELEE.placeholder_text)
	else:
		base = base.replace("%melee",$MELEE.text)
	
	if $ABILITY.text == "":
		base = base.replace("%ability",$ABILITY.placeholder_text)
	else:
		base = base.replace("%ability",str(float($ABILITY.text) / 100))
		
	if $RELOAD.text == "":
		base = base.replace("%reload",$RELOAD.placeholder_text)
	else:
		base = base.replace("%reload",str(float($RELOAD.text) / 100))
	
	if $SOULS.text == "":
		base = base.replace("%souls",$SOULS.placeholder_text)
	else:
		base = base.replace("%souls",$SOULS.text)

	base = base.replace("%hand1",hand_ids[$"hand 1/HAND1".selected])
	base = base.replace("%hand2",hand_ids[$"hand 2/HAND1".selected])
	base = base.replace("%hand3",hand_ids[$"hand 3/HAND1".selected])
	base = base.replace("%hand4",hand_ids[$"hand 4/HAND1".selected])
	
	base = base.replace("%dh1",str($"hand 1/HAND1Toggle".button_pressed))
	base = base.replace("%dh2",str($"hand 2/HAND1Toggle".button_pressed))
	base = base.replace("%dh3",str($"hand 3/HAND1Toggle".button_pressed))
	base = base.replace("%dh4",str($"hand 4/HAND1Toggle".button_pressed))
	
	base = base.replace("%h1r1",ring_ids[$"hand 1/H1R1".selected])
	base = base.replace("%h1r2",ring_ids[$"hand 1/H1R2".selected])
	base = base.replace("%h1r3",ring_ids[$"hand 1/H1R3".selected])
	base = base.replace("%h1r4",ring_ids[$"hand 1/H1R4".selected])
	base = base.replace("%h1r5",ring_ids[$"hand 1/H1R5".selected])
	
	base = base.replace("%h2r1",ring_ids[$"hand 2/H1R1".selected])
	base = base.replace("%h2r2",ring_ids[$"hand 2/H1R2".selected])
	base = base.replace("%h2r3",ring_ids[$"hand 2/H1R3".selected])
	base = base.replace("%h2r4",ring_ids[$"hand 2/H1R4".selected])
	base = base.replace("%h2r5",ring_ids[$"hand 2/H1R5".selected])
	
	base = base.replace("%h3r1",ring_ids[$"hand 3/H1R1".selected])
	base = base.replace("%h3r2",ring_ids[$"hand 3/H1R2".selected])
	base = base.replace("%h3r3",ring_ids[$"hand 3/H1R3".selected])
	base = base.replace("%h3r4",ring_ids[$"hand 3/H1R4".selected])
	base = base.replace("%h3r5",ring_ids[$"hand 3/H1R5".selected])
	
	base = base.replace("%h4r1",ring_ids[$"hand 4/H1R1".selected])
	base = base.replace("%h4r2",ring_ids[$"hand 4/H1R2".selected])
	base = base.replace("%h4r3",ring_ids[$"hand 4/H1R3".selected])
	base = base.replace("%h4r4",ring_ids[$"hand 4/H1R4".selected])
	base = base.replace("%h4r5",ring_ids[$"hand 4/H1R5".selected])
	
	base = base.replace("%passive",str(perks))
	
	var path = filedir + "/run.save"
	
	var file = FileAccess.open(path,FileAccess.WRITE)
	
	if file:
		file.store_string(base)
		file.close()
	else:
		print("File failed to Open or Create")
		
	base = base_template


func _on_set_dir_pressed() -> void:
	$FileDialog.visible = true


func _on_file_dialog_dir_selected(dir: String) -> void:
	$"MAKE FILE".disabled = false
	filedir = dir
	
	var file = FileAccess.open("user://data.txt",FileAccess.WRITE)
	
	if file:
		file.store_string(dir)
		file.close()
	else:
		print("File failed to Open or Create")


func _on_import_pressed() -> void:
	$FileDialog2.visible = true


func _on_file_dialog_2_file_selected(path: String) -> void:
	var file = FileAccess.open(path,FileAccess.READ)
	var text = ""
	
	if file:
		text = file.get_as_text()
		file.close()
	else:
		print("File failed to Open or Create")
		
	var data = JSON.parse_string(text)
	
	$SEED.text = str(data["Seed"])
	$STAGE.select(stages.find(data["Scene"].replace(" Level","")))
	$PLAYERSPEED.text = str(data["PlayerSpeed"])
	$MELEE.text = str(data["RunData"]["AddedMeleeDamage"])
	$ABILITY.text = str(data["RunData"]["AddedAbilityDamagePercent"] * 100)
	$RELOAD.text = str(data["RunData"]["ReducedReloadDurationPercent"] * 100)
	$SOULS.text = str(data["SoulCount"])
	
	$"hand 1/HAND1".select(hand_ids.find(data["Hand1ID"]))
	$"hand 2/HAND1".select(hand_ids.find(data["Hand2ID"]))
	$"hand 3/HAND1".select(hand_ids.find(data["Hand3ID"]))
	$"hand 4/HAND1".select(hand_ids.find(data["Hand4ID"]))
	
	$"hand 1/HAND1Toggle".button_pressed = data["Hand1IsRare"]
	$"hand 2/HAND1Toggle".button_pressed = data["Hand2IsRare"]
	$"hand 3/HAND1Toggle".button_pressed = data["Hand3IsRare"]
	$"hand 4/HAND1Toggle".button_pressed = data["Hand4IsRare"]
	
	$"hand 1/H1R1".select(ring_ids.find(data["Hand1RingIDs"][0]))
	$"hand 1/H1R2".select(ring_ids.find(data["Hand1RingIDs"][1]))
	$"hand 1/H1R3".select(ring_ids.find(data["Hand1RingIDs"][2]))
	$"hand 1/H1R4".select(ring_ids.find(data["Hand1RingIDs"][3]))
	$"hand 1/H1R5".select(ring_ids.find(data["Hand1RingIDs"][4]))
	
	$"hand 2/H1R1".select(ring_ids.find(data["Hand2RingIDs"][0]))
	$"hand 2/H1R2".select(ring_ids.find(data["Hand2RingIDs"][1]))
	$"hand 2/H1R3".select(ring_ids.find(data["Hand2RingIDs"][2]))
	$"hand 2/H1R4".select(ring_ids.find(data["Hand2RingIDs"][3]))
	$"hand 2/H1R5".select(ring_ids.find(data["Hand2RingIDs"][4]))
	
	$"hand 3/H1R1".select(ring_ids.find(data["Hand3RingIDs"][0]))
	$"hand 3/H1R2".select(ring_ids.find(data["Hand3RingIDs"][1]))
	$"hand 3/H1R3".select(ring_ids.find(data["Hand3RingIDs"][2]))
	$"hand 3/H1R4".select(ring_ids.find(data["Hand3RingIDs"][3]))
	$"hand 3/H1R5".select(ring_ids.find(data["Hand3RingIDs"][4]))
	
	$"hand 4/H1R1".select(ring_ids.find(data["Hand4RingIDs"][0]))
	$"hand 4/H1R2".select(ring_ids.find(data["Hand4RingIDs"][1]))
	$"hand 4/H1R3".select(ring_ids.find(data["Hand4RingIDs"][2]))
	$"hand 4/H1R4".select(ring_ids.find(data["Hand4RingIDs"][3]))
	$"hand 4/H1R5".select(ring_ids.find(data["Hand4RingIDs"][4]))
	
	
	
	
	
	
	
	
	
	
	
	perks = data["PassiveItemIDs"]
	
	for x in get_node("ScrollContainer/VBOX").get_children():
		x.queue_free()
	
	for x in perks:
		var label = Label.new()
	
		label.text = perk_names[perk_ids.find(x)]
		
		get_node("ScrollContainer/VBOX").add_child(label)
