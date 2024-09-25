<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="FirSearch.aspx.cs" Inherits="EMalkhana.FirSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- JQUERY JS -->
    <script src="../assets/js/jquery.min.js"></script>

    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap-Date Range Picker js-->
    <script src="assets/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    <script src="assets\js\formelementadvnced.js"></script>
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
                        <h1 class="page-title">કેસ/મુદ્દામાલ/પાવતી નંબર દ્વારા શોધો</h1>
                    </div>
                    <div class="ms-auto pageheader-btn">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">હોમ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">કેસ/મુદ્દામાલ/પાવતી નંબર દ્વારા શોધો</li>
                        </ol>
                    </div>
                </div>
                <!-- PAGE-HEADER END -->
                <div id="divMultipleQR" runat="server">
                </div>
                <asp:Panel ID="Panel2" runat="server" class="form-horizontal" Visible="False">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header border-bottom">
                                <h3 class="card-title">QR CODE</h3>
                            </div>
                            <div class="card-body">
                                <p class="text-muted"></p>
                                <div class="row">
                                    <asp:Label ID="numPrintId" name="numPrintId" runat="server" Style="display: none"></asp:Label>
                                    <div class="col-md-12" id="printQRCode" align="center">
                                        <asp:Image ID="qrCodeImg" Height="200px" Width="200px" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="offset-4 col-md-2">
                                        <asp:Button ID="Print" Width="100%" runat="server" Text="Print" CssClass="btn btn-success" OnClientClick="printDiv()" CausesValidation="False" />
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="Button4" Width="100%" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btnCancel_Click_qr" CausesValidation="False" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <!-- PAGE-HEADER END -->
                <div class="row">
                    <div class="col-12 col-sm-12">
                        <div class="card product-sales-main">
                            <div class="card-header border-bottom">
                                <span id="spanVehicleData" runat="server" style="display: none;">
                                    <asp:TextBox ID="txtVehicleData" runat="server"></asp:TextBox>
                                </span>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label" for="card-name">કેસ/મુદ્દામાલ/પાવતી</label>
                                        <asp:DropDownList ID="searchType" AutoPostBack="true" OnSelectedIndexChanged="searchType_CheckedChanged" runat="server" AppendDataBoundItems="True" CssClass="form-control">
                                            <asp:ListItem Value="0" Text="કેસ"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="મુદ્દામાલ"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="પાવતી"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label" for="card-name">નંબર અહીં દાખલ કરો:</label>
                                        <asp:ListBox RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" SelectionMode="Single" ID="firNumber" DataTextField="firNoWithYear" DataValueField="firNoWithYear" runat="server" DataSourceID="dsFirList" CssClass="chkChoice" Width="100%" />
                                        <asp:SqlDataSource ID="dsFirList" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_fir_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="0" Name="numId" Type="Int32" />
                                                <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:ListBox Visible="false" RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" SelectionMode="Single" ID="receiptNumber" DataTextField="receiptNo" DataValueField="receiptNo" runat="server" DataSourceID="dsReceiptList" CssClass="chkChoice" Width="100%" />
                                        <asp:SqlDataSource ID="dsReceiptList" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_distinct_receipt_search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                                            <SelectParameters>
                                                <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:TextBox Visible="false" CssClass="form-fieldset" ID="rcNum" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="regex" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="rcNum" ErrorMessage="કૃપા કરીને આરસી નંબર દાખલ કરો"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <asp:Button CssClass="btn btn-primary" ID="btnSearch" OnClick="btnSearch_Click" runat="server" Text="હવે શોધો" />
                                </div>
                                <!-- input-group -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Button runat="server" ID="bulkPrint" CssClass="btn btn-primary" Text="પસંદ કરેલ Mudh QR છાપો" OnClick="bulkPrint_Click"></asp:Button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-12">
                                <div class="card product-sales-main">
                                    <div class="card-header border-bottom">
                                        <div style="width: 90%">
                                            <h3 class="card-title mb-0">કેસ/મુદ્દામાલ/પાવતી નંબર દ્વારા શોધો</h3>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <asp:ListView ID="lstView" runat="server" DataKeyNames="id"
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
                                                        <asp:CheckBox ID="checkbox" runat="server" /></td>
                                                    <td class="text-muted fs-14 fw-semibold">
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Container.DataItemIndex + 1 %>' /></td>
                                                    <td class="text-muted fs-14 fw-semibold">
                                                        <asp:Label ID="numRoleId" runat="server" Text='<%# Eval("id") %>' /></td>
                                                    <td class="text-muted fs-14 fw-semibold">
                                                        <asp:Label ID="numMudNumber" runat="server" Text='<%# Eval("mudNo") %>' /></td>
                                                    <td class="text-muted fs-14 fw-semibold">
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("firNo") %>' /></td>
                                                    <td class="text-muted fs-14 fw-semibold">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("receiptNo") %>' /></td>
                                                    <td>
                                                        <div class="d-flex align-items-stretch">
                                                            <asp:ImageButton ID="btnEdit" ToolTip="Edit Mud Details" Height="25px" Width="25px" runat="server" CommandArgument='<%# Eval("MudNo") %>'
                                                                CommandName="EDITRECORD" ImageUrl="assets/images/action-edit.png" />
                                                            <asp:ImageButton ID="btnView" ToolTip="View Mud Details" Height="25px" Width="25px" runat="server" CommandArgument='<%# Eval("mudNo") %>'
                                                                CommandName="VIEWRECORD" ImageUrl="assets/images/action_view.png" />
                                                        </div>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <div class="table-responsive">
                                                    <table id="data-table" class="table text-nowrap mb-0 table-bordered">
                                                        <thead class="table-head">
                                                            <tr>
                                                                <th class="bg-transparent border-bottom-0 wp-15"></th>
                                                                <th class="bg-transparent border-bottom-0 wp-15">S. No.</th>
                                                                <th class="bg-transparent border-bottom-0 wp-15">ID</th>
                                                                <th class="bg-transparent border-bottom-0">મુદ્દા માલ નંબર</th>
                                                                <th class="bg-transparent border-bottom-0">કેસ નંબર</th>
                                                                <th class="bg-transparent border-bottom-0 no-btn">મુદ્દામાલ પાવતી નઁ.</th>
                                                                <th class="bg-transparent border-bottom-0 no-btn">Action</th>
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
                        </div>
                    </div>
                </div>
                <script>
                    $(function () {
                        selectlistBox();
                    });
                    function selectlistBox() {
                        $('[id*=firNumber]').select2({
                            placeholder: "Search a FIR",
                            allowClear: true
                        });
                        $('[id*=receiptNumber]').select2({
                            placeholder: "Search Receipt",
                            allowClear: true
                        });
                        $('[id*=mudNumber]').select2({
                            placeholder: "Search MUD",
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
                <script language="javascript">
                    function printDiv() {
                        var printContents = document.getElementById("printQRCode").innerHTML;
                        var originalContents = document.body.innerHTML;
                        var numUniqueID = document.getElementsByName("numPrintId")[0].innerHTML;

                        document.body.innerHTML = "<div style=\"text-align:center;width:;height:\"><div style=\"text-align:center\"><b>ગુજરાત પોલીસ</b></div><br/><div style=\"text-align:center;\">" + printContents + " <br/></div><div style=\"text-align:center\">બહુવિધ મુદ્દા માલ નંબર </div></div>";

                        var WinPrint = window.open('', '', 'left=0,top=0,width=1000,height=600,toolbar=0,scrollbars=0,status=0');
                        WinPrint.document.write(document.body.innerHTML);
                        WinPrint.document.close();
                        WinPrint.focus();
                        WinPrint.print();
                        WinPrint.close();

                        document.body.innerHTML = originalContents;
                    }
                    function printDivBulk() {
                        var printContents = document.getElementById("bodyHolder_divMultipleQR").innerHTML;
                        var originalContents = document.body.innerHTML;

                        document.body.innerHTML = printContents;

                        var WinPrint = window.open('', '', 'left=0,top=0,width=1000,height=600,toolbar=0,scrollbars=0,status=0');
                        WinPrint.document.write(printContents);
                        WinPrint.document.close();
                        WinPrint.focus();
                        WinPrint.print();
                        WinPrint.close();

                        document.body.innerHTML = originalContents;
                        document.getElementById("bodyHolder_divMultipleQR").innerHTML = "";
                    }
                </script>
</asp:Content>
