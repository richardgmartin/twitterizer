//
//  ViewController.m
//  twitterizer
//
//  Created by Chris Erdos on 1/13/16.
//  Copyright © 2016 Chris Erdos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

-(void)textViewDidChange:(UITextView *)textView {
    
    NSInteger wordCounter = [self.textView.text length];
    
    self.countLabel.text = [NSString stringWithFormat:@"count: %lu", wordCounter];
    
    if ([self.textView.text length] <= 140) {
        [self.textView setEditable:YES];
    } else {
        [self.textView setEditable:NO];

    }
    
}

- (IBAction)onTwitterizeButtonTapped:(UIButton *)sender {
	
	NSString *textViewString = self.textView.text;
	
	NSMutableString *twitterizedString = [NSMutableString new];
	NSMutableArray *arrayWithCharacters = [NSMutableArray new];
	NSArray *vowelsArray = @[@"a", @"e", @"i", @"o", @"u"];
	
		for (int i = 0 ; i <= (textViewString.length - 1); i++) {
			NSString *letters = [NSString stringWithFormat:@"%c", [textViewString characterAtIndex:i]];
			[arrayWithCharacters addObject:letters];
			NSLog(@"%@", arrayWithCharacters[i]);
			
			if (!([vowelsArray[0] isEqualToString:arrayWithCharacters[i]]
				  || [vowelsArray[1] isEqualToString:arrayWithCharacters[i]]
					 || [vowelsArray[2] isEqualToString:arrayWithCharacters[i]]
						 || [vowelsArray[3] isEqualToString:arrayWithCharacters[i]]
							 || [vowelsArray[4] isEqualToString:arrayWithCharacters[i]])) {
				[twitterizedString appendString:arrayWithCharacters[i]];
			}
		
		self.textView.text = twitterizedString;
            
        NSInteger wordCounter = [self.textView.text length];
            
        self.countLabel.text = [NSString stringWithFormat:@"count: %lu", wordCounter];
	}
}
@end
