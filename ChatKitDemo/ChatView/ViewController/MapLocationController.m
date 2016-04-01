//
//  MapLocationController.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/28.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import "MapLocationController.h"

#import "LocationHelper.h"
#import "MyAnnoation.h"
#import "UIImage+Addition.h"

@interface MapLocationController ()<MKMapViewDelegate>
@property(nonatomic,strong)  MKMapView *mapView;


@property(nonatomic,copy) NSString *address;
@property(nonatomic,strong) NSError *error;


@property(nonatomic,strong) UIImage *locationPhoto;


@end

@implementation MapLocationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    
    [self.view addSubview:self.mapView];
    
    
    if (self.mapType == MapTypelocation) {
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发送位置" style:UIBarButtonItemStylePlain target:self action:@selector(sendLocationAction:)];
        self.navigationItem.rightBarButtonItem.enabled = NO;
        
        
        [[LocationHelper helper]startSystemLocationWithRes:^(CLLocation *location, NSError *error) {
            
            if (error)
            {
                self.completion ? self.completion(nil,nil,nil,error) : nil;
            }
            else
            {
                
                //地图定点，及添加地图标识
                [self setMapPosition:location];
                
                
                
               //反编码
                
                [[LocationHelper helper]address:location completion:^(NSString *address,CLLocation *location,NSError *error) {
                    
                    self.address = address;
                    self.location = location;
                    self.error = error;
                    
                    if (error) {
                        NSLog(@"解析地址失败:%@",error.localizedDescription);
                        self.navigationItem.rightBarButtonItem.enabled = NO;
                    }else{
                        self.navigationItem.rightBarButtonItem.enabled = YES;
                    }
                    
                    
                }];
                
                
            }
            
            
        }];
    }
    
    else
    {
        [self setMapPosition:self.location];
    }
    

   
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
   // NSLog(@"%@",userLocation.location);
}


- (void)setMapPosition:(CLLocation *)location
{
    [self.mapView setCenterCoordinate:location.coordinate animated:YES];
    
    CLLocationCoordinate2D center = location.coordinate;
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.009310,0.007812);
    // 将用户当前的位置作为显示区域的中心点, 并且指定需要显示的跨度范围
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    
    
    [self.mapView  setRegion:region animated:YES];
    self.mapView .rotateEnabled = YES;
    
    
    self.mapView .showsUserLocation = NO;
    
    
    
    //加大头针
    MyAnnoation *annotation=[[MyAnnoation alloc]init];
    annotation.coordinate = location.coordinate;
    [self.mapView addAnnotation:annotation];
}


- (void)sendLocationAction:(UIBarButtonItem *)barBtn
{
    //snapMapView
    UIImage *image = [UIImage captureWithView:self.mapView];
    image = [UIImage getImageWithSize:CGRectMake(image.size.width*2/2-90, image.size.height*2/2-90+64, 180, 180) FromImage:image];
    self.locationPhoto = [UIImage ThumbnailWithImage:image scale:1];
    
    
    self.completion ? self.completion(self.address,self.location ,self.locationPhoto,self.error) : nil;
}



- (MKMapView *)mapView
{
    if (!_mapView) {
        _mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
        _mapView.delegate = self;
    }
    
    return _mapView;
}






@end
