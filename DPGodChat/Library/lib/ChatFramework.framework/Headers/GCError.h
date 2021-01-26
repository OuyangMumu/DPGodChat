//
//  GCError.h
//  GodChat
//
//  Created by money on 2020/10/15.
//  Copyright © 2020 SQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HelpDesk/HelpDesk.h>
NS_ASSUME_NONNULL_BEGIN

@interface GCError : NSObject

/*!
 *  \~chinese
 *  错误码
 *
 *  \~english
 *  Error code
 */
@property (nonatomic) HDErrorCode code;

/*!
 *  \~chinese
 *  错误描述
 *
 *  \~english
 *  Error description
 */
@property (nonatomic, copy) NSString *errorDescription;


/*!
 *  \~chinese
 *  初始化错误实例
 *
 *  @param aDescription  错误描述
 *  @param aCode         错误码
 *
 *  @result 错误实例
 */
- (instancetype)initWithDescription:(NSString *)aDescription
                               code:(HDErrorCode)aCode;

/*!
 *  \~chinese
 *  创建错误实例
 *
 *  @param aDescription  错误描述
 *  @param aCode         错误码
 *
 *  @result 对象实例
 */
+ (instancetype)errorWithDescription:(NSString *)aDescription
                                code:(HDErrorCode)aCode;

@end

NS_ASSUME_NONNULL_END
