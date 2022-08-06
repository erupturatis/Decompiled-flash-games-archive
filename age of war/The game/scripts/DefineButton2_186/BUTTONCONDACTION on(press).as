on(press){
   if(_root.addons == 0)
   {
      if(_root.cash >= 1000)
      {
         _root.cash -= 1000;
         _root.addons = _root.addons + 1;
      }
   }
   else if(_root.addons == 1)
   {
      if(_root.cash >= 3000)
      {
         _root.cash -= 3000;
         _root.addons = _root.addons + 1;
      }
   }
   else if(_root.addons == 2)
   {
      if(_root.cash >= 7500)
      {
         _root.cash -= 7500;
         _root.addons = _root.addons + 1;
      }
   }
}
