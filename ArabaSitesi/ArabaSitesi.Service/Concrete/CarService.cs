using ArabaSitesi.Data;
using ArabaSitesi.Data.Concrete;
using ArabaSitesi.Service.Abstract;

namespace ArabaSitesi.Service.Concrete
{
    public class CarService : CarRepository, ICarService
    {
        public CarService(DatabaseContext context) : base(context)
        {

        }
    }
}
