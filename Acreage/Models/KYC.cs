using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Acreage.Models
{
    public class KYC
    {
        public int kyc_id;
        public string userid;
        public int user_type;
        public string salutation;
        public string full_name;
        public string marital_status;
        public string email_address;
        public DateTime date_of_birth;
        public string phone_no;
        public string mailing_address;
        public string residential_address;
        public bool address_similarity_flag;
        public string city;
        public string province;
        public string postal_code;
        public DateTime kyc_timestamp;
    }
}