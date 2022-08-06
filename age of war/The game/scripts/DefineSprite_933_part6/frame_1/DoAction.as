_X = _X + (Math.random() * 6 - 3);
_Y = _Y + (Math.random() * 6 - 3);
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      _alpha = _alpha - 1;
      if(_alpha <= 0)
      {
         this.removeMovieClip();
      }
   }
};
