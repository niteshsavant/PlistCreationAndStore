//
//  TeacherUseController.m
//  FelixSystemUsingPlist
//
//  Created by Student 09 on 12/26/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "TeacherUseController.h"

@interface TeacherUseController ()

@end

@implementation TeacherUseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrTeacherDisplay.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ForTeacherViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ForTeacherViewCell"];
    
    if (cell == nil)
    {
        cell = [[ForTeacherViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ForTeacherViewCell"];
    }
    NSDictionary *dictTemp = [_arrTeacherDisplay objectAtIndex:indexPath.row];
    cell.LabelFName.text = [dictTemp valueForKey:@"fname"];
    cell.LabelLName.text = [dictTemp valueForKey:@"lname"];
    cell.LabelUsername.text = [dictTemp valueForKey:@"username"];
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NextPageTeacher *teach = [story instantiateViewControllerWithIdentifier:@"NextPageTeacher"];
    
   teach.dictDisplay = [_arrTeacherDisplay objectAtIndex:indexPath.row];
    
    
    [self.navigationController pushViewController:teach animated:YES];
}

@end
