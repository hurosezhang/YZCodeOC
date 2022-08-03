//
//  YZDelegate.h
//  YZCodeOC
//
//  Created by zhangyongkang01 on 2021/10/13.
//

#ifndef YZDelegate_h
#define YZDelegate_h


#endif /* YZDelegate_h */

/*
 协议是一种接口声明，代理是一种设计模式
 protocol（协议）类似于java的接口，声明我们需要的方法，以后就按这里的规定来办事。
 delegate（委托）就是把事情交给其他人去做。
 */

/*
 4, 代理的实际使用场景
 4.1 没有继承关系的类实现同样的方法。
 4.2 通过委托传递消息机制实现分层解耦。
 4.3 逆向传值。
 */

/// 1,代理的官方链接 https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/Delegation.html
///   其主要价值在于，能实现一个对象中实现多个对象的功能，类似“多继承”。


/// 2. 基本的概念解释
/*
 1,协议，用来指定代理双方可以做什么，必须做什么；
 2,代理方，根据指定的协议，完成委托方需要实现的功能；
 3,委托方，根据指定的协议，指定代理去完成什么功能；
 委托方持有代理对象的引用，并对齐发送消息，
 代理方接受消息并处理返回结果。
 */
/// 3，常见的使用场景
/*
 1，控制器是视图的代理，视图是控制器的委托方，代理实现协议。
 1.2，控制器是tableView的代理，tableView 是控制器的委托方，tablview将事件和参数传给控制器，控制器将结果传给视图
 2,
 */
