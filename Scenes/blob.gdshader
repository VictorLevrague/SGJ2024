shader_type canvas_item;

uniform bool blob = false;

uniform float time_speed = 100.0;
uniform float distance : hint_range(0.0, 1000.0) = 100.0;
uniform float attenuation = 1.0;

void vertex() {
  if (blob)
    {
    float time = TIME * time_speed;
    float offset = distance * sin(time) * attenuation;
    VERTEX.x += offset;
    }
}