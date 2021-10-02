/*
   Licensed to the Apache Software Foundation (ASF) under one or more
   contributor license agreements.  See the NOTICE file distributed with
   this work for additional information regarding copyright ownership.
   The ASF licenses this file to You under the Apache License, Version 2.0
   (the "License"); you may not use this file except in compliance with
   the License.  You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/
var showControllersOnly = false;
var seriesFilter = "";
var filtersOnlySampleSeries = true;

/*
 * Populates the table identified by id parameter with the specified data and
 * format
 *
 */
function createTable(table, info, formatter, defaultSorts, seriesIndex) {
    var tableRef = table[0];

    // Create header and populate it with data.titles array
    var header = tableRef.createTHead();
    var newRow = header.insertRow(-1);
    for (var index = 0; index < info.titles.length; index++) {
        var cell = document.createElement('th');
        cell.innerHTML = info.titles[index];
        newRow.appendChild(cell);
    }

    var tBody;

    // Create overall body if defined
    if(info.overall){
        tBody = document.createElement('tbody');
        tBody.className = "tablesorter-no-sort";
        tableRef.appendChild(tBody);
        var newRow = tBody.insertRow(-1);
        var data = info.overall.data;
        for(var index=0;index < data.length; index++){
            var cell = newRow.insertCell(-1);
            cell.innerHTML = formatter ? formatter(index, data[index]): data[index];
        }
    }

    // Create regular body
    tBody = document.createElement('tbody');
    tableRef.appendChild(tBody);

    var regexp;
    if(seriesFilter)
        regexp = new RegExp(seriesFilter, 'i');

    // Populate body with data.items array
    for(var index=0; index < info.items.length; index++){
        var item = info.items[index];
        if((!regexp || filtersOnlySampleSeries && !info.supportsControllersDiscrimination || regexp.test(item.data[seriesIndex]))
                &&
                (!showControllersOnly || !info.supportsControllersDiscrimination || item.isController)){
            if(item.data.length > 0) {
                var newRow = tBody.insertRow(-1);
                for(var col=0; col < item.data.length; col++){
                    var cell = newRow.insertCell(-1);
                    cell.innerHTML = formatter ? formatter(col, item.data[col]) : item.data[col];
                }
            }
        }
    }

    // Add support of columns sort
    table.tablesorter({sortList : defaultSorts});
}

$(document).ready(function() {

    // Customize table sorter default options
    $.extend( $.tablesorter.defaults, {
        theme: 'blue',
        cssInfoBlock: "tablesorter-no-sort",
        widthFixed: true,
        widgets: ['zebra']
    });

    var data = {"OkPercent": 100.0, "KoPercent": 0.0};
    var dataset = [
        {
            "label" : "KO",
            "data" : data.KoPercent,
			"color" : "#FF6347"
        },
        {
            "label" : "OK",
            "data" : data.OkPercent,
            "color" : "#9ACD32"
        }];
    $.plot($("#flot-requests-summary"), dataset, {
        series : {
            pie : {
                show : true,
                radius : 1,
                label : {
                    show : true,
                    radius : 3 / 4,
                    formatter : function(label, series) {
                        return '<div style="font-size:8pt;text-align:center;padding:2px;color:white;">'
                            + label
                            + '<br/>'
                            + Math.round10(series.percent, -2)
                            + '%</div>';
                    },
                    background : {
                        opacity : 0.5,
                        color : '#000'
                    }
                }
            }
        },
        legend : {
            show : true
        }
    });

    // Creates APDEX table
    createTable($("#apdexTable"), {"supportsControllersDiscrimination": true, "overall": {"data": [0.4790307548928239, 500, 1500, "Total"], "isController": false}, "titles": ["Apdex", "T (Toleration threshold)  ", "F (Frustration threshold)", "Label"], "items": [{"data": [0.7032258064516129, 500, 1500, "Homepage"], "isController": true}, {"data": [0.49333333333333335, 500, 1500, "MyCart"], "isController": true}, {"data": [0.012987012987012988, 500, 1500, "CreateProduct"], "isController": true}, {"data": [1.0, 500, 1500, "-- Executing TC001  -- Keywords: Homepage;Login_dashboard;ProductList;Logout"], "isController": false}, {"data": [1.0, 500, 1500, "-- Executing TC003  -- Keywords: Homepage;Login_dashboard;ProductList;Add_Item;MyCart;BuyNow_Product;ContinueBuy;Logout"], "isController": false}, {"data": [0.10333333333333333, 500, 1500, "Add_Item"], "isController": true}, {"data": [0.4032258064516129, 500, 1500, "Login_dashboard"], "isController": true}, {"data": [1.0, 500, 1500, "-- Executing TC004  -- Keywords: Homepage;Login_dashboard;CreateProduct;EditProduct;Logout"], "isController": false}, {"data": [0.28354978354978355, 500, 1500, "ProductList"], "isController": true}, {"data": [1.0, 500, 1500, "-- Executing TC002  -- Keywords: Homepage;Login_dashboard;ProductList;Add_Item;User_Shop;MyCart;Logout"], "isController": false}, {"data": [0.08441558441558442, 500, 1500, "EditProduct"], "isController": true}, {"data": [0.24342105263157895, 500, 1500, "BuyNow_Product"], "isController": true}, {"data": [0.08783783783783784, 500, 1500, "User_Shop"], "isController": true}, {"data": [0.5475409836065573, 500, 1500, "Logout"], "isController": true}, {"data": [0.26973684210526316, 500, 1500, "ContinueBuy"], "isController": true}]}, function(index, item){
        switch(index){
            case 0:
                item = item.toFixed(3);
                break;
            case 1:
            case 2:
                item = formatDuration(item);
                break;
        }
        return item;
    }, [[0, 0]], 3);

    // Create statistics table
    createTable($("#statisticsTable"), {"supportsControllersDiscrimination": true, "overall": {"data": ["Total", 310, 0, 0.0, 0.012903225806451615, 0.0, 0.0, 1.0, 2.825270679158616, 0.0, 0.0, 0, 1], "isController": false}, "titles": ["Label", "#Samples", "KO", "Error %", "Average response time", "90th pct", "95th pct", "99th pct", "Throughput", "Received KB/sec", "Sent KB/sec", "Min", "Max"], "items": [{"data": ["Homepage", 310, 91, 29.35483870967742, 34.11935483870965, 39.0, 50.44999999999999, 199.77999999999997, 2.824755795305438, 49.33145369849377, 2.3570212978613867, 12, 1601], "isController": true}, {"data": ["MyCart", 150, 76, 50.666666666666664, 42.62666666666667, 62.0, 72.34999999999997, 229.25000000000023, 1.4240416199897468, 35.888861932638086, 1.6112252157423055, 17, 242], "isController": true}, {"data": ["CreateProduct", 77, 75, 97.40259740259741, 332.9870129870129, 480.20000000000005, 522.2, 798.0, 0.7369761009178702, 169.74632349422384, 4.614138874532212, 137, 798], "isController": true}, {"data": ["-- Executing TC001  -- Keywords: Homepage;Login_dashboard;ProductList;Logout", 78, 0, 0.0, 0.012820512820512822, 0.0, 0.0, 1.0, 0.7127909420720284, 0.0, 0.0, 0, 1], "isController": false}, {"data": ["-- Executing TC003  -- Keywords: Homepage;Login_dashboard;ProductList;Add_Item;MyCart;BuyNow_Product;ContinueBuy;Logout", 77, 0, 0.0, 0.012987012987012988, 0.0, 0.0, 1.0, 0.7356453616126876, 0.0, 0.0, 0, 1], "isController": false}, {"data": ["Add_Item", 150, 126, 84.0, 554.5666666666674, 798.2, 881.3499999999999, 1016.2900000000002, 1.4154815940210057, 489.51641435215765, 13.206102303342423, 266, 1027], "isController": true}, {"data": ["Login_dashboard", 310, 185, 59.67741935483871, 112.3354838709677, 165.90000000000003, 210.79999999999995, 299.55999999999995, 2.8687766055894874, 149.35842934480843, 10.16295562071997, 51, 319], "isController": true}, {"data": ["-- Executing TC004  -- Keywords: Homepage;Login_dashboard;CreateProduct;EditProduct;Logout", 77, 0, 0.0, 0.025974025974025976, 0.0, 0.0, 1.0, 0.7380073800738007, 0.0, 0.0, 0, 1], "isController": false}, {"data": ["ProductList", 231, 163, 70.56277056277057, 229.81385281385286, 354.8000000000001, 414.79999999999995, 540.6800000000001, 2.1454444134856505, 380.17313282193277, 7.192876671774868, 98, 541], "isController": true}, {"data": ["-- Executing TC002  -- Keywords: Homepage;Login_dashboard;ProductList;Add_Item;User_Shop;MyCart;Logout", 78, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7252508159071679, 0.0, 0.0, 0, 0], "isController": false}, {"data": ["EditProduct", 77, 69, 89.6103896103896, 326.181818181818, 511.4000000000001, 620.2, 762.0, 0.7393040940164375, 168.56364938683367, 4.555260130626392, 138, 762], "isController": true}, {"data": ["BuyNow_Product", 76, 57, 75.0, 255.80263157894746, 404.6, 435.15, 576.0, 0.7257794967292174, 146.58492694456382, 3.5781738677601105, 121, 576], "isController": true}, {"data": ["User_Shop", 74, 63, 85.13513513513513, 714.9324324324326, 960.0, 1167.0, 1428.0, 0.7040913415794481, 383.7110118339677, 7.852621759039011, 372, 1428], "isController": true}, {"data": ["Logout", 305, 138, 45.24590163934426, 55.85573770491799, 74.40000000000003, 95.09999999999997, 240.82, 2.834994051160024, 87.41766607952856, 6.190121280232191, 23, 254], "isController": true}, {"data": ["ContinueBuy", 76, 55, 72.36842105263158, 227.23684210526324, 354.4, 400.0, 516.0, 0.7264177092991024, 132.92940971691215, 2.44211097523967, 106, 516], "isController": true}]}, function(index, item){
        switch(index){
            // Errors pct
            case 3:
                item = item.toFixed(2) + '%';
                break;
            // Mean
            case 4:
            // Percentile 1
            case 5:
            // Percentile 2
            case 6:
            // Percentile 3
            case 7:
            // Throughput
            case 8:
            // Kbytes/s
            case 9:
            // Sent Kbytes/s
            case 10:
                item = item.toFixed(2);
                break;
        }
        return item;
    }, [[0, 0]], 0);
    
    // Create error table
    createTable($("#errorsTable"), {"supportsControllersDiscrimination": false, "titles": ["Type of error", "Number of errors", "% in errors", "% in all samples"], "items": []}, function(index, item){
        switch(index){
            case 2:
            case 3:
                item = item.toFixed(2) + '%';
                break;
        }
        return item;
    }, [[1, 1]]);
    
        // Create top5 errors by sampler
    createTable($("#top5ErrorsBySamplerTable"), {"supportsControllersDiscrimination": true, "overall": {"data": ["Total", 310, 0, null, null, null, null, null, null, null, null, null, null], "isController": false}, "titles": ["Sample", "#Samples", "#Errors", "Error", "#Errors", "Error", "#Errors", "Error", "#Errors", "Error", "#Errors", "Error", "#Errors"], "items": [{"data": [], "isController": true}, {"data": [], "isController": true}, {"data": [], "isController": true}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": true}, {"data": [], "isController": true}, {"data": [], "isController": false}, {"data": [], "isController": true}, {"data": [], "isController": false}, {"data": [], "isController": true}, {"data": [], "isController": true}, {"data": [], "isController": true}, {"data": [], "isController": true}, {"data": [], "isController": true}]}, function(index, item){
        return item;
    }, [[0, 0]], 0);
    
});
