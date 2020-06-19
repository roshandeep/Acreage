﻿using System;

namespace Acreageway.Models
{
    public class KYC
    {
        public int kyc_id;
        public string userid;
        public string user_type;
        public string salutation;
        public string full_name;
        public string marital_status;
        public string email_address;
        public DateTime date_of_birth;
        public string phone_no;
        public bool address_similarity_flag;
        public string mailing_address;
        public string mailing_city;
        public string mailing_province;
        public string mailing_postal_code;
        public string mailing_country;
        public string residential_address;
        public string residential_city;
        public string residential_province;
        public string residential_postal_code;
        public string residential_country;
        public DateTime kyc_timestamp;
    }
}