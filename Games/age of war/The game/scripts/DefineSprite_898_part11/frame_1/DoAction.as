_rotation = -90 + (random(60) - 30);
ys = 7 * Math.sin(_rotation * 0.017453292519943295);
xs = 7 * Math.cos(_rotation * 0.017453292519943295);
ys += Math.random();
g = 0;
gf = 0.2;
rot = random(20) - 10;
side = params[0];
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      g += gf;
      _X = _X + xs;
      _Y = _Y + (ys + g);
      _rotation = 0;
      if(ys + g > 0)
      {
         if(_Y > 425)
         {
            _root.create_particule(_X,_Y,7,"");
            _root.create_particule(_X,_Y,6,"");
            this.removeMovieClip();
         }
         a = _root.ennemies.length - 1;
         while(a >= 0)
         {
            if(_root.game.ennemies["ennemy" + _root.ennemies[a][0]].hitzone.hitTest(_X + _root.game._x,_Y,false) and _root.game.ennemies["ennemy" + _root.ennemies[a][0]].side != side)
            {
               EN = _root.game.ennemies["ennemy" + _root.ennemies[a][0]];
               EN.health -= 30;
               _root.create_particule(_X,_Y,7,"");
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
   }
};
