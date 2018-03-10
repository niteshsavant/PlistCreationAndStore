//
//  StudentUseController.m
//  FelixSystemUsingPlist
//
//  Created by Student 09 on 12/26/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "StudentUseController.h"

@interface StudentUseController ()

@end

@implementation StudentUseController

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
    return _arrStudentDisplay.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ForStudentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ForStudentViewCell"];
    
    if (cell == nil)
    {
        cell = [[ForStudentViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ForStudentViewCell"];
    }
    NSDictionary *dictTemp = [_arrStudentDisplay objectAtIndex:indexPath.row];
    cell.LabelFName.text = [dictTemp valueForKey:@"fname"];
    cell.LabelLName.text = [dictTemp valueForKey:@"lname"];
    cell.LabelUsername.text = [dictTemp valueForKey:@"username"];
    cell.layer.borderWidth = 2;
    cell.layer.borderColor = [[UIColor darkGrayColor]CGColor];
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NextPageStudent *stud = [story instantiateViewControllerWithIdentifier:@"NextPageStudent"];
    
    stud.dictDisplay = [_arrStudentDisplay objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:stud animated:YES];
}

@end
