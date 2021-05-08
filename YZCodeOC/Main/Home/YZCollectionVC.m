//
//  YZCollectionVC.m
//  YZCodeOC
//
//  Created by zhangyongkang01 on 2021/5/3.
//

#import "YZCollectionVC.h"
#import "YZCollectionCell.h"

@interface YZCollectionVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation YZCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self initCollectionView];
}

#pragma mark  设置CollectionView的的参数
- (void) initCollectionView
{
    //流水布局的初始化，以及各个属性的设置
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
    //设置最小行间距
    flowLayOut.minimumLineSpacing = 10;
    //设置最小列间距
    flowLayOut.minimumInteritemSpacing = 10;
    //设置每个item（cell）的大小
    flowLayOut.itemSize = CGSizeMake(30 , 30);
    //设置headerVIew的大小
//    flowLayOut.headerReferenceSize = CGSizeMake(320, 130);
    //设置滚动方向（默认垂直方向）
//    flowLayOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    //设置CollectionView的属性
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, KNavbarHeight, kScreenWith, kScreenHeight - KNavbarHeight) collectionViewLayout:flowLayOut];
    self.collectionView.backgroundColor = [UIColor grayColor];
    self.collectionView.backgroundColor = YZColor(238, 238, 238) ;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.scrollEnabled = YES;
    [self.view addSubview:self.collectionView];
    //注册Cell
    [self.collectionView registerClass:[YZCollectionCell class] forCellWithReuseIdentifier:@"cell"];
}
#pragma mark - 设置CollectionView的组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identify = @"cell";
    
    YZCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    return cell;
}



#pragma mark  点击CollectionView触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    Medal *p = self.medals[indexPath.item];
    NSLog(@"didSelectItemAtIndexPath-----section%ld--row%ld----------------",indexPath.section,indexPath.row);
}

#pragma mark  设置CollectionViewCell是否可以被点击
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
