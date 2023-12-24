// Emit particles from a region that's twice as large
part_emitter_region(particleSystem, particleEmitter, x-8, x+8, y-8, y+8, ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(particleSystem, particleEmitter, _p, 2); // Emit 2 particles
