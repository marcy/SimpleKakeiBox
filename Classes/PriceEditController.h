//
//  PriceEditController.h
//  SimpleKakeibo
//
//  Created by masashi on 09/11/02.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PriceEditController : UIViewController {
	UILabel* priceLabel;
	NSString* price;
}

@property (retain) IBOutlet UILabel* priceLabel;
@property (retain) NSString* price;

-(IBAction)pushButton0:(id)sender;
-(IBAction)pushButton1:(id)sender;
-(IBAction)pushButton2:(id)sender;
-(IBAction)pushButton3:(id)sender;
-(IBAction)pushButton4:(id)sender;
-(IBAction)pushButton5:(id)sender;
-(IBAction)pushButton6:(id)sender;
-(IBAction)pushButton7:(id)sender;
-(IBAction)pushButton8:(id)sender;
-(IBAction)pushButton9:(id)sender;
-(IBAction)pushButton00:(id)sender;
-(IBAction)pushButtonDel:(id)sender;


@end
