//
//  YZTabBarViewController.m
//  YZCodeOC
//
//  Created by zhangyongkang01 on 2021/5/2.
//

#import "YZTabBarViewController.h"
#import "YZHomeVC.h"
#import "YZMineVC.h"

@interface YZTabBarViewController ()

@end

@implementation YZTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];

    YZHomeVC *homeVC = [YZHomeVC new];
    YZMineVC *mineVC = [YZMineVC new];
    homeVC.title = @"首页";
    mineVC.title = @"个人";
    self.viewControllers = @[homeVC,mineVC];

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
