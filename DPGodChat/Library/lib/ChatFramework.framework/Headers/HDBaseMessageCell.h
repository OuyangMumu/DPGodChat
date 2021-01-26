//
//  HDBaseMessagesCell.h
//  GodChat
//
//  Created by money on 2020/10/28.
//  Copyright © 2020 SQ. All rights reserved.
//

#import "HDMessageCell.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString *const HDMessageCellIdentifierSendText;
extern NSString *const HDMessageCellIdentifierSendLocation;
extern NSString *const HDMessageCellIdentifierSendVoice;
extern NSString *const HDMessageCellIdentifierSendVideo;
extern NSString *const HDMessageCellIdentifierSendImage;
extern NSString *const HDMessageCellIdentifierSendFile;

@interface HDBaseMessageCell : HDMessageCell
{
    UILabel *_nameLabel;
}

@property (nonatomic) CGFloat avatarSize UI_APPEARANCE_SELECTOR; //default 30;

@property (nonatomic) CGFloat avatarCornerRadius UI_APPEARANCE_SELECTOR; //default 0;

@property (nonatomic) UIFont *messageNameFont UI_APPEARANCE_SELECTOR; //default [UIFont systemFontOfSize:10];

@property (nonatomic) UIColor *messageNameColor UI_APPEARANCE_SELECTOR; //default [UIColor grayColor];

@property (nonatomic) CGFloat messageNameHeight UI_APPEARANCE_SELECTOR; //default 15;

@property (nonatomic) BOOL messageNameIsHidden UI_APPEARANCE_SELECTOR; //default NO;


@end

NS_ASSUME_NONNULL_END
