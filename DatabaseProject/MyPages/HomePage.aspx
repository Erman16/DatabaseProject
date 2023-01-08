<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="DatabaseProject.MyPages.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link href="../Css/bootstrap.min.css" rel="stylesheet"/>

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

      .myData{
          border: 2px black solid;
          table-layout: fixed;
          width: 100%;
      }
      .myData td:nth-child(odd){
          border: 2px black solid;
          word-wrap: break-word;
      }
      .myData td:nth-child(even){
          border: 2px black solid;
          padding: 10px;
          word-wrap: break-word;
      }
    </style>

    <link href="../Css/grid.css" rel="stylesheet"/>
    <link href="../Css/pricing.css" rel="stylesheet"/>
    <link href="../Css/headers.css" rel="stylesheet"/>

</head>
<body>
    <form id="form1" runat="server">

        <header class="p-3 text-bg-dark">
            <div class="container">
                <div class="collapse bg-dark" id="navbarHeader">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-8 col-md-7 py-4">
                                <h4 class="text-white">About Our Firm</h4>
                                <p class="text-muted">
                                    TechArts is a leading software development company that specializes in creating innovative solutions for businesses of all sizes.
                                    <br />
                                    <br />
                                    Founded by a team of experienced software engineers, we have a passion for creating cutting-edge software that helps our clients streamline their operations and improve efficiency. 
                                    With a focus on user experience and performance, we pride ourselves on delivering high-quality products that exceed our clients' expectations.
                                    <br />
                                    <br />
                                    Our team of talented developers has a diverse set of skills and expertise, allowing us to tackle projects of any scope and complexity. 
                                    From custom software development to integrations and migrations, we have the resources and expertise to help your business succeed.
                                    <br />
                                    <br />
                                    In addition to our technical capabilities, we are dedicated to providing exceptional customer service and support. 
                                    We work closely with our clients to understand their unique needs and goals, and we strive to build long-term partnerships through transparent communication and collaboration.
                                    <br />
                                    <br />
                                    Whether you are a small startup or a large enterprise, TechArts has the skills and resources to help you achieve your business objectives through custom software solutions. 
                                    Contact us today to learn more about how we can help your business thrive.
                                </p>
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
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24">
                            <path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z" />
                            <circle cx="12" cy="13" r="4" />
                        </svg>
                        <strong id="companyNamePlace" runat="server"></strong>
                    </a>

                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    </ul>

                    <div class="text-end">
                        <button type="button" class="btn btn-outline-light me-2" onclick="gotoHome()">Home </button>
                        <script>function gotoHome() { window.location.href = "HomePage.aspx"; }</script>
                        <button type="button" class="btn btn-outline-light me-2" onclick="gotoEdit()">Settings</button><script>function gotoEdit() { window.location.href = "EditUser.aspx"; }</script>
                        <button type="button" class="btn btn-outline-light me-2" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-bar-down" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M1 3.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5zM8 6a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 .708-.708L7.5 12.293V6.5A.5.5 0 0 1 8 6z" />
                            </svg>
                        </button>
                        <button type="button" class="btn btn-outline-light me-2" onclick="gotoLogin()">Exit</button><script>function gotoLogin() { window.location.href = "LoginPage.aspx"; }</script>
                    </div>
                </div>
            </div>

        </header>

        <div class="container py-3">
            <header>
                <div class="pricing-header p-1 pb-md-1 mx-auto text-center">
                    <h4 class="display-5 fw-normal"><span style="color: purple">Tech</span><span style="color: orange">Arts</span></h4>
                </div>
                <div class="pricing-header p-1 pb-md-1 mx-auto text-center">
                    <div id="buttons">
                        <br />
                        <br />
                        <asp:Button class="w-80 btn btn-lg btn-warning" ID="ProductsButton" runat="server" Text="Products" OnClick="ProductsButton_Click" />
                    </div>
                </div>
            </header>

            <main>
                <div class="pt-4 my-md-4 pt-md-4 border-top"></div>
                <h3 class="fs-3 text-muted text-center" runat="server">Departments</h3>
                <h6 class="fs-5 text-muted text-center">There is the departments.</h6>
                <br />

                <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
                    <div class="col">
                        <div class="card mb-4 rounded-3 shadow-sm">
                            <div class="card-header py-3">
                                <h4 class="my-0 fw-normal" runat="server" id="departmentName1"></h4>
                            </div>
                            <div class="card-body">
                                <p runat="server" id="departmentInfo1">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi elementum nisl quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nam porttitor magna rhoncus consequat dapibus. Integer venenatis justo eu suscipit mattis. Fusce non fringilla dui. Sed convallis nisi eu ultricies bibendum..</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card mb-4 rounded-3 shadow-sm">
                            <div class="card-header py-3">
                                <h4 class="my-0 fw-normal" runat="server" id="departmentName2"></h4>
                            </div>
                            <div class="card-body">
                                <p runat="server" id="departmentInfo2">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi elementum nisl quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nam porttitor magna rhoncus consequat dapibus. Integer venenatis justo eu suscipit mattis. Fusce non fringilla dui. Sed convallis nisi eu ultricies bibendum..</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card mb-4 rounded-3 shadow-sm">
                            <div class="card-header py-3">
                                <h4 class="my-0 fw-normal" runat="server" id="departmentName3"></h4>
                            </div>
                            <div class="card-body">
                                <p runat="server" id="departmentInfo3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi elementum nisl quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nam porttitor magna rhoncus consequat dapibus. Integer venenatis justo eu suscipit mattis. Fusce non fringilla dui. Sed convallis nisi eu ultricies bibendum..</p>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
            </main>

            <footer class="pt-4 my-md-5 pt-md-5 border-top">
                <div class="row" style="text-align: center">
                    <small class="mb-3 text-muted">&copy; 2022</small>
                </div>
            </footer>
        </div>
    </form>

    <script src="../MyScripts/bootstrap.bundle.min.js"></script>
</body>
</html>
