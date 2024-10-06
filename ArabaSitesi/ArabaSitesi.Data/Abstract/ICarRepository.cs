﻿using ArabaSitesi.Entities;
using System.Linq.Expressions;

namespace ArabaSitesi.Data.Abstract
{
    public interface ICarRepository : IRepository<Arac>
    {
        Task<List<Arac>> GetCustomCarList();
        Task<List<Arac>> GetCustomCarList(Expression<Func<Arac, bool>> expression);
        Task<Arac> GetCustomCar(int id);
    }
}
