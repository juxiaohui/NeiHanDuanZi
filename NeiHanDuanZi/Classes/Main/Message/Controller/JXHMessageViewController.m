//
//  JXHMessageViewController.m
//  NeiHanDuanZi
//
//  Created by juxiaohui on 16/9/14.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "JXHMessageViewController.h"
#import "JXHMessageCell.h"

@interface JXHMessageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, copy)NSArray <NSString *>* imageArray;

@property(nonatomic, copy)NSArray <NSString *>* titleArray;

@end

@implementation JXHMessageViewController


//  重写init
-(instancetype)init{
    
    return [self initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - LazyLoad

-(NSArray *)imageArray{

    if (!_imageArray) {
       _imageArray = @[@"interaction", @"messageicon_profile", @"vermicelli"];
    }
    return _imageArray;
}

-(NSArray *)titleArray{

    if (!_titleArray) {
        _titleArray = @[@"投稿互动",@"系统消息",@"粉丝关注"];
    }
    return _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self setupTableView];

}

-(void)setupNav{

    self.navigationItem.title = @"消息";
    
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"defaulthead"]];
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftItemClick)];
    [imageView addGestureRecognizer:tap];
    imageView.frame = CGRectMake(0, 0, 35, 35);
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:imageView];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"黑名单" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
   
}

-(void)setupTableView{

    self.tableView.backgroundColor = JXHGlobalColor
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(JXHMargin-35, 0, 0, 0);
    self.tableView.rowHeight = 50;
}

-(void)leftItemClick{

    JXHLogFunc
}
-(void)rightItemClick{

    JXHLogFunc
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDataSource


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * Identifier = @"MessageCell";
    
    JXHMessageCell * cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell = [[JXHMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.imageView.image = [UIImage imageNamed:[self.imageArray objectAtIndex:indexPath.row]];
    cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
