shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, filter_nearest;
uniform vec4 modelate_color : source_color = vec4(0.0);
uniform vec2 lights[100];
uniform int number_of_lights = 1;

uniform float light_radius = 32.0;

float distance_to_light(vec2 coords) {
	float dist = 1000.0;
	
	for (int i = 0; i < number_of_lights; i++) {
	float new_dist = distance(coords, lights[i]);
	
	if (new_dist < dist) {
		dist = new_dist;
	}
	}
	
	return dist;
}


/* void fragment() {
	COLOR = COLOR * modelate_color;
	if (FRAGCOORD.y <= 160.0)
	{
		COLOR = vec4(255, 255, 255, 255);
	}
} */
vec2 get_coords() {
	vec2 coords = lights[0];
	return vec2(coords.x, coords.y);
}

void fragment() {
	float dist = distance_to_light(FRAGCOORD.xy);
	vec2 coords = get_coords();
	COLOR = texture(screen_texture, SCREEN_UV);
	
	if (pow(FRAGCOORD.x, 2.0) + pow(FRAGCOORD.y, 2.0) <= pow(32, 2.0)) {
		COLOR = vec4(255, 255, 255, 255);
	}
}
