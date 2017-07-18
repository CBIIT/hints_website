var root = document.domain;


var AllQuestionsSections_ds = [];
var QuestionDetails_ds = [];
var ResponseResults = [];
var Criteria_All = [];
var FK_Question = 0;
var PK_Question = 0;
var CycleBeingDisplayed = 0;


var surveyQuestionData = null;
var chart = null;
var chartToExport = null;
var chartForExportOnly = null;
var fusionChartsFormatter = new fusionChartsFormatter();
var chartType_Bar = "bar2d";
var chartType_Line = "msline";
var chartType_Pie = "pie3d";
var selectedSummaryTypeId = 1;
var selectedSummaryType = 'Estimated Population';
var selectedChartType = "msline";

var startedwithNewQuestion = '0';

$(document).ready(function () {
    //FK_Question = 388;
    $("#DDL_Sections").change(function () {
        Populate_QuestionDDL();
    });

    populateQuestionDisplay();


    //FK_Question = $("#DDL_Questions option:selected").val();
    FK_Question = getQuery('qid');
    PK_Question = FK_Question;





    if (getQuery('nq')) {
        startedwithNewQuestion = 1;
    }
    else {
        startedwithNewQuestion = 0;
    }

    intialize();

    $('#question-trigger').click(function () {
        $('.question-modal').fadeIn();
    });
    $('.close-modal-question').click(function() {
        $('.question-modal').fadeOut();
    });

    $('.chart-options-trigger').click(function () {
        $('.chart-options-container').slideToggle(350);
        $(this).toggleClass('active-chart-options');
    });
    $('.chart-options-container').click(function (event) {
        event.stopPropagation();
    });



});

function GoToNewQuestion() {
    window.location = "question-details.aspx?nq=1&qid=" + $('#DDL_Questions option:selected').val();
}

function Populate_QuestionDDL() {

    $('#DDL_Questions').empty();

    var JQ_DDL_Questions = $('#DDL_Questions');
    var selectedsection = $('#DDL_Sections option:selected').val();
    for (var i = 0; i < AllQuestionsSections_ds.length; i++) {

        //  console.log('counter=' + i + '-question=' + AllQuestionsSections_ds[i].PK_Question + ' ' + AllQuestionsSections_ds[i].FK_Section + ' ' + AllQuestionsSections_ds[i].Question);
        //console.log('counter=' + i);
        //console.log('selectedsection=' + selectedsection);
        //console.log('FK_Section=' + AllQuestionsSections_ds[i].FK_Section);
        if ((selectedsection == AllQuestionsSections_ds[i].FK_Section)) {
            $('<option />', { value: AllQuestionsSections_ds[i].PK_Question, text: AllQuestionsSections_ds[i].Question }).appendTo(JQ_DDL_Questions);
            //console.log('added');
        }
    }

    var exists = 0 != $('#DDL_Questions option[value=' + FK_Question + ']').length;
    if (exists) {
        $("#DDL_Questions").val(FK_Question);
    }

    populateQuestionDisplay();
}


function ChangeCycleClicked(tmpCycleBeingDisplayed) {
    CycleBeingDisplayed = tmpCycleBeingDisplayed;
    SetVis();
    BuildDisplay();

    if (CycleBeingDisplayed == 0) {
        selectedChartType = "msline";
    }
    else {
        selectedChartType = "bar2d";
    }

    populateChartTypeSelector();
    renderChart();
}

// this is for getting the query string
function getQuery(key) {
    var temp = location.search.match(new RegExp(key + "=(.*?)($|\&)", "i"));
    if (!temp) return;
    return temp[1];
}


function SetVis() {
    $('#dv_AllYears').hide();
    $('#charts').hide();
    $('#allcycles_placeholdertext').hide();

    

    $('#div_surveynotes').hide();

    //console.log('CycleBeingDisplayed=' + CycleBeingDisplayed);

    $('#cycle-sidebar input').removeClass('active-year');

    if (CycleBeingDisplayed === 0) {
        $('#btn_AllCycles').addClass('active-year');
        $('#dv_AllYears').show();
        $('#div_surveynotes').hide();
        $('#charts').hide();

        $('#allcycles_placeholdertext').show();
    }
    else {
        $('#BTN_Cycle_' + CycleBeingDisplayed).addClass('active-year');
        $('#dv_AllYears').hide();
        $('#div_surveynotes').show();
        $('#charts').show();
        $('#allcycles_placeholdertext').hide();
    }
}

function intialize() {

    List_All_QuestionsAndSections_jquery(function (ws_data) {
        AllQuestionsSections_ds = ws_data;
        Populate_QuestionDDL();











        Get_Question_AND_Details_By_Question(FK_Question, function (ws_data) {
            QuestionDetails_ds = ws_data;


            List_Criteria_PerQuestion(FK_Question, function (ws_data) {
                Criteria_All = ws_data;
                Get_Responses_Question(FK_Question, function (ws_data) {
                    ResponseResults = ws_data;

                    // check if more than 1 cycle.. if only 1, hide all the "all year" stuff
                    if (QuestionDetails_ds.length === 1) {
                        //console.log('length=' + QuestionDetails_ds);

                        CycleBeingDisplayed = QuestionDetails_ds[0].FK_Cycle;
                        populateChartTypeSelector();
                        selectedChartType = "bar2d";
                        getDataForSurveyQuestion();
                        $('#btn_AllCycles').hide();
                        $('#dv_AllYears').hide();
                        $('#div_surveynotes').show();
                        $('#charts').show();

                        $('#allcycles_placeholdertext').hide();
                    }
                    else {
                        $('#btn_AllCycles').show(); 
                        //console.log('length bigger than 1=' + QuestionDetails_ds);
                        var tempstring = getQuery('PK_Cycle');
                        if (tempstring) {
                            CycleBeingDisplayed = tempstring;
                            selectedChartType = "bar2d";
                        }




                        if (startedwithNewQuestion == 1) {
                            startedwithNewQuestion = 0;
                            for (var i = 0; i < QuestionDetails_ds.length; i++) {
                                //console.log('cycle=' + QuestionDetails_ds[i].FK_Cycle);
                                CycleBeingDisplayed = QuestionDetails_ds[i].FK_Cycle;
                                selectedChartType = "bar2d";
                            }
                        }


                        getDataForSurveyQuestion();
                    }

                    BuildDisplay();
                });


                // above this
            });
        });




        $("#exportModalPopup").on("shown.bs.modal", function () {
            updateExportModal();
        });

        $("#exportModalPopup").on("hidden.bs.modal", function () {
            if (chartToExport) {
                chartToExport.dispose();
            }
        });

        $("#exportToPdfLink").click(function () {
            exportChart("pdf");
        });

        $("#exportToJpegLink").click(function () {
            exportChart("jpeg");
        });

        $("#exportToPngLink").click(function () {
            exportChart("png");
        });

        $("#exportToSvgLink").click(function () {
            exportChart("svg");
        });
    });


}


function Get_Question_AND_Details_By_Question(FK_Question, callback) {
    $.ajax({
        type: "POST",
        url: "//" + root + "/WS_Data/QuestionDataService.asmx/Get_Question_AND_Details_By_Question",
        data: "{'FK_Question':'" + escape(FK_Question) + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            callback($.parseJSON(data.d));
        }, error: function (xhr, status, error) {
            var err = eval("(" + xhr.responseText + ")");
            console.log(err.Message);
        }
    });
}


function Get_Responses_Question(FK_Question, callback) {
    $.ajax({
        type: "POST",
        url: "//" + root + "/WS_Data/QuestionDataService.asmx/Get_Results_PerQuestion",
        data: "{'FK_Question':'" + escape(FK_Question) + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            callback($.parseJSON(data.d));
        }, error: function (xhr, status, error) {
            var err = eval("(" + xhr.responseText + ")");
            console.log(err.Message);
        }
    });
}

function List_Criteria_PerQuestion(FK_Question, callback) {
    $.ajax({
        type: "POST",
        url: "//" + root + "/WS_Data/QuestionDataService.asmx/List_Criteria_PerQuestion",
        data: "{'FK_Question':'" + escape(FK_Question) + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            callback($.parseJSON(data.d));
        }, error: function (xhr, status, error) {
            var err = eval("(" + xhr.responseText + ")");
            console.log(err.Message);
        }
    });
}


function List_All_QuestionsAndSections_jquery(callback) {
    $.ajax({
        type: "POST",
        url: "//" + root + "/WS_Data/QuestionDataService.asmx/List_All_QuestionsAndSections",
        //data: "{'FK_Question':'" + escape(FK_Question) + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            callback($.parseJSON(data.d));
        }, error: function (xhr, status, error) {
            var err = eval("(" + xhr.responseText + ")");
            console.log(err.Message);
        }
    });
}



function BuildDisplay() {
    SetVis();

    $("#tbdy_results").empty();

    //CycleBeingDisplayed = $("#cycleSelector option:selected").val();
    // now it is set on the button click

    for (var i = 0; i < QuestionDetails_ds.length; i++) {

        if ((CycleBeingDisplayed == QuestionDetails_ds[i].FK_Cycle)) {
            //////$("#lbl_question").html(QuestionDetails_ds[i].Question);

            $("#LIT_SurveyNotesText").text(QuestionDetails_ds[i].SurveyNoteText);
            $("#HYP_SurveyNotes").attr("href", "/docs/Instruments/" + QuestionDetails_ds[i].SurveyNoteURL)
            $("#LIT_DataCollectionMethod").text(QuestionDetails_ds[i].DataCollectionMethod_Display);
            $("#LIT_QuestionSource").html(QuestionDetails_ds[i].Source);
            $("#LIT_CycleDisplay").text(QuestionDetails_ds[i].CycleDisplayName);


            //*********** Have to hide if not populated
            if (QuestionDetails_ds[i].Additional_Notes !== null) {
                $("#LIT_Notes").text(QuestionDetails_ds[i].Additional_Notes);
                $('#dv_LIT_Notes_wrapper').show();
            }
            else {
                $('#dv_LIT_Notes_wrapper').hide();
            }


            if ((QuestionDetails_ds[i].ArticleCount >= 0) && (QuestionDetails_ds[i].ArticleCount !== null)) {
           
                $("#HYP_articles_ByQuestion").attr("href", "/articles_by_questionDetails.aspx?ArtType=1&PK_QuestionDetails=" + QuestionDetails_ds[i].PK_QuestionDetails)
                $('#LIT_NoArticles').hide();
                $('#HYP_articles_ByQuestion').show
            }
            else {
                $('#LIT_NoArticles').show
                $('#HYP_articles_ByQuestion').hide();
            }

            if ((QuestionDetails_ds[i].BriefCount >= 0) && (QuestionDetails_ds[i].BriefCount !== null)) {
                $("#HYP_Briefs_ByQuestion").attr("href", "/articles_by_questionDetails.aspx?ArtType=2&PK_QuestionDetails=" + QuestionDetails_ds[i].PK_QuestionDetails)
                $('#LIT_NoBriefs').hide();
                $('#HYP_Briefs_ByQuestion').show
            }
            else {
                $('#LIT_NoBriefs').show
                $('#HYP_Briefs_ByQuestion').hide();
            }



            //*********** Have to hide if not populated
            if (QuestionDetails_ds[i].KnowledgeMap1 !== null) {
                $("#HYP_KnowledgeMap").attr("href", "/knowledge_maps.aspx?qdid=" + QuestionDetails_ds[i].PK_QuestionDetails)

                $('#LIT_NoMap').hide();
                $('#HYP_KnowledgeMap').Show();
            }
            else {

                $('#LIT_NoMap').show();
                $('#HYP_KnowledgeMap').hide();
            }


            $("#LIT_Criteria_DESC").text('');
            var firstflag = 1;


            for (var ii = 0; ii < Criteria_All.length; ii++) {
                if (Criteria_All[ii].FK_QuestionDetails === QuestionDetails_ds[i].PK_QuestionDetails) {
                    if (firstflag === 1) {
                        firstflag = 0;
                        $("#LIT_Criteria_DESC").append(Criteria_All[ii].Criteria_DESC);
                    }
                    else {
                        $("#LIT_Criteria_DESC").append(', ' + Criteria_All[ii].Criteria_DESC);
                    }
                }
            }
        }
    }


    var totalresponses = 0;
    var newRowContent = '';
    for (var i = 0; i < ResponseResults.length; i++) {


        ////console.log("CycleBeingDisplayed=" + CycleBeingDisplayed);
        ////console.log("FK_Cycle=" + ResponseResults[i].FK_Cycle);
        ////console.log("FK_Question_variable=" + FK_Question);
        ////console.log("FK_Question=" + ResponseResults[i].FK_Question);
        //////console.log("DataCollectionMethodSelected=" + DataCollectionMethodSelected);
        //////console.log("FK_DataCollectionMethod=" + ResponseResults[i].FK_DataCollectionMethod);
        ////console.log("-------");


        if ((CycleBeingDisplayed == ResponseResults[i].FK_Cycle) && (FK_Question == ResponseResults[i].FK_Question)) {
            //console.log(ResponseResults[i].FK_Cycle + '------' + ResponseResults[i].Response_DESC);
            newRowContent = '<tr><td>' + ResponseResults[i].Response_VAL + '</td><td class="leftAlign">' + ResponseResults[i].Response_DESC + '</td><td>' + Math.round(ResponseResults[i].Weighted_FREQ_VAL).toLocaleString("en") + '</td><td>' + ResponseResults[i].Weighted_PCT_VAL + '</td><td>' + ResponseResults[i].UnWeighted_FREQ_VAL + '</td><td>' + ResponseResults[i].UnWeighted_PCT_VAL + '</td></tr>';

            //console.log('putting in a new one');


            $(newRowContent).appendTo($("#tbdy_results"));
            // keep running total to put in the footer
            totalresponses += ResponseResults[i].UnWeighted_FREQ_VAL;
        }
    }

    newRowContent = '<tr class="bottomBorder"><td class="col-1">&nbsp;</td><td class="col-2 leftAlign">Total</td><td class="col-3">-</td><td class="col-4">100%</td><td class="col-4">' + totalresponses.toLocaleString("en") + '</td><td class="col-4">100%</td></tr>';

    $(newRowContent).appendTo($("#tbdy_results"));

}


//  RETRIEVES THE CYCLE OBJECT FROM surveyQuestionData
function getCycle(cycleId) {

    //console.log(surveyQuestionData.SurveyCycles);

    for (var prop in surveyQuestionData.SurveyCycles) {
        if (surveyQuestionData.SurveyCycles[prop].Id == cycleId) {
            return surveyQuestionData.SurveyCycles[prop];
        }
    }
    return false;
}


function SetselectedSummaryTypeId_LIs_Visible(TmpSummaryTypeID) {

    $('#btn_SAMPLE_LI').removeClass('active-percentage');
    $('#btn_Est_LI').removeClass('active-percentage');

    if (TmpSummaryTypeID === 1) {
        $('#btn_Est_LI').addClass('active-percentage');
    }
    else {
        $('#btn_SAMPLE_LI').addClass('active-percentage');
    }
}

function ChangeSummaryTypeClicked(TmpSummaryTypeID) {
    selectedSummaryTypeId = TmpSummaryTypeID;

    if (selectedSummaryTypeId === 1) {
        selectedSummaryType = 'Estimated Population';
    }
    else {
        selectedSummaryType = 'Sample';
    }


    populateChartTypeSelector();
    renderChart();
}

function SetChartVis_Classes(TmpChartType) {

    $('#bar-chart-li').removeClass('active-chart');
    $('#pie-chart-li').removeClass('active-chart');
    $('#line-chart-li').removeClass('active-chart');

    switch (TmpChartType) {
        case "bar2d":
            $('#bar-chart-li').addClass('active-chart');


            $('#bar-chart-li').show();
            $('#pie-chart-li').show();
            $('#line-chart-li').hide();

            break;
            ;
        case "pie3d":
            $('#pie-chart-li').addClass('active-chart');
            $('#bar-chart-li').show();
            $('#pie-chart-li').show();
            $('#line-chart-li').hide();
            break;
            ;
        case "msline":
            $('#line-chart-li').addClass('active-chart');
            $('#bar-chart-li').hide();
            $('#pie-chart-li').hide();
            $('#line-chart-li').show();
            break;
            ;
        default:
            $('#bar-chart-li').removeClass('active-chart');
            $('#pie-chart-li').removeClass('active-chart');
            $('#line-chart-li').removeClass('active-chart');
            break;
            ;
    }

}

function ChangeChartTypeClicked(TmpChartType) {
    selectedChartType = TmpChartType;
    renderChart();
}


//  RETRIEVES THE VALUES FOR THE CHART FROM surveyQuestionData FOR A SINGLE CYCLE
function getRawValuesForChart(cycleId, summaryTypeId) {
    var cycle = getCycle(cycleId);
    if (cycle) {
        for (var prop in cycle.DataSummaryTypes) {
            if (cycle.DataSummaryTypes[prop].Id == summaryTypeId) {
                return cycle.DataSummaryTypes[prop].ValuesForChart;
            }
        }
    }
    return false;
}

//  RETRIEVES THE VALUES FOR THE CHART FROM surveyQuestionData FOR ALL THE CYCLES
function getRawValuesForChartForAllCycles(summaryTypeId) {
    var valuesForChart = {
        Cycles: [],
        Responses: [],
        Percentages: []
    };

    for (var prop in surveyQuestionData.SurveyCycles) {
        if (!surveyQuestionData.SurveyCycles[prop].IsForAllCycles) {
            var cycleDisplayText = surveyQuestionData.SurveyCycles[prop].DisplayText;
            var valuesForChartForCycle = getRawValuesForChart(surveyQuestionData.SurveyCycles[prop].Id, summaryTypeId)

            for (var i = 0; i < valuesForChartForCycle[Object.keys(valuesForChartForCycle)[0]].length; i++) {
                valuesForChart.Cycles.push(cycleDisplayText);
            }

            valuesForChart.Responses = valuesForChart.Responses.concat(valuesForChartForCycle[Object.keys(valuesForChartForCycle)[0]]);
            valuesForChart.Percentages = valuesForChart.Percentages.concat(valuesForChartForCycle[Object.keys(valuesForChartForCycle)[1]]);
        }
    }

    return valuesForChart;
}

function populateChartTypeSelector() {
    var selectedCycleId = CycleBeingDisplayed;

    if (selectedCycleId === 0) {


        $('#btn_LineChartType').show();
        $('#btn_BarChartType').hide();
        $('#btn_PieChartType').hide();


    }
    else {

        $('#btn_LineChartType').hide();
        $('#btn_BarChartType').show();
        $('#btn_PieChartType').show();
    }

}

function getConfigDataForBarChart(xAxisName) {
    //  REFERENCE: http://www.fusioncharts.com/dev/chart-attributes.html?chart=bar2d
    return {
        baseFont: "Arial",
        //baseFont: "Segoe UI",
        baseFontSize: 16,
        canvasPadding: 50,
        canvasTopMargin: 50,
        canvasRightMargin: 50,
        canvasBottomMargin: 50,
        canvasLeftMargin: 50,
        theme: "fint",
        exportEnabled: 1,
        exportShowMenuItem: 0,

        caption: "",
        captionFont: "Arial",
        //captionFont: "Segoe UI Semibold",
        captionFontColor: "#006B91",
        captionFontSize: 22,
        captionFontBold: 0,
        alignCaptionWithCanvas: 0,
        captionPadding: 30,
        subCaption: "",
        subCaptionFontColor: "#636363",
        subCaptionFontSize: 17,
        labelFontBold: 1,
        labelFontSize: 18,
        maxLabelWidthPercent: 40,
        valueFontBold: 1,
        valueFontSize: 18,
        valueFontColor: "#000000",
        numberSuffix: "%",
        placevaluesInside: 0,
        showLabels: 1,
        showShadow: 1,
        xAxisName: xAxisName,
        xAxisNameFontBold: 1,
        xAxisNameFontSize: 20,
        xAxisNameFontItalic: 1,
        xAxisNameFontAlpha: 60
    };
}

function getConfigDataForLineChart(xAxisName) {
    //  REFERENCE: http://www.fusioncharts.com/dev/chart-attributes.html?chart=msline
    return {
        baseFont: "Arial",
        //baseFont: "Segoe UI",
        baseFontSize: 16,
        canvasPadding: 50,
        canvasTopMargin: 50,
        canvasRightMargin: 50,
        canvasBottomMargin: 50,
        canvasLeftMargin: 50,
        theme: "fint",
        exportEnabled: 1,
        exportShowMenuItem: 0,

        showAlternateHGridColor: 1,
        caption: "",
        captionFont: "Arial",
        //captionFont: "Segoe UI Semibold",
        captionFontColor: "#006B91",
        captionFontSize: 22,
        captionFontBold: 0,
        captionPadding: 30,
        alignCaptionWithCanvas: 1,
        subCaption: "",
        subCaptionFontColor: "#636363",
        subCaptionFontSize: 17,
        labelFontBold: 1,
        labelFontSize: 18,
        valueFontBold: 1,
        valueFontSize: 18,
        decimals: 2,
        numberSuffix: "%",
        xAxisName: xAxisName,
        xAxisNameFontBold: 1,
        xAxisNameFontSize: 20,
        xAxisNameFontItalic: 1,
        xAxisNameFontAlpha: 60,
        legendItemFontSize: 18,
        legendItemFontBold: 1,
        legendItemFontColor: "#000000"
    };
}

function getConfigDataForPieChart() {
    //  REFERENCE: http://www.fusioncharts.com/dev/chart-attributes.html?chart=pie3d
    return {
        baseFont: "Arial",
        //baseFont: "Segoe UI",
        baseFontSize: 16,
        canvasPadding: 50,
        canvasTopMargin: 50,
        canvasRightMargin: 50,
        canvasBottomMargin: 50,
        canvasLeftMargin: 50,
        theme: "fint",
        exportEnabled: 1,
        exportShowMenuItem: 0,

        caption: "",
        captionFont: "Arial",
        //captionFont: "Segoe UI Semibold",
        captionFontColor: "#006B91",
        captionFontSize: 22,
        captionFontBold: 0,
        alignCaptionWithCanvas: 1,
        captionPadding: 0,
        subCaption: "",
        subCaptionFontColor: "#636363",
        subCaptionFontSize: 17,
        issliced: 1,
        numberSuffix: "%",
        pieslicedepth: 40,
        slicingdistance: 25,
        showLabels: 0,
        showPercentValues: 0,
        showShadow: 1,
        showToolTip: 1,
        startingAngle: 45,
        valueFontBold: 1,
        valueFontSize: 18,
        showLegend: 1,
        legendItemFontSize: 18,
        legendItemFontBold: 1,
        legendItemFontColor: "#000000"
    };
}

//  USED TO ORGANIZE THE DATA THAT THE CHART NEEDS INTO THE FORMAT THAT IT EXPECTS
function fusionChartsFormatter() {
    return {
        formatDataForSingleSeries: formatDataForSingleSeries,
        formatDataForSingleSeriesBar2d: formatDataForSingleSeriesBar2d,
        formatDataForMultipleSeries: formatDataForMultipleSeries
    };

    //  FOR PIE CHART
    function formatDataForSingleSeries(valuesForChart) {
        var preFormattedData = preFormatData(valuesForChart);
        var formattedData = {
            chart: getConfigDataForPieChart(),
            data: []
        };

        for (var i = 0; i < preFormattedData.rows.length; i++) {
            for (var j = 1; j < preFormattedData.columns.length; j++) {
                formattedData.data.push({
                    label: preFormattedData.rows[i][preFormattedData.columns[0]],
                    value: preFormattedData.rows[i][preFormattedData.columns[j]]
                });
            }
        }

        return formattedData;
    }

    //  FOR BAR CHART
    function formatDataForSingleSeriesBar2d(valuesForChart) {
        var preFormattedData = preFormatData(valuesForChart);
        var formattedData = {
            chart: getConfigDataForBarChart(preFormattedData.columns[0]),
            data: []
        };

        for (var i = 0; i < preFormattedData.rows.length; i++) {
            for (var j = 1; j < preFormattedData.columns.length; j++) {
                formattedData.data.push({
                    label: preFormattedData.rows[i][preFormattedData.columns[0]],
                    value: preFormattedData.rows[i][preFormattedData.columns[j]]
                });
            }
        }

        return formattedData;
    }

    //  FOR LINE CHART
    function formatDataForMultipleSeries(valuesForChart) {
        var preFormattedData = preFormatData(valuesForChart);
        var formattedData = {
            chart: getConfigDataForLineChart(preFormattedData.columns[0]),
            categories: [{
                category: []
            }],
            dataset: []
        };

        var usedCategories = [];
        var usedSeries = [];

        for (var i = 0; i < preFormattedData.rows.length; i++) {
            var categoryName = preFormattedData.rows[i][preFormattedData.columns[0]];
            var seriesName = preFormattedData.rows[i][preFormattedData.columns[1]];

            if (usedCategories.indexOf(categoryName) == -1) {
                formattedData.categories[0].category.push({ label: categoryName });
                usedCategories.push(categoryName);
            }

            if (usedSeries.indexOf(seriesName) == -1) {
                formattedData.dataset.push({ seriesname: seriesName, data: [] });
                usedSeries.push(seriesName);
            }

            var series = getSeries(formattedData.dataset, seriesName);
            series.data.push({
                value: preFormattedData.rows[i][preFormattedData.columns[2]]
            });
        }

        return formattedData;
    }

    function preFormatData(valuesForChart) {
        var formattedValuesForChart = {};
        formattedValuesForChart.hasValues = (valuesForChart) ? true : false;
        formattedValuesForChart.columns = Object.keys(valuesForChart);
        formattedValuesForChart.rows = [];

        for (var i = 0; i < formattedValuesForChart.columns.length; i++) {
            for (var j = 0; j < valuesForChart[formattedValuesForChart.columns[i]].length; j++) {
                if (j >= formattedValuesForChart.rows.length) {
                    formattedValuesForChart.rows.push({});
                }
                formattedValuesForChart.rows[j][formattedValuesForChart.columns[i].toString()] = valuesForChart[formattedValuesForChart.columns[i]][j];
            }
        }

        return formattedValuesForChart;
    }

    function getSeries(data, seriesName) {
        for (var i = 0; i < data.length; i++) {
            if (data[i].seriesname == seriesName)
                return data[i];
        }

        return null;
    }
}

function getChartData(cycleId, summaryTypeId, chartType) {
    switch (chartType) {
        case chartType_Bar:
            return fusionChartsFormatter.formatDataForSingleSeriesBar2d(getRawValuesForChart(cycleId, summaryTypeId));
        case chartType_Line:
            return fusionChartsFormatter.formatDataForMultipleSeries(getRawValuesForChartForAllCycles(summaryTypeId));
        case chartType_Pie:
            return fusionChartsFormatter.formatDataForSingleSeries(getRawValuesForChart(cycleId, summaryTypeId));
    }
}

function renderChart() {

    //console.log('CycleBeingDisplayed-' + CycleBeingDisplayed);
    //console.log('selectedChartType-' + selectedChartType);


    var selectedCycleId = CycleBeingDisplayed;

    SetChartVis_Classes(selectedChartType);
    SetselectedSummaryTypeId_LIs_Visible(selectedSummaryTypeId);


    //  REFERENCE: http://www.fusioncharts.com/dev/getting-started/building-your-first-chart.html
    chart = new FusionCharts({
        type: selectedChartType,
        renderAt: "chart-container",
        width: "100%",
        height: "600",
        dataFormat: "json",
        dataSource: getChartData(selectedCycleId, selectedSummaryTypeId, selectedChartType)
    });

    chart.render();
}

function exportChart(exportFormat) {
    //  REFERENCE:  http://www.fusioncharts.com/dev/exporting-charts/configuring-the-export-feature.html
    if (chartToExport) {
        chartToExport.exportChart({
            "exportFormat": exportFormat,
            "exportFileName": "HINTS Chart"
        });
    }
}

function updateExportModal() {



    //var subcaption = "<br />" + $("#summaryTypeSelector option:selected").text() + "<br />" + getCycle($("#cycleSelector option:selected").val()).CitationText
    var subcaption = getCycle(CycleBeingDisplayed).CitationText + ", " + selectedSummaryType;






    //  CLONING:    http://jsfiddle.net/fusioncharts/2rmuz6j8/





    chartToExport = chart.clone();
    chartToExport.setChartAttribute("caption", surveyQuestionData.QuestionText);
    chartToExport.setChartAttribute("subcaption", subcaption);
    //chartToExport.setChartAttribute("chartTopMargin", 50);
    //chartToExport.setChartAttribute("chartRightMargin", 50);
    //chartToExport.setChartAttribute("chartBottomMargin", 50);
    //chartToExport.setChartAttribute("chartLeftMargin", 50);

    ////chartToExport.setChartAttribute("captionPadding", 100);
    ////chartToExport.setChartAttribute("captionHorizontalPadding", 50);
    //chartToExport.setChartAttribute("captionAlignment", "left");

    chartToExport.render("chart-container-export-only");


}


function getDataForSurveyQuestion() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: "{'PK_Question':'" + PK_Question + "'}",
        url: "DataMethods.aspx/GetSurveyQuestionResult",
        success: function (data) {
            surveyQuestionData = data.d;
            //populateCycleSelector();

            populateChartTypeSelector();
            renderChart();
        }
    });
}

function populateQuestionDisplay() {
    $('#DDL_Questions').change(function() {
        $('#question-filler').text($('#DDL_Questions').find(':selected').text());
    });
    $('#question-filler').text($('#DDL_Questions').find(':selected').text());
}
