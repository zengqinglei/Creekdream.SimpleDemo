using DapperExtensions.Mapper;
using Creekdream.SimpleDemo.UserManage;

namespace Creekdream.SimpleDemo.Mappers
{
    /// <summary>
    /// UserInfo entity and table mapping
    /// </summary>
    public class UserInfoMapper : ClassMapper<UserInfo>
    {
        public UserInfoMapper()
        {
            Table("UserInfos");
            Map(x => x.Id).Key(KeyType.Guid);
            Map(x => x.User).Ignore();
            AutoMap();
        }
    }
}

