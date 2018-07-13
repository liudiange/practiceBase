//
//  DGCardCell.m
//  卡片collectionview实现
//
//  Created by apple on 2018/7/12.
//  Copyright © 2018年 apple. All rights reserved.
//


#import "DGCardCell.h"


@interface DGCardCell ()

@property (strong, nonatomic) DGCardCell *previousCell;

@end


@implementation DGCardCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder{

    if (self = [super initWithCoder:aDecoder]) {
        UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        [self addGestureRecognizer:panGes];
    }
    return self;
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
            self.delegate = (id)self.collectionView;
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
    
    if (self.collectionView.deleteArray.count == 0) {
        for (NSInteger index = 0; index < [self.collectionView numberOfItemsInSection:0]; index ++) {

            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
            DGCardCell *cardCell = (DGCardCell *)[self.collectionView cellForItemAtIndexPath:indexPath];

            [self.collectionView.deleteArray addObject:cardCell];
        }
    }
    // 拿出之前的cell
    DGCardCell *previousCell = [self.collectionView.deleteArray lastObject];
    previousCell.hidden = NO;
    if (![self.subviews containsObject:previousCell]) {
        [previousCell.layer removeAllAnimations];
        previousCell.transform = CGAffineTransformIdentity;
        if (previousCell.layer.anchorPoint.y == 1.0) {
            previousCell.frame = CGRectMake(-(self.frame.size.width/self.frame.size.height * (self.frame.size.height - 80)), 80, self.frame.size.width/self.frame.size.height * (self.frame.size.height - 80), self.frame.size.height - 80);
            [self addSubview:previousCell];
            previousCell.layer.position = CGPointMake(100,previousCell.layer.position.y);
            previousCell.layer.anchorPoint = CGPointMake(1.0, 1.0);
        }else if (previousCell.layer.anchorPoint.y == 0.5){
            previousCell.frame = CGRectMake(-(self.frame.size.width/self.frame.size.height * (self.frame.size.height - 80)), 80, self.frame.size.width/self.frame.size.height * (self.frame.size.height - 80), self.frame.size.height - 80);
            [self addSubview:previousCell];
            previousCell.layer.position = CGPointMake(100,previousCell.layer.position.y + previousCell.frame.size.height * 0.5);
            previousCell.layer.anchorPoint = CGPointMake(1.0, 1.0);
        }
        previousCell.transform = CGAffineTransformMakeRotation(-M_PI_4);
        self.previousCell = previousCell;
    }
    // 添加动画等
    CGFloat rotationAngle = distance/MAX_DISTANCE;
    if (rotationAngle <= 0) {
        rotationAngle = 0;
    }else if (rotationAngle >= 1.0){
        rotationAngle = 1.0;
    }
    CGFloat scale = rotationAngle + 1;
    if (scale > 1.3) {
        scale = 1.3;
    }else if (scale < 1.0){
        scale = 1.0;
    }
    previousCell.transform = CGAffineTransformMakeRotation((rotationAngle - 1) *M_PI_4);
    previousCell.transform = CGAffineTransformScale(previousCell.transform, scale, scale);
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
    if (self.previousCell) {
        [UIView animateWithDuration:1.5 animations:^{
            self.previousCell.layer.position = CGPointMake(self.frame.size.width,self.previousCell.layer.position.y + 0);
        } completion:^(BOOL finished) {
            if ([self.delegate respondsToSelector:@selector(swipDirection:andIndex:cell:)]) {
                [self.delegate swipDirection:SwipDirectionRight andIndex:self.currentIndex - 1 cell:self.previousCell];
            }
            [self.previousCell removeFromSuperview];
            self.previousCell = nil;
        }];
    }
}
/**
 没有达到要求 回到原点的动画
 */
- (void)backOriginAction{
    [self.previousCell removeFromSuperview];
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:nil];
}

@end
