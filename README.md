# Windows Configuration Script

This PowerShell script automates a series of configurations on a Windows machine, such as disabling firewalls and Windows Defender protections, disabling IPv6, and configuring Remote Desktop. Use it with caution, as the changes made can have security implications on the system.

## Features

1. **Firewall Disabling**:
   - Disables the firewall for all profiles: Domain, Public, and Private.

2. **Windows Defender Security Modifications**:
   - Disables real-time protection.
   - Disables cloud-based protection.
   - Disables automatic sample submission to Microsoft.

3. **Internet Explorer Enhanced Security Configuration (IE ESC)**:
   - Disables IE ESC for both administrators and users.

4. **Time Zone Configuration**:
   - Sets the time zone to UTC+1 (Rome).

5. **IPv6 Disabling**:
   - Disables IPv6 on all active network adapters.

6. **Remote Desktop (RDP) Enabling**:
   - Enables RDP and allows connections through the firewall.

## Usage Instructions

1. **Download the script**:
   - Clone this repository or download the `.ps1` file directly.

2. **Run the script**:
   - Open PowerShell as Administrator.
   - Run the following command:
     ```powershell
     .\script.ps1
     ```

3. **Verify the changes**:
   - After executing the script, the following modifications will be applied:
     - Firewalls disabled.
     - Windows Defender protection disabled.
     - IE ESC disabled.
     - Time zone set to UTC+1.
     - IPv6 disabled.
     - RDP enabled.

## Warnings

- **Security**: This script disables several security features, such as the firewall and Windows Defender real-time protection. It is intended for use in testing environments or cases where these configurations are necessary. Do not use it in production environments without fully understanding the risks.

- **Permanent Changes**: The changes made are permanent until manually reverted. Make sure to back up your settings before running the script.

## Contributions

If you'd like to contribute to improving this script, feel free to open a pull request or create an issue in the repository.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
