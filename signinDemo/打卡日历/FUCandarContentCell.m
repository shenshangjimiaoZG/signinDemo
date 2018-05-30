#import "FUCandarContentCell.h"
#import "FUcanlendarHeader.h"
#import "FUCandarModel.h"
#import <Masonry/Masonry.h>

@interface FUCandarContentCell()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *lblEnd;

@end


@implementation FUCandarContentCell


- (void)setModel:(FUCandarModel *)model
{
    _model = model;
    [self setNeedsLayout];
}


- (BOOL)isCurrentMonth
{
    return self.model.monthType == MonthTypeOfCurrent;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(3);
        make.height.equalTo(@21);
        make.width.equalTo(@45);
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.detailLabel.mas_top).offset(-2);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.textLabel.mas_bottom).offset(2);
        make.height.equalTo(@21);
        make.width.equalTo(@45);
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.lblEnd.mas_top).offset(-2);
    }];
    
    [self.lblEnd mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.detailLabel.mas_bottom).offset(2);
        make.height.equalTo(@21);
        make.width.equalTo(@45);
        make.centerX.equalTo(self.contentView);
        
    }];
    
    self.textLabel.font = _model.textFont;
    if (self.isCurrentMonth)
    {
        self.textLabel.text = _model.text;
        
        self.backgroundColor = _model.dayColor;
        if (_model.isWhetherSelect) {
            self.backgroundColor = _model.daySelectColor;
        }
        self.textLabel.hidden=NO;
        self.detailLabel.hidden=NO;
        self.lblEnd.hidden=NO;
        self.hidden=NO;
    }
    else
    {
        self.textLabel.text = _model.text;
        //self.backgroundColor =[UIColor lightGrayColor];
        self.textLabel.hidden=YES;
        self.detailLabel.hidden=YES;
        self.lblEnd.hidden=YES;
        self.hidden=YES;
    }
   
    self.detailLabel.text=_model.start;
    self.lblEnd.text=_model.end;
    
    
}

@end
