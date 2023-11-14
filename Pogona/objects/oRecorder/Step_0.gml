#region Toggle Record
if(keyboard_check_pressed(vk_f2)) {
	ghostRecord = !ghostRecord;
	
	if(!ghostRecord && ds_exists(ghostRecordList, ds_type_list)) {
		var _wrapper = ds_map_create();
		ds_map_add_list(_wrapper, "root", ghostRecordList);
		var _theLot = json_encode(_wrapper);
		
		if(file_exists("recording.json")) {
			file_delete("recording.json");
		}
		
		var _recordFile = file_text_open_write("recording.json");
		file_text_write_string(_recordFile, _theLot);
		file_text_close(_recordFile);
		ds_map_destroy(_wrapper);
	}
}
#endregion

#region Record Each Frame
	if(ghostRecord && instance_exists(oPlayer)) {
		if(!ds_exists(ghostRecordList, ds_type_list)) {
			ghostRecordFrames = 1;
			ghostRecordList = ds_list_create();
		}
		
		// record
		var _frameToRecord = ds_map_create();
		with(oPlayer) {
			_frameToRecord[? "x"] = x;
			_frameToRecord[? "y"] = y;
			_frameToRecord[? "xscale"] = image_xscale;
			_frameToRecord[? "sprite"] = sprite_index;
			_frameToRecord[? "image"] = image_index;
		}
		
		ds_list_add(ghostRecordList, _frameToRecord);
		ds_list_mark_as_map(ghostRecordList, ds_list_size(ghostRecordList)-1);
		ghostRecordFrames ++;
	}
#endregion