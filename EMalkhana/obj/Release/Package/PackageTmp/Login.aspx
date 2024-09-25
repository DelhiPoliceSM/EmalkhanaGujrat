<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SMartMonitoringTool.Login1" %>

<!DOCTYPE html>
<html dir="ltr">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta
        name="keywords"
        content="Shaanu Computers, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, admin pro admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, " />
    <meta
        name="description"
        content="Smart Monitoring Tool" />
    <meta name="robots" content="noindex,nofollow" />
    <title>E Malkhana 2.0</title>
    <link
        rel="canonical"
        href="https://www.shaanucomputers.com/templates/ampleadmin/" />
    <!-- Favicon icon -->
    <link
        rel="icon"
        type="image/png"
        sizes="16x16"
        href="assets/images/brand/favicon.ico" />
    <!-- Custom CSS -->
    <link href="assets/css/login.css" rel="stylesheet" />
</head>

<body>
    <div class="main-wrapper">
        <!-- -------------------------------------------------------------- -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- -------------------------------------------------------------- -->
        <div class="preloader">
            <svg
                class="tea lds-ripple"
                width="37"
                height="48"
                viewbox="0 0 37 48"
                fill="none"
                xmlns="http://www.w3.org/2000/svg">
                <path
                    d="M27.0819 17H3.02508C1.91076 17 1.01376 17.9059 1.0485 19.0197C1.15761 22.5177 1.49703 29.7374 2.5 34C4.07125 40.6778 7.18553 44.8868 8.44856 46.3845C8.79051 46.79 9.29799 47 9.82843 47H20.0218C20.639 47 21.2193 46.7159 21.5659 46.2052C22.6765 44.5687 25.2312 40.4282 27.5 34C28.9757 29.8188 29.084 22.4043 29.0441 18.9156C29.0319 17.8436 28.1539 17 27.0819 17Z"
                    stroke="#2962FF"
                    stroke-width="2">
                </path>
                <path
                    d="M29 23.5C29 23.5 34.5 20.5 35.5 25.4999C36.0986 28.4926 34.2033 31.5383 32 32.8713C29.4555 34.4108 28 34 28 34"
                    stroke="#2962FF"
                    stroke-width="2">
                </path>
                <path
                    id="teabag"
                    fill="#2962FF"
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M16 25V17H14V25H12C10.3431 25 9 26.3431 9 28V34C9 35.6569 10.3431 37 12 37H18C19.6569 37 21 35.6569 21 34V28C21 26.3431 19.6569 25 18 25H16ZM11 28C11 27.4477 11.4477 27 12 27H18C18.5523 27 19 27.4477 19 28V34C19 34.5523 18.5523 35 18 35H12C11.4477 35 11 34.5523 11 34V28Z">
                </path>
                <path
                    id="steamL"
                    d="M17 1C17 1 17 4.5 14 6.5C11 8.5 11 12 11 12"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke="#2962FF">
                </path>
                <path
                    id="steamR"
                    d="M21 6C21 6 21 8.22727 19 9.5C17 10.7727 17 13 17 13"
                    stroke="#2962FF"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round">
                </path>
            </svg>
        </div>
        <!-- -------------------------------------------------------------- -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- -------------------------------------------------------------- -->
        <!-- -------------------------------------------------------------- -->
        <!-- Login box.scss -->
        <!-- -------------------------------------------------------------- -->
        <div class="row auth-wrapper gx-0">
            <div class="col-lg-4 col-xl-3 bg-info auth-box-2 on-sidebar" style="background-color: bisque">
                <div class="h-100 d-flex align-items-center justify-content-center">
                    <div class="row justify-content-center text-center">
                        <div class="col-md-7 col-lg-12 col-xl-9">
                            <div>
                                <span class="db">
                                    <img
                                        src="assets/images/brand/logo.png"
                                        alt="logo"
                                        width="92%" /></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div
                class="
            col-lg-8 col-xl-9
            d-flex
            align-items-center
            justify-content-center
          ">
                <div class="row justify-content-center w-100 mt-4 mt-lg-0">
                    <div class="col-md-7">
                        <div class="card" id="registerform">
                            <div class="card-body">
                                <h2>સાઇન અપ ફોર્મ</h2>
                                <p class="text-muted fs-4">
                                    નવા ખાતા માટે આપેલ વિગતો દાખલ કરો
                                </p>

                            </div>
                        </div>
                        <div class="card" id="loginform">
                            <div class="card-body">
                                <h2>E Malkhana 2.0</h2>

                                <form id="frm" runat="server"
                                    class="form-horizontal mt-4 pt-4 needs-validation">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" type="text" class="form-control form-input-bg" ID="tbEmail" placeholder="9876543210" ValidationGroup="login" />
                                        <label for="tb-email">Phone Number</label>
                                        <div class="invalid-feedback" style="display:block">
                                            <asp:RequiredFieldValidator ID="re" SetFocusOnError="true" ValidationGroup="login" ControlToValidate="tbEmail" runat="server" ErrorMessage="Phone Number is Required"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" type="password" class="form-control form-input-bg" ID="textPassword" ValidationGroup="login" placeholder="*****" />
                                        <label for="text-password">Password</label>
                                        <div class="invalid-feedback" style="display:block">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" ValidationGroup="login" ControlToValidate="textPassword" runat="server" ErrorMessage="Password is Required"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="d-flex align-items-center mb-3">
                                        <div class="form-check">
                                            <asp:Label class="form-check-label" Visible="false" for="r-me1" style="color:red" runat="server" Text="Username / Password is incorrect." ID="lblErrorMessage" ></asp:Label>
                                        </div>
                                        <div class="ms-auto">
                                            <a
                                                href="javascript:void(0)"
                                                id="to-recover"
                                                class="fw-bold">Forgot Password?</a>
                                        </div>
                                    </div>
                                    <div
                                        class="d-flex align-items-stretch button-group mt-4 pt-2">
                                        <asp:Button ID="btnSubmit" ValidationGroup="login" runat="server" OnClick="btnSubmit_Click" Style="background-color: bisque; color: black" class="btn btn-info btn-lg px-4" Text="Sign In"></asp:Button>

                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="card" id="recoverform">
                            <div class="card-body">
                                <div class="logo">
                                    <h3>પાસવર્ડ પુનઃપ્રાપ્ત</h3>
                                    <p class="text-muted fs-4">
                                        તમારો ફોન નંબર દાખલ કરો અને સૂચનાઓ તમને મોકલવામાં આવશે!
                                    </p>
                                </div>
                                <div class="mt-4 pt-4">
                                    <!-- Form -->
                                    <form action="index.html">
                                        <!-- email -->
                                        <div class="mb-4 pb-2">
                                            <div class="form-floating">
                                                <input
                                                    class="form-control form-input-bg"
                                                    type="email"
                                                    required=""
                                                    placeholder="Email address" />
                                                <label for="tb-email">Phone Number</label>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-stretch button-group">
                                            <button type="submit" class="btn btn-info btn-lg px-4" Style="background-color: bisque; color: black">
                                                Submit
                                            </button>
                                            <a href="javascript:void(0)" id="to-login" class="btn btn-lg btn-light-secondary text-secondary font-weight-medium">Cancel</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- -------------------------------------------------------------- -->
        <!-- Login box.scss -->
        <!-- -------------------------------------------------------------- -->
    </div>
    <!-- -------------------------------------------------------------- -->
    <!-- All Required js -->
    <!-- -------------------------------------------------------------- -->
    <script src="assets/js/login.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/js/login2.js"></script>
    <script>
        $(".preloader").fadeOut();
        // ---------------------------
        // Login and પાસવર્ડ પુનઃપ્રાપ્ત
        // ---------------------------
        $("#to-recover").on("click", function () {
            $("#loginform").hide();
            $("#recoverform").fadeIn();
        });

        $("#to-login").on("click", function () {
            $("#loginform").fadeIn();
            $("#recoverform").hide();
        });

        $("#to-register").on("click", function () {
            $("#loginform").hide();
            $("#registerform").fadeIn();
        });

        $("#to-login2").on("click", function () {
            $("#loginform").fadeIn();
            $("#registerform").hide();
        });

      // Example starter JavaScript for disabling form submissions if there are invalid fields

    </script>
</body>
</html>


