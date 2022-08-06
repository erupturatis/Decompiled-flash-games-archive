function add_to_tray(id)
{
   if(_root.cash >= _root.EN[id][1])
   {
      _root.cash -= _root.EN[id][1];
      if(tray[0] == 0)
      {
         tray[0] = id;
         create_ennemy(id);
      }
      else if(tray[1] == 0)
      {
         tray[1] = id;
      }
      else if(tray[2] == 0)
      {
         tray[2] = id;
      }
      else if(tray[3] == 0)
      {
         tray[3] = id;
      }
      else if(tray[4] == 0)
      {
         tray[4] = id;
      }
      else
      {
         _root.cash += _root.EN[id][1];
      }
      trace_tray();
   }
}
function create_ennemy(id)
{
   if(c_id == 0)
   {
      timer = _root.EN[id][2];
      c_id = id;
      c_timer = timer;
      bdesc.text = "Training " + _root.EN[id][0] + "...";
   }
}
function build_turret(id)
{
   if(_root.cash >= _root.TU[id][1])
   {
      cursor_turret(id);
   }
}
function cursor_turret(id)
{
   _root.cursor.mod = 2;
   _root.cursor.turret = id;
   bt1._visible = false;
   bt2._visible = false;
   bt3._visible = false;
   btr._visible = false;
   btc._visible = true;
   _root.show_build_buttons();
}
function trace_tray()
{
   t1.gotoAndStop(tray[0] + 1);
   t2.gotoAndStop(tray[1] + 1);
   t3.gotoAndStop(tray[2] + 1);
   t4.gotoAndStop(tray[3] + 1);
   t5.gotoAndStop(tray[4] + 1);
}
function unit_info(id)
{
   desc.text = _root.EN[id][1] + "$ - " + _root.EN[id][0];
}
function turret_info(id)
{
   desc.text = _root.TU[id][1] + "$ - " + _root.TU[id][0];
}
function unit_info_hide()
{
   desc.text = "";
}
c_id = 0;
prog._xscale = 0;
tray = Array(0,0,0,0,0);
bf1._visible = false;
bf2._visible = false;
bf3._visible = false;
bfr._visible = false;
bt1._visible = false;
bt2._visible = false;
bt3._visible = false;
btr._visible = false;
btc._visible = false;
stc._visible = false;
this.onEnterFrame = function()
{
   desc_text = desc.text;
   menu_text = mt.text;
   if(_ymouse > 120)
   {
      if(_root.game._x > -350)
      {
         if(_xmouse > 550)
         {
            _root.game._x -= (_xmouse - 550) / 10;
         }
      }
      if(_root.game._x < -350)
      {
         _root.game._x = -350;
      }
      if(_root.game._x < 0)
      {
         if(_xmouse < 100)
         {
            _root.game._x += (100 - _xmouse) / 10;
         }
      }
      if(_root.game._x > 0)
      {
         _root.game._x = 0;
      }
   }
   if(timer > 0)
   {
      timer--;
      prog._xscale = 100 - timer / c_timer * 100;
   }
   if(timer == 0)
   {
      _root.create_ennemy(c_id,1);
      c_id = 0;
      c_timer = 0;
      timer = -1;
      prog._xscale = 0;
      bdesc.text = "";
      tray[0] = 0 + tray[1];
      tray[1] = 0 + tray[2];
      tray[2] = 0 + tray[3];
      tray[3] = 0 + tray[4];
      tray[4] = 0;
      if(tray[0] != 0)
      {
         create_ennemy(tray[0]);
      }
      trace_tray();
   }
};
