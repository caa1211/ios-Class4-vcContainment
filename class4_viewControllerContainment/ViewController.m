//
//  ViewController.m
//  class4_viewControllerContainment
//
//  Created by Carter Chang on 7/10/15.
//  Copyright (c) 2015 Carter Chang. All rights reserved.
//

#import "ViewController.h"
#import "BlueViewController.h"
#import "PinkViewController.h"
#import "OrangeViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *pinkTab;
@property (weak, nonatomic) IBOutlet UIButton *orangeTab;
@property (weak, nonatomic) IBOutlet UIButton *blueTab;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property(strong, nonatomic) PinkViewController *pinkVC;
@property(strong, nonatomic) BlueViewController *blueVC;
@property(strong, nonatomic) OrangeViewController *orangeVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.pinkVC = [storyboard instantiateViewControllerWithIdentifier:@"pinkVC"];
    self.blueVC = [storyboard instantiateViewControllerWithIdentifier:@"blueVC"];
    self.orangeVC = [storyboard instantiateViewControllerWithIdentifier:@"orangeVC"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)didTapTabButton:(id)sender {
    
    if (sender == self.pinkTab) {
        [self displayViewController:self.pinkVC];
    }else if(sender == self.blueTab){
        [self displayViewController:self.blueVC];
    }else if(sender == self.orangeTab){
        [self displayViewController:self.orangeVC];
    }
}

-(void) displayViewController: (UIViewController *) vc{
    [self addChildViewController:vc];
    vc.view.frame = self.containerView.bounds;
    [self.containerView addSubview:vc.view];
    [vc didMoveToParentViewController:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
