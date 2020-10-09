using System.Threading.Tasks;

namespace Shop.Infrastructure.Database.Services.Auth
{
    public interface IAuthDataService 
    {
        Task<string> Authenticate(string username, string password);
        Task<bool> Register(string username, string password);
        Task<bool> UserExists(string username);
    }
}
