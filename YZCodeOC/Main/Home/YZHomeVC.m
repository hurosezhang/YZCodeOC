//
//  YZHomeVC.m
//  YZCodeOC
//
//  Created by zhangyongkang01 on 2021/5/2.
//

#import "YZHomeVC.h"
#import "YZCollectionVC.h"
#import "YZSubObject.h"
@interface YZHomeVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation YZHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    YZSubObject *subObject = [YZSubObject new];
    
    [subObject noImplFunc];
   NSString *str = [subObject noImplStringFunc];
    NSLog(@"===%@",str);
    
    YZSubObject *obj = [subObject noImplFuncwithParam:@"123" Param2:@{@"1":@"2"}];
    NSLog(@"++++%@",obj);


}


- (void)yibuxieru {
    // 可以异步写入
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"test"];
    });
    NSLog(@"------%d", [[NSUserDefaults standardUserDefaults] boolForKey:@"test"]);
}

- (void)zixianchengdiaoyongUI {
    
    // 子线程设置UI
    int R = (arc4random() % 256);
    int G = (arc4random() % 256);
    int B = (arc4random() % 256);
    NSLog(@"touchesBegan");
    // 子线程调用UI 不是必现crash的，但是在控制台会有输出
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [UIView new].backgroundColor = [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:1];
    });
    
    // 子线程取出UI,也会造成性能问题
    //    dispatch_async(dispatch_get_global_queue(0,0), ^{
    //        CGFloat aa = newView.frame.origin.y;
    //    });

        dispatch_async(dispatch_get_global_queue(0,0), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
//                CGFloat bb = newView.frame.origin.y;

            });
        });

}

- (void)setUpView {
    UIView *view = [UIView new];
    
    [self.view addSubview:view];
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, KNavbarHeight, self.view.bounds.size.width, self.view.bounds.size.height - KNavbarHeight)];
    _tableView = tableView;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    
    return  cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YZCollectionVC * vc = [YZCollectionVC new];
    
    [self.navigationController pushViewController:vc animated:YES];
    
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
