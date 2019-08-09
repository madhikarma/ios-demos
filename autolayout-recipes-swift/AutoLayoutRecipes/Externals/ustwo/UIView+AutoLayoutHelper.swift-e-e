//
//  UIView+AutoLayoutHelper.swift
//
//  Created by Shagun Madhikarmi on 09/10/2014.
//  The MIT License (MIT)
//
//  Copyright (c) 2015 ustwo™
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
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


import Foundation
import UIKit

/**
*  UIView extension to ease creating Auto Layout Constraints
*/
extension UIView {
    

    // MARK: - Fill
    
    /**
    Creates and adds an array of NSLayoutConstraint objects that relates this view's top, left, bottom and right to its superview, given an optional set of insets for each side. Default parameter values relate this view's top, left, bottom and right to its superview with no insets.

    @note The constraints are also added to this view's superview for you

    :param: edges An amount insets to apply to the top, left, bottom and right constraint. Default value is UIEdgeInsetsZero
    
    :returns: An array of 4 x NSLayoutConstraint objects (top, left, bottom , right) if the superview exists otherwise an empty array
    */
    func fillSuperView(edges: UIEdgeInsets = UIEdgeInsetsZero) -> [NSLayoutConstraint] {
        
        var constraints: [NSLayoutConstraint] = []
        
        if let superview = self.superview {

            let topConstraint: NSLayoutConstraint = self.addTopConstraint(toView: superview, relation: .Equal, constant: edges.top)
            let leftConstraint: NSLayoutConstraint = self.addLeftConstraint(toView: superview, relation: .Equal, constant: edges.left)
            let bottomConstraint: NSLayoutConstraint = self.addBottomConstraint(toView: superview, relation: .Equal, constant: -edges.bottom)
            let rightConstraint: NSLayoutConstraint = self.addRightConstraint(toView: superview, relation: .Equal, constant: -edges.right)
            
            constraints = [topConstraint, leftConstraint, bottomConstraint, rightConstraint]
        }
        
        return constraints
    }
    

    // MARK: - Left

    /**
    Creates and adds an NSLayoutConstraint that relates this view's left to some specified edge of another view, given a relation and offset. Default parameter values relate this view's left to be equal to the left of the other view.

    @note The new constraint is added to this view's superview for you
    
    :param: view      The other view to relate this view's layout to

    :param: attribute The other view's layout attribute to relate this view's left side to e.g. the other view's right. Default value is NSLayoutAttribute.Left

    :param: relation  The relation of the constraint. Default value is NSLayoutRelation.Equal

    :param: constant  An amount by which to offset this view's left from the other view's specified edge. Default value is 0
    
    :returns: The created NSLayoutConstraint for this left attribute relation
    */
    func addLeftConstraint(toView view: UIView?, attribute: NSLayoutAttribute = .Left, relation: NSLayoutRelation = .Equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Left, toView: view, attribute: attribute, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: - Right

    /**
    Creates and adds an NSLayoutConstraint that relates this view's right to some specified edge of another view, given a relation and offset. Default parameter values relate this view's right to be equal to the right of the other view.
    
    @note The new constraint is added to this view's superview for you
    
    :param: view      The other view to relate this view's layout to

    :param: attribute The other view's layout attribute to relate this view's right to e.g. the other view's left. Default value is NSLayoutAttribute.Right

    :param: relation  The relation of the constraint. Default value is NSLayoutRelation.Equal

    :param: constant  An amount by which to offset this view's right from the other view's specified edge. Default value is 0.0
    
    :returns: The created NSLayoutConstraint for this right attribute relation
    */
    func addRightConstraint(toView view: UIView?, attribute: NSLayoutAttribute = .Right, relation: NSLayoutRelation = .Equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Right, toView: view, attribute: attribute, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: - Top
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's top to some specified edge of another view, given a relation and offset. Default parameter values relate this view's right to be equal to the right of the other view.

    @note The new constraint is added to this view's superview for you
    
    :param: view      The other view to relate this view's layout to

    :param: attribute The other view's layout attribute to relate this view's top to e.g. the other view's bottom. Default value is NSLayoutAttribute.Bottom

    :param: relation  The relation of the constraint. Default value is NSLayoutRelation.Equal

    :param: constant  An amount by which to offset this view's top from the other view's specified edge. Default value is 0.0
    
    :returns: The created NSLayoutConstraint for this top edge layout relation
    */
    func addTopConstraint(toView view: UIView?, attribute: NSLayoutAttribute = .Top, relation: NSLayoutRelation = .Equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Top, toView: view, attribute: attribute, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }

    
    // MARK: - Bottom

    /**
    Creates and adds an NSLayoutConstraint that relates this view's bottom to some specified edge of another view, given a relation and offset. Default parameter values relate this view's right to be equal to the right of the other view.

    @note The new constraint is added to this view's superview for you
    
    :param: view      The other view to relate this view's layout to
    
    :param: attribute The other view's layout attribute to relate this view's bottom to e.g. the other view's top. Default value is NSLayoutAttribute.Botom

    :param: relation  The relation of the constraint. Default value is NSLayoutRelation.Equal

    :param: constant  An amount by which to offset this view's bottom from the other view's specified edge. Default value is 0.0
    
    :returns: The created NSLayoutConstraint for this bottom edge layout relation
    */
    func addBottomConstraint(toView view: UIView?, attribute: NSLayoutAttribute = .Bottom, relation: NSLayoutRelation = .Equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Bottom, toView: view, attribute: attribute, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: - Center X

    /**
    Creates and adds an NSLayoutConstraint that relates this view's center X attribute to the center X attribute of another view, given a relation and offset. Default parameter values relate this view's center X to be equal to the center X of the other view.

    :param: view     The other view to relate this view's layout to

    :param: relation The relation of the constraint. Default value is NSLayoutRelation.Equal

    :param: constant An amount by which to offset this view's center X attribute from the other view's center X attribute. Default value is 0.0
    
    :returns: The created NSLayoutConstraint for this center X layout relation
    */
    func addCenterXConstraint(toView view: UIView?, relation: NSLayoutRelation = .Equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .CenterX, toView: view, attribute: .CenterX, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: - Center Y

    /**
    Creates and adds an NSLayoutConstraint that relates this view's center Y attribute to the center Y attribute of another view, given a relation and offset. Default parameter values relate this view's center Y to be equal to the center Y of the other view.
    
    :param: view     The other view to relate this view's layout to

    :param: relation The relation of the constraint. Default value is NSLayoutRelation.Equal

    :param: constant An amount by which to offset this view's center Y attribute from the other view's center Y attribute. Default value is 0.0
    
    :returns: The created NSLayoutConstraint for this center Y layout relation
    */
    func addCenterYConstraint(toView view: UIView?, relation: NSLayoutRelation = .Equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .CenterY, toView: view, attribute: .CenterY, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: - Width

    /**
    Creates and adds an NSLayoutConstraint that relates this view's width to the width of another view, given a relation and offset. Default parameter values relate this view's width to be equal to the width of the other view.
    
    :param: view     The other view to relate this view's layout to

    :param: relation The relation of the constraint. Default value is NSLayoutRelation.Equal

    :param: constant An amount by which to offset this view's width from the other view's width amount. Default value is 0.0
    
    :returns: The created NSLayoutConstraint for this width layout relation
    */
    func addWidthConstraint(toView view: UIView?, relation: NSLayoutRelation = .Equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Width, toView: view, attribute: .Width, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: - Height

    /**
    Creates and adds an NSLayoutConstraint that relates this view's height to the height of another view, given a relation and offset. Default parameter values relate this view's height to be equal to the height of the other view.
    
    :param: view     The other view to relate this view's layout to

    :param: relation The relation of the constraint. Default value is NSLayoutRelation.Equal

    :param: constant An amount by which to offset this view's height from the other view's height amount. Default value is 0.0
    
    :returns: The created NSLayoutConstraint for this height layout relation
    */
    func addHeightConstraint(toView view: UIView?, relation: NSLayoutRelation = .Equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Height, toView: view, attribute: .Height, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    

    // MARK: - Private
    
    /// Creates an NSLayoutConstraint using its factory method given both views, attributes a relation and offset
    private func createConstraint(attribute attr1: NSLayoutAttribute, toView: UIView?, attribute attr2: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: attr1,
            relatedBy: relation,
            toItem: toView,
            attribute: attr2,
            multiplier: 1.0,
            constant: constant)
        
        return constraint
    }
}
