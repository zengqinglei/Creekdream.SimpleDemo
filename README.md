# 基于 Creekdream.AspNetCore 框架的EntityFrameworkCore示例项目

项目主要基于 Creekdream.AspNetCore 框架开发一个简单的多层架构的示例项目，实现了基本的增删改查服务。

## 启动步骤

**环境要求**
* VS2017
* SQLServer 2008+
* .NET CORE 2.1+
### 1. 配置 SQLServer 数据连接

appsetting.json配置如下：

``` csharp
{
  "ConnectionStrings": {
    "Default": "server=192.168.0.105;database=SimpleDemo;uid=sa;pwd=Sa123456"
  }
}
```

### 2. 使用 EFCore 数据迁移功能完成数据库初始化
``` csharp
// 项目中由于已添加初始数据库文件，执行如下命令即可
Update-Database

// 如需重新生成数据迁移文件，删除项目Creekdream.SimpleDemo.EntityFrameworkCore\中出SeedData.cs以外的文件
Add-Migration InitializeDatabase
Update-Database
```

### 3. 启动项目点击进入在线文档即可自测等操作。