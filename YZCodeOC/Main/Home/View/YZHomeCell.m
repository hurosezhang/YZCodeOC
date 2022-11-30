//
//  YZHomeCell.m
//  YZCodeOC
//
//  Created by mac on 2022/11/30.
//

#import "YZHomeCell.h"

@implementation YZHomeCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellId = @"YZHomeCell";
    YZHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[YZHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}
@end
