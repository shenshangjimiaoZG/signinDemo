#import "ViewController.h"
#import "FUCanlendarView.h"
#import "FUCandarModel.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface ViewController ()

@end

@implementation ViewController
#pragma mark 获取年月日星期
-(NSArray *)getYearMonthDateWeek:(NSDate *)date
{
    NSArray * arrWeek=[NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init] ;
    NSInteger unitFlags =  NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitWeekday |
    NSCalendarUnitHour |
    NSCalendarUnitMinute |
    NSCalendarUnitSecond ;
    
    comps = [calendar components:unitFlags fromDate:date];
    
    NSString *week=arrWeek[comps.weekday-1];
    NSString *year=[NSString stringWithFormat:@"%ld",comps.year];
    NSString *month=[NSString stringWithFormat:@"%ld",comps.month];
    NSString *day=[NSString stringWithFormat:@"%ld",comps.day];
    return @[year,month,day,week];
}
//计算月有几天
- (int)computeDateWithYear:(NSInteger)year month:(NSInteger)month {
    
    if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
        return 31;
    }else if (month == 2) {
        if(((year % 4 == 0)&&(year % 100 != 0))||(year %400 == 0)) {
            return 29;
        } else {
            return 28; // or return 29
        }
    } else {
        return 30;
    }
}
-(void)loadData:(FUCanlendarView*)view
{
    [SVProgressHUD showWithStatus:@"加载中"];
    
    [SVProgressHUD dismissWithDelay:1 completion:^{
        
        NSArray *dates=[self getYearMonthDateWeek:[NSDate date]];
        NSInteger days=[self computeDateWithYear:[dates[0]integerValue] month:[dates[1]integerValue]];
        NSMutableArray *ary=[NSMutableArray array];
        
        for(int i=0;i<days;i++)
        {
            FUCandarModel *m=[[FUCandarModel alloc]init];
            m.monthType=MonthTypeOfCurrent;
            m.start=@"9:00";
            m.end=@"18:00";
            m.text=[NSString stringWithFormat:@"%d",i+1];
            [ary addObject:m];
        }
        
        [view showSignIn:ary withYear:[dates[0]integerValue] withMonth:[dates[1]integerValue]];
    }];
    
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    FUCanlendarView *view=[FUCanlendarView fuCanlendarViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width,500)];
    
   
    
    [self.view addSubview:view];
    
     [self loadData:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
