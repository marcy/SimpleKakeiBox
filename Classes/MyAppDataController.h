//
//  DateController.h
//  SimpleKakeibo
//
//  Created by masashi on 09/11/02.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#define FILENAME @"archive"
#define DATAKEY @"data"

#import <UIKit/UIKit.h>
#import "MyApplicationData.h"

@interface MyAppDataController : NSObject {
	MyApplicationData* appdata;
}

@property (nonatomic, retain) MyApplicationData* appdata;

-(void)loadData;
-(void)addAppDataItemPrice:(NSString*)price itemCategory:(NSString*)category itemDate:(NSDate*)date;
-(void)editAppDataItemId:(NSInteger)identifier itemPrice:(NSString *)price itemCategory:(NSString *)category itemDate:(NSDate *)date;
-(void)deleteAppDataItemId:(NSInteger)identifier;
-(void)saveData;
-(NSMutableArray*)categories;
-(NSString*)dataFilePath;
-(NSString*)allAmount;
-(NSString*)amountYear:(NSInteger)searchYear Month:(NSInteger)searchMonth;
-(NSMutableArray*)itemsYear:(NSInteger)searchYear Month:(NSInteger)searchMonth;
-(NSMutableArray*)searchByCategoryYear:(NSInteger)searchYear Month:(NSInteger)searchMonth Category:(NSString *)searchCategory;
-(NSMutableArray*)getByIdentifier:(NSInteger)identifier;
-(int)checkYear:(NSDate *)date;

+(id)instance;


@end
