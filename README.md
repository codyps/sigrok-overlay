sigrok-overlay
==============


Adding with layman
------------------

    layman -a sigrok

See http://wiki.gentoo.org/wiki/Layman for info on using layman.

Bugs?
-----

Note: I don't do any cross-version testing (trying to use older versions of sigrok-cli with a newer libsigrok, for example). If you find a dependency on a specific version, please file a bug or make a pull request to add it!


libsigrokdecode PYTHON_SINGLE_TARGET
------------------------------------

For libsigrokdecode, it is necessary to select a PYTHON_SINGLE_TARGET of a python3 variant
You can do this by

    pyver=python_single_target_python3_3
    usefile=/etc/portage/package.use
    echo sci-electronics/libsigrokdecode $pyver >> $usefile
    # also need to set for sigrok-cli and pulseview if they use
    # libsigrokdecode
    echo sci-electronics/sigrok-cli $pyver >> $usefile
    echo sci-electronics/pulseview $pyver >> $usefile

Or something similar.



Packages
--------

  * libsigrok
  * libsigrokdecode
  * sigrok-cli
  * pulseview
  * sigrok-firmware
  * sigrok-firmware-fx2lafw
  * sigrok-firmware-fx2lafw-bin
  * libserialport
