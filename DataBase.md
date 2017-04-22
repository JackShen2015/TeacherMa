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
3. API规范
  1. 用户操作
      * 注册  
      ```PHP
      bool UserRegister($user)
      ```
      * 登录
      ```php
      bool UserLogin($userName,$userPassword)
      ```
      *
