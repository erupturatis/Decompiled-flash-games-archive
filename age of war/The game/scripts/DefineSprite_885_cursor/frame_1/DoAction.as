tu._visible = false;
mod = 1;
turret = 1;
this.onEnterFrame = function()
{
   _X = _root._xmouse;
   _Y = _root._ymouse;
   Mouse.hide();
   if(mod == 1)
   {
      ar._visible = true;
      tu._visible = false;
      se._visible = false;
   }
   else if(mod == 2)
   {
      tu._visible = true;
      tu.gotoAndStop(turret);
   }
   else if(mod == 3)
   {
      se._visible = true;
   }
};
