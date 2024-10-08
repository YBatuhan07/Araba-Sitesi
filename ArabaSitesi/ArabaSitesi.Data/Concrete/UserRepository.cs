using ArabaSitesi.Data.Concreate;
using ArabaSitesi.Entities;
using ArabaSitesi.Service.Abstract;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace ArabaSitesi.Data.Concrete
{
    public class UserRepository : Repository<Kullanici>, IUserRepository
    {
        public UserRepository(DatabaseContext context) : base(context)
        {

        }

        public async Task<List<Kullanici>> GetCustomList()
        {
            return await _dbSet.AsNoTracking().Include(x => x.Rol).ToListAsync();
        }

        public async Task<List<Kullanici>> GetCustomList(Expression<Func<Kullanici, bool>> expression)
        {
            return await _dbSet.Where(expression).AsNoTracking().Include(x => x.Rol).ToListAsync();
        }
    }
}
