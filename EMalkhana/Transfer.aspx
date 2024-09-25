<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="Transfer.aspx.cs" Inherits="EMalkhana.Transfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .chkChoice input {
            margin-left: -20px;
        }

        .chkChoice td {
            width: 23%;
            padding-left: 10px;
        }

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 300px;
            height: 140px;
        }

        @media print {
            div {
                page-break-before: always;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <script type="text/javascript" src="../assets/js/jquery1.min.js"></script>
    <link rel="stylesheet" href="../assets/css/select2.min.css" />
    <script type="text/javascript" src="../assets/js/select2.min.js"></script>
    <div class="app-content main-content mt-0">
        <div class="side-app">
            <!-- CONTAINER -->
            <div class="main-container container-fluid">
                <!-- PAGE-HEADER -->
                <div class="page-header">
                    <div>
                        <h1 class="page-title">મુદ્દા માલને સ્થાનાંતરિત કરો</h1>
                    </div>
                    <div class="ms-auto pageheader-btn">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">હોમ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">મુદ્દા માલને સ્થાનાંતરિત કરો</li>
                        </ol>
                    </div>
                </div>
                <!-- PAGE-HEADER END -->
                <div class="row">
                    <div class="card card-body pd-20 pd-md-40 border shadow-none">
                        <h4 class="card-title">મુદ્દા માલને સ્થાનાંતરિત કરો</h4>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label" for="card-name">મુદ્દામાલ સ્થાનાંતરણ કચેરી</label>
                                    <asp:DropDownList runat="server" ID="isPresentedInCourt" AppendDataBoundItems="True" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="isPresentedInCourt_CheckedChanged">
                                        <asp:ListItem Text="Court" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="FSL" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label class="form-label" for="card-name" ID="lblPoliceStation" runat="server">કોર્ટનું નામ</asp:Label>
                                    <asp:DropDownList ID="ddlPoliceStation" Visible="false" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="dsPoliceStation" DataTextField="name" DataValueField="id">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsPoliceStation" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM department WHERE isPS = 1"></asp:SqlDataSource>

                                    <asp:DropDownList ID="ddlFSL" Visible="false" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="dsFSL" DataTextField="name" DataValueField="id">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsFSL" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM fsl WHERE isActive = 1"></asp:SqlDataSource>

                                    <asp:DropDownList ID="ddlCourtName" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="dsCourtName" DataTextField="name" DataValueField="id">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsCourtName" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM courtname WHERE isActive = 1"></asp:SqlDataSource>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label" for="card-name">FIR નં.</label>
                                    <asp:ListBox SelectionMode="multiple" RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" ID="firNumber" DataTextField="firNoWithYear" DataValueField="firId" runat="server" DataSourceID="dsFirList" CssClass="chkChoice" Width="100%"></asp:ListBox>
                                    <asp:SqlDataSource ID="dsFirList" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_fir_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="0" Name="numId" Type="Int32" />
                                            <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label" for="card-name">મોકલેલ તારીખ</label>
                                    <asp:TextBox ID="sentOn" class="form-control" ValidationGroup="a" TextMode="Date" runat="server" Text='' placeholder="મોકલેલ પર દાખલ કરો"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="sentOn" ErrorMessage="મોકલેલ પર દાખલ કરો"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label" for="card-name">મુદ્દામાલ લઈ જનારનુ નામ</label>
                                    <asp:TextBox ID="sendingVia" class="form-control" ValidationGroup="a" type="text" runat="server" Text='' placeholder="મુદ્દામાલ લઈ જનારનુ નામ"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="sendingVia" ErrorMessage="કૃપા કરીને ટ્રાન્સફરનું નામ દાખલ કરો"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label" for="card-name">હોદ્દો</label>
                                    <asp:DropDownList ID="ddldesignation" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="dsDesignation" DataTextField="name" DataValueField="id">
                                        <asp:ListItem Text="Select Designation" Value="0" />
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsDesignation" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_designation_search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="0" Name="numId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="a" ControlToValidate="ddldesignation" SetFocusOnError="true" ForeColor="Red" ErrorMessage="કૃપા કરીને Designation પસંદ કરો"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label" for="card-name">બકલ નંબર</label>
                                    <asp:TextBox ID="buckleNumber" class="form-control" ValidationGroup="a" type="text" runat="server" Text='' placeholder="બકલ નંબર"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label" for="card-name">ટ્રાન્સફર ID</label>
                                    <asp:FileUpload type='file' ID="id" runat="server" accept=".png,.jpg,.jpeg,.gif, .pdf" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Button ID="transfer" runat="server" Width="100%" CssClass="btn btn-primary" Text="સબમિટ કરો" OnClick="transferMud" ValidationGroup="a" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            selectlistBox();
            // selectmudlistBox();
        });
        function selectlistBox() {
            $('[id*=firNumber]').select2({
                placeholder: "Search a FIR",
                allowClear: true
            });
            $('[id*=mudSelection]').select2({
                placeholder: "Search a MUD",
                allowClear: true
            });
        }

        function selectmudlistBox() {
        }

        function matchCustom(params, data) {
            // If there are no search terms, return all of the data
            if ($.trim(params.term) === '') {
                return data;
            }

            // Do not display the item if there is no 'text' property
            if (typeof data.text === 'undefined') {
                return null;
            }

            // `params.term` should be the term that is used for searching
            // `data.text` is the text that is displayed for the data object
            console.log(params.term);
            const myArray = params.term.split(" ");
            var counter = 0;
            var modifiedData = $.extend({}, data, true);
            for (const word of myArray) {
                if (data.text.toLowerCase().indexOf(word.toLowerCase()) > -1) {

                }
                else {
                    counter = 1;
                }
            }
            if (counter == 0) {
                return modifiedData;
            }

            // Return `null` if the term should not be displayed
            return null;
        }
    </script>
</asp:Content>
