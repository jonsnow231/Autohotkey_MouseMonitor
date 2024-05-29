Alt & Q::
{
    ; Get the current monitor
    CoordMode, Mouse, Screen
    MouseGetPos, currentMouseX, currentMouseY
    currentMonitor := GetMonitorAtPoint(currentMouseX, currentMouseY)

    ; Get the screen dimensions of the other monitor
    if (currentMonitor = 1)
    {
        SysGet, otherMonitor, Monitor, 2
    }
    else
    {
        SysGet, otherMonitor, Monitor, 1
    }

    ; Calculate the center coordinates of the other monitor's screen
    otherMonitorCenterX := otherMonitorLeft + (otherMonitorRight - otherMonitorLeft) // 2
    otherMonitorCenterY := otherMonitorTop + (otherMonitorBottom - otherMonitorTop) // 2

    ; Alternatively, using SysGet MonitorWorkArea (if you want to center on work area, not full screen)
    otherMonitorCenterX := otherMonitorLeft + (otherMonitorRight - otherMonitorLeft) // 2
    otherMonitorCenterY := otherMonitorTop + (otherMonitorBottom - otherMonitorTop) // 2

    ; Move the mouse to the center of the other monitor's screen
    MouseMove, otherMonitorCenterX, otherMonitorCenterY, 0
}

GetMonitorAtPoint(x, y)
{
    SysGet, monitorCount, MonitorCount
    Loop, %monitorCount%
    {
        SysGet, monitor, Monitor, %A_Index%
        if (x >= monitorLeft && x <= monitorRight && y >= monitorTop && y <= monitorBottom)
        {
            return A_Index
        }
    }
    return 1 ; Default to the primary monitor if no match is found
}
return
