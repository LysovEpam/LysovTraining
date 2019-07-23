﻿using System;
using System.Collections.Generic;
using BLContracts.Models;
using CommonEntities;
using CommonEntities.Additional;

namespace BLContracts.ActionResults
{
	public class OrderData
	{
		public int IdEntity { get; set; }
		public DateTime DateOrder { get; set; }
		public string Address { get; set; }
		public IEnumerable<Product> Products { get; set; }
		public OrderStatus OrderStatus { get; set; }
		public SystemUserData UserSystemData { get; set; }


	}
}
