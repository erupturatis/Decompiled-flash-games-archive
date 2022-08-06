on(press){
   _parent.stc._visible = true;
   _parent.m1._visible = false;
   _parent.m2._visible = false;
   _parent.mt.text = "Sell a turret";
   _parent.desc.text = "";
   _root.cursor.mod = 3;
   _root.show_sell_turrets();
}
