function shoot()
{
   _root.create_bullet(rx,ry,_rotation,damage,bullet_id,side);
}
tu.gotoAndStop(id);
rx = _parent._x + _X;
ry = _parent._y + _Y;
ed = 100000;
range = _root.TS[id][3];
c = 0;
shoot_speed = _root.TS[id][0];
bullet_id = _root.TS[id][1];
damage = _root.TS[id][2];
st = 0;
if(side == 2)
{
   tu._yscale = -100;
   _rotation = -180;
}
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      c++;
      if(c == 10)
      {
         ed = 100000;
         a = _root.ennemies.length - 1;
         while(a >= 0)
         {
            xdist = _root.game.ennemies["ennemy" + _root.ennemies[a][0]]._x - rx;
            ydist = _root.game.ennemies["ennemy" + _root.ennemies[a][0]]._y - ry;
            dist = Math.sqrt(xdist * xdist + ydist * ydist);
            if(_root.ennemies[a][2] != side and ed > dist)
            {
               ed = dist;
               ed_h = _root.game.ennemies["ennemy" + _root.ennemies[a][0]].hitzone._height;
               ed_id = _root.ennemies[a][0];
            }
            a--;
         }
         c = 0;
      }
      if(ed < range)
      {
         if(id != 6)
         {
            targetx = _root.game.ennemies["ennemy" + ed_id]._x;
            targety = _root.game.ennemies["ennemy" + ed_id]._y - ed_h / 1.3;
            myRadians = Math.atan2(targety - ry,targetx - rx);
            myDegrees = Math.round(myRadians * 180 / 3.141592653589793);
            _rotation = myDegrees;
         }
         st++;
         if(st >= shoot_speed)
         {
            tu.anim.play();
            st = 0;
         }
      }
   }
};
