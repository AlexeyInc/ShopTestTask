using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Infrastructure.Database.Services.Role
{
    public interface IRoleDataService
    {
        Task<bool> AddRoleForUser(int userId, int roleId);
        Task<bool> RemoveRoleForUser(int userId, int roleId);
        Task<bool> CheckRoleForUser(int roleId, int userId);
    }
}
