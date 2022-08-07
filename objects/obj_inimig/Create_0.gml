/// @description 
randomise();

vida = 1;

speed =2;
image_angle = random(359);
direction = image_angle;

timer_direction = random_range(room_speed, room_speed * 3); 
_dpmm = 100; //Distance_player_min_max

function apontando_player(){
	if(distance_to_object(obj_player) < _dpmm) {
		var target_x = obj_player.x;
		var target_y = obj_player.y;
	
		var _dir = point_direction(x, y, target_x, target_y);
	
		image_angle = _dir;
		direction = _dir;
	}
}
	
function batendo_parede(){		
	image_angle = direction;

	
	if( x + sprite_width / 2 > room_width ||  x - sprite_width / 2 <= 0){
		hspeed *= -1;
	};
	if(y + sprite_height / 2 > room_height || y - sprite_height / 2 <= 0){
		vspeed *= -1;
	};

}

function mudando_direcao(){
	if(timer_direction > 0 && distance_to_object(obj_player) > _dpmm){
		timer_direction--;
		
		return;
	}
	timer_direction = random_range(room_speed, room_speed * 3); 
	
	image_angle = random(359);
	direction = image_angle;
}

function levar_dano(dano){
	vida -= dano;
	
	if(vida <= 0){
		instance_destroy();
		
		direcao_pedaco();
	}
}

function direcao_pedaco(){		
	_pedaco = irandom(10);
	
	repeat(_pedaco){

		
		var pedacos = instance_create_depth(x, y, 2, obj_pedaco);
		
		pedacos.speed = random_range(4, 8);
		pedacos.direction = random(359);
		pedacos.image_angle = pedacos.direction;
	}
}