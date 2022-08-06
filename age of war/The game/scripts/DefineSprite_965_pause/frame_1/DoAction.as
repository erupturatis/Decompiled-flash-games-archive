ad = false;
_X = 325;
_Y = 225;
this.onEnterFrame = function()
{
   if(Key.isDown(32))
   {
      if(!ad)
      {
         if(_root.PAUSED == true)
         {
            _root.PAUSED = false;
            this._visible = false;
            _root.menu._visible = true;
         }
         else if(_root.PAUSED == false)
         {
            _root.PAUSED = true;
            this._visible = true;
            _root.menu._visible = false;
         }
         ad = true;
      }
   }
   else
   {
      ad = false;
   }
};
