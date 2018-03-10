//
//  TeacherUseController.h
//  FelixSystemUsingPlist
//
//  Created by Student 09 on 12/26/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForTeacherViewCell.h"
#import "NextPageTeacher.h"

@interface TeacherUseController : UIViewController

@property(strong,nonatomic) NSArray *arrTeacherDisplay;
@property (strong, nonatomic) IBOutlet UITableView *TableTeacherDisplay;



@end
