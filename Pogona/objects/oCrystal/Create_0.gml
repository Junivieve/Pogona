on = false;

event_inherited()
// Create the particle system
ps = part_system_create_layer("Partfront",1);
// Create the particle emitter
pe = part_emitter_create(ps);


// Define colors
var darkredColor = make_color_rgb(79, 30, 30); // RGB values for darkred
var redColor = make_color_rgb(165, 48, 48); // RGB values for red

// Define the particle type
_p = part_type_create();
part_type_shape(_p, pt_shape_square); // Sets the shape of the particle to square
part_type_size(_p, 0.03, 0.03, -0.0001, 0); // Sets the size of the particle
part_type_color2(_p, redColor, darkredColor); // Sets the color of the particle
part_type_blend(_p, true); // Enable blending for semi-transparency
part_type_alpha2(_p, 1, 0); // Sets the alpha transparency of the particle
part_type_speed(_p, 0.15, 0.2, -0.0001, 0); // Sets the speed of the particle
part_type_direction(_p, 0, 360, 0, 0); // Sets the direction of the particle
part_type_life(_p, 0, 260); // Sets the life span of the particle
part_type_gravity(_p, 0, 270); 
