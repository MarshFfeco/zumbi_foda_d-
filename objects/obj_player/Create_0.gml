/// @description functions

demora_tiro = 0;
can_fire = room_speed * 0.5;

function movement(left, right, up, down){
	var _left = keyboard_check(ord(left));
	var _right = keyboard_check(ord(right));
	var _up = keyboard_check(ord(up));
	var _down = keyboard_check(ord(down));

	var _hspd = _right - _left;
	var _vspd = _down - _up;

	if(_hspd != 0 || _vspd != 0){
		var spd = 4;
		var dir = point_direction(0, 0, _hspd, _vspd);
		var _xar = lengthdir_x(spd, dir);
		var _yar = lengthdir_y(spd, dir);
	
		x += _xar;
		y += _yar;
		
		image_speed = 1;
	} else {		
		image_speed = 0;
	}

}

function fire(){
	var _dir =  point_direction(x, y, mouse_x, mouse_y);
	var _fire = mouse_check_button(mb_left);
	
	image_angle = _dir;

	if(demora_tiro <= 0){
		sprite_index = spr_player;
		
		if(_fire){
			var shoot = instance_create_layer(x + 5, y + 10, "shoot", obj_shoot);
			shoot.speed = 10;
			shoot.direction = _dir;
			
			demora_tiro = can_fire;
		}
	} else {
		demora_tiro--;
					
		sprite_index = spr_player_fire;
	}
}