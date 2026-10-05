#version 300 es
precision mediump float;
in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 FragColor;

void main() {
    vec4 color = texture(tex, v_texcoord);
    
    // Kontrast anpassen (1.3 = stark, 1.0 = normal)
    float contrast = 0.85;
    color.rgb = (color.rgb - 0.5) * contrast + 0.5;
    
    // Sättigung anpassen (1.4 = stark, 1.0 = normal)
    float saturation = 1.2;
    float luma = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    color.rgb = mix(vec3(luma), color.rgb, saturation);
    
    FragColor = color;
}
