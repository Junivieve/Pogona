// Create the particle system
depth = 1; 
particleSystem = part_system_create();

// Create the particle emitter
particleEmitter = part_emitter_create(particleSystem);

// Define an orange color
var orangeColor = make_color_rgb(251, 169, 0); // RGB values for orange

// Define the particle type
particleType = part_type_create();
part_type_shape(particleType, pt_shape_square); // Sets the shape of the particle to square
part_type_size(particleType, 0.04, 0.02, -0.001, 0); // Sets the size of the particle (start size, end size, size change per step, size randomness)
part_type_color1(particleType, orangeColor); // Sets the color of the particle
part_type_blend(particleType, true); // Enable blending for semi-transparency (true allows blending)
part_type_speed(particleType, 0.3, 0.1, -0.01, 0.1); // Sets the speed of the particle (min speed, max speed, speed change per step, speed randomness)
part_type_direction(particleType, 0, 360, 0, 0); // Sets the direction of the particle (min direction, max direction, direction change per step, direction randomness)
part_type_life(particleType, 60, 120); // Sets the life span of the particle (min life, max life)
