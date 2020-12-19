@echo off
@title "XVM Main Files Zip Creator."

rem 7zip needs to be in PATH for this to work. Not the EXE, but the root folder (C:\7zip\).
rem Change the gameVersion, deployDate, XVMversion variables before each run.

@set "versionDir=versiondir"
@set "pack=7z a -tzip -mx0"
@set "unPack=7z x"
@set "gameVersion=1.11.0.0"
@set "deployDate=2020-12-19"
@set "zipFileName=LogicalDependency_XVM_Main"
@set "XVMbranch=Nightly"
@set "XVMversion=v8.7.1_0005"

@md XVM

%unPack% *.zip -oXVM
xcopy /v /s /y "_patch\" "XVM\_patch\"
xcopy /v /y "xvm.xc" "XVM\res_mods\configs\xvm\"

@cd XVM
@DEL *.txt

pause

cd res_mods\
RD %gameVersion%

@cd configs\xvm\
@del *.url
@del *.sample
@RD /q /s sirmax

pause

@xcopy /v /s /y "default\" "default_backup\"

pause

rem goes up three levels
@cd ..
@cd ..
@cd ..

%pack% %zipFileName%_%XVMbranch%_%XVMversion%_%gameVersion%_%deployDate%.zip "mods" "res_mods" "_patch"

cd ..
xcopy /v /y XVM\%zipFileName%_%XVMbranch%_%XVMversion%_%gameVersion%_%deployDate%.zip

rem clean up

DEL XVM

pause