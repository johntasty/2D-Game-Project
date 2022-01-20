/// @description Insert description here
// You can write your code in this editor

if (shake) 
{ 
   
   var shaking = power(shake_magnitude, 2) * shake_magnitude;
   var _camX = random_range(-shake_magnitude, shake_magnitude); 
   var _camY = random_range(-shake_magnitude, shake_magnitude);   
   view_xport[1] = _camX;
   view_yport[1] = _camY;
   //camera_set_view_angle(view_camera[1], _camX * 0.5);
	shake_time -= 1; 
   if (shake_time <= 0) 
   { 
      shake_magnitude -= shake_fade; 

      if (shake_magnitude <= 0) 
      { 
          view_xport[1] = 0;
		  view_yport[1] = 0;
		 //camera_set_view_angle(view_camera[1], 0);
         shake = false; 
      } 
   } 
}
/*if (keyboard_check(vk_control)){

	shake = true;
	shake_time = 5;
	shake_magnitude = 0.5;
	shake_fade = 0.25;
	
	
}