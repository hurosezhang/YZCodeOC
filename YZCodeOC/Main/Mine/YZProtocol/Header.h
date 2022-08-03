//
//  Header.h
//  YZCodeOC
//
//  Created by zhangyongkang01 on 2021/10/14.
//

#ifndef Header_h
#define Header_h


#endif /* Header_h */


/*
 协议是一种接口声明，代理是一种设计模式
 protocol（协议）类似于Android的接口，声明我们需要的方法，以后就按这里的规定来办事。
 delegate（委托）就是把事情交给其他人去做。
 */


/*
 

 1, 官方文档（https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/Protocol.html#//apple_ref/doc/uid/TP40008195-CH45-SW2）
 协议是什么：协议声明了一个任何类都可以选择实现的编程接口。
 协议可以干什么：可以让两个没有关系的类相互通信以完成目标。它提供了子类化的替代方案。
 
 apple 文档：协议最大的特点是，可以让两个没有关系的类相互通信以完成目标。
 zyk:协议的本质是委托者制定协议，代理实现其方法并返回结果（结果可为空）
 
 1.1 协议分正式协议和非正式协议
 对于protocol的分类，一般我们讨论protocol就是谈论正式协议。
 非正式协议简单理解为类别，凡是NSObject或其子类的类别，都是非正式协议。

 
 2, 协议的注意事项
 2.1 protocol不能定义成员变量，但是能够声明属性，因为属性=成员变量+setting方法+getting方法；
 2.2 Protocol与继承的区别
 继承连同方法的实现也继承了，而protocol只有声明没有实现；
 相同类型的类可以使用继承，但不同类型的类只能使用protocol
 
 2.3 Protocol与Category的区别
 Category可以给一个类扩充方法，既有申明也有实现；而Protocol只有声明，没有实现。
 同：Category和Protocol都可以声明方法，不能声明属性。

 
 3,几个重要的系统定义的协议NSObject协议、NSCopying协议、NSMutableCopying协议
 3.1 <NSObject>
 NSObject定义了两个readonly关键字的属性hash和superclass
 3.2 NSCopying是一个与对象拷贝有关的协议。如果想让一个类的对象支持拷贝，就需要让该类实现NSCopying协议。
 
 3.3 NSSecureCoding
 

 4, 代理的实际使用场景
 4.1 没有继承关系的类实现同样的方法。
 4.2 通过委托传递消息机制实现分层解耦。

 */
