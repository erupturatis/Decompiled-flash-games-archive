gf = 0.2;
f = 0.1;
g = 1;
_X = _X + (Math.random() * 2 - 1);
_Y = _Y + (Math.random() * 2 - 1);
rot = random(4) - 1.5;
damage = params[1];
side = params[0];
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      g += gf;
      xs /= 1 + f;
      _X = _X + xs;
      _Y = _Y + g;
      _rotation = _rotation + rot;
      a = _root.ennemies.length - 1;
      while(a >= 0)
      {
         if(_root.game.ennemies["ennemy" + _root.ennemies[a][0]].hitzone.hitTest(_X + _root.game._x,_Y,false) and _root.game.ennemies["ennemy" + _root.ennemies[a][0]].side != side)
         {
            EN = _root.game.ennemies["ennemy" + _root.ennemies[a][0]];
            EN.health -= damage;
            _root.create_particule(_X,_Y,9,"");
            _root.create_particule(_X,_Y,9,"");
            _root.create_particule(_X,_Y,9,"");
            _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
            _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
            this.removeMovieClip();
         }
         a--;
      }
      if(_Y > 425)
      {
         this.removeMovieClip();
      }
   }
};
