// Fragment Shader
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;

varying vec4 vertColor;
varying vec2 texCoordVar;
varying float z;


void main() {

  vec4 finalColor;

  float modulo =abs(mod (z, 1.1)) ;

  if (z >= -202.09592 && z <= -198) {
    // vert pour la vallée
    finalColor = vertColor * vec4(0.0, 1.0, 0.0, 1.0);
    
  }else if (modulo >= 0 && modulo<=0.2 ){
    // on assembri
    finalColor = vertColor * vec4(0.2, 0.2, 0.2, 1.0);

  }else{
    finalColor = vertColor;
  }

  vec4 texColor = texture2D(texture, texCoordVar);
  gl_FragColor = texColor * finalColor;
}




