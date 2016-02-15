# DCAvailability

Modifies the availability macros so that usage of API introduced after the Development Target causes a deprecation warning.

Any such libraries will be weak linked (which is the usual behaviour of the old macros and the availability attributes).

[![Version](https://img.shields.io/cocoapods/v/DCAvailability.svg?style=flat)](http://cocoapods.org/pods/DCAvailability)
[![License](https://img.shields.io/cocoapods/l/DCAvailability.svg?style=flat)](http://cocoapods.org/pods/DCAvailability)
[![Platform](https://img.shields.io/cocoapods/p/DCAvailability.svg?style=flat)](http://cocoapods.org/pods/DCAvailability)

## Installation

DCAvailability is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "DCAvailability"

## Usage

Change your precompiled header file to import DCAvailability.h instead of Availability.h:

    #import <DCAvailability.h>

**NOTE: Does not work as simply with modules enabled (see below)**

*If you handle such calls at runtime, e.g. using respondsToSelector, you can ignore the warnings like this:*

    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
        if([something respondsToSelector:@selector(doSomething)]) {
            [something doSomething];
        }
    #pragma clang diagnostic pop

## Modules

When modules are enabled, frameworks are added automatically when imported, and the code is only compiled one time no matter how many times you import it. This means that there is no way to redefine the macros that we need. Well, you can, but they are only redefined for use in your code, the module has already been compiled before you redefine the macro. This is actually specifically pointed out as a benefit - modules are not susceptible to local macro redefinition.

You have to turn off modules for DCAvailability to work.

***All is not lost however***

It's still relatively simple to work around it. It means that the checking is not going to be done automatically every time you build, but it will still give you a scheme to select to do check manually from time to time - it's better than nothing.

**How to use DCAvailability with modules enabled**

* Duplicate your Debug configuration, call it Availability
* Duplicate your app target, call it Availability, use the same Info.plist file (multiple targets? duplicate them all)
* Create a scheme called Availability (one may have been autocreated when you added the new target) which builds the Availability target(s) using the Availability configuration
* Create a group called Availability
* Add a prefix header (put it in the group to keep things tidy)
* Edit the configuration to disable modules, use the prefix header, precompile the prefix header
* Add any frameworks that you use to the Availability target(s) (put them in the group to be tidy)

Now, when you want to check that you have not used anything that might not be available at runtime, build the Availability scheme.

## Author

David Clark, davidkclark@gmail.com

## License

DCAvailability is available under the MIT license. See the LICENSE file for more info.
