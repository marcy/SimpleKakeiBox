//
//  CategoryEditController.h
//  SimpleKakeibo
//
//  Created by masashi on 09/11/02.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CategoryEditController : UITableViewController<UITextFieldDelegate> {
  UITextField* textField;
  NSString* category;
}

@property (retain) NSString* category;
@property (nonatomic, retain) IBOutlet UITextField* textField;


@end
