using ArabaSitesi.Data.Abstract;
using ArabaSitesi.Data.Concreate;
using ArabaSitesi.Entities;

namespace ArabaSitesi.Service.Abstract
{
    public interface IService<T> : IRepository<T> where T : class, IEntity, new()
    {
        Task DeleteAsync(int id);
        Task<string?> FindAsync();
        Task UpdateAsync(Rol rol);
    }
}
