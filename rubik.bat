@echo off
setlocal enabledelayedexpansion

set up_x_1= 0  1  2  3  5  6  7  8  9 10 11 18 19 20 27 28 29 36 37 38
set up_x_2= 2  5  8  1  7  0  3  6 36 37 38  9 10 11 18 19 20 27 28 29

set md_x_1=12 13 14 21 22 23 30 31 32 39 40 41
set md_x_2=39 40 41 12 13 14 21 22 23 30 31 32

set dw_x_1=15 16 17 24 25 26 33 34 35 42 43 44 45 46 47 48 50 51 52 53
set dw_x_2=42 43 44 15 16 17 24 25 26 33 34 35 51 48 45 52 46 53 50 47

set le_y_1= 0  3  6  9 12 15 29 32 35 36 37 38 39 41 42 43 44 51 52 53
set le_y_2= 9 12 15 51 52 53  6  3  0 38 41 44 37 43 36 39 42 35 32 29

set md_y_1= 1  4  7 10 13 16 28 31 34 48 49 50
set md_y_2=10 13 16 48 49 50  7  4  1 34 31 28

set ri_y_1= 2  5  8 11 14 17 18 19 20 21 23 24 25 26 27 30 33 45 46 47
set ri_y_2=11 14 17 45 46 47 24 21 18 25 19 26 23 20  8  5  2 33 30 27

set le_z_1= 6  7  8  9 10 11 12 14 15 16 17 18 21 24 38 41 44 45 48 51
set le_z_2=18 21 24 11 14 17 10 16  9 12 15 45 48 51  8  7  6 44 41 38

set md_z_1= 3  4  5 19 22 25 37 40 43 46 49 52
set md_z_2=19 22 25 46 49 52  5  4  3 43 40 37

set ri_z_1= 0  1  2 20 23 26 27 28 29 30 32 33 34 35 36 39 42 47 50 53
set ri_z_2=20 23 26 47 50 53 33 30 27 34 28 35 32 29  2  1  0 42 39 36

set keys_moves=zaxsbgnhdfcv
set keys_rotate=kilom,

set keys[%keys_moves:~0,1%]="%le_y_1%" "%le_y_2%"
set keys[%keys_moves:~1,1%]="%le_y_2%" "%le_y_1%"
set keys[%keys_moves:~2,1%]="%ri_y_1%" "%ri_y_2%"
set keys[%keys_moves:~3,1%]="%ri_y_2%" "%ri_y_1%"
set keys[%keys_moves:~4,1%]="%le_z_1%" "%le_z_2%"
set keys[%keys_moves:~5,1%]="%le_z_2%" "%le_z_1%"
set keys[%keys_moves:~6,1%]="%ri_z_1%" "%ri_z_2%"
set keys[%keys_moves:~7,1%]="%ri_z_2%" "%ri_z_1%"
set keys[%keys_moves:~8,1%]="%up_x_1%" "%up_x_2%"
set keys[%keys_moves:~9,1%]="%up_x_2%" "%up_x_1%"
set keys[%keys_moves:~10,1%]="%dw_x_1%" "%dw_x_2%"
set keys[%keys_moves:~11,1%]="%dw_x_2%" "%dw_x_1%"
set keys[%keys_rotate:~0,1%]="%le_y_1% %md_y_1% %ri_y_1%" "%le_y_2% %md_y_2% %ri_y_2%"
set keys[%keys_rotate:~1,1%]="%le_y_2% %md_y_2% %ri_y_2%" "%le_y_1% %md_y_1% %ri_y_1%"
set keys[%keys_rotate:~2,1%]="%le_z_1% %md_z_1% %ri_z_1%" "%le_z_2% %md_z_2% %ri_z_2%"
set keys[%keys_rotate:~3,1%]="%le_z_2% %md_z_2% %ri_z_2%" "%le_z_1% %md_z_1% %ri_z_1%"
set keys[%keys_rotate:~4,1%]="%up_x_1% %md_x_1% %dw_x_1%" "%up_x_2% %md_x_2% %dw_x_2%"
set keys[%keys_rotate:~5,1%]="%up_x_2% %md_x_2% %dw_x_2%" "%up_x_1% %md_x_1% %dw_x_1%"

set colors[0]= 
set colors[1]=[31m#[0m
set colors[2]=[34mO[0m
set colors[3]=[33m%%[0m
set colors[4]=[32m@[0m
set colors[5]=[93m.[0m

for /l %%f in (0, 1, 5) do (
	for /l %%x in (0,1,8) do (
		set /a res = %%f*9+%%x
		set a[!res!]=!colors[%%f]!
	)
)



:start
cls
echo   ____  _   _ ____ ___ _  ___
echo  ^|  _ \^| ^| ^| ^| __ ^)_ _^| ^|/ ^( ^)___
echo  ^| ^|_^) ^| ^| ^| ^|  _ \^| ^|^| ' /^|// __^|
echo  ^|  _ ^<^| ^|_^| ^| ^|_^) ^| ^|^| . \  \__ \
echo  ^|_^| \_\\___/^|____/___^|_^|\_\ ^|___/
echo     / ___^| ^| ^| ^| __ ^)^| ____^|
echo    ^| ^|   ^| ^| ^| ^|  _ \^|  _^|
echo    ^| ^|___^| ^|_^| ^| ^|_^) ^| ^|___
echo     \____^|\___/^|____/^|_____^|
echo             by GiAnMMV
pause

cls
echo Scrambling...
for /l %%f in (0, 1, 100) do (
	set /a res=!random! %% 12
	call call call:rotate %%%%keys[%%keys_moves:~!res!,1%%]%%%%
	<nul set /p=^|
)
set count=0
set proj=0

:loop
cls
if %proj%==0 (call:isometric) else (call:cabinet)

if defined com set com=!com:~1!
if not defined com (set /p "com=Enter command: ")
if not defined com goto loop

if /i !com!==exit cls & goto exit
if /i !com!==proj set /a "proj=(!proj!+1)%%2" & set com= & goto loop

call:rotate !keys[%com:~0,1%]!

if not "%keys_moves%"=="!keys_moves:%com:~0,1%=!" (
	set /a count+=1
	for /l %%f in (0, 9, 45) do (
		set /a res=%%f+1
		set /a res2=%%f+8
		for /l %%n in (!res!, 1, !res2!) do (
			if not !a[%%f]!==!a[%%n]! goto loop
		)
	)
	goto end
)
goto loop

:end
cls
echo You won^^! Congratulations^^!
echo You solved the cube in %count% moves.
pause
endlocal
exit /b

:exit
set /p com=Are you sure you want to exit? (Y/N) 
if /i %com%==y (
	endlocal
	exit /b
)
if /i %com%==n (
	set com=
	goto loop
)
echo Invalid selection.
goto exit

:isometric
echo          /\
echo         /%a[0]%%a[0]%\
echo        /%a[0]%%a[0]%%a[0]%%a[0]%\
echo       /\%a[0]%%a[0]%%a[0]%%a[0]%/\
echo      /%a[3]%%a[3]%\%a[0]%%a[0]%/%a[1]%%a[1]%\
echo     /%a[3]%%a[3]%%a[3]%%a[3]%\/%a[1]%%a[1]%%a[1]%%a[1]%\        Moves: %count%
echo    /\%a[3]%%a[3]%%a[3]%%a[3]%/\%a[1]%%a[1]%%a[1]%%a[1]%/\       +---------------------+
echo   /%a[6]%%a[6]%\%a[3]%%a[3]%/%a[4]%%a[4]%\%a[1]%%a[1]%/%a[2]%%a[2]%\      ^|      CONTROLS:      ^|
echo  /%a[6]%%a[6]%%a[6]%%a[6]%\/%a[4]%%a[4]%%a[4]%%a[4]%\/%a[2]%%a[2]%%a[2]%%a[2]%\     +----------+----------+
echo ^|\%a[6]%%a[6]%%a[6]%%a[6]%/\%a[4]%%a[4]%%a[4]%%a[4]%/\%a[2]%%a[2]%%a[2]%%a[2]%/^|    ^|MOVES     ^|ROTATIONS ^|
echo ^|\\%a[6]%%a[6]%/%a[7]%%a[7]%\%a[4]%%a[4]%/%a[5]%%a[5]%\%a[2]%%a[2]%//^|    ^|  U   d   ^|  X   i   ^|
echo ^|%a[9]%\\/%a[7]%%a[7]%%a[7]%%a[7]%\/%a[5]%%a[5]%%a[5]%%a[5]%\//%a[20]%^|    ^|  U'  f   ^|  X'  k   ^|
echo ^|%a[9]%%a[9]%\\%a[7]%%a[7]%%a[7]%%a[7]%/\%a[5]%%a[5]%%a[5]%%a[5]%//%a[20]%%a[20]%^|    ^|  D   v   ^|  Y   m   ^|
echo ^|%a[9]%%a[9]%^|\\%a[7]%%a[7]%/%a[8]%%a[8]%\%a[5]%%a[5]%//^|%a[20]%%a[20]%^|    ^|  D'  c   ^|  Y'  ,   ^|
echo ^|\%a[9]%^|%a[10]%\\/%a[8]%%a[8]%%a[8]%%a[8]%\//%a[19]%^|%a[20]%/^|    ^|  R   s   ^|  Z   l   ^|
echo ^|%a[12]%\^|%a[10]%%a[10]%\\%a[8]%%a[8]%%a[8]%%a[8]%//%a[19]%%a[19]%^|/%a[23]%^|    ^|  R'  x   ^|  Z'  o   ^|
echo ^|%a[12]%%a[12]%\%a[10]%%a[10]%^|\\%a[8]%%a[8]%//^|%a[19]%%a[19]%/%a[23]%%a[23]%^|    ^|  L   z   +----------+
echo ^|%a[12]%%a[12]%^|\%a[10]%^|%a[11]%\\//%a[18]%^|%a[19]%/^|%a[23]%%a[23]%^|    ^|  L'  a   ^|EXIT  exit^|
echo ^|\%a[12]%^|%a[13]%\^|%a[11]%%a[11]%\/%a[18]%%a[18]%^|/%a[22]%^|%a[23]%/^|    ^|  F   b   +----------+
echo ^|%a[15]%\^|%a[13]%%a[13]%\%a[11]%%a[11]%^|^|%a[18]%%a[18]%/%a[22]%%a[22]%^|/%a[26]%^|    ^|  F'  g   ^|CHANGE    ^|
echo ^|%a[15]%%a[15]%\%a[13]%%a[13]%^|\%a[11]%^|^|%a[18]%/^|%a[22]%%a[22]%/%a[26]%%a[26]%^|    ^|  B   h   ^|PROJECTION^|
echo ^|%a[15]%%a[15]%^|\%a[13]%^|%a[14]%\^|^|/%a[21]%^|%a[22]%/^|%a[26]%%a[26]%^|    ^|  B'  n   ^|      proj^|
echo  \%a[15]%^|%a[16]%\^|%a[14]%%a[14]%^|^|%a[21]%%a[21]%^|/%a[25]%^|%a[26]%/     +----------+----------+
echo   \^|%a[16]%%a[16]%\%a[14]%%a[14]%^|^|%a[21]%%a[21]%/%a[25]%%a[25]%^|/
echo    \%a[16]%%a[16]%^|\%a[14]%^|^|%a[21]%/^|%a[25]%%a[25]%/
echo     \%a[16]%^|%a[17]%\^|^|/%a[24]%^|%a[25]%/
echo      \^|%a[17]%%a[17]%^|^|%a[24]%%a[24]%^|/
echo       \%a[17]%%a[17]%^|^|%a[24]%%a[24]%/
echo        \%a[17]%^|^|%a[24]%/
echo         \^|^|/
echo          \/
exit /b 0

:cabinet
echo                         Moves: %count%
echo       ---------------// +---------------------+
echo      /%a[0]%%a[0]%%a[0]%%a[0]%/%a[1]%%a[1]%%a[1]%%a[1]%/%a[2]%%a[2]%%a[2]%%a[2]%//^| ^|      CONTROLS:      ^|
echo     /----/----/----//%a[20]%^| +----------+----------+
echo    /%a[3]%%a[3]%%a[3]%%a[3]%/%a[4]%%a[4]%%a[4]%%a[4]%/%a[5]%%a[5]%%a[5]%%a[5]%//^|%a[20]%^| ^|MOVES     ^|ROTATIONS ^|
echo   /----/----/----//%a[19]%^|/^| ^|  U   d   ^|  X   i   ^|
echo  /%a[6]%%a[6]%%a[6]%%a[6]%/%a[7]%%a[7]%%a[7]%%a[7]%/%a[8]%%a[8]%%a[8]%%a[8]%//^|%a[19]%^|%a[23]%^| ^|  U'  f   ^|  X'  k   ^|
echo /----/----/----//%a[18]%^|/^|%a[23]%^| ^|  D   v   ^|  Y   m   ^|
echo ^|%a[9]%%a[9]%%a[9]%%a[9]%^|%a[10]%%a[10]%%a[10]%%a[10]%^|%a[11]%%a[11]%%a[11]%%a[11]%^|^|%a[18]%^|%a[22]%^|/^| ^|  D'  c   ^|  Y'  ,   ^|
echo ^|%a[9]%%a[9]%%a[9]%%a[9]%^|%a[10]%%a[10]%%a[10]%%a[10]%^|%a[11]%%a[11]%%a[11]%%a[11]%^|^|/^|%a[22]%^|%a[26]%^| ^|  R   s   ^|  Z   l   ^|
echo ^|----+----+----^|^|%a[21]%^|/^|%a[26]%^| ^|  R'  x   ^|  Z'  o   ^|
echo ^|%a[12]%%a[12]%%a[12]%%a[12]%^|%a[13]%%a[13]%%a[13]%%a[13]%^|%a[14]%%a[14]%%a[14]%%a[14]%^|^|%a[21]%^|%a[25]%^|/  ^|  L   z   +----------+
echo ^|%a[12]%%a[12]%%a[12]%%a[12]%^|%a[13]%%a[13]%%a[13]%%a[13]%^|%a[14]%%a[14]%%a[14]%%a[14]%^|^|/^|%a[25]%/   ^|  L'  a   ^|EXIT  exit^|
echo ^|----+----+----^|^|%a[24]%^|/    ^|  F   b   +----------+
echo ^|%a[15]%%a[15]%%a[15]%%a[15]%^|%a[16]%%a[16]%%a[16]%%a[16]%^|%a[17]%%a[17]%%a[17]%%a[17]%^|^|%a[24]%/     ^|  F'  g   ^|CHANGE    ^|
echo ^|%a[15]%%a[15]%%a[15]%%a[15]%^|%a[16]%%a[16]%%a[16]%%a[16]%^|%a[17]%%a[17]%%a[17]%%a[17]%^|^|/      ^|  B   h   ^|PROJECTION^|
echo +--------------^|/       ^|  B'  n   ^|      proj^|
echo                         +----------+----------+
exit /b 0

:rotate
set r1=%~1
set r2=%~2

set x=0
for %%r in (%r1%) do (
	set r1[!x!]=%%r
	set l[!x!]=!a[%%r]!
	set /a x=!x!+1
)
set x=0
for %%r in (%r2%) do (
	set r2[!x!]=%%r
	set /a x=!x!+1
)
for /l %%r in (0, 1, %x%) do (
	set a[!r2[%%r]!]=!l[%%r]!
	set l[%%r]=
	set r1[%%r]=
	set r2[%%r]=
)
exit /b 0
