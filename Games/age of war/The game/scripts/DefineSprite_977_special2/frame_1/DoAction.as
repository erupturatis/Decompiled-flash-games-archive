timer = 200;
cc = 0;
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      cc++;
      timer--;
      if(cc == 5)
      {
         _root.create_bullet(_X,_Y,rot,200,"special2",1);
         cc = 0;
      }
      _root.game._x += random(4) - 2;
      _root.game._y = 0 + random(4) - 2;
      if(timer == 0)
      {
         _root.game._y = 0;
         this.removeMovieClip();
      }
   }
};
