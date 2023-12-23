// Emit particles from a region that's twice as large
part_emitter_region(particleSystem, particleEmitter, x-8, x+8, y-8, y+8, ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(particleSystem, particleEmitter, particleType, 4); // Emit 4 particles
