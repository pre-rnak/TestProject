<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>jQuery Google Pie Chart Example in asp.net</title>
    <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="http://www.google.com/jsapi" type="text/javascript"></script>
    <script type="text/javascript">
        // Global variable to hold data
        google.load('visualization', '1', { packages: ['corechart'] });
    </script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'Default.aspx/GetChartData',
                data: '{}',
                success:
                    function (response) {
                        debugger;
                        drawchart(response.d);
                    },

                error: function () {
                    alert("Error loading data! Please try again.");
                }
            });
        })
        function drawchart(dataValues) {
            debugger;
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Column Name');
            data.addColumn('number', 'Column Value');
            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].Countryname, dataValues[i].Total]);
            }
            new google.visualization.PieChart(document.getElementById('chartdiv')).
                draw(data, { title: "Show Google Chart in Asp.net" });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="chartdiv" style="width: 600px; height: 350px;">
    </div>
    </form>
</body>
</html>