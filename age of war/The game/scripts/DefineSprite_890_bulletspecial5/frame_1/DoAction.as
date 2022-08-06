_rotation = 0;
ys = 1;
xs = 4 * Math.cos(_rotation * 0.017453292519943295);
g = 0;
gf = 0.2;
rot = random(10) - 5;
par = new Array();
par[0] = _rotation;
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      if(g < 15)
      {
         g += gf;
      }
      xs /= 1.02;
      _X = _X + xs;
      _Y = _Y + (ys + g);
      _rotation = _rotation + rot;
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
      this.removeMovieClip();
   }
};
