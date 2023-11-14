frame = 0;
image_blend = c_teal;
image_alpha = 0.5;
ghostFileName = "recording.json";

if(file_exists(ghostFileName)) {
	ghostFile = file_text_open_read(ghostFileName);
	ghostDataRoot = json_decode(file_text_read_string(ghostFile));
	
	ghostData = ghostDataRoot[? "root"];
	ghostFrames = ds_list_size(ghostData);
	ghostFile = file_text_close(ghostFile);
} else {
	instance_destroy();	
}