# duplicati-adm

__Duplicati version__: _`BETA 2.0.6.3`_

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

## How to update Gitea for ADM ?

When an update is available you can do it directly from APP CENTRAL in ADM. If you want to do it manually, nothing could be easier. Uninstall Duplicati and install the new version all your data will be kept.

## An issue or a request ?

You can report a problem, ask for help or make changes at any time by following this [link](https://github.com/EndMove/duplicati-adm/issues/new). Remember that I am not the developer of Gitea but of Gitea-ADM.
