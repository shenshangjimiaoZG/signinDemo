#import <UIKit/UIKit.h>
@class FUCandarModel;

@interface FUCandarContentCell : UICollectionViewCell

@property (assign, nonatomic,getter=isCurrentMonth) BOOL currentMonth;
@property (strong, nonatomic) FUCandarModel *model;

@end
