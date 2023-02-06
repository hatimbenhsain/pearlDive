/// @description Insert description here
// You can write your code in this editor

if(surface_exists(srf_ping))surface_free(srf_ping);
if(surface_exists(srf_pong))surface_free(srf_pong);

application_surface_draw_enable(true);