# BanDefaultKeyboard
Ban your Windows laptop keyboard with ONLY one click, significantly more elegantly than alternative methods.

---
# WHY？
## Message from the original author
   Hey, guys! Have you ever experienced some awkward moments, when you want to put your mechanical keyboard on your windows laptop, and find the size doesn't match ruining the whole typing experience or even force you to move your keyboard to other part of the desk? Yes, it's awful. And what make it worse, when you want to change the Windows setting to ban the default keyboard, the existing options always ask you to open the control panel balabala or just type some not so practical commend lines (yes, they do their jobs, but you don't want a lecture for how the circuit works in order to turn a light off). 
   WHY is it so complex? ALL I WANT is just a button to disable the keyboard for the moment! It can be solved by a simple bat script! What are you doing , microsoft?  
     
![assets](/assets/BanDefaultKeyboard.png "Yes, I designed an icon for a kindergarten-level script")  
  
   Because they won't do it for me, so I self-taught myself how to write the bat script, and upload it here, it's not perfect, but at least it is serviceable. And to make it looks better, I designed an icon myself , hoping someday I can make it a better one, maybe an small app, make it more user friendly and can be installed more elegantly. It's just a bat, so basicly you can put it anywhere.  
   Personally, I recommend you to put these files in a non-system disk， and just put the .ink file in the startup menu where the .ink files of your other softwares are.
  
---
## Commendlines:
  
### Activating the default laptop keyboard  
~~~
sc config i8042prt start= demand  
~~~
  
### Deactivating the default laptop keyboard
~~~
sc config i8042prt start= disabled
~~~

## HOWEVER
### Microsoft decides it is a good idea that users must reboot to activate either of the commendlines mentioned above.
In which case, you have to reboot, if you want to ban your default keyboard. Moreover, considering there is the possibility that some of you may accidentally activate the script, I added following code to confirm your choice.
~~~
echo Windows thinks it is needed to REBOOT to make such a small change !!! 
echo THAT'S NOT COOL ,Microsoft !
echo So are you willing to pay the price for deactivating/activating your default laptop keyboard for now ? [y/n]
set /p choice=

IF %choice% == y  (
    echo Here we go!
) ELSE (
    IF %choice% == Y  (
        echo Here we go!
    ) ELSE (
        echo Bye~ Hope those genius from Microsoft will fix this some day!
        GOTO :EOF
    )
)
~~~
