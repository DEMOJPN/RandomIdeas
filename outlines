// Godot v4.4.1
// shader for rendering black outlines 

shader_type spatial;

// set rendering mode:
// cull_front: so the outline appears behind the original model
render_mode cull_front, unshaded, shadows_disabled;

// outline thickness
uniform float outline_thickness = 0.03;

// color of the outline to edit in the editor
uniform vec4 outline_color : source_color = vec4(0.0, 0.0, 0.3, 1.0);

void vertex() {
// push the vertex outward along normal to create the effect
    VERTEX += NORMAL * outline_thickness;
}

void fragment() {
// set the fragment color to the outline color
    ALBEDO = outline_color.rgb;
// set the transparency (alpha) from the outline color
    ALPHA = outline_color.a;
}
