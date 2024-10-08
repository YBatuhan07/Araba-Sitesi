using ArabaSitesi.Data;
using ArabaSitesi.Data.Concrete;
using ArabaSitesi.Service.Abstract;

namespace ArabaSitesi.Service.Concrete
{
    public class UserService : UserRepository, IUserService
    {
        public UserService(DatabaseContext context) : base(context)
        {
            
        }
    }
}
