//
//  YZHomeVC.m
//  YZCodeOC
//
//  Created by zhangyongkang01 on 2021/5/2.
//

#import "YZHomeVC.h"
#import "YZCollectionVC.h"
#import "YZSubObject.h"
#import "YZNetWork.h"
#import "YZGirlModel.h"
#import "YZHomeCell.h"
#import "YZItemModel.h"
#import "YZAddTimeWaterMarkVC.h"

@interface YZHomeVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)YZGirlModel *girlModel;
@property(nonatomic,strong)NSArray *dataArr;

@end

@implementation YZHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    
    [self setUpTableData]; // table 数据
    [self setUpView];
    
    NSString *url = @"https://www.mxnzp.com/api/image/girl/list/random";
    
    // 防止循环引用，后续要补上
    [YZNetWork requestWithGetTypeurlString:url successBlock:^(id  _Nonnull responseObject) {
        NSLog(@"---%@",responseObject);
        
        YZGirlModel *girlModel = [YZGirlModel girlModelWithData:responseObject];
        NSLog(@"---%@",girlModel);
        self.girlModel = girlModel;
    } failureBlock:^(NSError * _Nonnull error) {
        NSLog(@"---%@",error);
    }];

}

- (void)setUpView {
    UIView *view = [UIView new];
    
    [self.view addSubview:view];
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, KNavbarHeight, self.view.bounds.size.width, self.view.bounds.size.height - KNavbarHeight)];
    _tableView = tableView;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    // 添加时间水印的功能

}

- (void)setUpTableData {
    NSMutableArray *mutableArr = [NSMutableArray array];
    YZItemModel *itemModel1 = [YZItemModel new];
    itemModel1.title = @"添加时间水印";
    itemModel1.logo = @"001";
    [mutableArr addObject:itemModel1];

    _dataArr = [NSArray arrayWithArray:mutableArr];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    YZItemModel *item = [self.dataArr objectAtIndex:indexPath.row];
    YZHomeCell *cell =[YZHomeCell cellWithTableView:tableView];
    cell.model = item;
    return  cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YZItemModel *item = [self.dataArr objectAtIndex:indexPath.row];
    if ([item.logo isEqualToString:@"001"]) {
        YZAddTimeWaterMarkVC *addTimeWaterMarkVC = [[YZAddTimeWaterMarkVC alloc] init];
        [self.navigationController pushViewController:addTimeWaterMarkVC animated:YES];
    }
    
//    YZCollectionVC * vc = [YZCollectionVC new];
//    
//    [self.navigationController pushViewController:vc animated:YES];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
