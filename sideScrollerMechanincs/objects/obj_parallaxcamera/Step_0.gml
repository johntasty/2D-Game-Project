/// @ Parallax camera control

var near = layer_get_id("Factories");
var far = layer_get_id("Bridge");

layer_x(near,     lerp(0, camera_get_view_x(view_camera[0]), 0.5 ) );
layer_x(far,      lerp(0, camera_get_view_x(view_camera[0]), 0.6 ) );
