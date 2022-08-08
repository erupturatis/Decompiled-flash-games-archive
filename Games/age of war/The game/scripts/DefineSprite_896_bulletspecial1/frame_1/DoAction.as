_rotation = 80 + random(20);
ys = 10 * Math.sin(_rotation * 0.017453292519943295);
xs = 10 * Math.cos(_rotation * 0.017453292519943295);
_X = random(500) + 200;
_Y = -100;
g = 0;
gf = 0.05;
scale = random(70) + 120;
_xscale = _yscale = scale;
cc = 0;
par = new Array();
par[0] = _rotation;
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      g += gf;
      _X = _X + xs;
      _Y = _Y + (ys + g);
      cc++;
      if(cc == 1)
      {
         _root.create_particule(_X,_Y,4,par);
         cc = 0;
      }
      if(_Y > 425)
      {
         _root.create_particule(_X,_Y - 10,3,"");
         _root.create_particule(_X,_Y - 10,3,"");
         _root.create_particule(_X,_Y - 10,3,"");
         _root.create_particule(_X,_Y - 10,3,"");
         _root.create_particule(_X,_Y - 10,3,"");
         _root.create_particule(_X,_Y - 10,3,"");
         _root.create_particule(_X,_Y - 10,3,"");
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
