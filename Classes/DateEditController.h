//
//  DateEditController.h
//  SimpleKakeibo
//
//  Created by masashi on 09/11/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DateEditController : UIViewController {
  UILabel* label;
  UIDatePicker* uiDatePicker;
  NSDate* date;
}

@property (nonatomic, retain) IBOutlet UIDatePicker* uiDatePicker;
@property (nonatomic, retain) IBOutlet UILabel* label;
@property (nonatomic, retain) NSDate* date;


@end
