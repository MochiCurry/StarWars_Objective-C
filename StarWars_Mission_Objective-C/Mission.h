//
//  Mission.h
//  StarWars_Mission_Objective-C
//
//  Created by Kerry Ferguson on 3/24/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Mission : NSObject

//@property (strong, nonatomic) NSNumber *id;
//@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *timestamp;
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *locationline1;
@property (strong, nonatomic) NSString *locationline2;
@property (strong, nonatomic) NSString *phone;

@end

NS_ASSUME_NONNULL_END

