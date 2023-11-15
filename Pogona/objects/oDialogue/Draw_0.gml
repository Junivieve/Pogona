// draw textbox
draw_sprite(sTextBox, 0, x, y);
// draw text

draw_setup(fTextSmall, c_white, fa_left, fa_middle);
draw_text_ext_transformed(x, y, text, stringHeight, boxWidth, 0.5, 0.5, 0);