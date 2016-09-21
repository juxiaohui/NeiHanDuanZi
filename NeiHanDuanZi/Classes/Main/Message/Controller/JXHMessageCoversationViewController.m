//
//  JXHMessageCoversationViewController.m
//  NeiHanDuanZi
//
//  Created by juxiaohui on 16/9/21.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "JXHMessageCoversationViewController.h"
#import "JXHCustonLoadingAnimationView.h"
#import "JXHCustomEmptyView.h"

@interface JXHMessageCoversationViewController ()

@property(nonatomic, weak)JXHCustonLoadingAnimationView * loadingView;

@property(nonatomic, weak)JXHCustomEmptyView * emptyView;

@end

@implementation JXHMessageCoversationViewController


-(JXHCustomEmptyView *)emptyView{
    
    if (!_emptyView) {
        JXHCustomEmptyView * emptyView = [[JXHCustomEmptyView alloc]initWithTitle:@"" secondTitle:@"" iconname:@"nocontent"];
        emptyView.frame = CGRectMake(0, -100+ ScreenHeight / 2, ScreenWidth, 170);
        [self.view addSubview:emptyView];
        _emptyView = emptyView;
    }
    return _emptyView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupBaseData];
    
    [self loadData];
}

-(void)setupBaseData{

    self.navigationItem.title = @"投稿互动";
    
    self.view.backgroundColor = JXHGlobalColor

}

-(void)loadData{
    
    [self showLoadingAnimation];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self hideLoadingViewAnimation];
        
        [self emptyView];
    });
    
}

-(void)showLoadingAnimation{

    JXHCustonLoadingAnimationView * loadingView = [[JXHCustonLoadingAnimationView alloc]init];
    [loadingView showInView:self.view];
    self.loadingView = loadingView;
    [self.view bringSubviewToFront:loadingView];
}

-(void)hideLoadingViewAnimation{

    [self.loadingView dismiss];
    
    self.loadingView=nil;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
