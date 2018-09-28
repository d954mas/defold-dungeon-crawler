varying mediump vec2 var_texcoord0;
varying mediump float dist;
uniform lowp sampler2D tex0;
uniform mediump vec4 fog_color;
uniform mediump vec4 fog;


void main()
{
	float f = 1.0;
	//float f = 1.0 /exp(dist * fog.z);
	//float f = (fog.y - dist)/(fog.y - fog.x);
	//f = clamp(f, 0.99, 1.0);
	vec4 texColor = texture2D(tex0, var_texcoord0.xy*25.0);
	vec3 color  = (1.0-f) * fog_color.rgb +  f * texColor.rgb;
	//gl_FragColor = vec4(dist/10.0);
	gl_FragColor = vec4(color,texColor.a);
}

