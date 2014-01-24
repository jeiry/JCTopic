JCTopics
========
### 介绍
循环滚动广告图片

继承UIScrollview控制左右滚动。

利用NSTimer控制滚动时间

### 功能
1. 无缝滚动
2. 支持IOS7[ >= IOS6]
3. 手动和自动
4. 使用代理回传所点击的数据
5. 使用代理回传当前页数
6. 本地图片
7. 网络图片，异步加载
8. ARC

### 使用

	//在.h件引入库
	#import "JCTopic.h"
	//设置代理
	@interface ViewController : UIViewController<JCTopicDelegate>
	@property(nonatomic,strong)JCTopic * Topic
	
	
	//在.m  viewDidLoad 加入
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
	
	
	//设置两个代理方法
	//返回当前点击
	-(void)didClick:(id)data;
	//返回页数
	-(void)currentPage:(int)page total:(NSUInteger)total;
	
