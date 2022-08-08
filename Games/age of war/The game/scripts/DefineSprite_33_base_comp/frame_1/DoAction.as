timer = 0;
u_timer = -1;
turn_time = 0;
uf = 0.3;
step_time = 40;
timer = 0;
check_action = false;
uof = 0;
tech_timer = 0;
unit_level = 1;
turret_level = 0;
this.onEnterFrame = function()
{
   if(!_root.PAUSED)
   {
      hr = _root.game.ennemies.ennemybase2.health / _root.game.ennemies.ennemybase2.max_health * 100;
      h = Math.round(_root.game.ennemies.ennemybase2.health);
      if(h < 0)
      {
         _root.end_game(true);
      }
      hb._yscale = hr;
      bu.gotoAndStop(_root.etech_level);
      tech_timer++;
      if(unit_level == 1)
      {
         if(tech_timer == 1500)
         {
            unit_level++;
         }
      }
      else if(unit_level == 2)
      {
         if(tech_timer == 5000)
         {
            unit_level++;
         }
      }
      if(tech_timer == 8000)
      {
         if(_root.etech_level != 5)
         {
            _root.etech_level = _root.etech_level + 1;
            _root.game.ennemies.ennemybase2.health += 300 * _root.etech_level;
            _root.game.ennemies.ennemybase2.max_health += 300 * _root.etech_level;
            unit_level = 1;
            tech_timer = 0;
         }
      }
      if(_root.etech_level == 1)
      {
         if(tech_timer == 1000)
         {
            _root.create_turret(1,1,2);
            turret_level++;
         }
         else if(tech_timer == 4000)
         {
            _root.esell_turret(1);
            _root.create_turret(1,2,2);
            turret_level++;
         }
         else if(tech_timer == 6000)
         {
            _root.esell_turret(1);
            _root.create_turret(1,3,2);
         }
      }
      if(_root.etech_level == 2)
      {
         if(tech_timer == 1000)
         {
            _root.esell_turret(1);
            _root.create_turret(1,4,2);
            turret_level++;
         }
         else if(tech_timer == 4000)
         {
            _root.eaddons = 1;
            _root.esell_turret(1);
            _root.create_turret(1,6,2);
            turret_level++;
         }
         else if(tech_timer == 6000)
         {
            _root.create_turret(2,5,2);
         }
      }
      if(_root.etech_level == 3)
      {
         if(tech_timer == 1000)
         {
            _root.esell_turret(1);
            _root.create_turret(1,7,2);
            turret_level++;
         }
         else if(tech_timer == 4000)
         {
            _root.eaddons = 2;
            _root.esell_turret(2);
            _root.create_turret(2,7,2);
            turret_level++;
         }
         else if(tech_timer == 6000)
         {
            _root.esell_turret(2);
            _root.esell_turret(1);
            _root.create_turret(3,9,2);
         }
      }
      if(_root.etech_level == 4)
      {
         if(tech_timer == 5000)
         {
            _root.create_turret(1,10,2);
            turret_level++;
         }
         else if(tech_timer == 7000)
         {
            _root.eaddons = 2;
            _root.esell_turret(3);
            _root.esell_turret(1);
            _root.create_turret(2,11,2);
            turret_level++;
         }
      }
      if(_root.etech_level == 5)
      {
         if(tech_timer == 5000)
         {
            _root.create_turret(1,13,2);
            turret_level++;
         }
         else if(tech_timer == 12000)
         {
            _root.esell_turret(2);
            _root.esell_turret(1);
            _root.esell_turret(3);
            _root.create_turret(2,14,2);
            turret_level++;
         }
         else if(tech_timer == 20000)
         {
            _root.eaddons = 3;
            _root.esell_turret(2);
            _root.esell_turret(1);
            _root.esell_turret(3);
            _root.create_turret(4,15,2);
            turret_level++;
         }
      }
      timer++;
      if(step_time == timer)
      {
         f = Math.random();
         if(f < uf)
         {
            action = 1;
         }
         else
         {
            action = 3;
         }
         timer = 0;
         check_action = true;
      }
      if(check_action == true)
      {
         if(action == 1)
         {
            if(u_timer < -5)
            {
               if(uof < 6)
               {
                  unit_type = random(unit_level) + 1;
                  unit_type += (_root.etech_level - 1) * 3;
                  will_create_unit = unit_type;
                  u_timer = _root.EN[unit_type][2];
                  u_timer_total = _root.EN[unit_type][2];
                  uof++;
                  check_action = false;
               }
            }
         }
      }
      if(u_timer == 0)
      {
         _root.create_ennemy(will_create_unit,2);
      }
      u_timer--;
      make_unit = Math.random();
      bar._yscale = u_timer / u_timer_total * 100;
      if(_root.eaddons == 0)
      {
         e1._visible = false;
         e2._visible = false;
         e3._visible = false;
      }
      else if(_root.eaddons == 1)
      {
         e1._visible = true;
         e2._visible = false;
         e3._visible = false;
      }
      else if(_root.eaddons == 2)
      {
         e1._visible = true;
         e2._visible = true;
         e3._visible = false;
      }
      else if(_root.eaddons == 3)
      {
         e1._visible = true;
         e2._visible = true;
         e3._visible = true;
      }
      e1.gotoAndStop(_root.etech_level);
      e2.gotoAndStop(_root.etech_level);
      e3.gotoAndStop(_root.etech_level);
   }
};
