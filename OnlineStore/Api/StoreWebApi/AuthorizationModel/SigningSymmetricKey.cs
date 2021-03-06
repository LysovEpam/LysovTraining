﻿using System.Text;
using Microsoft.IdentityModel.Tokens;

namespace StoreWebApi.AuthorizationModel
{
	public class SigningSymmetricKey : IJwtSigningEncodingKey, IJwtSigningDecodingKey
	{
		private readonly SymmetricSecurityKey _secretKey;

		public string SigningAlgorithm { get; } = SecurityAlgorithms.HmacSha256;

		public SecurityKey GetKey() => _secretKey;

		public SigningSymmetricKey(string key)
		{
			_secretKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key));
		}

		
	}
}
