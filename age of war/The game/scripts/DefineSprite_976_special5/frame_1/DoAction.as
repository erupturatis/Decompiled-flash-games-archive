cc = 0;
_Y = 425;
_X = 150;
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      play();
      cc++;
      timer--;
      if(cc == 5)
      {
         if(_X < 700)
         {
            _root.create_bullet(_X + 30,_Y - 5,0,1000,"special5",1);
            _X = _X + 50;
            cc = 0;
         }
      }
      _root.game._x += random(3) - 1;
      _root.game._y = 0 + random(3) - 1;
      if(_X > 1000)
      {
         _root.game._y = 0;
         this.removeMovieClip();
      }
   }
   else
   {
      stop();
   }
};
