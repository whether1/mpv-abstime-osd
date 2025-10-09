# How to use
 I use portable version of mpv(windows), so just put the script to **\Desktop\execute\MPV\portable_config\scripts** works.  
(en) (cn)scripts differ in comment(english not skilled till now so reserve cn), **same in code**. 

**Dev details see docs**.  

# Key Mind : media start time = ModifyDate - Duration 
Because of create date maybe wrong due to copied file, **we use modify date**.  
similar scripts because [abs-screenshot issue#1](https://github.com/Thann/mpv-abs-screenshot/issues/1), **we use modify date**. 

# Test/Behavior/Example/Finish
picture  below is behavior when testing:we can fastly know the exactly time that cat-caught-the-bat  is  around 202509272320(Beijing Time).  
![test-ok](test-ok.jpg)

# Tigger/Cause/Start
~~We~~ I want mpv can show absolute timestamp like beijing 20251007 2:20 according to ~~create time~~ modify date when playing audio or video file , so we can know the exactly actual time of the specified sound wave or action picture happen in the .m4a or .mp4 file.  

Because vivo phone internal camera do not have timestamp like hikvision osd when capturing video, and it's hard work(high battery consumption,**~~china~~ india too poor**) to process the video file to add timestamp,  **we need player to finish the work**.  

# TO DO LIST/Reference/Research
1.maybe we can merge repo with [abs-screenshot](https://github.com/Thann/mpv-abs-screenshot)  
2.clipboard is good. [copyTime](https://github.com/Arieleg/mpv-copyTime)  
<table>
  <tr>
    <td>Windows</td>
    <td><code>Powershell Built-in since Windows 7</code></td>
    <td>✅ ok</td>
  </tr>
  <tr>
    <td>Linux/X11</td>
    <td><code>xclip</code></td>
    <td>❌not good</td>
  </tr>
  <tr>
    <td>Linux/Wayland</td>
    <td><code>xclip or wl-clipboard</code></td>
    <td>❌not good</td>
  </tr>
  <tr>
    <td>MacOS</td>
    <td><code>pbcopy</code></td>
    <td>❌not good</td>
  </tr>
</table>







