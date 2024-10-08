using ArabaSitesi.Data.Abstract;
using ArabaSitesi.Entities;
using System.Linq.Expressions;

namespace ArabaSitesi.Service.Abstract
{
    public interface IUserRepository : IRepository<Kullanici>
    {
        Task<List<Kullanici>> GetCustomList();
        Task<List<Kullanici>> GetCustomList(Expression<Func<Kullanici, bool>> expression);
    }
}
