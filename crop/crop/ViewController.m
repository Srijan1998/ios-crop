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


//Use CAShapeLayer to redraw the view
- (void) newMethod
{
    UIBezierPath *shape = self.path;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = shape.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    shapeLayer.lineWidth = 2;
    [self.view.layer addSublayer:shapeLayer];
    
}
/*Overrding inbuilt methods to draw the bezier curve*/
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
    [self.path addLineToPoint:middle];
    [self newMethod];
}
- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSArray<UITouch *> *touch;
    touch = [touches allObjects];
    UITouch *touch1 = touch[0];
    CGPoint end = [touch1 preciseLocationInView:touch1.view];
    [self.path addLineToPoint:end];
    [self.path closePath];
    [self newMethod];

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
    [self.view.layer setMask:shapeLayer];
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self performSegueWithIdentifier:@"Click" sender:nil];
}
- (IBAction)CancelClicked:(id)sender {
    [self.path removeAllPoints];
    
    for (CALayer *layer in [self.view.layer.sublayers copy])
    {
        if([layer isKindOfClass:[CAShapeLayer class]])
        {
            [layer removeFromSuperlayer];
        }
    }
}

@end
