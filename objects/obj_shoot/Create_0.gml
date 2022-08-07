/// @description 
image_xscale = 2;
image_yscale = image_xscale;

_destruct_fire = room_speed * 6;

_dano = 1;

function valo_normal(){
	image_xscale = lerp(image_xscale, 1, 0.3);
	image_yscale = image_xscale;
}

function morre_depois(){
	_destruct_fire--;
	
	if(_destruct_fire <= 0) instance_destroy(id, false);
}
	
function colidir_inimig(){
	var colidiu_inimig = instance_place(x, y, obj_inimig);

	if(colidiu_inimig){
		colidiu_inimig.levar_dano(_dano);
		
		instance_destroy(id);
	}
}