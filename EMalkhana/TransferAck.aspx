<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="TransferAck.aspx.cs" Inherits="EMalkhana.TransferAck" %>

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
                                    <label class="form-label" for="card-name">FIR નં.</label>
                                    <asp:ListBox OnSelectedIndexChanged="firSelectedIndecChanged" AutoPostBack="true" RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" ID="firNumber" DataTextField="firNoWithYear" DataValueField="firId" runat="server" DataSourceID="dsFirList" CssClass="chkChoice" Width="100%"></asp:ListBox>
                                    <asp:SqlDataSource ID="dsFirList" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_fir_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="0" Name="numId" Type="Int32" />
                                            <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label" for="card-name">મુદ્દામાલ નઁ.</label>
                                    <asp:ListBox RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" SelectionMode="Multiple" ID="mudSelection" runat="server" CssClass="chkChoice" Width="100%"></asp:ListBox>
                                    <asp:SqlDataSource ID="dsMudList" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_mud_Search_list" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                                        <SelectParameters>
                                            <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label runat="server" class="form-label" for="card-name" Text='Acknowledgement Number' />
                                    <asp:TextBox ID="ackNumber" class="form-control" ValidationGroup="a" runat="server" Text='' placeholder='Acknowledgement Number'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="ackNumber" ErrorMessage="દાખલ કરો"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label runat="server" class="form-label" for="card-name" Text="Date" />
                                    <asp:TextBox ID="ackDate" class="form-control" TextMode="Date" ValidationGroup="a" runat="server" Text='' placeholder='Ack Date'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="ackDate" ErrorMessage="Ack Date"></asp:RequiredFieldValidator>
                                </div>
                            </div>
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
