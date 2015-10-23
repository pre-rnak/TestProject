<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   <div id="myfirstchart" style="height: 500px; width:500px;"></div>
    </form>
</body>
</html>
<script type="text/javascript">
   
    $(function () {
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: 'Default4.aspx/GetChartData',
            data: '{}',
            dataType: "json",
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

        var _chart = new Morris.Bar({
            element: 'myfirstchart',
            data: dataValues,
            xkey: ('Countryname'),
            // xLabelMargin: 10,
            xLabelAngle: 45,
            ykeys: ['Total','count','rates'],
//zkeys:['count'],
            labels: ['Count', 'Total','rates'],
            //}).on('click', function(i, row){
            //    console.log(i, row);
            });
       

    }

  
    </script>
