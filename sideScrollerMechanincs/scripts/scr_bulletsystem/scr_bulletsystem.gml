function bul_type() constructor
{
	sprite_index = -1;
	image_index = 0;
	image_speed = 0;
	image_angle =0;
	image_xscale = 1;
	image_yscale = 1;
	image_blend = c_white;
	image_alpha = 1;
	visible = true;
	
	scale_speed_x = 0;
	scale_speed_y = 0; 
	
	friction = 0;
	
	radial = false;
	radial_number = 0;
	radial_cutoff = 360;
	
	flamethrower = false;
	
	life = -1;
	damage = 0;
	
	static bul_type_set_attributes = function(o)
	{
		o.sprite_index  = sprite_index;
		o.image_index  = image_index;
		o.image_speed  = image_speed;		
		o.image_xscale  = image_xscale;
		o.image_yscale  = image_yscale;
		o.image_alpha  = image_alpha;
		o.image_blend  = image_blend;
		o.visible = visible;
		
		o.life = life;
		o.damage = damage;
		o.scale_speed_x = scale_speed_x;
		o.scale_speed_y = scale_speed_y;
		
	}
}

function bul_type_set_life(ind, l)
{
	///@func bul_type_set_life(bullet_id, life_amount)
	ind.life = l;
}
function bul_type_set_sprite(ind, spr, idx, spd, vis)
{
	///@func bul_type_set_sprite (bullet_id, sprite_index_ image_index, image_speed)
	ind.sprite_index = spr;
	ind.image_index = idx;
	ind.image_speed = spd;
	ind.visible = vis;
}
function bul_type_set_scale (ind, xs, ys, xsi, ysi)
{
	///@func bul_type_set_scale(bullet_id, xscale, yscale, xscale_incr, yscale_incr)
	ind.image_xscale = xs;
	ind.image_yscale = ys;
	ind.scale_speed_x = xsi;
	ind.scale_speed_y = ysi;
}
function bul_type_set_alpha (ind, alpha)
{
	///@func byl_type_set_alpha(bullet_id, alpha)
	ind.image_alpha = alpha;
}
function bul_type_set_color (ind, color)
{
	///@func bul_type_set_color(bullet_id, color)
	ind.image_blend = color;
}
function bul_type_set_radial (ind, num, co, tf)
{
	///@func bul_type_set_radial(bullet_id,instance_number, cutoff_angle, enabled)
	ind.radial = tf;
	ind.radial_number = num;
	ind.radial_cutoff = co;
}
function bul_type_set_flame (ind,tf)
{
	ind.flamethrower = tf;
}
function bul_type_set_damage (ind, dam)
{
	///@func bul_type_set_damage (bullet_id, damage_amount)
	ind.damage= dam;
}
function bul_type_set_friction (ind, fric)
{
	///@func bul_type_set_friction(bullet_id, friction)
	ind.friction = fric;
}


function bul_type_create(ind, _x, _y, dir, spd)
{
	///@func bul_type_create(bullet_id, x, y, direction, speed)
	var ret = noone;
	var bullet_object= obj_bullet;
	//create radial bullets
	if(ind.radial)
	{
		var adiv = ind.radial_cutoff / (ind.radial_number -1);
		var sdir = dir + (ind.radial_cutoff * 0.5);
		for(var i = 0; i<ind.radial_number; i++)
		{
			var d = sdir - (i * adiv);
			var xx = _x + lengthdir_x(sprite_get_width(ind.sprite_index) * 0.5 *ind.image_xscale, d);
			var yy = _y + lengthdir_y(sprite_get_width(ind.sprite_index) * 0.5 *ind.image_xscale, d);
			var bul = instance_create_layer(xx, yy, layer, bullet_object);
			
			bul.direction = d;
			bul.image_angle = d;
			bul.speed = spd;
			
			ind.bul_type_set_attributes(bul);
			ret[i] = bul;
		}
	}
	if (ind.flamethrower)
	{
	
		var xx = x + lengthdir_x(400, direction);
		var yy = y + lengthdir_y(400, direction);
		var ldx = lengthdir_x(sprite_width*0.75, direction);		
		var ldy = lengthdir_y(sprite_width*0.75, direction);
		if(collision_line(obj_gun.x,obj_gun.y, xx, yy, obj_ground, false, true)){		
			
			var life_min = (distance_to_object(obj_ground)/4);
			var life_max = (distance_to_object(obj_ground)/3);
			part_type_life(global.__flame,life_min,life_max);
			part_type_life(global.__smoke,life_min,life_max);
			
		}
		
		else{
			
			part_type_life(global.__flame,global.__flame_lifemin,global.__flame_lifemax);
			part_type_life(global.__smoke,global.__smoke_lifemin,global.__smoke_lifemax);
		}
			part_type_direction(global.__flame,direction -5,direction+5,0,10);
			part_type_direction(global.__smoke,direction -5,direction+5,0,10);
			part_emitter_region(global.__fire,global.__em,x+ldx,x+ldx,y+ldy,y+ldy,ps_shape_diamond,ps_distr_linear);
			part_emitter_burst(global.__fire,global.__em,global.__smoke,3);
			part_emitter_burst(global.__fire,global.__em,global.__flame,5);
			
			var xxx = _x + lengthdir_x(sprite_get_width(ind.sprite_index) * 0.5 *ind.image_xscale, dir);
			var yyy = _y + lengthdir_y(sprite_get_width(ind.sprite_index) * 0.5 *ind.image_xscale, dir);
			var bul = instance_create_layer(xxx, yyy, layer, bullet_object);
			with(bul){
		
			owner = other.id;
			}
		
			bul.direction = dir;
			bul.image_angle = dir;
			bul.speed = spd;
			
			ind.bul_type_set_attributes(bul);
			ret[0] = bul;
		
	}
	//create regular bullets
	else
	{
		var xx = _x + lengthdir_x(sprite_get_width(ind.sprite_index) * 0.5 *ind.image_xscale, dir);
		var yy = _y + lengthdir_y(sprite_get_width(ind.sprite_index) * 0.5 *ind.image_xscale, dir);
		var bul = instance_create_layer(xx, yy, layer, bullet_object);
		with(bul){
		
			owner = other.id;
		}
		
		bul.direction = dir;
		bul.image_angle = dir;
		bul.speed = spd;
			
		ind.bul_type_set_attributes(bul);
		ret[0] = bul;
	}
	
	return ret;
}