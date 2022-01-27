/**
* @file expert-system-ventilator-artificial.pl
* @authors: Abdelkarim JAJA
*           EL Mehdi Atri
*.@date 24 January 2022
*
*/
status:-
            /*========================= Begin Declaration les contants de chaque metrique ====== =========================*/
               FRmin is 15, /*FRmin: Frequence Resperatoire minimale*/
               FRmax is 35, /*FRmax: Frequence Resperatoire maximale*/
               FRhaut is 30,
               CO2int is 20, /*CO2int: CO2 expiré intermedaire */

               /*Entrez le poids de patient*/
               write('Veuillez entrer le poids du patient: '),
               nl,
               read(POIDS),
               nl,

               (
                   (POIDS < 55) -> Vtmin is 250; /*Vtmin: le volume courant  */
                                   Vtmin is 300
               ),

               /*Connaitre l'existance des symptoms chez patient*/
               write('Veuillez preciser les symptoms du patient: '),
               nl,
               read(Symptom),
               (
                   (Symptom == "BPCO") -> CO2max is 65 ;
                                          CO2max is 55
               ),

            /*========================= End: Declaration les contants de chaque metrique =================================*/

            /*========================= Begin: Saisir les differentes metriques(FR, CO2, Vt) =============================*/

               write('Entrez la frequence respiratoire: '),
               nl,
               read(FR),
               nl,
               write('Entrez la pression en fin d\'expiration du CO2'),
               nl,
               read(CO2),
               nl,
               write('Entrez le volume courant: '),
               nl,
               read(Vt),
               nl,

          /*========================= End: Saisir les differentes metriques(FR, CO2, Vt) =============================*/

          /*========================= Begin: Evaluation de l’état du patient  =======================================*/
          write('Le statut respiratoire du patient est '),
               (

               ((FR >= FRmin, FR < FRhaut), CO2 < CO2max, Vt >= Vtmin)
                 -> write('ventilation normal');

               (FR >= FRmin, CO2 > CO2max,Vt < Vtmin)
                 -> write(' ventilation insffisante');

               ((FR >= FRhaut, FR < FRmax), Vt >= Vtmin, CO2 >= CO2int)
                 ->  write('Tachypnee');

               (FR >= FRmax, Vt >= Vtmin, CO2 >= CO2int)
                 ->  write('Tachypnee severe');

               (FR < FRmin, CO2 >= CO2max)
                 ->  write('Hyperventilation');

               (FR < FRmin,CO2 < CO2max)
                 ->  write('Hypervantilation*');

               (FR >= FRhaut, Vt >= Vtmin, CO2 < CO2int)
                 ->  write('Hyperventilation inexpliquee');

                    /*En cas d'echeance toutes les possibilites ci-dessus, l'utilisateur doit rentrer encore les metriques*/
                     write('Les metriques que vous entrez ne correspondent aucune, Veuillez reessayer encore fois')

               ).
          /*========================= End: Evaluation de l’état du patient  =======================================*/







