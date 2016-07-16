#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {

    // vec2 st = gl_FragCoord.xy / u_resolution.xy;
    // vec3 color = vec3(0.0);
    //
    // float left = step(0.1, st.x);
    // float bottom = step(0.1, st.y);
    //
    // color = vec3(left * bottom);
    //
    // gl_FragColor = vec4(color, 1.0);

    vec2 p = -1.0 + 2.0 * gl_FragCoord.xy / u_resolution.xy;

    vec2 v = vec2(2, -.5);
    float radius = 15.0;

    vec2 b1 = vec2(0.25 * sin(u_time), 0.5 * cos(u_time));
    b1 *= v;

    vec2 b2 = vec2(0.5 * cos(u_time), 0.1 * sin(u_time));
    b2 *= -v;

    vec2 b3 = vec2(0.4 * sin(u_time * 0.3), 0.3 * cos(u_time * 0.5));
    b3 *= v * 0.5;

    vec2 b4 = vec2(0.1 * cos(u_time * 0.3) + sin(u_time * 0.6), 0.5 * cos(u_time * 0.1));
    b4 *= 0.1 * v;

    float sum = 0.0;

    float d1 = distance(p, b1);
    sum += 0.01 * 15.0 / d1;

    float d2 = distance(p, b2);
    sum += 0.03 * 10.0 / d2;

    float d3 = distance(p, b3);
    sum += 0.07 * 3.0 / d3;

    float d4 = distance(p, b4);
    sum += 0.01 * 4.0 / d4;

    gl_FragColor = vec4(sum, sum * 0.3 , sum, 1.0);

}
