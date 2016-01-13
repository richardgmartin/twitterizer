//
//  ViewController.m
//  twitterizer
//
//  Created by Chris Erdos on 1/13/16.
//  Copyright © 2016 Chris Erdos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onTwitterizeButtonTapped:(UIButton *)sender {
    
    NSString *textViewString = self.textView.text;
    
    NSMutableString *twitterizedString = [NSMutableString new];
    
    for (int i = 0 ; i <= textViewString.length; i++) {
        if ([textViewString characterAtIndex:i != @"a" || @"e" || @"i" || @"o" || @"u"]) {
            
            NSString *tempFirstPart = [NSString stringWithFormat:@"%c", [textViewString characterAtIndex:i]];
            
            [twitterizedString appendString:tempFirstPart];
            
        }
    }
    
}


@end
