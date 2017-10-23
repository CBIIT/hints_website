using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Web.Services;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace Hints.ChartingPrototype_GetData
{
    public partial class WS_Data_DataMethods : System.Web.UI.Page
    {

        private const string CycleId_ColumnName = "CycleId";
        private const string CycleDisplayText_ColumnName = "CycleDisplayText";
        private const string CycleCitationText_ColumnName = "CycleCitationText";
        private const string DeliveryTypeId_ColumnName = "DeliveryTypeId";
        private const string DeliveryTypeDisplayText_ColumnName = "DeliveryTypeDisplayText";
        private const string SummaryTypeId_ColumnName = "SummaryTypeId";
        private const string SummaryTypeDisplayText_ColumnName = "SummaryTypeDisplayText";
        private const string Response_ColumnName = "Response";
        private const string Percentage_ColumnName = "Percentage";


        private const string SurveyQuestionText = "DO WE NEED THIS--SurveyQuestionText";

        protected void Page_Load(object sender, EventArgs e)
        {

        }





        [WebMethod]
        public static SurveyQuestionResult GetSurveyQuestionResult(string PK_Question)
        {


            string strConnect = ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString;
            SqlConnection objConnect = new SqlConnection(strConnect);
            SqlCommand Cmd = new SqlCommand("", objConnect);
            SqlDataReader objDR = default(SqlDataReader);




            string strSurveyQuestionText = "";



            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.CommandText = "[Get_Question]";
            Cmd.Parameters.Add("@PK_Question", SqlDbType.Int).Value = PK_Question;
            objConnect.Open();
            objDR = Cmd.ExecuteReader();
            while (objDR.Read())
            {
                strSurveyQuestionText = (string)objDR["Question"];
            }
            objDR.Close();
            objConnect.Close();
            Cmd.Parameters.Clear();






            DataTable cycleData = GetMockCycleData(PK_Question);
            Dictionary<string, string> citationData = GetMockCitationData(PK_Question);
            //var result = new SurveyQuestionResult(SurveyQuestionId, SurveyQuestionText);
            //var result = new SurveyQuestionResult(PK_Question, SurveyQuestionText);
            var result = new SurveyQuestionResult(PK_Question, strSurveyQuestionText);

            for (int i = 0; i < cycleData.Rows.Count; i++)
            {
                //  GETTING THE VALUES IN THE ROW
                string cycleId = cycleData.Rows[i][CycleId_ColumnName].ToString();
                string cycleDisplayText = cycleData.Rows[i][CycleDisplayText_ColumnName].ToString();
                string summaryTypeId = cycleData.Rows[i][SummaryTypeId_ColumnName].ToString();
                string summaryTypeDisplayText = cycleData.Rows[i][SummaryTypeDisplayText_ColumnName].ToString();
                string response = cycleData.Rows[i][Response_ColumnName].ToString();
                string percentage = cycleData.Rows[i][Percentage_ColumnName].ToString();


                //  BUILDING THE OBJECT TREE

                SurveyCycle surveyCycle = null;
                DataSummaryType dataSummaryType = null;

                //  ADDING THE CYCLES
                if (result.SurveyCycles.Contains(cycleId))
                {
                    surveyCycle = result.SurveyCycles[cycleId] as SurveyCycle;
                }
                else
                {
                    surveyCycle = new SurveyCycle(cycleId, cycleDisplayText, citationData[cycleId], (cycleId == "0"));
                    result.SurveyCycles.Add(cycleId, surveyCycle);
                }

                //  ADDING THE DATA SUMMARY TYPES
                if (surveyCycle.DataSummaryTypes.Contains(summaryTypeId))
                {
                    dataSummaryType = surveyCycle.DataSummaryTypes[summaryTypeId] as DataSummaryType;
                }
                else
                {
                    dataSummaryType = new DataSummaryType(summaryTypeId, summaryTypeDisplayText);
                    surveyCycle.DataSummaryTypes.Add(summaryTypeId, dataSummaryType);
                }

                if (!surveyCycle.IsForAllCycles)
                {
                    //  ADDING THE VALUES FOR THE CHARTS
                    dataSummaryType.ValuesForChart.Responses.Add(response);
                    dataSummaryType.ValuesForChart.Percentages.Add(percentage);
                }
            }

            return result;
        }





        private static DataTable GetMockCycleData(string PK_Question)
        {

            string strConnect = ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString;
            SqlConnection objConnect = new SqlConnection(strConnect);
            SqlDataAdapter objDataAdapter = new SqlDataAdapter("", objConnect);
            DataSet objDataSet = new DataSet();

            objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            objDataAdapter.SelectCommand.CommandText = "CHARTING_ListAllResults_For_PK_Question";
            objDataAdapter.SelectCommand.Parameters.Add("@PK_Question", SqlDbType.NVarChar).Value = PK_Question;
            objDataAdapter.Fill(objDataSet, "NewRequestTopics");
            //objDataView = objDataSet.Tables["NewRequestTopics"].DefaultView;
            objConnect.Close();
            objDataAdapter.SelectCommand.Parameters.Clear();


            DataTable dt = objDataSet.Tables["NewRequestTopics"];


            return dt;
        }



        //this is for the footer
        private static Dictionary<string, string> GetMockCitationData(string PK_Question)
        {
            DataTable myDataTable = new DataTable("MyData");
            Dictionary<string, string> mockCitationData = new Dictionary<string, string>();

            //footerText = "Health Information National Trends Survey, " + LIT_DatasetName.Text + " (HINTS, " + LIT_DatasetName.Text + "); URL: hints.cancer.gov; HINTS " + LIT_DatasetName.Text
            //footerText += " database, National Cancer Institute, DCCPS, Behavioral Research Program, Health Communication and Informatics"
            //footerText += "Research Branch. Data collection " + strCycleStart + " - " + strCycleEnd + "; Public data release " + strReleaseDate + "."

            string strConnect = ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString;
            SqlConnection objConnect = new SqlConnection(strConnect);
            SqlDataAdapter objDataAdapter = new SqlDataAdapter("", objConnect);
            DataSet objDataSet = new DataSet();

            objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            objDataAdapter.SelectCommand.CommandText = "CHARTING_Get_FooterData_By_PK_Question";
            objDataAdapter.SelectCommand.Parameters.Add("@PK_Question", SqlDbType.NVarChar).Value = PK_Question;
            objDataAdapter.Fill(objDataSet, "NewRequestTopics");
            //objDataView = objDataSet.Tables["NewRequestTopics"].DefaultView;
            objConnect.Close();
            objDataAdapter.SelectCommand.Parameters.Clear();


            myDataTable = objDataSet.Tables["NewRequestTopics"];


            for (int i = 0; i < myDataTable.Rows.Count; i++)
            {
                string cycleId = myDataTable.Rows[i][CycleId_ColumnName].ToString();
                string cycleCitationText = myDataTable.Rows[i][CycleCitationText_ColumnName].ToString();

                if (!mockCitationData.ContainsKey(cycleId))
                {
                    mockCitationData.Add(cycleId, cycleCitationText);
                }
            }

            return mockCitationData;
        }


        public class SurveyQuestionResult
        {
            public string QuestionId { get; set; }
            public string QuestionText { get; private set; }
            public OrderedDictionary SurveyCycles { get; set; }

            public SurveyQuestionResult(string questionId, string questionText)
            {
                QuestionId = questionId;
                QuestionText = questionText;
                SurveyCycles = new OrderedDictionary();
            }
        }

        public class SurveyCycle
        {
            public string Id { get; set; }
            public string DisplayText { get; set; }
            public string CitationText { get; set; }
            public bool IsForAllCycles { get; set; }
            public OrderedDictionary DataSummaryTypes { get; set; }

            public SurveyCycle(string id, string displayText, string citationText, bool isForAllCycles)
            {
                Id = id;
                DisplayText = displayText;
                CitationText = citationText;
                IsForAllCycles = isForAllCycles;
                DataSummaryTypes = new OrderedDictionary();
            }
        }

        public class DataSummaryType
        {
            public string Id { get; set; }
            public string DisplayText { get; set; }
            public ValuesForChart ValuesForChart { get; set; }

            public DataSummaryType(string id, string displayText)
            {
                Id = id;
                DisplayText = displayText;
                ValuesForChart = new ValuesForChart();
            }
        }

        public class ValuesForChart
        {
            public List<string> Responses { get; set; }
            public List<string> Percentages { get; set; }

            public ValuesForChart()
            {
                Responses = new List<string>();
                Percentages = new List<string>();
            }
        }        
    }
}