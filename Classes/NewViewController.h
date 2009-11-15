//
//  NewViewController.h
//  SimpleKakeibo
//
//  Created by masashi on 09/11/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#define ENABLE_ITEM_DELETE true;


@interface NewViewController : UITableViewController <UIActionSheetDelegate> {
  NSMutableArray* names;
  NSString* price;
  NSDate* date;
  NSString* category;
  NSNumber* isNew;
  NSInteger identifier;
}

@property (nonatomic, retain) NSArray* names;
@property (nonatomic, retain) NSString* price;
@property (nonatomic, retain) NSDate* date;
@property (nonatomic, retain) NSString* category;
@property (nonatomic, retain) NSNumber* isNew;
@property NSInteger identifier;


@end
