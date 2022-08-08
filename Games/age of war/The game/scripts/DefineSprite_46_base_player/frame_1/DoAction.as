e1._visible = false;
e2._visible = false;
e3._visible = false;
b2._visible = false;
b3._visible = false;
b4._visible = false;
b1._visible = false;
s2._visible = false;
s3._visible = false;
s4._visible = false;
s1._visible = false;
this.onEnterFrame = function()
{
   hr = _root.game.ennemies.ennemybase1.health / _root.game.ennemies.ennemybase1.max_health * 100;
   h = Math.round(_root.game.ennemies.ennemybase1.health);
   if(h < 0)
   {
      _root.end_game(false);
   }
   hb._yscale = hr;
   if(!_root.PAUSED)
   {
      base.gotoAndStop(_root.tech_level);
      e1.gotoAndStop(_root.tech_level);
      e2.gotoAndStop(_root.tech_level);
      e3.gotoAndStop(_root.tech_level);
      if(_root.addons == 0)
      {
         e1._visible = false;
         e2._visible = false;
         e3._visible = false;
      }
      else if(_root.addons == 1)
      {
         e1._visible = true;
         e2._visible = false;
         e3._visible = false;
      }
      else if(_root.addons == 2)
      {
         e1._visible = true;
         e2._visible = true;
         e3._visible = false;
      }
      else if(_root.addons == 3)
      {
         e1._visible = true;
         e2._visible = true;
         e3._visible = true;
      }
   }
};
