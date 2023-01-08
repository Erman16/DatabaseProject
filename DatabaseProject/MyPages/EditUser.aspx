<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="DatabaseProject.MyPages.EditUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit User Page</title>
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

      .myDataTable{
          border: 2px #DFDFDF solid;
          border-radius: 10px;
          font-size: 18px;
      }
          .myDataTable td{
              padding: 7px 40px 7px 20px;
          }
    </style>

    <link href="../Css/form-validation.css" rel="stylesheet"/>
    <link href="../Css/headers.css" rel="stylesheet"/>

</head>
<body>
    <div runat="server" style="margin: 0 5% 0 5%;" id="successMessage">
        <div class="alert alert-success" role="alert">
            <h4 class="alert-heading">Success!</h4>
            <p>Your informations is succesfully updated.</p>
            <hr/>
            <p class="mb-0"></p> 
        </div>
    </div>
    <div runat="server" style="margin: 0 5% 0 5%;" id="errorMessage">
        <div class="alert alert-warning" role="alert">
            <h4 class="alert-heading">Error!!!</h4>
            <p>Please try again.</p>
            <hr/>
            <p class="mb-0"></p>
        </div>
    </div>
    <form runat="server">
         <header class="p-3 text-bg-dark">
            <div class="container">
                <div class="collapse bg-dark" id="navbarHeader">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-8 col-md-7 py-4">
                                <h4 class="text-white">About Our Firm</h4>
                                <p class="text-muted">TechArts is a leading software development company that specializes in creating innovative solutions for businesses of all sizes.
                                    <br /><br />Founded by a team of experienced software engineers, we have a passion for creating cutting-edge software that helps our clients streamline their operations and improve efficiency. 
                                    With a focus on user experience and performance, we pride ourselves on delivering high-quality products that exceed our clients' expectations.
                                    <br /><br />Our team of talented developers has a diverse set of skills and expertise, allowing us to tackle projects of any scope and complexity. 
                                    From custom software development to integrations and migrations, we have the resources and expertise to help your business succeed.
                                    <br /><br />In addition to our technical capabilities, we are dedicated to providing exceptional customer service and support. 
                                    We work closely with our clients to understand their unique needs and goals, and we strive to build long-term partnerships through transparent communication and collaboration.
                                    <br /><br />Whether you are a small startup or a large enterprise, TechArts has the skills and resources to help you achieve your business objectives through custom software solutions. 
                                    Contact us today to learn more about how we can help your business thrive.</p>
                            </div>
                            <div class="col-sm-4 offset-md-1 py-4">
                                <h4 class="text-white">Our Linkedln's</h4>
                                <ul class="list-unstyled">
                                    <li><a href="https://www.linkedin.com/in/ermanyalcin/" class="text-white">Erman Yalçın Linkedln</a></li>
                                    <li><a href="https://www.linkedin.com/in/arda-deniz-k%C3%BC%C3%A7%C3%BCk%C3%A7oban-33466123a/" class="text-white">Arda Deniz Küçükçoban Linkedln</a></li>
                                    <li><a href="https://www.linkedin.com/in/melis-kara/" class="text-white">Melis Kara Linkedln</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
              <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">

                <a href="#" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
                    <strong id="companyNamePlace" runat="server"></strong>
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                </ul>

                <div class="text-end">
                    <button type="button" class="btn btn-outline-light me-2" onclick="gotoHome()"> Home </button><script>function gotoHome() { window.location.href = "HomePage.aspx"; }</script>
                    <button type="button" class="btn btn-outline-light me-2" onclick="gotoEdit()">Settings</button><script>function gotoEdit() { window.location.href = "EditUser.aspx"; }</script>
                    <button type="button" class="btn btn-outline-light me-2" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-bar-down" viewBox="0 0 16 16">
                          <path fill-rule="evenodd" d="M1 3.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5zM8 6a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 .708-.708L7.5 12.293V6.5A.5.5 0 0 1 8 6z"/>
                        </svg>
                    </button>
                    <button type="button" class="btn btn-outline-light me-2" onclick="gotoLogin()">Exit</button><script>function gotoLogin() { window.location.href = "LoginPage.aspx"; }</script>
                </div>
              </div>
            </div>
           
            </header>

    <div class="container">
        <main>
            <div class="py-5 text-center">
                <h2>Edit User Information</h2>
            </div>

            <div class="row g-5">
                <div class="col-md-5 col-lg-4 order-md-last">
                    <ul class="list-group mb-3">
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Name</h6>
                            </div>
                            <asp:Button class="btn btn-outline-secondary btn-sm" ID="Button1" runat="server" Text="Edit" OnClick="Button1_Click" CausesValidation="false"/>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Surname</h6>
                            </div>
                            <asp:Button class="btn btn-outline-secondary btn-sm" ID="Button2" runat="server" Text="Edit" OnClick="Button2_Click" CausesValidation="false"/>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Password</h6>
                            </div>
                            <asp:Button class="btn btn-outline-secondary btn-sm" ID="Button3" runat="server" Text="Edit" OnClick="Button3_Click" CausesValidation="false"/>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Address</h6>
                            </div>
                            <asp:Button class="btn btn-outline-secondary btn-sm" ID="Button4" runat="server" Text="Edit" OnClick="Button4_Click" CausesValidation="false"/>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Name On Credit Card</h6>
                            </div>
                            <asp:Button class="btn btn-outline-secondary btn-sm" ID="Button5" runat="server" Text="Edit" OnClick="Button5_Click" CausesValidation="false"/>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Credit Card No</h6>
                            </div>
                            <asp:Button class="btn btn-outline-secondary btn-sm" ID="Button6" runat="server" Text="Edit" OnClick="Button6_Click" CausesValidation="false"/>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Credit Card Exposure Date</h6>
                            </div>
                            <asp:Button class="btn btn-outline-secondary btn-sm" ID="Button7" runat="server" Text="Edit" OnClick="Button7_Click" CausesValidation="false"/>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Credit Card Cvv</h6>
                            </div>
                            <asp:Button class="btn btn-outline-secondary btn-sm" ID="Button8" runat="server" Text="Edit" OnClick="Button8_Click" CausesValidation="false"/>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Country</h6>
                            </div>
                            <asp:Button class="btn btn-outline-secondary btn-sm" ID="Button9" runat="server" Text="Edit" OnClick="Button9_Click" CausesValidation="false"/>
                        </li>
                    </ul>
                </div>
                <div class="col-md-7 col-lg-8" id="inputField" style="display:none" runat="server">
                    <h2 class="h3 mb-3 fw-normal">New <span id="whichField" runat="server"></span></h2>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="uInput" placeholder=" " runat="server"/>
                        <label for="uInput" id="inputText" runat="server"></label>
                        <asp:RequiredFieldValidator ID="inputValidator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="uInput"></asp:RequiredFieldValidator>
                    </div>

                    <asp:Button class="w-100 btn btn-lg btn-primary" ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click"/>
                    <p> </p>
                    <asp:Button ID="returnButton" runat="server" Text="Return" class="w-100 btn btn-lg" Font-Underline="true" CausesValidation="false" OnClick="returnButton_Click"/>
                </div>
                <div class="col-md-5 col-lg-8" id="infoTable" style="display:block" runat="server">
                    <ul class="list-group mb-3">
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">First Name</h6>
                            </div>
                            <div>
                                <h6 class="my-0 text-muted" id="firstNameData" runat="server"></h6>
                            </div>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Last Name</h6>
                            </div>
                            <div>
                                <h6 class="my-0 text-muted" id="lastNameData" runat="server"></h6>
                            </div>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Password</h6>
                            </div>
                            <div>
                                <h6 class="my-0 text-muted" id="passwordData" runat="server"></h6>
                            </div>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Address</h6>
                            </div>
                            <div>
                                <h6 class="my-0 text-muted" id="addressData" runat="server"></h6>
                            </div>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Name On Credit Card</h6>
                            </div>
                            <div>
                                <h6 class="my-0 text-muted" id="nameOnCreditCardData" runat="server"></h6>
                            </div>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Credit Card No</h6>
                            </div>
                            <div>
                                <h6 class="my-0 text-muted" id="creditCardNoData" runat="server"></h6>
                            </div>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Credit Card Exposure Date</h6>
                            </div>
                            <div>
                                <h6 class="my-0 text-muted" id="creditCardExposureDateData" runat="server"></h6>
                            </div>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Credit Card Cvv</h6>
                            </div>
                            <div>
                                <h6 class="my-0 text-muted" id="creditCardCvvData" runat="server"></h6>
                            </div>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Country</h6>
                            </div>
                            <div>
                                <h6 class="my-0 text-muted" id="countryData" runat="server"></h6>
                            </div>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Email<span class="text-muted">(Unchangeable)</span></h6>
                            </div>
                            <div>
                                <h6 class="my-0 text-muted" id="emailData" runat="server"></h6>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </main>
        <asp:Button ID="deleteButton" runat="server" Text="Delete Account" class="w-100 btn btn-danger" Font-Underline="true" CausesValidation="false" OnClick="deleteButton_Click"/>
        <footer class="my-5 pt-5 text-muted text-center text-small">
            <p class="mb-1">&copy; 2022</p>
        </footer>
    </div>
    </form>
    <script src="form-validation.js"></script>
    <script src="../MyScripts/bootstrap.bundle.min.js"></script>

</body>
</html>
