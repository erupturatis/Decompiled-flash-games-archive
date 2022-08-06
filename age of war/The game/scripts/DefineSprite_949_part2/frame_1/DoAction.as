gf = 0.2;
f = 0.1;
xs = Math.random() * 2 - 1;
g = Math.random() * 1.5 - 1;
_X = _X + (Math.random() * 6 - 3);
_Y = _Y + (Math.random() * 6 - 3);
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
