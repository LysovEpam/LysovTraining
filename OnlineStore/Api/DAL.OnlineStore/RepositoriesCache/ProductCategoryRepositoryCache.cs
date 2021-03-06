﻿using System;
using System.Collections.Generic;
using System.Linq;
using CommonEntities;
using DAL.OnlineStore.Repositories;
using DALContracts.Repositories;

namespace DAL.OnlineStore.RepositoriesCache
{
	public class ProductCategoryRepositoryCache : IRepository<ProductCategory>
	{
		private readonly ProductCategoryRepository _productCategoryRepository;

		private static List<ProductCategory> _cacheList;


		public ProductCategoryRepositoryCache(ProductCategoryRepository productCategoryRepository)
		{
			_productCategoryRepository = productCategoryRepository;
			_cacheList = new List<ProductCategory>();
			_cacheList = _productCategoryRepository.SelectAll();
		}

		

		public ProductCategory SelectById(int id)
		{
			// ReSharper disable once PossibleInvalidOperationException
			var category = _cacheList.Where(c => c.IdEntity.Value == id);

			// ReSharper disable once ConditionIsAlwaysTrueOrFalse
			// ReSharper disable once PossibleMultipleEnumeration
			if (category != null && category.Count() == 1)
				// ReSharper disable once PossibleMultipleEnumeration
				return category.FirstOrDefault();

			var categoryDb = _productCategoryRepository.SelectById(id);

			_cacheList.Add(categoryDb);

			return categoryDb;
		}
		public List<ProductCategory> SelectAll()
		{

			return _cacheList;

			//return _productCategoryRepository.SelectAll();
		}
		public List<ProductCategory> Find(Func<ProductCategory, bool> predicate)
		{
			var categories = _cacheList.Where(predicate);

			return categories.ToList();
			
			//return _productCategoryRepository.Find(predicate);
		}


		public int? Insert(ProductCategory item)
		{
			var insertResult = _productCategoryRepository.Insert(item);

			if (insertResult.HasValue)
			{
				var newCategory = SelectById(insertResult.Value);
				_cacheList.Add(newCategory);
			}

			return insertResult;
		}

		public bool Update(ProductCategory item)
		{
			var updateResult = _productCategoryRepository.Update(item);

			if (updateResult)
			{
				// ReSharper disable once PossibleInvalidOperationException
				_cacheList[_cacheList.FindIndex(c => c.IdEntity.Value == item.IdEntity.Value)] = item;
			}



			return updateResult;
		}
		public bool Delete(int id)
		{
			var deleteResult = _productCategoryRepository.Delete(id);

			if (deleteResult)
			{
				// ReSharper disable once PossibleInvalidOperationException
				var item = _cacheList.SingleOrDefault(c => c.IdEntity.Value == id);
				if (item != null)
					_cacheList.Remove(item);
			}


			return deleteResult;
		}

		public int GetCountDependencies(int id)
		{
			return _productCategoryRepository.GetCountDependencies(id);
		}
	}
}
