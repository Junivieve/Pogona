// draw textbox
draw_sprite_stretched(sDialogueBox, 0, x-160, y, 320, 70);
// draw text

draw_setup(fTextNormal, c_black, fa_left, fa_middle);
draw_text_ext_transformed(x-140, y+16, text, stringHeight, boxWidth, 0.5, 0.5, 0);

// draw actor
draw_sprite(sPogonaDialogue, 0, 0, 0);