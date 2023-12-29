event_inherited();
// Emit particles from a region that's twice as large
part_emitter_region(ps, pe, x-8, x+8, y-8, y+8, ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(ps, pe, _p, 1); // Emit 1 particles
part_emitter_interval(ps, pe, 10, 20, time_source_units_seconds);
