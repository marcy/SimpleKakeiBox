//
//  CategoriesViewController.m
//  SimpleKakeibo
//
//  Created by masashi on 09/11/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NodeViewController.h"
#import "CategoriesViewController.h"
#import "ItemlistViewController.h"
#import "MyAppDataController.h"

@implementation CategoriesViewController

@synthesize year;
@synthesize month;
@synthesize items;

/*
  - (void)viewDidLoad {
  [super viewDidLoad];
 
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  }
*/

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  headerLabel.text = [NSString stringWithFormat:@"合計: %i 円", [[MyAppDataController instance]amountYear:year Month:month]];
  [self.view reloadData];
}

/*
  - (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  }
*/
/*
  - (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  }
*/
/*
  - (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  }
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
// Return YES for supported orientations.
return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];

  // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
  // Release anything that can be recreated in viewDidLoad or on demand.
  // e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [[[MyAppDataController instance] categories] count]+1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  static NSString *CellIdentifier = @"Cell";
    
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
    
  // Configure the cell.

  if (indexPath.row == 0) {
    cell.textLabel.text = @"すべて";
  }else {
    cell.textLabel.text = [[[MyAppDataController instance] categories] objectAtIndex:indexPath.row-1];
  }
	
  return cell;
}




// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  // Navigation logic may go here -- for example, create and push another view controller.

  ItemlistViewController* childViewController;
  childViewController = [[ItemlistViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
  [childViewController autorelease];
	

  childViewController.year = year;
  childViewController.month = month;
  if (indexPath.row == 0) {
    childViewController.title = @"すべて";
    childViewController.listtype = @"ALL";
    //childViewController.items = [[MyAppDataController instance] itemsYear:year Month:month];
  }else {
    NSString* category = [[[MyAppDataController instance] categories] objectAtIndex:indexPath.row-1];
    childViewController.title = category;
    childViewController.listtype = @"CATEGORY";
    childViewController.category = category;
    //childViewController.items = [[MyAppDataController instance] searchByCategoryYear:year Month:month Category:category];
  }
	
  [childViewController dataReload];
	
  [self.navigationController pushViewController:childViewController animated:YES];
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
// Return NO if you do not want the specified item to be editable.
return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
if (editingStyle == UITableViewCellEditingStyleDelete) {
// Delete the row from the data source.
[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}   
else if (editingStyle == UITableViewCellEditingStyleInsert) {
// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
}   
}
*/


 /*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


 /*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


- (void)dealloc {
  [super dealloc];
}


@end

