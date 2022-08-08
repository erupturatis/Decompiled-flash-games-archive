timer = 600;
cc = 0;
_root.specialh = true;
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      timer--;
      if(timer == 0)
      {
         _root.specialh = false;
         this.removeMovieClip();
      }
   }
};
