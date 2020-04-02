# NAME

### Change Argument "Created File"in Movie Files - MP4 and MOV

# DESCRIPTION

In my image manager (ACDSee) I rename the files based in his created date. This is simple considering pictures, but videos, including that are not made by me, are terrible. 

Here, we have 2 simple functions that look inside the files (using the [exiftool](https://exiftool.org) )and check  in the metadata the **real date** that they are created. After, they put this informations in "CREATED FILE" attribute of the file.

The problem is that the arguments of *MP4* (created in my phone, Samsung) and *MOV* (created in my wife's phone, iPhone) to check the **"real date"** is different. Because this I had to write one function for each type of video.

*MOV* files are a lot easier, because they have all the information inside, in the way must be. The *MP4* create the date/time based in UTC 0 time zone. Means: that if you are in Orlando, FL like me, you have to change the value to UTC -5 (or UTC -4 in daylight saving time). In *MOV* files this information is clear. I wanna see the date/time of the movie was shoot in the place they are shoot, not in my UTC time (if is different of the place I'm looking now).

I didn't found any argument where this information is shown in *MP4* files. I read in the website https://exiftool.org that *MP4* files doesn't handle UTC timezone well.

This means that the ***datemov*** function only needs the file argument. In ***datemp4*** function you need pass the UTC timezone of your place (or picture) are recorded and the file to change.

# SYNOPSIS

```
datemov <file.mov>
datemp4 utcnumber <file.mp4>
```

Example for **Eastern Time** (no daylight saving time):

```
datemp4 5 moviefile.mp4	
```

# PREREQUISITES

https://exiftool.org - you can install by homebrew in Mac Terminal! (brew install exiftool)

# INSTALLATION

I put inside my .ZSHRC file, so I can call any time that I want. But you can create a shell file.

# AUTHOR

Eduardo Carreiro  [contact@wpcwebdesign.com](mailto:contact@wpcwebdesign.com)

# COPYRIGHT AND LICENSE

This software is copyright (c) 2020 by Eduardo Carreiro.

This is free software; you can redistribute it and/or modify and give suggest to improve. Like I said, I don't have to much knowledge in shell script
