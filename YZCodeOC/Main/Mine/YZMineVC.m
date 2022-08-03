//
//  YZMineVC.m
//  YZCodeOC
//
//  Created by zhangyongkang01 on 2021/5/2.
//

#import "YZMineVC.h"
#import "YZItemModel.h"
#import "YZItemCell.h"
#import "YZSubControllerVC.h"

@interface YZMineVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArr;

@end

@implementation YZMineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpModel];
    [self.view addSubview:self.tableView];
}

- (void)setUpModel {
    NSMutableArray *mutableArr = [NSMutableArray array];
    YZItemModel *itemModel1 = [YZItemModel new];
    itemModel1.name = @"01Renturn和break和Continue";
    [mutableArr addObject:itemModel1];
    
    YZItemModel *itemModel2 = [YZItemModel new];
    itemModel2.name = @"02号种子";
    [mutableArr addObject:itemModel2];

    _dataArr = [NSArray arrayWithArray:mutableArr];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YZItemCell *cell = [YZItemCell new];
    YZItemModel *model = self.dataArr[indexPath.row];
    cell.model = model;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    YZItemModel *model = [self.dataArr objectAtIndex:indexPath.row];
    if ([model.name containsString:@"01"]) {
        [self funBreakContinueBreak];
    }
    
//    YZSubControllerVC * vc = [[YZSubControllerVC alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
}


- (void)funBreakContinueBreak {
    
    //break和continue 用于结束当前循环
    // return 并不是专门用于结束循环的关键字，return是直接结束整个函数,不管这个return处于多少层循环之内
    
    [self funBreak];
    
    [self funContinue];
    
    [self funReturn];
}


- (void)funBreak {
    //break用于完全结束一个循环,跳出循环体,不管是那种循环,
    //一旦在循环体中遇到break,系统将完全结束该循环,开始执行循环后边的代码
    for (int i = 0; i<4; i++) {
        
        NSLog(@"当前i的值是:%d",i);
        if (i ==2 ) {
            
            //执行该语句时结束循环
            break;
        }
        
    }
    
}

- (void)funContinue {
    
    //continue只是中止本次循环,接着开始下一次循环
    for (int i = 0; i<3; i++) {
        
        NSLog(@"当前i的值是:%d",i);
        if (i >=2) {
            
            continue;//忽略本次循环剩下的语句
        }
        NSLog(@"continue后输出的语句");
        
    }
    
}

- (void)funReturn {
    //return
    for (int i = 0; i<3; i++) {
        
        NSLog(@"当前i的值是:%d",i);
        if (i >=2) {
            
            return;
        }
        
        
    }
    
    NSLog(@"continue后输出的语句");
    
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
