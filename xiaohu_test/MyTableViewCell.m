//
//  MyTableViewCell.m
//  xiaohu_test
//
//  Created by codehzx on 2021/3/7.
//

#import "MyTableViewCell.h"
@implementation MyTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self= [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        UIButton * mybtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [mybtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:mybtn];
        _btn = mybtn;
        
        
        UIImageView * imgIcon  = [[UIImageView alloc]initWithFrame:CGRectZero];
        imgIcon.backgroundColor = [UIColor redColor];
        imgIcon.userInteractionEnabled = YES;
        [self addSubview:imgIcon];
        _myimgIcon = imgIcon;
        
    }
    return self;
}
-(void)layoutSubviews{
//    _myimgIcon.frame = self.bounds;
    
    _btn.frame =CGRectMake(0, 0, self.bounds.size.width/2, self.bounds.size.height);
    _myimgIcon.frame = CGRectMake(self.bounds.size.width/2, 0, self.bounds.size.width/2, self.bounds.size.height);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
