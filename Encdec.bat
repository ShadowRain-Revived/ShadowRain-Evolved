@Echo off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" Goto NO_PARAM
If "%1"=="-a" If "%2"=="%User%" If "%3"=="-p" If "%4"=="%confPass%" Goto Encrypt
If "%1"=="-u" If "%2"=="%User%" If "%3"=="-p" If "%4"=="%confPass%" Goto Decrypt
Exit

:NO_PARAM
Color 0C
Echo -- Unable to run file - No parameter is defined.
Exit

:Encrypt
Set "Format=usr\%User%" 
Goto EncryptPwd 

:EncryptPwd
Set "Password=%confPass%" 
Goto EncryptStg2

:EncryptStg2
Set num2=0
Set c=
Set /A num1=%num1%+1
Set /A num3=%num3%+1
If %num3%==1 Set c=%Password:~0,1%
If %num3%==2 Set c=%Password:~1,1%
If %num3%==3 Set c=%Password:~2,1%
If %num3%==4 Set c=%Password:~3,1%
If %num3%==5 Set c=%Password:~4,1%
If %num3%==6 Set c=%Password:~5,1%
If %num3%==7 Set c=%Password:~6,1%
If %num3%==8 Set c=%Password:~7,1%
If %num3%==9 Set c=%Password:~8,1%
If %num3%==10 Set c=%Password:~9,1%
If %num3%==11 Set c=%Password:~10,1%
If %num3%==12 Set c=%Password:~11,1%
If %num3%==13 Set c=%Password:~12,1%
If %num3%==14 Set c=%Password:~13,1%
If %num3%==15 Set c=%Password:~14,1%
If %num3%==16 Set c=%Password:~15,1%
If %num3%==17 Set c=%Password:~16,1%
If %num3%==18 Set c=%Password:~17,1%
If %num3%==19 Set c=%Password:~18,1%
If %num3%==20 Set c=%Password:~19,1%
If %num3%==21 Goto EncryptStg4

:EncryptStg3
If %num2%==0 Set L=
If %num2%==1 Set L=a
If %num2%==2 Set L=b
If %num2%==3 Set L=c
If %num2%==4 Set L=d
If %num2%==5 Set L=e
If %num2%==6 Set L=f
If %num2%==7 Set L=g
If %num2%==8 Set L=h
If %num2%==9 Set L=i
If %num2%==10 Set L=j
If %num2%==11 Set L=k
If %num2%==12 Set L=l
If %num2%==13 Set L=m
If %num2%==14 Set L=n
If %num2%==15 Set L=o
If %num2%==16 Set L=p
If %num2%==17 Set L=q
If %num2%==18 Set L=r
If %num2%==19 Set L=s
If %num2%==20 Set L=t
If %num2%==21 Set L=u
If %num2%==22 Set L=v
If %num2%==23 Set L=w
If %num2%==24 Set L=x
If %num2%==25 Set L=y
If %num2%==26 Set L=z
If %num2%==27 Set L=A
If %num2%==28 Set L=B
If %num2%==29 Set L=C
If %num2%==30 Set L=D
If %num2%==31 Set L=E
If %num2%==32 Set L=F
If %num2%==33 Set L=G
If %num2%==34 Set L=H
If %num2%==35 Set L=I
If %num2%==36 Set L=J
If %num2%==37 Set L=K
If %num2%==38 Set L=L
If %num2%==39 Set L=M
If %num2%==40 Set L=N
If %num2%==41 Set L=O
If %num2%==42 Set L=P
If %num2%==43 Set L=Q
If %num2%==44 Set L=R
If %num2%==45 Set L=S
If %num2%==46 Set L=T
If %num2%==47 Set L=U
If %num2%==48 Set L=V
If %num2%==49 Set L=W
If %num2%==50 Set L=X
If %num2%==51 Set L=Y
If %num2%==52 Set L=Z
If %num2%==53 Set L=1
If %num2%==54 Set L=2
If %num2%==55 Set L=3
If %num2%==56 Set L=4
If %num2%==57 Set L=5
If %num2%==58 Set L=6
If %num2%==59 Set L=7
If %num2%==60 Set L=8
If %num2%==61 Set L=9
If %num2%==62 Set L=0
Set e%num1%=
If "%c%"=="%L%" Set e%num1%=%num2%
If "%c%"==" " Set e%num1%=0
Set /A num2=%num2%+1
If Defined e%num1% Goto EncryptStg2
Goto EncryptStg3

:EncryptExt4
Set /A Rnum=%Rnum%-1

:EncryptStg4
Set /A Rnum=%Rnum%+1
Set rcheck=
Set rcheck2=
Set rcheck=%random:~0,4%
Set /A rcheck2=%rcheck%+63
If %rcheck% LSS 1063 Goto EncryptExt4
If %rcheck2% GTR 9999 Goto EncryptExt4
Set r%Rnum%=%rcheck%
If defined r20 Goto EncryptStg5
Goto EncryptStg4

:EncryptStg5
Set /A e1=%e1%+%r1%
Set /A e2=%e2%+%r2%
Set /A e3=%e3%+%r3%
Set /A e4=%e4%+%r4%
Set /A e5=%e5%+%r5%
Set /A e6=%e6%+%r6%
Set /A e7=%e7%+%r7%
Set /A e8=%e8%+%r8%
Set /A e9=%e9%+%r9%
Set /A e10=%e10%+%r10%
Set /A e11=%e11%+%r11%
Set /A e12=%e12%+%r12%
Set /A e13=%e13%+%r13%
Set /A e14=%e14%+%r14%
Set /A e15=%e15%+%r15%
Set /A e16=%e16%+%r16%
Set /A e17=%e17%+%r17%
Set /A e18=%e18%+%r18%
Set /A e19=%e19%+%r19%
Set /A e20=%e20%+%r20%
Echo %e1%%e2%%e3%%e4%%e5%%e6%%e7%%e8%%e9%%e10%%e11%%e12%%e13%%e14%%e15%%e16%%e17%%e18%%e19%%e20%>"usr\%User%.pwd"
Echo %r1%%r2%%r3%%r4%%r5%%r6%%r7%%r8%%r9%%r10%%r11%%r12%%r13%%r14%%r15%%r16%%r17%%r18%%r19%%r20%>"usr\%User%.key"
rem ; call back to UacSys later on - ignore for now
Echo Done, now booting startup.
Pause>Nul
Exit

:Decrypt
Set "UserFile=usr\%User%"
If Not Exist "%UserFile%.pwd" Goto ERRpwd
If Not Exist "%UserFile%.key" Goto ERRkey
Goto DecryptStg2

:DecryptStg2
Set /P UserKey= <"%UserFile%.key"
Set /P UserPwd= <"%UserFile%.pwd"
Set k1=%UserKey:~0,4%
Set k2=%UserKey:~4,4%
Set k3=%UserKey:~8,4%
Set k4=%UserKey:~12,4%
Set k5=%UserKey:~16,4%
Set k6=%UserKey:~20,4%
Set k7=%UserKey:~24,4%
Set k8=%UserKey:~28,4%
Set k9=%UserKey:~32,4%
Set k10=%UserKey:~36,4%
Set k11=%UserKey:~40,4%
Set k12=%UserKey:~44,4%
Set k13=%UserKey:~48,4%
Set k14=%UserKey:~52,4%
Set k15=%UserKey:~56,4%
Set k16=%UserKey:~60,4%
Set k17=%UserKey:~64,4%
Set k18=%UserKey:~68,4%
Set k19=%UserKey:~72,4%
Set k20=%UserKey:~76,4%
Set e1=%UserPwd:~0,4%
Set e2=%UserPwd:~4,4%
Set e3=%UserPwd:~8,4%
Set e4=%UserPwd:~12,4%
Set e5=%UserPwd:~16,4%
Set e6=%UserPwd:~20,4%
Set e7=%UserPwd:~24,4%
Set e8=%UserPwd:~28,4%
Set e9=%UserPwd:~32,4%
Set e10=%UserPwd:~36,4%
Set e11=%UserPwd:~40,4%
Set e12=%UserPwd:~44,4%
Set e13=%UserPwd:~48,4%
Set e14=%UserPwd:~52,4%
Set e15=%UserPwd:~56,4%
Set e16=%UserPwd:~60,4%
Set e17=%UserPwd:~64,4%
Set e18=%UserPwd:~68,4%
Set e19=%UserPwd:~72,4%
Set e20=%UserPwd:~76,4%

:DecryptStg3
Set num2=0
Set t=
Set /A num=%num%+1
If %num%==1 Set /A t=%e1%-%k1%
If %num%==2 Set /A t=%e2%-%k2%
If %num%==3 Set /A t=%e3%-%k3%
If %num%==4 Set /A t=%e4%-%k4%
If %num%==5 Set /A t=%e5%-%k5%
If %num%==6 Set /A t=%e6%-%k6%
If %num%==7 Set /A t=%e7%-%k7%
If %num%==8 Set /A t=%e8%-%k8%
If %num%==9 Set /A t=%e9%-%k9%
If %num%==10 Set /A t=%e10%-%k10%
If %num%==11 Set /A t=%e11%-%k11%
If %num%==12 Set /A t=%e12%-%k12%
If %num%==13 Set /A t=%e13%-%k13%
If %num%==14 Set /A t=%e14%-%k14%
If %num%==15 Set /A t=%e15%-%k15%
If %num%==16 Set /A t=%e16%-%k16%
If %num%==17 Set /A t=%e17%-%k17%
If %num%==18 Set /A t=%e18%-%k18%
If %num%==19 Set /A t=%e19%-%k19%
If %num%==20 Set /A t=%e20%-%k20%
If %num%==21 Goto DecryptStg5

:DecryptStg4
If %num2%==0 Set L=blank
If %num2%==1 Set L=a
If %num2%==2 Set L=b
If %num2%==3 Set L=c
If %num2%==4 Set L=d
If %num2%==5 Set L=e
If %num2%==6 Set L=f
If %num2%==7 Set L=g
If %num2%==8 Set L=h
If %num2%==9 Set L=i
If %num2%==10 Set L=j
If %num2%==11 Set L=k
If %num2%==12 Set L=l
If %num2%==13 Set L=m
If %num2%==14 Set L=n
If %num2%==15 Set L=o
If %num2%==16 Set L=p
If %num2%==17 Set L=q
If %num2%==18 Set L=r
If %num2%==19 Set L=s
If %num2%==20 Set L=t
If %num2%==21 Set L=u
If %num2%==22 Set L=v
If %num2%==23 Set L=w
If %num2%==24 Set L=x
If %num2%==25 Set L=y
If %num2%==26 Set L=z
If %num2%==27 Set L=A
If %num2%==28 Set L=B
If %num2%==29 Set L=C
If %num2%==30 Set L=D
If %num2%==31 Set L=E
If %num2%==32 Set L=F
If %num2%==33 Set L=G
If %num2%==34 Set L=H
If %num2%==35 Set L=I
If %num2%==36 Set L=J
If %num2%==37 Set L=K
If %num2%==38 Set L=L
If %num2%==39 Set L=M
If %num2%==40 Set L=N
If %num2%==41 Set L=O
If %num2%==42 Set L=P
If %num2%==43 Set L=Q
If %num2%==44 Set L=R
If %num2%==45 Set L=S
If %num2%==46 Set L=T
If %num2%==47 Set L=U
If %num2%==48 Set L=V
If %num2%==49 Set L=W
If %num2%==50 Set L=X
If %num2%==51 Set L=Y
If %num2%==52 Set L=Z
If %num2%==53 Set L=1
If %num2%==54 Set L=2
If %num2%==55 Set L=3
If %num2%==56 Set L=4
If %num2%==57 Set L=5
If %num2%==58 Set L=6
If %num2%==59 Set L=7
If %num2%==60 Set L=8
If %num2%==61 Set L=9
If %num2%==62 Set L=0
Set t%num%=
If %t%==%num2% Set t%num%=%L%
If Defined t%num% Goto DecryptStg3
Set /A num2=%num2%+1
Goto DecryptStg4

:DecryptStg5
If %t1%==blank Set "t1="
If %t2%==blank Set "t2="
If %t3%==blank Set "t3="
If %t4%==blank Set "t4="
If %t5%==blank Set "t5="
If %t6%==blank Set "t6="
If %t7%==blank Set "t7="
If %t8%==blank Set "t8="
If %t9%==blank Set "t9="
If %t10%==blank Set "t10="
If %t11%==blank Set "t11="
If %t12%==blank Set "t12="
If %t13%==blank Set "t13="
If %t14%==blank Set "t14="
If %t15%==blank Set "t15="
If %t16%==blank Set "t16="
If %t17%==blank Set "t17="
If %t18%==blank Set "t18="
If %t19%==blank Set "t19="
If %t20%==blank Set "t20="
Set "realPass=%t1%%t2%%t3%%t4%%t5%%t6%%t7%%t8%%t9%%t10%%t11%%t12%%t13%%t14%%t15%%t16%%t17%%t18%%t19%%t20%"
Pause>Nul
UacSys.bat -rp %realPass%