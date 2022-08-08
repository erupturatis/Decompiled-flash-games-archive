scale = random(20) + 100;
_rotation = params[0];
_yscale = _xscale = scale;
_X = _X + (Math.random() * 9 - 4);
_Y = _Y + (Math.random() * 9 - 4);
rot = random(4) - 1.5;
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      _Y = _Y - 1;
      scale -= 4;
      _alpha = _alpha - 4;
      _yscale = _xscale = scale;
      if(_Y > 425)
      {
         this.removeMovieClip();
      }
      if(_alpha <= 0)
      {
         this.removeMovieClip();
      }
      if(scale <= 0)
      {
         this.removeMovieClip();
      }
   }
};
