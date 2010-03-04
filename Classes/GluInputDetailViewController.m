//
//  InputDetailViewController.m
//  GlucoseLogger
//
//  Created by kamexy on 10/03/01.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GluInputDetailViewController.h"

@implementation GluInputDetailViewController

@synthesize textField1;
@synthesize textField2;
@synthesize textField3;
@synthesize inputField;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	[inputField becomeFirstResponder];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	[textField1 release];
	[textField2 release];
	[textField3 release];
	[inputField release];
	[inputDetailViewDelegate release];
	
    [super dealloc];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	
	if (
		[string isEqualToString:@"0"] || [string isEqualToString:@"1"] || [string isEqualToString:@"2"] ||
		[string isEqualToString:@"3"] || [string isEqualToString:@"4"] || [string isEqualToString:@"5"] ||
		[string isEqualToString:@"6"] || [string isEqualToString:@"7"] || [string isEqualToString:@"8"] ||
		[string isEqualToString:@"9"]
	) {
	
		textField1.text = textField2.text;
		textField2.text = textField3.text;
		textField3.text = string;
	}
	
	return NO;
}

- (IBAction)doCancel {
	
	if ( [inputDetailViewDelegate respondsToSelector:@selector(glucose:)] )
		[inputDetailViewDelegate glucose:nil];
	
	[self.parentViewController dismissModalViewControllerAnimated:YES];
}

- (IBAction)doSubmit {
	
	if ( [textField3.text isEqualToString:@""] )
		return;
	
	if ( [inputDetailViewDelegate respondsToSelector:@selector(glucose:)] )
		[inputDetailViewDelegate glucose:[textField1.text stringByAppendingString:[textField2.text stringByAppendingString:textField3.text]]];
	
	[self.parentViewController dismissModalViewControllerAnimated:YES];
}

- (void)setInputDetailViewDelegate:(NSObject<GluInputDetailViewDelegate> *)delegate {
	
	if ( inputDetailViewDelegate )
		[inputDetailViewDelegate release];
	
	inputDetailViewDelegate = delegate;
	[inputDetailViewDelegate retain];
}

@end
