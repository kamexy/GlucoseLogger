//
//  GluInputViewController.m
//  GlucoseLogger
//
//  Created by kamexy on 10/03/01.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GluInputViewController.h"

#import "GluInputDetailViewController.h"
#import "GluInputDatetimeViewController.h"


@implementation GluInputViewController

@synthesize inputTableView;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
	
	[inputTableView release];
	
    [super dealloc];
}



// UITableViewDataSource Protocol
/////////////////////////////////

// @require
- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	
	// 0. 血糖値
	// 1. 時間
	// 2. 食前 / 食後
	// 3. 食事内容
	// 4. 画像
	return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
	
	if ( cell == nil ) {
		
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
		cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
	}
	
	switch ( indexPath.row ) {
		case 0:
			cell.textLabel.text = @"血糖値";
			cell.detailTextLabel.text = @"未入力";
			break;
		
		case 1:
			cell.textLabel.text = @"日付と時間";
			cell.detailTextLabel.text = @"未入力";
			break;
		
		case 2:
			cell.textLabel.text = @"食前 / 食後";
			cell.detailTextLabel.text = @"未選択";
			break;
		
		// TODO: ここは複数行のフリー入力にした方がよいので、Cell の View は独自が良いかも?
		case 3:
			cell.textLabel.text = @"食事内容";
			cell.detailTextLabel.text = @"未入力";
			break;
		
		// TODO: 画像を選択/撮影する UI を要調査
		case 4:
			cell.textLabel.text = @"画像";
			cell.detailTextLabel.text = @"未設定";
			break;
			
		default:
			break;
	}
	
	return cell;
}


// @optional
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
}

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section; 
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;

// Editing
// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath;
// Moving/reordering
// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath;

// Index
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView;                                                    // return list of section titles to display in section index view (e.g. "ABCD...Z#")
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index;  // tell table which section corresponds to section title/index (e.g. "B",1))

// Data manipulation - insert and delete support
// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;

// Data manipulation - reorder / moving support
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath;
*/
/////////////////////////////////
// UITableViewDataSource Protocol



// UITableViewDelegate
//////////////////////

// @optional

/*
// Display customization
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

// Variable height support
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;

// Section header & footer information. Views are preferred over title should you decide to provide both
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;   // custom view for header. will be adjusted to default or specified header height
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;   // custom view for footer. will be adjusted to default or specified footer height

// Accessories (disclosures).
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;

// Selection
// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath;

*/
// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	switch ( indexPath.row ) {
		
		// 血糖値
		case 0:
			selectedCell = [tableView cellForRowAtIndexPath:indexPath];
			
			GluInputDetailViewController *inputDetailViewController;
			inputDetailViewController = [[GluInputDetailViewController alloc] initWithNibName:@"GluInputDetailViewController" bundle:[NSBundle mainBundle]];
			[inputDetailViewController setInputDetailViewDelegate:self];
			[self presentModalViewController:inputDetailViewController animated:YES];
			[inputDetailViewController release];
			break;
		
		// 日付と時間
		case 1:
			selectedCell = [tableView cellForRowAtIndexPath:indexPath];
			
			GluInputDatetimeViewController *datetimeViewController;
			datetimeViewController = [[GluInputDatetimeViewController alloc] initWithNibName:@"GluInputDatetimeViewController" bundle:[NSBundle mainBundle]];
			[datetimeViewController setInputDatetimeViewDelegate:self];
			[self presentModalViewController:datetimeViewController animated:YES];
			[datetimeViewController release];
			break;
			
		default:
			break;
	}
}

/*
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath;

// Editing
// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath;

// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath;

// The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath;

// Moving/reordering
// Allows customization of the target row for a particular row as it is being moved/reordered
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath;               

// Indentation
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath; // return 'depth' of row for hierarchies
*/

//////////////////////
// UITableViewDelegate

// GluInputDetailViewDelegate
//////////////////////////
// @required
- (void)glucose:(NSString *)stringOrNil {
	
	if ( stringOrNil )
		selectedCell.detailTextLabel.text = [stringOrNil stringByAppendingString:@" mg/dl"];
	
	selectedCell.selected = NO;
	selectedCell = nil;
}
//////////////////////////
// GluInputDetailViewDelegate

// GluInputDatetimeViewDelegate
//////////////////////////
// @required
- (void)datetime:(NSDate *)dateOrNil {
	
	if ( dateOrNil ) {
		
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
		[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
		
		NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
		[dateFormatter setLocale:locale];
		
		selectedCell.detailTextLabel.text = [dateFormatter stringFromDate:dateOrNil];
		
		[locale release];
		[dateFormatter release];
	}
	
	selectedCell.selected = NO;
	selectedCell = nil;
}
//////////////////////////
// GluInputDatetimeViewDelegate

@end
