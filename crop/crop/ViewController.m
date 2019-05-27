//
//  ViewController.m
//  crop
//
//  Created by Srijan Bhatia on 25/05/19.
//  Copyright © 2019 Srijan Bhatia. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import "SecondViewController.h"

@interface ViewController ()
@property (nonatomic, readwrite) UIImage *image;
@end

@implementation ViewController

/*Overrding inbuilt methods to draw the bezier curve*/
- (void) drawRect:(CGPoint)Rect
{
    //this method is not used
    [self.path fill];
    //[self.path stroke];
}
//Use CAShapeLayer to redraw rthe view
- (void) newMethod
{
    UIBezierPath *shape = self.path;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = shape.CGPath;
//    shapeLayer.fillRule = kCAFillRuleEvenOdd;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
//    shapeLayer.opacity=1;
//    shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    shapeLayer.lineWidth = 2;
//    [self.view.layer setMask:shapeLayer];
    [self.view.layer addSublayer:shapeLayer];
    
}
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.path = [[UIBezierPath alloc] init];
    NSArray<UITouch *> *touch;
    touch = [touches allObjects];
    UITouch *touch1 = touch[0];
    CGPoint start = [touch1 preciseLocationInView:touch1.view];
    NSLog(@"%lf",start.x);
    [self.path moveToPoint:start];
}
- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //the UITouch set contains only one UITouch event
    NSArray<UITouch *> *touch;
    touch = [touches allObjects];
    UITouch *touch1 = touch[0];
    CGPoint middle = [touch1 preciseLocationInView:touch1.view];
    //[self.path moveToPoint:middle];
    [self.path addLineToPoint:middle];
    //[self.view setNeedsDisplay];
    [self newMethod];
}
- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSArray<UITouch *> *touch;
    touch = [touches allObjects];
    UITouch *touch1 = touch[0];
    CGPoint end = [touch1 preciseLocationInView:touch1.view];
    //[self.path moveToPoint:end];
    [self.path addLineToPoint:end];
    [self.path closePath];
    [self newMethod];
    //[self.view setNeedsDisplay];
    
    
    
//    self.InputImage.image = image;
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"Click"])
    {
        SecondViewController *newViewController = segue.destinationViewController;
        newViewController.simage = self.image;
    }
}

- (void)viewDidLoad {
 [super viewDidLoad];
    //[self.view setNeedsDisplay];
 }
- (IBAction)CropClicked:(id)sender {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = self.path.CGPath;
    //    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.backgroundColor = [UIColor whiteColor].CGColor;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view.layer setMask:shapeLayer];
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self performSegueWithIdentifier:@"Click" sender:nil];
}

/*- (IBAction)CropClicked:(id)sender {
}*/
@end
