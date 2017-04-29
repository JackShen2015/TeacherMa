## 数据库设计
1. 数据库表
    1. User表
        * userID string 20 PK
        * userName string 50
        * userPhone string 11
        * userPassword string 50
        * userMail string 50
        * userAddr string 100
        * userSex bool
        * userBirthDay Date
    2. Menu表
        * DishID string 20 PK
        * DishName string 20
        * DishNum int
        * DishComment string 50
        * DishPrice double
        * DishPicture Bob
        * TypeId -->DishType.TypeId FK
    3. DishType表
        * TypeID string 20 PK
        * TypeName string 50
    4. Order表
        * OrderID stirng 20 PK
        * userID -->User.userID FK
        * OrderTime Date
        * DeskID int
        * OrderState int
            * 0 已加入购物车
            * 1 已提交订单
            * 2 已完成订单
            * 3 已评价
        * OrderComment string 50  
    5. OrderInfo表
        * OrderInfoID string PK
        * OrderID -->Order.OrderID FK
        * DishID --> Menu.DishID FK
        * OrderDishTime Date
        * OrderDishNum int
        * OrderDishState int
            * 0 已提交
            * 1 已确认
            * 2 已取消
            * 3 已完成
    6. Manager表
        * ManagerID string 20 PK
        * ManagerName string 50
        * ManagerPassword string 50
    7.  Comment表
        * CommentID string PK
        * userID -->User.UserID FK
        * OrderInfoID -->OrderInfo.OrderInfoID FK
        * CommentContent string 200
2. Model类
  1. User
      * $userID
      * $userName
      * $userPhone
      * $userPassword
      * $UserMail
      * $userAddr
      * $userSex
      * $userBirthDay
  2. Menu
      * $DishID
      * $DishName
      * $DishNum
      * $DishComment
      * $DishPrice  
      * $DishPicture
      * $TypeId
  3. Manager
      * $ManagerID
      * $ManagerName
      * $ManagerPassword
  4. OrderMenu
      * $DishID
      * $DisnOrderNum
  5. OrderInfo
      * OrderInfoID
      * OrderID
      * DishID
      * OrderDishTime
      * OrderDishNum
      * OrderDishState
3. API规范
  1. 用户操作
      1. 注册  
      ```PHP
      bool UserRegister($user)
      ```
      * 登录
      ```php
      bool UserLogin($userName,$userPassword)
      ```
      * 更新用户信息
      ```php
      bool UserUpdateInfo($user)
      ```
      * 获取所有菜单
      ```php
      list<Menu> GetAllMenus()
      ```
      * 加入购物车
      ```php
      int userOrder(userID,list<OrderMenu>,DeskID)
      ```
      * 确认购物车
      ```php
      bool updateCart(UserID,OrderID)
      ```
      * 查询用户某单下所有菜品
      list<OrderInfo> userGetAllOrderMenu(userID,OrderID)
      * 增加菜品
      ```php
      bool userAddMenu(userID,OrderID,List<OrderMenu>)
      ```
      * 删除菜品
      ```php
      bool userDelMenu(userID,OrderInfoID)
      ```
      * 更新菜品数目
      ```php
      bool userUpdateMenu(userID,OrderInfoID,num)
      ```
      * 付款后完成订单
      ```php
      bool userFinishOrder(userID,OrderID)
      ```
      * 用户评价某次订单
      ```php
      bool userCommentOrder(userID,OrderID,userCmmonetString)
      ```
      * 用户评价某样菜品
      ```php
      bool userCommentOrderInfo(userID,OrderInfoId,userCommentString)
      ```
  2. 管理员操作
      1. 登录
      ```php
      bool managerLogin(managerID,ManagerPassword)
      ```
      * 修改密码
      ```php
      bool managerChangePassword(managerID,ManagerPassword)
      ```
      * 增加菜品
      ```php
      bool managerAddMenu(Menu)
      ```
      * 更新菜品
      ```php
      bool managerUpdateMenu(Menu)
      ```
      * 取消用户提交的订单
      bool managerCancelUserOrder(userID,OrderInfoID)
4. 数据库操作
   1. insertUser(user)
   *  queryUser(userID)
   *  updateUser(user)
   *  queryAllMenus()
   *  insertOrder(userID,array\<menu\>)
   *  updateOrderState(orderID,state)
   *  updateOrderinfo(orderID,array\<menu\>)
   *  updateOrderinfoState(userID,state)
   *  queryOrder(UserID)
   *  queryManager(ManagerID)
   *  updateManager(Manager)
   *  insertuserCommentOrder(userID,OrderID,userCmmonetString)
   *  insertuserCommentOrderInfo(userID,OrderInfoId,userCommentString)
5.
