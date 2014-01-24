//
//  ViewController.h
//  JCTopic
//
//  Created by jc on 14-1-23.
//  Copyright (c) 2014年 jc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCTopic.h"
@interface ViewController : UIViewController<JCTopicDelegate>

@property(nonatomic,strong)JCTopic * Topic;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UIPageControl *page;

@end
