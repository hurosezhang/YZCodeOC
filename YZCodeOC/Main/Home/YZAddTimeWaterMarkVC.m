//
//  YZAddTimeWaterMarkVC.m
//  YZCodeOC
//
//  Created by mac on 2022/12/26.
//

#import "YZAddTimeWaterMarkVC.h"
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface YZAddTimeWaterMarkVC ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) UIImageView * imageV;

@end

@implementation YZAddTimeWaterMarkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"添加时间水印";
    //  打开相册，选择照片
    // 添加水印

    
    [self addSubViews];
}

- (void)addSubViews {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor brownColor];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _imageV = [[UIImageView alloc] init];
    _imageV.contentMode = UIViewContentModeScaleAspectFit;
    _imageV.frame = CGRectMake(50, 300, 320, 400);
    _imageV.backgroundColor = [UIColor greenColor];
    self.imageV = _imageV;
    [self.view addSubview:_imageV];
    
}

- (void)btnClick:(UIButton *)btn {
    
    // 打开相册
    //创建UIImagePickerController对象，并设置代理和可编辑
       UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
       imagePicker.editing = YES;
       imagePicker.delegate = self;
       imagePicker.allowsEditing = YES;

       //创建sheet提示框，提示选择相机还是相册
       UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"请选择打开方式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];

       //相机选项
       UIAlertAction * camera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

           //选择相机时，设置UIImagePickerController对象相关属性
           imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
           imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
           imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
           imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
           //跳转到UIImagePickerController控制器弹出相机
           [self presentViewController:imagePicker animated:YES completion:nil];
       }];

       //相册选项
       UIAlertAction * photo = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

           //选择相册时，设置UIImagePickerController对象相关属性
           imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
           //跳转到UIImagePickerController控制器弹出相册
           [self presentViewController:imagePicker animated:YES completion:nil];
       }];

       //取消按钮
       UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
           
           [self dismissViewControllerAnimated:YES completion:nil];
       }];

       //添加各个按钮事件
       [alert addAction:camera];
       [alert addAction:photo];
       [alert addAction:cancel];

       //弹出sheet提示框
       [self presentViewController:alert animated:YES completion:nil];
}
 
#pragma mark - imagePickerController delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    //获取到的图片
    UIImage * image = [info valueForKey:UIImagePickerControllerEditedImage];
    _imageV.image = image;
}

@end
