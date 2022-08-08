if(side == 1)
{
   _X = _X + 116;
   _Y = _Y + 7;
}
else
{
   _Y = _Y + 7;
   _X = _X - 116;
}
g = 0;
gf = 0.05;
par = new Array();
par[0] = side;
par[1] = damage;
timer = 40;
cc = 0;
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      timer--;
      cc++;
      if(cc == 2)
      {
         _root.create_particule(_X,_Y,8,par);
         cc = 0;
      }
      if(timer <= 0)
      {
         this.removeMovieClip();
      }
   }
};
