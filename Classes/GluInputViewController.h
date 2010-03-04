//
//  GluInputViewController.h
//  GlucoseLogger
//
//  Created by kamexy on 10/03/01.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GluInputDetailViewController.h"
#import "GluInputDatetimeViewController.h"


@interface GluInputViewController : UIViewController
	<UITableViewDelegate,
	UITableViewDataSource,
	GluInputDetailViewDelegate,
	GluInputDatetimeViewDelegate>
{
	
	UITableView *inputTableView;
	
	UITableViewCell *selectedCell;
}

@property (nonatomic, retain) IBOutlet UITableView *inputTableView;

@end
