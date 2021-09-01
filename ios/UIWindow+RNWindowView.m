#import "RNWindowView.h"
#import "UIWindow+RNWindowView.h"

@implementation UIWindow (RNWindowView)

- (void)didAddSubview:(UIView *)subview
{
  if (![subview isKindOfClass:[RNViewContainer class]]) {
    for (UIView *view in self.subviews) {
      if ([view isKindOfClass:[RNViewContainer class]]) {
        [self bringSubviewToFront:view];
      }
    }
  }
}

@end
