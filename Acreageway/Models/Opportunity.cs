using System;

namespace Acreageway.Models
{
    public class Opportunity
    {
        public string opportunity_id;
        public string opportunity_name;
        public string short_desc;
        public string long_desc;
        public string created_by;
        public DateTime created_timestamp;
        public DateTime expiry_timestamp;
        public string opportunity_status;
        public double total_amt;
        public double amt_left;
        public bool is_active;
        public double minimum_investment_per_investor;
        public double total_investors;
        public string offering_type;
        public string type_of_security;
        public double price_per_security;
        public string category;
        public string opportunity_imgName;
        public string opportunity_contentType;
        public byte[] image_data;
    }
}