//
//  PriceEditController.m
//  SimpleKakeibo
//
//  Created by masashi on 09/11/02.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PriceEditController.h"
#import "NewViewController.h"


@implementation PriceEditController

@synthesize priceLabel;
@synthesize price;

-(IBAction)pushButton0:(id)sender{
  if ([priceLabel.text length]>0) {
    priceLabel.text = [priceLabel.text stringByAppendingString:@"0"];
  }
}
-(IBAction)pushButton1:(id)sender{
  priceLabel.text = [priceLabel.text stringByAppendingString:@"1"];
}
-(IBAction)pushButton2:(id)sender{
  priceLabel.text = [priceLabel.text stringByAppendingString:@"2"];
}
-(IBAction)pushButton3:(id)sender{
  priceLabel.text = [priceLabel.text stringByAppendingString:@"3"];
}
-(IBAction)pushButton4:(id)sender{
  priceLabel.text = [priceLabel.text stringByAppendingString:@"4"];
}
-(IBAction)pushButton5:(id)sender{
  priceLabel.text = [priceLabel.text stringByAppendingString:@"5"];
}
-(IBAction)pushButton6:(id)sender{
  priceLabel.text = [priceLabel.text stringByAppendingString:@"6"];
}
-(IBAction)pushButton7:(id)sender{
  priceLabel.text = [priceLabel.text stringByAppendingString:@"7"];
}
-(IBAction)pushButton8:(id)sender{
  priceLabel.text = [priceLabel.text stringByAppendingString:@"8"];
}
-(IBAction)pushButton9:(id)sender{
  priceLabel.text = [priceLabel.text stringByAppendingString:@"9"];
}
-(IBAction)pushButton00:(id)sender{
  priceLabel.text = [priceLabel.text stringByAppendingString:@"00"];
}
-(IBAction)pushButtonDel:(id)sender{
  if ([priceLabel.text length]>0) {
    priceLabel.text = [priceLabel.text substringToIndex:[priceLabel.text length]-1];
  }
	
}


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
	
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];

  priceLabel.text = price;
	
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
  newViewController.price = priceLabel.text;
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
