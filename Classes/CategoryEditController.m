//
//  CategoryEditController.m
//  SimpleKakeibo
//
//  Created by masashi on 09/11/02.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CategoryEditController.h"
#import "NewViewController.h"
#import "MyAppDataController.h"


@implementation CategoryEditController

@synthesize textField;
@synthesize category;

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
 
  self.textField.text = category;
 
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;

  //バーにボタンを追加
  UIBarButtonItem *button = [[UIBarButtonItem alloc] 
                              initWithTitle:@"保存" 
                              style:UIBarButtonItemStyleBordered
                              target:self 
                              action:@selector(doSave:)
                             ]; 
  self.navigationItem.rightBarButtonItem = button;
  [button release]; 
}

-(void)doSave:(id)sender{  
  NSArray* viewControllers =[self.navigationController viewControllers];
  NewViewController* newViewController = [viewControllers objectAtIndex:[viewControllers count]-2];
  newViewController.category = textField.text;
  [self.navigationController popViewControllerAnimated:YES];
}

/*
  - (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  // When the user starts typing, show the clear button in the text field.
  textField.clearButtonMode = UITextFieldViewModeWhileEditing;
  // When the view first loads, display the placeholder text that's in the
  // text field in the label.
  //label.text = textField.placeholder;
  }
*/
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
  return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [[[MyAppDataController instance]categories] count];
}


-(NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section{
  return @"カテゴリから選択";
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  static NSString *CellIdentifier = @"Cell";
    
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
    
  // Set up the cell...
  cell.textLabel.text = [[[MyAppDataController instance]categories] objectAtIndex:indexPath.row];
	
  return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  // Navigation logic may go here. Create and push another view controller.
	
  textField.text = [[[MyAppDataController instance]categories] objectAtIndex:indexPath.row];
	
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

//テキストフィールドの編集開始のイベント処理
- (BOOL)textFieldShouldBeginEditing:(UITextField*)textField {
  return YES;
}

//テキストフィールドの編集開始後のイベント処理
- (void)textFieldDidBeginEditing:(UITextField*)textField {
}

//テキストフィールドの編集終了のイベント処理
-(BOOL)textFieldShouldEndEditing:(UITextField*)textField{
  return YES;
}

//テキストフィールドの編集終了後のイベント処理
-(void)textFieldDidEndEditing:(UITextField *)textField{
}

//テキストフィールドの文字変更のイベント処理
- (BOOL)textField:(UITextField*)textField 
shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string {
  return YES;
}

//テキストフィールドのクリア時のイベント処理
- (BOOL)textFieldShouldClear:(UITextField*)ttextField {
  return YES;
}

//テキストフィールドリターン時のイベント処理
- (BOOL)textFieldShouldReturn:(UITextField*)sender {
  //キーボードを閉じる
  [sender resignFirstResponder];
  return YES;
}


@end

