timer = 1999;
this.onEnterFrame = function()
{
   frame = Math.round(timer / 2);
   spt.gotoAndStop(frame);
   if(!_root.PAUSED)
   {
      if(timer < 2000)
      {
         timer++;
      }
   }
};
