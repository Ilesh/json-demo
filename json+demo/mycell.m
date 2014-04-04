//
//  mycell.m
//  json+demo
//
//  Created by Omnipresent on 4/2/14.
//  Copyright (c) 2014 Omnipresent. All rights reserved.
//

#import "mycell.h"

@implementation mycell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
