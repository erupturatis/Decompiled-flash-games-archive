var file = File.desktopDirectory.resolvePath("MyTextFile.txt");
var stream = new FileStream();
stream.open(file,FileMode.WRITE);
stream.writeUTFBytes("This is my text file.");
stream.close();
gotoAndPlay(1);
