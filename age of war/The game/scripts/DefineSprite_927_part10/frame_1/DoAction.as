gf = 0.15;
f = 0.1;
scale = random(40) + 100;
_yscale = _xscale = scale;
xs = Math.random() * 6 - 3;
g = - Math.random() * 3 + 1;
_X = _X + (Math.random() * 9 - 4);
_Y = _Y + (Math.random() * 9 - 4);
rot = random(4) - 1.5;
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      g += gf;
      xs /= 1 + f;
      _X = _X + xs;
      _Y = _Y + g;
      _rotation = _rotation + rot;
      if(_Y > 425)
      {
         this.removeMovieClip();
      }
   }
};
