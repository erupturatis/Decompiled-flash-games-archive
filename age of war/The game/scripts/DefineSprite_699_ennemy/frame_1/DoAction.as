if(side == 1)
{
   speed = 0.7;
   closest_dist = 300;
   ed = 300;
}
hb._visible = false;
units.anims.stop();
_X = _X + Math.random();
if(side == 2)
{
   speed = -0.7;
   closest_dist = -300;
   units._xscale = -100;
   ed = -300;
}
hitzone.gotoAndStop(id);
hb_but.hb_but.gotoAndStop(id);
units.gotoAndStop(id);
c = 3;
closest_id = "";
limit = 100;
health = _root.ES[id][0];
rhealth = health;
damage = _root.ES[id][1];
range_damage = _root.ES[id][2];
if(side == 2)
{
   if(_root.diff == 2)
   {
      health *= 1.3;
      rhealth *= 1.3;
      damage *= 1.3;
      range_damage *= 1.3;
   }
   else if(_root.diff == 3)
   {
      health *= 2;
      rhealth *= 2;
      damage *= 2;
      range_damage *= 2;
   }
}
infront = side;
infront_id = 0;
range_shoot = _root.ES[id][4];
range_melee = _root.ES[id][3];
reward = Math.round(_root.EN[id][1] * 1.3);
ed_id = 0;
dc = 0;
dead = false;
hit = function()
{
   EN = _root.game.ennemies["ennemy" + ed_id];
   type = EN.id;
   EN.health -= damage - Math.random() * 2;
   if(ed_id != "base1" and ed_id != "base2" and type != 12)
   {
      _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
      _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
      _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
      _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
      _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
   }
};
ranged_hit = function()
{
   EN = _root.game.ennemies["ennemy" + ed_id];
   type = EN.id;
   EN.health -= range_damage - Math.random() * 2;
   if(ed_id != "base1" and ed_id != "base2" and type != 12)
   {
      _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
      _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
      _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
      _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
      _root.create_particule(EN._x,EN._y - EN.hitzone._height / 1.5,2,"");
   }
};
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      if(health > 0)
      {
         if(_root.specialh == true)
         {
            if(side == 1)
            {
               if(health < rhealth)
               {
                  health++;
               }
               aura._visible = true;
               aura._width = hitzone._width;
            }
         }
         else if(aura._visible == true)
         {
            aura._visible = false;
         }
         hb.hb._xscale = health / rhealth * 100;
         if(Math.abs(closest_dist) > limit)
         {
            _X = _X + speed;
            moving = true;
         }
         else
         {
            moving = false;
         }
         if(Math.abs(ed) < range_melee)
         {
            attack_melee = true;
            attack_range = false;
         }
         else if(Math.abs(ed) < range_shoot)
         {
            attack_melee = false;
            attack_range = true;
         }
         else
         {
            attack_melee = false;
            attack_range = false;
         }
         if(!attack_melee and !moving and !attack_range)
         {
            units.anims.gotoAndStop("idle");
         }
         else if(attack_melee and !moving)
         {
            units.anims.gotoAndStop("attack");
         }
         else if(attack_range and moving)
         {
            units.anims.gotoAndStop("shootwalk");
         }
         else if(attack_range and !moving)
         {
            units.anims.gotoAndStop("shoot");
         }
         else if(!attack_melee and moving and !attack_range)
         {
            units.anims.gotoAndStop("walk");
         }
         c--;
         if(c == 0)
         {
            ed_id = 0;
            if(side == 1)
            {
               closest_dist = 300;
               ed = 300;
            }
            if(side == 2)
            {
               closest_dist = -300;
               ed = -300;
            }
            a = _root.ennemies.length - 1;
            while(a >= 0)
            {
               dist = _root.game.ennemies["ennemy" + _root.ennemies[a][0]]._x - _X;
               if(side == 1)
               {
                  if(dist > 0)
                  {
                     if(closest_dist > dist)
                     {
                        closest_dist = dist;
                        limit = Math.abs(hitzone._width / 2) + Math.abs(_root.game.ennemies["ennemy" + _root.ennemies[a][0]].hitzone._width / 2) + 2;
                     }
                     if(_root.ennemies[a][2] != side and ed > dist - Math.abs(_root.game.ennemies["ennemy" + _root.ennemies[a][0]].hitzone._width / 2))
                     {
                        ed = dist - Math.abs(_root.game.ennemies["ennemy" + _root.ennemies[a][0]].hitzone._width / 2);
                        ed_id = _root.ennemies[a][0];
                     }
                  }
               }
               if(side == 2)
               {
                  if(dist < 0)
                  {
                     if(closest_dist < dist)
                     {
                        closest_dist = dist;
                        limit = Math.abs(hitzone._width / 2) + Math.abs(_root.game.ennemies["ennemy" + _root.ennemies[a][0]].hitzone._width / 2) + 2;
                     }
                     if(_root.ennemies[a][2] != side and ed < dist + Math.abs(_root.game.ennemies["ennemy" + _root.ennemies[a][0]].hitzone._width / 2))
                     {
                        ed = dist + Math.abs(_root.game.ennemies["ennemy" + _root.ennemies[a][0]].hitzone._width / 2);
                        ed_id = _root.ennemies[a][0];
                     }
                  }
               }
               a--;
            }
            c = 5;
         }
      }
      else
      {
         if(dead == false)
         {
            a = _root.ennemies.length - 1;
            while(a >= 0)
            {
               if(_root.ennemies[a][0] == uid)
               {
                  _root.ennemies.splice(a,1);
               }
               a--;
            }
            if(side == 2)
            {
               _root.game.base_comp.uof--;
               _root.cash += reward;
               _root.xp += reward * 2;
               _root.exp += Math.round(reward / 2);
               par = new Array();
               par[0] = reward;
               _root.create_particule(_X,_Y - hitzone._height,1,par);
            }
            else
            {
               _root.uof = _root.uof - 1;
               _root.e_cash += reward;
               _root.xp += Math.round(reward / 2);
               _root.exp += reward * 2;
            }
            _root.create_particule(_X,_Y - hitzone._height / 1.5,2,"");
            _root.create_particule(_X,_Y - hitzone._height / 1.5,2,"");
            _root.create_particule(_X,_Y - hitzone._height / 1.5,2,"");
            _root.create_particule(_X,_Y - hitzone._height / 1.5,2,"");
            _root.create_particule(_X,_Y - hitzone._height / 1.5,2,"");
            _root.create_particule(_X,_Y - hitzone._height / 1.5,2,"");
            _root.create_particule(_X,_Y - hitzone._height / 1.5,2,"");
            _root.create_particule(_X,_Y - hitzone._height / 1.5,2,"");
            _root.create_particule(_X,_Y - hitzone._height / 1.5,2,"");
            dead = true;
         }
         units.anims.gotoAndStop("die");
         dc++;
         if(dc > 80)
         {
            this.removeMovieClip();
         }
      }
   }
   else
   {
      units.anims.gotoAndStop("idle");
   }
};
