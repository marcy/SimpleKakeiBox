//
//  DateEditController.m
//  SimpleKakeibo
//
//  Created by masashi on 09/11/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DateEditController.h"
#import "NewViewController.h"


@implementation DateEditController

@synthesize label;
@synthesize uiDatePicker;
@synthesize date;

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
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
//NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//[formatter setDateFormat:@"YYYY年MM月dd日"];
//self.label.text = [formatter stringFromDate:date];
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
	
  NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
  [formatter setDateFormat:@"YYYY年MM月dd日"];
  self.label.text = [formatter stringFromDate:date];
	
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
  newViewController.date = uiDatePicker.date;
  [self.navigationController popViewControllerAnimated:YES];
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
  [super dealloc];
}


@end
