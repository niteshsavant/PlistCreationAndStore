//
//  ViewController.h
//  FelixSystemUsingPlist
//
//  Created by Student 09 on 12/26/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentUseController.h"
#import "TeacherUseController.h"
#import "ForStudentViewCell.h"
#import "ForTeacherViewCell.h"

@interface ViewController : UIViewController
{
    BOOL isteacher;
    
    NSMutableArray *ArrTeacher;
    NSMutableArray *ArrStudent;
    NSMutableDictionary *dictTeacher;
    NSMutableDictionary *dictStudent;
}
@property (strong, nonatomic) IBOutlet UITextField *Txtfname;

@property (strong, nonatomic) IBOutlet UITextField *Txtlname;
@property (strong, nonatomic) IBOutlet UITextField *Txtusername;
@property (strong, nonatomic) IBOutlet UITextField *Txtpassword;

- (IBAction)BtnSaveData:(id)sender;
- (IBAction)SelectUserLogin:(id)sender;

- (IBAction)ShowTeacherData:(id)sender;

- (IBAction)ShowStudentData:(id)sender;

@end

