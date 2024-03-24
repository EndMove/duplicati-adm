# duplicati-adm

__Duplicati version__: _`BETA 2.0.7.1`_

![GitHub license](https://img.shields.io/badge/license-GPL--3.0-%23fe7d37) ![GitHub last commit](https://img.shields.io/github/last-commit/EndMove/duplicati-adm)

[![Donate][link-icon-coffee]][link-paypal-me] [![Website][link-icon-website]][link-website]

[link-icon-coffee]: https://img.shields.io/badge/%E2%98%95-Buy%20me%20a%20cup%20of%20coffee-991481.svg
[link-paypal-me]: https://www.paypal.me/EndMove/2.5eur
[link-icon-website]: https://img.shields.io/badge/%F0%9F%92%BB-My%20Web%20Site-0078D4.svg
[link-website]: https://www.endmove.eu/

duplicati-adm is an application for ADM the operating system of [ASUSTOR](https://www.asustor.com/) the server brand of [ASUS](https://www.asus.com/).
This application uses the Duplicati project available here [here](https://github.com/duplicati/duplicati).

## Requirements

- Framework/Library Mono (>=6.12.0.0.r01) ;
- Framework/Library Perl (>=5.32.0.r5.4) ;
- server with an x86-64 or arm64 architecture ;
- ADM (>=3.5.0) ;

## Installation

Download the `.apk` file available in the release versions
of this repository.

Go to `APP Central >> Manage >> Manual Installation`.

Select the application `.apk` and follow the installation process.

__:warning: This application is not an Android application !__

## Configuration folder

This application will create a folder in `/volume1/.@plugins/AppCentral/duplicati/config`, this folder will contain all configuration files, and the sqlite embedded database.

## Configuration

It is essential for the application to be configured from the panel, if any changes are made directly in the files it can lead to structural destruction of the embedded database.

## Information

### App description

- Description in English [here](https://raw.githubusercontent.com/EndMove/duplicati-adm/master/CONTROL/description.txt).
- Description in French [here](https://raw.githubusercontent.com/EndMove/duplicati-adm/master/CONTROL/description-fr.txt).

### SSL/HTTPS (Unstable)

At the moment the use of Duplicati with an SSL certificate is not reliable. Indeed it happens that when restarting duplicati in HTTPS the web server crashes, once this happens one time, it does not stop until HTTP is used again. The source of the problem has not yet been found.

If you want to use HTTPS anyway, edit the `/volume1/.@plugins/AppCentral/duplicati/CONTROL/start-stop.sh` file and add the following two parameters to the startup command, line 23 :

```sh
--webservice-sslcertificatefile="$DUPLICATI_CRT" --webservice-sslcertificatepassword=root
```

## How to update Duplicati for ADM ?

When an update is available you can do it directly from APP CENTRAL in ADM. If you want to do it manually, nothing could be easier. Uninstall Duplicati and install the new version all your data will be kept.

## An issue or a request ?

You can report a problem, ask for help or make changes at any time by following this [link](https://github.com/EndMove/duplicati-adm/issues/new). Remember that I am not the developer of Duplicati but of Duplicati-ADM.