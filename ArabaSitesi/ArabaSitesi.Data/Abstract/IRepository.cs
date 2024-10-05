using System.Linq.Expressions;

namespace ArabaSitesi.Data.Abstract
{
    // Generic bir repository arayüzü tanımlayan bir interface.
    public interface Repository<T> where T : class
    {
        // Tüm verileri liste olarak döndüren metot.
        List<T> GetAll();

        // Şarta bağlı olarak tüm verileri döndüren metot (örneğin bir filtreleme yapılabilir).
        List<T> GetAll(Expression<Func<T, bool>> expression);

        // Şarta bağlı olarak bir veriyi döndüren metot.
        T Get(Expression<Func<T, bool>> expression);

        // ID'sine göre bir veriyi bulup döndüren metot.
        T Find(int id);

        // Yeni bir veri eklemek için kullanılan metot.
        void Add(T entity);

        // Var olan bir veriyi güncellemek için kullanılan metot.
        void Update(T entity);

        // Var olan bir veriyi silmek için kullanılan metot.
        void Delete(T entity);

        // Yapılan değişiklikleri veritabanına kaydetmek için kullanılan metot.
        int Save();

        // Asenkron işlemler (Aşağıdaki metotlar veritabanı işlemlerini asenkron olarak yapar).

        // ID'sine göre asenkron olarak veri bulmak için kullanılan metot.
        Task<T> FindAsync(int id);

        // Şarta bağlı olarak asenkron bir veri getiren metot.
        Task<T> GetAsync(Expression<Func<T, bool>> expression);

        // Asenkron olarak tüm verileri döndüren metot.
        Task<List<T>> GetAllAsync();

        // Şarta bağlı olarak asenkron tüm verileri döndüren metot.
        Task<List<T>> GetAllAsync(Expression<Func<T, bool>> expression);

        // Yeni bir veriyi asenkron olarak eklemek için kullanılan metot.
        Task AddAsync(T entity);

        // Yapılan değişiklikleri asenkron olarak veritabanına kaydetmek için kullanılan metot.
        Task<int> SaveAsync();
    }
}
