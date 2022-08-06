cash = "+ " + params[0];
ymove = 3;
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      _Y = _Y - ymove;
      ymove /= 1.1;
      if(ymove <= 0.2)
      {
         _alpha = _alpha - 2;
      }
      if(_alpha <= 0)
      {
         this.removeMovieClip();
      }
   }
};
