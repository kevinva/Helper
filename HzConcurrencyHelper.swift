//
//  HzConcurrencyHelper.swift
//  TaoLueFM
//
//  Created by ZanderHo on 16/3/3.
//  Copyright © 2016年 ZanderHo. All rights reserved.
//

import Foundation

/**
 在主线程上延迟运行一项任务
 
 - parameter delay:   延迟的秒数
 - parameter closure: 要执行的任务
 */
func delayOnMainQueue(delay: Double, closure: () -> ()) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}

/**
 在后台线程延迟执行一项任务
 
 - parameter delay:   延迟的秒数
 - parameter closure: 要执行的任务
 */
func delayOnBackgourndQueue(delay: Double, closure: () -> ()) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), closure)
}
