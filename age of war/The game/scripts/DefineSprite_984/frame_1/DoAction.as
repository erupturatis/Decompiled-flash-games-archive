lb._xscale = _root.getBytesLoaded() / _root.getBytesTotal() * 100;
if(lb._xscale == 100)
{
   _root.gotoAndPlay("loaded");
}
