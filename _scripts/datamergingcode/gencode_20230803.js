var selectedCycles = [];
var counterOne = 0;
var TotalCountOfBoxesSelected = 0;
var setTextperCheckboxMIDDLE_STATA_LoopYouAreOn = 0;

$(document).ready(function () {

    var counterOne = 0;
    var TotalCountOfBoxesSelected = 0;



    $('#btn_copy').click(function () {
        $('#TXT_Results').removeAttr('disabled');
        $('#TXT_Results').select();
        document.execCommand("copy");
        $('#TXT_Results').attr('disabled', 'disabled');
    });



    $('input[type=checkbox]').change(function () {

        if ($('#RD_SAS').is(':checked')) {
            GenerateThecode_SAS();
        }
        else if ($('#RD_STATA').is(':checked')) {

            GenerateThecode_STATA();
        }

    });

    $('input[type=radio]').change(function () {

        if ($('#RD_SAS').is(':checked')) {
            GenerateThecode_SAS();
        }
        else if ($('#RD_STATA').is(':checked')) {

            GenerateThecode_STATA();
        }
    });


    function GenerateThecode_SAS() {
        // show/hide the 5-3 radio buttons
        if ($("#ck_Cycle-53").is(':checked') == true) {
            $('#dv_Pnl53').removeClass('dv_Pnl53_Hide').addClass('dv_Pnl53_show');
        }
        else {
            $('#dv_Pnl53').removeClass('dv_Pnl53_show').addClass('dv_Pnl53_Hide');
        }

        var totalcode = '/*  SET FOLDER LOCATION OF HINTS DATA – ASSUMES ALL DATASETS ARE IN THE SAME FOLDER */\n';
        totalcode += ' /* USER NOTE: UPDATE PATH IN LIBNAME STATEMENT */\n';
        totalcode += "libname library 'REPLACE - WITH - YOUR - PATH - HERE';\n\n";
        totalcode += '/* GENERATE USER FORMAT TO DELINEATE THE DIFFERENT SURVEY CYCLES */\n';
        totalcode += '/* RECOMMENDATION: ALSO LOAD AND APPLY SAS FORMATS INCLUDED IN THE DOWNLOADED HINTS DATA PACKAGES. FOR MORE INFORMATION, SEE THE SURVEY OVERVIEW AND ANALYSIS DOCUMENTS */\n';
        totalcode += 'proc format ;\n';
        totalcode += '    value survey\n';
        counterOne = 0;

        // loop for the top part
        // setting the counter, no need for changes for new item
        $('input[type=checkbox]').each(function () {
            if ((this.checked) && (this.id.indexOf("ck_Cycle-") >= 0)) {
                // this is for the very top list of selected checkboxes
                counterOne += 1;
                totalcode += '    ' + counterOne + '=\'' + $(this).val() + '\'\n'
            }
        });
        totalcode += '    ;\n';
        totalcode += 'run;\n\n';

        totalcode += '/* PREP DATA FOR EACH SURVEY CYCLE */\n';
        TotalCountOfBoxesSelected = counterOne;

        var counterOne = 0;
        var counterBottom = 0;

        // reset selcted array
        selectedCycles = [];

        // loop for the middle part
        $('input[type=checkbox]').each(function () {
            if ((this.checked) && (this.id.indexOf("ck_Cycle-") >= 0)) {
                //console.log(this.id);
                //console.log('$(this).val()==>' + $(this).val());

                counterOne += 1;
                switch ($(this).val()) {
                    case 'HINTS 4 CYCLE 3':
                        totalcode += setTextperCheckboxMIDDLE_SAS('tempHINTS4CYCLE3', 'hints4_cycle3_public', counterOne);

                        selectedCycles.push('hints43wgts');
                        break;
                        ;
                    case 'HINTS 4 CYCLE 4':
                        totalcode += setTextperCheckboxMIDDLE_SAS('tempHINTS4CYCLE4', 'hints4_cycle4_public', counterOne);
                        selectedCycles.push('hints44wgts');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 1':
                        totalcode += setTextperCheckboxMIDDLE_SAS('tempHINTS5CYCLE1', 'hints5_cycle1_public', counterOne);
                        selectedCycles.push('hints51wgts');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 2':
                        totalcode += setTextperCheckboxMIDDLE_SAS('tempHINTS5CYCLE2', 'hints5_cycle2_public', counterOne);
                        selectedCycles.push('hints52wgts');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 3':
                        totalcode += setTextperCheckboxMIDDLE_SAS('tempHINTS5CYCLE3', 'hints5_cycle3_public', counterOne);
                        selectedCycles.push('hints53wgts');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 4':
                        totalcode += setTextperCheckboxMIDDLE_SAS('tempHINTS5CYCLE4', 'hints5_cycle4_public', counterOne);
                        selectedCycles.push('hints54wgts');
                        break;
                        ;

                        // RWB ADD THIS WHEN ADDING NEW CYCLE
                    case 'HINTS 6':
                        totalcode += setTextperCheckboxMIDDLE_SAS('tempHINTS6', 'hints6_public', counterOne);
                        selectedCycles.push('hints6wgts');
                        break;
                        ;

        /************************************************************************************************************
        *  Update By: De-Shunda Jones                                                                               *
        *  Purpose: Include HINTS 7 items in HINTS Merging Tool Code                                                *
        *  Affected Lines: 138 - 142                                                                                *
        *  Date: 10/23/2025                                                                                         *
        ************************************************************************************************************/
                    case 'HINTS 7':
                        totalcode += setTextperCheckboxMIDDLE_SAS('tempHINTS7', 'hints7_public', counterOne);
                        selectedCycles.push('hints7wgts');
                        break;
                        ;


                    default:
                        totalcode = totalcode;
                        break;
                        ;
                }
            }
        });

        totalcode += '/* STACK TOGETHER DATA FROM EACH SURVEY CYCLE AND GENERATE THE APPROPRIATE NUMBER OF REPLICATE WEIGHTS USING THE RIZZO METHOD */\n';

        // loop for the bottom ABOVE array list part
        totalcode += 'data merge_hints;\n';


        // HERE ***********************************

        if ($("#ck_Cycle-6").is(':checked') == true) {
            totalcode += '    length APP_REGION $2;\n';
        }


        totalcode += '    set ';
        $('input[type=checkbox]').each(function () {
            if ((this.checked) && (this.id.indexOf("ck_Cycle-") >= 0)) {
                counterOne += 1;
                switch ($(this).val()) {
                    case 'HINTS 4 CYCLE 3':
                        totalcode += ' tempHINTS4CYCLE3';
                        break;
                        ;
                    case 'HINTS 4 CYCLE 4':
                        totalcode += ' tempHINTS4CYCLE4';
                        break;
                        ;
                    case 'HINTS 5 CYCLE 1':
                        totalcode += ' tempHINTS5CYCLE1';
                        break;
                        ;
                    case 'HINTS 5 CYCLE 2':
                        totalcode += ' tempHINTS5CYCLE2';
                        break;
                        ;
                    case 'HINTS 5 CYCLE 3':
                        totalcode += ' tempHINTS5CYCLE3';
                        break;
                        ;
                    case 'HINTS 5 CYCLE 4':
                        totalcode += ' tempHINTS5CYCLE4';
                        break;
                        ;


                    // RWB ADD THIS WHEN ADDING NEW CYCLE
                    case 'HINTS 6':
                        totalcode += ' tempHINTS6';
                        break;
                        ;

            /************************************************************************************************************
            *  Update By: De-Shunda Jones                                                                               *
            *  Purpose: Include HINTS 7 items in HINTS Merging Tool Code                                                *
            *  Affected Lines: 211 - 214                                                                                *
            *  Date: 10/23/2025                                                                                         *
            ************************************************************************************************************/


                    case 'HINTS 7':
                        totalcode += ' tempHINTS7';
                        break;
                        ;

                    default:
                        totalcode = totalcode;
                        break;
                        ;
                }

            }
        });

        totalcode += ';\n';


        // Listing the Array part
        $('input[type=checkbox]').each(function () {
            if ((this.checked) && (this.id.indexOf("ck_Cycle-") >= 0)) {
                counterOne += 1;
                switch ($(this).val()) {
                    case 'HINTS 4 CYCLE 3':
                        totalcode += setTextperCheckboxArrayList_SAS('hints43wgts', 'person_finwt1-person_finwt50');
                        break;
                        ;
                    case 'HINTS 4 CYCLE 4':
                        totalcode += setTextperCheckboxArrayList_SAS('hints44wgts', 'person_finwt1-person_finwt50');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 1':
                        totalcode += setTextperCheckboxArrayList_SAS('hints51wgts', 'person_finwt1-person_finwt50');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 2':
                        totalcode += setTextperCheckboxArrayList_SAS('hints52wgts', 'person_finwt1-person_finwt50');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 3':
                        totalcode += setTextperCheckboxArrayList_SAS('hints53wgts', 'tg_all_finwt1-tg_all_finwt50');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 4':
                        totalcode += setTextperCheckboxArrayList_SAS('hints54wgts', 'PERSON_FINWT1-PERSON_FINWT50');
                        break;
                        ;


                    // RWB ADD THIS WHEN ADDING NEW CYCLE
                    case 'HINTS 6':
                        totalcode += setTextperCheckboxArrayList_SAS('hints6wgts', 'PERSON_FINWT1-PERSON_FINWT50');
                        break;
                        ;



            /************************************************************************************************************
            *  Update By: De-Shunda Jones                                                                               *
            *  Purpose: Include HINTS 7 items in HINTS Merging Tool Code                                                *
            *  Affected Lines: 275 - 278                                                                                *
            *  Date: 10/23/2025                                                                                         *
            ************************************************************************************************************/


                    case 'HINTS 7':
                        totalcode += setTextperCheckboxArrayList_SAS('hints7wgts', 'PERSON_FINWT1-PERSON_FINWT50');
                        break;
                        ;


                    default:
                        totalcode = totalcode;
                        break;
                        ;
                }
            }
        });

        totalcode += '';

        totalcode += '    array newWghts[' + (TotalCountOfBoxesSelected * 50) + '] nwgt1-nwgt' + (TotalCountOfBoxesSelected * 50) + ';\n\n';
        //////////// Listing the special difficult section

        totalcode += '';

        var tempstring = '';

        i = 1;
        inneri = 1

        while (i <= TotalCountOfBoxesSelected) {
            //////This could be any cycle but sets the IF instead of Else IF
            if (i == 1) {

                // this is a special 5-3 cycle
                if (($("#ck_Cycle-53").is(':checked') == true) && (selectedCycles[i - 1] == 'hints53wgts')) {

                    totalcode += '    if survey eq 1 then do i=1 to 50;\n';

                    if ($('#RD_All').is(':checked')) {
                        totalcode += '         nwgt0=tg_all_finwt0;\n';
                    }

                    if ($('#RD_Paper').is(':checked')) {
                        totalcode += '         nwgt0=tg1_finwt0;\n';
                    }

                    if ($('#RD_Web').is(':checked')) {
                        totalcode += '         nwgt0=tg2_finwt0;\n';
                    }

                    if ($('#RD_Bonus').is(':checked')) {
                        totalcode += '         nwgt0=tg3_finwt0;\n';
                    }

                    while (inneri <= TotalCountOfBoxesSelected) {

                        //totalcode += 'inneri loop = ' + inneri + ';\n';
                        if (inneri == 1) {
                            totalcode += '         newWghts' + GetWeight_SAS(inneri) + '= ' + selectedCycles[0] + '[i];\n';
                        }
                        else {

                            if ($('#RD_All').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight_SAS(inneri) + '= tg_all_finwt0;\n';
                            }

                            if ($('#RD_Paper').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight_SAS(inneri) + '= tg1_finwt0;\n';
                            }

                            if ($('#RD_Web').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight_SAS(inneri) + '= tg2_finwt0;\n';
                            }

                            if ($('#RD_Bonus').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight_SAS(inneri) + '= tg3_finwt0;\n';
                            }
                        }
                        inneri++;
                    }
                    totalcode += '    end;\n\n';
                }
                else {
                    // this is for every cycle other than 5-3
                    totalcode += '    if survey eq 1 then do i=1 to 50;\n';
                    totalcode += '         nwgt0=person_finwt0;\n';

                    while (inneri <= TotalCountOfBoxesSelected) {

                        //totalcode += 'inneri loop = ' + inneri + ';\n';
                        if (inneri == 1) {
                            totalcode += '         newWghts' + GetWeight_SAS(inneri) + '= ' + selectedCycles[0] + '[i];\n';
                        }
                        else {
                            totalcode += '         newWghts' + GetWeight_SAS(inneri) + '= person_finwt0;\n';
                        }
                        inneri++;
                    }

                    totalcode += '    end;\n\n';
                }

                // above this
            }
            else {
                //////This could be any cycle but sets the ELF IF instead of IF

                // this is a special 5-3 cycle
                if (($("#ck_Cycle-53").is(':checked') == true) && (selectedCycles[i - 1] == 'hints53wgts')) {
                    inneri = 1;
                    totalcode += '    else if survey eq ' + i + ' then do i=1 to 50;\n';

                    if ($('#RD_All').is(':checked')) {
                        totalcode += '         nwgt0=tg_all_finwt0;\n';
                    }

                    if ($('#RD_Paper').is(':checked')) {
                        totalcode += '         nwgt0=tg1_finwt0;\n';
                    }

                    if ($('#RD_Web').is(':checked')) {
                        totalcode += '         nwgt0=tg2_finwt0;\n';
                    }

                    if ($('#RD_Bonus').is(':checked')) {
                        totalcode += '         nwgt0=tg3_finwt0;\n';
                    }

                    while (inneri <= TotalCountOfBoxesSelected) {
                        //totalcode += 'inneri loop = ' + inneri + ';\n';
                        if (inneri == i) {
                            totalcode += '         newWghts' + GetWeight_SAS(inneri) + '= ' + selectedCycles[inneri - 1] + '[i];\n';
                        }
                        else {
                            if ($('#RD_All').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight_SAS(inneri) + '= tg_all_finwt0;\n';
                            }

                            if ($('#RD_Paper').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight_SAS(inneri) + '= tg1_finwt0;\n';
                            }

                            if ($('#RD_Web').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight_SAS(inneri) + '= tg2_finwt0;\n';
                            }

                            if ($('#RD_Bonus').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight_SAS(inneri) + '= tg3_finwt0;\n';
                            }
                        }
                        inneri++;
                    }
                    totalcode += '    end;\n\n';
                }
                else {
                    inneri = 1;
                    totalcode += '    else if survey eq ' + i + ' then do i=1 to 50;\n';
                    totalcode += '         nwgt0=person_finwt0;\n';

                    while (inneri <= TotalCountOfBoxesSelected) {
                        //totalcode += 'inneri loop = ' + inneri + ';\n';
                        if (inneri == i) {
                            totalcode += '         newWghts' + GetWeight_SAS(inneri) + '= ' + selectedCycles[inneri - 1] + '[i];\n';
                        }
                        else {
                            totalcode += '         newWghts' + GetWeight_SAS(inneri) + '= person_finwt0;\n';

                        }
                        inneri++;
                    }
                    totalcode += '    end;\n\n';
                }
            }
            i++;
        }

        totalcode += 'run;';
        totalcode += '\n';

        /////////////// RWB new entry on 8/24/2021
        /////////////// RWB new entry on 8/24/2021
        /////////////// RWB new entry on 8/24/2021
        /////////////// RWB new entry on 8/24/2021


        if (($("#ck_OptionsFrequencies").is(':checked') == true) || ($("#ck_OptionsLogistic").is(':checked') == true) || ($("#ck_OptionsLinear").is(':checked') == true)) {

            totalcode += '\n/* REMINDER!: YOUR SPECIFIC RESEARCH QUESTION(S) AND ANALYSIS MAY REQUIRE THAT ADDITIONAL DATA MANIPULATIONS AND FORMATTING (E.G. CALCULATED VARAIBLES) BE PERFORMED PRIOR TO RUNNING THE ANALYSIS CODE GENERATED BELOW. */\n';
        }

        if ($("#ck_OptionsFrequencies").is(':checked') == true) {
            totalcode += '\n';

            totalcode += '/* EXAMPLE FREQUENCY/CROSSTAB ANALYSIS CODE USING NEWLY GENERATED REPLICATE WEIGHTS FOR MULTIPLE SURVEY CYCLES*/\n';
            totalcode += '/* USER NOTE: PARTS OF THE CODE WILL NEED TO BE UPDATED TO REFLECT YOUR DESIRED ANALYSIS */\n';
            totalcode += 'proc surveyfreq data = merge_hints varmethod = jackknife;\n';
            totalcode += '    weight nwgt0;\n';
            totalcode += '    repweights nwgt1 - nwgt' + (TotalCountOfBoxesSelected * 50) + ' / df=' + (TotalCountOfBoxesSelected * 49) + ' jkcoefs = 0.98;\n';
            totalcode += '    /* [INSERT ANALYSIS-SPECIFC TABLE STATEMENT(S) HERE] */\n';
            totalcode += '\n';
            totalcode += '    /* EXAMPLE TABLE STATEMENTS: */\n';
            totalcode += '    /* table seekcancerinfo chanceaskquestions; */\n';
            totalcode += '    /* table EducA*HHINC /row col chisq; */\n';
            totalcode += 'run;\n';
        }

        if ($("#ck_OptionsLogistic").is(':checked') == true) {
            totalcode += '\n';
            totalcode += '/* EXAMPLE LOGISTIC REGRESSION ANALYSIS CODE USING NEWLY GENERATED REPLICATE WEIGHTS FOR MULTIPLE SURVEY CYCLES*/\n';
            totalcode += '/* USER NOTE: PARTS OF THE CODE WILL NEED TO BE UPDATED TO REFLECT YOUR DESIRED ANALYSIS */\n';
            totalcode += 'proc surveylogistic data = merge_hints varmethod = jackknife;\n';
            totalcode += '    weight nwgt0;\n';
            totalcode += '    repweights nwgt1 - nwgt' + (TotalCountOfBoxesSelected * 50) + ' / df=' + (TotalCountOfBoxesSelected * 49) + ' jkcoefs = 0.98;\n';
            totalcode += '    /* [INSERT ANALYSIS-SPECIFC CLASS STATEMENT HERE] */\n';
            totalcode += '    /* [INSERT ANALYSIS-SPECIFC MODEL STATEMENT HERE] */\n';
            totalcode += '\n';
            totalcode += '    /* EXAMPLE CLASS AND MODEL STATEMENTS: */\n';
            totalcode += '    /* class EducA (ref="1") HHInc (ref="1") /param=REF; */\n';
            totalcode += '    /* model seekcancerinfo (descending) = EducA HHInc /tech=newton xconv=1e-8 CLPARM EXPB; */\n';
            totalcode += 'run;\n';
        }

        if ($("#ck_OptionsLinear").is(':checked') == true) {
            totalcode += '\n';
            totalcode += '/* EXAMPLE LINEAR REGRESSION ANALYSIS CODE USING NEWLY GENERATED REPLICATE WEIGHTS FOR MULTIPLE SURVEY CYCLES*/\n';
            totalcode += '/* USER NOTE: PARTS OF THE CODE WILL NEED TO BE UPDATED TO REFLECT YOUR DESIRED ANALYSIS */\n';
            totalcode += 'proc surveyreg data = merge_hints varmethod = jackknife;\n';
            totalcode += '    weight nwgt0;\n';
            totalcode += '    repweights nwgt1 - nwgt' + (TotalCountOfBoxesSelected * 50) + ' / df=' + (TotalCountOfBoxesSelected * 49) + ' jkcoefs = 0.98;\n';
            totalcode += '    /* [INSERT ANALYSIS-SPECIFC CLASS STATEMENT HERE] */\n';
            totalcode += '    /* [INSERT ANALYSIS-SPECIFC MODEL STATEMENT HERE] */\n';
            totalcode += '\n';
            totalcode += '    /* EXAMPLE CLASS AND MODEL STATEMENTS: */\n';
            totalcode += '    /* class EducA (ref="1") HHInc (ref="1"); */\n';
            totalcode += '    /* model generalhealth = EducA HHInc /solution; */\n';
            totalcode += 'run;\n';
        }


        /////////////// RWB new entry on 8/24/2021
        /////////////// RWB new entry on 8/24/2021
        /////////////// RWB new entry on 8/24/2021
        /////////////// RWB new entry on 8/24/2021

        $("textarea#TXT_Results").val(totalcode);

        //  console.log('TotalCountOfBoxesSelecte=' + TotalCountOfBoxesSelected);

        if (TotalCountOfBoxesSelected < 2) {
            $("textarea#TXT_Results").val('Select at least 2 or more checkboxes');
        }
        /// end of the check changed function
    }
    // above this is the code to run







    function GenerateThecode_STATA() {

        // show/hide the 5-3 radio buttons
        if ($("#ck_Cycle-53").is(':checked') == true) {
            $('#dv_Pnl53').removeClass('dv_Pnl53_Hide').addClass('dv_Pnl53_show');
        }
        else {
            $('#dv_Pnl53').removeClass('dv_Pnl53_show').addClass('dv_Pnl53_Hide');
        }


        var totalcode = '* CODE BELOW ASSUMES ALL DATASETS ARE IN THE SAME FOLDER\n';
        totalcode += '* USER NOTE: THROUGHOUT THE CODE BELOW UPDATE THE PATHS IN USE AND SAVE LINES\n';
        totalcode += "* WE STRONGLY RECOMMEND CREATING A SEPARATE TEMPORARY FOLDER TO SAVE PREPPED DATASET\n\n";

        totalcode += '* PREP DATA FOR EACH CYCLE AND GENERATE THE APPROPRIATE NUMBER OF REPLICATE WEIGHTS USING THE RIZZO METHOD\n\n';



        totalcode += 'set trace on\n\n';




        counterOne = 0;

        $('input[type=checkbox]').each(function () {
            if ((this.checked) && (this.id.indexOf("ck_Cycle-") >= 0)) {
                counterOne += 1;
            }
        });

        TotalCountOfBoxesSelected = counterOne;



        counterOne = 0;
        var counterBottom = 0;

        // reset selcted array
        selectedCycles = [];
        setTextperCheckboxMIDDLE_STATA_LoopYouAreOn = 0;

        // loop for the middle part
        $('input[type=checkbox]').each(function () {
            if ((this.checked) && (this.id.indexOf("ck_Cycle-") >= 0)) {
                //console.log(this.id);
                //console.log('$(this).val()==>' + $(this).val());

                counterOne += 1;
                switch ($(this).val()) {
                    case 'HINTS 4 CYCLE 3':
                        totalcode += setTextperCheckboxMIDDLE_STATA('tempHINTS4CYCLE3', 'hints4_cycle3_public', TotalCountOfBoxesSelected);

                        selectedCycles.push('hints43wgts');
                        break;
                        ;
                    case 'HINTS 4 CYCLE 4':
                        totalcode += setTextperCheckboxMIDDLE_STATA('tempHINTS4CYCLE4', 'hints4_cycle4_public', TotalCountOfBoxesSelected);
                        selectedCycles.push('hints44wgts');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 1':
                        totalcode += setTextperCheckboxMIDDLE_STATA('tempHINTS5CYCLE1', 'hints5_cycle1_public', TotalCountOfBoxesSelected);
                        selectedCycles.push('hints51wgts');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 2':
                        totalcode += setTextperCheckboxMIDDLE_STATA('tempHINTS5CYCLE2', 'hints5_cycle2_public', TotalCountOfBoxesSelected);
                        selectedCycles.push('hints52wgts');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 3':
                        selectedCycles.push('hints53wgts');
                        totalcode += setTextperCheckboxMIDDLE_STATA('tempHINTS5CYCLE3', 'hints5_cycle3_public', TotalCountOfBoxesSelected);
                        break;
                        ;
                    case 'HINTS 5 CYCLE 4':
                        totalcode += setTextperCheckboxMIDDLE_STATA('tempHINTS5CYCLE4', 'hints5_cycle4_public', TotalCountOfBoxesSelected);
                        selectedCycles.push('hints54wgts');
                        break;
                        ;




                    // RWB ADD THIS WHEN ADDING NEW CYCLE
                        case 'HINTS 6':
                        totalcode += setTextperCheckboxMIDDLE_STATA('tempHINTS6', 'hints6_public', TotalCountOfBoxesSelected);
                        selectedCycles.push('hints6wgts');
                        break;
                        ;


            /************************************************************************************************************
            *  Update By: De-Shunda Jones                                                                               *
            *  Purpose: Include HINTS 7 items in HINTS Merging Tool Code                                                *
            *  Affected Lines: 635 - 639                                                                                *
            *  Date: 10/23/2025                                                                                         *
            ************************************************************************************************************/


                    case 'HINTS 7':
                    totalcode += setTextperCheckboxMIDDLE_STATA('tempHINTS7', 'hints7_public', TotalCountOfBoxesSelected);
                    selectedCycles.push('hints7wgts');
                    break;
                    ;




                    default:
                        totalcode = totalcode;
                        break;
                        ;
                }
            }
        });


        totalcode += '* STACK TOGETHER DATA FROM EACH SURVEY CYCLE AND GENERATE USER FORMAT TO DELINEATE THE DIFFERENT SURVEY CYCLES\n\n';

        //totalcode += ';\n';          



        // all the data stuff is done, now do the extra text at the bottom....

        // loop all the checkboxes
        counterOne = 0;
        var firstcycle = '';
        var cyclelistWithOutFirstCycleSelected = '';
        var allCycleList = '';
        $('input[type=checkbox]').each(function () {
            if ((this.checked) && (this.id.indexOf("ck_Cycle-") >= 0)) {
                //console.log(this.id);
                //console.log('$(this).val()==>' + $(this).val());

                switch ($(this).val()) {
                    case 'HINTS 4 CYCLE 3':
                        if (firstcycle == '') {
                            firstcycle = 'hints4_cycle3_public';
                        }
                        allCycleList += counterOne + ' "HINTS 4 Cycle 3" ';
                        counterOne += 1;
                        break;
                        ;
                    case 'HINTS 4 CYCLE 4':
                        if (firstcycle == '') {
                            firstcycle = 'hints4_cycle4_public';
                        }
                        else {
                            cyclelistWithOutFirstCycleSelected += '"REPLACE-WITH-YOUR-TEMP-FOLDER-PATH-HERE\\hints4_cycle4_public.dta" ';
                        }
                        allCycleList += counterOne + ' "HINTS 4 Cycle 4" ';
                        counterOne += 1;
                        break;
                        ;
                    case 'HINTS 5 CYCLE 1':
                        if (firstcycle == '') {
                            firstcycle = 'hints5_cycle1_public';
                        }
                        else {
                            cyclelistWithOutFirstCycleSelected += '"REPLACE-WITH-YOUR-TEMP-FOLDER-PATH-HERE\\hints5_cycle1_public.dta" ';
                        }
                        allCycleList += counterOne + ' "HINTS 5 Cycle 1" ';
                        counterOne += 1;
                        break;
                        ;
                    case 'HINTS 5 CYCLE 2':
                        if (firstcycle == '') {
                            firstcycle = 'hints5_cycle2_public';
                        }
                        else {
                            cyclelistWithOutFirstCycleSelected += '"REPLACE-WITH-YOUR-TEMP-FOLDER-PATH-HERE\\hints5_cycle2_public.dta" ';
                        }
                        allCycleList += counterOne + ' "HINTS 5 Cycle 2" ';
                        counterOne += 1;
                        break;
                        ;
                    case 'HINTS 5 CYCLE 3':
                        if (firstcycle == '') {
                            firstcycle = 'hints5_cycle3_public';
                        }
                        else {
                            cyclelistWithOutFirstCycleSelected += '"REPLACE-WITH-YOUR-TEMP-FOLDER-PATH-HERE\\hints5_cycle3_public.dta" ';
                        }
                        allCycleList += counterOne + ' "HINTS 5 Cycle 3" ';
                        counterOne += 1;
                        break;
                        ;
                    case 'HINTS 5 CYCLE 4':
                        if (firstcycle == '') {
                            firstcycle = 'hints5_cycle4_public';
                        }
                        else {
                            cyclelistWithOutFirstCycleSelected += '"REPLACE-WITH-YOUR-TEMP-FOLDER-PATH-HERE\\hints5_cycle4_public.dta" ';
                        }
                        allCycleList += counterOne + ' "HINTS 5 Cycle 4" ';
                        counterOne += 1;
                        break;
                        ;






                    // RWB ADD THIS WHEN ADDING NEW CYCLE
                        case 'HINTS 6':
                        if (firstcycle == '') {
                            firstcycle = 'hints6_public';
                        }
                        else {
                            cyclelistWithOutFirstCycleSelected += '"REPLACE-WITH-YOUR-TEMP-FOLDER-PATH-HERE\\hints6_public.dta" ';
                        }
                        allCycleList += counterOne + ' "HINTS 6" ';
                        counterOne += 1;
                        break;
                        ;


            /************************************************************************************************************
            *  Update By: De-Shunda Jones                                                                               *
            *  Purpose: Include HINTS 7 items in HINTS Merging Tool Code                                                *
            *  Affected Lines: 763 - 773                                                                                *
            *  Date: 10/23/2025                                                                                         *
            ************************************************************************************************************/


                        case 'HINTS 7':
                        if (firstcycle == '') {
                            firstcycle = 'hints7_public';
                        }
                        else {
                            cyclelistWithOutFirstCycleSelected += '"REPLACE-WITH-YOUR-TEMP-FOLDER-PATH-HERE\\hints7_public.dta" ';
                        }
                        allCycleList += counterOne + ' "HINTS 7" ';
                        counterOne += 1;
                        break;
                        ;



                    default:
                        totalcode = totalcode;
                        break;
                        ;
                }
            }
        });

        /*******************************************************************************************************************************
        *  Update By: De-Shunda Jones                                                                                                  *
        *  Purpose: Update add "force" after "append using statement" to force merge of data to ignore variable formatting difference  *
        *  Affected Lines: 717 updated                                                                                                 *
        *  Date: 11/22/2023                                                                                                            *
        *******************************************************************************************************************************/

        totalcode += 'use "REPLACE-WITH-YOUR-TEMP-FOLDER-PATH-HERE\\' + firstcycle + '.dta", clear\n\n';
        totalcode += 'append using ' + cyclelistWithOutFirstCycleSelected + ', generate(cycles) force\n\n';
        totalcode += 'tab cycles\n\n';
        totalcode += 'label define cycles ' + allCycleList + '\n\n';
        totalcode += 'label values cycles cycles\n\n';
        totalcode += 'tab cycles\n\n';






        // **************************************************************************
        // ********************************analyses boxes ****************************
        // **************************************************************************


        if (($("#ck_OptionsFrequencies").is(':checked') == true) || ($("#ck_OptionsLogistic").is(':checked') == true) || ($("#ck_OptionsLinear").is(':checked') == true)) {
            totalcode += '\n';

            totalcode += '* REMINDER!: YOUR SPECIFIC RESEARCH QUESTION(S) AND ANALYSIS MAY REQUIRE THAT ADDITIONAL DATA MANIPULATIONS AND VALUE LABELING (E.G. CALCULATED VARAIBLES) BE PERFORMED PRIOR TO RUNNING THE ANALYSIS CODE GENERATED BELOW\n';
            totalcode += '\n* Declare survey design for the data set (jack-knife)\n';
            totalcode += '\nsvyset [pw=nwgt0], jkrw(nwgt1-nwgt' + (TotalCountOfBoxesSelected * 50) + ' , multiplier(0.98)) vce(jack) dof(' + (TotalCountOfBoxesSelected * 49) + ') mse\n';
            totalcode += '\n';

        }




        if ($("#ck_OptionsFrequencies").is(':checked') == true) {
            totalcode += '\n';
            totalcode += '* EXAMPLE FREQUENCY / CROSSTAB ANALYSIS CODE USING NEWLY GENERATED REPLICATE WEIGHTS FOR MULTIPLE SURVEY CYCLES\n';
            totalcode += '* TO OBTAIN STANDARD ERRORS FOR TOTAL, ROW, AND COLUMN PERCENTAGES YOU MUST SEPARATELY REQUEST EACH UNDER DIFFERENT TABULATE STATEMENTS\n';
            totalcode += '* USER NOTE: PARTS OF THE CODE WILL NEED TO BE UPDATED TO REFLECT YOUR DESIRED ANALYSIS\n';


            totalcode += '\n* EXAMPLE TABULATE REQUESTS\n\n';


            totalcode += '* Recode missing values for Stata\n';
            totalcode += 'recode educa (-9 / -7=.)\n';
            totalcode += 'recode hhinc (-9 / -7=.)\n\n';
            totalcode += '* Crosstab education and household income\n';




            totalcode += 'svy: tabulate educa hhinc, cell format(%8.5f) percent se\n';
            totalcode += 'svy: tabulate educa hhinc, row format(%8.5f) percent se\n';
            totalcode += 'svy: tabulate educa hhinc, column format(%8.5f) percent se\n';

        }



        if ($("#ck_OptionsLogistic").is(':checked') == true) {
            totalcode += '\n';
            //totalcode += '* EXAMPLE FREQUENCY / CROSSTAB ANALYSIS CODE USING NEWLY GENERATED REPLICATE WEIGHTS FOR MULTIPLE SURVEY CYCLES\n';
            //totalcode += '* TO OBTAIN STANDARD ERRORS FOR TOTAL, ROW, AND COLUMN PERCENTAGES YOU MUST SEPARATELY REQUEST EACH UNDER DIFFERENT TABULATE STATEMENTS\n';
            //totalcode += '* USER NOTE: PARTS OF THE CODE WILL NEED TO BE UPDATED TO REFLECT YOUR DESIRED ANALYSIS\n\n';


            totalcode += '* EXAMPLE LOGISTIC REGRESSION ANALYSIS CODE USING NEWLY GENERATED REPLICATE WEIGHTS FOR MULTIPLE SURVEY CYCLES\n';
            totalcode += '* USER NOTE: PARTS OF THE CODE WILL NEED TO BE UPDATED TO REFLECT YOUR DESIRED ANALYSIS\n';
            totalcode += '\n* EXAMPLE LOGISTIC REGRESSION REQUEST\n\n';

            totalcode += '* Recode missing values for Stata\n';
            totalcode += 'recode educa (-9 / -7=.)\n';
            totalcode += 'recode hhinc (-9 / -7=.)\n';
            totalcode += 'recode seekcancerinfo (-9 / -1=.) (1 = 1) (2 = 0)\n';



            totalcode += '\n* Define reference group for categorical variables for svy: logit\n';
            totalcode += '\nchar educa[omit] 1\n';
            totalcode += 'char hhinc[omit] 1\n';
            totalcode += '\n* Multivariable logistic regression of education and household income on seekcancerinfo\n';
            totalcode += '\nsvy: logistic seekcancerinfo i.educa i.hhinc\n';


            totalcode += '\n* Joint test for significance of all coefficients\n';




            totalcode += 'test 2.educa 3.educa 4.educa 2.hhinc 3.hhinc 4.hhinc 5.hhinc _cons, nosvyadjust\n';
            totalcode += 'test 2.educa 3.educa 4.educa 2.hhinc 3.hhinc 4.hhinc 5.hhinc, nosvyadjust\n';
            totalcode += 'test 2.educa 3.educa 4.educa, nosvyadjust\n';
            totalcode += 'test 2.hhinc 3.hhinc 4.hhinc 5.hhinc, nosvyadjust\n';


        }


        if ($("#ck_OptionsLinear").is(':checked') == true) {
            totalcode += '\n';
            totalcode += '* EXAMPLE LINEAR REGRESSION ANALYSIS CODE USING NEWLY GENERATED REPLICATE WEIGHTS FOR MULTIPLE SURVEY CYCLES\n';
            totalcode += '* USER NOTE: PARTS OF THE CODE WILL NEED TO BE UPDATED TO REFLECT YOUR DESIRED ANALYSIS\n';


            totalcode += '\n* EXAMPLE LINEAR REGRESSION REQUEST\n\n';



            totalcode += '* Recode missing values for Stata\n';
            totalcode += 'recode educa (-9 / -7=.)\n';
            totalcode += 'recode hhinc (-9 / -7=.)\n';
            totalcode += 'recode generalhealth (-9 / -5=.)\n';


            totalcode += '\n* Define reference group for categorical variables for svy: regress\n';
            totalcode += '\nchar educa[omit] 1\n';
            totalcode += 'char hhinc[omit] 1\n';
            totalcode += '\n* Multivariable linear regression of education and household income on generalhealth\n';
            totalcode += '\nsvy: regress generalhealth i.educa i.hhinc\n';


            totalcode += '\n* Joint test for significance of all coefficients\n';



            totalcode += 'test 2.educa 3.educa 4.educa 2.hhinc 3.hhinc 4.hhinc 5.hhinc _cons, nosvyadjust\n';
            totalcode += 'test 2.educa 3.educa 4.educa 2.hhinc 3.hhinc 4.hhinc 5.hhinc, nosvyadjust\n';
            totalcode += 'test 2.educa 3.educa 4.educa, nosvyadjust\n';
            totalcode += 'test 2.hhinc 3.hhinc 4.hhinc 5.hhinc, nosvyadjust\n';
        }





        // **************************************************************************
        // ********************************analyses boxes ****************************
        // **************************************************************************









        $("textarea#TXT_Results").val(totalcode);

        if (TotalCountOfBoxesSelected < 2) {
            $("textarea#TXT_Results").val('Select at least 2 or more checkboxes');
        }
    }



});



function setTextperCheckboxMIDDLE_SAS(varOne, libraryvariable, countervar) {
    var tempstring = 'data ' + varOne + ';\n';
    tempstring += '    set library.' + libraryvariable + ';\n';

    //console.log('varOne=' + varOne);
    //console.log('libraryvariable=' + libraryvariable);
    //console.log('countervar=' + countervar);


    if (varOne == 'tempHINTS5CYCLE3') {


        if ($('#RD_Paper').is(':checked')) {
            //paper
            tempstring += '    /* Subsets HINTS 5 Cycle 3 dataset to treatment group selected */\n';
            tempstring += '    where treatment_H5C3 = 1;\n';
        }

        if ($('#RD_Web').is(':checked')) {
            //web
            tempstring += '    /* Subsets HINTS 5 Cycle 3 dataset to treatment group selected */\n';
            tempstring += '    where treatment_H5C3 = 2;\n';
        }

        if ($('#RD_Bonus').is(':checked')) {
            //bonus
            tempstring += '    /* Subsets HINTS 5 Cycle 3 dataset to treatment group selected */\n';
            tempstring += '    where treatment_H5C3 = 3;\n';
        }


    }



    tempstring += '    survey=' + countervar + ';\n';
    tempstring += '    format survey survey.;\n';


    if ((varOne == 'tempHINTS6') || (varOne == 'tempHINTS7')) {
        tempstring += '\nlength nHHID 8.;\n';
        tempstring += '    nHHID=strip(HHID);\n';
        tempstring += '    drop HHID;\n';
        tempstring += '    rename nHHID=HHID;\n';
    }


    tempstring += 'run;\n\n'

    return tempstring;
}

function setTextperCheckboxArrayList_SAS(varOne, varTwo) {
    var tempstring = ''

    if (varOne == 'hints53wgts') {


        if ($('#RD_All').is(':checked')) {
            tempstring = '    array ' + varOne + '[50] tg_all_finwt1-tg_all_finwt50;\n';
        }

        if ($('#RD_Paper').is(':checked')) {
            tempstring = '    array ' + varOne + '[50] tg1_finwt1-tg1_finwt50;\n';
        }

        if ($('#RD_Web').is(':checked')) {
            tempstring = '    array ' + varOne + '[50] tg2_finwt1-tg2_finwt50;\n';
        }

        if ($('#RD_Bonus').is(':checked')) {
            tempstring = '    array ' + varOne + '[50] tg3_finwt1-tg3_finwt50;\n';
        }

    }
    else {
        tempstring = '    array ' + varOne + '[50] ' + varTwo + ';\n';

    }
    //tempstring += 'run;\n\n'


    return tempstring;
}

function GetWeight_SAS(LoopCount) {

    if (LoopCount == 1) {
        return '[i]';
    }
    else {
        return ' [' + (50 * (LoopCount - 1)) + ' + i]';
    }


}



function setTextperCheckboxMIDDLE_STATA(varOne, libraryvariable, countervar) {

    setTextperCheckboxMIDDLE_STATA_LoopYouAreOn += 1; 

    //console.log('main loopvarOne =' + varOne);
    //console.log('main loop setTextperCheckboxMIDDLE_STATA_LoopYouAreOn =' + setTextperCheckboxMIDDLE_STATA_LoopYouAreOn);
    //console.log('main loopcountervar =' + countervar);

    ////////var tempstring = 'data ' + varOne + ';\n';
    var tempstring = 'use "REPLACE-WITH-YOUR-PATH-HERE\\' + libraryvariable + '.dta", clear \n\n';

    /************************************************************************************************************
    *  Update By: De-Shunda Jones                                                                               *
    *  Purpose: Update add "rename _all, lower" will convert all variables in dataset to lowercase              *
    *  Affected Lines: 1059 - 1064 added                                                                          *
    *  Date: 11/22/2023                                                                                         *
    *  Ammended: 10/23/2025 to include HINTS 7 by DMJ                                                           *
    ************************************************************************************************************/

    if ((varOne == 'tempHINTS5CYCLE4') || (varOne == 'tempHINTS6') || (varOne == 'tempHINTS7')) {

        tempstring += '* RENAMES ALL VARIABLES TO LOWERCASE FOR MERGING WITH PREVIOUS CYCLES THAT CONTAIN DIFFERENT TEXT CASE FORMATS \n\n';
        tempstring += 'rename _all, lower \n\n';

    }
    else {}

    //alert(varOne);


    //////////////////////////////////
    if (varOne == 'tempHINTS5CYCLE3') {




        tempstring += '* rename existing nwgt variables for HINTS 5 Cycle 3\n';
        tempstring += 'forvalues n1 = 0 / 150 {\n';
        tempstring += '     ren nwgt`n1\' h5c3_nwgt`n1\'\n';
        tempstring += ' }\n';


        if ($('#RD_All').is(':checked')) {
            tempstring += 'gen nwgt0 = tg_all_finwt0\n\n';
        }
        if ($('#RD_Paper').is(':checked')) {
            tempstring += 'gen nwgt0 = tg1_finwt0\n\n';
        }
        if ($('#RD_Web').is(':checked')) {
            tempstring += 'gen nwgt0 = tg2_finwt0\n\n';
        }
        if ($('#RD_Bonus').is(':checked')) {
            tempstring += 'gen nwgt0 = tg3_finwt0\n\n';
        }


    }
    /************************************************************************************************************
    *  Update By: De-Shunda Jones                                                                               *
    *  Purpose: Update "Person_fintwt()" variable from uppercase to lowercase for HINTS 5 CYCLE 4 and HINTS 6   *
    *  Affected Lines: 1026 - 1036 Commented out; 1037 added                                                    *
    *  Date: 11/22/2023                                                                                         *
    ************************************************************************************************************/

   /*else {

        if ((varOne == 'tempHINTS5CYCLE4') || (varOne == 'tempHINTS6')) {
            tempstring += 'gen nwgt0 = PERSON_FINWT0\n\n';

        }
        else {
            tempstring += 'gen nwgt0 = person_finwt0\n\n';
        }

    }*/
    else { tempstring += 'gen nwgt0 = person_finwt0\n\n'; }

    ////////////////////////////







    tempstring += 'forvalues n1 = 1 / 50 {\n';


    var countby50 = 0;


    innerloopcounter = 1;
    while (innerloopcounter < countervar) {
        //console.log('innerloopcounter-' + innerloopcounter);
        countby50 = countby50 + 50;

        tempstring += '         local x' + innerloopcounter + '=`n1\' + ' + countby50 + '\n';
        innerloopcounter++;
    }



    //if (varOne == 'tempHINTS5CYCLE3') {
    //    if (countervar = 1) {
    //        tempstring += '         gen nwgt`n1\' =tg_all_finwt`n1\'\n';
    //    }
    //    else {
    //        tempstring += '         gen nwgt`n1\' =tg_all_finwt0\n';
    //    }
    //}
    //else {
    //    if (countervar = 1) {
    //        tempstring += '         gen nwgt`n1\' = person_finwt`n1\'\n';
    //    }
    //    else {
    //        tempstring += '         gen nwgt`n1\' = person_finwt0\n';
    //    }
    //}

    if (varOne == 'tempHINTS5CYCLE3') {

        if (setTextperCheckboxMIDDLE_STATA_LoopYouAreOn == 1) {
            if ($('#RD_All').is(':checked')) {
                tempstring += '         gen nwgt`n1\' =tg_all_finwt`n1\'\n';
            }
            if ($('#RD_Paper').is(':checked')) {
                tempstring += '         gen nwgt`n1\' =tg1_finwt`n1\'\n';
            }
            if ($('#RD_Web').is(':checked')) {
                tempstring += '         gen nwgt`n1\' =tg2_finwt`n1\'\n';
            }
            if ($('#RD_Bonus').is(':checked')) {
                tempstring += '         gen nwgt`n1\' =tg3_finwt`n1\'\n';
            }

        }
        else {
            if ($('#RD_All').is(':checked')) {
                tempstring += '         gen nwgt`n1\' =tg_all_finwt0\n';
            }
            if ($('#RD_Paper').is(':checked')) {
                tempstring += '         gen nwgt`n1\' =tg1_finwt0\n';
            }
            if ($('#RD_Web').is(':checked')) {
                tempstring += '         gen nwgt`n1\' =tg2_finwt0\n';
            }
            if ($('#RD_Bonus').is(':checked')) {
                tempstring += '         gen nwgt`n1\' =tg3_finwt0\n';
            }

        }
    }
    else {
        /************************************************************************************************************
        *  Update By: De-Shunda Jones                                                                               *
        *  Purpose: Update "Person_fintwt()" variable from uppercase to lowercase for HINTS 5 CYCLE 4 and HINTS 6   *
        *  Affected Lines: 1122 - 1140 Commented out; 1142 - 1148 added                                             *
        *  Date: 11/22/2023                                                                                         *
        ************************************************************************************************************/

        /*if ((varOne == 'tempHINTS5CYCLE4') || (varOne == 'tempHINTS6')) {
            if (setTextperCheckboxMIDDLE_STATA_LoopYouAreOn == 1) {
                tempstring += '         gen nwgt`n1\' =PERSON_FINWT`n1\'\n';
            }
            else {
                tempstring += '         gen nwgt`n1\' =PERSON_FINWT0\n';

            }

        }
        else {
                if (setTextperCheckboxMIDDLE_STATA_LoopYouAreOn == 1) {
                    tempstring += '         gen nwgt`n1\' = person_finwt`n1\'\n';
                }
                else {
                    tempstring += '         gen nwgt`n1\' = person_finwt0\n';

                }
        }*/

        if (setTextperCheckboxMIDDLE_STATA_LoopYouAreOn == 1) {
            tempstring += '         gen nwgt`n1\' = person_finwt`n1\'\n';
        }
        else {
            tempstring += '         gen nwgt`n1\' = person_finwt0\n';

        }



    }


    innerloopcounter = 1;
    while (innerloopcounter < countervar) {



        if (varOne == 'tempHINTS5CYCLE3') {
            if ($('#RD_All').is(':checked')) {
                tempstring += '         gen nwgt`x' + innerloopcounter + '\' = tg_all_finwt';
            }
            if ($('#RD_Paper').is(':checked')) {
                tempstring += '         gen nwgt`x' + innerloopcounter + '\' = tg1_finwt';
            }
            if ($('#RD_Web').is(':checked')) {
                tempstring += '         gen nwgt`x' + innerloopcounter + '\' = tg2_finwt';
            }
            if ($('#RD_Bonus').is(':checked')) {
                tempstring += '         gen nwgt`x' + innerloopcounter + '\' = tg3_finwt';
            }
        }
        /************************************************************************************************************
        *  Update By: De-Shunda Jones                                                                               *
        *  Purpose: Update "Person_fintwt()" variable from uppercase to lowercase for HINTS 5 CYCLE 4 and HINTS 6   *
        *  Affected Lines: 1181 - 1191 Commented out; 1193 added                                                    *
        *  Date: 11/22/2023                                                                                         *
        ************************************************************************************************************/

       /*else {


            if ((varOne == 'tempHINTS5CYCLE4') || (varOne == 'tempHINTS6')) {
                tempstring += '         gen nwgt`x' + innerloopcounter + '\' = PERSON_FINWT';

            }
            else {
                tempstring += '         gen nwgt`x' + innerloopcounter + '\' = person_finwt';
            }
        }*/

        else {tempstring += '         gen nwgt`x' + innerloopcounter + '\' = person_finwt';}



        if (innerloopcounter+1 == setTextperCheckboxMIDDLE_STATA_LoopYouAreOn) {

            tempstring += '`n1\'\n';
        }
        else {
            tempstring += '0\n';
        }
        innerloopcounter++;
    }

    tempstring += '}\n';



    if (varOne == 'tempHINTS5CYCLE3') {
        if ($('#RD_Paper').is(':checked')) {
            tempstring += '\nkeep if treatment_h5c3==1\n\n';
        }
        if ($('#RD_Web').is(':checked')) {
            tempstring += '\nkeep if treatment_h5c3==2\n\n';
        }
        if ($('#RD_Bonus').is(':checked')) {
            tempstring += '\nkeep if treatment_h5c3==3\n\n';
        }
    }



    tempstring += 'save "REPLACE-WITH-YOUR-TEMP-FOLDER-PATH-HERE\\' + libraryvariable + '.dta", replace\n';


    return tempstring + '\n';
}


