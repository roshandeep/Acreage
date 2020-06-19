using Acreageway.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Acreageway
{
    public class DAL
    {
        string connetionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        SqlCommand cmd;

        public DataTable LoadOpportunityList()
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT o.opportunity_id, oppotunity_name, short_desc, created_by, created_timestamp, expiry_timestamp, opportunity_status, total_amt, amt_left FROM opportunity o WHERE is_active = '1' AND opportunity_status = 'Approved';";
            cmd = new SqlCommand(sql, cnn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cnn.Close();
            return dt;
        }

        public DataTable LoadOpportunityList(string investor_id)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT o.opportunity_id, oppotunity_name, short_desc, created_by, created_timestamp, expiry_timestamp, opportunity_status, total_amt, amt_left, dbo.IsfavourtedByInvestor(@investor_id, o.opportunity_id) AS Isfavourite FROM opportunity o WHERE is_active = '1' AND opportunity_status = 'Approved';";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@investor_id", investor_id));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cnn.Close();
            return dt;
        }

        public DataTable getUploadedDocs(string investor_id)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT investor_id, uploaded_fileName, file_extension, file_contentType, file_data, filecategory FROM suitability_test_uploadedDoc WHERE investor_id = @investor_id ORDER BY added_timestamp DESC";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@investor_id", investor_id));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cnn.Close();
            return dt;
        }

        public void AddToFavourites(string investor_id, string opportunity_id)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            string sql = "";
            int count = 0;
            cnn.Open();
            sql = "SELECT COUNT(*) FROM favourited_oppurtunity WHERE investor_id = @investor_id AND opportunity_id = @opportunity_id";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@investor_id", investor_id));
            cmd.Parameters.Add(new SqlParameter("@opportunity_id", opportunity_id));
            count = Convert.ToInt32(cmd.ExecuteScalar());
            if (count == 0)
            {
                sql = "INSERT INTO favourited_oppurtunity(investor_id, opportunity_id, favourite_flag, date_favourited) VALUES(@investor_id, @opportunity_id, @favourite_flag, @date_favourited)";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add(new SqlParameter("@investor_id", investor_id));
                cmd.Parameters.Add(new SqlParameter("@opportunity_id", opportunity_id));
                cmd.Parameters.Add(new SqlParameter("@favourite_flag", true));
                cmd.Parameters.Add(new SqlParameter("@date_favourited", DateTime.Now));
                cmd.ExecuteNonQuery();
            }
            cnn.Close();
        }

        public void InvestInOpportunity(string trans_id, string opp_id, string investor_id, double amount)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            //INSERT TRANSACTION
            string sql = @"INSERT INTO opportunity_sale_transactions(transaction_id, investor_id, opportunity_id, invested_amt, transaction_timestamp) 
                            VALUES(@transaction_id, @investor_id, @opportunity_id, @invested_amt, @transaction_timestamp)";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@transaction_id", trans_id));
            cmd.Parameters.Add(new SqlParameter("@opportunity_id", opp_id));
            cmd.Parameters.Add(new SqlParameter("@investor_id", investor_id));
            cmd.Parameters.Add(new SqlParameter("@invested_amt", amount));
            cmd.Parameters.Add(new SqlParameter("@transaction_timestamp", DateTime.Now));
            cmd.ExecuteNonQuery();

            //UPDATE OPPORTUNITIES
            sql = @"UPDATE opportunity SET amt_left = amt_left - @amt_left WHERE opportunity_id = @opportunity_id";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@amt_left", amount));
            cmd.Parameters.Add(new SqlParameter("@opportunity_id", opp_id));
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        public void CreateOpportunity(Opportunity obj)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "INSERT INTO opportunity(opportunity_id, oppotunity_name, opportunity_imgName, opportunity_contentType, image_data, created_by, created_timestamp, expiry_timestamp, opportunity_status, total_amt, amt_left, offering_type, type_of_security, price_per_security, category, short_desc, long_desc, minimum_investment_per_investor, total_investors, is_active) VALUES(@opportunity_id, @oppotunity_name, @opportunity_imgName, @opportunity_contentType, @image_data, @created_by, @created_timestamp, @expiry_timestamp, @opportunity_status, @total_amt, @amt_left, @offering_type, @type_of_security, @price_per_security, @category, @short_desc, @long_desc, @minimum_investment_per_investor, @total_investors, @is_active)";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@opportunity_id", obj.opportunity_id));
            cmd.Parameters.Add(new SqlParameter("@oppotunity_name", obj.opportunity_name));
            cmd.Parameters.Add(new SqlParameter("@opportunity_imgName", obj.opportunity_imgName));
            cmd.Parameters.Add(new SqlParameter("@opportunity_contentType", obj.opportunity_contentType));
            cmd.Parameters.Add(new SqlParameter("@image_data", obj.image_data));
            cmd.Parameters.Add(new SqlParameter("@created_by", obj.created_by));
            cmd.Parameters.Add(new SqlParameter("@created_timestamp", obj.created_timestamp));
            cmd.Parameters.Add(new SqlParameter("@expiry_timestamp", obj.expiry_timestamp));
            cmd.Parameters.Add(new SqlParameter("@opportunity_status", obj.opportunity_status));
            cmd.Parameters.Add(new SqlParameter("@offering_type", obj.offering_type));
            cmd.Parameters.Add(new SqlParameter("@type_of_security", obj.type_of_security));
            cmd.Parameters.Add(new SqlParameter("@price_per_security", obj.price_per_security));
            cmd.Parameters.Add(new SqlParameter("@category", obj.category));
            cmd.Parameters.Add(new SqlParameter("@short_desc", obj.short_desc));
            cmd.Parameters.Add(new SqlParameter("@long_desc", obj.long_desc));
            cmd.Parameters.Add(new SqlParameter("@minimum_investment_per_investor", obj.minimum_investment_per_investor));
            cmd.Parameters.Add(new SqlParameter("@total_investors", obj.total_investors));
            cmd.Parameters.Add(new SqlParameter("@total_amt", obj.total_amt));
            cmd.Parameters.Add(new SqlParameter("@amt_left", obj.amt_left));
            cmd.Parameters.Add(new SqlParameter("@is_active", obj.is_active));
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        public DataTable getFileForDownload(string investor_id, string uploaded_fileName)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT investor_id, uploaded_fileName, file_extension, file_contentType, file_data FROM suitability_test_uploadedDoc WHERE investor_id = @investor_id AND uploaded_fileName = @uploaded_fileName";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@investor_id", investor_id));
            cmd.Parameters.Add(new SqlParameter("@uploaded_fileName", uploaded_fileName));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cnn.Close();
            return dt;
        }

        public void SaveFile(string investor_id, string filename, string fileExtension, string contentType, byte[] bytes, string filecategory)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "INSERT INTO suitability_test_uploadedDoc(investor_id, uploaded_fileName, file_extension, file_contentType, file_data, filecategory, added_timestamp) VALUES(@investor_id, @uploaded_fileName, @file_extension, @file_contentType, @file_data, @filecategory, @added_timestamp)";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@investor_id", investor_id));
            cmd.Parameters.Add(new SqlParameter("@uploaded_fileName", filename));
            cmd.Parameters.Add(new SqlParameter("@file_extension", fileExtension));
            cmd.Parameters.Add(new SqlParameter("@file_contentType", contentType));
            cmd.Parameters.Add(new SqlParameter("@file_data", bytes));
            cmd.Parameters.Add(new SqlParameter("@filecategory", filecategory));
            cmd.Parameters.Add(new SqlParameter("@added_timestamp", DateTime.Now));
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        public int checkAllDocuments(string investor_id)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            int count = 0;
            string sql = "SELECT COUNT(filecategory) FROM suitability_test_uploadedDoc WHERE filecategory IN ('Broker Statement', 'Financial Assets', 'T4', 'NOA', 'BankSavings') AND investor_id = @investor_id;";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@investor_id", investor_id));
            count = Convert.ToInt32(cmd.ExecuteScalar());
            cnn.Close();
            return count;
        }

        public DataTable LoadOpportunityDetails(string opp_id, string name)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT opportunity_id, oppotunity_name, opportunity_imgName, opportunity_contentType, image_data, created_by, created_timestamp, expiry_timestamp, opportunity_status, total_amt, amt_left, offering_type, type_of_security, price_per_security, category, short_desc, long_desc, minimum_investment_per_investor, total_investors FROM opportunity WHERE is_active = '1' AND opportunity_status = 'Approved' AND opportunity_id = @opportunity_id AND oppotunity_name = @oppotunity_name; ";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@opportunity_id", opp_id));
            cmd.Parameters.Add(new SqlParameter("@oppotunity_name", name));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cnn.Close();
            return dt;
        }

        public void SaveKYCAnswers(Models.KYC kyc_obj)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "INSERT INTO user_KYC(userid, user_type, salutation, full_name, marital_status, email_address, date_of_birth, phone_no, address_similarity_flag, mailing_address, city, province, postal_code, country, residential_address, residential_city, residential_province, residential_postal_code, residential_country, kyc_timestamp) VALUES(@userid, @user_type, @salutation, @full_name, @marital_status, @email_address, @date_of_birth, @phone_no, @address_similarity_flag, @mailing_address, @city, @province, @postal_code, @country, @residential_address, @residential_city, @residential_province, @residential_postal_code, @residential_country, @kyc_timestamp)";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userid", kyc_obj.userid));
            cmd.Parameters.Add(new SqlParameter("@user_type", kyc_obj.user_type));
            cmd.Parameters.Add(new SqlParameter("@salutation", kyc_obj.salutation));
            cmd.Parameters.Add(new SqlParameter("@full_name", kyc_obj.full_name));
            cmd.Parameters.Add(new SqlParameter("@marital_status", kyc_obj.marital_status));
            cmd.Parameters.Add(new SqlParameter("@email_address", kyc_obj.email_address));
            cmd.Parameters.Add(new SqlParameter("@date_of_birth", kyc_obj.date_of_birth));
            cmd.Parameters.Add(new SqlParameter("@phone_no", kyc_obj.phone_no));
            cmd.Parameters.Add(new SqlParameter("@address_similarity_flag", kyc_obj.address_similarity_flag));
            cmd.Parameters.Add(new SqlParameter("@mailing_address", kyc_obj.mailing_address));
            cmd.Parameters.Add(new SqlParameter("@city", kyc_obj.mailing_city));
            cmd.Parameters.Add(new SqlParameter("@province", kyc_obj.mailing_province));
            cmd.Parameters.Add(new SqlParameter("@postal_code", kyc_obj.mailing_postal_code));
            cmd.Parameters.Add(new SqlParameter("@country", kyc_obj.mailing_country));
            cmd.Parameters.Add(new SqlParameter("@residential_address", kyc_obj.residential_address));
            cmd.Parameters.Add(new SqlParameter("@residential_city", kyc_obj.residential_city));
            cmd.Parameters.Add(new SqlParameter("@residential_province", kyc_obj.residential_province));
            cmd.Parameters.Add(new SqlParameter("@residential_postal_code", kyc_obj.residential_postal_code));
            cmd.Parameters.Add(new SqlParameter("@residential_country", kyc_obj.residential_country));
            cmd.Parameters.Add(new SqlParameter("@kyc_timestamp", DateTime.Now));
            cmd.ExecuteNonQuery();
            cnn.Close();
        }


        public void SaveSuitabilityTestResults(string investor_id, List<string> questions, List<string> answers)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            for (int i = 0; i < answers.Count; i++)
            {
                string sql = "INSERT INTO suitability_test_res(investor_id, ques, ans_text) VALUES(@investor_id, @ques, @ans_text);";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add(new SqlParameter("@investor_id", investor_id));
                cmd.Parameters.Add(new SqlParameter("@ques", questions[i]));
                cmd.Parameters.Add(new SqlParameter("@ans_text", answers[i]));
                cmd.ExecuteNonQuery();
            }
            cnn.Close();
        }
    }
}