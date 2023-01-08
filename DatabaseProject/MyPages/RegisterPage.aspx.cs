using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Diagnostics;
using System.Net;

namespace DatabaseProject.MyPages
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        private String getName;
        private String getSurname;
        private String getEmail;
        private String getPassword;
        private String getAddress;
        private String getNameOnCreditCard;
        private String getCreditCardNo;
        private String getCreditCardExposureDate;
        private String getCreditCardCvv;
        private String getCountry;

        private static bool isCardOpened;
        protected void Page_Load(object sender, EventArgs e)
        {
            successMessage.Style.Add("display", "none");
            errorMessage.Style.Add("display", "none");

            if (isCardOpened)
            {
                optionalArea.Style.Add("display", "block");
            }
            else {
                optionalArea.Style.Add("display", "none");
            }
           
            try
            {
                country.DataSource = GetCountryList();
                country.DataBind();
                country.Items.Insert(0, "Turkey");
            }
            catch (Exception ex)
            {
                throw ex;
            };
        }

        protected void MyRegisterButton_Click(object sender, EventArgs e)
        {
            getName = firstName.Value.ToString().Trim();
            getSurname = lastName.Value.ToString().Trim();
            getEmail = email.Value.ToString().Trim();
            getPassword = password.Value.ToString().Trim();
            getAddress = address.Value.ToString().Trim();
            getNameOnCreditCard = nameOnCreditCard.Value.ToString().Trim();
            getCreditCardNo = creditCardNo.Value.ToString().Trim();
            getCreditCardExposureDate = creditCardExposureDate.Value.ToString().Trim();
            getCreditCardCvv = creditCardCvv.Value.ToString().Trim();
            getCountry = country.SelectedItem.Value.ToString();

            int returnvalue = insertData(getName, getSurname, getEmail, getPassword, getAddress, getNameOnCreditCard, getCreditCardNo, getCreditCardExposureDate, getCreditCardCvv, getCountry);

            if (returnvalue != 0)
            {
                successMessage.Style.Add("display", "block");
                Response.AddHeader("REFRESH", "5;URL=LoginPage.aspx");
            }
            else
            {
                errorMessage.Style.Add("display", "block");
            }
        }

        protected void MyreturnLoginButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (isCardOpened)
            {
                optionalArea.Style.Clear();
                optionalArea.Style.Add("display", "none");
                addressValidator.Enabled = false;
                address.Value = string.Empty;
                nameOnCreditCardValidator.Enabled = false;
                nameOnCreditCard.Value = string.Empty;
                creditCardNoValidator.Enabled = false;
                creditCardNo.Value = string.Empty;
                creditCardExposureDateValidator.Enabled = false;
                creditCardExposureDate.Value = string.Empty;
                creditCardCvvValidator.Enabled = false;
                creditCardCvv.Value = string.Empty;

                isCardOpened = false;
            }
            else
            {
                optionalArea.Style.Clear();
                optionalArea.Style.Add("display", "block");
                addressValidator.Enabled = true;
                address.Value = string.Empty;   
                nameOnCreditCardValidator.Enabled = true;
                nameOnCreditCard.Value = string.Empty;
                creditCardNoValidator.Enabled = true;
                creditCardNo.Value = string.Empty;
                creditCardExposureDateValidator.Enabled = true;
                creditCardExposureDate.Value = string.Empty;
                creditCardCvvValidator.Enabled = true;
                creditCardCvv.Value = string.Empty;

                isCardOpened = true;
            }
        }

        public List<String> GetCountryList()
        {
            List<String> _list = new List<String>();
            CultureInfo[] _cultures = CultureInfo.GetCultures(CultureTypes.InstalledWin32Cultures |
                        CultureTypes.SpecificCultures);
            foreach (CultureInfo _cultureInfo in _cultures)
            {
                if (_cultureInfo.IsNeutralCulture || _cultureInfo.LCID == 127)
                {
                    continue;
                }
                RegionInfo _regionInfo = new RegionInfo(_cultureInfo.Name);
                if (!_list.Contains(_regionInfo.EnglishName))
                {
                    _list.Add(_regionInfo.EnglishName);
                }
            }
            _list.Sort();
            return _list;
        }
    }
}