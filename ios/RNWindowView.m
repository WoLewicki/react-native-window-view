#import <UIKit/UIKit.h>
#import <React/RCTInvalidating.h>

#import "RNWindowView.h"

@interface RNWindowView () <RCTInvalidating>
@end

@implementation RNWindowView {
  __weak RCTBridge *_bridge;
  UIPanGestureRecognizer *_gestureRecognizer;
  UIView *_container;
  CGRect _reactFrame;
}

- (instancetype)initWithBridge:(RCTBridge *)bridge
{
  if (self = [super init]) {
    _bridge = bridge;
    _reactFrame = CGRectNull;
    _container = self.container;
  }

  return self;
}

- (void)setShown:(BOOL)shown
{
  if (_shown != shown) {
    _shown = shown;
    if (_shown) {
      [self show];
    } else {
      [self hide];
    }
  }
}

- (void)reactSetFrame:(CGRect)frame
{
  _reactFrame = frame;
  [_container setFrame:frame];
}

- (void)addSubview:(UIView *)view
{
  [_container addSubview:view];
}

- (UIPanGestureRecognizer *)gestureRecognizer
{
  if (!_gestureRecognizer) {
    _gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gesture:)];
  }

  return _gestureRecognizer;
}

- (UIView *)container
{
  if (_container == nil) {
    _container = [[UIView alloc] initWithFrame:_reactFrame];
    [_container addGestureRecognizer:self.gestureRecognizer];
  }

  return _container;
}

- (void)show
{
  UIWindow *window = RCTSharedApplication().delegate.window;
  [window addSubview:_container];
}

- (void)hide
{
  if (!_container) {
    return;
  }

  [_container removeFromSuperview];
}

- (void)gesture:(UIPanGestureRecognizer *)gestureRecognizer
{
  CGPoint translation = [gestureRecognizer translationInView:_container.superview];
  _container.center = CGPointMake(_container.center.x + translation.x, _container.center.y + translation.y);
  [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:_container.superview];
}

- (void)didMoveToWindow
{
  if (self.window == nil) {
    [self hide];
  }
}

- (void)invalidate
{
  [self hide];
  _container = nil;
}

@end

@implementation RNWindowViewManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
  return [[RNWindowView alloc] initWithBridge:self.bridge];
}

RCT_EXPORT_VIEW_PROPERTY(shown, BOOL)

@end
