/// @description Insert description here
// You can write your code in this editor
var hit =  collision_circle(x,y,32,obj_bullet,false,true)
if(hit) {
	//var bullet_int = collision_circle(x,y,32,obj_bullet,1,1);
		 if instance_exists(hit){	
			if(hit.owner != id){
				clr = c_red;	
				health_bar -= hit.damage;				
				with hit instance_destroy();				
		}
	}
}
else
{
	clr = c_white;
}
