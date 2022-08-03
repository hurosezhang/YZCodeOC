//
//  YZBaseObject.m
//  YZCodeOC
//
//  Created by zhangyongkang01 on 2021/12/10.
//

#import "YZBaseObject.h"
#include <objc/runtime.h>

@implementation YZBaseObject

void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@" >> dynamicMethodIMP");
    NSLog(@"【iOS】%@ ", NSStringFromSelector(_cmd));
    NSLog(@"====%s", __func__);
}
  
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
    return YES;
}
@end
