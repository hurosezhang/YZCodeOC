//
//  YZItemCell.m
//  YZCodeOC
//
//  Created by zhangyongkang01 on 2021/8/25.
//

#import "YZItemCell.h"
#import <Masonry/Masonry.h>

@interface YZItemCell()
@property(nonatomic,strong)UILabel *titleLabel;

@end

@implementation YZItemCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellId = @"YZItemCell";
    YZItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[YZItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
