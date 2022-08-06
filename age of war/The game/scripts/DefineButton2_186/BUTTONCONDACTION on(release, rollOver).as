on(release, rollOver){
   if(_root.addons == 0)
   {
      price = 1000;
   }
   else if(_root.addons == 1)
   {
      price = 3000;
   }
   else if(_root.addons == 2)
   {
      price = 7500;
   }
   if(_root.addons != 3)
   {
      _parent.desc.text = price + "$ - Add a turret spot";
   }
   else
   {
      _parent.desc.text = "Can\'t build any more";
   }
}
