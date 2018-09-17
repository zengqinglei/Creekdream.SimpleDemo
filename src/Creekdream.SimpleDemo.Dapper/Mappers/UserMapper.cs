using DapperExtensions.Mapper;
using Creekdream.SimpleDemo.UserManage;

namespace Creekdream.SimpleDemo.Mappers
{
    /// <summary>
    /// User entity and table mapping
    /// </summary>
    public class UserMapper : ClassMapper<User>
    {
        public UserMapper()
        {
            Table("Users");
            Map(x => x.Id).Key(KeyType.Guid);
            Map(x => x.Books).Ignore();
            Map(x => x.UserInfo).Ignore();
            AutoMap();
        }
    }
}

