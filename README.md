# DCAvailability

[![CI Status](http://img.shields.io/travis/David Clark/DCAvailability.svg?style=flat)](https://travis-ci.org/David Clark/DCAvailability)
[![Version](https://img.shields.io/cocoapods/v/DCAvailability.svg?style=flat)](http://cocoapods.org/pods/DCAvailability)
[![License](https://img.shields.io/cocoapods/l/DCAvailability.svg?style=flat)](http://cocoapods.org/pods/DCAvailability)
[![Platform](https://img.shields.io/cocoapods/p/DCAvailability.svg?style=flat)](http://cocoapods.org/pods/DCAvailability)

**NOTE: Does not work with modules enabled** - need to figure out how Availability.h gets included and how to redefine the macros. I thought that just by adding a prefix header and importing DCAvailability.h would work but the macros don't seem to get modified. I don't know enough about how modules work to fix this at the moment.

Modifies the availability macros so that usage of API introduced after the Development Target causes a deprecation warning.

Any such libraries will be weak linked (which is the usual behaviour of the old macros and the availability attributes).

## Installation

DCAvailability is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "DCAvailability"

## Usage

Change your precompiled header file to import DCAvailability.h instead of Availability.h:

    #import <DCAvailability.h>

*If you handle such calls at runtime, e.g. using respondsToSelector, you can ignore the warnings like this:*

    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
        if([something respondsToSelector:@selector(doSomething)]) {
            [something doSomething];
        }
    #pragma clang diagnostic pop

## Author

David Clark, davidkclark@gmail.com

## License

DCAvailability is available under the MIT license. See the LICENSE file for more info.
