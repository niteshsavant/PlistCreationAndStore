//
//  NextPageStudent.h
//  FelixSystemUsingPlist
//
//  Created by Student P_04 on 28/12/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextPageStudent : UIViewController
@property(strong,nonatomic) NSDictionary *dictDisplay;

@property (weak, nonatomic) IBOutlet UILabel *LblFirstName;
@property (weak, nonatomic) IBOutlet UILabel *LblLastName;
@property (weak, nonatomic) IBOutlet UILabel *LblUsername;


@end
