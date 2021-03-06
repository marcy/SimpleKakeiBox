//
//  DetailViewController.m
//  SimpleKakeibo
//
//  Created by masashi on 09/11/03.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "NewViewController.h"
#import "MyAppDataController.h"


@implementation DetailViewController

@synthesize identifier;

/*
  - (id)initWithStyle:(UITableViewStyle)style {
  // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
  if (self = [super initWithStyle:style]) {
  }
  return self;
  }
*/


- (void)viewDidLoad {
  [super viewDidLoad];
	
  //バーにボタンを追加
  UIBarButtonItem *editButton = [[UIBarButtonItem alloc] 
                                  initWithTitle:@"編集" 
                                  style:UIBarButtonItemStyleBordered
                                  target:self 
                                  action:@selector(editItem:)
                                 ]; 
  self.navigationItem.rightBarButtonItem = editButton;
  [editButton release];   
	
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)editItem:(id)sender{
  NewViewController* childViewController;
  childViewController = [[NewViewController alloc] initWithNibName:@"NewViewController" bundle:nil];
  [childViewController autorelease];
    
  NSMutableArray* item = [[MyAppDataController instance] getByIdentifier:identifier];
  childViewController.price = [item objectAtIndex:0];
  childViewController.category = [item objectAtIndex:1];
  childViewController.date = [item objectAtIndex:2];
  childViewController.identifier = identifier;
	
  childViewController.names = [NSArray arrayWithObjects:@"金額",@"カテゴリ",@"日付",nil];
  childViewController.title = @"編集";
	
  [self.navigationController pushViewController:childViewController animated:YES];
}



- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
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


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 3;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 1;
}

-(NSString*)tableView:(UITableView*)tableView
titleForHeaderInSection:(NSInteger)section{
  NSArray* sections = [NSArray arrayWithObjects:@"金額", @"カテゴリ", @"日付", nil];
  return [sections objectAtIndex:section];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  static NSString *CellIdentifier = @"Cell";
    
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
    
  // Set up the cell...
	
  //cell.textLabel.text = @"aaa";
  if (indexPath.section == 2) {
    NSDate* date = [[[MyAppDataController instance] getByIdentifier:identifier] objectAtIndex:indexPath.section];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY年MM月dd日"];
    cell.textLabel.text = [formatter stringFromDate:date];        
  }else if(indexPath.section == 0){
    NSString* cellStr = [[[MyAppDataController instance] getByIdentifier:identifier] objectAtIndex:indexPath.section];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ 円", cellStr];
  }else{
    NSString* cellStr = [[[MyAppDataController instance] getByIdentifier:identifier] objectAtIndex:indexPath.section];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", cellStr];
  }
	
  return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  // Navigation logic may go here. Create and push another view controller.
  // AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
  // [self.navigationController pushViewController:anotherViewController];
  // [anotherViewController release];
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
// Delete the row from the data source
[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
}   
else if (editingStyle == UITableViewCellEditingStyleInsert) {
// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

