function create_game()
{
   _root.createEmptyMovieClip("game",1);
   _root.game.attachMovie("base_player","base_player",10);
   _root.game.attachMovie("base_comp","base_comp",11);
   _root.game.createEmptyMovieClip("bullets",12);
   _root.game.base_comp._x = 1000;
   _root.game.base_comp._y = 425;
   _root.game.base_player._y = 425;
   _root.game.attachMovie("bg","bg",1);
   _root.game.createEmptyMovieClip("ennemies",100);
   _root.attachMovie("menu","menu",3000);
   _root.attachMovie("pause","pause",4000);
   _root.attachMovie("cursor","cursor",5000);
   _root.pause._visible = false;
   _root.ennemies = new Array();
   _root.ennemies = [["base1",0,1],["base2",0,2]];
   _root.game.ennemies.attachMovie("base1","ennemybase1",10000000);
   _root.game.ennemies.attachMovie("base2","ennemybase2",10000001);
   _root.game.ennemies.ennemybase1.health = 500;
   _root.game.ennemies.ennemybase1.max_health = 500;
   _root.game.ennemies.ennemybase2.health = 500;
   _root.game.ennemies.ennemybase2.max_health = 500;
   _root.game.createEmptyMovieClip("particules",200);
   _root.specialh = false;
   b = 1;
   base1x = 150;
   base1y = 425;
   base2x = 860;
   base2y = 425;
   cash = 175;
   e_cash = 100;
   tech_level = 1;
   etech_level = 1;
   bi = 0;
   xp = 0;
   exp = 0;
   pi = 0;
   addons = 0;
   spot1_turret = 0;
   spot2_turret = 0;
   spot3_turret = 0;
   spot4_turret = 0;
   spot_turretx = 52;
   spot1_turrety = -80;
   spot2_turrety = -125;
   spot3_turrety = -172;
   spot4_turrety = -220;
   eaddons = 0;
   espot1_turret = 0;
   espot2_turret = 0;
   espot3_turret = 0;
   espot4_turret = 0;
   espot_turretx = -52;
   espot1_turrety = -80;
   espot2_turrety = -125;
   espot3_turrety = -172;
   espot4_turrety = -220;
   PAUSED = false;
   H1 = 100;
   H2 = 100;
}
function end_game(win)
{
   removeMovieClip(_root.game);
   removeMovieClip(_root.menu);
   removeMovieClip(_root.pause);
   removeMovieClip(_root.cursor);
   Mouse.show();
   if(win == true)
   {
      _root.gotoAndStop("win");
   }
   else
   {
      _root.gotoAndStop("gameover");
   }
}
function create_ennemy(id, side)
{
   Te = _root.game.ennemies.attachMovie("ennemy","ennemy" + b,b);
   Te.side = side;
   Te.id = id;
   Te.uid = b;
   if(side == 1)
   {
      Te._x = _root.base1x;
      Te._y = _root.base1y;
   }
   else if(side == 2)
   {
      Te._x = _root.base2x;
      Te._y = _root.base2y;
   }
   _root.ennemies.push([b,id,side]);
   b++;
}
function show_build_buttons()
{
   if(addons == 0)
   {
      _root.game.base_player.b1._visible = true;
   }
   else if(addons == 1)
   {
      _root.game.base_player.b1._visible = true;
      _root.game.base_player.b2._visible = true;
   }
   else if(addons == 2)
   {
      _root.game.base_player.b1._visible = true;
      _root.game.base_player.b2._visible = true;
      _root.game.base_player.b3._visible = true;
   }
   else if(addons == 3)
   {
      _root.game.base_player.b1._visible = true;
      _root.game.base_player.b2._visible = true;
      _root.game.base_player.b3._visible = true;
      _root.game.base_player.b4._visible = true;
   }
   if(spot1_turret != 0)
   {
      _root.game.base_player.b1._visible = false;
   }
   if(spot2_turret != 0)
   {
      _root.game.base_player.b2._visible = false;
   }
   if(spot3_turret != 0)
   {
      _root.game.base_player.b3._visible = false;
   }
   if(spot4_turret != 0)
   {
      _root.game.base_player.b4._visible = false;
   }
}
function show_sell_turrets()
{
   if(spot1_turret != 0)
   {
      _root.game.base_player.s1._visible = true;
   }
   if(spot2_turret != 0)
   {
      _root.game.base_player.s2._visible = true;
   }
   if(spot3_turret != 0)
   {
      _root.game.base_player.s3._visible = true;
   }
   if(spot4_turret != 0)
   {
      _root.game.base_player.s4._visible = true;
   }
}
function hide_build_buttons()
{
   _root.game.base_player.b1._visible = false;
   _root.game.base_player.b2._visible = false;
   _root.game.base_player.b3._visible = false;
   _root.game.base_player.b4._visible = false;
}
function hide_sell_buttons()
{
   _root.game.base_player.s1._visible = false;
   _root.game.base_player.s2._visible = false;
   _root.game.base_player.s3._visible = false;
   _root.game.base_player.s4._visible = false;
}
function sell_turret(spot, price)
{
   if(spot == 1)
   {
      _root.game.base_player.turret1.removeMovieClip();
      _root.spot1_turret = 0;
      _root.cash += price;
      _root.menu.stc._visible = false;
      _root.menu.m1._visible = true;
      _root.menu._root.hide_sell_buttons();
      _root.cursor.mod = 1;
      _root.menu.mt.text = "Menu";
      _root.menu.desc.text = "";
   }
   if(spot == 2)
   {
      _root.game.base_player.turret2.removeMovieClip();
      _root.spot2_turret = 0;
      _root.cash += price;
      _root.menu.stc._visible = false;
      _root.menu.m1._visible = true;
      _root.menu._root.hide_sell_buttons();
      _root.cursor.mod = 1;
      _root.menu.mt.text = "Menu";
      _root.menu.desc.text = "";
   }
   if(spot == 3)
   {
      _root.game.base_player.turret3.removeMovieClip();
      _root.spot3_turret = 0;
      _root.cash += price;
      _root.menu.stc._visible = false;
      _root.menu.m1._visible = true;
      _root.menu._root.hide_sell_buttons();
      _root.cursor.mod = 1;
      _root.menu.mt.text = "Menu";
      _root.menu.desc.text = "";
   }
   if(spot == 4)
   {
      _root.game.base_player.turret4.removeMovieClip();
      _root.spot4_turret = 0;
      _root.cash += price;
      _root.menu.stc._visible = false;
      _root.menu.m1._visible = true;
      _root.menu._root.hide_sell_buttons();
      _root.cursor.mod = 1;
      _root.menu.mt.text = "Menu";
      _root.menu.desc.text = "";
   }
}
function esell_turret(spot)
{
   if(spot == 1)
   {
      _root.game.base_comp.turret1.removeMovieClip();
      _root.espot1_turret = 0;
   }
   if(spot == 2)
   {
      _root.game.base_comp.turret2.removeMovieClip();
      _root.espot2_turret = 0;
   }
   if(spot == 3)
   {
      _root.game.base_comp.turret3.removeMovieClip();
      _root.espot3_turret = 0;
   }
   if(spot == 4)
   {
      _root.game.base_comp.turret4.removeMovieClip();
      _root.espot4_turret = 0;
   }
}
function create_turret(spot, id, side)
{
   if(side == 1)
   {
      if(spot == 1 and spot1_turret == 0)
      {
         _root.cash -= _root.TU[id][1];
         _root.hide_build_buttons();
         _root.cursor.mod = 1;
         Tt = _root.game.base_player.attachMovie("turret","turret1",20);
         Tt._x = spot_turretx;
         Tt._y = spot1_turrety;
         Tt.id = id;
         Tt.side = side;
         spot1_turret = id;
         _root.menu.m1._visible = true;
         _root.menu.m2._visible = true;
         _root.menu.btc._visible = false;
         _root.menu.desc.text = "";
         _root.menu.mt.text = "Menu";
      }
      if(spot == 2 and spot2_turret == 0)
      {
         _root.cash -= _root.TU[id][1];
         _root.hide_build_buttons();
         _root.cursor.mod = 1;
         Tt = _root.game.base_player.attachMovie("turret","turret2",21);
         Tt._x = spot_turretx;
         Tt._y = spot2_turrety;
         Tt.id = id;
         Tt.side = side;
         spot2_turret = id;
         _root.menu.m1._visible = true;
         _root.menu.m2._visible = true;
         _root.menu.btc._visible = false;
         _root.menu.desc.text = "";
         _root.menu.mt.text = "Menu";
      }
      if(spot == 3 and spot3_turret == 0)
      {
         _root.cash -= _root.TU[id][1];
         _root.hide_build_buttons();
         _root.cursor.mod = 1;
         Tt = _root.game.base_player.attachMovie("turret","turret3",22);
         Tt._x = spot_turretx;
         Tt._y = spot3_turrety;
         Tt.id = id;
         Tt.side = side;
         spot3_turret = id;
         _root.menu.m1._visible = true;
         _root.menu.m2._visible = true;
         _root.menu.btc._visible = false;
         _root.menu.desc.text = "";
         _root.menu.mt.text = "Menu";
      }
      if(spot == 4 and spot4_turret == 0)
      {
         _root.cash -= _root.TU[id][1];
         _root.hide_build_buttons();
         _root.cursor.mod = 1;
         Tt = _root.game.base_player.attachMovie("turret","turret4",23);
         Tt._x = spot_turretx;
         Tt._y = spot4_turrety;
         Tt.id = id;
         Tt.side = side;
         spot4_turret = id;
         _root.menu.m1._visible = true;
         _root.menu.m2._visible = true;
         _root.menu.btc._visible = false;
         _root.menu.desc.text = "";
         _root.menu.mt.text = "Menu";
      }
   }
   else if(side == 2)
   {
      if(spot == 1 and espot1_turret == 0)
      {
         _root.ecash -= _root.TU[id][1];
         Tt = _root.game.base_comp.attachMovie("turret","turret1",20);
         Tt._x = espot_turretx;
         Tt._y = espot1_turrety;
         Tt.id = id;
         Tt.side = side;
         espot1_turret = id;
      }
      if(spot == 2 and espot2_turret == 0)
      {
         _root.ecash -= _root.TU[id][1];
         Tt = _root.game.base_comp.attachMovie("turret","turret2",21);
         Tt._x = espot_turretx;
         Tt._y = espot2_turrety;
         Tt.id = id;
         Tt.side = side;
         espot2_turret = id;
      }
      if(spot == 3 and espot3_turret == 0)
      {
         _root.ecash -= _root.TU[id][1];
         Tt = _root.game.base_comp.attachMovie("turret","turret3",22);
         Tt._x = espot_turretx;
         Tt._y = espot3_turrety;
         Tt.id = id;
         Tt.side = side;
         espot3_turret = id;
      }
      if(spot == 4 and espot3_turret == 0)
      {
         _root.ecash -= _root.TU[id][1];
         Tt = _root.game.base_comp.attachMovie("turret","turret4",23);
         Tt._x = espot_turretx;
         Tt._y = espot4_turrety;
         Tt.id = id;
         Tt.side = side;
         espot4_turret = id;
      }
   }
}
function create_bullet(x, y, rot, damage, id, side)
{
   Tb = _root.game.bullets.attachMovie("bullet" + id,"bullet" + bi,bi);
   Tb._x = x;
   Tb._y = y;
   Tb._rotation = rot;
   Tb.damage = damage;
   Tb.side = side;
   bi++;
}
function create_particule(x, y, id, params)
{
   Tp = _root.game.particules.attachMovie("part" + id,"part" + pi,pi);
   Tp._x = x;
   Tp._y = y;
   Tp.params = params;
   pi++;
}
create_game();
