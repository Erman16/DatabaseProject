using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web.UI.HtmlControls;
using System.Configuration;

namespace DatabaseProject.MyPages
{
    public partial class Products : System.Web.UI.Page
    {

        public static int cardCounter=0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (LoginPage.myPersonEmail == null)
            {
                Response.Redirect("LoginPage.aspx");
            }
            else
            {
                companyN.InnerText = "  " + LoginPage.myPersonName + " " + LoginPage.myPersonSurname;
            }
        }

        protected void getSoftware(object sender, EventArgs e)
        {
            CheckBox1.Enabled = true;
            CheckBox1.Visible = true;
            CheckBox1.Text = "Web Application";
            CheckBox2.Enabled = true;
            CheckBox2.Visible = true;
            CheckBox2.Text = "Mobile Application";
            CheckBox3.Enabled = true;
            CheckBox3.Visible = true;
            CheckBox3.Text = "Security Softwares";
            CheckBox4.Enabled = true;
            CheckBox4.Visible = true;
            CheckBox4.Text = "Operating Systems";

            SearchForProjects.Visible = true;

            testN.InnerHtml = "Software";
            getResults("Software");
        }
        protected void getHardware(object sender, EventArgs e)
        {
            CheckBox1.Enabled = true;
            CheckBox1.Visible = true;
            CheckBox1.Text = "Modems";
            CheckBox2.Enabled = true;
            CheckBox2.Visible = true;
            CheckBox2.Text = "Graphics Card";
            CheckBox3.Enabled = true;
            CheckBox3.Visible = true;
            CheckBox3.Text = "Network Products";
            CheckBox4.Enabled = false;
            CheckBox4.Visible = false;
            CheckBox4.Text = "";

            SearchForProjects.Visible = true;

            testN.InnerHtml = "Hardware";
            getResults("Hardware");
        }
        protected void getWeb(object sender, EventArgs e)
        {
            CheckBox1.Enabled = true;
            CheckBox1.Visible = true;
            CheckBox1.Text = "Azure Cloud";
            CheckBox2.Enabled = true;
            CheckBox2.Visible = true;
            CheckBox2.Text = "AWS Cloud";
            CheckBox3.Enabled = true;
            CheckBox3.Visible = true;
            CheckBox3.Text = "Google Cloud";
            CheckBox4.Enabled = false;
            CheckBox4.Visible = false;
            CheckBox4.Text = "";

            SearchForProjects.Visible = true;

            testN.InnerHtml = "Web Services";
            getResults("Web Services");
        }
        protected void getAllData(object sender, EventArgs e)
        {
            CheckBox1.Enabled = false;
            CheckBox1.Visible = false;
            CheckBox1.Text = "";
            CheckBox2.Enabled = false;
            CheckBox2.Visible = false;
            CheckBox2.Text = "";
            CheckBox3.Enabled = false;
            CheckBox3.Visible = false;
            CheckBox3.Text = "";
            CheckBox4.Enabled = false;
            CheckBox4.Visible = false;
            CheckBox4.Text = "";

            SearchForProjects.Visible = false;

            testN.InnerHtml = "All";
            getResults("*");
        }

        public void getResults(string depName)
        {
            var sqlCommand = "";
            addItems.InnerHtml = "";

            try
            {
                string connectionString = "Data Source=localhost;Initial Catalog=DatabaseProjectDB;Integrated Security=True";

                string nameArea = "";
                string infoArea = "";
                string priceArea = "";
                string brand = "";
                string card = "";

                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();

                DataTable dtCourse = new DataTable();

                if (connection.State == ConnectionState.Open)
                {
                    if (depName == "Software")
                    {
                        sqlCommand = "SELECT productName, price, information, brand " +
                            "FROM Products WHERE projectNum IN (SELECT pNumber FROM Projects " +
                            "INNER JOIN Departments ON dNum = dNumber AND dNum = 1)";
                        // SELECT command used with WHERE and INNER JOIN, we use AND operation too.
                    }
                    else if (depName == "Hardware")
                    {
                        sqlCommand = "SELECT productName, price, information, brand " +
                            "FROM Products WHERE projectNum IN (SELECT pNumber FROM Projects " +
                            "INNER JOIN Departments ON dNum = dNumber AND dNum = 2)";
                        // SELECT command used with WHERE and INNER JOIN, we use AND operation too.
                    }
                    else if (depName == "Web Services")
                    {
                        sqlCommand = "SELECT productName, price, information, brand " +
                            "FROM Products WHERE projectNum IN (SELECT pNumber FROM Projects " +
                            "INNER JOIN Departments ON dNum = dNumber AND dNum = 3)";
                        // SELECT command used with WHERE and INNER JOIN, we use AND operation too.
                    }
                    else
                    {
                        sqlCommand = "SELECT productName, price, information, brand FROM Products";
                    }
                    
                    SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand, connection);
                    adapter.Fill(dtCourse);

                    if (dtCourse.Rows != null)
                    {
                        for (var i=0;i<dtCourse.Rows.Count;i++)
                        {
                            if(cardCounter == 5)
                            {
                                addItems.InnerHtml += "<div class=\"card-group\" style='margin-bottom: 40px;'>" + card+"</div>";
                                card = "";
                                cardCounter = 0;
                            }
                            
                            for (; cardCounter < 5; cardCounter++)
                            {
                                if (i == dtCourse.Rows.Count)
                                {
                                    break;
                                }
                                nameArea = dtCourse.Rows[i][0].ToString();
                                priceArea = dtCourse.Rows[i][1].ToString();
                                infoArea = dtCourse.Rows[i][2].ToString();
                                brand = dtCourse.Rows[i][3].ToString();

                                string itemCard =
                                        "<div class=\"card-header py-2\">" +
                                            "<h4 class=\"my-0 fw-normal\" runat=\"server\"></h4>" +
                                        "</div>" +
                                        "<div class=\"card-body\">" +
                                            "<h4>" + nameArea + "</h4>" +
                                            "<p class=\"card-text\">" + infoArea + "</p>" +
                                            "<ul class=\"list-unstyled mt-3 mb-4\">" +
                                                "<li><strong>Price:</strong> " + priceArea + "$</li>" +
                                                "<li><strong>Brand:</strong> " + brand + "</li>" +
                                            "</ul>" +
                                        "</div>" +
                                        "<div class=\"card-footer\">" +
                                            "<button class=\"w-80 btn btn-primary\">Add To Basket</button>" +
                                        "</div>";

                                card += "<div class=\"card\">" + itemCard + "</div>";
                                i++;
                            }
                        }
                        addItems.InnerHtml += "<div class=\"card-group\" style='margin-bottom: 40px;'>" + card + "</div>";
                    }
                }
            }
            catch (Exception ex) { }
        }

        protected void SearchForProjects_Click(object sender, EventArgs e)
        {
            addItems.InnerHtml = "";

            List<int> projectNum = new List<int>();

            if (CheckBox1.Checked)
            {
                if(CheckBox1.Text == "Web Application")
                {
                    projectNum.Add(1);
                }
                else if(CheckBox1.Text == "Modems")
                {
                    projectNum.Add(5);
                }
                else if(CheckBox1.Text == "Azure Cloud")
                {
                    projectNum.Add(8);
                }
            }
            if (CheckBox2.Checked)
            {
                if (CheckBox2.Text == "Mobile Application")
                {
                    projectNum.Add(2);
                }
                else if (CheckBox2.Text == "Graphics Card")
                {
                    projectNum.Add(6);
                }
                else if (CheckBox2.Text == "AWS Cloud")
                {
                    projectNum.Add(9);
                }
            }
            if (CheckBox3.Checked)
            {
                if (CheckBox3.Text == "Security Softwares")
                {
                    projectNum.Add(3);
                }
                else if (CheckBox3.Text == "Network Products")
                {
                    projectNum.Add(7);
                }
                else if (CheckBox3.Text == "Google Cloud")
                {
                    projectNum.Add(10);
                }
            }
            if (CheckBox4.Checked)
            {
                if (CheckBox4.Text == "Operating Systems")
                {
                    projectNum.Add(4);
                }
            }

            var innerString = "";

            foreach(var i in projectNum)
            {
                if(i == projectNum.Last())
                {
                    innerString += i.ToString();
                }
                else
                {
                    innerString += i.ToString() + ",";
                }
            }
                                // SELECT command with WHERE and IN keywords, we use double SELECT and use IN for multiple Search in second one.
            var sqlString = "SELECT productName, price, information, brand " +
                "FROM Products WHERE projectNum " +
                "IN (SELECT pNumber FROM Projects WHERE pNumber IN ("+ innerString + "));";

            try
            {
                string connectionString = "Data Source=localhost;Initial Catalog=DatabaseProjectDB;Integrated Security=True";
                string nameArea = "";
                string infoArea = "";
                string priceArea = "";
                string brand = "";
                string card = "";
                

                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();

                DataTable dtCourse = new DataTable();

                if (connection.State == ConnectionState.Open)
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(sqlString, connection);
                    adapter.Fill(dtCourse);

                    if (dtCourse != null)
                    {
                        for (var i=0;i<dtCourse.Rows.Count;i++)
                        {
                            if(cardCounter == 5)
                            {
                                addItems.InnerHtml += "<div class=\"card-group\" style='margin-bottom: 40px;'>" + card+"</div>";
                                card = "";
                                cardCounter = 0;
                            }
                            
                            for (; cardCounter < 5; cardCounter++)
                            {
                                if (i == dtCourse.Rows.Count)
                                {
                                    break;
                                }
                                nameArea = dtCourse.Rows[i][0].ToString();
                                priceArea = dtCourse.Rows[i][1].ToString();
                                infoArea = dtCourse.Rows[i][2].ToString();
                                brand = dtCourse.Rows[i][3].ToString();

                                string itemCard =
                                        "<div class=\"card-header py-2\">" +
                                            "<h4 class=\"my-0 fw-normal\" runat=\"server\"></h4>" +
                                        "</div>" +
                                        "<div class=\"card-body\">" +
                                            "<h4>" + nameArea + "</h4>" +
                                            "<p class=\"card-text\">" + infoArea + "</p>" +
                                            "<ul class=\"list-unstyled mt-3 mb-4\">" +
                                                "<li><strong>Price:</strong> " + priceArea + "$</li>" +
                                                "<li><strong>Brand:</strong> " + brand + "</li>" +
                                            "</ul>" +
                                        "</div>" +
                                        "<div class=\"card-footer\">" +
                                            "<button class=\"w-80 btn btn-primary\">Add To Basket</button>" +
                                        "</div>";

                                card += "<div class=\"card\">" + itemCard + "</div>";
                                i++;
                            }
                        }
                        addItems.InnerHtml += "<div class=\"card-group\" style='margin-bottom: 40px;'>" + card + "</div>";
                    }
                }
            }
            catch (Exception ex) { }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            addItems.InnerHtml = "";

            var enteredValue = mySearch.Text.ToString().Trim();
            var sqlString = "SELECT productName, price, information, brand FROM Products" +
                " WHERE productName LIKE '%"+ enteredValue + "%' OR information LIKE '%"+ enteredValue + "%' " +
                "OR brand LIKE '%"+ enteredValue + "%' OR price LIKE '%"+ enteredValue + "%';";
            
            try
            {
                string connectionString = "Data Source=localhost;Initial Catalog=DatabaseProjectDB;Integrated Security=True";
                string nameArea = "";
                string infoArea = "";
                string priceArea = "";
                string brand = "";
                string card = "";


                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();

                DataTable dtCourse = new DataTable();

                if (connection.State == ConnectionState.Open)
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(sqlString, connection);
                    adapter.Fill(dtCourse);

                    if (dtCourse != null)
                    {
                        for (var i = 0; i < dtCourse.Rows.Count; i++)
                        {
                            if (cardCounter == 5)
                            {
                                addItems.InnerHtml += "<div class=\"card-group\" style='margin-bottom: 40px;'>" + card + "</div>";
                                card = "";
                                cardCounter = 0;
                            }

                            for (; cardCounter < 5; cardCounter++)
                            {
                                if (i == dtCourse.Rows.Count)
                                {
                                    break;
                                }
                                nameArea = dtCourse.Rows[i][0].ToString();
                                priceArea = dtCourse.Rows[i][1].ToString();
                                infoArea = dtCourse.Rows[i][2].ToString();
                                brand = dtCourse.Rows[i][3].ToString();

                                string itemCard =
                                        "<div class=\"card-header py-2\">" +
                                            "<h4 class=\"my-0 fw-normal\" runat=\"server\"></h4>" +
                                        "</div>" +
                                        "<div class=\"card-body\">" +
                                            "<h4>" + nameArea + "</h4>" +
                                            "<p class=\"card-text\">" + infoArea + "</p>" +
                                            "<ul class=\"list-unstyled mt-3 mb-4\">" +
                                                "<li><strong>Price:</strong> " + priceArea + "$</li>" +
                                                "<li><strong>Brand:</strong> " + brand + "</li>" +
                                            "</ul>" +
                                        "</div>" +
                                        "<div class=\"card-footer\">" +
                                            "<button class=\"w-80 btn btn-primary\">Add To Basket</button>" +
                                        "</div>";

                                card += "<div class=\"card\">" + itemCard + "</div>";
                                i++;
                            }
                        }
                        addItems.InnerHtml += "<div class=\"card-group\" style='margin-bottom: 40px;'>" + card + "</div>";
                    }
                }
            }
            catch (Exception ex) { }
        }
    }
}