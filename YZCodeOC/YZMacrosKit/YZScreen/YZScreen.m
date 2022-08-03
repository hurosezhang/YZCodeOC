//
//  YZScreen.m
//  CDM
//
//  Created by jonzhang on 2019/11/6.
//  Copyright © 2019 Alibaba. All rights reserved.
//

#import "YZScreen.h"

@implementation YZScreen

+ (BOOL)isLandscape
{
    if (@available(iOS 13.0, *)) {
        UIWindow *firstWindow = [[[UIApplication sharedApplication] windows] firstObject];
        if (firstWindow == nil) { return NO; }

        UIWindowScene *windowScene = firstWindow.windowScene;
        if (windowScene == nil){ return NO; }

        return UIInterfaceOrientationIsLandscape(windowScene.interfaceOrientation);
    } else {
        return (UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation));
    }
}

+ (CGFloat)statusBarHeight {
    float statusBarHeight = 0;
    if (@available(iOS 13.0, *)) {
        UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;
        statusBarHeight = statusBarManager.statusBarFrame.size.height;
    }
    else {
        statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    }
    return statusBarHeight;
    
}

+ (CGSize)sizeFor12proMaxInch {
    return CGSizeMake(428,926);

}
+ (CGSize)sizeFor1212proInch {
    return CGSizeMake(390,844);

}

// iphone 12 mini
+ (CGSize)sizeFor12MinInch {
    return CGSizeMake(360,780);

}

//iphone xs max
+ (CGSize)sizeFor65Inch{
    return CGSizeMake(414,896);
}

//iphone xr
+ (CGSize)sizeFor61Inch{
    return CGSizeMake(414,896);
}

// iphonex
+ (CGSize)sizeFor58Inch{
    return CGSizeMake(375,812);
}
//plus
//4 /5

@end
