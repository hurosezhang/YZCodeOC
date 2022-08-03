//
//  YZCollectionCell.m
//  YZCodeOC
//
//  Created by zhangyongkang01 on 2021/5/8.
//

#import "YZCollectionCell.h"

@implementation YZCollectionCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentView.backgroundColor = [UIColor brownColor];
    }
    return self;
}
@end
