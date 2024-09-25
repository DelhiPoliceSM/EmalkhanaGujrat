<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="Section.aspx.cs" Inherits="EMalkhana.Section" %>

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
    <div class="app-content main-content mt-0">
        <div class="side-app">
            <!-- CONTAINER -->
            <div class="main-container container-fluid">
                <!-- PAGE-HEADER -->
                <div class="page-header">
                    <div>
                        <h1 class="page-title">વિભાગ</h1>
                    </div>
                    <div class="ms-auto pageheader-btn">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">હોમ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">વિભાગ</li>
                        </ol>
                    </div>
                </div>
                <!-- PAGE-HEADER END -->
                <script type="text/javascript" src="../assets/js/jquery1.min.js"></script>
                <link rel="stylesheet" href="../assets/css/select2.min.css" />
                <script type="text/javascript" src="../assets/js/select2.min.js"></script>

                <asp:Panel ID="pnlAdmin" runat="server" class="form-horizontal" Visible="false">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header border-bottom">
                                <h3 class="card-title">અહીં નવો વિભાગ દાખલ કરો</h3>
                            </div>
                            <div class="card-body">
                                <p class="text-muted"></p>
                                <asp:Label ID="numUniqueID" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                                <asp:FormView ID="frmVwAdmin" runat="server" Width="100%" DataKeyNames="id"
                                    DataSourceID="headDetail" OnDataBound="frmVwAdmin_DataBound"
                                    OnItemInserting="frmVwAdmin_ItemInserting"
                                    OnItemUpdating="frmVwAdmin_ItemUpdating" OnPreRender="frmVwAdmin_PreRender">
                                    <EditItemTemplate>
                                        <div class="row col-md-12">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="form-label" for="card-name">Act</label>
                                                    <asp:DropDownList Enabled="false" ID="actId" Text='<%# Bind("id") %>' runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="dsFirType" DataTextField="name" DataValueField="id">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="dsFirType" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_act_search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="numUniqueID" DefaultValue="0"
                                                                Name="numId" PropertyName="Text" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                        <asp:RequiredFieldValidator ValidationGroup="a" SetFocusOnError="true" Font-Bold="true" ForeColor="Red" runat="server" ID="txtNameRequiredField" ErrorMessage="Act નામ દાખલ કરો" ControlToValidate="actId" ></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="form-label" for="card-name">Sections</label>
                                                    <asp:ListBox RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" ID="sections" runat="server" CssClass="chkChoice" Width="100%" SelectionMode="Multiple" />
                                                        <asp:RequiredFieldValidator ValidationGroup="a" SetFocusOnError="true" Font-Bold="true" ForeColor="Red" runat="server" ID="RequiredFieldValidator1" ErrorMessage="Section નામ દાખલ કરો" ControlToValidate="sections" ></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="row col-md-12">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="form-label" for="card-name">Act</label>
                                                    <asp:DropDownList ID="actId" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="dsFirType" DataTextField="name" DataValueField="id">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="dsFirType" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_new_act_mapping_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>"></asp:SqlDataSource>
                                                        <asp:RequiredFieldValidator ValidationGroup="a" SetFocusOnError="true" Font-Bold="true" ForeColor="Red" runat="server" ID="txtNameRequiredField" ErrorMessage="Act નામ દાખલ કરો" ControlToValidate="actId" ></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="form-label" for="card-name">Sections</label>
                                                    <asp:ListBox RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" ID="sections" DataTextField="name" DataValueField="id" runat="server" CssClass="chkChoice" SelectionMode="Multiple" Width="100%" DataSourceID="sectionIdDs" AutoPostBack="true" />
                                                    <asp:SqlDataSource ID="sectionIdDs" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_act_section_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="0" Name="numId" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                        <asp:RequiredFieldValidator ValidationGroup="a" SetFocusOnError="true" Font-Bold="true" ForeColor="Red" runat="server" ID="RequiredFieldValidator1" ErrorMessage="Section નામ દાખલ કરો" ControlToValidate="sections" ></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="સબમિટ કરો" OnClick="btnSubmit_Click" ValidationGroup="a" />
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btnCancel_Click"
                                    CausesValidation="False" />

                                <asp:SqlDataSource ID="headDetail" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>"
                                    SelectCommand="sp_act_search" SelectCommandType="StoredProcedure" ProviderName="MySql.Data.MySqlClient">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="numUniqueID" DefaultValue="0"
                                            Name="numId" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <div class="row">
                    <div class="col-12 col-sm-12">
                        <div class="card product-sales-main">
                            <div class="card-header border-bottom">
                                <div style="width: 90%">
                                    <h3 class="card-title mb-0">વિભાગ યાદી</h3>
                                </div>
                                <div>
                                    <asp:Button runat="server" CssClass="btn btn-primary" Text="નવો વિભાગ બનાવો" OnClick="btnAddNew_Click"></asp:Button>
                                </div>
                            </div>
                            <div class="card-body">

                                <asp:ListView ID="lstView" runat="server" DataKeyNames="id" DataSourceID="headView"
                                    EnableModelValidation="True" OnItemCommand="lstVwAdmin_ItemCommand">
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <div>
                                            મંજૂરી માટે રાહ જોઈ રહ્યું છે.
                                        </div>
                                    </EmptyDataTemplate>
                                    <InsertItemTemplate>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="numRoleId" runat="server" Text='<%# Eval("id") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="txtName" runat="server" Text='<%# Eval("name") %>' /></td>
                                            <td>
                                                <div class="d-flex align-items-stretch">
                                                    <asp:ImageButton ID="btnEdit" runat="server" CommandArgument='<%# Eval("id") %>'
                                                        CommandName="EDITRECORD" ImageUrl="assets/images/action-edit.png" />
                                                    <asp:ConfirmButtonExtender ID="btnEdit_ConfirmButtonExtender" runat="server" ConfirmText="શું તમે આ રેકોર્ડમાં ફેરફાર કરવા માંગો છો?"
                                                        Enabled="True" TargetControlID="btnEdit"></asp:ConfirmButtonExtender>
                                                    <asp:ImageButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("id") %>'
                                                        CommandName="DELETERECORD" ImageUrl="assets/images/action-remove.png" />
                                                    <asp:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server" ConfirmText="શું તમે આ રેકોર્ડ દૂર કરવા માંગો છો?"
                                                        Enabled="True" TargetControlID="btnDelete"></asp:ConfirmButtonExtender>
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <div class="table-responsive">
                                            <table id="data-table" class="table text-nowrap mb-0 table-bordered">
                                                <thead class="table-head">
                                                    <tr>
                                                        <th class="bg-transparent border-bottom-0 wp-15">ID</th>
                                                        <th class="bg-transparent border-bottom-0">વિભાગનું નામ</th>
                                                        <th class="bg-transparent border-bottom-0 no-btn">ક્રિયા</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="table-body">
                                                    <div runat="server" id="itemPlaceholder">
                                                    </div>
                                                </tbody>
                                            </table>
                                        </div>
                                    </LayoutTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                    <!-- COL END -->

                    <asp:SqlDataSource ID="headView" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_act_mapping_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="numId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            selectlistBox();
        });
        function selectlistBox() {
            $('[id*=sections]').select2({
                placeholder: "Search a section",
                allowClear: true
            });
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
