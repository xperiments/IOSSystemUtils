IOSSystemUtils
=========

IOSSystemUtils a little IOS ANE extension that lets you:

- Set the brightness of screen
- Enable / Disable iPhone Torch
- Set app Bagde count

Usage
--------------
Include the IOSSystemUtils.ane to your project. Current ane targets to device / simulator but simulator only reacts to setBadgeNumber method.

            var iosutils:IOSSystemUtils = new IOSSystemUtils( );
    		iosutils.setBrightnes( brightnes /* From 0 to 1 */);
			iosutils.setTorchEnabled( true/false );
			iosutils.setBadgeNumber( count /*uint badge count*/ );