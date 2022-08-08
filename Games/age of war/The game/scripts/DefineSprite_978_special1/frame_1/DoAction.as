timer = 200;
cc = 0;
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      cc++;
      timer--;
      if(cc == 9)
      {
         _root.create_bullet(_X,_Y,rot,200,"special1",1);
         cc = 0;
      }
      _root.game._x += random(10) - 5;
      _root.game._y = 0 + random(10) - 5;
      if(timer == 0)
      {
         _root.game._y = 0;
         this.removeMovieClip();
      }
   }
};
