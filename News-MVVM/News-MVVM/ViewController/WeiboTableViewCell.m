//
//  WeiboTableViewCell.m
//  News-MVVM
//
//  Created by dev on 2017/11/4.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "WeiboTableViewCell.h"
#import "WeiboListModel.h"

@interface WeiboTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerIV;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *timeL;
@property (weak, nonatomic) IBOutlet UILabel *textL;

@end

@implementation WeiboTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDataModel:(id)data
{
    WeiboListModel *model = (WeiboListModel *)data;
    
    [_headerIV sd_setImageWithURL:model.imageUrl];
    _nameL.text = model.userName;
    _timeL.text = model.date;
    _textL.text = model.text;
}

@end
