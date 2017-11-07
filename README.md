# smartMon
This is the simple bash software based on smartctl software.

After start, smartMon compare selected (smartmon.conf) parameters from smartctl output to values read last time.
If there are some differences, smartmon log this and run external software.

### Install/uninstall
**make install** - put requred files into Your system.
**make uninstall** - remove program from Your system.

Tip: to change 'root' dir, export **DESTDIR=/some/other/**.

### How to use
Install.
Edit smartmon.conf.
```
# example smartmon.conf

devt=(
#   'device'   'device type'``
    '/dev/hda' ''
    '/dev/sdb' 'sat'
)

params=(
    Raw_Read_Error_Rate
    Reallocated_Sector_Ct
    Reallocated_Event_Count
    Current_Pending_Sector
    UDMA_CRC_Error_Count
)
```
**Usage: smartmon [-s][-e][-h]**
-s silent mode (log to syslogd)
-e allow 'on error' exec
-h this help

**Example (crontab):**
``0 * * * * /usr/sbin/smartmon -s -e``

