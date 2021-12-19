/// @description Insert description here
// You can write your code in this editor
if collision_circle(x,y,16,obj_bullet,1,1){
	bullet_int = collision_circle(x,y,16,obj_bullet,1,1);


	if !collision_line(x,y,bullet_int.x,bullet_int.y,obj_ground,1,1){
		clr = c_red;	
	}
}
else {
	clr = c_white;
}