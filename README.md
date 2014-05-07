* Adding with layman:

  layman -a sigrok

  See http://wiki.gentoo.org/wiki/Layman for info on using layman.

Note: I don't do any cross-version testing (trying to use older versions of sigrok-cli with a newer libsigrok, for example). If you find a dependency on a specific version, please file a bug or make a pull request to add it!

For libsigrokdecode, it is necessary to select a PYTHON_SINGLE_TARGET of a python3 variant
You can do this by

    echo sci-electronics/libsigrokdecode python_single_target_python3_3 >> /etc/portage/package.use

Or something similar.

* Packages (working)
  * libsigrok
  * libsigrokdecode
  * sigrok-cli
  * pulseview
  * sigrok-firmware
  * sigrok-firmware-fx2lafw
  * sigrok-firmware-fx2lafw-bin
  * libserialport

* Todo
  * fpgalafw

