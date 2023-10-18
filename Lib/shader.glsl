
/*
vec4 black = vec4(0.0, 0.0, 0.0, 1.0);
vec4 white = vec4(1.0, 1.0, 1.0, 1.0);
int max_iter = 1024;

vec4 clr(int n){
  if(n == max_iter){return black;}

  float m = float(n)/float(max_iter);
  float r = float(mod(n,256))/32;
  float g = float(128 - mod(n+64,127))/255;
  float b = float(127 + mod(n,64))/255;

  if (r > 1.0) {r = 1.0;}
  else{
    if(r<0){r = 0;}
  }

  if (g > 1.0) {g = 1.0;}
  else{
    if(g<0){g = 0;}
  }

  if (b > 1.0) {b = 1.0;}
  else{
    if(b<0){b = 0;}
  }
  return vec4(r, g, b, 1.0);
}

vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords){

  vec2 c = vec2((screen_coords[0]-500)/200,(screen_coords[1]-300)/200);
  vec2 z = vec2(0.0,0.0);
  vec2 zn = vec2(0.0,0.0);
  int n_iter = 0;
  while ( (z[0]*z[0] + z[1]*z[1] < 4) &&  (n_iter < max_iter) ) {
    zn[0] = z[0]*z[0] - z[1]*z[1] + c[0];
    zn[1] = 2*z[0]*z[1] + c[1];
    z[0] = zn[0];
    z[1] = zn[1];
    n_iter++;
  }
  return clr(n_iter);
}*/