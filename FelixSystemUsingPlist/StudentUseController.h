//
//  StudentUseController.h
//  FelixSystemUsingPlist
//
//  Created by Student 09 on 12/26/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForStudentViewCell.h"
#import "NextPageStudent.h"



@interface StudentUseController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *TableStudentDisplay;
@property(strong,nonatomic) NSArray *arrStudentDisplay;

@end
