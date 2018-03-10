//
//  NextPageTeacher.m
//  FelixSystemUsingPlist
//
//  Created by Student P_04 on 28/12/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "NextPageTeacher.h"

@interface NextPageTeacher ()

@end

@implementation NextPageTeacher

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _LlbFirstName.text = [_dictDisplay valueForKey:@"fname"];
    _LblLastName.text = [_dictDisplay valueForKey:@"lname"];
    _LblUsername.text = [_dictDisplay valueForKey:@"username"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
