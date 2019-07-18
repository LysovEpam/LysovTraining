﻿using System;

namespace CommonEntities.Additional
{
	public class AuthorizationStatus
	{

		public const string StatusActive = "Active";
		public const string StatusBlockTimeOut = "Block time out";
		public const string StatusBlockNewAuthorization = "Block new authorization";
		public const string StatusBlockSystem = "Block system";

		public enum AuthorizationStatusEnum
		{
			Active = 0,
			BlockTimeOut = 1,
			BlockNewAuthorization = 2,
			BlockSystem =3
		}

		public AuthorizationStatusEnum Status { get; }

		public AuthorizationStatus(string status)
		{
			Status = GetStatus(status);
		}
		public AuthorizationStatus(AuthorizationStatusEnum status)
		{
			Status = status;
		}


		public string GetStatusName()
		{
			return GetStatusName(Status);
		}
		


		
		public static string GetStatusName(AuthorizationStatusEnum status)
		{
			switch (status)
			{
				case AuthorizationStatusEnum.Active: return StatusActive;
				case AuthorizationStatusEnum.BlockTimeOut: return StatusBlockTimeOut;
				case AuthorizationStatusEnum.BlockNewAuthorization: return StatusBlockNewAuthorization;
				case AuthorizationStatusEnum.BlockSystem: return StatusBlockSystem;
				default: throw new ArgumentOutOfRangeException(nameof(status), status, null);
			}
		}
		public static AuthorizationStatusEnum GetStatus(string status)
		{
			switch (status)
			{
				case StatusActive: return AuthorizationStatusEnum.Active;
				case StatusBlockTimeOut: return AuthorizationStatusEnum.BlockTimeOut;
				case StatusBlockNewAuthorization: return AuthorizationStatusEnum.BlockNewAuthorization;
				case StatusBlockSystem: return AuthorizationStatusEnum.BlockSystem;
				default: throw new ArgumentOutOfRangeException(nameof(status), status, null);
			}
		}
		

		

	}
}
