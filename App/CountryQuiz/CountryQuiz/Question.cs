using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ServiceModel;
using System.Runtime.Serialization;

namespace CountryQuiz
{
    [DataContract]
    public class Question
    {
        string question;
        string option1;
        string option2;
        string option3;
        string option4;

        [DataMember]
        public string QuestionTitle 
        {
            get { return question; }
            set { question = value; }
        }

        [DataMember]
        public string Option1 
        {
            get { return option1; }
            set { option1 = value; }
        }

        [DataMember]
        public string Option2
        {
            get { return option2; }
            set { option2 = value; }
        }

        [DataMember]
        public string Option3
        {
            get { return option3; }
            set { option3 = value; }
        }

        [DataMember]
        public string Option4
        {
            get { return option4; }
            set { option4 = value; }
        }

        public Question(string q, string o1, string  o2, string o3, string o4) 
        {
            QuestionTitle = q;
            Option1 = o1;
            Option2 = o2;
            Option3 = o3;
            Option4 = o4;
        }
    }
}