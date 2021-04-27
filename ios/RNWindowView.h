#import <React/RCTViewManager.h>
#import <React/RCTView.h>


@interface RNWindowViewManager : RCTViewManager

@end

@interface RNWindowView : RCTView

@property (nonatomic) BOOL shown;

@end
