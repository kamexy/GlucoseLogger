//
//  GluInputDatetimeViewController.m
//  GlucoseLogger
//
//  Created by kamexy on 10/03/03.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GluInputDatetimeViewController.h"


@implementation GluInputDatetimeViewController

@synthesize myButton;
@synthesize myDatePicker;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	NSDate *date = [NSDate date];
	[self updateDatetimeString:date];
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
	
	[myDatePicker release];
	
    [super dealloc];
}


- (void)updateDatetimeString:(NSDate *)date {
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	
	NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
	[dateFormatter setLocale:locale];
	
	myButton.titleLabel.textAlignment = UITextAlignmentCenter;
	myButton.titleLabel.text = [dateFormatter stringFromDate:date];
	
	[locale release];
	[dateFormatter release];
}

- (void)setInputDatetimeViewDelegate:(NSObject<GluInputDatetimeViewDelegate> *)delegate {
	
	if ( inputDatetimeViewDelegate )
		[inputDatetimeViewDelegate release];
	
	inputDatetimeViewDelegate = delegate;
	[inputDatetimeViewDelegate retain];
}

- (IBAction)doCancel {
	
	if ( [inputDatetimeViewDelegate respondsToSelector:@selector(datetime:)] )
		[inputDatetimeViewDelegate datetime:nil];
	
	[self.parentViewController dismissModalViewControllerAnimated:YES];
}

- (IBAction)doSubmit {
	
	if ( [inputDatetimeViewDelegate respondsToSelector:@selector(datetime:)] )
		[inputDatetimeViewDelegate datetime:myDatePicker.date];
	
	[self.parentViewController dismissModalViewControllerAnimated:YES];
}

- (IBAction)doDatePickerValueChanged {
	
	[self updateDatetimeString:myDatePicker.date];
}

@end
