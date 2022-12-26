//
//  YZHomeCell.m
//  YZCodeOC
//
//  Created by mac on 2022/11/30.
//

#import "YZHomeCell.h"
#import <Masonry/Masonry.h>

@interface YZHomeCell()
@property(nonatomic,strong)UILabel *titleLabel;

@end

@implementation YZHomeCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellId = @"YZHomeCell";
    YZHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[YZHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpView];
    }
    return self;
}

- (void)setUpView {
    UILabel *titleLabel = [[UILabel alloc] init];
    _titleLabel = titleLabel;
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = [UIColor blueColor];
    [self.contentView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView);
    }];
    
}

- (void)setModel:(YZItemModel *)model {
    if (_model != model) {
        _model = model;
        _titleLabel.text = model.title;
    }
}


@end
