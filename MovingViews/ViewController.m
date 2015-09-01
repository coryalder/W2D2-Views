//
//  ViewController.m
//  MovingViews
//
//  Created by Cory Alder on 2015-09-01.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *bigBox;
@property (weak, nonatomic) IBOutlet UILabel *frameLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *boxHorizontalConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    firstItem.attribute = (secondItem.attribute * multiplier) + constant
    
    
    UIView *smallView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    smallView.translatesAutoresizingMaskIntoConstraints = NO;
    
    smallView.backgroundColor = [UIColor purpleColor];
    
    [self.bigBox addSubview:smallView];
    
    self.bigBox.clipsToBounds = YES;
    
//    
    NSLayoutConstraint *topSpacing = [NSLayoutConstraint constraintWithItem:smallView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.bigBox attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:10];
    
    
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:smallView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:smallView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    
//    
    NSArray *vertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(10)-[purpleView(smallViewHeight)]" options:0 metrics:@{@"smallViewHeight" : @100 } views:@{@"purpleView" : smallView}];
    
    
    
    [self.bigBox addConstraint:topSpacing];
    
//    [self.bigBox addConstraints:vertical];
    [self.bigBox addConstraint:width];
    [self.bigBox addConstraint:height];
    
    
    
    
    
    
    //[self updateLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)moveLeft:(id)sender {
    
    //[self.view.subviews firstObject]; // don't do it this way.
    
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        
//        CGRect frame = self.bigBox.frame;
//        frame.origin.x = frame.origin.x - 10;
//        
//        self.bigBox.frame = frame;
        
        self.boxHorizontalConstraint.constant -= 10;
        
        [self.view layoutSubviews];
        
        
    } completion:^(BOOL finished) {
        [self updateLabels];
//        [self.bigBox removeFromSuperview];
    }];
    
//    [UIView animateWithDuration:0.3 animations:^{
//        
//        CGRect frame = self.bigBox.frame;
//        frame.origin.x = frame.origin.x - 10;
//        //frame.size.width += 10;
//        
//        self.bigBox.frame = frame;
//        
//    }];
    
    [self updateLabels];
}


- (IBAction)moveRight:(id)sender {
    
//    [self.view addSubview:self.bigBox];
    
    CGPoint center = self.bigBox.center;
    center.x += 10;
    
    self.bigBox.center = center;

    [self updateLabels];
}

-(void)updateLabels {
    self.frameLabel.text = NSStringFromCGRect(self.bigBox.frame);
}


@end
