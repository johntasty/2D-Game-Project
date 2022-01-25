/// @description collision and shake
if (health_bar <= 0) instance_destroy();
if collision_circle(x,y,32,obj_melee_bul,false,true)
{
	var melee = collision_circle(x,y,32,obj_melee_bul,false,true);
	if (attacked == 0 )
	{
		audio_play_sound(slash_hit,1,0);
		//particles when attacked
		repeat(50) {			
				part_particles_create(obj_particle_controller.box_parts,x,y,obj_particle_controller.box_part,1);
	
			}
			
		//box shake when attacked
		shake_box = true;
		scr_boxshake(2,0.8,0.2,obj_breakable_box);
		//set box attack cooldown, hp reduction
		attacked = 1;
		health_bar -= melee.damage;
		alarm[0] = room_speed/2;
		with melee instance_destroy();
		
	}
}
if (shake_box)
{	//box shaking power
   var _camX = random_range(-shake_magnitude_box, shake_magnitude_box); 
   var _camY = random_range(-shake_magnitude_box, shake_magnitude_box);   
   x += _camX;
   y += _camY;
   
	shake_time_box -= 1; 
   if (shake_time_box <= 0) 
   { 
      shake_magnitude_box -= shake_fade_box; 

      if (shake_magnitude_box <= 0) 
      { 
          x = xprev;
		  y = yprev;
         shake_box = false; 
      } 
   } 
}