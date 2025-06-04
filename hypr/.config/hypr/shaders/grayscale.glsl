precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

const vec3 LUMA_WEIGHTS = vec3(0.2126, 0.7152, 0.0722);

void main() {
    vec4 color = texture2D(tex, v_texcoord);
    float gray = dot(color.rgb, LUMA_WEIGHTS);
    gl_FragColor = vec4(vec3(gray), color.a);
}
