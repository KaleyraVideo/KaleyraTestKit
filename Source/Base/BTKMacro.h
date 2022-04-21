// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

#ifndef __SUPPRESS_WARNINGS_FOR_TEST_BEGIN
 #define __SUPPRESS_WARNINGS_FOR_TEST_BEGIN \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \"-Wimplicit-retain-self\"") \
    _Pragma("clang diagnostic ignored \"-Wunused-value\"") \
    _Pragma("clang diagnostic ignored \"-Wnonnull\"")
#endif

#ifndef __SUPPRESS_WARNINGS_FOR_TEST_END
 #define __SUPPRESS_WARNINGS_FOR_TEST_END \
    _Pragma("clang diagnostic pop")
#endif

#define _BTKRunIfOSVersionAtLeastSkippable(_version, _message, _statements) \
    do { \
           if (@available(iOS _version, *)) \
            { \
               _statements \
            } else \
            { \
                XCTSkip(_message); \
            } \
    } while(0)

#define _BTKRunIfOSVersionAtLeastNonSkippable(_version, _message, _statements) \
    do { \
           if (@available(iOS _version, *)) \
            { \
               _statements \
            } else \
            { \
                NSLog(@"Skipping Test %@ because it exercises functionality that require iOS version at least %.2f", NSStringFromSelector(_cmd), _version); \
            } \
    } while(0)

#define _BTKRunIfOSVersionBelowSkippable(_version, _message, _statements) \
    do { \
           if (@available(iOS _version, *)) \
            { \
                 XCTSkip(_message); \
            } else \
            { \
                _statements \
            } \
    } while(0)

#define _BTKRunIfOSVersionBelowNonSkippable(_version, _message, _statements) \
    do { \
           if (@available(iOS _version, *)) \
            { \
               NSLog(@"Skipping Test %@ because it exercises functionality that require iOS version below %.2f", NSStringFromSelector(_cmd), _version); \
            } else \
            { \
                _statements \
            } \
    } while(0)

#ifdef XCTSkip
    #define BTKRunIfOSVersionAtLeast(_version, _message, _statements) \
        _BTKRunIfOSVersionAtLeastSkippable(_version, _message, _statements)
#else
    #define BTKRunIfOSVersionAtLeast(_version, _message, _statements) \
        _BTKRunIfOSVersionAtLeastNonSkippable(_version, _message, _statements)
#endif


#ifdef XCTSkip
#define BTKRunIfOSVersionBelow(_version, _message, _statements) \
    _BTKRunIfOSVersionBelowSkippable(_version, _message, _statements)
#else
#define BTKRunIfOSVersionBelow(_version, _message, _statements) \
    _BTKRunIfOSVersionBelowNonSkippable(_version, _message, _statements)
#endif
