/*
 * Grayscale Shader for Hyprshade
 * GLSL 3.0 ES Compatible
 */

#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

// Configuration constants - modify these values as needed
#define GRAYSCALE_TYPE 0        // 0=LUMINOSITY, 1=LIGHTNESS, 2=AVERAGE
#define LUMINOSITY_TYPE 2       // 0=PAL, 1=HDTV, 2=HDR (only used when GRAYSCALE_TYPE=0)

// Enum constants for grayscale conversion types
const int LUMINOSITY = 0;
const int LIGHTNESS = 1;
const int AVERAGE = 2;

// Enum constants for luminosity calculation types
const int PAL = 0;
const int HDTV = 1;
const int HDR = 2;

void main() {
    vec4 pixColor = texture(tex, v_texcoord);
    float gray = 0.0;

    if (GRAYSCALE_TYPE == LUMINOSITY) {
        // Calculate luminance using different standard coefficients
        // https://en.wikipedia.org/wiki/Grayscale#Luma_coding_in_video_systems
        if (LUMINOSITY_TYPE == PAL) {
            // PAL/NTSC standard (Rec. 601)
            gray = dot(pixColor.rgb, vec3(0.299, 0.587, 0.114));
        } else if (LUMINOSITY_TYPE == HDTV) {
            // HDTV standard (Rec. 709)
            gray = dot(pixColor.rgb, vec3(0.2126, 0.7152, 0.0722));
        } else if (LUMINOSITY_TYPE == HDR) {
            // HDR standard (Rec. 2020)
            gray = dot(pixColor.rgb, vec3(0.2627, 0.6780, 0.0593));
        }
    } else if (GRAYSCALE_TYPE == LIGHTNESS) {
        // Lightness method: average of max and min RGB values
        float maxColor = max(pixColor.r, max(pixColor.g, pixColor.b));
        float minColor = min(pixColor.r, min(pixColor.g, pixColor.b));
        gray = (maxColor + minColor) * 0.5;
    } else if (GRAYSCALE_TYPE == AVERAGE) {
        // Simple average method
        gray = (pixColor.r + pixColor.g + pixColor.b) * 0.33333333;
    }

    fragColor = vec4(vec3(gray), pixColor.a);
}
