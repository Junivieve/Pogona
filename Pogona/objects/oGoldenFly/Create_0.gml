event_inherited()
// Create the particle system
depth = 1;
particleSystem = part_system_create_layer("Partfront",1);
depth = 2; 
// Create the particle emitter
particleEmitter = part_emitter_create(particleSystem);

// Define colors
var orangeColor = make_color_rgb(251, 169, 0); // RGB values for orange
var yellowColor = make_color_rgb(251, 162, 0); // RGB values for yellow

// Define the particle type
_p = part_type_create();
part_type_shape(_p, pt_shape_square); // Sets the shape of the particle to square
part_type_size(_p, 0.015, 0.015, 0, 0); // Sets the size of the particle
part_type_color2(_p, yellowColor, orangeColor); // Sets the color of the particle
part_type_blend(_p, true); // Enable blending for semi-transparency
part_type_alpha2(_p, 1, 0); // Sets the alpha transparency of the particle
part_type_speed(_p, 0.15, 0.2, 0, 0); // Sets the speed of the particle
part_type_direction(_p, 0, 360, 0, 0); // Sets the direction of the particle
part_type_life(_p, 60, 120); // Sets the life span of the particle
part_type_gravity(_p, 0, 270); 