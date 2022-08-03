//
//  YZItemCell.h
//  YZCodeOC
//
//  Created by zhangyongkang01 on 2021/8/25.
//

#import <UIKit/UIKit.h>
#import "YZItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YZItemCell : UITableViewCell

@property(nonatomic,strong)YZItemModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
