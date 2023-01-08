<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="DatabaseProject.MyPages.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Results Page</title>

    <link href="../Css/bootstrap.min.css" rel="stylesheet" />

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

    <link href="../Css/dashboard.css" rel="stylesheet" />
    <link href="../Css/grid.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
                <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6" href="#">
                    <p id="companyN" runat="server"></p>
                </a>
                <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <asp:TextBox ID="mySearch" runat="server" placeholder="Search" class="form-control form-control-dark w-100 rounded-0 border-0" aria-label="Search"></asp:TextBox>
                <asp:Button CssClass="btn btn-primary" ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click"/>
                <div class="navbar-nav">
                    <div class="nav-item text-nowrap">
                        <a class="nav-link px-3" href="HomePage.aspx">Home Page</a>
                    </div>
                </div>
            </header>

            <div class="container-fluid">
                <div class="row">
                    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                        <div class="position-sticky pt-3 sidebar-sticky">
                            <ul class="nav flex-column mb-2">
                                <li class="nav-item">
                                    <asp:LinkButton CssClass="nav-link" ID="RSoftware" runat="server" OnClick="getSoftware"><span data-feather="file-text" class="align-text-bottom"></span> Software Products</asp:LinkButton>
                                </li>
                                <li class="nav-item">
                                    <asp:LinkButton CssClass="nav-link" ID="RHoftware" runat="server" OnClick="getHardware"><span data-feather="file-text" class="align-text-bottom"></span> Hardware Products</asp:LinkButton>
                                </li>
                                <li class="nav-item">
                                    <asp:LinkButton CssClass="nav-link" ID="RWeb" runat="server" OnClick="getWeb"><span data-feather="file-text" class="align-text-bottom"></span> Web Services Products</asp:LinkButton>
                                </li>
                                <li class="nav-item">
                                    <asp:LinkButton CssClass="nav-link" ID="getAll" runat="server" OnClick="getAllData"><span data-feather="file-text" class="align-text-bottom"></span> ALL Products</asp:LinkButton>
                                </li>
                            </ul>
                        </div>
                    </nav>

                    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                        <div runat="server" id="projects" style="margin: 20px 20px 10px 0">
                            <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false" Text="" />
                            <asp:CheckBox ID="CheckBox2" runat="server" Enabled="false" Text="" />
                            <asp:CheckBox ID="CheckBox3" runat="server" Enabled="false" Text="" />
                            <asp:CheckBox ID="CheckBox4" runat="server" Enabled="false" Text="" />
                        </div>
                        <asp:Button ID="SearchForProjects" runat="server" CssClass="btn btn-secondary" Text="Search" OnClick="SearchForProjects_Click" />
                        <h2>
                            <span id="testN" runat="server"></span> Products
                        </h2>
                        <p id="yazdir" runat="server"></p>
                        <div id="addItems" runat="server"></div>
                    </main>
                </div>
            </div>

            <script src="../MyScripts/bootstrap.bundle.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
            <script src="../MyScripts/dashboard.js"></script>
        </div>
    </form>
</body>
</html>