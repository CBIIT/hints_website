
var selectedCycles = [];

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
        GenerateThecode();

    });

    $('input[type=radio]').change(function () {
        GenerateThecode();

    });


    function GenerateThecode() {

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
                        totalcode += setTextperCheckboxMIDDLE('tempHINTS4CYCLE3', 'hints4_cycle3_public', counterOne);

                        selectedCycles.push('hints43wgts');
                        break;
                        ;
                    case 'HINTS 4 CYCLE 4':
                        totalcode += setTextperCheckboxMIDDLE('tempHINTS4CYCLE4', 'hints4_cycle4_public', counterOne);
                        selectedCycles.push('hints44wgts');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 1':
                        totalcode += setTextperCheckboxMIDDLE('tempHINTS5CYCLE1', 'hints5_cycle1_public', counterOne);
                        selectedCycles.push('hints51wgts');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 2':
                        totalcode += setTextperCheckboxMIDDLE('tempHINTS5CYCLE2', 'hints5_cycle2_public', counterOne);
                        selectedCycles.push('hints52wgts');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 3':
                        totalcode += setTextperCheckboxMIDDLE('tempHINTS5CYCLE3', 'hints5_cycle3_public', counterOne);
                        selectedCycles.push('hints53wgts');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 4':
                        totalcode += setTextperCheckboxMIDDLE('tempHINTS5CYCLE4', 'hints5_cycle4_public', counterOne);
                        selectedCycles.push('hints54wgts');
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
                        totalcode += setTextperCheckboxArrayList('hints43wgts', 'person_finwt1-person_finwt50');
                        break;
                        ;
                    case 'HINTS 4 CYCLE 4':
                        totalcode += setTextperCheckboxArrayList('hints44wgts', 'person_finwt1-person_finwt50');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 1':
                        totalcode += setTextperCheckboxArrayList('hints51wgts', 'person_finwt1-person_finwt50');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 2':
                        totalcode += setTextperCheckboxArrayList('hints52wgts', 'person_finwt1-person_finwt50');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 3':
                        totalcode += setTextperCheckboxArrayList('hints53wgts', 'TG_all_finwt1-TG_all_finwt50');
                        break;
                        ;
                    case 'HINTS 5 CYCLE 4':
                        totalcode += setTextperCheckboxArrayList('hints54wgts', 'person_finwt1-person_finwt50');
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
                        totalcode += '         nwgt0=TG_all_FINWT0;\n';
                    }

                    if ($('#RD_Paper').is(':checked')) {
                        totalcode += '         nwgt0=TG1_FINWT0;\n';
                    }

                    if ($('#RD_Web').is(':checked')) {
                        totalcode += '         nwgt0=TG2_FINWT0;\n';
                    }

                    if ($('#RD_Bonus').is(':checked')) {
                        totalcode += '         nwgt0=TG3_FINWT0;\n';
                    }


                    while (inneri <= TotalCountOfBoxesSelected) {

                        //totalcode += 'inneri loop = ' + inneri + ';\n';
                        if (inneri == 1) {
                            totalcode += '         newWghts' + GetWeight(inneri) + '= ' + selectedCycles[0] + '[i];\n';
                        }
                        else {
                         




                            if ($('#RD_All').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight(inneri) + '= TG_all_FINWT0;\n';
                            }

                            if ($('#RD_Paper').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight(inneri) + '= TG1_FINWT0;\n';
                            }

                            if ($('#RD_Web').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight(inneri) + '= TG2_FINWT0;\n';
                            }

                            if ($('#RD_Bonus').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight(inneri) + '= TG3_FINWT0;\n';
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
                            totalcode += '         newWghts' + GetWeight(inneri) + '= ' + selectedCycles[0] + '[i];\n';
                        }
                        else {
                            totalcode += '         newWghts' + GetWeight(inneri) + '= person_finwt0;\n';

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
                        totalcode += '         nwgt0=TG_all_FINWT0;\n';
                    }

                    if ($('#RD_Paper').is(':checked')) {
                        totalcode += '         nwgt0=TG1_FINWT0;\n';
                    }

                    if ($('#RD_Web').is(':checked')) {
                        totalcode += '         nwgt0=TG2_FINWT0;\n';
                    }

                    if ($('#RD_Bonus').is(':checked')) {
                        totalcode += '         nwgt0=TG3_FINWT0;\n';
                    }



                    while (inneri <= TotalCountOfBoxesSelected) {
                        //totalcode += 'inneri loop = ' + inneri + ';\n';
                        if (inneri == i) {
                            totalcode += '         newWghts' + GetWeight(inneri) + '= ' + selectedCycles[inneri - 1] + '[i];\n';
                        }
                        else {

                            if ($('#RD_All').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight(inneri) + '= TG_all_FINWT0;\n';
                            }

                            if ($('#RD_Paper').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight(inneri) + '= TG1_FINWT0;\n';
                            }

                            if ($('#RD_Web').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight(inneri) + '= TG2_FINWT0;\n';
                            }

                            if ($('#RD_Bonus').is(':checked')) {
                                totalcode += '         newWghts' + GetWeight(inneri) + '= TG3_FINWT0;\n';
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
                            totalcode += '         newWghts' + GetWeight(inneri) + '= ' + selectedCycles[inneri - 1] + '[i];\n';
                        }
                        else {
                            totalcode += '         newWghts' + GetWeight(inneri) + '= person_finwt0;\n';

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




        //////////totalcode += 'total number of boxes = ' + TotalCountOfBoxesSelected + '\n\n\n';













        /////////////// RWB new entry on 8/24/2021
        /////////////// RWB new entry on 8/24/2021
        /////////////// RWB new entry on 8/24/2021
        /////////////// RWB new entry on 8/24/2021


        if (($("#ck_OptionsFrequencies").is(':checked') == true) || ($("#ck_OptionsLogistic").is(':checked') == true) || ($("#ck_OptionsLinear").is(':checked') == true) ) {

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


        console.log('TotalCountOfBoxesSelecte=' + TotalCountOfBoxesSelected);

        if (TotalCountOfBoxesSelected < 2) {
            $("textarea#TXT_Results").val('Select at least 2 or more checkboxes');
        }

        /// end of the check changed function
    }

    // above this is the code to run

});



function setTextperCheckboxMIDDLE(varOne, libraryvariable, countervar) {
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
    tempstring += 'run;\n\n'

    return tempstring;
}

function setTextperCheckboxArrayList(varOne, varTwo) {
    var tempstring = ''

    if (varOne == 'hints53wgts') {


        if ($('#RD_All').is(':checked')) {
            tempstring = '    array ' + varOne + '[50] TG_all_FINWT1-TG_all_FINWT50;\n';
        }

        if ($('#RD_Paper').is(':checked')) {
            tempstring = '    array ' + varOne + '[50] TG1_FINWT1-TG1_FINWT50;\n';
        }

        if ($('#RD_Web').is(':checked')) {
            tempstring = '    array ' + varOne + '[50] TG2_FINWT1-TG2_FINWT50;\n';
        }

        if ($('#RD_Bonus').is(':checked')) {
            tempstring = '    array ' + varOne + '[50] TG3_FINWT1-TG3_FINWT50;\n';
        }
        
    }
    else {
         tempstring = '    array ' + varOne + '[50] ' + varTwo + ';\n';

    }
    //tempstring += 'run;\n\n'


    return tempstring;
}

function GetWeight(LoopCount) {

    if (LoopCount == 1) {
        return '[i]';
    }
    else {
        return ' [' + (50 * (LoopCount - 1)) + ' + i]';
    }


}





