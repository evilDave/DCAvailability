# DCAvailability

Modifies the availability macros so that usage of API introduced after the Development Target causes a deprecation warning.

Any such libraries will be weak linked (which is the usual behaviour of the old macros and the availability attributes).

To use, change your precompiled header file to import DCAvailability.h instead of Availability.h:

    #import <DCAvailability.h>


*If you handle such calls at runtime, e.g. using respondsToSelector, you can ignore the warnings like this:*

    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
        if([something respondsToSelector:@selector(doSomething)]) {
            [something doSomething];
        }
    #pragma clang diagnostic pop
