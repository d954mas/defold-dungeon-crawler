varying mediump vec2 var_texcoord0;
varying lowp vec4 var_face_color;
varying lowp vec4 var_outline_color;
varying lowp vec4 var_shadow_color;
varying mediump float dist;

uniform lowp vec4 texture_size_recip;
uniform lowp sampler2D texture;
uniform mediump vec4 fog_color;
uniform mediump vec4 fog;

void main()
{
    // Outline
    lowp vec2 t = texture2D(texture, var_texcoord0.xy).xy;
    vec4 texColor = vec4(var_face_color.xyz, 1.0) * t.x * var_face_color.w + vec4(var_outline_color.xyz * t.y * var_outline_color.w, t.y * var_outline_color.w) * (1.0 - t.x);

    float f = 1.0 /exp((dist-fog.x) * fog.z);
    f = clamp(f, 0.0, 1.0);
    vec3 color  = (1.0-f) * fog_color.rgb +  f * texColor.rgb;
    color = mix(vec3(0.0),color, texColor.a);
    
    gl_FragColor = vec4(color,texColor.a);
}
