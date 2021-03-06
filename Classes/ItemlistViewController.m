//
//  ItemlistViewController.m
//  SimpleKakeibo
//
//  Created by masashi on 09/11/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ItemlistViewController.h"
#import "DetailViewController.h"
#import "MyAppDataController.h"


@implementation ItemlistViewController

@synthesize listtype;
@synthesize year;
@synthesize month;
@synthesize category;
@synthesize items;


/*
  - (void)viewDidLoad {
  [super viewDidLoad];
 
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  }
*/


-(void)dataReload{
  if ([listtype isEqualToString:@"ALL"]) {
    items = [[MyAppDataController instance] itemsYear:year Month:month];
  }else {
    items = [[MyAppDataController instance] searchByCategoryYear:year Month:month Category:category];
  }
}


- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self dataReload];
  [self.view reloadData];
}


- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  NSInteger amount = 0;
  int i;
  for (i=0; i<[items count]; i++) {
    NSString* str = [[[items objectAtIndex:i] objectAtIndex:1] objectAtIndex:0];
    NSInteger n = [str integerValue];
    amount += n;
  }
  NSString* header = [NSString stringWithFormat:@"合計: %i 円", amount];
  headerLabel.text = header;
}

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
  return [items count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return 20.0 * 3;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  static NSString *CellIdentifier = @"Cell";
    
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
    
  // Configure the cell.
  NSString* price = [[[items objectAtIndex:indexPath.row] objectAtIndex:1] objectAtIndex:0];
  NSString* ccategory = [[[items objectAtIndex:indexPath.row] objectAtIndex:1] objectAtIndex:1];
  NSDate* date = [[[items objectAtIndex:indexPath.row] objectAtIndex:1] objectAtIndex:2];
  NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
  [formatter setDateFormat:@"YYYY/MM/dd"];
    
  cell.textLabel.text = [NSString stringWithFormat:@"%@\n%@ 円\n%@", ccategory, price, [formatter stringFromDate:date]];
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  cell.textLabel.opaque = NO;
  cell.textLabel.textColor = [UIColor grayColor];
  cell.textLabel.highlightedTextColor = [UIColor blackColor];
  cell.textLabel.font = [UIFont systemFontOfSize:12];
  cell.textLabel.numberOfLines = 10;
	
  return cell;
}




// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  // Navigation logic may go here -- for example, create and push another view controller.
  DetailViewController* childViewController;
  childViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
  [childViewController autorelease];
	
  //childViewController.item = [names objectAtIndex:indexPath.row];
  childViewController.identifier = [[[items objectAtIndex:indexPath.row] objectAtIndex:0] integerValue];
	
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


