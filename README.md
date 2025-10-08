## Tigger/Cause/Start

~~We~~ I want mpv can show absolute timestamp like beijing 20251007 2:20 according to ~~create time~~ modify date when playing audio or video file , so we can know the exactly time of the specified sound wave or action picture happen in the .m4a or .mp4 file.  

Because vivo phone internal camera do not have timestamp when capture video like hikvision osd,and it's hard work(high battery consumption) to process the video file to add timestamp,  we need player to finish the work.  

Because of create date maybe wrong due to copied file,we use modify date.  

(en) (cn)script differ in comment，same in code.  

## How to use

I use portable version of mpv,so put the script to **\Desktop\execute\MPV\portable_config\scripts** works.  

Dev details see docs.  

## Test/Finish
picture  below is behavior when testing:we can fastly know the cat catch the bat time is  Beijing Time around 202509272320.  
![test-ok](test-ok.jpg)

