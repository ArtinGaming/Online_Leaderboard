extends Node

static func check_file():
	var file = File.new()
	if file.file_exists("user://save_data.dat"):
		return true
	else:
		return false

static func save_data(first_place, second_place, third_place):
	var save_content = {
		"first_place": first_place,
		"second_place": second_place,
		"third_place": third_place
	}
	Globals.set_data(first_place, second_place, third_place)
	var file = File.new()
	file.open("user://save_data.dat", File.WRITE)
	file.store_line(to_json(save_content))
	file.close()
	
static func load_data():
	var file = File.new()
	if file.file_exists("user://save_data.dat"):
		file.open("user://save_data.dat", File.READ)
		var content = parse_json(file.get_line())
		for i in content.keys():
			if i == "first_place":
				Globals.first_place = content.get(i)
			elif i == "second_place":
				Globals.second_place = content.get(i)
			elif i == "third_place":
				Globals.third_place = content.get(i)
		file.close()
		return content
	else:
		save_data(null, null, null)
