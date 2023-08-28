//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "JSQMessagesCollectionViewCell.h"

/**
 *  A `JSQMessagesCollectionViewCellIncoming` object is a concrete instance 
 *  of `JSQMessagesCollectionViewCell` that represents an incoming message data item.
 */
@interface JSQMessagesCollectionViewCellIncoming : JSQMessagesCollectionViewCell

@property (weak, nonatomic, readonly) UIImageView *fileImageView;
@property (weak, nonatomic, readonly) NSLayoutConstraint *fileImageViewWidthConstraint;
@property (weak, nonatomic, readonly) NSLayoutConstraint *fileImageViewLeadingConstraint;
@property (weak, nonatomic, readonly) NSLayoutConstraint *fileImageViewTrailingConstraint;

@end
