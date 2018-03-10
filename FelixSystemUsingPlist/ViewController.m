//
//  ViewController.m
//  FelixSystemUsingPlist
//
//  Created by Student 09 on 12/26/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    isteacher = TRUE;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SelectUserLogin:(id)sender
{
    UISegmentedControl *seg = (UISegmentedControl *)sender;
    
    if (seg.selectedSegmentIndex == 0)
    {
        isteacher = TRUE;
    }
    else
    {
        isteacher = FALSE;
    }
}



- (IBAction)BtnSaveData:(id)sender
{
    BOOL status = [self validateEmailWithString:_Txtusername.text];
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    
    if ([_Txtfname.text isEqualToString:@""])
    {
        [self AcceptStringForValidation:_Txtfname.text];
    }
    else if ([_Txtlname.text isEqualToString:@""])
    {
        [self AcceptStringForValidation:_Txtlname.text];
    }
    else if ([_Txtusername.text isEqualToString:@""])
    {
        [self AcceptStringForValidation:_Txtusername.text];
    }
    else if ([_Txtpassword.text isEqualToString:@""])
    {
        [self AcceptStringForValidation:_Txtpassword.text];
    }
    else if (status == FALSE)
    {
        [self EmailAlertMethod];
    }
    else
    {
        if (isteacher == TRUE)
        {
            NSArray *PathArrTeacher = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            NSString *strPathTeacher =  [PathArrTeacher objectAtIndex:0];
            
           NSString *strPlistTeacher = [strPathTeacher stringByAppendingPathComponent:@"teacher.plist"];
            NSLog(@"%@",strPlistTeacher);
            
            if (![filemanager fileExistsAtPath:strPlistTeacher])
            {
                dictTeacher = [[NSMutableDictionary alloc]init];
                
                [dictTeacher setObject:_Txtfname.text forKey:@"fname"];
                [dictTeacher setObject:_Txtlname.text forKey:@"lname"];
                [dictTeacher setObject:_Txtusername.text forKey:@"username"];
                [dictTeacher setObject:_Txtpassword.text forKey:@"password"];
                
                ArrTeacher = [[NSMutableArray alloc]init];
                
                [ArrTeacher addObject:dictTeacher];
                [ArrTeacher writeToFile:strPlistTeacher atomically:YES];
            }
            else
            {
                
                dictTeacher = [[NSMutableDictionary alloc]init];
                
                [dictTeacher setObject:_Txtfname.text forKey:@"fname"];
                [dictTeacher setObject:_Txtlname.text forKey:@"lname"];
                [dictTeacher setObject:_Txtusername.text forKey:@"username"];
                [dictTeacher setObject:_Txtpassword.text forKey:@"password"];
                
        NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"@Email == %@",_Txtusername.text]];
    
                
                NSLog(@"%@",dictTeacher);
                
                ArrTeacher = [[NSMutableArray alloc]initWithContentsOfFile:strPlistTeacher];
                
                NSLog(@"%@",ArrTeacher);
                
                [ArrTeacher addObject:dictTeacher];
                 NSLog(@"%@",ArrTeacher);
                [ArrTeacher writeToFile:strPlistTeacher atomically:YES];
            }
            
        }
        else
        {
            NSArray *PathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            NSString *strPath =  [PathArr objectAtIndex:0];
            
            NSString *strPlistStudent = [strPath stringByAppendingPathComponent:@"student.plist"];
            NSLog(@"%@",strPlistStudent);
            
            if (![filemanager fileExistsAtPath:strPlistStudent])
            {
                dictStudent = [[NSMutableDictionary alloc]init];
                
                [dictStudent setObject:_Txtfname.text forKey:@"fname"];
                [dictStudent setObject:_Txtlname.text forKey:@"lname"];
                [dictStudent setObject:_Txtusername.text forKey:@"username"];
                [dictStudent setObject:_Txtpassword.text forKey:@"password"];
                
                ArrStudent = [[NSMutableArray alloc]init];
                
                [ArrStudent addObject:dictStudent];
                NSLog(@"%@",strPlistStudent);

                [ArrStudent writeToFile:strPlistStudent atomically:YES];
            }
            else
            {
                dictStudent = [[NSMutableDictionary alloc]init];
                
                [dictStudent setObject:_Txtfname.text forKey:@"fname"];
                [dictStudent setObject:_Txtlname.text forKey:@"lname"];
                [dictStudent setObject:_Txtusername.text forKey:@"username"];
                [dictStudent setObject:_Txtpassword.text forKey:@"password"];
                
                ArrStudent = [[NSMutableArray alloc]initWithContentsOfFile:strPlistStudent];
                [ArrStudent addObject:dictStudent];
                NSLog(@"%@",dictStudent);
                NSLog(@"%@",ArrStudent);
                [ArrStudent writeToFile:strPlistStudent atomically:YES];
          }
                
        }
      }
}

-(void)EmailAlertMethod
{
    UIAlertController *alertvc = [UIAlertController alertControllerWithTitle:@"Email Id" message:@"Incorrect Format" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actiontext = [UIAlertAction actionWithTitle:@"Format" style:UIAlertActionStyleDefault handler:^(UIAlertAction *actions)
                                 {
                                     [self dismissViewControllerAnimated:YES completion:nil];
                                 }];
    [alertvc addAction:actiontext];
    [self presentViewController:alertvc animated:YES completion:nil];
}


- (void)AcceptStringForValidation:(NSString *)strValidate
{
    if ([strValidate isEqualToString:@""])
    {
        UIAlertController *alertvcs = [UIAlertController alertControllerWithTitle:@"Empty Field" message:@"Field is empty" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *actionEmpty = [UIAlertAction actionWithTitle:@"Empty" style:UIAlertActionStyleDefault handler:^(UIAlertAction *actions)
                                     {
                                         [self dismissViewControllerAnimated:YES completion:nil];
                                     }];
        [alertvcs addAction:actionEmpty];
        [self presentViewController:alertvcs animated:YES completion:nil];
    }
}

- (BOOL )validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

- (IBAction)ShowTeacherData:(id)sender
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     TeacherUseController *teach = [story instantiateViewControllerWithIdentifier:@"TeacherUseController"];
    
    NSArray *PathArrTeacher = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *strPathTeacher =  [PathArrTeacher objectAtIndex:0];
    
    NSString *strPlistTeacher = [strPathTeacher stringByAppendingPathComponent:@"teacher.plist"];
    NSLog(@"%@",strPlistTeacher);
    
    ArrTeacher = [[NSMutableArray alloc]initWithContentsOfFile:strPlistTeacher];
    
    teach.arrTeacherDisplay = ArrTeacher;
    
    
     [self.navigationController pushViewController:teach animated:YES];
}

- (IBAction)ShowStudentData:(id)sender
{
     UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     
     StudentUseController *stud = [story instantiateViewControllerWithIdentifier:@"StudentUseController"];
    
    NSArray *PathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *strPath =  [PathArr objectAtIndex:0];
    
    NSString *strPlistStudent = [strPath stringByAppendingPathComponent:@"student.plist"];
    NSLog(@"%@",strPlistStudent);
    
    ArrStudent = [[NSMutableArray alloc]initWithContentsOfFile:strPlistStudent];
    
    stud.arrStudentDisplay = ArrStudent;

     [self.navigationController pushViewController:stud animated:YES];
}

@end
