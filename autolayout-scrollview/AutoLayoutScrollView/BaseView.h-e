//
//  BaseView.h
//  BaseView
//
//  Created by Shagun Madhikarmi on 15/06/2015.
//  Copyright (c) 2015 ustwo. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//  of the Software, and to permit persons to whom the Software is furnished to do
//  so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

@import UIKit;

/**
 *  BaseView acts as a common base for all custom views
 */
@interface BaseView : UIView

/**
 *  Setup for the view and all its subviews.
 *
 *  Note. Subclasses should override this method to setup their subviews
 */
- (void)setup NS_REQUIRES_SUPER;

/**
 *  Setup method for the view's constraints.
 *
 *  Note. Subclasses should override this method to add layout constraints for their subviews here
 */
- (void)setupConstraints NS_REQUIRES_SUPER;

/**
 *  Setup for the view's accessibility
 *
 *  Note. Subclasses should override this method to add accessibility to their subviews
 */
- (void)setupAccessibility NS_REQUIRES_SUPER;

@end
