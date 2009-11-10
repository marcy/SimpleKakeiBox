//
//  NewViewController.m
//  SimpleKakeibo
//
//  Created by masashi on 09/11/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NewViewController.h"
#import "DateEditController.h"
#import "CategoryEditController.h"
#import "PriceEditController.h"
#import "MyAppDataController.h"
#import "RootViewController.h"
#import "MyApplicationData.h"


@implementation NewViewController

@synthesize names;
@synthesize price;
@synthesize date;
@synthesize category;
@synthesize isNew;
@synthesize identifier;


- (void)viewDidLoad {
  [super viewDidLoad];
 
  //バーにボタンを追加
  UIBarButtonItem *button = [[UIBarButtonItem alloc] 
                              initWithTitle:@"保存" 
                              style:UIBarButtonItemStyleBordered
                              target:self 
                              action:@selector(doSave:)
                             ]; 
  self.navigationItem.rightBarButtonItem = button;
  [button release];   
	
  BOOL enable_item_delete = ENABLE_ITEM_DELETE;
  if (enable_item_delete) {
    if((isNew != nil && !isNew) || !isNew){
      UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc] 
                                        initWithTitle:@"削除" 
                                        style:UIBarButtonItemStyleBordered
                                        target:self 
                                        action:@selector(deleteItem:)
                                       ]; 
      self.navigationItem.leftBarButtonItem = deleteButton;
      [deleteButton release];   
    }
        
  }
	
 
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)doSave:(id)sender{  
  if (price == nil) {
    [self.navigationController popViewControllerAnimated:YES];
    return;
  }
  if (category == nil) {
    category = @"";
  }

  if((isNew != nil && !isNew) || !isNew){
    [[MyAppDataController instance] editAppDataItemId:identifier itemPrice:price itemCategory:category itemDate:date];
  }else{
    [[MyAppDataController instance] addAppDataItemPrice:price itemCategory:category itemDate:date];
  }
    
  [[MyAppDataController instance] saveData];

  [self.navigationController popViewControllerAnimated:YES];
}


-(void)deleteItem:(id)sender{
  if (price == nil) {
    [self.navigationController popViewControllerAnimated:YES];
    return;
  }
  if (category == nil) {
    category = @"";
  }

  if((isNew != nil && !isNew) || !isNew){
    //[[MyAppDataController instance] editAppDataItemId:identifier itemPrice:@"0" itemCategory:category itemDate:date];
    [[MyAppDataController instance] deleteAppDataItemId:identifier];
  }
  [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillAppear:(BOOL)animated {
  [self.tableView reloadData];
  [super viewWillAppear:animated];
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
  return 3;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 1;
}

-(NSString*)tableView:(UITableView*)tableView
titleForHeaderInSection:(NSInteger)section{
  return [names objectAtIndex:section];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  static NSString *CellIdentifier = @"New";
    
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
    
  // Configure the cell.
  if (indexPath.section == 0) {
    cell.textLabel.text = price;
  }else if (indexPath.section == 1) {
    cell.textLabel.text = category;
  }else if (indexPath.section == 2) {
    if (date != nil) {
      date;
    }else {
      self.date = [NSDate date];
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY年MM月dd日"];
    cell.textLabel.text = [formatter stringFromDate:date];
  }
    
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  cell.textLabel.opaque = NO;
  cell.textLabel.textColor = [UIColor grayColor];
  cell.textLabel.highlightedTextColor = [UIColor blackColor];
  cell.textLabel.numberOfLines = 10;


  return cell;
}

// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  // Navigation logic may go here -- for example, create and push another view controller.
	
  if(indexPath.section == 0){
    PriceEditController* childViewController;
    childViewController = [[PriceEditController alloc]initWithNibName:@"PriceEditController" bundle:nil];
    childViewController.price = @"";
    [childViewController autorelease];
		
    [self.navigationController pushViewController:childViewController animated:YES];
  }else if (indexPath.section == 1) {
    CategoryEditController* categoryEditController;
    categoryEditController = [[CategoryEditController alloc]initWithNibName:@"CategoryEditController" bundle:nil];
    categoryEditController.category = self.category;
    [categoryEditController autorelease];
		
    [self.navigationController pushViewController:categoryEditController animated:YES];
  }else if (indexPath.section == 2) {
    DateEditController* childViewController;
    childViewController = [[DateEditController alloc] initWithNibName:@"DateEditController" bundle:nil];
    childViewController.date = self.date;
    [childViewController autorelease];
		
    [self.navigationController pushViewController:childViewController animated:YES];
  }
	
  //CategoriesViewController* childViewController;
  //childViewController = [[CategoriesViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
  //[childViewController autorelease];
 
  //childViewController.title = name;
 
  //[self.navigationController pushViewController:childViewController animated:YES];
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


