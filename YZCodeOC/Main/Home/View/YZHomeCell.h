//
//  YZHomeCell.h
//  YZCodeOC
//
//  Created by mac on 2022/11/30.
//

#import <UIKit/UIKit.h>
#import "YZItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YZHomeCell : UITableViewCell

@property(nonatomic,strong)YZItemModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
