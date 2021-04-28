#import <React/RCTViewManager.h>
#import <React/RCTView.h>


@interface RNWindowViewManager : RCTViewManager

@end

@interface RNViewContainer: UIView

@end


@interface RNWindowView : RCTView

@property (nonatomic) BOOL shown;
@property (nonatomic) BOOL draggable;

@end
