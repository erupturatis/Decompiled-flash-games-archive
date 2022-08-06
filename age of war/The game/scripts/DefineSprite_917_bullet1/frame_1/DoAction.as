ys = 7 * Math.sin(_rotation * 0.017453292519943295);
xs = 7 * Math.cos(_rotation * 0.017453292519943295);
_X = _X + xs * 5;
_Y = _Y + ys * 5;
g = 0;
gf = 0.05;
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      g += gf;
      _X = _X + xs;
      _Y = _Y + (ys + g);
      _rotation = _rotation + 2;
      if(_Y > 425)
      {
         _root.create_particule(_X,_Y,3,"");
         _root.create_particule(_X,_Y,3,"");
         _root.create_particule(_X,_Y,3,"");
         _root.create_particule(_X,_Y,3,"");
         _root.create_particule(_X,_Y,3,"");
         _root.create_particule(_X,_Y,3,"");
         _root.create_particule(_X,_Y,3,"");
         this.removeMovieClip();
      }
      a = _root.ennemies.length - 1;
      while(a >= 0)
      {
         if(_root.game.ennemies["ennemy" + _root.ennemies[a][0]].hitzone.hitTest(_X + _root.game._x,_Y,false) and _root.game.ennemies["ennemy" + _root.ennemies[a][0]].side != side)
         {
            EN = _root.game.ennemies["ennemy" + _root.ennemies[a][0]];
            EN.health -= damage;
            _root.create_particule(_X,_Y,3,"");
            _root.create_particule(_X,_Y,3,"");
            _root.create_particule(_X,_Y,3,"");
            _root.create_particule(_X,_Y,3,"");
            _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
            _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
            _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
            _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
            _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
            this.removeMovieClip();
         }
         a--;
      }
   }
};
