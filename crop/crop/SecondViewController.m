//
//  SecondViewController.m
//  crop
//
//  Created by Srijan Bhatia on 25/05/19.
//  Copyright © 2019 Srijan Bhatia. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
//@property (nonatomic, readwrite) UIImage* simage;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.CroppedImage.image = self.simage;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
