using ArabaSitesi.Data.Abstract;
using ArabaSitesi.Entities;

namespace ArabaSitesi.Service.Abstract
{
    public interface IService<T> : Repository<T> where T : class, IEntity, new()
    {
        Task DeleteAsync(int id);
        Task<string?> FindAsync();
        Task UpdateAsync(Rol rol);
    }
}
