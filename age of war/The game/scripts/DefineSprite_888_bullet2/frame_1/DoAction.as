ys = 7 * Math.sin(_rotation * 0.017453292519943295);
xs = 7 * Math.cos(_rotation * 0.017453292519943295);
_X = _X + xs * 4;
_Y = _Y + ys * 4;
g = 0;
gf = 0.05;
rot = random(6) - 3;
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      g += gf;
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
            _root.game.ennemies["ennemy" + _root.ennemies[a][0]].health -= damage;
            this.removeMovieClip();
         }
         a--;
      }
   }
};
