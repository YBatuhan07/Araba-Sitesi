using ArabaSitesi.Data;
using ArabaSitesi.Data.Concreate;
using ArabaSitesi.Entities;
using ArabaSitesi.Service.Abstract;

namespace ArabaSitesi.Service.Concrete
{
    public class Service<T> : Repository<T>, IService<T> where T : class, IEntity, new()
    {
        public Service(DatabaseContext context) : base(context)
        {
        }

        public Task<string?> FindAsync()
        {
            throw new NotImplementedException();
        }

        Task IService<T>.DeleteAsync(int id)
        {
            throw new NotImplementedException();
        }

        Task IService<T>.UpdateAsync(Rol rol)
        {
            throw new NotImplementedException();
        }
    }
}
