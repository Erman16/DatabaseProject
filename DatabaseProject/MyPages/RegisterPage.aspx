<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="DatabaseProject.MyPages.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>

    <link href="../Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/StyleSheet.css" rel="stylesheet"/>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>

    <link href="../Css/form-validation.css" rel="stylesheet"/>

</head>
<body class="bg-light">
    <div runat="server" style="margin: 0 5% 0 5%;" id="successMessage">
        <div class="alert alert-success" role="alert">
            <h4 class="alert-heading">Success!</h4>
            <p>Your registration has been successfully completed.</p>
            <hr/>
            <p class="mb-0">You will be redirected to Login page in 10 second.</p> 
        </div>
    </div>
    <div runat="server" style="margin: 0 5% 0 5%;" id="errorMessage">
        <div class="alert alert-warning" role="alert">
            <h4 class="alert-heading">Username is already Taken!!!</h4>
            <p>The username that you try to take is already taken. Please try to take different username!</p>
            <hr/>
            <p class="mb-0"></p>
        </div>
    </div>

    <form id="registerForm" runat="server">
        <div class="container">
            <main>
                <div class="py-5 text-center">
                    <h2 runat="server">Register Form</h2>
                </div>

                <div class="row g-5">
                    <div>
                        <div class="row g-3">
                            <div class="col-sm-6">
                                <label for="firstName" class="form-label">First Name <span class="text-muted">*</span></label>
                                <input type="text" class="form-control" id="firstName" placeholder="" value="" runat="server"/>
                                <asp:RequiredFieldValidator ID="firstNameRequiredFieldValidator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="firstName"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-sm-6">
                                <label for="lastName" class="form-label">Last Name <span class="text-muted">*</span></label>
                                <input type="text" class="form-control" id="lastName" placeholder="" value="" runat="server"/>
                                <asp:RequiredFieldValidator ID="lastNameRequiredFieldValidator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="lastName"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-12">
                                <label for="company" class="form-label">Email <span class="text-muted">*</span></label>
                                <div class="input-group">
                                    <input type="email" class="form-control" id="email" placeholder="Email" runat="server"/>
                                    <asp:RequiredFieldValidator ID="companyRequiredFieldValidator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="email"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please Enter Valid Email" ForeColor="Red" ControlToValidate="email" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="password" class="form-label">Password <span class="text-muted">*</span></label>
                                <div class="input-group">
                                    <input type="password" class="form-control" id="password" placeholder="password" runat="server"/>
                                    <asp:RequiredFieldValidator ID="passwordRequiredFieldValidator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="password"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <hr class="my-4"/>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CausesValidation="False" CssClass="text-black"><h4>Creadit Card Informations <span class="text-muted">(Optional)</span></h4></asp:LinkButton>

                            <div id="optionalArea" runat="server" style="display: none;">
                                <div class="col-12">
                                    <label for="address" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="address" runat="server" value=""/>
                                    <asp:RequiredFieldValidator ID="addressValidator" runat="server" ErrorMessage="Required" ForeColor="Red"  ControlToValidate="address" Enabled="False"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-12">
                                    <label for="nameOnCreditCard" class="form-label">Name On Credit Card</label>
                                    <input type="text" class="form-control" id="nameOnCreditCard" placeholder="" runat="server" value=""/>
                                    <asp:RequiredFieldValidator ID="nameOnCreditCardValidator" runat="server" ErrorMessage="Required" ForeColor="Red"  ControlToValidate="nameOnCreditCard" Enabled="False"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-12">
                                    <label for="creditCardNo" class="form-label">Credit Card No</label>
                                    <input type="text" class="form-control" id="creditCardNo" placeholder="" runat="server" value=""/>
                                    <asp:RequiredFieldValidator ID="creditCardNoValidator" runat="server" ErrorMessage="Required" ForeColor="Red"  ControlToValidate="creditCardNo" Enabled="False"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-12">
                                    <label for="creditCardExposureDate" class="form-label">Credit Card Exposure Date</label>
                                    <input type="text" class="form-control" id="creditCardExposureDate" placeholder="" runat="server" value=""/>
                                    <asp:RequiredFieldValidator ID="creditCardExposureDateValidator" runat="server" ErrorMessage="Required" ForeColor="Red"  ControlToValidate="creditCardExposureDate" Enabled="False"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-12">
                                    <label for="creditCardCvv" class="form-label">CVV</label>
                                    <input type="text" class="form-control" id="creditCardCvv" placeholder="" runat="server" value=""/>
                                    <asp:RequiredFieldValidator ID="creditCardCvvValidator" runat="server" ErrorMessage="Required" ForeColor="Red"  ControlToValidate="creditCardCvv" Enabled="False"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <hr class="my-4"/>

                            <div class="col-md-5">
                                <label for="country" class="form-label">Country</label>
                                <asp:DropDownList class="form-select"  ID="country" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="countryRequiredFieldValidator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="country"></asp:RequiredFieldValidator>
                            </div>

                        </div>

                        <hr class="my-4"/>
                        <asp:Button class="w-100 btn btn-primary btn-lg" ID="Button1" runat="server" Text="Continue to register" OnClick="MyRegisterButton_Click"/>
                        <p> </p>
                        <asp:Button ID="Button2" runat="server" Text="Login" OnClick="MyreturnLoginButton_Click" class="w-100 btn btn-lg" Font-Underline="true" CausesValidation="false"/>
                    </div>
                </div>
            </main>

            <footer class="my-5 pt-5 text-muted text-center text-small">
                <p class="mb-1">&copy; 2022</p>
            </footer>
        </div>
    </form>

    <script src="../MyScripts/bootstrap.bundle.min.js"></script>
    <script src="../MyScripts/form-validation.js"></script>
</body>
</html>
