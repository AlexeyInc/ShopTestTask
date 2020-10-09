using Dapper;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Infrastructure.Database.Services.Role
{
    public class RoleDataService : IRoleDataService
    {
        string connectionString = null;
        public RoleDataService(string conn)
        {
            connectionString = conn;
        }

        public async Task<bool> AddRoleForUser(int userId, int roleId)
        {
            using (IDbConnection db = new SqlConnection(connectionString))
            {
                //var result = await db.QueryAsync<ProductDbo>(sql: "exec ChangeRoleForUser @TypeSubquery",
                //                                            param: new { TypeSubquery = queryTypeId });

                var result = await db.ExecuteAsync("INSERT INTO UserRole (UserId, RoleId) VALUES(@UserId, @RoleId)", new { userId, roleId });
                return result > 0;
            }
        }

        public async Task<bool> RemoveRoleForUser(int userId, int roleId)
        {
            using (IDbConnection db = new SqlConnection(connectionString))
            {
                var result = await db.ExecuteAsync("DELETE FROM UserRole WHERE UserId = @userId AND RoleId = @roleId", new { userId, roleId });
                return result > 0;
            }
        }

        public async Task<bool> CheckRoleForUser(int roleId, int userId)
        {
            using (IDbConnection db = new SqlConnection(connectionString))
            {
                var result = await db.QueryAsync("SELECT * FROM UserRole WHERE UserId = @userId AND RoleId = @roleId", new { userId, roleId });
                return result.FirstOrDefault() != null;
            }
        }
    }
}
