on(rollOver){
   if(_root.tech_level < 5)
   {
      needed = _root.EV[_root.tech_level - 1];
      _parent.desc.text = needed + " Xp - Evolve to next age";
   }
   else
   {
      _parent.desc.text = "You cannot evolve anymore";
   }
}
