//
//  ViewController.m
//  JCTopic
//
//  Created by jc on 14-1-23.
//  Copyright (c) 2014年 jc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //实例化
    _Topic = [[JCTopic alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
    //代理
    _Topic.JCdelegate = self;
    //创建数据
    NSMutableArray * tempArray = [[NSMutableArray alloc]init];
    //本地图片
    //***********************//
    //key pic = 本地 UIImage
    //key title = 显示的标题 NSString
    //key isLoc = 是否本地图片 Bool
    //***********************//
    UIImage * image = [UIImage imageNamed:@"1.jpg"];
    [tempArray addObject:[NSDictionary dictionaryWithObjects:@[image ,@"PIC1",@YES] forKeys:@[@"pic",@"title",@"isLoc"]]];
    UIImage * image2 = [UIImage imageNamed:@"2.jpg"];
    [tempArray addObject:[NSDictionary dictionaryWithObjects:@[image2 ,@"PIC2",@YES] forKeys:@[@"pic",@"title",@"isLoc"]]];
    //网络图片
    //***********************//
    //key pic = 地址 NSString
    //key title = 显示的标题 NSString
    //key isLoc = 是否本地图片 Bool
    //key placeholderImage = 网络图片加载失败时显示的图片 UIImage
    //***********************//
    [tempArray addObject:[NSDictionary dictionaryWithObjects:@[@"http://163.54114.com/upimg/allimg/120619/5-120619112512.jpg" ,@"PIC3",@NO] forKeys:@[@"pic",@"title",@"isLoc"]]];
    //网络图片加载失败
    UIImage * PlaceholderImage = [UIImage imageNamed:@"3.jpg"];
    [tempArray addObject:[NSDictionary dictionaryWithObjects:@[@"http://s.doyo.cn/img/52/cf/91779e9e784d2c000003.jpg" ,@"PIC4",@NO,PlaceholderImage] forKeys:@[@"pic",@"title",@"isLoc",@"placeholderImage"]]];
    
    //加入数据
    _Topic.pics = tempArray;
    //更新
    [_Topic upDate];
    [self.view addSubview:_Topic];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    
    //停止自己滚动的timer
    [_Topic releaseTimer];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)didClick:(id)data{
    _label2.text = [NSString stringWithFormat:@"%@",(NSArray*)data];
}
-(void)currentPage:(int)page total:(NSUInteger)total{
    _label1.text = [NSString stringWithFormat:@"Current Page %d",page+1];
    _page.numberOfPages = total;
    _page.currentPage = page;
}
@end
