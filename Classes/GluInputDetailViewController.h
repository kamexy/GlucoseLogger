//
//  InputDetailViewController.h
//  GlucoseLogger
//
//  Created by kamexy on 10/03/01.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GluInputDetailViewDelegate <NSObject>

@required
- (void)glucose:(NSString *)stringOrNil;

@end

@interface GluInputDetailViewController : UIViewController <UITextFieldDelegate> {
	
	UITextField *textField1;
	UITextField *textField2;
	UITextField *textField3;
	UITextField *inputField;
	
	NSObject<GluInputDetailViewDelegate> *inputDetailViewDelegate;
}

@property (nonatomic, retain) IBOutlet UITextField *textField1;
@property (nonatomic, retain) IBOutlet UITextField *textField2;
@property (nonatomic, retain) IBOutlet UITextField *textField3;
@property (nonatomic, retain) IBOutlet UITextField *inputField;

- (void)setInputDetailViewDelegate:(NSObject<GluInputDetailViewDelegate> *)delegate;
- (IBAction)doCancel;
- (IBAction)doSubmit;

@end

