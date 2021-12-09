
var _time =  shader_get_uniform(shd_fire,"TIME");
var uiResolution =  shader_get_uniform(shd_fire,"iResolution");
var uiPosition =  shader_get_uniform(shd_fire,"iPosition");
var uFireColor =  shader_get_uniform(shd_fire,"iFireColor");

shader_set(shd_fire)
shader_set_uniform_f(_time,current_time/1000);
shader_set_uniform_f(uiResolution,sprite_width,sprite_height,0);
shader_set_uniform_f(uiPosition,x,y,0);
switch (fireColor) {
    case "red":
        shader_set_uniform_f(uFireColor,0);
        break;
	case "green":
        shader_set_uniform_f(uFireColor,1);
        break;
	case "blue":
        shader_set_uniform_f(uFireColor,2);
        break;
}
draw_self()
shader_reset();