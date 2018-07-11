//
//  DGImageViewCell.m
//  卡片collectionview实现
//
//  Created by apple on 2018/7/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DGImageViewCell.h"

@interface DGImageViewCell ()



@end


@implementation DGImageViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self addGestureRecognizer:panGes];
}
/**
  拖动的事件

 @param panGes 拖动的事件
 */
- (void)panAction:(UIPanGestureRecognizer *)panGes{
    CGPoint point = [panGes translationInView:self];
    
    switch (panGes.state) {
        case UIGestureRecognizerStateBegan:
        {
            // NSLog(@"大爷什么都不干你能咋地");
        }
            break;
        case UIGestureRecognizerStateChanged:
            {
                if (point.x <= 0) {
                    [self panLeftAction:point.x];
                }else{
                    [self panRightAction:point.x];
                }
            }
            break;
        case UIGestureRecognizerStateEnded:
        {
            if (point.x <= -MAX_DISTANCE) {
                [self leftFinishAction];
            }else if(point.x >= MAX_DISTANCE){
                [self rightFinishAction];
            }else{
                [self backOriginAction];
            }
        }
            break;
        default:
        {
            [self backOriginAction];
        }
            break;
    }
}
#pragma mark - 滑动过程中的动画
/**
 左边滑动的动画

 @param distance 滑动的距离都是负数
 */
- (void)panLeftAction:(CGFloat)distance{
    self.transform = CGAffineTransformMakeTranslation(distance, 0);
}

/**
 右边滑动的动画

 @param distance 距离
 */
- (void)panRightAction:(CGFloat)distance{
    
}
#pragma mark -  滑动完成的动画
/**
 左边滑动的完成的动画
 */
- (void)leftFinishAction{
    
    self.layer.position = CGPointMake(self.frame.origin.x + self.layer.position.x, self.frame.size.height + self.frame.origin.y);
    self.layer.anchorPoint = CGPointMake(0, 1);
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.duration = 1.5;
    rotationAnimation.repeatCount = 1;
    rotationAnimation.fromValue = @(0);
    rotationAnimation.toValue = @(-M_PI_4);
    // 下面这两句是防止恢复动画的
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    [self.layer addAnimation:rotationAnimation forKey:@"rotation"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.hidden = YES;
        self.transform = CGAffineTransformIdentity;
        [self.layer removeAllAnimations];
        if ([self.delegate respondsToSelector:@selector(swipDirection:andIndex:cell:)]) {
            [self.delegate swipDirection:SwipDirectionLeft andIndex:self.currentIndex cell:self];
        }
    });
}
/**
 右边滑动完成的动画
 */
- (void)rightFinishAction{
    
}

/**
 没有达到要求 回到原点的动画
 */
- (void)backOriginAction{
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
         self.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:nil];
}

@end
