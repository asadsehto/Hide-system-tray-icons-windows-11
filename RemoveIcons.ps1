# TO REMOVE ICONS USING POWERSHELL

# Enable policies to remove network, battery, and sound icons from taskbar/system tray

# Remove network icon
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCANetwork" -Value 1 -Type DWord

# Remove battery icon
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCABattery" -Value 1 -Type DWord

# Remove volume control icon
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCAVolume" -Value 1 -Type DWord



TO REMOVE ICONS USING C#

# Enable policies to remove network, battery, and sound icons from taskbar/system tray

using Microsoft.Win32;
using System;

class Program
{
    static void Main(string[] args)
    {
        // Registry path for network icon visibility settings
        string networkPath = @"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer";

        // Hide network icon
        SetRegistryValue(networkPath, "HideSCANetwork", 1);

        // Registry path for volume control icon visibility settings
        string volumePath = @"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer";

        // Hide volume control icon
        SetRegistryValue(volumePath, "HideSCAVolume", 1);

        // Refresh the desktop to apply changes
        var shell = new System.Diagnostics.ProcessStartInfo();
        shell.FileName = "cmd.exe";
        shell.Arguments = "/C rundll32.exe user32.dll, UpdatePerUserSystemParameters";
        shell.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
        System.Diagnostics.Process.Start(shell);

        // Inform the user
        Console.WriteLine("Network and volume icons have been hidden.");
    }

    // Function to set registry value
    static void SetRegistryValue(string path, string name, int value)
    {
        Registry.SetValue(path, name, value, RegistryValueKind.DWord);
    }
}


