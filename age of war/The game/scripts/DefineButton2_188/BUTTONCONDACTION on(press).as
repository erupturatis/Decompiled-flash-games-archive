on(press){
   if(_root.tech_level < 5)
   {
      needed = _root.EV[_root.tech_level - 1];
      if(_root.xp >= needed)
      {
         _root.tech_level = _root.tech_level + 1;
         _root.game.ennemies.ennemybase1.max_health += 300 * _root.tech_level;
         _root.game.ennemies.ennemybase1.health += 300 * _root.tech_level;
      }
   }
}
