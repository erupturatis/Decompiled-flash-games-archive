ys = 0.2 * Math.sin(_rotation * 0.017453292519943295);
xs = 0.2 * Math.cos(_rotation * 0.017453292519943295);
_X = _X + xs * 100;
_Y = _Y + ys * 100;
acc = 1.01;
g = 0;
gf = 0.02;
par = new Array();
par[0] = side;
par[1] = damage;
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      b = 7;
      while(b >= 0)
      {
         if(xs < 15)
         {
            _X = _X + xs;
            _Y = _Y + ys;
            xs *= acc;
            ys *= acc;
         }
         if(_Y > 425)
         {
            this.removeMovieClip();
         }
         a = _root.ennemies.length - 1;
         while(a >= 0)
         {
            if(_root.game.ennemies["ennemy" + _root.ennemies[a][0]].hitzone.hitTest(_X + _root.game._x,_Y,false) and _root.game.ennemies["ennemy" + _root.ennemies[a][0]].side != side)
            {
               EN = _root.game.ennemies["ennemy" + _root.ennemies[a][0]];
               EN.health -= damage;
               _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
               _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
               _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
               _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
               _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
               this.removeMovieClip();
            }
            a--;
         }
         b--;
      }
   }
};
