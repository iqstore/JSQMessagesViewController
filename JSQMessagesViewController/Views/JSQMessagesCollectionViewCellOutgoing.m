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

#import "JSQMessagesCollectionViewCellOutgoing.h"

@interface JSQMessagesCollectionViewCellOutgoing()

@property (weak, nonatomic) IBOutlet UIImageView *fileImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fileImageViewWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fileImageViewLeadingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fileImageViewTrailingConstraint;

@end

@implementation JSQMessagesCollectionViewCellOutgoing

#pragma mark - Overrides

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.messageBubbleTopLabel.textAlignment = NSTextAlignmentRight;
    self.cellBottomLabel.textAlignment = NSTextAlignmentRight;
    self.fileImageViewWidthConstraint.constant = 0;
    self.fileImageViewLeadingConstraint.constant = 0;
    self.fileImageViewTrailingConstraint.constant = 0;
    UIImage *image = [UIImage systemImageNamed:@"doc"];
    self.fileImageView.image = image;
    self.fileImageView.tintColor = [UIColor blackColor];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.fileImageViewWidthConstraint.constant = 0;
    self.fileImageViewLeadingConstraint.constant = 0;
    self.fileImageViewTrailingConstraint.constant = 0;
}

@end
