using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Text;

namespace CountryQuiz
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Attributes.Add("onclick", "return false;");
        }

        [WebMethod]
        public static string GetMessage() 
        {
            return "Test";
        }

        [WebMethod]
        public static string GetQuestion() 
        {
            Question quest = new Question("abcd","a","b","c","d");

            DataContractJsonSerializer jsonMaker = new DataContractJsonSerializer(typeof(Question));

            using (MemoryStream ms = new MemoryStream())
            {
                jsonMaker.WriteObject(ms, quest);
                ms.Flush();

                byte[] bytes = ms.GetBuffer();

                string jsonResult = Encoding.UTF8.GetString(bytes, 0, bytes.Length).Trim('\0');
                return jsonResult;
            }
        }
    }
}