cc = 0;
_Y = 200;
_X = -100;
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      cc++;
      timer--;
      if(cc == 15)
      {
         if(_X < 700)
         {
            _root.create_bullet(_X,_Y,0,400,"special4",1);
            cc = 0;
         }
      }
      _X = _X + 4;
      _root.game._x += random(3) - 1;
      _root.game._y = 0 + random(3) - 1;
      if(_X > 1000)
      {
         _root.game._y = 0;
         this.removeMovieClip();
      }
   }
};
