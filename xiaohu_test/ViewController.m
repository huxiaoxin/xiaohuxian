//
//  ViewController.m
//  xiaohu_test
//
//  Created by codehzx on 2021/3/7.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "UIButton+mybtn.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"1");
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,self.navigationController.navigationBar.frame.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;

    }
    return _tableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifer = @"MyTableViewCell";
    MyTableViewCell  *Cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (Cell == nil) {
        Cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    Cell.myimgIcon.imgindexPath = indexPath;
    [Cell.myimgIcon imgViewHanlderWithgesture:^(id  _Nonnull object) {
    UIImageView * immgmView  = (UIImageView *)object;
    NSLog(@"图片点击：%ld",immgmView.imgindexPath.row);
    }];
    
    [Cell.btn setTitle:[NSString stringWithFormat:@"按钮；%ld",indexPath.row] forState:UIControlStateNormal];
    Cell.btn.indexpaht = indexPath;
    [Cell.btn handlebtnAction:^(id  _Nonnull sender) {
        UIButton * btn = (UIButton *)sender;
        NSLog(@"----%ld",btn.indexpaht.row);
    }];

    return Cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
@end
