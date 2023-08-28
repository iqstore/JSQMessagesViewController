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

#import "JSQMessagesCollectionViewCellIncoming.h"

@interface JSQMessagesCollectionViewCellIncoming()

@property (weak, nonatomic) IBOutlet UIImageView *fileImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fileImageViewWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fileImageViewLeadingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fileImageViewTrailingConstraint;

@end

@implementation JSQMessagesCollectionViewCellIncoming

#pragma mark - Overrides

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.messageBubbleTopLabel.textAlignment = NSTextAlignmentLeft;
    self.cellBottomLabel.textAlignment = NSTextAlignmentLeft;
    self.fileImageViewWidthConstraint.constant = 0;
    self.fileImageViewLeadingConstraint.constant = 0;
    self.fileImageViewTrailingConstraint.constant = 6;
    UIImage *image = [UIImage systemImageNamed:@"doc"];
    self.fileImageView.image = image;
    self.fileImageView.tintColor = [UIColor blackColor];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.fileImageViewWidthConstraint.constant = 0;
    self.fileImageViewLeadingConstraint.constant = 0;
    self.fileImageViewTrailingConstraint.constant = 6;
}

@end
