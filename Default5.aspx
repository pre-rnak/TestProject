<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default5.aspx.cs" Inherits="Default5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

      <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<body>
    <form id="form1" runat="server">
   
     <div id="graph" style="height: 500px; width:500px;"></div>
  
    </form>
</body>
</html>
<script>


    $(function () {
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: 'Default5.aspx/GetChartData',
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

        Morris.Line({
            element: 'graph',
            data: dataValues,
            xkey: ('Total'),
          
            xLabelAngle: 45,
            ykeys: ['count', 'rates'],
          
            labels: ['Total', 'rates'],
           
        });


    }
    //var week_data = [
    //  {"period": "2011 W27", "licensed": 3407, "sorned": 660},
    //  {"period": "2011 W26", "licensed": 3351, "sorned": 629},
    //  {"period": "2011 W25", "licensed": 3269, "sorned": 618},
    //  {"period": "2011 W24", "licensed": 3246, "sorned": 661},
    //  {"period": "2011 W23", "licensed": 3257, "sorned": 667},
    //  {"period": "2011 W22", "licensed": 3248, "sorned": 627},
    //  {"period": "2011 W21", "licensed": 3171, "sorned": 660},
    //  {"period": "2011 W20", "licensed": 3171, "sorned": 676},
    //  {"period": "2011 W19", "licensed": 3201, "sorned": 656},
    //  {"period": "2011 W18", "licensed": 3215, "sorned": 622},
    //  {"period": "2011 W17", "licensed": 3148, "sorned": 632},
    //  {"period": "2011 W16", "licensed": 3155, "sorned": 681},
    //  {"period": "2011 W15", "licensed": 3190, "sorned": 667},
    //  {"period": "2011 W14", "licensed": 3226, "sorned": 620},
    //  {"period": "2011 W13", "licensed": 3245, "sorned": null},
    //  {"period": "2011 W12", "licensed": 3289, "sorned": null},
    //  {"period": "2011 W11", "licensed": 3263, "sorned": null},
    //  {"period": "2011 W10", "licensed": 3189, "sorned": null},
    //  {"period": "2011 W09", "licensed": 3079, "sorned": null},
    //  {"period": "2011 W08", "licensed": 3085, "sorned": null},
    //  {"period": "2011 W07", "licensed": 3055, "sorned": null},
    //  {"period": "2011 W06", "licensed": 3063, "sorned": null},
    //  {"period": "2011 W05", "licensed": 2943, "sorned": null},
    //  {"period": "2011 W04", "licensed": 2806, "sorned": null},
    //  {"period": "2011 W03", "licensed": 2674, "sorned": null},
    //  {"period": "2011 W02", "licensed": 1702, "sorned": null},
    //  {"period": "2011 W01", "licensed": 1732, "sorned": null}
    //];
    //Morris.Line({
    //  element: 'graph',
    //  data: week_data,
    //  xkey: 'period',
    //  ykeys: ['licensed', 'sorned'],
    //  labels: ['Licensed', 'SORN']
    //});
</script>