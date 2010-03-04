//
//  GluInputDatetimeViewController.h
//  GlucoseLogger
//
//  Created by kamexy on 10/03/03.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GluInputDatetimeViewDelegate <NSObject>

@required
- (void)datetime:(NSDate *)dateOrNil;

@end

@interface GluInputDatetimeViewController : UIViewController {
	
	UIButton *myButton;
	UIDatePicker *myDatePicker;
	
	NSObject<GluInputDatetimeViewDelegate> *inputDatetimeViewDelegate;
}

@property (nonatomic, retain) IBOutlet UIButton *myButton;
@property (nonatomic, retain) IBOutlet UIDatePicker *myDatePicker;

- (void)setInputDatetimeViewDelegate:(NSObject<GluInputDatetimeViewDelegate> *)delegate;
- (IBAction)doCancel;
- (IBAction)doSubmit;
- (IBAction)doDatePickerValueChanged;


@end
