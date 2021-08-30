#/usr/bin/python3
import os
import sys

def exec_cmd(cmd):
    r = os.popen(cmd)
    text = r.read().strip()
    r.close()
    return text

cur_path = os.path.dirname(sys.argv[0])
cmd = "busybox ls -1 " + cur_path + "\*.exe | sed {s/.exe//g}"
#print(cmd)

ret = exec_cmd(cmd)
ret = ret.split("\n")
for line in ret:
    exe = os.path.basename(line)
    cmd = "reg add HKCU\Software\Sysinternals /ve /t REG_SZ /d " + exe + " /f"
    os.system(cmd)
    cmd = "reg add HKCU\Software\Sysinternals\\" + exe + " /v EulaAccepted /t REG_DWORD /d 0x00000001 /f"
    os.system(cmd)
    print(cmd)

#!/bin/sh

#for exe in `cd /winix/Sysinternals/; ls -1 *.exe | sed {s/.exe//g}`; do
    #echo $exe
#	reg add "HKCU\Software\Sysinternals" /ve /t REG_SZ /d "$exe" /f
#	reg add "HKCU\Software\Sysinternals\\$exe" /v "EulaAccepted" /t REG_DWORD /d 0x00000001 /f 
#done